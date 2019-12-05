--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-05 09:02:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 16 (class 2615 OID 16761)
-- Name: dbeler2; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA dbeler2;


ALTER SCHEMA dbeler2 OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 402 (class 1259 OID 25200)
-- Name: attraction; Type: TABLE; Schema: dbeler2; Owner: datama2mi181
--

CREATE TABLE dbeler2.attraction (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE dbeler2.attraction OWNER TO datama2mi181;

--
-- TOC entry 403 (class 1259 OID 25231)
-- Name: customer; Type: TABLE; Schema: dbeler2; Owner: datama2mi181
--

CREATE TABLE dbeler2.customer (
    id integer NOT NULL,
    lname character varying,
    fname character varying,
    initial character(1),
    age integer,
    address character varying,
    ticket_id integer
);


ALTER TABLE dbeler2.customer OWNER TO datama2mi181;

--
-- TOC entry 337 (class 1259 OID 18461)
-- Name: department; Type: TABLE; Schema: dbeler2; Owner: datama2mi181
--

CREATE TABLE dbeler2.department (
    id integer NOT NULL,
    deptname character varying(45)
);


ALTER TABLE dbeler2.department OWNER TO datama2mi181;

--
-- TOC entry 336 (class 1259 OID 18458)
-- Name: employee; Type: TABLE; Schema: dbeler2; Owner: datama2mi181
--

CREATE TABLE dbeler2.employee (
    id integer NOT NULL,
    lname character varying(45),
    fname character varying(45),
    initial character(1),
    address character varying(45),
    salary integer,
    bday date,
    dept_id integer
);


ALTER TABLE dbeler2.employee OWNER TO datama2mi181;

--
-- TOC entry 415 (class 1259 OID 25516)
-- Name: employee_info; Type: VIEW; Schema: dbeler2; Owner: datama2mi181
--

CREATE VIEW dbeler2.employee_info AS
 SELECT employee.fname,
    employee.initial,
    employee.lname,
    employee.salary,
    employee.dept_id,
    department.deptname
   FROM (dbeler2.employee
     LEFT JOIN dbeler2.department ON ((employee.dept_id = department.id)));


ALTER TABLE dbeler2.employee_info OWNER TO datama2mi181;

--
-- TOC entry 344 (class 1259 OID 22920)
-- Name: ticket; Type: TABLE; Schema: dbeler2; Owner: datama2mi181
--

CREATE TABLE dbeler2.ticket (
    id integer NOT NULL,
    type character varying
);


ALTER TABLE dbeler2.ticket OWNER TO datama2mi181;

--
-- TOC entry 3455 (class 0 OID 25200)
-- Dependencies: 402
-- Data for Name: attraction; Type: TABLE DATA; Schema: dbeler2; Owner: datama2mi181
--

COPY dbeler2.attraction (id, name) FROM stdin;
1	ferris wheel
2	bumper cars
3	water sled
4	carousel
5	star flyer
6	star frisbee
\.


--
-- TOC entry 3456 (class 0 OID 25231)
-- Dependencies: 403
-- Data for Name: customer; Type: TABLE DATA; Schema: dbeler2; Owner: datama2mi181
--

COPY dbeler2.customer (id, lname, fname, initial, age, address, ticket_id) FROM stdin;
1	Mayville	Thomas	P	30	2099 Bailey Drive Danville, IA 52623	1
2	Robinson	Elijah	L	40	1168 Woodridge Lane Memphis, TN 38111	2
3	Gardner	Louis	R	20	1999 Jefferson Street Newport News, VA 23601	3
4	Lapp	Kirsten	K	29	65 Worley Avenue Farmville, VA 23901	4
5	Snow	Terrence	A	34	3417 Hill Croft Farm Road Sacramento, CA 9581	5
6	Everly	Edna	H	50	1927 Jett Lane Hawthorne, CA 90250	6
7	Word	Jimmie	E	45	1355 University Hill Road Bloomington, IL 617	7
8	Wilkies	Vickie	T	32	85 Harvest Lane Speed, MO 65233	8
9	Correa	Patricia	E	29	817 Walnut Hill Drive Cincinnati, OH 45227	9
10	Moyle	Gordon	L	27	4869 Ashwood Drive Sloan, IA 51055	10
\.


--
-- TOC entry 3453 (class 0 OID 18461)
-- Dependencies: 337
-- Data for Name: department; Type: TABLE DATA; Schema: dbeler2; Owner: datama2mi181
--

COPY dbeler2.department (id, deptname) FROM stdin;
1	Accounting
2	Human Resources
3	Logistics
4	Marketing
5	Operations
\.


--
-- TOC entry 3452 (class 0 OID 18458)
-- Dependencies: 336
-- Data for Name: employee; Type: TABLE DATA; Schema: dbeler2; Owner: datama2mi181
--

COPY dbeler2.employee (id, lname, fname, initial, address, salary, bday, dept_id) FROM stdin;
1	Eler	Daniel	B	street1 lot1 city1 state1	45000	1999-09-15	1
2	Dionosio	Yobhel	V	street2 lot2 city2 state2	30000	2000-12-25	1
3	Johnston	Jenny	J	995 Bassell Avenue Benton, AR 720152	30000	1999-10-21	1
4	Cameron	Victoria	G	4939 Cambridge Court Clarksville, AR 72830	25000	1984-12-10	2
5	Gros	Sanda	F	3329 Hanover Street New York, NY 10016	30000	1971-07-19	2
6	Gamble	Mike	M	1192 Burke Street Foxboro, MA 02035	30000	1944-11-06	2
7	Perkins	Mary	J	2759 Creekside Lane Thousand Oaks, CA 91362	30000	1983-12-12	3
8	Underwood	Marlon	L	53 Locust Street Albany, GA 31701	35000	1975-06-13	3
9	Kelly	Lindsay	K	1899 Scheuvront Drive Denver, CO 80202	30000	1994-09-14	4
10	Washington	Loretta	R	3850 Lyon Avenue Marlboro, MA 01752	40000	1985-11-30	5
\.


--
-- TOC entry 3454 (class 0 OID 22920)
-- Dependencies: 344
-- Data for Name: ticket; Type: TABLE DATA; Schema: dbeler2; Owner: datama2mi181
--

COPY dbeler2.ticket (id, type) FROM stdin;
1	Regular
2	Regular
3	Regular
4	Regular
5	Regular
6	VIP
7	VIP
8	VIP
9	VIP
10	VIP
\.


--
-- TOC entry 3303 (class 2606 OID 25320)
-- Name: attraction attraction_pk; Type: CONSTRAINT; Schema: dbeler2; Owner: datama2mi181
--

ALTER TABLE ONLY dbeler2.attraction
    ADD CONSTRAINT attraction_pk PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 25322)
-- Name: customer customer_pk; Type: CONSTRAINT; Schema: dbeler2; Owner: datama2mi181
--

ALTER TABLE ONLY dbeler2.customer
    ADD CONSTRAINT customer_pk PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 25324)
-- Name: customer customer_un; Type: CONSTRAINT; Schema: dbeler2; Owner: datama2mi181
--

ALTER TABLE ONLY dbeler2.customer
    ADD CONSTRAINT customer_un UNIQUE (ticket_id);


--
-- TOC entry 3299 (class 2606 OID 23108)
-- Name: department department_pk; Type: CONSTRAINT; Schema: dbeler2; Owner: datama2mi181
--

ALTER TABLE ONLY dbeler2.department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 23104)
-- Name: employee employee_pk; Type: CONSTRAINT; Schema: dbeler2; Owner: datama2mi181
--

ALTER TABLE ONLY dbeler2.employee
    ADD CONSTRAINT employee_pk PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 25318)
-- Name: ticket ticket_pk; Type: CONSTRAINT; Schema: dbeler2; Owner: datama2mi181
--

ALTER TABLE ONLY dbeler2.ticket
    ADD CONSTRAINT ticket_pk PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 25056)
-- Name: employee employee_fk; Type: FK CONSTRAINT; Schema: dbeler2; Owner: datama2mi181
--

ALTER TABLE ONLY dbeler2.employee
    ADD CONSTRAINT employee_fk FOREIGN KEY (dept_id) REFERENCES dbeler2.department(id);


-- Completed on 2019-12-05 09:02:58

--
-- PostgreSQL database dump complete
--

