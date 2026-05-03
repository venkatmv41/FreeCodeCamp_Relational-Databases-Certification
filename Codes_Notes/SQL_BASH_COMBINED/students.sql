--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (38, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (39, 'Web Programming');
INSERT INTO public.courses VALUES (40, 'Database Systems');
INSERT INTO public.courses VALUES (41, 'Computer Networks');
INSERT INTO public.courses VALUES (42, 'SQL');
INSERT INTO public.courses VALUES (43, 'Machine Learning');
INSERT INTO public.courses VALUES (44, 'Computer Systems');
INSERT INTO public.courses VALUES (45, 'Web Applications');
INSERT INTO public.courses VALUES (46, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (47, 'Python');
INSERT INTO public.courses VALUES (48, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (49, 'Calculus');
INSERT INTO public.courses VALUES (50, 'Game Architecture');
INSERT INTO public.courses VALUES (51, 'Algorithms');
INSERT INTO public.courses VALUES (52, 'UNIX');
INSERT INTO public.courses VALUES (53, 'Server Administration');
INSERT INTO public.courses VALUES (54, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (81, 'Database Administration');
INSERT INTO public.majors VALUES (82, 'Web Development');
INSERT INTO public.majors VALUES (83, 'Data Science');
INSERT INTO public.majors VALUES (84, 'Network Engineering');
INSERT INTO public.majors VALUES (85, 'Computer Programming');
INSERT INTO public.majors VALUES (86, 'Game Design');
INSERT INTO public.majors VALUES (87, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (81, 38);
INSERT INTO public.majors_courses VALUES (82, 39);
INSERT INTO public.majors_courses VALUES (81, 40);
INSERT INTO public.majors_courses VALUES (83, 38);
INSERT INTO public.majors_courses VALUES (84, 41);
INSERT INTO public.majors_courses VALUES (81, 42);
INSERT INTO public.majors_courses VALUES (83, 43);
INSERT INTO public.majors_courses VALUES (84, 44);
INSERT INTO public.majors_courses VALUES (85, 41);
INSERT INTO public.majors_courses VALUES (81, 45);
INSERT INTO public.majors_courses VALUES (86, 46);
INSERT INTO public.majors_courses VALUES (83, 47);
INSERT INTO public.majors_courses VALUES (85, 48);
INSERT INTO public.majors_courses VALUES (87, 44);
INSERT INTO public.majors_courses VALUES (86, 49);
INSERT INTO public.majors_courses VALUES (82, 38);
INSERT INTO public.majors_courses VALUES (83, 49);
INSERT INTO public.majors_courses VALUES (82, 48);
INSERT INTO public.majors_courses VALUES (86, 50);
INSERT INTO public.majors_courses VALUES (87, 41);
INSERT INTO public.majors_courses VALUES (86, 51);
INSERT INTO public.majors_courses VALUES (87, 52);
INSERT INTO public.majors_courses VALUES (87, 53);
INSERT INTO public.majors_courses VALUES (85, 44);
INSERT INTO public.majors_courses VALUES (85, 47);
INSERT INTO public.majors_courses VALUES (84, 54);
INSERT INTO public.majors_courses VALUES (82, 45);
INSERT INTO public.majors_courses VALUES (84, 51);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (16, 'first_name', 'last_name', NULL, NULL);
INSERT INTO public.students VALUES (17, 'Rhea', 'Kellems', NULL, NULL);
INSERT INTO public.students VALUES (18, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (19, 'Kimberly', 'Whitley', NULL, NULL);
INSERT INTO public.students VALUES (20, 'Jimmy', 'Felipe', NULL, NULL);
INSERT INTO public.students VALUES (21, 'Kyle', 'Stimson', NULL, NULL);
INSERT INTO public.students VALUES (22, 'Casares', 'Hijo', NULL, NULL);
INSERT INTO public.students VALUES (23, 'Noe', 'Savage', NULL, NULL);
INSERT INTO public.students VALUES (24, 'Sterling', 'Boss', NULL, NULL);
INSERT INTO public.students VALUES (25, 'Brian', 'Davis', NULL, NULL);
INSERT INTO public.students VALUES (26, 'Kaija', 'Uronen', NULL, NULL);
INSERT INTO public.students VALUES (27, 'Faye', 'Conn', NULL, NULL);
INSERT INTO public.students VALUES (28, 'Efren', 'Reilly', NULL, NULL);
INSERT INTO public.students VALUES (29, 'Danh', 'Nhung', NULL, NULL);
INSERT INTO public.students VALUES (30, 'Maxine', 'Hagenes', NULL, NULL);
INSERT INTO public.students VALUES (31, 'Larry', 'Saunders', NULL, NULL);
INSERT INTO public.students VALUES (32, 'Karl', 'Kuhar', NULL, NULL);
INSERT INTO public.students VALUES (33, 'Lieke', 'Hazenveld', NULL, NULL);
INSERT INTO public.students VALUES (34, 'Obie', 'Hilpert', NULL, NULL);
INSERT INTO public.students VALUES (35, 'Peter', 'Booysen', NULL, NULL);
INSERT INTO public.students VALUES (36, 'Nathan', 'Turner', NULL, NULL);
INSERT INTO public.students VALUES (37, 'Gerald', 'Osiki', NULL, NULL);
INSERT INTO public.students VALUES (38, 'Vanya', 'Hassanah', NULL, NULL);
INSERT INTO public.students VALUES (39, 'Roxelana', 'Florescu', NULL, NULL);
INSERT INTO public.students VALUES (40, 'Helene', 'Parker', NULL, NULL);
INSERT INTO public.students VALUES (41, 'Mariana', 'Russel', NULL, NULL);
INSERT INTO public.students VALUES (42, 'Ajit', 'Dhungel', NULL, NULL);
INSERT INTO public.students VALUES (43, 'Mehdi', 'Vandenberghe', NULL, NULL);
INSERT INTO public.students VALUES (44, 'Dejon', 'Howell', NULL, NULL);
INSERT INTO public.students VALUES (45, 'Aliya', 'Gulgowski', NULL, NULL);
INSERT INTO public.students VALUES (46, 'Ana', 'Tupajic', NULL, NULL);
INSERT INTO public.students VALUES (47, 'Hugo', 'Duran', NULL, NULL);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 54, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 87, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 47, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

