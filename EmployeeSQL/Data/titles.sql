--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-01-04 14:03:54

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
-- TOC entry 201 (class 1259 OID 24621)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    title_id character(5) NOT NULL,
    title character varying(25) NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 2994 (class 0 OID 24621)
-- Dependencies: 201
-- Data for Name: titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.titles (title_id, title) FROM stdin;
s0001	Staff
s0002	Senior Staff
e0001	Assistant Engineer
e0002	Engineer
e0003	Senior Engineer
e0004	Technique Leader
m0001	Manager
\.


--
-- TOC entry 2863 (class 2606 OID 24625)
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);


-- Completed on 2021-01-04 14:03:54

--
-- PostgreSQL database dump complete
--

