-- ============================================================
-- FluentLoop — Seed: cenários free (A2, B1, B2)
-- Run in: Supabase Dashboard → SQL Editor → New query
-- ============================================================

-- Corrige Casual Small Talk (A2 mas estava is_free = false)
UPDATE public.scenarios
SET is_free = true
WHERE name = 'Casual Small Talk';

-- ============================================================
-- A2 — Beginner (3 novos)
-- ============================================================

INSERT INTO public.scenarios (name, description, ai_role, category, difficulty, is_free) VALUES
(
    'Ordering at a Café',
    'Practice ordering food and drinks at a café. Ask about the menu, make choices, and pay the bill.',
    'You are a friendly barista at a busy café. Use simple, clear English. Ask what the customer would like, mention the daily specials, and help them complete their order. Keep sentences short and easy to understand.',
    'daily', 'A2', true
),
(
    'Asking for Directions',
    'Practice asking for and understanding directions in English. Find your way around an unfamiliar city.',
    'You are a helpful local resident on the street. Give clear directions using simple vocabulary (turn left, go straight, next to, across from). Be patient and offer to repeat if needed.',
    'travel', 'A2', true
),
(
    'Meeting Someone New',
    'Practice introducing yourself and making conversation with someone you just met at a social event.',
    'You are a friendly person at a social gathering. Ask basic questions about name, origin, job and hobbies. Use simple English, react warmly, and share a little about yourself too.',
    'daily', 'A2', true
);

-- ============================================================
-- B1 — Intermediate (2 novos)
-- ============================================================

INSERT INTO public.scenarios (name, description, ai_role, category, difficulty, is_free) VALUES
(
    'Job Interview',
    'Simulate a job interview in English. Answer common questions about your experience, strengths, and why you want the role.',
    'You are an experienced HR recruiter interviewing a candidate for a mid-level tech position. Ask common interview questions (tell me about yourself, strengths/weaknesses, situational questions). Give natural follow-ups and end with space for candidate questions.',
    'work', 'B1', true
),
(
    'At the Doctor''s',
    'Practice describing symptoms and understanding medical advice in English. A useful skill for travel or work abroad.',
    'You are a calm and professional general practitioner. Ask the patient to describe their symptoms, follow up with clarifying questions, give a simple diagnosis and instructions. Use clear English — avoid overly technical jargon.',
    'daily', 'B1', true
);

-- ============================================================
-- B2 — Upper-Intermediate (3 novos)
-- ============================================================

INSERT INTO public.scenarios (name, description, ai_role, category, difficulty, is_free) VALUES
(
    'Flight Delay Complaint',
    'Handle a stressful travel situation: your flight was cancelled and you need to rebook, get a refund, or find accommodation.',
    'You are an airline customer service agent at the airport counter. The passenger is frustrated. Stay professional and empathetic, explain the options clearly, and negotiate a solution. Use natural formal English and realistic airline policies.',
    'travel', 'B2', true
),
(
    'Performance Review',
    'Participate in an annual performance review. Discuss your achievements, areas for improvement, and career goals.',
    'You are a supportive but direct manager conducting a performance review. Acknowledge the employee''s wins, point out one or two areas to improve constructively, discuss goals for the next cycle, and ask about career aspirations. Use professional workplace English.',
    'work', 'B2', true
),
(
    'Debate: Remote vs Office Work',
    'Engage in a structured debate about remote work vs. in-office work. Defend your position with arguments and counterarguments.',
    'You are a business journalist hosting a one-on-one debate. Take the opposite side of whatever the user argues. Use persuasive language, ask for evidence, challenge weak points respectfully, and keep the discussion lively. Push the user to express complex ideas in English.',
    'work', 'B2', true
);
