-- ============================================================
-- FluentLoop — Migration v1.0.0
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- ============================================================


-- ============================================================
-- 1. ENUMS
-- ============================================================

CREATE TYPE level_enum          AS ENUM ('A2', 'B1', 'B2');
CREATE TYPE plan_enum           AS ENUM ('free', 'pro');
CREATE TYPE session_type_enum   AS ENUM ('free_chat', 'roleplay');
CREATE TYPE pillar_enum         AS ENUM ('writing', 'speaking', 'comprehension');
CREATE TYPE message_role_enum   AS ENUM ('user', 'assistant');
CREATE TYPE error_type_enum     AS ENUM ('grammar', 'vocabulary', 'pronunciation');
CREATE TYPE scenario_cat_enum   AS ENUM ('work', 'travel', 'daily');
CREATE TYPE sub_plan_enum       AS ENUM ('monthly', 'annual');
CREATE TYPE sub_status_enum     AS ENUM ('active', 'canceled', 'past_due', 'trialing');
CREATE TYPE level_reason_enum   AS ENUM ('auto', 'manual');


-- ============================================================
-- 2. TABLES
-- ============================================================

-- users (extends auth.users)
CREATE TABLE public.users (
    id                      uuid        PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email                   text        NOT NULL,
    name                    text        NOT NULL,
    avatar_url              text,
    level                   level_enum  NOT NULL DEFAULT 'B1',
    plan                    plan_enum   NOT NULL DEFAULT 'free',
    daily_interactions_used int         NOT NULL DEFAULT 0,
    daily_reset_at          timestamptz NOT NULL DEFAULT now(),
    created_at              timestamptz NOT NULL DEFAULT now(),
    updated_at              timestamptz NOT NULL DEFAULT now()
);

-- subscriptions
CREATE TABLE public.subscriptions (
    id                      uuid            PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id                 uuid            NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    stripe_customer_id      text            NOT NULL,
    stripe_subscription_id  text            NOT NULL UNIQUE,
    plan_type               sub_plan_enum   NOT NULL,
    status                  sub_status_enum NOT NULL,
    current_period_start    timestamptz     NOT NULL,
    current_period_end      timestamptz     NOT NULL,
    created_at              timestamptz     NOT NULL DEFAULT now()
);

-- scenarios
CREATE TABLE public.scenarios (
    id          uuid             PRIMARY KEY DEFAULT gen_random_uuid(),
    name        text             NOT NULL,
    description text             NOT NULL,
    ai_role     text             NOT NULL,
    category    scenario_cat_enum NOT NULL,
    difficulty  level_enum       NOT NULL,
    is_free     boolean          NOT NULL DEFAULT false,
    is_active   boolean          NOT NULL DEFAULT true,
    created_at  timestamptz      NOT NULL DEFAULT now()
);

-- sessions
CREATE TABLE public.sessions (
    id              uuid              PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         uuid              NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    scenario_id     uuid              REFERENCES public.scenarios(id) ON DELETE SET NULL,
    type            session_type_enum NOT NULL,
    pillar          pillar_enum       NOT NULL,
    started_at      timestamptz       NOT NULL DEFAULT now(),
    ended_at        timestamptz,
    total_messages  int               NOT NULL DEFAULT 0,
    error_rate      decimal(5,2),
    created_at      timestamptz       NOT NULL DEFAULT now()
);

-- messages
CREATE TABLE public.messages (
    id          uuid              PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id  uuid              NOT NULL REFERENCES public.sessions(id) ON DELETE CASCADE,
    role        message_role_enum NOT NULL,
    content     text              NOT NULL,
    audio_url   text,
    created_at  timestamptz       NOT NULL DEFAULT now()
);

-- corrections
CREATE TABLE public.corrections (
    id              uuid            PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id      uuid            NOT NULL REFERENCES public.messages(id) ON DELETE CASCADE,
    original_text   text            NOT NULL,
    corrected_text  text            NOT NULL,
    error_type      error_type_enum NOT NULL,
    explanation     text            NOT NULL,
    created_at      timestamptz     NOT NULL DEFAULT now()
);

-- pronunciation_words
CREATE TABLE public.pronunciation_words (
    id              uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    message_id      uuid        NOT NULL REFERENCES public.messages(id) ON DELETE CASCADE,
    word            text        NOT NULL,
    position        int         NOT NULL,
    accuracy_score  decimal(5,2) NOT NULL,
    phoneme_feedback text,
    created_at      timestamptz NOT NULL DEFAULT now()
);

-- user_levels (histórico de evolução)
CREATE TABLE public.user_levels (
    id          uuid            PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     uuid            NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    from_level  level_enum      NOT NULL,
    to_level    level_enum      NOT NULL,
    reason      level_reason_enum NOT NULL,
    changed_at  timestamptz     NOT NULL DEFAULT now()
);


-- ============================================================
-- 3. INDEXES
-- ============================================================

CREATE INDEX idx_sessions_user_date      ON public.sessions (user_id, started_at DESC);
CREATE INDEX idx_messages_session        ON public.messages (session_id, created_at ASC);
CREATE INDEX idx_corrections_message     ON public.corrections (message_id);
CREATE INDEX idx_pron_words_message      ON public.pronunciation_words (message_id, position ASC);
CREATE INDEX idx_user_levels_user_date   ON public.user_levels (user_id, changed_at DESC);
CREATE INDEX idx_subscriptions_user      ON public.subscriptions (user_id);


-- ============================================================
-- 4. TRIGGERS
-- ============================================================

-- 4a. Cria perfil em public.users quando um novo usuário se registra no Supabase Auth
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
BEGIN
    INSERT INTO public.users (id, email, name)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'name', split_part(NEW.email, '@', 1))
    );
    RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- 4b. Registra histórico quando o nível do usuário muda
CREATE OR REPLACE FUNCTION public.handle_level_change()
RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
BEGIN
    IF NEW.level IS DISTINCT FROM OLD.level THEN
        INSERT INTO public.user_levels (user_id, from_level, to_level, reason)
        VALUES (NEW.id, OLD.level, NEW.level, 'auto');
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER on_user_level_changed
    AFTER UPDATE ON public.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_level_change();

-- 4c. Atualiza updated_at automaticamente
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS trigger LANGUAGE plpgsql AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;

CREATE TRIGGER set_users_updated_at
    BEFORE UPDATE ON public.users
    FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


-- ============================================================
-- 5. ROW LEVEL SECURITY (RLS)
-- ============================================================

ALTER TABLE public.users              ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.subscriptions      ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.scenarios          ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.sessions           ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.messages           ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.corrections        ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.pronunciation_words ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_levels        ENABLE ROW LEVEL SECURITY;

-- users: cada usuário vê/edita só o próprio perfil
CREATE POLICY "users: select own"  ON public.users FOR SELECT USING (auth.uid() = id);
CREATE POLICY "users: update own"  ON public.users FOR UPDATE USING (auth.uid() = id);

-- subscriptions: cada usuário vê só a própria assinatura
CREATE POLICY "subs: select own"   ON public.subscriptions FOR SELECT USING (auth.uid() = user_id);

-- scenarios: todos os usuários autenticados podem listar
CREATE POLICY "scenarios: select"  ON public.scenarios FOR SELECT USING (auth.role() = 'authenticated');

-- sessions: cada usuário vê/cria/edita só as próprias
CREATE POLICY "sessions: select own"  ON public.sessions FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "sessions: insert own"  ON public.sessions FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "sessions: update own"  ON public.sessions FOR UPDATE USING (auth.uid() = user_id);

-- messages: acesso via sessão do usuário
CREATE POLICY "messages: select own" ON public.messages FOR SELECT
    USING (EXISTS (SELECT 1 FROM public.sessions s WHERE s.id = session_id AND s.user_id = auth.uid()));
CREATE POLICY "messages: insert own" ON public.messages FOR INSERT
    WITH CHECK (EXISTS (SELECT 1 FROM public.sessions s WHERE s.id = session_id AND s.user_id = auth.uid()));

-- corrections: acesso via mensagem → sessão do usuário
CREATE POLICY "corrections: select own" ON public.corrections FOR SELECT
    USING (EXISTS (
        SELECT 1 FROM public.messages m
        JOIN public.sessions s ON s.id = m.session_id
        WHERE m.id = message_id AND s.user_id = auth.uid()
    ));

-- pronunciation_words: mesma lógica
CREATE POLICY "pron: select own" ON public.pronunciation_words FOR SELECT
    USING (EXISTS (
        SELECT 1 FROM public.messages m
        JOIN public.sessions s ON s.id = m.session_id
        WHERE m.id = message_id AND s.user_id = auth.uid()
    ));

-- user_levels: cada usuário vê só o próprio histórico
CREATE POLICY "levels: select own" ON public.user_levels FOR SELECT USING (auth.uid() = user_id);


-- ============================================================
-- 6. SEED — cenários iniciais
-- ============================================================

INSERT INTO public.scenarios (name, description, ai_role, category, difficulty, is_free) VALUES
(
    'Hotel Check-in',
    'Practice checking into a hotel in English. Ask about your reservation, room type, amenities and local tips.',
    'You are a friendly and professional hotel receptionist at a 4-star hotel. Speak clearly, use polite formal English, and help the guest with their check-in process.',
    'travel', 'B1', true
),
(
    'Daily Standup',
    'Simulate a daily standup meeting in English. Share what you did yesterday, what you will do today, and any blockers.',
    'You are a senior software engineer leading the daily standup. Ask follow-up questions, use typical tech team vocabulary, and keep the pace natural.',
    'work', 'B1', true
),
(
    'Casual Small Talk',
    'Practice light conversation in English — weekend plans, hobbies, weather, movies. Great for building fluency.',
    'You are a friendly coworker making small talk. Keep the conversation relaxed, use natural everyday English, and react genuinely to what the user says.',
    'daily', 'A2', false
);
