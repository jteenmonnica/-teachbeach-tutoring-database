-- TeachBeach: example queries used to test the tutoring database
-- Oracle SQL, run in SQL Developer for VS Code
-- All data is fake test data created for the course project

-- 1. Find tutoring sessions available at specific CSULB centers
SELECT
  s.session_id,
  t.first_name || ' ' || t.last_name AS tutor_name,
  sub.subject_name,
  s.session_date,
  s.session_time,
  s.location
FROM sessions s
JOIN tutors t ON s.tutor_id = t.tutor_id
JOIN subjects sub ON s.subject_id = sub.subject_id
WHERE s.location IN ('LA1-204', 'COB-139', 'VEC-102');

-- 2. Sort and view tutors by session ratings
SELECT
  t.first_name || ' ' || t.last_name AS tutor_name,
  ROUND(AVG(s.rating), 2) AS average_rating
FROM tutors t
JOIN sessions s ON s.tutor_id = t.tutor_id
GROUP BY t.first_name, t.last_name
ORDER BY average_rating DESC;

-- 3. Filter sessions by subject
SELECT
  s.session_id,
  sub.subject_name,
  t.first_name || ' ' || t.last_name AS tutor_name,
  s.session_date,
  s.session_time,
  s.location
FROM sessions s
JOIN tutors t ON s.tutor_id = t.tutor_id
JOIN subjects sub ON s.subject_id = sub.subject_id
WHERE sub.subject_name = 'Information Systems';

-- 4. Sort tutors by experience
SELECT
  first_name || ' ' || last_name AS tutor_name,
  experience_level
FROM tutors
ORDER BY experience_level;

-- 5. Sort and count sessions based on tutors
SELECT
  t.first_name || ' ' || t.last_name AS tutor_name,
  sub.subject_name,
  COUNT(s.session_id) AS total_sessions
FROM tutors t
JOIN sessions s ON t.tutor_id = s.tutor_id
JOIN subjects sub ON s.subject_id = sub.subject_id
GROUP BY t.first_name, t.last_name, sub.subject_name
ORDER BY tutor_name, total_sessions DESC;

-- 6. Find sessions based on a certain date or time
SELECT
  s.session_id,
  sub.subject_name,
  t.first_name || ' ' || t.last_name AS tutor_name,
  s.session_date,
  s.session_time,
  s.location
FROM sessions s
JOIN tutors t ON s.tutor_id = t.tutor_id
JOIN subjects sub ON s.subject_id = sub.subject_id
WHERE s.session_date = TO_DATE('2025-05-05', 'YYYY-MM-DD')
   OR s.session_time = '15:00:00';

-- 7. View all upcoming tutoring sessions
SELECT
  s.session_id,
  sub.subject_name,
  t.first_name || ' ' || t.last_name AS tutor_name,
  s.session_date,
  s.session_time,
  s.location
FROM sessions s
JOIN tutors t ON s.tutor_id = t.tutor_id
JOIN subjects sub ON s.subject_id = sub.subject_id
WHERE s.session_date >= SYSDATE
ORDER BY s.session_date, s.session_time;
