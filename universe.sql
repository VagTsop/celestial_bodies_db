--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: additional_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.additional_table (
    additional_table_id integer NOT NULL,
    name character varying NOT NULL,
    is_active boolean NOT NULL,
    description_length integer,
    is_active_updated boolean
);


ALTER TABLE public.additional_table OWNER TO freecodecamp;

--
-- Name: additional_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.additional_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.additional_table_id_seq OWNER TO freecodecamp;

--
-- Name: additional_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.additional_table_id_seq OWNED BY public.additional_table.additional_table_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    size integer NOT NULL,
    is_active boolean,
    color character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    surface_area numeric,
    is_inhabited boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    has_atmosphere boolean NOT NULL,
    star_id integer,
    moon_count integer,
    surface_area numeric,
    is_inhabited boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    temperature integer NOT NULL,
    mass numeric NOT NULL,
    galaxy_id integer,
    new_column text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: additional_table additional_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table ALTER COLUMN additional_table_id SET DEFAULT nextval('public.additional_table_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: additional_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.additional_table VALUES (1, 'Entry1', true, 120, false);
INSERT INTO public.additional_table VALUES (2, 'Entry2', false, 80, true);
INSERT INTO public.additional_table VALUES (3, 'Entry3', true, 150, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 800000, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 500000, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 600000, true, 'Yellow');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 1200000, true, 'Orange');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 400000, false, 'Purple');
INSERT INTO public.galaxy VALUES (7, 'Andromeda II', 250000, true, 'Blue');
INSERT INTO public.galaxy VALUES (8, 'Whirlpool Galaxy', 350000, false, 'Green');
INSERT INTO public.galaxy VALUES (9, 'Pinwheel Galaxy', 450000, true, 'Red');
INSERT INTO public.galaxy VALUES (10, 'Cigar Galaxy', 300000, false, 'Yellow');
INSERT INTO public.galaxy VALUES (11, 'Galaxy', 280000, true, 'Violet');
INSERT INTO public.galaxy VALUES (12, 'Sculptor Galaxy', 200000, true, 'Cyan');
INSERT INTO public.galaxy VALUES (13, 'Black Eye Galaxy', 320000, false, 'Pink');
INSERT INTO public.galaxy VALUES (14, 'Sunflower Galaxy', 380000, true, 'Magenta');
INSERT INTO public.galaxy VALUES (15, 'Messier 83', 270000, true, 'Teal');
INSERT INTO public.galaxy VALUES (16, 'Hoag Object', 240000, false, 'Gold');
INSERT INTO public.galaxy VALUES (21, 'Whirlpool Galaxy', 360000, false, 'Blue');
INSERT INTO public.galaxy VALUES (22, 'Sculptor Galaxy', 200001, true, 'Green');
INSERT INTO public.galaxy VALUES (24, 'Black Eye Galaxy', 323000, false, 'Red');
INSERT INTO public.galaxy VALUES (26, 'Andromeda II', 2502000, true, 'Blue');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Titan', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Dimos', 8, 37900000, false);
INSERT INTO public.moon VALUES (5, 'aaa', 9, 37900000, false);
INSERT INTO public.moon VALUES (6, 'bbb', 10, 37900000, false);
INSERT INTO public.moon VALUES (7, 'ccc', 11, 37900000, false);
INSERT INTO public.moon VALUES (8, 'ddd', 12, 37900000, false);
INSERT INTO public.moon VALUES (9, 'eee', 13, 37900000, false);
INSERT INTO public.moon VALUES (10, 'ddd', 14, 37900000, false);
INSERT INTO public.moon VALUES (11, 'ggg', 15, 37900000, false);
INSERT INTO public.moon VALUES (12, 'bbb', 16, 37900000, false);
INSERT INTO public.moon VALUES (13, 'aa', 17, 37900000, false);
INSERT INTO public.moon VALUES (14, 'asds', 19, 37900000, false);
INSERT INTO public.moon VALUES (15, 'sccx', 20, 37900000, false);
INSERT INTO public.moon VALUES (16, 'asdasda', 21, 37900000, false);
INSERT INTO public.moon VALUES (17, 'ssd', 22, 37900000, false);
INSERT INTO public.moon VALUES (18, 'xss', 23, 37900000, false);
INSERT INTO public.moon VALUES (19, 'xsaSs', 24, 37900000, false);
INSERT INTO public.moon VALUES (20, 'xss', 26, 37900000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', false, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', true, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Mercury', false, 5, 0, 74800000, false);
INSERT INTO public.planet VALUES (9, 'Uranus', true, 6, 27, 8083800000, false);
INSERT INTO public.planet VALUES (10, 'Saturn', true, 7, 82, 42705600000, false);
INSERT INTO public.planet VALUES (11, 'Pluto', false, 8, 5, 186000, false);
INSERT INTO public.planet VALUES (12, 'Neptune', false, 9, 5, 186000, false);
INSERT INTO public.planet VALUES (13, 'Venus', false, 10, 5, 186000, false);
INSERT INTO public.planet VALUES (14, 'Jupiter', false, 11, 5, 186000, false);
INSERT INTO public.planet VALUES (15, 'Io', false, 12, 5, 186000, false);
INSERT INTO public.planet VALUES (16, 'Test1', false, 13, 5, 186000, false);
INSERT INTO public.planet VALUES (17, 'Test2', false, 14, 5, 186000, false);
INSERT INTO public.planet VALUES (19, 'Test2', false, 15, 5, 5186000000, false);
INSERT INTO public.planet VALUES (20, 'Test3', false, 16, 5, 5186000000, false);
INSERT INTO public.planet VALUES (21, 'Test4', false, 18, 5, 5186000000, false);
INSERT INTO public.planet VALUES (22, 'Test5', false, 19, 0, 74800000, false);
INSERT INTO public.planet VALUES (23, 'Test6', false, 20, 0, 74800000, false);
INSERT INTO public.planet VALUES (24, 'Test7', false, 21, 0, 74800000, false);
INSERT INTO public.planet VALUES (26, 'Iso', true, 22, 0, 5000000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 5790, 2180000000000000000000000000000, 1, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 3500, 20000000000000000000000000000000, 2, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 3042, 120000000000000000000000000000, 3, NULL);
INSERT INTO public.star VALUES (5, 'Sirius', 9940, 2020000000000000000000000000000, 4, 'Sirius Value');
INSERT INTO public.star VALUES (6, 'Vega', 9602, 2450000000000000000000000000000, 5, 'Vega Value');
INSERT INTO public.star VALUES (7, 'Antares', 3583, 15000000000000000000000000000000, 6, 'Antares Value');
INSERT INTO public.star VALUES (8, 'Sun', 5778, 1989000000000000000000000000000, 7, 'Sun Value 1');
INSERT INTO public.star VALUES (9, 'Alpha Centauri B', 5260, 252300000000000000000000000000, 8, 'Alpha Centauri B Value');
INSERT INTO public.star VALUES (10, 'Barnard Star', 3134, 263000000000000000000000000000, 9, 'Barnard Star Value');
INSERT INTO public.star VALUES (11, 'Wolf 359', 2800, 240000000000000000000000000000, 10, 'Wolf 359 Value');
INSERT INTO public.star VALUES (12, 'Sirius B', 25000, 1019000000000000000000000000000, 11, 'Sirius B Value');
INSERT INTO public.star VALUES (13, 'Procyon B', 6560, 150000000000000000000000000000, 12, 'Procyon B Value');
INSERT INTO public.star VALUES (14, 'Rigel', 12104, 23000000000000000000000000000000, 13, 'Rigel Value');
INSERT INTO public.star VALUES (15, 'Canopus', 7400, 15000000000000000000000000000000, 14, 'Canopus Value');
INSERT INTO public.star VALUES (16, 'VY Canis Majoris', 3490, 250000000000000000000000000000000, 15, 'VY Canis Majoris Value');
INSERT INTO public.star VALUES (18, 'Betelgeuse B', 3660, 1800000000000000000000000000000, 16, 'Betelgeuse B Value');
INSERT INTO public.star VALUES (19, 'Sun', 5778, 1989000000000000000000000000000, 21, 'Sun Value 1');
INSERT INTO public.star VALUES (20, 'Barnard Star', 3134, 263000000000000000000000000000, 24, 'Barnard Star Value');
INSERT INTO public.star VALUES (21, 'Bartar', 3134, 263000000000000000000000000000, 22, 'Barnaralue');
INSERT INTO public.star VALUES (22, 'Sun', 5778, 1989000000000000000000000000000, 26, 'Sun Value 1');


--
-- Name: additional_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.additional_table_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 26, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 26, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 22, true);


--
-- Name: additional_table additional_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT additional_table_pkey PRIMARY KEY (additional_table_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: additional_table unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: galaxy unique_size; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_size UNIQUE (size);


--
-- Name: planet unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

