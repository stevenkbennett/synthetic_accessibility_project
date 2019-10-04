--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4 (Debian 11.4-1.pgdg90+1)
-- Dumped by pg_dump version 11.4 (Debian 11.4-1.pgdg90+1)

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

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO example;

--
-- Name: molecules; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.molecules (
    id integer NOT NULL,
    mol character varying(200)
);


ALTER TABLE public.molecules OWNER TO example;

--
-- Name: molecules_id_seq; Type: SEQUENCE; Schema: public; Owner: example
--

CREATE SEQUENCE public.molecules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.molecules_id_seq OWNER TO example;

--
-- Name: molecules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example
--

ALTER SEQUENCE public.molecules_id_seq OWNED BY public.molecules.id;


--
-- Name: scores; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.scores (
    id integer NOT NULL,
    sco integer,
    user_id integer,
    mol_id integer
);


ALTER TABLE public.scores OWNER TO example;

--
-- Name: scores_id_seq; Type: SEQUENCE; Schema: public; Owner: example
--

CREATE SEQUENCE public.scores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scores_id_seq OWNER TO example;

--
-- Name: scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example
--

ALTER SEQUENCE public.scores_id_seq OWNED BY public.scores.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(64),
    email character varying(120),
    password_hash character varying(128),
    experience integer,
    last_seen timestamp without time zone
);


ALTER TABLE public.users OWNER TO example;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: example
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO example;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: molecules id; Type: DEFAULT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.molecules ALTER COLUMN id SET DEFAULT nextval('public.molecules_id_seq'::regclass);


--
-- Name: scores id; Type: DEFAULT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.scores ALTER COLUMN id SET DEFAULT nextval('public.scores_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.alembic_version (version_num) FROM stdin;
\.


--
-- Data for Name: molecules; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.molecules (id, mol) FROM stdin;
1	N#C/C1=C/c2cc(Cl)cc(c2)/C(C#N)=C\\c2cc(Cl)cc(c2)/C(C#N)=C\\c2cc(Cl)cc(c2)/C(C#N)=C\\c2cc(Cl)cc(c2)/C(C#N)=C\\c2cc(Cl)cc1c2
2	OCc1ccc(N(c2ccc(CO)cc2)N(c2ccc(CO)cc2)c2ccc(CO)cc2)cc1
3	O=C1C(c2ccc(CO)cc2)=C(c2ccc(CO)cc2)C(c2ccc(CO)cc2)=C1c1ccc(CO)cc1
4	OCc1ccc(C(=C(c2ccc(CO)cc2)c2ccc(CO)cc2)c2ccc(CO)cc2)cc1
5	OCc1ccc(-c2sc(-c3ccc(CO)cc3)c(-c3ccc(CO)cc3)c2-c2ccc(CO)cc2)cc1
6	OCc1cc(C#Cc2cc(CO)cc(CO)c2)cc(CO)c1
7	OCc1ccc(-c2c(-c3ccc(O)cc3)c(-c3ccc(CO)cc3)c(-c3ccc(CO)cc3)c(-c3ccc(CO)cc3)c2-c2ccc(O)cc2)cc1
8	OCc1ccc(-c2c3nc(c(-c4ccc(CO)cc4)c4ccc([nH]4)c(-c4ccc(CO)cc4)c4nc(c(-c5ccc(CO)cc5)c5ccc2[nH]5)C=C4)C=C3)cc1
9	OCc1cc(CO)c2ccc3c(CO)cc(CO)c4ccc1c2c43
10	OCc1cc(C#Cc2ccc(C#Cc3cc(CO)cc(CO)c3)cc2)cc(CO)c1
11	O=C1C(c2ccc(CO)cc2)=C(c2ccc(CO)cc2)C(=O)C(c2ccc(CO)cc2)=C1c1ccc(CO)cc1
12	OCc1ccc(C#Cc2nc(C#Cc3ccc(CO)cc3)c(C#Cc3ccc(CO)cc3)nc2C#Cc2ccc(CO)cc2)cc1
13	OCc1ccc(-c2cc(-c3ccc(CO)cc3)c(-c3ccc(CO)cc3)cc2-c2ccc(CO)cc2)cc1
14	OCc1cc(C#Cc2cccc(C#Cc3cc(CO)cc(CO)c3)c2)cc(CO)c1
15	OCc1ccc(N(c2ccc(CO)cc2)c2ccc(-c3ccc(N(c4ccc(CO)cc4)c4ccc(CO)cc4)cc3)cc2)cc1
16	OCc1cc(CO)cc(-c2cccc(-c3cc(CO)cc(CO)c3)c2)c1
17	OCc1ccc([C@H]2c3cc(c(O)cc3O)[C@H](c3ccc(CO)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(CO)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(CO)cc3)c3cc2c(O)cc3O)cc1
18	OCc1cc(CO)cc(-c2cc(CO)cc(CO)c2)c1
19	OCc1cc(CO)cc(-c2ccc(-c3cc(CO)cc(CO)c3)cc2)c1
20	OCc1ccc(-c2nc(-c3ccc(CO)cc3)c(-c3ccc(CO)cc3)nc2-c2ccc(CO)cc2)cc1
21	O=C(O)c1ccc(N(c2ccc(C(=O)O)cc2)N(c2ccc(C(=O)O)cc2)c2ccc(C(=O)O)cc2)cc1
22	O=C1C(c2ccc(C(=O)O)cc2)=C(c2ccc(C(=O)O)cc2)C(c2ccc(C(=O)O)cc2)=C1c1ccc(C(=O)O)cc1
23	O=C(O)c1ccc(C(=C(c2ccc(C(=O)O)cc2)c2ccc(C(=O)O)cc2)c2ccc(C(=O)O)cc2)cc1
24	O=C(O)c1ccc(-c2sc(-c3ccc(C(=O)O)cc3)c(-c3ccc(C(=O)O)cc3)c2-c2ccc(C(=O)O)cc2)cc1
25	O=C(O)c1cc(C#Cc2cc(C(=O)O)cc(C(=O)O)c2)cc(C(=O)O)c1
26	O=C(O)c1ccc(-c2c(-c3ccc(O)cc3)c(-c3ccc(C(=O)O)cc3)c(-c3ccc(C(=O)O)cc3)c(-c3ccc(C(=O)O)cc3)c2-c2ccc(O)cc2)cc1
27	O=C(O)c1ccc(-c2c3nc(c(-c4ccc(C(=O)O)cc4)c4ccc([nH]4)c(-c4ccc(C(=O)O)cc4)c4nc(c(-c5ccc(C(=O)O)cc5)c5ccc2[nH]5)C=C4)C=C3)cc1
28	O=C(O)c1cc(C(=O)O)c2ccc3c(C(=O)O)cc(C(=O)O)c4ccc1c2c43
29	O=C(O)c1cc(C#Cc2ccc(C#Cc3cc(C(=O)O)cc(C(=O)O)c3)cc2)cc(C(=O)O)c1
30	O=C1C(c2ccc(C(=O)O)cc2)=C(c2ccc(C(=O)O)cc2)C(=O)C(c2ccc(C(=O)O)cc2)=C1c1ccc(C(=O)O)cc1
31	O=C(O)c1ccc(C#Cc2nc(C#Cc3ccc(C(=O)O)cc3)c(C#Cc3ccc(C(=O)O)cc3)nc2C#Cc2ccc(C(=O)O)cc2)cc1
32	O=C(O)c1ccc(-c2cc(-c3ccc(C(=O)O)cc3)c(-c3ccc(C(=O)O)cc3)cc2-c2ccc(C(=O)O)cc2)cc1
33	O=C(O)c1cc(C#Cc2cccc(C#Cc3cc(C(=O)O)cc(C(=O)O)c3)c2)cc(C(=O)O)c1
34	O=C(O)c1ccc(N(c2ccc(C(=O)O)cc2)c2ccc(-c3ccc(N(c4ccc(C(=O)O)cc4)c4ccc(C(=O)O)cc4)cc3)cc2)cc1
35	O=C(O)c1cc(C(=O)O)cc(-c2cccc(-c3cc(C(=O)O)cc(C(=O)O)c3)c2)c1
36	O=C(O)c1ccc([C@H]2c3cc(c(O)cc3O)[C@H](c3ccc(C(=O)O)cc3)c3cc(c(O)cc3O)[C@H](c3ccc(C(=O)O)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(C(=O)O)cc3)c3cc2c(O)cc3O)cc1
37	O=C(O)c1cc(C(=O)O)cc(-c2cc(C(=O)O)cc(C(=O)O)c2)c1
38	O=C(O)c1cc(C(=O)O)cc(-c2ccc(-c3cc(C(=O)O)cc(C(=O)O)c3)cc2)c1
39	O=C(O)c1ccc(-c2nc(-c3ccc(C(=O)O)cc3)c(-c3ccc(C(=O)O)cc3)nc2-c2ccc(C(=O)O)cc2)cc1
40	N#C/C1=C/c2cc(F)cc(c2)/C(C#N)=C\\c2cc(F)cc(c2)/C(C#N)=C\\c2cc(F)cc(c2)/C(C#N)=C\\c2cc(F)cc(c2)/C(C#N)=C\\c2cc(F)cc1c2
41	N#C/C1=C/c2cc(CO)cc(c2)/C(C#N)=C\\c2cc(CO)cc(c2)/C(C#N)=C\\c2cc(CO)cc(c2)/C(C#N)=C\\c2cc(CO)cc(c2)/C(C#N)=C\\c2cc(CO)cc1c2
42	N#C/C1=C\\c2cc(N)cc(c2)/C(C#N)=C\\c2cc(N)cc(c2)/C(C#N)=C\\c2cc(N)cc(c2)/C(C#N)=C\\c2cc(N)cc(c2)/C(C#N)=C\\c2cc(N)cc1c2
43	Fc1ccc(-c2cc(-c3ccc(F)cc3)nc(-c3ccc(F)cc3)c2)cc1
44	Fc1c(C#Cc2ccccc2)c(F)c(C#Cc2ccccc2)c(F)c1C#Cc1ccccc1
45	FN1CN(F)CN(F)C1
46	O=C(c1ccc(F)cc1)c1cc(C(=O)c2ccc(F)cc2)cc(C(=O)c2ccc(F)cc2)c1
47	CCC(c1ccc(C#Cc2ccc(F)cc2)cc1)(c1ccc(C#Cc2ccc(F)cc2)cc1)c1ccc(C#Cc2ccc(F)cc2)cc1
48	Fc1ccc(C=c2c3ccc4c(=Cc5ccc(F)cc5)c5ccc6c(=Cc7ccc(F)cc7)c7ccc2c2c3c4c5c6c72)cc1
49	Fc1ccc2c(c1)C1c3cc(F)ccc3C2c2ccc(F)cc21
50	Cc1c(F)c(C)c(F)c(C)c1F
51	Oc1c(F)cc(F)cc1F
52	Fc1ccc(-c2ccc(C34CC5CC(c6ccc(-c7ccc(F)cc7)cc6)(C3)CC(c3ccc(-c6ccc(F)cc6)cc3)(C5)C4)cc2)cc1
53	C[Si](c1ccc(F)cc1)(c1ccc(F)cc1)c1ccc(F)cc1
54	CCC(c1ccc(F)cc1)(c1ccc(F)cc1)c1ccc(F)cc1
55	Fc1ccc(N(c2ccc(F)cc2)c2ccc(F)cc2)cc1
56	O=C(Nc1ccc(F)cc1)c1cc(C(=O)Nc2ccc(F)cc2)cc(C(=O)Nc2ccc(F)cc2)c1
57	Cc1c(F)cc(F)c(C)c1F
58	Cc1c(F)cc(F)cc1F
59	Fc1ccc(C#Cc2ccc(C(c3ccc(C#Cc4ccc(F)cc4)cc3)c3ccc(C#Cc4ccc(F)cc4)cc3)cc2)cc1
60	Fc1ccc(C23CC4CC(c5ccc(F)cc5)(C2)CC(c2ccc(F)cc2)(C4)C3)cc1
61	Oc1c(F)c(O)c(F)c(O)c1F
62	CC12[C@]3(C)c4ccc(F)cc4[C@@]1(C)c1ccc(F)cc1[C@@]2(C)c1ccc(F)cc13
63	Fc1ccc2[nH]c3c(c2c1)c1[nH]c2ccc(F)cc2c1c1[nH]c2ccc(F)cc2c31
64	Fc1ccc(C(c2ccc(F)cc2)c2ccc(F)cc2)cc1
65	Fc1ccc2c(F)cc(F)cc2c1
66	Fc1cc(F)nc(F)c1
67	Fc1cc(F)cc(F)c1
68	Fc1ccc(N2COc3c(c4c(c5c3CN(c3ccc(F)cc3)CO5)CN(c3ccc(F)cc3)CO4)C2)cc1
69	Fc1ccc(N2CN(c3ccc(F)cc3)CN(c3ccc(F)cc3)C2)cc1
70	CCC(c1ccc(-c2ccc(F)cc2)cc1)(c1ccc(-c2ccc(F)cc2)cc1)c1ccc(-c2ccc(F)cc2)cc1
71	Fc1ccc(C#Cc2ccc(C34CC5CC(c6ccc(C#Cc7ccc(F)cc7)cc6)(C3)CC(c3ccc(C#Cc6ccc(F)cc6)cc3)(C5)C4)cc2)cc1
72	F[C@H]1O[C@H](F)O[C@@H](F)O1
73	Fc1ccc(C#Cc2cc(C#Cc3ccc(F)cc3)cc(C#Cc3ccc(F)cc3)c2)cc1
74	Oc1ccc(C#Cc2cc(C#Cc3ccc(O)c(F)c3)cc(C#Cc3ccc(O)c(F)c3)c2)cc1F
75	Fc1ccc(-c2ccc(C(c3ccc(-c4ccc(F)cc4)cc3)c3ccc(-c4ccc(F)cc4)cc3)cc2)cc1
76	Fc1cc(F)c(F)c(F)c1F
77	Fc1ccc(-c2nc(-c3ccc(F)cc3)c(-c3ccc(F)cc3)[nH]2)cc1
78	Fc1cc(F)c2cccc(F)c2c1
79	Oc1c(F)ccc2c1C1c3c(ccc(F)c3O)C2c2ccc(F)c(O)c21
80	Oc1c(F)cc(F)c(O)c1F
81	Fc1ccc(B2OB(c3ccc(F)cc3)OB(c3ccc(F)cc3)O2)cc1
82	Fc1ccc(-c2ccc(-c3cc(-c4ccc(-c5ccc(F)cc5)cc4)cc(-c4ccc(-c5ccc(F)cc5)cc4)c3)cc2)cc1
83	Fc1cc(F)nc(F)n1
84	Fc1ccc(-c2cc(-c3ccc(F)cc3)cc(-c3ccc(F)cc3)c2)cc1
85	Fc1ccc(CN(Cc2ccc(F)cc2)Cc2ccc(F)cc2)cc1
86	Fc1ccc(C(=C(c2ccc(F)cc2)c2ccc(F)cc2)c2ccc(F)cc2)cc1
87	Fc1cc(F)cc(C#Cc2cc(F)cc(F)c2)c1
88	Fc1ccc(-c2cc(-c3ccc(F)cc3)c(-c3ccc(F)cc3)cc2-c2ccc(F)cc2)cc1
89	Fc1ccc(C#Cc2nc(C#Cc3ccc(F)cc3)c(C#Cc3ccc(F)cc3)nc2C#Cc2ccc(F)cc2)cc1
90	Fc1ccc(-c2nc(-c3ccc(F)cc3)c(-c3ccc(F)cc3)nc2-c2ccc(F)cc2)cc1
91	Fc1ccc(-c2sc(-c3ccc(F)cc3)c(-c3ccc(F)cc3)c2-c2ccc(F)cc2)cc1
92	Fc1cc(F)cc(C#Cc2cccc(C#Cc3cc(F)cc(F)c3)c2)c1
93	O=C1C(c2ccc(F)cc2)=C(c2ccc(F)cc2)C(c2ccc(F)cc2)=C1c1ccc(F)cc1
94	Fc1cc(F)cc(-c2cc(F)cc(F)c2)c1
95	Fc1cc(F)c2ccc3c(F)cc(F)c4ccc1c2c43
96	Fc1cc(F)cc(-c2cccc(-c3cc(F)cc(F)c3)c2)c1
97	O=C1C(c2ccc(F)cc2)=C(c2ccc(F)cc2)C(=O)C(c2ccc(F)cc2)=C1c1ccc(F)cc1
98	Fc1ccc(-c2c3nc(c(-c4ccc(F)cc4)c4ccc([nH]4)c(-c4ccc(F)cc4)c4nc(c(-c5ccc(F)cc5)c5ccc2[nH]5)C=C4)C=C3)cc1
99	Oc1cc(O)c2cc1[C@H](c1ccc(F)cc1)c1cc(c(O)cc1O)[C@H](c1ccc(F)cc1)c1cc(c(O)cc1O)[C@@H](c1ccc(F)cc1)c1cc(c(O)cc1O)[C@H]2c1ccc(F)cc1
100	Fc1cc(F)cc(-c2ccc(-c3cc(F)cc(F)c3)cc2)c1
101	Oc1ccc(-c2c(-c3ccc(F)cc3)c(-c3ccc(O)cc3)c(-c3ccc(F)cc3)c(-c3ccc(F)cc3)c2-c2ccc(F)cc2)cc1
102	Fc1ccc(N(c2ccc(F)cc2)c2ccc(-c3ccc(N(c4ccc(F)cc4)c4ccc(F)cc4)cc3)cc2)cc1
103	Fc1cc(F)cc(C#Cc2ccc(C#Cc3cc(F)cc(F)c3)cc2)c1
104	Fc1ccc(N(c2ccc(F)cc2)N(c2ccc(F)cc2)c2ccc(F)cc2)cc1
105	Nc1cc(CCc2ccc(O)c(N)c2)ccc1O
106	Nc1ccc2c(ccc3cc(N)ccc32)c1
107	Nc1ccc(N)o1
108	Nc1ccc(-c2ccc(N)cn2)nc1
109	COc1c(N)cc(C(C)(C)C)cc1N
110	Nc1cccc2cc3cccc(N)c3cc12
111	Nc1cc(N)cc(B(O)O)c1
112	Nc1ccc(-c2cccc3cccc(-c4ccc(N)cc4)c23)cc1
113	Nc1ccc(C#Cc2cccc(C#Cc3ccc(N)cc3)c2)cc1
114	Nc1ccc(N(c2ccccc2)c2ccc(N)cc2)cc1
115	Nc1ccc(Oc2ccc(N)cc2)cc1
116	COc1cc(C#Cc2cc(N)cc(Br)c2)cc(C#Cc2cc(N)cc(Br)c2)c1
117	Nc1ccc2c(c1)[C@H]1c3ccccc3[C@@H]2c2ccc(N)cc21
118	Nc1cc2ccc3cc(N)cc4ccc(c1)c2c34
119	N=c1ccc2ccc3ccc(=N)[nH]c3c2[nH]1
120	N=c1cccc(N)[nH]1
121	O=C(C(=O)c1ccc(O)c(O)c1)c1ccc(O)c(O)c1
122	Nc1ccc(C(=C(c2ccc(N)cc2)c2ccc(N)cc2)c2ccc(N)cc2)cc1
123	Nc1cc(N)cc(C#Cc2cc(N)cc(N)c2)c1
124	Nc1ccc(-c2cc(-c3ccc(N)cc3)c(-c3ccc(N)cc3)cc2-c2ccc(N)cc2)cc1
125	Nc1ccc(C#Cc2nc(C#Cc3ccc(N)cc3)c(C#Cc3ccc(N)cc3)nc2C#Cc2ccc(N)cc2)cc1
126	Nc1ccc(-c2nc(-c3ccc(N)cc3)c(-c3ccc(N)cc3)nc2-c2ccc(N)cc2)cc1
127	Nc1ccc(-c2sc(-c3ccc(N)cc3)c(-c3ccc(N)cc3)c2-c2ccc(N)cc2)cc1
128	Nc1cc(N)cc(C#Cc2cccc(C#Cc3cc(N)cc(N)c3)c2)c1
129	Nc1ccc(C2=C(c3ccc(N)cc3)C(c3ccc(N)cc3)=C(c3ccc(N)cc3)C2=O)cc1
130	Nc1cc(N)cc(-c2cc(N)cc(N)c2)c1
131	Nc1cc(N)c2ccc3c(N)cc(N)c4ccc1c2c43
132	Nc1cc(N)cc(-c2cccc(-c3cc(N)cc(N)c3)c2)c1
133	Nc1ccc(C2=C(c3ccc(N)cc3)C(=O)C(c3ccc(N)cc3)=C(c3ccc(N)cc3)C2=O)cc1
134	Nc1ccc(-c2c3nc(c(-c4ccc(N)cc4)c4ccc([nH]4)c(-c4ccc(N)cc4)c4nc(c(-c5ccc(N)cc5)c5ccc2[nH]5)C=C4)C=C3)cc1
135	Nc1ccc([C@H]2c3cc(c(O)cc3O)[C@H](c3ccc(N)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(N)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(N)cc3)c3cc2c(O)cc3O)cc1
136	Nc1cc(N)cc(-c2ccc(-c3cc(N)cc(N)c3)cc2)c1
137	Nc1ccc(-c2c(-c3ccc(N)cc3)c(-c3ccc(O)cc3)c(-c3ccc(N)cc3)c(-c3ccc(O)cc3)c2-c2ccc(N)cc2)cc1
138	Nc1ccc(N(c2ccc(N)cc2)c2ccc(-c3ccc(N(c4ccc(N)cc4)c4ccc(N)cc4)cc3)cc2)cc1
139	Nc1cc(N)cc(C#Cc2ccc(C#Cc3cc(N)cc(N)c3)cc2)c1
140	Nc1ccc(N(c2ccc(N)cc2)N(c2ccc(N)cc2)c2ccc(N)cc2)cc1
141	N#C/C1=C/c2cc(Br)cc(c2)/C(C#N)=C\\c2cc(Br)cc(c2)/C(C#N)=C\\c2cc(Br)cc(c2)/C(C#N)=C\\c2cc(Br)cc(c2)/C(C#N)=C\\c2cc(Br)cc1c2
142	Clc1cc2ccc3cc(Cl)cc4ccc(c1)c2c34
143	ClCc1ccc2ccc(CCl)cc2c1
144	CC(C)(Cl)CCl
145	ClC[C@@H]1CC[C@@H](CCl)C1
146	OC[C@H](Cl)[C@H](Cl)CO
147	Clc1ccc(N(c2ccccc2)c2ccc(Cl)cc2)cc1
148	Clc1ccc(-c2ccc(C34CC5(c6ccc(-c7ccc(Cl)cc7)cc6)C[C@H](C3)C[C@H](C4)C5)cc2)cc1
149	CCCCC[C@@H](Cl)[C@H](Cl)CCCCC
150	C[C@H](Cl)C(O)=N[C@@H]1CCCC[C@H]1N=C(O)[C@H](C)Cl
151	Clc1ccc(C#Cc2cccc(C#Cc3ccc(Cl)cc3)c2)cc1
152	Clc1cccc(Cl)c1
153	Clc1c2ccccc2c(Cl)c2ccccc12
154	Clc1ccc(Cl)cc1
155	ClCc1cccc(CCl)c1
156	O[C@@H]1C[C@@H](Cl)[C@@H](Cl)C[C@H]1Br
157	Clc1ccc(-c2cccc(-c3ccc(Cl)cc3)c2)cc1
158	Clc1ccc(C#Cc2ccc(C#Cc3ccc(Cl)cc3)cc2)cc1
159	Clc1ccc(Cl)[nH]1
160	Clc1ccc(/N=N/c2ccc(Cl)cc2)cc1
161	C[C@H](Cl)C(O)=NCCN=C(O)[C@H](C)Cl
162	ClCCCl
163	Clc1cnc2c(ccc3cc(Cl)cnc32)c1
164	ClCCCCCCl
165	Clc1ccc2c(ccc3cc(Cl)ccc32)c1
166	CC[C@@H](C)[C@H](Cl)C(O)=NCCN=C(O)[C@H](C)Cl
167	Clc1ccc(-c2ccc(Cl)cc2)cc1
168	Clc1ccc(Cc2ccc(Cl)cc2)cc1
169	Clc1ccc(-c2ccc(-c3ccc(Cl)cc3)cc2)cc1
170	Cl[C@@H](c1cccc2ccccc12)[C@@H](Cl)c1cccc2ccccc12
171	Clc1ccc(-c2ccc(Cl)cn2)nc1
172	ClCCNCCCl
173	Clc1ccc2ccc3ccc(Cl)cc3c2c1
174	Fc1ccc([C@H](Cl)[C@H](Cl)c2ccc(F)cc2)cc1
175	ClCCCCCl
176	ClCc1ccc(CCl)cc1
177	CC(C)(Cl)C(C)(C)Cl
178	Cl[C@H]1CCC[C@@H](Cl)C1
179	Clc1ccc(-c2ccc(Cl)c(Cl)c2)cc1Cl
180	Cl[C@@H]1CN(Cc2ccccc2)C[C@H]1Cl
181	ClCCCCl
182	N#Cc1ccc([C@H](Cl)[C@@H](Cl)c2ccc(C#N)cc2)cc1
183	C[C@H](Cl)CCCCl
184	Clc1ccc2c(c1)[C@H]1c3ccccc3[C@@H]2c2ccc(Cl)cc21
185	Cl[C@H]1C[C@@H](Br)[C@H](Br)C[C@H]1Cl
186	C[C@H](Cl)CCl
187	Cl[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1Cl
188	Clc1ccc(Cl)s1
189	Clc1ccc(CCc2ccc(Cl)cc2)cc1
190	O=C1C[C@H](c2ccc(Cl)cc2)N1c1ccc(Cl)cc1
191	SC[C@H](Cl)[C@H](Cl)CS
192	Clc1ccc(Sc2ccc(Cl)cc2)cc1
193	Cl[C@H]1CCCC[C@H]1Cl
194	Clc1ccc(C23CC4(c5ccc(Cl)cc5)C[C@H](C2)C[C@H](C3)C4)cc1
195	Cl[C@H]1CNC[C@H]1Cl
196	FC(F)(F)[C@@H](Cl)CCl
197	C[C@H](Cl)C(O)=NCCN=C(O)[C@@H](Cl)c1ccccc1
198	O=C1C[C@@H](Cl)[C@@H](Cl)C[C@H]1O
199	Clc1ccc(-c2ccc(-c3ccc(-c4ccc(Cl)cc4)cc3)cc2)cc1
200	Cl[C@H]1COCCOCCOCCOCCOC[C@@H]1Cl
201	ClCCOCCOCCCl
202	Cl[C@H]1C=CC=C[C@H]1Cl
203	Cl[C@@H]1CSSC[C@H]1Cl
204	ClCc1ccc2ccc3ccc(CCl)nc3c2n1
205	CCOC(=O)[C@H](Cl)CCl
206	Clc1ccc(Oc2ccc(Cl)cc2)cc1
207	C[C@@H]1C[C@H](Cl)[C@H](Cl)C[C@H]1C
208	Clc1cc2cc(Cl)sc2s1
209	Cl[C@H]1CCCC[C@@H]1Cl
210	O[C@@H]1C[C@H](Cl)[C@H](Cl)C[C@H]1O
211	Cl[C@@H](c1ccccc1)[C@H](Cl)c1ccccc1
212	ClCCOCCCl
213	Clc1ccc(Cl)o1
214	Clc1ccc2[nH]c3ccc(Cl)cc3c2c1
215	Clc1ccccc1Cl
216	Clc1ccc(C#Cc2ccc(Cl)cc2)cc1
217	CC[C@@H](Cl)CCl
218	Clc1ccccc1SSc1ccccc1Cl
219	Cl[C@H]1CCC[C@H]1Cl
220	O[C@@H](Cl)CCl
221	Clc1ccc(/C=C/c2ccc(Cl)cc2)cc1
222	C[C@@](Cl)(CCl)C(F)(F)F
223	Clc1cc2sc(Cl)cc2s1
224	COc1cc(Cl)c(OC)cc1Cl
225	Cl[C@H]1CC=CC[C@H]1Cl
226	CC(C)[C@@H](Cl)CCl
227	Cl[C@H]1CC[C@@H](Cl)CC1
228	Cc1cc(C)c([C@H](Cl)[C@@H](Cl)c2c(C)cc(C)cc2C)c(C)c1
229	Cl[C@H]1CN(Cc2ccccc2)C[C@H]1Cl
230	O=C1C[C@@H](Cl)[C@@H](Cl)C[C@H]1Br
231	Clc1ccc2ccc3ccc(Cl)nc3c2n1
232	Brc1cc2c(cc1Br)C1c3cc(Br)c(Br)cc3C2c2cc(Br)c(Br)cc21
233	Nc1cc2c(cc1N)C1c3cc(N)c(N)cc3C2c2cc(N)c(N)cc21
234	Brc1ccc(N(c2ccc(Br)cc2)N(c2ccc(Br)cc2)c2ccc(Br)cc2)cc1
235	O=C1C(c2ccc(Br)cc2)=C(c2ccc(Br)cc2)C(c2ccc(Br)cc2)=C1c1ccc(Br)cc1
236	Brc1ccc(C(=C(c2ccc(Br)cc2)c2ccc(Br)cc2)c2ccc(Br)cc2)cc1
237	Brc1ccc(-c2sc(-c3ccc(Br)cc3)c(-c3ccc(Br)cc3)c2-c2ccc(Br)cc2)cc1
238	Brc1cc(Br)cc(C#Cc2cc(Br)cc(Br)c2)c1
239	Oc1ccc(-c2c(-c3ccc(Br)cc3)c(-c3ccc(O)cc3)c(-c3ccc(Br)cc3)c(-c3ccc(Br)cc3)c2-c2ccc(Br)cc2)cc1
240	Brc1ccc(-c2c3nc(c(-c4ccc(Br)cc4)c4ccc([nH]4)c(-c4ccc(Br)cc4)c4nc(c(-c5ccc(Br)cc5)c5ccc2[nH]5)C=C4)C=C3)cc1
241	Brc1cc(Br)c2ccc3c(Br)cc(Br)c4ccc1c2c43
242	Brc1cc(Br)cc(C#Cc2ccc(C#Cc3cc(Br)cc(Br)c3)cc2)c1
243	O=C1C(c2ccc(Br)cc2)=C(c2ccc(Br)cc2)C(=O)C(c2ccc(Br)cc2)=C1c1ccc(Br)cc1
244	Brc1ccc(C#Cc2nc(C#Cc3ccc(Br)cc3)c(C#Cc3ccc(Br)cc3)nc2C#Cc2ccc(Br)cc2)cc1
245	Brc1ccc(-c2cc(-c3ccc(Br)cc3)c(-c3ccc(Br)cc3)cc2-c2ccc(Br)cc2)cc1
246	Brc1cc(Br)cc(C#Cc2cccc(C#Cc3cc(Br)cc(Br)c3)c2)c1
247	Brc1ccc(N(c2ccc(Br)cc2)c2ccc(-c3ccc(N(c4ccc(Br)cc4)c4ccc(Br)cc4)cc3)cc2)cc1
248	Brc1cc(Br)cc(-c2cccc(-c3cc(Br)cc(Br)c3)c2)c1
249	Oc1cc(O)c2cc1[C@H](c1ccc(Br)cc1)c1cc(c(O)cc1O)[C@H](c1ccc(Br)cc1)c1cc(c(O)cc1O)[C@@H](c1ccc(Br)cc1)c1cc(c(O)cc1O)[C@H]2c1ccc(Br)cc1
250	Brc1cc(Br)cc(-c2cc(Br)cc(Br)c2)c1
251	Brc1cc(Br)cc(-c2ccc(-c3cc(Br)cc(Br)c3)cc2)c1
252	Brc1ccc(-c2nc(-c3ccc(Br)cc3)c(-c3ccc(Br)cc3)nc2-c2ccc(Br)cc2)cc1
253	Oc1cc(O)c2cc1[C@H](c1ccc(F)cc1)c1cc(c(O)cc1O)[C@H](c1ccc(F)cc1)c1cc(c(O)cc1O)[C@H](c1ccc(F)cc1)c1cc(c(O)cc1O)[C@H]2c1ccc(F)cc1
254	Nc1ccc(N(c2ccc(N)cc2)c2ccc(N)cc2)cc1
255	NCCCN(CCCN)CCCN
256	C[Si](c1ccc(N)cc1)(c1ccc(N)cc1)c1ccc(N)cc1
257	Nc1ccc(C(c2ccc(N)cc2)c2ccc(N)cc2)cc1
258	Cc1c(N)c(C)c(N)c(C)c1N
259	Nc1ccc(-c2ccc(-c3cc(-c4ccc(-c5ccc(N)cc5)cc4)cc(-c4ccc(-c5ccc(N)cc5)cc4)c3)cc2)cc1
260	Nc1ccc(N2CN(c3ccc(N)cc3)CN(c3ccc(N)cc3)C2)cc1
261	Nc1ccc(C#Cc2ccc(C(c3ccc(C#Cc4ccc(N)cc4)cc3)c3ccc(C#Cc4ccc(N)cc4)cc3)cc2)cc1
262	Nc1ccc2c(c1)C1c3cc(N)ccc3C2c2ccc(N)cc21
263	Nc1ccc(NC(=O)c2cc(C(=O)Nc3ccc(N)cc3)cc(C(=O)Nc3ccc(N)cc3)c2)cc1
264	Nc1ccc(C=c2c3ccc4c(=Cc5ccc(N)cc5)c5ccc6c(=Cc7ccc(N)cc7)c7ccc2c2c3c4c5c6c72)cc1
265	Nc1ccc(-c2ccc(C(c3ccc(-c4ccc(N)cc4)cc3)c3ccc(-c4ccc(N)cc4)cc3)cc2)cc1
266	Nc1ccc(C#Cc2ccc(C34CC5CC(c6ccc(C#Cc7ccc(N)cc7)cc6)(C3)CC(c3ccc(C#Cc6ccc(N)cc6)cc3)(C5)C4)cc2)cc1
267	CCCCCCCCCCCCCCc1ccc(C(c2ccc(N)cc2)(c2ccc(N)cc2)c2ccc(N)cc2)cc1
268	Nc1ccc(C#Cc2cc(C#Cc3ccc(N)cc3)cc(C#Cc3ccc(N)cc3)c2)cc1
269	Nc1ccc(-c2nc(-c3ccc(N)cc3)c(-c3ccc(N)cc3)[nH]2)cc1
270	Nc1cc(N)cc(N)c1
271	Nc1ccc(-c2cc(-c3ccc(N)cc3)cc(-c3ccc(N)cc3)c2)cc1
272	Nc1ccc(-c2ccc(C34CC5CC(c6ccc(-c7ccc(N)cc7)cc6)(C3)CC(c3ccc(-c6ccc(N)cc6)cc3)(C5)C4)cc2)cc1
273	Nc1ccc(CN(Cc2ccc(N)cc2)Cc2ccc(N)cc2)cc1
274	Nc1ccc(C(=O)c2cc(C(=O)c3ccc(N)cc3)cc(C(=O)c3ccc(N)cc3)c2)cc1
275	CCCCOc1c(CN)c(OCCCC)c(CN)c(OCCCC)c1CN
276	N[C@H]1C[C@H](N)C[C@@H](N)C1
277	Nc1ccc(C23CC4CC(c5ccc(N)cc5)(C2)CC(c2ccc(N)cc2)(C4)C3)cc1
278	NCCN(CCN)CCN
279	Nc1ccc(-c2cc(-c3ccc(N)cc3)nc(-c3ccc(N)cc3)c2)cc1
280	Nc1ccc(N2COc3c(c4c(c5c3CN(c3ccc(N)cc3)CO5)CN(c3ccc(N)cc3)CO4)C2)cc1
281	Nc1ccc(B2OB(c3ccc(N)cc3)OB(c3ccc(N)cc3)O2)cc1
282	Cc1c(CN)c(C)c(CN)c(C)c1CN
283	CCCCCCc1c(-c2ccc(N)cc2)c(CCCCCC)c(-c2ccc(N)cc2)c(CCCCCC)c1-c1ccc(N)cc1
284	CCc1c(CN)c(CC)c(CN)c(CC)c1CN
285	Ic1ccc(N(c2ccc(I)cc2)c2ccc(I)cc2)cc1
286	ICCCN(CCCI)CCCI
287	C[Si](c1ccc(I)cc1)(c1ccc(I)cc1)c1ccc(I)cc1
288	Ic1ccc(C(c2ccc(I)cc2)c2ccc(I)cc2)cc1
289	Cc1c(I)c(C)c(I)c(C)c1I
290	Ic1ccc(-c2ccc(-c3cc(-c4ccc(-c5ccc(I)cc5)cc4)cc(-c4ccc(-c5ccc(I)cc5)cc4)c3)cc2)cc1
291	Ic1ccc(N2CN(c3ccc(I)cc3)CN(c3ccc(I)cc3)C2)cc1
634	CC[C@@H](Br)CBr
292	Ic1ccc(C#Cc2ccc(C(c3ccc(C#Cc4ccc(I)cc4)cc3)c3ccc(C#Cc4ccc(I)cc4)cc3)cc2)cc1
293	Ic1ccc2c(c1)C1c3cc(I)ccc3C2c2ccc(I)cc21
294	O=C(Nc1ccc(I)cc1)c1cc(C(=O)Nc2ccc(I)cc2)cc(C(=O)Nc2ccc(I)cc2)c1
295	Ic1ccc(C=c2c3ccc4c(=Cc5ccc(I)cc5)c5ccc6c(=Cc7ccc(I)cc7)c7ccc2c2c3c4c5c6c72)cc1
296	Ic1ccc(-c2ccc(C(c3ccc(-c4ccc(I)cc4)cc3)c3ccc(-c4ccc(I)cc4)cc3)cc2)cc1
297	Ic1ccc(C#Cc2ccc(C34CC5CC(c6ccc(C#Cc7ccc(I)cc7)cc6)(C3)CC(c3ccc(C#Cc6ccc(I)cc6)cc3)(C5)C4)cc2)cc1
298	CCCCCCCCCCCCCCc1ccc(C(c2ccc(I)cc2)(c2ccc(I)cc2)c2ccc(I)cc2)cc1
299	Ic1ccc(C#Cc2cc(C#Cc3ccc(I)cc3)cc(C#Cc3ccc(I)cc3)c2)cc1
300	Ic1ccc(-c2nc(-c3ccc(I)cc3)c(-c3ccc(I)cc3)[nH]2)cc1
301	Ic1cc(I)cc(I)c1
302	Ic1ccc(-c2cc(-c3ccc(I)cc3)cc(-c3ccc(I)cc3)c2)cc1
303	Ic1ccc(-c2ccc(C34CC5CC(c6ccc(-c7ccc(I)cc7)cc6)(C3)CC(c3ccc(-c6ccc(I)cc6)cc3)(C5)C4)cc2)cc1
304	Ic1ccc(CN(Cc2ccc(I)cc2)Cc2ccc(I)cc2)cc1
305	O=C(c1ccc(I)cc1)c1cc(C(=O)c2ccc(I)cc2)cc(C(=O)c2ccc(I)cc2)c1
306	CCCCOc1c(CI)c(OCCCC)c(CI)c(OCCCC)c1CI
307	I[C@H]1C[C@H](I)C[C@@H](I)C1
308	Ic1ccc(C23CC4CC(c5ccc(I)cc5)(C2)CC(c2ccc(I)cc2)(C4)C3)cc1
309	ICCN(CCI)CCI
310	Ic1ccc(-c2cc(-c3ccc(I)cc3)nc(-c3ccc(I)cc3)c2)cc1
311	Ic1ccc(N2COc3c(c4c(c5c3CN(c3ccc(I)cc3)CO5)CN(c3ccc(I)cc3)CO4)C2)cc1
312	Ic1ccc(B2OB(c3ccc(I)cc3)OB(c3ccc(I)cc3)O2)cc1
313	Cc1c(CI)c(C)c(CI)c(C)c1CI
314	CCCCCCc1c(-c2ccc(I)cc2)c(CCCCCC)c(-c2ccc(I)cc2)c(CCCCCC)c1-c1ccc(I)cc1
315	CCc1c(CI)c(CC)c(CI)c(CC)c1CI
316	Fc1cc2ccc3cc(F)cc4ccc(c1)c2c34
317	FCc1ccc2ccc(CF)cc2c1
318	CC(C)(F)CF
319	FC[C@H]1CC[C@@H](CF)C1
320	OC[C@H](F)[C@H](F)CO
321	Fc1ccc(N(c2ccccc2)c2ccc(F)cc2)cc1
322	Fc1ccc(-c2ccc(C34CC5(c6ccc(-c7ccc(F)cc7)cc6)C[C@H](C3)C[C@H](C4)C5)cc2)cc1
323	CCCCC[C@@H](F)[C@H](F)CCCCC
324	C[C@H](F)C(O)=N[C@@H]1CCCC[C@H]1N=C(O)[C@H](C)F
325	Fc1ccc(C#Cc2cccc(C#Cc3ccc(F)cc3)c2)cc1
326	Fc1cccc(F)c1
327	Fc1c2ccccc2c(F)c2ccccc12
328	Fc1ccc(F)cc1
329	FCc1cccc(CF)c1
330	O[C@@H]1C[C@@H](F)[C@@H](F)C[C@H]1Br
331	Fc1ccc(-c2cccc(-c3ccc(F)cc3)c2)cc1
332	Fc1ccc(C#Cc2ccc(C#Cc3ccc(F)cc3)cc2)cc1
333	Fc1ccc(F)[nH]1
334	Fc1ccc(/N=N/c2ccc(F)cc2)cc1
335	C[C@H](F)C(O)=NCCN=C(O)[C@H](C)F
336	FCCF
337	Fc1cnc2c(ccc3cc(F)cnc32)c1
338	FCCCCCF
339	Fc1ccc2c(ccc3cc(F)ccc32)c1
340	CC[C@@H](C)[C@H](F)C(O)=NCCN=C(O)[C@H](C)F
341	Fc1ccc(-c2ccc(F)cc2)cc1
342	Fc1ccc(Cc2ccc(F)cc2)cc1
343	Fc1ccc(-c2ccc(-c3ccc(F)cc3)cc2)cc1
344	F[C@@H](c1cccc2ccccc12)[C@@H](F)c1cccc2ccccc12
345	Fc1ccc(-c2ccc(F)cn2)nc1
346	FCCNCCF
347	Fc1ccc2ccc3ccc(F)cc3c2c1
348	Fc1ccc([C@H](F)[C@H](F)c2ccc(F)cc2)cc1
349	FCCCCF
350	FCc1ccc(CF)cc1
351	CC(C)(F)C(C)(C)F
352	F[C@H]1CCC[C@@H](F)C1
353	Fc1ccc(-c2ccc(F)c(Cl)c2)cc1Cl
354	F[C@@H]1CN(Cc2ccccc2)C[C@H]1F
355	FCCCF
356	N#Cc1ccc([C@H](F)[C@@H](F)c2ccc(C#N)cc2)cc1
357	C[C@H](F)CCCF
358	Fc1ccc2c(c1)[C@H]1c3ccccc3[C@@H]2c2ccc(F)cc21
359	F[C@H]1C[C@@H](Br)[C@H](Br)C[C@H]1F
360	C[C@H](F)CF
361	F[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1F
362	Fc1ccc(F)s1
363	Fc1ccc(CCc2ccc(F)cc2)cc1
364	O=C1C[C@H](c2ccc(F)cc2)N1c1ccc(F)cc1
365	F[C@H](CS)[C@@H](F)CS
366	Fc1ccc(Sc2ccc(F)cc2)cc1
367	F[C@H]1CCCC[C@H]1F
368	Fc1ccc(C23CC4(c5ccc(F)cc5)C[C@H](C2)C[C@H](C3)C4)cc1
369	F[C@H]1CNC[C@H]1F
370	FC[C@H](F)C(F)(F)F
371	C[C@H](F)C(O)=NCCN=C(O)[C@@H](F)c1ccccc1
372	O=C1C[C@@H](F)[C@@H](F)C[C@H]1O
373	Fc1ccc(-c2ccc(-c3ccc(-c4ccc(F)cc4)cc3)cc2)cc1
374	F[C@H]1COCCOCCOCCOCCOC[C@@H]1F
375	FCCOCCOCCF
376	F[C@H]1C=CC=C[C@H]1F
377	F[C@@H]1CSSC[C@H]1F
378	FCc1ccc2ccc3ccc(CF)nc3c2n1
379	CCOC(=O)[C@@H](F)CF
380	Fc1ccc(Oc2ccc(F)cc2)cc1
381	C[C@@H]1C[C@H](F)[C@H](F)C[C@H]1C
382	Fc1cc2cc(F)sc2s1
383	F[C@H]1CCCC[C@@H]1F
384	O[C@@H]1C[C@H](F)[C@H](F)C[C@H]1O
385	F[C@@H](c1ccccc1)[C@H](F)c1ccccc1
386	FCCOCCF
387	Fc1ccc(F)o1
388	Fc1ccc2[nH]c3ccc(F)cc3c2c1
389	Fc1ccccc1F
390	Fc1ccc(C#Cc2ccc(F)cc2)cc1
391	CC[C@@H](F)CF
392	Fc1ccccc1SSc1ccccc1F
393	F[C@H]1CCC[C@H]1F
394	O[C@@H](F)CF
395	Fc1ccc(/C=C/c2ccc(F)cc2)cc1
396	C[C@@](F)(CF)C(F)(F)F
397	Fc1cc2sc(F)cc2s1
398	COc1cc(F)c(OC)cc1F
399	F[C@H]1CC=CC[C@H]1F
400	CC(C)[C@@H](F)CF
401	F[C@H]1CC[C@@H](F)CC1
402	Cc1cc(C)c([C@H](F)[C@@H](F)c2c(C)cc(C)cc2C)c(C)c1
403	F[C@H]1CN(Cc2ccccc2)C[C@H]1F
404	O=C1C[C@@H](F)[C@@H](F)C[C@H]1Br
405	Fc1ccc2ccc3ccc(F)nc3c2n1
406	Clc1ccc(C(=C(c2ccc(Cl)cc2)c2ccc(Cl)cc2)c2ccc(Cl)cc2)cc1
407	Clc1cc(Cl)cc(C#Cc2cc(Cl)cc(Cl)c2)c1
408	Clc1ccc(-c2cc(-c3ccc(Cl)cc3)c(-c3ccc(Cl)cc3)cc2-c2ccc(Cl)cc2)cc1
409	Clc1ccc(C#Cc2nc(C#Cc3ccc(Cl)cc3)c(C#Cc3ccc(Cl)cc3)nc2C#Cc2ccc(Cl)cc2)cc1
410	Clc1ccc(-c2nc(-c3ccc(Cl)cc3)c(-c3ccc(Cl)cc3)nc2-c2ccc(Cl)cc2)cc1
411	Clc1ccc(-c2sc(-c3ccc(Cl)cc3)c(-c3ccc(Cl)cc3)c2-c2ccc(Cl)cc2)cc1
412	Clc1cc(Cl)cc(C#Cc2cccc(C#Cc3cc(Cl)cc(Cl)c3)c2)c1
413	O=C1C(c2ccc(Cl)cc2)=C(c2ccc(Cl)cc2)C(c2ccc(Cl)cc2)=C1c1ccc(Cl)cc1
414	Clc1cc(Cl)cc(-c2cc(Cl)cc(Cl)c2)c1
415	Clc1cc(Cl)c2ccc3c(Cl)cc(Cl)c4ccc1c2c43
416	Clc1cc(Cl)cc(-c2cccc(-c3cc(Cl)cc(Cl)c3)c2)c1
417	O=C1C(c2ccc(Cl)cc2)=C(c2ccc(Cl)cc2)C(=O)C(c2ccc(Cl)cc2)=C1c1ccc(Cl)cc1
418	Clc1ccc(-c2c3nc(c(-c4ccc(Cl)cc4)c4ccc([nH]4)c(-c4ccc(Cl)cc4)c4nc(c(-c5ccc(Cl)cc5)c5ccc2[nH]5)C=C4)C=C3)cc1
419	Oc1cc(O)c2cc1[C@H](c1ccc(Cl)cc1)c1cc(c(O)cc1O)[C@H](c1ccc(Cl)cc1)c1cc(c(O)cc1O)[C@H](c1ccc(Cl)cc1)c1cc(c(O)cc1O)[C@@H]2c1ccc(Cl)cc1
420	Clc1cc(Cl)cc(-c2ccc(-c3cc(Cl)cc(Cl)c3)cc2)c1
421	Oc1ccc(-c2c(-c3ccc(Cl)cc3)c(-c3ccc(O)cc3)c(-c3ccc(Cl)cc3)c(-c3ccc(Cl)cc3)c2-c2ccc(Cl)cc2)cc1
422	Clc1ccc(N(c2ccc(Cl)cc2)c2ccc(-c3ccc(N(c4ccc(Cl)cc4)c4ccc(Cl)cc4)cc3)cc2)cc1
423	Clc1cc(Cl)cc(C#Cc2ccc(C#Cc3cc(Cl)cc(Cl)c3)cc2)c1
424	Clc1ccc(N(c2ccc(Cl)cc2)N(c2ccc(Cl)cc2)c2ccc(Cl)cc2)cc1
425	NCc1ccc2ccc(CN)cc2c1
426	CC(C)(N)CN
427	NC[C@H]1CC[C@@H](CN)C1
428	N[C@H](CO)[C@@H](N)CO
429	Nc1ccc(-c2ccc(C34CC5(c6ccc(-c7ccc(N)cc7)cc6)C[C@H](C3)C[C@H](C4)C5)cc2)cc1
430	CCCCC[C@@H](N)[C@H](N)CCCCC
431	C[C@H](N)C(O)=N[C@@H]1CCCC[C@H]1N=C(O)[C@H](C)N
432	Nc1cccc(N)c1
433	Nc1c2ccccc2c(N)c2ccccc12
434	Nc1ccc(N)cc1
435	NCc1cccc(CN)c1
436	N[C@H]1C[C@@H](Br)[C@H](O)C[C@H]1N
437	Nc1ccc(-c2cccc(-c3ccc(N)cc3)c2)cc1
438	Nc1ccc(C#Cc2ccc(C#Cc3ccc(N)cc3)cc2)cc1
439	Nc1ccc(N)[nH]1
440	Nc1ccc(/N=N/c2ccc(N)cc2)cc1
441	C[C@H](N)C(O)=NCCN=C(O)[C@H](C)N
442	NCCN
443	Nc1cnc2c(ccc3cc(N)cnc32)c1
444	NCCCCCN
445	CC[C@H](C)[C@H](N)C(O)=NCCN=C(O)[C@H](C)N
446	Nc1ccc(-c2ccc(N)cc2)cc1
447	Nc1ccc(Cc2ccc(N)cc2)cc1
448	Nc1ccc(-c2ccc(-c3ccc(N)cc3)cc2)cc1
449	N[C@@H](c1cccc2ccccc12)[C@@H](N)c1cccc2ccccc12
450	NCCNCCN
451	Nc1ccc2ccc3ccc(N)cc3c2c1
452	N[C@@H](c1ccc(F)cc1)[C@H](N)c1ccc(F)cc1
453	NCCCCN
454	NCc1ccc(CN)cc1
455	CC(C)(N)C(C)(C)N
456	N[C@H]1CCC[C@@H](N)C1
457	Nc1ccc(-c2ccc(N)c(Cl)c2)cc1Cl
458	N[C@@H]1CN(Cc2ccccc2)C[C@H]1N
459	NCCCN
460	N#Cc1ccc([C@H](N)[C@@H](N)c2ccc(C#N)cc2)cc1
461	C[C@H](N)CCCN
462	N[C@H]1C[C@@H](Br)[C@H](Br)C[C@H]1N
463	C[C@@H](N)CN
464	N[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1N
465	Nc1ccc(N)s1
466	Nc1ccc(CCc2ccc(N)cc2)cc1
467	Nc1ccc([C@H]2CC(=O)N2c2ccc(N)cc2)cc1
468	N[C@H](CS)[C@@H](N)CS
469	Nc1ccc(Sc2ccc(N)cc2)cc1
470	N[C@H]1CCCC[C@H]1N
471	Nc1ccc(C23CC4(c5ccc(N)cc5)C[C@H](C2)C[C@H](C3)C4)cc1
472	N[C@H]1CNC[C@H]1N
473	NC[C@H](N)C(F)(F)F
474	C[C@H](N)C(O)=NCCN=C(O)[C@@H](N)c1ccccc1
475	N[C@H]1C[C@@H](O)C(=O)C[C@H]1N
476	Nc1ccc(-c2ccc(-c3ccc(-c4ccc(N)cc4)cc3)cc2)cc1
477	N[C@H]1COCCOCCOCCOCCOC[C@@H]1N
478	NCCOCCOCCN
479	N[C@H]1C=CC=C[C@H]1N
480	N[C@@H]1CSSC[C@H]1N
481	NCc1ccc2ccc3ccc(CN)nc3c2n1
482	CCOC(=O)[C@@H](N)CN
483	C[C@@H]1C[C@H](N)[C@H](N)C[C@H]1C
484	Nc1cc2cc(N)sc2s1
485	N[C@H]1CCCC[C@@H]1N
486	N[C@H]1C[C@@H](O)[C@H](O)C[C@H]1N
487	N[C@@H](c1ccccc1)[C@H](N)c1ccccc1
488	NCCOCCN
489	Nc1ccc2[nH]c3ccc(N)cc3c2c1
490	Nc1ccccc1N
491	Nc1ccc(C#Cc2ccc(N)cc2)cc1
492	CC[C@@H](N)CN
493	Nc1ccccc1SSc1ccccc1N
494	N[C@H]1CCC[C@H]1N
495	NC[C@H](N)O
496	Nc1ccc(/C=C/c2ccc(N)cc2)cc1
497	C[C@@](N)(CN)C(F)(F)F
498	Nc1cc2sc(N)cc2s1
499	COc1cc(N)c(OC)cc1N
500	N[C@H]1CC=CC[C@H]1N
501	CC(C)[C@@H](N)CN
502	N[C@H]1CC[C@@H](N)CC1
503	Cc1cc(C)c([C@H](N)[C@@H](N)c2c(C)cc(C)cc2C)c(C)c1
504	N[C@H]1CN(Cc2ccccc2)C[C@H]1N
505	N[C@H]1C[C@@H](Br)C(=O)C[C@H]1N
506	Ic1cc2c(cc1I)C1c3cc(I)c(I)cc3C2c2cc(I)c(I)cc21
507	O=Cc1ccc(C2=C(c3ccc(C=O)cc3)C(=O)C(c3ccc(C=O)cc3)=C(c3ccc(C=O)cc3)C2=O)cc1
508	O=Cc1ccc(-c2c3nc(c(-c4ccc(C=O)cc4)c4ccc([nH]4)c(-c4ccc(C=O)cc4)c4nc(c(-c5ccc(C=O)cc5)c5ccc2[nH]5)C=C4)C=C3)cc1
509	O=Cc1ccc([C@H]2c3cc(c(O)cc3O)[C@H](c3ccc(C=O)cc3)c3cc(c(O)cc3O)[C@H](c3ccc(C=O)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(C=O)cc3)c3cc2c(O)cc3O)cc1
510	O=Cc1ccc(-c2c(-c3ccc(O)cc3)c(-c3ccc(C=O)cc3)c(-c3ccc(C=O)cc3)c(-c3ccc(C=O)cc3)c2-c2ccc(O)cc2)cc1
511	O=Cc1cc(C=O)cc(-c2ccc(-c3cc(C=O)cc(C=O)c3)cc2)c1
512	O=Cc1ccc(-c2sc(-c3ccc(C=O)cc3)c(-c3ccc(C=O)cc3)c2-c2ccc(C=O)cc2)cc1
513	O=Cc1ccc(N(c2ccc(C=O)cc2)N(c2ccc(C=O)cc2)c2ccc(C=O)cc2)cc1
514	O=Cc1cc(C#Cc2cccc(C#Cc3cc(C=O)cc(C=O)c3)c2)cc(C=O)c1
515	O=Cc1ccc(-c2cc(-c3ccc(C=O)cc3)c(-c3ccc(C=O)cc3)cc2-c2ccc(C=O)cc2)cc1
516	O=Cc1ccc(C(=C(c2ccc(C=O)cc2)c2ccc(C=O)cc2)c2ccc(C=O)cc2)cc1
517	O=Cc1cc(C=O)c2ccc3c(C=O)cc(C=O)c4ccc1c2c43
518	O=Cc1ccc(C2=C(c3ccc(C=O)cc3)C(c3ccc(C=O)cc3)=C(c3ccc(C=O)cc3)C2=O)cc1
519	O=Cc1cc(C=O)cc(-c2cc(C=O)cc(C=O)c2)c1
520	O=Cc1cc(C=O)cc(-c2cccc(-c3cc(C=O)cc(C=O)c3)c2)c1
521	O=Cc1ccc(C#Cc2nc(C#Cc3ccc(C=O)cc3)c(C#Cc3ccc(C=O)cc3)nc2C#Cc2ccc(C=O)cc2)cc1
522	O=Cc1cc(C#Cc2cc(C=O)cc(C=O)c2)cc(C=O)c1
523	O=Cc1cc(C#Cc2ccc(C#Cc3cc(C=O)cc(C=O)c3)cc2)cc(C=O)c1
524	O=Cc1ccc(-c2c3ccc([nH]3)c(-c3ccc(C=O)cc3)c3nc(c(-c4ccc(C=O)cc4)c4ccc([nH]4)c(-c4ccc(C=O)cc4)c4nc2C=C4)C=C3)cc1
525	O=Cc1ccc(-c2nc(-c3ccc(C=O)cc3)c(-c3ccc(C=O)cc3)nc2-c2ccc(C=O)cc2)cc1
526	O=Cc1ccc(N(c2ccc(C=O)cc2)c2ccc(-c3ccc(N(c4ccc(C=O)cc4)c4ccc(C=O)cc4)cc3)cc2)cc1
527	Clc1ccc(N(c2ccc(Cl)cc2)c2ccc(Cl)cc2)cc1
528	ClCCCN(CCCCl)CCCCl
529	C[Si](c1ccc(Cl)cc1)(c1ccc(Cl)cc1)c1ccc(Cl)cc1
530	Clc1ccc(C(c2ccc(Cl)cc2)c2ccc(Cl)cc2)cc1
531	Cc1c(Cl)c(C)c(Cl)c(C)c1Cl
532	Clc1ccc(-c2ccc(-c3cc(-c4ccc(-c5ccc(Cl)cc5)cc4)cc(-c4ccc(-c5ccc(Cl)cc5)cc4)c3)cc2)cc1
533	Clc1ccc(N2CN(c3ccc(Cl)cc3)CN(c3ccc(Cl)cc3)C2)cc1
534	Clc1ccc(C#Cc2ccc(C(c3ccc(C#Cc4ccc(Cl)cc4)cc3)c3ccc(C#Cc4ccc(Cl)cc4)cc3)cc2)cc1
535	Clc1ccc2c(c1)C1c3cc(Cl)ccc3C2c2ccc(Cl)cc21
536	O=C(Nc1ccc(Cl)cc1)c1cc(C(=O)Nc2ccc(Cl)cc2)cc(C(=O)Nc2ccc(Cl)cc2)c1
537	Clc1ccc(C=c2c3ccc4c(=Cc5ccc(Cl)cc5)c5ccc6c(=Cc7ccc(Cl)cc7)c7ccc2c2c3c4c5c6c72)cc1
538	Clc1ccc(-c2ccc(C(c3ccc(-c4ccc(Cl)cc4)cc3)c3ccc(-c4ccc(Cl)cc4)cc3)cc2)cc1
539	Clc1ccc(C#Cc2ccc(C34CC5CC(c6ccc(C#Cc7ccc(Cl)cc7)cc6)(C3)CC(c3ccc(C#Cc6ccc(Cl)cc6)cc3)(C5)C4)cc2)cc1
540	CCCCCCCCCCCCCCc1ccc(C(c2ccc(Cl)cc2)(c2ccc(Cl)cc2)c2ccc(Cl)cc2)cc1
541	Clc1ccc(C#Cc2cc(C#Cc3ccc(Cl)cc3)cc(C#Cc3ccc(Cl)cc3)c2)cc1
542	Clc1ccc(-c2nc(-c3ccc(Cl)cc3)c(-c3ccc(Cl)cc3)[nH]2)cc1
543	Clc1cc(Cl)cc(Cl)c1
544	Clc1ccc(-c2cc(-c3ccc(Cl)cc3)cc(-c3ccc(Cl)cc3)c2)cc1
545	Clc1ccc(-c2ccc(C34CC5CC(c6ccc(-c7ccc(Cl)cc7)cc6)(C3)CC(c3ccc(-c6ccc(Cl)cc6)cc3)(C5)C4)cc2)cc1
546	Clc1ccc(CN(Cc2ccc(Cl)cc2)Cc2ccc(Cl)cc2)cc1
547	O=C(c1ccc(Cl)cc1)c1cc(C(=O)c2ccc(Cl)cc2)cc(C(=O)c2ccc(Cl)cc2)c1
548	CCCCOc1c(CCl)c(OCCCC)c(CCl)c(OCCCC)c1CCl
549	Cl[C@H]1C[C@H](Cl)C[C@@H](Cl)C1
550	Clc1ccc(C23CC4CC(c5ccc(Cl)cc5)(C2)CC(c2ccc(Cl)cc2)(C4)C3)cc1
551	ClCCN(CCCl)CCCl
552	Clc1ccc(-c2cc(-c3ccc(Cl)cc3)nc(-c3ccc(Cl)cc3)c2)cc1
553	Clc1ccc(N2COc3c(c4c(c5c3CN(c3ccc(Cl)cc3)CO5)CN(c3ccc(Cl)cc3)CO4)C2)cc1
554	Clc1ccc(B2OB(c3ccc(Cl)cc3)OB(c3ccc(Cl)cc3)O2)cc1
555	Cc1c(CCl)c(C)c(CCl)c(C)c1CCl
556	CCCCCCc1c(-c2ccc(Cl)cc2)c(CCCCCC)c(-c2ccc(Cl)cc2)c(CCCCCC)c1-c1ccc(Cl)cc1
557	CCc1c(CCl)c(CC)c(CCl)c(CC)c1CCl
558	O=C(O)c1cc2c(cc1C(=O)O)C1c3cc(C(=O)O)c(C(=O)O)cc3C2c2cc(C(=O)O)c(C(=O)O)cc21
559	Brc1cc2ccc3cc(Br)cc4ccc(c1)c2c34
560	BrCc1ccc2ccc(CBr)cc2c1
561	CC(C)(Br)CBr
562	BrC[C@@H]1CC[C@@H](CBr)C1
563	OC[C@H](Br)[C@H](Br)CO
564	Brc1ccc(N(c2ccccc2)c2ccc(Br)cc2)cc1
565	Brc1ccc(-c2ccc(C34CC5(c6ccc(-c7ccc(Br)cc7)cc6)C[C@H](C3)C[C@H](C4)C5)cc2)cc1
566	CCCCC[C@@H](Br)[C@H](Br)CCCCC
567	C[C@H](Br)C(O)=N[C@@H]1CCCC[C@H]1N=C(O)[C@H](C)Br
568	Brc1ccc(C#Cc2cccc(C#Cc3ccc(Br)cc3)c2)cc1
569	Brc1cccc(Br)c1
570	Brc1c2ccccc2c(Br)c2ccccc12
571	Brc1ccc(Br)cc1
572	BrCc1cccc(CBr)c1
573	O[C@@H]1C[C@@H](Br)[C@@H](Br)C[C@H]1Br
574	Brc1ccc(-c2cccc(-c3ccc(Br)cc3)c2)cc1
575	Brc1ccc(C#Cc2ccc(C#Cc3ccc(Br)cc3)cc2)cc1
576	Brc1ccc(Br)[nH]1
577	Brc1ccc(/N=N/c2ccc(Br)cc2)cc1
578	C[C@H](Br)C(O)=NCCN=C(O)[C@H](C)Br
579	BrCCBr
580	Brc1cnc2c(ccc3cc(Br)cnc32)c1
581	BrCCCCCBr
582	Brc1ccc2c(ccc3cc(Br)ccc32)c1
583	CC[C@@H](C)[C@H](Br)C(O)=NCCN=C(O)[C@H](C)Br
584	Brc1ccc(-c2ccc(Br)cc2)cc1
585	Brc1ccc(Cc2ccc(Br)cc2)cc1
586	Brc1ccc(-c2ccc(-c3ccc(Br)cc3)cc2)cc1
587	Br[C@@H](c1cccc2ccccc12)[C@@H](Br)c1cccc2ccccc12
588	Brc1ccc(-c2ccc(Br)cn2)nc1
589	BrCCNCCBr
590	Brc1ccc2ccc3ccc(Br)cc3c2c1
591	Fc1ccc([C@H](Br)[C@H](Br)c2ccc(F)cc2)cc1
592	BrCCCCBr
593	BrCc1ccc(CBr)cc1
594	CC(C)(Br)C(C)(C)Br
595	Br[C@H]1CCC[C@@H](Br)C1
596	Clc1cc(-c2ccc(Br)c(Cl)c2)ccc1Br
597	Br[C@H]1CN(Cc2ccccc2)C[C@@H]1Br
598	BrCCCBr
599	N#Cc1ccc([C@H](Br)[C@@H](Br)c2ccc(C#N)cc2)cc1
600	C[C@H](Br)CCCBr
601	Brc1ccc2c(c1)[C@H]1c3ccccc3[C@@H]2c2ccc(Br)cc21
602	Br[C@H]1C[C@@H](Br)[C@H](Br)C[C@H]1Br
603	C[C@@H](Br)CBr
604	Br[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1Br
605	Brc1ccc(Br)s1
606	Brc1ccc(CCc2ccc(Br)cc2)cc1
607	O=C1C[C@@H](c2ccc(Br)cc2)N1c1ccc(Br)cc1
608	SC[C@H](Br)[C@H](Br)CS
609	Brc1ccc(Sc2ccc(Br)cc2)cc1
610	Br[C@H]1CCCC[C@H]1Br
611	Brc1ccc(C23CC4(c5ccc(Br)cc5)C[C@H](C2)C[C@H](C3)C4)cc1
612	Br[C@H]1CNC[C@H]1Br
613	FC(F)(F)[C@@H](Br)CBr
614	C[C@H](Br)C(O)=NCCN=C(O)[C@@H](Br)c1ccccc1
615	O=C1C[C@@H](Br)[C@@H](Br)C[C@H]1O
616	Brc1ccc(-c2ccc(-c3ccc(-c4ccc(Br)cc4)cc3)cc2)cc1
617	Br[C@H]1COCCOCCOCCOCCOC[C@@H]1Br
618	BrCCOCCOCCBr
619	Br[C@H]1C=CC=C[C@H]1Br
620	Br[C@@H]1CSSC[C@H]1Br
621	BrCc1ccc2ccc3ccc(CBr)nc3c2n1
622	CCOC(=O)[C@H](Br)CBr
623	Brc1ccc(Oc2ccc(Br)cc2)cc1
624	C[C@@H]1C[C@H](Br)[C@H](Br)C[C@H]1C
625	Brc1cc2cc(Br)sc2s1
626	Br[C@H]1CCCC[C@@H]1Br
627	O[C@@H]1C[C@H](Br)[C@H](Br)C[C@H]1O
628	Br[C@@H](c1ccccc1)[C@H](Br)c1ccccc1
629	BrCCOCCBr
630	Brc1ccc(Br)o1
631	Brc1ccc2[nH]c3ccc(Br)cc3c2c1
632	Brc1ccccc1Br
633	Brc1ccc(C#Cc2ccc(Br)cc2)cc1
635	Brc1ccccc1SSc1ccccc1Br
636	Br[C@H]1CCC[C@H]1Br
637	O[C@@H](Br)CBr
638	Brc1ccc(/C=C/c2ccc(Br)cc2)cc1
639	C[C@@](Br)(CBr)C(F)(F)F
640	Brc1cc2sc(Br)cc2s1
641	COc1cc(Br)c(OC)cc1Br
642	Br[C@H]1CC=CC[C@H]1Br
643	CC(C)[C@@H](Br)CBr
644	Br[C@H]1CC[C@@H](Br)CC1
645	Cc1cc(C)c([C@H](Br)[C@@H](Br)c2c(C)cc(C)cc2C)c(C)c1
646	Br[C@H]1CN(Cc2ccccc2)C[C@H]1Br
647	O=C1C[C@@H](Br)[C@@H](Br)C[C@H]1Br
648	Brc1ccc2ccc3ccc(Br)nc3c2n1
649	N#C/C1=C/c2cc(C=O)cc(c2)/C(C#N)=C\\c2cc(C=O)cc(c2)/C(C#N)=C\\c2cc(C=O)cc(c2)/C(C#N)=C\\c2cc(C=O)cc(c2)/C(C#N)=C\\c2cc(C=O)cc1c2
650	N#C/C1=C/c2cc(I)cc(c2)/C(C#N)=C\\c2cc(I)cc(c2)/C(C#N)=C\\c2cc(I)cc(c2)/C(C#N)=C\\c2cc(I)cc(c2)/C(C#N)=C\\c2cc(I)cc1c2
651	OCc1cc2c(cc1CO)C1c3cc(CO)c(CO)cc3C2c2cc(CO)c(CO)cc21
652	OCc1ccc(N(c2ccc(CO)cc2)c2ccc(CO)cc2)cc1
653	OCCCCN(CCCCO)CCCCO
654	C[Si](c1ccc(CO)cc1)(c1ccc(CO)cc1)c1ccc(CO)cc1
655	OCc1ccc(C(c2ccc(CO)cc2)c2ccc(CO)cc2)cc1
656	Cc1c(CO)c(C)c(CO)c(C)c1CO
657	OCc1ccc(-c2ccc(-c3cc(-c4ccc(-c5ccc(CO)cc5)cc4)cc(-c4ccc(-c5ccc(CO)cc5)cc4)c3)cc2)cc1
658	OCc1ccc(N2CN(c3ccc(CO)cc3)CN(c3ccc(CO)cc3)C2)cc1
659	OCc1ccc(C#Cc2ccc(C(c3ccc(C#Cc4ccc(CO)cc4)cc3)c3ccc(C#Cc4ccc(CO)cc4)cc3)cc2)cc1
660	OCc1ccc2c(c1)C1c3cc(CO)ccc3C2c2ccc(CO)cc21
661	O=C(Nc1ccc(CO)cc1)c1cc(C(=O)Nc2ccc(CO)cc2)cc(C(=O)Nc2ccc(CO)cc2)c1
662	OCc1ccc(C=c2c3ccc4c(=Cc5ccc(CO)cc5)c5ccc6c(=Cc7ccc(CO)cc7)c7ccc2c2c3c4c5c6c72)cc1
663	OCc1ccc(-c2ccc(C(c3ccc(-c4ccc(CO)cc4)cc3)c3ccc(-c4ccc(CO)cc4)cc3)cc2)cc1
664	OCc1ccc(C#Cc2ccc(C34CC5CC(c6ccc(C#Cc7ccc(CO)cc7)cc6)(C3)CC(c3ccc(C#Cc6ccc(CO)cc6)cc3)(C5)C4)cc2)cc1
665	CCCCCCCCCCCCCCc1ccc(C(c2ccc(CO)cc2)(c2ccc(CO)cc2)c2ccc(CO)cc2)cc1
666	OCc1ccc(C#Cc2cc(C#Cc3ccc(CO)cc3)cc(C#Cc3ccc(CO)cc3)c2)cc1
667	OCc1ccc(-c2nc(-c3ccc(CO)cc3)c(-c3ccc(CO)cc3)[nH]2)cc1
668	OCc1cc(CO)cc(CO)c1
669	OCc1ccc(-c2cc(-c3ccc(CO)cc3)cc(-c3ccc(CO)cc3)c2)cc1
670	OCc1ccc(-c2ccc(C34CC5CC(c6ccc(-c7ccc(CO)cc7)cc6)(C3)CC(c3ccc(-c6ccc(CO)cc6)cc3)(C5)C4)cc2)cc1
671	OCc1ccc(CN(Cc2ccc(CO)cc2)Cc2ccc(CO)cc2)cc1
672	O=C(c1ccc(CO)cc1)c1cc(C(=O)c2ccc(CO)cc2)cc(C(=O)c2ccc(CO)cc2)c1
673	CCCCOc1c(CCO)c(OCCCC)c(CCO)c(OCCCC)c1CCO
674	OC[C@H]1C[C@H](CO)C[C@@H](CO)C1
675	OCc1ccc(C23CC4CC(c5ccc(CO)cc5)(C2)CC(c2ccc(CO)cc2)(C4)C3)cc1
676	OCCCN(CCCO)CCCO
677	OCc1ccc(-c2cc(-c3ccc(CO)cc3)nc(-c3ccc(CO)cc3)c2)cc1
678	OCc1ccc(N2COc3c(c4c(c5c3CN(c3ccc(CO)cc3)CO5)CN(c3ccc(CO)cc3)CO4)C2)cc1
679	OCc1ccc(B2OB(c3ccc(CO)cc3)OB(c3ccc(CO)cc3)O2)cc1
680	Cc1c(CCO)c(C)c(CCO)c(C)c1CCO
681	CCCCCCc1c(-c2ccc(CO)cc2)c(CCCCCC)c(-c2ccc(CO)cc2)c(CCCCCC)c1-c1ccc(CO)cc1
682	CCc1c(CCO)c(CC)c(CCO)c(CC)c1CCO
683	Oc1cc(O)c2cc1[C@H](c1ccc(Cl)cc1)c1cc(c(O)cc1O)[C@H](c1ccc(Cl)cc1)c1cc(c(O)cc1O)[C@@H](c1ccc(Cl)cc1)c1cc(c(O)cc1O)[C@H]2c1ccc(Cl)cc1
684	Oc1ccc(CCc2ccc(O)c(Br)c2)cc1Br
685	COc1c(Br)cc(C(C)(C)C)cc1Br
686	Brc1cccc2cc3cccc(Br)c3cc12
687	OB(O)c1cc(Br)cc(Br)c1
688	Brc1ccc(-c2cccc3cccc(-c4ccc(Br)cc4)c23)cc1
689	COc1cc(C#Cc2cc(Br)cc(Br)c2)cc(C#Cc2cc(Br)cc(Br)c2)c1
690	Brc1cccc(Br)n1
691	OCc1ccc([C@H]2c3cc(c(O)cc3O)[C@H](c3ccc(CO)cc3)c3cc(c(O)cc3O)[C@H](c3ccc(CO)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(CO)cc3)c3cc2c(O)cc3O)cc1
692	Clc1c(C#Cc2ccccc2)c(Cl)c(C#Cc2ccccc2)c(Cl)c1C#Cc1ccccc1
693	ClN1CN(Cl)CN(Cl)C1
694	CCC(c1ccc(C#Cc2ccc(Cl)cc2)cc1)(c1ccc(C#Cc2ccc(Cl)cc2)cc1)c1ccc(C#Cc2ccc(Cl)cc2)cc1
695	Clc1ccc(C=c2c3ccc4c(=Cc5ccc(Cl)cc5)c5ccc6c(=Cc7ccc(Cl)cc7)c7ccc2c2c3c4c5c6c72)cc1
696	Oc1c(Cl)cc(Cl)cc1Cl
697	CCC(c1ccc(Cl)cc1)(c1ccc(Cl)cc1)c1ccc(Cl)cc1
698	Cc1c(Cl)cc(Cl)c(C)c1Cl
699	Cc1c(Cl)cc(Cl)cc1Cl
700	Oc1c(Cl)c(O)c(Cl)c(O)c1Cl
701	CC12[C@]3(C)c4ccc(Cl)cc4[C@@]1(C)c1ccc(Cl)cc1[C@@]2(C)c1ccc(Cl)cc13
702	Clc1ccc2[nH]c3c(c2c1)c1[nH]c2ccc(Cl)cc2c1c1[nH]c2ccc(Cl)cc2c31
703	Clc1ccc2c(Cl)cc(Cl)cc2c1
704	Clc1cc(Cl)nc(Cl)c1
705	CCC(c1ccc(-c2ccc(Cl)cc2)cc1)(c1ccc(-c2ccc(Cl)cc2)cc1)c1ccc(-c2ccc(Cl)cc2)cc1
706	Cl[C@H]1O[C@H](Cl)O[C@@H](Cl)O1
707	Oc1ccc(C#Cc2cc(C#Cc3ccc(O)c(Cl)c3)cc(C#Cc3ccc(O)c(Cl)c3)c2)cc1Cl
708	Fc1c(Cl)cc(Cl)c(F)c1Cl
709	Clc1cc(Cl)c2cccc(Cl)c2c1
710	Oc1c(Cl)ccc2c1C1c3c(ccc(Cl)c3O)C2c2ccc(Cl)c(O)c21
711	Oc1c(Cl)cc(Cl)c(O)c1Cl
712	Clc1cc(Cl)nc(Cl)n1
713	N[C@H]1C[C@@H](N)C[C@@H](N)C1
714	Oc1ccc(CCc2ccc(O)c(I)c2)cc1I
715	Ic1ccc2c(ccc3cc(I)ccc32)c1
716	Ic1ccc(I)o1
717	Ic1ccc(-c2ccc(I)cn2)nc1
718	COc1c(I)cc(C(C)(C)C)cc1I
719	Ic1cccc2cc3cccc(I)c3cc12
720	OB(O)c1cc(I)cc(I)c1
721	Ic1ccc(-c2cccc3cccc(-c4ccc(I)cc4)c23)cc1
722	Ic1ccc(C#Cc2cccc(C#Cc3ccc(I)cc3)c2)cc1
723	Ic1ccc(N(c2ccccc2)c2ccc(I)cc2)cc1
724	Ic1ccc(Oc2ccc(I)cc2)cc1
725	COc1cc(C#Cc2cc(Br)cc(I)c2)cc(C#Cc2cc(Br)cc(I)c2)c1
726	Ic1ccc2c(c1)[C@H]1c3ccccc3[C@@H]2c2ccc(I)cc21
727	Ic1cc2ccc3cc(I)cc4ccc(c1)c2c34
728	Ic1ccc2ccc3ccc(I)nc3c2n1
729	Ic1cccc(I)n1
730	Oc1ccc(CCc2ccc(O)c(Cl)c2)cc1Cl
731	COc1c(Cl)cc(C(C)(C)C)cc1Cl
732	Clc1cccc2cc3cccc(Cl)c3cc12
733	OB(O)c1cc(Cl)cc(Cl)c1
734	Clc1ccc(-c2cccc3cccc(-c4ccc(Cl)cc4)c23)cc1
735	COc1cc(C#Cc2cc(Cl)cc(Br)c2)cc(C#Cc2cc(Cl)cc(Br)c2)c1
736	Clc1cccc(Cl)n1
737	OCc1cc2ccc3cc(CO)cc4ccc(c1)c2c34
738	OCCc1ccc2ccc(CCO)cc2c1
739	CC(C)(CO)CCO
740	OCC[C@H]1CC[C@H](CCO)C1
741	OCC(CO)C(CO)CO
742	OCc1ccc(N(c2ccccc2)c2ccc(CO)cc2)cc1
743	OCc1ccc(-c2ccc(C34CC5(c6ccc(-c7ccc(CO)cc7)cc6)C[C@H](C3)C[C@H](C4)C5)cc2)cc1
744	CCCCC[C@@H](CO)[C@H](CO)CCCCC
745	C[C@H](CO)C(O)=N[C@@H]1CCCC[C@H]1N=C(O)[C@H](C)CO
746	OCc1ccc(C#Cc2cccc(C#Cc3ccc(CO)cc3)c2)cc1
747	OCc1cccc(CO)c1
748	OCc1c2ccccc2c(CO)c2ccccc12
749	OCc1ccc(CO)cc1
750	OCCc1cccc(CCO)c1
751	OC[C@H]1C[C@@H](Br)[C@H](O)C[C@H]1CO
752	OCc1ccc(-c2cccc(-c3ccc(CO)cc3)c2)cc1
753	OCc1ccc(C#Cc2ccc(C#Cc3ccc(CO)cc3)cc2)cc1
754	OCc1ccc(CO)[nH]1
755	OCc1ccc(/N=N/c2ccc(CO)cc2)cc1
756	C[C@H](CO)C(O)=NCCN=C(O)[C@H](C)CO
757	OCCCCO
758	OCc1cnc2c(ccc3cc(CO)cnc32)c1
759	OCCCCCCCO
760	OCc1ccc2c(ccc3cc(CO)ccc32)c1
761	CC[C@H](C)[C@H](CO)C(O)=NCCN=C(O)[C@H](C)CO
762	OCc1ccc(-c2ccc(CO)cc2)cc1
763	OCc1ccc(Cc2ccc(CO)cc2)cc1
764	OCc1ccc(-c2ccc(-c3ccc(CO)cc3)cc2)cc1
765	OC[C@@H](c1cccc2ccccc12)[C@@H](CO)c1cccc2ccccc12
766	OCc1ccc(-c2ccc(CO)cn2)nc1
767	OCCCNCCCO
768	OCc1ccc2ccc3ccc(CO)cc3c2c1
769	OC[C@H](c1ccc(F)cc1)[C@@H](CO)c1ccc(F)cc1
770	OCCCCCCO
771	OCCc1ccc(CCO)cc1
772	CC(C)(CO)C(C)(C)CO
773	OC[C@H]1CCC[C@@H](CO)C1
774	OCc1ccc(-c2ccc(CO)c(Cl)c2)cc1Cl
775	OC[C@@H]1CN(Cc2ccccc2)C[C@H]1CO
776	OCCCCCO
777	N#Cc1ccc([C@H](CO)[C@@H](CO)c2ccc(C#N)cc2)cc1
778	C[C@H](CO)CCCCO
779	OCc1ccc2c(c1)[C@H]1c3ccccc3[C@@H]2c2ccc(CO)cc21
780	OC[C@H]1C[C@@H](Br)[C@H](Br)C[C@H]1CO
781	C[C@H](CO)CCO
782	OC[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1CO
783	OCc1ccc(CO)s1
784	OCc1ccc(CCc2ccc(CO)cc2)cc1
785	O=C1C[C@@H](c2ccc(CO)cc2)N1c1ccc(CO)cc1
786	OC[C@@H](CS)[C@H](CO)CS
787	OCc1ccc(Sc2ccc(CO)cc2)cc1
788	OC[C@H]1CCCC[C@H]1CO
789	OCc1ccc(C23CC4(c5ccc(CO)cc5)C[C@H](C2)C[C@H](C3)C4)cc1
790	OC[C@@H]1CNC[C@@H]1CO
791	OCC[C@H](CO)C(F)(F)F
792	C[C@H](CO)C(O)=NCCN=C(O)[C@@H](CO)c1ccccc1
793	O=C1C[C@@H](CO)[C@@H](CO)C[C@H]1O
794	OCc1ccc(-c2ccc(-c3ccc(-c4ccc(CO)cc4)cc3)cc2)cc1
795	OC[C@H]1COCCOCCOCCOCCOC[C@@H]1CO
796	OCCCOCCOCCCO
797	OC[C@H]1C=CC=C[C@H]1CO
798	OC[C@@H]1CSSC[C@H]1CO
799	OCCc1ccc2ccc3ccc(CCO)nc3c2n1
800	CCOC(=O)[C@@H](CO)CCO
801	OCc1ccc(Oc2ccc(CO)cc2)cc1
802	C[C@@H]1C[C@H](CO)[C@H](CO)C[C@H]1C
803	OCc1cc2cc(CO)sc2s1
804	OC[C@H]1CCCC[C@@H]1CO
805	OC[C@H]1C[C@@H](O)[C@H](O)C[C@H]1CO
806	OC[C@H](c1ccccc1)[C@@H](CO)c1ccccc1
807	OCCCOCCCO
808	OCc1ccc(CO)o1
809	OCc1ccc2[nH]c3ccc(CO)cc3c2c1
810	OCc1ccccc1CO
811	OCc1ccc(C#Cc2ccc(CO)cc2)cc1
812	CC[C@@H](CO)CCO
813	OCc1ccccc1SSc1ccccc1CO
814	OC[C@H]1CCC[C@H]1CO
815	OCC[C@@H](O)CO
816	OCc1ccc(/C=C/c2ccc(CO)cc2)cc1
817	C[C@@](CO)(CCO)C(F)(F)F
818	OCc1cc2sc(CO)cc2s1
819	COc1cc(CO)c(OC)cc1CO
820	OC[C@H]1CC=CC[C@H]1CO
821	CC(C)[C@@H](CO)CCO
822	OC[C@H]1CC[C@@H](CO)CC1
823	Cc1cc(C)c([C@H](CO)[C@@H](CO)c2c(C)cc(C)cc2C)c(C)c1
824	OC[C@@H]1CN(Cc2ccccc2)C[C@@H]1CO
825	O=C1C[C@@H](CO)[C@@H](CO)C[C@H]1Br
826	OCc1ccc2ccc3ccc(CO)nc3c2n1
827	Nc1c(C#Cc2ccccc2)c(N)c(C#Cc2ccccc2)c(N)c1C#Cc1ccccc1
828	NN1CN(N)CN(N)C1
829	CCC(c1ccc(C#Cc2ccc(N)cc2)cc1)(c1ccc(C#Cc2ccc(N)cc2)cc1)c1ccc(C#Cc2ccc(N)cc2)cc1
830	Nc1cc(N)c(O)c(N)c1
831	CCC(c1ccc(N)cc1)(c1ccc(N)cc1)c1ccc(N)cc1
832	Cc1c(N)cc(N)c(C)c1N
833	Cc1c(N)cc(N)cc1N
834	Nc1c(O)c(N)c(O)c(N)c1O
835	CC12[C@]3(C)c4ccc(N)cc4[C@@]1(C)c1ccc(N)cc1[C@@]2(C)c1ccc(N)cc13
836	Nc1ccc2[nH]c3c(c2c1)c1[nH]c2ccc(N)cc2c1c1[nH]c2ccc(N)cc2c31
837	Nc1ccc2c(N)cc(N)cc2c1
838	N=c1cc(N)cc(N)[nH]1
839	CCC(c1ccc(-c2ccc(N)cc2)cc1)(c1ccc(-c2ccc(N)cc2)cc1)c1ccc(-c2ccc(N)cc2)cc1
840	N[C@H]1O[C@H](N)O[C@@H](N)O1
841	Nc1cc(C#Cc2cc(C#Cc3ccc(O)c(N)c3)cc(C#Cc3ccc(O)c(N)c3)c2)ccc1O
842	Nc1cc(N)c(F)c(N)c1F
843	Nc1cc(N)c2cccc(N)c2c1
844	Nc1ccc2c(c1O)C1c3c(ccc(N)c3O)C2c2ccc(N)c(O)c21
845	Nc1cc(N)c(O)c(N)c1O
846	N=c1cc(N)[nH]c(=N)[nH]1
847	Brc1ccc(-c2cc(-c3ccc(Br)cc3)nc(-c3ccc(Br)cc3)c2)cc1
848	Brc1c(C#Cc2ccccc2)c(Br)c(C#Cc2ccccc2)c(Br)c1C#Cc1ccccc1
849	BrN1CN(Br)CN(Br)C1
850	O=C(c1ccc(Br)cc1)c1cc(C(=O)c2ccc(Br)cc2)cc(C(=O)c2ccc(Br)cc2)c1
851	CCC(c1ccc(C#Cc2ccc(Br)cc2)cc1)(c1ccc(C#Cc2ccc(Br)cc2)cc1)c1ccc(C#Cc2ccc(Br)cc2)cc1
852	Brc1ccc(C=c2c3ccc4c(=Cc5ccc(Br)cc5)c5ccc6c(=Cc7ccc(Br)cc7)c7ccc2c2c3c4c5c6c72)cc1
853	Brc1ccc2c(c1)C1c3cc(Br)ccc3C2c2ccc(Br)cc21
854	Cc1c(Br)c(C)c(Br)c(C)c1Br
855	Oc1c(Br)cc(Br)cc1Br
856	Brc1ccc(-c2ccc(C34CC5CC(c6ccc(-c7ccc(Br)cc7)cc6)(C3)CC(c3ccc(-c6ccc(Br)cc6)cc3)(C5)C4)cc2)cc1
857	C[Si](c1ccc(Br)cc1)(c1ccc(Br)cc1)c1ccc(Br)cc1
858	CCC(c1ccc(Br)cc1)(c1ccc(Br)cc1)c1ccc(Br)cc1
859	Brc1ccc(N(c2ccc(Br)cc2)c2ccc(Br)cc2)cc1
968	O=C(O)C[C@H](O)C(=O)O
860	O=C(Nc1ccc(Br)cc1)c1cc(C(=O)Nc2ccc(Br)cc2)cc(C(=O)Nc2ccc(Br)cc2)c1
861	Cc1c(Br)cc(Br)c(C)c1Br
862	Cc1c(Br)cc(Br)cc1Br
863	Brc1ccc(C#Cc2ccc(C(c3ccc(C#Cc4ccc(Br)cc4)cc3)c3ccc(C#Cc4ccc(Br)cc4)cc3)cc2)cc1
864	Brc1ccc(C23CC4CC(c5ccc(Br)cc5)(C2)CC(c2ccc(Br)cc2)(C4)C3)cc1
865	Oc1c(Br)c(O)c(Br)c(O)c1Br
866	CC12[C@]3(C)c4ccc(Br)cc4[C@@]1(C)c1ccc(Br)cc1[C@@]2(C)c1ccc(Br)cc13
867	Brc1ccc2[nH]c3c(c2c1)c1[nH]c2ccc(Br)cc2c1c1[nH]c2ccc(Br)cc2c31
868	Brc1ccc(C(c2ccc(Br)cc2)c2ccc(Br)cc2)cc1
869	Brc1ccc2c(Br)cc(Br)cc2c1
870	Brc1cc(Br)nc(Br)c1
871	Brc1cc(Br)cc(Br)c1
872	Brc1ccc(N2COc3c(c4c(c5c3CN(c3ccc(Br)cc3)CO5)CN(c3ccc(Br)cc3)CO4)C2)cc1
873	Brc1ccc(N2CN(c3ccc(Br)cc3)CN(c3ccc(Br)cc3)C2)cc1
874	CCC(c1ccc(-c2ccc(Br)cc2)cc1)(c1ccc(-c2ccc(Br)cc2)cc1)c1ccc(-c2ccc(Br)cc2)cc1
875	Brc1ccc(C#Cc2ccc(C34CC5CC(c6ccc(C#Cc7ccc(Br)cc7)cc6)(C3)CC(c3ccc(C#Cc6ccc(Br)cc6)cc3)(C5)C4)cc2)cc1
876	Br[C@H]1O[C@H](Br)O[C@@H](Br)O1
877	Brc1ccc(C#Cc2cc(C#Cc3ccc(Br)cc3)cc(C#Cc3ccc(Br)cc3)c2)cc1
878	Oc1ccc(C#Cc2cc(C#Cc3ccc(O)c(Br)c3)cc(C#Cc3ccc(O)c(Br)c3)c2)cc1Br
879	Brc1ccc(-c2ccc(C(c3ccc(-c4ccc(Br)cc4)cc3)c3ccc(-c4ccc(Br)cc4)cc3)cc2)cc1
880	Fc1c(Br)cc(Br)c(F)c1Br
881	Brc1ccc(-c2nc(-c3ccc(Br)cc3)c(-c3ccc(Br)cc3)[nH]2)cc1
882	Brc1cc(Br)c2cccc(Br)c2c1
883	Oc1c(Br)ccc2c1C1c3c(ccc(Br)c3O)C2c2ccc(Br)c(O)c21
884	Oc1c(Br)cc(Br)c(O)c1Br
885	Brc1ccc(B2OB(c3ccc(Br)cc3)OB(c3ccc(Br)cc3)O2)cc1
886	Brc1ccc(-c2ccc(-c3cc(-c4ccc(-c5ccc(Br)cc5)cc4)cc(-c4ccc(-c5ccc(Br)cc5)cc4)c3)cc2)cc1
887	Brc1cc(Br)nc(Br)n1
888	Brc1ccc(-c2cc(-c3ccc(Br)cc3)cc(-c3ccc(Br)cc3)c2)cc1
889	Brc1ccc(CN(Cc2ccc(Br)cc2)Cc2ccc(Br)cc2)cc1
890	O=C(O)c1cc2ccc3cc(C(=O)O)cc4ccc(c1)c2c34
891	O=C(O)Cc1ccc2ccc(CC(=O)O)cc2c1
892	CC(C)(CC(=O)O)C(=O)O
893	O=C(O)C[C@H]1CC[C@@H](CC(=O)O)C1
894	O=C(O)[C@H](CO)[C@H](CO)C(=O)O
895	O=C(O)c1ccc(N(c2ccccc2)c2ccc(C(=O)O)cc2)cc1
896	O=C(O)c1ccc(-c2ccc(C34CC5(c6ccc(-c7ccc(C(=O)O)cc7)cc6)C[C@H](C3)C[C@H](C4)C5)cc2)cc1
897	CCCCC[C@@H](C(=O)O)[C@@H](CCCCC)C(=O)O
898	C[C@H](C(=O)O)C(O)=N[C@@H]1CCCC[C@H]1N=C(O)[C@H](C)C(=O)O
899	O=C(O)c1ccc(C#Cc2cccc(C#Cc3ccc(C(=O)O)cc3)c2)cc1
900	O=C(O)c1cccc(C(=O)O)c1
901	O=C(O)c1c2ccccc2c(C(=O)O)c2ccccc12
902	O=C(O)c1ccc(C(=O)O)cc1
903	O=C(O)Cc1cccc(CC(=O)O)c1
904	O=C(O)[C@H]1C[C@@H](Br)[C@H](O)C[C@H]1C(=O)O
905	O=C(O)c1ccc(-c2cccc(-c3ccc(C(=O)O)cc3)c2)cc1
906	O=C(O)c1ccc(C#Cc2ccc(C#Cc3ccc(C(=O)O)cc3)cc2)cc1
907	O=C(O)c1ccc(C(=O)O)[nH]1
908	O=C(O)c1ccc(/N=N/c2ccc(C(=O)O)cc2)cc1
909	C[C@H](C(=O)O)C(O)=NCCN=C(O)[C@H](C)C(=O)O
910	O=C(O)CCC(=O)O
911	O=C(O)c1cnc2c(ccc3cc(C(=O)O)cnc32)c1
912	O=C(O)CCCCCC(=O)O
913	O=C(O)c1ccc2c(ccc3cc(C(=O)O)ccc32)c1
914	CC[C@@H](C)[C@H](C(=O)O)C(O)=NCCN=C(O)[C@H](C)C(=O)O
915	O=C(O)c1ccc(-c2ccc(C(=O)O)cc2)cc1
916	O=C(O)c1ccc(Cc2ccc(C(=O)O)cc2)cc1
917	O=C(O)c1ccc(-c2ccc(-c3ccc(C(=O)O)cc3)cc2)cc1
918	O=C(O)[C@@H](c1cccc2ccccc12)[C@@H](C(=O)O)c1cccc2ccccc12
919	O=C(O)c1ccc(-c2ccc(C(=O)O)cn2)nc1
920	O=C(O)CCNCCC(=O)O
921	O=C(O)c1ccc2ccc3ccc(C(=O)O)cc3c2c1
922	O=C(O)[C@H](c1ccc(F)cc1)[C@@H](C(=O)O)c1ccc(F)cc1
923	O=C(O)CCCCC(=O)O
924	O=C(O)Cc1ccc(CC(=O)O)cc1
925	CC(C)(C(=O)O)C(C)(C)C(=O)O
926	O=C(O)[C@H]1CCC[C@@H](C(=O)O)C1
927	O=C(O)c1ccc(-c2ccc(C(=O)O)c(Cl)c2)cc1Cl
928	O=C(O)[C@H]1CN(Cc2ccccc2)C[C@@H]1C(=O)O
929	O=C(O)CCCC(=O)O
930	N#Cc1ccc([C@H](C(=O)O)[C@@H](C(=O)O)c2ccc(C#N)cc2)cc1
931	C[C@@H](CCCC(=O)O)C(=O)O
932	O=C(O)c1ccc2c(c1)[C@H]1c3ccccc3[C@@H]2c2ccc(C(=O)O)cc21
933	O=C(O)[C@H]1C[C@@H](Br)[C@H](Br)C[C@H]1C(=O)O
934	C[C@H](CC(=O)O)C(=O)O
935	O=C(O)[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1C(=O)O
936	O=C(O)c1ccc(C(=O)O)s1
937	O=C(O)c1ccc(CCc2ccc(C(=O)O)cc2)cc1
938	O=C(O)c1ccc([C@@H]2CC(=O)N2c2ccc(C(=O)O)cc2)cc1
939	O=C(O)[C@@H](CS)[C@@H](CS)C(=O)O
940	O=C(O)c1ccc(Sc2ccc(C(=O)O)cc2)cc1
941	O=C(O)[C@H]1CCCC[C@H]1C(=O)O
942	O=C(O)c1ccc(C23CC4(c5ccc(C(=O)O)cc5)C[C@H](C2)C[C@H](C3)C4)cc1
943	O=C(O)[C@@H]1CNC[C@@H]1C(=O)O
944	O=C(O)C[C@H](C(=O)O)C(F)(F)F
945	C[C@H](C(=O)O)C(O)=NCCN=C(O)[C@@H](C(=O)O)c1ccccc1
946	O=C(O)[C@H]1C[C@@H](O)C(=O)C[C@H]1C(=O)O
947	O=C(O)c1ccc(-c2ccc(-c3ccc(-c4ccc(C(=O)O)cc4)cc3)cc2)cc1
948	O=C(O)[C@H]1COCCOCCOCCOCCOC[C@@H]1C(=O)O
949	O=C(O)CCOCCOCCC(=O)O
950	O=C(O)[C@H]1C=CC=C[C@H]1C(=O)O
951	O=C(O)[C@@H]1CSSC[C@H]1C(=O)O
952	O=C(O)Cc1ccc2ccc3ccc(CC(=O)O)nc3c2n1
953	CCOC(=O)[C@@H](CC(=O)O)C(=O)O
954	O=C(O)c1ccc(Oc2ccc(C(=O)O)cc2)cc1
955	C[C@@H]1C[C@H](C(=O)O)[C@H](C(=O)O)C[C@H]1C
956	O=C(O)c1cc2cc(C(=O)O)sc2s1
957	O=C(O)[C@H]1CCCC[C@@H]1C(=O)O
958	O=C(O)[C@H]1C[C@@H](O)[C@H](O)C[C@H]1C(=O)O
959	O=C(O)[C@H](c1ccccc1)[C@@H](C(=O)O)c1ccccc1
960	O=C(O)CCOCCC(=O)O
961	O=C(O)c1ccc(C(=O)O)o1
962	O=C(O)c1ccc2[nH]c3ccc(C(=O)O)cc3c2c1
963	O=C(O)c1ccccc1C(=O)O
964	O=C(O)c1ccc(C#Cc2ccc(C(=O)O)cc2)cc1
965	CC[C@H](CC(=O)O)C(=O)O
966	O=C(O)c1ccccc1SSc1ccccc1C(=O)O
967	O=C(O)[C@H]1CCC[C@H]1C(=O)O
969	O=C(O)c1ccc(/C=C/c2ccc(C(=O)O)cc2)cc1
970	C[C@](CC(=O)O)(C(=O)O)C(F)(F)F
971	O=C(O)c1cc2sc(C(=O)O)cc2s1
972	COc1cc(C(=O)O)c(OC)cc1C(=O)O
973	O=C(O)[C@H]1CC=CC[C@H]1C(=O)O
974	CC(C)[C@H](CC(=O)O)C(=O)O
975	O=C(O)[C@H]1CC[C@@H](C(=O)O)CC1
976	Cc1cc(C)c([C@H](C(=O)O)[C@@H](C(=O)O)c2c(C)cc(C)cc2C)c(C)c1
977	O=C(O)[C@@H]1CN(Cc2ccccc2)C[C@@H]1C(=O)O
978	O=C(O)[C@H]1C[C@@H](Br)C(=O)C[C@H]1C(=O)O
979	O=C(O)c1ccc2ccc3ccc(C(=O)O)nc3c2n1
980	O=Cc1ccc(-c2cc(-c3ccc(C=O)cc3)nc(-c3ccc(C=O)cc3)c2)cc1
981	O=Cc1c(C#Cc2ccccc2)c(C=O)c(C#Cc2ccccc2)c(C=O)c1C#Cc1ccccc1
982	O=CN1CN(C=O)CN(C=O)C1
983	O=Cc1ccc(C(=O)c2cc(C(=O)c3ccc(C=O)cc3)cc(C(=O)c3ccc(C=O)cc3)c2)cc1
984	CCC(c1ccc(C#Cc2ccc(C=O)cc2)cc1)(c1ccc(C#Cc2ccc(C=O)cc2)cc1)c1ccc(C#Cc2ccc(C=O)cc2)cc1
985	O=Cc1ccc(C=c2c3ccc4c(=Cc5ccc(C=O)cc5)c5ccc6c(=Cc7ccc(C=O)cc7)c7ccc2c2c3c4c5c6c72)cc1
986	O=Cc1ccc2c(c1)C1c3cc(C=O)ccc3C2c2ccc(C=O)cc21
987	Cc1c(C=O)c(C)c(C=O)c(C)c1C=O
988	O=Cc1cc(C=O)c(O)c(C=O)c1
989	O=Cc1ccc(-c2ccc(C34CC5CC(c6ccc(-c7ccc(C=O)cc7)cc6)(C3)CC(c3ccc(-c6ccc(C=O)cc6)cc3)(C5)C4)cc2)cc1
990	C[Si](c1ccc(C=O)cc1)(c1ccc(C=O)cc1)c1ccc(C=O)cc1
991	CCC(c1ccc(C=O)cc1)(c1ccc(C=O)cc1)c1ccc(C=O)cc1
992	O=Cc1ccc(N(c2ccc(C=O)cc2)c2ccc(C=O)cc2)cc1
993	O=Cc1ccc(NC(=O)c2cc(C(=O)Nc3ccc(C=O)cc3)cc(C(=O)Nc3ccc(C=O)cc3)c2)cc1
994	Cc1c(C=O)cc(C=O)c(C)c1C=O
995	Cc1c(C=O)cc(C=O)cc1C=O
996	O=Cc1ccc(C#Cc2ccc(C(c3ccc(C#Cc4ccc(C=O)cc4)cc3)c3ccc(C#Cc4ccc(C=O)cc4)cc3)cc2)cc1
997	O=Cc1ccc(C23CC4CC(c5ccc(C=O)cc5)(C2)CC(c2ccc(C=O)cc2)(C4)C3)cc1
998	O=Cc1c(O)c(C=O)c(O)c(C=O)c1O
999	CC12[C@]3(C)c4ccc(C=O)cc4[C@@]1(C)c1ccc(C=O)cc1[C@@]2(C)c1ccc(C=O)cc13
1000	O=Cc1ccc2[nH]c3c(c2c1)c1[nH]c2ccc(C=O)cc2c1c1[nH]c2ccc(C=O)cc2c31
1001	O=Cc1ccc(C(c2ccc(C=O)cc2)c2ccc(C=O)cc2)cc1
1002	O=Cc1ccc2c(C=O)cc(C=O)cc2c1
1003	O=Cc1cc(C=O)nc(C=O)c1
1004	O=Cc1cc(C=O)cc(C=O)c1
1005	O=Cc1ccc(N2COc3c(c4c(c5c3CN(c3ccc(C=O)cc3)CO5)CN(c3ccc(C=O)cc3)CO4)C2)cc1
1006	O=Cc1ccc(N2CN(c3ccc(C=O)cc3)CN(c3ccc(C=O)cc3)C2)cc1
1007	CCC(c1ccc(-c2ccc(C=O)cc2)cc1)(c1ccc(-c2ccc(C=O)cc2)cc1)c1ccc(-c2ccc(C=O)cc2)cc1
1008	O=Cc1ccc(C#Cc2ccc(C34CC5CC(c6ccc(C#Cc7ccc(C=O)cc7)cc6)(C3)CC(c3ccc(C#Cc6ccc(C=O)cc6)cc3)(C5)C4)cc2)cc1
1009	O=C[C@H]1O[C@H](C=O)O[C@@H](C=O)O1
1010	O=Cc1ccc(C#Cc2cc(C#Cc3ccc(C=O)cc3)cc(C#Cc3ccc(C=O)cc3)c2)cc1
1011	O=Cc1cc(C#Cc2cc(C#Cc3ccc(O)c(C=O)c3)cc(C#Cc3ccc(O)c(C=O)c3)c2)ccc1O
1012	O=Cc1ccc(-c2ccc(C(c3ccc(-c4ccc(C=O)cc4)cc3)c3ccc(-c4ccc(C=O)cc4)cc3)cc2)cc1
1013	O=Cc1cc(C=O)c(F)c(C=O)c1F
1014	O=Cc1ccc(-c2nc(-c3ccc(C=O)cc3)c(-c3ccc(C=O)cc3)[nH]2)cc1
1015	O=Cc1cc(C=O)c2cccc(C=O)c2c1
1016	O=Cc1ccc2c(c1O)C1c3c(ccc(C=O)c3O)C2c2ccc(C=O)c(O)c21
1017	O=Cc1cc(C=O)c(O)c(C=O)c1O
1018	O=Cc1ccc(B2OB(c3ccc(C=O)cc3)OB(c3ccc(C=O)cc3)O2)cc1
1019	O=Cc1ccc(-c2ccc(-c3cc(-c4ccc(-c5ccc(C=O)cc5)cc4)cc(-c4ccc(-c5ccc(C=O)cc5)cc4)c3)cc2)cc1
1020	O=Cc1cc(C=O)nc(C=O)n1
1021	O=Cc1ccc(-c2cc(-c3ccc(C=O)cc3)cc(-c3ccc(C=O)cc3)c2)cc1
1022	O=Cc1ccc(CN(Cc2ccc(C=O)cc2)Cc2ccc(C=O)cc2)cc1
1023	N#C/C1=C\\c2cc(C=O)cc(c2)/C(C#N)=C\\c2cc(C=O)cc(c2)/C(C#N)=C\\c2cc(C=O)cc(c2)/C(C#N)=C\\c2cc(C=O)cc(c2)/C(C#N)=C\\c2cc(C=O)cc1c2
1024	BrCCCN(CCCBr)CCCBr
1025	CCCCCCCCCCCCCCc1ccc(C(c2ccc(Br)cc2)(c2ccc(Br)cc2)c2ccc(Br)cc2)cc1
1026	CCCCOc1c(CBr)c(OCCCC)c(CBr)c(OCCCC)c1CBr
1027	Br[C@H]1C[C@H](Br)C[C@@H](Br)C1
1028	BrCCN(CCBr)CCBr
1029	Cc1c(CBr)c(C)c(CBr)c(C)c1CBr
1030	CCCCCCc1c(-c2ccc(Br)cc2)c(CCCCCC)c(-c2ccc(Br)cc2)c(CCCCCC)c1-c1ccc(Br)cc1
1031	CCc1c(CBr)c(CC)c(CBr)c(CC)c1CBr
1032	Ic1ccc(C(=C(c2ccc(I)cc2)c2ccc(I)cc2)c2ccc(I)cc2)cc1
1033	Ic1cc(I)cc(C#Cc2cc(I)cc(I)c2)c1
1034	Ic1ccc(-c2cc(-c3ccc(I)cc3)c(-c3ccc(I)cc3)cc2-c2ccc(I)cc2)cc1
1035	Ic1ccc(C#Cc2nc(C#Cc3ccc(I)cc3)c(C#Cc3ccc(I)cc3)nc2C#Cc2ccc(I)cc2)cc1
1036	Ic1ccc(-c2nc(-c3ccc(I)cc3)c(-c3ccc(I)cc3)nc2-c2ccc(I)cc2)cc1
1037	Ic1ccc(-c2sc(-c3ccc(I)cc3)c(-c3ccc(I)cc3)c2-c2ccc(I)cc2)cc1
1038	Ic1cc(I)cc(C#Cc2cccc(C#Cc3cc(I)cc(I)c3)c2)c1
1039	O=C1C(c2ccc(I)cc2)=C(c2ccc(I)cc2)C(c2ccc(I)cc2)=C1c1ccc(I)cc1
1040	Ic1cc(I)cc(-c2cc(I)cc(I)c2)c1
1041	Ic1cc(I)c2ccc3c(I)cc(I)c4ccc1c2c43
1042	Ic1cc(I)cc(-c2cccc(-c3cc(I)cc(I)c3)c2)c1
1043	O=C1C(c2ccc(I)cc2)=C(c2ccc(I)cc2)C(=O)C(c2ccc(I)cc2)=C1c1ccc(I)cc1
1044	Ic1ccc(-c2c3nc(c(-c4ccc(I)cc4)c4ccc([nH]4)c(-c4ccc(I)cc4)c4nc(c(-c5ccc(I)cc5)c5ccc2[nH]5)C=C4)C=C3)cc1
1045	Oc1cc(O)c2cc1[C@H](c1ccc(I)cc1)c1cc(c(O)cc1O)[C@H](c1ccc(I)cc1)c1cc(c(O)cc1O)[C@H](c1ccc(I)cc1)c1cc(c(O)cc1O)[C@H]2c1ccc(I)cc1
1046	Ic1cc(I)cc(-c2ccc(-c3cc(I)cc(I)c3)cc2)c1
1047	Oc1ccc(-c2c(-c3ccc(I)cc3)c(-c3ccc(O)cc3)c(-c3ccc(I)cc3)c(-c3ccc(I)cc3)c2-c2ccc(I)cc2)cc1
1048	Ic1ccc(N(c2ccc(I)cc2)c2ccc(-c3ccc(N(c4ccc(I)cc4)c4ccc(I)cc4)cc3)cc2)cc1
1049	Ic1cc(I)cc(C#Cc2ccc(C#Cc3cc(I)cc(I)c3)cc2)c1
1050	Ic1ccc(N(c2ccc(I)cc2)N(c2ccc(I)cc2)c2ccc(I)cc2)cc1
1051	Clc1cc2c(cc1Cl)C1c3cc(Cl)c(Cl)cc3C2c2cc(Cl)c(Cl)cc21
1052	O=Cc1ccc([C@H]2c3cc(c(O)cc3O)[C@H](c3ccc(C=O)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(C=O)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(C=O)cc3)c3cc2c(O)cc3O)cc1
1053	Ic1c(C#Cc2ccccc2)c(I)c(C#Cc2ccccc2)c(I)c1C#Cc1ccccc1
1054	IN1CN(I)CN(I)C1
1055	CCC(c1ccc(C#Cc2ccc(I)cc2)cc1)(c1ccc(C#Cc2ccc(I)cc2)cc1)c1ccc(C#Cc2ccc(I)cc2)cc1
1056	Oc1c(I)cc(I)cc1I
1057	CCC(c1ccc(I)cc1)(c1ccc(I)cc1)c1ccc(I)cc1
1058	Cc1c(I)cc(I)c(C)c1I
1059	Cc1c(I)cc(I)cc1I
1060	Oc1c(I)c(O)c(I)c(O)c1I
1061	CC12[C@]3(C)c4ccc(I)cc4[C@@]1(C)c1ccc(I)cc1[C@@]2(C)c1ccc(I)cc13
1062	Ic1ccc2[nH]c3c(c2c1)c1[nH]c2ccc(I)cc2c1c1[nH]c2ccc(I)cc2c31
1063	Ic1ccc2c(I)cc(I)cc2c1
1064	Ic1cc(I)nc(I)c1
1065	CCC(c1ccc(-c2ccc(I)cc2)cc1)(c1ccc(-c2ccc(I)cc2)cc1)c1ccc(-c2ccc(I)cc2)cc1
1066	I[C@H]1O[C@H](I)O[C@@H](I)O1
1067	Oc1ccc(C#Cc2cc(C#Cc3ccc(O)c(I)c3)cc(C#Cc3ccc(O)c(I)c3)c2)cc1I
1068	Fc1c(I)cc(I)c(F)c1I
1069	Ic1cc(I)c2cccc(I)c2c1
1070	Oc1c(I)ccc2c1C1c3c(ccc(I)c3O)C2c2ccc(I)c(O)c21
1071	Oc1c(I)cc(I)c(O)c1I
1072	Ic1cc(I)nc(I)n1
1073	OCc1c(C#Cc2ccccc2)c(CO)c(C#Cc2ccccc2)c(CO)c1C#Cc1ccccc1
1074	OCN1CN(CO)CN(CO)C1
1075	CCC(c1ccc(C#Cc2ccc(CO)cc2)cc1)(c1ccc(C#Cc2ccc(CO)cc2)cc1)c1ccc(C#Cc2ccc(CO)cc2)cc1
1076	OCc1ccc(C=c2c3ccc4c(=Cc5ccc(CO)cc5)c5ccc6c(=Cc7ccc(CO)cc7)c7ccc2c2c3c4c5c6c72)cc1
1077	OCc1cc(CO)c(O)c(CO)c1
1078	CCC(c1ccc(CO)cc1)(c1ccc(CO)cc1)c1ccc(CO)cc1
1079	Cc1c(CO)cc(CO)c(C)c1CO
1080	Cc1c(CO)cc(CO)cc1CO
1081	OCc1c(O)c(CO)c(O)c(CO)c1O
1082	CC12[C@]3(C)c4ccc(CO)cc4[C@@]1(C)c1ccc(CO)cc1[C@@]2(C)c1ccc(CO)cc13
1083	OCc1ccc2[nH]c3c(c2c1)c1[nH]c2ccc(CO)cc2c1c1[nH]c2ccc(CO)cc2c31
1084	OCc1ccc2c(CO)cc(CO)cc2c1
1085	OCc1cc(CO)nc(CO)c1
1086	CCC(c1ccc(-c2ccc(CO)cc2)cc1)(c1ccc(-c2ccc(CO)cc2)cc1)c1ccc(-c2ccc(CO)cc2)cc1
1087	OC[C@H]1O[C@H](CO)O[C@@H](CO)O1
1088	OCc1cc(C#Cc2cc(C#Cc3ccc(O)c(CO)c3)cc(C#Cc3ccc(O)c(CO)c3)c2)ccc1O
1089	OCc1cc(CO)c(F)c(CO)c1F
1090	OCc1cc(CO)c2cccc(CO)c2c1
1091	OCc1ccc2c(c1O)C1c3c(ccc(CO)c3O)C2c2ccc(CO)c(O)c21
1092	OCc1cc(CO)c(O)c(CO)c1O
1093	OCc1cc(CO)nc(CO)n1
1094	N[C@@H]1C=CC=C[C@H]1N
1095	N[C@@H]1CC(=O)[C@H](Br)C[C@H]1N
1096	N[C@H](c1ccc(F)cc1)[C@H](N)c1ccc(F)cc1
1097	N[C@@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1N
1098	Nc1ccc(/N=N\\c2ccc(N)cc2)cc1
1099	N[C@@H]1COCCOCCOCCOCCOC[C@H]1N
1100	N[C@H]1CC[C@H](N)CC1
1101	NC[C@@H](N)C(F)(F)F
1102	C[C@@H]1C[C@@H](N)[C@H](N)C[C@H]1C
1103	N[C@H]1CN(Cc2ccccc2)C[C@@H]1N
1104	N[C@@H]1CCCC[C@H]1N
1105	NC[C@@H]1CC[C@@H](CN)C1
1106	CC[C@H](N)CN
1107	N[C@@H]1CCC[C@H]1N
1108	CCOC(=O)[C@H](N)CN
1109	N[C@@H](CS)[C@@H](N)CS
1110	N[C@H](c1cccc2ccccc12)[C@H](N)c1cccc2ccccc12
1111	CC(C)[C@H](N)CN
1112	CC[C@@H](C)[C@H](N)C(O)=NCCN=C(O)[C@H](C)N
1113	N[C@@H]1C[C@@H](O)[C@H](O)C[C@H]1N
1114	N[C@@H]1CCC[C@@H](N)C1
1115	N[C@@H](CO)[C@@H](N)CO
1116	Cc1cc(C)c([C@@H](N)[C@H](N)c2c(C)cc(C)cc2C)c(C)c1
1117	N[C@@H]1CNC[C@H]1N
1118	N[C@H]1CSSC[C@@H]1N
1119	N[C@@H]1CC(=O)[C@H](O)C[C@H]1N
1120	N[C@H](c1ccccc1)[C@H](N)c1ccccc1
1121	N[C@@H]1C[C@@H](O)[C@H](Br)C[C@H]1N
1122	N[C@@H]1C[C@@H](Br)[C@H](Br)C[C@H]1N
1123	C[C@H](N)CN
1124	N[C@@H]1CC=CC[C@H]1N
1125	N#Cc1ccc([C@@H](N)[C@H](N)c2ccc(C#N)cc2)cc1
1126	Nc1ccc(-c2ccc(C34CC5(c6ccc(-c7ccc(N)cc7)cc6)C[C@H](C3)C[C@@H](C4)C5)cc2)cc1
1127	ICc1ccc2ccc(CI)cc2c1
1128	CC(C)(I)CI
1129	IC[C@H]1CC[C@H](CI)C1
1130	OC[C@H](I)[C@H](I)CO
1131	Ic1ccc(-c2ccc(C34CC5(c6ccc(-c7ccc(I)cc7)cc6)C[C@H](C3)C[C@H](C4)C5)cc2)cc1
1132	CCCCC[C@@H](I)[C@H](I)CCCCC
1133	C[C@H](I)C(O)=N[C@@H]1CCCC[C@H]1N=C(O)[C@H](C)I
1134	Ic1cccc(I)c1
1135	Ic1c2ccccc2c(I)c2ccccc12
1136	Ic1ccc(I)cc1
1137	ICc1cccc(CI)c1
1138	O[C@@H]1C[C@@H](I)[C@@H](I)C[C@H]1Br
1139	Ic1ccc(-c2cccc(-c3ccc(I)cc3)c2)cc1
1140	Ic1ccc(C#Cc2ccc(C#Cc3ccc(I)cc3)cc2)cc1
1141	Ic1ccc(I)[nH]1
1142	Ic1ccc(/N=N/c2ccc(I)cc2)cc1
1143	C[C@H](I)C(O)=NCCN=C(O)[C@H](C)I
1144	ICCI
1145	Ic1cnc2c(ccc3cc(I)cnc32)c1
1146	ICCCCCI
1147	CC[C@H](C)[C@H](I)C(O)=NCCN=C(O)[C@H](C)I
1148	Ic1ccc(-c2ccc(I)cc2)cc1
1149	Ic1ccc(Cc2ccc(I)cc2)cc1
1150	Ic1ccc(-c2ccc(-c3ccc(I)cc3)cc2)cc1
1151	I[C@@H](c1cccc2ccccc12)[C@@H](I)c1cccc2ccccc12
1152	ICCNCCI
1153	Ic1ccc2ccc3ccc(I)cc3c2c1
1154	Fc1ccc([C@H](I)[C@H](I)c2ccc(F)cc2)cc1
1155	ICCCCI
1156	ICc1ccc(CI)cc1
1157	CC(C)(I)C(C)(C)I
1158	I[C@H]1CCC[C@@H](I)C1
1159	Clc1cc(-c2ccc(I)c(Cl)c2)ccc1I
1160	I[C@H]1CN(Cc2ccccc2)C[C@@H]1I
1161	ICCCI
1162	N#Cc1ccc([C@H](I)[C@@H](I)c2ccc(C#N)cc2)cc1
1163	C[C@H](I)CCCI
1164	Br[C@@H]1C[C@H](I)[C@H](I)C[C@H]1Br
1165	C[C@@H](I)CI
1166	I[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1I
1167	Ic1ccc(I)s1
1168	Ic1ccc(CCc2ccc(I)cc2)cc1
1169	O=C1C[C@@H](c2ccc(I)cc2)N1c1ccc(I)cc1
1170	SC[C@H](I)[C@H](I)CS
1171	Ic1ccc(Sc2ccc(I)cc2)cc1
1172	I[C@H]1CCCC[C@H]1I
1173	Ic1ccc(C23CC4(c5ccc(I)cc5)C[C@H](C2)C[C@H](C3)C4)cc1
1174	I[C@H]1CNC[C@H]1I
1175	FC(F)(F)[C@@H](I)CI
1176	C[C@H](I)C(O)=NCCN=C(O)[C@@H](I)c1ccccc1
1177	O=C1C[C@@H](I)[C@@H](I)C[C@H]1O
1178	Ic1ccc(-c2ccc(-c3ccc(-c4ccc(I)cc4)cc3)cc2)cc1
1179	I[C@H]1COCCOCCOCCOCCOC[C@@H]1I
1180	ICCOCCOCCI
1181	I[C@H]1C=CC=C[C@H]1I
1182	I[C@@H]1CSSC[C@H]1I
1183	ICc1ccc2ccc3ccc(CI)nc3c2n1
1184	CCOC(=O)[C@@H](I)CI
1185	C[C@@H]1C[C@H](I)[C@H](I)C[C@H]1C
1186	Ic1cc2cc(I)sc2s1
1187	I[C@H]1CCCC[C@@H]1I
1188	O[C@@H]1C[C@H](I)[C@H](I)C[C@H]1O
1189	I[C@@H](c1ccccc1)[C@H](I)c1ccccc1
1190	ICCOCCI
1191	Ic1ccc2[nH]c3ccc(I)cc3c2c1
1192	Ic1ccccc1I
1193	Ic1ccc(C#Cc2ccc(I)cc2)cc1
1194	CC[C@@H](I)CI
1195	Ic1ccccc1SSc1ccccc1I
1196	I[C@H]1CCC[C@H]1I
1197	O[C@@H](I)CI
1198	Ic1ccc(/C=C/c2ccc(I)cc2)cc1
1199	C[C@@](I)(CI)C(F)(F)F
1200	Ic1cc2sc(I)cc2s1
1201	COc1cc(I)c(OC)cc1I
1202	I[C@H]1CC=CC[C@H]1I
1203	CC(C)[C@@H](I)CI
1204	I[C@H]1CC[C@@H](I)CC1
1205	Cc1cc(C)c([C@H](I)[C@@H](I)c2c(C)cc(C)cc2C)c(C)c1
1206	I[C@H]1CN(Cc2ccccc2)C[C@H]1I
1207	O=C1C[C@@H](I)[C@@H](I)C[C@H]1Br
1208	N#C/C1=C/c2cc(C(=O)O)cc(c2)/C(C#N)=C\\c2cc(C(=O)O)cc(c2)/C(C#N)=C\\c2cc(C(=O)O)cc(c2)/C(C#N)=C\\c2cc(C(=O)O)cc(c2)/C(C#N)=C\\c2cc(C(=O)O)cc1c2
1209	O=C(O)c1cc(CCc2ccc(O)c(C(=O)O)c2)ccc1O
1210	COc1c(C(=O)O)cc(C(C)(C)C)cc1C(=O)O
1211	O=C(O)c1cccc2cc3cccc(C(=O)O)c3cc12
1212	O=C(O)c1cc(B(O)O)cc(C(=O)O)c1
1213	O=C(O)c1ccc(-c2cccc3cccc(-c4ccc(C(=O)O)cc4)c23)cc1
1214	COc1cc(C#Cc2cc(Br)cc(C(=O)O)c2)cc(C#Cc2cc(Br)cc(C(=O)O)c2)c1
1215	O=C(O)c1cccc(C(=O)O)n1
1216	Fc1cc2c(cc1F)C1c3cc(F)c(F)cc3C2c2cc(F)c(F)cc21
1217	Nc1ccc(-c2c3ccc([nH]3)c(-c3ccc(N)cc3)c3nc(c(-c4ccc(N)cc4)c4ccc([nH]4)c(-c4ccc(N)cc4)c4nc2C=C4)C=C3)cc1
1218	N#C/C1=C/c2cc(N)cc(c2)/C(C#N)=C\\c2cc(N)cc(c2)/C(C#N)=C\\c2cc(N)cc(c2)/C(C#N)=C\\c2cc(N)cc(c2)/C(C#N)=C\\c2cc(N)cc1c2
1219	O=Cc1cc2ccc3cc(C=O)cc4ccc(c1)c2c34
1220	O=CCc1ccc2ccc(CC=O)cc2c1
1221	CC(C)(C=O)CC=O
1222	O=CC[C@H]1CC[C@@H](CC=O)C1
1223	O=C[C@H](CO)[C@@H](C=O)CO
1224	O=Cc1ccc(N(c2ccccc2)c2ccc(C=O)cc2)cc1
1225	O=Cc1ccc(-c2ccc(C34CC5(c6ccc(-c7ccc(C=O)cc7)cc6)C[C@H](C3)C[C@H](C4)C5)cc2)cc1
1226	CCCCC[C@@H](C=O)[C@H](C=O)CCCCC
1227	C[C@H](C=O)C(O)=N[C@@H]1CCCC[C@H]1N=C(O)[C@H](C)C=O
1228	O=Cc1ccc(C#Cc2cccc(C#Cc3ccc(C=O)cc3)c2)cc1
1229	O=Cc1cccc(C=O)c1
1230	O=Cc1c2ccccc2c(C=O)c2ccccc12
1231	O=Cc1ccc(C=O)cc1
1232	O=CCc1cccc(CC=O)c1
1233	O=C[C@H]1C[C@@H](Br)[C@H](O)C[C@H]1C=O
1234	O=Cc1ccc(-c2cccc(-c3ccc(C=O)cc3)c2)cc1
1235	O=Cc1ccc(C#Cc2ccc(C#Cc3ccc(C=O)cc3)cc2)cc1
1236	O=Cc1ccc(C=O)[nH]1
1237	O=Cc1ccc(/N=N\\c2ccc(C=O)cc2)cc1
1238	C[C@H](C=O)C(O)=NCCN=C(O)[C@H](C)C=O
1239	O=CCCC=O
1240	O=Cc1cnc2c(ccc3cc(C=O)cnc32)c1
1241	O=CCCCCCC=O
1242	O=Cc1ccc2c(ccc3cc(C=O)ccc32)c1
1243	CC[C@H](C)[C@H](C=O)C(O)=NCCN=C(O)[C@H](C)C=O
1244	O=Cc1ccc(-c2ccc(C=O)cc2)cc1
1245	O=Cc1ccc(Cc2ccc(C=O)cc2)cc1
1246	O=Cc1ccc(-c2ccc(-c3ccc(C=O)cc3)cc2)cc1
1247	O=C[C@@H](c1cccc2ccccc12)[C@@H](C=O)c1cccc2ccccc12
1248	O=Cc1ccc(-c2ccc(C=O)cn2)nc1
1249	O=CCCNCCC=O
1250	O=Cc1ccc2ccc3ccc(C=O)cc3c2c1
1251	O=C[C@H](c1ccc(F)cc1)[C@@H](C=O)c1ccc(F)cc1
1252	O=CCCCCC=O
1253	O=CCc1ccc(CC=O)cc1
1254	CC(C)(C=O)C(C)(C)C=O
1255	O=C[C@H]1CCC[C@@H](C=O)C1
1256	O=Cc1ccc(-c2ccc(C=O)c(Cl)c2)cc1Cl
1257	O=C[C@@H]1CN(Cc2ccccc2)C[C@@H]1C=O
1258	O=CCCCC=O
1259	N#Cc1ccc([C@H](C=O)[C@@H](C=O)c2ccc(C#N)cc2)cc1
1260	C[C@H](C=O)CCCC=O
1261	O=Cc1ccc2c(c1)[C@H]1c3ccccc3[C@@H]2c2ccc(C=O)cc21
1262	O=C[C@H]1C[C@@H](Br)[C@H](Br)C[C@H]1C=O
1263	C[C@H](C=O)CC=O
1264	O=C[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1C=O
1265	O=Cc1ccc(C=O)s1
1266	O=Cc1ccc(CCc2ccc(C=O)cc2)cc1
1267	O=Cc1ccc([C@@H]2CC(=O)N2c2ccc(C=O)cc2)cc1
1268	O=C[C@@H](CS)[C@H](C=O)CS
1269	O=Cc1ccc(Sc2ccc(C=O)cc2)cc1
1270	O=C[C@H]1CCCC[C@H]1C=O
1271	O=Cc1ccc(C23CC4(c5ccc(C=O)cc5)C[C@H](C2)C[C@H](C3)C4)cc1
1272	O=C[C@@H]1CNC[C@@H]1C=O
1273	O=CC[C@H](C=O)C(F)(F)F
1274	C[C@H](C=O)C(O)=NCCN=C(O)[C@@H](C=O)c1ccccc1
1275	O=C[C@H]1C[C@@H](O)C(=O)C[C@H]1C=O
1276	O=Cc1ccc(-c2ccc(-c3ccc(-c4ccc(C=O)cc4)cc3)cc2)cc1
1277	O=C[C@H]1COCCOCCOCCOCCOC[C@@H]1C=O
1278	O=CCCOCCOCCC=O
1279	O=C[C@H]1C=CC=C[C@H]1C=O
1280	O=C[C@@H]1CSSC[C@H]1C=O
1281	O=CCc1ccc2ccc3ccc(CC=O)nc3c2n1
1282	CCOC(=O)[C@@H](C=O)CC=O
1283	O=Cc1ccc(Oc2ccc(C=O)cc2)cc1
1284	C[C@@H]1C[C@H](C=O)[C@H](C=O)C[C@H]1C
1285	O=Cc1cc2cc(C=O)sc2s1
1286	O=C[C@H]1CCCC[C@@H]1C=O
1287	O=C[C@H]1C[C@@H](O)[C@H](O)C[C@H]1C=O
1288	O=C[C@H](c1ccccc1)[C@@H](C=O)c1ccccc1
1289	O=CCCOCCC=O
1290	O=Cc1ccc(C=O)o1
1291	O=Cc1ccc2[nH]c3ccc(C=O)cc3c2c1
1292	O=Cc1ccccc1C=O
1293	O=Cc1ccc(C#Cc2ccc(C=O)cc2)cc1
1294	CC[C@@H](C=O)CC=O
1295	O=Cc1ccccc1SSc1ccccc1C=O
1296	O=C[C@H]1CCC[C@H]1C=O
1297	O=CC[C@H](O)C=O
1298	O=Cc1ccc(/C=C/c2ccc(C=O)cc2)cc1
1299	C[C@@](C=O)(CC=O)C(F)(F)F
1300	O=Cc1cc2sc(C=O)cc2s1
1301	COc1cc(C=O)c(OC)cc1C=O
1302	O=C[C@H]1CC=CC[C@H]1C=O
1303	CC(C)[C@@H](C=O)CC=O
1304	O=C[C@H]1CC[C@H](C=O)CC1
1305	Cc1cc(C)c([C@H](C=O)[C@@H](C=O)c2c(C)cc(C)cc2C)c(C)c1
1306	O=C[C@H]1C[C@@H](Br)C(=O)C[C@H]1C=O
1307	O=Cc1ccc2ccc3ccc(C=O)nc3c2n1
1308	OCc1cc(CCc2ccc(O)c(CO)c2)ccc1O
1309	COc1c(CO)cc(C(C)(C)C)cc1CO
1310	OCc1cccc2cc3cccc(CO)c3cc12
1311	OCc1cc(CO)cc(B(O)O)c1
1312	OCc1ccc(-c2cccc3cccc(-c4ccc(CO)cc4)c23)cc1
1313	COc1cc(C#Cc2cc(Br)cc(CO)c2)cc(C#Cc2cc(Br)cc(CO)c2)c1
1314	OCc1cccc(CO)n1
1315	O=C[C@H]1O[C@@H](C=O)O[C@@H](C=O)O1
1316	O=Cc1cc2c(cc1C=O)C1c3cc(C=O)c(C=O)cc3C2c2cc(C=O)c(C=O)cc21
1317	O=Cc1cccc(C=O)n1
1318	O=Cc1cccc2cc3cccc(C=O)c3cc12
1319	COc1c(C=O)cc(C(C)(C)C)cc1C=O
1320	O=Cc1cc(C=O)cc(B(O)O)c1
1321	O=Cc1ccc(-c2cccc3cccc(-c4ccc(C=O)cc4)c23)cc1
1322	COc1cc(C#Cc2cc(Br)cc(C=O)c2)cc(C#Cc2cc(Br)cc(C=O)c2)c1
1323	O=Cc1cc(CCc2ccc(O)c(C=O)c2)ccc1O
1324	O=Cc1cccc2cc3c(C=O)cccc3cc12
1325	O=Cc1ccc(C#Cc2ccc(C=O)nc2)cn1
1326	O=Cc1ccc2cc(C=O)ccc2c1
1327	O=Cc1cccc(C#Cc2cccc(C=O)c2)c1
1328	O=Cc1ccc(-c2ccc(O)c(C=O)c2)cc1
1329	O=Cc1cc(-c2ccc(O)c(C=O)c2)ccc1O
1330	O=Cc1ccc(C#Cc2ccccc2C#Cc2ccc(C=O)cc2)cc1
1331	O=Cc1cc(C#Cc2ccc(O)c(C=O)c2)ccc1O
1332	O=Cc1cccc(-c2cccc(C=O)c2O)c1O
1333	O=Cc1ccc(-c2ccc(C=O)c(Cl)c2)cc1
1334	O=Cc1cc(-c2ccc(-c3ccc(-c4ccc(O)c(C=O)c4)cc3)cc2)ccc1O
1335	O=Cc1cc(O)c(C=O)cc1O
1336	O=Cc1ccc([C@H]2CC(=O)N2c2ccc(C=O)cc2)cc1
1337	O=Cc1cccc(-c2cccc(C=O)c2)c1
1338	O=Cc1cccc(C=O)c1O
1339	COc1ccc(C#Cc2ccc(OC)c(C=O)c2)cc1C=O
1340	O=Cc1cc(-c2ccc(-c3ccc(O)c(C=O)c3)cc2)ccc1O
1341	Cc1cc(C=O)c(O)c(C=O)c1
1342	O=Cc1cc(N2CCCC2)cc(C=O)n1
1343	O=Cc1cc(Br)cc(C#Cc2cc(O)cc(C#Cc3cc(Br)cc(C=O)c3)c2)c1
1344	O=Cc1ccc(-c2ccc(C=O)c(O)c2)cc1
1345	CC[C@H](C)c1cc(C=O)c(O)c(C=O)c1
1346	O=Cc1cc(Br)cc(C=O)c1
1347	CCCC[C@H](CC)Cn1c2ccc(C=O)cc2c2cc(C=O)ccc21
1348	O=Cc1ccc(-c2ccc(C=O)nc2)cn1
1349	O=Cc1ccc2ccc(C=O)cc2c1
1350	Cc1c(O)c(C=O)cc(C=O)c1O
1351	O=C(O)c1ccc(-c2cc(-c3ccc(C(=O)O)cc3)nc(-c3ccc(C(=O)O)cc3)c2)cc1
1352	O=C(O)c1c(C#Cc2ccccc2)c(C(=O)O)c(C#Cc2ccccc2)c(C(=O)O)c1C#Cc1ccccc1
1353	O=C(O)N1CN(C(=O)O)CN(C(=O)O)C1
1354	O=C(O)c1ccc(C(=O)c2cc(C(=O)c3ccc(C(=O)O)cc3)cc(C(=O)c3ccc(C(=O)O)cc3)c2)cc1
1355	CCC(c1ccc(C#Cc2ccc(C(=O)O)cc2)cc1)(c1ccc(C#Cc2ccc(C(=O)O)cc2)cc1)c1ccc(C#Cc2ccc(C(=O)O)cc2)cc1
1356	O=C(O)c1ccc(C=c2c3ccc4c(=Cc5ccc(C(=O)O)cc5)c5ccc6c(=Cc7ccc(C(=O)O)cc7)c7ccc2c2c3c4c5c6c72)cc1
1357	O=C(O)c1ccc2c(c1)C1c3cc(C(=O)O)ccc3C2c2ccc(C(=O)O)cc21
1358	Cc1c(C(=O)O)c(C)c(C(=O)O)c(C)c1C(=O)O
1359	O=C(O)c1cc(C(=O)O)c(O)c(C(=O)O)c1
1360	O=C(O)c1ccc(-c2ccc(C34CC5CC(c6ccc(-c7ccc(C(=O)O)cc7)cc6)(C3)CC(c3ccc(-c6ccc(C(=O)O)cc6)cc3)(C5)C4)cc2)cc1
1361	C[Si](c1ccc(C(=O)O)cc1)(c1ccc(C(=O)O)cc1)c1ccc(C(=O)O)cc1
1362	CCC(c1ccc(C(=O)O)cc1)(c1ccc(C(=O)O)cc1)c1ccc(C(=O)O)cc1
1363	O=C(O)c1ccc(N(c2ccc(C(=O)O)cc2)c2ccc(C(=O)O)cc2)cc1
1364	O=C(O)c1ccc(NC(=O)c2cc(C(=O)Nc3ccc(C(=O)O)cc3)cc(C(=O)Nc3ccc(C(=O)O)cc3)c2)cc1
1365	Cc1c(C(=O)O)cc(C(=O)O)c(C)c1C(=O)O
1366	Cc1c(C(=O)O)cc(C(=O)O)cc1C(=O)O
1367	O=C(O)c1ccc(C#Cc2ccc(C(c3ccc(C#Cc4ccc(C(=O)O)cc4)cc3)c3ccc(C#Cc4ccc(C(=O)O)cc4)cc3)cc2)cc1
1368	O=C(O)c1ccc(C23CC4CC(c5ccc(C(=O)O)cc5)(C2)CC(c2ccc(C(=O)O)cc2)(C4)C3)cc1
1369	O=C(O)c1c(O)c(C(=O)O)c(O)c(C(=O)O)c1O
1370	CC12[C@]3(C)c4ccc(C(=O)O)cc4[C@@]1(C)c1ccc(C(=O)O)cc1[C@@]2(C)c1ccc(C(=O)O)cc13
1371	O=C(O)c1ccc2[nH]c3c(c2c1)c1[nH]c2ccc(C(=O)O)cc2c1c1[nH]c2ccc(C(=O)O)cc2c31
1372	O=C(O)c1ccc(C(c2ccc(C(=O)O)cc2)c2ccc(C(=O)O)cc2)cc1
1373	O=C(O)c1ccc2c(C(=O)O)cc(C(=O)O)cc2c1
1374	O=C(O)c1cc(C(=O)O)nc(C(=O)O)c1
1375	O=C(O)c1cc(C(=O)O)cc(C(=O)O)c1
1376	O=C(O)c1ccc(N2COc3c(c4c(c5c3CN(c3ccc(C(=O)O)cc3)CO5)CN(c3ccc(C(=O)O)cc3)CO4)C2)cc1
1377	O=C(O)c1ccc(N2CN(c3ccc(C(=O)O)cc3)CN(c3ccc(C(=O)O)cc3)C2)cc1
1378	CCC(c1ccc(-c2ccc(C(=O)O)cc2)cc1)(c1ccc(-c2ccc(C(=O)O)cc2)cc1)c1ccc(-c2ccc(C(=O)O)cc2)cc1
1379	O=C(O)c1ccc(C#Cc2ccc(C34CC5CC(c6ccc(C#Cc7ccc(C(=O)O)cc7)cc6)(C3)CC(c3ccc(C#Cc6ccc(C(=O)O)cc6)cc3)(C5)C4)cc2)cc1
1380	O=C(O)[C@H]1O[C@H](C(=O)O)O[C@@H](C(=O)O)O1
1381	O=C(O)c1ccc(C#Cc2cc(C#Cc3ccc(C(=O)O)cc3)cc(C#Cc3ccc(C(=O)O)cc3)c2)cc1
1382	O=C(O)c1cc(C#Cc2cc(C#Cc3ccc(O)c(C(=O)O)c3)cc(C#Cc3ccc(O)c(C(=O)O)c3)c2)ccc1O
1383	O=C(O)c1ccc(-c2ccc(C(c3ccc(-c4ccc(C(=O)O)cc4)cc3)c3ccc(-c4ccc(C(=O)O)cc4)cc3)cc2)cc1
1384	O=C(O)c1cc(C(=O)O)c(F)c(C(=O)O)c1F
1385	O=C(O)c1ccc(-c2nc(-c3ccc(C(=O)O)cc3)c(-c3ccc(C(=O)O)cc3)[nH]2)cc1
1386	O=C(O)c1cc(C(=O)O)c2cccc(C(=O)O)c2c1
1387	O=C(O)c1ccc2c(c1O)C1c3c(ccc(C(=O)O)c3O)C2c2ccc(C(=O)O)c(O)c21
1388	O=C(O)c1cc(C(=O)O)c(O)c(C(=O)O)c1O
1389	O=C(O)c1ccc(B2OB(c3ccc(C(=O)O)cc3)OB(c3ccc(C(=O)O)cc3)O2)cc1
1390	O=C(O)c1ccc(-c2ccc(-c3cc(-c4ccc(-c5ccc(C(=O)O)cc5)cc4)cc(-c4ccc(-c5ccc(C(=O)O)cc5)cc4)c3)cc2)cc1
1391	O=C(O)c1cc(C(=O)O)nc(C(=O)O)n1
1392	O=C(O)c1ccc(-c2cc(-c3ccc(C(=O)O)cc3)cc(-c3ccc(C(=O)O)cc3)c2)cc1
1393	O=C(O)c1ccc(CN(Cc2ccc(C(=O)O)cc2)Cc2ccc(C(=O)O)cc2)cc1
1394	FCCCN(CCCF)CCCF
1395	Fc1ccc(C=c2c3ccc4c(=Cc5ccc(F)cc5)c5ccc6c(=Cc7ccc(F)cc7)c7ccc2c2c3c4c5c6c72)cc1
1396	CCCCCCCCCCCCCCc1ccc(C(c2ccc(F)cc2)(c2ccc(F)cc2)c2ccc(F)cc2)cc1
1397	CCCCOc1c(CF)c(OCCCC)c(CF)c(OCCCC)c1CF
1398	F[C@H]1C[C@H](F)C[C@@H](F)C1
1399	FCCN(CCF)CCF
1400	Cc1c(CF)c(C)c(CF)c(C)c1CF
1401	CCCCCCc1c(-c2ccc(F)cc2)c(CCCCCC)c(-c2ccc(F)cc2)c(CCCCCC)c1-c1ccc(F)cc1
1402	CCc1c(CF)c(CC)c(CF)c(CC)c1CF
1403	O=C(O)c1ccc([C@H]2c3cc(c(O)cc3O)[C@H](c3ccc(C(=O)O)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(C(=O)O)cc3)c3cc(c(O)cc3O)[C@@H](c3ccc(C(=O)O)cc3)c3cc2c(O)cc3O)cc1
1404	O=CCCCN(CCCC=O)CCCC=O
1405	CCCCCCCCCCCCCCc1ccc(C(c2ccc(C=O)cc2)(c2ccc(C=O)cc2)c2ccc(C=O)cc2)cc1
1406	CCCCOc1c(CC=O)c(OCCCC)c(CC=O)c(OCCCC)c1CC=O
1407	O=C[C@H]1C[C@H](C=O)C[C@@H](C=O)C1
1408	O=CCCN(CCC=O)CCC=O
1409	Cc1c(CC=O)c(C)c(CC=O)c(C)c1CC=O
1410	CCCCCCc1c(-c2ccc(C=O)cc2)c(CCCCCC)c(-c2ccc(C=O)cc2)c(CCCCCC)c1-c1ccc(C=O)cc1
1411	CCc1c(CC=O)c(CC)c(CC=O)c(CC)c1CC=O
1412	Oc1ccc(CCc2ccc(O)c(F)c2)cc1F
1413	COc1c(F)cc(C(C)(C)C)cc1F
1414	Fc1cccc2cc3cccc(F)c3cc12
1415	OB(O)c1cc(F)cc(F)c1
1416	Fc1ccc(-c2cccc3cccc(-c4ccc(F)cc4)c23)cc1
1417	COc1cc(C#Cc2cc(F)cc(Br)c2)cc(C#Cc2cc(F)cc(Br)c2)c1
1418	Fc1cccc(F)n1
1419	O=C(O)CCCN(CCCC(=O)O)CCCC(=O)O
1420	CCCCCCCCCCCCCCc1ccc(C(c2ccc(C(=O)O)cc2)(c2ccc(C(=O)O)cc2)c2ccc(C(=O)O)cc2)cc1
1421	CCCCOc1c(CC(=O)O)c(OCCCC)c(CC(=O)O)c(OCCCC)c1CC(=O)O
1422	O=C(O)[C@H]1C[C@H](C(=O)O)C[C@@H](C(=O)O)C1
1423	O=C(O)CCN(CCC(=O)O)CCC(=O)O
1424	Cc1c(CC(=O)O)c(C)c(CC(=O)O)c(C)c1CC(=O)O
1425	CCCCCCc1c(-c2ccc(C(=O)O)cc2)c(CCCCCC)c(-c2ccc(C(=O)O)cc2)c(CCCCCC)c1-c1ccc(C(=O)O)cc1
1426	CCc1c(CC(=O)O)c(CC)c(CC(=O)O)c(CC)c1CC(=O)O
1427	FN1CCOCCN(F)CCN(F)CC1
1428	Fc1ccc(C#Cc2ccc(N(c3ccc(C#Cc4ccc(F)cc4)cc3)c3ccc(C#Cc4ccc(F)cc4)cc3)cc2)cc1
1429	Fc1c2cccccc-2c(F)c1F
1430	Fc1coc(F)c1F
1431	Cc1c(F)c(S)c(F)c(C(C)(C)C)c1F
1432	Fc1cc(F)c(Cl)c(F)c1
1433	C=C1COCCN(F)CCN(F)CCN(F)CCOC1
1434	FN1CCN(F)CCN(F)CC1
1435	F[C@H]1O[C@@H](F)O[C@@H](F)O1
1436	Fc1ccc(-c2ccc(N(c3ccc(-c4ccc(F)cc4)cc3)c3ccc(-c4ccc(F)cc4)cc3)cc2)cc1
1437	Oc1c2cccc1Sc1cc(F)cc(c1O)Sc1cc(F)cc(c1O)Sc1cc(F)cc(c1O)S2
1438	FC=C1SC(F)=C(F)S1
1439	Fc1ccc2c(F)ccc(F)c2c1
1440	C[C@@]12c3cc(F)ccc3[C@]3(C)c4ccc(F)cc4[C@](C)(c4cc(F)ccc41)[C@]23C
1441	Oc1cc2c(cc1F)Cc1cc(O)c(F)cc1Cc1cc(O)c(F)cc1C2
1442	C[C@]1(F)C[C@@](C)(F)C[C@@](C)(F)C1
1443	Fc1cc(Br)c2cc1/C=C\\c1cc(c(F)cc1Br)/C=C\\c1cc(c(F)cc1Br)/C=C\\2
1444	FN1CCOCCOCCOCCN(F)CCN(F)CC1
1445	Fc1cc(F)c(Cl)c(F)c1Cl
1446	Cc1c(F)cc(F)c(Cl)c1F
1447	COc1cc2c(cc1F)Cc1cc(OC)c(F)cc1Cc1cc(OC)c(F)cc1C2
1448	Fc1cc(F)c(F)[nH]1
1449	Fc1csc(F)c1F
1450	Fc1ccc2c(c1)[C@H]1c3ccc(F)cc3[C@@H]2c2cc(F)ccc21
1451	CC(F)=C1NC(=C(C)F)NC(=C(C)F)N1
1452	Fc1cc(Br)c2cc1/C=C\\c1cc(c(Br)cc1F)/C=C\\c1cc(c(F)cc1Br)/C=C\\2
1453	Fc1cccc2c1[nH]c1c3[nH]c4c(F)cccc4c3c3c4cccc(F)c4[nH]c3c21
1454	Oc1c(F)cc(F)c(Br)c1F
1455	FN1CCNCCN(F)CCN(F)CC1
1456	Cc1c(F)c2n(c1F)CCn1c-2cc(F)c1C
1457	FN1CCOCCOCCOCCOCCN(F)CCN(F)CC1
1458	Fc1ccc2[nH]c3c4[nH]c5ccc(F)cc5c4c4c5cc(F)ccc5[nH]c4c3c2c1
1459	Fc1ccc(C#Cc2cc(F)cc(F)c2)cc1
1460	Fc1cc2c3c4c1Cc1cc(F)c5c(c14)c1c(cc(F)c(c31)C2)C5
1461	CC(=O)N1[C@@H]2[C@H]3N(F)[C@H]4[C@@H](N2F)N(C(C)=O)[C@@H]([C@@H]1N3C(C)=O)N4F
1462	Fc1cccc(C#Cc2ccc(C#Cc3ccccc3F)cc2F)c1
1463	Oc1c(F)c(Cl)c(F)c(Cl)c1F
1464	F[C@H]1CCC[C@@H](F)CCC[C@@H](F)CCC1
1465	Fc1cc(F)c2cc(F)ccc2c1
1466	Cc1c(F)c(F)c(F)n1C
1467	Fc1ccc2nc3cc(F)c4cc5cc(F)ccc5nc4c3cc2c1
1468	FN1CCCN(F)CCOCCN(F)CCC1
1469	Fc1ccc(F)c(F)c1
1470	Oc1ccc(C#Cc2ccc(C#Cc3ccccc3F)cc2F)cc1F
1471	Fc1cc(F)c(F)s1
1472	Fc1c(F)c(Cl)c(Cl)c(F)c1Cl
1473	FN1CCOCCOCCN(F)CCN(F)CC1
1474	F[C@H]1[C@H](F)[C@H]1F
1475	Fc1cccc2[nH]c3c4[nH]c5cccc(F)c5c4c4c([nH]c5cccc(F)c54)c3c12
1476	Fc1ccc2c(c1)[nH]c1c3[nH]c4cc(F)ccc4c3c3c4ccc(F)cc4[nH]c3c21
1477	Cn1c(F)cc(F)c1F
1478	Fc1c(Cl)c(F)c(Cl)c(F)c1Cl
1479	Cc1cc(F)c(F)cc1F
1480	F[C@@H]1[C@@H]2[C@@H]3OO[C@@H](O3)[C@@H]2[C@@H](F)[C@@H]1F
1481	Fc1c(Br)c(F)c(Br)c(F)c1Br
1482	FN1CCCN(F)CCN(F)CCCNCC1
1483	COC(=O)[C@]12C[C@@]1(N)C(N)=C[C@H]1CC(C)(C)C[C@H]12
1484	CN1CCc2cc(N)cc(N)c21
1485	CC1(C)CCC[C@@]2(C)[C@@H]3CC=C(N)CC(=O)[C@@]3(N)CC[C@H]12
1486	Nc1c(N)n(-c2ccccc2)c2ccccc12
1487	Cc1cc2c(cc1N)[C@H]1c3ccccc3[C@@H]2c2cc(N)ccc21
1488	Nc1ccc2c(c1)C(=O)c1cccc3c(N)ccc-2c13
1489	CC(C)(C)Sc1cc(O)c(N)cc1N
1490	Nc1cc(N)c(N2CCCCC2)o1
1491	C/C(N)=C(\\C)C#C/C(C)=C(\\C)N
1492	CC(C)(C)[C@@H]1CC=C(N)[C@H](CN)C1
1493	CC(C)(C)n1cc(N)c(N)c1
1494	N[C@H]1O[C@@H](N)C[C@@H]1CO
1495	N[C@H]1C[C@@H]2C=C[C@H]1[C@@H]2N
1496	CC1(C)CCC[C@]2(C)[C@H]1CC[C@H](N)[C@@]2(N)O
1497	Nc1cc2sc3cc(N)sc3c2s1
1498	Nc1ccc(Cl)c(N)c1Cl
1499	COc1cc(C#CN)c(OC)cc1C#CN
1500	Cc1ccc2c(c1)C(N)=C(N)c1ccccc1C2
1501	COc1c(N)cc(Cl)c(C)c1N
1502	Nc1cc2ccccc2c(-c2nc(N)cc3ccccc23)n1
1503	NC1=C(Cl)c2cc(-c3ccc4c(c3)C(Cl)=C(N)CC4)ccc2CC1
1504	Nc1sc(Cl)c(N)c1Cl
1505	C/C(N)=C\\c1ccc(N)cc1
1506	N[C@H]1[C@H]2CC[C@H](CC2)[C@@H]1N
1507	C[C@H]1[C@H](C)N(N)c2ccccc2N1N
1508	C[C@@H](N)C#C[C@@H](C)N
1509	N=c1ccc2cc3[nH]c(=N)ccc3cc2[nH]1
1510	C/C=c1/c2c(/c(=C/C)c3c1[C@H](C)[C@H](N)C[C@H]3C)[C@H](C)[C@@H](N)C[C@@H]2C
1511	NC1=CS/C(=C2/SC=C(N)S2)S1
1512	NC1=C(Cl)NC(Cl)=C(N)C1c1ccccc1
1513	Nc1ccc2c(c1-c1c(N)ccc3c1C(=O)c1ccc(Cl)cc1C3=O)C(=O)c1ccc(Cl)cc1C2=O
1514	CO[C@@H]1[C@@H](N)[C@@H]2C[C@@H]2[C@H]1N
1515	NC[C@@H]1CCC[C@@H](N)C1
1516	N[C@H]1CO[C@@H](N)O1
1517	Nc1ccccc1-c1cc2c(cc1N)sc1ccccc12
1518	CC1(C)CC2CC(C)(C)Oc3c(N)c(O)c(N)c(c32)O1
1519	Cc1cc(-c2[nH]c(N)cc2C)[nH]c1N
1520	CC1(C)CCC(C)(C)c2cc(N)c(N)cc21
1521	CC1(C)CCC=C(N)[C@H]1N
1522	Cc1cc(-c2ccccc2)cc(C)c2c(N)c(N)cc1-2
1523	Nc1cscc1N
1524	N/C(=C\\O)c1[nH]nc(Cl)c1N
1525	NC1=C2CCc3cc4c5cc3CCC2=C(N)/C=C(CC5)\\C(=C/1)CC4
1526	N#Cc1c2cccccc-2c(N)c1N
1527	Cc1cc(C)c(-c2c(C)cc(C)cc2N)c(N)c1
1528	NNNN
1529	CC[C@]12C3=CC=CC1=C(N)C(N)=C2C=C3
1530	Nc1ccccc1-c1cc2ccc3ccccc3c2cc1N
1531	C[C@]12C[C@@H]3[C@@H]4C[C@H]1[C@@H](C[C@]4(C)NN3N)N(N)N2
1532	Nc1ccc2ccc3c(N)ccc4ccc1c2c43
1533	C[C@H]1Cc2c(n(N)c3ccccc23)-c2ncc(N)c(=O)n21
1534	C=C1COC(=O)c2c(N)cc3ccccc3c2-c2c(c(N)cc3ccccc23)C(=O)OC1
1535	C=C1[C@@H](O)C[C@@H](CN)[C@H]1N
1536	CN1C=C[C@H](c2c(N)n(C)c3ccccc23)C(N)=C1
1537	Nc1ccc(C#Cc2ccc3c4c(ccc(C#Cc5ccc(N)cc5)c24)CC3)cc1
1538	NC/C=C1\\C=CC=C1N
1539	Nc1cc(N)c(N2CCOCC2)o1
1540	C/C(N)=C(\\C)C#CC#C/C(C)=C(/C)N
1541	N=C1N[C@H]2C[C@H](N1)O[C@]1(O)[C@H]3[C@H]4C[C@H](NC(=N)N4)O[C@@](O)([C@H]2N1N)N3N
1542	Cc1ccc(-c2nc3c(N)c4cccccc4n3c2N)cc1
1543	NN1CCOCCOCCN(N)CC1
1544	Nc1cc(N)c(Cl)c(Cl)c1
1545	Nc1cc(N)c(O)c(CO)c1
1546	NC1=CC=c2c3c(c4cccc5cccc2c54)C=CC(N)=C1C3
1547	Nc1cc(Cl)c(N)c(Cl)c1Cl
1548	C=C(N)[C@H]1CC[C@@]2(C)CCC=C(N)[C@H]2C1
1549	CN(N)/C(N)=C\\O
1550	Nc1c[nH]c2ccc(-c3[nH]c4ccccc4c3N)cc12
1551	Nc1ccc2c3c(ccc2c1)OCOc1ccc2cc(N)ccc2c1-3
1552	C[C@H]1CC[C@@H](N)[C@H](N)C2=CC(C)(C)C[C@@H]21
1553	N/N=c1/c2ccccc2c2nc3/c(=N/N)c4ccccc4c3nc12
1554	Cc1ccc2oc(N)c(N)c2c1
1555	Nc1sc(N)c2c1ncc1sccc12
1556	C[C@H]1CC[C@H]2C(C)(C)[C@H](O)CC[C@]2(C)[C@]12Cc1c(O)cc(N)c(N)c1O2
1557	NC1=C(F)C(N)=C1F
1558	NC1=C[C@@H]2C=C(N)[C@@H]3C=C[C@H]1[C@H]23
1559	Nc1cc(N)c2c(c1)CCC2
1560	C[C@]12Cc3cc(N)oc3C[C@@H]1CC[C@H]1[C@H]2CC[C@]2(C)[C@H](ON)CC[C@H]12
1561	Cc1c(N)n(N)c2c(C)cc(Br)cc12
1562	C=C1C[C@](C)(N)[C@@H](N)C[C@H]1O
1563	Nc1ccc2c(c1)C1(CC2)CCc2ccc(N)cc21
1564	CC1(C)C[C@H]2[C@H](C=C(N)[C@@]3(N)C[C@@]23C)[C@@H]1O
1565	Nc1c2cccccc-2cc1-c1cc2cccccc-2c1N
1566	Cc1cc(C)c(-c2c(C)cc(C)c(N)c2C)c(C)c1N
1567	COc1cccc2c1CC[C@H]1[C@@](C)(N)CCC[C@@]21N
1568	CN1C=C(N)CC(N)=C1
1569	Cn1c(Cl)c(N)c(N)c1N1CCCCC1
1570	N[C@@H]1/C=C\\C=C\\[C@H](N)C/C=C\\1
1571	N[C@H]1[C@@H]2C=C[C@@H](CC2)[C@@H]1N
1572	CC1(C)[C@@H](N)[C@@]2(C#N)C[C@]1(C#N)[C@@H](N)C2(C)C
1573	NN1CCCCCCCCCCCCN(N)C2=C(Cl)C(=O)C1=C(Cl)C2=O
1574	C/C(N)=C\\[C@@H]1[C@@H](N)C1(C)C
1575	C[C@H]1CN=C(S)Nc2ccccc2N(N)CCN(N)c2ccccc2NC(S)=N1
1576	CN1C=C[C@@H](c2c(N)[nH]c3ccccc23)C(N)=C1
1577	Nc1ccc2ccoc2c1N1CCN(N)CC1
1578	C/C=c1\\c2c(/c(=C\\C)c3c1CC[C@H](N)C3)CC[C@H](N)C2
1579	Nc1cc(O)c(N)s1
1580	CC1=C[C@@H]2OC=C(N)[C@@](C)(N)[C@H]2[C@@H](CO)C1
1581	NC1=S=C(N)c2cc3ccccc3cc21
1582	Cc1cc(O)cc(N)c1-c1c(C)cc(O)cc1N
1583	CC(=O)N1[C@@H](N)Cc2c[nH]c3cccc(c23)[C@H]1/C=C(\\C)N
1584	CC1(C)C=C(N)C(Cl)=C(N)C1
1585	C[C@@]12CCC=C(N)[C@]1(N)C2
1586	NC1=CC=CC2=CC=CC(N)=C1C2
1587	N[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@H]1[C@H]4C[C@@H]5C[C@H](C4)C[C@@]1(N)C5)(C3)C2
1588	CC1=C(N)C2=CC=C3C=CC=C4C=CC(=C1N)[C@@]2(C)[C@]43C
1589	COc1ccc2c(c1)C(N)=C(N)c1ccccc1C2
1590	Nc1cc(O)c(O)cc1N
1591	Nc1cc2ccc(O)c(N)c2cc1O
1592	Nc1cc(N)c(N2CCNCC2)o1
1593	Nc1ccc(N2CCN(N)CC2)c2occc12
1594	COc1c2oc(N)c(Cl)c2cc2c(Cl)c(N)oc12
1595	Cc1c(N)n(N)c2c(Cl)ccc(Cl)c12
1596	CC1=C/C(N)=C\\C(C)=C/C(N)=C1
1597	N=C(O)O[C@H]1CCC[C@@H]1N
1598	Cc1[nH]c2ccccc2c(=N)c1N
1599	CC1(C)C(N)=C(Cl)N(c2ccccc2)C(Cl)=C1N
1600	Nc1cc2ccccc2c(N)c1O
1601	COc1cc2c(C)c(c1)CCc1c(C)c(c(N)c(C)c1N)CC2
1602	NN1CC(Br)CN1N
1603	NC#CC1(C#Cc2ccccc2C#CC2(C#CN)OCCCO2)OCCCO1
1604	CN1C(=O)N2[C@H](N)O[C@@H](N)CO[C@@H]2c2nc3c4ccccc4n(C)c3nc21
1605	N/C=C(O)/C=C/N
1606	NC[C@@H]1[C@@H](N)[C@H]2CC[C@@H]1C2
1607	N=c1cc[nH]c(-c2nc(=N)cc[nH]2)n1
1608	COc1c(O)c(N)c(Br)c(N)c1O
1609	NC1=C(Cl)NC(Cl)=C(N)C1c1cccc(Cl)c1
1610	COC(=O)[C@@H]1CCC[C@@](C)(N)[C@@H]1N
1611	Nc1csc(-c2cc(N)cs2)c1
1612	CC1=C(N)[C@@H](CN)CC1
1613	Nc1cccc2c1Oc1c(N)cccc1O2
1614	Nc1nc2ccc(Cl)cc2nc1N
1615	CC1=C/C(=C2/C=C(C)C(=O)C(N)=C2)C=C(N)C1=O
1616	CC(O)=Nc1c(N)c2cccccc-2c1N
1617	N[C@@H]1C=C[C@H](N)N1
1618	C[C@H](N)/C=C/C#C[C@@H](C)N
1619	C#CC1C(N)=CN(c2c(C)cccc2C)C=C1N
1620	NC1=C(Cl)C(=CN2CCOCC2)C(Cl)=C(N)C1
1621	CC(=O)O[C@H]1[C@@H]2CC(C)(C)CC2=C(N)[C@@]2(N)C[C@@]12C
1622	CC1=CC2=C(N)C3(CC3)[C@@](C)(O)C(=O)C2=C1N
1623	Cc1cc(Cl)c2[nH]c(N)c(N)c2c1
1624	Nc1ccc2c(ccc3cc(-c4ccccc4)c(N)cc32)c1
1625	N[C@@]12[C@@H]3C[C@H]4[C@H]5[C@@H]3[C@@H]3C[C@H]5[C@]5([C@H]6C=C[C@H](C=C6)[C@]315)[C@]42N
1626	N[C@H]1CCC[C@@H](N)[C@@H]2COC[C@@H]12
1627	N#Cc1cc(N)[nH]c1N
1628	C[C@@]12C=C(N)[C@@](N)(O)C[C@@H]1CCCC2
1629	N/C=C\\N
1630	Nc1oc2ccccc2c1N
1631	NN1CCN(N)c2ccccc2NC(S)=NCCCN=C(S)Nc2ccccc21
1632	NN1C=C([C@@H]2CCCCCN2N)CCCC1
1633	NN1CCC[C@H]([C@@H]2CCCCN2N)C1
1634	Nc1[nH]c(N)c2c1CCCC2
1635	C[C@H]1C[C@H](N)CC[C@@H]1N
1636	Cc1ccc2c(c1)[C@@H](N)c1ccccc1[C@H]2N
1637	Nc1cc2c(cc1N)CCC2
1763	N=c1c2ccccc2[nH]c2ccc(N)cc12
1638	Nc1c(O)cc(O)c2c1C(=O)c1c(O)cc(O)c(N)c1C2=O
1639	CCc1c(O)c(N)cc(N)c1O
1640	N/C=C\\c1cc2cccccc-2c1N
1641	Nc1c2c(c(N)c3c1-c1cccc4cccc-3c14)-c1cccc3cccc-2c13
1642	Nc1cc(N)c2c(c1Cl)CCCC2
1643	Nc1cccc(N)c1C(=O)Cl
1644	Cc1c2ccc(O)c(N)c2c(C)c2ccc(O)c(N)c12
1645	CC1=C2C=C(N)S[C@@]2(C)[C@]2(C)SC(N)=CC2=C1C
1646	Nc1cc2c(s1)/C(=C1\\CCc3cc(N)sc31)CC2
1647	Nc1cc2c(s1)-c1sc(N)cc1C2=O
1648	CC(O)=Nc1cc(O)c(N)cc1N
1649	NC=C=CN
1650	Cc1c(N)n(N)c2ccc(Cl)cc12
1651	CC1=C(N)[C@@]2(C)[C@H](ON)CC[C@H](C)[C@H]2[C@@H]2OC(C)(C)O[C@@H]12
1652	NC1=C2NC(Cl)=C(N)C(=O)N2CCC1
1653	N=C(O)/C=C\\N
1654	Cc1c(N)ccc(O)c1N
1655	Cc1cc(N)c(N)o1
1656	CC1(C)O[C@@H]2[C@@H](N)O[C@@H](N)[C@@H]2O1
1657	CC1(C)[C@H](N)CC[C@]1(C)N
1658	C#CC1C(N)=CN(c2cccc(C)c2)C=C1N
1659	Cc1c(N)c[nH]c1N
1660	CN(C)c1nc(Cl)c(N)cc1N
1661	Nc1ccccc1-c1cc2sc3ccccc3c2cc1N
1662	N/C=C/c1cccc2c1-c1c(N)cccc1-2
1663	CC(C)c1cc(N)c(Cl)c(N)c1
1664	CC(=O)Oc1c(N)c(N)cc2c1C(=O)c1ccccc1C2=O
1665	CCc1cccc2c(N)c(N)oc12
1666	NC12[C@@H]3C=C[C@@H](O3)C1(N)[C@H]1C=C[C@@H]2O1
1667	Nc1nnn(-c2ccc(Br)cc2)c1N
1668	NN1c2ccccc2[C@@]2(O)C[C@@H](C(=O)O)N(N)[C@@H]12
1669	CC1=CC[C@@H]([C@@H](C)N)[C@H]1N
1670	NN1C=C([C@@H]2CCCCCN2N)CCC1
1671	Cc1c(N)csc1N
1672	C=C1C[C@]23C[C@@]1(O)CC[C@H]2C1=CCC[C@](C)(N)[C@H]1[C@@H]3N
1673	CCN1c2cccc(N)c2Sc2cccc(N)c21
1674	CSc1ccc(N)cc1N
1675	Nc1ccnc(-c2nccc(N)c2O)c1O
1676	NN=C1NN(N)C2(CCCCC2)S1
1677	Nc1c[nH]c2ccc3c(ccc4[nH]cc(N)c43)c12
1678	Nc1cc(N)c(O)c(C2CCCCC2)c1
1679	C[C@@H]1CCC[C@]2(C)[C@H]1CC=C(N)[C@@H]2N
1680	COc1c(N)c(N)c(Cl)n1C
1681	C=Cc1c(N)[nH]c(N)c1C
1682	Nc1nc2ccccc2nc1N
1683	N=c1cc(C#Cc2ccccc2)cc(N)[nH]1
1684	NNc1ccc(N)cc1
1685	CC1(C)CC2=C(N)[C@@]3(N)C[C@@]3(C)[C@H](O)[C@@]2(O)C1
1686	Nc1ccc2c(c1)Nc1ccc(N)cc1S2
1687	Cn1c(=O)n2n(c1=O)C1(N)CC2(N)C1
1688	C[C@@H]1CC[C@@H](N)[C@@H]1N
1689	Nc1cc(N)c(Cl)[nH]1
1690	NC1=C(N)[C@@H]2O[C@H]1C1=C2[C@@H]2C=C[C@H]1CC2
1691	Cc1c2ccc(O)c(N)c2cc2ccc(O)c(N)c12
1692	N[C@H]1c2ccccc2[C@@H](N)c2cc(F)c3ccccc3c21
1693	N[C@@H](O)[C@H](N)O
1694	C[C@H]1C=C(N)C(N)=C[C@@H]2CC(C)(C)C[C@@H]12
1695	N/C=C\\C=C(\\N)O
1696	CC(C)(C)/C(C#CC#C/C(=C\\N)C(C)(C)C)=C/N
1697	N[C@@H]1CC[C@@H](N)C1
1698	Nc1c(Cl)c2ccccc2n1N
1699	Cc1ccc(-c2ccc(N)cc2)cc1N
1700	N[C@H]1O[C@H]([C@H](N)O)CS1
1701	Nc1cccc2c1-c1c(N)cccc1/C=C\\C/C=C\\2
1702	N/C1=C/NCCC/N=C\\C(N)=C/NCCC\\N=C/1
1703	CCc1ccc2oc(N)c(N)c2c1
1704	Cc1ccc(C)c2c1[C@@H](N)c1ccccc1[C@@H]2N
1705	Nc1ccc2c(c1)oc1ccc(N)cc12
1706	CCc1cc(N)c(C)c(N)c1
1707	NN=C1CNCC(NN)=N1
1708	C[C@@H]1C[C@H](O)[C@H](CN)[C@@H]1N
1709	C[C@@H]1CC[C@]2(C)C(N)=CCC[C@@H]2[C@@]1(C)CN
1710	C#CC1C(N)=CN(c2ncccn2)C=C1N
1711	CC1(C)CCC[C@@]2(C)[C@@H]1CC=C(N)[C@]2(C)N
1712	Nc1cc(N)c(N2CCCCC2)s1
1713	Cc1sc(N)cc1N
1714	N[C@@H]1[C@@H](N)C12c1ccccc1-c1ccccc12
1715	N/C1=C(\\Cl)CCC/C(Cl)=C(/N)C1
1716	Nc1c(Br)sc(Br)c1N
1717	CN1CCCc2cc(N)cc(N)c21
1718	C=C(N)[C@H]1C/C=C(/C)CC/C=C(/N)CC1
1719	CC(C)(C)c1ccc(N)c(N)c1
1720	N[C@@H]1[C@H](N)C[C@H]2[C@H]3OO[C@H](O3)[C@@H]12
1721	N[C@@H]1C[C@H]1N
1722	NC12CCCCC1(N)CCCC2
1723	N=c1[nH]cc(CO)c(N)c1O
1724	NN1C=C([C@H]2c3ccccc3CCN2N)CCCC1
1725	NC[C@@H]1CCC[C@H]1N
1726	N[C@]1(Cl)[C@H]2CC=CC[C@@H]2[C@@](N)(Cl)[C@H]2CC=CC[C@H]21
1727	CC1=C(C)C[C@H](N)[C@@H](N)C1
1728	Nc1[nH]c2ccc(Cl)cc2c1N
1729	CC1(C)OCc2c(N)c[nH]c(=N)c2O1
1730	C[C@H]1CC[C@H](N)[C@@H]1CN
1731	Nc1nc2cc(Cl)c(Cl)cc2nc1N
1732	NC[C@H]1CCc2cccc(N)c21
1733	CC1(C)C(N)=C(Cl)NC(Cl)=C1N
1734	CC1(C)CC[C@H](O)[C@@]2(C)[C@H](N)C(N)=CC[C@H]12
1735	Nc1cnc2c(N)sc3cc(-c4ccccc4)nc1-n-3-2
1736	Nc1c(O)cc2c(c1O)C(=O)c1cc(O)c(N)c(O)c1C2=O
1737	C[C@H]1C(=O)O[C@@H]2/C=C(/N)CC/C=C(/N)CC[C@@H]21
1738	N[C@H]1CCC[C@@H](N)CCC1
1739	COc1c(C)c(O)c(N)c(N)c1O
1740	NC1=CNC(Cl)=C(N)C1
1741	Nc1cc(N)c(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)s1
1742	C#CC1C(N)=CN(CC)C=C1N
1743	C[C@]1(CN)CC[C@]2(O)CC[C@@]1(C)[C@@]2(C)N
1744	Nc1[nH]c(N)c(Br)c1Br
1745	N#CC1=C(c2ccc(Cl)cc2)[C@@H](N)S/C1=C/N
1746	Nc1cnc2ncc(N)cc2c1
1747	CN(N)c1ccccc1N
1748	Nc1cccc2c1Oc1cccc(N)c1O2
1749	C/C(N)=C/C=C(/C)N
1750	Nc1nnc2ccccc2c1N
1751	NO[C@@H]1Cc2ccccc2N(N)C1
1752	Nc1c(Cl)sc(Cl)c1N
1753	CC(=O)O[C@@H]1CC[C@@H]2C[C@]2(N)[C@@H]1N
1754	COC(=O)C1=C(C)C[C@@H]2[C@@H]1C=C(N)[C@]1(N)C[C@]21C
1755	Cc1cc(N)c(S(=O)(=O)C(C)(C)C)c(N)c1
1756	Cc1cc(N(C)C)c(N)c(C)c1N
1757	NC1=C(N)[C@@H]2C=C[C@H]1c1cc3ccccc3cc12
1758	CC(C)(C)N1CN(N)CN(N)C1
1759	NC1=Cc2ccccc2N(N)c2ccccc21
1760	CCn1c(Cl)c(N)c2cccc(N)c21
1761	Nc1cscc1-c1ccsc1N
1762	Cc1ccc2c(ccc3c(N)c(C)c(N)n32)c1
1764	NC1=C2c3cc4c(cc3CCN2[C@H]2O[C@@H]1N1CCc3cc5c(cc3C1=C2N)OCO5)OCO4
1765	N[C@H]1CCC[C@H]1[C@H]1CCC[C@@H]1N
1766	Cc1cc(-c2cc(C)sc2N)c(N)s1
1767	CC[C@]12CCCn3c(N)c(N)c(c31)-c1ccccc1N=C(O)CC2
1768	Cc1cc2c(cc1N)[C@@H]1c3ccccc3[C@H]2c2ccc(N)cc21
1769	Nc1ccn(-n2cccc2N)c1
1770	CN1[C@@H](N)C=C[C@@H]1N
1771	NC1=CC[C@@H](N)CC1
1772	NN1CCN(N)[C@H](c2ccccc2)c2ccccc2C1
1773	CC(=O)O[C@@H]1[C@@H]2CC(C)(C)C[C@@H]2[C@@]2(C)C[C@@]2(N)[C@H]1N
1774	CCOC(=O)N1C[C@@H](N)CC[C@@H]1N
1775	C=C1[C@@H](C)CC[C@@]2(C)[C@@H]1CC=C(N)[C@@]2(N)O
1776	Cc1[nH]c2c(c1N)C(Cl)=C(N)CC2
1777	NC1=CC(N)=C(C2C=CC=CC=C2)/C1=C/O
1778	Cc1cc(C)c2cc(N)c(N)c-2c(C)c1
1779	Cc1c(N)n(N)c2c(Cl)cc(Cl)cc12
1780	N/C=C/c1cccc(N)c1
1781	Nc1sc(N)c2c1Nc1ccccc1N2
1782	C[C@@H](N)C#C/C=C/[C@@H](C)N
1783	Nc1cnc2c(N)sc3cccc1-n-3-2
1784	Cc1cccc2oc(N)c(N)c12
1785	N=c1[nH]c2ccccc2cc1NN
1786	CN1C[C@@H](N)[C@H](ON)[C@H]2c3ccccc3CC[C@@H]21
1787	Nc1ccc(N2CCN(N)CC2)cc1Cl
1788	Cc1cc(C(C)(C)C)cc(C)c2c(N)c(N)cc1-2
1789	NC1=C(N)/C=C\\C=C/C=C1
1790	C=C(N)[C@@H]1C[C@H](O)C(C)=C1N
1791	N/C1=C/Nc2ccccc2/N=C/C(N)=C\\Nc2ccccc2N=C1
1792	COc1c(N)cc(N)c(O)c1C
1793	CC(C)(N)/C=C/N
1794	CC1=C(N)C(=O)N2C(=C(N)CC[C@@H]2C)N1
1795	Nc1c(O)nc2c(ccc3c(O)c(N)c(O)nc32)c1O
1796	Nc1cc(N)c2ccc3cccc4ccc1n4-n32
1797	Nc1c2ccccc2c(N)c2cc(F)ccc12
1798	Cc1cc(-c2cc(C)c(N)s2)sc1N
1799	COC(C#CN)(C#CN)c1ccc(C(C)(C)C)cc1
1800	CC1(C)C2C3C(C)(C)C4(O)C(=O)C3(N)C4(Cl)C3(Cl)C(=O)C1(O)C23N
1801	Nc1cc(N)cc([C@@H]2O/C=C\\c3occc3O/C=C/c3occc3O2)c1
1802	C[C@]12CC[C@H]3[C@H](CC[C@@]4(/C=C/N)CC(=O)CC[C@@]34C)[C@@H]1CC[C@H]2N
1803	Nc1ccc2c(c1)CC[C@H]1CCc3cc(N)ccc3[C@@H]21
1804	Nc1c[nH]c2ccc3[nH]cc(N)c3c12
1805	C[C@H]1CCC[C@@](C)(N)[C@H]1N
1806	Nc1ccc(N)n1[C@H]1CCOC1=O
1807	Nc1cc(N)c(Br)cc1O
1808	COc1cc2c(cc1N)C(Cl)=C(N)C(C)(C)O2
1809	Nc1cc2cccc3cccc(cc1N)c32
1810	Cn1ncc(N)c1NN
1811	C[C@]1(N)CCC[C@@]2(N)[C@H]1CC[C@@]13C[C@@H](CC[C@H]12)[C@](C)(O)C3
1812	C[C@H](N)[C@@H]1CC[C@@H](C)[C@H]1N
1813	C[C@H]1CN(N)CCN1N
1814	C[C@]12CCC[C@@H](N)[C@@H]1N(N)c1ccccc12
1815	Nc1c2cccccc2n2c(N)c(-c3ccccc3)nc12
1816	CC[C@@]1(N)CC=C(N)CC1
1817	NN/C(N)=C\\O
1818	N/C=C/[C@@H]1C=CC=C1N
1819	Nc1cc(-c2cc(N)on2)no1
1820	Nc1c2c(c(N)c3ccccc13)-c1cccc3cccc-2c13
1821	CC1(C)C=C[C@@H](O)[C@@]2(C)[C@@H](N)C(N)=CC[C@H]12
1822	C/C(N)=C/CN
1823	CC(C)(C)S(=O)(=O)c1c(N)cccc1N
1824	Nc1ccc(-c2ccc(N)s2)[nH]1
1825	CC1(C)CCC[C@]2(C)[C@H]1CC[C@]1(C)[C@H]2CC=C(N)[C@@H]1N
1826	CC(C)(N)C#C/C=C/C#CC(C)(C)N
1827	N=c1ccc2c(ccc3[nH]c(=N)ccc32)[nH]1
1828	CCn1c(N)ccc1N
1829	C[C@H]1CC[C@@H]2C(C)(C)[C@@H](O)[C@@H](O)C[C@@]2(C)[C@]12Cc1c(O)cc(N)c(N)c1O2
1830	Nc1cccc(N)c1S
1831	Nc1c2ccccc2c(-c2c3ccccc3c(N)c3ccccc23)c2ccccc12
1832	CC1=CC(=O)[C@]23CCC[C@]12[C@H](N)C[C@@]3(C)N
1833	Nc1ccsc1N
1834	Nc1cnc2c(N)sc3cc(-c4ccccc4)cc1-n-3-2
1835	N[C@H]1[C@H]2CC3=C(C[C@@H]4[C@H](N)[C@@H]4C3)C[C@@H]12
1836	NC1(C#CC2(N)CC2)CC1
1837	C[C@]1(N)CCCC[C@]1(C)CN
1838	N=c1cc(N)cc[nH]1
1839	NN1CCCCCCCCCCCCN(N)c2c(O)c(Cl)c1c(O)c2Cl
1840	Nc1cc(N)c(O)c(Br)c1O
1841	Nc1ccccc1C(=O)N1CCC[C@H]1N
1842	N/C=C/c1ccc(N)s1
1843	Nc1c(N)c2ccccc2c2ccccc12
1844	Cc1cc2ccccn2c2c(N)cc(N)c1-2
1845	N=C(O)/C=C/N
1846	NC1=CNC=C(N)C1c1ccccc1F
1847	N[C@H]1[C@H]2CC[C@H](c3ccccc32)[C@@H]1N
1848	N[C@H]1CC/C=C\\CC/C=C\\CC[C@@H]1N
1849	N[C@@H]1[C@H](N)[C@@H]1c1ccccc1
1850	C[C@@H]1C=C(N)[C@H](N)[C@@H](O)[C@H]2CC(C)(C)C[C@H]12
1851	NC1=C/C=C2/C=C\\C(=C1N)CCc1ccc(cc1)CC2
1852	C[C@@]1([C@@H]2CC[C@@]3(C)[C@H](CC[C@@]3(C)O)[C@@H]2N)C=CC(=O)C=C1N
1853	N[C@H]1C[C@@H](N)[C@@H]2CCC[C@H]12
1854	Nc1oc(CCl)c(N)c(=O)c1O
1855	CC1=C(N)C(C)(C)[C@@H](N)CC1
1856	C/C=C1\\CN(N)[C@H]2C[C@@H]1[C@H](C(=O)OC)[C@@]13CC(=O)O[C@@]21N(N)c1ccccc13
1857	Cc1cc2cc(N)c1CCc1c(C)cc(cc1N)CC2
1858	CC(=O)SC1CN(N)N(N)C1
1859	CC1(C)CCC[C@@](C)([C@@H]2[C@H]3C[C@H]4C[C@]2(N)C[C@@]4(C)O3)[C@@H]1N
1860	Cc1cc(C)c(N)c(-c2cc(C)cc(C)c2N)c1
1861	C/C(N)=C(\\C)C#CC#C/C(C)=C(\\C)N
1862	CC1(C)CCC[C@@]2(C)[C@@H]1[C@H](O)C=C(N)[C@]2(N)O
1863	Nc1cc2cc3cc(N)sc3cc2s1
1864	COC(=O)[C@]1(C)CC[C@H]2[C@](N)(CC[C@@H]3[C@@](C)(N)CCC[C@]32C)C1
1865	NN1CCC[C@H]1[C@H]1c2[nH]c3ccc(Br)cc3c2CCN1N
1866	CC1=C(N)C(C)(C)CC[C@H]1N
1867	Cc1ccc(N)c(C)c1N
1868	C/C=c1\\c2c(/c(=C\\C)c3c1[C@H](C)[C@H](N)C[C@H]3C)[C@@H](C)C[C@H](N)[C@H]2C
1869	CC(=O)Oc1c(Br)c(N)c(N)c(Br)c1Br
1870	CN1C=C(N)[C@H]2C[C@@H]1C(N)=CN2C
1871	C/C(N)=C\\c1ccc(N)o1
1872	N=c1cc(N)c2ccc(O)nc2[nH]1
1873	C[C@@]12CCC(=O)C=C1CC[C@H]1[C@@H]3CC[C@H](C(=N)O)[C@]3(N)C[C@H](O)[C@H]12
1874	NN1CCN(N)c2ccccc2NC(S)=NCCN=C(S)Nc2ccccc21
1875	Nc1c2c(cc3c1CC1(C3)Cc3cc4c(c(N)c3C1)CCC4)CCC2
1876	Cc1c2cc(N)c(c1C)CCc1c(N)cc(c(C)c1C)CC2
1877	CC(C)(C)c1ccc2c(N)c3ccccc3c(N)c2c1
1878	CC(C)(C)S(=O)(=O)c1cc(N)sc1N
1879	NC1=Cc2ccccc2C=C(N)O1
1880	Nc1ccc(N)c2c1C(=O)c1ccccc1-2
1881	NN1CCOCCN(N)c2ccccc2NCCOCCNc2ccccc21
1882	N[C@]12CCCC[C@]1(N)C2
1883	Cc1cc2c(cc1C)[C@H](N)c1ccccc1[C@@H]2N
1884	Nc1ccc2nc(N)cn2c1
1885	NC1=CC=CC=C(C2=CC=CC=C(N)C2)C1
1886	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@H](N)[C@@H]3C)[C@@H](C)[C@@H](N)C[C@H]2C
1887	N=c1[nH]c2c(N)nn(-c3ccccc3)c2o1
1888	Nc1ccc2c(c1)[nH]c1cc(N)ccc12
1889	COc1cc(N)c2c(c1C)OC(=O)c1c(C)c(Cl)c(O)c(N)c1O2
1890	COc1ccc2c(c1N)Oc1ccc(O)c(N)c1O2
1891	CC(C)/C(N)=C\\N
1892	NC1=C(N)[C@H]2c3ccccc3[C@@H]1c1ccccc12
1893	NO[C@@H]1[C@@H](N)[C@H]2[C@H](O)CC[C@@H]12
1894	Nc1cc(C(F)(C(F)(F)F)C(F)(F)F)cc(N)c1O
1895	Cc1cc(N(C)C)c(N)cc1N
1896	N[C@H]1[C@@H]2CC=CC[C@H]2[C@@H](N)[C@@H]2CC=CC[C@@H]12
1897	NC1C2C3CC4C2C(N)C2C5CC(C12)C1C3C4C51
1898	N[C@H]1OC2(CCCCC2)O[C@@H]1[C@@H]1OC2(CCCCC2)O[C@H]1N
1899	CS[C@]1(N)C[C@@H]1N
1900	CC1(C)C=C(c2ccc(N)s2)CC(C)(C)N1N
1901	Cc1c(N)c2sccn2c1N
1902	N/C=C\\C1=CC2=CC=CC=C3C=C(N)[C@@H]1C[C@H]32
1903	N[C@]12CC=CC[C@@]1(N)C2
1904	CC1(C)CC2(CC(C)(C)c3cc(N)ccc32)c2ccc(N)cc21
1905	NC1=C(Cl)c2cc3c(cc2CC1)CCc1cc2c(cc1-3)C(Cl)=C(N)CC2
1906	CN1C(Cl)=C(N)C(C)(C)C(N)=C1Cl
1907	C[C@@H](N)[C@H]1O[C@H](N)[C@@H]2OC(C)(C)O[C@@H]21
1908	N[C@H]1[C@@H](c2ccccc2)C[C@@H](N)[C@]23OCCO[C@]12OCCO3
1909	N[C@H]1C[C@@H]([C@H]2CCC(=O)[C@H](N)C2)CCC1=O
1910	Nc1ccc2ccc3ccc4ccc5ccc6ccc(N)cc6c5c4c3c2c1
1911	NC1=C(N)[C@H]2C=C[C@@H]1C2
1912	Cc1sc(C)c2cc(N)c(N)cc12
1913	NC1=C[C@H]2[C@H]3C=C[C@@H]1C(N)=C[C@@H]23
1914	N[C@H]1C[C@H]1[C@H]1C[C@@H]1N
1915	NC12CCCC(N)(C1)C2
1916	N/C=C\\C(O)=C\\N
1917	NC1=C(C2=C(N)CCCCC2)CCCCC1
1918	CCn1c(C)c(N)c(N)c1C
1919	NC1=C(N)[C@@H]2C=C[C@@H]3[C@H]1[C@@H]3C=C2
1920	Nc1c(Cl)nc(Cl)c(N)c1-c1cccc(C(F)(F)F)c1
1921	Nc1ccccc1-c1cc2c(ccc3ccccc32)cc1N
1922	CC1(C)C/C=C(/N)CC/C=C(\\N)C[C@H]2O[C@@H]21
1923	CC(O)=Nc1sc(N)cc1N
1924	C[C@]12CCC[C@@](C)(N)[C@H]1CC[C@]1(N)OC(=O)CC[C@@H]12
1925	C[C@@]12OO[C@@H](O1)[C@H]1C[C@H](N)[C@@H](N)[C@H]12
1926	Cc1cc2c(ccc3sc(N)c(-c4c(N)sc5ccc6sc(C)cc6c45)c32)s1
1927	N/N=c1/c2ccccc2c2nc3c(nc12)/c(=N/N)c1ccccc13
1928	Nc1sc(-c2cc(C#Cc3ccccc3)c(N)s2)cc1C#Cc1ccccc1
1929	Nc1cn(-c2ccccc2)cc1N
1930	Nc1c(O)cc(Cl)c(N)c1O
1931	COc1c(C)c2c(c(N)c1Cl)Oc1c(N)c(O)c(Cl)c(C)c1C(=O)O2
1932	Cc1[nH]c2c(c1N)Sc1[nH]c(C)c(N)c1S2
1933	NC(=C\\O)/C(N)=C/O
1934	Nc1cc2ccccc2c2c1OCOc1c(N)cc3ccccc3c1-2
1935	C#CC1C(N)=CN(c2ccc(C)cc2)C=C1N
1936	Cc1c(N)cc(N)n1C
1937	C#CC1C(N)=CN(c2ccccc2C)C=C1N
1938	CN(C)c1cc(Cl)c(N)cc1N
1939	Nc1cccc2c1[C@H]1c3ccccc3[C@@H]2c2c(N)cccc21
1940	N=c1cc[nH]cc1N
1941	Nc1ccc2ccc3ccc4ccc5ccc6ccc(N)c7c6c5c4c3c2c1-7
1942	N[C@H]1CCC[C@@H]1N
1943	NN=C(O)c1ccc2c(c1N)Oc1ccccc1O2
1944	C#CC1C(N)=CN(c2cc(C)cc(C)c2)C=C1N
1945	CN1C=CC(=C2C=C(N)S(=O)(=O)C(N)=C2c2ccccc2)C=C1
1946	NC1=CCC=C1N
1947	Nc1c2c(cc3c1CC1(C3)Cc3cc4c(c(N)c3C1)CCCC4)CCCC2
1948	Cc1c(N)ccc2c(N)cccc12
1949	CC1=C(N)[C@H]2[C@H](C(C)C)CC[C@]1(C)[C@@H]2N
1950	Cc1ccc(C)c2cc(N)c(N)cc12
1951	N[C@H]1c2ccccc2[C@@H](N)c2ccc(Cl)cc21
1952	NC1=CC=C[C@H]1N
1953	NC1=CC[C@H]2C(Cl)=C(N)C[C@@H]12
1954	N[C@H]1[C@H]2C=C[C@@H]([C@H]1C1(N)CC1)C21CC1
1955	Nc1c2ccccc2cc2c(N)c3ccccc3cc12
1956	CC1(C)C[C@@H]2C=C(N)[C@]3(N)C[C@@]3(C)[C@@H]2C1
1957	N[C@H]1c2ccccc2[C@@H](N)c2cc3ccccc3cc21
1958	N[C@H]1C[C@H](N)C1
1959	NC1=C(N)c2cc(Cl)ccc2Cc2ccccc21
1960	Nc1cc(N)c2c(c1)CCCCC2
1961	NC1=C/C(=C\\O)C(Cl)=C(N)C1
1962	Cc1c(-c2csc(N)c2C)csc1N
1963	C[C@@]1(O)c2ccoc2[C@H](O)[C@](C)([C@@]2(O)CCCC[C@@H]2N)[C@H]1N
1964	C#CC1C(N)=CN(C(=O)c2ccccc2)C=C1N
1965	Nc1cnc2c(N)sc3nc(-c4ccccc4)cc1-n-3-2
1966	CC(=O)O[C@H]1C[C@H](C)[C@@H](N)[C@@]2(O)[C@H]1C(C)(C)C[C@@]2(C)N
1967	CC(C)(C)c1cc(N)c(N)o1
1968	N/C=C/[C@H](N)Br
1969	NOC(=O)ON
1970	Nc1cccc2c1-c1cccc(N)c1-2
1971	N[C@]12CCC[C@@]1(N)C2
1972	CSc1cc(N)cc(N)c1
1973	C/C(C#C/C(C)=C/N)=C/N
1974	NC1=C(N)[C@H]2C=C[C@@H]1CC2
1975	Nc1ccc(O)c(N)c1I
1976	NC[C@]12CCCN3CC[C@H]4c5ccccc5N(N)[C@@]4(CC1)[C@H]32
1977	C[C@]12CCCC(N)=C1N(N)c1ccccc12
1978	N[C@]12C=C[C@](N)(OO1)O2
1979	NC1=CC2=CC3=CC4=CC=CC=C(C=C(C=C(C=C(N)C1)C2)C3)C4
1980	CC(=O)n1cc(N)c2c3[nH]cc(N)c3ccc21
1981	N=C(O)[C@H]1CC2(C[C@@H]1N)OCCO2
1982	NNc1cc2c(cc1N)OCO2
1983	N[C@H]1C[C@@H](N)[C@@H]2C=CC[C@H]12
1984	Cc1ccc(-c2cc(N)cc(N)c2)cc1
1985	NC[C@@H]1[C@H](N)[C@H](O)C[C@H]1O
1986	Cc1cc(Br)c2c(c1)c(C)c(N)n2N
1987	C=C(N)[C@H]1CC[C@H](C)[C@@H]1N
1988	CC(C)(N)[C@H]1C[C@H](N)c2ccccc21
1989	NN1C=C([C@H]2CCCN2N)CCC1
1990	NN1c2ccccc2N(N)c2nc3ccccc3nc21
1991	N=C1NNc2c(N)nn(-c3ccccc3)c2O1
1992	NC1=C(C2=C(N)CCC2)CCC1
1993	N/C=C/c1c(Br)cc(Br)c(O)c1N
1994	C#C[C@@]1(ON)CC[C@H]2[C@H]3CC[C@H]4Cc5oc(N)cc5C[C@@]4(C)[C@H]3CC[C@@]21C
1995	Nc1c(-c2ccc(Cl)cc2)c(N)n2c1sc1ccccc12
1996	CC[C@]1(N)CCCN2CCc3c(n(N)c4ccccc34)[C@H]21
1997	C#CC1C(N)=CN(C(C)=O)C=C1N
1998	Nc1ccc2cccc(N)c2c1O
1999	Nc1coc(-c2ccc3c(c2)OCO3)c1N
2000	CC1(C)C[C@@H]2C=C(N)[C@]3(N)C[C@]3(C(=O)OC(C)(C)C)[C@H]2C1
2001	C/C=C1\\CN(N)[C@@H]2C[C@H]1[C@@H](C(=O)OC)[C@@]13C[C@H](O)O[C@@]21N(N)c1ccccc13
2002	Nc1ccc(C(F)(F)F)cc1-c1cc(C(F)(F)F)ccc1N
2003	CC/C(N)=C/N
2004	N=c1[nH]c(-c2csc(=N)[nH]2)cs1
2005	CC1=C(N)[C@](C)(N)CCC1
2006	Cc1c(N)cc(N)c(O)c1C
2007	C[C@@H]1CC[C@@H](CN)[C@@H]1N
2008	NC1=CO[C@H]2O[C@@H]1OC=C2N
2009	Cc1ccc(C)c2c1C[C@H](ON)[C@H]1[C@H]2[C@]2(O)OC[C@@]1(N)[C@H](C)[C@H]2O
2010	CC1=C(N)C=C(N)/C1=C\\O
2011	Nc1cccc2c1Oc1c(N)cccc1N2
2012	CCc1cc(N)cc(N)c1
2013	NC1=CS/C(=C2\\SC=C(N)S2)S1
2014	N/C=C(/N)c1cccs1
2015	C[C@@H]1CCC[C@@](C)(N)CCC2=C1[C@](C)(CN)CC2(C)C
2016	CC(C)(N)[C@H]1CCC[C@@H]1N
2017	C#CC1C(N)=CN(C)C=C1N
2018	N=c1[nH][nH]cc1N
2019	CN1c2ccccc2C(N)=C(N2CCN(N)CC2)c2sccc21
2020	CC(=O)O[C@H]1CC[C@@]2(C)C[C@@]2(N)[C@@H]1N
2021	Cc1cccc2c(N)c(N)oc12
2022	Cc1cc2c(cc1C)Nc1c(N)sc(N)c1N2
2023	N/C=C/[C@H](N)I
2024	Cc1cc(-c2cc(C)c(N)[nH]2)[nH]c1N
2025	CCC1=C(N)[C@H](N)[C@@H](O)CC1
2026	CC(C)(C)C(=O)c1cc(N)[nH]c1N
2027	N#Cc1ccc2c(N)cnc3c(N)sc1-n-2-3
2028	CC1(C)C(=O)[C@@H](N)[C@@H](N)C1=O
2029	Nc1cc(Br)c(-c2oc(N)cc2Br)o1
2030	NN1CCN(N)c2ccccc21
2031	Nc1c2ccccc2c(N)c2c(F)cccc12
2032	CC(=O)O[C@H]1[C@]2(O)CC(C)(C)CC2=C(N)[C@@]2(N)C[C@@]12C
2033	CC1(C)O[C@H](N)[C@@H]2[C@@H](C(=N)O)C(=O)c3ccccc3[C@@]2(C)O1
2034	Nc1c2ccccc2c(N)c2ncccc12
2035	N[C@]12CCCC[C@@]1(N)CC2
2036	CC(=O)[C@@H]1C(C)(C)C[C@]2(C)C[C@H](N)C[C@]12N
2037	N[C@@H]1[C@H]2CC[C@H](C2)[C@H]1N
2038	Nc1ccc(-c2ccc(N)cc2Cl)cc1
2039	CN1C=C(N)C=C[C@@H]1c1c(N)[nH]c2ccccc12
2040	CC1=C(N)C(C)(C)[C@]2(CC1)OC(C)(C)O[C@H]2[C@H]1CCCC[C@@H]1N
2041	Cn1cc(N)c2nc3c(N)cnc(O)c3c(-c3ccccc3)c2c1=O
2042	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@H](N)[C@H]3C)[C@@H](C)C[C@H](N)[C@@H]2C
2043	C#CC1C(N)=CN(C(C)(C)C)C=C1N
2044	N[C@H]1c2ccccc2[C@@H](N)c2cccc(Cl)c21
2045	C[C@H]1[C@H](O)C[C@@H]2C(C)(C)[C@H](O)CC[C@@]2(C)[C@@]12Cc1c(O)cc(N)c(N)c1O2
2046	COc1cc(N)c(N)c2c1C[C@]1(O2)[C@H](C)CC[C@@H]2C(C)(C)C=CC[C@]21C
2047	C#CC1C(N)=CN(c2nc(C)cc(C)n2)C=C1N
2048	Cc1c2ccc3ccc4c(N)cc(ccc5cc(N)c(cc2)c1c5C)c(C)c4c3C
2049	Nc1c[nH]c(-c2nc(N)c[nH]2)n1
2050	CC(=O)O[C@H]1C=C(N)[C@@](N)(O)[C@]2(C)CCCC(C)(C)[C@@H]12
2051	Nc1ccc2cc1CCc1ccc(N)c(c1)CC2
2052	NC[C@@H]1O[C@H](N)C[C@@H](O)[C@H]1O
2053	Nc1ccc(Cl)cc1-c1cc(Cl)ccc1N
2054	NO[C@@H]1Oc2ccccc2C(=O)N1N
2055	Cc1c(N)c(-c2ccccc2N)cc2ccccc12
2056	COc1c(N)sc2c(N)c3cccccc-3c12
2057	N[C@H]1C[C@@H](N)c2ccc3cc[nH]c3c21
2058	COc1cc(O)c(N)c(O)c1N
2059	Cn1cc(N)c2nc3c(N)cn(C)c(=O)c3c(-c3ccccc3)c2c1=O
2060	Cc1cc(C)cc2c(N)cc(N)c-2c1
2061	NN1Cc2ccccc2CN(N)c2cc(Cl)ccc21
2062	CC(=O)O[C@@H]1[C@H]2C=C(N)[C@]3(N)C[C@@]3(C)[C@@H]2CC1(C)C
2063	CC(C)(C)N(N)/C=C/N
2064	Nc1cc(N)cc([C@@H]2OC=Cc3occc3O2)c1
2065	C[C@H](N)N(C)N
2066	NC[C@H]1C=C[C@H]2[C@H](N)[C@@H]12
2067	CC1(C)O[C@H]2[C@@H](N)C[C@H](N)[C@H]2O1
2068	Cc1cc(Cl)c2c(c1)c(C)c(N)n2N
2069	Nc1oc2c(Cl)cccc2c1N
2070	Nc1cc(Br)c(O)c(N)c1O
2071	COc1c(N)c2c3c(c1N)O[C@@]1(C[C@H]3CC(C)(C)O2)[C@H]2CC[C@H](C2)C1(C)C
2072	Cc1ccc(-c2cc(N)cc(N)c2C)cc1
2073	CC(C)[C@@H]1CC[C@]2(C)[C@@H](N)[C@H]1[C@H](N)[C@]2(C)O
2074	CC(C)(C)/C(C#CC#C/C(=C/N)C(C)(C)C)=C/N
2075	NO[C@@H]1C[C@H]1N
2076	Nc1cnc2c(N)c3cccccc3n2c1=O
2077	N[C@@H]1[C@@H]2CC[C@@H](O2)[C@H]1N
2078	Nc1cc(-c2cc(N)c3ccccc3n2)nc2ccccc12
2079	Nc1cc2ccc3[nH]cc(N)c3c2[nH]1
2080	Cc1c(N)c2cc(c1N)CCc1cccc(c1)CC2
2081	NO[C@H]1CC[C@@H]2CN3CCc4c([nH]c5ccccc45)[C@@H]3C[C@@H]2[C@H]1N
2082	Nc1ccc2c(c1)C1(c3ccccc3-2)c2ccccc2-c2ccc(N)cc21
2083	N[C@@H]1[C@@H]2C=C[C@@H](C2)[C@H]1N
2084	NC[C@@H]1c2ccccc2CCN1N
2085	CC1=C(C(=O)O)[C@H]2C=C(N)[C@@]3(N)C[C@@]3(C)[C@@H]2C1
2086	NN1C=C([C@H]2CCCN2N)CC1
2087	C[C@]12C(=O)C(N)=C(O)[C@](C)(C1=O)[C@@]1(C)C(=O)C(N)=C(O)[C@]2(C)C1=O
2088	Nc1c[nH]c(N)c1Cl
2089	CC(C)(C)[C@@H]1CN(N)c2ccccc2N1N
2090	Nc1c(N)c(Br)c(Br)c(O)c1Br
2091	Cn1c2ccccc2c2nc3c(nc21)N=C(O)N1[C@H]3OC[C@@H](N)O[C@@H]1N
2092	CC(=O)O/C(N)=C(\\N)Br
2093	Nc1ccc(-c2ccc(N)o2)o1
2094	Cc1c2cc(N)c(c1C)CCc1cc(N)c(c(C)c1C)CC2
2095	Nc1ccccc1-c1ccc2c(N)cccc2c1
2096	NC1=C(N)Sc2sc(=O)sc2S1
2097	CC1=C(N)[C@@](C)(N)c2ccccc21
2098	Nc1c2cccc(F)c2c(N)c2cccc(F)c12
2099	C#CC1C(N)=CN(c2cccc3ccccc23)C=C1N
2100	Cc1ccc2cc(-c3ccccc3N)c(N)c3c2c1CC3
2101	Cc1cc(Br)c2[nH]c(N)c(N)c2c1
2102	Nc1cccc2sc3cccc4cc(N)n(c12)c43
2103	CC1(C)/C=C\\C/C(N)=C\\CC/C(N)=C\\C1
2104	Nc1ccccc1-c1cccnc1N
2105	CC(=O)[C@]1(C)[C@H](N)C[C@]2(N)CC(C)(C)C[C@H]12
2106	N/C=C(\\N)Br
2107	N#C/C(N)=C\\CN
2108	C[C@H]1CCc2c(cc(N)c(F)c2N)N1
2109	N/C=C/C(O)=C\\N
2110	N/C1=C/C2=Cc3ccccc3C=C(/C=C(/N)C1)C2
2111	Nc1cc(N)c2c(c1O)CCC2
2112	Cc1c(N)n(N)c2c(C)cc(Cl)cc12
2113	NN1CCN(N)c2ccccc2NC(S)=NCCCCN=C(S)Nc2ccccc21
2114	N[C@]12O[C@@H]3CC[C@H]4[C@H]5[C@H]([C@H]6[C@@H]1[C@@H]1CC[C@H]7O[C@]5(N)[C@@H]6[C@H]71)[C@H]2[C@H]34
2115	N[C@H]1C2[C@H](N)[C@H]21
2116	Nc1cccc2ccc3c4ccccc4cc(N)c3c12
2117	Nc1cc(I)c(N)[nH]1
2118	Cc1cc2c(cc1N)CC1(C2)Cc2cc(C)c(N)cc2C1
2119	N[C@@]12O[C@]1(N)[C@H]1C[C@@H]2c2ccccc21
2120	N=c1ccc2ccc(N)cc2[nH]1
2121	C=C(N)[C@H]1CC[C@]2(C)CCCC(N)=C2C1
2122	CN1C=C(N)C=C[C@@H]1c1c(N)n(C)c2ccccc12
2123	Cc1ccc2c(N)c3ccccc3c(N)c2c1Cl
2124	C=C1[C@H](N)[C@@](C)(N)CC[C@H]1O
2125	NC1=C(N)SC(=C2SC3=C(SCCS3)S2)S1
2126	NC#Cc1ccc(C#CN)s1
2127	Nc1cc(N)c(O)c(CCl)c1
2128	CC1(C)C[C@H]2[C@@H](C1)[C@H]1O[C@]2(C)CC(N)=C1N
2129	N[C@@H]1CCCC/C1=C1\\CCCC[C@H]1N
2130	NN=C(O)N=C(O)NN
2131	Nc1ccc2c(N)c(O)ccc2c1O
2132	N[C@H]1CCCCCCCC[C@@H](N)CCCCCCCC1
2133	C=C1CC[C@@H]2[C@@H]([C@H](C(=C)N)[C@@H]1N)C2(C)C
2134	CC1(C)CCC[C@@]2(C)[C@@H]1CC=C(N)[C@]2(N)O
2135	NC1=C(O)[C@@H]2CCC(N)=C(O)[C@@H]2CC1
2136	NN=C1NN(N)[C@@H](c2ccccc2)S1
2137	Nc1cc(N)cc(CCl)c1
2138	CC1=C(C)[C@H]2CC=C(N)[C@H](N)[C@]2(C)CC1
2139	CC1(C)C[C@H]2C[C@@]3(Oc4c(N)c(O)c(N)c(c42)O1)[C@@H]1CC[C@@H](C1)C3(C)C
2140	NN1CCN(N)c2ccccc2NC(S)=NCC(O)CN=C(S)Nc2ccccc21
2141	Nc1cccc2ccc3cccc(N)c3c12
2142	CC1(C)C(=O)[C@@H]2O[C@@H]2[C@]2(C)[C@H](N)C(N)=CC[C@H]12
2143	Nc1cnc2c(N)sc3nc(C(F)(F)F)cc1-n-3-2
2144	Cc1ccc(-c2c(N)c(N)c(Cl)n2C)cc1
2145	N[C@H]1C[C@H]2C(=O)[C@H](N)C[C@H]2C1=O
2146	C[C@H]1C[C@H](N)C[C@@H]1N
2147	Nc1c[nH]c2cc3[nH]cc(N)c3cc12
2148	N[C@]12CCC[C@@]1(N)CC2
2149	CO[C@@]12OO[C@@H](O1)[C@@H]1C[C@@H](N)[C@@H](N)[C@@H]12
2150	Nc1c2ccc(ccc3ccc(o3)c(N)c3ccc(ccc4ccc1o4)o3)o2
2151	Nc1ccc(N)n1-c1ccccc1
2152	C/C=C1/CN2CC[C@@]34c5ccccc5N(N)[C@@H]3[C@H](N)[C@@H]1C[C@@H]24
2153	Nc1cc2c3ccc(ccc1-3)CCc1ccc3c(N)cc(c-3cc1)CC2
2154	CS(C)=C1C(N)=CC=C1N
2155	CC1(C)C(N)=C(Cl)CC(Cl)=C1N
2156	N/C1=C/C2=CC=CC=C(/C=C(/N)CC1)C2
2157	Nc1cc(N)c2cccnc2c1O
2158	COc1c(N)cc(C(F)(F)F)cc1N
2159	COC1[C@@H](N)CC[C@@H]1N
2160	NC1=C(N)Sc2sc(=S)sc2S1
2161	CC1(C)[C@@H](O)CC[C@]2(C)[C@H](N)C(N)=CC[C@H]12
2162	Nc1ccc2c(c1)C(=O)c1cc(N)ccc1C2=O
2163	COc1c(C)c(C)c(O)c(N)c1N
2164	Nc1cc(Br)c(N)[nH]1
2165	Nc1cc(N)c(O)c(Br)c1
2166	CC(C)(C)c1ccc(N)cc1N
2167	CC1=C(N)[C@@H]([C@H](C)N)CC1
2168	CC1(C)[C@@H]2CC[C@@H](N)[C@]23C[C@H]1CC=C3N
2169	Cn1c(Cl)c(N)c(N)c1-c1ccccc1
2170	Nc1cc(N)c(Cl)s1
2171	Cc1cc(O)c(N)c(C)c1N
2172	Cc1cccc(N)c1-c1cc2ccccc2cc1N
2173	N=c1[nH]c2cc(N)ccc2s1
2174	C/C(N)=C(/C)N
2175	CC1(C)CCC[C@]2(C)[C@@H](N)C(N)=CC[C@H]12
2176	Nc1cccc2c1[C@H]1c3ccccc3[C@@H]2c2cccc(N)c21
2177	C=C(C)[C@H]1C[C@](C)(N)C[C@]1(C)N
2178	N[C@@H]1c2ccccc2[C@@H]2[C@@H](N)[C@H]12
2179	N[C@H]1C[C@]12C[C@H]2N
2180	COc1ccc2c(C)nn(N)c3ccc(N)c1c23
2181	NC[C@H]1Cc2c(N)c(O)c3ccccc3c2O1
2182	NC1=CC=CC=C2C(N)=CC=CC=C12
2183	NC1=C(N)[C@]23O[C@H]1C=C2[C@@H]1C=C[C@H]3CC1
2184	NN1C=C([C@H]2c3ccccc3CCN2N)CCC1
2185	COc1c(N)c2c3c(c1N)OC(C)(C)CC3CC(C)(C)O2
2186	NC#Cc1cccc2cc3cccc(C#CN)c3cc12
2187	NN1C2=CCCC[C@@]2(N)c2cc(Cl)ccc21
2188	Nc1ccc(N2CCN(N)CC2)cc1Br
2189	Nc1c(-c2ccccc2)c(N)n2c1sc1ccccc12
2190	CCc1c(N)cc(C)cc1N
2191	Cc1ccc(N)c(-c2ccccc2N)c1
2192	COc1c(N)cc(N)c(O)c1O
2193	Nc1ccc2c(c1-c1c(N)ccc3c1C(=O)c1cc(Cl)ccc1C3=O)C(=O)c1cc(Cl)ccc1C2=O
2194	NC1=C[C@H]2[C@H]3C=C[C@@H]1C=C(N)[C@@H]23
2195	CN1C[C@H](N)C[C@H]1N
2196	NC1=C(Br)[C@H](N)CCC1
2197	Nc1cc(N)c2cc3ccc4ccc(cc1-2)n43
2198	NC1=CC=CC=C(N)O1
2199	Nc1cc2c(o1)c1c(c3oc(N)cc32)C(=O)c2ccccc2C1=O
2200	CC(C)(N)C#CN
2201	N=C(O)[C@@H](N)Br
2202	CC1(C)C[C@H]2C[C@@H](N)[C@@]3(N)C[C@@]3(C)[C@@H]2C1
2203	N=c1[nH]c2ccccc2n1-n1c(=N)[nH]c2ccccc21
2204	C#CC1C(N)=CN(C2CCCCC2)C=C1N
2205	N[C@H]1[C@H]2C=C[C@H]3[C@H](N)[C@@H]4C=C[C@@H]1[C@H]4[C@@H]23
2206	N/C=C(\\N)c1cccs1
2207	Nc1ccc(N)c2/c1=c1/cccc/c1=C/C=c1/cccc/c1=2
2208	NC1=CC=CC=C(c2cc3cccccc-3c2N)C1
2209	N[C@]12c3ccccc3[C@H]1[C@H]1O[C@]2(N)c2ccccc21
2210	NC#CCCC#CN
2211	Nc1sc(N)c(O)c1O
2212	Nc1cc(N)cc(-c2ccccc2)c1
2213	Cn1c(Cl)c(N)c2cc(N)ccc21
2214	NC[C@H]1C(=O)O[C@H]2CC[C@@H](N)[C@H]21
2215	Cc1cc(=O)oc2c(N)c(O)c(CN)cc12
2216	N#Cc1ccc(N)c(N)c1
2217	NC1=C(C2=C(N)CCCC2)CCCC1
2218	C[C@H]1CC[C@H](N)O[C@@H]1[C@H]1O[C@@H](N)CC[C@H]1C
2219	NC1=CC(=C2C=CC=CC=C2)C=C1N
2220	C=C1C[C@H](N)C(N)=C2CC(C)(C)C[C@H]2[C@@H]1OC(C)=O
2221	Cc1cc(N)c(C)c2c1[nH]c1ccc(N(C)C)c(N)c12
2222	Nc1ccccc1-c1cc2c(ccc3ccccc32)nc1N
2223	CC(C)(C)OC(=O)n1c2cc(N)ccc2c2ccc(N)cc21
2224	N[C@]1(C(F)(F)F)CC[C@@](N)(C(F)(F)F)CC1
2225	Cn1c(=O)nc(O)c2nc(N)c(N)nc21
2226	Nc1c(O)ccc2c1Oc1ccc(O)c(N)c1O2
2227	N[C@H]1C[C@@H]2CC[C@@]3(C(=O)CC[C@@H]13)[C@@H]2N
2228	CC(=O)[C@@H]1[C@@H](N)[C@@H]2C=C[C@H]1[C@@H]2N
2229	Nc1ccccc1-c1c(N)c2ccccc2c2ccccc12
2230	COc1cc2c(cc1N)[C@@]1(C)CC[C@]3(C)C(Cl)=C(N)CC[C@]3(C)[C@H]1CC2
2231	COc1c(O)cc(N)c(N)c1O
2232	Nc1ccc(O)c(N)c1Br
2233	NC1=C(N)c2ccccc2/C1=C/O
2234	Cc1ccccc1C1C(N)=CNC=C1N
2235	NC1=C(Cl)NC(Cl)=C(N)C1c1cccc(C(F)(F)F)c1
2236	COc1cc(N)c(Br)c(N)c1
2237	NC1=CC(=O)c2cc(N)ccc2OC1
2238	C/C=c1\\c2c(/c(=C\\C)c3c1CC[C@H](N)C3)CC[C@@H](N)C2
2239	NC1=C(N)CC1
2240	Nc1cc(Br)c(N)s1
2241	Nc1ccc(N)c2c1Oc1ccccc1O2
2242	Nc1nnn(-c2ccc(Cl)cc2)c1N
2243	Nc1cc(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)c(N)s1
2244	N[C@]12c3ccccc3[C@@H]3[C@@H]4C[C@@H]4[C@H]1[C@@]32N
2245	N=c1c(N)c[nH]c2ccccc12
2246	C/C(N)=C\\[C@H](C)N
2247	Nc1ccc2c(c1-c1c(N)ccc3c1-c1ccccc1-3)-c1ccccc1-2
2248	CC1(C)CCC[C@@]2(C)[C@@H]1C(=O)C=C(N)[C@]2(N)O
2249	CC(=O)Oc1c(N)cc(C)cc1N
2250	NC1=C2c3ccccc3CCN2[C@@H]2O[C@H]1N1CCc3ccccc3C1=C2N
2251	NC1=CC=C(N)C2=CC=CC=C1C2
2252	NC1=CC2=Nc3ccccc3N=C3C=C(N)[C@H]1C[C@@H]32
2253	NC[C@@H]1CCn2c1c(N)c1cc3c(cc1c2=O)OCO3
2254	N/C=C\\c1ccccc1N
2255	CCn1c(Cl)c(N)c2cc(N)ccc21
2256	C[C@@H]1C[C@H](N)/C=C\\C=C\\[C@@H](N)C1
2257	CC1(C)[C@]2(C)N=N[C@@]1(C)[C@@H](N)[C@@H]2N
2258	Nc1cc(Cl)c2c(c1-c1c(N)cc(Cl)c3c1C(=O)c1ccccc1C3=O)C(=O)c1ccccc1C2=O
2259	C[C@H](N)[C@@H]1CCC=C1N
2260	Nc1cccc2c1[C@@H]1c3cc4ccccc4cc3[C@H]2c2c(N)cccc21
2261	Cc1cc(N)c(C)c2c1ccc1ccc3ccc4c(C)cc(N)c(C)c4c3c12
2262	Nc1sc(-c2sc(N)c(Br)c2Br)c(Br)c1Br
2263	Nc1ccc(-c2ccoc2N)[nH]1
2264	NC1=C(N)C(F)=C1F
2265	C[C@H](N)[C@H](C)N
2266	C[C@H]1OC(=O)[C@H](n2c(N)ccc2N)[C@H]1C
2267	C[C@]12CC[C@H]3[C@@H]4Cc5cc(N)oc5C[C@H]4CC[C@H]3[C@H]1CC[C@H]2ON
2268	NC12CCC(N)(C1)C2
2269	Nc1c(Cl)cc(Cl)c(N)c1Cl
2270	Cc1ccc2c(N)cccc2c1N
2271	NN1CCCN(N)c2ccccc21
2272	Nc1cc(-c2cc(N)c(O)cc2O)c(O)cc1O
2273	CC1(C)[C@@H](N)C[C@H]1CN
2274	C[C@@H]1C[C@H](N)C(N)=CC2=C1CC(C)(C)C2
2275	Nc1[nH]c2ccc(Br)cc2c1N
2276	Nc1ccc(-c2ccccc2)c(N)c1O
2277	NOc1c(N)c2ccccc2c2ccccc12
2278	CC(C)(C)S(=O)(=O)c1c(N)csc1N
2279	Nc1ccc2nc3ccc4nc5ccc(N)cc5cc4c3cc2c1
2280	N[C@@H]1C[C@H]2C[C@@H]1[C@H]1[C@@H]2[S@@]2=N[S@@]3=N[S@](=N[S@]1=N2)[C@H]1[C@@H]3[C@@H]2C[C@@H](N)[C@H]1C2
2281	NC1=COC=C(N)C1/C=C/Cl
2282	NC[C@@H]1CN(N)CCC1=O
2283	COc1ccc2c(c1)[C@]1(N)CCC[C@@](C)(N)[C@H]1CC2
2284	NC1=COC=C(N)C1/C=C\\Cl
2285	Nc1cccc2c1[C@@H]1c3cccc(N)c3[C@H]2[C@H]2Cc3cc4ccccc4cc3C[C@H]12
2286	Cc1c(C)c(N)c2c(c1C)CCc1c(N)c(C)c(C)c(C)c1CC2
2287	Nc1cc(N)c2c(c1)CCCC2
2288	Cc1csc(N)c1N
2289	N/C=C/C#C/C=C/N
2290	Nc1cc(N)c2ccccn2c1=O
2291	Nc1cc(N)c2ccccc2c1Cl
2292	CC1(C)OC[C@@H](CN)[C@@H](N)O1
2293	COc1ccc(N)c2c(O)ccc(N)c12
2294	N[C@H]1C[C@@H]2CCC[C@]2(N)C1
2295	Cc1c2ccc3cc(N)c4ccc(ccc5cc(N)c(cc2)c1c5C)c(C)c4c3C
2296	Nc1ccc2nc3c(ccc4cc5cc(N)ccc5nc43)cc2c1
2297	C=C1CC[C@H]2[C@@](C)(CCC[C@@]2(C)N)[C@H]1CN
2298	CC(=O)O[C@@H]1CC[C@H]2[C@@H]3C=Cc4c(cc(N)c(Cl)c4N)[C@@H]3CC[C@@]21C
2299	Cc1ccc2cc(N)c(N)nc2c1
2300	CC(C)(C)Oc1cc(N)sc1N
2301	NN1CCOCCNc2ccccc2N(N)CCOCCNc2ccccc21
2302	CN(N)/C(N)=C/O
2303	Cc1c(N)ccc(N)c1C
2304	Nc1cc2cnncc2cc1N
2305	Nc1cc(N)c(N2CCCC2)o1
2306	CC(C)(C)c1cc(C(C)(C)C)c(N)cc1N
2307	Nc1ccc(I)c(N)c1O
2308	C[C@@H]1CC[C@]2(C)[C@H](CC=C(N)[C@@]2(N)O)[C@]12CO2
2309	C[C@]1(N)CC[C@@H](CN)C1=O
2310	CC1(C)CCC[C@@]2(C)[C@H]1CC=C(N)[C@H]2CN
2311	N[C@@H]1CC[C@H](N)S1(=O)=O
2312	C/C(N)=C/[C@H](C)N
2313	COc1ccc(N)c(N)c1O
2314	Nc1cc(N)c2ccc3cccc4ccc1c2c43
2315	NCN1CC[C@H](O)[C@H]1N
2316	NC[C@@H]1CC(=O)[C@H]2[C@@H]3CCCC[C@H]3C(=O)C[C@]2(N)C1
2317	CCc1cc(N)c(N)cc1O
2318	NC(=C\\O)/C(N)=C\\O
2319	N/N=c1\\c2ccccc2c2nc3c(nc12)/c(=N/N)c1ccccc13
2320	NN1[C@@H](O)[C@@H](O)N(N)[C@H](O)[C@H]1O
2321	Cc1cc(N)oc1N
2322	CC1(C)O[C@H](N)[C@H]2[C@H](CN)C(=O)c3ccccc3[C@@]2(C)O1
2323	CO[C@H]1C=C[C@@H](OC)[C@@H](Cl)[C@H]1Cl
2324	COC(=O)[C@@H](Cl)CCCl
2325	FC(F)(F)c1cccc(NN=C2C(Cl)=NN=C2Cl)c1
2326	ClC1=NN=C(Cl)C1=NNc1nccnn1
2327	C[C@@](Cl)(c1ccc(Cl)cc1)[C@@H](Cl)c1ccc(Cl)cc1
2328	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(I)cc1
2329	C[C@H](Cl)[C@@H](Cl)C(=O)O
2330	C#C[C@@H](Cl)CCCCl
2331	[H]/N=C(\\Cl)c1cccc2c1CC/C2=N\\NC(=N)Cl
2332	CC(O)=Nc1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2333	CC(C)(CCl)C(C)(C)CCl
2334	Fc1ccc([C@H](Cl)[C@@H](Cl)c2ccc(F)cc2)cc1
2335	O=c1nc(O)ccn1[C@@H]1C[C@@H](Cl)[C@@H](CCl)O1
2336	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(C(=O)CCl)cc1
2337	CO[C@H]1O[C@@H](CCl)[C@@H](O)[C@H](Cl)[C@@H]1O
2338	O/N=C(/Cl)C[C@H](Cl)c1ccccc1
2339	O=C1N=C(Cl)N=C(Cl)/C1=N/O
2340	CC(CCl)CCl
2341	Oc1ccccc1[C@H](Cl)[C@@H](Cl)c1ccccc1O
2342	S=C(Cl)CCC(=S)Cl
2343	O[C@H]1[C@@H](Cl)[C@H](O)[C@H](O)[C@H](O)[C@H]1Cl
2344	CN1C(Cl)=NC(Cl)=NC1(C)C
2345	Cc1cccc(C)c1N1C(Cl)=NC(Cl)=NC12CCCCC2
2346	ClC/C=C/CCl
2347	S=C(Cl)CC(=S)Cl
2348	Cc1ccccc1N1C(Cl)=NC(Cl)=NC1(C)C
2349	C[C@H](Cl)C[C@H](C)CCl
2350	ClCCCCCCCCl
2351	Cl[C@H]1[C@@H]2CC[C@@H](C2)[C@H]1Cl
2352	CC(C)(C)OC(=O)C1([C@](C)(Cl)CCl)CC1
2353	ClC[C@H]1CCCC[C@H]1Cl
2354	ClCc1ccc(CCl)c2ccccc12
2355	CCC1(CC)C(=O)N=C(Cl)N=C1Cl
2356	CC(C)(C)c1cc(CCl)cc(CCl)c1
2357	C[C@@H](Cl)CCl
2358	S=C(Cl)CCl
2359	O=C(O)[C@@H](Cl)[C@H](Cl)C(=O)O
2360	ClC[C@H](Cl)c1ccc(Cl)cc1
2361	ON=C(/C(Cl)=N/O)/C(Cl)=N/O
2362	C[C@@H](Cl)[C@H](Cl)C(=O)O
2363	OC(CCl)CCl
2364	CC1(C)C[C@H](Cl)C[C@](C)(CCl)C1
2365	[H]/N=C(/Cl)c1ccc(-c2cc3cc(/C(Cl)=N\\[H])ccc3o2)cc1
2366	O=C(O)[C@@H](Cl)CCCl
2367	OC1[C@H](O)[C@H](Cl)C[C@@H](Cl)[C@H]1O
2368	ClC1=NN=C(Cl)C1=NNc1ccc2ccccc2c1
2369	[H]/N=C(\\Cl)N1CCN(/C(Cl)=N/[H])CC1
2370	CC1(C)CC(Cl)(CCl)CC(C)(C)N1
2371	ClC1=C(Cl)CCCC1
2372	C[C@]1(Cl)CNCCNC[C@@](C)(Cl)CNCCNC1
2373	S=C(Cl)N=C(S)Cl
2374	[H]/N=C(/Cl)c1ccc2cc(/C(Cl)=N\\[H])[nH]c2c1
2375	C[C@H](Cl)[C@@H](Cl)CO
2376	CC(O)=Nc1ccc([C@@H]2N=C(Cl)N=C(Cl)N2c2cccc(Cl)c2)cc1
2377	ClC[C@H]1[C@H]2C=C[C@H](C2)[C@H]1CCl
2378	CC(O)=Nc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1
2379	CC[C@@H]1N=C(Cl)N=C(Cl)N1c1ccc(Cl)cc1
2380	SC(Cl)=N/N=C\\C=N/N=C(S)Cl
2381	N=C(Cl)Nc1cccc([C@H](Cl)C(=O)O)c1
2382	N=C(Cl)Nc1ccc2c(c1)Cc1ccc(NC(=N)Cl)cc1C2
2383	CN[C@H]1[C@H](O)[C@@H](O[C@H]2[C@@H](Cl)C[C@@H](Cl)[C@H](O)[C@@H]2O)OC[C@@]1(C)O
2384	ClCC[C@@H](Cl)c1ccccc1
2385	O[C@@H](CCl)CCCl
2386	ClCc1cccc(-c2cccc(CCl)c2)c1
2387	C[C@H]1C[C@H](Cl)CC[C@@H]1C[C@@H]1CC[C@@H](Cl)C[C@H]1C
2388	Clc1ccc([C@@H](Cl)[C@H](Cl)c2ccc(Cl)cc2)cc1
2389	ClCc1cc(Cl)cc(CCl)c1
2390	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1ccccc1F
2391	COc1ccccc1N1C(Cl)=NC(Cl)=NC1(C)C
2392	O[C@H]1C[C@@H](O)[C@H](Cl)C[C@H]1Cl
2393	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(Cc2ccccc2)cc1
2394	CC(C)(C)OC(=O)N1CC[C@H](Cl)[C@H](Cl)C1
2395	CC(O)=NCc1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2396	CC1(C)[C@H]2CC[C@@](Cl)(CCl)[C@@H]1C2
2397	N#CC1=C(Cl)/C(=C\\c2ccccc2O)C(=O)N=C1Cl
2398	ClC[C@H]1CC[C@@H]1CCl
2399	[H]/N=C(\\Cl)SCS/C(Cl)=N\\[H]
2400	C[C@]1(Cl)CNCCNC[C@](C)(Cl)CNCCNC1
2401	O[C@H]1[C@H](O)[C@@H](Cl)[C@H](O)[C@H](O)[C@@H]1Cl
2402	O=C(O)[C@@H](Cl)C[C@H]1C[C@H]1Cl
2403	ClCC[C@@]12C[C@@H]3C[C@@H](C[C@@](CCl)(C3)C1)C2
2404	O=C(CCl)OC(=O)CCl
2405	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(S(=O)(=O)F)c1
2406	[H]/N=C(\\Cl)N(/C(Cl)=N/[H])c1ccncc1
2407	CN1CCC(Cl)(CCl)CC1
2408	ClCc1ccc(-c2ccc(CCl)cn2)nc1
2409	ClC1=NC2(CCCCC2)N(OCc2ccccc2)C(Cl)=N1
2410	Fc1cc(F)cc(NN=C2C(Cl)=NN=C2Cl)c1
2411	Oc1cccc(NN=C2C(Cl)=NN=C2Cl)c1
2412	S=C(Cl)SSC(=S)Cl
2413	CC1(C)[C@H](Cl)CC[C@@]1(C)Cl
2414	CC(C)(C)[C@H](Cl)CCl
2415	O[C@H](CCl)[C@@H](O)CCl
2416	[H]/N=C(\\Cl)SS/C(Cl)=N\\[H]
2417	C[C@@](Cl)(CCl)c1ccccc1
2418	CO[C@@H]1O[C@H]2CO[C@@H](c3ccccc3)O[C@H]2[C@@H](Cl)[C@H]1Cl
2419	C=C[C@@H](Cl)CCl
2420	COc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1F
2421	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc([C@@H](O)c2ccccc2)c1
2422	Cl[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1Cl
2423	SC(Cl)=Nc1cccc(N=C(S)Cl)c1
2424	C[C@](Cl)(c1ccc(Cl)cc1)[C@H](Cl)c1ccc(Cl)cc1
2425	ClC1=N[C@@H](c2ccccc2)N(c2ccc(Cl)cc2)C(Cl)=N1
2426	CC1(C)O[C@@H]2[C@H](Cl)CSC[C@H](Cl)[C@H]2O1
2427	CC1=C(Cl)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](Cl)[C@H]3O
2428	Cc1cc(CCl)c(C)cc1CCl
2429	[H]/N=C(/Cl)SC[C@@H](Br)CCl
2430	CC1(C)N=C(Cl)N=C(Cl)N1OCc1ccc(Br)cc1
2431	CC(C)(Cl)C(=S)Cl
2432	COC(=O)[C@H](Cl)[C@@H](Cl)c1ccccc1
2433	ClCc1ccc(-c2ccc(CCl)cc2)cc1
2434	O=C1C(Cl)=C(Cl)C(=O)C(Cl)=C1Cl
2435	ClCC1(Cl)CC1
2436	COc1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2437	[H]/N=C(\\Cl)SCCCCl
2438	O=C1C(Cl)=C(Cl)C(=O)c2ccccc21
2439	C[C@H]1CC[C@]2(CC1)N=C(Cl)N=C(Cl)N2c1ccc(Cl)cc1
2440	C[C@]1(Cl)CC[C@@]1(C)Cl
2441	CC[C@H](Cl)[C@H](Cl)CC
2442	CCOc1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2443	FC1(F)C=C(Cl)C(Cl)=C(OCCCl)[C@@]1(F)Br
2444	O=C(O)[C@@H](Cl)[C@@H](Cl)c1ccccc1
2445	Oc1ccccc1[C@H](Cl)[C@H](Cl)c1ccccc1O
2446	ClCc1cccc(CCl)n1
2447	C=C(CCl)C(=C)CCl
2448	CCc1ccccc1N1C(Cl)=NC(Cl)=NC1(C)C
2449	Cc1ccc([C@H](Cl)[C@H](Cl)c2ccc(C)cc2)cc1
2450	CC(O)(CCl)CCl
2451	ClCc1ccc(Cl)cc1CCl
2452	N#C/C(Cl)=C(\\Cl)C#N
2453	C[C@](Cl)(c1ccccc1)[C@](C)(Cl)c1ccccc1
2454	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1ccncc1
2455	ClC[C@H](Cl)c1ccccc1
2456	COc1cccc(NN=C2C(Cl)=NN=C2Cl)c1
2457	ClC1=NN=C(Cl)C1=NNc1cc(Cl)cc(Cl)c1
2458	CC1(C)CC(=O)C(CC2=C(Cl)CC(C)(C)CC2=O)=C(Cl)C1
2459	CC(C)(C)[C@H](Cl)[C@H](Cl)C(C)(C)C
2460	CC(/C=N/NC(=N)Cl)=N/NC(=N)Cl
2461	C[C@](Cl)(c1ccc(Cl)cc1)[C@@](C)(Cl)c1ccc(Cl)cc1
2462	C[C@H](Cl)[C@H](Cl)c1ccccc1
2463	[H]/N=C(\\Cl)c1ccc2nc(N3C(=O)C[C@@H](Cl)c4ccccc43)[nH]c2c1
2464	[H]/N=C(/Cl)CCCl
2465	O=C1N=C(O)/C(=C2/C=C(Cl)C(=O)N=C2O)C=C1Cl
2466	O=C(O)[C@@H](Cl)CCl
2467	CC1(C)N=C(Cl)N=C(Cl)N1Cc1ccccc1
2468	ClC1=NC2(CCCCC2)N(c2ccc(Cl)cc2)C(Cl)=N1
2469	ClC[C@H]1CCC[C@H](CCl)C1
2470	ClCc1ccc2cc(CCl)ccc2c1
2471	Cc1cc(C)cc(N2C(Cl)=NC(Cl)=NC2(C)C)c1
2472	CC(C)(Cl)c1cccc(C(C)(C)Cl)c1
2473	[H]/N=C(/Cl)c1ccc(-c2cc3ccc(/C(Cl)=N\\[H])cc3[nH]2)cc1
2474	O=C1C=C(Cl)C(Cl)=CC1=O
2475	CC(C)(CCl)CCl
2476	C[C@@H](Cl)[C@@H](C)Cl
2477	COC(=O)c1ccc([C@@H](Cl)[C@H](Cl)c2ccc(C(=O)OC)cc2)cc1
2478	ClC1=N[C@@H](c2ccccc2)N(Cc2ccc(Cl)c(Cl)c2)C(Cl)=N1
2479	COc1ccc([C@H](Cl)CCl)cc1
2480	Clc1cccc(C#CC#Cc2cccc(Cl)c2)c1
2481	C[C@H]1C[C@H](C[C@H]2C[C@H](C)[C@@H](Cl)[C@@H](C)C2)C[C@@H](C)[C@@H]1Cl
2482	Fc1ccc(C(CCl)CCl)cc1
2483	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(Cl)cc1
2484	OC[C@H](Cl)CCl
2485	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(Cc2ccccc2)c1
2486	O/N=C(\\Cl)C/C(Cl)=N\\O
2487	Cl[C@H]1CC[C@H]1Cl
2488	O=C1C=C(Cl)C=C(Cl)C1=O
2489	O=S1(=O)N=C(Cl)CC(Cl)=N1
2490	CN(C)c1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2491	[H]/N=C(/Cl)N1CCC(CCl)CC1
2492	CC(C)[C@H](Cl)CCl
2493	ClCC#Cc1ccccc1C#CCCl
2494	[H]/N=C(\\Cl)c1cccc(-c2cccc(/C(Cl)=N\\[H])n2)n1
2495	ClC1=NN=C(Cl)C1=NNc1ccc2c(c1)OCCO2
2496	COC(CCl)CCl
2497	[H]/N=C(\\Cl)N(/N=C(/C)C=O)/C(Cl)=N/[H]
2498	C[C@@H](Cl)CCCl
2499	C[C@@H]1N=C(Cl)N=C(Cl)N1c1ccc(Cl)c(Cl)c1
2500	CC[C@](Cl)(CCl)c1ccccc1
2501	Cl[C@@H]1CC=CC[C@H]1Cl
2502	OC[C@@H](Cl)[C@H](Cl)CO
2503	CCc1cccc(N2C(Cl)=NC(Cl)=NC2(C)C)c1
2504	Cl[C@H](c1ccccc1)[C@H](Cl)c1ccccc1
2505	ClCC(Cl)(c1ccccc1)c1ccccc1
2506	Clc1ccc([C@H](Cl)[C@H](Cl)c2ccc(Cl)cc2)cc1
2507	ClC1=NN=C(Cl)C1=NNc1cccnc1
2508	ClCc1cccc(-c2cccc(CCl)n2)n1
2509	C/C(Cl)=C(\\C#N)C(=S)Cl
2510	Cc1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2511	CCc1cccc(NN=C2C(Cl)=NN=C2Cl)c1
2512	COc1cc(C)cc2c1C(=O)C(Cl)=C(c1c(C)cc3c(c1OC)C(=O)C(Cl)=CC3=O)C2=O
2513	S=C(Cl)C(=S)Cl
2514	N=C(Cl)NOC(=O)ONC(=N)Cl
2515	Cc1cc(C)cc([C@H](Cl)[C@H](Cl)c2cc(C)cc(C)c2)c1
2516	O=C1C2=C(Cl)CCC(Cl)=C2C(=O)c2ccccc21
2517	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc2c(Cl)cc(Cl)cc2c1
2518	ClC1=N[C@@]2(Cl)N=CN=C2C=N1
2519	ClCCc1ccccc1CCl
2520	O/N=C(\\Cl)c1ccc(/C(Cl)=N/O)cc1
2521	CCC[C@H]1N=C(Cl)N=C(Cl)N1c1ccc(Cl)cc1
2522	O=C1C(Cl)=C(Cl)C(=O)c2nsnc21
2523	ClC1=NN=C(Cl)C1=NNc1ccc2c(c1)OCO2
2524	Cl[C@@H]1Cc2ccccc2[C@H]1Cl
2525	ClCC#CC#CCCl
2526	S=C(Cl)N(/C(Cl)=N/Nc1ccccc1)c1ccccc1
2527	ClC[C@H]1CCCC[C@@H]1Cl
2528	CC1(C)N=C(Cl)N=C(Cl)N1OCc1ccc2ccccc2c1Br
2529	Cl[C@H]1CO[C@H]2[C@@H](Cl)CO[C@@H]12
2530	[H]/N=C(\\Cl)SCCS/C(Cl)=N\\[H]
2531	SC(Cl)=N/N=C(/Cl)c1ccccn1
2532	CC(C)[C@H](Cl)C(C)(C)CCl
2533	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(F)c1
2534	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(Br)cc1
2535	O=C1O[C@@H]([C@@H](O)CO)C(Cl)=C1Cl
2536	Cl[C@@H]1CC[C@@H](CC2CCCCC2)[C@H](Cl)C1
2537	[H]/N=C(\\Cl)O/C(Cl)=N\\[H]
2538	[H]/N=C(\\Cl)c1ccc2c(c1)sc1cc(/C(Cl)=N\\[H])ccc12
2539	CC1(C)N=C(Cl)N=C(Cl)N1CCc1ccccc1
2540	Fc1cccc(NN=C2C(Cl)=NN=C2Cl)c1
2541	ClC[C@H]1[C@H]2CC[C@H](C2)[C@@H]1Cl
2542	OC(=NN=C(S)Cl)c1cccc(C(O)=NN=C(S)Cl)c1
2543	[H]/N=C(/Cl)c1cccc2c1CC/C2=N/NC(=N)Cl
2544	C[C@@](Cl)(CCl)Cc1ccccc1
2545	CC(C)(C)C(CCl)CCl
2546	ClC[C@@H]1CCCC[C@H]1Cl
2547	C[C@@H](Cl)[C@@H](Cl)C(=O)O
2548	CC1(C)N=C(Cl)N=C(Cl)N1OCc1ccc2ccccc2c1
2549	ClC1=N[C@H](c2ccc(Cl)cc2)N(c2ccc(Cl)cc2)C(Cl)=N1
2550	N#CC/C(Cl)=C(\\C#N)C(Cl)=C(C#N)C#N
2551	N=C(Cl)N=C(O)NC(O)=NC(=N)Cl
2552	N=C(Cl)NN=C1C=CC(=NN=C(S)Cl)C=C1
2553	Cc1cccc(C)c1N1C(Cl)=NC(Cl)=NC1(C)C
2554	ClC1=NN=C(Cl)C1=NN[C@H]1CNCCO1
2555	[H]/N=C(\\Cl)N(C(=S)Cl)c1ccccc1
2556	Cl[C@H]1CC[C@@H](CC[C@H]2CC[C@@H](Cl)CC2)CC1
2557	CC[C@](C)(Cl)CCl
2558	C[C@](Cl)(C#N)[C@](C)(Cl)C#N
2559	C[C@@H](ON1C(Cl)=NC(Cl)=NC1(C)C)c1ccc(Cl)c(Cl)c1
2560	Fc1ccc(NN=C2C(Cl)=NN=C2Cl)c(F)c1F
2561	[H]/N=C(Cl)/N=N\\C(Cl)=N\\[H]
2562	O[C@@H]1[C@@H](Cl)C[C@@H](Cl)[C@H](O)[C@H]1O
2563	O=C(O)[C@@H](Cl)CN=C(Cl)NO
2564	Cl[C@@H]1CC[C@@H](Cl)C1
2565	CC1[C@@H](Cl)CCC[C@@H]1Cl
2566	Fc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1F
2567	CC(=O)c1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2568	CS/C(Cl)=C(C#N)/C(C#N)=C(\\Cl)SC
2569	COC(=O)C(CCl)CCl
2570	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(-c2ccccc2)c1
2571	ClC[C@H](Cl)C1CCCCC1
2572	ClC[C@H]1C[C@H]2C[C@@H]1C[C@H]2CCl
2573	Cl[C@H]1CCCCC[C@H]1Cl
2574	ClCC1(Cl)CCCCC1
2575	Cl[C@H]1COC[C@H]1Cl
2576	Cc1ccc([C@@H](Cl)CCl)cc1
2577	OC[C@@H]1O[C@@H](O)[C@H](Cl)[C@@H](Cl)[C@H]1O
2578	CCOC(=O)C1=C(Cl)NC(Cl)=C2C(=O)Oc3ccccc3[C@@H]12
2579	O[C@@H]1[C@H](Cl)[C@H](O)O[C@H](CCl)[C@@H]1O
2580	CC1(C)C[C@H](Cl)C[C@@H](Cl)C1
2581	C[C@H](Cl)C(Cl)(c1ccc(F)cc1)c1ccc(F)cc1
2582	N=C(Cl)NC(=N)Nc1cccc(NC(=N)NC(=N)Cl)c1
2583	ClC[C@H]1C[C@H]2C[C@H](CCl)[C@@H]1C2
2584	O=C1N=C(Cl)C(=NO)C(Cl)=N1
2585	O=S1(=O)N=C(Cl)C=C(Cl)N1CCc1ccccc1
2586	COc1ccc([C@H](Cl)[C@H](Cl)c2ccc(OC)cc2)cc1
2587	O/N=C(\\Cl)c1cccc(/C(Cl)=N/O)n1
2588	FC(F)(F)c1ccc(NN=C2C(Cl)=NN=C2Cl)cc1
2589	CC1(C)N=C(Cl)N=C(Cl)N1OCc1ccccc1
2590	C[C@H](CCl)CCCl
2591	CC(=O)c1cccc(N2C(Cl)=NC(Cl)=NC2(C)C)c1
2592	S=C(Cl)SC(=S)Cl
2593	ClC1=NN=C(Cl)C1=NNc1ccccc1Cl
2594	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(O)c1
2595	N=C(Cl)N/N=C1/C/C(=N\\NC(=N)Cl)c2ccccc21
2596	ClCCCCCCCl
2597	COc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1O
2598	CO[C@H]1O[C@@H](CCl)CC[C@@H]1Cl
2599	N=C(Cl)Nc1ccc2c(c1)Cc1cc(NC(=N)Cl)ccc1-2
2600	O=C(O)[C@H](Cl)CCCl
2601	ClCc1ccccc1-c1ccccc1CCl
2602	ClCC1(CCl)CNC1
2603	CC1(C)N=C(Cl)N=C(Cl)N1OCc1ccc(Cl)cc1
2604	CC[C@@]1(C)N=C(Cl)N=C(Cl)N1c1ccc(OC)cc1
2605	CC(C)(Cl)CCCl
2606	CC1=CC[C@H](C(C)C)[C@H](Cl)[C@H]1Cl
2607	N=C(Cl)NCCCl
2608	ClC12CCC(Cl)(CC1)CC2
2609	Cl[C@@H]1[C@H]2CC[C@H](C2)[C@H]1Cl
2610	N#CC1=C(Cl)SC(Cl)=C(C#N)C1
2611	Cc1cc(C)c(CCl)c(C)c1CCl
2612	[H]/N=C1\\C=C(Cl)C(=O)C(Cl)=C1O
2613	ClC1=NNN=C(Cl)C1
2614	ClC1=N[C@@H](Cc2ccccc2)N(c2cccc(Cl)c2)C(Cl)=N1
2615	C[C@H](Cl)C[C@@H](C)Cl
2616	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(I)c1
2617	N=C(Cl)NC(=N)NCCNC(=N)NC(=N)Cl
2618	SC(Cl)=N/N=C(\\Cl)c1ccccn1
2619	CC1(C)O[C@H](CCl)[C@H](CCl)O1
2620	COc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1
2621	ClC1=NN=C(Cl)C1=NNc1ccc(I)cc1
2622	C[C@H](Cl)[C@H](C)Cl
2623	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(C(=O)O)c1
2624	[H]/N=C(/Cl)c1cccc(-c2cc3ccc(/C(Cl)=N\\[H])cc3o2)c1
2625	COc1cccc([C@H](Cl)CCl)c1
2626	CC(CCl)(CCl)c1ccccn1
2627	N=C(Cl)N[C@H]1[C@H](O)[C@@H](NC(=N)Cl)[C@@H](O)[C@H](O)[C@@H]1O
2628	O[C@H]1CO[C@]2(CC[C@H]1O)[C@H](Cl)C[C@@H](Cl)[C@@H](O)[C@H]2O
2629	[H]/N=C(/Cl)CCl
2630	ClC1=NN=C(Cl)C1=NNc1cccc(Cl)c1
2631	[H]/N=C(/Cl)c1ccc(-c2cc3cc(/C(Cl)=N\\[H])ccc3s2)cc1
2632	Cc1c(C)c(CCl)c(C)c(C)c1CCl
2633	[H]/N=C(/Cl)c1ccc2oc3ccc(/C(Cl)=N\\[H])cc3c2c1
2634	N#C/C(Cl)=C(C#N)/N=C/C=N/C(C#N)=C(/Cl)C#N
2635	N=C1C=C(Cl)C(=O)C(Cl)=C1
2636	ClC1=NCN(c2ccc(Cl)cc2)C(Cl)=N1
2637	CCc1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2638	C[C@H](Cl)CC[C@@H](C)Cl
2639	[H]/N=C(\\Cl)SCC#CCS/C(Cl)=N\\[H]
2640	ClC1=NN=C(Cl)C1=NNc1ccc(Cl)cc1
2641	O[C@@H]1[C@H](Cl)[C@H]2OC[C@@H]3O[C@H](OC[C@@H](O2)[C@@H]1O)[C@@H](Cl)[C@H](O)[C@H]3O
2642	CCn1c2ccccc2c2cc(NN=C3C(Cl)=NN=C3Cl)ccc21
2643	O=C1N=C(Cl)N=C(Cl)/C1=N\\Nc1ccccc1
2644	Cc1ccc(N=C(S)Cl)cc1N=C(S)Cl
2645	ClCC#CCCl
2646	SC(Cl)=N/N=C\\C=N\\N=C(S)Cl
2647	ClC1=NN=C(Cl)C1=NNc1cc[nH]n1
2648	ClCc1c(Cl)c(Cl)c(Cl)c(CCl)c1Cl
2649	CC(C)(C)OC(O)=NC(CCl)CCl
2650	CC(C)(Cl)c1ccc(C(C)(C)Cl)cc1
2651	COCc1c2c(n3c1[C@@H](OC)[C@H](Cl)C3)C(=O)C(C)=C(Cl)C2=O
2652	[H]/N=C(/Cl)C/C(Cl)=N\\[H]
2653	N=C(Cl)NC[C@@H](Cl)C(=O)O
2654	C[C@H](Cl)c1ccc([C@@H](C)Cl)cc1
2655	O=C1C(Cl)=C(C2=C(Cl)C(=O)c3ccccc3C2=O)C(=O)c2ccccc21
2656	ClC1=NN=C(Cl)C1=NNc1ccccc1Br
2657	CC(/C=N\\NC(=N)Cl)=N\\NC(=N)Cl
2658	ClC[C@H]1CCCC[C@@H]1CCl
2659	CC(C)[C@@](C)(Cl)C(=S)Cl
2660	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(C(F)(F)F)cc1
2661	ClCC(Br)CCl
2662	ClCC1(CCl)COC1
2663	O[C@H]1O[C@H](CCl)[C@H](O)[C@@H](O)[C@@H]1Cl
2664	O=S1(=O)N=C(Cl)C(=NO)C(Cl)=N1
2665	Cl[C@@H]1CCC[C@@H](Cl)C1
2666	ClCc1cc(Br)cc(CCl)c1
2667	CC1(C)[C@@H](Cl)C[C@@H]1CCl
2668	Cl[C@@H](c1ccccc1)[C@@H](Cl)c1ccccc1
2669	C[C@H](Cl)[C@@H](Cl)c1ccccc1
2670	CC(C)(C)c1ccc(/N=C(Cl)/C(Cl)=N/c2ccc(C(C)(C)C)cc2)cc1
2671	O=S1(=O)N=C(Cl)C(Cl)=N1
2672	ClCC1(CCl)CCC1
2673	N=C(Cl)N/N=C1/CC[C@@H]2[C@@H](CC[C@@H]3C/C(=N\\NC(=N)Cl)CC[C@@H]32)C1
2674	CC(=O)[C@@]1(Cl)C(I)=CC(I)=C(Cl)[C@@H]1I
2675	COc1c(C)ncc(CCl)c1CCl
2676	ClCC1(CCl)CCOCC1
2677	CC1=C(Cl)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](Cl)[C@@H]3O
2678	COc1cccc(N2C(Cl)=NC(Cl)=NC2(C)C)c1
2679	[H]/N=C(/Cl)c1ccc2[nH]c3ccc(/C(Cl)=N\\[H])cc3c2c1
2680	ClCC(CCl)c1ccccn1
2681	S=C(Cl)C(C(=S)Cl)c1ccccc1
2682	S=C1N=C(Cl)C(c2nnc(-c3ccccc3)c(-c3ccccc3)n2)C(Cl)=N1
2683	N=C(Cl)N=c1nnc(=NC(=N)Cl)[nH][nH]1
2684	CC(C)(C)OC(O)=NC[C@@H](Cl)CCl
2685	CC(C)([C@H]1CC[C@H](Cl)CC1)[C@H]1CC[C@@H](Cl)CC1
2686	CCO[C@H]1CC[C@H](Cl)[C@@H](CCl)O1
2687	ClC1=NN=C(Cl)C1=NNc1cccc(Br)c1
2688	Cl[C@H]1CCC[C@H](Cl)C1
2689	CC[C@H](Cl)C(O)(O)Cl
2690	CC(C)C[C@H](Cl)CCl
2691	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1ccc(F)cc1
2692	Cl/C=C\\C=C/Cl
2693	Cc1ccc(/C(Cl)=N\\N=C(\\Cl)c2ccc(C)cc2)cc1
2694	O[C@H]1C=C[C@@H](O)[C@@H](Cl)[C@H]1Cl
2695	C[C@@H](Cl)[C@H]1CC[C@@H]2[C@H]3CC=C4C[C@@H](Cl)CC[C@]4(C)[C@H]3CC[C@@]12C
2696	ClC[C@@H]1OCO[C@@H]2[C@@H]1OCO[C@H]2CCl
2697	CC(C)(Cl)CCCCl
2698	Cl[C@H]1C[C@@H]2C[C@H]1C[C@@H]2Cl
2699	CC1(C)N=C(Cl)N=C(Cl)N1c1ccccc1Cl
2700	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(C(=O)CCl)c1
2701	COc1ccc(C2C(C#N)=C(Cl)SC(Cl)=C2C#N)cc1
2702	Cl[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@]14C[C@@H]5C[C@@H](C[C@@](Cl)(C5)C1)C4)(C3)C2
2703	ClC12CC3(Cl)C[C@H](C1)C[C@H](C2)C3
2704	O=c1nc(O)c(/C=C/Br)cn1[C@H]1C[C@H](Cl)[C@@H](CCl)O1
2705	SC(Cl)=NN=C(S)Cl
2706	N=C(Cl)NC(=N)c1cccc(C(=N)NC(=N)Cl)c1
2707	Fc1ccc(N2CN=C(Cl)N=C2Cl)cc1
2708	CC1=C(Cl)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](Cl)C3
2709	C[C@H](Cl)[C@@H](C)Cl
2710	O/N=C(Cl)/C(Cl)=N\\O
2711	CC(C)N=C(Cl)N=C(Cl)Nc1ccc(Cl)cc1
2712	C[C@@H](Cl)C/C(Cl)=N/O
2713	CO[C@H]1O[C@H](CCl)[C@H](O)[C@H](Cl)[C@@H]1O
2714	[H]/N=C(\\Cl)c1ccc2c(c1)[nH]c1cc(/C(Cl)=N\\[H])ccc12
2715	SC(Cl)=NCCN=C(S)Cl
2716	Cl[C@@H]1CCCC[C@H]1Cl
2717	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1ccccc1
2718	ClC[C@@H]1c2ccccc2C[C@H]1Cl
2719	Cc1ccc([C@H](Cl)[C@@H](Cl)c2ccc(C)cc2)cc1
2720	O=C(O)[C@H](Cl)/C=C/CCl
2721	[H]/N=C(/Cl)c1ccc(-c2cc3ccc(/C(Cl)=N\\[H])cc3s2)cc1
2722	ClC1=NN=C(Cl)C1=NNc1ccc(Br)c2ccccc12
2723	C[C@H](Cl)[C@](Cl)(c1ccc(F)cc1)c1ccc(F)nc1
2724	CN1CC[C@@H](Cl)[C@@H](CCl)C1
2725	N=C(Cl)NCCCCl
2726	COc1cc(NN=C2C(Cl)=NN=C2Cl)cc(C(F)(F)F)c1
2727	CC1(C)N=C(Cl)N=C(Cl)N1OCc1cccc2cccnc12
2728	O=C1O[C@@H](CCl)C[C@H]1Cl
2729	C[C@H](Cl)[C@H](Cl)C(=O)O
2730	C/C(Cl)=C\\C(=S)Cl
2731	N=C(Cl)NCCNC(=N)Cl
2732	O[C@H]1[C@@H](O)[C@@H](O)[C@H](Cl)[C@@H](O)[C@@H]1Cl
2733	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(Br)c1
2734	COc1cc(C2C(C#N)=C(Cl)SC(Cl)=C2C#N)ccc1O
2735	OC1C[C@H](Cl)C[C@@H](Cl)C1
2736	CC1(C)N=C(Cl)N=C(Cl)N1OCc1cc(Cl)c(Cl)cc1Cl
2737	N#C[C@H](Cl)[C@H](Cl)C#N
2738	C[C@@H](Cl)C[C@@H](C)Cl
2739	N=C(Cl)N[C@H]1CC[C@H]([C@@H](Cl)C(=O)O)CC1
2740	CC(C)(Cl)[C@H](Cl)c1ccccc1
2741	CC1(C)C(=O)N=C(Cl)N=C1Cl
2742	O=C(/C(Cl)=C/Cl)c1ccc(Cl)cc1
2743	[H]/N=C(\\Cl)c1ccc2nn(-c3ccc(/C(Cl)=N\\[H])cc3)cc2c1
2744	ClC12CCC(Cl)(c3ccccc31)c1ccccc12
2745	C[C@@H]1N=C(Cl)N=C(Cl)N1c1cccc(Cl)c1
2746	Cc1ccc([C@@H](Cl)[C@H](Cl)c2ccc(C)cc2)cc1
2747	SC(Cl)=NCN=C(S)Cl
2748	Cl[C@H]1CN(Cc2ccccc2)C[C@@H]1Cl
2749	S=C(Cl)N(CCCl)c1ccc2nccnc2c1Br
2750	Cl[C@@H]1COC[C@H]1Cl
2751	[H]/N=C(\\Cl)c1cccc(-c2cc3cc(/C(Cl)=N\\[H])ccc3o2)c1
2752	ClCC1(CCl)CCCCC1
2753	S=C(Cl)c1cccc(C(=S)Cl)c1
2754	Oc1ccc2ccccc2c1NN=C1C(Cl)=NN=C1Cl
2755	CC(C)[C@]1(C)N=C(Cl)N=C(Cl)N1c1ccc(Cl)cc1
2756	C[C@H](Cl)C[C@H](C)Cl
2757	CO[C@H]1O[C@H](CCl)[C@@H](O)[C@@H](Cl)[C@H]1O
2758	Cl[C@H]1CO[C@H]2[C@@H]1OC[C@H]2Cl
2759	Cl[C@H]1c2ccccc2C[C@H]1Cl
2760	Cc1ncc(CCl)c(CCl)c1Cl
2761	Cl[C@H]1CC[C@H](C2([C@H]3CC[C@H](Cl)CC3)CCCCC2)CC1
2762	Fc1cccc(F)c1NN=C1C(Cl)=NN=C1Cl
2763	Cc1cn([C@@H]2C[C@H](Cl)[C@@H](CCl)O2)c(=O)nc1O
2764	O=C1N=C(Cl)N=C(O)C1Cl
2765	N=C(Cl)Nc1ccc(-c2ccc(NC(=N)Cl)cc2)cc1
2766	Cc1cc(C)cc([C@H](Cl)[C@@H](Cl)c2cc(C)cc(C)c2)c1
2767	CC1(C)N=C(Cl)N=C(Cl)N1c1cc(Cl)ccc1Cl
2768	ClCCC#CCCCl
2769	ClC1=NN=C(Cl)C1=NNc1ncc[nH]1
2770	ClC1=NN=C(Cl)C1=NNc1ccc(Cl)c(Cl)c1
2771	Cl[C@H]1CC[C@@H]1Cl
2772	ClC1=N[C@H](c2ccccc2)N(c2cccc(Cl)c2)C(Cl)=N1
2773	N=C(Cl)NC[C@H](Cl)C(=O)O
2774	ClC1=Nc2ccccc2N=C(Cl)C1
2775	ClC1=NCN(c2ccccc2)C(Cl)=N1
2776	C[C@]1(Cl)CCC[C@H](Cl)C1
2777	O=C(O)[C@@H](Cl)C[C@H]1CC[C@@H](Cl)CC1
2778	ClCC(CCl)c1ccccc1
2779	S=C(Cl)[C@H](Cl)Cc1ccccc1
2780	CC1(C)C(Cl)=N/C(=N/N=C2/N=C(Cl)C(C)(C)N2O)N1O
2781	CC1(C)O[C@@H]2[C@@H](Cl)CSC[C@H](Cl)[C@@H]2O1
2782	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc2ccccc12
2783	O/N=C(\\Cl)CC/C(Cl)=N\\O
2784	CCC[C@H](Cl)CCl
2785	CSc1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2786	C[C@@H](CCl)/C(Cl)=N/O
2787	COC1C[C@@H](Cl)C[C@H](Cl)C1
2788	CC(C)[C@@H]1N=C(Cl)N=C(Cl)N1c1ccc(Cl)cc1
2789	Cl[C@@H]1Nc2cncnc2N[C@H]1Cl
2790	Fc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1
2791	CO[C@H]1OC[C@H](Cl)[C@H](O)[C@H]1Cl
2792	C[C@@H](Cl)P(=O)(O)[C@H](Cl)c1ccccc1
2793	C#C[C@@H](Cl)CC[C@@H](C)Cl
2794	O=C(O)[C@H](Cl)CC#CCCl
2795	Clc1ccccc1[C@@H](Cl)[C@H](Cl)c1ccccc1Cl
2796	ClC1=N[C@H](c2ccccc2)N(c2ccccc2)C(Cl)=N1
2797	O=C1C(Cl)=C(Cl)C(=O)c2ncccc21
2798	ClC1=NC2(c3ccccc3)N=C(Cl)NC2(c2ccccc2)N1
2799	CC1(C)N=C(Cl)N=C(Cl)N1Cc1ccc(Cl)cc1
2800	ClCc1cccc2c(CCl)cccc12
2801	ClCC1(Cl)CCN(Cc2ccccc2)CC1
2802	[H]/N=C(/Cl)c1ccc(-c2csc3ccc(/C(Cl)=N\\[H])cc23)cc1
2803	OC1=NC2(Cl)N=C(O)NC2(Cl)N1
2804	C[C@@H](Cl)CCCCl
2805	N=C(Cl)NC(=N)N1CCN(C(=N)NC(=N)Cl)CC1
2806	CO[C@@H]1C=C[C@@H](OC)[C@H](Cl)[C@H]1Cl
2807	ClC1=N[C@H](c2ccccc2)N(c2ccc(Cl)c(Cl)c2)C(Cl)=N1
2808	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(-c2ccccc2)cc1
2809	C[C@@](Cl)(CCl)C(=O)O
2810	ClC[C@@H](Cl)Cc1c[nH]c2ccccc12
2811	C[C@H]1CC(C)(C)[C@H](CCl)[C@@H]1Cl
2812	Cl[C@@]12C[C@H]3C[C@H]4[C@@H]1C[C@H]1C[C@@H]2[C@@H](C3)[C@]4(Cl)C1
2813	Cl[C@@H](c1cccc2ccccc12)[C@H](Cl)c1cccc2ccccc12
2814	O=C(NN=C(S)Cl)c1ccc(C(=O)NN=C(S)Cl)cc1
2815	N#CC1=C(Cl)Oc2c(ccc3c4c(ccc23)[C@@H](c2ccc(Cl)cc2)C(C#N)=C(Cl)O4)[C@@H]1c1ccc(Cl)cc1
2816	ClCC12CC3(CCl)C[C@H](C1)C[C@H](C2)C3
2817	ClCCCC1(Cl)CCCCC1
2818	ClC12CCCCC1(Cl)CCCC2
2819	N=C(Cl)NNC(=N)Cl
2820	S=C1C=C(Cl)C(=S)C=C1Cl
2821	ClC1=NN=C(Cl)C1=NNc1cccc(I)c1
2822	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(Cl)c1
2823	[H]/N=C(/Cl)SC[C@H]1CN=C(Cl)S1
2824	S=C(Cl)Oc1ccc(OC(=S)Cl)cc1
2825	Cl[C@H]1CO[C@H]2[C@H](Cl)CO[C@@H]12
2826	C[C@H]1N=C(Cl)N=C(Cl)N1c1ccc(Cl)cc1
2827	C=C(CCl)CCl
2828	ClC/C=C\\CCl
2829	CC(/C=N/N=C(S)Cl)=N\\N=C(S)Cl
2830	ON=C1C(Cl)=NC(=S)N=C1Cl
2831	CC(=O)O/N=C(Cl)/C(Cl)=N\\OC(C)=O
2832	[H]/N=C(\\Cl)c1ccc2cc(-c3ccc(/C(Cl)=N\\[H])cc3)oc2c1
2833	CC1(C)[C@@H](CCl)CC[C@]1(C)CCl
2834	CC(C)(Cl)C(=O)C(C)(C)Cl
2835	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1cccc(F)c1
2836	O=C(O)[C@H]1[C@@H]2[C@@H]1C[C@@H](Cl)[C@]2(Cl)C(=O)O
2837	Cl[C@H]1CC[C@H](Cl)C1
2838	CCC(C)(CCl)CCl
2839	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(CO)c1
2840	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(C#N)c1
2841	ClCC1(Cl)CCCC1
2842	O=C(O)c1ccc(NN=C2C(Cl)=NN=C2Cl)cc1
2843	CC[C@@]1(C)N=C(Cl)N=C(Cl)N1c1c(C)cccc1C
2844	CC(C)(Cl)CCC(C)(C)Cl
2845	CC1(C)[C@H](Cl)C(C)(C)[C@@H]1Cl
2846	O[C@@H](CCl)[C@@H](O)CCl
2847	Cc1cc(C)c(CCl)cc1CCl
2848	Cl[C@H]1C[C@@H]2C[C@@H](Cl)C[C@H]2C1
2849	ClC[C@@H](Cl)Cc1ccccc1
2850	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1ccc(Cl)cc1
2851	CC/C(Cl)=C(/C#N)C(=S)Cl
2852	Cc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1
2853	[H]/N=C1/C=C(Cl)/C(=N/[H])C=C1Cl
2854	[H]/N=C(/Cl)c1ccc(CCl)cc1
2855	CC1(C)N=C(Cl)N=C(Cl)N1c1ccccc1
2856	ClC12CCCCC1(Cl)CCCC2
2857	Oc1cc(Cl)c([C@H](Cl)[C@H](Cl)c2c(Cl)cc(O)cc2Cl)c(Cl)c1
2858	S=C(Cl)[C@H](Cl)c1ccccc1
2859	N=C(Cl)Nc1cc(NC(=N)Cl)cc(C(=O)O)c1
2860	CC(C)(C)c1ccc(/N=C(Cl)/C(Cl)=N\\c2ccc(C(C)(C)C)cc2)cc1
2861	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(Cl)c(Cl)c1
2862	C[C@@H]1CC[C@@H](Cl)C[C@H]1Cl
2863	CC1(C)N=C(Cl)N=C(Cl)N1c1cc(Cl)c(Cl)cc1Cl
2864	C[C@]12CC[C@H](Cl)C[C@@H]1CC[C@H]1[C@H]2CC[C@@]2(C)[C@@H](Cl)CC[C@H]12
2865	O=C1C(Cl)=C(N2CC2)C(=O)C(Cl)=C1N1CC1
2866	CC1(C)N=C(Cl)N=C(Cl)N1OCc1ccc(Cl)c(Cl)c1
2867	ClC1=NN=C(Cl)C1=NN=c1cc[nH]cc1
2868	ClCc1c2ccccc2c(CCl)c2ccccc12
2869	COC1=C(Cl)C(=O)C(OC)=C(Cl)C1=O
2870	CS/C(Cl)=N\\N=C(S)Cl
2871	S=C(Cl)Nc1ccc(NC(=S)Cl)cc1
2872	[H]/N=C(Cl)/N=C1\\N=C(Cl)c2ccccc21
2873	O[C@H]1[C@H](O)[C@H](O)[C@@H](Cl)[C@H](O)[C@@H]1Cl
2874	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(C#N)cc1
2875	Cl[C@H]1CCCC[C@@H]1C[C@@H]1CCCC[C@H]1Cl
2876	CC(C)c1ccccc1NN=C1C(Cl)=NN=C1Cl
2877	Cl[C@@H]1CCC[C@@H]2[C@@H]1CCC[C@H]2Cl
2878	N=C(Cl)NC(=N)Cl
2879	O=C(CCl)OCCCl
2880	O=P(O)(CCl)CCl
2881	Cl[C@H]1CC=CC[C@@H]1Cl
2882	ClC[C@H]1CC[C@@H](Cl)CC1
2883	Fc1cccc([C@H](Cl)CCl)c1
2884	CSc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1
2885	Cl[C@H](c1cccc2ccccc12)[C@H](Cl)c1cccc2ccccc12
2886	Cl[C@@H](C1CCCCC1)[C@@H](Cl)C1CCCCC1
2887	Clc1cccc(-c2cccc(Cl)c2)c1
2888	ClCC12CCC(CCl)(CC1)CC2
2889	FC(F)(F)c1ccc([C@H](Cl)CCl)cc1
2890	CNC(CCl)CCl
2891	COc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1Cl
2892	Cl[C@H]1CSC[C@H]1Cl
2893	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(F)cc1
2894	ClCc1cccc2cc3cccc(CCl)c3nc12
2895	ClC[C@@H](Cl)c1ccccc1
2896	[H]/N=C(C#N)\\C(Cl)=N\\C(C#N)=C(\\Cl)C#N
2897	ClCC1(Cl)CCCCCC1
2898	ClC[C@@H]1CC[C@H](CCl)O1
2899	ClC1=NN=C(Cl)C1=NNc1ccc(Br)cc1
2900	ClCc1ccc(CCl)s1
2901	CC(=N\\N=C(S)Cl)/C(C)=N/N=C(S)Cl
2902	S=C(Cl)c1ccc(C(=S)Cl)cc1
2903	COC(=O)[C@@H](Cl)CCl
2904	C[C@H](Cl)CC(C)(C)Cl
2905	[H]/N=C(/Cl)[C@@H](Cl)C(=O)OCC
2906	Cl/C(=N\\N=C(/Cl)c1ccccc1)c1ccccc1
2907	OC(=N[C@H]1C=C[C@@H](Cl)C[C@H]1Cl)OCc1ccccc1
2908	ClC1=NC2=NCCN2C(Cl)=N1
2909	Cl[C@H]1CC[C@H](C[C@H]2CC[C@H](Cl)CC2)CC1
2910	Cl[C@H]1C[C@@H]2C[C@H]1C[C@H]2Cl
2911	CC(C)(C)C1(C)O[C@@H](CCl)[C@H](CCl)O1
2912	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1ccco1
2913	ClC1=NN=C(Cl)C1=NNc1cccc2ccccc12
2914	S=C(Cl)c1cccc(C(=S)Cl)n1
2915	CCC(Cl)(CC)CCl
2916	C#Cc1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2917	CO[C@H]1O[C@@H]2CO[C@H](c3ccccc3)O[C@@H]2[C@@H](Cl)[C@@H]1Cl
2918	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1ccccc1Cl
2919	N=C(Cl)N[C@H]1[C@H](O)[C@H](NC(=N)Cl)[C@H](O)[C@H](O)[C@H]1O
2920	[H]/N=C(\\Cl)c1ccc(-c2cc3cc(/C(Cl)=N\\[H])ccc3[nH]2)cc1
2921	ClC12C[C@H]3[C@@H]4CC5(Cl)C[C@H]([C@@H](C1)[C@@H]3C5)[C@@H]4C2
2922	Cl[C@H](c1ccco1)[C@H](Cl)c1ccco1
2923	S=C(Cl)SCCSC(=S)Cl
2924	ClC[C@@]1(Cl)CN2CCC1CC2
2925	N#CC1=C(Cl)S[C@H](c2ccccc2)[C@@](C#N)(C(=S)Cl)[C@@H]1c1ccccc1
2926	Cl[C@H]1CCCC[C@@H]1SS[C@H]1CCCC[C@H]1Cl
2927	ClC1=NN=C(Cl)C1=NNc1ccccc1
2928	N=C(Cl)N=C(S)Cl
2929	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1cccs1
2930	CCCN1C(Cl)=NC(Cl)=NC1(C)C
2931	ClC12[C@H]3[C@H]4[C@@H]1[C@H]1[C@@H]2[C@@H]3C41Cl
2932	Cl[C@H](C1CCCCC1)[C@H](Cl)C1CCCCC1
2933	Cl/C=C/Cl
2934	COc1ccc(OC)c(N2C(Cl)=NC(Cl)=NC2(C)C)c1
2935	C[C@H]1C[C@@H](C[C@H]2CC[C@@H](Cl)[C@H](C)C2)CC[C@@H]1Cl
2936	N#C/C(Cl)=C(C#N)\\N=C\\Cl
2937	Cl[C@H]1[C@H](c2ccccc2)[C@H](Cl)[C@@H]1c1ccccc1
2938	[H]/N=C(/Cl)S/C(Cl)=N\\[H]
2939	SC(Cl)=NN=C1Nc2ccccc2C1=NN=C(S)Cl
2940	CC[C@@H]1C[C@@H](CC)[C@@H](Cl)[C@H](C)[C@H]1Cl
2941	ClC1(C2(Cl)CCCCC2)CCCCC1
2942	CC(C)(C)OC(=O)[C@@H](Cl)CCl
2943	CC[C@@]1(C)N=C(Cl)N=C(Cl)N1c1ccc(Cl)cc1
2944	[H]/N=C(/Cl)SCCCl
2945	COc1cc(OC)cc(N2C(Cl)=NC(Cl)=NC2(C)C)c1
2946	OC[C@H]1O[C@H](O)[C@@H](Cl)[C@@H](Cl)[C@@H]1O
2947	Cl[C@@H]1CCCC[C@H]1C[C@H]1CC[C@@H](Cl)CC1
2948	ClCc1cccc2cc3cccc(CCl)c3cc12
2949	ClCc1ccccc1CCl
2950	Cl[C@@H]1CC[C@@H]2CCCC[C@@H]2[C@H]1Cl
2951	N#Cc1ccc([C@@H](Cl)[C@H](Cl)c2ccc(C#N)cc2)cc1
2952	Cl[C@H]1C[C@H]2C[C@@H]1C[C@H]2Cl
2953	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(S(C)(=O)=O)cc1
2954	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc2ccccc2c1
2955	ClCC1(CCl)CCCC1
2956	COc1ccc(CN2C(Cl)=NC(Cl)=NC2(C)C)cc1
2957	C[C@@](Cl)(C(=S)Cl)c1ccccc1
2958	C/C(Cl)=N/Cc1cccc(CCl)c1
2959	N=C(Cl)Nc1ccc(CCl)cc1
2960	ClCc1ccc2c(c1)CN1CN2Cc2cc(CCl)ccc21
2961	C[C@](Cl)(CCl)C(=O)O
2962	O=C(O)[C@H](Cl)[C@H](Cl)C(=O)O
2963	ClC1=NN=C(Cl)C1=NNc1nc2ccccc2s1
2964	CC(C)/C(Cl)=C(\\C#N)C(=S)Cl
2965	Cl[C@H]1Cc2ccccc2[C@H]1Cl
2966	CC[C@@H]1C[C@H](C)[C@@H](Cl)[C@@H](CC)[C@H]1Cl
2967	ClC[C@@H]1CCC[C@@H]1Cl
2968	Cc1cc(CCl)c(O)c(CCl)c1
2969	ClC1=NN=C(Cl)C1=NNCC1CCNCC1
2970	Clc1cccc(C#Cc2ccccc2Cl)c1
2971	OCC[C@@H](Cl)CCl
2972	CCOc1cccc(N2C(Cl)=NC(Cl)=NC2(C)C)c1
2973	OC[C@H]1O[C@@H](O[C@H]2[C@@H](Cl)C[C@@H](Cl)[C@H](O)[C@@H]2O)[C@@H](O)[C@@H](O)[C@H]1O
2974	ClC[C@@H](Cl)C12C[C@H]3C[C@@H](C1)C[C@@H](C2)C3
2975	Cc1cccc(N2C(Cl)=NC(Cl)=NC2(C)C)c1
2976	O[C@H]1CC[C@]2(OC[C@@H]1O)[C@@H](O)[C@@H](O)[C@H](Cl)C[C@H]2Cl
2977	O[C@@H]1[C@H](CCl)O[C@@H](O)[C@H](Cl)[C@@H]1O
2978	Cl[C@H]1CC[C@H](C[C@H]2CC[C@@H](Cl)CC2)CC1
2979	C[C@@H](ON1C(Cl)=NC(Cl)=NC1(C)C)c1c(Cl)cccc1Cl
2980	ClC[C@H](Cl)Cc1ccccc1
2981	Cc1ccc(/N=C(Cl)/C(Cl)=N\\c2ccc(C)cc2)cc1
2982	CC1(C)N=C(Cl)N=C(Cl)N1OCc1cccc2ccccc12
2983	CC1(C)O[C@@H](CCl)[C@H](CCl)O1
2984	Cl[C@H]1CCCCCC[C@@H]1Cl
2985	CC(C)(C)c1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
2986	CCC1(CC)C(Cl)=NC(=O)N=C1Cl
2987	O=C(O)[C@@H]1NC(Cl)=N[C@H]1[C@H](O)CCl
2988	N#CC1=C(Cl)SC(Cl)=C(C#N)C1c1ccc(Br)cc1
2989	O[C@H]1CO[C@]2(C[C@H]1O)[C@H](Cl)C[C@H](Cl)[C@H](O)[C@H]2O
2990	Cc1nc(CCl)c(=O)[nH]c1CCl
2991	Cl[C@@H](c1ccccn1)[C@@H](Cl)c1ccccn1
2992	ClCc1c(Cl)c(Cl)c(CCl)c(Cl)c1Cl
2993	CC[C@H](Cl)CCCl
2994	Cc1ccccc1[C@H](Cl)[C@H](Cl)c1ccccc1C
2995	Cl/C(=N\\N=C(/Cl)c1ccccn1)c1ccccn1
2996	O=S(=O)(O)c1ccc(NN=C2C(Cl)=NN=C2Cl)cc1
2997	COC[C@@H](Cl)CCl
2998	Cl/C(=N\\N=C(\\Cl)c1ccccn1)c1ccccn1
2999	Cl[C@H]1CCCC[C@H](Cl)CCCC1
3000	Cl/N=C(Cl)/N=N/C(Cl)=N\\Cl
3001	[H]/N=C(/Cl)c1ccc(-c2nc3cc(/C(Cl)=N\\[H])ccc3[nH]2)cc1
3002	ClC12CNCCNCC(Cl)(CNCCNC1)CNCCNC2
3003	Oc1ccc([C@H](Cl)[C@@H](Cl)c2ccc(O)cc2)cc1
3004	N=C(Cl)NN=C1C=CC(=NN=C(S)Cl)C=C1
3005	O[C@H]1O[C@@H](CCl)[C@H](O)[C@H](O)[C@H]1Cl
3006	O=C([C@H](Cl)CCCl)N1CCCCC1
3007	Cc1ccc(CCl)cc1CCl
3008	CCON1C(Cl)=NC(Cl)=NC1(C)C
3009	CC(O)=N[C@@H]1[C@@H](Cl)C=C(C(=O)O)C[C@@H]1Cl
3010	O=C(CCl)CCl
3011	CCC[C@@]1(C)N=C(Cl)N=C(Cl)N1c1ccc(Cl)cc1
3012	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(C#Cc2ccccc2)cc1
3013	O=C1CC(Cl)=NC(Cl)=N1
3014	C[C@H]1CCC[C@H](Cl)[C@H]1Cl
3015	COC(=O)[C@@H](Cl)[C@H](Cl)c1ccccc1
3016	FC(F)(F)c1ccc([C@H](Cl)[C@H](Cl)c2ccc(C(F)(F)F)cc2)cc1
3017	ClC[C@H]1CC[C@H](CCl)CC1
3018	C[C@@H]1C[C@@H]2C[C@@H](C)[C@](C)(Cl)[C@@H]3CC[C@@H]4[C@@H]([C@@H]1CC[C@]4(C)Cl)[C@@H]23
3019	Cl[C@H]1C[C@H]1Cl
3020	N=C(Cl)NN=C1C=CC(=NNC(=N)Cl)C=C1
3021	Cl[C@@H]1CCc2ccccc2[C@H]1Cl
3022	CC1(C)N=C(Cl)N=C(Cl)N1O
3023	O=C(CCl)CCCl
3024	O/N=C(\\Cl)CCl
3025	Cl[C@H]1CC[C@H]([C@H]2CC[C@@H](Cl)CC2)CC1
3026	FC(F)(F)c1ccc([C@H](Cl)[C@@H](Cl)c2ccc(C(F)(F)F)cc2)cc1
3027	CON1C(Cl)=NC(Cl)=NC1(C)C
3028	ClCC1=CC[C@@H](CCl)CC1
3029	CC(O)=NC1=C(Cl)C(=O)C(N=C(C)O)=C(Cl)C1=O
3030	S=C(Cl)Nc1ccc(-c2ccc(NC(=S)Cl)cc2)cc1
3031	C[C@@H]1OC(=O)C(Cl)=C1Cl
3032	O/N=C(Cl)/C(=N\\O)C(=N\\O)/C(Cl)=N/O
3033	Cl[C@H]1CC[C@@H](Cl)C1
3034	Cc1ccccc1NN=C1C(Cl)=NN=C1Cl
3035	ClC[C@@H](Cl)CBr
3036	OC1=NC[C@H](O)[C@@H](Cl)[C@@H]1Cl
3037	O=C(CCl)N=C(O)CCl
3038	CCOC(=O)C1=C(Cl)N=C(Cl)CC1
3039	ClC[C@@]12C[C@@H]3C[C@@H](C[C@@H](C3)C1)[C@H]2Cl
3040	C[C@@H](CCl)CCCl
3041	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(C(=O)O)cc1
3042	C[C@H](Cl)C(C)(C)Cl
3043	C[C@@H](CCl)[C@@H](C)CCl
3044	CC(=N/N=C(S)Cl)/C(C)=N/N=C(S)Cl
3045	CC1(C)N=C(Cl)N=C(Cl)N1c1ccccc1Br
3046	ClC1=NN=C(Cl)C1=NNc1nccs1
3047	O/N=C(\\Cl)CCCl
3048	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(O)cc1
3049	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(C(O)=Nc2cccnc2)c1
3050	O=C1C=C(Cl)C(=O)C=C1Cl
3051	FC(CCl)CCl
3052	FC(F)(CCl)CCl
3053	ClC1=N[C@H]2C=C[C@@H]1[C@@H]1C=C[C@H]2C(Cl)=N1
3054	Fc1c(F)c(F)c(NN=C2C(Cl)=NN=C2Cl)c(F)c1F
3055	Cc1ncc(CCl)c(CCl)c1O
3056	CCOC(=O)c1cccc(N2C(Cl)=NC(Cl)=NC2(C)C)c1
3057	CC1(C)N=C(Cl)N=C(Cl)N1c1cccc(C(F)(F)F)c1
3058	N=C(Cl)NC(Cl)=NCCc1ccccc1
3059	CC1(C)N=C(Cl)N=C(Cl)N1c1cc(Cl)cc(Cl)c1
3060	O=S(=O)(O)c1ccc(NN=C2C(Cl)=NN=C2Cl)c2ccccc12
3061	Cl[C@H]1CCC[C@@H]1Cl
3062	[H]/N=C(\\Cl)c1ccc(-c2nc3cc(/C(Cl)=N/[H])ccc3[nH]2)cc1
3063	Cl/C=C\\Cl
3064	CCOC(=O)c1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
3065	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc(Cl)cc1Cl
3066	OC(CCl)=NCCCl
3067	CC(C)(C)c1cccc(N2C(Cl)=NC(Cl)=NC2(C)C)c1
3068	CC(C)/C(Cl)=C/C(=S)Cl
3069	Cl[C@H]1CC[C@H](Cl)CC1
3070	C[C@H](Cl)O[C@@H](C)Cl
3071	ClC[C@H]1CC[C@@H](CCl)CC1
3072	CC(C)(Cl)[C@H]1CC[C@@](C)(Cl)CC1
3073	C[C@@H](Cl)Cc1cccc(C(C)(C)Cl)c1
3074	Cl[C@H]1CC2(C[C@H](Cl)C2)C1
3075	CC1(C)N=C(Cl)N=C(Cl)N1OCc1c2ccccc2cc2ccccc12
3076	O=S1(=O)N=C(Cl)C=C(Cl)N1Cc1ccccc1
3077	C[C@H](ON1C(Cl)=NC(Cl)=NC1(C)C)c1ccc(Cl)cc1Cl
3078	OC[C@@H](Cl)CCl
3079	C[C@@H]1CC[C@H](Cl)[C@H](Cl)C1
3080	CC1(C)N=C(Cl)N=C(Cl)N1c1ccc2cc(Cl)ccc2c1
3081	C[C@H](Cl)c1ccc(-c2ccc([C@@H](C)Cl)cc2)cc1
3082	ClCc1ccc(CCl)o1
3083	[H]/N=C(/Cl)c1ccc(-c2ccc(/C(Cl)=N\\[H])cc2)cc1
3084	O=C1C(Cl)=C(Br)C(=O)C(Cl)=C1Br
3085	COC(=O)c1ccc(N2C(Cl)=NC(Cl)=NC2(C)C)cc1
3086	CC(=N/NC(=N)Cl)/C(C)=N/NC(=N)Cl
3087	CC1(C)N=C(Cl)N=C(Cl)N1c1ccccc1I
3088	ClC1(OOC2(Cl)CCCCC2)CCCCC1
3089	O/N=C(/Cl)[C@H](Cl)c1ccccc1
3090	ClC[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1CCl
3091	Oc1ccc(NN=C2C(Cl)=NN=C2Cl)cc1
3092	Fc1ccccc1C[C@@H](Cl)CCl
3093	OC[C@H](Cl)[C@@H](Cl)CO
3094	[H]/N=C(/Cl)SCCNC(=N)Cl
3095	C[C@H](Cl)C(O)=N[C@@H]1CO[C@@H](O)[C@@H](Cl)[C@H]1O
3096	CO[C@@H]1O[C@@H](CCl)[C@@H](O)[C@H](O)[C@H]1Cl
3097	COC(=O)c1cc(CCl)cc(CCl)c1
3098	NC[C@@H]1O[C@H](O[C@H]2[C@@H](O)[C@H](O)[C@H](N)C[C@H]2N)[C@@H](O)[C@@H](O)[C@@H]1O
3099	N[C@H]1[C@@H](O)[C@H](N)[C@@H](O)[C@@H](N)[C@@H]1O
3100	C[C@@H](N)N([C@H](C)N)[C@H](C)N
3101	N[C@H]1C[C@@H](N)[C@H](O)[C@H](O)[C@H]1O[C@@H]1O[C@@H](CO)[C@H](O)[C@H](N)[C@@H]1O
3102	N[C@H]1C[C@@H](N)[C@@H](O)[C@H](O)[C@@H]1O[C@H]1O[C@@H](CO)[C@H](O)[C@@H](O)[C@H]1N
3103	N=C(N)N=c1[nH]c(=NC(=N)N)[nH]c(=NC(=N)N)[nH]1
3104	N[C@H]1CCC[C@H](N)CCC[C@@H](N)CCC1
3105	N[C@H]1[C@@H](O)[C@H](N)[C@@H](O)[C@@H](N)[C@H]1O
3106	N[C@H]1C[C@@H](N)[C@H](O[C@H]2O[C@@H](CO)[C@H](O)[C@H](O)[C@H]2N)[C@@H](O)[C@H]1O
3107	N=C1NC(N)=C(N)[C@H](S(=O)(=O)O)N1
3108	N=C1NS(=O)(=O)NC(N)=C1N
3109	CC(CN)(CN)CN
3110	N[C@H]1COC(=O)[C@@H](N)COC(=O)[C@H](N)COC1=O
3111	NCc1cc(CN)cc(CN)c1
3112	NC[C@H]1C[C@H](CN)C[C@@H](CN)C1
3113	NC[C@@H]1OC(=O)[C@@H](N)[C@H]1N
3114	NCP(=O)(CN)CN
3115	NCC(N)CN
3116	CC(C)(N)c1cc(C(C)(C)N)c(O)c(C(C)(C)N)c1
3117	N[C@H]1[C@@H](O)[C@H](N)[C@H](O)[C@@H](N)[C@H]1O
3118	N[C@H]1C[C@@H](N)[C@H](O)[C@@H](O)[C@H]1O[C@H]1O[C@H](CO)[C@@H](O)[C@H](O)[C@H]1N
3119	N[C@H]1C[C@@H](N)[C@@H](O[C@@H]2O[C@H](CO)[C@H](O)[C@H](N)[C@H]2O)[C@H](O)[C@H]1O
3120	N=CNN=C1C=CC(=NNC(=N)S)C=C1
3121	NCC(CN)CN
3122	NC[C@H]1O[C@H](O[C@@H]2[C@@H](O)[C@@H](O)[C@@H](N)C[C@H]2N)[C@@H](O)[C@@H](O)[C@@H]1O
3123	N/C=C/N
3124	NC[C@@H]1O[C@@H](O[C@H]2[C@H](N)C[C@@H](N)[C@H](O)[C@H]2O)[C@H](O)[C@@H](O)[C@@H]1O
3125	NCC[C@@H](N)CN
3126	NC[C@H]1O[C@H](CN)O[C@@H](CN)O1
3127	N=C(N)C(N)C(=N)N
3128	N[C@@H]1[C@H](O[C@@H]2[C@@H](O)[C@H](O)[C@H](N)C[C@H]2N)O[C@H](CO)[C@H](O)[C@@H]1O
3129	NC12CN3CC(N)(C1)CC(N)(C3)C2
3130	N[C@H]1[C@H](O)[C@@H](N)[C@H](O)[C@@H](N)[C@H]1O
3131	N[C@H]1C[C@@H](N)[C@@H](O[C@H]2O[C@H](CO)[C@H](O)[C@@H](O)[C@H]2N)[C@@H](O)[C@@H]1O
3132	O[C@@H]1[C@H](O[C@@H]2[C@@H](I)C[C@H](I)[C@@H](O)[C@H]2O)O[C@H](CI)[C@H](O)[C@@H]1O
3133	O[C@H]1[C@@H](I)[C@@H](O)[C@@H](I)[C@@H](O)[C@H]1I
3134	C[C@H](I)N([C@H](C)I)[C@@H](C)I
3135	OC[C@@H]1O[C@@H](O[C@H]2[C@H](I)C[C@@H](I)[C@@H](O)[C@H]2O)[C@@H](O)[C@@H](I)[C@@H]1O
3136	OC[C@@H]1O[C@@H](O[C@@H]2[C@@H](I)C[C@@H](I)[C@H](O)[C@@H]2O)[C@H](I)[C@@H](O)[C@H]1O
3137	N=C(I)N=c1[nH]c(=NC(=N)I)[nH]c(=NC(=N)I)[nH]1
3138	I[C@H]1CCC[C@@H](I)CCC[C@@H](I)CCC1
3139	O[C@H]1[C@@H](I)[C@@H](O)[C@@H](I)[C@@H](O)[C@@H]1I
3140	OC[C@H]1O[C@@H](O[C@@H]2[C@@H](O)[C@@H](O)[C@H](I)C[C@H]2I)[C@@H](I)[C@H](O)[C@H]1O
3141	O[C@H]1[C@H](I)[C@@H](O)[C@H](I)[C@@H](O)[C@H]1I
3142	O=S(=O)(O)[C@H]1NC(I)=NC(I)=C1I
3143	O=S1(=O)N=C(I)C(I)=C(I)N1
3144	C[C@H](I)N([C@@H](C)I)[C@@H](C)I
3145	CC(CI)(CI)CI
3146	O=C1OC[C@@H](I)C(=O)OC[C@H](I)C(=O)OC[C@@H]1I
3147	ICc1cc(CI)cc(CI)c1
3148	IC[C@H]1C[C@H](CI)C[C@@H](CI)C1
3149	O=C1O[C@@H](CI)[C@@H](I)[C@@H]1I
3150	I[C@H]1C[C@@H](I)C[C@@H](I)C1
3151	O=P(CI)(CI)CI
3152	ICC(I)CI
3153	CC(C)(I)c1cc(C(C)(C)I)c(O)c(C(C)(C)I)c1
3154	O[C@H]1[C@@H](I)[C@H](O)[C@@H](I)[C@@H](O)[C@H]1I
3155	O=S(=O)(O)[C@@H]1NC(I)=NC(I)=C1I
3156	OC[C@H]1O[C@H](O[C@H]2[C@H](I)C[C@H](I)[C@@H](O)[C@H]2O)[C@H](I)[C@H](O)[C@H]1O
3157	OC[C@H]1O[C@H](O[C@H]2[C@@H](I)C[C@H](I)[C@@H](O)[C@H]2O)[C@H](O)[C@H](I)[C@@H]1O
3158	SC(I)=NN=C1C=CC(=N/N=C\\I)C=C1
3159	ICC(CI)CI
3160	O[C@H]1[C@@H](O)[C@@H](O)[C@@H](CI)O[C@@H]1O[C@H]1[C@H](I)C[C@@H](I)[C@@H](O)[C@H]1O
3161	I/C=C\\I
3162	O[C@H]1[C@H](O)[C@@H](O)[C@H](O[C@H]2[C@@H](I)C[C@H](I)[C@H](O)[C@@H]2O)O[C@H]1CI
3163	ICC[C@@H](I)CI
3164	IC[C@H]1O[C@H](CI)O[C@@H](CI)O1
3165	[H]/N=C(\\I)[C@@H](I)/C(I)=N\\[H]
3166	OC[C@H]1O[C@@H](O[C@@H]2[C@H](I)C[C@H](I)[C@@H](O)[C@H]2O)[C@H](I)[C@@H](O)[C@H]1O
3167	IC12CN3CC(I)(C1)CC(I)(C3)C2
3168	O[C@H]1[C@@H](I)[C@H](O)[C@H](I)[C@@H](O)[C@@H]1I
3169	I/C=C/I
3170	OC[C@H]1O[C@H](O[C@H]2[C@H](I)C[C@H](I)[C@@H](O)[C@H]2O)[C@H](I)[C@@H](O)[C@@H]1O
3171	CO[C@@H]1C=C[C@@H](OC)[C@@H](F)[C@H]1F
3172	COC(=O)[C@@H](F)CCF
3173	FC1=NN=C(F)C1=NNc1cccc(C(F)(F)F)c1
3174	FC1=NN=C(F)C1=NNc1nccnn1
3175	C[C@](F)(c1ccc(Cl)cc1)[C@@H](F)c1ccc(Cl)cc1
3176	CC1(C)N=C(F)N=C(F)N1c1ccc(I)cc1
3177	C[C@@H](F)[C@@H](F)C(=O)O
3178	C#C[C@@H](F)CCCF
3179	[H]/N=C(\\F)c1cccc2c1CC/C2=N\\NC(=N)F
3180	CC(O)=Nc1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3181	CC(C)(CF)C(C)(C)CF
3182	Fc1ccc([C@H](F)[C@@H](F)c2ccc(F)cc2)cc1
3183	O=c1nc(O)ccn1[C@@H]1C[C@@H](F)[C@@H](CF)O1
3184	CC1(C)N=C(F)N=C(F)N1c1ccc(C(=O)CCl)cc1
3185	CO[C@H]1O[C@H](CF)[C@@H](O)[C@@H](F)[C@H]1O
3186	O/N=C(/F)C[C@H](F)c1ccccc1
3187	O=C1N=C(F)N=C(F)/C1=N/O
3188	CC(CF)CF
3189	Oc1ccccc1[C@H](F)[C@@H](F)c1ccccc1O
3190	FC(=S)CCC(F)=S
3191	O[C@H]1[C@H](O)[C@@H](F)[C@H](O)[C@@H](F)[C@@H]1O
3192	CN1C(F)=NC(F)=NC1(C)C
3193	Cc1cccc(C)c1N1C(F)=NC(F)=NC12CCCCC2
3194	FC/C=C\\CF
3195	FC(=S)CC(F)=S
3196	Cc1ccccc1N1C(F)=NC(F)=NC1(C)C
3197	Fc1ccc([C@@H](F)[C@H](F)c2ccc(F)cc2)cc1
3198	C[C@H](F)C[C@H](C)CF
3199	FCCCCCCCF
3200	F[C@H]1[C@@H]2CC[C@@H](C2)[C@H]1F
3201	CC(C)(C)OC(=O)C1([C@](C)(F)CF)CC1
3202	FC[C@H]1CCCC[C@H]1F
3203	FCc1ccc(CF)c2ccccc12
3204	CCC1(CC)C(=O)N=C(F)N=C1F
3205	CC(C)(C)c1cc(CF)cc(CF)c1
3206	C[C@@H](F)CF
3207	FCC(F)=S
3208	O=C(O)[C@H](F)[C@H](F)C(=O)O
3209	FC[C@H](F)c1ccc(Cl)cc1
3210	O/N=C(F)/C(=N/O)C(/F)=N\\O
3211	C[C@H](F)[C@@H](F)C(=O)O
3212	OC(CF)CF
3213	CC1(C)C[C@H](F)C[C@](C)(CF)C1
3214	[H]/N=C(\\F)c1ccc2oc(-c3ccc(/C(F)=N\\[H])cc3)cc2c1
3215	O=C(O)[C@H](F)CCF
3216	O[C@@H]1[C@@H](F)C[C@@H](F)[C@@H](O)[C@H]1O
3217	FC1=NN=C(F)C1=NNc1ccc2ccccc2c1
3218	[H]/N=C(/F)N1CCN(/C(F)=N\\[H])CC1
3219	CC1(C)CC(F)(CF)CC(C)(C)N1
3220	FC1=C(F)CCCC1
3221	C[C@]1(F)CNCCNC[C@@](C)(F)CNCCNC1
3222	FC(=S)N=C(F)S
3223	[H]/N=C(/F)c1ccc2cc(/C(F)=N\\[H])[nH]c2c1
3224	C[C@@H](F)[C@H](F)CO
3225	CC(O)=Nc1ccc([C@@H]2N=C(F)N=C(F)N2c2cccc(Cl)c2)cc1
3226	FC[C@H]1[C@@H]2C=C[C@@H](C2)[C@H]1CF
3227	CC(O)=Nc1ccc(NN=C2C(F)=NN=C2F)cc1
3228	CC[C@H]1N=C(F)N=C(F)N1c1ccc(Cl)cc1
3229	FC(S)=N/N=C\\C=N\\N=C(F)S
3230	N=C(F)Nc1cccc([C@@H](F)C(=O)O)c1
3231	N=C(F)Nc1ccc2c(c1)Cc1ccc(NC(=N)F)cc1C2
3232	CN[C@H]1[C@@H](O)[C@H](O[C@@H]2[C@@H](O)[C@@H](O)[C@H](F)C[C@H]2F)OC[C@@]1(C)O
3233	FCC[C@H](F)c1ccccc1
3234	O[C@@H](CF)CCF
3235	FCc1cccc(-c2cccc(CF)c2)c1
3236	C[C@H]1C[C@@H](F)CC[C@@H]1C[C@@H]1CC[C@H](F)C[C@H]1C
3237	F[C@@H](c1ccc(Cl)cc1)[C@@H](F)c1ccc(Cl)cc1
3238	FCc1cc(Cl)cc(CF)c1
3239	N#CC1=C(F)SC(F)=C(C#N)C1c1ccccc1F
3240	COc1ccccc1N1C(F)=NC(F)=NC1(C)C
3241	O[C@H]1C[C@H](O)[C@@H](F)C[C@@H]1F
3242	CC1(C)N=C(F)N=C(F)N1c1ccc(Cc2ccccc2)cc1
3243	CC(C)(C)OC(=O)N1CC[C@@H](F)[C@H](F)C1
3244	CC(O)=NCc1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3245	CC1(C)[C@H]2CC[C@@](F)(CF)[C@@H]1C2
3246	N#CC1=C(F)/C(=C/c2ccccc2O)C(=O)N=C1F
3247	FC[C@H]1CC[C@@H]1CF
3248	[H]/N=C(/F)SCS/C(F)=N\\[H]
3249	O[C@H]1[C@H](O)[C@@H](F)[C@H](O)[C@H](O)[C@@H]1F
3250	O=C(O)[C@@H](F)C[C@H]1C[C@H]1F
3251	CC1(C)C[C@@H](F)C[C@](C)(CF)C1
3252	FCC[C@@]12C[C@@H]3C[C@@H](C[C@@](CF)(C3)C1)C2
3253	O=C(CF)OC(=O)CF
3254	CC1(C)N=C(F)N=C(F)N1c1cccc(S(=O)(=O)F)c1
3255	[H]/N=C(\\F)N(/C(F)=N/[H])c1ccncc1
3256	CN1CCC(F)(CF)CC1
3257	FCc1ccc(-c2ccc(CF)cn2)nc1
3258	FC1=NC2(CCCCC2)N(OCc2ccccc2)C(F)=N1
3259	FC1=NN=C(F)C1=NNc1cc(F)cc(F)c1
3260	Oc1cccc(NN=C2C(F)=NN=C2F)c1
3261	FC(=S)SSC(F)=S
3262	CC1(C)[C@@H](F)CC[C@@]1(C)F
3263	CC(C)(C)[C@H](F)CF
3264	O[C@@H](CF)[C@@H](O)CF
3265	[H]/N=C(/F)SS/C(F)=N\\[H]
3266	C[C@@](F)(CF)c1ccccc1
3267	CO[C@H]1O[C@H]2CO[C@@H](c3ccccc3)O[C@H]2[C@@H](F)[C@@H]1F
3268	C=C[C@@H](F)CF
3269	COc1ccc(NN=C2C(F)=NN=C2F)cc1F
3270	CC1(C)N=C(F)N=C(F)N1c1cccc([C@@H](O)c2ccccc2)c1
3271	F[C@@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1F
3272	FC(S)=Nc1cccc(N=C(F)S)c1
3273	C[C@@](F)(c1ccc(Cl)cc1)[C@H](F)c1ccc(Cl)cc1
3274	FC1=N[C@H](c2ccccc2)N(c2ccc(Cl)cc2)C(F)=N1
3275	CC1(C)O[C@H]2[C@H](F)CSC[C@H](F)[C@@H]2O1
3276	CC1=C(F)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](F)[C@H]3O
3277	Cc1cc(CF)c(C)cc1CF
3278	[H]/N=C(/F)SC[C@@H](Br)CF
3279	CC1(C)N=C(F)N=C(F)N1OCc1ccc(Br)cc1
3280	CC(C)(F)C(F)=S
3281	COC(=O)[C@H](F)[C@H](F)c1ccccc1
3282	FCc1ccc(-c2ccc(CF)cc2)cc1
3283	O=C1C(F)=C(Cl)C(=O)C(F)=C1Cl
3284	FCC1(F)CC1
3285	COc1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3286	[H]/N=C(\\F)SCCCF
3287	O=C1C(F)=C(F)C(=O)c2ccccc21
3288	C[C@H]1CC[C@]2(CC1)N=C(F)N=C(F)N2c1ccc(Cl)cc1
3289	C[C@]1(F)CC[C@]1(C)F
3290	CC[C@H](F)[C@H](F)CC
3291	CCOc1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3292	FC1=CC(F)(F)[C@](F)(Br)C(OCCCl)=C1F
3293	O=C(O)[C@H](F)[C@H](F)c1ccccc1
3294	Oc1ccccc1[C@H](F)[C@H](F)c1ccccc1O
3295	FCc1cccc(CF)n1
3296	C=C(CF)C(=C)CF
3297	CCc1ccccc1N1C(F)=NC(F)=NC1(C)C
3298	Cc1ccc([C@H](F)[C@H](F)c2ccc(C)cc2)cc1
3299	CC(O)(CF)CF
3300	FCc1ccc(Cl)cc1CF
3301	N#C/C(F)=C(/F)C#N
3302	C[C@@](F)(c1ccccc1)[C@](C)(F)c1ccccc1
3303	F[C@H]1CCC[C@@H]1F
3304	N#CC1=C(F)SC(F)=C(C#N)C1c1ccncc1
3305	FC[C@H](F)c1ccccc1
3306	F[C@@H](CS)[C@@H](F)CS
3307	COc1cccc(NN=C2C(F)=NN=C2F)c1
3308	FC1=NN=C(F)C1=NNc1cc(Cl)cc(Cl)c1
3309	CC1(C)CC(=O)C(CC2=C(F)CC(C)(C)CC2=O)=C(F)C1
3310	CC(C)(C)[C@H](F)[C@@H](F)C(C)(C)C
3311	CC(/C=N/NC(=N)F)=N\\NC(=N)F
3312	C[C@](F)(c1ccc(Cl)cc1)[C@](C)(F)c1ccc(Cl)cc1
3313	C[C@H](F)[C@H](F)c1ccccc1
3314	[H]/N=C(/F)c1ccc2nc(N3C(=O)C[C@@H](F)c4ccccc43)[nH]c2c1
3315	[H]/N=C(/F)CCF
3316	O=C1N=C(O)/C(=C2\\C=C(F)C(=O)N=C2O)C=C1F
3317	O=C(O)[C@@H](F)CF
3318	CC1(C)N=C(F)N=C(F)N1Cc1ccccc1
3319	FC1=NC2(CCCCC2)N(c2ccc(Cl)cc2)C(F)=N1
3320	FC[C@@H]1CCC[C@@H](CF)C1
3321	FCc1ccc2cc(CF)ccc2c1
3322	Cc1cc(C)cc(N2C(F)=NC(F)=NC2(C)C)c1
3323	CC(C)(F)c1cccc(C(C)(C)F)c1
3324	[H]/N=C(/F)c1ccc(-c2cc3ccc(/C(F)=N\\[H])cc3[nH]2)cc1
3325	O=C1C=C(F)C(F)=CC1=O
3326	CC(C)(CF)CF
3327	C[C@H](F)[C@H](C)F
3328	COC(=O)c1ccc([C@H](F)[C@H](F)c2ccc(C(=O)OC)cc2)cc1
3329	FC1=N[C@@H](c2ccccc2)N(Cc2ccc(Cl)c(Cl)c2)C(F)=N1
3330	COc1ccc([C@H](F)CF)cc1
3331	Fc1cccc(C#CC#Cc2cccc(F)c2)c1
3332	C[C@H]1C[C@H](C[C@@H]2C[C@H](C)[C@@H](F)[C@H](C)C2)C[C@@H](C)[C@H]1F
3333	FCC(CF)c1ccc(F)cc1
3334	CC1(C)N=C(F)N=C(F)N1c1ccc(Cl)cc1
3335	OC[C@H](F)CF
3336	CC1(C)N=C(F)N=C(F)N1c1cccc(Cc2ccccc2)c1
3337	O/N=C(\\F)C/C(F)=N\\O
3338	F[C@@H]1CC[C@H]1F
3339	O=C1C=C(F)C=C(F)C1=O
3340	O=S1(=O)N=C(F)CC(F)=N1
3341	CN(C)c1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3342	[H]/N=C(\\F)N1CCC(CF)CC1
3343	FCC#Cc1ccccc1C#CCF
3344	[H]/N=C(\\F)c1cccc(-c2cccc(/C(F)=N/[H])n2)n1
3345	FC1=NN=C(F)C1=NNc1ccc2c(c1)OCCO2
3346	COC(CF)CF
3347	[H]/N=C(\\F)N(/N=C(/C)C=O)/C(F)=N\\[H]
3348	C[C@@H](F)CCF
3349	C[C@H]1N=C(F)N=C(F)N1c1ccc(Cl)c(Cl)c1
3350	CC[C@@](F)(CF)c1ccccc1
3351	CCc1cccc(N2C(F)=NC(F)=NC2(C)C)c1
3352	FCC(F)(c1ccccc1)c1ccccc1
3353	F[C@@H](c1ccc(Cl)cc1)[C@H](F)c1ccc(Cl)cc1
3354	FC1=NN=C(F)C1=NNc1cccnc1
3355	FCc1cccc(-c2cccc(CF)n2)n1
3356	C/C(F)=C(\\C#N)C(F)=S
3357	Cc1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3358	CCc1cccc(NN=C2C(F)=NN=C2F)c1
3359	COc1cc(C)cc2c1C(=O)C(F)=C(c1c(C)cc3c(c1OC)C(=O)C(F)=CC3=O)C2=O
3360	FC(=S)C(F)=S
3361	N=C(F)NOC(=O)ONC(=N)F
3362	Cc1cc(C)cc([C@@H](F)[C@H](F)c2cc(C)cc(C)c2)c1
3363	O=C1C2=C(F)CCC(F)=C2C(=O)c2ccccc21
3364	CC1(C)N=C(F)N=C(F)N1c1ccc2c(Cl)cc(Cl)cc2c1
3365	FC1=N[C@@]2(F)N=CN=C2C=N1
3366	FCCc1ccccc1CF
3367	O/N=C(\\F)c1ccc(/C(F)=N/O)cc1
3368	CCC[C@H]1N=C(F)N=C(F)N1c1ccc(Cl)cc1
3369	O=C1C(F)=C(F)C(=O)c2nsnc21
3370	FC1=NN=C(F)C1=NNc1ccc2c(c1)OCO2
3371	F[C@H]1c2ccccc2C[C@H]1F
3372	FCC#CC#CCF
3373	FC(=S)N(/C(F)=N/Nc1ccccc1)c1ccccc1
3374	CC1(C)N=C(F)N=C(F)N1OCc1ccc2ccccc2c1Br
3375	F[C@@H]1CO[C@H]2[C@@H]1OC[C@H]2F
3376	[H]/N=C(/F)SCCS/C(F)=N/[H]
3377	FC(S)=N/N=C(\\F)c1ccccn1
3378	CC(C)[C@@H](F)C(C)(C)CF
3379	CC1(C)N=C(F)N=C(F)N1c1cccc(F)c1
3380	CC1(C)N=C(F)N=C(F)N1c1ccc(Br)cc1
3381	O=C1O[C@H]([C@@H](O)CO)C(F)=C1F
3382	F[C@@H]1CC[C@@H](CC2CCCCC2)[C@H](F)C1
3383	[H]/N=C(\\F)O/C(F)=N\\[H]
3384	[H]/N=C(/F)c1ccc2c(c1)sc1cc(/C(F)=N\\[H])ccc12
3385	CC1(C)N=C(F)N=C(F)N1CCc1ccccc1
3386	FC1=NN=C(F)C1=NNc1cccc(F)c1
3387	FC[C@@H]1[C@@H]2CC[C@@H](C2)[C@H]1F
3388	OC(=NN=C(F)S)c1cccc(C(O)=NN=C(F)S)c1
3389	[H]/N=C(/F)c1cccc2c1CC/C2=N/NC(=N)F
3390	C[C@](F)(CF)Cc1ccccc1
3391	CC(C)(C)C(CF)CF
3392	FC[C@@H]1CCCC[C@H]1F
3393	CC1(C)N=C(F)N=C(F)N1OCc1ccc2ccccc2c1
3394	FC1=N[C@H](c2ccc(Cl)cc2)N(c2ccc(Cl)cc2)C(F)=N1
3395	N#CC/C(F)=C(\\C#N)C(F)=C(C#N)C#N
3396	N=C(F)N=C(O)NC(O)=NC(=N)F
3397	N=C(F)NN=C1C=CC(=NN=C(F)S)C=C1
3398	Cc1cccc(C)c1N1C(F)=NC(F)=NC1(C)C
3399	FC1=NN=C(F)C1=NN[C@H]1CNCCO1
3400	[H]/N=C(/F)N(C(F)=S)c1ccccc1
3401	F[C@H]1CC[C@H](CC[C@H]2CC[C@@H](F)CC2)CC1
3402	CC[C@](C)(F)CF
3403	C[C@](F)(C#N)[C@@](C)(F)C#N
3404	C[C@@H](ON1C(F)=NC(F)=NC1(C)C)c1ccc(Cl)c(Cl)c1
3405	FC1=NN=C(F)C1=NNc1ccc(F)c(F)c1F
3406	[H]/N=C(F)\\N=N\\C(F)=N/[H]
3407	OC1[C@@H](O)[C@@H](F)C[C@H](F)[C@@H]1O
3408	O=C(O)[C@H](F)CN=C(F)NO
3409	F[C@H]1CC[C@H](F)C1
3410	CC1[C@@H](F)CCC[C@@H]1F
3411	FC1=NN=C(F)C1=NNc1ccc(F)c(F)c1
3412	CC(=O)c1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3413	CS/C(F)=C(C#N)/C(C#N)=C(/F)SC
3414	COC(=O)C(CF)CF
3415	CC1(C)N=C(F)N=C(F)N1c1cccc(-c2ccccc2)c1
3416	FC[C@@H](F)C1CCCCC1
3417	FC[C@H]1C[C@H]2C[C@@H]1C[C@@H]2CF
3418	F[C@H]1CCCCC[C@@H]1F
3419	FCC1(F)CCCCC1
3420	F[C@H]1COC[C@H]1F
3421	Cc1ccc([C@H](F)CF)cc1
3422	OC[C@@H]1O[C@H](O)[C@H](F)[C@@H](F)[C@H]1O
3423	CCOC(=O)C1=C(F)NC(F)=C2C(=O)Oc3ccccc3[C@@H]12
3424	O[C@@H]1[C@@H](CF)O[C@@H](O)[C@H](F)[C@H]1O
3425	CC1(C)C[C@@H](F)C[C@H](F)C1
3426	C[C@H](F)C(F)(c1ccc(F)cc1)c1ccc(F)cc1
3427	N=C(F)NC(=N)Nc1cccc(NC(=N)NC(=N)F)c1
3428	FC[C@@H]1C[C@H]2C[C@@H](CF)[C@@H]1C2
3429	O=C1N=C(F)C(=NO)C(F)=N1
3430	O=S1(=O)N=C(F)C=C(F)N1CCc1ccccc1
3431	COc1ccc([C@H](F)[C@H](F)c2ccc(OC)cc2)cc1
3432	O/N=C(\\F)c1cccc(/C(F)=N/O)n1
3433	FC1=NN=C(F)C1=NNc1ccc(C(F)(F)F)cc1
3434	CC1(C)N=C(F)N=C(F)N1OCc1ccccc1
3435	C[C@H](CF)CCF
3436	CC(=O)c1cccc(N2C(F)=NC(F)=NC2(C)C)c1
3437	FC(=S)SC(F)=S
3438	FC1=NN=C(F)C1=NNc1ccccc1Cl
3439	CC1(C)N=C(F)N=C(F)N1c1cccc(O)c1
3440	N=C(F)N/N=C1/C/C(=N\\NC(=N)F)c2ccccc21
3441	FCCCCCCF
3442	COc1ccc(NN=C2C(F)=NN=C2F)cc1O
3443	CO[C@H]1O[C@@H](CF)CC[C@@H]1F
3444	N=C(F)Nc1ccc2c(c1)Cc1cc(NC(=N)F)ccc1-2
3445	FCc1ccccc1-c1ccccc1CF
3446	FCC1(CF)CNC1
3447	CC1(C)N=C(F)N=C(F)N1OCc1ccc(Cl)cc1
3448	CC[C@]1(C)N=C(F)N=C(F)N1c1ccc(OC)cc1
3449	CC(C)(F)CCF
3450	CC1=CC[C@@H](C(C)C)[C@H](F)[C@@H]1F
3451	N=C(F)NCCF
3452	FC12CCC(F)(CC1)CC2
3453	F[C@@H]1[C@H]2CC[C@H](C2)[C@H]1F
3454	N#CC1=C(F)SC(F)=C(C#N)C1
3455	Cc1cc(C)c(CF)c(C)c1CF
3456	[H]/N=C1\\C=C(F)C(=O)C(F)=C1O
3457	FC1=NNN=C(F)C1
3458	FC1=N[C@@H](Cc2ccccc2)N(c2cccc(Cl)c2)C(F)=N1
3459	C[C@@H](F)C[C@@H](C)F
3460	CC1(C)N=C(F)N=C(F)N1c1cccc(I)c1
3461	N=C(F)NC(=N)NCCNC(=N)NC(=N)F
3462	CC1(C)O[C@H](CF)[C@@H](CF)O1
3463	C[C@H](F)C[C@@H](C)F
3464	COc1ccc(NN=C2C(F)=NN=C2F)cc1
3465	CC1(C)[C@@H](F)CC[C@]1(C)F
3466	FC1=NN=C(F)C1=NNc1ccc(I)cc1
3467	CC1(C)N=C(F)N=C(F)N1c1cccc(C(=O)O)c1
3468	OC[C@H](F)[C@@H](F)CO
3469	[H]/N=C(/F)c1cccc(-c2cc3ccc(/C(F)=N\\[H])cc3o2)c1
3470	COc1cccc([C@H](F)CF)c1
3471	CC(CF)(CF)c1ccccn1
3472	N=C(F)N[C@@H]1[C@H](O)[C@@H](NC(=N)F)[C@H](O)[C@H](O)[C@H]1O
3473	O[C@H]1CO[C@]2(CC[C@H]1O)[C@@H](F)C[C@@H](F)[C@H](O)[C@@H]2O
3474	[H]/N=C(/F)CF
3475	FC1=NN=C(F)C1=NNc1cccc(Cl)c1
3476	[H]/N=C(\\F)c1ccc2sc(-c3ccc(/C(F)=N\\[H])cc3)cc2c1
3477	Cc1c(C)c(CF)c(C)c(C)c1CF
3478	[H]/N=C(/F)c1ccc2oc3ccc(/C(F)=N\\[H])cc3c2c1
3479	N#C/C(F)=C(C#N)/N=C/C=N/C(C#N)=C(\\F)C#N
3480	O=C(O)[C@@H](F)CCF
3481	N=C1C=C(F)C(=O)C(F)=C1
3482	FC1=NCN(c2ccc(Cl)cc2)C(F)=N1
3483	CCc1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3484	C[C@H](F)CC[C@@H](C)F
3485	[H]/N=C(/F)SCC#CCS/C(F)=N\\[H]
3486	FC1=NN=C(F)C1=NNc1ccc(Cl)cc1
3487	O[C@@H]1[C@H](F)[C@H]2OC[C@@H]3O[C@H](OC[C@H](O2)[C@@H]1O)[C@@H](F)[C@H](O)[C@H]3O
3488	CCn1c2ccccc2c2cc(NN=C3C(F)=NN=C3F)ccc21
3489	O=C1N=C(F)N=C(F)/C1=N/Nc1ccccc1
3490	Cc1ccc(N=C(F)S)cc1N=C(F)S
3491	FCC#CCF
3492	FC(S)=N/N=C/C=N/N=C(F)S
3493	FC1=NN=C(F)C1=NNc1cc[nH]n1
3494	FCc1c(Cl)c(Cl)c(Cl)c(CF)c1Cl
3495	CC(C)(C)OC(O)=NC(CF)CF
3496	F[C@H](c1ccccc1)[C@H](F)c1ccccc1
3497	CC(C)(F)c1ccc(C(C)(C)F)cc1
3498	COCc1c2c(n3c1[C@@H](OC)[C@H](F)C3)C(=O)C(C)=C(F)C2=O
3499	[H]/N=C(\\F)C/C(F)=N\\[H]
3500	N=C(F)NC[C@@H](F)C(=O)O
3501	C[C@H](F)c1ccc([C@H](C)F)cc1
3502	O=C1C(F)=C(C2=C(F)C(=O)c3ccccc3C2=O)C(=O)c2ccccc21
3503	FC1=NN=C(F)C1=NNc1ccccc1Br
3504	CC(/C=N/NC(=N)F)=N/NC(=N)F
3505	CCOC(=O)[C@H](F)CF
3506	FC[C@H]1CCCC[C@@H]1CF
3507	CC(C)[C@@](C)(F)C(F)=S
3508	CC1(C)N=C(F)N=C(F)N1c1ccc(C(F)(F)F)cc1
3509	FCC(Br)CF
3510	FCC1(CF)COC1
3511	O[C@@H]1O[C@H](CF)[C@H](O)[C@@H](O)[C@@H]1F
3512	O=S1(=O)N=C(F)C(=NO)C(F)=N1
3513	F[C@H]1CCC[C@H](F)C1
3514	FCc1cc(Br)cc(CF)c1
3515	CC1(C)[C@H](F)C[C@H]1CF
3516	C[C@@H](F)[C@H](F)c1ccccc1
3517	CC(C)(C)c1ccc(/N=C(F)/C(F)=N/c2ccc(C(C)(C)C)cc2)cc1
3518	O=S1(=O)N=C(F)C(F)=N1
3519	FCC1(CF)CCC1
3520	N=C(F)N/N=C1/CC[C@@H]2[C@H](CC[C@@H]3C/C(=N/NC(=N)F)CC[C@H]32)C1
3521	CC(=O)[C@@]1(F)C(I)=CC(I)=C(F)[C@@H]1I
3522	COc1c(C)ncc(CF)c1CF
3523	FCC1(CF)CCOCC1
3524	CC1=C(F)C(=O)c2c(CO)c3n(c2C1=O)C[C@@H](F)[C@@H]3O
3525	C[C@](F)(CF)C(F)(F)F
3526	COc1cccc(N2C(F)=NC(F)=NC2(C)C)c1
3527	[H]/N=C(\\F)c1ccc2[nH]c3ccc(/C(F)=N\\[H])cc3c2c1
3528	FCC(CF)c1ccccn1
3529	FC(=S)C(C(F)=S)c1ccccc1
3530	FC1=NC(=S)N=C(F)C1c1nnc(-c2ccccc2)c(-c2ccccc2)n1
3531	N=C(F)N=c1nnc(=NC(=N)F)[nH][nH]1
3532	CC(C)(C)OC(O)=NC[C@@H](F)CF
3533	CC(C)([C@H]1CC[C@H](F)CC1)[C@H]1CC[C@@H](F)CC1
3534	CCO[C@@H]1CC[C@@H](F)[C@H](CF)O1
3535	FC1=NN=C(F)C1=NNc1cccc(Br)c1
3536	F[C@@H]1CCC[C@@H](F)C1
3537	CC[C@H](F)C(O)(O)F
3538	CC(C)C[C@@H](F)CF
3539	N#CC1=C(F)SC(F)=C(C#N)C1c1ccc(F)cc1
3540	F/C=C\\C=C/F
3541	Cc1ccc(/C(F)=N\\N=C(\\F)c2ccc(C)cc2)cc1
3542	O[C@@H]1C=C[C@@H](O)[C@@H](F)[C@@H]1F
3543	C[C@@H](F)[C@H]1CC[C@H]2[C@H]3CC=C4C[C@@H](F)CC[C@]4(C)[C@H]3CC[C@@]12C
3544	FC[C@H]1OCO[C@@H]2[C@H](CF)OCO[C@@H]12
3545	CC(C)(F)CCCF
3546	FCC[C@@H](F)c1ccccc1
3547	F[C@H]1C[C@@H]2C[C@H]1C[C@@H]2F
3548	CC1(C)N=C(F)N=C(F)N1c1ccccc1Cl
3549	CC1(C)N=C(F)N=C(F)N1c1cccc(C(=O)CCl)c1
3550	COc1ccc(C2C(C#N)=C(F)SC(F)=C2C#N)cc1
3551	F[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@]14C[C@@H]5C[C@@H](C[C@@](F)(C5)C1)C4)(C3)C2
3552	FC12CC3(F)C[C@H](C1)C[C@H](C2)C3
3553	O=c1nc(O)c(/C=C\\Br)cn1[C@H]1C[C@@H](F)[C@@H](CF)O1
3554	FC(S)=NN=C(F)S
3555	N=C(F)NC(=N)c1cccc(C(=N)NC(=N)F)c1
3556	FC1=NCN(c2ccc(F)cc2)C(F)=N1
3557	CC1=C(F)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](F)C3
3558	C[C@H](F)[C@@H](C)F
3559	O/N=C(F)/C(F)=N\\O
3560	CC(C)N=C(F)N=C(F)Nc1ccc(Cl)cc1
3561	C[C@H](F)C/C(F)=N/O
3562	CO[C@@H]1O[C@@H](CF)[C@@H](O)[C@@H](F)[C@H]1O
3563	[H]/N=C(\\F)c1ccc2c(c1)[nH]c1cc(/C(F)=N\\[H])ccc12
3564	FC(S)=NCCN=C(F)S
3565	N#CC1=C(F)SC(F)=C(C#N)C1c1ccccc1
3566	FC[C@@H]1c2ccccc2C[C@H]1F
3567	O=C(O)[C@@H](F)/C=C/CF
3568	[H]/N=C(\\F)c1ccc(-c2cc3ccc(/C(F)=N\\[H])cc3s2)cc1
3569	FC1=NN=C(F)C1=NNc1ccc(Br)c2ccccc12
3570	C[C@@H](F)[C@](F)(c1ccc(F)cc1)c1ccc(F)nc1
3571	CN1CC[C@@H](F)[C@@H](CF)C1
3572	N=C(F)NCCCF
3573	COc1cc(NN=C2C(F)=NN=C2F)cc(C(F)(F)F)c1
3574	CC1(C)N=C(F)N=C(F)N1OCc1cccc2cccnc12
3575	O=C1O[C@@H](CF)C[C@H]1F
3576	C[C@@H](F)[C@H](F)C(=O)O
3577	C/C(F)=C\\C(F)=S
3578	O[C@H](CF)[C@@H](O)CF
3579	N=C(F)NCCNC(=N)F
3580	O[C@H]1[C@@H](O)[C@H](F)[C@@H](O)[C@H](F)[C@@H]1O
3581	CC1(C)N=C(F)N=C(F)N1c1cccc(Br)c1
3582	COc1cc(C2C(C#N)=C(F)SC(F)=C2C#N)ccc1O
3583	O[C@H]1C[C@H](F)C[C@H](F)C1
3584	CC1(C)N=C(F)N=C(F)N1OCc1cc(Cl)c(Cl)cc1Cl
3585	N#C[C@H](F)[C@H](F)C#N
3586	N=C(F)N[C@H]1CC[C@@H]([C@H](F)C(=O)O)CC1
3587	CC(C)(F)[C@H](F)c1ccccc1
3588	CC1(C)C(=O)N=C(F)N=C1F
3589	O=C(/C(F)=C\\F)c1ccc(Cl)cc1
3590	[H]/N=C(\\F)c1ccc(-n2cc3cc(/C(F)=N\\[H])ccc3n2)cc1
3591	FC12CCC(F)(c3ccccc31)c1ccccc12
3592	C[C@@H]1N=C(F)N=C(F)N1c1cccc(Cl)c1
3593	FC(S)=NCN=C(F)S
3594	FCCN(C(F)=S)c1ccc2nccnc2c1Br
3595	[H]/N=C(\\F)c1cccc(-c2cc3cc(/C(F)=N\\[H])ccc3o2)c1
3596	FCC1(CF)CCCCC1
3597	FC(=S)c1cccc(C(F)=S)c1
3598	Oc1ccc2ccccc2c1NN=C1C(F)=NN=C1F
3599	CC(C)[C@]1(C)N=C(F)N=C(F)N1c1ccc(Cl)cc1
3600	CO[C@@H]1O[C@@H](CF)[C@H](O)[C@H](F)[C@H]1O
3601	F[C@H]1CO[C@H]2[C@@H](F)CO[C@@H]12
3602	F[C@@H]1Cc2ccccc2[C@H]1F
3603	Cc1ncc(CF)c(CF)c1Cl
3604	F[C@H]1CC[C@H](C2([C@H]3CC[C@H](F)CC3)CCCCC2)CC1
3605	CC(C)C[C@H](F)CF
3606	FC1=NN=C(F)C1=NNc1c(F)cccc1F
3607	Cc1cn([C@H]2C[C@H](F)[C@@H](CF)O2)c(=O)nc1O
3608	O=C1N=C(F)N=C(O)C1F
3609	N=C(F)Nc1ccc(-c2ccc(NC(=N)F)cc2)cc1
3610	CC1(C)N=C(F)N=C(F)N1c1cc(Cl)ccc1Cl
3611	FCCC#CCCF
3612	FC1=NN=C(F)C1=NNc1ncc[nH]1
3613	FC1=NN=C(F)C1=NNc1ccc(Cl)c(Cl)c1
3614	F[C@H]1CC[C@H]1F
3615	FC1=N[C@@H](c2ccccc2)N(c2cccc(Cl)c2)C(F)=N1
3616	FC1=Nc2ccccc2N=C(F)C1
3617	FC1=NCN(c2ccccc2)C(F)=N1
3618	C[C@@]1(F)CCC[C@@H](F)C1
3619	O=C(O)[C@@H](F)C[C@H]1CC[C@@H](F)CC1
3620	FCC(CF)c1ccccc1
3621	FC(=S)[C@H](F)Cc1ccccc1
3622	CC1(C)C(F)=N/C(=N/N=C2/N=C(F)C(C)(C)N2O)N1O
3623	CC1(C)O[C@@H]2[C@H](F)CSC[C@@H](F)[C@H]2O1
3624	CC1(C)N=C(F)N=C(F)N1c1cccc2ccccc12
3625	O/N=C(\\F)CC/C(F)=N\\O
3626	CCC[C@H](F)CF
3627	F[C@@H]1CCCC[C@H]1F
3628	CSc1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3629	C[C@@H](CF)/C(F)=N\\O
3630	CO[C@H]1C[C@H](F)C[C@H](F)C1
3631	CC(C)[C@H]1N=C(F)N=C(F)N1c1ccc(Cl)cc1
3632	F[C@@H]1Nc2cncnc2N[C@H]1F
3633	FC1=NN=C(F)C1=NNc1ccc(F)cc1
3634	CO[C@H]1OC[C@H](F)[C@H](O)[C@H]1F
3635	C[C@@H](F)P(=O)(O)[C@H](F)c1ccccc1
3636	C#C[C@@H](F)CC[C@@H](C)F
3637	O=C(O)[C@H](F)CC#CCF
3638	F[C@@H](c1ccccc1Cl)[C@@H](F)c1ccccc1Cl
3639	FC1=N[C@H](c2ccccc2)N(c2ccccc2)C(F)=N1
3640	O=C1C(F)=C(F)C(=O)c2ncccc21
3641	FC1=NC2(c3ccccc3)N=C(F)NC2(c2ccccc2)N1
3642	CC1(C)N=C(F)N=C(F)N1Cc1ccc(Cl)cc1
3643	FCc1cccc2c(CF)cccc12
3644	FCC1(F)CCN(Cc2ccccc2)CC1
3645	[H]/N=C(/F)c1ccc(-c2csc3ccc(/C(F)=N\\[H])cc23)cc1
3646	OC1=NC2(F)N=C(O)NC2(F)N1
3647	N=C(F)NC(=N)N1CCN(C(=N)NC(=N)F)CC1
3648	CO[C@H]1C=C[C@@H](OC)[C@H](F)[C@@H]1F
3649	FC1=N[C@@H](c2ccccc2)N(c2ccc(Cl)c(Cl)c2)C(F)=N1
3650	CC1(C)N=C(F)N=C(F)N1c1ccc(-c2ccccc2)cc1
3651	C[C@](F)(CF)C(=O)O
3652	FC[C@H](F)Cc1c[nH]c2ccccc12
3653	C[C@H]1CC(C)(C)[C@H](CF)[C@@H]1F
3654	F[C@@]12C[C@H]3C[C@H]4[C@@H]1C[C@H]1C[C@@H]2[C@@H](C3)[C@]4(F)C1
3655	F[C@@H](c1cccc2ccccc12)[C@H](F)c1cccc2ccccc12
3656	O=C(NN=C(F)S)c1ccc(C(=O)NN=C(F)S)cc1
3657	N#CC1=C(F)Oc2c(ccc3c4c(ccc23)[C@@H](c2ccc(Cl)cc2)C(C#N)=C(F)O4)[C@@H]1c1ccc(Cl)cc1
3658	FCC12CC3(CF)C[C@H](C1)C[C@H](C2)C3
3659	FCCCC1(F)CCCCC1
3660	F[C@@H]1CCC[C@H]1F
3661	C[C@H](F)[C@@H](F)c1ccccc1
3662	FC12CCCCC1(F)CCCC2
3663	N=C(F)NNC(=N)F
3664	FC1=CC(=S)C(F)=CC1=S
3665	FC1=NN=C(F)C1=NNc1cccc(I)c1
3666	CC1(C)N=C(F)N=C(F)N1c1cccc(Cl)c1
3667	N=C(F)SC[C@H]1CN=C(F)S1
3668	FC(=S)Oc1ccc(OC(F)=S)cc1
3669	C[C@H]1N=C(F)N=C(F)N1c1ccc(Cl)cc1
3670	C=C(CF)CF
3671	CC(/C=N/N=C(F)S)=N\\N=C(F)S
3672	ON=C1C(F)=NC(=S)N=C1F
3673	CC(=O)O/N=C(F)/C(F)=N/OC(C)=O
3674	[H]/N=C(\\F)c1ccc2cc(-c3ccc(/C(F)=N\\[H])cc3)oc2c1
3675	CC1(C)[C@H](CF)CC[C@]1(C)CF
3676	CC(C)(F)C(=O)C(C)(C)F
3677	N#CC1=C(F)SC(F)=C(C#N)C1c1cccc(F)c1
3678	O=C(O)[C@H]1[C@@H]2C[C@H](F)[C@@](F)(C(=O)O)[C@@H]21
3679	F[C@H]1CC[C@@H](F)C1
3680	CCC(C)(CF)CF
3681	CC1(C)N=C(F)N=C(F)N1c1cccc(CO)c1
3682	CC1(C)N=C(F)N=C(F)N1c1cccc(C#N)c1
3683	FCC1(F)CCCC1
3684	O=C(O)c1ccc(NN=C2C(F)=NN=C2F)cc1
3685	CC[C@]1(C)N=C(F)N=C(F)N1c1c(C)cccc1C
3686	CC(C)(F)CCC(C)(C)F
3687	CC1(C)[C@H](F)C(C)(C)[C@H]1F
3688	Cc1cc(C)c(CF)cc1CF
3689	F[C@H]1C[C@@H]2C[C@H](F)C[C@@H]2C1
3690	FC[C@@H](F)Cc1ccccc1
3691	N#CC1=C(F)SC(F)=C(C#N)C1c1ccc(Cl)cc1
3692	CC/C(F)=C(/C#N)C(F)=S
3693	Cc1ccc(NN=C2C(F)=NN=C2F)cc1
3694	[H]/N=C1/C=C(F)/C(=N/[H])C=C1F
3695	[H]/N=C(\\F)c1ccc(CF)cc1
3696	CC1(C)N=C(F)N=C(F)N1c1ccccc1
3697	FC12CCCCC1(F)CCCC2
3698	Oc1cc(Cl)c([C@H](F)[C@H](F)c2c(Cl)cc(O)cc2Cl)c(Cl)c1
3699	FC(=S)[C@@H](F)c1ccccc1
3700	N=C(F)Nc1cc(NC(=N)F)cc(C(=O)O)c1
3701	CC(C)(C)c1ccc(/N=C(F)\\C(F)=N/c2ccc(C(C)(C)C)cc2)cc1
3702	CC1(C)N=C(F)N=C(F)N1c1ccc(Cl)c(Cl)c1
3703	C[C@@H]1CC[C@@H](F)C[C@@H]1F
3704	CC1(C)N=C(F)N=C(F)N1c1cc(Cl)c(Cl)cc1Cl
3705	C[C@@]12CC[C@@H]3[C@H](CC[C@@H]4C[C@H](F)CC[C@]43C)[C@@H]1CC[C@H]2F
3706	O=C1C(F)=C(N2CC2)C(=O)C(F)=C1N1CC1
3707	CC1(C)N=C(F)N=C(F)N1OCc1ccc(Cl)c(Cl)c1
3708	FC1=NN=C(F)C1=NN=c1cc[nH]cc1
3709	FCc1c2ccccc2c(CF)c2ccccc12
3710	COC1=C(F)C(=O)C(OC)=C(F)C1=O
3711	CS/C(F)=N/N=C(F)S
3712	FC(=S)Nc1ccc(NC(F)=S)cc1
3713	[H]/N=C(F)/N=C1/N=C(F)c2ccccc21
3714	O[C@H]1[C@H](O)[C@H](O)[C@@H](F)[C@H](O)[C@@H]1F
3715	CC1(C)N=C(F)N=C(F)N1c1ccc(C#N)cc1
3716	F[C@H]1CCCC[C@H]1C[C@H]1CCCC[C@@H]1F
3717	CC(C)c1ccccc1NN=C1C(F)=NN=C1F
3718	F[C@H]1CCC[C@H]2[C@H](F)CCC[C@@H]12
3719	N=C(F)NC(=N)F
3720	O=C(CF)OCCF
3721	O=P(O)(CF)CF
3722	FC[C@H]1CC[C@@H](F)CC1
3723	FC[C@@H](F)c1cccc(F)c1
3724	CSc1ccc(NN=C2C(F)=NN=C2F)cc1
3725	F[C@@H](C1CCCCC1)[C@@H](F)C1CCCCC1
3726	Fc1cccc(-c2cccc(F)c2)c1
3727	FCC12CCC(CF)(CC1)CC2
3728	FC[C@H](F)c1ccc(C(F)(F)F)cc1
3729	CNC(CF)CF
3730	COc1ccc(NN=C2C(F)=NN=C2F)cc1Cl
3731	F[C@@H]1CSC[C@@H]1F
3732	CC1(C)N=C(F)N=C(F)N1c1ccc(F)cc1
3733	FCc1cccc2cc3cccc(CF)c3nc12
3734	[H]/N=C(C#N)\\C(F)=N\\C(C#N)=C(/F)C#N
3735	FCC1(F)CCCCCC1
3736	FC[C@@H]1CC[C@@H](CF)O1
3737	FC1=NN=C(F)C1=NNc1ccc(Br)cc1
3738	FCc1ccc(CF)s1
3739	CC(=N\\N=C(F)S)/C(C)=N/N=C(F)S
3740	FC(=S)c1ccc(C(F)=S)cc1
3741	FC[C@H]1CCC[C@@H](CF)C1
3742	COC(=O)[C@H](F)CF
3743	FC[C@H]1CC[C@H]1CF
3744	C[C@H](F)CC(C)(C)F
3745	[H]/N=C(/F)[C@@H](F)C(=O)OCC
3746	F/C(=N/N=C(/F)c1ccccc1)c1ccccc1
3747	OC(=N[C@@H]1C=C[C@@H](F)C[C@@H]1F)OCc1ccccc1
3748	FC1=NC2=NCCN2C(F)=N1
3749	F[C@H]1CC[C@H](C[C@H]2CC[C@H](F)CC2)CC1
3750	F[C@H]1C[C@@H]2C[C@H]1C[C@H]2F
3751	C[C@H](F)C[C@H](C)F
3752	CC(C)(C)[C@@]1(C)O[C@H](CF)[C@H](CF)O1
3753	N#CC1=C(F)SC(F)=C(C#N)C1c1ccco1
3754	FC1=NN=C(F)C1=NNc1cccc2ccccc12
3755	FC(=S)c1cccc(C(F)=S)n1
3756	CCC(F)(CC)CF
3757	C#Cc1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3758	CO[C@@H]1O[C@@H]2CO[C@H](c3ccccc3)O[C@@H]2[C@@H](F)[C@H]1F
3759	N#CC1=C(F)SC(F)=C(C#N)C1c1ccccc1Cl
3760	N=C(F)N[C@H]1[C@H](O)[C@@H](NC(=N)F)[C@@H](O)[C@@H](O)[C@@H]1O
3761	[H]/N=C(/F)c1ccc(-c2cc3cc(/C(F)=N\\[H])ccc3[nH]2)cc1
3762	FC12C[C@H]3[C@@H]4CC5(F)C[C@H]([C@@H](C1)[C@@H]3C5)[C@@H]4C2
3763	F[C@H](c1ccco1)[C@H](F)c1ccco1
3764	FC[C@@H]1CC[C@H](CF)O1
3765	FC(=S)SCCSC(F)=S
3766	FC[C@@]1(F)CN2CCC1CC2
3767	N#CC1=C(F)S[C@@H](c2ccccc2)[C@@](C#N)(C(F)=S)[C@@H]1c1ccccc1
3768	F[C@H]1CCCC[C@@H]1SS[C@@H]1CCCC[C@H]1F
3769	FC1=NN=C(F)C1=NNc1ccccc1
3770	N=C(F)N=C(F)S
3771	N#CC1=C(F)SC(F)=C(C#N)C1c1cccs1
3772	CCCN1C(F)=NC(F)=NC1(C)C
3773	FC12[C@H]3[C@H]4[C@@H]1[C@H]1[C@@H]2[C@@H]3C41F
3774	F[C@H](C1CCCCC1)[C@H](F)C1CCCCC1
3775	F/C=C/F
3776	COc1ccc(OC)c(N2C(F)=NC(F)=NC2(C)C)c1
3777	CC1(C)[C@H](F)CC[C@]1(C)F
3778	C[C@H]1C[C@@H](C[C@H]2CC[C@@H](F)[C@H](C)C2)CC[C@@H]1F
3779	N#C/C(F)=C(\\F)C#N
3780	N#C/C(F)=C(C#N)/N=C\\F
3781	O[C@@H]1[C@@H](F)C[C@@H](F)[C@@H](O)[C@@H]1O
3782	F[C@H]1[C@H](c2ccccc2)[C@H](F)[C@H]1c1ccccc1
3783	[H]/N=C(/F)S/C(F)=N/[H]
3784	FC(S)=NN=C1Nc2ccccc2C1=NN=C(F)S
3785	CC[C@@H]1C[C@@H](CC)[C@@H](F)[C@H](C)[C@H]1F
3786	FC1(C2(F)CCCCC2)CCCCC1
3787	CC(C)(C)OC(=O)[C@@H](F)CF
3788	CC[C@@]1(C)N=C(F)N=C(F)N1c1ccc(Cl)cc1
3789	[H]/N=C(/F)SCCF
3790	COc1cc(OC)cc(N2C(F)=NC(F)=NC2(C)C)c1
3791	OC[C@@H]1O[C@@H](O)[C@H](F)[C@H](F)[C@H]1O
3792	F[C@H]1CCCC[C@H]1C[C@H]1CC[C@H](F)CC1
3793	FCc1cccc2cc3cccc(CF)c3cc12
3794	F[C@H]1CC[C@H](F)CC1
3795	FCc1ccccc1CF
3796	F[C@H]1[C@H]2CCCC[C@@H]2CC[C@H]1F
3797	N#Cc1ccc([C@H](F)[C@H](F)c2ccc(C#N)cc2)cc1
3798	F[C@@H]1C[C@@H]2C[C@H]1C[C@H]2F
3799	CC1(C)N=C(F)N=C(F)N1c1ccc(S(C)(=O)=O)cc1
3800	CC1(C)N=C(F)N=C(F)N1c1ccc2ccccc2c1
3801	FCC1(CF)CCCC1
3802	OC[C@@H](F)CF
3803	COc1ccc(CN2C(F)=NC(F)=NC2(C)C)cc1
3804	C[C@](F)(C(F)=S)c1ccccc1
3805	C/C(F)=N\\Cc1cccc(CF)c1
3806	N=C(F)Nc1ccc(CF)cc1
3807	FCc1ccc2c(c1)CN1CN2Cc2cc(CF)ccc21
3808	O=C(O)[C@@H](F)[C@H](F)C(=O)O
3809	FC1=NN=C(F)C1=NNc1nc2ccccc2s1
3810	CC(C)/C(F)=C(\\C#N)C(F)=S
3811	CC[C@@H]1C[C@H](C)[C@@H](F)[C@@H](CC)[C@H]1F
3812	FC[C@@H]1CCC[C@@H]1F
3813	Cc1cc(CF)c(O)c(CF)c1
3814	FC1=NN=C(F)C1=NNCC1CCNCC1
3815	Fc1cccc(C#Cc2ccccc2F)c1
3816	OCC[C@H](F)CF
3817	CCOc1cccc(N2C(F)=NC(F)=NC2(C)C)c1
3818	OC[C@@H]1O[C@H](O[C@H]2[C@H](F)C[C@H](F)[C@H](O)[C@H]2O)[C@@H](O)[C@@H](O)[C@H]1O
3819	FC[C@@H](F)C12C[C@H]3C[C@@H](C1)C[C@@H](C2)C3
3820	Cc1cccc(N2C(F)=NC(F)=NC2(C)C)c1
3821	O[C@H]1[C@@H](O)[C@@H](F)C[C@@H](F)[C@]12CC[C@@H](O)[C@H](O)CO2
3822	O[C@H]1O[C@@H](CF)[C@H](O)[C@H](O)[C@H]1F
3823	C[C@H](ON1C(F)=NC(F)=NC1(C)C)c1c(Cl)cccc1Cl
3824	Cc1ccc(/N=C(F)/C(F)=N/c2ccc(C)cc2)cc1
3825	CC1(C)N=C(F)N=C(F)N1OCc1cccc2ccccc12
3826	CC1(C)O[C@H](CF)[C@H](CF)O1
3827	F[C@H]1CCCCCC[C@@H]1F
3828	CC[C@H](F)CF
3829	CC(C)(C)c1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3830	CCC1(CC)C(F)=NC(=O)N=C1F
3831	O=C(O)[C@@H]1NC(F)=N[C@H]1[C@H](O)CF
3832	N#CC1=C(F)SC(F)=C(C#N)C1c1ccc(Br)cc1
3833	O[C@H]1CO[C@@]2(C[C@@H]1O)[C@@H](O)[C@H](O)[C@@H](F)C[C@H]2F
3834	Cc1nc(CF)c(=O)[nH]c1CF
3835	F[C@@H](c1ccccn1)[C@@H](F)c1ccccn1
3836	FCc1c(Cl)c(Cl)c(CF)c(Cl)c1Cl
3837	CC[C@@H](F)CCF
3838	Cc1ccccc1[C@@H](F)[C@H](F)c1ccccc1C
3839	F/C(=N\\N=C(/F)c1ccccn1)c1ccccn1
3840	O=S(=O)(O)c1ccc(NN=C2C(F)=NN=C2F)cc1
3841	COC[C@@H](F)CF
3842	F/C(=N\\N=C(\\F)c1ccccn1)c1ccccn1
3843	F[C@H]1CCCC[C@H](F)CCCC1
3844	FC(=N\\Cl)/N=N/C(F)=N\\Cl
3845	[H]/N=C(/F)c1ccc(-c2nc3cc(/C(F)=N\\[H])ccc3[nH]2)cc1
3846	FC12CNCCNCC(F)(CNCCNC1)CNCCNC2
3847	Oc1ccc([C@H](F)[C@H](F)c2ccc(O)cc2)cc1
3848	N=C(F)NN=C1C=CC(=NN=C(F)S)C=C1
3849	O=C([C@@H](F)CCF)N1CCCCC1
3850	Cc1ccc(CF)cc1CF
3851	CCON1C(F)=NC(F)=NC1(C)C
3852	CC(O)=N[C@@H]1[C@@H](F)C=C(C(=O)O)C[C@H]1F
3853	O=C(CF)CF
3854	CCC[C@]1(C)N=C(F)N=C(F)N1c1ccc(Cl)cc1
3855	CC1(C)N=C(F)N=C(F)N1c1ccc(C#Cc2ccccc2)cc1
3856	O=C1CC(F)=NC(F)=N1
3857	Cc1ccccc1[C@H](F)[C@H](F)c1ccccc1C
3858	COC(=O)[C@@H](F)CF
3859	C[C@@H]1CCC[C@H](F)[C@@H]1F
3860	O[C@H](F)CF
3861	F[C@@H](c1ccc(C(F)(F)F)cc1)[C@H](F)c1ccc(C(F)(F)F)cc1
3862	FC[C@H]1CC[C@@H](CF)CC1
3863	O=C(O)[C@H](F)[C@@H](F)C(=O)O
3864	C[C@H]1C[C@@H]2C[C@@H](C)[C@](C)(F)[C@@H]3CC[C@@H]4[C@@H]([C@@H]1CC[C@]4(C)F)[C@@H]23
3865	F[C@@H]1C[C@H]1F
3866	N=C(F)NN=C1C=CC(=NNC(=N)F)C=C1
3867	F[C@@H](c1ccccc1)[C@@H](F)c1ccccc1
3868	F[C@@H]1CCc2ccccc2[C@H]1F
3869	CC1(C)N=C(F)N=C(F)N1O
3870	O=C(CF)CCF
3871	O/N=C(\\F)CF
3872	FC[C@H]1CC[C@H](CF)CC1
3873	F[C@H]1CC[C@H]([C@H]2CC[C@@H](F)CC2)CC1
3874	F[C@H](c1ccc(C(F)(F)F)cc1)[C@H](F)c1ccc(C(F)(F)F)cc1
3875	CON1C(F)=NC(F)=NC1(C)C
3876	FCC1=CC[C@@H](CF)CC1
3877	CC(O)=NC1=C(F)C(=O)C(N=C(C)O)=C(F)C1=O
3878	FC(=S)Nc1ccc(-c2ccc(NC(F)=S)cc2)cc1
3879	C[C@@H]1OC(=O)C(F)=C1F
3880	O/N=C(F)/C(=N\\O)C(=N/O)/C(F)=N\\O
3881	Cc1ccccc1NN=C1C(F)=NN=C1F
3882	FC[C@H](F)CBr
3883	OC1=NC[C@@H](O)[C@@H](F)[C@H]1F
3884	O=C(CF)N=C(O)CF
3885	CCOC(=O)C1=C(F)N=C(F)CC1
3886	FC[C@@]12C[C@@H]3C[C@@H](C[C@@H](C3)C1)[C@@H]2F
3887	C[C@@H](CF)CCF
3888	CC1(C)N=C(F)N=C(F)N1c1ccc(C(=O)O)cc1
3889	C[C@@H](F)C(C)(C)F
3890	C[C@H](CF)[C@@H](C)CF
3891	CC(=N/N=C(F)S)/C(C)=N/N=C(F)S
3892	CC1(C)N=C(F)N=C(F)N1c1ccccc1Br
3893	F[C@H]1CCCC[C@@H](F)CCCC1
3894	FC1=NN=C(F)C1=NNc1nccs1
3895	O/N=C(/F)CCF
3896	CC1(C)N=C(F)N=C(F)N1c1ccc(O)cc1
3897	CC1(C)N=C(F)N=C(F)N1c1cccc(C(O)=Nc2cccnc2)c1
3898	O=C1C=C(F)C(=O)C=C1F
3899	FCC(F)CF
3900	FCC(F)(F)CF
3901	FC1=N[C@@H]2C=C[C@H]1[C@H]1C=C[C@@H]2C(F)=N1
3902	FC1=NN=C(F)C1=NNc1c(F)c(F)c(F)c(F)c1F
3903	Cc1ncc(CF)c(CF)c1O
3904	CCOC(=O)c1cccc(N2C(F)=NC(F)=NC2(C)C)c1
3905	CC1(C)N=C(F)N=C(F)N1c1cccc(C(F)(F)F)c1
3906	N=C(F)NC(F)=NCCc1ccccc1
3907	CC1(C)N=C(F)N=C(F)N1c1cc(Cl)cc(Cl)c1
3908	O=S(=O)(O)c1ccc(NN=C2C(F)=NN=C2F)c2ccccc12
3909	F/C=C\\F
3910	CCOC(=O)c1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3911	CC1(C)N=C(F)N=C(F)N1c1ccc(Cl)cc1Cl
3912	OC(CF)=NCCF
3913	CC(C)(C)c1cccc(N2C(F)=NC(F)=NC2(C)C)c1
3914	CC(C)/C(F)=C/C(F)=S
3915	C[C@H](F)O[C@@H](C)F
3916	CC(C)(F)[C@H]1CC[C@](C)(F)CC1
3917	C[C@H](F)Cc1cccc(C(C)(C)F)c1
3918	F[C@H]1CC2(C[C@H](F)C2)C1
3919	CC1(C)N=C(F)N=C(F)N1OCc1c2ccccc2cc2ccccc12
3920	O=S1(=O)N=C(F)C=C(F)N1Cc1ccccc1
3921	C[C@H](ON1C(F)=NC(F)=NC1(C)C)c1ccc(Cl)cc1Cl
3922	F[C@H]1CC[C@H](C[C@H]2CC[C@@H](F)CC2)CC1
3923	C[C@@H]1CC[C@@H](F)[C@@H](F)C1
3924	CC1(C)N=C(F)N=C(F)N1c1ccc2cc(Cl)ccc2c1
3925	C#C[C@@H](F)CC[C@H](C)F
3926	C[C@H](F)c1ccc(-c2ccc([C@H](C)F)cc2)cc1
3927	FCc1ccc(CF)o1
3928	[H]/N=C(/F)c1ccc(-c2ccc(/C(F)=N\\[H])cc2)cc1
3929	N=C(F)NN=C1C=CC(=NNC(=N)F)C=C1
3930	O=C1C(F)=C(Br)C(=O)C(F)=C1Br
3931	COC(=O)c1ccc(N2C(F)=NC(F)=NC2(C)C)cc1
3932	CC(=N\\NC(=N)F)/C(C)=N/NC(=N)F
3933	CC1(C)N=C(F)N=C(F)N1c1ccccc1I
3934	FC1(OOC2(F)CCCCC2)CCCCC1
3935	O/N=C(\\F)[C@@H](F)c1ccccc1
3936	FC[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1CF
3937	Oc1ccc(NN=C2C(F)=NN=C2F)cc1
3938	FC[C@H](F)Cc1ccccc1F
3939	CC1(C)[C@H](CF)CC[C@@]1(C)CF
3940	[H]/N=C(\\F)SCCNC(=N)F
3941	C[C@H](F)C(O)=N[C@@H]1CO[C@H](O)[C@@H](F)[C@@H]1O
3942	CO[C@H]1O[C@@H](CF)[C@@H](O)[C@@H](O)[C@@H]1F
3943	COC(=O)c1cc(CF)cc(CF)c1
3944	CO[C@H]1C=C[C@H](OC)[C@@H](N)[C@@H]1N
3945	COC(=O)[C@H](N)CCN
3946	N=C1N=NC(N)=C1NNc1cccc(C(F)(F)F)c1
3947	N=C1N=NC(N)=C1NNc1nccnn1
3948	C[C@@](N)(c1ccc(Cl)cc1)[C@H](N)c1ccc(Cl)cc1
3949	CC1(C)NC(=N)NC(=N)N1c1ccc(I)cc1
3950	C[C@@H](N)[C@@H](N)C(=O)O
3951	C#C[C@@H](N)CCCN
3952	N=C(N)N/N=C1\\CCc2c(C(=N)N)cccc21
3953	CC(O)=Nc1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
3954	CC(C)(CN)C(C)(C)CN
3955	NC[C@H]1O[C@@H](n2ccc(O)nc2=O)C[C@@H]1N
3956	CC1(C)NC(=N)NC(=N)N1c1ccc(C(=O)CCl)cc1
3957	CO[C@@H]1O[C@@H](CN)[C@H](O)[C@@H](N)[C@@H]1O
3958	N=C(C[C@@H](N)c1ccccc1)NO
3959	N=C1N=C(O)/C(=N\\O)C(=N)N1
3960	CC(CN)CN
3961	N[C@@H](c1ccccc1O)[C@H](N)c1ccccc1O
3962	N=C(S)CCC(=N)S
3963	N[C@H]1[C@H](O)[C@@H](N)[C@@H](O)[C@H](O)[C@H]1O
3964	CN1C(=N)NC(=N)NC1(C)C
3965	Cc1cccc(C)c1N1C(=N)NC(=N)NC12CCCCC2
3966	NC/C=C/CN
3967	N=C(S)CC(=N)S
3968	Cc1ccccc1N1C(=N)NC(=N)NC1(C)C
3969	C[C@H](N)C[C@H](C)CN
3970	NCCCCCCCN
3971	CC(C)(C)OC(=O)C1([C@](C)(N)CN)CC1
3972	NC[C@H]1CCCC[C@@H]1N
3973	NCc1ccc(CN)c2ccccc12
3974	CCC1(CC)C(=N)NC(=N)N=C1O
3975	CC(C)(C)c1cc(CN)cc(CN)c1
3976	N=C(S)CN
3977	N[C@H](C(=O)O)[C@@H](N)C(=O)O
3978	NC[C@H](N)c1ccc(Cl)cc1
3979	N=C(NO)C(=NO)C(N)=NO
3980	NCC(O)CN
3981	CC1(C)C[C@H](N)C[C@@](C)(CN)C1
3982	N=C(N)c1ccc(-c2cc3cc(C(=N)N)ccc3o2)cc1
3983	NCC[C@@H](N)C(=O)O
3984	N[C@H]1C[C@H](N)[C@@H](O)C(O)[C@@H]1O
3985	N=C1N=NC(N)=C1NNc1ccc2ccccc2c1
3986	N=C(N)N1CCN(C(=N)N)CC1
3987	CC1(C)CC(N)(CN)CC(C)(C)N1
3988	NC1=C(N)CCCC1
3989	C[C@]1(N)CNCCNC[C@](C)(N)CNCCNC1
3990	N=C(S)NC(=N)S
3991	N=C(N)c1ccc2cc(C(=N)N)[nH]c2c1
3992	C[C@H](N)[C@@H](N)CO
3993	CC(O)=Nc1ccc([C@@H]2NC(=N)NC(=N)N2c2cccc(Cl)c2)cc1
3994	NC[C@@H]1[C@@H]2C=C[C@@H](C2)[C@H]1CN
3995	CC(O)=Nc1ccc(NNC2=C(N)N=NC2=N)cc1
3996	CC[C@H]1NC(=N)NC(=N)N1c1ccc(Cl)cc1
3997	N=C(S)N/N=C/C=N/NC(=N)S
3998	N=C(N)Nc1cccc([C@@H](N)C(=O)O)c1
3999	N=C(N)Nc1ccc2c(c1)Cc1ccc(NC(=N)N)cc1C2
4000	CN[C@H]1[C@@H](O)[C@H](O[C@@H]2[C@H](N)C[C@H](N)[C@H](O)[C@H]2O)OC[C@]1(C)O
4001	NCC[C@H](N)c1ccccc1
4002	NCC[C@H](O)CN
4003	NCc1cccc(-c2cccc(CN)c2)c1
4004	C[C@@H]1C[C@@H](N)CC[C@H]1C[C@@H]1CC[C@@H](N)C[C@H]1C
4005	N[C@@H](c1ccc(Cl)cc1)[C@H](N)c1ccc(Cl)cc1
4006	NCc1cc(Cl)cc(CN)c1
4007	N#CC1=C(N)SC(N)=C(C#N)C1c1ccccc1F
4008	COc1ccccc1N1C(=N)NC(=N)NC1(C)C
4009	N[C@H]1C[C@H](N)[C@H](O)C[C@H]1O
4010	CC1(C)NC(=N)NC(=N)N1c1ccc(Cc2ccccc2)cc1
4011	CC(C)(C)OC(=O)N1CC[C@@H](N)[C@@H](N)C1
4012	CC(O)=NCc1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4013	CC1(C)[C@@H]2C[C@H]1CC[C@@]2(N)CN
4014	N#CC1=C(N)/C(=C/c2ccccc2O)C(O)=NC1=N
4015	NC[C@@H]1CC[C@H]1CN
4016	N[C@H](C(=O)O)[C@H](N)C(=O)O
4017	N=C(N)SCSC(=N)N
4018	N[C@H]1[C@H](O)[C@@H](O)[C@@H](N)[C@H](O)[C@H]1O
4019	N[C@@H](C[C@@H]1C[C@H]1N)C(=O)O
4020	NCC[C@@]12C[C@@H]3C[C@@H](C[C@@](CN)(C3)C1)C2
4021	NCC(=O)OC(=O)CN
4022	CC1(C)NC(=N)NC(=N)N1c1cccc(S(=O)(=O)F)c1
4023	N=C(N)N(C(=N)N)c1ccncc1
4024	CN1CCC(N)(CN)CC1
4025	NCc1ccc(-c2ccc(CN)cn2)nc1
4026	N=C1NC(=N)N(OCc2ccccc2)C2(CCCCC2)N1
4027	N=C1N=NC(N)=C1NNc1cc(F)cc(F)c1
4028	N=C1N=NC(N)=C1NNc1cccc(O)c1
4029	N=C(S)SSC(=N)S
4030	CC1(C)[C@H](N)CC[C@@]1(C)N
4031	CC(C)(C)[C@@H](N)CN
4032	NC[C@H](O)[C@H](O)CN
4033	N=C(N)SSC(=N)N
4034	C[C@@](N)(CN)c1ccccc1
4035	CO[C@@H]1O[C@@H]2CO[C@@H](c3ccccc3)O[C@H]2[C@H](N)[C@H]1N
4036	C=C[C@@H](N)CN
4037	COc1ccc(NNC2=C(N)N=NC2=N)cc1F
4038	CC1(C)NC(=N)NC(=N)N1c1cccc([C@H](O)c2ccccc2)c1
4039	N[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1N
4040	N=C(S)Nc1cccc(NC(=N)S)c1
4041	C[C@@](N)(c1ccc(Cl)cc1)[C@@H](N)c1ccc(Cl)cc1
4042	N=C1NC(=N)N(c2ccc(Cl)cc2)[C@H](c2ccccc2)N1
4043	CC1(C)O[C@H]2[C@H](N)CSC[C@H](N)[C@@H]2O1
4044	CC1=C(N)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](N)[C@H]3O
4045	Cc1cc(CN)c(C)cc1CN
4046	N=C(N)SC[C@H](Br)CN
4047	CC1(C)NC(=N)NC(=N)N1OCc1ccc(Br)cc1
4048	CC(C)(N)C(=N)S
4049	COC(=O)[C@H](N)[C@H](N)c1ccccc1
4050	NCc1ccc(-c2ccc(CN)cc2)cc1
4051	NC1=C(Cl)C(=O)C(N)=C(Cl)C1=O
4052	NCC1(N)CC1
4053	COc1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4054	N=C(N)SCCCN
4055	NC1=C(N)C(=O)c2ccccc2C1=O
4056	C[C@H]1CC[C@@]2(CC1)NC(=N)NC(=N)N2c1ccc(Cl)cc1
4057	C[C@@]1(N)CC[C@@]1(C)N
4058	CC[C@H](N)[C@H](N)CC
4059	CCOc1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4060	NC1=CC(F)(F)[C@@](F)(Br)C(OCCCl)=C1N
4061	CC1(C)C[C@H](N)C[C@](C)(CN)C1
4062	N[C@H](C(=O)O)[C@H](N)c1ccccc1
4063	N[C@H](c1ccccc1O)[C@H](N)c1ccccc1O
4064	NCc1cccc(CN)n1
4065	C=C(CN)C(=C)CN
4066	CCc1ccccc1N1C(=N)NC(=N)NC1(C)C
4067	Cc1ccc([C@H](N)[C@H](N)c2ccc(C)cc2)cc1
4068	CC(O)(CN)CN
4069	NCc1ccc(Cl)cc1CN
4070	N#C/C(N)=C(/N)C#N
4071	C[C@](N)(c1ccccc1)[C@@](C)(N)c1ccccc1
4072	N#CC1=C(N)SC(N)=C(C#N)C1c1ccncc1
4073	NC[C@H](N)c1ccccc1
4074	COc1cccc(NNC2=C(N)N=NC2=N)c1
4075	N=C1N=NC(N)=C1NNc1cc(Cl)cc(Cl)c1
4076	CC1(C)CC(=O)C(CC2=C(N)CC(C)(C)CC2=O)=C(N)C1
4077	CC(C)(C)[C@H](N)[C@H](N)C(C)(C)C
4078	CC(/C=N\\NC(=N)N)=N\\NC(=N)N
4079	C[C@](N)(c1ccc(Cl)cc1)[C@@](C)(N)c1ccc(Cl)cc1
4080	C[C@@H](N)[C@@H](N)c1ccccc1
4081	N=C(N)c1ccc2nc(N3C(=O)C[C@H](N)c4ccccc43)[nH]c2c1
4082	N=C(N)CCN
4083	NC1=C/C(=C2/C=C(N)C(=O)N=C2O)C(O)=NC1=O
4084	NC[C@H](N)C(=O)O
4085	CC1(C)NC(=N)NC(=N)N1Cc1ccccc1
4086	N=C1NC(=N)N(c2ccc(Cl)cc2)C2(CCCCC2)N1
4087	NC[C@H]1CCC[C@@H](CN)C1
4088	NCc1ccc2cc(CN)ccc2c1
4089	Cc1cc(C)cc(N2C(=N)NC(=N)NC2(C)C)c1
4090	CC(C)(N)c1cccc(C(C)(C)N)c1
4091	N=C(N)c1ccc(-c2cc3ccc(C(=N)N)cc3[nH]2)cc1
4092	NC1=CC(=O)C(=O)C=C1N
4093	CC(C)(CN)CN
4094	C[C@@H](N)[C@@H](C)N
4095	COC(=O)c1ccc([C@H](N)[C@@H](N)c2ccc(C(=O)OC)cc2)cc1
4096	N=C1NC(=N)N(Cc2ccc(Cl)c(Cl)c2)[C@@H](c2ccccc2)N1
4097	COc1ccc([C@@H](N)CN)cc1
4098	Nc1cccc(C#CC#Cc2cccc(N)c2)c1
4099	C[C@H]1C[C@H](C[C@H]2C[C@H](C)[C@@H](N)[C@@H](C)C2)C[C@H](C)[C@H]1N
4100	NCC(CN)c1ccc(F)cc1
4101	CC1(C)NC(=N)NC(=N)N1c1ccc(Cl)cc1
4102	NC[C@H](N)CO
4103	CC1(C)NC(=N)NC(=N)N1c1cccc(Cc2ccccc2)c1
4104	N=C(CC(=N)NO)NO
4105	N[C@H]1CC[C@H]1N
4106	NC1=CC(=O)C(=O)C(N)=C1
4107	N=C1CC(=N)NS(=O)(=O)N1
4108	CN(C)c1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4109	N=C(N)N1CCC(CN)CC1
4110	NCC#Cc1ccccc1C#CCN
4111	N=C(N)c1cccc(-c2cccc(C(=N)N)n2)n1
4112	N=C1N=NC(N)=C1NNc1ccc2c(c1)OCCO2
4113	COC(CN)CN
4114	C/C(C=O)=N/N(C(=N)N)C(=N)N
4115	C[C@@H](N)CCN
4116	C[C@H]1NC(=N)NC(=N)N1c1ccc(Cl)c(Cl)c1
4117	CC[C@](N)(CN)c1ccccc1
4118	N[C@H](CO)[C@H](N)CO
4119	CCc1cccc(N2C(=N)NC(=N)NC2(C)C)c1
4120	NCC(N)(c1ccccc1)c1ccccc1
4121	N[C@H](c1ccc(Cl)cc1)[C@H](N)c1ccc(Cl)cc1
4122	N=C1N=NC(N)=C1NNc1cccnc1
4123	NCc1cccc(-c2cccc(CN)n2)n1
4124	C/C(N)=C(/C#N)C(=N)S
4125	Cc1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4126	CCc1cccc(NNC2=C(N)N=NC2=N)c1
4127	COc1cc(C)cc2c1C(=O)C(N)=C(c1c(C)cc3c(c1OC)C(=O)C(N)=CC3=O)C2=O
4128	NC(=S)C(N)=S
4129	N=C(N)NOC(=O)ONC(=N)N
4130	Cc1cc(C)cc([C@H](N)[C@H](N)c2cc(C)cc(C)c2)c1
4131	NC1=C2C(=O)c3ccccc3C(=O)C2=C(N)CC1
4132	CC1(C)NC(=N)NC(=N)N1c1ccc2c(Cl)cc(Cl)cc2c1
4133	N=C1N=CC2=NC=N[C@@]2(N)N1
4134	NCCc1ccccc1CN
4135	NC(=NO)c1ccc(C(N)=NO)cc1
4136	CCC[C@H]1NC(=N)NC(=N)N1c1ccc(Cl)cc1
4137	NC1=C(N)C(=O)c2nsnc2C1=O
4138	N=C1N=NC(N)=C1NNc1ccc2c(c1)OCO2
4139	N[C@H]1Cc2ccccc2[C@H]1N
4140	NCC#CC#CCN
4141	N=C(S)N(C(=N)NNc1ccccc1)c1ccccc1
4142	NC[C@H]1CCCC[C@H]1N
4143	CC1(C)NC(=N)NC(=N)N1OCc1ccc2ccccc2c1Br
4144	N[C@H]1CO[C@@H]2[C@@H](N)CO[C@H]12
4145	N=C(N)SCCSC(=N)N
4146	N=C(S)NNC(=N)c1ccccn1
4147	CC(C)[C@H](N)C(C)(C)CN
4148	CC1(C)NC(=N)NC(=N)N1c1cccc(F)c1
4149	CC1(C)NC(=N)NC(=N)N1c1ccc(Br)cc1
4150	NC1=C(N)[C@H]([C@@H](O)CO)OC1=O
4151	N[C@@H]1CC[C@H](CC2CCCCC2)[C@H](N)C1
4152	N=C(N)OC(=N)N
4153	N=C(N)c1ccc2c(c1)sc1cc(C(=N)N)ccc12
4154	CC1(C)NC(=N)NC(=N)N1CCc1ccccc1
4155	N=C1N=NC(N)=C1NNc1cccc(F)c1
4156	NC[C@H]1[C@@H](N)[C@H]2CC[C@@H]1C2
4157	N=C(S)NN=C(O)c1cccc(C(O)=NNC(=N)S)c1
4158	C[C@](N)(CN)Cc1ccccc1
4159	CC(C)(C)C(CN)CN
4160	C[C@H](N)[C@H](N)C(=O)O
4161	CC1(C)NC(=N)NC(=N)N1OCc1ccc2ccccc2c1
4162	N=C1NC(=N)N(c2ccc(Cl)cc2)[C@H](c2ccc(Cl)cc2)N1
4163	N#CC/C(N)=C(\\C#N)C(N)=C(C#N)C#N
4164	N=C(N)N=C(O)NC(O)=NC(=N)N
4165	N=C(N)NN=C1C=CC(=NNC(=N)S)C=C1
4166	Cc1cccc(C)c1N1C(=N)NC(=N)NC1(C)C
4167	N=C1N=NC(N)=C1NN[C@H]1CNCCO1
4168	N=C(N)N(C(=N)S)c1ccccc1
4169	N[C@H]1CC[C@H](CC[C@H]2CC[C@@H](N)CC2)CC1
4170	CC[C@@](C)(N)CN
4171	C[C@@](N)(C#N)[C@@](C)(N)C#N
4172	C[C@H](ON1C(=N)NC(=N)NC1(C)C)c1ccc(Cl)c(Cl)c1
4173	N=C1N=NC(N)=C1NNc1ccc(F)c(F)c1F
4174	N=C(N)/N=N/C(=N)N
4175	N[C@H]1C[C@@H](N)[C@@H](O)[C@H](O)[C@@H]1O
4176	N=C(NO)NC[C@@H](N)C(=O)O
4177	N[C@H]1CC[C@H](N)C1
4178	C[C@@H]1[C@@H](N)CCC[C@H]1N
4179	N=C1N=NC(N)=C1NNc1ccc(F)c(F)c1
4180	CC(=O)c1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4181	CS/C(N)=C(C#N)/C(C#N)=C(/N)SC
4182	COC(=O)C(CN)CN
4183	CC1(C)NC(=N)NC(=N)N1c1cccc(-c2ccccc2)c1
4184	NC[C@@H](N)C1CCCCC1
4185	NC[C@H]1C[C@@H]2C[C@H]1C[C@H]2CN
4186	N[C@@H]1CCCCC[C@H]1N
4187	NCC1(N)CCCCC1
4188	N[C@@H]1COC[C@H]1N
4189	N[C@@H](c1ccccc1)[C@@H](N)c1ccccc1
4190	Cc1ccc([C@@H](N)CN)cc1
4191	N[C@@H]1[C@H](O)[C@@H](CO)O[C@@H](O)[C@@H]1N
4192	CCOC(=O)C1=C(N)NC(N)=C2C(=O)Oc3ccccc3[C@@H]12
4193	NC[C@H]1O[C@H](O)[C@@H](N)[C@H](O)[C@H]1O
4194	CC1(C)C[C@H](N)C[C@H](N)C1
4195	C[C@H](N)C(N)(c1ccc(F)cc1)c1ccc(F)cc1
4196	N=C(N)NC(=N)Nc1cccc(NC(=N)NC(=N)N)c1
4197	NC[C@H]1C[C@H]2C[C@@H]1[C@H](CN)C2
4198	N=C1N=C(O)NC(=N)C1=NO
4199	NC1=CC(N)=NS(=O)(=O)N1CCc1ccccc1
4200	COc1ccc([C@H](N)[C@H](N)c2ccc(OC)cc2)cc1
4201	N=C(NO)c1cccc(C(N)=NO)n1
4202	N=C1N=NC(N)=C1NNc1ccc(C(F)(F)F)cc1
4203	CC1(C)NC(=N)NC(=N)N1OCc1ccccc1
4204	C[C@H](CN)CCN
4205	CC(=O)c1cccc(N2C(=N)NC(=N)NC2(C)C)c1
4206	N=C(S)SC(=N)S
4207	N=C1N=NC(N)=C1NNc1ccccc1Cl
4208	CC1(C)NC(=N)NC(=N)N1c1cccc(O)c1
4209	N=C(N)N/N=C1/C/C(=N\\NC(=N)N)c2ccccc21
4210	NCCCCCCN
4211	COc1ccc(NNC2=C(N)N=NC2=N)cc1O
4212	CO[C@@H]1O[C@H](CN)CC[C@H]1N
4213	N=C(N)Nc1ccc2c(c1)Cc1cc(NC(=N)N)ccc1-2
4214	NCc1ccccc1-c1ccccc1CN
4215	NCC1(CN)CNC1
4216	CC1(C)NC(=N)NC(=N)N1OCc1ccc(Cl)cc1
4217	CC[C@]1(C)NC(=N)NC(=N)N1c1ccc(OC)cc1
4218	CC(C)(N)CCN
4219	CC1=CC[C@@H](C(C)C)[C@H](N)[C@@H]1N
4220	N=C(N)NCCN
4221	NC12CCC(N)(CC1)CC2
4222	N[C@H]1[C@@H]2CC[C@@H](C2)[C@H]1N
4223	N#CC1=C(N)SC(N)=C(C#N)C1
4224	Cc1cc(C)c(CN)c(C)c1CN
4225	[H]/N=C1/C=C(N)C(=O)C(N)=C1O
4226	N=C1CC(=N)NNN1
4227	N=C1NC(=N)N(c2cccc(Cl)c2)[C@@H](Cc2ccccc2)N1
4228	C[C@H](N)C[C@@H](C)N
4229	CC1(C)NC(=N)NC(=N)N1c1cccc(I)c1
4230	N=C(N)NC(=N)NCCNC(=N)NC(=N)N
4231	CC1(C)O[C@@H](CN)[C@@H](CN)O1
4232	C[C@@H](N)C[C@@H](C)N
4233	COc1ccc(NNC2=C(N)N=NC2=N)cc1
4234	N=C1N=NC(N)=C1NNc1ccc(I)cc1
4235	CC1(C)NC(=N)NC(=N)N1c1cccc(C(=O)O)c1
4236	N=C(N)c1cccc(-c2cc3ccc(C(=N)N)cc3o2)c1
4237	COc1cccc([C@H](N)CN)c1
4238	CC(CN)(CN)c1ccccn1
4239	N=C(N)N[C@@H]1[C@H](O)[C@H](O)[C@@H](O)[C@H](NC(=N)N)[C@H]1O
4240	N[C@H]1C[C@H](N)[C@]2(CC[C@@H](O)[C@H](O)CO2)[C@H](O)[C@H]1O
4241	N=C(N)CN
4242	N=C1N=NC(N)=C1NNc1cccc(Cl)c1
4243	N=C(N)c1ccc(-c2cc3cc(C(=N)N)ccc3s2)cc1
4244	Cc1c(C)c(CN)c(C)c(C)c1CN
4245	N=C(N)c1ccc2oc3ccc(C(=N)N)cc3c2c1
4246	N#C/C(N)=C(C#N)\\N=C/C=N/C(C#N)=C(/N)C#N
4247	N=C1C=C(N)C(=O)C(N)=C1
4248	N=C1NCN(c2ccc(Cl)cc2)C(=N)N1
4249	CCc1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4250	C[C@H](N)CC[C@H](C)N
4251	N=C(N)SCC#CCSC(=N)N
4252	N=C1N=NC(N)=C1NNc1ccc(Cl)cc1
4253	NC[C@@H]1CCCC[C@H]1N
4254	N[C@@H]1[C@@H]2OC[C@H]3O[C@@H](OC[C@@H](O2)[C@@H](O)[C@@H]1O)[C@H](N)[C@H](O)[C@@H]3O
4255	CCn1c2ccccc2c2cc(NNC3=C(N)N=NC3=N)ccc21
4256	N=C1N=C(O)/C(=N\\Nc2ccccc2)C(=N)N1
4257	Cc1ccc(NC(=N)S)cc1NC(=N)S
4258	NCC#CCN
4259	N=C(S)N/N=C\\C=N\\NC(=N)S
4260	N=C1N=NC(N)=C1NNc1cc[nH]n1
4261	NCc1c(Cl)c(Cl)c(Cl)c(CN)c1Cl
4262	CC(C)(C)OC(O)=NC(CN)CN
4263	CC(C)(N)c1ccc(C(C)(C)N)cc1
4264	COCc1c2c(n3c1[C@H](OC)[C@@H](N)C3)C(=O)C(C)=C(N)C2=O
4265	N=C(N)CC(=N)N
4266	N=C(N)NC[C@@H](N)C(=O)O
4267	C[C@H](N)c1ccc([C@@H](C)N)cc1
4268	NC1=C(C2=C(N)C(=O)c3ccccc3C2=O)C(=O)c2ccccc2C1=O
4269	N=C1N=NC(N)=C1NNc1ccccc1Br
4270	CC(/C=N/NC(=N)N)=N\\NC(=N)N
4271	NC[C@@H]1CCCC[C@H]1CN
4272	CC(C)[C@@](C)(N)C(=N)S
4273	CC1(C)NC(=N)NC(=N)N1c1ccc(C(F)(F)F)cc1
4274	NCC(Br)CN
4275	NCC1(CN)COC1
4276	NC[C@@H]1O[C@@H](O)[C@@H](N)[C@@H](O)[C@H]1O
4277	N=C1NS(=O)(=O)N=C(N)C1=NO
4278	N[C@H]1CCC[C@H](N)C1
4279	NCc1cc(Br)cc(CN)c1
4280	CC1(C)[C@@H](N)C[C@@H]1CN
4281	CC(C)(C)c1ccc(N=C(N)C(N)=Nc2ccc(C(C)(C)C)cc2)cc1
4282	NC1=NS(=O)(=O)N=C1N
4283	NCC1(CN)CCC1
4284	N=C(N)N/N=C1/CC[C@H]2[C@H](CC[C@H]3C/C(=N/NC(=N)N)CC[C@H]32)C1
4285	CC(=O)[C@]1(N)C(I)=CC(I)=C(N)[C@@H]1I
4286	COc1c(C)ncc(CN)c1CN
4287	NCC1(CN)CCOCC1
4288	CC1=C(N)C(=O)c2c(CO)c3n(c2C1=O)C[C@@H](N)[C@H]3O
4289	C[C@](N)(CN)C(F)(F)F
4290	COc1cccc(N2C(=N)NC(=N)NC2(C)C)c1
4291	N=C(N)c1ccc2[nH]c3ccc(C(=N)N)cc3c2c1
4292	NCC(CN)c1ccccn1
4293	N=C(S)C(C(=N)S)c1ccccc1
4294	N=C1N=C(S)NC(=N)C1c1nnc(-c2ccccc2)c(-c2ccccc2)n1
4295	N=C(N)N=c1nnc(=NC(=N)N)[nH][nH]1
4296	CC(C)(C)OC(O)=NC[C@@H](N)CN
4297	CC(C)([C@H]1CC[C@@H](N)CC1)[C@H]1CC[C@@H](N)CC1
4298	CCO[C@@H]1CC[C@@H](N)[C@@H](CN)O1
4299	N=C1N=NC(N)=C1NNc1cccc(Br)c1
4300	CC[C@H](N)C(N)(O)O
4301	CC(C)C[C@@H](N)CN
4302	N#CC1=C(N)SC(N)=C(C#N)C1c1ccc(F)cc1
4303	N/C=C\\C=C\\N
4304	Cc1ccc(C(N)=NN=C(N)c2ccc(C)cc2)cc1
4305	C[C@@H](N)[C@H](N)C(=O)O
4306	N[C@H]1[C@H](N)[C@H](O)C=C[C@H]1O
4307	C[C@@H](N)[C@H]1CC[C@@H]2[C@H]3CC=C4C[C@@H](N)CC[C@]4(C)[C@H]3CC[C@]12C
4308	NC[C@@H]1OCO[C@H]2[C@H]1OCO[C@@H]2CN
4309	CC(C)(N)CCCN
4310	N[C@H]1C[C@H]2C[C@@H]1C[C@@H]2N
4311	CC1(C)NC(=N)NC(=N)N1c1ccccc1Cl
4312	CC1(C)NC(=N)NC(=N)N1c1cccc(C(=O)CCl)c1
4313	COc1ccc(C2C(C#N)=C(N)SC(N)=C2C#N)cc1
4314	N[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@]14C[C@@H]5C[C@@H](C[C@@](N)(C5)C1)C4)(C3)C2
4315	NC12CC3(N)C[C@H](C1)C[C@H](C2)C3
4316	NC[C@@H]1O[C@H](n2cc(/C=C\\Br)c(O)nc2=O)C[C@H]1N
4317	N=C(S)NNC(=N)S
4318	N=C(N)NC(=N)c1cccc(C(=N)NC(=N)N)c1
4319	N=C1NCN(c2ccc(F)cc2)C(=N)N1
4320	CC1=C(N)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](N)C3
4321	C[C@H](N)[C@@H](C)N
4322	NC(=NO)C(N)=NO
4323	CC(C)NC(=N)NC(=N)Nc1ccc(Cl)cc1
4324	C[C@H](N)CC(=N)NO
4325	CO[C@H]1O[C@@H](CN)[C@@H](O)[C@@H](N)[C@H]1O
4326	N=C(N)c1ccc2c(c1)[nH]c1cc(C(=N)N)ccc12
4327	N=C(S)NCCNC(=N)S
4328	N#CC1=C(N)SC(N)=C(C#N)C1c1ccccc1
4329	NC[C@H]1c2ccccc2C[C@@H]1N
4330	NC/C=C/[C@@H](N)C(=O)O
4331	N=C(N)c1ccc(-c2cc3ccc(C(=N)N)cc3s2)cc1
4332	N=C1N=NC(N)=C1NNc1ccc(Br)c2ccccc12
4333	C[C@@H](N)[C@@](N)(c1ccc(F)cc1)c1ccc(F)nc1
4334	CN1CC[C@H](N)[C@H](CN)C1
4335	N=C(N)NCCCN
4336	COc1cc(NNC2=C(N)N=NC2=N)cc(C(F)(F)F)c1
4337	CC1(C)NC(=N)NC(=N)N1OCc1cccc2cccnc12
4338	NC[C@@H]1C[C@H](N)C(=O)O1
4339	C/C(N)=C\\C(=N)S
4340	NC[C@H](O)[C@@H](O)CN
4341	N=C(N)NCCNC(=N)N
4342	N[C@H]1[C@H](O)[C@@H](N)[C@H](O)[C@H](O)[C@H]1O
4343	NC[C@@H](N)C(=O)O
4344	CC1(C)NC(=N)NC(=N)N1c1cccc(Br)c1
4345	COc1cc(C2C(C#N)=C(N)SC(N)=C2C#N)ccc1O
4346	N[C@H]1CC(O)C[C@H](N)C1
4347	CC1(C)NC(=N)NC(=N)N1OCc1cc(Cl)c(Cl)cc1Cl
4348	N#C[C@H](N)[C@@H](N)C#N
4349	N=C(N)N[C@H]1CC[C@@H]([C@H](N)C(=O)O)CC1
4350	CC(C)(N)[C@H](N)c1ccccc1
4351	CC1(C)C(=N)NC(=N)N=C1O
4352	N/C=C(/N)C(=O)c1ccc(Cl)cc1
4353	N=C(N)c1ccc(-n2cc3cc(C(=N)N)ccc3n2)cc1
4354	NC12CCC(N)(c3ccccc31)c1ccccc12
4355	C[C@H]1NC(=N)NC(=N)N1c1cccc(Cl)c1
4356	Cc1ccc([C@@H](N)[C@H](N)c2ccc(C)cc2)cc1
4357	N=C(S)NCNC(=N)S
4358	N=C(S)N(CCN)c1ccc2nccnc2c1Br
4359	N=C(N)c1cccc(-c2cc3cc(C(=N)N)ccc3o2)c1
4360	NCC1(CN)CCCCC1
4361	N=C(S)c1cccc(C(=N)S)c1
4362	N=C1N=NC(N)=C1NNc1c(O)ccc2ccccc12
4363	CC(C)[C@@]1(C)NC(=N)NC(=N)N1c1ccc(Cl)cc1
4364	CO[C@H]1O[C@H](CN)[C@@H](O)[C@H](N)[C@H]1O
4365	N[C@H]1CO[C@H]2[C@@H](N)CO[C@@H]12
4366	Cc1ncc(CN)c(CN)c1Cl
4367	N[C@H]1CC[C@H](C2([C@H]3CC[C@@H](N)CC3)CCCCC2)CC1
4368	CC(C)C[C@H](N)CN
4369	N=C1N=NC(N)=C1NNc1c(F)cccc1F
4370	Cc1cn([C@H]2C[C@@H](N)[C@H](CN)O2)c(=O)nc1O
4371	N=C1N=C(O)C(N)C(O)=N1
4372	N=C(N)Nc1ccc(-c2ccc(NC(=N)N)cc2)cc1
4373	Cc1cc(C)cc([C@@H](N)[C@H](N)c2cc(C)cc(C)c2)c1
4374	CC1(C)NC(=N)NC(=N)N1c1cc(Cl)ccc1Cl
4375	NCCC#CCCN
4376	N=C1N=NC(N)=C1NNc1ncc[nH]1
4377	N=C1N=NC(N)=C1NNc1ccc(Cl)c(Cl)c1
4378	N[C@@H]1CC[C@H]1N
4379	N=C1NC(=N)N(c2cccc(Cl)c2)[C@H](c2ccccc2)N1
4380	N=C1CC(=N)Nc2ccccc2N1
4381	N=C1NCN(c2ccccc2)C(=N)N1
4382	C[C@@]1(N)CCC[C@@H](N)C1
4383	N[C@H](C[C@H]1CC[C@@H](N)CC1)C(=O)O
4384	NCC(CN)c1ccccc1
4385	N=C(S)[C@H](N)Cc1ccccc1
4386	CC1(C)C(=N)N=C(NNC2=NC(=N)C(C)(C)N2O)N1O
4387	CC1(C)O[C@H]2[C@H](N)CSC[C@@H](N)[C@H]2O1
4388	CC1(C)NC(=N)NC(=N)N1c1cccc2ccccc12
4389	N=C(CCC(=N)NO)NO
4390	CCC[C@H](N)CN
4391	CSc1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4392	C[C@@H](CN)C(=N)NO
4393	CO[C@@H]1C[C@@H](N)C[C@@H](N)C1
4394	CC(C)[C@H]1NC(=N)NC(=N)N1c1ccc(Cl)cc1
4395	N[C@H]1Nc2cncnc2N[C@H]1N
4396	N=C1N=NC(N)=C1NNc1ccc(F)cc1
4397	CO[C@@H]1OC[C@@H](N)[C@H](O)[C@H]1N
4398	C[C@@H](N)P(=O)(O)[C@@H](N)c1ccccc1
4399	C#C[C@H](N)CC[C@@H](C)N
4400	NCC#CC[C@H](N)C(=O)O
4401	N[C@@H](c1ccccc1Cl)[C@H](N)c1ccccc1Cl
4402	N=C1NC(=N)N(c2ccccc2)[C@@H](c2ccccc2)N1
4403	NC1=C(N)C(=O)c2ncccc2C1=O
4404	N=C1NC2(c3ccccc3)NC(=N)NC2(c2ccccc2)N1
4405	CC1(C)NC(=N)NC(=N)N1Cc1ccc(Cl)cc1
4406	NCc1cccc2c(CN)cccc12
4407	NCC1(N)CCN(Cc2ccccc2)CC1
4408	N=C(N)c1ccc(-c2csc3ccc(C(=N)N)cc23)cc1
4409	NC12N=C(O)NC1(N)NC(O)=N2
4410	C[C@@H](N)CCCN
4411	N=C(N)NC(=N)N1CCN(C(=N)NC(=N)N)CC1
4412	CO[C@H]1C=C[C@@H](OC)[C@H](N)[C@@H]1N
4413	N=C1NC(=N)N(c2ccc(Cl)c(Cl)c2)[C@@H](c2ccccc2)N1
4414	CC1(C)NC(=N)NC(=N)N1c1ccc(-c2ccccc2)cc1
4415	C[C@@](N)(CN)C(=O)O
4416	NC[C@H](N)Cc1c[nH]c2ccccc12
4417	C[C@H]1CC(C)(C)[C@@H](CN)[C@@H]1N
4418	Cc1ccc([C@H](N)[C@@H](N)c2ccc(C)cc2)cc1
4419	N[C@@]12C[C@H]3C[C@H]4[C@@H]1C[C@H]1C[C@@H]2[C@@H](C3)[C@]4(N)C1
4420	N[C@@H](c1cccc2ccccc12)[C@H](N)c1cccc2ccccc12
4421	N=C(S)NN=C(O)c1ccc(C(O)=NNC(=N)S)cc1
4422	N#CC1=C(N)Oc2c(ccc3c4c(ccc23)[C@@H](c2ccc(Cl)cc2)C(C#N)=C(N)O4)[C@H]1c1ccc(Cl)cc1
4423	NCC12CC3(CN)C[C@H](C1)C[C@H](C2)C3
4424	NCCCC1(N)CCCCC1
4425	C[C@@H](N)[C@H](N)c1ccccc1
4426	NC12CCCCC1(N)CCCC2
4427	N=C(N)NNC(=N)N
4428	NC1=CC(=S)C(N)=CC1=S
4429	N=C1N=NC(N)=C1NNc1cccc(I)c1
4430	CC1(C)NC(=N)NC(=N)N1c1cccc(Cl)c1
4431	N=C(N)SC[C@H]1CNC(=N)S1
4432	N=C(S)Oc1ccc(OC(=N)S)cc1
4433	N[C@@H]1CO[C@@H]2[C@H]1OC[C@H]2N
4434	C[C@H]1NC(=N)NC(=N)N1c1ccc(Cl)cc1
4435	C=C(CN)CN
4436	CC(/C=N/NC(=N)S)=N\\NC(=N)S
4437	N=C1N=C(S)NC(=N)C1=NO
4438	CC(=O)ON=C(N)C(N)=NOC(C)=O
4439	N=C(N)c1ccc(-c2cc3ccc(C(=N)N)cc3o2)cc1
4440	CC1(C)[C@@H](CN)CC[C@@]1(C)CN
4441	CC(C)(N)C(=O)C(C)(C)N
4442	N#CC1=C(N)SC(N)=C(C#N)C1c1cccc(F)c1
4443	N[C@H]1C[C@@H]2[C@@H](C(=O)O)[C@@H]2[C@@]1(N)C(=O)O
4444	CCC(C)(CN)CN
4445	CC1(C)NC(=N)NC(=N)N1c1cccc(CO)c1
4446	CC1(C)NC(=N)NC(=N)N1c1cccc(C#N)c1
4447	NCC1(N)CCCC1
4448	N=C1N=NC(N)=C1NNc1ccc(C(=O)O)cc1
4449	CC[C@]1(C)NC(=N)NC(=N)N1c1c(C)cccc1C
4450	CC(C)(N)CCC(C)(C)N
4451	CC1(C)[C@H](N)C(C)(C)[C@H]1N
4452	Cc1cc(C)c(CN)cc1CN
4453	N[C@H]1C[C@@H]2C[C@H](N)C[C@@H]2C1
4454	NC[C@@H](N)Cc1ccccc1
4455	N#CC1=C(N)SC(N)=C(C#N)C1c1ccc(Cl)cc1
4456	CC/C(N)=C(\\C#N)C(=N)S
4457	Cc1ccc(NNC2=C(N)N=NC2=N)cc1
4458	[H]/N=C1/C=C(N)/C(=N\\[H])C=C1N
4459	N=C(N)c1ccc(CN)cc1
4460	CC1(C)NC(=N)NC(=N)N1c1ccccc1
4461	N[C@H](c1c(Cl)cc(O)cc1Cl)[C@H](N)c1c(Cl)cc(O)cc1Cl
4462	N=C(S)[C@H](N)c1ccccc1
4463	N=C(N)Nc1cc(NC(=N)N)cc(C(=O)O)c1
4464	CC(C)([C@H]1CC[C@H](N)CC1)[C@H]1CC[C@@H](N)CC1
4465	CC1(C)NC(=N)NC(=N)N1c1ccc(Cl)c(Cl)c1
4466	C[C@H]1CC[C@@H](N)C[C@H]1N
4467	CC1(C)NC(=N)NC(=N)N1c1cc(Cl)c(Cl)cc1Cl
4468	C[C@@]12CC[C@@H](N)C[C@@H]1CC[C@H]1[C@H]2CC[C@@]2(C)[C@H](N)CC[C@H]12
4469	NC1=C(N2CC2)C(=O)C(N)=C(N2CC2)C1=O
4470	CC1(C)NC(=N)NC(=N)N1OCc1ccc(Cl)c(Cl)c1
4471	N=C1N=NC(N)=C1NN=c1cc[nH]cc1
4472	NCc1c2ccccc2c(CN)c2ccccc12
4473	COC1=C(N)C(=O)C(OC)=C(N)C1=O
4474	CSC(=N)NNC(=N)S
4475	N=C(S)Nc1ccc(NC(=N)S)cc1
4476	N=C(N)NC1=NC(=N)c2ccccc21
4477	CC1(C)NC(=N)NC(=N)N1c1ccc(C#N)cc1
4478	N[C@H]1CCCC[C@@H]1C[C@H]1CCCC[C@@H]1N
4479	CC(C)c1ccccc1NNC1=C(N)N=NC1=N
4480	N[C@H]1CCC[C@@H]2[C@@H]1CCC[C@H]2N
4481	N=C(N)NC(=N)N
4482	N[C@@H](c1ccc(Cl)cc1)[C@@H](N)c1ccc(Cl)cc1
4483	NCCOC(=O)CN
4484	C/C(N)=C(\\C#N)C(=N)S
4485	NCP(=O)(O)CN
4486	N[C@H]1CC=CC[C@@H]1N
4487	NC[C@H]1CC[C@@H](N)CC1
4488	NC[C@H](N)c1cccc(F)c1
4489	CSc1ccc(NNC2=C(N)N=NC2=N)cc1
4490	N[C@@H](C1CCCCC1)[C@H](N)C1CCCCC1
4491	Nc1cccc(-c2cccc(N)c2)c1
4492	NCC12CCC(CN)(CC1)CC2
4493	NC[C@@H](N)c1ccc(C(F)(F)F)cc1
4494	CNC(CN)CN
4495	COc1ccc(NNC2=C(N)N=NC2=N)cc1Cl
4496	N[C@H]1CSC[C@@H]1N
4497	CC1(C)NC(=N)NC(=N)N1c1ccc(F)cc1
4498	NCc1cccc2cc3cccc(CN)c3nc12
4499	NC[C@@H](N)c1ccccc1
4500	[H]/N=C(/C#N)C(=N)N/C(C#N)=C(/N)C#N
4501	NCC1(N)CCCCCC1
4502	NC[C@H]1CC[C@H](CN)O1
4503	N=C1N=NC(N)=C1NNc1ccc(Br)cc1
4504	NCc1ccc(CN)s1
4505	CC(=N\\NC(=N)S)/C(C)=N/NC(=N)S
4506	NC(=S)c1ccc(C(N)=S)cc1
4507	COC(=O)[C@H](N)CN
4508	C[C@H](N)CC(C)(C)N
4509	CCOC(=O)[C@@H](N)C(=N)N
4510	N=C(NNC(=N)c1ccccc1)c1ccccc1
4511	N[C@@H]1C=C[C@@H](N=C(O)OCc2ccccc2)[C@H](N)C1
4512	N=C1NC(=N)N2CCN=C2N1
4513	N[C@H]1CC[C@H](C[C@H]2CC[C@@H](N)CC2)CC1
4514	N[C@H]1C[C@@H]2C[C@H]1C[C@@H]2N
4515	CC(C)(C)C1(C)O[C@@H](CN)[C@H](CN)O1
4516	N#CC1=C(N)SC(N)=C(C#N)C1c1ccco1
4517	N=C1N=NC(N)=C1NNc1cccc2ccccc12
4518	N=C(S)c1cccc(C(N)=S)n1
4519	CCC(N)(CC)CN
4520	C#Cc1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4521	CO[C@@H]1O[C@@H]2CO[C@@H](c3ccccc3)O[C@@H]2[C@@H](N)[C@@H]1N
4522	N#CC1=C(N)SC(N)=C(C#N)C1c1ccccc1Cl
4523	N=C(N)N[C@H]1[C@H](O)[C@@H](O)[C@H](O)[C@H](NC(=N)N)[C@H]1O
4524	N=C(N)c1ccc(-c2cc3cc(C(=N)N)ccc3[nH]2)cc1
4525	NC12C[C@H]3[C@@H]4CC5(N)C[C@H]([C@@H](C1)[C@@H]3C5)[C@@H]4C2
4526	N[C@@H](c1ccco1)[C@@H](N)c1ccco1
4527	NC[C@@H]1CC[C@H](CN)O1
4528	N=C(S)SCCSC(=N)S
4529	NC[C@@]1(N)CN2CCC1CC2
4530	N#CC1=C(N)S[C@H](c2ccccc2)[C@@](C#N)(C(=N)S)[C@@H]1c1ccccc1
4531	N[C@H]1CCCC[C@@H]1SS[C@@H]1CCCC[C@@H]1N
4532	N=C1N=NC(N)=C1NNc1ccccc1
4533	N=C(N)NC(=N)S
4534	N#CC1=C(N)SC(N)=C(C#N)C1c1cccs1
4535	CCCN1C(=N)NC(=N)NC1(C)C
4536	NC12[C@H]3[C@H]4[C@@H]1[C@H]1[C@@H]2[C@@H]3C41N
4537	COc1ccc(OC)c(N2C(=N)NC(=N)NC2(C)C)c1
4538	CC1(C)[C@@H](N)CC[C@]1(C)N
4539	C[C@H]1C[C@@H](C[C@@H]2CC[C@@H](N)[C@@H](C)C2)CC[C@@H]1N
4540	N#C/C(N)=C(\\C#N)NC=N
4541	N[C@H]1C[C@@H](N)[C@@H](O)[C@@H](O)[C@H]1O
4542	N[C@H]1[C@H](c2ccccc2)[C@@H](N)[C@@H]1c1ccccc1
4543	N=C(N)SC(=N)N
4544	N=C(S)NN=C1Nc2ccccc2C1=NNC(=N)S
4545	CC[C@H]1C[C@@H](CC)[C@@H](N)[C@H](C)[C@@H]1N
4546	NC1(C2(N)CCCCC2)CCCCC1
4547	CC(C)(C)OC(=O)[C@@H](N)CN
4548	CC[C@@]1(C)NC(=N)NC(=N)N1c1ccc(Cl)cc1
4549	N=C(N)SCCN
4550	COc1cc(OC)cc(N2C(=N)NC(=N)NC2(C)C)c1
4551	N[C@@H]1[C@H](O)[C@H](CO)O[C@@H](O)[C@@H]1N
4552	N[C@H]1CCCC[C@@H]1C[C@H]1CC[C@H](N)CC1
4553	NCc1cccc2cc3cccc(CN)c3cc12
4554	NCc1ccccc1CN
4555	N[C@H]1CC[C@H]2CCCC[C@@H]2[C@@H]1N
4556	N[C@@H]1C[C@@H]2C[C@H]1C[C@H]2N
4557	CC1(C)NC(=N)NC(=N)N1c1ccc(S(C)(=O)=O)cc1
4558	CC1(C)NC(=N)NC(=N)N1c1ccc2ccccc2c1
4559	NCC1(CN)CCCC1
4560	COc1ccc(CN2C(=N)NC(=N)NC2(C)C)cc1
4561	C[C@](N)(C(=N)S)c1ccccc1
4562	CC(=N)NCc1cccc(CN)c1
4563	N=C(N)Nc1ccc(CN)cc1
4564	NCc1ccc2c(c1)CN1CN2Cc2cc(CN)ccc21
4565	C[C@](N)(CN)C(=O)O
4566	N[C@@H](C(=O)O)[C@@H](N)C(=O)O
4567	N=C1N=NC(N)=C1NNc1nc2ccccc2s1
4568	CC(C)/C(N)=C(\\C#N)C(=N)S
4569	N[C@@H]1Cc2ccccc2[C@H]1N
4570	CC[C@H]1C[C@@H](C)[C@H](N)[C@H](CC)[C@H]1N
4571	Cc1cc(CN)c(O)c(CN)c1
4572	N=C1N=NC(N)=C1NNCC1CCNCC1
4573	Nc1cccc(C#Cc2ccccc2N)c1
4574	NC[C@H](N)CCO
4575	CCOc1cccc(N2C(=N)NC(=N)NC2(C)C)c1
4576	N[C@@H]1C[C@@H](N)[C@@H](O)[C@@H](O)[C@H]1O[C@@H]1O[C@@H](CO)[C@H](O)[C@H](O)[C@H]1O
4577	NC[C@@H](N)C12C[C@H]3C[C@@H](C1)C[C@@H](C2)C3
4578	Cc1cccc(N2C(=N)NC(=N)NC2(C)C)c1
4579	N[C@@H]1C[C@@H](N)[C@]2(CC[C@@H](O)[C@H](O)CO2)[C@H](O)[C@H]1O
4580	NC[C@@H]1O[C@@H](O)[C@@H](N)[C@@H](O)[C@@H]1O
4581	C[C@@H](ON1C(=N)NC(=N)NC1(C)C)c1c(Cl)cccc1Cl
4582	Cc1ccc(N=C(N)C(N)=Nc2ccc(C)cc2)cc1
4583	CC1(C)NC(=N)NC(=N)N1OCc1cccc2ccccc12
4584	N[C@@H]1CCCCCC[C@H]1N
4585	CC(C)(C)c1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4586	NC[C@@H]1CCCC[C@@H]1N
4587	CCC1(CC)C(=N)N=C(O)NC1=N
4588	N=C1N[C@@H](C(=O)O)[C@H]([C@@H](O)CN)N1
4589	N#CC1=C(N)SC(N)=C(C#N)C1c1ccc(Br)cc1
4590	N[C@H]1C[C@@H](N)[C@@H](O)[C@H](O)[C@@]12C[C@H](O)[C@@H](O)CO2
4591	Cc1nc(CN)c(=O)[nH]c1CN
4592	NC[C@H](N)Cc1ccccc1
4593	N[C@H](c1ccccn1)[C@H](N)c1ccccn1
4594	NCc1c(Cl)c(Cl)c(CN)c(Cl)c1Cl
4595	CC[C@@H](N)CCN
4596	Cc1ccccc1[C@H](N)[C@@H](N)c1ccccc1C
4597	N=C(NNC(=N)c1ccccn1)c1ccccn1
4598	N=C1N=NC(N)=C1NNc1ccc(S(=O)(=O)O)cc1
4599	COC[C@H](N)CN
4600	N[C@H]1CCCC[C@@H](N)CCCC1
4601	N=C(/N=N/C(=N)NCl)NCl
4602	N=C(N)c1ccc(-c2nc3cc(C(=N)N)ccc3[nH]2)cc1
4603	NC12CNCCNCC(N)(CNCCNC1)CNCCNC2
4604	N[C@H](c1ccc(O)cc1)[C@H](N)c1ccc(O)cc1
4605	NC[C@H]1O[C@@H](O)[C@H](N)[C@H](O)[C@@H]1O
4606	NCC[C@H](N)C(=O)N1CCCCC1
4607	Cc1ccc(CN)cc1CN
4608	CCON1C(=N)NC(=N)NC1(C)C
4609	CC(O)=N[C@H]1[C@@H](N)C=C(C(=O)O)C[C@H]1N
4610	NCC(=O)CN
4611	CCC[C@]1(C)NC(=N)NC(=N)N1c1ccc(Cl)cc1
4612	CC1(C)NC(=N)NC(=N)N1c1ccc(C#Cc2ccccc2)cc1
4613	N=C1CC(O)=NC(=N)N1
4614	Cc1ccccc1[C@H](N)[C@H](N)c1ccccc1C
4615	C[C@H]1CCC[C@@H](N)[C@H]1N
4616	NC[C@@H](N)O
4617	COC(=O)[C@@H](N)[C@@H](N)c1ccccc1
4618	N[C@@H](c1ccc(C(F)(F)F)cc1)[C@H](N)c1ccc(C(F)(F)F)cc1
4619	NC[C@H]1CC[C@H](CN)CC1
4620	C[C@H]1C[C@@H]2C[C@@H](C)[C@@](C)(N)[C@H]3CC[C@H]4[C@@H]([C@H]1CC[C@@]4(C)N)[C@H]32
4621	N[C@H]1C[C@H]1N
4622	N=C(N)NN=C1C=CC(=NNC(=N)N)C=C1
4623	N[C@@H]1CCc2ccccc2[C@H]1N
4624	CC1(C)NC(=N)NC(=N)N1O
4625	NCCC(=O)CN
4626	N=C(CN)NO
4627	NC[C@H]1CC[C@@H](CN)CC1
4628	N[C@H]1CC[C@H]([C@H]2CC[C@@H](N)CC2)CC1
4629	CON1C(=N)NC(=N)NC1(C)C
4630	NCC1=CC[C@H](CN)CC1
4631	CC(O)=NC1=C(N)C(=O)C(N=C(C)O)=C(N)C1=O
4632	N=C(S)Nc1ccc(-c2ccc(NC(=N)S)cc2)cc1
4633	C[C@H]1OC(=O)C(N)=C1N
4634	N=C(NO)C(=N\\O)/C(=N\\O)C(=N)NO
4635	N[C@H]1CC[C@@H](N)C1
4636	Cc1ccccc1NNC1=C(N)N=NC1=N
4637	NC[C@H](N)CBr
4638	N[C@@H]1[C@H](O)CN=C(O)[C@@H]1N
4639	NCC(=O)N=C(O)CN
4640	CCOC(=O)C1=C(N)NC(=N)CC1
4641	NC[C@@]12C[C@@H]3C[C@@H](C[C@@H](C3)C1)[C@@H]2N
4642	C[C@@H](CN)CCN
4643	CC1(C)NC(=N)NC(=N)N1c1ccc(C(=O)O)cc1
4644	C[C@H](N)C(C)(C)N
4645	C[C@H](CN)[C@@H](C)CN
4646	CC1(C)NC(=N)NC(=N)N1c1ccccc1Br
4647	N=C(/N=N\\C(=N)NCl)NCl
4648	N=C1N=NC(N)=C1NNc1nccs1
4649	N=C(CCN)NO
4650	CC1(C)NC(=N)NC(=N)N1c1ccc(O)cc1
4651	CC1(C)NC(=N)NC(=N)N1c1cccc(C(O)=Nc2cccnc2)c1
4652	NC1=CC(=O)C(N)=CC1=O
4653	NCC(F)CN
4654	NCC(F)(F)CN
4655	N=C1N[C@@H]2C=C[C@H]1[C@@H]1C=C[C@H]2C(=N)N1
4656	N=C1N=NC(N)=C1NNc1c(F)c(F)c(F)c(F)c1F
4657	Cc1ncc(CN)c(CN)c1O
4658	CCOC(=O)c1cccc(N2C(=N)NC(=N)NC2(C)C)c1
4659	CC1(C)NC(=N)NC(=N)N1c1cccc(C(F)(F)F)c1
4660	N=C(N)NC(=N)NCCc1ccccc1
4661	CC1(C)NC(=N)NC(=N)N1c1cc(Cl)cc(Cl)c1
4662	N=C1N=NC(N)=C1NNc1ccc(S(=O)(=O)O)c2ccccc12
4663	CCOC(=O)c1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4664	CC1(C)NC(=N)NC(=N)N1c1ccc(Cl)cc1Cl
4665	NCCN=C(O)CN
4666	CC(C)(C)c1cccc(N2C(=N)NC(=N)NC2(C)C)c1
4667	CC(C)/C(N)=C/C(=N)S
4668	C[C@@H](N)O[C@H](C)N
4669	CC(C)(N)[C@H]1CC[C@@](C)(N)CC1
4670	C[C@H](N)Cc1cccc(C(C)(C)N)c1
4671	N[C@H]1CC2(C[C@H](N)C2)C1
4672	CC1(C)NC(=N)NC(=N)N1OCc1c2ccccc2cc2ccccc12
4673	NC1=CC(N)=NS(=O)(=O)N1Cc1ccccc1
4674	C[C@H](ON1C(=N)NC(=N)NC1(C)C)c1ccc(Cl)cc1Cl
4675	NC[C@@H](N)CO
4676	N[C@H]1CC[C@H](C[C@H]2CC[C@H](N)CC2)CC1
4677	C[C@H]1CC[C@@H](N)[C@@H](N)C1
4678	CC1(C)NC(=N)NC(=N)N1c1ccc2cc(Cl)ccc2c1
4679	C#C[C@@H](N)CC[C@H](C)N
4680	C[C@@H](N)c1ccc(-c2ccc([C@@H](C)N)cc2)cc1
4681	NCc1ccc(CN)o1
4682	N=C(N)c1ccc(-c2ccc(C(=N)N)cc2)cc1
4683	NC1=C(Br)C(=O)C(N)=C(Br)C1=O
4684	COC(=O)c1ccc(N2C(=N)NC(=N)NC2(C)C)cc1
4685	CC(=N\\NC(=N)N)/C(C)=N/NC(=N)N
4686	CC1(C)NC(=N)NC(=N)N1c1ccccc1I
4687	NC1(OOC2(N)CCCCC2)CCCCC1
4688	C[C@H](N)[C@@H](N)c1ccccc1
4689	N=C(NO)[C@@H](N)c1ccccc1
4690	NC[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1CN
4691	N=C1N=NC(N)=C1NNc1ccc(O)cc1
4692	NC[C@H](N)Cc1ccccc1F
4693	CC1(C)[C@H](CN)CC[C@]1(C)CN
4694	N=C(N)NCCSC(=N)N
4695	C[C@@H](N)C(O)=N[C@@H]1CO[C@H](O)[C@@H](N)[C@@H]1O
4696	CO[C@@H]1O[C@H](CN)[C@@H](O)[C@@H](O)[C@H]1N
4697	COC(=O)c1cc(CN)cc(CN)c1
4698	O[C@@H]1[C@H](O[C@@H]2[C@@H](Cl)C[C@H](Cl)[C@@H](O)[C@H]2O)O[C@H](CCl)[C@H](O)[C@@H]1O
4699	O[C@H]1[C@@H](Cl)[C@H](O)[C@@H](Cl)[C@@H](O)[C@@H]1Cl
4700	C[C@H](Cl)N([C@H](C)Cl)[C@@H](C)Cl
4701	OC[C@@H]1O[C@@H](O[C@H]2[C@@H](O)[C@@H](O)[C@H](Cl)C[C@H]2Cl)[C@H](O)[C@@H](Cl)[C@H]1O
4702	OC[C@@H]1O[C@H](O[C@@H]2[C@@H](O)[C@H](O)[C@@H](Cl)C[C@H]2Cl)[C@@H](Cl)[C@@H](O)[C@H]1O
4703	N=C(Cl)N=c1[nH]c(=NC(=N)Cl)[nH]c(=NC(=N)Cl)[nH]1
4704	Cl[C@H]1CCC[C@H](Cl)CCC[C@@H](Cl)CCC1
4705	O[C@H]1[C@@H](Cl)[C@@H](O)[C@@H](Cl)[C@@H](O)[C@@H]1Cl
4706	OC[C@H]1O[C@H](O[C@@H]2[C@@H](O)[C@@H](O)[C@H](Cl)C[C@H]2Cl)[C@@H](Cl)[C@@H](O)[C@H]1O
4707	O[C@H]1[C@H](Cl)[C@H](O)[C@H](Cl)[C@@H](O)[C@@H]1Cl
4708	O=S(=O)(O)[C@H]1NC(Cl)=NC(Cl)=C1Cl
4709	O=S1(=O)N=C(Cl)C(Cl)=C(Cl)N1
4710	C[C@@H](Cl)N([C@@H](C)Cl)[C@@H](C)Cl
4711	CC(CCl)(CCl)CCl
4712	O=C1OC[C@@H](Cl)C(=O)OC[C@@H](Cl)C(=O)OC[C@@H]1Cl
4713	ClCc1cc(CCl)cc(CCl)c1
4714	ClC[C@H]1C[C@H](CCl)C[C@@H](CCl)C1
4715	O=C1O[C@@H](CCl)[C@H](Cl)[C@@H]1Cl
4716	O=P(CCl)(CCl)CCl
4717	ClCC(Cl)CCl
4718	CC(C)(Cl)c1cc(C(C)(C)Cl)c(O)c(C(C)(C)Cl)c1
4719	Cl[C@H]1C[C@@H](Cl)C[C@@H](Cl)C1
4720	O[C@H]1[C@@H](Cl)[C@H](O)[C@@H](Cl)[C@@H](O)[C@H]1Cl
4721	O=S(=O)(O)[C@@H]1NC(Cl)=NC(Cl)=C1Cl
4722	OC[C@H]1O[C@H](O[C@H]2[C@H](Cl)C[C@H](Cl)[C@@H](O)[C@H]2O)[C@H](Cl)[C@H](O)[C@H]1O
4723	OC[C@H]1O[C@H](O[C@H]2[C@@H](Cl)C[C@@H](Cl)[C@@H](O)[C@@H]2O)[C@H](O)[C@H](Cl)[C@@H]1O
4724	SC(Cl)=NN=C1C=CC(=N/N=C\\Cl)C=C1
4725	ClCC(CCl)CCl
4726	ClC[C@H]1C[C@@H](CCl)C[C@@H](CCl)C1
4727	O[C@H]1[C@@H](O)[C@@H](O)[C@@H](CCl)O[C@@H]1O[C@H]1[C@H](Cl)C[C@@H](Cl)[C@@H](O)[C@H]1O
4728	O[C@@H]1[C@H](O[C@@H]2O[C@@H](CCl)[C@H](O)[C@H](O)[C@H]2O)[C@@H](Cl)C[C@@H](Cl)[C@H]1O
4729	ClCC[C@H](Cl)CCl
4730	ClC[C@H]1O[C@H](CCl)O[C@@H](CCl)O1
4731	[H]/N=C(\\Cl)[C@@H](Cl)/C(Cl)=N\\[H]
4732	OC[C@H]1O[C@@H](O[C@@H]2[C@@H](O)[C@H](O)[C@@H](Cl)C[C@H]2Cl)[C@@H](Cl)[C@@H](O)[C@H]1O
4733	ClC12CN3CC(Cl)(C1)CC(Cl)(C3)C2
4734	SC(Cl)=NN=C1C=CC(=N/N=C/Cl)C=C1
4735	OC[C@H]1O[C@H](O[C@H]2[C@H](Cl)C[C@H](Cl)[C@@H](O)[C@H]2O)[C@H](Cl)[C@@H](O)[C@@H]1O
4736	CO[C@H]1C=C[C@@H](OC)[C@@H](Br)[C@@H]1Br
4737	COC(=O)[C@H](Br)CCBr
4738	FC(F)(F)c1cccc(NN=C2C(Br)=NN=C2Br)c1
4739	BrC1=NN=C(Br)C1=NNc1nccnn1
4740	C[C@@](Br)(c1ccc(Cl)cc1)[C@H](Br)c1ccc(Cl)cc1
4741	CC1(C)N=C(Br)N=C(Br)N1c1ccc(I)cc1
4742	C[C@H](Br)[C@H](Br)C(=O)O
4743	C#C[C@H](Br)CCCBr
4744	[H]/N=C(/Br)c1cccc2c1CC/C2=N\\NC(=N)Br
4745	CC(O)=Nc1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
4746	CC(C)(CBr)C(C)(C)CBr
4747	Fc1ccc([C@H](Br)[C@@H](Br)c2ccc(F)cc2)cc1
4748	O=c1nc(O)ccn1[C@H]1C[C@@H](Br)[C@H](CBr)O1
4749	CC1(C)N=C(Br)N=C(Br)N1c1ccc(C(=O)CCl)cc1
4750	CO[C@H]1O[C@@H](CBr)[C@H](O)[C@H](Br)[C@@H]1O
4751	O/N=C(/Br)C[C@H](Br)c1ccccc1
4752	O=C1N=C(Br)N=C(Br)/C1=N/O
4753	CC(CBr)CBr
4754	Oc1ccccc1[C@H](Br)[C@H](Br)c1ccccc1O
4755	S=C(Br)CCC(=S)Br
4756	O[C@H]1[C@H](O)[C@@H](Br)[C@@H](O)[C@@H](Br)[C@@H]1O
4757	CN1C(Br)=NC(Br)=NC1(C)C
4758	Cc1cccc(C)c1N1C(Br)=NC(Br)=NC12CCCCC2
4759	BrC/C=C/CBr
4760	S=C(Br)CC(=S)Br
4761	Cc1ccccc1N1C(Br)=NC(Br)=NC1(C)C
4762	C[C@H](Br)C[C@H](C)CBr
4763	BrCCCCCCCBr
4764	Br[C@H]1[C@H]2CC[C@H](C2)[C@@H]1Br
4765	CC(C)(C)OC(=O)C1([C@](C)(Br)CBr)CC1
4766	BrC[C@H]1CCCC[C@@H]1Br
4767	BrCc1ccc(CBr)c2ccccc12
4768	CCC1(CC)C(=O)N=C(Br)N=C1Br
4769	CC(C)(C)c1cc(CBr)cc(CBr)c1
4770	C[C@H](Br)CBr
4771	S=C(Br)CBr
4772	O=C(O)[C@@H](Br)[C@H](Br)C(=O)O
4773	Clc1ccc([C@@H](Br)CBr)cc1
4774	O/N=C(Br)/C(=N/O)C(/Br)=N\\O
4775	OC(CBr)CBr
4776	CC1(C)C[C@H](Br)C[C@@](C)(CBr)C1
4777	[H]/N=C(/Br)c1ccc(-c2cc3cc(/C(Br)=N\\[H])ccc3o2)cc1
4778	O=C(O)[C@@H](Br)CCBr
4779	O[C@@H]1[C@@H](Br)C[C@@H](Br)[C@@H](O)[C@H]1O
4780	BrC1=NN=C(Br)C1=NNc1ccc2ccccc2c1
4781	[H]/N=C(\\Br)N1CCN(/C(Br)=N\\[H])CC1
4782	CC1(C)CC(Br)(CBr)CC(C)(C)N1
4783	BrC1=C(Br)CCCC1
4784	C[C@]1(Br)CNCCNC[C@](C)(Br)CNCCNC1
4785	S=C(Br)N=C(S)Br
4786	[H]/N=C(/Br)c1ccc2cc(/C(Br)=N\\[H])[nH]c2c1
4787	C[C@H](Br)[C@H](Br)CO
4788	CC(O)=Nc1ccc([C@H]2N=C(Br)N=C(Br)N2c2cccc(Cl)c2)cc1
4789	BrC[C@H]1[C@H]2C=C[C@H](C2)[C@H]1CBr
4790	CC(O)=Nc1ccc(NN=C2C(Br)=NN=C2Br)cc1
4791	CC[C@H]1N=C(Br)N=C(Br)N1c1ccc(Cl)cc1
4792	SC(Br)=N/N=C\\C=N\\N=C(S)Br
4793	N=C(Br)Nc1cccc([C@@H](Br)C(=O)O)c1
4794	N=C(Br)Nc1ccc2c(c1)Cc1ccc(NC(=N)Br)cc1C2
4795	CN[C@H]1[C@@H](O)[C@H](O[C@H]2[C@@H](Br)C[C@H](Br)[C@H](O)[C@@H]2O)OC[C@@]1(C)O
4796	BrCC[C@@H](Br)c1ccccc1
4797	O[C@H](CBr)CCBr
4798	BrCc1cccc(-c2cccc(CBr)c2)c1
4799	C[C@H]1C[C@@H](Br)CC[C@@H]1C[C@@H]1CC[C@H](Br)C[C@H]1C
4800	Clc1ccc([C@H](Br)[C@H](Br)c2ccc(Cl)cc2)cc1
4801	Clc1cc(CBr)cc(CBr)c1
4802	N#CC1=C(Br)SC(Br)=C(C#N)C1c1ccccc1F
4803	COc1ccccc1N1C(Br)=NC(Br)=NC1(C)C
4804	O[C@H]1C[C@@H](O)[C@@H](Br)C[C@H]1Br
4805	CC1(C)N=C(Br)N=C(Br)N1c1ccc(Cc2ccccc2)cc1
4806	CC(C)(C)OC(=O)N1CC[C@H](Br)[C@@H](Br)C1
4807	BrC[C@@H]1CCCC[C@@H]1Br
4808	CC(O)=NCc1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
4809	CC1(C)[C@@H]2C[C@H]1CC[C@@]2(Br)CBr
4810	N#CC1=C(Br)/C(=C\\c2ccccc2O)C(=O)N=C1Br
4811	BrC[C@@H]1CC[C@H]1CBr
4812	[H]/N=C(\\Br)SCS/C(Br)=N\\[H]
4813	C[C@]1(Br)CNCCNC[C@@](C)(Br)CNCCNC1
4814	O[C@H]1[C@H](O)[C@@H](Br)[C@H](O)[C@H](O)[C@@H]1Br
4815	O=C(O)[C@@H](Br)C[C@H]1C[C@H]1Br
4816	CC1(C)C[C@@H](Br)C[C@@](C)(CBr)C1
4817	BrCC[C@@]12C[C@@H]3C[C@@H](C[C@@](CBr)(C3)C1)C2
4818	O=C(CBr)OC(=O)CBr
4819	CC1(C)N=C(Br)N=C(Br)N1c1cccc(S(=O)(=O)F)c1
4820	[H]/N=C(\\Br)N(/C(Br)=N/[H])c1ccncc1
4821	CN1CCC(Br)(CBr)CC1
4822	BrCc1ccc(-c2ccc(CBr)cn2)nc1
4823	BrC1=NC2(CCCCC2)N(OCc2ccccc2)C(Br)=N1
4824	Fc1cc(F)cc(NN=C2C(Br)=NN=C2Br)c1
4825	Oc1cccc(NN=C2C(Br)=NN=C2Br)c1
4826	S=C(Br)SSC(=S)Br
4827	CC1(C)[C@H](Br)CC[C@@]1(C)Br
4828	CC(C)(C)[C@@H](Br)CBr
4829	O[C@H](CBr)[C@H](O)CBr
4830	[H]/N=C(\\Br)SS/C(Br)=N\\[H]
4831	C[C@@](Br)(CBr)c1ccccc1
4832	CO[C@@H]1O[C@@H]2CO[C@@H](c3ccccc3)O[C@@H]2[C@H](Br)[C@@H]1Br
4833	C=C[C@H](Br)CBr
4834	COc1ccc(NN=C2C(Br)=NN=C2Br)cc1F
4835	CC1(C)N=C(Br)N=C(Br)N1c1cccc([C@@H](O)c2ccccc2)c1
4836	Br[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1Br
4837	SC(Br)=Nc1cccc(N=C(S)Br)c1
4838	C[C@](Br)(c1ccc(Cl)cc1)[C@@H](Br)c1ccc(Cl)cc1
4839	Clc1ccc(N2C(Br)=NC(Br)=N[C@H]2c2ccccc2)cc1
4840	Cc1cc(C)c([C@@H](Br)[C@H](Br)c2c(C)cc(C)cc2C)c(C)c1
4841	CC1(C)O[C@@H]2[C@H](Br)CSC[C@H](Br)[C@H]2O1
4842	CC1=C(Br)C(=O)c2c(CO)c3n(c2C1=O)C[C@@H](Br)[C@@H]3O
4843	Cc1cc(CBr)c(C)cc1CBr
4844	[H]/N=C(/Br)SC[C@H](Br)CBr
4845	CC1(C)N=C(Br)N=C(Br)N1OCc1ccc(Br)cc1
4846	CC(C)(Br)C(=S)Br
4847	COC(=O)[C@H](Br)[C@H](Br)c1ccccc1
4848	BrCc1ccc(-c2ccc(CBr)cc2)cc1
4849	BrCC1(Br)CC1
4850	COc1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
4851	[H]/N=C(/Br)SCCCBr
4852	O=C1C(Br)=C(Br)C(=O)c2ccccc21
4853	C[C@H]1CC[C@]2(CC1)N=C(Br)N=C(Br)N2c1ccc(Cl)cc1
4854	C[C@]1(Br)CC[C@@]1(C)Br
4855	CC[C@H](Br)[C@@H](Br)CC
4856	CCOc1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
4857	FC1(F)C=C(Br)C(Br)=C(OCCCl)[C@@]1(F)Br
4858	O=C(O)[C@@H](Br)[C@@H](Br)c1ccccc1
4859	Oc1ccccc1[C@@H](Br)[C@H](Br)c1ccccc1O
4860	BrCc1cccc(CBr)n1
4861	C=C(CBr)C(=C)CBr
4862	CCc1ccccc1N1C(Br)=NC(Br)=NC1(C)C
4863	Cc1ccc([C@H](Br)[C@H](Br)c2ccc(C)cc2)cc1
4864	CC(O)(CBr)CBr
4865	Clc1ccc(CBr)c(CBr)c1
4866	N#C/C(Br)=C(/Br)C#N
4867	C[C@@](Br)(c1ccccc1)[C@](C)(Br)c1ccccc1
4868	N#CC1=C(Br)SC(Br)=C(C#N)C1c1ccncc1
4869	BrC[C@@H](Br)c1ccccc1
4870	COc1cccc(NN=C2C(Br)=NN=C2Br)c1
4871	Clc1cc(Cl)cc(NN=C2C(Br)=NN=C2Br)c1
4872	CC1(C)CC(=O)C(CC2=C(Br)CC(C)(C)CC2=O)=C(Br)C1
4873	CC(C)(C)[C@H](Br)[C@@H](Br)C(C)(C)C
4874	CC(/C=N/NC(=N)Br)=N\\NC(=N)Br
4875	C[C@](Br)(c1ccc(Cl)cc1)[C@](C)(Br)c1ccc(Cl)cc1
4876	C[C@@H](Br)[C@@H](Br)c1ccccc1
4877	[H]/N=C(/Br)c1ccc2nc(N3C(=O)C[C@H](Br)c4ccccc43)[nH]c2c1
4878	[H]/N=C(\\Br)CCBr
4879	O=C1N=C(O)/C(=C2/C=C(Br)C(=O)N=C2O)C=C1Br
4880	O=C(O)[C@@H](Br)CBr
4881	CC1(C)N=C(Br)N=C(Br)N1Cc1ccccc1
4882	Clc1ccc(N2C(Br)=NC(Br)=NC23CCCCC3)cc1
4883	BrC[C@@H]1CCC[C@@H](CBr)C1
4884	BrCc1ccc2cc(CBr)ccc2c1
4885	Cc1cc(C)cc(N2C(Br)=NC(Br)=NC2(C)C)c1
4886	CC(C)(Br)c1cccc(C(C)(C)Br)c1
4887	[H]/N=C(/Br)c1ccc(-c2cc3ccc(/C(Br)=N\\[H])cc3[nH]2)cc1
4888	O=C1C=C(Br)C(Br)=CC1=O
4889	CC(C)(CBr)CBr
4890	C[C@H](Br)[C@@H](C)Br
4891	COC(=O)c1ccc([C@H](Br)[C@H](Br)c2ccc(C(=O)OC)cc2)cc1
4892	Clc1ccc(CN2C(Br)=NC(Br)=N[C@H]2c2ccccc2)cc1Cl
4893	COc1ccc([C@@H](Br)CBr)cc1
4894	Brc1cccc(C#CC#Cc2cccc(Br)c2)c1
4895	C[C@H]1C[C@H](C[C@H]2C[C@H](C)[C@@H](Br)[C@@H](C)C2)C[C@H](C)[C@H]1Br
4896	Fc1ccc(C(CBr)CBr)cc1
4897	CC1(C)N=C(Br)N=C(Br)N1c1ccc(Cl)cc1
4898	OC[C@H](Br)CBr
4899	CC1(C)N=C(Br)N=C(Br)N1c1cccc(Cc2ccccc2)c1
4900	O/N=C(\\Br)C/C(Br)=N\\O
4901	Br[C@H]1CC[C@H]1Br
4902	O=C1C=C(Br)C=C(Br)C1=O
4903	O=S1(=O)N=C(Br)CC(Br)=N1
4904	CN(C)c1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
4905	[H]/N=C(/Br)N1CCC(CBr)CC1
4906	BrCC#Cc1ccccc1C#CCBr
4907	[H]/N=C(\\Br)c1cccc(-c2cccc(/C(Br)=N\\[H])n2)n1
4908	BrC1=NN=C(Br)C1=NNc1ccc2c(c1)OCCO2
4909	COC(CBr)CBr
4910	[H]/N=C(/Br)N(/N=C(/C)C=O)/C(Br)=N\\[H]
4911	C[C@@H](Br)CCBr
4912	C[C@H]1N=C(Br)N=C(Br)N1c1ccc(Cl)c(Cl)c1
4913	CC[C@@](Br)(CBr)c1ccccc1
4914	Br[C@H]1CC=CC[C@@H]1Br
4915	CCc1cccc(N2C(Br)=NC(Br)=NC2(C)C)c1
4916	Br[C@@H](c1ccccc1)[C@@H](Br)c1ccccc1
4917	BrCC(Br)(c1ccccc1)c1ccccc1
4918	Clc1ccc([C@H](Br)[C@@H](Br)c2ccc(Cl)cc2)cc1
4919	BrC1=NN=C(Br)C1=NNc1cccnc1
4920	BrCc1cccc(-c2cccc(CBr)n2)n1
4921	C/C(Br)=C(\\C#N)C(=S)Br
4922	Cc1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
4923	CCc1cccc(NN=C2C(Br)=NN=C2Br)c1
4924	COc1cc(C)cc2c1C(=O)C(Br)=C(c1c(C)cc3c(c1OC)C(=O)C(Br)=CC3=O)C2=O
4925	S=C(Br)C(=S)Br
4926	N=C(Br)NOC(=O)ONC(=N)Br
4927	Cc1cc(C)cc([C@H](Br)[C@H](Br)c2cc(C)cc(C)c2)c1
4928	O=C1C2=C(Br)CCC(Br)=C2C(=O)c2ccccc21
4929	CC1(C)N=C(Br)N=C(Br)N1c1ccc2c(Cl)cc(Cl)cc2c1
4930	BrC1=N[C@]2(Br)N=CN=C2C=N1
4931	BrCCc1ccccc1CBr
4932	O/N=C(\\Br)c1ccc(/C(Br)=N\\O)cc1
4933	CCC[C@@H]1N=C(Br)N=C(Br)N1c1ccc(Cl)cc1
4934	O=C1C(Br)=C(Br)C(=O)c2nsnc21
4935	BrC1=NN=C(Br)C1=NNc1ccc2c(c1)OCO2
4936	Br[C@H]1c2ccccc2C[C@H]1Br
4937	Br[C@@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1Br
4938	BrCC#CC#CCBr
4939	S=C(Br)N(/C(Br)=N/Nc1ccccc1)c1ccccc1
4940	CC1(C)N=C(Br)N=C(Br)N1OCc1ccc2ccccc2c1Br
4941	Br[C@H]1CO[C@@H]2[C@@H](Br)CO[C@H]12
4942	[H]/N=C(\\Br)SCCS/C(Br)=N\\[H]
4943	SC(Br)=N/N=C(\\Br)c1ccccn1
4944	CC(C)[C@H](Br)C(C)(C)CBr
4945	CC1(C)N=C(Br)N=C(Br)N1c1cccc(F)c1
4946	CC1(C)N=C(Br)N=C(Br)N1c1ccc(Br)cc1
4947	O=C1O[C@@H]([C@H](O)CO)C(Br)=C1Br
4948	Br[C@@H]1CC[C@@H](CC2CCCCC2)[C@H](Br)C1
4949	CC(C)[C@H](Br)CBr
4950	[H]/N=C(\\Br)O/C(Br)=N/[H]
4951	[H]/N=C(/Br)c1ccc2c(c1)sc1cc(/C(Br)=N\\[H])ccc12
4952	CC1(C)N=C(Br)N=C(Br)N1CCc1ccccc1
4953	Fc1cccc(NN=C2C(Br)=NN=C2Br)c1
4954	BrC[C@H]1[C@H]2CC[C@H](C2)[C@@H]1Br
4955	OC(=NN=C(S)Br)c1cccc(C(O)=NN=C(S)Br)c1
4956	C[C@@](Br)(CBr)Cc1ccccc1
4957	CC(C)(C)C(CBr)CBr
4958	C[C@@H](Br)[C@@H](Br)C(=O)O
4959	CC1(C)N=C(Br)N=C(Br)N1OCc1ccc2ccccc2c1
4960	Clc1ccc([C@H]2N=C(Br)N=C(Br)N2c2ccc(Cl)cc2)cc1
4961	N#CC/C(Br)=C(/C#N)C(Br)=C(C#N)C#N
4962	N=C(Br)N=C(O)NC(O)=NC(=N)Br
4963	N=C(Br)NN=C1C=CC(=NN=C(S)Br)C=C1
4964	Cc1cccc(C)c1N1C(Br)=NC(Br)=NC1(C)C
4965	BrC1=NN=C(Br)C1=NN[C@H]1CNCCO1
4966	[H]/N=C(/Br)N(C(=S)Br)c1ccccc1
4967	Br[C@H]1CC[C@@H](CC[C@H]2CC[C@@H](Br)CC2)CC1
4968	CC[C@@](C)(Br)CBr
4969	C[C@](Br)(C#N)[C@@](C)(Br)C#N
4970	C[C@@H](ON1C(Br)=NC(Br)=NC1(C)C)c1ccc(Cl)c(Cl)c1
4971	Fc1ccc(NN=C2C(Br)=NN=C2Br)c(F)c1F
4972	[H]/N=C(Br)/N=N/C(Br)=N/[H]
4973	O[C@H]1[C@H](O)[C@@H](O)[C@H](Br)C[C@H]1Br
4974	O=C(O)[C@@H](Br)CN=C(Br)NO
4975	Br[C@H]1CC[C@H](Br)C1
4976	C[C@H]1[C@@H](Br)CCC[C@H]1Br
4977	Fc1ccc(NN=C2C(Br)=NN=C2Br)cc1F
4978	CC(=O)c1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
4979	CS/C(Br)=C(C#N)\\C(C#N)=C(/Br)SC
4980	COC(=O)C(CBr)CBr
4981	CC1(C)N=C(Br)N=C(Br)N1c1cccc(-c2ccccc2)c1
4982	BrC[C@H](Br)C1CCCCC1
4983	BrC[C@H]1C[C@@H]2C[C@H]1C[C@@H]2CBr
4984	Br[C@@H]1CCCCC[C@H]1Br
4985	BrCC1(Br)CCCCC1
4986	Br[C@H]1COC[C@H]1Br
4987	Br[C@H](c1ccccc1)[C@H](Br)c1ccccc1
4988	Cc1ccc([C@@H](Br)CBr)cc1
4989	OC[C@H]1O[C@H](O)[C@@H](Br)[C@H](Br)[C@@H]1O
4990	CCOC(=O)C1=C(Br)NC(Br)=C2C(=O)Oc3ccccc3[C@H]12
4991	O[C@H]1O[C@H](CBr)[C@@H](O)[C@H](O)[C@@H]1Br
4992	CC1(C)C[C@H](Br)C[C@@H](Br)C1
4993	C[C@@H](Br)C(Br)(c1ccc(F)cc1)c1ccc(F)cc1
4994	N=C(Br)NC(=N)Nc1cccc(NC(=N)NC(=N)Br)c1
4995	BrC[C@H]1C[C@H]2C[C@H](CBr)[C@@H]1C2
4996	O=C1N=C(Br)C(=NO)C(Br)=N1
4997	O=S1(=O)N=C(Br)C=C(Br)N1CCc1ccccc1
4998	COc1ccc([C@H](Br)[C@H](Br)c2ccc(OC)cc2)cc1
4999	O/N=C(\\Br)c1cccc(/C(Br)=N/O)n1
5000	FC(F)(F)c1ccc(NN=C2C(Br)=NN=C2Br)cc1
5001	CC1(C)N=C(Br)N=C(Br)N1OCc1ccccc1
5002	C[C@@H](CBr)CCBr
5003	CC(=O)c1cccc(N2C(Br)=NC(Br)=NC2(C)C)c1
5004	S=C(Br)SC(=S)Br
5005	Clc1ccccc1NN=C1C(Br)=NN=C1Br
5006	CC1(C)N=C(Br)N=C(Br)N1c1cccc(O)c1
5007	N=C(Br)N/N=C1/C/C(=N\\NC(=N)Br)c2ccccc21
5008	BrCCCCCCBr
5009	COc1ccc(NN=C2C(Br)=NN=C2Br)cc1O
5010	CO[C@@H]1O[C@H](CBr)CC[C@H]1Br
5011	N=C(Br)Nc1ccc2c(c1)Cc1cc(NC(=N)Br)ccc1-2
5012	O=C(O)[C@H](Br)CCBr
5013	BrCc1ccccc1-c1ccccc1CBr
5014	BrCC1(CBr)CNC1
5015	CC1(C)N=C(Br)N=C(Br)N1OCc1ccc(Cl)cc1
5016	CC[C@]1(C)N=C(Br)N=C(Br)N1c1ccc(OC)cc1
5017	CC(C)(Br)CCBr
5018	CC1=CC[C@H](C(C)C)[C@@H](Br)[C@H]1Br
5019	N=C(Br)NCCBr
5020	BrC12CCC(Br)(CC1)CC2
5021	Br[C@H]1[C@H]2CC[C@H](C2)[C@H]1Br
5022	N#CC1=C(Br)SC(Br)=C(C#N)C1
5023	Cc1cc(C)c(CBr)c(C)c1CBr
5024	[H]/N=C1\\C=C(Br)C(=O)C(Br)=C1O
5025	BrC1=NNN=C(Br)C1
5026	Clc1cccc(N2C(Br)=NC(Br)=N[C@@H]2Cc2ccccc2)c1
5027	C[C@H](Br)C[C@@H](C)Br
5028	CC1(C)N=C(Br)N=C(Br)N1c1cccc(I)c1
5029	N=C(Br)NC(=N)NCCNC(=N)NC(=N)Br
5030	CC1(C)O[C@H](CBr)[C@H](CBr)O1
5031	COc1ccc(NN=C2C(Br)=NN=C2Br)cc1
5032	CC1(C)[C@@H](Br)CC[C@@]1(C)Br
5033	BrC1=NN=C(Br)C1=NNc1ccc(I)cc1
5034	C[C@H](Br)[C@H](C)Br
5035	CC1(C)N=C(Br)N=C(Br)N1c1cccc(C(=O)O)c1
5036	OC[C@@H](Br)[C@H](Br)CO
5037	[H]/N=C(/Br)c1cccc(-c2cc3ccc(/C(Br)=N\\[H])cc3o2)c1
5038	COc1cccc([C@H](Br)CBr)c1
5039	CC(CBr)(CBr)c1ccccn1
5040	N=C(Br)N[C@@H]1[C@H](O)[C@H](O)[C@H](O)[C@H](NC(=N)Br)[C@H]1O
5041	O[C@H]1CO[C@]2(CC[C@H]1O)[C@@H](Br)C[C@@H](Br)[C@@H](O)[C@@H]2O
5042	[H]/N=C(/Br)CBr
5043	Clc1cccc(NN=C2C(Br)=NN=C2Br)c1
5044	[H]/N=C(\\Br)c1ccc2sc(-c3ccc(/C(Br)=N\\[H])cc3)cc2c1
5045	Cc1c(C)c(CBr)c(C)c(C)c1CBr
5046	[H]/N=C(\\Br)c1ccc2oc3ccc(/C(Br)=N\\[H])cc3c2c1
5047	N#C/C(Br)=C(C#N)/N=C/C=N/C(C#N)=C(/Br)C#N
5048	N=C1C=C(Br)C(=O)C(Br)=C1
5049	Clc1ccc(N2CN=C(Br)N=C2Br)cc1
5050	CCc1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
5051	C[C@H](Br)CC[C@@H](C)Br
5052	[H]/N=C(\\Br)SCC#CCS/C(Br)=N\\[H]
5053	Clc1ccc(NN=C2C(Br)=NN=C2Br)cc1
5054	O[C@H]1[C@H](O)[C@H]2CO[C@@H]3O[C@@H](CO[C@H](O2)[C@H]1Br)[C@@H](O)[C@H](O)[C@H]3Br
5055	CCn1c2ccccc2c2cc(NN=C3C(Br)=NN=C3Br)ccc21
5056	O=C1N=C(Br)N=C(Br)/C1=N/Nc1ccccc1
5057	Cc1ccc(N=C(S)Br)cc1N=C(S)Br
5058	BrCC#CCBr
5059	BrC1=NN=C(Br)C1=NNc1cc[nH]n1
5060	Clc1c(Cl)c(CBr)c(Cl)c(CBr)c1Cl
5061	CC(C)(C)OC(O)=NC(CBr)CBr
5062	CC(C)(Br)c1ccc(C(C)(C)Br)cc1
5063	COCc1c2c(n3c1[C@@H](OC)[C@H](Br)C3)C(=O)C(C)=C(Br)C2=O
5064	[H]/N=C(/Br)C/C(Br)=N\\[H]
5065	N=C(Br)NC[C@@H](Br)C(=O)O
5066	C[C@@H](Br)c1ccc([C@@H](C)Br)cc1
5067	O=C1C(Br)=C(C2=C(Br)C(=O)c3ccccc3C2=O)C(=O)c2ccccc21
5068	BrC1=NN=C(Br)C1=NNc1ccccc1Br
5069	BrC[C@@H]1CCCC[C@H]1CBr
5070	CC(C)[C@@](C)(Br)C(=S)Br
5071	CC1(C)N=C(Br)N=C(Br)N1c1ccc(C(F)(F)F)cc1
5072	BrCC(Br)CBr
5073	BrCC1(CBr)COC1
5074	O[C@H]1[C@@H](O)[C@H](CBr)O[C@@H](O)[C@@H]1Br
5075	O=S1(=O)N=C(Br)C(=NO)C(Br)=N1
5076	Br[C@@H]1CCC[C@@H](Br)C1
5077	BrCc1cc(Br)cc(CBr)c1
5078	CC1(C)[C@@H](Br)C[C@@H]1CBr
5079	C[C@H](Br)[C@@H](Br)c1ccccc1
5080	CC(C)(C)c1ccc(/N=C(Br)/C(Br)=N\\c2ccc(C(C)(C)C)cc2)cc1
5081	O=S1(=O)N=C(Br)C(Br)=N1
5082	BrCC1(CBr)CCC1
5083	N=C(Br)N/N=C1\\CC[C@H]2[C@@H](CC[C@H]3C/C(=N/NC(=N)Br)CC[C@H]32)C1
5084	CC(=O)[C@]1(Br)C(I)=CC(I)=C(Br)[C@H]1I
5085	COc1c(C)ncc(CBr)c1CBr
5086	BrCC1(CBr)CCOCC1
5087	CC1=C(Br)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](Br)[C@@H]3O
5088	COc1cccc(N2C(Br)=NC(Br)=NC2(C)C)c1
5089	[H]/N=C(/Br)c1ccc2[nH]c3ccc(/C(Br)=N\\[H])cc3c2c1
5090	BrCC(CBr)c1ccccn1
5091	S=C(Br)C(C(=S)Br)c1ccccc1
5092	S=C1N=C(Br)C(c2nnc(-c3ccccc3)c(-c3ccccc3)n2)C(Br)=N1
5093	N=C(Br)N=c1nnc(=NC(=N)Br)[nH][nH]1
5094	CC(C)(C)OC(O)=NC[C@H](Br)CBr
5095	CC(C)([C@H]1CC[C@@H](Br)CC1)[C@H]1CC[C@@H](Br)CC1
5096	CCO[C@H]1CC[C@H](Br)[C@H](CBr)O1
5097	BrC1=NN=C(Br)C1=NNc1cccc(Br)c1
5098	CC[C@H](Br)C(O)(O)Br
5099	CC(C)C[C@H](Br)CBr
5100	N#CC1=C(Br)SC(Br)=C(C#N)C1c1ccc(F)cc1
5101	Br/C=C\\C=C\\Br
5102	Cc1ccc(/C(Br)=N/N=C(\\Br)c2ccc(C)cc2)cc1
5103	C[C@H](Br)[C@@H](Br)C(=O)O
5104	O[C@@H]1C=C[C@@H](O)[C@@H](Br)[C@H]1Br
5105	C[C@H](Br)[C@H]1CC[C@H]2[C@H]3CC=C4C[C@@H](Br)CC[C@]4(C)[C@H]3CC[C@@]12C
5106	BrC[C@H]1OCO[C@@H]2[C@H](CBr)OCO[C@@H]12
5107	CC(C)(Br)CCCBr
5108	BrCC[C@H](Br)c1ccccc1
5109	Br[C@H]1C[C@@H]2C[C@H]1C[C@@H]2Br
5110	CC1(C)N=C(Br)N=C(Br)N1c1ccccc1Cl
5111	CC1(C)N=C(Br)N=C(Br)N1c1cccc(C(=O)CCl)c1
5112	COc1ccc(C2C(C#N)=C(Br)SC(Br)=C2C#N)cc1
5113	Br[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@]14C[C@@H]5C[C@@H](C[C@@](Br)(C5)C1)C4)(C3)C2
5114	BrC12CC3(Br)C[C@H](C1)C[C@H](C2)C3
5115	O=c1nc(O)c(/C=C/Br)cn1[C@@H]1C[C@@H](Br)[C@@H](CBr)O1
5116	SC(Br)=NN=C(S)Br
5117	N=C(Br)NC(=N)c1cccc(C(=N)NC(=N)Br)c1
5118	Fc1ccc(N2CN=C(Br)N=C2Br)cc1
5119	CC1=C(Br)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](Br)C3
5120	O/N=C(Br)/C(Br)=N\\O
5121	CC(C)N=C(Br)N=C(Br)Nc1ccc(Cl)cc1
5122	C[C@H](Br)C/C(Br)=N\\O
5123	CO[C@H]1O[C@H](CBr)[C@@H](O)[C@H](Br)[C@@H]1O
5124	[H]/N=C(\\Br)c1ccc2c(c1)[nH]c1cc(/C(Br)=N\\[H])ccc12
5125	SC(Br)=NCCN=C(S)Br
5126	Br[C@@H]1CCCC[C@H]1Br
5127	Br[C@H]1CCC[C@@H]1Br
5128	N#CC1=C(Br)SC(Br)=C(C#N)C1c1ccccc1
5129	BrC[C@H]1c2ccccc2C[C@@H]1Br
5130	O=C(O)[C@@H](Br)/C=C\\CBr
5131	[H]/N=C(\\Br)c1ccc(-c2cc3ccc(/C(Br)=N\\[H])cc3s2)cc1
5132	BrC1=NN=C(Br)C1=NNc1ccc(Br)c2ccccc12
5133	C[C@@H](Br)[C@@](Br)(c1ccc(F)cc1)c1ccc(F)nc1
5134	CN1CC[C@@H](Br)[C@@H](CBr)C1
5135	N=C(Br)NCCCBr
5136	COc1cc(NN=C2C(Br)=NN=C2Br)cc(C(F)(F)F)c1
5137	CC1(C)N=C(Br)N=C(Br)N1OCc1cccc2cccnc12
5138	O=C1O[C@@H](CBr)C[C@H]1Br
5139	C/C(Br)=C\\C(=S)Br
5140	O[C@@H](CBr)[C@@H](O)CBr
5141	N=C(Br)NCCNC(=N)Br
5142	O[C@H]1[C@@H](O)[C@@H](O)[C@H](Br)[C@@H](O)[C@@H]1Br
5143	CC1(C)N=C(Br)N=C(Br)N1c1cccc(Br)c1
5144	COc1cc(C2C(C#N)=C(Br)SC(Br)=C2C#N)ccc1O
5145	O[C@@H]1C[C@H](Br)C[C@H](Br)C1
5146	CC1(C)N=C(Br)N=C(Br)N1OCc1cc(Cl)c(Cl)cc1Cl
5147	N#C[C@H](Br)[C@H](Br)C#N
5148	Oc1ccccc1[C@H](Br)[C@@H](Br)c1ccccc1O
5149	N=C(Br)N[C@H]1CC[C@@H]([C@H](Br)C(=O)O)CC1
5150	CC(C)(Br)[C@@H](Br)c1ccccc1
5151	CC1(C)C(=O)N=C(Br)N=C1Br
5152	O=C(/C(Br)=C/Br)c1ccc(Cl)cc1
5153	[H]/N=C(\\Br)c1ccc2nn(-c3ccc(/C(Br)=N\\[H])cc3)cc2c1
5154	BrC12CCC(Br)(c3ccccc31)c1ccccc12
5155	C[C@H]1N=C(Br)N=C(Br)N1c1cccc(Cl)c1
5156	Br[C@H]1CCC[C@H](Br)C1
5157	Cc1ccc([C@H](Br)[C@@H](Br)c2ccc(C)cc2)cc1
5158	SC(Br)=NCN=C(S)Br
5159	S=C(Br)N(CCBr)c1ccc2nccnc2c1Br
5160	[H]/N=C(\\Br)c1ccc2oc(-c3cccc(/C(Br)=N\\[H])c3)cc2c1
5161	BrCC1(CBr)CCCCC1
5162	S=C(Br)c1cccc(C(=S)Br)c1
5163	Oc1ccc2ccccc2c1NN=C1C(Br)=NN=C1Br
5164	CC(C)[C@@]1(C)N=C(Br)N=C(Br)N1c1ccc(Cl)cc1
5165	CO[C@H]1O[C@H](CBr)[C@@H](O)[C@@H](Br)[C@@H]1O
5166	Br[C@@H]1CO[C@H]2[C@H](Br)CO[C@@H]12
5167	Br[C@@H]1Cc2ccccc2[C@H]1Br
5168	Cc1ncc(CBr)c(CBr)c1Cl
5169	Br[C@H]1CC[C@H](C2([C@H]3CC[C@H](Br)CC3)CCCCC2)CC1
5170	Fc1cccc(F)c1NN=C1C(Br)=NN=C1Br
5171	Cc1cn([C@@H]2C[C@H](Br)[C@@H](CBr)O2)c(=O)nc1O
5172	O=C1N=C(Br)N=C(O)C1Br
5173	N=C(Br)Nc1ccc(-c2ccc(NC(=N)Br)cc2)cc1
5174	Cc1cc(C)cc([C@H](Br)[C@@H](Br)c2cc(C)cc(C)c2)c1
5175	CC1(C)N=C(Br)N=C(Br)N1c1cc(Cl)ccc1Cl
5176	BrCCC#CCCBr
5177	BrC1=NN=C(Br)C1=NNc1ncc[nH]1
5178	Clc1ccc(NN=C2C(Br)=NN=C2Br)cc1Cl
5179	Br[C@@H]1CC[C@H]1Br
5180	Clc1cccc(N2C(Br)=NC(Br)=N[C@H]2c2ccccc2)c1
5181	N=C(Br)NC[C@H](Br)C(=O)O
5182	BrC1=Nc2ccccc2N=C(Br)C1
5183	BrC1=NCN(c2ccccc2)C(Br)=N1
5184	C[C@]1(Br)CCC[C@@H](Br)C1
5185	O=C(O)[C@H](Br)C[C@H]1CC[C@H](Br)CC1
5186	BrCC(CBr)c1ccccc1
5187	S=C(Br)[C@H](Br)Cc1ccccc1
5188	CC1(C)C(Br)=N/C(=N/N=C2\\N=C(Br)C(C)(C)N2O)N1O
5189	CC1(C)O[C@H]2[C@H](Br)CSC[C@H](Br)[C@@H]2O1
5190	CC1(C)N=C(Br)N=C(Br)N1c1cccc2ccccc12
5191	O/N=C(\\Br)CC/C(Br)=N\\O
5192	CCC[C@@H](Br)CBr
5193	CSc1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
5194	C[C@H](CBr)/C(Br)=N\\O
5195	COC1C[C@H](Br)C[C@@H](Br)C1
5196	CC(C)[C@@H]1N=C(Br)N=C(Br)N1c1ccc(Cl)cc1
5197	Br[C@@H]1Nc2ncncc2N[C@@H]1Br
5198	Fc1ccc(NN=C2C(Br)=NN=C2Br)cc1
5199	CO[C@H]1OC[C@H](Br)[C@H](O)[C@H]1Br
5200	C[C@H](Br)P(=O)(O)[C@@H](Br)c1ccccc1
5201	C#C[C@@H](Br)CC[C@@H](C)Br
5202	O=C(O)[C@@H](Br)CC#CCBr
5203	Clc1ccccc1[C@H](Br)[C@@H](Br)c1ccccc1Cl
5204	BrC1=N[C@H](c2ccccc2)N(c2ccccc2)C(Br)=N1
5205	O=C1C(Br)=C(Br)C(=O)c2ncccc21
5206	BrC1=NC2(c3ccccc3)N=C(Br)NC2(c2ccccc2)N1
5207	CC1(C)N=C(Br)N=C(Br)N1Cc1ccc(Cl)cc1
5208	BrCc1cccc2c(CBr)cccc12
5209	BrCC1(Br)CCN(Cc2ccccc2)CC1
5210	[H]/N=C(\\Br)c1ccc2scc(-c3ccc(/C(Br)=N\\[H])cc3)c2c1
5211	OC1=NC2(Br)N=C(O)NC2(Br)N1
5212	N=C(Br)NC(=N)N1CCN(C(=N)NC(=N)Br)CC1
5213	Clc1ccc(N2C(Br)=NC(Br)=N[C@H]2c2ccccc2)cc1Cl
5214	CC1(C)N=C(Br)N=C(Br)N1c1ccc(-c2ccccc2)cc1
5215	C[C@@](Br)(CBr)C(=O)O
5216	BrC[C@@H](Br)Cc1c[nH]c2ccccc12
5217	C[C@@H]1CC(C)(C)[C@@H](CBr)[C@H]1Br
5218	Br[C@@]12C[C@H]3C[C@H]4[C@@H]1C[C@H]1C[C@@H]2[C@@H](C3)[C@]4(Br)C1
5219	Br[C@@H](c1cccc2ccccc12)[C@H](Br)c1cccc2ccccc12
5220	O=C(NN=C(S)Br)c1ccc(C(=O)NN=C(S)Br)cc1
5221	N#CC1=C(Br)Oc2c(ccc3c4c(ccc23)[C@@H](c2ccc(Cl)cc2)C(C#N)=C(Br)O4)[C@H]1c1ccc(Cl)cc1
5222	BrCC12CC3(CBr)C[C@H](C1)C[C@H](C2)C3
5223	BrCCCC1(Br)CCCCC1
5224	C[C@H](Br)[C@H](Br)c1ccccc1
5225	BrC12CCCCC1(Br)CCCC2
5226	N=C(Br)NNC(=N)Br
5227	S=C1C=C(Br)C(=S)C=C1Br
5228	BrC1=NN=C(Br)C1=NNc1cccc(I)c1
5229	CC1(C)N=C(Br)N=C(Br)N1c1cccc(Cl)c1
5230	[H]/N=C(/Br)SC[C@@H]1CN=C(Br)S1
5231	S=C(Br)Oc1ccc(OC(=S)Br)cc1
5232	Br[C@H]1CO[C@H]2[C@@H]1OC[C@H]2Br
5233	C[C@H]1N=C(Br)N=C(Br)N1c1ccc(Cl)cc1
5234	C=C(CBr)CBr
5235	CC(/C=N/N=C(S)Br)=N\\N=C(S)Br
5236	ON=C1C(Br)=NC(=S)N=C1Br
5237	CC(=O)O/N=C(Br)/C(Br)=N\\OC(C)=O
5238	[H]/N=C(/Br)c1ccc(-c2cc3ccc(/C(Br)=N\\[H])cc3o2)cc1
5239	CC1(C)[C@H](CBr)CC[C@]1(C)CBr
5240	CC(C)(Br)C(=O)C(C)(C)Br
5241	N#CC1=C(Br)SC(Br)=C(C#N)C1c1cccc(F)c1
5242	O=C(O)[C@@H]1[C@@H]2C[C@H](Br)[C@](Br)(C(=O)O)[C@H]21
5243	Br[C@@H]1CC[C@@H](Br)C1
5244	CCC(C)(CBr)CBr
5245	CC1(C)N=C(Br)N=C(Br)N1c1cccc(CO)c1
5246	CC1(C)N=C(Br)N=C(Br)N1c1cccc(C#N)c1
5247	BrCC1(Br)CCCC1
5248	O=C(O)c1ccc(NN=C2C(Br)=NN=C2Br)cc1
5249	CC[C@]1(C)N=C(Br)N=C(Br)N1c1c(C)cccc1C
5250	CC(C)(Br)CCC(C)(C)Br
5251	CC1(C)[C@H](Br)C(C)(C)[C@H]1Br
5252	Cc1cc(C)c(CBr)cc1CBr
5253	Br[C@H]1C[C@@H]2C[C@H](Br)C[C@@H]2C1
5254	BrC[C@H](Br)Cc1ccccc1
5255	N#CC1=C(Br)SC(Br)=C(C#N)C1c1ccc(Cl)cc1
5256	CC/C(Br)=C(/C#N)C(=S)Br
5257	Cc1ccc(NN=C2C(Br)=NN=C2Br)cc1
5258	[H]/N=C1/C=C(Br)/C(=N/[H])C=C1Br
5259	[H]/N=C(/Br)c1ccc(CBr)cc1
5260	CC1(C)N=C(Br)N=C(Br)N1c1ccccc1
5261	Oc1cc(Cl)c([C@H](Br)[C@H](Br)c2c(Cl)cc(O)cc2Cl)c(Cl)c1
5262	S=C(Br)[C@H](Br)c1ccccc1
5263	N=C(Br)Nc1cc(NC(=N)Br)cc(C(=O)O)c1
5264	CC(C)([C@H]1CC[C@H](Br)CC1)[C@H]1CC[C@H](Br)CC1
5265	CC(C)(C)c1ccc(/N=C(Br)/C(Br)=N/c2ccc(C(C)(C)C)cc2)cc1
5266	CC1(C)N=C(Br)N=C(Br)N1c1ccc(Cl)c(Cl)c1
5267	C[C@@H]1CC[C@@H](Br)C[C@H]1Br
5268	CC1(C)N=C(Br)N=C(Br)N1c1cc(Cl)c(Cl)cc1Cl
5269	C[C@]12CC[C@H](Br)C[C@@H]1CC[C@H]1[C@H]2CC[C@@]2(C)[C@H](Br)CC[C@H]12
5270	O=C1C(Br)=C(N2CC2)C(=O)C(Br)=C1N1CC1
5271	CC1(C)N=C(Br)N=C(Br)N1OCc1ccc(Cl)c(Cl)c1
5272	BrC1=NN=C(Br)C1=NN=c1cc[nH]cc1
5273	BrCc1c2ccccc2c(CBr)c2ccccc12
5274	COC1=C(Br)C(=O)C(OC)=C(Br)C1=O
5275	CS/C(Br)=N/N=C(S)Br
5276	S=C(Br)Nc1ccc(NC(=S)Br)cc1
5277	[H]/N=C(Br)\\N=C1/N=C(Br)c2ccccc21
5278	O[C@H]1[C@H](O)[C@H](O)[C@@H](Br)[C@H](O)[C@@H]1Br
5279	CC1(C)N=C(Br)N=C(Br)N1c1ccc(C#N)cc1
5280	Br[C@H]1CCCC[C@@H]1C[C@H]1CCCC[C@H]1Br
5281	CC(C)c1ccccc1NN=C1C(Br)=NN=C1Br
5282	Br[C@H]1CCC[C@H]2[C@@H]1CCC[C@H]2Br
5283	N=C(Br)NC(=N)Br
5284	O=C(CBr)OCCBr
5285	C/C(Br)=C(/C#N)C(=S)Br
5286	O=P(O)(CBr)CBr
5287	BrC[C@H]1CC[C@H](Br)CC1
5288	Fc1cccc([C@H](Br)CBr)c1
5289	CSc1ccc(NN=C2C(Br)=NN=C2Br)cc1
5290	Br[C@@H](C1CCCCC1)[C@@H](Br)C1CCCCC1
5291	Brc1cccc(-c2cccc(Br)c2)c1
5292	BrCC12CCC(CBr)(CC1)CC2
5293	FC(F)(F)c1ccc([C@@H](Br)CBr)cc1
5294	CNC(CBr)CBr
5295	COc1ccc(NN=C2C(Br)=NN=C2Br)cc1Cl
5296	Br[C@H]1CSC[C@H]1Br
5297	CC1(C)N=C(Br)N=C(Br)N1c1ccc(F)cc1
5298	BrCc1cccc2cc3cccc(CBr)c3nc12
5299	[H]/N=C(C#N)\\C(Br)=N/C(C#N)=C(\\Br)C#N
5300	BrCC1(Br)CCCCCC1
5301	BrC[C@@H]1CC[C@H](CBr)O1
5302	BrC1=NN=C(Br)C1=NNc1ccc(Br)cc1
5303	C[C@@H](Br)[C@@H](C)Br
5304	BrCc1ccc(CBr)s1
5305	CC(=N\\N=C(S)Br)/C(C)=N/N=C(S)Br
5306	S=C(Br)c1ccc(C(=S)Br)cc1
5307	BrC[C@H]1CCC[C@H](CBr)C1
5308	COC(=O)[C@H](Br)CBr
5309	BrC[C@H]1CC[C@@H]1CBr
5310	C[C@@H](Br)CC(C)(C)Br
5311	[H]/N=C(/Br)[C@H](Br)C(=O)OCC
5312	Br/C(=N\\N=C(/Br)c1ccccc1)c1ccccc1
5313	OC(=N[C@@H]1C=C[C@@H](Br)C[C@H]1Br)OCc1ccccc1
5314	BrC1=NC2=NCCN2C(Br)=N1
5315	Br[C@H]1CC[C@H](C[C@H]2CC[C@H](Br)CC2)CC1
5316	Br[C@H]1C[C@H]2C[C@@H]1C[C@@H]2Br
5317	C[C@H](Br)C[C@H](C)Br
5318	CC(C)(C)C1(C)O[C@@H](CBr)[C@H](CBr)O1
5319	N#CC1=C(Br)SC(Br)=C(C#N)C1c1ccco1
5320	BrC1=NN=C(Br)C1=NNc1cccc2ccccc12
5321	S=C(Br)c1cccc(C(=S)Br)n1
5322	CCC(Br)(CC)CBr
5323	C#Cc1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
5324	CO[C@H]1O[C@H]2CO[C@@H](c3ccccc3)O[C@@H]2[C@@H](Br)[C@@H]1Br
5325	N#CC1=C(Br)SC(Br)=C(C#N)C1c1ccccc1Cl
5326	N=C(Br)N[C@H]1[C@H](O)[C@@H](NC(=N)Br)[C@H](O)[C@@H](O)[C@@H]1O
5327	[H]/N=C(\\Br)c1ccc2[nH]c(-c3ccc(/C(Br)=N\\[H])cc3)cc2c1
5328	BrC12C[C@H]3[C@@H]4CC5(Br)C[C@H]([C@@H](C1)[C@@H]3C5)[C@@H]4C2
5329	Br[C@H](c1ccco1)[C@H](Br)c1ccco1
5330	S=C(Br)SCCSC(=S)Br
5331	BrC[C@@]1(Br)CN2CCC1CC2
5332	CC[C@H](Br)[C@H](Br)CC
5333	N#CC1=C(Br)S[C@@H](c2ccccc2)[C@@](C#N)(C(=S)Br)[C@@H]1c1ccccc1
5334	Br[C@H]1CCCC[C@@H]1SS[C@H]1CCCC[C@H]1Br
5335	BrC1=NN=C(Br)C1=NNc1ccccc1
5336	N=C(Br)N=C(S)Br
5337	N#CC1=C(Br)SC(Br)=C(C#N)C1c1cccs1
5338	CCCN1C(Br)=NC(Br)=NC1(C)C
5339	BrC12[C@H]3[C@H]4[C@@H]1[C@H]1[C@@H]2[C@@H]3C41Br
5340	Br[C@H](C1CCCCC1)[C@H](Br)C1CCCCC1
5341	Br/C=C/Br
5342	COc1ccc(OC)c(N2C(Br)=NC(Br)=NC2(C)C)c1
5343	C[C@H]1C[C@H](C[C@@H]2CC[C@@H](Br)[C@@H](C)C2)CC[C@@H]1Br
5344	N#C/C(Br)=C(C#N)\\N=C\\Br
5345	O[C@@H]1[C@@H](Br)C[C@H](Br)[C@H](O)[C@@H]1O
5346	Br[C@H]1[C@H](c2ccccc2)[C@@H](Br)[C@@H]1c1ccccc1
5347	[H]/N=C(\\Br)S/C(Br)=N\\[H]
5348	SC(Br)=NN=C1Nc2ccccc2C1=NN=C(S)Br
5349	CC[C@@H]1C[C@@H](CC)[C@@H](Br)[C@H](C)[C@H]1Br
5350	BrC1(C2(Br)CCCCC2)CCCCC1
5351	CC(C)(C)OC(=O)[C@@H](Br)CBr
5352	CC[C@@]1(C)N=C(Br)N=C(Br)N1c1ccc(Cl)cc1
5353	[H]/N=C(\\Br)SCCBr
5354	COc1cc(OC)cc(N2C(Br)=NC(Br)=NC2(C)C)c1
5355	OC[C@@H]1O[C@@H](O)[C@@H](Br)[C@@H](Br)[C@@H]1O
5356	Br[C@@H]1CCCC[C@@H]1C[C@H]1CC[C@H](Br)CC1
5357	BrCc1cccc2cc3cccc(CBr)c3cc12
5358	Br[C@H]1CC[C@H](Br)CC1
5359	BrCc1ccccc1CBr
5360	Br[C@H]1CC[C@H]2CCCC[C@@H]2[C@H]1Br
5361	N#Cc1ccc([C@H](Br)[C@H](Br)c2ccc(C#N)cc2)cc1
5362	Br[C@H]1C[C@H]2C[C@@H]1C[C@H]2Br
5363	CC1(C)N=C(Br)N=C(Br)N1c1ccc(S(C)(=O)=O)cc1
5364	CC1(C)N=C(Br)N=C(Br)N1c1ccc2ccccc2c1
5365	BrCC1(CBr)CCCC1
5366	OC[C@@H](Br)CBr
5367	COc1ccc(CN2C(Br)=NC(Br)=NC2(C)C)cc1
5368	C[C@](Br)(C(=S)Br)c1ccccc1
5369	C/C(Br)=N\\Cc1cccc(CBr)c1
5370	N=C(Br)Nc1ccc(CBr)cc1
5371	BrCc1ccc2c(c1)CN1CN2Cc2cc(CBr)ccc21
5372	C[C@](Br)(CBr)C(=O)O
5373	O=C(O)[C@H](Br)[C@H](Br)C(=O)O
5374	BrC1=NN=C(Br)C1=NNc1nc2ccccc2s1
5375	CC(C)/C(Br)=C(/C#N)C(=S)Br
5376	CC[C@@H]1C[C@H](C)[C@@H](Br)[C@@H](CC)[C@H]1Br
5377	BrC[C@@H]1CCC[C@@H]1Br
5378	Cc1cc(CBr)c(O)c(CBr)c1
5379	BrC1=NN=C(Br)C1=NNCC1CCNCC1
5380	Brc1cccc(C#Cc2ccccc2Br)c1
5381	OCC[C@H](Br)CBr
5382	CCOc1cccc(N2C(Br)=NC(Br)=NC2(C)C)c1
5383	OC[C@@H]1O[C@@H](O[C@@H]2[C@@H](Br)C[C@@H](Br)[C@@H](O)[C@@H]2O)[C@@H](O)[C@@H](O)[C@@H]1O
5384	BrC[C@@H](Br)C12C[C@H]3C[C@@H](C1)C[C@@H](C2)C3
5385	Cc1cccc(N2C(Br)=NC(Br)=NC2(C)C)c1
5386	O[C@H]1CC[C@]2(OC[C@@H]1O)[C@H](Br)C[C@H](Br)[C@@H](O)[C@H]2O
5387	O[C@H]1O[C@@H](CBr)[C@H](O)[C@H](O)[C@@H]1Br
5388	Br[C@H]1CC[C@H](C[C@H]2CC[C@@H](Br)CC2)CC1
5389	C[C@H](ON1C(Br)=NC(Br)=NC1(C)C)c1c(Cl)cccc1Cl
5390	Cc1ccc(/N=C(Br)/C(Br)=N/c2ccc(C)cc2)cc1
5391	CC1(C)N=C(Br)N=C(Br)N1OCc1cccc2ccccc12
5392	CC1(C)O[C@@H](CBr)[C@H](CBr)O1
5393	Br[C@H]1CCCCCC[C@@H]1Br
5394	CC(C)(C)c1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
5395	BrC[C@@H]1CCCC[C@H]1Br
5396	CCC1(CC)C(Br)=NC(=O)N=C1Br
5397	O=C(O)[C@H]1NC(Br)=N[C@@H]1[C@H](O)CBr
5398	N#CC1=C(Br)SC(Br)=C(C#N)C1c1ccc(Br)cc1
5399	O[C@H]1CO[C@]2(C[C@H]1O)[C@@H](Br)C[C@H](Br)[C@H](O)[C@H]2O
5400	Cc1nc(CBr)c(=O)[nH]c1CBr
5401	BrC[C@@H](Br)Cc1ccccc1
5402	Br[C@@H](c1ccccn1)[C@@H](Br)c1ccccn1
5403	Clc1c(Cl)c(CBr)c(Cl)c(Cl)c1CBr
5404	CC[C@@H](Br)CCBr
5405	Cc1ccccc1[C@H](Br)[C@H](Br)c1ccccc1C
5406	Br/C(=N\\N=C(\\Br)c1ccccn1)c1ccccn1
5407	O=S(=O)(O)c1ccc(NN=C2C(Br)=NN=C2Br)cc1
5408	COC[C@H](Br)CBr
5409	Br[C@H]1CCCC[C@H](Br)CCCC1
5410	Cl/N=C(Br)/N=N/C(Br)=N\\Cl
5411	[H]/N=C(/Br)c1ccc(-c2nc3cc(/C(Br)=N\\[H])ccc3[nH]2)cc1
5412	BrC12CNCCNCC(Br)(CNCCNC1)CNCCNC2
5413	Oc1ccc([C@H](Br)[C@@H](Br)c2ccc(O)cc2)cc1
5414	O[C@H]1O[C@@H](CBr)[C@H](O)[C@H](O)[C@H]1Br
5415	O=C([C@H](Br)CCBr)N1CCCCC1
5416	Cc1ccc(CBr)cc1CBr
5417	CCON1C(Br)=NC(Br)=NC1(C)C
5418	CC(O)=N[C@H]1[C@H](Br)C=C(C(=O)O)C[C@H]1Br
5419	O=C(CBr)CBr
5420	CCC[C@]1(C)N=C(Br)N=C(Br)N1c1ccc(Cl)cc1
5421	CC1(C)N=C(Br)N=C(Br)N1c1ccc(C#Cc2ccccc2)cc1
5422	O=C1CC(Br)=NC(Br)=N1
5423	Cc1ccccc1[C@@H](Br)[C@H](Br)c1ccccc1C
5424	C[C@@H]1CCC[C@H](Br)[C@@H]1Br
5425	COC(=O)[C@H](Br)[C@@H](Br)c1ccccc1
5426	FC(F)(F)c1ccc([C@H](Br)[C@@H](Br)c2ccc(C(F)(F)F)cc2)cc1
5427	BrC[C@H](Br)c1ccccc1
5428	BrC[C@H]1CC[C@H](CBr)CC1
5429	C[C@@H]1C[C@@H]2C[C@@H](C)[C@](C)(Br)[C@@H]3CC[C@H]4[C@@H]([C@H]1CC[C@@]4(C)Br)[C@@H]23
5430	Br[C@@H]1C[C@H]1Br
5431	N=C(Br)NN=C1C=CC(=NNC(=N)Br)C=C1
5432	Br[C@@H]1CCc2ccccc2[C@H]1Br
5433	CC1(C)N=C(Br)N=C(Br)N1O
5434	O=C(CBr)CCBr
5435	O/N=C(\\Br)CBr
5436	BrC[C@H]1CC[C@@H](CBr)CC1
5437	Br[C@H]1CC[C@H]([C@H]2CC[C@@H](Br)CC2)CC1
5438	FC(F)(F)c1ccc([C@H](Br)[C@H](Br)c2ccc(C(F)(F)F)cc2)cc1
5439	CON1C(Br)=NC(Br)=NC1(C)C
5440	BrCC1=CC[C@@H](CBr)CC1
5441	CC(O)=NC1=C(Br)C(=O)C(N=C(C)O)=C(Br)C1=O
5442	S=C(Br)Nc1ccc(-c2ccc(NC(=S)Br)cc2)cc1
5443	C[C@@H]1OC(=O)C(Br)=C1Br
5444	O/N=C(Br)/C(=N\\O)C(=N\\O)/C(Br)=N\\O
5445	Cc1ccccc1NN=C1C(Br)=NN=C1Br
5446	OC1=NC[C@H](O)[C@@H](Br)[C@@H]1Br
5447	O=C(CBr)N=C(O)CBr
5448	CCOC(=O)C1=C(Br)N=C(Br)CC1
5449	BrC[C@@]12C[C@@H]3C[C@@H](C[C@@H](C3)C1)[C@@H]2Br
5450	CC1(C)N=C(Br)N=C(Br)N1c1ccc(C(=O)O)cc1
5451	C[C@H](Br)C(C)(C)Br
5452	C[C@H](CBr)[C@H](C)CBr
5453	CC1(C)N=C(Br)N=C(Br)N1c1ccccc1Br
5454	BrC1=NN=C(Br)C1=NNc1nccs1
5455	O/N=C(/Br)CCBr
5456	CC1(C)N=C(Br)N=C(Br)N1c1ccc(O)cc1
5457	CC1(C)N=C(Br)N=C(Br)N1c1cccc(C(O)=Nc2cccnc2)c1
5458	O=C1C=C(Br)C(=O)C=C1Br
5459	FC(CBr)CBr
5460	FC(F)(CBr)CBr
5461	BrC1=N[C@H]2C=C[C@@H]1[C@@H]1C=C[C@H]2C(Br)=N1
5462	Fc1c(F)c(F)c(NN=C2C(Br)=NN=C2Br)c(F)c1F
5463	Cc1ncc(CBr)c(CBr)c1O
5464	CCOC(=O)c1cccc(N2C(Br)=NC(Br)=NC2(C)C)c1
5465	CC1(C)N=C(Br)N=C(Br)N1c1cccc(C(F)(F)F)c1
5466	N=C(Br)NC(Br)=NCCc1ccccc1
5467	CC1(C)N=C(Br)N=C(Br)N1c1cc(Cl)cc(Cl)c1
5468	O=S(=O)(O)c1ccc(NN=C2C(Br)=NN=C2Br)c2ccccc12
5469	CCOC(=O)c1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
5470	CC1(C)N=C(Br)N=C(Br)N1c1ccc(Cl)cc1Cl
5471	OC(CBr)=NCCBr
5472	CC(C)(C)c1cccc(N2C(Br)=NC(Br)=NC2(C)C)c1
5473	CC(C)/C(Br)=C/C(=S)Br
5474	C[C@H](Br)O[C@H](C)Br
5475	CC(C)(Br)[C@H]1CC[C@@](C)(Br)CC1
5476	C[C@@H](Br)Cc1cccc(C(C)(C)Br)c1
5477	Br[C@H]1CC2(C[C@H](Br)C2)C1
5478	CC1(C)N=C(Br)N=C(Br)N1OCc1c2ccccc2cc2ccccc12
5479	O=S1(=O)N=C(Br)C=C(Br)N1Cc1ccccc1
5480	Clc1ccc([C@@H](Br)[C@H](Br)c2ccc(Cl)cc2)cc1
5481	C[C@H](ON1C(Br)=NC(Br)=NC1(C)C)c1ccc(Cl)cc1Cl
5482	C[C@@H]1CC[C@H](Br)[C@H](Br)C1
5483	CC1(C)N=C(Br)N=C(Br)N1c1ccc2cc(Cl)ccc2c1
5484	C#C[C@@H](Br)CC[C@H](C)Br
5485	C[C@H](Br)c1ccc(-c2ccc([C@@H](C)Br)cc2)cc1
5486	BrCc1ccc(CBr)o1
5487	[H]/N=C(/Br)c1ccc(-c2ccc(/C(Br)=N\\[H])cc2)cc1
5488	O=C1C(Br)=C(Br)C(=O)C(Br)=C1Br
5489	COC(=O)c1ccc(N2C(Br)=NC(Br)=NC2(C)C)cc1
5490	CC(=N\\NC(=N)Br)/C(C)=N/NC(=N)Br
5491	CC1(C)N=C(Br)N=C(Br)N1c1ccccc1I
5492	BrC1(OOC2(Br)CCCCC2)CCCCC1
5493	O/N=C(\\Br)[C@H](Br)c1ccccc1
5494	BrC[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1CBr
5495	Oc1ccc(NN=C2C(Br)=NN=C2Br)cc1
5496	Fc1ccccc1C[C@@H](Br)CBr
5497	[H]/N=C(/Br)SCCNC(=N)Br
5498	C[C@H](Br)C(O)=N[C@H]1CO[C@H](O)[C@@H](Br)[C@@H]1O
5499	CO[C@H]1O[C@@H](CBr)[C@@H](O)[C@H](O)[C@H]1Br
5500	COC(=O)c1cc(CBr)cc(CBr)c1
5501	OCC[C@H]1O[C@H](O[C@@H]2[C@@H](O)[C@H](O)[C@@H](CO)C[C@@H]2CO)[C@@H](O)[C@@H](O)[C@@H]1O
5502	OC[C@H]1[C@H](O)[C@H](CO)[C@H](O)[C@@H](CO)[C@H]1O
5503	C[C@@H](CO)N([C@@H](C)CO)[C@H](C)CO
5504	OC[C@@H]1O[C@H](O[C@H]2[C@@H](CO)C[C@H](CO)[C@H](O)[C@H]2O)[C@H](O)[C@@H](CO)[C@@H]1O
5505	OC[C@@H]1O[C@@H](O[C@H]2[C@@H](CO)C[C@H](CO)[C@@H](O)[C@H]2O)[C@H](CO)[C@@H](O)[C@@H]1O
5506	N=C(CO)N=c1[nH]c(=NC(=N)CO)[nH]c(=NC(=N)CO)[nH]1
5507	OC[C@H]1CCC[C@@H](CO)CCC[C@@H](CO)CCC1
5508	OC[C@@H]1C[C@H](CO)[C@@H](O)[C@H](O)[C@H]1O[C@@H]1O[C@@H](CO)[C@H](O)[C@@H](O)[C@H]1CO
5509	O=S(=O)(O)[C@@H]1NC(CO)=NC(CO)=C1CO
5510	O=S1(=O)N=C(CO)C(CO)=C(CO)N1
5511	C[C@H](CO)N([C@H](C)CO)[C@H](C)CO
5512	CC(CCO)(CCO)CCO
5513	O=C1OC[C@@H](CO)C(=O)OC[C@@H](CO)C(=O)OC[C@@H]1CO
5514	OCCc1cc(CCO)cc(CCO)c1
5515	OCC[C@H]1C[C@H](CCO)C[C@@H](CCO)C1
5516	O=C1O[C@@H](CCO)[C@H](CO)[C@H]1CO
5517	OC[C@H]1C[C@@H](CO)C[C@@H](CO)C1
5518	O=P(CCO)(CCO)CCO
5519	OCCC(CO)CCO
5520	CC(C)(CO)c1cc(C(C)(C)CO)c(O)c(C(C)(C)CO)c1
5521	OC[C@H]1[C@H](O)[C@@H](CO)[C@H](O)[C@@H](CO)[C@H]1O
5522	OC[C@@H]1O[C@@H](O[C@H]2[C@@H](CO)C[C@H](CO)[C@H](O)[C@H]2O)[C@@H](CO)[C@H](O)[C@@H]1O
5523	OC[C@@H]1C[C@@H](CO)[C@H](O[C@H]2O[C@H](CO)[C@@H](O)[C@@H](CO)[C@@H]2O)[C@H](O)[C@H]1O
5524	OC/C=N\\N=C1C=CC(=NN=C(S)CO)C=C1
5525	OCCC(CCO)CCO
5526	OCC[C@H]1O[C@@H](O[C@H]2[C@@H](CO)C[C@H](CO)[C@@H](O)[C@H]2O)[C@H](O)[C@H](O)[C@@H]1O
5527	C=CCO.CO
5528	OCC[C@@H]1O[C@H](O[C@H]2[C@@H](CO)C[C@H](CO)[C@@H](O)[C@H]2O)[C@H](O)[C@H](O)[C@H]1O
5529	OCCC[C@@H](CO)CCO
5530	OCC[C@H]1O[C@@H](CCO)O[C@@H](CCO)O1
5531	[H]/N=C(\\CO)C(CO)/C(CO)=N/[H]
5532	OC[C@@H]1C[C@H](CO)[C@H](O[C@@H]2O[C@H](CO)[C@@H](O)[C@H](O)[C@@H]2CO)[C@@H](O)[C@H]1O
5533	OCC12CN3CC(CO)(C1)CC(CO)(C3)C2
5534	OC[C@H]1CCC[C@H](CO)CCC[C@@H](CO)CCC1
5535	OC[C@H]1[C@H](O)[C@@H](CO)[C@H](O)[C@@H](CO)[C@@H]1O
5536	OC[C@@H]1C[C@@H](CO)[C@@H](O[C@@H]2O[C@H](CO)[C@@H](O)[C@H](O)[C@H]2CO)[C@H](O)[C@@H]1O
5537	COC(=O)[C@]12C[C@@]1(Br)C(Br)=C[C@@H]1CC(C)(C)C[C@@H]12
5538	CN1CCc2cc(Br)cc(Br)c21
5539	CC1(C)CCC[C@]2(C)[C@@H]3CC=C(Br)CC(=O)[C@]3(Br)CC[C@H]12
5540	Brc1c(Br)n(-c2ccccc2)c2ccccc12
5541	Cc1cc2c(cc1Br)[C@@H]1c3ccccc3[C@H]2c2cc(Br)ccc21
5542	O=C1c2cc(Br)ccc2-c2ccc(Br)c3cccc1c23
5543	CC(C)(C)Sc1cc(O)c(Br)cc1Br
5544	Brc1cc(Br)c(N2CCCCC2)o1
5545	C/C(Br)=C(\\C)C#C/C(C)=C(\\C)Br
5546	CC(C)(C)[C@H]1CC=C(Br)[C@@H](CBr)C1
5547	CC(C)(C)n1cc(Br)c(Br)c1
5548	OC[C@H]1C[C@H](Br)O[C@H]1Br
5549	Br[C@H]1[C@H]2C=C[C@@H]1[C@H](Br)C2
5550	CC1(C)CCC[C@@]2(C)[C@@H]1CC[C@@H](Br)[C@@]2(O)Br
5551	Brc1cc2sc3cc(Br)sc3c2s1
5552	Clc1ccc(Br)c(Cl)c1Br
5553	COc1cc(C#CBr)c(OC)cc1C#CBr
5554	Cc1ccc2c(c1)C(Br)=C(Br)c1ccccc1C2
5555	COc1c(Br)cc(Cl)c(C)c1Br
5556	Brc1cc2ccccc2c(-c2nc(Br)cc3ccccc23)n1
5557	ClC1=C(Br)CCc2ccc(-c3ccc4c(c3)C(Cl)=C(Br)CC4)cc21
5558	Clc1sc(Br)c(Cl)c1Br
5559	C/C(Br)=C/c1ccc(Br)cc1
5560	Br[C@H]1[C@H]2CC[C@H](CC2)[C@H]1Br
5561	C[C@H]1[C@H](C)N(Br)c2ccccc2N1Br
5562	C[C@H](Br)C#C[C@@H](C)Br
5563	Brc1ccc2cc3nc(Br)ccc3cc2n1
5564	C/C=c1\\c2c(/c(=C/C)c3c1[C@H](C)C[C@H](Br)[C@@H]3C)[C@@H](C)C[C@@H](Br)[C@H]2C
5565	BrC1=CS/C(=C2\\SC=C(Br)S2)S1
5566	ClC1=C(Br)C(c2ccccc2)C(Br)=C(Cl)N1
5567	O=C1c2cc(Cl)ccc2C(=O)c2c1ccc(Br)c2-c1c(Br)ccc2c1C(=O)c1ccc(Cl)cc1C2=O
5568	CO[C@@H]1[C@@H](Br)[C@H]2C[C@H]2[C@H]1Br
5569	BrC[C@@H]1CCC[C@H](Br)C1
5570	Br[C@H]1CO[C@H](Br)O1
5571	Brc1ccccc1-c1cc2c(cc1Br)sc1ccccc12
5572	CC1(C)CC2CC(C)(C)Oc3c(Br)c(O)c(Br)c(c32)O1
5573	Cc1cc(-c2[nH]c(Br)cc2C)[nH]c1Br
5574	CC1(C)CCC(C)(C)c2cc(Br)c(Br)cc21
5575	CC1(C)CCC=C(Br)[C@H]1Br
5576	Cc1cc(-c2ccccc2)cc(C)c2c(Br)c(Br)cc1-2
5577	Brc1cscc1Br
5578	O/C=C(\\Br)c1[nH]nc(Cl)c1Br
5579	BrC1=C2CCc3cc4c5cc3CCC2=C(Br)/C=C(CC5)\\C(=C/1)CC4
5580	N#Cc1c2cccccc-2c(Br)c1Br
5581	Cc1cc(C)c(-c2c(C)cc(C)cc2Br)c(Br)c1
5582	BrNNBr
5583	CC[C@@]12C3=CC=CC1=C(Br)C(Br)=C2C=C3
5584	Brc1ccccc1-c1cc2ccc3ccccc3c2cc1Br
5585	C[C@@]12C[C@H]3[C@H]4C[C@@H]1[C@H](C[C@@]4(C)NN3Br)N(Br)N2
5586	Brc1ccc2ccc3c(Br)ccc4ccc1c2c43
5587	C[C@H]1Cc2c(n(Br)c3ccccc23)-c2ncc(Br)c(=O)n21
5588	C=C1COC(=O)c2c(Br)cc3ccccc3c2-c2c(c(Br)cc3ccccc23)C(=O)OC1
5589	C=C1[C@@H](Br)[C@H](CBr)C[C@H]1O
5590	CN1C=C[C@H](c2c(Br)n(C)c3ccccc23)C(Br)=C1
5591	Brc1ccc(C#Cc2ccc3c4c(ccc(C#Cc5ccc(Br)cc5)c24)CC3)cc1
5592	BrC/C=C1\\C=CC=C1Br
5593	Brc1cc(Br)c(N2CCOCC2)o1
5594	C/C(Br)=C(\\C)C#CC#C/C(C)=C(\\C)Br
5595	N=C1N[C@H]2C[C@@H](N1)[C@@H]1N(Br)[C@](O)(O2)[C@H]2[C@H]3C[C@H](NC(=N)N3)O[C@@]1(O)N2Br
5596	Cc1ccc(-c2nc3c(Br)c4cccccc4n3c2Br)cc1
5597	BrN1CCOCCOCCN(Br)CC1
5598	Clc1cc(Br)cc(Br)c1Cl
5599	OCc1cc(Br)cc(Br)c1O
5600	BrC1=CC=c2c3c(c4cccc5cccc2c54)C=CC(Br)=C1C3
5601	Clc1cc(Br)c(Cl)c(Cl)c1Br
5602	C=C(Br)[C@@H]1CC[C@@]2(C)CCC=C(Br)[C@H]2C1
5603	CN(Br)/C(Br)=C/O
5604	Brc1c[nH]c2ccc(-c3[nH]c4ccccc4c3Br)cc12
5605	Br[C@@H]1CC=CC[C@H]1Br
5606	Brc1ccc2c3c(ccc2c1)OCOc1ccc2cc(Br)ccc2c1-3
5607	C[C@H]1CC[C@H](Br)[C@@H](Br)C2=CC(C)(C)C[C@@H]21
5608	Br/N=c1\\c2ccccc2c2nc3/c(=N/Br)c4ccccc4c3nc12
5609	Cc1ccc2oc(Br)c(Br)c2c1
5610	Brc1sc(Br)c2c1ncc1sccc12
5611	C[C@@H]1CC[C@@H]2C(C)(C)[C@H](O)CC[C@]2(C)[C@@]12Cc1c(O)cc(Br)c(Br)c1O2
5612	FC1=C(Br)C(F)=C1Br
5613	BrC1=C[C@@H]2C=C(Br)[C@@H]3C=C[C@H]1[C@H]23
5614	Brc1cc(Br)c2c(c1)CCC2
5615	C[C@]12Cc3cc(Br)oc3C[C@H]1CC[C@@H]1[C@@H]3CC[C@H](OBr)[C@]3(C)CC[C@H]12
5616	Cc1c(Br)n(Br)c2c(C)cc(Br)cc12
5617	C=C1C[C@](C)(Br)[C@H](Br)C[C@H]1O
5618	Brc1ccc2c(c1)C1(CC2)CCc2ccc(Br)cc21
5619	CC1(C)C[C@H]2[C@@H](C=C(Br)[C@@]3(Br)C[C@@]23C)[C@@H]1O
5620	Brc1c2cccccc-2cc1-c1cc2cccccc-2c1Br
5621	Cc1cc(C)c(-c2c(C)cc(C)c(Br)c2C)c(C)c1Br
5622	COc1cccc2c1CC[C@H]1[C@](C)(Br)CCC[C@]21Br
5623	CN1C=C(Br)CC(Br)=C1
5624	Cn1c(Cl)c(Br)c(Br)c1N1CCCCC1
5625	Br[C@@H]1/C=C\\C=C/[C@H](Br)C/C=C\\1
5626	Br[C@H]1[C@@H]2C=C[C@@H](CC2)[C@H]1Br
5627	CC1(C)[C@@H](Br)[C@@]2(C#N)C[C@]1(C#N)[C@@H](Br)C2(C)C
5628	O=C1C(Cl)=C2C(=O)C(Cl)=C1N(Br)CCCCCCCCCCCCN2Br
5629	C/C(Br)=C\\[C@H]1[C@H](Br)C1(C)C
5630	C[C@H]1CN=C(S)Nc2ccccc2N(Br)CCN(Br)c2ccccc2NC(S)=N1
5631	CN1C=C[C@H](c2c(Br)[nH]c3ccccc23)C(Br)=C1
5632	Brc1ccc2ccoc2c1N1CCN(Br)CC1
5633	C/C=c1\\c2c(/c(=C\\C)c3c1CC[C@@H](Br)C3)CC[C@@H](Br)C2
5634	Oc1cc(Br)sc1Br
5635	CC1=C[C@@H]2OC=C(Br)[C@](C)(Br)[C@@H]2[C@@H](CO)C1
5636	BrC1=S=C(Br)c2cc3ccccc3cc21
5637	Cc1cc(O)cc(Br)c1-c1c(C)cc(O)cc1Br
5638	CC(=O)N1[C@H](Br)Cc2c[nH]c3cccc(c23)[C@H]1/C=C(/C)Br
5639	CC1(C)C=C(Br)C(Cl)=C(Br)C1
5640	C[C@]12CCC=C(Br)[C@]1(Br)C2
5641	BrC1=CC=CC2=CC=CC(Br)=C1C2
5642	Br[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@H]1[C@H]4C[C@@H]5C[C@H](C4)C[C@@]1(Br)C5)(C3)C2
5643	CC1=C(Br)C2=CC=C3C=CC=C4C=CC(=C1Br)[C@@]2(C)[C@]43C
5644	COc1ccc2c(c1)C(Br)=C(Br)c1ccccc1C2
5645	Oc1cc(Br)c(Br)cc1O
5646	Oc1cc2c(Br)c(O)ccc2cc1Br
5647	Brc1cc(Br)c(N2CCNCC2)o1
5648	Brc1ccc(N2CCN(Br)CC2)c2occc12
5649	COc1c2oc(Br)c(Cl)c2cc2c(Cl)c(Br)oc12
5650	Cc1c(Br)n(Br)c2c(Cl)ccc(Cl)c12
5651	CC1=C/C(Br)=C\\C(C)=C/C(Br)=C1
5652	O=C(Br)O[C@H]1CCC[C@@H]1Br
5653	Cc1nc2ccccc2c(Br)c1Br
5654	CC1(C)C(Br)=C(Cl)N(c2ccccc2)C(Cl)=C1Br
5655	Oc1c(Br)cc2ccccc2c1Br
5656	COc1cc2c(C)c(c1)CCc1c(C)c(c(Br)c(C)c1Br)CC2
5657	BrC1CN(Br)N(Br)C1
5658	BrC#CC1(C#Cc2ccccc2C#CC2(C#CBr)OCCCO2)OCCCO1
5659	CN1C(=O)N2[C@H](Br)O[C@H](Br)CO[C@H]2c2nc3c4ccccc4n(C)c3nc21
5660	OC(/C=C/Br)=C/Br
5661	BrC[C@H]1[C@@H]2CC[C@@H](C2)[C@H]1Br
5662	Brc1ccnc(-c2nccc(Br)n2)n1
5663	COc1c(O)c(Br)c(Br)c(Br)c1O
5664	ClC1=C(Br)C(c2cccc(Cl)c2)C(Br)=C(Cl)N1
5665	COC(=O)[C@H]1CCC[C@](C)(Br)[C@@H]1Br
5666	Brc1csc(-c2cc(Br)cs2)c1
5667	CC1=C(Br)[C@@H](CBr)CC1
5668	Brc1cccc2c1Oc1c(Br)cccc1O2
5669	Clc1ccc2nc(Br)c(Br)nc2c1
5670	CC1=C/C(=C2/C=C(C)C(=O)C(Br)=C2)C=C(Br)C1=O
5671	CC(O)=Nc1c(Br)c2cccccc-2c1Br
5672	Br[C@H]1C=C[C@@H](Br)N1
5673	C[C@H](Br)C#C/C=C/[C@H](C)Br
5674	C#CC1C(Br)=CN(c2c(C)cccc2C)C=C1Br
5675	ClC1=C(Br)CC(Br)=C(Cl)C1=CN1CCOCC1
5676	CC(=O)O[C@H]1[C@H]2CC(C)(C)CC2=C(Br)[C@@]2(Br)C[C@@]12C
5677	CC1=CC2=C(Br)C3(CC3)[C@](C)(O)C(=O)C2=C1Br
5678	Cc1cc(Cl)c2[nH]c(Br)c(Br)c2c1
5679	Brc1ccc2c(ccc3cc(-c4ccccc4)c(Br)cc32)c1
5680	Br[C@@]12[C@@H]3C[C@H]4[C@H]5[C@@H]3[C@@H]3C[C@H]5[C@]5([C@H]6C=C[C@H](C=C6)[C@]315)[C@]42Br
5681	Br[C@H]1CCC[C@@H](Br)[C@H]2COC[C@H]12
5682	N#Cc1cc(Br)[nH]c1Br
5683	C[C@]12C=C(Br)[C@](O)(Br)C[C@@H]1CCCC2
5684	Brc1oc2ccccc2c1Br
5685	SC1=NCCCN=C(S)Nc2ccccc2N(Br)CCN(Br)c2ccccc2N1
5686	BrN1C=C([C@@H]2CCCCCN2Br)CCCC1
5687	O/C=C(/Br)c1[nH]nc(Cl)c1Br
5688	BrN1CCC[C@H]([C@@H]2CCCCN2Br)C1
5689	Brc1[nH]c(Br)c2c1CCCC2
5690	C[C@@H]1C[C@@H](Br)CC[C@H]1Br
5691	Cc1ccc2c(c1)[C@H](Br)c1ccccc1[C@@H]2Br
5692	Brc1cc2c(cc1Br)CCC2
5693	O=C1c2c(O)cc(O)c(Br)c2C(=O)c2c(O)cc(O)c(Br)c21
5694	CCc1c(O)c(Br)cc(Br)c1O
5695	Br/C=C\\c1cc2cccccc-2c1Br
5696	Brc1c2c(c(Br)c3c1-c1cccc4cccc-3c14)-c1cccc3cccc-2c13
5697	Clc1c(Br)cc(Br)c2c1CCCC2
5698	O=C(Cl)c1c(Br)cccc1Br
5699	Cc1c2ccc(O)c(Br)c2c(C)c2ccc(O)c(Br)c12
5700	CC1=C2C=C(Br)S[C@@]2(C)[C@]2(C)SC(Br)=CC2=C1C
5701	Brc1cc2c(s1)/C(=C1/CCc3cc(Br)sc31)CC2
5702	O=C1c2cc(Br)sc2-c2sc(Br)cc21
5703	CC(O)=Nc1cc(O)c(Br)cc1Br
5704	BrC=C=CBr
5705	Cc1c(Br)n(Br)c2ccc(Cl)cc12
5706	CC1=C(Br)[C@]2(C)[C@H]([C@@H](C)CC[C@H]2OBr)[C@@H]2OC(C)(C)O[C@H]12
5707	O=C1C(Br)=C(Cl)NC2=C(Br)CCCN12
5708	O=C(Br)/C=C\\Br
5709	Cc1c(Br)ccc(O)c1Br
5710	Cc1cc(Br)c(Br)o1
5711	CC1(C)O[C@@H]2[C@H](Br)O[C@@H](Br)[C@@H]2O1
5712	CC1(C)[C@@H](Br)CC[C@]1(C)Br
5713	C#CC1C(Br)=CN(c2cccc(C)c2)C=C1Br
5714	Cc1c(Br)c[nH]c1Br
5715	CN(C)c1nc(Cl)c(Br)cc1Br
5716	Brc1ccccc1-c1cc2sc3ccccc3c2cc1Br
5717	Br/C=C/c1cccc2c1-c1c(Br)cccc1-2
5718	CC(C)c1cc(Br)c(Cl)c(Br)c1
5719	CC(=O)Oc1c(Br)c(Br)cc2c1C(=O)c1ccccc1C2=O
5720	CCc1cccc2c(Br)c(Br)oc12
5721	Br[C@]12[C@@H]3C=C[C@@H](O3)[C@@]1(Br)[C@@H]1C=C[C@H]2O1
5722	Brc1ccc(-n2nnc(Br)c2Br)cc1
5723	O=C(O)[C@H]1C[C@]2(O)c3ccccc3N(Br)[C@@H]2N1Br
5724	CC1=CC[C@H]([C@H](C)Br)[C@@H]1Br
5725	BrN1C=C([C@@H]2CCCCCN2Br)CCC1
5726	Cc1c(Br)csc1Br
5727	C=C1C[C@]23C[C@@]1(O)CC[C@H]2C1=CCC[C@@](C)(Br)[C@H]1[C@H]3Br
5728	CCN1c2cccc(Br)c2Sc2cccc(Br)c21
5729	CSc1ccc(Br)cc1Br
5730	Oc1c(Br)ccnc1-c1nccc(Br)c1O
5731	BrN=C1NN(Br)C2(CCCCC2)S1
5732	Brc1c[nH]c2ccc3c(ccc4[nH]cc(Br)c43)c12
5733	Oc1c(Br)cc(Br)cc1C1CCCCC1
5734	C[C@@H]1CCC[C@]2(C)[C@H](Br)C(Br)=CC[C@@H]12
5735	COc1c(Br)c(Br)c(Cl)n1C
5736	C=Cc1c(Br)[nH]c(Br)c1C
5737	Brc1nc2ccccc2nc1Br
5738	Brc1cc(C#Cc2ccccc2)cc(Br)n1
5739	BrNc1ccc(Br)cc1
5740	CC1(C)CC2=C(Br)[C@]3(Br)C[C@]3(C)[C@H](O)[C@]2(O)C1
5741	Brc1ccc2c(c1)Nc1ccc(Br)cc1S2
5742	Cn1c(=O)n2n(c1=O)C1(Br)CC2(Br)C1
5743	C[C@H]1CC[C@H](Br)[C@@H]1Br
5744	Clc1[nH]c(Br)cc1Br
5745	BrC1=C(Br)[C@@H]2O[C@H]1C1=C2[C@H]2C=C[C@@H]1CC2
5746	Cc1c2ccc(O)c(Br)c2cc2ccc(O)c(Br)c12
5747	Fc1cc2c(c3ccccc13)[C@H](Br)c1ccccc1[C@@H]2Br
5748	O[C@@H](Br)[C@H](O)Br
5749	C[C@H]1C=C(Br)C(Br)=C[C@H]2CC(C)(C)C[C@@H]21
5750	O/C(Br)=C/C=C\\Br
5751	CC(C)(C)/C(C#CC#C/C(=C/Br)C(C)(C)C)=C/Br
5752	Br[C@H]1CC[C@@H](Br)C1
5753	Clc1c(Br)n(Br)c2ccccc12
5754	Cc1ccc(-c2ccc(Br)cc2)cc1Br
5755	O[C@@H](Br)[C@H]1CS[C@H](Br)O1
5756	Brc1cccc2c1-c1c(Br)cccc1/C=C\\C/C=C\\2
5757	Br/C1=C/NCCC/N=C\\C(Br)=C/NCCC\\N=C/1
5758	CCc1ccc2oc(Br)c(Br)c2c1
5759	Cc1ccc(C)c2c1[C@H](Br)c1ccccc1[C@H]2Br
5760	Brc1ccc2c(c1)oc1ccc(Br)cc12
5761	CCc1cc(Br)c(C)c(Br)c1
5762	BrN=C1CNCC(NBr)=N1
5763	C[C@@H]1C[C@@H](O)[C@@H](CBr)[C@@H]1Br
5764	C[C@H]1CC[C@@]2(C)C(Br)=CCC[C@H]2[C@@]1(C)CBr
5765	C#CC1C(Br)=CN(c2ncccn2)C=C1Br
5766	CC1(C)CCC[C@@]2(C)[C@H]1CC=C(Br)[C@@]2(C)Br
5767	Brc1cc(Br)c(N2CCCCC2)s1
5768	Cc1sc(Br)cc1Br
5769	Br[C@H]1[C@H](Br)C12c1ccccc1-c1ccccc12
5770	Cl/C1=C(\\Br)C/C(Br)=C(/Cl)CCC1
5771	Brc1sc(Br)c(Br)c1Br
5772	CN1CCCc2cc(Br)cc(Br)c21
5773	C=C(Br)[C@@H]1C/C=C(/C)CC/C=C(/Br)CC1
5774	CC(C)(C)c1ccc(Br)c(Br)c1
5775	Br[C@@H]1[C@H](Br)C[C@@H]2[C@@H]3OO[C@@H](O3)[C@@H]21
5776	Br[C@H]1C[C@@H]1Br
5777	BrC12CCCCC1(Br)CCCC2
5778	OCc1cnc(Br)c(O)c1Br
5779	BrN1C=C([C@H]2c3ccccc3CCN2Br)CCCC1
5780	BrC[C@H]1CCC[C@@H]1Br
5781	Cl[C@]1(Br)[C@H]2CC=CC[C@H]2[C@](Cl)(Br)[C@@H]2CC=CC[C@H]21
5782	CC1=C(C)C[C@@H](Br)[C@@H](Br)C1
5783	Clc1ccc2[nH]c(Br)c(Br)c2c1
5784	CC1(C)OCc2c(Br)cnc(Br)c2O1
5785	C[C@H]1CC[C@H](Br)[C@@H]1CBr
5786	Clc1cc2nc(Br)c(Br)nc2cc1Cl
5787	BrC[C@H]1CCc2cccc(Br)c21
5788	CC1(C)C(Br)=C(Cl)NC(Cl)=C1Br
5789	CC1(C)CC[C@H](O)[C@]2(C)[C@@H](Br)C(Br)=CC[C@H]12
5790	Brc1cnc2c(Br)sc3cc(-c4ccccc4)nc1-n-3-2
5791	O=C1c2cc(O)c(Br)c(O)c2C(=O)c2cc(O)c(Br)c(O)c21
5792	C[C@H]1C(=O)O[C@H]2/C=C(/Br)CC/C=C(/Br)CC[C@H]21
5793	Br[C@H]1CCC[C@H](Br)CCC1
5794	COc1c(C)c(O)c(Br)c(Br)c1O
5795	ClC1=C(Br)CC(Br)=CN1
5796	Brc1cc(Br)c(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)s1
5797	C#CC1C(Br)=CN(CC)C=C1Br
5798	C[C@@]1(CBr)CC[C@]2(O)CC[C@@]1(C)[C@@]2(C)Br
5799	Brc1[nH]c(Br)c(Br)c1Br
5800	N#CC1=C(c2ccc(Cl)cc2)[C@@H](Br)S/C1=C/Br
5801	Brc1cnc2ncc(Br)cc2c1
5802	CN(Br)c1ccccc1Br
5803	Brc1cccc2c1Oc1cccc(Br)c1O2
5804	C/C(Br)=C/C=C(\\C)Br
5805	Brc1nnc2ccccc2c1Br
5806	BrO[C@@H]1Cc2ccccc2N(Br)C1
5807	Clc1sc(Cl)c(Br)c1Br
5808	CC(=O)O[C@H]1CC[C@H]2C[C@@]2(Br)[C@@H]1Br
5809	COC(=O)C1=C(C)C[C@H]2[C@@H]1C=C(Br)[C@@]1(Br)C[C@]21C
5810	Cc1cc(Br)c(S(=O)(=O)C(C)(C)C)c(Br)c1
5811	Cc1cc(N(C)C)c(Br)c(C)c1Br
5812	BrC1=C(Br)[C@@H]2C=C[C@H]1c1cc3ccccc3cc12
5813	CC(C)(C)N1CN(Br)CN(Br)C1
5814	BrC1=Cc2ccccc2N(Br)c2ccccc21
5815	CCn1c(Cl)c(Br)c2cccc(Br)c21
5816	Brc1cscc1-c1ccsc1Br
5817	Cc1ccc2c(ccc3c(Br)c(C)c(Br)n32)c1
5818	Brc1ccc2nc3ccccc3c(Br)c2c1
5819	BrC1=C2c3cc4c(cc3CCN2[C@@H]2O[C@H]1N1CCc3cc5c(cc3C1=C2Br)OCO5)OCO4
5820	Br[C@@H]1CCC[C@H]1[C@H]1CCC[C@H]1Br
5821	Cc1cc(-c2cc(C)sc2Br)c(Br)s1
5822	CC[C@]12CCCn3c(Br)c(Br)c(c31)-c1ccccc1N=C(O)CC2
5823	Cc1cc2c(cc1Br)[C@H]1c3ccccc3[C@@H]2c2ccc(Br)cc21
5824	Brc1ccn(-n2cccc2Br)c1
5825	CN1[C@@H](Br)C=C[C@H]1Br
5826	BrC1=CC[C@H](Br)CC1
5827	BrN1CCN(Br)[C@H](c2ccccc2)c2ccccc2C1
5828	CC(=O)O[C@H]1[C@H](Br)[C@]2(Br)C[C@]2(C)[C@@H]2CC(C)(C)C[C@@H]12
5829	CCOC(=O)N1C[C@H](Br)CC[C@H]1Br
5830	C=C1[C@@H]2CC=C(Br)[C@@](O)(Br)[C@]2(C)CC[C@H]1C
5831	Cc1[nH]c2c(c1Br)C(Cl)=C(Br)CC2
5832	O/C=C1\\C(Br)=CC(Br)=C1C1C=CC=CC=C1
5833	Cc1cc(C)c2cc(Br)c(Br)c-2c(C)c1
5834	Cc1c(Br)n(Br)c2c(Cl)cc(Cl)cc12
5835	Br/C=C\\c1cccc(Br)c1
5836	Brc1sc(Br)c2c1Nc1ccccc1N2
5837	Brc1cnc2c(Br)sc3cccc1-n-3-2
5838	Cc1cccc2oc(Br)c(Br)c12
5839	BrNc1cc2ccccc2nc1Br
5840	CN1C[C@@H](Br)[C@H](OBr)[C@@H]2c3ccccc3CC[C@H]21
5841	Clc1cc(N2CCN(Br)CC2)ccc1Br
5842	Cc1cc(C(C)(C)C)cc(C)c2c(Br)c(Br)cc1-2
5843	BrC1=C(Br)/C=C\\C=C/C=C1
5844	C=C(Br)[C@@H]1C[C@H](O)C(C)=C1Br
5845	Br/C1=C/Nc2ccccc2N=C/C(Br)=C\\Nc2ccccc2N=C1
5846	COc1c(Br)cc(Br)c(O)c1C
5847	CC(C)(Br)/C=C/Br
5848	CC1=C(Br)C(=O)N2C(=C(Br)CC[C@H]2C)N1
5849	Oc1nc2c(ccc3c(O)c(Br)c(O)nc32)c(O)c1Br
5850	Brc1cc(Br)c2ccc3cccc4ccc1n4-n32
5851	Fc1ccc2c(Br)c3ccccc3c(Br)c2c1
5852	Cc1cc(-c2cc(C)c(Br)s2)sc1Br
5853	COC(C#CBr)(C#CBr)c1ccc(C(C)(C)C)cc1
5854	CC1(C)C2C3C(C)(C)C4(O)C(=O)C3(Br)C4(Cl)C3(Cl)C(=O)C1(O)C23Br
5855	Brc1cc(Br)cc([C@@H]2O/C=C\\c3occc3O/C=C/c3occc3O2)c1
5856	C[C@@]12CCC(=O)C[C@@]1(/C=C/Br)CC[C@H]1[C@H]2CC[C@@]2(C)[C@H](Br)CC[C@H]12
5857	Brc1ccc2c(c1)CC[C@H]1CCc3cc(Br)ccc3[C@H]21
5858	Brc1c[nH]c2ccc3[nH]cc(Br)c3c12
5859	C[C@@H]1CCC[C@@](C)(Br)[C@H]1Br
5860	O=C1OCC[C@H]1n1c(Br)ccc1Br
5861	Oc1cc(Br)c(Br)cc1Br
5862	COc1cc2c(cc1Br)C(Cl)=C(Br)C(C)(C)O2
5863	Brc1cc2cccc3cccc(cc1Br)c32
5864	Cn1ncc(Br)c1NBr
5865	C[C@]1(O)C[C@@]23CC[C@@H]4[C@](C)(Br)CCC[C@@]4(Br)[C@@H]2CC[C@@H]1C3
5866	C[C@H]1CC[C@H]([C@@H](C)Br)[C@H]1Br
5867	C[C@@H]1CN(Br)CCN1Br
5868	C[C@]12CCC[C@H](Br)[C@H]1N(Br)c1ccccc12
5869	Brc1c2cccccc2n2c(Br)c(-c3ccccc3)nc12
5870	CC[C@@]1(Br)CC=C(Br)CC1
5871	O/C=C(/Br)NBr
5872	Br/C=C/[C@H]1C=CC=C1Br
5873	Brc1cc(-c2cc(Br)on2)no1
5874	Brc1c2c(c(Br)c3ccccc13)-c1cccc3cccc-2c13
5875	CC1(C)C=C[C@H](O)[C@]2(C)[C@@H](Br)C(Br)=CC[C@H]12
5876	C/C(Br)=C\\CBr
5877	CC(C)(C)S(=O)(=O)c1c(Br)cccc1Br
5878	Brc1ccc(-c2ccc(Br)s2)[nH]1
5879	CC1(C)CCC[C@@]2(C)[C@H]1CC[C@]1(C)[C@@H](Br)C(Br)=CC[C@H]21
5880	CC(C)(Br)C#C/C=C/C#CC(C)(C)Br
5881	Brc1ccc2c(ccc3nc(Br)ccc32)n1
5882	CCn1c(Br)ccc1Br
5883	C[C@H]1CC[C@@H]2C(C)(C)[C@@H](O)[C@H](O)C[C@@]2(C)[C@@]12Cc1c(O)cc(Br)c(Br)c1O2
5884	Sc1c(Br)cccc1Br
5885	Brc1c2ccccc2c(-c2c3ccccc3c(Br)c3ccccc23)c2ccccc12
5886	CC1=CC(=O)[C@@]23CCC[C@@]12[C@@H](Br)C[C@]3(C)Br
5887	Brc1ccsc1Br
5888	Brc1cnc2c(Br)sc3cc(-c4ccccc4)cc1-n-3-2
5889	Br[C@H]1[C@H]2CC3=C(C[C@H]12)C[C@H]1[C@@H](Br)[C@@H]1C3
5890	BrC1(C#CC2(Br)CC2)CC1
5891	C[C@]1(Br)CCCC[C@]1(C)CBr
5892	Brc1ccnc(Br)c1
5893	Oc1c(Cl)c2c(O)c(Cl)c1N(Br)CCCCCCCCCCCCN2Br
5894	O=C(c1ccccc1Br)N1CCC[C@H]1Br
5895	Br/C=C\\c1ccc(Br)s1
5896	Brc1c(Br)c2ccccc2c2ccccc12
5897	Cc1cc2ccccn2c2c(Br)cc(Br)c1-2
5898	O=C(Br)/C=C/Br
5899	Fc1ccccc1C1C(Br)=CNC=C1Br
5900	Br[C@H]1[C@H]2CC[C@H](c3ccccc32)[C@@H]1Br
5901	Br[C@H]1CC/C=C\\CC/C=C\\CC[C@H]1Br
5902	Br[C@@H]1C(c2ccccc2)[C@H]1Br
5903	C[C@@H]1C=C(Br)[C@@H](Br)[C@H](O)[C@H]2CC(C)(C)C[C@@H]12
5904	BrC1=C/C=C2/C=C\\C(=C1Br)CCc1ccc(cc1)CC2
5905	C[C@@]1([C@H]2CC[C@]3(C)[C@@H](CC[C@]3(C)O)[C@H]2Br)C=CC(=O)C=C1Br
5906	Br[C@H]1C[C@H](Br)[C@@H]2CCC[C@@H]12
5907	O=c1c(O)c(Br)oc(CCl)c1Br
5908	CC1=C(Br)C(C)(C)[C@@H](Br)CC1
5909	C/C=C1\\CN(Br)[C@@H]2C[C@H]1[C@H](C(=O)OC)[C@]13CC(=O)O[C@]21N(Br)c1ccccc13
5910	Cc1cc2cc(Br)c1CCc1c(C)cc(cc1Br)CC2
5911	CC(=O)SC1CN(Br)N(Br)C1
5912	CC1(C)CCC[C@@](C)([C@@H]2[C@@H]3C[C@@H]4C[C@@]2(Br)C[C@]4(C)O3)[C@@H]1Br
5913	Cc1cc(C)c(Br)c(-c2cc(C)cc(C)c2Br)c1
5914	CC1(C)CCC[C@@]2(C)[C@H]1[C@@H](O)C=C(Br)[C@@]2(O)Br
5915	Brc1cc2cc3cc(Br)sc3cc2s1
5916	COC(=O)[C@@]1(C)CC[C@H]2[C@@](Br)(CC[C@@H]3[C@](C)(Br)CCC[C@]32C)C1
5917	Brc1ccc2[nH]c3c(c2c1)CCN(Br)[C@H]3[C@H]1CCCN1Br
5918	CC1=C(Br)C(C)(C)CC[C@@H]1Br
5919	Cc1ccc(Br)c(C)c1Br
5920	C/C=c1/c2c(/c(=C\\C)c3c1[C@H](C)C[C@H](Br)[C@H]3C)[C@@H](C)[C@H](Br)C[C@@H]2C
5921	CC(=O)Oc1c(Br)c(Br)c(Br)c(Br)c1Br
5922	CN1C=C(Br)[C@H]2C[C@@H]1C(Br)=CN2C
5923	C/C(Br)=C/c1ccc(Br)o1
5924	Oc1ccc2c(Br)cc(Br)nc2n1
5925	C[C@@]12CCC(=O)C=C1CC[C@@H]1[C@@H]3CC[C@H](C(=O)Br)[C@]3(Br)C[C@H](O)[C@H]12
5926	SC1=NCCN=C(S)Nc2ccccc2N(Br)CCN(Br)c2ccccc2N1
5927	Brc1c2c(cc3c1CC1(C3)Cc3cc4c(c(Br)c3C1)CCC4)CCC2
5928	Cc1c2cc(Br)c(c1C)CCc1c(Br)cc(c(C)c1C)CC2
5929	CC(C)(C)c1ccc2c(Br)c3ccccc3c(Br)c2c1
5930	CC(C)(C)S(=O)(=O)c1cc(Br)sc1Br
5931	BrC1=Cc2ccccc2C=C(Br)O1
5932	O=C1c2ccccc2-c2c(Br)ccc(Br)c21
5933	BrN1CCOCCN(Br)c2ccccc2NCCOCCNc2ccccc21
5934	Br[C@]12CCCC[C@@]1(Br)C2
5935	Cc1cc2c(cc1C)[C@H](Br)c1ccccc1[C@@H]2Br
5936	Brc1ccc2nc(Br)cn2c1
5937	BrC1=CC=CC=C(C2=CC=CC=C(Br)C2)C1
5938	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@@H](Br)[C@@H]3C)[C@@H](C)[C@@H](Br)C[C@@H]2C
5939	Brc1nc2c(Br)nn(-c3ccccc3)c2o1
5940	Brc1ccc2c(c1)[nH]c1cc(Br)ccc12
5941	COc1cc(Br)c2c(c1C)OC(=O)c1c(C)c(Cl)c(O)c(Br)c1O2
5942	COc1ccc2c(c1Br)Oc1ccc(O)c(Br)c1O2
5943	CC(C)/C(Br)=C/Br
5944	BrC1=C(Br)[C@H]2c3ccccc3[C@@H]1c1ccccc12
5945	O[C@H]1CC[C@@H]2[C@H](OBr)[C@@H](Br)[C@H]12
5946	Oc1c(Br)cc(C(F)(C(F)(F)F)C(F)(F)F)cc1Br
5947	Cc1cc(N(C)C)c(Br)cc1Br
5948	Br[C@H]1[C@H]2CC=CC[C@H]2[C@@H](Br)[C@@H]2CC=CC[C@H]12
5949	BrC1C2C3CC4C2C(Br)C2C5CC(C12)C1C3C4C51
5950	Br[C@@H]1OC2(CCCCC2)O[C@@H]1[C@H]1OC2(CCCCC2)O[C@H]1Br
5951	CS[C@@]1(Br)C[C@H]1Br
5952	CC1(C)C=C(c2ccc(Br)s2)CC(C)(C)N1Br
5953	Cc1c(Br)c2sccn2c1Br
5954	Br/C=C\\C1=CC2=CC=CC=C3C=C(Br)[C@@H]1C[C@H]32
5955	Br[C@]12CC=CC[C@@]1(Br)C2
5956	CC1(C)CC2(CC(C)(C)c3cc(Br)ccc32)c2ccc(Br)cc21
5957	ClC1=C(Br)CCc2cc3c(cc21)-c1cc2c(cc1CC3)CCC(Br)=C2Cl
5958	CN1C(Cl)=C(Br)C(C)(C)C(Br)=C1Cl
5959	C[C@H](Br)[C@H]1O[C@H](Br)[C@H]2OC(C)(C)O[C@@H]12
5960	Br[C@H]1C[C@@H](c2ccccc2)[C@@H](Br)[C@]23OCCO[C@]12OCCO3
5961	O=C1CC[C@H]([C@H]2CCC(=O)[C@H](Br)C2)C[C@@H]1Br
5962	Brc1ccc2ccc3ccc4ccc5ccc6ccc(Br)cc6c5c4c3c2c1
5963	BrC1=C(Br)[C@H]2C=C[C@@H]1C2
5964	Cc1sc(C)c2cc(Br)c(Br)cc12
5965	BrC1=C[C@H]2[C@H]3C=C[C@@H]1C(Br)=C[C@@H]23
5966	Br[C@H]1C[C@@H]1[C@@H]1C[C@H]1Br
5967	BrC12CCCC(Br)(C1)C2
5968	BrC1=C(C2=C(Br)CCCCC2)CCCCC1
5969	CCn1c(C)c(Br)c(Br)c1C
5970	BrC1=C(Br)[C@@H]2C=C[C@@H]3[C@H]1[C@@H]3C=C2
5971	FC(F)(F)c1cccc(-c2c(Br)c(Cl)nc(Cl)c2Br)c1
5972	Brc1ccccc1-c1cc2c(ccc3ccccc32)cc1Br
5973	CC1(C)C/C=C(/Br)CC/C=C(/Br)C[C@H]2O[C@H]21
5974	CC(O)=Nc1sc(Br)cc1Br
5975	C[C@]12CCC[C@@](C)(Br)[C@H]1CC[C@]1(Br)OC(=O)CC[C@H]21
5976	C[C@]12OO[C@H](O1)[C@H]1C[C@H](Br)[C@H](Br)[C@H]12
5977	Cc1cc2c(ccc3sc(Br)c(-c4c(Br)sc5ccc6sc(C)cc6c45)c32)s1
5978	Br/N=c1/c2ccccc2c2nc3c(nc12)/c(=N\\Br)c1ccccc13
5979	Brc1sc(-c2cc(C#Cc3ccccc3)c(Br)s2)cc1C#Cc1ccccc1
5980	Brc1cn(-c2ccccc2)cc1Br
5981	Oc1cc(Cl)c(Br)c(O)c1Br
5982	COc1c(C)c2c(c(Br)c1Cl)Oc1c(Br)c(O)c(Cl)c(C)c1C(=O)O2
5983	Cc1[nH]c2c(c1Br)Sc1[nH]c(C)c(Br)c1S2
5984	O/C=C(Br)/C(Br)=C\\O
5985	Brc1cc2ccccc2c2c1OCOc1c(Br)cc3ccccc3c1-2
5986	C#CC1C(Br)=CN(c2ccc(C)cc2)C=C1Br
5987	Cc1c(Br)cc(Br)n1C
5988	C#CC1C(Br)=CN(c2ccccc2C)C=C1Br
5989	CN(C)c1cc(Cl)c(Br)cc1Br
5990	Brc1cccc2c1[C@@H]1c3ccccc3[C@H]2c2c(Br)cccc21
5991	Brc1ccncc1Br
5992	Brc1ccc2ccc3ccc4ccc5ccc6ccc(Br)c7c6c5c4c3c2c1-7
5993	Br[C@@H]1CCC[C@H]1Br
5994	OC(=NBr)c1ccc2c(c1Br)Oc1ccccc1O2
5995	C#CC1C(Br)=CN(c2cc(C)cc(C)c2)C=C1Br
5996	CN1C=CC(=C2C=C(Br)S(=O)(=O)C(Br)=C2c2ccccc2)C=C1
5997	BrC1=CCC=C1Br
5998	Brc1c2c(cc3c1CC1(C3)Cc3cc4c(c(Br)c3C1)CCCC4)CCCC2
5999	Cc1c(Br)ccc2c(Br)cccc12
6000	CC1=C(Br)[C@H]2[C@@H](C(C)C)CC[C@]1(C)[C@@H]2Br
6001	Cc1ccc(C)c2cc(Br)c(Br)cc12
6002	Clc1ccc2c(c1)[C@H](Br)c1ccccc1[C@H]2Br
6003	BrC1=CC=C[C@H]1Br
6004	ClC1=C(Br)C[C@H]2C(Br)=CC[C@@H]12
6005	Br[C@@H]1[C@@H](C2(Br)CC2)[C@@H]2C=C[C@H]1C21CC1
6006	Brc1c2ccccc2cc2c(Br)c3ccccc3cc12
6007	CC1(C)C[C@@H]2C=C(Br)[C@@]3(Br)C[C@]3(C)[C@@H]2C1
6008	Br[C@@H]1c2ccccc2[C@@H](Br)c2cc3ccccc3cc21
6009	Br[C@H]1C[C@@H](Br)C1
6010	Clc1ccc2c(c1)C(Br)=C(Br)c1ccccc1C2
6011	Brc1cc(Br)c2c(c1)CCCCC2
6012	O/C=C1\\C=C(Br)CC(Br)=C1Cl
6013	Cc1c(-c2csc(Br)c2C)csc1Br
6014	C[C@]1(O)c2ccoc2[C@H](O)[C@@](C)([C@@]2(O)CCCC[C@@H]2Br)[C@H]1Br
6015	C#CC1C(Br)=CN(C(=O)c2ccccc2)C=C1Br
6016	Brc1cnc2c(Br)sc3nc(-c4ccccc4)cc1-n-3-2
6017	CC(=O)O[C@H]1C[C@H](C)[C@H](Br)[C@@]2(O)[C@H]1C(C)(C)C[C@]2(C)Br
6018	CC(C)(C)c1cc(Br)c(Br)o1
6019	Br/C=C\\C(Br)Br
6020	O=C(OBr)OBr
6021	Brc1cccc2c1-c1cccc(Br)c1-2
6022	Br[C@]12CCC[C@@]1(Br)C2
6023	CSc1cc(Br)cc(Br)c1
6024	C/C(C#C/C(C)=C/Br)=C/Br
6025	BrC1=C(Br)[C@H]2C=C[C@@H]1CC2
6026	Oc1ccc(Br)c(I)c1Br
6027	BrC[C@]12CCCN3CC[C@@H]4c5ccccc5N(Br)[C@@]4(CC1)[C@@H]32
6028	C[C@]12CCCC(Br)=C1N(Br)c1ccccc12
6029	Br[C@]12C=C[C@](Br)(OO1)O2
6030	BrC1=CC2=CC3=CC4=CC=CC=C(C=C(C=C(C=C(Br)C1)C2)C3)C4
6031	CC(=O)n1cc(Br)c2c3[nH]cc(Br)c3ccc21
6032	O=C(Br)[C@H]1CC2(C[C@H]1Br)OCCO2
6033	BrNc1cc2c(cc1Br)OCO2
6034	Br[C@H]1C[C@@H](Br)[C@@H]2C=CC[C@H]12
6035	Cc1ccc(-c2cc(Br)cc(Br)c2)cc1
6036	O[C@H]1C[C@@H](O)[C@@H](Br)[C@@H]1CBr
6037	Cc1cc(Br)c2c(c1)c(C)c(Br)n2Br
6038	C=C(Br)[C@@H]1CC[C@@H](C)[C@@H]1Br
6039	CC(C)(Br)[C@@H]1C[C@H](Br)c2ccccc21
6040	BrN1C=C([C@H]2CCCN2Br)CCC1
6041	BrN1c2ccccc2N(Br)c2nc3ccccc3nc21
6042	BrC1=NNc2c(Br)nn(-c3ccccc3)c2O1
6043	BrC1=C(C2=C(Br)CCC2)CCC1
6044	Oc1c(Br)cc(Br)c(/C=C/Br)c1Br
6045	C#C[C@]1(OBr)CC[C@H]2[C@@H]3CC[C@@H]4Cc5oc(Br)cc5C[C@]4(C)[C@H]3CC[C@@]21C
6046	Clc1ccc(-c2c(Br)c3sc4ccccc4n3c2Br)cc1
6047	CC[C@]1(Br)CCCN2CCc3c(n(Br)c4ccccc34)[C@H]21
6048	C#CC1C(Br)=CN(C(C)=O)C=C1Br
6049	Oc1c(Br)ccc2cccc(Br)c12
6050	Brc1coc(-c2ccc3c(c2)OCO3)c1Br
6051	CC1(C)C[C@H]2C=C(Br)[C@]3(Br)C[C@]3(C(=O)OC(C)(C)C)[C@@H]2C1
6052	C/C=C1\\CN(Br)[C@@H]2C[C@H]1[C@@H](C(=O)OC)[C@@]13C[C@@H](O)O[C@@]21N(Br)c1ccccc13
6053	FC(F)(F)c1ccc(Br)c(-c2cc(C(F)(F)F)ccc2Br)c1
6054	CC/C(Br)=C\\Br
6055	Brc1nc(-c2csc(Br)n2)cs1
6056	CC1=C(Br)[C@](C)(Br)CCC1
6057	Cc1c(Br)cc(Br)c(O)c1C
6058	C[C@@H]1CC[C@H](CBr)[C@H]1Br
6059	BrC1=CO[C@@H]2O[C@H]1OC=C2Br
6060	Cc1ccc(C)c2c1C[C@H](OBr)[C@H]1[C@H]2[C@]2(O)OC[C@@]1(Br)[C@H](C)[C@H]2O
6061	CC1=C(Br)C=C(Br)/C1=C\\O
6062	Brc1cccc2c1Oc1c(Br)cccc1N2
6063	CCc1cc(Br)cc(Br)c1
6064	Br/C=C/c1cccc(Br)c1
6065	Br/C=C(\\Br)c1cccs1
6066	C[C@@H]1CCC[C@@](C)(Br)CCC2=C1[C@@](C)(CBr)CC2(C)C
6067	CC(C)(Br)[C@@H]1CCC[C@H]1Br
6068	C#CC1C(Br)=CN(C)C=C1Br
6069	Brc1c[nH]nc1Br
6070	CN1c2ccccc2C(Br)=C(N2CCN(Br)CC2)c2sccc21
6071	CC(=O)O[C@@H]1CC[C@@]2(C)C[C@@]2(Br)[C@H]1Br
6072	Cc1cccc2c(Br)c(Br)oc12
6073	Cc1cc2c(cc1C)Nc1c(Br)sc(Br)c1N2
6074	Br/C=C/[C@H](Br)I
6075	Cc1cc(-c2cc(C)c(Br)[nH]2)[nH]c1Br
6076	CCC1=C(Br)[C@H](Br)[C@H](O)CC1
6077	CC(C)(C)C(=O)c1cc(Br)[nH]c1Br
6078	N#Cc1ccc2c(Br)cnc3c(Br)sc1-n-2-3
6079	CC1(C)C(=O)[C@H](Br)[C@@H](Br)C1=O
6080	Brc1cc(Br)c(-c2oc(Br)cc2Br)o1
6081	BrN1CCN(Br)c2ccccc21
6082	Fc1cccc2c(Br)c3ccccc3c(Br)c12
6083	CC(=O)O[C@H]1[C@@]2(O)CC(C)(C)CC2=C(Br)[C@]2(Br)C[C@]12C
6084	CC1(C)O[C@H](Br)[C@H]2[C@@H](C(=O)Br)C(=O)c3ccccc3[C@@]2(C)O1
6085	Brc1c2ccccc2c(Br)c2ncccc12
6086	Br[C@]12CCCC[C@@]1(Br)CC2
6087	CC(=O)[C@H]1C(C)(C)C[C@]2(C)C[C@H](Br)C[C@@]12Br
6088	Clc1cc(Br)ccc1-c1ccc(Br)cc1
6089	CN1C=C(Br)C=C[C@H]1c1c(Br)[nH]c2ccccc12
6090	CC1=C(Br)C(C)(C)[C@@]2(CC1)OC(C)(C)O[C@@H]2[C@@H]1CCCC[C@H]1Br
6091	Cn1cc(Br)c2nc3c(Br)cnc(O)c3c(-c3ccccc3)c2c1=O
6092	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@H](Br)[C@H]3C)[C@@H](C)C[C@H](Br)[C@H]2C
6093	C#CC1C(Br)=CN(C(C)(C)C)C=C1Br
6094	Clc1cccc2c1[C@@H](Br)c1ccccc1[C@@H]2Br
6095	C[C@H]1[C@H](O)C[C@@H]2C(C)(C)[C@@H](O)CC[C@@]2(C)[C@@]12Cc1c(O)cc(Br)c(Br)c1O2
6096	COc1cc(Br)c(Br)c2c1C[C@@]1(O2)[C@@H](C)CC[C@@H]2C(C)(C)C=CC[C@]21C
6097	C#CC1C(Br)=CN(c2nc(C)cc(C)n2)C=C1Br
6098	Cc1c2ccc3ccc4c(Br)cc(ccc5cc(Br)c(cc2)c1c5C)c(C)c4c3C
6099	Brc1c[nH]c(-c2nc(Br)c[nH]2)n1
6100	CC(=O)O[C@H]1C=C(Br)[C@](O)(Br)[C@]2(C)CCCC(C)(C)[C@H]12
6101	Brc1ccc2cc1CCc1ccc(Br)c(c1)CC2
6102	O[C@H]1C[C@@H](Br)O[C@H](CBr)[C@H]1O
6103	Clc1ccc(Br)c(-c2cc(Cl)ccc2Br)c1
6104	O=C1c2ccccc2O[C@@H](OBr)N1Br
6105	Cc1c(Br)c(-c2ccccc2Br)cc2ccccc12
6106	COc1c(Br)sc2c(Br)c3cccccc-3c12
6107	Br[C@H]1C[C@H](Br)c2c1ccc1cc[nH]c21
6108	COc1cc(O)c(Br)c(O)c1Br
6109	Cn1cc(Br)c2nc3c(Br)cn(C)c(=O)c3c(-c3ccccc3)c2c1=O
6110	Cc1cc(C)cc2c(Br)cc(Br)c-2c1
6111	Clc1ccc2c(c1)N(Br)Cc1ccccc1CN2Br
6112	CC(=O)O[C@H]1[C@@H]2C=C(Br)[C@]3(Br)C[C@]3(C)[C@@H]2CC1(C)C
6113	CC(C)(C)N(Br)/C=C/Br
6114	Brc1cc(Br)cc([C@H]2OC=Cc3occc3O2)c1
6115	C[C@H](Br)N(C)Br
6116	BrC[C@H]1C=C[C@H]2[C@H](Br)[C@H]12
6117	CC1(C)O[C@@H]2[C@@H](Br)C[C@H](Br)[C@@H]2O1
6118	Cc1cc(Cl)c2c(c1)c(C)c(Br)n2Br
6119	Clc1cccc2c(Br)c(Br)oc12
6120	COc1c(Br)c2c3c(c1Br)O[C@@]1(C[C@@H]3CC(C)(C)O2)[C@@H]2CC[C@@H](C2)C1(C)C
6121	Cc1ccc(-c2cc(Br)cc(Br)c2C)cc1
6122	CC(C)[C@H]1CC[C@@]2(C)[C@@H](Br)[C@@H]1[C@@H](Br)[C@]2(C)O
6123	CC(C)(C)/C(C#CC#C/C(=C\\Br)C(C)(C)C)=C/Br
6124	BrO[C@@H]1C[C@@H]1Br
6125	O=c1c(Br)cnc2c(Br)c3cccccc3n12
6126	Br[C@@H]1[C@@H]2CC[C@@H](O2)[C@H]1Br
6127	Brc1cc(-c2cc(Br)c3ccccc3n2)nc2ccccc12
6128	Brc1cc2ccc3[nH]cc(Br)c3c2[nH]1
6129	Cc1c(Br)c2cc(c1Br)CCc1cccc(c1)CC2
6130	BrO[C@H]1CC[C@H]2CN3CCc4c([nH]c5ccccc45)[C@@H]3C[C@@H]2[C@@H]1Br
6131	Brc1ccc2c(c1)C1(c3ccccc3-2)c2ccccc2-c2ccc(Br)cc21
6132	Br[C@H]1[C@@H]2C=C[C@@H](C2)[C@H]1Br
6133	BrC[C@H]1c2ccccc2CCN1Br
6134	CC1=C(C(=O)O)[C@H]2C=C(Br)[C@@]3(Br)C[C@@]3(C)[C@H]2C1
6135	BrN1C=C([C@H]2CCCN2Br)CC1
6136	C[C@]12C(=O)C(Br)=C(O)[C@](C)(C1=O)[C@@]1(C)C(=O)C(Br)=C(O)[C@]2(C)C1=O
6137	Clc1c(Br)c[nH]c1Br
6138	CC(C)(C)[C@H]1CN(Br)c2ccccc2N1Br
6139	Oc1c(Br)c(Br)c(Br)c(Br)c1Br
6140	Cn1c2ccccc2c2nc3c(nc21)N=C(O)N1[C@@H](Br)O[C@H](Br)CO[C@H]31
6141	CC(=O)OC(Br)=C(Br)Br
6142	Brc1ccc(-c2ccc(Br)o2)o1
6143	Cc1c2cc(Br)c(c1C)CCc1cc(Br)c(c(C)c1C)CC2
6144	Brc1ccccc1-c1ccc2c(Br)cccc2c1
6145	O=c1sc2c(s1)SC(Br)=C(Br)S2
6146	CC1=C(Br)[C@](C)(Br)c2ccccc21
6147	Fc1cccc2c(Br)c3c(F)cccc3c(Br)c12
6148	C#CC1C(Br)=CN(c2cccc3ccccc23)C=C1Br
6149	Cc1ccc2cc(-c3ccccc3Br)c(Br)c3c2c1CC3
6150	Cc1cc(Br)c2[nH]c(Br)c(Br)c2c1
6151	Brc1cccc2sc3cccc4cc(Br)n(c12)c43
6152	CC1(C)/C=C\\C/C(Br)=C\\CC/C(Br)=C\\C1
6153	Brc1ccccc1-c1cccnc1Br
6154	CC(=O)[C@]1(C)[C@@H]2CC(C)(C)C[C@]2(Br)C[C@H]1Br
6155	BrC=C(Br)Br
6156	N#C/C(Br)=C\\CBr
6157	C[C@@H]1CCc2c(cc(Br)c(F)c2Br)N1
6158	OC(/C=C\\Br)=C/Br
6159	Br/C1=C/C2=Cc3ccccc3C=C(/C=C(/Br)C1)C2
6160	Oc1c(Br)cc(Br)c2c1CCC2
6161	Cc1c(Br)n(Br)c2c(C)cc(Cl)cc12
6162	SC1=NCCCCN=C(S)Nc2ccccc2N(Br)CCN(Br)c2ccccc2N1
6163	Br[C@]12O[C@H]3CC[C@H]4[C@H]3[C@H]1[C@@H]1[C@@H]3[C@H]2[C@H]2CC[C@@H]5O[C@](Br)([C@H]41)[C@H]3[C@@H]52
6164	Br[C@H]1[C@@H]2[C@H](Br)[C@H]12
6165	Brc1cccc2ccc3c4ccccc4cc(Br)c3c12
6166	Brc1cc(I)c(Br)[nH]1
6167	Cc1cc2c(cc1Br)CC1(C2)Cc2cc(C)c(Br)cc2C1
6168	Br[C@]12O[C@@]1(Br)[C@@H]1C[C@H]2c2ccccc21
6169	Brc1ccc2ccc(Br)nc2c1
6170	C=C(Br)[C@H]1CC[C@]2(C)CCCC(Br)=C2C1
6171	CN1C=C(Br)C=C[C@@H]1c1c(Br)n(C)c2ccccc12
6172	Cc1ccc2c(Br)c3ccccc3c(Br)c2c1Cl
6173	C=C1[C@@H](O)CC[C@@](C)(Br)[C@H]1Br
6174	BrC1=C(Br)SC(=C2SC3=C(SCCS3)S2)S1
6175	BrC#Cc1ccc(C#CBr)s1
6176	Oc1c(Br)cc(Br)cc1CCl
6177	CC1(C)C[C@@H]2[C@H]3O[C@](C)(CC(Br)=C3Br)[C@@H]2C1
6178	Br[C@H]1CCCC/C1=C1/CCCC[C@H]1Br
6179	OC(=NBr)N=C(O)NBr
6180	Oc1ccc2c(O)c(Br)ccc2c1Br
6181	Br[C@H]1CCCCCCCC[C@@H](Br)CCCCCCCC1
6182	C=C(Br)[C@H]1[C@@H]2[C@@H](CCC(=C)[C@@H]1Br)C2(C)C
6183	CC1(C)CCC[C@@]2(C)[C@@H]1CC=C(Br)[C@]2(O)Br
6184	OC1=C(Br)CC[C@H]2C(O)=C(Br)CC[C@H]12
6185	BrN=C1NN(Br)[C@@H](c2ccccc2)S1
6186	ClCc1cc(Br)cc(Br)c1
6187	CC1=C(C)[C@@H]2CC=C(Br)[C@H](Br)[C@@]2(C)CC1
6188	CC1(C)C[C@@H]2C[C@]3(Oc4c(Br)c(O)c(Br)c(c42)O1)[C@H]1CC[C@H](C1)C3(C)C
6189	OC1CN=C(S)Nc2ccccc2N(Br)CCN(Br)c2ccccc2NC(S)=NC1
6190	Brc1cccc2ccc3cccc(Br)c3c12
6191	CC1(C)C(=O)[C@H]2O[C@H]2[C@]2(C)[C@@H](Br)C(Br)=CC[C@H]12
6192	FC(F)(F)c1cc2c(Br)cnc3c(Br)sc(n1)-n-2-3
6193	Cc1ccc(-c2c(Br)c(Br)c(Cl)n2C)cc1
6194	O=C1[C@@H](Br)C[C@H]2C(=O)[C@H](Br)C[C@H]12
6195	C[C@@H]1C[C@H](Br)C[C@@H]1Br
6196	Brc1c[nH]c2cc3[nH]cc(Br)c3cc12
6197	Br[C@]12CCC[C@@]1(Br)CC2
6198	CO[C@@]12OO[C@@H](O1)[C@H]1C[C@H](Br)[C@H](Br)[C@H]12
6199	Brc1c2ccc(ccc3ccc(o3)c(Br)c3ccc(ccc4ccc1o4)o3)o2
6200	Brc1ccc(Br)n1-c1ccccc1
6201	C/C=C1/CN2CC[C@@]34c5ccccc5N(Br)[C@@H]3[C@@H](Br)[C@@H]1C[C@@H]24
6202	Brc1cc2c3ccc(ccc1-3)CCc1ccc3c(Br)cc(c-3cc1)CC2
6203	CS(C)=C1C(Br)=CC=C1Br
6204	CC1(C)C(Br)=C(Cl)CC(Cl)=C1Br
6205	Br/C1=C/C2=CC=CC=C(/C=C(/Br)CC1)C2
6206	Oc1c(Br)cc(Br)c2cccnc12
6207	COc1c(Br)cc(C(F)(F)F)cc1Br
6208	CO[C@H]1[C@@H](Br)CC[C@H]1Br
6209	S=c1sc2c(s1)SC(Br)=C(Br)S2
6210	CC1(C)[C@@H]2CC=C(Br)[C@@H](Br)[C@@]2(C)CC[C@H]1O
6211	O=C1c2ccc(Br)cc2C(=O)c2cc(Br)ccc21
6212	COc1c(C)c(C)c(O)c(Br)c1Br
6213	Brc1cc(Br)c(Br)[nH]1
6214	CC(C)(C)c1ccc(Br)cc1Br
6215	CC1=C(Br)[C@@H]([C@H](C)Br)CC1
6216	CC1(C)[C@H]2CC=C(Br)[C@@]3(C2)[C@@H](Br)CC[C@H]13
6217	Cn1c(Cl)c(Br)c(Br)c1-c1ccccc1
6218	Clc1sc(Br)cc1Br
6219	Cc1cc(O)c(Br)c(C)c1Br
6220	Cc1cccc(Br)c1-c1cc2ccccc2cc1Br
6221	Brc1ccc2sc(Br)nc2c1
6222	C/C(Br)=C(\\C)Br
6223	CC1(C)CCC[C@@]2(C)[C@H](Br)C(Br)=CC[C@@H]12
6224	Brc1cccc2c1[C@H]1c3ccccc3[C@@H]2c2cccc(Br)c21
6225	C=C(C)[C@H]1C[C@@](C)(Br)C[C@@]1(C)Br
6226	Br[C@H]1c2ccccc2[C@@H]2[C@H]1[C@@H]2Br
6227	Br[C@@H]1CC12C[C@H]2Br
6228	COc1ccc2c(C)nn(Br)c3ccc(Br)c1c23
6229	Oc1c(Br)c2c(c3ccccc13)O[C@H](CBr)C2
6230	BrC1=CC=CC=C2C(Br)=CC=CC=C12
6231	BrC1=C(Br)[C@@]23O[C@@H]1C=C2[C@H]1C=C[C@@H]3CC1
6232	BrN1C=C([C@H]2c3ccccc3CCN2Br)CCC1
6233	COc1c(Br)c2c3c(c1Br)OC(C)(C)CC3CC(C)(C)O2
6234	BrC#Cc1cccc2cc3cccc(C#CBr)c3cc12
6235	Clc1ccc2c(c1)[C@@]1(Br)CCCC=C1N2Br
6236	Brc1ccc(N2CCN(Br)CC2)cc1Br
6237	Brc1c(-c2ccccc2)c(Br)n2c1sc1ccccc12
6238	CCc1c(Br)cc(C)cc1Br
6239	Cc1ccc(Br)c(-c2ccccc2Br)c1
6240	COc1c(Br)cc(Br)c(O)c1O
6241	O=C1c2ccc(Cl)cc2C(=O)c2c1ccc(Br)c2-c1c(Br)ccc2c1C(=O)c1cc(Cl)ccc1C2=O
6242	BrC1=C[C@@H]2[C@@H]3C=C[C@H]1C=C(Br)[C@@H]32
6243	CN1C[C@@H](Br)C[C@H]1Br
6244	BrC1=C(Br)[C@@H](Br)CCC1
6245	Brc1cc(Br)c2cc3ccc4ccc(cc1-2)n43
6246	BrC1=CC=CC=C(Br)O1
6247	O=C1c2ccccc2C(=O)c2c1c1oc(Br)cc1c1cc(Br)oc21
6248	CC(C)(Br)C#CBr
6249	O=C(Br)C(Br)Br
6250	CC1(C)C[C@@H]2C[C@H](Br)[C@]3(Br)C[C@]3(C)[C@@H]2C1
6251	Brc1nc2ccccc2n1-n1c(Br)nc2ccccc21
6252	C#CC1C(Br)=CN(C2CCCCC2)C=C1Br
6253	Br[C@@H]1[C@H]2C=C[C@@H]3[C@H]2[C@@H]2[C@H]1C=C[C@H]2[C@@H]3Br
6254	Brc1ccc(Br)c2/c1=c1/cccc/c1=C/C=c1/cccc/c1=2
6255	BrC1=CC=CC=C(c2cc3cccccc-3c2Br)C1
6256	Br[C@@]12O[C@@H](c3ccccc31)[C@@H]1c3ccccc3[C@@]12Br
6257	BrC#CCCC#CBr
6258	Oc1c(Br)sc(Br)c1O
6259	Brc1cc(Br)cc(-c2ccccc2)c1
6260	Cn1c(Cl)c(Br)c2cc(Br)ccc21
6261	O=C1O[C@H]2CC[C@@H](Br)[C@H]2[C@@H]1CBr
6262	Cc1cc(=O)oc2c(Br)c(O)c(CBr)cc12
6263	N#Cc1ccc(Br)c(Br)c1
6264	BrC1=C(C2=C(Br)CCCC2)CCCC1
6265	C[C@H]1CC[C@H](Br)O[C@@H]1[C@H]1O[C@@H](Br)CC[C@H]1C
6266	BrC1=CC(=C2C=CC=CC=C2)C=C1Br
6267	C=C1C[C@H](Br)C(Br)=C2CC(C)(C)C[C@H]2[C@@H]1OC(C)=O
6268	Cc1cc(Br)c(C)c2c1[nH]c1ccc(N(C)C)c(Br)c12
6269	Brc1ccccc1-c1cc2c(ccc3ccccc32)nc1Br
6270	CC(C)(C)OC(=O)n1c2cc(Br)ccc2c2ccc(Br)cc21
6271	FC(F)(F)[C@]1(Br)CC[C@@](Br)(C(F)(F)F)CC1
6272	Cn1c(=O)nc(O)c2nc(Br)c(Br)nc21
6273	Oc1ccc2c(c1Br)Oc1ccc(O)c(Br)c1O2
6274	O=C1CC[C@H]2[C@@H](Br)C[C@@H]3CC[C@]12[C@@H]3Br
6275	CC(=O)[C@H]1[C@H](Br)[C@H]2C=C[C@@H]1[C@@H]2Br
6276	Brc1ccccc1-c1c(Br)c2ccccc2c2ccccc12
6277	COc1cc2c(cc1Br)[C@@]1(C)CC[C@@]3(C)C(Cl)=C(Br)CC[C@@]3(C)[C@@H]1CC2
6278	COc1c(O)cc(Br)c(Br)c1O
6279	Oc1ccc(Br)c(Br)c1Br
6280	O/C=C1\\C(Br)=C(Br)c2ccccc21
6281	Cc1ccccc1C1C(Br)=CNC=C1Br
6282	FC(F)(F)c1cccc(C2C(Br)=C(Cl)NC(Cl)=C2Br)c1
6283	COc1cc(Br)c(Br)c(Br)c1
6284	O=C1C=C(Br)COc2ccc(Br)cc21
6285	C/C=c1\\c2c(/c(=C/C)c3c1C[C@H](Br)CC3)C[C@H](Br)CC2
6286	BrC1=C(Br)CC1
6287	Brc1cc(Br)c(Br)s1
6288	Brc1ccc(Br)c2c1Oc1ccccc1O2
6289	Clc1ccc(-n2nnc(Br)c2Br)cc1
6290	Brc1cc(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)c(Br)s1
6291	Br[C@]12c3ccccc3[C@@H]3[C@@H]4C[C@@H]4[C@H]1[C@@]32Br
6292	Brc1cnc2ccccc2c1Br
6293	C/C(Br)=C/[C@H](C)Br
6294	Brc1ccc2c(c1-c1c(Br)ccc3c1-c1ccccc1-3)-c1ccccc1-2
6295	CC1(C)CCC[C@@]2(C)[C@@H]1C(=O)C=C(Br)[C@]2(O)Br
6296	CC(=O)Oc1c(Br)cc(C)cc1Br
6297	BrC1=C2c3ccccc3CCN2[C@@H]2O[C@H]1N1CCc3ccccc3C1=C2Br
6298	BrC1=CC=C(Br)C2=CC=CC=C1C2
6299	BrC1=CC2=Nc3ccccc3N=C3C=C(Br)[C@H]1C[C@@H]32
6300	O=c1c2cc3c(cc2c(Br)c2n1CC[C@@H]2CBr)OCO3
6301	Br/C=C\\c1ccccc1Br
6302	CCn1c(Cl)c(Br)c2cc(Br)ccc21
6303	CC1C[C@@H](Br)/C=C\\C=C/[C@H](Br)C1
6304	CC1(C)[C@]2(C)N=N[C@@]1(C)[C@@H](Br)[C@@H]2Br
6305	O=C1c2ccccc2C(=O)c2c1c(Cl)cc(Br)c2-c1c(Br)cc(Cl)c2c1C(=O)c1ccccc1C2=O
6306	C[C@H](Br)[C@@H]1CCC=C1Br
6307	Brc1cccc2c1[C@@H]1c3cc4ccccc4cc3[C@H]2c2c(Br)cccc21
6308	Cc1cc(Br)c(C)c2c1ccc1ccc3ccc4c(C)cc(Br)c(C)c4c3c12
6309	Brc1sc(-c2sc(Br)c(Br)c2Br)c(Br)c1Br
6310	Brc1ccc(-c2ccoc2Br)[nH]1
6311	FC1=C(F)C(Br)=C1Br
6312	C[C@H]1OC(=O)[C@H](n2c(Br)ccc2Br)[C@H]1C
6313	C[C@]12CC[C@H]3[C@H]4Cc5cc(Br)oc5C[C@@H]4CC[C@H]3[C@H]1CC[C@H]2OBr
6314	BrC12CCC(Br)(C1)C2
6315	Clc1cc(Cl)c(Br)c(Cl)c1Br
6316	Cc1ccc2c(Br)cccc2c1Br
6317	BrN1CCCN(Br)c2ccccc21
6318	Oc1cc(O)c(-c2cc(Br)c(O)cc2O)cc1Br
6319	CC1(C)[C@H](Br)C[C@H]1CBr
6320	OC(=C\\Br)/C=C/Br
6321	C[C@@H]1C[C@H](Br)C(Br)=CC2=C1CC(C)(C)C2
6322	Brc1ccc2[nH]c(Br)c(Br)c2c1
6323	Oc1c(Br)ccc(-c2ccccc2)c1Br
6324	BrOc1c(Br)c2ccccc2c2ccccc12
6325	CC(C)(C)S(=O)(=O)c1c(Br)csc1Br
6326	Brc1ccc2nc3ccc4nc5ccc(Br)cc5cc4c3cc2c1
6327	Br[C@H]1C[C@@H]2C[C@H]1[C@@H]1[C@H]2[S@]2=N[S@]3=N[S@@](=N[S@@]1=N2)[C@H]1[C@@H]3[C@H]2C[C@@H](Br)[C@@H]1C2
6328	Cl/C=C\\C1C(Br)=COC=C1Br
6329	O=C1CCN(Br)C[C@@H]1CBr
6330	COc1ccc2c(c1)[C@]1(Br)CCC[C@@](C)(Br)[C@@H]1CC2
6331	Cl/C=C/C1C(Br)=COC=C1Br
6332	Brc1cccc2c1[C@@H]1c3cccc(Br)c3[C@H]2[C@@H]2Cc3cc4ccccc4cc3C[C@H]12
6333	Cc1c(C)c(Br)c2c(c1C)CCc1c(Br)c(C)c(C)c(C)c1CC2
6334	Brc1cc(Br)c2c(c1)CCCC2
6335	Cc1csc(Br)c1Br
6336	Br/C=C\\C#C/C=C/Br
6337	O=c1c(Br)cc(Br)c2ccccn12
6338	Clc1c(Br)cc(Br)c2ccccc12
6339	CC1(C)OC[C@H](CBr)[C@@H](Br)O1
6340	COc1ccc(Br)c2c(O)ccc(Br)c12
6341	Br[C@@H]1C[C@H]2CCC[C@@]2(Br)C1
6342	Cc1c2ccc3cc(Br)c4ccc(ccc5cc(Br)c(cc2)c1c5C)c(C)c4c3C
6343	Brc1ccc2nc3c(ccc4cc5cc(Br)ccc5nc43)cc2c1
6344	C=C1CC[C@@H]2[C@](C)(Br)CCC[C@]2(C)[C@@H]1CBr
6345	CC(=O)O[C@@H]1CC[C@@H]2[C@H]3C=Cc4c(cc(Br)c(Cl)c4Br)[C@H]3CC[C@@]12C
6346	Cc1ccc2cc(Br)c(Br)nc2c1
6347	CC(C)(C)Oc1cc(Br)sc1Br
6348	BrN1CCOCCNc2ccccc2N(Br)CCOCCNc2ccccc21
6349	Cc1c(Br)ccc(Br)c1C
6350	Brc1cc2cnncc2cc1Br
6351	Brc1cc(Br)c(N2CCCC2)o1
6352	CC(C)(C)c1cc(C(C)(C)C)c(Br)cc1Br
6353	Oc1c(Br)ccc(I)c1Br
6354	C[C@@H]1CC[C@]2(C)[C@@H](CC=C(Br)[C@@]2(O)Br)[C@]12CO2
6355	C[C@]1(Br)CC[C@@H](CBr)C1=O
6356	CC1(C)CCC[C@@]2(C)[C@@H](CBr)C(Br)=CC[C@H]12
6357	O=S1(=O)[C@@H](Br)CC[C@@H]1Br
6358	C/C(Br)=C/[C@@H](C)Br
6359	COc1ccc(Br)c(Br)c1O
6360	Brc1cc(Br)c2ccc3cccc4ccc1c2c43
6361	O[C@H]1CCN(CBr)[C@@H]1Br
6362	O=C1C[C@H](CBr)C[C@]2(Br)CC(=O)[C@@H]3CCCC[C@H]3[C@@H]12
6363	CCc1cc(Br)c(Br)cc1O
6364	O/C=C(Br)/C(Br)=C/O
6365	Br/N=c1/c2ccccc2c2nc3c(nc12)/c(=N/Br)c1ccccc13
6366	O[C@H]1[C@H](O)N(Br)[C@H](O)[C@@H](O)N1Br
6367	Cc1cc(Br)oc1Br
6368	CC1(C)O[C@@H](Br)[C@H]2[C@H](CBr)C(=O)c3ccccc3[C@@]2(C)O1
6369	ClN1CCOCCN(Cl)CCN(Cl)CC1
6370	Clc1ccc(C#Cc2ccc(N(c3ccc(C#Cc4ccc(Cl)cc4)cc3)c3ccc(C#Cc4ccc(Cl)cc4)cc3)cc2)cc1
6371	Clc1c2cccccc-2c(Cl)c1Cl
6372	Clc1coc(Cl)c1Cl
6373	Cc1c(Cl)c(S)c(Cl)c(C(C)(C)C)c1Cl
6374	Clc1cc(Cl)c(Cl)c(Cl)c1
6375	C=C1COCCN(Cl)CCN(Cl)CCN(Cl)CCOC1
6376	ClN1CCN(Cl)CCN(Cl)CC1
6377	Cl[C@H]1O[C@@H](Cl)O[C@@H](Cl)O1
6378	Clc1ccc(-c2ccc(N(c3ccc(-c4ccc(Cl)cc4)cc3)c3ccc(-c4ccc(Cl)cc4)cc3)cc2)cc1
6379	Oc1c2cccc1Sc1cc(Cl)cc(c1O)Sc1cc(Cl)cc(c1O)Sc1cc(Cl)cc(c1O)S2
6380	ClC=C1SC(Cl)=C(Cl)S1
6381	Clc1ccc2c(Cl)ccc(Cl)c2c1
6382	C[C@]12c3ccc(Cl)cc3[C@]3(C)c4ccc(Cl)cc4[C@@](C)(c4cc(Cl)ccc41)[C@]23C
6383	Oc1cc2c(cc1Cl)Cc1cc(O)c(Cl)cc1Cc1cc(O)c(Cl)cc1C2
6384	C[C@]1(Cl)C[C@@](C)(Cl)C[C@@](C)(Cl)C1
6385	Clc1cc(Br)c2cc1/C=C\\c1cc(c(Cl)cc1Br)/C=C\\c1cc(c(Cl)cc1Br)/C=C\\2
6386	ClN1CCOCCOCCOCCN(Cl)CCN(Cl)CC1
6387	Clc1cc(Cl)c(Cl)c(Cl)c1Cl
6388	Cc1c(Cl)cc(Cl)c(Cl)c1Cl
6389	COc1cc2c(cc1Cl)Cc1cc(OC)c(Cl)cc1Cc1cc(OC)c(Cl)cc1C2
6390	Clc1cc(Cl)c(Cl)[nH]1
6391	Clc1csc(Cl)c1Cl
6392	Clc1ccc2c(c1)[C@H]1c3ccc(Cl)cc3[C@@H]2c2cc(Cl)ccc21
6393	CC(Cl)=C1NC(=C(C)Cl)NC(=C(C)Cl)N1
6394	Clc1cc(Br)c2cc1/C=C\\c1cc(c(Br)cc1Cl)/C=C\\c1cc(c(Cl)cc1Br)/C=C\\2
6395	Clc1cccc2c1[nH]c1c3[nH]c4c(Cl)cccc4c3c3c4cccc(Cl)c4[nH]c3c21
6396	Oc1c(Cl)cc(Cl)c(Br)c1Cl
6397	ClN1CCNCCN(Cl)CCN(Cl)CC1
6398	Cc1c(Cl)c2n(c1Cl)CCn1c-2cc(Cl)c1C
6399	ClN1CCOCCOCCOCCOCCN(Cl)CCN(Cl)CC1
6400	Clc1ccc2[nH]c3c4[nH]c5ccc(Cl)cc5c4c4c5cc(Cl)ccc5[nH]c4c3c2c1
6401	Clc1ccc(C#Cc2cc(Cl)cc(Cl)c2)cc1
6402	Clc1cc2c3c4c1Cc1cc(Cl)c5c(c14)c1c(cc(Cl)c(c31)C2)C5
6403	CC(=O)N1[C@@H]2[C@H]3N(Cl)[C@H]4[C@@H](N2Cl)N(C(C)=O)[C@@H]([C@@H]1N3C(C)=O)N4Cl
6404	Clc1cccc(C#Cc2ccc(C#Cc3ccccc3Cl)cc2Cl)c1
6405	Oc1c(Cl)c(Cl)c(Cl)c(Cl)c1Cl
6406	Cl[C@H]1CCC[C@@H](Cl)CCC[C@@H](Cl)CCC1
6407	Clc1cc(Cl)c2cc(Cl)ccc2c1
6408	Cc1c(Cl)c(Cl)c(Cl)n1C
6409	Clc1ccc2nc3cc(Cl)c4cc5cc(Cl)ccc5nc4c3cc2c1
6410	ClN1CCCN(Cl)CCOCCN(Cl)CCC1
6411	Clc1ccc(Cl)c(Cl)c1
6412	Oc1ccc(C#Cc2ccc(C#Cc3ccccc3Cl)cc2Cl)cc1Cl
6413	Clc1cc(Cl)c(Cl)s1
6414	Clc1c(Cl)c(Cl)c(Cl)c(Cl)c1Cl
6415	ClN1CCOCCOCCN(Cl)CCN(Cl)CC1
6416	Cl[C@H]1[C@H](Cl)[C@H]1Cl
6417	Clc1cccc2[nH]c3c4[nH]c5cccc(Cl)c5c4c4c([nH]c5cccc(Cl)c54)c3c12
6418	Clc1ccc2c(c1)[nH]c1c3[nH]c4cc(Cl)ccc4c3c3c4ccc(Cl)cc4[nH]c3c21
6419	Cn1c(Cl)cc(Cl)c1Cl
6420	Cc1cc(Cl)c(Cl)cc1Cl
6421	Cl[C@@H]1[C@@H]2[C@@H]3OO[C@@H](O3)[C@@H]2[C@@H](Cl)[C@@H]1Cl
6422	Clc1c(Br)c(Cl)c(Br)c(Cl)c1Br
6423	ClN1CCCN(Cl)CCN(Cl)CCCNCC1
6424	N=C(N)NN=C1C=CC(=NNC(=N)S)C=C1
6425	NC=C(N)N
6426	NC[C@H]1O[C@H](O[C@@H]2[C@@H](N)C[C@@H](N)[C@H](O)[C@H]2O)[C@H](O)[C@@H](O)[C@@H]1O
6427	N[C@@H]1C[C@@H](N)[C@@H](O[C@@H]2O[C@@H](CO)[C@H](O)[C@H](O)[C@H]2N)[C@H](O)[C@@H]1O
6428	N[C@H]1C[C@@H](N)[C@H](O)[C@@H](O)[C@@H]1O[C@H]1O[C@H](CO)[C@@H](O)[C@H](O)[C@H]1N
6429	N[C@H]1[C@@H](O)[C@@H](N)[C@@H](O)[C@@H](N)[C@@H]1O
6430	N=C1NC(N)=C(N)[C@@H](S(=O)(=O)O)N1
6431	N[C@H]1C[C@@H](N)[C@H](O[C@H]2O[C@H](CO)[C@@H](O)[C@H](N)[C@H]2O)[C@@H](O)[C@@H]1O
6432	N[C@@H]1C[C@@H](N)[C@@H](O)[C@H](O)[C@H]1O[C@H]1O[C@H](CO)[C@@H](O)[C@H](O)[C@H]1N
6433	NC[C@H]1O[C@H](O[C@@H]2[C@@H](O)[C@H](O)[C@@H](N)C[C@H]2N)[C@H](O)[C@@H](O)[C@@H]1O
6434	C[C@@H](N)N([C@@H](C)N)[C@@H](C)N
6435	N[C@H]1[C@H](O)[C@H](N)[C@@H](O)[C@@H](N)[C@@H]1O
6436	NC[C@H]1OC(=O)[C@@H](N)[C@@H]1N
6437	N[C@H]1COC(=O)[C@@H](N)COC(=O)[C@@H](N)COC1=O
6438	N[C@H]1C[C@H](N)[C@@H](O)[C@@H](O)[C@H]1O[C@@H]1O[C@@H](CO)[C@H](O)[C@@H](O)[C@H]1N
6439	COC(=O)[C@@]12C[C@]1(I)C(I)=C[C@@H]1CC(C)(C)C[C@H]12
6440	CN1CCc2cc(I)cc(I)c21
6441	CC1(C)CCC[C@]2(C)[C@H]1CC[C@]1(I)C(=O)CC(I)=CC[C@@H]12
6442	Ic1c(I)n(-c2ccccc2)c2ccccc12
6443	Cc1cc2c(cc1I)[C@@H]1c3ccccc3[C@H]2c2cc(I)ccc21
6444	O=C1c2cc(I)ccc2-c2ccc(I)c3cccc1c23
6445	CC(C)(C)Sc1cc(O)c(I)cc1I
6446	Ic1cc(I)c(N2CCCCC2)o1
6447	C/C(I)=C(\\C)C#C/C(C)=C(\\C)I
6448	CC(C)(C)[C@@H]1CC=C(I)[C@H](CI)C1
6449	CC(C)(C)n1cc(I)c(I)c1
6450	OC[C@H]1C[C@H](I)O[C@@H]1I
6451	I[C@@H]1C[C@@H]2C=C[C@H]1[C@@H]2I
6452	CC1(C)CCC[C@]2(C)[C@H]1CC[C@@H](I)[C@]2(O)I
6453	Ic1cc2sc3cc(I)sc3c2s1
6454	Clc1ccc(I)c(Cl)c1I
6455	COc1cc(C#CI)c(OC)cc1C#CI
6456	Cc1ccc2c(c1)C(I)=C(I)c1ccccc1C2
6457	COc1c(I)cc(Cl)c(C)c1I
6458	Ic1cc2ccccc2c(-c2nc(I)cc3ccccc23)n1
6459	ClC1=C(I)CCc2ccc(-c3ccc4c(c3)C(Cl)=C(I)CC4)cc21
6460	Clc1sc(I)c(Cl)c1I
6461	C/C(I)=C\\c1ccc(I)cc1
6462	I[C@H]1[C@H]2CC[C@H](CC2)[C@H]1I
6463	C[C@H]1[C@H](C)N(I)c2ccccc2N1I
6464	C[C@@H](I)C#C[C@@H](C)I
6465	Ic1ccc2cc3nc(I)ccc3cc2n1
6466	C/C=c1/c2c(/c(=C/C)c3c1[C@@H](C)[C@H](I)C[C@@H]3C)[C@H](C)[C@@H](I)C[C@H]2C
6467	IC1=CS/C(=C2\\SC=C(I)S2)S1
6468	ClC1=C(I)C(c2ccccc2)C(I)=C(Cl)N1
6469	O=C1c2cc(Cl)ccc2C(=O)c2c1ccc(I)c2-c1c(I)ccc2c1C(=O)c1ccc(Cl)cc1C2=O
6470	CO[C@H]1[C@@H](I)[C@H]2C[C@@H]2[C@H]1I
6471	IC[C@@H]1CCC[C@H](I)C1
6472	I[C@H]1CO[C@H](I)O1
6473	Ic1ccccc1-c1cc2c(cc1I)sc1ccccc12
6474	CC1(C)CC2CC(C)(C)Oc3c(I)c(O)c(I)c(c32)O1
6475	Cc1cc(-c2[nH]c(I)cc2C)[nH]c1I
6476	CC1(C)CCC(C)(C)c2cc(I)c(I)cc21
6477	CC1(C)CCC=C(I)[C@@H]1I
6478	Cc1cc(-c2ccccc2)cc(C)c2c(I)c(I)cc1-2
6479	Ic1cscc1I
6480	O/C=C(/I)c1[nH]nc(Cl)c1I
6481	IC1=C2CCc3cc4c5cc3CCC2=C(I)/C=C(CC5)\\C(=C/1)CC4
6482	N#Cc1c2cccccc-2c(I)c1I
6483	Cc1cc(C)c(-c2c(C)cc(C)cc2I)c(I)c1
6484	INNI
6485	CC[C@@]12C3=CC=CC1=C(I)C(I)=C2C=C3
6486	Ic1ccccc1-c1cc2ccc3ccccc3c2cc1I
6487	C[C@]12C[C@@H]3[C@@H]4C[C@H]1[C@@H](C[C@]4(C)NN3I)N(I)N2
6488	Ic1ccc2ccc3c(I)ccc4ccc1c2c43
6489	C[C@@H]1Cc2c(n(I)c3ccccc23)-c2ncc(I)c(=O)n21
6490	C=C1COC(=O)c2c(I)cc3ccccc3c2-c2c(c(I)cc3ccccc23)C(=O)OC1
6491	C=C1[C@H](O)C[C@@H](CI)[C@H]1I
6492	CN1C=C[C@H](c2c(I)n(C)c3ccccc23)C(I)=C1
6493	Ic1ccc(C#Cc2ccc3c4c(ccc(C#Cc5ccc(I)cc5)c24)CC3)cc1
6494	IC/C=C1/C=CC=C1I
6495	Ic1cc(I)c(N2CCOCC2)o1
6496	C/C(I)=C(\\C)C#CC#C/C(C)=C(/C)I
6497	N=C1N[C@H]2C[C@@H](N1)[C@@H]1N(I)[C@](O)(O2)[C@H]2[C@H]3C[C@@H](NC(=N)N3)O[C@]1(O)N2I
6498	Cc1ccc(-c2nc3c(I)c4cccccc4n3c2I)cc1
6499	IN1CCOCCOCCN(I)CC1
6500	Clc1cc(I)cc(I)c1Cl
6501	OCc1cc(I)cc(I)c1O
6502	IC1=CC=c2c3c(c4cccc5cccc2c54)C=CC(I)=C1C3
6503	Clc1cc(I)c(Cl)c(Cl)c1I
6504	C=C(I)[C@@H]1CC[C@]2(C)CCC=C(I)[C@H]2C1
6505	CN(I)/C(I)=C/O
6506	Ic1c[nH]c2ccc(-c3[nH]c4ccccc4c3I)cc12
6507	I[C@@H]1CC=CC[C@H]1I
6508	Ic1ccc2c3c(ccc2c1)OCOc1ccc2cc(I)ccc2c1-3
6509	C[C@H]1CC[C@@H](I)[C@@H](I)C2=CC(C)(C)C[C@H]21
6510	I/N=c1/c2ccccc2c2nc3/c(=N\\I)c4ccccc4c3nc12
6511	Cc1ccc2oc(I)c(I)c2c1
6512	Ic1sc(I)c2c1ncc1sccc12
6513	C[C@H]1CC[C@@H]2C(C)(C)[C@H](O)CC[C@@]2(C)[C@@]12Cc1c(O)cc(I)c(I)c1O2
6514	FC1=C(I)C(F)=C1I
6515	IC1=C[C@@H]2C=C(I)[C@@H]3C=C[C@H]1[C@H]23
6516	Ic1cc(I)c2c(c1)CCC2
6517	C[C@]12Cc3cc(I)oc3C[C@H]1CC[C@@H]1[C@@H]2CC[C@]2(C)[C@@H](OI)CC[C@H]12
6518	Cc1c(I)n(I)c2c(C)cc(Br)cc12
6519	C=C1C[C@@](C)(I)[C@H](I)C[C@H]1O
6520	Ic1ccc2c(c1)C1(CC2)CCc2ccc(I)cc21
6521	CC1(C)C[C@@H]2[C@H](C=C(I)[C@@]3(I)C[C@@]23C)[C@H]1O
6522	Ic1c2cccccc-2cc1-c1cc2cccccc-2c1I
6523	Cc1cc(C)c(-c2c(C)cc(C)c(I)c2C)c(C)c1I
6524	COc1cccc2c1CC[C@@H]1[C@@]2(I)CCC[C@@]1(C)I
6525	CN1C=C(I)CC(I)=C1
6526	Cn1c(Cl)c(I)c(I)c1N1CCCCC1
6527	I[C@H]1/C=C\\C=C/[C@H](I)C/C=C\\1
6528	I[C@@H]1[C@@H]2C=C[C@@H](CC2)[C@H]1I
6529	CC1(C)[C@@H](I)[C@]2(C#N)C[C@@]1(C#N)[C@H](I)C2(C)C
6530	O=C1C(Cl)=C2C(=O)C(Cl)=C1N(I)CCCCCCCCCCCCN2I
6531	C/C(I)=C\\[C@H]1[C@H](I)C1(C)C
6532	C[C@H]1CN=C(S)Nc2ccccc2N(I)CCN(I)c2ccccc2NC(S)=N1
6533	CN1C=C[C@H](c2c(I)[nH]c3ccccc23)C(I)=C1
6534	Ic1ccc2ccoc2c1N1CCN(I)CC1
6535	C/C=c1\\c2c(/c(=C/C)c3c1C[C@@H](I)CC3)C[C@@H](I)CC2
6536	Oc1cc(I)sc1I
6537	CC1=C[C@H]2OC=C(I)[C@@](C)(I)[C@H]2[C@H](CO)C1
6538	IC1=S=C(I)c2cc3ccccc3cc21
6539	Cc1cc(O)cc(I)c1-c1c(C)cc(O)cc1I
6540	CC(=O)N1[C@H](I)Cc2c[nH]c3cccc(c23)[C@H]1/C=C(/C)I
6541	CC1(C)C=C(I)C(Cl)=C(I)C1
6542	C[C@]12CCC=C(I)[C@@]1(I)C2
6543	IC1=CC=CC2=CC=CC(I)=C1C2
6544	I[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@H]1[C@H]4C[C@@H]5C[C@H](C4)C[C@@]1(I)C5)(C3)C2
6545	CC1=C(I)C2=CC=C3C=CC=C4C=CC(=C1I)[C@]2(C)[C@]43C
6546	COc1ccc2c(c1)C(I)=C(I)c1ccccc1C2
6547	Oc1cc(I)c(I)cc1O
6548	Oc1cc2c(I)c(O)ccc2cc1I
6549	Ic1cc(I)c(N2CCNCC2)o1
6550	Ic1ccc(N2CCN(I)CC2)c2occc12
6551	COc1c2oc(I)c(Cl)c2cc2c(Cl)c(I)oc12
6552	Cc1c(I)n(I)c2c(Cl)ccc(Cl)c12
6553	CC1=C/C(I)=C\\C(C)=C/C(I)=C1
6554	O=C(I)O[C@@H]1CCC[C@@H]1I
6555	Cc1nc2ccccc2c(I)c1I
6556	CC1(C)C(I)=C(Cl)N(c2ccccc2)C(Cl)=C1I
6557	Oc1c(I)cc2ccccc2c1I
6558	COc1cc2c(C)c(c1)CCc1c(C)c(c(I)c(C)c1I)CC2
6559	BrC1CN(I)N(I)C1
6560	IC#CC1(C#Cc2ccccc2C#CC2(C#CI)OCCCO2)OCCCO1
6561	CN1C(=O)N2[C@H](I)O[C@H](I)CO[C@H]2c2nc3c4ccccc4n(C)c3nc21
6562	OC(/C=C\\I)=C\\I
6563	IC[C@@H]1[C@@H]2CC[C@@H](C2)[C@H]1I
6564	Ic1ccnc(-c2nccc(I)n2)n1
6565	COc1c(O)c(I)c(Br)c(I)c1O
6566	ClC1=C(I)C(c2cccc(Cl)c2)C(I)=C(Cl)N1
6567	COC(=O)[C@H]1CCC[C@](C)(I)[C@@H]1I
6568	Ic1csc(-c2cc(I)cs2)c1
6569	CC1=C(I)[C@@H](CI)CC1
6570	Ic1cccc2c1Oc1c(I)cccc1O2
6571	Clc1ccc2nc(I)c(I)nc2c1
6572	CC1=C/C(=C2/C=C(C)C(=O)C(I)=C2)C=C(I)C1=O
6573	CC(O)=Nc1c(I)c2cccccc-2c1I
6574	I[C@H]1C=C[C@@H](I)N1
6575	C[C@@H](I)C#C/C=C/[C@@H](C)I
6576	C#CC1C(I)=CN(c2c(C)cccc2C)C=C1I
6577	ClC1=C(I)CC(I)=C(Cl)C1=CN1CCOCC1
6578	CC(=O)O[C@H]1[C@@H]2CC(C)(C)CC2=C(I)[C@@]2(I)C[C@]12C
6579	CC1=CC2=C(I)C3(CC3)[C@@](C)(O)C(=O)C2=C1I
6580	Cc1cc(Cl)c2[nH]c(I)c(I)c2c1
6581	Ic1ccc2c(ccc3cc(-c4ccccc4)c(I)cc32)c1
6582	I[C@@]12[C@@H]3C[C@H]4[C@H]5[C@@H]3[C@@H]3C[C@H]5[C@]5([C@H]6C=C[C@H](C=C6)[C@]315)[C@]42I
6583	I[C@H]1CCC[C@H](I)[C@H]2COC[C@@H]12
6584	N#Cc1cc(I)[nH]c1I
6585	C[C@]12C=C(I)[C@@](O)(I)C[C@H]1CCCC2
6586	Ic1oc2ccccc2c1I
6587	SC1=NCCCN=C(S)Nc2ccccc2N(I)CCN(I)c2ccccc2N1
6588	IN1C=C([C@H]2CCCCCN2I)CCCC1
6589	IN1CCC[C@H]([C@@H]2CCCCN2I)C1
6590	Ic1[nH]c(I)c2c1CCCC2
6591	C[C@@H]1C[C@@H](I)CC[C@H]1I
6592	Cc1ccc2c(c1)[C@H](I)c1ccccc1[C@@H]2I
6593	Ic1cc2c(cc1I)CCC2
6594	O=C1c2c(O)cc(O)c(I)c2C(=O)c2c(O)cc(O)c(I)c21
6595	CCc1c(O)c(I)cc(I)c1O
6596	I/C=C/c1cc2cccccc-2c1I
6597	Ic1c2c(c(I)c3c1-c1cccc4cccc-3c14)-c1cccc3cccc-2c13
6598	Clc1c(I)cc(I)c2c1CCCC2
6599	O=C(Cl)c1c(I)cccc1I
6600	Cc1c2ccc(O)c(I)c2c(C)c2ccc(O)c(I)c12
6601	CC1=C2C=C(I)S[C@]2(C)[C@@]2(C)SC(I)=CC2=C1C
6602	Ic1cc2c(s1)/C(=C1/CCc3cc(I)sc31)CC2
6603	O=C1c2cc(I)sc2-c2sc(I)cc21
6604	CC(O)=Nc1cc(O)c(I)cc1I
6605	IC=C=CI
6606	Cc1c(I)n(I)c2ccc(Cl)cc12
6607	CC1=C(I)[C@@]2(C)[C@@H](OI)CC[C@@H](C)[C@H]2[C@H]2OC(C)(C)O[C@@H]12
6608	O=C1C(I)=C(Cl)NC2=C(I)CCCN12
6609	O=C(I)/C=C/I
6610	Cc1c(I)ccc(O)c1I
6611	Cc1cc(I)c(I)o1
6612	CC1(C)O[C@@H]2[C@H](I)O[C@@H](I)[C@@H]2O1
6613	CC1(C)[C@H](I)CC[C@@]1(C)I
6614	C#CC1C(I)=CN(c2cccc(C)c2)C=C1I
6615	Cc1c(I)c[nH]c1I
6616	CN(C)c1nc(Cl)c(I)cc1I
6617	Ic1ccccc1-c1cc2sc3ccccc3c2cc1I
6618	I/C=C/c1cccc2c1-c1c(I)cccc1-2
6619	CC(C)c1cc(I)c(Cl)c(I)c1
6620	CC(=O)Oc1c(I)c(I)cc2c1C(=O)c1ccccc1C2=O
6621	CCc1cccc2c(I)c(I)oc12
6622	I[C@]12[C@@H]3C=C[C@@H](O3)[C@@]1(I)[C@@H]1C=C[C@H]2O1
6623	Brc1ccc(-n2nnc(I)c2I)cc1
6624	O=C(O)[C@@H]1C[C@]2(O)c3ccccc3N(I)[C@@H]2N1I
6625	CC1=CC[C@H]([C@@H](C)I)[C@@H]1I
6626	IN1C=C([C@H]2CCCCCN2I)CCC1
6627	Cc1c(I)csc1I
6628	C=C1C[C@]23C[C@@]1(O)CC[C@H]2C1=CCC[C@](C)(I)[C@H]1[C@H]3I
6629	CCN1c2cccc(I)c2Sc2cccc(I)c21
6630	CSc1ccc(I)cc1I
6631	Oc1c(I)ccnc1-c1nccc(I)c1O
6632	IN=C1NN(I)C2(CCCCC2)S1
6633	Ic1c[nH]c2ccc3c(ccc4[nH]cc(I)c43)c12
6634	Oc1c(I)cc(I)cc1C1CCCCC1
6635	C[C@H]1CCC[C@@]2(C)[C@H]1CC=C(I)[C@@H]2I
6636	COc1c(I)c(I)c(Cl)n1C
6637	C=Cc1c(I)[nH]c(I)c1C
6638	Ic1nc2ccccc2nc1I
6639	Ic1cc(C#Cc2ccccc2)cc(I)n1
6640	INc1ccc(I)cc1
6641	CC1(C)CC2=C(I)[C@@]3(I)C[C@@]3(C)[C@@H](O)[C@@]2(O)C1
6642	Ic1ccc2c(c1)Nc1ccc(I)cc1S2
6643	Cn1c(=O)n2n(c1=O)C1(I)CC2(I)C1
6644	C[C@@H]1CC[C@H](I)[C@H]1I
6645	Clc1[nH]c(I)cc1I
6646	IC1=C(I)[C@@H]2O[C@H]1C1=C2[C@@H]2C=C[C@H]1CC2
6647	Cc1c2ccc(O)c(I)c2cc2ccc(O)c(I)c12
6648	Fc1cc2c(c3ccccc13)[C@H](I)c1ccccc1[C@@H]2I
6649	O[C@@H](I)[C@H](O)I
6650	C[C@@H]1C=C(I)C(I)=C[C@H]2CC(C)(C)C[C@@H]12
6651	O/C(I)=C/C=C\\I
6652	CC(C)(C)/C(C#CC#C/C(=C\\I)C(C)(C)C)=C/I
6653	I[C@@H]1CC[C@@H](I)C1
6654	Clc1c(I)n(I)c2ccccc12
6655	Cc1ccc(-c2ccc(I)cc2)cc1I
6656	O[C@H](I)[C@@H]1CS[C@H](I)O1
6657	Ic1cccc2c1-c1c(I)cccc1/C=C\\C/C=C\\2
6658	I/C1=C/NCCC/N=C/C(I)=C\\NCCC\\N=C/1
6659	CCc1ccc2oc(I)c(I)c2c1
6660	Cc1ccc(C)c2c1[C@@H](I)c1ccccc1[C@H]2I
6661	Ic1ccc2c(c1)oc1ccc(I)cc12
6662	CCc1cc(I)c(C)c(I)c1
6663	IN=C1CNCC(NI)=N1
6664	C[C@H]1C[C@@H](O)[C@H](CI)[C@H]1I
6665	C[C@H]1CC[C@]2(C)C(I)=CCC[C@@H]2[C@]1(C)CI
6666	C#CC1C(I)=CN(c2ncccn2)C=C1I
6667	CC1(C)CCC[C@@]2(C)[C@@H]1CC=C(I)[C@@]2(C)I
6668	Ic1cc(I)c(N2CCCCC2)s1
6669	Cc1sc(I)cc1I
6670	I[C@@H]1[C@H](I)C12c1ccccc1-c1ccccc12
6671	Cl/C1=C(\\I)C/C(I)=C(/Cl)CCC1
6672	Brc1sc(Br)c(I)c1I
6673	CN1CCCc2cc(I)cc(I)c21
6674	C=C(I)[C@@H]1C/C=C(/C)CC/C=C(/I)CC1
6675	CC(C)(C)c1ccc(I)c(I)c1
6676	I[C@H]1C[C@H]2[C@@H]3OO[C@@H](O3)[C@H]2[C@@H]1I
6677	I[C@H]1C[C@H]1I
6678	IC12CCCCC1(I)CCCC2
6679	OCc1cnc(I)c(O)c1I
6680	IN1C=C([C@H]2c3ccccc3CCN2I)CCCC1
6681	IC[C@H]1CCC[C@H]1I
6682	Cl[C@]1(I)[C@H]2CC=CC[C@H]2[C@@](Cl)(I)[C@@H]2CC=CC[C@@H]21
6683	CC1=C(C)C[C@@H](I)[C@@H](I)C1
6684	Clc1ccc2[nH]c(I)c(I)c2c1
6685	CC1(C)OCc2c(I)cnc(I)c2O1
6686	C[C@@H]1CC[C@H](I)[C@H]1CI
6687	Clc1cc2nc(I)c(I)nc2cc1Cl
6688	IC[C@H]1CCc2cccc(I)c21
6689	CC1(C)C(I)=C(Cl)NC(Cl)=C1I
6690	CC1(C)CC[C@H](O)[C@@]2(C)[C@H](I)C(I)=CC[C@H]12
6691	Ic1cnc2c(I)sc3cc(-c4ccccc4)nc1-n-3-2
6692	O=C1c2cc(O)c(I)c(O)c2C(=O)c2cc(O)c(I)c(O)c21
6693	C[C@H]1C(=O)O[C@@H]2/C=C(/I)CC/C=C(/I)CC[C@@H]21
6694	I[C@H]1CCC[C@H](I)CCC1
6695	COc1c(C)c(O)c(I)c(I)c1O
6696	ClC1=C(I)CC(I)=CN1
6697	Ic1cc(I)c(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)s1
6698	C#CC1C(I)=CN(CC)C=C1I
6699	C[C@]12CC[C@](O)(CC[C@@]1(C)CI)[C@@]2(C)I
6700	Brc1c(I)[nH]c(I)c1Br
6701	N#CC1=C(c2ccc(Cl)cc2)[C@@H](I)S/C1=C/I
6702	Ic1cnc2ncc(I)cc2c1
6703	CN(I)c1ccccc1I
6704	Ic1cccc2c1Oc1cccc(I)c1O2
6705	C/C(I)=C/C=C(\\C)I
6706	Ic1nnc2ccccc2c1I
6707	IO[C@H]1Cc2ccccc2N(I)C1
6708	Clc1sc(Cl)c(I)c1I
6709	CC(=O)O[C@@H]1CC[C@@H]2C[C@]2(I)[C@@H]1I
6710	COC(=O)C1=C(C)C[C@@H]2[C@@H]1C=C(I)[C@]1(I)C[C@]21C
6711	Cc1cc(I)c(S(=O)(=O)C(C)(C)C)c(I)c1
6712	Cc1cc(N(C)C)c(I)c(C)c1I
6713	IC/C=C1\\C=CC=C1I
6714	IC1=C(I)[C@@H]2C=C[C@H]1c1cc3ccccc3cc12
6715	CC(C)(C)N1CN(I)CN(I)C1
6716	IC1=Cc2ccccc2N(I)c2ccccc21
6717	CCn1c(Cl)c(I)c2cccc(I)c21
6718	Ic1cscc1-c1ccsc1I
6719	Cc1ccc2c(ccc3c(I)c(C)c(I)n32)c1
6720	Ic1ccc2nc3ccccc3c(I)c2c1
6721	IC1=C2c3cc4c(cc3CCN2[C@H]2O[C@@H]1N1CCc3cc5c(cc3C1=C2I)OCO5)OCO4
6722	I[C@H]1CCC[C@@H]1[C@H]1CCC[C@H]1I
6723	Cc1cc(-c2cc(C)sc2I)c(I)s1
6724	CC[C@@]12CCCn3c(I)c(I)c(c31)-c1ccccc1N=C(O)CC2
6725	Cc1cc2c(cc1I)[C@@H]1c3ccccc3[C@H]2c2ccc(I)cc21
6726	Ic1ccn(-n2cccc2I)c1
6727	CN1[C@@H](I)C=C[C@H]1I
6728	IC1=CC[C@H](I)CC1
6729	IN1CCN(I)[C@H](c2ccccc2)c2ccccc2C1
6730	CC(=O)O[C@@H]1[C@H]2CC(C)(C)C[C@H]2[C@@]2(C)C[C@@]2(I)[C@H]1I
6731	CCOC(=O)N1C[C@H](I)CC[C@H]1I
6732	C=C1[C@@H](C)CC[C@]2(C)[C@@H]1CC=C(I)[C@@]2(O)I
6733	Cc1[nH]c2c(c1I)C(Cl)=C(I)CC2
6734	O/C=C1\\C(I)=CC(I)=C1C1C=CC=CC=C1
6735	Cc1cc(C)c2cc(I)c(I)c-2c(C)c1
6736	Cc1c(I)n(I)c2c(Cl)cc(Cl)cc12
6737	I/C=C/c1cccc(I)c1
6738	Ic1sc(I)c2c1Nc1ccccc1N2
6739	C[C@H](I)C#C/C=C/[C@@H](C)I
6740	Ic1cnc2c(I)sc3cccc1-n-3-2
6741	Cc1cccc2oc(I)c(I)c12
6742	INc1cc2ccccc2nc1I
6743	CN1C[C@@H](I)[C@H](OI)[C@@H]2c3ccccc3CC[C@H]21
6744	Clc1cc(N2CCN(I)CC2)ccc1I
6745	Cc1cc(C(C)(C)C)cc(C)c2c(I)c(I)cc1-2
6746	IC1=C(I)/C=C\\C=C/C=C1
6747	C=C(I)[C@@H]1C[C@H](O)C(C)=C1I
6748	I/C1=C/Nc2ccccc2N=C/C(I)=C\\Nc2ccccc2N=C1
6749	COc1c(I)cc(I)c(O)c1C
6750	CC(C)(I)/C=C/I
6751	CC1=C(I)C(=O)N2C(=C(I)CC[C@@H]2C)N1
6752	Oc1nc2c(ccc3c(O)c(I)c(O)nc32)c(O)c1I
6753	Ic1cc(I)c2ccc3cccc4ccc1n4-n32
6754	Fc1ccc2c(I)c3ccccc3c(I)c2c1
6755	Cc1cc(-c2cc(C)c(I)s2)sc1I
6756	COC(C#CI)(C#CI)c1ccc(C(C)(C)C)cc1
6757	CC1(C)C2C3C(C)(C)C4(O)C(=O)C3(I)C4(Cl)C3(Cl)C(=O)C1(O)C23I
6758	Ic1cc(I)cc([C@@H]2O/C=C\\c3occc3O/C=C/c3occc3O2)c1
6759	C[C@@]12CCC(=O)C[C@@]1(/C=C/I)CC[C@H]1[C@@H]2CC[C@@]2(C)[C@@H](I)CC[C@H]12
6760	Ic1ccc2c(c1)CC[C@H]1CCc3cc(I)ccc3[C@H]21
6761	Ic1c[nH]c2ccc3[nH]cc(I)c3c12
6762	C[C@@H]1CCC[C@@](C)(I)[C@H]1I
6763	O=C1OCC[C@@H]1n1c(I)ccc1I
6764	Oc1cc(Br)c(I)cc1I
6765	COc1cc2c(cc1I)C(Cl)=C(I)C(C)(C)O2
6766	Ic1cc2cccc3cccc(cc1I)c32
6767	Cn1ncc(I)c1NI
6768	C[C@]1(O)C[C@@]23CC[C@@H]4[C@](C)(I)CCC[C@@]4(I)[C@@H]2CC[C@@H]1C3
6769	C[C@H](I)[C@H]1CC[C@@H](C)[C@@H]1I
6770	C[C@@H]1CN(I)CCN1I
6771	C[C@]12CCC[C@@H](I)[C@H]1N(I)c1ccccc12
6772	Ic1c2cccccc2n2c(I)c(-c3ccccc3)nc12
6773	CC[C@]1(I)CC=C(I)CC1
6774	O/C=C(\\I)NI
6775	I/C=C/[C@H]1C=CC=C1I
6776	Ic1cc(-c2cc(I)on2)no1
6777	Ic1c2c(c(I)c3ccccc13)-c1cccc3cccc-2c13
6778	CC1(C)C=C[C@@H](O)[C@]2(C)[C@H](I)C(I)=CC[C@H]12
6779	C/C(I)=C/CI
6780	CC(C)(C)S(=O)(=O)c1c(I)cccc1I
6781	Ic1ccc(-c2ccc(I)s2)[nH]1
6782	CC1(C)CCC[C@@]2(C)[C@H]1CC[C@]1(C)[C@@H](I)C(I)=CC[C@H]21
6783	CC(C)(I)C#C/C=C\\C#CC(C)(C)I
6784	Ic1ccc2c(ccc3nc(I)ccc32)n1
6785	CCn1c(I)ccc1I
6786	C[C@@H]1CC[C@H]2C(C)(C)[C@H](O)[C@@H](O)C[C@@]2(C)[C@@]12Cc1c(O)cc(I)c(I)c1O2
6787	Sc1c(I)cccc1I
6788	Ic1c2ccccc2c(-c2c3ccccc3c(I)c3ccccc23)c2ccccc12
6789	CC1=CC(=O)[C@]23CCC[C@]12[C@@H](I)C[C@@]3(C)I
6790	Ic1ccsc1I
6791	Ic1cnc2c(I)sc3cc(-c4ccccc4)cc1-n-3-2
6792	I[C@H]1[C@H]2CC3=C(C[C@H]12)C[C@H]1[C@@H](I)[C@H]1C3
6793	IC1(C#CC2(I)CC2)CC1
6794	C[C@]1(I)CCCC[C@]1(C)CI
6795	Ic1ccnc(I)c1
6796	Oc1c(Cl)c2c(O)c(Cl)c1N(I)CCCCCCCCCCCCN2I
6797	Oc1c(I)cc(I)c(O)c1Br
6798	O=C(c1ccccc1I)N1CCC[C@H]1I
6799	I/C=C/c1ccc(I)s1
6800	Ic1c(I)c2ccccc2c2ccccc12
6801	Cc1cc2ccccn2c2c(I)cc(I)c1-2
6802	Fc1ccccc1C1C(I)=CNC=C1I
6803	I[C@@H]1[C@H]2CC[C@H](c3ccccc32)[C@H]1I
6804	I[C@H]1CC/C=C\\CC/C=C\\CC[C@@H]1I
6805	I[C@H]1C(c2ccccc2)[C@@H]1I
6806	C[C@H]1C=C(I)[C@@H](I)[C@H](O)[C@@H]2CC(C)(C)C[C@H]12
6807	IC1=C/C=C2/C=C\\C(=C1I)CCc1ccc(cc1)CC2
6808	C[C@@]1([C@@H]2CC[C@@]3(C)[C@H](CC[C@@]3(C)O)[C@H]2I)C=CC(=O)C=C1I
6809	I[C@H]1C[C@@H](I)[C@H]2CCC[C@@H]12
6810	O=c1c(O)c(I)oc(CCl)c1I
6811	CC1=C(I)C(C)(C)[C@@H](I)CC1
6812	C/C=C1/CN(I)[C@@H]2C[C@H]1[C@@H](C(=O)OC)[C@]13CC(=O)O[C@]21N(I)c1ccccc13
6813	Cc1cc2cc(I)c1CCc1c(C)cc(cc1I)CC2
6814	CC(=O)SC1CN(I)N(I)C1
6815	CC1(C)CCC[C@](C)([C@@H]2[C@H]3C[C@H]4C[C@]2(I)C[C@@]4(C)O3)[C@H]1I
6816	Cc1cc(C)c(I)c(-c2cc(C)cc(C)c2I)c1
6817	CC1(C)CCC[C@@]2(C)[C@H]1[C@@H](O)C=C(I)[C@]2(O)I
6818	Ic1cc2cc3cc(I)sc3cc2s1
6819	COC(=O)[C@]1(C)CC[C@H]2[C@@]3(C)CCC[C@@](C)(I)[C@@H]3CC[C@@]2(I)C1
6820	Brc1ccc2[nH]c3c(c2c1)CCN(I)[C@H]3[C@H]1CCCN1I
6821	CC1=C(I)C(C)(C)CC[C@H]1I
6822	Cc1ccc(I)c(C)c1I
6823	C/C=c1\\c2c(/c(=C\\C)c3c1[C@H](C)C[C@@H](I)[C@@H]3C)[C@H](C)[C@H](I)C[C@@H]2C
6824	CC(=O)Oc1c(Br)c(Br)c(I)c(I)c1Br
6825	CN1C=C(I)[C@@H]2C[C@H]1C(I)=CN2C
6826	C/C(I)=C/c1ccc(I)o1
6827	Oc1ccc2c(I)cc(I)nc2n1
6828	C[C@]12CCC(=O)C=C1CC[C@H]1[C@@H]3CC[C@H](C(=O)I)[C@]3(I)C[C@@H](O)[C@@H]12
6829	SC1=NCCN=C(S)Nc2ccccc2N(I)CCN(I)c2ccccc2N1
6830	Ic1c2c(cc3c1CC1(C3)Cc3cc4c(c(I)c3C1)CCC4)CCC2
6831	Cc1c2cc(I)c(c1C)CCc1c(I)cc(c(C)c1C)CC2
6832	CC(C)(C)c1ccc2c(I)c3ccccc3c(I)c2c1
6833	CC(C)(C)S(=O)(=O)c1cc(I)sc1I
6834	IC1=Cc2ccccc2C=C(I)O1
6835	O=C1c2ccccc2-c2c(I)ccc(I)c21
6836	IN1CCOCCN(I)c2ccccc2NCCOCCNc2ccccc21
6837	I[C@]12CCCC[C@@]1(I)C2
6838	Cc1cc2c(cc1C)[C@H](I)c1ccccc1[C@@H]2I
6839	Ic1ccc2nc(I)cn2c1
6840	IC1=CC=CC=C(C2=CC=CC=C(I)C2)C1
6841	C/C=c1/c2c(c3c(/c1=C\\C)[C@@H](C)C[C@H](I)[C@H]3C)[C@H](C)[C@H](I)C[C@@H]2C
6842	Ic1nc2c(I)nn(-c3ccccc3)c2o1
6843	Ic1ccc2c(c1)[nH]c1cc(I)ccc12
6844	COc1cc(I)c2c(c1C)OC(=O)c1c(C)c(Cl)c(O)c(I)c1O2
6845	COc1ccc2c(c1I)Oc1ccc(O)c(I)c1O2
6846	CC(C)/C(I)=C/I
6847	IC1=C(I)[C@H]2c3ccccc3[C@@H]1c1ccccc12
6848	O[C@H]1CC[C@H]2[C@@H]1[C@@H](I)[C@@H]2OI
6849	Oc1c(I)cc(C(F)(C(F)(F)F)C(F)(F)F)cc1I
6850	Cc1cc(N(C)C)c(I)cc1I
6851	I[C@H]1[C@H]2CC=CC[C@@H]2[C@@H](I)[C@@H]2CC=CC[C@@H]12
6852	IC1C2C3CC4C2C(I)C2C5CC(C12)C1C3C4C51
6853	I[C@H]1OC2(CCCCC2)O[C@H]1[C@H]1OC2(CCCCC2)O[C@@H]1I
6854	CS[C@@]1(I)C[C@H]1I
6855	CC1(C)C=C(c2ccc(I)s2)CC(C)(C)N1I
6856	Cc1c(I)c2sccn2c1I
6857	I/C=C/C1=CC2=CC=CC=C3C=C(I)[C@@H]1C[C@H]32
6858	I[C@@]12CC=CC[C@@]1(I)C2
6859	CC1(C)CC2(CC(C)(C)c3cc(I)ccc32)c2ccc(I)cc21
6860	ClC1=C(I)CCc2cc3c(cc21)-c1cc2c(cc1CC3)CCC(I)=C2Cl
6861	CN1C(Cl)=C(I)C(C)(C)C(I)=C1Cl
6862	C[C@H](I)[C@@H]1O[C@@H](I)[C@H]2OC(C)(C)O[C@H]21
6863	I[C@H]1C[C@@H](c2ccccc2)[C@@H](I)[C@]23OCCO[C@]12OCCO3
6864	O=C1CC[C@@H]([C@@H]2CCC(=O)[C@H](I)C2)C[C@@H]1I
6865	Ic1ccc2ccc3ccc4ccc5ccc6ccc(I)cc6c5c4c3c2c1
6866	IC1=C(I)[C@H]2C=C[C@@H]1C2
6867	Cc1sc(C)c2cc(I)c(I)cc12
6868	IC1=C[C@H]2[C@H]3C=C[C@@H]1C(I)=C[C@@H]23
6869	I[C@H]1C[C@@H]1[C@H]1C[C@@H]1I
6870	IC12CCCC(I)(C1)C2
6871	OC(/C=C/I)=C/I
6872	IC1=C(C2=C(I)CCCCC2)CCCCC1
6873	CCn1c(C)c(I)c(I)c1C
6874	IC1=C(I)[C@@H]2C=C[C@@H]3[C@H]1[C@@H]3C=C2
6875	FC(F)(F)c1cccc(-c2c(I)c(Cl)nc(Cl)c2I)c1
6876	Ic1ccccc1-c1cc2c(ccc3ccccc32)cc1I
6877	CC1(C)C/C=C(/I)CC/C=C(/I)C[C@H]2O[C@@H]21
6878	CC(O)=Nc1sc(I)cc1I
6879	C[C@]1(I)CCC[C@]2(C)[C@H]1CC[C@]1(I)OC(=O)CC[C@@H]12
6880	C[C@]12OO[C@H](O1)[C@@H]1C[C@H](I)[C@@H](I)[C@@H]12
6881	Cc1cc2c(ccc3sc(I)c(-c4c(I)sc5ccc6sc(C)cc6c45)c32)s1
6882	I/N=c1/c2ccccc2c2nc3c(nc12)/c(=N\\I)c1ccccc13
6883	Ic1sc(-c2cc(C#Cc3ccccc3)c(I)s2)cc1C#Cc1ccccc1
6884	Ic1cn(-c2ccccc2)cc1I
6885	Oc1cc(Cl)c(I)c(O)c1I
6886	COc1c(C)c2c(c(I)c1Cl)Oc1c(I)c(O)c(Cl)c(C)c1C(=O)O2
6887	Cc1[nH]c2c(c1I)Sc1[nH]c(C)c(I)c1S2
6888	O/C=C(I)/C(I)=C/O
6889	Ic1cc2ccccc2c2c1OCOc1c(I)cc3ccccc3c1-2
6890	C#CC1C(I)=CN(c2ccc(C)cc2)C=C1I
6891	Cc1c(I)cc(I)n1C
6892	C#CC1C(I)=CN(c2ccccc2C)C=C1I
6893	CN(C)c1cc(Cl)c(I)cc1I
6894	Ic1cccc2c1[C@@H]1c3ccccc3[C@H]2c2c(I)cccc21
6895	Ic1ccncc1I
6896	Ic1ccc2ccc3ccc4ccc5ccc6ccc(I)c7c6c5c4c3c2c1-7
6897	OC(=NI)c1ccc2c(c1I)Oc1ccccc1O2
6898	C#CC1C(I)=CN(c2cc(C)cc(C)c2)C=C1I
6899	CN1C=CC(=C2C=C(I)S(=O)(=O)C(I)=C2c2ccccc2)C=C1
6900	IC1=CCC=C1I
6901	Ic1c2c(cc3c1CC1(C3)Cc3cc4c(c(I)c3C1)CCCC4)CCCC2
6902	Cc1c(I)ccc2c(I)cccc12
6903	CC1=C(I)[C@@H]2[C@H](C(C)C)CC[C@@]1(C)[C@@H]2I
6904	Cc1ccc(C)c2cc(I)c(I)cc12
6905	Clc1ccc2c(c1)[C@@H](I)c1ccccc1[C@H]2I
6906	IC1=CC=C[C@@H]1I
6907	ClC1=C(I)C[C@@H]2C(I)=CC[C@H]12
6908	I[C@@H]1[C@@H](C2(I)CC2)[C@@H]2C=C[C@H]1C21CC1
6909	Ic1c2ccccc2cc2c(I)c3ccccc3cc12
6910	I[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1I
6911	CC1(C)C[C@@H]2C=C(I)[C@]3(I)C[C@]3(C)[C@H]2C1
6912	I[C@H]1c2ccccc2[C@@H](I)c2cc3ccccc3cc21
6913	I[C@H]1C[C@@H](I)C1
6914	Clc1ccc2c(c1)C(I)=C(I)c1ccccc1C2
6915	Ic1cc(I)c2c(c1)CCCCC2
6916	O/C=C1\\C=C(I)CC(I)=C1Cl
6917	Cc1c(-c2csc(I)c2C)csc1I
6918	C[C@]1(O)c2ccoc2[C@@H](O)[C@](C)([C@]2(O)CCCC[C@H]2I)[C@@H]1I
6919	C#CC1C(I)=CN(C(=O)c2ccccc2)C=C1I
6920	Ic1cnc2c(I)sc3nc(-c4ccccc4)cc1-n-3-2
6921	CC(=O)O[C@H]1C[C@@H](C)[C@@H](I)[C@@]2(O)[C@@H]1C(C)(C)C[C@]2(C)I
6922	CC(C)(C)c1cc(I)c(I)o1
6923	Br[C@@H](I)/C=C\\I
6924	O=C(OI)OI
6925	Ic1cccc2c1-c1cccc(I)c1-2
6926	I[C@@]12CCC[C@@]1(I)C2
6927	CSc1cc(I)cc(I)c1
6928	C/C(C#C/C(C)=C/I)=C\\I
6929	IC1=C(I)[C@H]2C=C[C@@H]1CC2
6930	Oc1ccc(I)c(I)c1I
6931	IC[C@]12CCCN3CC[C@@H]4c5ccccc5N(I)[C@]4(CC1)[C@@H]32
6932	C[C@]12CCCC(I)=C1N(I)c1ccccc12
6933	I[C@]12C=C[C@](I)(OO1)O2
6934	IC1=CC2=CC3=CC4=CC=CC=C(C=C(C=C(C=C(I)C1)C2)C3)C4
6935	CC(=O)n1cc(I)c2c3[nH]cc(I)c3ccc21
6936	O=C(I)[C@H]1CC2(C[C@@H]1I)OCCO2
6937	INc1cc2c(cc1I)OCO2
6938	I[C@H]1C[C@@H](I)[C@@H]2CC=C[C@H]12
6939	Cc1ccc(-c2cc(I)cc(I)c2)cc1
6940	O[C@H]1C[C@@H](O)[C@@H](I)[C@@H]1CI
6941	Cc1cc(Br)c2c(c1)c(C)c(I)n2I
6942	C=C(I)[C@H]1CC[C@H](C)[C@H]1I
6943	CC(C)(I)[C@@H]1C[C@H](I)c2ccccc21
6944	IN1C=C([C@@H]2CCCN2I)CCC1
6945	IN1c2ccccc2N(I)c2nc3ccccc3nc21
6946	IC1=NNc2c(I)nn(-c3ccccc3)c2O1
6947	IC1=C(C2=C(I)CCC2)CCC1
6948	Oc1c(Br)cc(Br)c(/C=C\\I)c1I
6949	C#C[C@]1(OI)CC[C@H]2[C@@H]3CC[C@H]4Cc5oc(I)cc5C[C@@]4(C)[C@H]3CC[C@]21C
6950	Clc1ccc(-c2c(I)c3sc4ccccc4n3c2I)cc1
6951	CC[C@@]1(I)CCCN2CCc3c(n(I)c4ccccc34)[C@H]21
6952	C#CC1C(I)=CN(C(C)=O)C=C1I
6953	Oc1c(I)ccc2cccc(I)c12
6954	Ic1coc(-c2ccc3c(c2)OCO3)c1I
6955	CC1(C)C[C@H]2C=C(I)[C@@]3(I)C[C@@]3(C(=O)OC(C)(C)C)[C@@H]2C1
6956	C/C=C1/CN(I)[C@H]2C[C@@H]1[C@@H](C(=O)OC)[C@]13C[C@H](O)O[C@]21N(I)c1ccccc13
6957	FC(F)(F)c1ccc(I)c(-c2cc(C(F)(F)F)ccc2I)c1
6958	CC/C(I)=C/I
6959	Ic1nc(-c2csc(I)n2)cs1
6960	CC1=C(I)[C@@](C)(I)CCC1
6961	Cc1c(I)cc(I)c(O)c1C
6962	C[C@@H]1CC[C@H](CI)[C@@H]1I
6963	IC1=CO[C@@H]2O[C@H]1OC=C2I
6964	Cc1ccc(C)c2c1C[C@@H](OI)[C@H]1[C@H]2[C@@]2(O)OC[C@]1(I)[C@H](C)[C@@H]2O
6965	CC1=C(I)C=C(I)/C1=C\\O
6966	Ic1cccc2c1Oc1c(I)cccc1N2
6967	CCc1cc(I)cc(I)c1
6968	I/C=C(/I)c1cccs1
6969	C[C@@H]1CCC[C@](C)(I)CCC2=C1[C@@](C)(CI)CC2(C)C
6970	CC(C)(I)[C@H]1CCC[C@H]1I
6971	C#CC1C(I)=CN(C)C=C1I
6972	Ic1c[nH]nc1I
6973	CN1c2ccccc2C(I)=C(N2CCN(I)CC2)c2sccc21
6974	CC(=O)O[C@H]1CC[C@]2(C)C[C@]2(I)[C@H]1I
6975	Cc1cccc2c(I)c(I)oc12
6976	Cc1cc2c(cc1C)Nc1c(I)sc(I)c1N2
6977	I/C=C\\C(I)I
6978	Cc1cc(-c2cc(C)c(I)[nH]2)[nH]c1I
6979	CCC1=C(I)[C@H](I)[C@H](O)CC1
6980	CC(C)(C)C(=O)c1cc(I)[nH]c1I
6981	N#Cc1ccc2c(I)cnc3c(I)sc1-n-2-3
6982	CC1(C)C(=O)[C@@H](I)[C@H](I)C1=O
6983	Brc1cc(I)oc1-c1oc(I)cc1Br
6984	IN1CCN(I)c2ccccc21
6985	Fc1cccc2c(I)c3ccccc3c(I)c12
6986	CC(=O)O[C@H]1[C@]2(O)CC(C)(C)CC2=C(I)[C@@]2(I)C[C@@]12C
6987	CC1(C)O[C@@H](I)[C@H]2[C@H](C(=O)I)C(=O)c3ccccc3[C@]2(C)O1
6988	Ic1c2ccccc2c(I)c2ncccc12
6989	I[C@]12CCCC[C@@]1(I)CC2
6990	CC(=O)[C@@H]1C(C)(C)C[C@]2(C)C[C@H](I)C[C@]12I
6991	I[C@H]1[C@H]2CC[C@H](C2)[C@H]1I
6992	Clc1cc(I)ccc1-c1ccc(I)cc1
6993	CN1C=C(I)C=C[C@H]1c1c(I)[nH]c2ccccc12
6994	CC1=C(I)C(C)(C)[C@]2(CC1)OC(C)(C)O[C@H]2[C@H]1CCCC[C@H]1I
6995	Cn1cc(I)c2nc3c(I)cnc(O)c3c(-c3ccccc3)c2c1=O
6996	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)[C@H](I)C[C@H]3C)[C@@H](C)[C@@H](I)C[C@@H]2C
6997	C#CC1C(I)=CN(C(C)(C)C)C=C1I
6998	Clc1cccc2c1[C@H](I)c1ccccc1[C@H]2I
6999	C[C@H]1[C@@H](O)C[C@@H]2C(C)(C)[C@H](O)CC[C@@]2(C)[C@]12Cc1c(O)cc(I)c(I)c1O2
7000	COc1cc(I)c(I)c2c1C[C@@]1(O2)[C@H](C)CC[C@@H]2C(C)(C)C=CC[C@]21C
7001	C#CC1C(I)=CN(c2nc(C)cc(C)n2)C=C1I
7002	Cc1c2ccc3ccc4c(I)cc(ccc5cc(I)c(cc2)c1c5C)c(C)c4c3C
7003	Ic1c[nH]c(-c2nc(I)c[nH]2)n1
7004	CC(=O)O[C@H]1C=C(I)[C@](O)(I)[C@]2(C)CCCC(C)(C)[C@H]12
7005	Ic1ccc2cc1CCc1ccc(I)c(c1)CC2
7006	O[C@H]1C[C@@H](I)O[C@@H](CI)[C@@H]1O
7007	Clc1ccc(I)c(-c2cc(Cl)ccc2I)c1
7008	O=C1c2ccccc2O[C@@H](OI)N1I
7009	Cc1c(I)c(-c2ccccc2I)cc2ccccc12
7010	COc1c(I)sc2c(I)c3cccccc-3c12
7011	I[C@H]1C[C@H](I)c2c1ccc1cc[nH]c21
7012	COc1cc(O)c(I)c(O)c1I
7013	Cn1cc(I)c2nc3c(I)cn(C)c(=O)c3c(-c3ccccc3)c2c1=O
7014	Cc1cc(C)cc2c(I)cc(I)c-2c1
7015	Clc1ccc2c(c1)N(I)Cc1ccccc1CN2I
7016	CC(=O)O[C@H]1[C@@H]2C=C(I)[C@]3(I)C[C@]3(C)[C@@H]2CC1(C)C
7017	CC(C)(C)N(I)/C=C/I
7018	Ic1cc(I)cc([C@H]2OC=Cc3occc3O2)c1
7019	C[C@@H](I)N(C)I
7020	IC[C@H]1C=C[C@H]2[C@H]1[C@@H]2I
7021	CC1(C)O[C@@H]2[C@H](I)C[C@@H](I)[C@@H]2O1
7022	Cc1cc(Cl)c2c(c1)c(C)c(I)n2I
7023	Clc1cccc2c(I)c(I)oc12
7024	Oc1c(Br)cc(I)c(O)c1I
7025	COc1c(I)c2c3c(c1I)O[C@@]1(C[C@H]3CC(C)(C)O2)[C@H]2CC[C@H](C2)C1(C)C
7026	Cc1ccc(-c2cc(I)cc(I)c2C)cc1
7027	CC(C)[C@@H]1CC[C@]2(C)[C@H](I)[C@H]1[C@H](I)[C@]2(C)O
7028	CC(C)(C)/C(C#CC#C/C(=C/I)C(C)(C)C)=C\\I
7029	IO[C@@H]1C[C@@H]1I
7030	O=c1c(I)cnc2c(I)c3cccccc3n12
7031	I[C@H]1[C@@H]2CC[C@@H](O2)[C@H]1I
7032	Ic1cc(-c2cc(I)c3ccccc3n2)nc2ccccc12
7033	Ic1cc2ccc3[nH]cc(I)c3c2[nH]1
7034	Cc1c(I)c2cc(c1I)CCc1cccc(c1)CC2
7035	IO[C@H]1CC[C@@H]2CN3CCc4c([nH]c5ccccc45)[C@@H]3C[C@@H]2[C@@H]1I
7036	Ic1ccc2c(c1)C1(c3ccccc3-2)c2ccccc2-c2ccc(I)cc21
7037	I[C@H]1[C@@H]2C=C[C@@H](C2)[C@H]1I
7038	IC[C@@H]1c2ccccc2CCN1I
7039	CC1=C(C(=O)O)[C@@H]2C=C(I)[C@@]3(I)C[C@@]3(C)[C@@H]2C1
7040	IN1C=C([C@H]2CCCN2I)CC1
7041	C[C@@]12C(=O)[C@@](C)(C(=O)C(I)=C1O)[C@@]1(C)C(=O)[C@]2(C)C(=O)C(I)=C1O
7042	Clc1c(I)c[nH]c1I
7043	CC(C)(C)[C@H]1CN(I)c2ccccc2N1I
7044	Oc1c(Br)c(Br)c(I)c(I)c1Br
7045	Cn1c2ccccc2c2nc3c(nc21)N=C(O)N1[C@@H](I)O[C@@H](I)CO[C@H]31
7046	CC(=O)O/C(I)=C(\\Br)I
7047	Ic1ccc(-c2ccc(I)o2)o1
7048	Cc1c2cc(I)c(c1C)CCc1cc(I)c(c(C)c1C)CC2
7049	Ic1ccccc1-c1ccc2c(I)cccc2c1
7050	O=c1sc2c(s1)SC(I)=C(I)S2
7051	CC1=C(I)[C@@](C)(I)c2ccccc21
7052	Fc1cccc2c(I)c3c(F)cccc3c(I)c12
7053	C#CC1C(I)=CN(c2cccc3ccccc23)C=C1I
7054	Cc1ccc2cc(-c3ccccc3I)c(I)c3c2c1CC3
7055	Cc1cc(Br)c2[nH]c(I)c(I)c2c1
7056	Ic1cccc2sc3cccc4cc(I)n(c12)c43
7057	CC1(C)/C=C\\C/C(I)=C\\CC/C(I)=C\\C1
7058	Ic1ccccc1-c1cccnc1I
7059	CC(=O)[C@@]1(C)[C@@H]2CC(C)(C)C[C@]2(I)C[C@H]1I
7060	Br/C(I)=C\\I
7061	N#C/C(I)=C\\CI
7062	C[C@@H]1CCc2c(cc(I)c(F)c2I)N1
7063	OC(/C=C\\I)=C/I
7064	I/C1=C/C2=Cc3ccccc3C=C(/C=C(/I)C1)C2
7065	Oc1c(I)cc(I)c2c1CCC2
7066	Cc1c(I)n(I)c2c(C)cc(Cl)cc12
7067	SC1=NCCCCN=C(S)Nc2ccccc2N(I)CCN(I)c2ccccc2N1
7068	I[C@@]12O[C@@H]3CC[C@H]4[C@@H]3[C@@H]1[C@H]1[C@H]3[C@@H]2[C@@H]2CC[C@H]5O[C@](I)([C@@H]3[C@H]52)[C@@H]14
7069	I[C@H]1[C@H]2[C@@H](I)[C@@H]12
7070	Ic1cccc2ccc3c4ccccc4cc(I)c3c12
7071	Ic1cc(I)c(I)[nH]1
7072	Cc1cc2c(cc1I)CC1(C2)Cc2cc(C)c(I)cc2C1
7073	I[C@]12O[C@@]1(I)[C@H]1C[C@@H]2c2ccccc21
7074	Ic1ccc2ccc(I)nc2c1
7075	C=C(I)[C@@H]1CC[C@@]2(C)CCCC(I)=C2C1
7076	CN1C=C(I)C=C[C@@H]1c1c(I)n(C)c2ccccc12
7077	Cc1ccc2c(I)c3ccccc3c(I)c2c1Cl
7078	C=C1[C@@H](O)CC[C@@](C)(I)[C@H]1I
7079	IC1=C(I)SC(=C2SC3=C(SCCS3)S2)S1
7080	IC#Cc1ccc(C#CI)s1
7081	Oc1c(I)cc(I)cc1CCl
7082	CC1(C)C[C@H]2[C@@H](C1)[C@H]1O[C@]2(C)CC(I)=C1I
7083	I[C@H]1CCCC/C1=C1/CCCC[C@H]1I
7084	OC(=NI)N=C(O)NI
7085	Oc1ccc2c(O)c(I)ccc2c1I
7086	I[C@H]1CCCCCCCC[C@@H](I)CCCCCCCC1
7087	C=C1CC[C@H]2[C@@H]([C@@H](C(=C)I)[C@@H]1I)C2(C)C
7088	CC1(C)CCC[C@@]2(C)[C@@H]1CC=C(I)[C@]2(O)I
7089	OC1=C(I)CC[C@@H]2C(O)=C(I)CC[C@H]12
7090	IN=C1NN(I)[C@H](c2ccccc2)S1
7091	ClCc1cc(I)cc(I)c1
7092	CC1=C(C)[C@H]2CC=C(I)[C@H](I)[C@@]2(C)CC1
7093	CC1(C)C[C@H]2C[C@]3(Oc4c(I)c(O)c(I)c(c42)O1)[C@H]1CC[C@H](C1)C3(C)C
7094	OC1CN=C(S)Nc2ccccc2N(I)CCN(I)c2ccccc2NC(S)=NC1
7095	Ic1cccc2ccc3cccc(I)c3c12
7096	CC1(C)C(=O)[C@@H]2O[C@@H]2[C@@]2(C)[C@H](I)C(I)=CC[C@H]12
7097	FC(F)(F)c1cc2c(I)cnc3c(I)sc(n1)-n-2-3
7098	Cc1ccc(-c2c(I)c(I)c(Cl)n2C)cc1
7099	O=C1[C@@H](I)C[C@H]2C(=O)[C@H](I)C[C@@H]12
7100	C[C@H]1C[C@@H](I)C[C@H]1I
7101	Ic1c[nH]c2cc3[nH]cc(I)c3cc12
7102	I[C@]12CCC[C@@]1(I)CC2
7103	CO[C@]12OO[C@H](O1)[C@H]1C[C@H](I)[C@H](I)[C@H]12
7104	Ic1c2ccc(ccc3ccc(o3)c(I)c3ccc(ccc4ccc1o4)o3)o2
7105	Ic1ccc(I)n1-c1ccccc1
7106	C/C=C1/CN2CC[C@@]34c5ccccc5N(I)[C@@H]3[C@@H](I)[C@@H]1C[C@@H]24
7107	Ic1cc2c3ccc(ccc1-3)CCc1ccc3c(I)cc(c-3cc1)CC2
7108	CS(C)=C1C(I)=CC=C1I
7109	CC1(C)C(I)=C(Cl)CC(Cl)=C1I
7110	I/C1=C/C2=CC=CC=C(/C=C(/I)CC1)C2
7111	Oc1c(I)cc(I)c2cccnc12
7112	COc1c(I)cc(C(F)(F)F)cc1I
7113	CO[C@@H]1[C@@H](I)CC[C@H]1I
7114	S=c1sc2c(s1)SC(I)=C(I)S2
7115	CC1(C)[C@@H](O)CC[C@]2(C)[C@H](I)C(I)=CC[C@H]12
7116	O=C1c2ccc(I)cc2C(=O)c2cc(I)ccc21
7117	COc1c(C)c(C)c(O)c(I)c1I
7118	Brc1cc(I)[nH]c1I
7119	Oc1c(Br)cc(I)cc1I
7120	CC(C)(C)c1ccc(I)cc1I
7121	CC1=C(I)[C@H]([C@@H](C)I)CC1
7122	CC1(C)[C@@H]2CC[C@H](I)[C@]23C[C@H]1CC=C3I
7123	Cn1c(Cl)c(I)c(I)c1-c1ccccc1
7124	Clc1sc(I)cc1I
7125	Cc1cc(O)c(I)c(C)c1I
7126	Cc1cccc(I)c1-c1cc2ccccc2cc1I
7127	Ic1ccc2sc(I)nc2c1
7128	C/C(I)=C(\\C)I
7129	CC1(C)CCC[C@@]2(C)[C@H](I)C(I)=CC[C@@H]12
7130	Ic1cccc2c1[C@H]1c3ccccc3[C@@H]2c2cccc(I)c21
7131	C=C(C)[C@H]1C[C@](C)(I)C[C@]1(C)I
7132	I[C@H]1[C@H]2c3ccccc3[C@H](I)[C@@H]12
7133	I[C@H]1C[C@@]12C[C@H]2I
7134	COc1ccc2c(C)nn(I)c3ccc(I)c1c23
7135	Oc1c(I)c2c(c3ccccc13)O[C@@H](CI)C2
7136	IC1=CC=CC=C2C(I)=CC=CC=C12
7137	IC1=C(I)[C@]23O[C@H]1C=C2[C@@H]1C=C[C@H]3CC1
7138	IN1C=C([C@H]2c3ccccc3CCN2I)CCC1
7139	COc1c(I)c2c3c(c1I)OC(C)(C)CC3CC(C)(C)O2
7140	IC#Cc1cccc2cc3cccc(C#CI)c3cc12
7141	Clc1ccc2c(c1)[C@@]1(I)CCCC=C1N2I
7142	Brc1cc(N2CCN(I)CC2)ccc1I
7143	Ic1c(-c2ccccc2)c(I)n2c1sc1ccccc12
7144	CCc1c(I)cc(C)cc1I
7145	Cc1ccc(I)c(-c2ccccc2I)c1
7146	COc1c(I)cc(I)c(O)c1O
7147	O=C1c2ccc(Cl)cc2C(=O)c2c1ccc(I)c2-c1c(I)ccc2c1C(=O)c1cc(Cl)ccc1C2=O
7148	IC1=C[C@H]2[C@H]3C=C[C@@H]1C=C(I)[C@@H]23
7149	CN1C[C@H](I)C[C@H]1I
7150	BrC1=C(I)CCC[C@@H]1I
7151	Ic1cc(I)c2cc3ccc4ccc(cc1-2)n43
7152	IC1=CC=CC=C(I)O1
7153	O=C1c2ccccc2C(=O)c2c1c1oc(I)cc1c1cc(I)oc21
7154	CC(C)(I)C#CI
7155	O=C(I)[C@@H](Br)I
7156	CC1(C)C[C@H]2C[C@H](I)[C@]3(I)C[C@]3(C)[C@H]2C1
7157	Ic1nc2ccccc2n1-n1c(I)nc2ccccc21
7158	C#CC1C(I)=CN(C2CCCCC2)C=C1I
7159	I[C@H]1[C@H]2C=C[C@@H]3[C@H]2[C@@H]2[C@@H]1C=C[C@@H]2[C@H]3I
7160	Ic1ccc(I)c2/c1=c1/cccc/c1=C/C=c1/cccc/c1=2
7161	IC1=CC=CC=C(c2cc3cccccc-3c2I)C1
7162	I[C@]12O[C@H](c3ccccc31)[C@H]1c3ccccc3[C@]12I
7163	IC#CCCC#CI
7164	Oc1c(I)sc(I)c1O
7165	Ic1cc(I)cc(-c2ccccc2)c1
7166	Cn1c(Cl)c(I)c2cc(I)ccc21
7167	O=C1O[C@@H]2CC[C@@H](I)[C@@H]2[C@H]1CI
7168	Cc1cc(=O)oc2c(I)c(O)c(CI)cc12
7169	N#Cc1ccc(I)c(I)c1
7170	IC1=C(C2=C(I)CCCC2)CCCC1
7171	C[C@H]1CC[C@H](I)O[C@@H]1[C@H]1O[C@H](I)CC[C@H]1C
7172	IC1=CC(=C2C=CC=CC=C2)C=C1I
7173	C=C1C[C@H](I)C(I)=C2CC(C)(C)C[C@H]2[C@@H]1OC(C)=O
7174	Cc1cc(I)c(C)c2c1[nH]c1ccc(N(C)C)c(I)c12
7175	Ic1ccccc1-c1cc2c(ccc3ccccc32)nc1I
7176	CC(C)(C)OC(=O)n1c2cc(I)ccc2c2ccc(I)cc21
7177	FC(F)(F)[C@]1(I)CC[C@](I)(C(F)(F)F)CC1
7178	Cn1c(=O)nc(O)c2nc(I)c(I)nc21
7179	Oc1ccc2c(c1I)Oc1ccc(O)c(I)c1O2
7180	O=C1CC[C@H]2[C@@H](I)C[C@@H]3CC[C@]12[C@H]3I
7181	CC(=O)[C@H]1[C@H](I)[C@H]2C=C[C@@H]1[C@@H]2I
7182	Ic1ccccc1-c1c(I)c2ccccc2c2ccccc12
7183	COc1cc2c(cc1I)[C@]1(C)CC[C@]3(C)C(Cl)=C(I)CC[C@@]3(C)[C@@H]1CC2
7184	COc1c(O)cc(I)c(I)c1O
7185	Oc1ccc(I)c(Br)c1I
7186	O/C=C1\\C(I)=C(I)c2ccccc21
7187	Cc1ccccc1C1C(I)=CNC=C1I
7188	FC(F)(F)c1cccc(C2C(I)=C(Cl)NC(Cl)=C2I)c1
7189	COc1cc(I)c(Br)c(I)c1
7190	O=C1C=C(I)COc2ccc(I)cc21
7191	C/C=c1\\c2c(/c(=C\\C)c3c1CC[C@H](I)C3)CC[C@@H](I)C2
7192	IC1=C(I)CC1
7193	Brc1cc(I)sc1I
7194	Ic1ccc(I)c2c1Oc1ccccc1O2
7195	Clc1ccc(-n2nnc(I)c2I)cc1
7196	Ic1cc(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)c(I)s1
7197	I[C@]12c3ccccc3[C@@H]3[C@@H]4C[C@@H]4[C@H]1[C@@]32I
7198	Ic1cnc2ccccc2c1I
7199	C/C(I)=C/[C@@H](C)I
7200	Ic1ccc2c(c1-c1c(I)ccc3c1-c1ccccc1-3)-c1ccccc1-2
7201	CC1(C)CCC[C@@]2(C)[C@@H]1C(=O)C=C(I)[C@@]2(O)I
7202	CC(=O)Oc1c(I)cc(C)cc1I
7203	IC1=C2c3ccccc3CCN2[C@@H]2O[C@H]1N1CCc3ccccc3C1=C2I
7204	IC1=CC=C(I)C2=CC=CC=C1C2
7205	IC1=CC2=Nc3ccccc3N=C3C=C(I)[C@H]1C[C@@H]32
7206	O=c1c2cc3c(cc2c(I)c2n1CC[C@@H]2CI)OCO3
7207	I/C=C/c1ccccc1I
7208	CCn1c(Cl)c(I)c2cc(I)ccc21
7209	CC1C[C@@H](I)/C=C\\C=C/[C@H](I)C1
7210	CC1(C)[C@]2(C)N=N[C@@]1(C)[C@H](I)[C@H]2I
7211	O=C1c2ccccc2C(=O)c2c1c(Cl)cc(I)c2-c1c(I)cc(Cl)c2c1C(=O)c1ccccc1C2=O
7212	C[C@@H](I)[C@H]1CCC=C1I
7213	Ic1cccc2c1[C@@H]1c3cc4ccccc4cc3[C@H]2c2c(I)cccc21
7214	Cc1cc(I)c(C)c2c1ccc1ccc3ccc4c(C)cc(I)c(C)c4c3c12
7215	Brc1c(I)sc(-c2sc(I)c(Br)c2Br)c1Br
7216	Ic1ccc(-c2ccoc2I)[nH]1
7217	FC1=C(F)C(I)=C1I
7218	C[C@H](I)[C@@H](C)I
7219	C[C@@H]1OC(=O)[C@H](n2c(I)ccc2I)[C@H]1C
7220	C[C@]12CC[C@@H]3[C@H]4Cc5cc(I)oc5C[C@@H]4CC[C@@H]3[C@H]1CC[C@H]2OI
7221	IC12CCC(I)(C1)C2
7222	Clc1cc(Cl)c(I)c(Cl)c1I
7223	Cc1ccc2c(I)cccc2c1I
7224	IN1CCCN(I)c2ccccc21
7225	Oc1cc(O)c(-c2cc(I)c(O)cc2O)cc1I
7226	CC1(C)[C@@H](I)C[C@H]1CI
7227	C[C@H]1C[C@H](I)C(I)=CC2=C1CC(C)(C)C2
7228	Brc1ccc2[nH]c(I)c(I)c2c1
7229	Oc1c(I)ccc(-c2ccccc2)c1I
7230	IOc1c(I)c2ccccc2c2ccccc12
7231	CC(C)(C)S(=O)(=O)c1c(I)csc1I
7232	Ic1ccc2nc3ccc4nc5ccc(I)cc5cc4c3cc2c1
7349	Clc1cc(Cl)c2c(c1)CCC2
7233	I[C@H]1C[C@@H]2C[C@H]1[C@@H]1[C@H]2[S@@]2=N[S@@]3=NS(=N[S@]1=N2)[C@H]1[C@H]2C[C@H](C[C@@H]2I)[C@H]13
7234	Cl/C=C/C1C(I)=COC=C1I
7235	O=C1CCN(I)C[C@H]1CI
7236	COc1ccc2c(c1)[C@]1(I)CCC[C@@](C)(I)[C@@H]1CC2
7237	Cl/C=C\\C1C(I)=COC=C1I
7238	Ic1cccc2c1[C@@H]1c3cccc(I)c3[C@H]2[C@@H]2Cc3cc4ccccc4cc3C[C@H]12
7239	Cc1c(C)c(I)c2c(c1C)CCc1c(I)c(C)c(C)c(C)c1CC2
7240	Ic1cc(I)c2c(c1)CCCC2
7241	Cc1csc(I)c1I
7242	I/C=C\\C#C/C=C/I
7243	O=c1c(I)cc(I)c2ccccn12
7244	Clc1c(I)cc(I)c2ccccc12
7245	CC1(C)OC[C@@H](CI)[C@@H](I)O1
7246	COc1ccc(I)c2c(O)ccc(I)c12
7247	I[C@H]1C[C@H]2CCC[C@@]2(I)C1
7248	Cc1c2ccc3cc(I)c4ccc(ccc5cc(I)c(cc2)c1c5C)c(C)c4c3C
7249	Ic1ccc2nc3c(ccc4cc5cc(I)ccc5nc43)cc2c1
7250	C=C1CC[C@H]2[C@@](C)(I)CCC[C@@]2(C)[C@@H]1CI
7251	CC(=O)O[C@@H]1CC[C@@H]2[C@H]3C=Cc4c(cc(I)c(Cl)c4I)[C@H]3CC[C@]12C
7252	Cc1ccc2cc(I)c(I)nc2c1
7253	CC(C)(C)Oc1cc(I)sc1I
7254	IN1CCOCCNc2ccccc2N(I)CCOCCNc2ccccc21
7255	Cc1c(I)ccc(I)c1C
7256	Ic1cc2cnncc2cc1I
7257	Ic1cc(I)c(N2CCCC2)o1
7258	CC(C)(C)c1cc(C(C)(C)C)c(I)cc1I
7259	Oc1c(I)ccc(I)c1I
7260	C[C@@H]1CC[C@]2(C)[C@@H](CC=C(I)[C@@]2(O)I)[C@]12CO2
7261	C[C@]1(I)CC[C@H](CI)C1=O
7262	CC1(C)CCC[C@]2(C)[C@H](CI)C(I)=CC[C@H]12
7263	O=S1(=O)[C@H](I)CC[C@H]1I
7264	C/C(I)=C\\[C@H](C)I
7265	COc1ccc(I)c(I)c1O
7266	Ic1cc(I)c2ccc3cccc4ccc1c2c43
7267	O[C@H]1CCN(CI)[C@@H]1I
7268	O=C1C[C@]2(I)C[C@H](CI)CC(=O)[C@@H]2[C@H]2CCCC[C@H]12
7269	CCc1cc(I)c(I)cc1O
7270	O/C=C(I)/C(I)=C\\O
7271	I/N=c1\\c2ccccc2c2nc3c(nc12)/c(=N/I)c1ccccc13
7272	O[C@H]1[C@@H](O)N(I)[C@@H](O)[C@@H](O)N1I
7273	Cc1cc(I)oc1I
7274	CC1(C)O[C@@H](I)[C@H]2[C@H](CI)C(=O)c3ccccc3[C@@]2(C)O1
7275	COC(=O)[C@@]12C[C@]1(Cl)C(Cl)=C[C@H]1CC(C)(C)C[C@H]12
7276	CN1CCc2cc(Cl)cc(Cl)c21
7277	CC1(C)CCC[C@@]2(C)[C@H]1CC[C@]1(Cl)C(=O)CC(Cl)=CC[C@H]21
7278	Clc1c(Cl)n(-c2ccccc2)c2ccccc12
7279	Cc1cc2c(cc1Cl)[C@@H]1c3ccccc3[C@H]2c2cc(Cl)ccc21
7280	O=C1c2cc(Cl)ccc2-c2ccc(Cl)c3cccc1c23
7281	CC(C)(C)Sc1cc(O)c(Cl)cc1Cl
7282	Clc1cc(Cl)c(N2CCCCC2)o1
7283	C/C(Cl)=C(\\C)C#C/C(C)=C(/C)Cl
7284	CC(C)(C)[C@H]1CC=C(Cl)[C@H](CCl)C1
7285	CC(C)(C)n1cc(Cl)c(Cl)c1
7286	OC[C@@H]1C[C@H](Cl)O[C@@H]1Cl
7287	Cl[C@H]1[C@@H]2C=C[C@H]1[C@H](Cl)C2
7288	CC1(C)CCC[C@@]2(C)[C@@H]1CC[C@@H](Cl)[C@@]2(O)Cl
7289	Clc1cc2sc3cc(Cl)sc3c2s1
7290	Clc1ccc(Cl)c(Cl)c1Cl
7291	COc1cc(C#CCl)c(OC)cc1C#CCl
7292	Cc1ccc2c(c1)C(Cl)=C(Cl)c1ccccc1C2
7293	COc1c(Cl)cc(Cl)c(C)c1Cl
7294	Clc1cc2ccccc2c(-c2nc(Cl)cc3ccccc23)n1
7295	ClC1=C(Cl)c2cc(-c3ccc4c(c3)C(Cl)=C(Cl)CC4)ccc2CC1
7296	Clc1sc(Cl)c(Cl)c1Cl
7297	C/C(Cl)=C/c1ccc(Cl)cc1
7298	Cl[C@H]1[C@H]2CC[C@H](CC2)[C@@H]1Cl
7299	C[C@@H]1[C@@H](C)N(Cl)c2ccccc2N1Cl
7300	C[C@@H](Cl)C#C[C@@H](C)Cl
7301	Clc1ccc2cc3nc(Cl)ccc3cc2n1
7302	C/C=c1/c2c(/c(=C\\C)c3c1[C@@H](C)[C@@H](Cl)C[C@@H]3C)[C@@H](C)[C@H](Cl)C[C@@H]2C
7303	ClC1=CS/C(=C2/SC=C(Cl)S2)S1
7304	ClC1=C(Cl)C(c2ccccc2)C(Cl)=C(Cl)N1
7305	O=C1c2cc(Cl)ccc2C(=O)c2c1ccc(Cl)c2-c1c(Cl)ccc2c1C(=O)c1ccc(Cl)cc1C2=O
7306	CO[C@H]1[C@@H](Cl)[C@@H]2C[C@@H]2[C@H]1Cl
7307	ClC[C@@H]1CCC[C@@H](Cl)C1
7308	Cl[C@H]1CO[C@@H](Cl)O1
7309	Clc1ccccc1-c1cc2c(cc1Cl)sc1ccccc12
7310	CC1(C)CC2CC(C)(C)Oc3c(Cl)c(O)c(Cl)c(c32)O1
7311	Cc1cc(-c2[nH]c(Cl)cc2C)[nH]c1Cl
7312	CC1(C)CCC(C)(C)c2cc(Cl)c(Cl)cc21
7313	CC1(C)CCC=C(Cl)[C@@H]1Cl
7314	Cc1cc(-c2ccccc2)cc(C)c2c(Cl)c(Cl)cc1-2
7315	Clc1cscc1Cl
7316	O/C=C(/Cl)c1[nH]nc(Cl)c1Cl
7317	ClC1=C2CCc3cc4c5cc3CCC2=C(Cl)/C=C(CC5)\\C(=C/1)CC4
7318	N#Cc1c2cccccc-2c(Cl)c1Cl
7319	Cc1cc(C)c(-c2c(C)cc(C)cc2Cl)c(Cl)c1
7320	ClNNCl
7321	CC[C@@]12C3=CC=CC1=C(Cl)C(Cl)=C2C=C3
7322	Clc1ccccc1-c1cc2ccc3ccccc3c2cc1Cl
7323	C[C@]12C[C@@H]3[C@@H]4C[C@H]1[C@@H](C[C@]4(C)NN3Cl)N(Cl)N2
7324	Clc1ccc2ccc3c(Cl)ccc4ccc1c2c43
7325	C[C@@H]1Cc2c(n(Cl)c3ccccc23)-c2ncc(Cl)c(=O)n21
7326	C=C1COC(=O)c2c(Cl)cc3ccccc3c2-c2c(c(Cl)cc3ccccc23)C(=O)OC1
7327	C=C1[C@@H](Cl)[C@@H](CCl)C[C@H]1O
7328	CN1C=C[C@H](c2c(Cl)n(C)c3ccccc23)C(Cl)=C1
7329	Clc1ccc(C#Cc2ccc3c4c(ccc(C#Cc5ccc(Cl)cc5)c24)CC3)cc1
7330	ClC/C=C1/C=CC=C1Cl
7331	Clc1cc(Cl)c(N2CCOCC2)o1
7332	C/C(Cl)=C(\\C)C#CC#C/C(C)=C(/C)Cl
7333	N=C1N[C@@H]2C[C@H](N1)[C@H]1N(Cl)[C@@](O)(O2)[C@@H]2[C@@H]3C[C@H](NC(=N)N3)O[C@@]1(O)N2Cl
7334	Cc1ccc(-c2nc3c(Cl)c4cccccc4n3c2Cl)cc1
7335	ClN1CCOCCOCCN(Cl)CC1
7336	OCc1cc(Cl)cc(Cl)c1O
7337	ClC1=CC=c2c3c(c4cccc5cccc2c54)C=CC(Cl)=C1C3
7338	C=C(Cl)[C@@H]1CC[C@@]2(C)CCC=C(Cl)[C@H]2C1
7339	CN(Cl)/C(Cl)=C/O
7340	Clc1c[nH]c2ccc(-c3[nH]c4ccccc4c3Cl)cc12
7341	Clc1ccc2c3c(ccc2c1)OCOc1ccc2cc(Cl)ccc2c1-3
7342	C[C@H]1CC[C@@H](Cl)[C@@H](Cl)C2=CC(C)(C)C[C@H]21
7343	Cl/N=c1\\c2ccccc2c2nc3/c(=N/Cl)c4ccccc4c3nc12
7344	Cc1ccc2oc(Cl)c(Cl)c2c1
7345	Clc1sc(Cl)c2c1ncc1sccc12
7346	C[C@H]1CC[C@@H]2C(C)(C)[C@@H](O)CC[C@]2(C)[C@]12Cc1c(O)cc(Cl)c(Cl)c1O2
7347	FC1=C(Cl)C(F)=C1Cl
7348	ClC1=C[C@@H]2C=C(Cl)[C@@H]3C=C[C@H]1[C@H]23
7350	C[C@]12Cc3cc(Cl)oc3C[C@H]1CC[C@H]1[C@@H]3CC[C@@H](OCl)[C@]3(C)CC[C@H]12
7351	Cc1c(Cl)n(Cl)c2c(C)cc(Br)cc12
7352	C=C1C[C@@](C)(Cl)[C@H](Cl)C[C@H]1O
7353	Clc1ccc2c(c1)C1(CC2)CCc2ccc(Cl)cc21
7354	CC1(C)C[C@@H]2[C@H](C=C(Cl)[C@@]3(Cl)C[C@@]23C)[C@H]1O
7355	Clc1c2cccccc-2cc1-c1cc2cccccc-2c1Cl
7356	Cc1cc(C)c(-c2c(C)cc(C)c(Cl)c2C)c(C)c1Cl
7357	COc1cccc2c1CC[C@H]1[C@@]2(Cl)CCC[C@@]1(C)Cl
7358	CN1C=C(Cl)CC(Cl)=C1
7359	Cn1c(Cl)c(Cl)c(Cl)c1N1CCCCC1
7360	Cl[C@@H]1/C=C\\C=C/[C@@H](Cl)C/C=C\\1
7361	Cl[C@@H]1[C@@H]2C=C[C@@H](CC2)[C@H]1Cl
7362	CC1(C)[C@@H](Cl)[C@]2(C#N)C[C@@]1(C#N)[C@@H](Cl)C2(C)C
7363	O=C1C(Cl)=C2C(=O)C(Cl)=C1N(Cl)CCCCCCCCCCCCN2Cl
7364	C/C(Cl)=C/[C@H]1[C@@H](Cl)C1(C)C
7365	C[C@H]1CN=C(S)Nc2ccccc2N(Cl)CCN(Cl)c2ccccc2NC(S)=N1
7366	CN1C=C[C@H](c2c(Cl)[nH]c3ccccc23)C(Cl)=C1
7367	Clc1ccc2ccoc2c1N1CCN(Cl)CC1
7368	C/C=c1/c2c(/c(=C\\C)c3c1C[C@@H](Cl)CC3)C[C@@H](Cl)CC2
7369	Oc1cc(Cl)sc1Cl
7370	CC1=C[C@H]2OC=C(Cl)[C@](C)(Cl)[C@@H]2[C@@H](CO)C1
7371	ClC1=S=C(Cl)c2cc3ccccc3cc21
7372	Cc1cc(O)cc(Cl)c1-c1c(C)cc(O)cc1Cl
7373	CC(=O)N1[C@@H](Cl)Cc2c[nH]c3cccc(c23)[C@@H]1/C=C(/C)Cl
7374	CC1(C)C=C(Cl)C(Cl)=C(Cl)C1
7375	C[C@@]12CCC=C(Cl)[C@@]1(Cl)C2
7376	ClC1=CC=CC2=CC=CC(Cl)=C1C2
7377	Cl[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@H]1[C@H]4C[C@@H]5C[C@H](C4)C[C@@]1(Cl)C5)(C3)C2
7378	CC1=C(Cl)C2=CC=C3C=CC=C4C=CC(=C1Cl)[C@@]2(C)[C@]43C
7379	COc1ccc2c(c1)C(Cl)=C(Cl)c1ccccc1C2
7380	Oc1cc(Cl)c(Cl)cc1O
7381	Oc1cc2c(Cl)c(O)ccc2cc1Cl
7382	Clc1cc(Cl)c(N2CCNCC2)o1
7383	Clc1ccc(N2CCN(Cl)CC2)c2occc12
7384	COc1c2oc(Cl)c(Cl)c2cc2c(Cl)c(Cl)oc12
7385	Cc1c(Cl)n(Cl)c2c(Cl)ccc(Cl)c12
7386	CC1=C/C(Cl)=C\\C(C)=C/C(Cl)=C1
7387	O=C(Cl)O[C@H]1CCC[C@H]1Cl
7388	Cc1nc2ccccc2c(Cl)c1Cl
7389	CC1(C)C(Cl)=C(Cl)N(c2ccccc2)C(Cl)=C1Cl
7390	Oc1c(Cl)cc2ccccc2c1Cl
7391	COc1cc2c(C)c(c1)CCc1c(C)c(c(Cl)c(C)c1Cl)CC2
7392	ClN1CC(Br)CN1Cl
7393	ClC#CC1(C#Cc2ccccc2C#CC2(C#CCl)OCCCO2)OCCCO1
7394	CN1C(=O)N2[C@H](Cl)O[C@H](Cl)CO[C@H]2c2nc3c4ccccc4n(C)c3nc21
7395	OC(=C\\Cl)/C=C/Cl
7396	ClC[C@@H]1[C@@H](Cl)[C@H]2CC[C@@H]1C2
7397	Clc1ccnc(-c2nccc(Cl)n2)n1
7398	COc1c(O)c(Cl)c(Br)c(Cl)c1O
7399	ClC1=C(Cl)C(c2cccc(Cl)c2)C(Cl)=C(Cl)N1
7400	COC(=O)[C@H]1CCC[C@@](C)(Cl)[C@H]1Cl
7401	Clc1csc(-c2cc(Cl)cs2)c1
7402	CC1=C(Cl)[C@H](CCl)CC1
7403	Clc1cccc2c1Oc1c(Cl)cccc1O2
7404	Clc1ccc2nc(Cl)c(Cl)nc2c1
7405	CC1=C/C(=C2/C=C(C)C(=O)C(Cl)=C2)C=C(Cl)C1=O
7406	CC(O)=Nc1c(Cl)c2cccccc-2c1Cl
7407	Cl[C@H]1C=C[C@@H](Cl)N1
7408	C[C@@H](Cl)C#C/C=C/[C@@H](C)Cl
7409	C#CC1C(Cl)=CN(c2c(C)cccc2C)C=C1Cl
7410	ClC1=C(Cl)C(=CN2CCOCC2)C(Cl)=C(Cl)C1
7411	CC(=O)O[C@H]1[C@@H]2CC(C)(C)CC2=C(Cl)[C@@]2(Cl)C[C@]12C
7412	CC1=CC2=C(Cl)C3(CC3)[C@@](C)(O)C(=O)C2=C1Cl
7413	Cc1cc(Cl)c2[nH]c(Cl)c(Cl)c2c1
7414	Clc1ccc2c(ccc3cc(-c4ccccc4)c(Cl)cc32)c1
7415	Cl[C@@]12[C@@H]3C[C@H]4[C@H]5[C@@H]3[C@@H]3C[C@H]5[C@]5([C@H]6C=C[C@H](C=C6)[C@]315)[C@]42Cl
7416	Cl[C@H]1CCC[C@@H](Cl)[C@H]2COC[C@H]12
7417	N#Cc1cc(Cl)[nH]c1Cl
7418	C[C@]12C=C(Cl)[C@](O)(Cl)C[C@@H]1CCCC2
7419	Clc1oc2ccccc2c1Cl
7420	SC1=NCCCN=C(S)Nc2ccccc2N(Cl)CCN(Cl)c2ccccc2N1
7421	ClN1C=C([C@H]2CCCCCN2Cl)CCCC1
7422	O/C=C(\\Cl)c1[nH]nc(Cl)c1Cl
7423	ClN1CCC[C@@H]([C@H]2CCCCN2Cl)C1
7424	Clc1[nH]c(Cl)c2c1CCCC2
7425	C[C@@H]1C[C@H](Cl)CC[C@H]1Cl
7426	Cc1ccc2c(c1)[C@H](Cl)c1ccccc1[C@@H]2Cl
7427	Clc1cc2c(cc1Cl)CCC2
7428	O=C1c2c(O)cc(O)c(Cl)c2C(=O)c2c(O)cc(O)c(Cl)c21
7429	CCc1c(O)c(Cl)cc(Cl)c1O
7430	Cl/C=C/c1cc2cccccc-2c1Cl
7431	Clc1c2c(c(Cl)c3c1-c1cccc4cccc-3c14)-c1cccc3cccc-2c13
7432	Clc1cc(Cl)c2c(c1Cl)CCCC2
7433	O=C(Cl)c1c(Cl)cccc1Cl
7434	Cc1c2ccc(O)c(Cl)c2c(C)c2ccc(O)c(Cl)c12
7435	CC1=C2C=C(Cl)S[C@]2(C)[C@]2(C)SC(Cl)=CC2=C1C
7436	Clc1cc2c(s1)/C(=C1/CCc3cc(Cl)sc31)CC2
7437	O=C1c2cc(Cl)sc2-c2sc(Cl)cc21
7438	CC(O)=Nc1cc(O)c(Cl)cc1Cl
7439	ClC=C=CCl
7440	Cc1c(Cl)n(Cl)c2ccc(Cl)cc12
7441	CC1=C(Cl)[C@]2(C)[C@@H](OCl)CC[C@@H](C)[C@@H]2[C@H]2OC(C)(C)O[C@H]12
7442	O=C1C(Cl)=C(Cl)NC2=C(Cl)CCCN12
7443	O=C(Cl)/C=C\\Cl
7444	Cc1c(Cl)ccc(O)c1Cl
7445	Cc1cc(Cl)c(Cl)o1
7446	CC1(C)O[C@@H]2[C@H](Cl)O[C@@H](Cl)[C@@H]2O1
7447	CC1(C)[C@@H](Cl)CC[C@]1(C)Cl
7448	C#CC1C(Cl)=CN(c2cccc(C)c2)C=C1Cl
7449	Cc1c(Cl)c[nH]c1Cl
7450	CN(C)c1nc(Cl)c(Cl)cc1Cl
7451	Clc1ccccc1-c1cc2sc3ccccc3c2cc1Cl
7452	Cl/C=C/c1cccc2c1-c1c(Cl)cccc1-2
7453	CC(C)c1cc(Cl)c(Cl)c(Cl)c1
7454	CC(=O)Oc1c(Cl)c(Cl)cc2c1C(=O)c1ccccc1C2=O
7455	CCc1cccc2c(Cl)c(Cl)oc12
7456	Cl[C@]12[C@@H]3C=C[C@@H](O3)[C@@]1(Cl)[C@@H]1C=C[C@H]2O1
7457	Clc1nnn(-c2ccc(Br)cc2)c1Cl
7458	O=C(O)[C@@H]1C[C@]2(O)c3ccccc3N(Cl)[C@@H]2N1Cl
7459	CC1=CC[C@@H]([C@@H](C)Cl)[C@@H]1Cl
7460	ClN1C=C([C@@H]2CCCCCN2Cl)CCC1
7461	Cc1c(Cl)csc1Cl
7462	C=C1C[C@]23C[C@@]1(O)CC[C@@H]2C1=CCC[C@](C)(Cl)[C@@H]1[C@H]3Cl
7463	CCN1c2cccc(Cl)c2Sc2cccc(Cl)c21
7464	CSc1ccc(Cl)cc1Cl
7465	Oc1c(Cl)ccnc1-c1nccc(Cl)c1O
7466	ClN=C1NN(Cl)C2(CCCCC2)S1
7467	Clc1c[nH]c2ccc3c(ccc4[nH]cc(Cl)c43)c12
7468	Oc1c(Cl)cc(Cl)cc1C1CCCCC1
7469	C[C@@H]1CCC[C@]2(C)[C@H](Cl)C(Cl)=CC[C@H]12
7470	COc1c(Cl)c(Cl)c(Cl)n1C
7471	C=Cc1c(Cl)[nH]c(Cl)c1C
7472	Clc1nc2ccccc2nc1Cl
7473	Clc1cc(C#Cc2ccccc2)cc(Cl)n1
7474	ClNc1ccc(Cl)cc1
7475	CC1(C)CC2=C(Cl)[C@]3(Cl)C[C@]3(C)[C@H](O)[C@]2(O)C1
7476	Clc1ccc2c(c1)Nc1ccc(Cl)cc1S2
7477	Cn1c(=O)n2n(c1=O)C1(Cl)CC2(Cl)C1
7478	C[C@H]1CC[C@H](Cl)[C@@H]1Cl
7479	ClC1=C(Cl)[C@@H]2O[C@H]1C1=C2[C@H]2C=C[C@@H]1CC2
7480	Cc1c2ccc(O)c(Cl)c2cc2ccc(O)c(Cl)c12
7481	Fc1cc2c(c3ccccc13)[C@@H](Cl)c1ccccc1[C@@H]2Cl
7482	O[C@@H](Cl)[C@H](O)Cl
7483	C[C@H]1C=C(Cl)C(Cl)=C[C@@H]2CC(C)(C)C[C@H]12
7484	O/C(Cl)=C\\C=C/Cl
7485	CC(C)(C)/C(C#CC#C/C(=C/Cl)C(C)(C)C)=C/Cl
7486	Clc1c(Cl)n(Cl)c2ccccc12
7487	Cc1ccc(-c2ccc(Cl)cc2)cc1Cl
7488	O[C@@H](Cl)[C@H]1CS[C@H](Cl)O1
7489	Clc1cccc2c1-c1c(Cl)cccc1/C=C\\C/C=C\\2
7490	Cl/C1=C/NCCC/N=C/C(Cl)=C\\NCCC\\N=C/1
7491	CCc1ccc2oc(Cl)c(Cl)c2c1
7492	Cc1ccc(C)c2c1[C@@H](Cl)c1ccccc1[C@H]2Cl
7493	Clc1ccc2c(c1)oc1ccc(Cl)cc12
7494	CCc1cc(Cl)c(C)c(Cl)c1
7495	ClN=C1CNCC(NCl)=N1
7496	C[C@H]1C[C@H](O)[C@@H](CCl)[C@@H]1Cl
7497	C[C@H]1CC[C@@]2(C)C(Cl)=CCC[C@@H]2[C@]1(C)CCl
7498	C#CC1C(Cl)=CN(c2ncccn2)C=C1Cl
7499	CC1(C)CCC[C@]2(C)[C@@H]1CC=C(Cl)[C@]2(C)Cl
7500	Clc1cc(Cl)c(N2CCCCC2)s1
7501	Cc1sc(Cl)cc1Cl
7502	Cl[C@H]1[C@H](Cl)C12c1ccccc1-c1ccccc12
7503	Cl/C1=C(\\Cl)C/C(Cl)=C(/Cl)CCC1
7504	Clc1c(Br)sc(Br)c1Cl
7505	CN1CCCc2cc(Cl)cc(Cl)c21
7506	C=C(Cl)[C@@H]1C/C=C(/C)CC/C=C(/Cl)CC1
7507	CC(C)(C)c1ccc(Cl)c(Cl)c1
7508	Cl[C@@H]1[C@H](Cl)C[C@@H]2[C@H]3OO[C@H](O3)[C@H]12
7509	Cl[C@H]1C[C@@H]1Cl
7510	OCc1cnc(Cl)c(O)c1Cl
7511	ClN1C=C([C@@H]2c3ccccc3CCN2Cl)CCCC1
7512	ClC[C@@H]1CCC[C@H]1Cl
7513	ClC1(Cl)[C@@H]2CC=CC[C@H]2C(Cl)(Cl)[C@@H]2CC=CC[C@H]21
7514	CC1=C(C)C[C@@H](Cl)[C@@H](Cl)C1
7515	Clc1ccc2[nH]c(Cl)c(Cl)c2c1
7516	CC1(C)OCc2c(Cl)cnc(Cl)c2O1
7517	C[C@@H]1CC[C@@H](Cl)[C@@H]1CCl
7518	Clc1cc2nc(Cl)c(Cl)nc2cc1Cl
7519	ClC[C@H]1CCc2cccc(Cl)c21
7520	CC1(C)C(Cl)=C(Cl)NC(Cl)=C1Cl
7521	CC1(C)CC[C@H](O)[C@@]2(C)[C@H](Cl)C(Cl)=CC[C@@H]12
7522	Clc1cnc2c(Cl)sc3cc(-c4ccccc4)nc1-n-3-2
7523	O=C1c2cc(O)c(Cl)c(O)c2C(=O)c2cc(O)c(Cl)c(O)c21
7524	C[C@@H]1C(=O)O[C@@H]2/C=C(/Cl)CC/C=C(/Cl)CC[C@@H]21
7525	Cl[C@H]1CCC[C@@H](Cl)CCC1
7526	COc1c(C)c(O)c(Cl)c(Cl)c1O
7527	ClC1=CNC(Cl)=C(Cl)C1
7528	Clc1cc(Cl)c(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)s1
7529	C#CC1C(Cl)=CN(CC)C=C1Cl
7530	C[C@]12CC[C@](O)(CC[C@@]1(C)CCl)[C@@]2(C)Cl
7531	Clc1[nH]c(Cl)c(Br)c1Br
7532	N#CC1=C(c2ccc(Cl)cc2)[C@@H](Cl)S/C1=C/Cl
7533	Clc1cnc2ncc(Cl)cc2c1
7534	CN(Cl)c1ccccc1Cl
7535	Clc1cccc2c1Oc1cccc(Cl)c1O2
7536	C/C(Cl)=C/C=C(\\C)Cl
7537	Clc1nnc2ccccc2c1Cl
7538	ClO[C@@H]1Cc2ccccc2N(Cl)C1
7539	CC(=O)O[C@H]1CC[C@H]2C[C@]2(Cl)[C@@H]1Cl
7540	COC(=O)C1=C(C)C[C@H]2[C@H]1C=C(Cl)[C@@]1(Cl)C[C@@]21C
7541	Cc1cc(Cl)c(S(=O)(=O)C(C)(C)C)c(Cl)c1
7542	Cc1cc(N(C)C)c(Cl)c(C)c1Cl
7543	ClC/C=C1\\C=CC=C1Cl
7544	ClC1=C(Cl)[C@@H]2C=C[C@H]1c1cc3ccccc3cc12
7545	CC(C)(C)N1CN(Cl)CN(Cl)C1
7546	ClC1=Cc2ccccc2N(Cl)c2ccccc21
7547	CCn1c(Cl)c(Cl)c2cccc(Cl)c21
7548	Clc1cscc1-c1ccsc1Cl
7549	Cc1ccc2c(ccc3c(Cl)c(C)c(Cl)n32)c1
7550	Clc1ccc2nc3ccccc3c(Cl)c2c1
7551	ClC1=C2c3cc4c(cc3CCN2[C@@H]2O[C@H]1N1CCc3cc5c(cc3C1=C2Cl)OCO5)OCO4
7552	Cl[C@H]1CCC[C@H]1[C@H]1CCC[C@H]1Cl
7553	Cc1cc(-c2cc(C)sc2Cl)c(Cl)s1
7554	CC[C@@]12CCCn3c(Cl)c(Cl)c(c31)-c1ccccc1N=C(O)CC2
7555	Cc1cc2c(cc1Cl)[C@@H]1c3ccccc3[C@H]2c2ccc(Cl)cc21
7556	Clc1ccn(-n2cccc2Cl)c1
7557	CN1[C@@H](Cl)C=C[C@H]1Cl
7558	ClC1=CC[C@@H](Cl)CC1
7559	ClN1CCN(Cl)[C@H](c2ccccc2)c2ccccc2C1
7560	CC(=O)O[C@@H]1[C@H](Cl)[C@@]2(Cl)C[C@@]2(C)[C@H]2CC(C)(C)C[C@@H]12
7561	CCOC(=O)N1C[C@H](Cl)CC[C@H]1Cl
7562	C=C1[C@@H](C)CC[C@]2(C)[C@@H]1CC=C(Cl)[C@]2(O)Cl
7563	Cc1[nH]c2c(c1Cl)C(Cl)=C(Cl)CC2
7564	O/C=C1\\C(Cl)=CC(Cl)=C1C1C=CC=CC=C1
7565	Cc1cc(C)c2cc(Cl)c(Cl)c-2c(C)c1
7566	Cc1c(Cl)n(Cl)c2c(Cl)cc(Cl)cc12
7567	Cl/C=C/c1cccc(Cl)c1
7568	Clc1sc(Cl)c2c1Nc1ccccc1N2
7569	C[C@H](Cl)C#C/C=C/[C@@H](C)Cl
7570	Clc1cnc2c(Cl)sc3cccc1-n-3-2
7571	Cc1cccc2oc(Cl)c(Cl)c12
7572	ClNc1cc2ccccc2nc1Cl
7573	CN1C[C@H](Cl)[C@@H](OCl)[C@H]2c3ccccc3CC[C@@H]21
7574	Clc1ccc(N2CCN(Cl)CC2)cc1Cl
7575	Cc1cc(C(C)(C)C)cc(C)c2c(Cl)c(Cl)cc1-2
7576	ClC1=C(Cl)/C=C\\C=C/C=C1
7577	C=C(Cl)[C@H]1C[C@H](O)C(C)=C1Cl
7578	Cl/C1=C/Nc2ccccc2/N=C\\C(Cl)=C/Nc2ccccc2\\N=C/1
7579	COc1c(Cl)cc(Cl)c(O)c1C
7580	CC(C)(Cl)/C=C\\Cl
7581	CC1=C(Cl)C(=O)N2C(=C(Cl)CC[C@H]2C)N1
7582	Oc1nc2c(ccc3c(O)c(Cl)c(O)nc32)c(O)c1Cl
7583	Clc1cc(Cl)c2ccc3cccc4ccc1n4-n32
7584	Fc1ccc2c(Cl)c3ccccc3c(Cl)c2c1
7585	Cc1cc(-c2cc(C)c(Cl)s2)sc1Cl
7586	COC(C#CCl)(C#CCl)c1ccc(C(C)(C)C)cc1
7587	CC1(C)C2C3C(C)(C)C4(O)C(=O)C3(Cl)C4(Cl)C3(Cl)C(=O)C1(O)C23Cl
7588	Clc1cc(Cl)cc([C@@H]2O/C=C\\c3occc3O/C=C/c3occc3O2)c1
7589	C[C@@]12CC[C@H]3[C@@H](CC[C@]4(/C=C/Cl)CC(=O)CC[C@]34C)[C@@H]1CC[C@H]2Cl
7590	Clc1ccc2c(c1)CC[C@H]1CCc3cc(Cl)ccc3[C@H]21
7591	Clc1c[nH]c2ccc3[nH]cc(Cl)c3c12
7592	C[C@@H]1CCC[C@@](C)(Cl)[C@H]1Cl
7593	O=C1OCC[C@H]1n1c(Cl)ccc1Cl
7594	Oc1cc(Br)c(Cl)cc1Cl
7595	COc1cc2c(cc1Cl)C(Cl)=C(Cl)C(C)(C)O2
7596	Clc1cc2cccc3cccc(cc1Cl)c32
7597	Cn1ncc(Cl)c1NCl
7598	C[C@@]1(O)C[C@]23CC[C@@H]4[C@](C)(Cl)CCC[C@@]4(Cl)[C@@H]2CC[C@H]1C3
7599	C[C@H]1CC[C@@H]([C@@H](C)Cl)[C@@H]1Cl
7600	C[C@H]1CN(Cl)CCN1Cl
7601	C[C@@]12CCC[C@@H](Cl)[C@H]1N(Cl)c1ccccc12
7602	Clc1c2cccccc2n2c(Cl)c(-c3ccccc3)nc12
7603	CC[C@@]1(Cl)CC=C(Cl)CC1
7604	O/C=C(\\Cl)NCl
7605	Cl/C=C\\[C@@H]1C=CC=C1Cl
7606	Clc1cc(-c2cc(Cl)on2)no1
7607	Clc1c2c(c(Cl)c3ccccc13)-c1cccc3cccc-2c13
7608	CC1(C)C=C[C@H](O)[C@]2(C)[C@H](Cl)C(Cl)=CC[C@H]12
7609	C/C(Cl)=C\\CCl
7610	CC(C)(C)S(=O)(=O)c1c(Cl)cccc1Cl
7611	Clc1ccc(-c2ccc(Cl)s2)[nH]1
7612	CC1(C)CCC[C@@]2(C)[C@H]1CC[C@]1(C)[C@@H](Cl)C(Cl)=CC[C@H]21
7613	CC(C)(Cl)C#C/C=C/C#CC(C)(C)Cl
7614	Clc1ccc2c(ccc3nc(Cl)ccc32)n1
7615	CCn1c(Cl)ccc1Cl
7616	C[C@H]1CC[C@H]2C(C)(C)[C@@H](O)[C@@H](O)C[C@@]2(C)[C@]12Cc1c(O)cc(Cl)c(Cl)c1O2
7617	Sc1c(Cl)cccc1Cl
7618	Clc1c2ccccc2c(-c2c3ccccc3c(Cl)c3ccccc23)c2ccccc12
7619	CC1=CC(=O)[C@]23CCC[C@]12[C@@H](Cl)C[C@@]3(C)Cl
7620	Clc1ccsc1Cl
7621	Clc1cnc2c(Cl)sc3cc(-c4ccccc4)cc1-n-3-2
7622	Cl[C@@H]1[C@H]2CC3=C(C[C@H]21)C[C@H]1[C@H](Cl)[C@@H]1C3
7623	ClC1(C#CC2(Cl)CC2)CC1
7624	C[C@@]1(Cl)CCCC[C@]1(C)CCl
7625	Clc1ccnc(Cl)c1
7626	Oc1c(Cl)c2c(O)c(Cl)c1N(Cl)CCCCCCCCCCCCN2Cl
7627	Oc1c(Cl)cc(Cl)c(O)c1Br
7628	O=C(c1ccccc1Cl)N1CCC[C@H]1Cl
7629	Cl/C=C\\c1ccc(Cl)s1
7630	Clc1c(Cl)c2ccccc2c2ccccc12
7631	Cc1cc2ccccn2c2c(Cl)cc(Cl)c1-2
7632	O=C(Cl)/C=C/Cl
7633	Fc1ccccc1C1C(Cl)=CNC=C1Cl
7634	Cl[C@H]1[C@@H]2CC[C@@H](c3ccccc32)[C@H]1Cl
7635	Cl[C@H]1CC/C=C\\CC/C=C\\CC[C@H]1Cl
7636	Cl[C@H]1[C@H](c2ccccc2)[C@H]1Cl
7637	C[C@@H]1C=C(Cl)[C@@H](Cl)[C@@H](O)[C@@H]2CC(C)(C)C[C@H]12
7638	ClC1=C/C=C2/C=C\\C(=C1Cl)CCc1ccc(cc1)CC2
7639	C[C@@]1([C@H]2CC[C@]3(C)[C@@H](CC[C@]3(C)O)[C@@H]2Cl)C=CC(=O)C=C1Cl
7640	Cl[C@H]1C[C@@H](Cl)[C@H]2CCC[C@@H]12
7641	O=c1c(O)c(Cl)oc(CCl)c1Cl
7642	CC1=C(Cl)C(C)(C)[C@@H](Cl)CC1
7643	C/C=C1\\CN(Cl)[C@H]2C[C@@H]1[C@@H](C(=O)OC)[C@@]13CC(=O)O[C@@]21N(Cl)c1ccccc13
7644	Cc1cc2cc(Cl)c1CCc1c(C)cc(cc1Cl)CC2
7645	CC(=O)SC1CN(Cl)N(Cl)C1
7646	CC1(C)CCC[C@](C)([C@@H]2[C@H]3C[C@H]4C[C@]2(Cl)C[C@@]4(C)O3)[C@@H]1Cl
7647	Cc1cc(C)c(Cl)c(-c2cc(C)cc(C)c2Cl)c1
7648	C/C(Cl)=C(\\C)C#CC#C/C(C)=C(\\C)Cl
7649	CC1(C)CCC[C@@]2(C)[C@H]1[C@@H](O)C=C(Cl)[C@]2(O)Cl
7650	Clc1cc2cc3cc(Cl)sc3cc2s1
7651	COC(=O)[C@@]1(C)CC[C@@H]2[C@](Cl)(CC[C@@H]3[C@@](C)(Cl)CCC[C@@]32C)C1
7652	ClN1CCc2c([nH]c3ccc(Br)cc23)[C@@H]1[C@H]1CCCN1Cl
7653	CC1=C(Cl)C(C)(C)CC[C@@H]1Cl
7654	Cc1ccc(Cl)c(C)c1Cl
7655	C/C=c1/c2c(/c(=C/C)c3c1[C@@H](C)C[C@@H](Cl)[C@H]3C)[C@H](C)[C@@H](Cl)C[C@@H]2C
7656	CC(=O)Oc1c(Br)c(Cl)c(Cl)c(Br)c1Br
7657	CN1C=C(Cl)[C@H]2C[C@@H]1C(Cl)=CN2C
7658	C/C(Cl)=C/c1ccc(Cl)o1
7659	Oc1ccc2c(Cl)cc(Cl)nc2n1
7660	C[C@@]12CCC(=O)C=C1CC[C@@H]1[C@@H]2[C@H](O)C[C@]2(Cl)[C@@H](C(=O)Cl)CC[C@H]12
7661	SC1=NCCN=C(S)Nc2ccccc2N(Cl)CCN(Cl)c2ccccc2N1
7662	Clc1c2c(cc3c1CC1(C3)Cc3cc4c(c(Cl)c3C1)CCC4)CCC2
7663	Cc1c2cc(Cl)c(c1C)CCc1c(Cl)cc(c(C)c1C)CC2
7664	CC(C)(C)c1ccc2c(Cl)c3ccccc3c(Cl)c2c1
7665	CC(C)(C)S(=O)(=O)c1cc(Cl)sc1Cl
7666	ClC1=Cc2ccccc2C=C(Cl)O1
7667	O=C1c2ccccc2-c2c(Cl)ccc(Cl)c21
7668	ClN1CCOCCN(Cl)c2ccccc2NCCOCCNc2ccccc21
7669	Cl[C@]12CCCC[C@@]1(Cl)C2
7670	Cc1cc2c(cc1C)[C@H](Cl)c1ccccc1[C@@H]2Cl
7671	Clc1ccc2nc(Cl)cn2c1
7672	ClC1=CC=CC=C(C2=CC=CC=C(Cl)C2)C1
7673	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@H](Cl)[C@H]3C)[C@@H](C)[C@@H](Cl)C[C@@H]2C
7674	Clc1nc2c(Cl)nn(-c3ccccc3)c2o1
7675	Clc1ccc2c(c1)[nH]c1cc(Cl)ccc12
7676	COc1cc(Cl)c2c(c1C)OC(=O)c1c(C)c(Cl)c(O)c(Cl)c1O2
7677	COc1ccc2c(c1Cl)Oc1ccc(O)c(Cl)c1O2
7678	CC(C)/C(Cl)=C/Cl
7679	ClC1=C(Cl)[C@H]2c3ccccc3[C@@H]1c1ccccc12
7680	O[C@H]1CC[C@H]2[C@@H]1[C@H](Cl)[C@@H]2OCl
7681	Oc1c(Cl)cc(C(F)(C(F)(F)F)C(F)(F)F)cc1Cl
7682	Cc1cc(N(C)C)c(Cl)cc1Cl
7683	Cl[C@H]1[C@H]2CC=CC[C@H]2[C@H](Cl)[C@H]2CC=CC[C@@H]12
7684	ClC1C2C3CC4C2C(Cl)C2C5CC(C12)C1C3C4C51
7685	Cl[C@@H]1OC2(CCCCC2)O[C@H]1[C@H]1OC2(CCCCC2)O[C@H]1Cl
7686	CS[C@@]1(Cl)C[C@H]1Cl
7687	CC1(C)C=C(c2ccc(Cl)s2)CC(C)(C)N1Cl
7688	Cc1c(Cl)c2sccn2c1Cl
7689	Cl/C=C/C1=CC2=CC=CC=C3C=C(Cl)[C@@H]1C[C@H]32
7690	Cl[C@]12CC=CC[C@@]1(Cl)C2
7691	CC1(C)CC2(CC(C)(C)c3cc(Cl)ccc32)c2ccc(Cl)cc21
7692	ClC1=C(Cl)c2cc3c(cc2CC1)CCc1cc2c(cc1-3)C(Cl)=C(Cl)CC2
7693	CN1C(Cl)=C(Cl)C(C)(C)C(Cl)=C1Cl
7694	C[C@@H](Cl)[C@H]1O[C@@H](Cl)[C@@H]2OC(C)(C)O[C@H]12
7695	Cl[C@H]1[C@H](c2ccccc2)C[C@@H](Cl)[C@]23OCCO[C@]12OCCO3
7696	O=C1CC[C@@H]([C@H]2CCC(=O)[C@H](Cl)C2)C[C@@H]1Cl
7697	Clc1ccc2ccc3ccc4ccc5ccc6ccc(Cl)cc6c5c4c3c2c1
7698	ClC1=C(Cl)[C@H]2C=C[C@@H]1C2
7699	Cc1sc(C)c2cc(Cl)c(Cl)cc12
7700	ClC1=C[C@H]2[C@H]3C=C[C@@H]1C(Cl)=C[C@@H]23
7701	Cl[C@H]1C[C@H]1[C@H]1C[C@@H]1Cl
7702	ClC12CCCC(Cl)(C1)C2
7703	OC(/C=C\\Cl)=C/Cl
7704	ClC1=C(C2=C(Cl)CCCCC2)CCCCC1
7705	CCn1c(C)c(Cl)c(Cl)c1C
7706	ClC1=C(Cl)[C@@H]2C=C[C@@H]3[C@H]1[C@@H]3C=C2
7707	FC(F)(F)c1cccc(-c2c(Cl)c(Cl)nc(Cl)c2Cl)c1
7708	Clc1ccccc1-c1cc2c(ccc3ccccc32)cc1Cl
7709	CC1(C)C/C=C(/Cl)CC/C=C(/Cl)C[C@@H]2O[C@@H]21
7710	CC(O)=Nc1sc(Cl)cc1Cl
7711	C[C@@]1(Cl)CCC[C@]2(C)[C@@H]1CC[C@]1(Cl)OC(=O)CC[C@H]12
7712	C[C@]12OO[C@H](O1)[C@H]1C[C@@H](Cl)[C@@H](Cl)[C@H]12
7713	Cc1cc2c(ccc3sc(Cl)c(-c4c(Cl)sc5ccc6sc(C)cc6c45)c32)s1
7714	Cl/N=c1/c2ccccc2c2nc3c(nc12)/c(=N\\Cl)c1ccccc13
7715	Clc1sc(-c2cc(C#Cc3ccccc3)c(Cl)s2)cc1C#Cc1ccccc1
7716	Clc1cn(-c2ccccc2)cc1Cl
7717	Oc1cc(Cl)c(Cl)c(O)c1Cl
7718	COc1c(C)c2c(c(Cl)c1Cl)Oc1c(Cl)c(O)c(Cl)c(C)c1C(=O)O2
7719	Cc1[nH]c2c(c1Cl)Sc1[nH]c(C)c(Cl)c1S2
7720	O/C=C(Cl)/C(Cl)=C\\O
7721	Clc1cc2ccccc2c2c1OCOc1c(Cl)cc3ccccc3c1-2
7722	C#CC1C(Cl)=CN(c2ccc(C)cc2)C=C1Cl
7723	Cc1c(Cl)cc(Cl)n1C
7724	C#CC1C(Cl)=CN(c2ccccc2C)C=C1Cl
7725	CN(C)c1cc(Cl)c(Cl)cc1Cl
7726	Clc1cccc2c1[C@H]1c3ccccc3[C@@H]2c2c(Cl)cccc21
7727	Clc1ccncc1Cl
7728	Clc1ccc2ccc3ccc4ccc5ccc6ccc(Cl)c7c6c5c4c3c2c1-7
7729	OC(=NCl)c1ccc2c(c1Cl)Oc1ccccc1O2
7730	C#CC1C(Cl)=CN(c2cc(C)cc(C)c2)C=C1Cl
7731	CN1C=CC(=C2C=C(Cl)S(=O)(=O)C(Cl)=C2c2ccccc2)C=C1
7732	ClC1=CCC=C1Cl
7733	Clc1c2c(cc3c1CC1(C3)Cc3cc4c(c(Cl)c3C1)CCCC4)CCCC2
7734	Cc1c(Cl)ccc2c(Cl)cccc12
7735	CC1=C(Cl)[C@H]2[C@@H](C(C)C)CC[C@]1(C)[C@@H]2Cl
7736	Cc1ccc(C)c2cc(Cl)c(Cl)cc12
7737	Clc1ccc2c(c1)[C@@H](Cl)c1ccccc1[C@@H]2Cl
7738	ClC1=CC=C[C@H]1Cl
7739	ClC1=CC[C@@H]2C(Cl)=C(Cl)C[C@H]12
7740	Cl[C@H]1[C@H]2C=C[C@@H]([C@H]1C1(Cl)CC1)C21CC1
7741	Clc1c2ccccc2cc2c(Cl)c3ccccc3cc12
7742	CC1(C)C[C@H]2C=C(Cl)[C@@]3(Cl)C[C@@]3(C)[C@@H]2C1
7743	Cl[C@H]1c2ccccc2[C@H](Cl)c2cc3ccccc3cc21
7744	Cl[C@H]1C[C@@H](Cl)C1
7745	ClC1=C(Cl)c2cc(Cl)ccc2Cc2ccccc21
7746	Clc1cc(Cl)c2c(c1)CCCCC2
7747	O/C=C1\\C=C(Cl)CC(Cl)=C1Cl
7748	Cc1c(-c2csc(Cl)c2C)csc1Cl
7749	C[C@@]1([C@]2(O)CCCC[C@@H]2Cl)[C@H](O)c2occc2[C@@](C)(O)[C@H]1Cl
7750	C#CC1C(Cl)=CN(C(=O)c2ccccc2)C=C1Cl
7751	Clc1cnc2c(Cl)sc3nc(-c4ccccc4)cc1-n-3-2
7752	CC(=O)O[C@H]1C[C@@H](C)[C@H](Cl)[C@]2(O)[C@@H]1C(C)(C)C[C@@]2(C)Cl
7753	CC(C)(C)c1cc(Cl)c(Cl)o1
7754	Cl/C=C\\[C@H](Cl)Br
7755	O=C(OCl)OCl
7756	Clc1cccc2c1-c1cccc(Cl)c1-2
7757	Cl[C@]12CCC[C@@]1(Cl)C2
7758	CSc1cc(Cl)cc(Cl)c1
7759	C/C(C#C/C(C)=C/Cl)=C/Cl
7760	ClC1=C(Cl)[C@H]2C=C[C@@H]1CC2
7761	Oc1ccc(Cl)c(I)c1Cl
7762	ClC[C@]12CCCN3CC[C@@H]4c5ccccc5N(Cl)[C@]4(CC1)[C@@H]32
7763	C[C@@]12CCCC(Cl)=C1N(Cl)c1ccccc12
7764	Cl[C@]12C=C[C@](Cl)(OO1)O2
7765	ClC1=CC2=CC3=CC4=CC=CC=C(C=C(C=C(C=C(Cl)C1)C2)C3)C4
7766	CC(=O)n1cc(Cl)c2c3[nH]cc(Cl)c3ccc21
7767	O=C(Cl)[C@H]1CC2(C[C@H]1Cl)OCCO2
7768	ClNc1cc2c(cc1Cl)OCO2
7769	Cl[C@H]1C[C@H](Cl)[C@@H]2CC=C[C@H]12
7770	Cc1ccc(-c2cc(Cl)cc(Cl)c2)cc1
7771	O[C@H]1C[C@@H](O)[C@@H](CCl)[C@H]1Cl
7772	Cc1cc(Br)c2c(c1)c(C)c(Cl)n2Cl
7773	C=C(Cl)[C@H]1CC[C@H](C)[C@@H]1Cl
7774	CC(C)(Cl)[C@@H]1C[C@H](Cl)c2ccccc21
7775	ClN1C=C([C@@H]2CCCN2Cl)CCC1
7776	ClN1c2ccccc2N(Cl)c2nc3ccccc3nc21
7777	ClC1=NNc2c(Cl)nn(-c3ccccc3)c2O1
7778	ClC1=C(C2=C(Cl)CCC2)CCC1
7779	Oc1c(Br)cc(Br)c(/C=C/Cl)c1Cl
7780	C#C[C@@]1(OCl)CC[C@H]2[C@H]3CC[C@@H]4Cc5oc(Cl)cc5C[C@@]4(C)[C@H]3CC[C@]21C
7781	Clc1ccc(-c2c(Cl)c3sc4ccccc4n3c2Cl)cc1
7782	CC[C@]1(Cl)CCCN2CCc3c(n(Cl)c4ccccc34)[C@@H]21
7783	C#CC1C(Cl)=CN(C(C)=O)C=C1Cl
7784	Oc1c(Cl)ccc2cccc(Cl)c12
7785	Clc1coc(-c2ccc3c(c2)OCO3)c1Cl
7786	CC1(C)C[C@@H]2C=C(Cl)[C@]3(Cl)C[C@]3(C(=O)OC(C)(C)C)[C@@H]2C1
7787	C/C=C1/CN(Cl)[C@H]2C[C@@H]1[C@@H](C(=O)OC)[C@]13C[C@@H](O)O[C@]21N(Cl)c1ccccc13
7788	FC(F)(F)c1ccc(Cl)c(-c2cc(C(F)(F)F)ccc2Cl)c1
7789	CC/C(Cl)=C/Cl
7790	Clc1nc(-c2csc(Cl)n2)cs1
7791	CC1=C(Cl)[C@](C)(Cl)CCC1
7792	Cc1c(Cl)cc(Cl)c(O)c1C
7793	C[C@H]1CC[C@H](CCl)[C@@H]1Cl
7794	ClC1=CO[C@@H]2O[C@H]1OC=C2Cl
7795	Cc1ccc(C)c2c1C[C@@H](OCl)[C@H]1[C@@H]2[C@]2(O)OC[C@@]1(Cl)[C@@H](C)[C@@H]2O
7796	CC1=C(Cl)C=C(Cl)/C1=C\\O
7797	Clc1cccc2c1Oc1c(Cl)cccc1N2
7798	CCc1cc(Cl)cc(Cl)c1
7799	Cl/C=C(/Cl)c1cccs1
7800	C[C@H]1CCC[C@](C)(Cl)CCC2=C1[C@@](C)(CCl)CC2(C)C
7801	CC(C)(Cl)[C@H]1CCC[C@H]1Cl
7802	C#CC1C(Cl)=CN(C)C=C1Cl
7803	Clc1c[nH]nc1Cl
7804	CN1c2ccccc2C(Cl)=C(N2CCN(Cl)CC2)c2sccc21
7805	CC(=O)O[C@@H]1CC[C@@]2(C)C[C@@]2(Cl)[C@@H]1Cl
7806	Cc1cccc2c(Cl)c(Cl)oc12
7807	Cc1cc2c(cc1C)Nc1c(Cl)sc(Cl)c1N2
7808	Cl/C=C\\[C@H](Cl)I
7809	Cc1cc(-c2cc(C)c(Cl)[nH]2)[nH]c1Cl
7810	CCC1=C(Cl)[C@@H](Cl)[C@@H](O)CC1
7811	CC(C)(C)C(=O)c1cc(Cl)[nH]c1Cl
7812	N#Cc1ccc2c(Cl)cnc3c(Cl)sc1-n-2-3
7813	CC1(C)C(=O)[C@H](Cl)[C@H](Cl)C1=O
7814	Clc1cc(Br)c(-c2oc(Cl)cc2Br)o1
7815	ClN1CCN(Cl)c2ccccc21
7816	Fc1cccc2c(Cl)c3ccccc3c(Cl)c12
7817	CC(=O)O[C@@H]1[C@]2(O)CC(C)(C)CC2=C(Cl)[C@@]2(Cl)C[C@@]12C
7818	CC1(C)O[C@@H](Cl)[C@@H]2[C@H](C(=O)Cl)C(=O)c3ccccc3[C@@]2(C)O1
7819	Clc1c2ccccc2c(Cl)c2ncccc12
7820	Cl[C@]12CCCC[C@@]1(Cl)CC2
7821	CC(=O)[C@H]1C(C)(C)C[C@@]2(C)C[C@@H](Cl)C[C@]12Cl
7822	Clc1ccc(-c2ccc(Cl)cc2Cl)cc1
7823	CN1C=C(Cl)C=C[C@H]1c1c(Cl)[nH]c2ccccc12
7824	CC1=C(Cl)C(C)(C)[C@@]2(CC1)OC(C)(C)O[C@H]2[C@H]1CCCC[C@@H]1Cl
7825	Cn1cc(Cl)c2nc3c(Cl)cnc(O)c3c(-c3ccccc3)c2c1=O
7826	C/C=c1/c2c(c3c(/c1=C/C)[C@H](C)C[C@@H](Cl)[C@H]3C)[C@@H](C)C[C@@H](Cl)[C@H]2C
7827	C#CC1C(Cl)=CN(C(C)(C)C)C=C1Cl
7828	Clc1cccc2c1[C@H](Cl)c1ccccc1[C@@H]2Cl
7829	C[C@H]1[C@@H](O)C[C@@H]2C(C)(C)[C@H](O)CC[C@]2(C)[C@]12Cc1c(O)cc(Cl)c(Cl)c1O2
7830	COc1cc(Cl)c(Cl)c2c1C[C@@]1(O2)[C@H](C)CC[C@@H]2C(C)(C)C=CC[C@]21C
7831	C#CC1C(Cl)=CN(c2nc(C)cc(C)n2)C=C1Cl
7832	Cc1c2ccc3ccc4c(Cl)cc(ccc5cc(Cl)c(cc2)c1c5C)c(C)c4c3C
7833	Clc1c[nH]c(-c2nc(Cl)c[nH]2)n1
7834	CC(=O)O[C@H]1C=C(Cl)[C@](O)(Cl)[C@]2(C)CCCC(C)(C)[C@H]12
7835	Clc1ccc2cc1CCc1ccc(Cl)c(c1)CC2
7836	O[C@H]1C[C@H](Cl)O[C@@H](CCl)[C@H]1O
7837	Clc1ccc(Cl)c(-c2cc(Cl)ccc2Cl)c1
7838	O=C1c2ccccc2O[C@H](OCl)N1Cl
7839	Cc1c(Cl)c(-c2ccccc2Cl)cc2ccccc12
7840	COc1c(Cl)sc2c(Cl)c3cccccc-3c12
7841	Cl[C@@H]1C[C@@H](Cl)c2c1ccc1cc[nH]c21
7842	COc1cc(O)c(Cl)c(O)c1Cl
7843	Cn1cc(Cl)c2nc3c(Cl)cn(C)c(=O)c3c(-c3ccccc3)c2c1=O
7844	Cc1cc(C)cc2c(Cl)cc(Cl)c-2c1
7845	Clc1ccc2c(c1)N(Cl)Cc1ccccc1CN2Cl
7846	CC(=O)O[C@@H]1[C@@H]2C=C(Cl)[C@@]3(Cl)C[C@@]3(C)[C@H]2CC1(C)C
7847	CC(C)(C)N(Cl)/C=C/Cl
7848	Clc1cc(Cl)cc([C@H]2OC=Cc3occc3O2)c1
7849	C[C@@H](Cl)N(C)Cl
7850	ClC[C@H]1C=C[C@@H]2[C@H](Cl)[C@@H]12
7851	CC1(C)O[C@@H]2[C@@H](Cl)C[C@H](Cl)[C@@H]2O1
7852	Cc1cc(Cl)c2c(c1)c(C)c(Cl)n2Cl
7853	Clc1oc2c(Cl)cccc2c1Cl
7854	Oc1c(Cl)cc(Br)c(O)c1Cl
7855	COc1c(Cl)c2c3c(c1Cl)O[C@]1(C[C@H]3CC(C)(C)O2)[C@@H]2CC[C@@H](C2)C1(C)C
7856	Cc1ccc(-c2cc(Cl)cc(Cl)c2C)cc1
7857	CC(C)[C@@H]1CC[C@@]2(C)[C@H](Cl)[C@@H]1[C@@H](Cl)[C@@]2(C)O
7858	CC(C)(C)/C(C#CC#C/C(=C\\Cl)C(C)(C)C)=C/Cl
7859	ClO[C@@H]1C[C@H]1Cl
7860	O=c1c(Cl)cnc2c(Cl)c3cccccc3n12
7861	Cl[C@@H]1[C@@H]2CC[C@@H](O2)[C@H]1Cl
7862	Clc1cc(-c2cc(Cl)c3ccccc3n2)nc2ccccc12
7863	Clc1cc2ccc3[nH]cc(Cl)c3c2[nH]1
7864	Cc1c(Cl)c2cc(c1Cl)CCc1cccc(c1)CC2
7865	ClO[C@H]1CC[C@@H]2CN3CCc4c([nH]c5ccccc45)[C@@H]3C[C@@H]2[C@@H]1Cl
7866	Clc1ccc2c(c1)C1(c3ccccc3-2)c2ccccc2-c2ccc(Cl)cc21
7867	Cl[C@@H]1[C@@H]2C=C[C@@H](C2)[C@H]1Cl
7868	ClC[C@H]1c2ccccc2CCN1Cl
7869	CC1=C(C(=O)O)[C@@H]2C=C(Cl)[C@@]3(Cl)C[C@@]3(C)[C@@H]2C1
7870	ClN1C=C([C@@H]2CCCN2Cl)CC1
7871	C[C@]12C(=O)C(Cl)=C(O)[C@](C)(C1=O)[C@@]1(C)C(=O)C(Cl)=C(O)[C@]2(C)C1=O
7872	Clc1c[nH]c(Cl)c1Cl
7873	CC(C)(C)[C@@H]1CN(Cl)c2ccccc2N1Cl
7874	Oc1c(Br)c(Cl)c(Cl)c(Br)c1Br
7875	Cn1c2ccccc2c2nc3c(nc21)N=C(O)N1[C@H]3OC[C@@H](Cl)O[C@@H]1Cl
7876	CC(=O)O/C(Cl)=C(\\Cl)Br
7877	Clc1ccc(-c2ccc(Cl)o2)o1
7878	Cc1c2cc(Cl)c(c1C)CCc1cc(Cl)c(c(C)c1C)CC2
7879	Clc1ccccc1-c1ccc2c(Cl)cccc2c1
7880	O=c1sc2c(s1)SC(Cl)=C(Cl)S2
7881	CC1=C(Cl)[C@](C)(Cl)c2ccccc21
7882	Fc1cccc2c(Cl)c3c(F)cccc3c(Cl)c12
7883	C#CC1C(Cl)=CN(c2cccc3ccccc23)C=C1Cl
7884	Cc1ccc2cc(-c3ccccc3Cl)c(Cl)c3c2c1CC3
7885	Cc1cc(Br)c2[nH]c(Cl)c(Cl)c2c1
7886	Clc1cccc2sc3cccc4cc(Cl)n(c12)c43
7887	CC1(C)/C=C\\C/C(Cl)=C\\CC/C(Cl)=C\\C1
7888	Clc1ccccc1-c1cccnc1Cl
7889	CC(=O)[C@]1(C)[C@H](Cl)C[C@@]2(Cl)CC(C)(C)C[C@@H]21
7890	Cl/C=C(/Cl)Br
7891	N#C/C(Cl)=C\\CCl
7892	C[C@@H]1CCc2c(cc(Cl)c(F)c2Cl)N1
7893	Cl/C1=C/C2=Cc3ccccc3C=C(/C=C(/Cl)C1)C2
7894	Oc1c(Cl)cc(Cl)c2c1CCC2
7895	Cc1c(Cl)n(Cl)c2c(C)cc(Cl)cc12
7896	SC1=NCCCCN=C(S)Nc2ccccc2N(Cl)CCN(Cl)c2ccccc2N1
7897	Cl[C@]12O[C@H]3CC[C@@H]4[C@H]3[C@H]1[C@@H]1[C@@H]3[C@@H]2[C@@H]2CC[C@@H]5O[C@@](Cl)([C@H]3[C@@H]52)[C@H]41
7898	Cl[C@H]1[C@@H]2[C@@H](Cl)[C@H]12
7899	Clc1cccc2ccc3c4ccccc4cc(Cl)c3c12
7900	Clc1cc(I)c(Cl)[nH]1
7901	Cc1cc2c(cc1Cl)CC1(C2)Cc2cc(C)c(Cl)cc2C1
7902	Cl[C@]12O[C@@]1(Cl)[C@H]1C[C@@H]2c2ccccc21
7903	Clc1ccc2ccc(Cl)nc2c1
7904	C=C(Cl)[C@H]1CC[C@@]2(C)CCCC(Cl)=C2C1
7905	CN1C=C(Cl)C=C[C@@H]1c1c(Cl)n(C)c2ccccc12
7906	Cc1ccc2c(Cl)c3ccccc3c(Cl)c2c1Cl
7907	C=C1[C@H](O)CC[C@@](C)(Cl)[C@@H]1Cl
7908	ClC1=C(Cl)SC(=C2SC3=C(SCCS3)S2)S1
7909	ClC#Cc1ccc(C#CCl)s1
7910	Oc1c(Cl)cc(Cl)cc1CCl
7911	CC1(C)C[C@H]2[C@@H](C1)[C@H]1O[C@]2(C)CC(Cl)=C1Cl
7912	Cl[C@H]1CCCC/C1=C1/CCCC[C@H]1Cl
7913	OC(=NCl)N=C(O)NCl
7914	Oc1ccc2c(O)c(Cl)ccc2c1Cl
7915	Cl[C@H]1CCCCCCCC[C@H](Cl)CCCCCCCC1
7916	C=C1CC[C@@H]2[C@@H]([C@@H](C(=C)Cl)[C@@H]1Cl)C2(C)C
7917	CC1(C)CCC[C@]2(C)[C@H]1CC=C(Cl)[C@@]2(O)Cl
7918	OC1=C(Cl)CC[C@@H]2C(O)=C(Cl)CC[C@H]12
7919	ClN=C1NN(Cl)[C@H](c2ccccc2)S1
7920	ClCc1cc(Cl)cc(Cl)c1
7921	CC1=C(C)[C@@H]2CC=C(Cl)[C@H](Cl)[C@]2(C)CC1
7922	CC1(C)C[C@@H]2C[C@]3(Oc4c(Cl)c(O)c(Cl)c(c42)O1)[C@@H]1CC[C@@H](C1)C3(C)C
7923	OC1CN=C(S)Nc2ccccc2N(Cl)CCN(Cl)c2ccccc2NC(S)=NC1
7924	Clc1cccc2ccc3cccc(Cl)c3c12
7925	CC1(C)C(=O)[C@H]2O[C@H]2[C@]2(C)[C@H](Cl)C(Cl)=CC[C@H]12
7926	FC(F)(F)c1cc2c(Cl)cnc3c(Cl)sc(n1)-n-2-3
7927	Cc1ccc(-c2c(Cl)c(Cl)c(Cl)n2C)cc1
7928	O=C1[C@@H](Cl)C[C@H]2C(=O)[C@H](Cl)C[C@@H]12
7929	C[C@@H]1C[C@@H](Cl)C[C@@H]1Cl
7930	Clc1c[nH]c2cc3[nH]cc(Cl)c3cc12
7931	Cl[C@]12CCC[C@@]1(Cl)CC2
7932	CO[C@@]12OO[C@@H](O1)[C@H]1C[C@H](Cl)[C@H](Cl)[C@H]12
7933	Clc1c2ccc(ccc3ccc(o3)c(Cl)c3ccc(ccc4ccc1o4)o3)o2
7934	Clc1ccc(Cl)n1-c1ccccc1
7935	C/C=C1\\CN2CC[C@]34c5ccccc5N(Cl)[C@H]3[C@@H](Cl)[C@H]1C[C@H]24
7936	Clc1cc2c3ccc(ccc1-3)CCc1ccc3c(Cl)cc(c-3cc1)CC2
7937	CS(C)=C1C(Cl)=CC=C1Cl
7938	CC1(C)C(Cl)=C(Cl)CC(Cl)=C1Cl
7939	Cl/C1=C/C2=CC=CC=C(/C=C(/Cl)CC1)C2
7940	Oc1c(Cl)cc(Cl)c2cccnc12
7941	COc1c(Cl)cc(C(F)(F)F)cc1Cl
7942	COC1[C@H](Cl)CC[C@H]1Cl
7943	S=c1sc2c(s1)SC(Cl)=C(Cl)S2
7944	CC1(C)[C@@H](O)CC[C@]2(C)[C@H](Cl)C(Cl)=CC[C@H]12
7945	O=C1c2ccc(Cl)cc2C(=O)c2cc(Cl)ccc21
7946	COc1c(C)c(C)c(O)c(Cl)c1Cl
7947	Clc1cc(Br)c(Cl)[nH]1
7948	Oc1c(Cl)cc(Cl)cc1Br
7949	CC(C)(C)c1ccc(Cl)cc1Cl
7950	CC1=C(Cl)[C@H]([C@@H](C)Cl)CC1
7951	CC1(C)[C@@H]2CC[C@H](Cl)[C@]23C[C@H]1CC=C3Cl
7952	Cn1c(Cl)c(Cl)c(Cl)c1-c1ccccc1
7953	Cc1cc(O)c(Cl)c(C)c1Cl
7954	Cc1cccc(Cl)c1-c1cc2ccccc2cc1Cl
7955	Clc1ccc2sc(Cl)nc2c1
7956	C/C(Cl)=C(/C)Cl
7957	CC1(C)CCC[C@@]2(C)[C@H]1CC=C(Cl)[C@@H]2Cl
7958	Clc1cccc2c1[C@H]1c3ccccc3[C@@H]2c2cccc(Cl)c21
7959	C=C(C)[C@H]1C[C@](C)(Cl)C[C@]1(C)Cl
7960	Cl[C@@H]1c2ccccc2[C@@H]2[C@@H](Cl)[C@H]12
7961	ClC1C[C@]12C[C@@H]2Cl
7962	COc1ccc2c(C)nn(Cl)c3ccc(Cl)c1c23
7963	Oc1c(Cl)c2c(c3ccccc13)O[C@H](CCl)C2
7964	ClC1=CC=CC=C2C(Cl)=CC=CC=C12
7965	ClC1=C(Cl)[C@@]23O[C@@H]1C=C2[C@H]1C=C[C@@H]3CC1
7966	ClN1C=C([C@H]2c3ccccc3CCN2Cl)CCC1
7967	COc1c(Cl)c2c3c(c1Cl)OC(C)(C)CC3CC(C)(C)O2
7968	ClC#Cc1cccc2cc3cccc(C#CCl)c3cc12
7969	Clc1ccc2c(c1)[C@@]1(Cl)CCCC=C1N2Cl
7970	Clc1ccc(N2CCN(Cl)CC2)cc1Br
7971	Clc1c(-c2ccccc2)c(Cl)n2c1sc1ccccc12
7972	CCc1c(Cl)cc(C)cc1Cl
7973	Cc1ccc(Cl)c(-c2ccccc2Cl)c1
7974	COc1c(Cl)cc(Cl)c(O)c1O
7975	O=C1c2ccc(Cl)cc2C(=O)c2c1ccc(Cl)c2-c1c(Cl)ccc2c1C(=O)c1cc(Cl)ccc1C2=O
7976	ClC1=C[C@H]2[C@H]3C=C[C@@H]1C=C(Cl)[C@@H]23
7977	CN1C[C@H](Cl)C[C@@H]1Cl
7978	ClC1=C(Br)[C@H](Cl)CCC1
7979	Clc1cc(Cl)c2cc3ccc4ccc(cc1-2)n43
7980	ClC1=CC=CC=C(Cl)O1
7981	O=C1c2ccccc2C(=O)c2c1c1oc(Cl)cc1c1cc(Cl)oc21
7982	CC(C)(Cl)C#CCl
7983	O=C(Cl)[C@H](Cl)Br
7984	CC1(C)C[C@H]2C[C@H](Cl)[C@@]3(Cl)C[C@@]3(C)[C@@H]2C1
7985	Clc1nc2ccccc2n1-n1c(Cl)nc2ccccc21
7986	C#CC1C(Cl)=CN(C2CCCCC2)C=C1Cl
7987	Cl[C@H]1[C@H]2C=C[C@@H]3[C@H]2[C@@H]2[C@@H]1C=C[C@@H]2[C@H]3Cl
7988	Clc1ccc(Cl)c2/c1=c1/cccc/c1=C/C=c1/cccc/c1=2
7989	ClC1=CC=CC=C(c2cc3cccccc-3c2Cl)C1
7990	Cl[C@]12c3ccccc3[C@H]1[C@@H]1O[C@@]2(Cl)c2ccccc21
7991	ClC#CCCC#CCl
7992	Oc1c(Cl)sc(Cl)c1O
7993	Clc1cc(Cl)cc(-c2ccccc2)c1
7994	Cn1c(Cl)c(Cl)c2cc(Cl)ccc21
7995	O=C1O[C@H]2CC[C@H](Cl)[C@@H]2[C@@H]1CCl
7996	Cc1cc(=O)oc2c(Cl)c(O)c(CCl)cc12
7997	N#Cc1ccc(Cl)c(Cl)c1
7998	ClC1=C(C2=C(Cl)CCCC2)CCCC1
7999	C[C@H]1CC[C@@H](Cl)O[C@@H]1[C@@H]1O[C@H](Cl)CC[C@@H]1C
8000	ClC1=CC(=C2C=CC=CC=C2)C=C1Cl
8001	C=C1C[C@H](Cl)C(Cl)=C2CC(C)(C)C[C@@H]2[C@H]1OC(C)=O
8002	Cc1cc(Cl)c(C)c2c1[nH]c1ccc(N(C)C)c(Cl)c12
8003	Clc1ccccc1-c1cc2c(ccc3ccccc32)nc1Cl
8004	CC(C)(C)OC(=O)n1c2cc(Cl)ccc2c2ccc(Cl)cc21
8005	FC(F)(F)[C@]1(Cl)CC[C@@](Cl)(C(F)(F)F)CC1
8006	Cn1c(=O)nc(O)c2nc(Cl)c(Cl)nc21
8007	Oc1ccc2c(c1Cl)Oc1ccc(O)c(Cl)c1O2
8008	O=C1CC[C@H]2[C@H](Cl)C[C@H]3CC[C@@]12[C@H]3Cl
8009	CC(=O)[C@H]1[C@@H]2C=C[C@@H]([C@@H]2Cl)[C@@H]1Cl
8010	Clc1ccccc1-c1c(Cl)c2ccccc2c2ccccc12
8011	COc1cc2c(cc1Cl)[C@@]1(C)CC[C@]3(C)C(Cl)=C(Cl)CC[C@]3(C)[C@@H]1CC2
8012	COc1c(O)cc(Cl)c(Cl)c1O
8013	Oc1ccc(Cl)c(Br)c1Cl
8014	O/C=C1\\C(Cl)=C(Cl)c2ccccc21
8015	Cc1ccccc1C1C(Cl)=CNC=C1Cl
8016	FC(F)(F)c1cccc(C2C(Cl)=C(Cl)NC(Cl)=C2Cl)c1
8017	COc1cc(Cl)c(Br)c(Cl)c1
8018	O=C1C=C(Cl)COc2ccc(Cl)cc21
8019	C/C=c1\\c2c(/c(=C\\C)c3c1CC[C@H](Cl)C3)CC[C@@H](Cl)C2
8020	ClC1=C(Cl)CC1
8021	Clc1cc(Br)c(Cl)s1
8022	Clc1ccc(Cl)c2c1Oc1ccccc1O2
8023	Clc1ccc(-n2nnc(Cl)c2Cl)cc1
8024	Clc1cc(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)c(Cl)s1
8025	Cl[C@@]12c3ccccc3[C@H]3[C@@H]4C[C@H]4[C@@H]1[C@]32Cl
8026	Clc1cnc2ccccc2c1Cl
8027	C/C(Cl)=C/[C@H](C)Cl
8028	Clc1ccc2c(c1-c1c(Cl)ccc3c1-c1ccccc1-3)-c1ccccc1-2
8029	CC1(C)CCC[C@]2(C)[C@@H]1C(=O)C=C(Cl)[C@]2(O)Cl
8030	CC(=O)Oc1c(Cl)cc(C)cc1Cl
8031	ClC1=C2c3ccccc3CCN2[C@@H]2O[C@H]1N1CCc3ccccc3C1=C2Cl
8032	ClC1=CC=C(Cl)C2=CC=CC=C1C2
8033	ClC1=CC2=Nc3ccccc3N=C3C=C(Cl)[C@H]1C[C@@H]32
8034	O=c1c2cc3c(cc2c(Cl)c2n1CC[C@@H]2CCl)OCO3
8035	Cl/C=C/c1ccccc1Cl
8036	CCn1c(Cl)c(Cl)c2cc(Cl)ccc21
8037	C[C@H]1C[C@H](Cl)/C=C\\C=C/[C@H](Cl)C1
8038	CC1(C)[C@]2(C)N=N[C@@]1(C)[C@@H](Cl)[C@@H]2Cl
8039	O=C1c2ccccc2C(=O)c2c1c(Cl)cc(Cl)c2-c1c(Cl)cc(Cl)c2c1C(=O)c1ccccc1C2=O
8040	C[C@@H](Cl)[C@H]1CCC=C1Cl
8041	Clc1cccc2c1[C@H]1c3cc4ccccc4cc3[C@@H]2c2c(Cl)cccc21
8042	Cc1cc(Cl)c(C)c2c1ccc1ccc3ccc4c(C)cc(Cl)c(C)c4c3c12
8043	Clc1sc(-c2sc(Cl)c(Br)c2Br)c(Br)c1Br
8044	Clc1ccc(-c2ccoc2Cl)[nH]1
8045	FC1=C(F)C(Cl)=C1Cl
8046	C[C@H]1[C@H](n2c(Cl)ccc2Cl)C(=O)O[C@@H]1C
8047	C[C@]12CC[C@@H]3[C@H]4Cc5cc(Cl)oc5C[C@@H]4CC[C@@H]3[C@H]1CC[C@H]2OCl
8048	ClC12CCC(Cl)(C1)C2
8049	Cc1ccc2c(Cl)cccc2c1Cl
8050	ClN1CCCN(Cl)c2ccccc21
8051	Oc1cc(O)c(-c2cc(Cl)c(O)cc2O)cc1Cl
8052	OC(/C=C\\Cl)=C\\Cl
8053	C[C@H]1C[C@@H](Cl)C(Cl)=CC2=C1CC(C)(C)C2
8054	Clc1[nH]c2ccc(Br)cc2c1Cl
8055	Oc1c(Cl)ccc(-c2ccccc2)c1Cl
8056	ClOc1c(Cl)c2ccccc2c2ccccc12
8057	CC(C)(C)S(=O)(=O)c1c(Cl)csc1Cl
8058	Clc1ccc2nc3ccc4nc5ccc(Cl)cc5cc4c3cc2c1
8059	Cl[C@H]1C[C@@H]2C[C@H]1[C@@H]1[C@H]2[S@]2=N[S@]3=N[S@@](=N[S@@]1=N2)[C@H]1[C@@H]3[C@H]2C[C@@H](Cl)[C@@H]1C2
8060	Cl/C=C\\C1C(Cl)=COC=C1Cl
8061	O=C1CCN(Cl)C[C@H]1CCl
8062	COc1ccc2c(c1)[C@]1(Cl)CCC[C@@](C)(Cl)[C@H]1CC2
8063	Cl/C=C/C1C(Cl)=COC=C1Cl
8064	Clc1cccc2c1[C@@H]1c3cccc(Cl)c3[C@H]2[C@@H]2Cc3cc4ccccc4cc3C[C@H]12
8065	Cc1c(C)c(Cl)c2c(c1C)CCc1c(Cl)c(C)c(C)c(C)c1CC2
8066	Clc1cc(Cl)c2c(c1)CCCC2
8067	Cc1csc(Cl)c1Cl
8068	Cl/C=C/C#C/C=C/Cl
8069	O=c1c(Cl)cc(Cl)c2ccccn12
8070	Clc1cc(Cl)c2ccccc2c1Cl
8071	CC1(C)OC[C@H](CCl)[C@@H](Cl)O1
8072	COc1ccc(Cl)c2c(O)ccc(Cl)c12
8073	Cl[C@@H]1C[C@H]2CCC[C@@]2(Cl)C1
8074	Cc1c2ccc3cc(Cl)c4ccc(ccc5cc(Cl)c(cc2)c1c5C)c(C)c4c3C
8075	Clc1ccc2nc3c(ccc4cc5cc(Cl)ccc5nc43)cc2c1
8076	C=C1CC[C@H]2[C@@](C)(Cl)CCC[C@]2(C)[C@H]1CCl
8077	CC(=O)O[C@@H]1CC[C@@H]2[C@H]3C=Cc4c(cc(Cl)c(Cl)c4Cl)[C@@H]3CC[C@]12C
8078	Cc1ccc2cc(Cl)c(Cl)nc2c1
8079	CC(C)(C)Oc1cc(Cl)sc1Cl
8080	ClN1CCOCCNc2ccccc2N(Cl)CCOCCNc2ccccc21
8081	CN(Cl)/C(Cl)=C\\O
8082	Cc1c(Cl)ccc(Cl)c1C
8083	Clc1cc2cnncc2cc1Cl
8084	Clc1cc(Cl)c(N2CCCC2)o1
8085	CC(C)(C)c1cc(C(C)(C)C)c(Cl)cc1Cl
8086	Oc1c(Cl)ccc(I)c1Cl
8087	C[C@H]1CC[C@@]2(C)[C@H](CC=C(Cl)[C@@]2(O)Cl)[C@]12CO2
8088	C[C@]1(Cl)CC[C@@H](CCl)C1=O
8089	CC1(C)CCC[C@]2(C)[C@H]1CC=C(Cl)[C@H]2CCl
8090	O=S1(=O)[C@H](Cl)CC[C@H]1Cl
8091	C/C(Cl)=C/[C@@H](C)Cl
8092	COc1ccc(Cl)c(Cl)c1O
8093	Clc1cc(Cl)c2ccc3cccc4ccc1c2c43
8094	O[C@@H]1CCN(CCl)[C@H]1Cl
8095	O=C1C[C@@H](CCl)C[C@]2(Cl)CC(=O)[C@@H]3CCCC[C@@H]3[C@@H]12
8096	CCc1cc(Cl)c(Cl)cc1O
8097	Cl/N=c1/c2ccccc2c2nc3c(nc12)/c(=N/Cl)c1ccccc13
8098	O[C@H]1[C@@H](O)N(Cl)[C@@H](O)[C@@H](O)N1Cl
8099	Cc1cc(Cl)oc1Cl
8100	CC1(C)O[C@H](Cl)[C@@H]2[C@H](CCl)C(=O)c3ccccc3[C@]2(C)O1
8101	CO[C@@H]1C=C[C@@H](OC)[C@@H](CO)[C@@H]1CO
8102	COC(=O)[C@@H](CO)CCCO
8103	OCC1=NN=C(CO)C1=NNc1cccc(C(F)(F)F)c1
8104	OCC1=NN=C(CO)C1=NNc1nccnn1
8105	C[C@](CO)(c1ccc(Cl)cc1)[C@@H](CO)c1ccc(Cl)cc1
8106	CC1(C)N=C(CO)N=C(CO)N1c1ccc(I)cc1
8107	C[C@@H](CO)[C@@H](CO)C(=O)O
8108	C#C[C@H](CO)CCCCO
8109	[H]/N=C(\\CO)c1cccc2c1CC/C2=N\\NC(=N)CO
8110	CC(O)=Nc1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8111	CC(C)(CCO)C(C)(C)CCO
8112	OC[C@H](c1ccc(F)cc1)[C@H](CO)c1ccc(F)cc1
8113	O=c1nc(O)ccn1[C@H]1C[C@@H](CO)[C@@H](CCO)O1
8114	CC1(C)N=C(CO)N=C(CO)N1c1ccc(C(=O)CCl)cc1
8115	CO[C@@H]1O[C@H](CCO)[C@@H](O)[C@@H](CO)[C@@H]1O
8116	OC/C(C[C@@H](CO)c1ccccc1)=N\\O
8117	O=C1N=C(CO)N=C(CO)/C1=N/O
8118	CC(CCO)CCO
8119	OC[C@H](c1ccccc1O)[C@@H](CO)c1ccccc1O
8120	OCC(=S)CCC(=S)CO
8121	OC[C@@H]1[C@H](O)[C@@H](CO)[C@@H](O)[C@H](O)[C@@H]1O
8122	CN1C(CO)=NC(CO)=NC1(C)C
8123	Cc1cccc(C)c1N1C(CO)=NC(CO)=NC12CCCCC2
8124	OCC/C=C/CCO
8125	OCC(=S)CC(=S)CO
8126	Cc1ccccc1N1C(CO)=NC(CO)=NC1(C)C
8127	C[C@H](CCO)C[C@@H](C)CO
8128	Cc1cc(C)c([C@@H](CO)[C@@H](CO)c2c(C)cc(C)cc2C)c(C)c1
8129	OCCCCCCCCCO
8130	OC[C@H]1[C@H]2CC[C@H](C2)[C@H]1CO
8131	CC(C)(C)OC(=O)C1([C@](C)(CO)CCO)CC1
8132	OCC[C@H]1CCCC[C@H]1CO
8133	OCCc1ccc(CCO)c2ccccc12
8134	CCC1(CC)C(=O)N=C(CO)N=C1CO
8135	CC(C)(C)c1cc(CCO)cc(CCO)c1
8136	C[C@@H](CO)CCO
8137	OCCC(=S)CO
8138	OCC[C@@H](CO)c1ccc(Cl)cc1
8139	OCC(=N\\O)/C(=N\\O)C(/CO)=N\\O
8140	C[C@@H](CO)[C@H](CO)C(=O)O
8141	OCCC(O)CCO
8142	CC1(C)C[C@H](CO)C[C@@](C)(CCO)C1
8143	[H]/N=C(/CO)c1ccc(-c2cc3cc(/C(CO)=N\\[H])ccc3o2)cc1
8144	O=C(O)[C@H](CO)CCCO
8145	OC[C@@H]1C[C@H](CO)[C@@H](O)[C@H](O)[C@H]1O
8146	OCC1=NN=C(CO)C1=NNc1ccc2ccccc2c1
8147	[H]/N=C(/CO)N1CCN(/C(CO)=N/[H])CC1
8148	CC1(C)CC(CO)(CCO)CC(C)(C)N1
8149	OCC1=C(CO)CCCC1
8150	C[C@]1(CO)CNCCNC[C@@](C)(CO)CNCCNC1
8151	OCC(=S)N=C(S)CO
8152	[H]/N=C(/CO)c1ccc2cc(/C(CO)=N\\[H])[nH]c2c1
8153	C[C@@H](CO)C(CO)CO
8154	CC(O)=Nc1ccc([C@@H]2N=C(CO)N=C(CO)N2c2cccc(Cl)c2)cc1
8155	OCC[C@@H]1[C@H]2C=C[C@H](C2)[C@@H]1CCO
8156	CC(O)=Nc1ccc(NN=C2C(CO)=NN=C2CO)cc1
8157	CC[C@H]1N=C(CO)N=C(CO)N1c1ccc(Cl)cc1
8158	OCC(S)=N/N=C/C=N/N=C(S)CO
8159	N=C(CO)Nc1cccc([C@@H](CO)C(=O)O)c1
8160	N=C(CO)Nc1ccc2c(c1)Cc1ccc(NC(=N)CO)cc1C2
8161	CN[C@H]1[C@@H](O)[C@H](O[C@H]2[C@H](CO)C[C@H](CO)[C@@H](O)[C@@H]2O)OC[C@@]1(C)O
8162	OCCC[C@H](CO)c1ccccc1
8163	OCCC[C@H](O)CCO
8164	OCCc1cccc(-c2cccc(CCO)c2)c1
8165	C[C@H]1C[C@H](CO)CC[C@@H]1C[C@@H]1CC[C@H](CO)C[C@H]1C
8166	OC[C@H](c1ccc(Cl)cc1)[C@H](CO)c1ccc(Cl)cc1
8167	OCCc1cc(Cl)cc(CCO)c1
8168	N#CC1=C(CO)SC(CO)=C(C#N)C1c1ccccc1F
8169	COc1ccccc1N1C(CO)=NC(CO)=NC1(C)C
8170	OC[C@@H]1C[C@H](CO)[C@H](O)C[C@@H]1O
8171	CC1(C)N=C(CO)N=C(CO)N1c1ccc(Cc2ccccc2)cc1
8172	CC(C)(C)OC(=O)N1CC[C@H](CO)[C@H](CO)C1
8173	OCC[C@H]1CCCC[C@@H]1CO
8174	CC(O)=NCc1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8175	CC1(C)[C@@H]2C[C@H]1CC[C@]2(CO)CCO
8176	N#CC1=C(CO)/C(=C/c2ccccc2O)C(=O)N=C1CO
8177	OCC[C@@H]1CC[C@@H]1CCO
8178	[H]/N=C(/CO)SCS/C(CO)=N\\[H]
8179	OC[C@@H]1[C@H](O)[C@@H](O)[C@@H](CO)[C@@H](O)[C@H]1O
8180	O=C(O)[C@@H](CO)C[C@@H]1C[C@H]1CO
8181	CC1(C)C[C@H](CO)C[C@](C)(CCO)C1
8182	OCCC[C@@]12C[C@@H]3C[C@@H](C[C@@](CCO)(C3)C1)C2
8183	O=C(CCO)OC(=O)CCO
8184	CC1(C)N=C(CO)N=C(CO)N1c1cccc(S(=O)(=O)F)c1
8185	[H]/N=C(/CO)N(/C(CO)=N\\[H])c1ccncc1
8186	CN1CCC(CO)(CCO)CC1
8187	OCCc1ccc(-c2ccc(CCO)cn2)nc1
8188	OCC1=NC2(CCCCC2)N(OCc2ccccc2)C(CO)=N1
8189	OCC1=NN=C(CO)C1=NNc1cc(F)cc(F)c1
8190	OCC1=NN=C(CO)C1=NNc1cccc(O)c1
8191	OCC(=S)SSC(=S)CO
8192	CC1(C)[C@@H](CO)CC[C@]1(C)CO
8193	CC(C)(C)[C@H](CO)CCO
8194	OCC[C@@H](O)[C@H](O)CCO
8195	[H]/N=C(\\CO)SS/C(CO)=N/[H]
8196	C[C@@](CO)(CCO)c1ccccc1
8197	CO[C@H]1O[C@H]2CO[C@@H](c3ccccc3)O[C@H]2[C@@H](CO)[C@@H]1CO
8198	C=C[C@@H](CO)CCO
8199	COc1ccc(NN=C2C(CO)=NN=C2CO)cc1F
8200	CC1(C)N=C(CO)N=C(CO)N1c1cccc([C@H](O)c2ccccc2)c1
8201	OC[C@@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1CO
8202	OCC(S)=Nc1cccc(N=C(S)CO)c1
8203	C[C@@](CO)(c1ccc(Cl)cc1)[C@H](CO)c1ccc(Cl)cc1
8204	OCC1=N[C@H](c2ccccc2)N(c2ccc(Cl)cc2)C(CO)=N1
8205	CC1(C)O[C@@H]2[C@H](CO)CSC[C@@H](CO)[C@H]2O1
8206	CC1=C(CO)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](CO)[C@H]3O
8207	Cc1cc(CCO)c(C)cc1CCO
8208	[H]/N=C(/CO)SC[C@@H](Br)CCO
8209	CC1(C)N=C(CO)N=C(CO)N1OCc1ccc(Br)cc1
8210	CC(C)(CO)C(=S)CO
8211	COC(=O)[C@H](CO)[C@@H](CO)c1ccccc1
8212	OCCc1ccc(-c2ccc(CCO)cc2)cc1
8213	O=C1C(Cl)=C(CO)C(=O)C(Cl)=C1CO
8214	OCCC1(CO)CC1
8215	COc1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8216	[H]/N=C(\\CO)SCCCCO
8217	O=C1C(CO)=C(CO)C(=O)c2ccccc21
8218	C[C@H]1CC[C@@]2(CC1)N=C(CO)N=C(CO)N2c1ccc(Cl)cc1
8219	C[C@]1(CO)CC[C@@]1(C)CO
8220	CC[C@H](CO)[C@@H](CC)CO
8221	CCOc1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8222	OCC1=CC(F)(F)[C@](F)(Br)C(OCCCl)=C1CO
8223	CC1(C)C[C@@H](CO)C[C@](C)(CCO)C1
8224	O=C(O)[C@@H](CO)[C@H](CO)c1ccccc1
8225	OCCc1cccc(CCO)n1
8226	OC[C@H]1CC[C@H](CO)CC1
8227	C=C(CCO)C(=C)CCO
8228	CCc1ccccc1N1C(CO)=NC(CO)=NC1(C)C
8229	Cc1ccc([C@H](CO)[C@@H](CO)c2ccc(C)cc2)cc1
8230	CC(O)(CCO)CCO
8231	OCCc1ccc(Cl)cc1CCO
8232	N#C/C(CO)=C(/C#N)CO
8233	C[C@](CO)(c1ccccc1)[C@@](C)(CO)c1ccccc1
8234	OC[C@H]1CCC[C@@H]1CO
8235	N#CC1=C(CO)SC(CO)=C(C#N)C1c1ccncc1
8236	OCC[C@H](CO)c1ccccc1
8237	COc1cccc(NN=C2C(CO)=NN=C2CO)c1
8238	OCC1=NN=C(CO)C1=NNc1cc(Cl)cc(Cl)c1
8239	CC1(C)CC(=O)C(CC2=C(CO)CC(C)(C)CC2=O)=C(CO)C1
8240	CC(C)(C)[C@@H](CO)[C@H](CO)C(C)(C)C
8241	CC(/C=N/NC(=N)CO)=N\\NC(=N)CO
8242	C[C@](CO)(c1ccc(Cl)cc1)[C@](C)(CO)c1ccc(Cl)cc1
8243	C[C@@H](CO)[C@@H](CO)c1ccccc1
8244	[H]/N=C(/CO)c1ccc2nc(N3C(=O)C[C@@H](CO)c4ccccc43)[nH]c2c1
8245	[H]/N=C(/CO)CCCO
8246	O=C1N=C(O)C(CO)=C/C1=C1\\C=C(CO)C(O)=NC1=O
8247	O=C(O)[C@@H](CO)CCO
8248	CC1(C)N=C(CO)N=C(CO)N1Cc1ccccc1
8249	OCC1=NC2(CCCCC2)N(c2ccc(Cl)cc2)C(CO)=N1
8250	OCC[C@@H]1CCC[C@@H](CCO)C1
8251	OCCc1ccc2cc(CCO)ccc2c1
8252	Cc1cc(C)cc(N2C(CO)=NC(CO)=NC2(C)C)c1
8253	CC(C)(CO)c1cccc(C(C)(C)CO)c1
8254	[H]/N=C(/CO)c1ccc(-c2cc3ccc(/C(CO)=N\\[H])cc3[nH]2)cc1
8255	O=C1C=C(CO)C(CO)=CC1=O
8256	CC(C)(CCO)CCO
8257	C[C@H](CO)[C@H](C)CO
8258	COC(=O)c1ccc([C@@H](CO)[C@H](CO)c2ccc(C(=O)OC)cc2)cc1
8259	OCC1=N[C@H](c2ccccc2)N(Cc2ccc(Cl)c(Cl)c2)C(CO)=N1
8260	COc1ccc([C@H](CO)CCO)cc1
8261	OCc1cccc(C#CC#Cc2cccc(CO)c2)c1
8262	C[C@H]1C[C@@H](C[C@H]2C[C@H](C)[C@H](CO)[C@@H](C)C2)C[C@@H](C)[C@@H]1CO
8263	OCCC(CCO)c1ccc(F)cc1
8264	CC1(C)N=C(CO)N=C(CO)N1c1ccc(Cl)cc1
8265	OCCC(CO)CO
8266	CC1(C)N=C(CO)N=C(CO)N1c1cccc(Cc2ccccc2)c1
8267	OC/C(C/C(CO)=N\\O)=N\\O
8268	OC[C@@H]1CC[C@H]1CO
8269	O=C1C=C(CO)C=C(CO)C1=O
8270	O=S1(=O)N=C(CO)CC(CO)=N1
8271	CN(C)c1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8272	[H]/N=C(/CO)N1CCC(CCO)CC1
8273	OCCC#Cc1ccccc1C#CCCO
8274	[H]/N=C(/CO)c1cccc(-c2cccc(/C(CO)=N\\[H])n2)n1
8275	OCC1=NN=C(CO)C1=NNc1ccc2c(c1)OCCO2
8276	COC(CCO)CCO
8277	[H]/N=C(\\CO)N(/N=C(/C)C=O)/C(CO)=N/[H]
8278	C[C@H](CO)CCCO
8279	C[C@H]1N=C(CO)N=C(CO)N1c1ccc(Cl)c(Cl)c1
8280	CC[C@](CO)(CCO)c1ccccc1
8281	CCc1cccc(N2C(CO)=NC(CO)=NC2(C)C)c1
8519	O=C(/C(=C/CO)CO)c1ccc(Cl)cc1
8282	OC[C@@H](c1ccccc1)[C@@H](CO)c1ccccc1
8283	OCCC(CO)(c1ccccc1)c1ccccc1
8284	OC[C@H](c1ccc(Cl)cc1)[C@@H](CO)c1ccc(Cl)cc1
8285	OCC1=NN=C(CO)C1=NNc1cccnc1
8286	OCCc1cccc(-c2cccc(CCO)n2)n1
8287	C/C(CO)=C(/C#N)C(=S)CO
8288	Cc1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8289	CCc1cccc(NN=C2C(CO)=NN=C2CO)c1
8290	COc1cc(C)cc2c1C(=O)C(CO)=C(c1c(C)cc3c(c1OC)C(=O)C(CO)=CC3=O)C2=O
8291	CO.OCC(=S)C=S
8292	N=C(CO)NOC(=O)ONC(=N)CO
8293	Cc1cc(C)cc([C@H](CO)[C@@H](CO)c2cc(C)cc(C)c2)c1
8294	O=C1C2=C(CO)CCC(CO)=C2C(=O)c2ccccc21
8295	CC1(C)N=C(CO)N=C(CO)N1c1ccc2c(Cl)cc(Cl)cc2c1
8296	OCC1=N[C@]2(CO)N=CN=C2C=N1
8297	OCCCc1ccccc1CCO
8298	OC/C(=N\\O)c1ccc(/C(CO)=N\\O)cc1
8299	CCC[C@H]1N=C(CO)N=C(CO)N1c1ccc(Cl)cc1
8300	O=C1C(CO)=C(CO)C(=O)c2nsnc21
8301	OCC1=NN=C(CO)C1=NNc1ccc2c(c1)OCO2
8302	OC[C@@H]1c2ccccc2C[C@H]1CO
8303	OCCC#CC#CCCO
8304	OCC(=S)N(/C(CO)=N/Nc1ccccc1)c1ccccc1
8305	OCC[C@@H]1CCCC[C@@H]1CO
8306	CC1(C)N=C(CO)N=C(CO)N1OCc1ccc2ccccc2c1Br
8307	OC[C@H]1CO[C@@H]2[C@H]1OC[C@H]2CO
8308	[H]/N=C(/CO)SCCS/C(CO)=N/[H]
8309	OCC(S)=N/N=C(\\CO)c1ccccn1
8310	CC(C)[C@@H](CO)C(C)(C)CCO
8311	CC1(C)N=C(CO)N=C(CO)N1c1cccc(F)c1
8312	CC1(C)N=C(CO)N=C(CO)N1c1ccc(Br)cc1
8313	O=C1O[C@H]([C@H](O)CO)C(CO)=C1CO
8314	OC[C@H]1C[C@H](CO)CC[C@@H]1CC1CCCCC1
8315	[H]/N=C(/CO)O/C(CO)=N/[H]
8316	[H]/N=C(/CO)c1ccc2c(c1)sc1cc(/C(CO)=N\\[H])ccc12
8317	CC1(C)N=C(CO)N=C(CO)N1CCc1ccccc1
8318	OCC1=NN=C(CO)C1=NNc1cccc(F)c1
8319	OC[C@@H]1CCCC[C@H]1CO
8320	OCC[C@@H]1[C@H]2CC[C@H](C2)[C@@H]1CO
8321	OCC(S)=NN=C(O)c1cccc(C(O)=NN=C(S)CO)c1
8322	[H]/N=C(/CO)c1cccc2c1CC/C2=N\\NC(=N)CO
8323	C[C@@](CO)(CCO)Cc1ccccc1
8324	CC(C)(C)C(CCO)CCO
8325	OCC[C@@H]1CCCC[C@H]1CO
8326	C[C@H](CO)[C@@H](CO)C(=O)O
8327	CC1(C)N=C(CO)N=C(CO)N1OCc1ccc2ccccc2c1
8328	OCC1=N[C@H](c2ccc(Cl)cc2)N(c2ccc(Cl)cc2)C(CO)=N1
8329	N#CC/C(CO)=C(\\C#N)C(CO)=C(C#N)C#N
8330	N=C(CO)N=C(O)NC(O)=NC(=N)CO
8331	N=C(CO)NN=C1C=CC(=NN=C(S)CO)C=C1
8332	Cc1cccc(C)c1N1C(CO)=NC(CO)=NC1(C)C
8333	OCC1=NN=C(CO)C1=NN[C@H]1CNCCO1
8334	[H]/N=C(\\CO)N(C(=S)CO)c1ccccc1
8335	OC[C@H]1CC[C@H](CC[C@H]2CC[C@H](CO)CC2)CC1
8336	CC[C@](C)(CO)CCO
8337	C[C@@](C#N)(CO)[C@](C)(C#N)CO
8338	C[C@H](ON1C(CO)=NC(CO)=NC1(C)C)c1ccc(Cl)c(Cl)c1
8339	OCC1=NN=C(CO)C1=NNc1ccc(F)c(F)c1F
8340	[H]/N=C(CO)/N=N\\C(CO)=N\\[H]
8341	O=C(O)[C@@H](CO)CN=C(CO)NO
8342	OC[C@H]1CC[C@@H](CO)C1
8343	C[C@@H]1[C@@H](CO)CCC[C@H]1CO
8344	OCC1=NN=C(CO)C1=NNc1ccc(F)c(F)c1
8345	CC(=O)c1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8346	CS/C(CO)=C(C#N)/C(C#N)=C(\\CO)SC
8347	COC(=O)C(CCO)CCO
8348	CC1(C)N=C(CO)N=C(CO)N1c1cccc(-c2ccccc2)c1
8349	OCC[C@H](CO)C1CCCCC1
8350	OCC[C@H]1C[C@H]2C[C@@H]1C[C@@H]2CCO
8351	OC[C@H]1CCCCC[C@H]1CO
8352	OCCC1(CO)CCCCC1
8353	OC[C@H]1COC[C@@H]1CO
8354	Cc1ccc([C@H](CO)CCO)cc1
8355	OC[C@@H]1O[C@H](O)[C@H](CO)[C@@H](CO)[C@@H]1O
8356	CCOC(=O)C1=C(CO)NC(CO)=C2C(=O)Oc3ccccc3[C@@H]12
8357	OCC[C@@H]1O[C@@H](O)[C@@H](CO)[C@H](O)[C@@H]1O
8358	CC1(C)C[C@@H](CO)C[C@@H](CO)C1
8359	C[C@@H](CO)C(CO)(c1ccc(F)cc1)c1ccc(F)cc1
8360	N=C(CO)NC(=N)Nc1cccc(NC(=N)NC(=N)CO)c1
8361	OCC[C@@H]1C[C@H]2C[C@@H](CCO)[C@@H]1C2
8362	O=C1N=C(CO)C(=NO)C(CO)=N1
8363	O=S1(=O)N=C(CO)C=C(CO)N1CCc1ccccc1
8364	COc1ccc([C@@H](CO)[C@H](CO)c2ccc(OC)cc2)cc1
8365	OC/C(=N\\O)c1cccc(/C(CO)=N\\O)n1
8366	OCC1=NN=C(CO)C1=NNc1ccc(C(F)(F)F)cc1
8367	CC1(C)N=C(CO)N=C(CO)N1OCc1ccccc1
8368	C[C@@H](CCO)CCCO
8369	CC(=O)c1cccc(N2C(CO)=NC(CO)=NC2(C)C)c1
8370	OCC(=S)SC(=S)CO
8371	OCC1=NN=C(CO)C1=NNc1ccccc1Cl
8372	CC1(C)N=C(CO)N=C(CO)N1c1cccc(O)c1
8373	N=C(CO)N/N=C1\\C/C(=N\\NC(=N)CO)c2ccccc21
8374	OCCCCCCCCO
8375	COc1ccc(NN=C2C(CO)=NN=C2CO)cc1O
8376	CO[C@@H]1O[C@@H](CCO)CC[C@H]1CO
8377	N=C(CO)Nc1ccc2c(c1)Cc1cc(NC(=N)CO)ccc1-2
8378	OCCc1ccccc1-c1ccccc1CCO
8379	OCCC1(CCO)CNC1
8380	CC1(C)N=C(CO)N=C(CO)N1OCc1ccc(Cl)cc1
8381	CC[C@@]1(C)N=C(CO)N=C(CO)N1c1ccc(OC)cc1
8382	CC(C)(CO)CCCO
8383	CC1=CC[C@H](C(C)C)[C@H](CO)[C@H]1CO
8384	N=C(CO)NCCCO
8385	OCC12CCC(CO)(CC1)CC2
8386	OC[C@H]1[C@H]2CC[C@H](C2)[C@@H]1CO
8387	N#CC1=C(CO)SC(CO)=C(C#N)C1
8388	Cc1cc(C)c(CCO)c(C)c1CCO
8389	[H]/N=C1\\C=C(CO)C(=O)C(CO)=C1O
8390	OCC1=NNN=C(CO)C1
8391	OCC1=N[C@H](Cc2ccccc2)N(c2cccc(Cl)c2)C(CO)=N1
8392	C[C@H](CO)C[C@H](C)CO
8393	CC1(C)N=C(CO)N=C(CO)N1c1cccc(I)c1
8394	N=C(CO)NC(=N)NCCNC(=N)NC(=N)CO
8395	CC1(C)O[C@@H](CCO)[C@@H](CCO)O1
8396	COc1ccc(NN=C2C(CO)=NN=C2CO)cc1
8397	OCC1=NN=C(CO)C1=NNc1ccc(I)cc1
8398	CC1(C)N=C(CO)N=C(CO)N1c1cccc(C(=O)O)c1
8399	[H]/N=C(\\CO)c1cccc(-c2cc3ccc(/C(CO)=N\\[H])cc3o2)c1
8400	COc1cccc([C@H](CO)CCO)c1
8401	CC(CCO)(CCO)c1ccccn1
8756	OC[C@H]1CCCCCC[C@H]1CO
8402	N=C(CO)N[C@H]1[C@H](O)[C@@H](O)[C@H](O)[C@H](NC(=N)CO)[C@H]1O
8403	OC[C@@H]1C[C@H](CO)[C@@H](O)[C@H](O)[C@@]12CC[C@@H](O)[C@@H](O)CO2
8404	[H]/N=C(/CO)CCO
8405	OCC1=NN=C(CO)C1=NNc1cccc(Cl)c1
8406	[H]/N=C(\\CO)c1ccc2sc(-c3ccc(/C(CO)=N\\[H])cc3)cc2c1
8407	Cc1c(C)c(CCO)c(C)c(C)c1CCO
8408	[H]/N=C(\\CO)c1ccc2oc3ccc(/C(CO)=N\\[H])cc3c2c1
8409	N#C/C(CO)=C(C#N)/N=C\\C=N\\C(C#N)=C(/C#N)CO
8410	N=C1C=C(CO)C(=O)C(CO)=C1
8411	OCC1=NCN(c2ccc(Cl)cc2)C(CO)=N1
8412	CCc1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8413	C[C@H](CO)CC[C@@H](C)CO
8414	[H]/N=C(/CO)SCC#CCS/C(CO)=N\\[H]
8415	OCC1=NN=C(CO)C1=NNc1ccc(Cl)cc1
8416	OC[C@H]1[C@H](O)[C@H](O)[C@H]2CO[C@H]3O[C@H](CO[C@@H]1O2)[C@H](O)[C@@H](O)[C@H]3CO
8417	CCn1c2ccccc2c2cc(NN=C3C(CO)=NN=C3CO)ccc21
8418	O=C1N=C(CO)N=C(CO)/C1=N\\Nc1ccccc1
8419	Cc1ccc(N=C(S)CO)cc1N=C(S)CO
8420	OCCC#CCCO
8421	OCC(S)=N/N=C\\C=N\\N=C(S)CO
8422	OCC1=NN=C(CO)C1=NNc1cc[nH]n1
8423	OCCc1c(Cl)c(Cl)c(Cl)c(CCO)c1Cl
8424	CC(C)(C)OC(O)=NC(CCO)CCO
8425	OC[C@H](c1ccccc1)[C@H](CO)c1ccccc1
8426	CC(C)(CO)c1ccc(C(C)(C)CO)cc1
8427	COCc1c2c(n3c1[C@H](OC)[C@@H](CO)C3)C(=O)C(C)=C(CO)C2=O
8428	[H]/N=C(\\CO)C/C(CO)=N\\[H]
8429	N=C(CO)NC[C@@H](CO)C(=O)O
8430	C[C@H](CO)c1ccc([C@@H](C)CO)cc1
8431	O=C1C(CO)=C(C2=C(CO)C(=O)c3ccccc3C2=O)C(=O)c2ccccc21
8432	OCC1=NN=C(CO)C1=NNc1ccccc1Br
8433	CCOC(=O)[C@H](CO)CCO
8434	OCC[C@@H]1CCCC[C@@H]1CCO
8435	CC(C)[C@](C)(CO)C(=S)CO
8436	CC1(C)N=C(CO)N=C(CO)N1c1ccc(C(F)(F)F)cc1
8437	OCCC(Br)CCO
8438	OCCC1(CCO)COC1
8439	OCC[C@@H]1O[C@H](O)[C@@H](CO)[C@H](O)[C@@H]1O
8440	O=S1(=O)N=C(CO)C(=NO)C(CO)=N1
8441	OCCc1cc(Br)cc(CCO)c1
8442	CC1(C)[C@@H](CO)C[C@H]1CCO
8443	C[C@H](CO)[C@@H](CO)c1ccccc1
8444	CC(C)(C)c1ccc(N=C(CO)/C(CO)=N/c2ccc(C(C)(C)C)cc2)cc1
8445	O=S1(=O)N=C(CO)C(CO)=N1
8446	OCCC1(CCO)CCC1
8447	N=C(CO)N/N=C1/CC[C@@H]2[C@@H](CC[C@H]3C/C(=N\\NC(=N)CO)CC[C@H]32)C1
8448	CC(=O)[C@@]1(CO)C(I)=CC(I)=C(CO)[C@H]1I
8449	COc1c(C)ncc(CCO)c1CCO
8450	OCCC1(CCO)CCOCC1
8451	CC1=C(CO)C(=O)c2c(CO)c3n(c2C1=O)C[C@@H](CO)[C@H]3O
8452	C[C@](CO)(CCO)C(F)(F)F
8453	COc1cccc(N2C(CO)=NC(CO)=NC2(C)C)c1
8454	[H]/N=C(/CO)c1ccc2[nH]c3ccc(/C(CO)=N\\[H])cc3c2c1
8455	OCCC(CCO)c1ccccn1
8456	OCC(=S)C(C(=S)CO)c1ccccc1
8457	OCC1=NC(=S)N=C(CO)C1c1nnc(-c2ccccc2)c(-c2ccccc2)n1
8458	N=C(CO)N=c1nnc(=NC(=N)CO)[nH][nH]1
8459	CC(C)(C)OC(O)=NC[C@H](CO)CCO
8460	CC(C)([C@H]1CC[C@@H](CO)CC1)[C@H]1CC[C@@H](CO)CC1
8461	CCO[C@@H]1CC[C@@H](CO)[C@@H](CCO)O1
8462	OCC1=NN=C(CO)C1=NNc1cccc(Br)c1
8463	OC[C@H]1CCC[C@H](CO)C1
8464	CC[C@H](CO)C(O)(O)CO
8465	CC(C)C[C@@H](CO)CCO
8466	N#CC1=C(CO)SC(CO)=C(C#N)C1c1ccc(F)cc1
8467	OC/C=C/C=C/CO
8468	Cc1ccc(/C(CO)=N/N=C(\\CO)c2ccc(C)cc2)cc1
8469	C[C@H](CO)[C@H](CO)C(=O)O
8470	OC[C@H]1[C@H](O)C=C[C@@H](O)[C@H]1CO
8471	C[C@@H](CO)[C@@H]1CC[C@H]2[C@H]3CC=C4C[C@@H](CO)CC[C@@]4(C)[C@@H]3CC[C@@]12C
8472	OCC[C@@H]1OCO[C@@H]2[C@@H](CCO)OCO[C@H]12
8473	CC(C)(CO)CCCCO
8474	OCCC[C@@H](CO)c1ccccc1
8475	OC[C@@H]1C[C@@H]2C[C@H]1C[C@H]2CO
8476	CC1(C)N=C(CO)N=C(CO)N1c1ccccc1Cl
8477	CC1(C)N=C(CO)N=C(CO)N1c1cccc(C(=O)CCl)c1
8478	COc1ccc(C2C(C#N)=C(CO)SC(CO)=C2C#N)cc1
8479	OC[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@]14C[C@@H]5C[C@@H](C[C@@](CO)(C5)C1)C4)(C3)C2
8480	OCC12CC3(CO)C[C@H](C1)C[C@H](C2)C3
8481	O=c1nc(O)c(/C=C/Br)cn1[C@H]1C[C@H](CO)[C@H](CCO)O1
8482	OCC(S)=NN=C(S)CO
8483	N=C(CO)NC(=N)c1cccc(C(=N)NC(=N)CO)c1
8484	OCC1=NCN(c2ccc(F)cc2)C(CO)=N1
8485	CC1=C(CO)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](CO)C3
8486	C[C@@H](CO)[C@@H](C)CO
8487	OCC(=N\\O)/C(CO)=N\\O
8488	CC(C)N=C(CO)N=C(CO)Nc1ccc(Cl)cc1
8489	C[C@@H](CO)C/C(CO)=N\\O
8490	CO[C@H]1O[C@H](CCO)[C@@H](O)[C@H](CO)[C@@H]1O
8491	[H]/N=C(/CO)c1ccc2c(c1)[nH]c1cc(/C(CO)=N\\[H])ccc12
8492	OCC(S)=NCCN=C(S)CO
8493	OC[C@@H]1CCC[C@H]1CO
8494	N#CC1=C(CO)SC(CO)=C(C#N)C1c1ccccc1
8495	OCC[C@H]1c2ccccc2C[C@@H]1CO
8496	Cc1ccc([C@@H](CO)[C@H](CO)c2ccc(C)cc2)cc1
8497	O=C(O)[C@H](/C=C/CCO)CO
8498	[H]/N=C(/CO)c1ccc(-c2cc3ccc(/C(CO)=N\\[H])cc3s2)cc1
8499	OCC1=NN=C(CO)C1=NNc1ccc(Br)c2ccccc12
8500	C[C@H](CO)[C@](CO)(c1ccc(F)cc1)c1ccc(F)nc1
8501	CN1CC[C@H](CO)[C@@H](CCO)C1
8502	N=C(CO)NCCCCO
8503	COc1cc(NN=C2C(CO)=NN=C2CO)cc(C(F)(F)F)c1
8504	CC1(C)N=C(CO)N=C(CO)N1OCc1cccc2cccnc12
8505	O=C1O[C@H](CCO)C[C@@H]1CO
8506	C/C(=C\\C(=S)CO)CO
8507	N=C(CO)NCCNC(=N)CO
8508	OC[C@@H]1[C@@H](O)[C@H](O)[C@@H](O)[C@H](CO)[C@@H]1O
8509	CC1(C)N=C(CO)N=C(CO)N1c1cccc(Br)c1
8510	COc1cc(C2C(C#N)=C(CO)SC(CO)=C2C#N)ccc1O
8511	OC[C@H]1CC(O)C[C@H](CO)C1
8512	CC1(C)N=C(CO)N=C(CO)N1OCc1cc(Cl)c(Cl)cc1Cl
8513	N#C[C@@H](CO)[C@@H](C#N)CO
8514	OC[C@H](c1ccccc1O)[C@H](CO)c1ccccc1O
8515	C[C@@H](CO)C[C@@H](C)CO
8516	N=C(CO)N[C@H]1CC[C@H]([C@H](CO)C(=O)O)CC1
8517	CC(C)(CO)[C@H](CO)c1ccccc1
8518	CC1(C)C(=O)N=C(CO)N=C1CO
8520	[H]/N=C(\\CO)c1ccc2nn(-c3ccc(/C(CO)=N\\[H])cc3)cc2c1
8521	OCC12CCC(CO)(c3ccccc31)c1ccccc12
8522	C[C@@H]1N=C(CO)N=C(CO)N1c1cccc(Cl)c1
8523	Cc1ccc([C@@H](CO)[C@@H](CO)c2ccc(C)cc2)cc1
8524	OCC(S)=NCN=C(S)CO
8525	OCCCN(C(=S)CO)c1ccc2nccnc2c1Br
8526	OC[C@H]1COC[C@H]1CO
8527	[H]/N=C(\\CO)c1cccc(-c2cc3cc(/C(CO)=N/[H])ccc3o2)c1
8528	OCCC1(CCO)CCCCC1
8529	OCC(=S)c1cccc(C(=S)CO)c1
8530	OCC1=NN=C(CO)C1=NNc1c(O)ccc2ccccc12
8531	CC(C)[C@]1(C)N=C(CO)N=C(CO)N1c1ccc(Cl)cc1
8532	CO[C@H]1O[C@H](CCO)[C@@H](O)[C@H](CO)[C@H]1O
8533	OC[C@H]1CO[C@@H]2[C@@H](CO)CO[C@H]12
8534	OC[C@H]1Cc2ccccc2[C@@H]1CO
8535	Cc1ncc(CCO)c(CCO)c1Cl
8536	OC[C@H]1CC[C@H](C2([C@H]3CC[C@@H](CO)CC3)CCCCC2)CC1
8537	CC(C)C[C@H](CO)CCO
8538	OCC1=NN=C(CO)C1=NNc1c(F)cccc1F
8539	Cc1cn([C@@H]2C[C@@H](CO)[C@@H](CCO)O2)c(=O)nc1O
8540	O=C1N=C(CO)N=C(O)C1CO
8541	N=C(CO)Nc1ccc(-c2ccc(NC(=N)CO)cc2)cc1
8542	Cc1cc(C)cc([C@@H](CO)[C@@H](CO)c2cc(C)cc(C)c2)c1
8543	CC1(C)N=C(CO)N=C(CO)N1c1cc(Cl)ccc1Cl
8544	OCCCC#CCCCO
8545	OCC1=NN=C(CO)C1=NNc1ncc[nH]1
8546	OCC1=NN=C(CO)C1=NNc1ccc(Cl)c(Cl)c1
8547	OC[C@H]1CC[C@H]1CO
8548	OCC1=N[C@H](c2ccccc2)N(c2cccc(Cl)c2)C(CO)=N1
8549	OCC1=Nc2ccccc2N=C(CO)C1
8550	OCC1=NCN(c2ccccc2)C(CO)=N1
8551	C[C@@]1(CO)CCC[C@H](CO)C1
8552	O=C(O)[C@H](CO)C[C@H]1CC[C@@H](CO)CC1
8553	OCCC(CCO)c1ccccc1
8554	OCC(=S)[C@H](CO)Cc1ccccc1
8555	CC1(C)C(CO)=N/C(=N/N=C2\\N=C(CO)C(C)(C)N2O)N1O
8556	CC1(C)O[C@@H]2[C@H](CO)CSC[C@H](CO)[C@H]2O1
8557	CC1(C)N=C(CO)N=C(CO)N1c1cccc2ccccc12
8558	OC/C(CC/C(CO)=N/O)=N\\O
8559	CCC[C@@H](CO)CCO
8560	CSc1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8561	C[C@H](CCO)/C(CO)=N\\O
8562	CO[C@H]1C[C@@H](CO)C[C@@H](CO)C1
8563	CC(C)[C@H]1N=C(CO)N=C(CO)N1c1ccc(Cl)cc1
8564	OC[C@H]1Nc2cncnc2N[C@@H]1CO
8565	OCC1=NN=C(CO)C1=NNc1ccc(F)cc1
8566	CO[C@H]1OC[C@@H](CO)[C@H](O)[C@@H]1CO
8567	C[C@H](CO)P(=O)(O)[C@H](CO)c1ccccc1
8568	C#C[C@@H](CO)CC[C@@H](C)CO
8569	O=C(O)[C@H](CO)CC#CCCO
8570	OC[C@@H](c1ccccc1Cl)[C@@H](CO)c1ccccc1Cl
8571	OCC1=N[C@H](c2ccccc2)N(c2ccccc2)C(CO)=N1
8572	O=C1C(CO)=C(CO)C(=O)c2ncccc21
8573	OCC1=NC2(c3ccccc3)N=C(CO)NC2(c2ccccc2)N1
8574	CC1(C)N=C(CO)N=C(CO)N1Cc1ccc(Cl)cc1
8575	OCCc1cccc2c(CCO)cccc12
8576	OCCC1(CO)CCN(Cc2ccccc2)CC1
8577	[H]/N=C(\\CO)c1ccc(-c2csc3ccc(/C(CO)=N\\[H])cc23)cc1
8578	OCC12N=C(O)NC1(CO)NC(O)=N2
8579	N=C(CO)NC(=N)N1CCN(C(=N)NC(=N)CO)CC1
8580	CO[C@H]1C=C[C@@H](OC)[C@@H](CO)[C@@H]1CO
8581	OCC1=N[C@@H](c2ccccc2)N(c2ccc(Cl)c(Cl)c2)C(CO)=N1
8582	CC1(C)N=C(CO)N=C(CO)N1c1ccc(-c2ccccc2)cc1
8583	C[C@@](CO)(CCO)C(=O)O
8584	OCC[C@H](CO)Cc1c[nH]c2ccccc12
8585	C[C@@H]1CC(C)(C)[C@@H](CCO)[C@H]1CO
8586	OC[C@@]12C[C@H]3C[C@H]4[C@@H]1C[C@H]1C[C@@H]2[C@@H](C3)[C@]4(CO)C1
8587	OC[C@H](c1cccc2ccccc12)[C@@H](CO)c1cccc2ccccc12
8588	O=C(NN=C(S)CO)c1ccc(C(=O)NN=C(S)CO)cc1
8589	N#CC1=C(CO)Oc2c(ccc3c4c(ccc23)[C@H](c2ccc(Cl)cc2)C(C#N)=C(CO)O4)[C@@H]1c1ccc(Cl)cc1
8590	OCCC12CC3(CCO)C[C@H](C1)C[C@H](C2)C3
8591	OCCCCC1(CO)CCCCC1
8592	OCC12CCCCC1(CO)CCCC2
8593	N=C(CO)NNC(=N)CO
8594	OCC1=CC(=S)C(CO)=CC1=S
8595	OCC1=NN=C(CO)C1=NNc1cccc(I)c1
8596	CC1(C)N=C(CO)N=C(CO)N1c1cccc(Cl)c1
8597	[H]/N=C(\\CO)SC[C@@H]1CN=C(CO)S1
8598	OCC(=S)Oc1ccc(OC(=S)CO)cc1
8599	C[C@H]1N=C(CO)N=C(CO)N1c1ccc(Cl)cc1
8600	C=C(CCO)CCO
8601	CC(/C=N/N=C(S)CO)=N/N=C(S)CO
8602	OCC1=NC(=S)N=C(CO)C1=NO
8603	CC(=O)O/N=C(CO)/C(CO)=N\\OC(C)=O
8604	[H]/N=C(/CO)c1ccc(-c2cc3ccc(/C(CO)=N\\[H])cc3o2)cc1
8605	CC1(C)[C@@H](CCO)CC[C@@]1(C)CCO
8606	CC(C)(CO)C(=O)C(C)(C)CO
8607	N#CC1=C(CO)SC(CO)=C(C#N)C1c1cccc(F)c1
8608	O=C(O)[C@@H]1[C@@H]2[C@H]1C[C@H](CO)[C@@]2(CO)C(=O)O
8609	OC[C@@H]1CC[C@@H](CO)C1
8610	CCC(C)(CCO)CCO
8611	CC1(C)N=C(CO)N=C(CO)N1c1cccc(CO)c1
8612	CC1(C)N=C(CO)N=C(CO)N1c1cccc(C#N)c1
8613	OCCC1(CO)CCCC1
8614	O=C(O)c1ccc(NN=C2C(CO)=NN=C2CO)cc1
8615	CC[C@@]1(C)N=C(CO)N=C(CO)N1c1c(C)cccc1C
8616	CC(C)(CO)CCC(C)(C)CO
8617	OCC(=N\\O)/C(CO)=N/O
8618	CC1(C)[C@H](CO)C(C)(C)[C@H]1CO
8619	OCC[C@H](O)[C@H](O)CCO
8620	Cc1cc(C)c(CCO)cc1CCO
8621	OC[C@H]1C[C@@H]2C[C@@H](CO)C[C@H]2C1
8622	OCC[C@H](CO)Cc1ccccc1
8623	N#CC1=C(CO)SC(CO)=C(C#N)C1c1ccc(Cl)cc1
8624	CC/C(CO)=C(/C#N)C(=S)CO
8625	Cc1ccc(NN=C2C(CO)=NN=C2CO)cc1
8626	[H]/N=C1/C=C(CO)/C(=N/[H])C=C1CO
8627	[H]/N=C(\\CO)c1ccc(CCO)cc1
8628	CC1(C)N=C(CO)N=C(CO)N1c1ccccc1
8629	OC[C@@H](c1c(Cl)cc(O)cc1Cl)[C@@H](CO)c1c(Cl)cc(O)cc1Cl
8630	OCC(=S)[C@@H](CO)c1ccccc1
8631	N=C(CO)Nc1cc(NC(=N)CO)cc(C(=O)O)c1
8632	CC(C)(C)c1ccc(/N=C(CO)/C(CO)=N/c2ccc(C(C)(C)C)cc2)cc1
8633	CC1(C)N=C(CO)N=C(CO)N1c1ccc(Cl)c(Cl)c1
8634	C[C@@H]1CC[C@H](CO)C[C@@H]1CO
8635	CC1(C)N=C(CO)N=C(CO)N1c1cc(Cl)c(Cl)cc1Cl
8636	C[C@]12CC[C@@H](CO)C[C@H]1CC[C@H]1[C@@H]2CC[C@]2(C)[C@H]1CC[C@H]2CO
8637	O=C1C(CO)=C(N2CC2)C(=O)C(CO)=C1N1CC1
8638	CC1(C)N=C(CO)N=C(CO)N1OCc1ccc(Cl)c(Cl)c1
8639	OCC1=NN=C(CO)C1=NN=c1cc[nH]cc1
8640	OCCc1c2ccccc2c(CCO)c2ccccc12
8641	COC1=C(CO)C(=O)C(OC)=C(CO)C1=O
8642	CS/C(CO)=N/N=C(S)CO
8643	OCC(=S)Nc1ccc(NC(=S)CO)cc1
8644	[H]/N=C(CO)\\N=C1/N=C(CO)c2ccccc21
8645	OC[C@H]1[C@H](O)[C@@H](O)[C@H](O)[C@H](CO)[C@@H]1O
8646	CC1(C)N=C(CO)N=C(CO)N1c1ccc(C#N)cc1
8647	OC[C@@H]1CCCC[C@H]1C[C@H]1CCCC[C@H]1CO
8648	CC(C)c1ccccc1NN=C1C(CO)=NN=C1CO
8649	OC[C@@H]1CCC[C@H]2[C@H](CO)CCC[C@@H]12
8650	N=C(CO)NC(=N)CO
8651	O=C(CCO)OCCCO
8652	C/C(CO)=C(\\C#N)C(=S)CO
8653	O=P(O)(CCO)CCO
8654	OCC[C@H]1CC[C@@H](CO)CC1
8655	OCC[C@H](CO)c1cccc(F)c1
8656	CSc1ccc(NN=C2C(CO)=NN=C2CO)cc1
8657	OC[C@@H](C1CCCCC1)[C@@H](CO)C1CCCCC1
8658	OCc1cccc(-c2cccc(CO)c2)c1
8659	OCCC12CCC(CCO)(CC1)CC2
8660	OCC[C@H](CO)c1ccc(C(F)(F)F)cc1
8661	CNC(CCO)CCO
8662	COc1ccc(NN=C2C(CO)=NN=C2CO)cc1Cl
8663	OC[C@H]1CSC[C@H]1CO
8664	CC1(C)N=C(CO)N=C(CO)N1c1ccc(F)cc1
8665	OCCc1cccc2cc3cccc(CCO)c3nc12
8666	[H]/N=C(C#N)\\C(CO)=N/C(C#N)=C(/C#N)CO
8667	OCCC1(CO)CCCCCC1
8668	OCC[C@@H]1CC[C@H](CCO)O1
8669	OCC1=NN=C(CO)C1=NNc1ccc(Br)cc1
8670	OCCc1ccc(CCO)s1
8671	CC(=N\\N=C(S)CO)/C(C)=N/N=C(S)CO
8672	OCC(=S)c1ccc(C(=S)CO)cc1
8673	OCC[C@H]1CCC[C@H](CCO)C1
8674	COC(=O)[C@@H](CO)CCO
8675	OCC[C@@H]1CC[C@H]1CCO
8676	C[C@@H](CO)CC(C)(C)CO
8677	[H]/N=C(\\CO)[C@H](CO)C(=O)OCC
8678	OC/C(=N\\N=C(/CO)c1ccccc1)c1ccccc1
8679	OC[C@H]1C[C@@H](CO)C=C[C@@H]1N=C(O)OCc1ccccc1
8680	OCC1=NC2=NCCN2C(CO)=N1
8681	OC[C@H]1CC[C@H](C[C@H]2CC[C@@H](CO)CC2)CC1
8682	OC[C@@H]1C[C@H]2C[C@@H]1C[C@H]2CO
8683	CC(C)(C)[C@@]1(C)O[C@@H](CCO)[C@@H](CCO)O1
8684	N#CC1=C(CO)SC(CO)=C(C#N)C1c1ccco1
8685	OCC1=NN=C(CO)C1=NNc1cccc2ccccc12
8686	OCC(=S)c1cccc(C(=S)CO)n1
8687	CCC(CC)(CO)CCO
8688	C#Cc1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8689	CO[C@@H]1O[C@H]2CO[C@H](c3ccccc3)O[C@@H]2[C@@H](CO)[C@@H]1CO
8690	N#CC1=C(CO)SC(CO)=C(C#N)C1c1ccccc1Cl
8691	N=C(CO)N[C@H]1[C@H](O)[C@H](NC(=N)CO)[C@@H](O)[C@H](O)[C@@H]1O
8692	[H]/N=C(/CO)c1ccc(-c2cc3cc(/C(CO)=N\\[H])ccc3[nH]2)cc1
8693	OCC12C[C@H]3[C@@H]4CC5(CO)C[C@H]([C@@H](C1)[C@@H]3C5)[C@@H]4C2
8694	OC[C@@H](c1ccco1)[C@H](CO)c1ccco1
8695	OCC[C@H]1CC[C@H](CCO)O1
8696	OCC(=S)SCCSC(=S)CO
8697	OCC[C@]1(CO)CN2CCC1CC2
8698	CC[C@H](CO)[C@H](CC)CO
8699	N#CC1=C(CO)S[C@H](c2ccccc2)[C@@](C#N)(C(=S)CO)[C@H]1c1ccccc1
8700	OC[C@@H]1CCCC[C@@H]1SS[C@H]1CCCC[C@H]1CO
8701	OCC1=NN=C(CO)C1=NNc1ccccc1
8702	N=C(CO)N=C(S)CO
8703	N#CC1=C(CO)SC(CO)=C(C#N)C1c1cccs1
8704	CCCN1C(CO)=NC(CO)=NC1(C)C
8705	OCC12[C@H]3[C@H]4[C@@H]1[C@H]1[C@@H]2[C@@H]3C41CO
8706	OC[C@@H](C1CCCCC1)[C@H](CO)C1CCCCC1
8707	COc1ccc(OC)c(N2C(CO)=NC(CO)=NC2(C)C)c1
8708	CC1(C)[C@@H](CO)CC[C@@]1(C)CO
8709	C[C@H]1C[C@H](C[C@@H]2CC[C@H](CO)[C@H](C)C2)CC[C@@H]1CO
8710	N#C/C(CO)=C(\\C#N)CO
8711	N#C/C(CO)=C(C#N)/N=C/CO
8712	OC[C@@H]1C[C@@H](CO)[C@H](O)C(O)[C@H]1O
8713	OC[C@H]1[C@H](c2ccccc2)[C@H](CO)[C@@H]1c1ccccc1
8714	[H]/N=C(/CO)S/C(CO)=N/[H]
8715	OCC(S)=NN=C1Nc2ccccc2C1=NN=C(S)CO
8716	CC[C@H]1C[C@@H](CC)[C@@H](CO)[C@@H](C)[C@@H]1CO
8717	OCC1(C2(CO)CCCCC2)CCCCC1
8718	CC(C)(C)OC(=O)[C@H](CO)CCO
8719	CC[C@]1(C)N=C(CO)N=C(CO)N1c1ccc(Cl)cc1
8720	[H]/N=C(/CO)SCCCO
8721	COc1cc(OC)cc(N2C(CO)=NC(CO)=NC2(C)C)c1
8722	OC[C@H]1O[C@H](O)[C@@H](CO)[C@H](CO)[C@H]1O
8723	OC[C@@H]1CCCC[C@@H]1C[C@H]1CC[C@@H](CO)CC1
8724	OCCc1cccc2cc3cccc(CCO)c3cc12
8725	OCCc1ccccc1CCO
8726	OC[C@H]1CC[C@@H]2CCCC[C@@H]2[C@H]1CO
8727	N#Cc1ccc([C@@H](CO)[C@H](CO)c2ccc(C#N)cc2)cc1
8728	CC1(C)N=C(CO)N=C(CO)N1c1ccc(S(C)(=O)=O)cc1
8729	CC1(C)N=C(CO)N=C(CO)N1c1ccc2ccccc2c1
8730	OCCC1(CCO)CCCC1
8731	COc1ccc(CN2C(CO)=NC(CO)=NC2(C)C)cc1
8732	C[C@@](CO)(C(=S)CO)c1ccccc1
8733	C/C(CO)=N\\Cc1cccc(CCO)c1
8734	N=C(CO)Nc1ccc(CCO)cc1
8735	OCCc1ccc2c(c1)CN1CN2Cc2cc(CCO)ccc21
8736	O=C(O)[C@H](CO)[C@@H](CO)C(=O)O
8737	OCC1=NN=C(CO)C1=NNc1nc2ccccc2s1
8738	CC(C)/C(CO)=C(/C#N)C(=S)CO
8739	OC[C@H]1Cc2ccccc2[C@H]1CO
8740	CC[C@@H]1C[C@@H](C)[C@H](CO)[C@@H](CC)[C@H]1CO
8741	OCC[C@@H]1CCC[C@H]1CO
8742	Cc1cc(CCO)c(O)c(CCO)c1
8743	OCC1=NN=C(CO)C1=NNCC1CCNCC1
8744	OCc1cccc(C#Cc2ccccc2CO)c1
8745	CCOc1cccc(N2C(CO)=NC(CO)=NC2(C)C)c1
8746	OC[C@@H]1C[C@H](CO)[C@@H](O[C@H]2O[C@H](CO)[C@@H](O)[C@@H](O)[C@H]2O)[C@@H](O)[C@H]1O
8747	OCC[C@@H](CO)C12C[C@H]3C[C@@H](C1)C[C@@H](C2)C3
8748	Cc1cccc(N2C(CO)=NC(CO)=NC2(C)C)c1
8749	OC[C@@H]1C[C@@H](CO)[C@]2(CC[C@@H](O)[C@H](O)CO2)[C@@H](O)[C@@H]1O
8750	OCC[C@H]1O[C@@H](O)[C@@H](CO)[C@@H](O)[C@H]1O
8751	OC[C@H]1CC[C@@H](C[C@H]2CC[C@@H](CO)CC2)CC1
8752	C[C@@H](ON1C(CO)=NC(CO)=NC1(C)C)c1c(Cl)cccc1Cl
8753	Cc1ccc(/N=C(CO)/C(CO)=N/c2ccc(C)cc2)cc1
8754	CC1(C)N=C(CO)N=C(CO)N1OCc1cccc2ccccc12
8755	CC1(C)O[C@@H](CCO)[C@H](CCO)O1
8757	CC(C)(C)c1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8758	CCC1(CC)C(CO)=NC(=O)N=C1CO
8759	O=C(O)[C@H]1NC(CO)=N[C@H]1[C@@H](O)CCO
8760	N#CC1=C(CO)SC(CO)=C(C#N)C1c1ccc(Br)cc1
8761	OC[C@H]1CC=CC[C@@H]1CO
8762	OC[C@@H]1C[C@H](CO)[C@@]2(C[C@@H](O)[C@@H](O)CO2)[C@@H](O)[C@H]1O
8763	Cc1nc(CCO)c(=O)[nH]c1CCO
8764	OCC[C@@H](CO)Cc1ccccc1
8765	OC[C@@H](c1ccccn1)[C@@H](CO)c1ccccn1
8766	OCCc1c(Cl)c(Cl)c(CCO)c(Cl)c1Cl
8767	CC[C@H](CO)CCCO
8768	Cc1ccccc1[C@@H](CO)[C@@H](CO)c1ccccc1C
8769	OC/C(=N\\N=C(\\CO)c1ccccn1)c1ccccn1
8770	O=S(=O)(O)c1ccc(NN=C2C(CO)=NN=C2CO)cc1
8771	COC[C@H](CO)CCO
8772	OC/C(=N\\N=C(/CO)c1ccccn1)c1ccccn1
8773	OC[C@H]1CCCC[C@@H](CO)CCCC1
8774	OCC(=N/Cl)/N=N/C(CO)=N/Cl
8775	[H]/N=C(/CO)c1ccc(-c2nc3cc(/C(CO)=N\\[H])ccc3[nH]2)cc1
8776	OCC12CNCCNCC(CO)(CNCCNC1)CNCCNC2
8777	OC[C@@H](c1ccc(O)cc1)[C@@H](CO)c1ccc(O)cc1
8778	N=C(CO)NN=C1C=CC(=NN=C(S)CO)C=C1
8779	OCC[C@@H]1O[C@@H](O)[C@H](CO)[C@@H](O)[C@H]1O
8780	O=C([C@H](CO)CCCO)N1CCCCC1
8781	Cc1ccc(CCO)cc1CCO
8782	CCON1C(CO)=NC(CO)=NC1(C)C
8783	CC(O)=N[C@@H]1[C@@H](CO)C=C(C(=O)O)C[C@H]1CO
8784	O=C(CCO)CCO
8785	CCC[C@]1(C)N=C(CO)N=C(CO)N1c1ccc(Cl)cc1
8786	CC1(C)N=C(CO)N=C(CO)N1c1ccc(C#Cc2ccccc2)cc1
8787	O=C1CC(CO)=NC(CO)=N1
8788	COC(=O)[C@H](CO)CCO
8789	C[C@@H]1CCC[C@@H](CO)[C@H]1CO
8790	OCC[C@H](O)CO
8791	COC(=O)[C@@H](CO)[C@H](CO)c1ccccc1
8792	OC[C@H](c1ccc(C(F)(F)F)cc1)[C@H](CO)c1ccc(C(F)(F)F)cc1
8793	OCC[C@H]1CC[C@@H](CCO)CC1
8794	C[C@H]1C[C@@H]2C[C@H](C)[C@](C)(CO)[C@@H]3CC[C@@H]4[C@@H]([C@H]23)[C@@H]1CC[C@@]4(C)CO
8795	OC[C@@H]1C[C@H]1CO
8796	N=C(CO)NN=C1C=CC(=NNC(=N)CO)C=C1
8797	OC[C@@H](c1ccc(F)cc1)[C@@H](CO)c1ccc(F)cc1
8798	OC[C@H]1CCc2ccccc2[C@@H]1CO
8799	CC1(C)N=C(CO)N=C(CO)N1O
8800	O=C(O)[C@H](CO)CCO
8801	O=C(CCO)CCCO
8802	OCC/C(CO)=N\\O
8803	OC[C@H]1CC[C@@H]([C@H]2CC[C@H](CO)CC2)CC1
8804	OC[C@H](c1ccc(C(F)(F)F)cc1)[C@@H](CO)c1ccc(C(F)(F)F)cc1
8805	CON1C(CO)=NC(CO)=NC1(C)C
8806	OCCC1=CC[C@H](CCO)CC1
8807	CC(O)=NC1=C(CO)C(=O)C(N=C(C)O)=C(CO)C1=O
8808	OCC(=S)Nc1ccc(-c2ccc(NC(=S)CO)cc2)cc1
8809	C[C@@H]1OC(=O)C(CO)=C1CO
8810	OCC(=N\\O)/C(=N\\O)C(=N/O)/C(CO)=N/O
8811	Cc1ccccc1NN=C1C(CO)=NN=C1CO
8812	OCC[C@@H](CO)CBr
8813	OC[C@H]1[C@@H](O)CN=C(O)[C@H]1CO
8814	O=C(CCO)N=C(O)CCO
8815	CCOC(=O)C1=C(CO)N=C(CO)CC1
8816	OCC[C@@]12C[C@@H]3C[C@@H](C[C@@H](C3)C1)[C@@H]2CO
8817	C[C@H](CCO)CCCO
8818	CC1(C)N=C(CO)N=C(CO)N1c1ccc(C(=O)O)cc1
8819	C[C@H](CO)C(C)(C)CO
8820	C[C@@H](CCO)[C@H](C)CCO
8821	CC1(C)N=C(CO)N=C(CO)N1c1ccccc1Br
8822	OCC(/N=N/C(CO)=N/Cl)=N\\Cl
8823	OCC1=NN=C(CO)C1=NNc1nccs1
8824	OCCC/C(CO)=N\\O
8825	CC1(C)N=C(CO)N=C(CO)N1c1ccc(O)cc1
8826	CC1(C)N=C(CO)N=C(CO)N1c1cccc(C(O)=Nc2cccnc2)c1
8827	O=C1C=C(CO)C(=O)C=C1CO
8828	OCCC(F)CCO
8829	OCCC(F)(F)CCO
8830	OCC1=N[C@@H]2C=C[C@H]1[C@@H]1C=C[C@H]2C(CO)=N1
8831	OCC1=NN=C(CO)C1=NNc1c(F)c(F)c(F)c(F)c1F
8832	Cc1ncc(CCO)c(CCO)c1O
8833	CCOC(=O)c1cccc(N2C(CO)=NC(CO)=NC2(C)C)c1
8834	CC1(C)N=C(CO)N=C(CO)N1c1cccc(C(F)(F)F)c1
8835	N=C(CO)NC(CO)=NCCc1ccccc1
8836	CC1(C)N=C(CO)N=C(CO)N1c1cc(Cl)cc(Cl)c1
8837	O=S(=O)(O)c1ccc(NN=C2C(CO)=NN=C2CO)c2ccccc12
8838	O=C(O)[C@@H](CO)[C@H](CO)C(=O)O
8839	[H]/N=C(\\CO)c1ccc(-c2nc3cc(/C(CO)=N\\[H])ccc3[nH]2)cc1
8840	CCOC(=O)c1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8841	CC1(C)N=C(CO)N=C(CO)N1c1ccc(Cl)cc1Cl
8842	OCCCN=C(O)CCO
8843	CC(C)(C)c1cccc(N2C(CO)=NC(CO)=NC2(C)C)c1
8844	CC(C)/C(=C/C(=S)CO)CO
8845	C[C@@H](CO)O[C@H](C)CO
8846	CC(C)(CO)[C@H]1CC[C@](C)(CO)CC1
8847	C[C@@H](CO)Cc1cccc(C(C)(C)CO)c1
8848	OC[C@H]1CC2(C[C@H](CO)C2)C1
8849	CC1(C)N=C(CO)N=C(CO)N1OCc1c2ccccc2cc2ccccc12
8850	O=S1(=O)N=C(CO)C=C(CO)N1Cc1ccccc1
8851	C[C@H](ON1C(CO)=NC(CO)=NC1(C)C)c1ccc(Cl)cc1Cl
8852	OC[C@H]1CC[C@H](C[C@H]2CC[C@H](CO)CC2)CC1
8853	C[C@H]1CC[C@@H](CO)[C@H](CO)C1
8854	CC1(C)N=C(CO)N=C(CO)N1c1ccc2cc(Cl)ccc2c1
8855	C[C@H](CO)c1ccc(-c2ccc([C@@H](C)CO)cc2)cc1
8856	OCCc1ccc(CCO)o1
8857	[H]/N=C(\\CO)c1ccc(-c2ccc(/C(CO)=N\\[H])cc2)cc1
8858	N=C(CO)NN=C1C=CC(=NNC(=N)CO)C=C1
8859	O=C1C(Br)=C(CO)C(=O)C(Br)=C1CO
8860	COC(=O)c1ccc(N2C(CO)=NC(CO)=NC2(C)C)cc1
8861	CC(=N\\NC(=N)CO)/C(C)=N/NC(=N)CO
8862	CC1(C)N=C(CO)N=C(CO)N1c1ccccc1I
8863	OCC1(OOC2(CO)CCCCC2)CCCCC1
8864	OC[C@@H]1CCC[C@@H](CO)C1
8865	OC/C(=N/O)[C@H](CO)c1ccccc1
8866	OCC[C@@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1CCO
8867	OC[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1CO
8868	OCC1=NN=C(CO)C1=NNc1ccc(O)cc1
8869	OCC[C@H](CO)Cc1ccccc1F
8870	[H]/N=C(/CO)SCCNC(=N)CO
8871	C[C@@H](CO)C(O)=N[C@H]1CO[C@H](O)[C@H](CO)[C@H]1O
8872	CO[C@@H]1O[C@H](CCO)[C@H](O)[C@@H](O)[C@@H]1CO
8873	COC(=O)c1cc(CCO)cc(CCO)c1
8874	NN1CCOCCN(N)CCN(N)CC1
8875	Nc1ccc(C#Cc2ccc(N(c3ccc(C#Cc4ccc(N)cc4)cc3)c3ccc(C#Cc4ccc(N)cc4)cc3)cc2)cc1
8876	Nc1c2cccccc-2c(N)c1N
8877	Nc1coc(N)c1N
8878	Cc1c(N)c(S)c(N)c(C(C)(C)C)c1N
8879	Nc1cc(N)c(Cl)c(N)c1
8880	C=C1COCCN(N)CCN(N)CCN(N)CCOC1
8881	NN1CCN(N)CCN(N)CC1
8882	N[C@H]1O[C@@H](N)O[C@@H](N)O1
8883	Nc1ccc(-c2ccc(N(c3ccc(-c4ccc(N)cc4)cc3)c3ccc(-c4ccc(N)cc4)cc3)cc2)cc1
8884	Nc1cc2c(O)c(c1)Sc1cc(N)cc(c1O)Sc1cc(N)cc(c1O)Sc1cccc(c1O)S2
8885	NC=C1SC(N)=C(N)S1
8886	Nc1ccc2c(N)ccc(N)c2c1
8887	C[C@]12c3ccc(N)cc3[C@]3(C)c4ccc(N)cc4[C@@](C)(c4cc(N)ccc41)[C@]23C
8888	Nc1cc2c(cc1O)Cc1cc(N)c(O)cc1Cc1cc(N)c(O)cc1C2
8889	C[C@]1(N)C[C@@](C)(N)C[C@@](C)(N)C1
8890	Nc1cc(Br)c2cc1/C=C\\c1cc(c(N)cc1Br)/C=C\\c1cc(c(N)cc1Br)/C=C\\2
8891	NN1CCOCCOCCOCCN(N)CCN(N)CC1
8892	Nc1cc(N)c(Cl)c(N)c1Cl
8893	Cc1c(N)cc(N)c(Cl)c1N
8894	COc1cc2c(cc1N)Cc1cc(OC)c(N)cc1Cc1cc(OC)c(N)cc1C2
8895	Nc1cc(N)c(N)[nH]1
8896	Nc1csc(N)c1N
8897	Nc1ccc2c(c1)[C@H]1c3ccc(N)cc3[C@@H]2c2cc(N)ccc21
8898	CC(N)=C1NC(=C(C)N)NC(=C(C)N)N1
8899	Nc1cc(Br)c2cc1/C=C\\c1cc(c(Br)cc1N)/C=C\\c1cc(c(N)cc1Br)/C=C\\2
8900	Nc1cccc2c1[nH]c1c3[nH]c4c(N)cccc4c3c3c4cccc(N)c4[nH]c3c21
8901	Nc1cc(N)c(Br)c(N)c1O
8902	NN1CCNCCN(N)CCN(N)CC1
8903	Cc1c(N)c2n(c1N)CCn1c-2cc(N)c1C
8904	NN1CCOCCOCCOCCOCCN(N)CCN(N)CC1
8905	Nc1ccc2[nH]c3c4[nH]c5ccc(N)cc5c4c4c5cc(N)ccc5[nH]c4c3c2c1
8906	Nc1ccc(C#Cc2cc(N)cc(N)c2)cc1
8907	Nc1cc2c3c4c1Cc1cc(N)c5c(c14)c1c(cc(N)c(c31)C2)C5
8908	CC(=O)N1[C@@H]2[C@H]3N(N)[C@H]4[C@@H](N2N)N(C(C)=O)[C@@H]([C@@H]1N3C(C)=O)N4N
8909	Nc1cccc(C#Cc2ccc(C#Cc3ccccc3N)cc2N)c1
8910	Nc1c(O)c(N)c(Cl)c(N)c1Cl
8911	N[C@H]1CCC[C@@H](N)CCC[C@@H](N)CCC1
8912	Nc1cc(N)c2cc(N)ccc2c1
8913	Cc1c(N)c(N)c(N)n1C
8914	Nc1ccc2nc3cc(N)c4cc5cc(N)ccc5nc4c3cc2c1
8915	NN1CCCN(N)CCOCCN(N)CCC1
8916	Nc1ccc(N)c(N)c1
8917	Nc1cc(C#Cc2ccc(C#Cc3ccccc3N)cc2N)ccc1O
8918	Nc1cc(N)c(N)s1
8919	Nc1c(N)c(Cl)c(Cl)c(N)c1Cl
8920	NN1CCOCCOCCN(N)CCN(N)CC1
8921	N[C@H]1[C@H](N)[C@H]1N
8922	Nc1cccc2[nH]c3c4[nH]c5cccc(N)c5c4c4c([nH]c5cccc(N)c54)c3c12
8923	Nc1ccc2c(c1)[nH]c1c3[nH]c4cc(N)ccc4c3c3c4ccc(N)cc4[nH]c3c21
8924	Cn1c(N)cc(N)c1N
8925	Nc1c(Cl)c(N)c(Cl)c(N)c1Cl
8926	Cc1cc(N)c(N)cc1N
8927	N[C@H]1[C@@H](N)[C@H]2[C@H]([C@@H]3OO[C@H]2O3)[C@H]1N
8928	Nc1c(Br)c(N)c(Br)c(N)c1Br
8929	NN1CCCN(N)CCN(N)CCCNCC1
8930	BrN1CCOCCN(Br)CCN(Br)CC1
8931	Brc1ccc(C#Cc2ccc(N(c3ccc(C#Cc4ccc(Br)cc4)cc3)c3ccc(C#Cc4ccc(Br)cc4)cc3)cc2)cc1
8932	Brc1c2cccccc-2c(Br)c1Br
8933	Brc1coc(Br)c1Br
8934	Cc1c(Br)c(S)c(Br)c(C(C)(C)C)c1Br
8935	Clc1c(Br)cc(Br)cc1Br
8936	C=C1COCCN(Br)CCN(Br)CCN(Br)CCOC1
8937	BrN1CCN(Br)CCN(Br)CC1
8938	Br[C@H]1O[C@@H](Br)O[C@@H](Br)O1
8939	Brc1ccc(-c2ccc(N(c3ccc(-c4ccc(Br)cc4)cc3)c3ccc(-c4ccc(Br)cc4)cc3)cc2)cc1
8940	Oc1c2cccc1Sc1cc(Br)cc(c1O)Sc1cc(Br)cc(c1O)Sc1cc(Br)cc(c1O)S2
8941	BrC=C1SC(Br)=C(Br)S1
8942	Brc1ccc2c(Br)ccc(Br)c2c1
8943	C[C@]12c3ccc(Br)cc3[C@]3(C)c4ccc(Br)cc4[C@@](C)(c4cc(Br)ccc41)[C@]23C
8944	Oc1cc2c(cc1Br)Cc1cc(O)c(Br)cc1Cc1cc(O)c(Br)cc1C2
8945	C[C@]1(Br)C[C@@](C)(Br)C[C@@](C)(Br)C1
8946	Brc1cc(Br)c2cc1/C=C\\c1cc(c(Br)cc1Br)/C=C\\c1cc(c(Br)cc1Br)/C=C\\2
8947	BrN1CCOCCOCCOCCN(Br)CCN(Br)CC1
8948	Clc1c(Br)cc(Br)c(Cl)c1Br
8949	Cc1c(Br)cc(Br)c(Cl)c1Br
8950	COc1cc2c(cc1Br)Cc1cc(OC)c(Br)cc1Cc1cc(OC)c(Br)cc1C2
8951	Brc1csc(Br)c1Br
8952	Brc1ccc2c(c1)[C@H]1c3ccc(Br)cc3[C@@H]2c2cc(Br)ccc21
8953	CC(Br)=C1NC(=C(C)Br)NC(=C(C)Br)N1
8954	Brc1cccc2c1[nH]c1c3[nH]c4c(Br)cccc4c3c3c4cccc(Br)c4[nH]c3c21
8955	Oc1c(Br)cc(Br)c(Br)c1Br
8956	BrN1CCNCCN(Br)CCN(Br)CC1
8957	Cc1c(Br)c2n(c1Br)CCn1c-2cc(Br)c1C
8958	BrN1CCOCCOCCOCCOCCN(Br)CCN(Br)CC1
8959	Brc1ccc2[nH]c3c4[nH]c5ccc(Br)cc5c4c4c5cc(Br)ccc5[nH]c4c3c2c1
8960	Brc1ccc(C#Cc2cc(Br)cc(Br)c2)cc1
8961	Brc1cc2c3c4c1Cc1cc(Br)c5c(c14)c1c(cc(Br)c(c31)C2)C5
8962	CC(=O)N1[C@@H]2[C@H]3N(Br)[C@H]4[C@@H](N2Br)N(C(C)=O)[C@@H]([C@@H]1N3C(C)=O)N4Br
8963	Brc1cccc(C#Cc2ccc(C#Cc3ccccc3Br)cc2Br)c1
8964	Oc1c(Br)c(Cl)c(Br)c(Cl)c1Br
8965	Br[C@H]1CCC[C@@H](Br)CCC[C@@H](Br)CCC1
8966	Brc1cc(Br)c2cc(Br)ccc2c1
8967	Cc1c(Br)c(Br)c(Br)n1C
8968	Brc1ccc2nc3cc(Br)c4cc5cc(Br)ccc5nc4c3cc2c1
8969	BrN1CCCN(Br)CCOCCN(Br)CCC1
8970	Brc1ccc(Br)c(Br)c1
8971	Oc1ccc(C#Cc2ccc(C#Cc3ccccc3Br)cc2Br)cc1Br
8972	Clc1c(Cl)c(Br)c(Br)c(Cl)c1Br
8973	BrN1CCOCCOCCN(Br)CCN(Br)CC1
8974	Br[C@H]1[C@@H](Br)[C@H]1Br
8975	Brc1cccc2[nH]c3c4[nH]c5cccc(Br)c5c4c4c([nH]c5cccc(Br)c54)c3c12
8976	Brc1ccc2c(c1)[nH]c1c3[nH]c4cc(Br)ccc4c3c3c4ccc(Br)cc4[nH]c3c21
8977	Cn1c(Br)cc(Br)c1Br
8978	Cc1cc(Br)c(Br)cc1Br
8979	Br[C@H]1[C@@H]2[C@H]3OO[C@H](O3)[C@@H]2[C@H](Br)[C@@H]1Br
8980	Brc1c(Br)c(Br)c(Br)c(Br)c1Br
8981	BrN1CCCN(Br)CCN(Br)CCCNCC1
8982	CO[C@@H]1C=C[C@@H](OC)[C@@H](C(=O)O)[C@@H]1C(=O)O
8983	COC(=O)[C@H](CCC(=O)O)C(=O)O
8984	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cccc(C(F)(F)F)c1
8985	O=C(O)C1=NN=C(C(=O)O)C1=NNc1nccnn1
8986	C[C@](C(=O)O)(c1ccc(Cl)cc1)[C@H](C(=O)O)c1ccc(Cl)cc1
8987	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(I)cc1
8988	C[C@@H](C(=O)O)C(C(=O)O)C(=O)O
8989	C#C[C@@H](CCCC(=O)O)C(=O)O
8990	[H]/N=C(\\C(=O)O)c1cccc2c1CC/C2=N\\N=C(N)C(=O)O
8991	CC(O)=Nc1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
8992	CC(C)(CC(=O)O)C(C)(C)CC(=O)O
8993	O=C(O)[C@H](c1ccc(F)cc1)[C@H](C(=O)O)c1ccc(F)cc1
8994	O=C(O)C[C@H]1O[C@@H](n2ccc(O)nc2=O)C[C@@H]1C(=O)O
8995	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(C(=O)CCl)cc1
8996	CO[C@@H]1O[C@H](CC(=O)O)[C@H](O)[C@H](C(=O)O)[C@@H]1O
8997	O=C(O)/C(C[C@@H](C(=O)O)c1ccccc1)=N\\O
8998	O=C(O)C1=NC(=O)/C(=N\\O)C(C(=O)O)=N1
8999	CC(CC(=O)O)CC(=O)O
9000	O=C(O)[C@H](c1ccccc1O)[C@H](C(=O)O)c1ccccc1O
9001	O=C(O)C(=S)CCC(=S)C(=O)O
9002	O=C(O)[C@H]1[C@H](O)[C@H](C(=O)O)[C@@H](O)[C@@H](O)[C@@H]1O
9003	CN1C(C(=O)O)=NC(C(=O)O)=NC1(C)C
9004	Cc1cccc(C)c1N1C(C(=O)O)=NC(C(=O)O)=NC12CCCCC2
9005	O=C(O)C/C=C\\CC(=O)O
9006	O=C(O)C(=S)CC(=S)C(=O)O
9007	Cc1ccccc1N1C(C(=O)O)=NC(C(=O)O)=NC1(C)C
9008	C[C@@H](C[C@@H](C)CC(=O)O)C(=O)O
9009	Cc1cc(C)c([C@@H](C(=O)O)[C@@H](C(=O)O)c2c(C)cc(C)cc2C)c(C)c1
9010	O=C(O)CCCCCCCC(=O)O
9011	O=C(O)[C@H]1[C@H]2CC[C@H](C2)[C@H]1C(=O)O
9012	CC(C)(C)OC(=O)C1([C@](C)(CC(=O)O)C(=O)O)CC1
9013	O=C(O)C[C@@H]1CCCC[C@H]1C(=O)O
9014	O=C(O)Cc1ccc(CC(=O)O)c2ccccc12
9015	CCC1(CC)C(=O)N=C(C(=O)O)N=C1C(=O)O
9016	CC(C)(C)c1cc(CC(=O)O)cc(CC(=O)O)c1
9017	O=C(O)CC(=S)C(=O)O
9018	O=C(O)C(C(=O)O)C(C(=O)O)C(=O)O
9019	O=C(O)C[C@H](C(=O)O)c1ccc(Cl)cc1
9020	O=C(O)C(=N\\O)/C(=N\\O)C(=N\\O)/C(=O)O
9021	O=C(O)CC(O)CC(=O)O
9022	CC1(C)C[C@@H](C(=O)O)C[C@@](C)(CC(=O)O)C1
9023	[H]/N=C(/C(=O)O)c1ccc(-c2cc3cc(/C(=N\\[H])C(=O)O)ccc3o2)cc1
9024	O=C(O)CCC(C(=O)O)C(=O)O
9025	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@H](O)[C@@H](O)[C@@H]1O
9026	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc2ccccc2c1
9027	[H]/N=C(/C(=O)O)N1CCN(/C(=N/[H])C(=O)O)CC1
9028	CC1(C)CC(CC(=O)O)(C(=O)O)CC(C)(C)N1
9029	O=C(O)C1=C(C(=O)O)CCCC1
9030	C[C@]1(C(=O)O)CNCCNC[C@](C)(C(=O)O)CNCCNC1
9031	O=C(O)C(=S)NC(=S)C(=O)O
9032	[H]/N=C(/C(=O)O)c1ccc2cc(/C(=N\\[H])C(=O)O)[nH]c2c1
9033	C[C@H](C(=O)O)[C@@H](CO)C(=O)O
9034	CC(O)=Nc1ccc([C@H]2N=C(C(=O)O)N=C(C(=O)O)N2c2cccc(Cl)c2)cc1
9035	O=C(O)C[C@H]1[C@H]2C=C[C@H](C2)[C@@H]1CC(=O)O
9036	CC(O)=Nc1ccc(NN=C2C(C(=O)O)=NN=C2C(=O)O)cc1
9037	CC[C@H]1N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)cc1
9038	O=C(O)C(=S)N/N=C\\C=N\\NC(=S)C(=O)O
9039	NC(=Nc1cccc(C(C(=O)O)C(=O)O)c1)C(=O)O
9040	NC(=Nc1ccc2c(c1)Cc1ccc(N=C(N)C(=O)O)cc1C2)C(=O)O
9041	CN[C@@H]1[C@@H](O)[C@@H](O[C@@H]2[C@@H](C(=O)O)C[C@@H](C(=O)O)[C@@H](O)[C@H]2O)OC[C@@]1(C)O
9042	O=C(O)CC[C@H](C(=O)O)c1ccccc1
9043	O=C(O)CC[C@@H](O)CC(=O)O
9044	O=C(O)Cc1cccc(-c2cccc(CC(=O)O)c2)c1
9045	C[C@@H]1C[C@@H](C(=O)O)CC[C@H]1C[C@@H]1CC[C@H](C(=O)O)C[C@H]1C
9046	O=C(O)[C@H](c1ccc(Cl)cc1)[C@H](C(=O)O)c1ccc(Cl)cc1
9047	O=C(O)Cc1cc(Cl)cc(CC(=O)O)c1
9048	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1ccccc1F
9049	O=C(O)[C@H](c1ccccc1)[C@H](C(=O)O)c1ccccc1
9050	COc1ccccc1N1C(C(=O)O)=NC(C(=O)O)=NC1(C)C
9051	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@H](O)C[C@H]1O
9052	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cc2ccccc2)cc1
9053	CC(C)(C)OC(=O)N1CC[C@H](C(=O)O)[C@H](C(=O)O)C1
9054	CC(O)=NCc1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9055	CC1(C)[C@@H]2C[C@H]1CC[C@]2(CC(=O)O)C(=O)O
9056	N#CC1=C(C(=O)O)/C(=C/c2ccccc2O)C(=O)N=C1C(=O)O
9057	O=C(O)C[C@H]1CC[C@@H]1CC(=O)O
9058	[H]/N=C(\\SCS/C(=N/[H])C(=O)O)C(=O)O
9059	C[C@]1(C(=O)O)CNCCNC[C@@](C)(C(=O)O)CNCCNC1
9060	O=C(O)[C@H]1[C@H](O)[C@H](O)[C@H](C(=O)O)[C@@H](O)[C@H]1O
9061	O=C(O)C(C[C@@H]1C[C@H]1C(=O)O)C(=O)O
9062	CC1(C)C[C@@H](C(=O)O)C[C@](C)(CC(=O)O)C1
9063	O=C(O)CC[C@]12C[C@@H]3C[C@H](C1)C[C@@](CC(=O)O)(C3)C2
9064	O=C(O)CC(=O)OC(=O)CC(=O)O
9065	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(S(=O)(=O)F)c1
9066	[H]/N=C(/C(=O)O)N(/C(=N/[H])C(=O)O)c1ccncc1
9067	CN1CCC(CC(=O)O)(C(=O)O)CC1
9068	O=C(O)Cc1ccc(-c2ccc(CC(=O)O)cn2)nc1
9069	O=C(O)C1=NC2(CCCCC2)N(OCc2ccccc2)C(C(=O)O)=N1
9070	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cc(F)cc(F)c1
9071	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cccc(O)c1
9072	O=C(O)C(=S)SSC(=S)C(=O)O
9073	CC1(C)[C@H](C(=O)O)CC[C@@]1(C)C(=O)O
9074	CC(C)(C)[C@H](CC(=O)O)C(=O)O
9075	O=C(O)C[C@H](O)[C@H](O)CC(=O)O
9076	[H]/N=C(\\SS/C(=N/[H])C(=O)O)C(=O)O
9077	C[C@](CC(=O)O)(C(=O)O)c1ccccc1
9078	CO[C@@H]1O[C@@H]2CO[C@@H](c3ccccc3)O[C@@H]2[C@@H](C(=O)O)[C@H]1C(=O)O
9079	C=C[C@H](CC(=O)O)C(=O)O
9080	COc1ccc(NN=C2C(C(=O)O)=NN=C2C(=O)O)cc1F
9081	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc([C@@H](O)c2ccccc2)c1
9082	O=C(O)[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1C(=O)O
9083	O=C(O)C(=S)Nc1cccc(NC(=S)C(=O)O)c1
9084	C[C@@](C(=O)O)(c1ccc(Cl)cc1)[C@@H](C(=O)O)c1ccc(Cl)cc1
9085	O=C(O)C1=N[C@@H](c2ccccc2)N(c2ccc(Cl)cc2)C(C(=O)O)=N1
9086	CC1(C)O[C@H]2[C@@H](C(=O)O)CSC[C@@H](C(=O)O)[C@H]2O1
9087	CC1=C(C(=O)O)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](C(=O)O)[C@@H]3O
9088	Cc1cc(CC(=O)O)c(C)cc1CC(=O)O
9089	[H]/N=C(/SC[C@H](Br)CC(=O)O)C(=O)O
9090	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1ccc(Br)cc1
9091	CC(C)(C(=O)O)C(=S)C(=O)O
9092	COC(=O)[C@@H](C(=O)O)[C@H](C(=O)O)c1ccccc1
9093	O=C(O)Cc1ccc(-c2ccc(CC(=O)O)cc2)cc1
9094	O=C(O)C1=C(Cl)C(=O)C(C(=O)O)=C(Cl)C1=O
9095	O=C(O)CC1(C(=O)O)CC1
9096	COc1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9097	[H]/N=C(/SCCCC(=O)O)C(=O)O
9098	O=C(O)C1=C(C(=O)O)C(=O)c2ccccc2C1=O
9099	C[C@H]1CC[C@]2(CC1)N=C(C(=O)O)N=C(C(=O)O)N2c1ccc(Cl)cc1
9100	C[C@]1(C(=O)O)CC[C@@]1(C)C(=O)O
9101	CC[C@H](C(=O)O)[C@H](CC)C(=O)O
9102	CCOc1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9103	O=C(O)C1=CC(F)(F)[C@@](F)(Br)C(OCCCl)=C1C(=O)O
9104	O=C(O)C(C(=O)O)[C@H](C(=O)O)c1ccccc1
9105	O=C(O)[C@@H](c1ccccc1O)[C@@H](C(=O)O)c1ccccc1O
9106	O=C(O)Cc1cccc(CC(=O)O)n1
9107	C=C(CC(=O)O)C(=C)CC(=O)O
9108	CCc1ccccc1N1C(C(=O)O)=NC(C(=O)O)=NC1(C)C
9109	Cc1ccc([C@H](C(=O)O)[C@@H](C(=O)O)c2ccc(C)cc2)cc1
9110	CC(O)(CC(=O)O)CC(=O)O
9111	O=C(O)Cc1ccc(Cl)cc1CC(=O)O
9112	N#C/C(C(=O)O)=C(/C#N)C(=O)O
9113	C[C@](C(=O)O)(c1ccccc1)[C@](C)(C(=O)O)c1ccccc1
9114	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1ccncc1
9115	O=C(O)C[C@H](C(=O)O)c1ccccc1
9116	COc1cccc(NN=C2C(C(=O)O)=NN=C2C(=O)O)c1
9117	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cc(Cl)cc(Cl)c1
9118	CC1(C)CC(=O)C(CC2=C(C(=O)O)CC(C)(C)CC2=O)=C(C(=O)O)C1
9119	CC(C)(C)[C@@H](C(=O)O)[C@@H](C(=O)O)C(C)(C)C
9120	CC(/C=N\\N=C(N)C(=O)O)=N/N=C(N)C(=O)O
9121	C[C@](C(=O)O)(c1ccc(Cl)cc1)[C@](C)(C(=O)O)c1ccc(Cl)cc1
9122	C[C@@H](C(=O)O)[C@H](C(=O)O)c1ccccc1
9123	[H]/N=C(\\C(=O)O)c1ccc2nc(N3C(=O)C[C@H](C(=O)O)c4ccccc43)[nH]c2c1
9124	[H]/N=C(/CCC(=O)O)C(=O)O
9125	O=C(O)C1=C/C(=C2/C=C(C(=O)O)C(=O)N=C2O)C(O)=NC1=O
9126	O=C(O)CC(C(=O)O)C(=O)O
9127	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1Cc1ccccc1
9128	O=C(O)C1=NC2(CCCCC2)N(c2ccc(Cl)cc2)C(C(=O)O)=N1
9129	O=C(O)C[C@H]1CCC[C@@H](CC(=O)O)C1
9130	O=C(O)Cc1ccc2cc(CC(=O)O)ccc2c1
9131	Cc1cc(C)cc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9132	CC(C)(C(=O)O)c1cccc(C(C)(C)C(=O)O)c1
9133	[H]/N=C(/C(=O)O)c1ccc(-c2cc3ccc(/C(=N\\[H])C(=O)O)cc3[nH]2)cc1
9134	O=C(O)C1=CC(=O)C(=O)C=C1C(=O)O
9135	CC(C)(CC(=O)O)CC(=O)O
9136	C[C@H](C(=O)O)[C@@H](C)C(=O)O
9137	COC(=O)c1ccc([C@@H](C(=O)O)[C@@H](C(=O)O)c2ccc(C(=O)OC)cc2)cc1
9138	O=C(O)C1=N[C@@H](c2ccccc2)N(Cc2ccc(Cl)c(Cl)c2)C(C(=O)O)=N1
9139	COc1ccc([C@@H](CC(=O)O)C(=O)O)cc1
9140	O=C(O)c1cccc(C#CC#Cc2cccc(C(=O)O)c2)c1
9141	C[C@H]1C[C@H](C[C@H]2C[C@H](C)[C@@H](C(=O)O)[C@@H](C)C2)C[C@@H](C)[C@H]1C(=O)O
9142	O=C(O)CC(CC(=O)O)c1ccc(F)cc1
9143	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)cc1
9144	O=C(O)C[C@@H](CO)C(=O)O
9145	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(Cc2ccccc2)c1
9146	O=C(O)/C(C/C(=N/O)C(=O)O)=N\\O
9147	O=C(O)[C@H]1CC[C@@H]1C(=O)O
9148	O=C(O)C1=CC(=O)C(=O)C(C(=O)O)=C1
9149	O=C(O)C1=NS(=O)(=O)N=C(C(=O)O)C1
9150	CN(C)c1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9151	[H]/N=C(\\C(=O)O)N1CCC(CC(=O)O)CC1
9152	O=C(O)CC#Cc1ccccc1C#CCC(=O)O
9153	[H]/N=C(/C(=O)O)c1cccc(-c2cccc(/C(=N\\[H])C(=O)O)n2)n1
9154	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc2c(c1)OCCO2
9155	COC(CC(=O)O)CC(=O)O
9156	[H]/N=C(/C(=O)O)N(/N=C(/C)C=O)/C(=N\\[H])C(=O)O
9157	C[C@@H](CCC(=O)O)C(=O)O
9158	C[C@@H]1N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)c(Cl)c1
9159	CC[C@@](CC(=O)O)(C(=O)O)c1ccccc1
9160	CCc1cccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9161	O=C(O)CC(C(=O)O)(c1ccccc1)c1ccccc1
9162	O=C(O)[C@H](c1ccc(Cl)cc1)[C@@H](C(=O)O)c1ccc(Cl)cc1
9163	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cccnc1
9164	O=C(O)Cc1cccc(-c2cccc(CC(=O)O)n2)n1
9165	C/C(C(=O)O)=C(\\C#N)C(=S)C(=O)O
9166	Cc1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9167	CCc1cccc(NN=C2C(C(=O)O)=NN=C2C(=O)O)c1
9168	COc1cc(C)cc2c1C(=O)C(C(=O)O)=C(c1c(C)cc3c(c1OC)C(=O)C(C(=O)O)=CC3=O)C2=O
9169	O=C(O)C(=S)C(=S)C(=O)O
9170	NC(=NOC(=O)ON=C(N)C(=O)O)C(=O)O
9171	Cc1cc(C)cc([C@@H](C(=O)O)[C@H](C(=O)O)c2cc(C)cc(C)c2)c1
9172	O=C(O)C1=C2C(=O)c3ccccc3C(=O)C2=C(C(=O)O)CC1
9173	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc2c(Cl)cc(Cl)cc2c1
9174	O=C(O)C1=N[C@]2(C(=O)O)N=CN=C2C=N1
9175	O=C(O)CCc1ccccc1CC(=O)O
9176	O=C(O)/C(=N\\O)c1ccc(/C(=N\\O)C(=O)O)cc1
9177	CCC[C@H]1N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)cc1
9178	O=C(O)C1=C(C(=O)O)C(=O)c2nsnc2C1=O
9179	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc2c(c1)OCO2
9180	O=C(O)[C@@H]1Cc2ccccc2[C@@H]1C(=O)O
9181	O=C(O)[C@@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1C(=O)O
9182	O=C(O)CC#CC#CCC(=O)O
9183	O=C(O)C(=S)N(/C(=N/Nc1ccccc1)C(=O)O)c1ccccc1
9184	O=C(O)C[C@@H]1CCCC[C@@H]1C(=O)O
9185	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1ccc2ccccc2c1Br
9186	O=C(O)[C@H]1CO[C@H]2[C@@H](C(=O)O)CO[C@@H]12
9187	[H]/N=C(\\SCCS/C(=N\\[H])C(=O)O)C(=O)O
9188	O=C(O)C(=S)N/N=C(/C(=O)O)c1ccccn1
9189	CC(C)[C@H](C(=O)O)C(C)(C)CC(=O)O
9190	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(F)c1
9191	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Br)cc1
9192	O=C(O)C1=C(C(=O)O)[C@@H]([C@H](O)CO)OC1=O
9193	O=C(O)[C@H]1CC[C@@H](CC2CCCCC2)[C@H](C(=O)O)C1
9194	CC(C)[C@@H](CC(=O)O)C(=O)O
9195	[H]/N=C(/O/C(=N/[H])C(=O)O)C(=O)O
9196	[H]/N=C(/C(=O)O)c1ccc2c(c1)sc1cc(/C(=N\\[H])C(=O)O)ccc12
9197	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1CCc1ccccc1
9198	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cccc(F)c1
9199	O=C(O)[C@@H]1CCCC[C@H]1C(=O)O
9200	O=C(O)C[C@H]1[C@H]2CC[C@H](C2)[C@H]1C(=O)O
9201	O=C(O)C(=S)NN=C(O)c1cccc(C(O)=NNC(=S)C(=O)O)c1
9202	[H]/N=C(/C(=O)O)c1cccc2c1CC/C2=N\\N=C(N)C(=O)O
9203	C[C@](CC(=O)O)(Cc1ccccc1)C(=O)O
9204	CC(C)(C)C(CC(=O)O)CC(=O)O
9205	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1ccc2ccccc2c1
9206	O=C(O)C1=N[C@H](c2ccc(Cl)cc2)N(c2ccc(Cl)cc2)C(C(=O)O)=N1
9207	N#CC/C(C(=O)O)=C(/C#N)C(C(=O)O)=C(C#N)C#N
9208	N=C(N=C(O)NC(O)=NC(=N)C(=O)O)C(=O)O
9209	NC(=NN=C1C=CC(=NNC(=S)C(=O)O)C=C1)C(=O)O
9210	Cc1cccc(C)c1N1C(C(=O)O)=NC(C(=O)O)=NC1(C)C
9211	O=C(O)C1=NN=C(C(=O)O)C1=NN[C@H]1CNCCO1
9212	[H]/N=C(\\C(=O)O)N(C(=S)C(=O)O)c1ccccc1
9213	O=C(O)[C@H]1CC[C@H](CC[C@H]2CC[C@@H](C(=O)O)CC2)CC1
9214	CC[C@@](C)(CC(=O)O)C(=O)O
9215	C[C@@](C#N)(C(=O)O)[C@](C)(C#N)C(=O)O
9216	C[C@H](ON1C(C(=O)O)=NC(C(=O)O)=NC1(C)C)c1ccc(Cl)c(Cl)c1
9217	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(F)c(F)c1F
9218	[H]/N=C(\\N=N\\C(=N\\[H])C(=O)O)C(=O)O
9219	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@H](O)[C@H](O)[C@H]1O
9220	O=C(O)C(=NO)NCC(C(=O)O)C(=O)O
9221	O=C(O)[C@H]1CC[C@@H](C(=O)O)C1
9222	C[C@H]1[C@@H](C(=O)O)CCC[C@H]1C(=O)O
9223	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(F)c(F)c1
9224	CC(=O)c1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9225	CS/C(C(=O)O)=C(C#N)/C(C#N)=C(\\SC)C(=O)O
9226	COC(=O)C(CC(=O)O)CC(=O)O
9227	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(-c2ccccc2)c1
9228	O=C(O)C[C@@H](C(=O)O)C1CCCCC1
9229	O=C(O)C[C@@H]1C[C@@H]2C[C@H]1C[C@@H]2CC(=O)O
9230	O=C(O)[C@H]1CCCCC[C@@H]1C(=O)O
9231	O=C(O)CC1(C(=O)O)CCCCC1
9232	O=C(O)[C@@H]1COC[C@@H]1C(=O)O
9233	Cc1ccc([C@H](CC(=O)O)C(=O)O)cc1
9234	O=C(O)[C@@H]1[C@@H](O)O[C@H](CO)[C@@H](O)[C@@H]1C(=O)O
9235	CCOC(=O)C1=C(C(=O)O)NC(C(=O)O)=C2C(=O)Oc3ccccc3[C@H]12
9236	O=C(O)C[C@H]1O[C@@H](O)[C@H](C(=O)O)[C@@H](O)[C@H]1O
9237	CC1(C)C[C@@H](C(=O)O)C[C@@H](C(=O)O)C1
9238	C[C@H](C(=O)O)C(C(=O)O)(c1ccc(F)cc1)c1ccc(F)cc1
9239	N=C(N=C(N)C(=O)O)Nc1cccc(NC(=N)N=C(N)C(=O)O)c1
9240	O=C(O)C[C@@H]1C[C@H]2C[C@@H](CC(=O)O)[C@@H]1C2
9241	O=C1N=C(C(=O)O)C(=NO)C(C(=O)O)=N1
9242	O=C(O)C1=CC(C(=O)O)=NS(=O)(=O)N1CCc1ccccc1
9243	COc1ccc([C@@H](C(=O)O)[C@@H](C(=O)O)c2ccc(OC)cc2)cc1
9244	O=C(O)/C(=N\\O)c1cccc(/C(=N\\O)C(=O)O)n1
9245	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(C(F)(F)F)cc1
9246	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1ccccc1
9247	C[C@@H](CCC(=O)O)CC(=O)O
9248	CC(=O)c1cccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9249	O=C(O)C(=S)SC(=S)C(=O)O
9250	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccccc1Cl
9251	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(O)c1
9252	NC(=N/N=C1/C/C(=N\\N=C(N)C(=O)O)c2ccccc21)C(=O)O
9253	O=C(O)CCCCCCC(=O)O
9254	COc1ccc(NN=C2C(C(=O)O)=NN=C2C(=O)O)cc1O
9255	CO[C@H]1O[C@H](CC(=O)O)CC[C@@H]1C(=O)O
9256	NC(=Nc1ccc2c(c1)Cc1cc(N=C(N)C(=O)O)ccc1-2)C(=O)O
9257	O=C(O)Cc1ccccc1-c1ccccc1CC(=O)O
9258	O=C(O)CC1(CC(=O)O)CNC1
9259	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1ccc(Cl)cc1
9260	CC[C@@]1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(OC)cc1
9261	CC(C)(CCC(=O)O)C(=O)O
9262	CC1=CC[C@@H](C(C)C)[C@@H](C(=O)O)[C@H]1C(=O)O
9263	NC(=NCCC(=O)O)C(=O)O
9264	O=C(O)C12CCC(C(=O)O)(CC1)CC2
9265	O=C(O)[C@@H]1[C@H]2CC[C@H](C2)[C@H]1C(=O)O
9266	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1
9267	Cc1cc(C)c(CC(=O)O)c(C)c1CC(=O)O
9268	[H]/N=C1/C=C(C(=O)O)C(=O)C(C(=O)O)=C1O
9269	O=C(O)C1=NNN=C(C(=O)O)C1
9270	O=C(O)C1=N[C@@H](Cc2ccccc2)N(c2cccc(Cl)c2)C(C(=O)O)=N1
9271	C[C@H](C[C@@H](C)C(=O)O)C(=O)O
9272	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(I)c1
9273	C[C@@H](CC(=O)O)C(=O)O
9274	N=C(N=C(N)C(=O)O)NCCNC(=N)N=C(N)C(=O)O
9275	CC1(C)O[C@@H](CC(=O)O)[C@@H](CC(=O)O)O1
9276	C[C@@H](C[C@H](C)C(=O)O)C(=O)O
9277	COc1ccc(NN=C2C(C(=O)O)=NN=C2C(=O)O)cc1
9278	CC1(C)[C@@H](C(=O)O)CC[C@]1(C)C(=O)O
9279	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(I)cc1
9280	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(C(=O)O)c1
9281	[H]/N=C(/C(=O)O)c1cccc(-c2cc3ccc(/C(=N\\[H])C(=O)O)cc3o2)c1
9282	COc1cccc([C@H](CC(=O)O)C(=O)O)c1
9283	CC(CC(=O)O)(CC(=O)O)c1ccccn1
9284	NC(=N[C@H]1[C@H](O)[C@@H](N=C(N)C(=O)O)[C@@H](O)[C@@H](O)[C@@H]1O)C(=O)O
9285	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@H](O)[C@H](O)[C@]12CC[C@@H](O)[C@H](O)CO2
9286	[H]/N=C(\\CC(=O)O)C(=O)O
9287	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cccc(Cl)c1
9288	[H]/N=C(/C(=O)O)c1ccc(-c2cc3cc(/C(=N\\[H])C(=O)O)ccc3s2)cc1
9289	Cc1c(C)c(CC(=O)O)c(C)c(C)c1CC(=O)O
9290	[H]/N=C(/C(=O)O)c1ccc2oc3ccc(/C(=N\\[H])C(=O)O)cc3c2c1
9291	N#CC(/N=C/C=N/C(C#N)=C(\\C#N)C(=O)O)=C(\\C#N)C(=O)O
9292	N=C1C=C(C(=O)O)C(=O)C(C(=O)O)=C1
9293	O=C(O)C1=NCN(c2ccc(Cl)cc2)C(C(=O)O)=N1
9294	CCc1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9295	C[C@@H](CC[C@@H](C)C(=O)O)C(=O)O
9296	[H]/N=C(\\SCC#CCS/C(=N/[H])C(=O)O)C(=O)O
9297	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(Cl)cc1
9298	O=C(O)C[C@H]1CCCC[C@@H]1C(=O)O
9299	O=C(O)[C@H]1[C@H]2OC[C@@H]3O[C@H](OC[C@@H](O2)[C@@H](O)[C@H]1O)[C@H](C(=O)O)[C@@H](O)[C@H]3O
9300	CCn1c2ccccc2c2cc(NN=C3C(C(=O)O)=NN=C3C(=O)O)ccc21
9301	O=C(O)C1=NC(=O)C(=NNc2ccccc2)C(C(=O)O)=N1
9302	Cc1ccc(NC(=S)C(=O)O)cc1NC(=S)C(=O)O
9303	O=C(O)CC#CCC(=O)O
9304	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cc[nH]n1
9305	O=C(O)Cc1c(Cl)c(Cl)c(Cl)c(CC(=O)O)c1Cl
9306	CC(C)(C)OC(O)=NC(CC(=O)O)CC(=O)O
9307	CC(C)(C(=O)O)c1ccc(C(C)(C)C(=O)O)cc1
9308	COCc1c2c(n3c1[C@H](OC)[C@H](C(=O)O)C3)C(=O)C(C)=C(C(=O)O)C2=O
9309	[H]/N=C(/C/C(=N\\[H])C(=O)O)C(=O)O
9310	NC(=NCC(C(=O)O)C(=O)O)C(=O)O
9311	C[C@H](C(=O)O)c1ccc([C@H](C)C(=O)O)cc1
9312	O=C(O)C1=C(C2=C(C(=O)O)C(=O)c3ccccc3C2=O)C(=O)c2ccccc2C1=O
9313	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccccc1Br
9314	CC(/C=N/N=C(N)C(=O)O)=N\\N=C(N)C(=O)O
9315	O=C(O)C[C@@H]1CCCC[C@H]1CC(=O)O
9316	CC(C)[C@](C)(C(=O)O)C(=S)C(=O)O
9317	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(C(F)(F)F)cc1
9318	O=C(O)CC(Br)CC(=O)O
9319	O=C(O)CC1(CC(=O)O)COC1
9320	O=C(O)C[C@H]1O[C@H](O)[C@H](C(=O)O)[C@H](O)[C@@H]1O
9321	O=C(O)C1=NS(=O)(=O)N=C(C(=O)O)C1=NO
9322	O=C(O)[C@@H]1CCC[C@@H](C(=O)O)C1
9323	O=C(O)Cc1cc(Br)cc(CC(=O)O)c1
9324	CC1(C)[C@H](CC(=O)O)C[C@H]1C(=O)O
9325	CC(C)(C)c1ccc(N=C(C(=O)O)/C(=N/c2ccc(C(C)(C)C)cc2)C(=O)O)cc1
9326	O=C(O)C1=NS(=O)(=O)N=C1C(=O)O
9327	O=C(O)CC1(CC(=O)O)CCC1
9328	NC(=N/N=C1/CC[C@H]2[C@@H](CC[C@@H]3C/C(=N/N=C(N)C(=O)O)CC[C@H]23)C1)C(=O)O
9329	CC(=O)[C@]1(C(=O)O)C(I)=CC(I)=C(C(=O)O)[C@H]1I
9330	COc1c(C)ncc(CC(=O)O)c1CC(=O)O
9331	O=C(O)CC1(CC(=O)O)CCOCC1
9332	CC1=C(C(=O)O)C(=O)c2c(CO)c3n(c2C1=O)C[C@@H](C(=O)O)[C@@H]3O
9333	C[C@@](CC(=O)O)(C(=O)O)C(F)(F)F
9334	COc1cccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9335	[H]/N=C(\\C(=O)O)c1ccc2[nH]c3ccc(/C(=N\\[H])C(=O)O)cc3c2c1
9336	O=C(O)CC(CC(=O)O)c1ccccn1
9337	O=C(O)C(=S)C(C(=S)C(=O)O)c1ccccc1
9338	O=C(O)C1=NC(=S)N=C(C(=O)O)C1c1nnc(-c2ccccc2)c(-c2ccccc2)n1
9339	N=C(N=c1nnc(=NC(=N)C(=O)O)[nH][nH]1)C(=O)O
9340	CC(C)(C)OC(O)=NC[C@H](CC(=O)O)C(=O)O
9341	CC(C)([C@H]1CC[C@@H](C(=O)O)CC1)[C@H]1CC[C@H](C(=O)O)CC1
9342	CCO[C@@H]1CC[C@H](C(=O)O)[C@@H](CC(=O)O)O1
9343	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cccc(Br)c1
9344	CC[C@H](C(=O)O)C(O)(O)C(=O)O
9345	CC(C)C[C@@H](CC(=O)O)C(=O)O
9346	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1ccc(F)cc1
9347	O=C(O)/C=C/C=C/C(=O)O
9348	Cc1ccc(/C(=N/N=C(/C(=O)O)c2ccc(C)cc2)C(=O)O)cc1
9349	C[C@H](C(=O)O)C(C(=O)O)C(=O)O
9350	O=C(O)[C@H]1[C@H](O)C=C[C@@H](O)[C@@H]1C(=O)O
9351	C[C@@H](C(=O)O)[C@H]1CC[C@@H]2[C@H]3CC=C4C[C@H](C(=O)O)CC[C@@]4(C)[C@@H]3CC[C@]12C
9352	O=C(O)C[C@@H]1OCO[C@H]2[C@@H](CC(=O)O)OCO[C@H]12
9353	CC(C)(CCCC(=O)O)C(=O)O
9354	O=C(O)[C@H]1C[C@@H]2C[C@H]1C[C@@H]2C(=O)O
9355	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccccc1Cl
9356	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(C(=O)CCl)c1
9357	COc1ccc(C2C(C#N)=C(C(=O)O)SC(C(=O)O)=C2C#N)cc1
9358	O=C(O)[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@]14C[C@@H]5C[C@@H](C[C@@](C(=O)O)(C5)C1)C4)(C3)C2
9359	O=C(O)C12CC3(C(=O)O)C[C@H](C1)C[C@H](C2)C3
9360	O=C(O)C[C@@H]1O[C@H](n2cc(/C=C\\Br)c(O)nc2=O)C[C@@H]1C(=O)O
9361	O=C(O)C(S)=NN=C(S)C(=O)O
9362	N=C(N=C(N)C(=O)O)c1cccc(C(=N)N=C(N)C(=O)O)c1
9363	O=C(O)C1=NCN(c2ccc(F)cc2)C(C(=O)O)=N1
9364	CC1=C(C(=O)O)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](C(=O)O)C3
9365	C[C@H](C(=O)O)[C@H](C)C(=O)O
9366	O=C(O)C(=N\\O)/C(=N\\O)C(=O)O
9367	CC(C)NC(=NC(=Nc1ccc(Cl)cc1)C(=O)O)C(=O)O
9368	C[C@H](C/C(=N\\O)C(=O)O)C(=O)O
9369	CO[C@H]1O[C@@H](CC(=O)O)[C@@H](O)[C@@H](C(=O)O)[C@@H]1O
9370	[H]/N=C(/C(=O)O)c1ccc2c(c1)[nH]c1cc(/C(=N\\[H])C(=O)O)ccc12
9371	O=C(O)C(=S)NCCNC(=S)C(=O)O
9372	O=C(O)[C@H]1CCC[C@@H]1C(=O)O
9373	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1ccccc1
9374	O=C(O)C[C@@H]1c2ccccc2C[C@H]1C(=O)O
9375	Cc1ccc([C@@H](C(=O)O)[C@@H](C(=O)O)c2ccc(C)cc2)cc1
9376	O=C(O)C/C=C/C(C(=O)O)C(=O)O
9377	[H]/N=C(/C(=O)O)c1ccc(-c2cc3ccc(/C(=N\\[H])C(=O)O)cc3s2)cc1
9378	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(Br)c2ccccc12
9379	C[C@@H](C(=O)O)[C@](C(=O)O)(c1ccc(F)cc1)c1ccc(F)nc1
9380	CN1CC[C@@H](C(=O)O)[C@H](CC(=O)O)C1
9381	NC(=NCCCC(=O)O)C(=O)O
9382	COc1cc(NN=C2C(C(=O)O)=NN=C2C(=O)O)cc(C(F)(F)F)c1
9383	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1cccc2cccnc12
9384	O=C(O)C[C@H]1C[C@@H](C(=O)O)C(=O)O1
9385	C/C(=C\\C(=S)C(=O)O)C(=O)O
9386	O=C(O)[C@H]1CC[C@H](C(=O)O)CC1
9387	O=C(O)C[C@@H](O)[C@H](O)CC(=O)O
9388	NC(=NCCN=C(N)C(=O)O)C(=O)O
9389	O=C(O)[C@H]1[C@H](O)[C@@H](O)[C@H](O)[C@H](C(=O)O)[C@H]1O
9390	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(Br)c1
9391	COc1cc(C2C(C#N)=C(C(=O)O)SC(C(=O)O)=C2C#N)ccc1O
9392	O=C(O)[C@H]1CC(O)C[C@H](C(=O)O)C1
9393	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1cc(Cl)c(Cl)cc1Cl
9394	N#C[C@@H](C(=O)O)[C@H](C#N)C(=O)O
9395	C[C@@H](C[C@@H](C)C(=O)O)C(=O)O
9396	NC(=N[C@H]1CC[C@H](C(C(=O)O)C(=O)O)CC1)C(=O)O
9397	CC(C)(C(=O)O)[C@@H](C(=O)O)c1ccccc1
9398	CC1(C)C(=O)N=C(C(=O)O)N=C1C(=O)O
9399	O=C(O)/C=C(/C(=O)O)C(=O)c1ccc(Cl)cc1
9400	[H]/N=C(/C(=O)O)c1ccc(-n2cc3cc(/C(=N\\[H])C(=O)O)ccc3n2)cc1
9401	O=C(O)C12CCC(C(=O)O)(c3ccccc31)c1ccccc12
9402	C[C@H]1N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(Cl)c1
9403	O=C(O)C(=S)NCNC(=S)C(=O)O
9404	O=C(O)CCN(C(=S)C(=O)O)c1ccc2nccnc2c1Br
9405	O=C(O)[C@@H]1COC[C@H]1C(=O)O
9406	[H]/N=C(/C(=O)O)c1cccc(-c2cc3cc(/C(=N\\[H])C(=O)O)ccc3o2)c1
9407	O=C(O)CC1(CC(=O)O)CCCCC1
9408	O=C(O)C(=S)c1cccc(C(=S)C(=O)O)c1
9409	O=C(O)C1=NN=C(C(=O)O)C1=NNc1c(O)ccc2ccccc12
9410	CC(C)[C@]1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)cc1
9411	CO[C@@H]1O[C@@H](CC(=O)O)[C@H](O)[C@@H](C(=O)O)[C@H]1O
9412	O=C(O)[C@H]1CO[C@@H]2[C@H](C(=O)O)CO[C@H]12
9413	O=C(O)[C@@H]1c2ccccc2C[C@H]1C(=O)O
9414	Cc1ncc(CC(=O)O)c(CC(=O)O)c1Cl
9415	O=C(O)[C@H]1CC[C@@H](C2([C@H]3CC[C@H](C(=O)O)CC3)CCCCC2)CC1
9416	CC(C)C[C@H](CC(=O)O)C(=O)O
9417	O=C(O)C1=NN=C(C(=O)O)C1=NNc1c(F)cccc1F
9418	Cc1cn([C@@H]2C[C@H](C(=O)O)[C@H](CC(=O)O)O2)c(=O)nc1O
9419	O=C(O)C1=NC(=O)C(C(=O)O)C(O)=N1
9420	NC(=Nc1ccc(-c2ccc(N=C(N)C(=O)O)cc2)cc1)C(=O)O
9421	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cc(Cl)ccc1Cl
9422	O=C(O)CCC#CCCC(=O)O
9423	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ncc[nH]1
9424	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(Cl)c(Cl)c1
9425	O=C(O)[C@H]1CC[C@H]1C(=O)O
9426	O=C(O)C1=N[C@@H](c2ccccc2)N(c2cccc(Cl)c2)C(C(=O)O)=N1
9427	O=C(O)C1=Nc2ccccc2N=C(C(=O)O)C1
9428	O=C(O)C1=NCN(c2ccccc2)C(C(=O)O)=N1
9429	C[C@@]1(C(=O)O)CCC[C@@H](C(=O)O)C1
9430	O=C(O)C(C[C@H]1CC[C@H](C(=O)O)CC1)C(=O)O
9431	O=C(O)CC(CC(=O)O)c1ccccc1
9432	O=C(O)C(=S)[C@@H](Cc1ccccc1)C(=O)O
9433	CC1(C)C(C(=O)O)=N/C(=N/N=C2/N=C(C(=O)O)C(C)(C)N2O)N1O
9434	CC1(C)O[C@@H]2[C@@H](C(=O)O)CSC[C@@H](C(=O)O)[C@H]2O1
9435	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc2ccccc12
9436	O=C(O)/C(CC/C(=N\\O)C(=O)O)=N/O
9437	CCC[C@@H](CC(=O)O)C(=O)O
9438	CSc1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9439	C[C@@H](CC(=O)O)/C(=N/O)C(=O)O
9440	COC1C[C@H](C(=O)O)C[C@@H](C(=O)O)C1
9441	CC(C)[C@H]1N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)cc1
9442	O=C(O)[C@H]1Nc2cncnc2N[C@@H]1C(=O)O
9443	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(F)cc1
9444	CO[C@H]1OC[C@@H](C(=O)O)[C@H](O)[C@@H]1C(=O)O
9445	C[C@@H](C(=O)O)P(=O)(O)[C@@H](C(=O)O)c1ccccc1
9446	C#C[C@@H](CC[C@@H](C)C(=O)O)C(=O)O
9447	O=C(O)CC#CCC(C(=O)O)C(=O)O
9448	O=C(O)[C@H](c1ccccc1Cl)[C@H](C(=O)O)c1ccccc1Cl
9449	O=C(O)C1=N[C@H](c2ccccc2)N(c2ccccc2)C(C(=O)O)=N1
9450	O=C(O)C1=C(C(=O)O)C(=O)c2ncccc2C1=O
9451	O=C(O)C1=NC2(c3ccccc3)N=C(C(=O)O)NC2(c2ccccc2)N1
9452	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1Cc1ccc(Cl)cc1
9453	O=C(O)Cc1cccc2c(CC(=O)O)cccc12
9454	O=C(O)CC1(C(=O)O)CCN(Cc2ccccc2)CC1
9455	[H]/N=C(/C(=O)O)c1ccc(-c2csc3ccc(/C(=N\\[H])C(=O)O)cc23)cc1
9456	O=C(O)C12N=C(O)NC1(C(=O)O)NC(O)=N2
9457	C[C@H](CCCC(=O)O)C(=O)O
9458	N=C(N=C(N)C(=O)O)N1CCN(C(=N)N=C(N)C(=O)O)CC1
9459	CO[C@H]1C=C[C@@H](OC)[C@H](C(=O)O)[C@@H]1C(=O)O
9460	O=C(O)C1=N[C@@H](c2ccccc2)N(c2ccc(Cl)c(Cl)c2)C(C(=O)O)=N1
9461	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(-c2ccccc2)cc1
9462	CC(CC(=O)O)(C(=O)O)C(=O)O
9463	O=C(O)C[C@H](Cc1c[nH]c2ccccc12)C(=O)O
9464	C[C@H]1CC(C)(C)[C@H](CC(=O)O)[C@H]1C(=O)O
9465	O=C(O)[C@@]12C[C@H]3C[C@H]4[C@@H]1C[C@H]1C[C@@H]2[C@@H](C3)[C@]4(C(=O)O)C1
9466	O=C(O)[C@H](c1cccc2ccccc12)[C@@H](C(=O)O)c1cccc2ccccc12
9467	O=C(O)C(S)=NN=C(O)c1ccc(C(O)=NN=C(S)C(=O)O)cc1
9468	N#CC1=C(C(=O)O)Oc2c(ccc3c4c(ccc23)[C@H](c2ccc(Cl)cc2)C(C#N)=C(C(=O)O)O4)[C@@H]1c1ccc(Cl)cc1
9469	O=C(O)CC12CC3(CC(=O)O)C[C@H](C1)C[C@H](C2)C3
9470	O=C(O)CCCC1(C(=O)O)CCCCC1
9471	O=C(O)[C@H](c1ccccc1O)[C@@H](C(=O)O)c1ccccc1O
9472	O=C(O)C12CCCCC1(C(=O)O)CCCC2
9473	NC(=NN=C(N)C(=O)O)C(=O)O
9474	O=C(O)C1=CC(=S)C(C(=O)O)=CC1=S
9475	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cccc(I)c1
9476	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(Cl)c1
9477	[H]/N=C(\\SC[C@@H]1CN=C(C(=O)O)S1)C(=O)O
9478	O=C(O)C(=S)Oc1ccc(OC(=S)C(=O)O)cc1
9479	O=C(O)[C@H]1CO[C@@H]2[C@@H](C(=O)O)CO[C@H]12
9480	C[C@@H]1N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)cc1
9481	C=C(CC(=O)O)CC(=O)O
9482	O=C(O)C/C=C/CC(=O)O
9483	CC(/C=N/NC(=S)C(=O)O)=N\\NC(=S)C(=O)O
9484	O=C(O)C1=NC(=S)N=C(C(=O)O)C1=NO
9485	CC(=O)O/N=C(C(=O)O)/C(=N\\OC(C)=O)C(=O)O
9486	[H]/N=C(\\C(=O)O)c1ccc2cc(-c3ccc(/C(=N\\[H])C(=O)O)cc3)oc2c1
9487	CC1(C)[C@@H](CC(=O)O)CC[C@]1(C)CC(=O)O
9488	CC(C)(C(=O)O)C(=O)C(C)(C)C(=O)O
9489	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1cccc(F)c1
9490	O=C(O)[C@@H]1[C@@H]2[C@H]1C[C@H](C(=O)O)C2(C(=O)O)C(=O)O
9491	O=C(O)[C@H]1CC[C@H](C(=O)O)C1
9492	CCC(C)(CC(=O)O)CC(=O)O
9493	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(CO)c1
9494	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(C#N)c1
9495	O=C(O)CC1(C(=O)O)CCCC1
9496	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(C(=O)O)cc1
9497	CC[C@@]1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1c(C)cccc1C
9498	CC(C)(CCC(C)(C)C(=O)O)C(=O)O
9499	O=C(O)C(=N\\O)/C(=N/O)C(=O)O
9500	CC1(C)[C@H](C(=O)O)C(C)(C)[C@H]1C(=O)O
9501	Cc1cc(C)c(CC(=O)O)cc1CC(=O)O
9502	O=C(O)[C@H]1C[C@@H]2C[C@@H](C(=O)O)C[C@@H]2C1
9503	O=C(O)C[C@@H](Cc1ccccc1)C(=O)O
9504	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1ccc(Cl)cc1
9505	CC/C(C(=O)O)=C(\\C#N)C(=S)C(=O)O
9506	Cc1ccc(NN=C2C(C(=O)O)=NN=C2C(=O)O)cc1
9507	[H]/N=C1/C=C(C(=O)O)/C(=N/[H])C=C1C(=O)O
9508	[H]/N=C(/C(=O)O)c1ccc(CC(=O)O)cc1
9509	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccccc1
9510	O=C(O)[C@H](c1c(Cl)cc(O)cc1Cl)[C@@H](C(=O)O)c1c(Cl)cc(O)cc1Cl
9511	O=C(O)C(=S)[C@H](C(=O)O)c1ccccc1
9512	NC(=Nc1cc(N=C(N)C(=O)O)cc(C(=O)O)c1)C(=O)O
9513	CC(C)(C)c1ccc(/N=C(C(=O)O)/C(=N/c2ccc(C(C)(C)C)cc2)C(=O)O)cc1
9514	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)c(Cl)c1
9515	O=C(O)[C@@H]1CCC[C@H]1C(=O)O
9516	C[C@@H]1CC[C@H](C(=O)O)C[C@@H]1C(=O)O
9517	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cc(Cl)c(Cl)cc1Cl
9518	C[C@@]12CC[C@@H]3[C@@H](CC[C@H]4C[C@@H](C(=O)O)CC[C@]43C)[C@@H]1CC[C@H]2C(=O)O
9519	O=C(O)C1=C(N2CC2)C(=O)C(C(=O)O)=C(N2CC2)C1=O
9520	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1ccc(Cl)c(Cl)c1
9521	O=C(O)C1=NN=C(C(=O)O)C1=NN=c1cc[nH]cc1
9522	O=C(O)Cc1c2ccccc2c(CC(=O)O)c2ccccc12
9523	COC1=C(C(=O)O)C(=O)C(OC)=C(C(=O)O)C1=O
9524	CS/C(=N/NC(=S)C(=O)O)C(=O)O
9525	O=C(O)C(S)=Nc1ccc(N=C(S)C(=O)O)cc1
9526	[H]/N=C(/N=C1\\N=C(C(=O)O)c2ccccc21)C(=O)O
9527	O=C(O)[C@H]1[C@H](O)[C@H](O)[C@H](O)[C@H](C(=O)O)[C@H]1O
9528	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(C#N)cc1
9529	O=C(O)[C@H]1CCCC[C@@H]1C[C@@H]1CCCC[C@H]1C(=O)O
9530	CC(C)c1ccccc1NN=C1C(C(=O)O)=NN=C1C(=O)O
9531	O=C(O)[C@H]1CCC[C@H]2[C@@H]1CCC[C@H]2C(=O)O
9532	N=C(N=C(N)C(=O)O)C(=O)O
9533	O=C(O)CCOC(=O)CC(=O)O
9534	O=C(O)CP(=O)(O)CC(=O)O
9535	O=C(O)C[C@H]1CC[C@@H](C(=O)O)CC1
9536	O=C(O)C[C@H](C(=O)O)c1cccc(F)c1
9537	CSc1ccc(NN=C2C(C(=O)O)=NN=C2C(=O)O)cc1
9538	O=C(O)[C@@H](C1CCCCC1)[C@@H](C(=O)O)C1CCCCC1
9539	O=C(O)c1cccc(-c2cccc(C(=O)O)c2)c1
9540	O=C(O)CC12CCC(CC(=O)O)(CC1)CC2
9541	O=C(O)C[C@H](C(=O)O)c1ccc(C(F)(F)F)cc1
9542	CNC(CC(=O)O)CC(=O)O
9543	COc1ccc(NN=C2C(C(=O)O)=NN=C2C(=O)O)cc1Cl
9544	O=C(O)[C@H]1CSC[C@H]1C(=O)O
9545	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(F)cc1
9546	O=C(O)Cc1cccc2cc3cccc(CC(=O)O)c3nc12
9547	[H]/N=C(C#N)\\C(=N\\C(C#N)=C(/C#N)C(=O)O)C(=O)O
9548	O=C(O)CC1(C(=O)O)CCCCCC1
9549	O=C(O)C[C@H]1CC[C@H](CC(=O)O)O1
9550	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(Br)cc1
9551	C[C@@H](C(=O)O)[C@@H](C)C(=O)O
9552	O=C(O)Cc1ccc(CC(=O)O)s1
9553	CC(=N/NC(=S)C(=O)O)/C(C)=N/NC(=S)C(=O)O
9554	O=C(O)C(=S)c1ccc(C(=S)C(=O)O)cc1
9555	COC(=O)[C@@H](CC(=O)O)C(=O)O
9556	O=C(O)C[C@@H]1CC[C@@H]1CC(=O)O
9557	C[C@H](CC(C)(C)C(=O)O)C(=O)O
9558	[H]/N=C(\\C(=O)O)[C@H](C(=O)O)C(=O)OCC
9559	O=C(O)/C(=N\\N=C(/C(=O)O)c1ccccc1)c1ccccc1
9560	O=C(O)[C@@H]1C=C[C@H](N=C(O)OCc2ccccc2)[C@@H](C(=O)O)C1
9561	O=C(O)C1=NC2=NCCN2C(C(=O)O)=N1
9562	O=C(O)[C@H]1CC[C@H](C[C@H]2CC[C@@H](C(=O)O)CC2)CC1
9563	O=C(O)[C@H]1C[C@@H]2C[C@H]1C[C@H]2C(=O)O
9564	CC(C)(C)[C@@]1(C)O[C@@H](CC(=O)O)[C@@H](CC(=O)O)O1
9565	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1ccco1
9566	O=C(O)C1=NN=C(C(=O)O)C1=NNc1cccc2ccccc12
9567	O=C(O)C(=S)c1cccc(C(=S)C(=O)O)n1
9568	CCC(CC)(CC(=O)O)C(=O)O
9569	C#Cc1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9570	CO[C@@H]1O[C@H]2CO[C@@H](c3ccccc3)O[C@H]2[C@H](C(=O)O)[C@@H]1C(=O)O
9571	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1ccccc1Cl
9572	NC(=N[C@@H]1[C@H](O)[C@@H](O)[C@H](O)[C@@H](N=C(N)C(=O)O)[C@@H]1O)C(=O)O
9573	[H]/N=C(/C(=O)O)c1ccc(-c2cc3cc(/C(=N\\[H])C(=O)O)ccc3[nH]2)cc1
9574	O=C(O)C12C[C@H]3[C@@H]4CC5(C(=O)O)C[C@H]([C@@H](C1)[C@@H]3C5)[C@@H]4C2
9575	O=C(O)[C@@H](c1ccco1)[C@@H](C(=O)O)c1ccco1
9576	O=C(O)C[C@@H]1CC[C@@H](CC(=O)O)O1
9577	O=C(O)C(=S)SCCSC(=S)C(=O)O
9578	O=C(O)C[C@@]1(C(=O)O)CN2CCC1CC2
9579	CC[C@H](C(=O)O)[C@@H](CC)C(=O)O
9580	N#CC1=C(C(=O)O)S[C@@H](c2ccccc2)[C@@](C#N)(C(=S)C(=O)O)[C@H]1c1ccccc1
9581	O=C(O)[C@@H]1CCCC[C@H]1SS[C@H]1CCCC[C@@H]1C(=O)O
9582	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccccc1
9583	NC(=NC(=S)C(=O)O)C(=O)O
9584	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1cccs1
9585	CCCN1C(C(=O)O)=NC(C(=O)O)=NC1(C)C
9586	O=C(O)C12[C@H]3[C@H]4[C@@H]1[C@H]1[C@@H]2[C@@H]3C41C(=O)O
9587	O=C(O)/C=C\\C(=O)O
9588	COc1ccc(OC)c(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9589	C[C@H]1C[C@@H](C[C@H]2CC[C@H](C(=O)O)[C@H](C)C2)CC[C@H]1C(=O)O
9590	N#C/C(C(=O)O)=C(\\C#N)C(=O)O
9591	N#CC(/N=C/C(=O)O)=C(/C#N)C(=O)O
9592	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@@H](O)[C@H](O)[C@H]1O
9593	O=C(O)[C@H]1[C@H](c2ccccc2)[C@@H](C(=O)O)[C@@H]1c1ccccc1
9594	[H]/N=C(\\S/C(=N\\[H])C(=O)O)C(=O)O
9595	O=C(O)C(S)=NN=C1Nc2ccccc2C1=NN=C(S)C(=O)O
9596	CC[C@@H]1C[C@@H](CC)[C@@H](C(=O)O)[C@H](C)[C@H]1C(=O)O
9597	O=C(O)C1(C2(C(=O)O)CCCCC2)CCCCC1
9598	CC(C)(C)OC(=O)[C@@H](CC(=O)O)C(=O)O
9599	CC[C@]1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)cc1
9600	[H]/N=C(/SCCC(=O)O)C(=O)O
9601	COc1cc(OC)cc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9602	O=C(O)[C@@H]1[C@H](O)[C@H](CO)O[C@H](O)[C@@H]1C(=O)O
9603	O=C(O)[C@@H]1CCCC[C@H]1C[C@H]1CC[C@@H](C(=O)O)CC1
9604	O=C(O)Cc1cccc2cc3cccc(CC(=O)O)c3cc12
9605	O=C(O)Cc1ccccc1CC(=O)O
9606	O=C(O)[C@H]1CC[C@@H]2CCCC[C@@H]2[C@@H]1C(=O)O
9607	N#Cc1ccc([C@@H](C(=O)O)[C@H](C(=O)O)c2ccc(C#N)cc2)cc1
9608	O=C(O)[C@H]1C[C@H]2C[C@@H]1C[C@@H]2C(=O)O
9609	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(S(C)(=O)=O)cc1
9610	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc2ccccc2c1
9611	O=C(O)CC1(CC(=O)O)CCCC1
9612	O=C(O)C[C@H](CO)C(=O)O
9613	COc1ccc(CN2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9614	C[C@](C(=O)O)(C(=S)C(=O)O)c1ccccc1
9615	C/C(=N\\Cc1cccc(CC(=O)O)c1)C(=O)O
9616	NC(=Nc1ccc(CC(=O)O)cc1)C(=O)O
9617	O=C(O)Cc1ccc2c(c1)CN1CN2Cc2cc(CC(=O)O)ccc21
9618	O=C(O)C1=NN=C(C(=O)O)C1=NNc1nc2ccccc2s1
9619	CC(C)/C(C(=O)O)=C(\\C#N)C(=S)C(=O)O
9620	CC[C@H]1C[C@H](C)[C@H](C(=O)O)[C@@H](CC)[C@H]1C(=O)O
9621	O=C(O)C[C@H]1CCC[C@@H]1C(=O)O
9622	Cc1cc(CC(=O)O)c(O)c(CC(=O)O)c1
9623	O=C(O)C1=NN=C(C(=O)O)C1=NNCC1CCNCC1
9624	O=C(O)c1cccc(C#Cc2ccccc2C(=O)O)c1
9625	O=C(O)C[C@H](CCO)C(=O)O
9626	CCOc1cccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9627	O=C(O)[C@H]1C[C@H](C(=O)O)[C@@H](O[C@@H]2O[C@@H](CO)[C@@H](O)[C@@H](O)[C@H]2O)[C@H](O)[C@@H]1O
9628	O=C(O)C[C@H](C(=O)O)C12C[C@H]3C[C@@H](C1)C[C@@H](C2)C3
9629	Cc1cccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9630	O=C(O)[C@@H]1C[C@@H](C(=O)O)[C@@]2(CC[C@@H](O)[C@@H](O)CO2)[C@@H](O)[C@@H]1O
9631	O=C(O)C[C@H]1O[C@H](O)[C@@H](C(=O)O)[C@H](O)[C@H]1O
9632	O=C(O)[C@H]1CC[C@H](C[C@H]2CC[C@H](C(=O)O)CC2)CC1
9633	C[C@@H](ON1C(C(=O)O)=NC(C(=O)O)=NC1(C)C)c1c(Cl)cccc1Cl
9634	O=C(O)C[C@H](Cc1ccccc1)C(=O)O
9635	Cc1ccc(/N=C(C(=O)O)/C(=N/c2ccc(C)cc2)C(=O)O)cc1
9636	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1cccc2ccccc12
9637	CC1(C)O[C@H](CC(=O)O)[C@@H](CC(=O)O)O1
9638	O=C(O)[C@H]1CCCCCC[C@@H]1C(=O)O
9639	CC(C)(C)c1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9640	O=C(O)C[C@H]1CCCC[C@H]1C(=O)O
9641	CCC1(CC)C(C(=O)O)=NC(=O)N=C1C(=O)O
9642	O=C(O)C[C@@H](O)[C@H]1NC(C(=O)O)=N[C@H]1C(=O)O
9643	N#CC1=C(C(=O)O)SC(C(=O)O)=C(C#N)C1c1ccc(Br)cc1
9644	O=C(O)[C@H]1CC=CC[C@@H]1C(=O)O
9645	O=C(O)[C@@H]1C[C@@H](C(=O)O)[C@@]2(C[C@@H](O)[C@@H](O)CO2)[C@@H](O)[C@H]1O
9646	Cc1nc(CC(=O)O)c(=O)[nH]c1CC(=O)O
9647	O=C(O)[C@H](c1ccccn1)[C@@H](C(=O)O)c1ccccn1
9648	O=C(O)Cc1c(Cl)c(Cl)c(CC(=O)O)c(Cl)c1Cl
9649	CC[C@@H](CCC(=O)O)C(=O)O
9650	Cc1ccccc1[C@H](C(=O)O)[C@@H](C(=O)O)c1ccccc1C
9651	O=C(O)/C(=N\\N=C(/C(=O)O)c1ccccn1)c1ccccn1
9652	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(S(=O)(=O)O)cc1
9653	COC[C@H](CC(=O)O)C(=O)O
9654	O=C(O)/C(=N\\N=C(\\C(=O)O)c1ccccn1)c1ccccn1
9655	O=C(O)[C@H]1CCCC[C@@H](C(=O)O)CCCC1
9656	O=C(O)C(/N=N\\C(=N\\Cl)C(=O)O)=N/Cl
9657	[H]/N=C(/C(=O)O)c1ccc(-c2nc3cc(/C(=N\\[H])C(=O)O)ccc3[nH]2)cc1
9658	O=C(O)C12CNCCNCC(C(=O)O)(CNCCNC1)CNCCNC2
9659	O=C(O)[C@@H](c1ccc(O)cc1)[C@@H](C(=O)O)c1ccc(O)cc1
9660	NC(=NN=C1C=CC(=NNC(=S)C(=O)O)C=C1)C(=O)O
9661	O=C(O)CC[C@@H](C(=O)O)C(=O)N1CCCCC1
9662	Cc1ccc(CC(=O)O)cc1CC(=O)O
9663	CCON1C(C(=O)O)=NC(C(=O)O)=NC1(C)C
9664	CC(O)=N[C@@H]1[C@@H](C(=O)O)C=C(C(=O)O)C[C@@H]1C(=O)O
9665	O=C(O)CC(=O)CC(=O)O
9666	CCC[C@]1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)cc1
9667	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(C#Cc2ccccc2)cc1
9668	O=C1CC(C(=O)O)=NC(C(=O)O)=N1
9669	Cc1ccccc1[C@@H](C(=O)O)[C@@H](C(=O)O)c1ccccc1C
9670	C[C@H]1CCC[C@H](C(=O)O)[C@H]1C(=O)O
9671	O=C(O)C[C@@H](O)C(=O)O
9672	O=C(O)[C@H](c1ccc(C(F)(F)F)cc1)[C@@H](C(=O)O)c1ccc(C(F)(F)F)cc1
9673	O=C(O)C[C@H]1CC[C@@H](CC(=O)O)CC1
9674	C[C@H]1C[C@H]2C[C@@H](C)[C@H]3CC[C@](C)(C(=O)O)[C@@H]4CC[C@@H]([C@@H]2[C@H]34)[C@@]1(C)C(=O)O
9675	O=C(O)[C@@H]1C[C@H]1C(=O)O
9676	NC(=NN=C1C=CC(=NN=C(N)C(=O)O)C=C1)C(=O)O
9677	O=C(O)[C@@H](c1ccccc1)[C@@H](C(=O)O)c1ccccc1
9678	O=C(O)[C@@H]1c2ccccc2CC[C@H]1C(=O)O
9679	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1O
9680	O=C(O)CCC(=O)CC(=O)O
9681	O=C(O)C[C@@H](C(=O)O)c1ccccc1
9682	O=C(O)C/C(=N/O)C(=O)O
9683	O=C(O)C[C@H]1CC[C@H](CC(=O)O)CC1
9684	O=C(O)[C@H]1CC[C@H]([C@H]2CC[C@@H](C(=O)O)CC2)CC1
9685	O=C(O)[C@@H](c1ccc(C(F)(F)F)cc1)[C@@H](C(=O)O)c1ccc(C(F)(F)F)cc1
9686	CON1C(C(=O)O)=NC(C(=O)O)=NC1(C)C
9687	O=C(O)CC1=CC[C@H](CC(=O)O)CC1
9688	CC(O)=NC1=C(C(=O)O)C(=O)C(N=C(C)O)=C(C(=O)O)C1=O
9689	O=C(O)C(S)=Nc1ccc(-c2ccc(N=C(S)C(=O)O)cc2)cc1
9690	C[C@@H]1OC(=O)C(C(=O)O)=C1C(=O)O
9691	O=C(O)C(=N\\O)/C(=N\\O)C(=N\\O)/C(=N/O)C(=O)O
9692	Cc1ccccc1NN=C1C(C(=O)O)=NN=C1C(=O)O
9693	O=C(O)C[C@@H](CBr)C(=O)O
9694	O=C(O)[C@H]1C(O)=NC[C@@H](O)[C@@H]1C(=O)O
9695	O=C(O)C(=S)N/N=C/C=N/NC(=S)C(=O)O
9696	O=C(O)CC(=O)N=C(O)CC(=O)O
9697	CCOC(=O)C1=C(C(=O)O)N=C(C(=O)O)CC1
9698	O=C(O)C[C@@]12C[C@@H]3C[C@@H](C[C@@H](C3)C1)[C@@H]2C(=O)O
9699	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(C(=O)O)cc1
9700	C[C@H](C(=O)O)C(C)(C)C(=O)O
9701	C[C@H](CC(=O)O)[C@H](C)CC(=O)O
9702	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccccc1Br
9703	O=C(O)C(=N/Cl)/N=N/C(=N\\Cl)C(=O)O
9704	O=C(O)C1=NN=C(C(=O)O)C1=NNc1nccs1
9705	O=C(O)CC/C(=N\\O)C(=O)O
9706	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(O)cc1
9707	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(C(O)=Nc2cccnc2)c1
9708	O=C(O)C1=CC(=O)C(C(=O)O)=CC1=O
9709	O=C(O)CC(F)CC(=O)O
9710	O=C(O)CC(F)(F)CC(=O)O
9711	O=C(O)C1=N[C@H]2C=C[C@@H]1[C@@H]1C=C[C@H]2C(C(=O)O)=N1
9712	O=C(O)C1=NN=C(C(=O)O)C1=NNc1c(F)c(F)c(F)c(F)c1F
9713	Cc1ncc(CC(=O)O)c(CC(=O)O)c1O
9714	CCOC(=O)c1cccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9715	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cccc(C(F)(F)F)c1
9716	NC(=NC(=NCCc1ccccc1)C(=O)O)C(=O)O
9717	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1cc(Cl)cc(Cl)c1
9718	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(S(=O)(=O)O)c2ccccc12
9719	O=C(O)/C=C/C(=O)O
9720	CCOC(=O)c1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9721	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc(Cl)cc1Cl
9722	O=C(O)CCN=C(O)CC(=O)O
9723	CC(C)(C)c1cccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)c1
9724	CC(C)/C(=C/C(=S)C(=O)O)C(=O)O
9725	C[C@H](O[C@H](C)C(=O)O)C(=O)O
9726	CC(C)(C(=O)O)[C@H]1CC[C@](C)(C(=O)O)CC1
9727	C[C@@H](Cc1cccc(C(C)(C)C(=O)O)c1)C(=O)O
9728	O=C(O)[C@H]1CC2(C[C@H](C(=O)O)C2)C1
9729	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1OCc1c2ccccc2cc2ccccc12
9730	O=C(O)C1=CC(C(=O)O)=NS(=O)(=O)N1Cc1ccccc1
9731	C[C@H](ON1C(C(=O)O)=NC(C(=O)O)=NC1(C)C)c1ccc(Cl)cc1Cl
9732	C[C@H]1CC[C@@H](C(=O)O)[C@H](C(=O)O)C1
9733	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccc2cc(Cl)ccc2c1
9734	C[C@H](C(=O)O)c1ccc(-c2ccc([C@@H](C)C(=O)O)cc2)cc1
9735	O=C(O)Cc1ccc(CC(=O)O)o1
9736	[H]/N=C(\\C(=O)O)c1ccc(-c2ccc(/C(=N\\[H])C(=O)O)cc2)cc1
9737	NC(=NN=C1C=CC(=NN=C(N)C(=O)O)C=C1)C(=O)O
9738	O=C(O)C1=C(Br)C(=O)C(C(=O)O)=C(Br)C1=O
9739	COC(=O)c1ccc(N2C(C(=O)O)=NC(C(=O)O)=NC2(C)C)cc1
9740	CC(=N\\N=C(N)C(=O)O)/C(C)=N/N=C(N)C(=O)O
9741	CC1(C)N=C(C(=O)O)N=C(C(=O)O)N1c1ccccc1I
9742	O=C(O)C1(OOC2(C(=O)O)CCCCC2)CCCCC1
9743	C[C@@H](C(=O)O)[C@@H](C(=O)O)c1ccccc1
9744	O=C(O)/C(=N\\O)[C@@H](C(=O)O)c1ccccc1
9745	O=C(O)C[C@@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1CC(=O)O
9746	O=C(O)C1=NN=C(C(=O)O)C1=NNc1ccc(O)cc1
9747	O=C(O)C[C@@H](Cc1ccccc1F)C(=O)O
9748	CC1(C)[C@H](CC(=O)O)CC[C@]1(C)CC(=O)O
9749	[H]/N=C(/SCCN=C(N)C(=O)O)C(=O)O
9750	C[C@@H](C(=O)O)C(O)=N[C@H]1CO[C@H](O)[C@H](C(=O)O)[C@@H]1O
9751	CO[C@H]1O[C@@H](CC(=O)O)[C@@H](O)[C@H](O)[C@H]1C(=O)O
9752	COC(=O)c1cc(CC(=O)O)cc(CC(=O)O)c1
9753	O=CN1CCOCCN(C=O)CCN(C=O)CC1
9754	C[C@@]12c3cc(C=O)ccc3[C@]3(C)c4cc(C=O)ccc4[C@](C)(c4cc(C=O)ccc41)[C@]23C
9755	O=Cc1ccc(C#Cc2ccc(N(c3ccc(C#Cc4ccc(C=O)cc4)cc3)c3ccc(C#Cc4ccc(C=O)cc4)cc3)cc2)cc1
9756	O=Cc1c2cccccc-2c(C=O)c1C=O
9757	O=Cc1coc(C=O)c1C=O
9758	Cc1c(C=O)c(S)c(C=O)c(C(C)(C)C)c1C=O
9759	O=Cc1cc(C=O)c(Cl)c(C=O)c1
9760	C=C1COCCN(C=O)CCN(C=O)CCN(C=O)CCOC1
9761	O=CN1CCN(C=O)CCN(C=O)CC1
9762	O=Cc1ccc(-c2ccc(N(c3ccc(-c4ccc(C=O)cc4)cc3)c3ccc(-c4ccc(C=O)cc4)cc3)cc2)cc1
9763	O=Cc1cc2c(O)c(c1)Sc1cc(C=O)cc(c1O)Sc1cc(C=O)cc(c1O)Sc1cccc(c1O)S2
9764	O=CC=C1SC(C=O)=C(C=O)S1
9765	O=Cc1ccc2c(C=O)ccc(C=O)c2c1
9766	C[C@]12c3ccc(C=O)cc3[C@@]3(C)c4ccc(C=O)cc4[C@@](C)(c4cc(C=O)ccc41)[C@@]23C
9767	O=Cc1cc2c(cc1O)Cc1cc(C=O)c(O)cc1Cc1cc(C=O)c(O)cc1C2
9768	C[C@]1(C=O)C[C@](C)(C=O)C[C@@](C)(C=O)C1
9769	O=Cc1cc(Br)c2cc1/C=C\\c1cc(c(C=O)cc1Br)/C=C\\c1cc(c(C=O)cc1Br)/C=C\\2
9770	O=CN1CCOCCOCCOCCN(C=O)CCN(C=O)CC1
9771	O=Cc1cc(C=O)c(Cl)c(C=O)c1Cl
9772	Cc1c(C=O)cc(C=O)c(Cl)c1C=O
9773	COc1cc2c(cc1C=O)Cc1cc(OC)c(C=O)cc1Cc1cc(OC)c(C=O)cc1C2
9774	O=Cc1cc(C=O)c(C=O)[nH]1
9775	O=Cc1csc(C=O)c1C=O
9776	O=Cc1ccc2c(c1)[C@H]1c3ccc(C=O)cc3[C@@H]2c2cc(C=O)ccc21
9777	CC(C=O)=C1NC(=C(C)C=O)NC(=C(C)C=O)N1
9778	O=Cc1cc(Br)c2cc1/C=C\\c1cc(c(C=O)cc1Br)/C=C\\c1cc(c(Br)cc1C=O)/C=C\\2
9779	O=Cc1cccc2c1[nH]c1c3[nH]c4c(C=O)cccc4c3c3c4cccc(C=O)c4[nH]c3c21
9780	O=Cc1cc(C=O)c(Br)c(C=O)c1O
9781	O=CN1CCNCCN(C=O)CCN(C=O)CC1
9782	Cc1c(C=O)c2n(c1C=O)CCn1c-2cc(C=O)c1C
9783	O=CN1CCOCCOCCOCCOCCN(C=O)CCN(C=O)CC1
9784	O=Cc1ccc2[nH]c3c4[nH]c5ccc(C=O)cc5c4c4c5cc(C=O)ccc5[nH]c4c3c2c1
9785	O=Cc1ccc(C#Cc2cc(C=O)cc(C=O)c2)cc1
9786	O=Cc1cc2c3c4c1Cc1cc(C=O)c5c(c14)c1c(cc(C=O)c(c31)C2)C5
9787	CC(=O)N1[C@H]2[C@@H]3N(C(C)=O)[C@H]4[C@H](N(C=O)[C@@H]1[C@@H](N2C=O)N4C=O)N3C(C)=O
9788	O=Cc1cccc(C#Cc2ccc(C#Cc3ccccc3C=O)cc2C=O)c1
9789	O=Cc1c(O)c(C=O)c(Cl)c(C=O)c1Cl
9790	O=C[C@H]1CCC[C@H](C=O)CCC[C@@H](C=O)CCC1
9791	O=Cc1cc(C=O)c2cc(C=O)ccc2c1
9792	Cc1c(C=O)c(C=O)c(C=O)n1C
9793	O=Cc1ccc2nc3cc(C=O)c4cc5cc(C=O)ccc5nc4c3cc2c1
9794	O=CN1CCCN(C=O)CCOCCN(C=O)CCC1
9795	O=Cc1ccc(C=O)c(C=O)c1
9796	O=Cc1cc(C#Cc2ccc(C#Cc3ccccc3C=O)cc2C=O)ccc1O
9797	O=Cc1cc(C=O)c(C=O)s1
9798	O=Cc1c(Cl)c(Cl)c(C=O)c(C=O)c1Cl
9799	O=CN1CCOCCOCCN(C=O)CCN(C=O)CC1
9800	O=C[C@H]1[C@H](C=O)[C@H]1C=O
9801	O=Cc1cccc2[nH]c3c4[nH]c5cccc(C=O)c5c4c4c([nH]c5cccc(C=O)c54)c3c12
9802	O=Cc1ccc2c(c1)[nH]c1c3[nH]c4cc(C=O)ccc4c3c3c4ccc(C=O)cc4[nH]c3c21
9803	Cn1c(C=O)cc(C=O)c1C=O
9804	O=Cc1c(Cl)c(C=O)c(Cl)c(C=O)c1Cl
9805	Cc1cc(C=O)c(C=O)cc1C=O
9806	O=C[C@H]1[C@@H](C=O)[C@@H]2[C@@H]3OO[C@@H](O3)[C@@H]2[C@@H]1C=O
9807	O=Cc1c(Br)c(C=O)c(Br)c(C=O)c1Br
9808	O=CN1CCCN(C=O)CCN(C=O)CCCNCC1
9809	O[C@@H]1[C@H](O[C@@H]2[C@@H](Br)C[C@H](Br)[C@@H](O)[C@H]2O)O[C@H](CBr)[C@H](O)[C@@H]1O
9810	O[C@H]1[C@H](Br)[C@@H](O)[C@H](Br)[C@@H](O)[C@H]1Br
9811	C[C@H](Br)N([C@H](C)Br)[C@@H](C)Br
9812	OC[C@@H]1O[C@H](O[C@H]2[C@@H](Br)C[C@H](Br)[C@@H](O)[C@@H]2O)[C@H](O)[C@@H](Br)[C@H]1O
9813	OC[C@@H]1O[C@@H](O[C@@H]2[C@@H](Br)C[C@@H](Br)[C@H](O)[C@@H]2O)[C@H](Br)[C@@H](O)[C@H]1O
9814	N=C(Br)N=c1[nH]c(=NC(=N)Br)[nH]c(=NC(=N)Br)[nH]1
9815	Br[C@H]1CCC[C@H](Br)CCC[C@@H](Br)CCC1
9816	O[C@H]1[C@@H](Br)[C@H](O)[C@@H](Br)[C@@H](O)[C@@H]1Br
9817	OC[C@H]1O[C@H](O[C@@H]2[C@@H](O)[C@@H](O)[C@H](Br)C[C@H]2Br)[C@@H](Br)[C@H](O)[C@H]1O
9818	O[C@H]1[C@H](Br)[C@H](O)[C@@H](Br)[C@@H](O)[C@H]1Br
9819	O=S(=O)(O)[C@H]1NC(Br)=NC(Br)=C1Br
9820	O=S1(=O)N=C(Br)C(Br)=C(Br)N1
9821	C[C@@H](Br)N([C@@H](C)Br)[C@@H](C)Br
9822	CC(CBr)(CBr)CBr
9823	O=C1OC[C@@H](Br)C(=O)OC[C@@H](Br)C(=O)OC[C@@H]1Br
9824	BrCc1cc(CBr)cc(CBr)c1
9825	BrC[C@H]1C[C@@H](CBr)C[C@@H](CBr)C1
9826	O=C1O[C@H](CBr)[C@@H](Br)[C@@H]1Br
9827	O=P(CBr)(CBr)CBr
9828	CC(C)(Br)c1cc(C(C)(C)Br)c(O)c(C(C)(C)Br)c1
9829	O[C@H]1[C@@H](Br)[C@H](O)[C@@H](Br)[C@@H](O)[C@H]1Br
9830	O=S(=O)(O)[C@@H]1NC(Br)=NC(Br)=C1Br
9831	OC[C@H]1O[C@H](O[C@H]2[C@H](Br)C[C@H](Br)[C@@H](O)[C@H]2O)[C@H](Br)[C@H](O)[C@H]1O
9832	OC[C@H]1O[C@H](O[C@H]2[C@H](Br)C[C@@H](Br)[C@@H](O)[C@H]2O)[C@H](O)[C@H](Br)[C@@H]1O
9833	SC(Br)=NN=C1C=CC(=N/N=C\\Br)C=C1
9834	BrCC(CBr)CBr
9835	BrC[C@H]1C[C@H](CBr)C[C@@H](CBr)C1
9836	O[C@H]1[C@@H](O)[C@@H](O)[C@@H](CBr)O[C@@H]1O[C@H]1[C@H](Br)C[C@@H](Br)[C@@H](O)[C@H]1O
9837	Br/C=C\\Br
9838	O[C@@H]1[C@@H](CBr)O[C@@H](O[C@H]2[C@@H](Br)C[C@@H](Br)[C@H](O)[C@@H]2O)[C@@H](O)[C@H]1O
9839	BrCC[C@H](Br)CBr
9840	BrC[C@H]1O[C@H](CBr)O[C@@H](CBr)O1
9841	[H]/N=C(\\Br)C(Br)/C(Br)=N/[H]
9842	OC[C@H]1O[C@H](O[C@@H]2[C@H](Br)C[C@H](Br)[C@H](O)[C@H]2O)[C@H](Br)[C@H](O)[C@@H]1O
9843	BrC12CN3CC(Br)(C1)CC(Br)(C3)C2
9844	SC(Br)=NN=C1C=CC(=N/N=C/Br)C=C1
9845	Br[C@H]1C[C@@H](Br)C[C@@H](Br)C1
9846	O[C@H]1[C@@H](Br)[C@@H](O)[C@@H](Br)[C@@H](O)[C@@H]1Br
9847	OC[C@H]1O[C@H](O[C@H]2[C@H](Br)C[C@H](Br)[C@@H](O)[C@H]2O)[C@H](Br)[C@@H](O)[C@@H]1O
9848	IN1CCOCCN(I)CCN(I)CC1
9849	Ic1ccc(C#Cc2ccc(N(c3ccc(C#Cc4ccc(I)cc4)cc3)c3ccc(C#Cc4ccc(I)cc4)cc3)cc2)cc1
9850	Ic1c2cccccc-2c(I)c1I
9851	Ic1coc(I)c1I
9852	Cc1c(I)c(S)c(I)c(C(C)(C)C)c1I
9853	Clc1c(I)cc(I)cc1I
9854	C=C1COCCN(I)CCN(I)CCN(I)CCOC1
9855	IN1CCN(I)CCN(I)CC1
9856	Ic1ccc(-c2ccc(N(c3ccc(-c4ccc(I)cc4)cc3)c3ccc(-c4ccc(I)cc4)cc3)cc2)cc1
9857	Oc1c2cccc1Sc1cc(I)cc(c1O)Sc1cc(I)cc(c1O)Sc1cc(I)cc(c1O)S2
9858	IC=C1SC(I)=C(I)S1
9859	Ic1ccc2c(I)ccc(I)c2c1
9860	C[C@]12c3cc(I)ccc3[C@@]3(C)c4ccc(I)cc4[C@@](C)(c4ccc(I)cc41)[C@@]23C
9861	Oc1cc2c(cc1I)Cc1cc(O)c(I)cc1Cc1cc(O)c(I)cc1C2
9862	C[C@]1(I)C[C@](C)(I)C[C@@](C)(I)C1
9863	Brc1cc(I)c2cc1/C=C\\c1cc(c(Br)cc1I)/C=C\\c1cc(c(Br)cc1I)/C=C\\2
9864	IN1CCOCCOCCOCCN(I)CCN(I)CC1
9865	Clc1c(I)cc(I)c(Cl)c1I
9866	Cc1c(I)cc(I)c(Cl)c1I
9867	COc1cc2c(cc1I)Cc1cc(OC)c(I)cc1Cc1cc(OC)c(I)cc1C2
9868	Ic1csc(I)c1I
9869	Ic1ccc2c(c1)[C@H]1c3ccc(I)cc3[C@@H]2c2cc(I)ccc21
9870	CC(I)=C1NC(=C(C)I)NC(=C(C)I)N1
9871	Brc1cc(I)c2cc1/C=C\\c1cc(c(I)cc1Br)/C=C\\c1cc(c(Br)cc1I)/C=C\\2
9872	Ic1cccc2c1[nH]c1c3[nH]c4c(I)cccc4c3c3c4cccc(I)c4[nH]c3c21
9873	Oc1c(I)cc(I)c(Br)c1I
9874	IN1CCNCCN(I)CCN(I)CC1
9875	Cc1c(I)c2n(c1I)CCn1c-2cc(I)c1C
9876	IN1CCOCCOCCOCCOCCN(I)CCN(I)CC1
9877	Ic1ccc2[nH]c3c4[nH]c5ccc(I)cc5c4c4c5cc(I)ccc5[nH]c4c3c2c1
9878	Ic1ccc(C#Cc2cc(I)cc(I)c2)cc1
9879	Ic1cc2c3c4c1Cc1cc(I)c5c(c14)c1c(cc(I)c(c31)C2)C5
9880	CC(=O)N1[C@@H]2[C@H]3N(C(C)=O)[C@@H]4[C@@H](N(I)[C@H]1[C@H](N2I)N4I)N3C(C)=O
9881	Ic1cccc(C#Cc2ccc(C#Cc3ccccc3I)cc2I)c1
9882	Oc1c(I)c(Cl)c(I)c(Cl)c1I
9883	I[C@H]1CCC[C@H](I)CCC[C@@H](I)CCC1
9884	Ic1cc(I)c2cc(I)ccc2c1
9885	Cc1c(I)c(I)c(I)n1C
9886	Ic1ccc2nc3cc(I)c4cc5cc(I)ccc5nc4c3cc2c1
9887	IN1CCCN(I)CCOCCN(I)CCC1
9888	Ic1ccc(I)c(I)c1
9889	Oc1ccc(C#Cc2ccc(C#Cc3ccccc3I)cc2I)cc1I
9890	Ic1cc(I)c(I)s1
9891	Clc1c(Cl)c(I)c(I)c(Cl)c1I
9892	IN1CCOCCOCCN(I)CCN(I)CC1
9893	I[C@H]1[C@H](I)[C@H]1I
9894	Ic1cccc2[nH]c3c4[nH]c5cccc(I)c5c4c4c([nH]c5cccc(I)c54)c3c12
9895	Ic1ccc2c(c1)[nH]c1c3[nH]c4cc(I)ccc4c3c3c4ccc(I)cc4[nH]c3c21
9896	Cn1c(I)cc(I)c1I
9897	Clc1c(I)c(Cl)c(I)c(Cl)c1I
9898	Cc1cc(I)c(I)cc1I
9899	I[C@H]1[C@H]2[C@@H]3OO[C@@H](O3)[C@H]2[C@@H](I)[C@@H]1I
9900	Brc1c(I)c(Br)c(I)c(Br)c1I
9901	IN1CCCN(I)CCN(I)CCCNCC1
9902	OCN1CCOCCN(CO)CCN(CO)CC1
9903	C[C@]12c3ccc(CO)cc3[C@]3(C)c4ccc(CO)cc4[C@@](C)(c4ccc(CO)cc41)[C@]23C
9904	OCc1ccc(C#Cc2ccc(N(c3ccc(C#Cc4ccc(CO)cc4)cc3)c3ccc(C#Cc4ccc(CO)cc4)cc3)cc2)cc1
9905	OCc1c2cccccc-2c(CO)c1CO
9906	OCc1coc(CO)c1CO
9907	Cc1c(CO)c(S)c(CO)c(C(C)(C)C)c1CO
9908	OCc1cc(CO)c(Cl)c(CO)c1
9909	C=C1COCCN(CO)CCN(CO)CCN(CO)CCOC1
9910	OCN1CCN(CO)CCN(CO)CC1
9911	OC[C@H]1O[C@@H](CO)O[C@@H](CO)O1
9912	OCc1ccc(-c2ccc(N(c3ccc(-c4ccc(CO)cc4)cc3)c3ccc(-c4ccc(CO)cc4)cc3)cc2)cc1
9913	OCc1cc2c(O)c(c1)Sc1cc(CO)cc(c1O)Sc1cc(CO)cc(c1O)Sc1cccc(c1O)S2
9914	OCC=C1SC(CO)=C(CO)S1
9915	OCc1ccc2c(CO)ccc(CO)c2c1
9916	C[C@]12c3cc(CO)ccc3[C@@]3(C)c4ccc(CO)cc4[C@@](C)(c4ccc(CO)cc41)[C@@]23C
9917	OCc1cc2c(cc1O)Cc1cc(CO)c(O)cc1Cc1cc(CO)c(O)cc1C2
9918	C[C@]1(CO)C[C@@](C)(CO)C[C@@](C)(CO)C1
9919	OCc1cc(Br)c2cc1/C=C\\c1cc(c(CO)cc1Br)/C=C\\c1cc(c(CO)cc1Br)/C=C\\2
9920	OCN1CCOCCOCCOCCN(CO)CCN(CO)CC1
9921	OCc1cc(CO)c(Cl)c(CO)c1Cl
9922	Cc1c(CO)cc(CO)c(Cl)c1CO
9923	COc1cc2c(cc1CO)Cc1cc(OC)c(CO)cc1Cc1cc(OC)c(CO)cc1C2
9924	OCc1cc(CO)c(CO)[nH]1
9925	OCc1csc(CO)c1CO
9926	OCc1ccc2c(c1)[C@H]1c3ccc(CO)cc3[C@@H]2c2cc(CO)ccc21
9927	CC(CO)=C1NC(=C(C)CO)NC(=C(C)CO)N1
9928	OCc1cc(Br)c2cc1/C=C\\c1cc(c(CO)cc1Br)/C=C\\c1cc(c(Br)cc1CO)/C=C\\2
9929	OCc1cccc2c1[nH]c1c3[nH]c4c(CO)cccc4c3c3c4cccc(CO)c4[nH]c3c21
9930	OCc1cc(CO)c(Br)c(CO)c1O
9931	OCN1CCNCCN(CO)CCN(CO)CC1
9932	Cc1c(CO)c2n(c1CO)CCn1c-2cc(CO)c1C
9933	OCN1CCOCCOCCOCCOCCN(CO)CCN(CO)CC1
9934	OCc1ccc2[nH]c3c4[nH]c5ccc(CO)cc5c4c4c5cc(CO)ccc5[nH]c4c3c2c1
9935	OCc1ccc(C#Cc2cc(CO)cc(CO)c2)cc1
9936	OCc1cc2c3c4c1Cc1cc(CO)c5c(c14)c1c(cc(CO)c(c31)C2)C5
9937	CC(=O)N1[C@H]2[C@@H]3N(CO)[C@@H]4[C@H](N2CO)N(C(C)=O)[C@H]([C@H]1N3C(C)=O)N4CO
9938	OCc1cccc(C#Cc2ccc(C#Cc3ccccc3CO)cc2CO)c1
9939	OCc1c(O)c(CO)c(Cl)c(CO)c1Cl
9940	OCc1cc(CO)c2cc(CO)ccc2c1
9941	Cc1c(CO)c(CO)c(CO)n1C
9942	OCc1ccc2nc3cc(CO)c4cc5cc(CO)ccc5nc4c3cc2c1
9943	OCN1CCCN(CO)CCOCCN(CO)CCC1
9944	OCc1ccc(CO)c(CO)c1
9945	OCc1cc(C#Cc2ccc(C#Cc3ccccc3CO)cc2CO)ccc1O
9946	OCc1cc(CO)c(CO)s1
9947	OCc1c(Cl)c(Cl)c(CO)c(CO)c1Cl
9948	OCN1CCOCCOCCN(CO)CCN(CO)CC1
9949	OC[C@H]1[C@H](CO)[C@H]1CO
9950	OCc1cccc2[nH]c3c4[nH]c5cccc(CO)c5c4c4c([nH]c5cccc(CO)c54)c3c12
9951	OCc1ccc2c(c1)[nH]c1c3[nH]c4cc(CO)ccc4c3c3c4ccc(CO)cc4[nH]c3c21
9952	Cn1c(CO)cc(CO)c1CO
9953	OCc1c(Cl)c(CO)c(Cl)c(CO)c1Cl
9954	Cc1cc(CO)c(CO)cc1CO
10188	C[C@]1(I)CNCCNC[C@](C)(I)CNCCNC1
9955	OC[C@H]1[C@H](CO)[C@@H]2[C@@H]([C@@H]3OO[C@H]2O3)[C@@H]1CO
9956	OCc1c(Br)c(CO)c(Br)c(CO)c1Br
9957	OCN1CCCN(CO)CCN(CO)CCCNCC1
9958	NC[C@@H]1CC[C@@H](CN)O1
9959	CC(C)(C)OC(=O)[C@H](N)CN
9960	C/C(N)=C/C(=N)S
9961	CO[C@H]1C=C[C@@H](OC)[C@H](N)[C@H]1N
9962	N[C@H]1CC[C@H](CC2CCCCC2)[C@H](N)C1
9963	N=C(S)N/N=C\\C=N/NC(=N)S
9964	CC[C@H]1C[C@@H](CC)[C@@H](N)[C@H](C)[C@H]1N
9965	C#C[C@H](N)CCCN
9966	N[C@H]1CCc2ccccc2[C@@H]1N
9967	CC/C(N)=C(/C#N)C(=N)S
9968	COCc1c2c(n3c1[C@@H](OC)[C@@H](N)C3)C(=O)C(C)=C(N)C2=O
9969	C[C@@](N)(c1ccccc1)[C@](C)(N)c1ccccc1
9970	C[C@](N)(CN)c1ccccc1
9971	N[C@H](C1CCCCC1)[C@H](N)C1CCCCC1
9972	C[C@H](CN)C[C@@H](C)N
9973	N[C@H]1[C@H](O)[C@@H](N)[C@H](O)[C@@H](O)[C@@H]1O
9974	N=C(S)[C@@H](N)Cc1ccccc1
9975	CO[C@H]1O[C@H](CN)CC[C@H]1N
9976	CC[C@H]1C[C@H](C)[C@@H](N)[C@@H](CC)[C@@H]1N
9977	C[C@@H]1C[C@H](C[C@@H]2CC[C@@H](N)[C@H](C)C2)CC[C@@H]1N
9978	N=C1N[C@H](C(=O)O)[C@@H]([C@H](O)CN)N1
9979	N[C@@H](c1ccccc1O)[C@@H](N)c1ccccc1O
9980	N[C@H]1c2ccccc2C[C@H]1N
9981	NC[C@H]1c2ccccc2C[C@H]1N
9982	NC[C@@H](N)c1cccc(F)c1
9983	NC[C@]1(N)CN2CCC1CC2
9984	N=C1N[C@H]2C=C[C@@H]1[C@@H]1C=C[C@H]2C(=N)N1
9985	N[C@@H]1CCCC[C@@H]1SS[C@@H]1CCCC[C@H]1N
9986	C/C(C=O)=N\\N(C(=N)N)C(=N)N
9987	NC[C@H](N)C1CCCCC1
9988	N[C@H]1[C@@H](O)[C@@H](N)[C@H](O)[C@@H](O)[C@@H]1O
9989	N[C@H]1COC[C@@H]1N
9990	N[C@@H](C(=O)O)[C@H](N)c1ccccc1
9991	N[C@H]1[C@@H]2OC[C@H]3O[C@@H](OC[C@@H](O2)[C@@H](O)[C@@H]1O)[C@H](N)[C@@H](O)[C@@H]3O
9992	NC[C@@H](N)Cc1ccccc1F
9993	C[C@H]1C[C@H](N)CC[C@@H]1C[C@H]1CC[C@@H](N)C[C@@H]1C
9994	C[C@]1(N)CC[C@@]1(C)N
9995	NCC[C@@H](N)c1ccccc1
9996	N=C1NC(=N)N(c2cccc(Cl)c2)[C@H](Cc2ccccc2)N1
9997	[H]/N=C1\\C=C(N)C(=O)C(N)=C1O
9998	CC(C)(N)[C@@H](N)c1ccccc1
9999	COC(=O)[C@@H](N)CCN
10000	CC1(C)O[C@H](CN)[C@@H](CN)O1
10001	C[C@@H]1CC(C)(C)[C@H](CN)[C@H]1N
10002	CC(/C=N\\NC(=N)S)=N/NC(=N)S
10003	N[C@H](c1ccc(C(F)(F)F)cc1)[C@H](N)c1ccc(C(F)(F)F)cc1
10004	N[C@H](CS)[C@H](N)CS
10005	NCC#CC[C@@H](N)C(=O)O
10006	N[C@@H](C1CCCCC1)[C@@H](N)C1CCCCC1
10007	NC[C@H]1O[C@@H](O)[C@@H](N)[C@@H](O)[C@@H]1O
10008	NC[C@H]1CC[C@H]1CN
10009	NC[C@H]1O[C@H](O)[C@H](N)[C@@H](O)[C@@H]1O
10010	CO[C@H]1O[C@@H]2CO[C@H](c3ccccc3)O[C@H]2[C@H](N)[C@@H]1N
10011	C[C@@](N)(CN)Cc1ccccc1
10012	CS/C(N)=C(C#N)/C(C#N)=C(\\N)SC
10013	N#CC1=C(N)/C(=C\\c2ccccc2O)C(O)=NC1=N
10014	C[C@H](N)CC[C@@H](C)N
10015	C[C@H](N)[C@H]1CC[C@H]2[C@@H]3CC=C4C[C@@H](N)CC[C@]4(C)[C@H]3CC[C@]12C
10016	CC(O)=N[C@@H]1[C@@H](N)CC(C(=O)O)=C[C@H]1N
10017	N[C@@H](c1c(Cl)cc(O)cc1Cl)[C@H](N)c1c(Cl)cc(O)cc1Cl
10018	N[C@@H]1[C@H](O)[C@H](O)[C@@H](N)[C@@H](O)[C@@H]1O
10019	COC(=O)[C@@H](N)[C@H](N)c1ccccc1
10020	NC[C@@H]1[C@H]2CC[C@H](C2)[C@@H]1N
10021	N[C@H](c1ccccc1Cl)[C@H](N)c1ccccc1Cl
10022	CC(C)(C)[C@H](N)[C@@H](N)C(C)(C)C
10023	N=C(N)N[C@H]1[C@H](O)[C@@H](NC(=N)N)[C@H](O)[C@@H](O)[C@@H]1O
10024	N[C@H]1C[C@@H](N)[C@H](O)[C@H](O)[C@H]1O
10025	CC1(C)C[C@@H](N)C[C@@](C)(CN)C1
10026	CC[C@@](N)(CN)c1ccccc1
10027	Cc1cc(C)cc([C@H](N)[C@@H](N)c2cc(C)cc(C)c2)c1
10028	C[C@H](N)[C@H](N)c1ccccc1
10029	N[C@@H](c1ccc(F)cc1)[C@@H](N)c1ccc(F)cc1
10030	NC[C@@H]1O[C@@H](O)[C@H](N)[C@@H](O)[C@@H]1O
10031	CC1(C)[C@H]2CC[C@@](N)(CN)[C@@H]1C2
10032	N[C@H]1[C@H]2CC[C@H](C2)[C@@H]1N
10033	N[C@H]1[C@@H](O)O[C@H](CO)[C@@H](O)[C@@H]1N
10034	C[C@]1(N)CNCCNC[C@@](C)(N)CNCCNC1
10035	C[C@H](N)[C@H](N)CO
10036	NC[C@H]1OCO[C@@H]2[C@@H](CN)OCO[C@H]12
10037	N/C=C/C=C/N
10038	N[C@H]1CCCC[C@@H]1C[C@@H]1CCCC[C@H]1N
10039	CC(C)[C@@H](N)C(C)(C)CN
10040	CO[C@H]1O[C@H](CN)[C@@H](O)[C@@H](N)[C@@H]1O
10041	C[C@H](N)[C@@H](N)C(=O)O
10042	N[C@@H]1C[C@H]2C[C@@H]1C[C@H]2N
10043	CC(=O)[C@@]1(N)C(I)=CC(I)=C(N)[C@@H]1I
10044	COc1ccc([C@H](N)[C@@H](N)c2ccc(OC)cc2)cc1
10045	C[C@H](N)C[C@H](C)N
10046	N=C(NO)NC[C@H](N)C(=O)O
10047	N=C(N)NC[C@H](N)C(=O)O
10048	N[C@H]1[C@H](O)[C@@H](CO)O[C@@H](O)[C@@H]1N
10049	N[C@H]1CC[C@H](C2([C@H]3CC[C@H](N)CC3)CCCCC2)CC1
10050	N=C(NO)[C@H](N)c1ccccc1
10051	C[C@@H]1NC(=N)NC(=N)N1c1ccc(Cl)c(Cl)c1
10052	N[C@@H]1[C@H](O)[C@H](O)[C@H](O)[C@H](N)[C@@H]1O
10053	C[C@H](N)[C@](N)(c1ccc(F)cc1)c1ccc(F)nc1
10054	N#C/C(N)=C(\\N)C#N
10055	N=C1NC(=N)N(c2ccc(Cl)cc2)[C@@H](c2ccccc2)N1
10056	N[C@H]1C[C@@H](N)[C@H](O)[C@@H](O)[C@@H]1O
10057	N[C@H]1[C@H](c2ccccc2)[C@H](N)[C@@H]1c1ccccc1
10058	N[C@H]1CCCCC[C@H]1N
10059	C[C@@H](CN)[C@@H](C)CN
10060	NC[C@H]1CC[C@H](N)CC1
10061	C[C@@](N)(C(=N)S)c1ccccc1
10062	N[C@H]1C[C@@H](N)[C@H](O)[C@@H](O)[C@]12C[C@H](O)[C@H](O)CO2
10063	N[C@@H]1C(O)=NC[C@@H](O)[C@H]1N
10064	N#CC1=C(N)S[C@H](c2ccccc2)[C@](C#N)(C(=N)S)[C@H]1c1ccccc1
10065	Cc1cn([C@H]2C[C@H](N)[C@@H](CN)O2)c(=O)nc1O
10066	CC[C@H](N)CCN
10067	C[C@H]1C[C@H]2C[C@@H](C)[C@@](C)(N)[C@H]3CC[C@H]4[C@H]([C@H]23)[C@@H]1CC[C@]4(C)N
10068	N=C(N)Nc1cccc([C@H](N)C(=O)O)c1
10069	N[C@H]1C[C@@H](N)[C@H](O)C[C@@H]1O
10070	N[C@H]1CCCC[C@H]1C[C@H]1CC[C@H](N)CC1
10071	C[C@H](CN)C(=N)NO
10072	N[C@@H](c1ccc(C(F)(F)F)cc1)[C@@H](N)c1ccc(C(F)(F)F)cc1
10073	NC1=C(N)[C@@H]([C@@H](O)CO)OC1=O
10074	N[C@H]1C[C@@H](N)[C@H](O)[C@@H](O)[C@]12CC[C@H](O)[C@H](O)CO2
10075	CC(C)[C@](C)(N)C(=N)S
10076	NC[C@@]12C[C@@H]3C[C@@H](C[C@@H](C3)C1)[C@H]2N
10077	C[C@H]1CC[C@@H](N)[C@H](N)C1
10078	C[C@](N)(c1ccc(Cl)cc1)[C@](C)(N)c1ccc(Cl)cc1
10079	N[C@H]1CC[C@@H]2CCCC[C@H]2[C@H]1N
10080	N[C@H]1C[C@@H]2C[C@@H](N)C[C@@H]2C1
10081	N[C@H]1Nc2cncnc2N[C@@H]1N
10082	N=C(N)N/N=C1/CC[C@@H]2[C@H](CC[C@@H]3C/C(=N/NC(=N)N)CC[C@H]32)C1
10083	NC[C@@H]1C[C@@H](N)C(=O)O1
10084	C[C@@H]1NC(=N)NC(=N)N1c1ccc(Cl)cc1
10085	N[C@H]1C[C@@H](N)[C@H](O)[C@@H](O)[C@]12CC[C@@H](O)[C@@H](O)CO2
10086	N=C(N)SC[C@@H](Br)CN
10087	N=C1NC(=N)N(c2cccc(Cl)c2)[C@@H](c2ccccc2)N1
10088	CCC[C@@H]1NC(=N)NC(=N)N1c1ccc(Cl)cc1
10089	C[C@@H]1CCC[C@@H](N)[C@H]1N
10090	NC/C=C\\CN
10091	[H]/N=C(/C#N)C(=N)N/C(C#N)=C(\\N)C#N
10092	CN[C@@H]1[C@@H](O)[C@@H](O[C@@H]2[C@@H](O)[C@H](O)[C@@H](N)C[C@H]2N)OC[C@]1(C)O
10093	N#CC1=C(N)Oc2c(ccc3c4c(ccc23)[C@H](c2ccc(Cl)cc2)C(C#N)=C(N)O4)[C@@H]1c1ccc(Cl)cc1
10094	CC(C)(C)[C@H](N)CN
10095	CO[C@H]1O[C@H](CN)[C@@H](O)[C@H](O)[C@H]1N
10096	COc1ccc([C@H](N)CN)cc1
10097	NCC[C@H](N)C(=O)O
10098	CC1(C)O[C@@H](CN)[C@H](CN)O1
10099	CC1=C(N)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](N)[C@@H]3O
10100	C[C@H](N)c1ccc(-c2ccc([C@@H](C)N)cc2)cc1
10101	C[C@]12CC[C@H]3[C@@H](CC[C@H]4C[C@@H](N)CC[C@@]43C)[C@@H]1CC[C@@H]2N
10102	N=C(N)N[C@H]1CC[C@H]([C@H](N)C(=O)O)CC1
10103	C[C@H](N)CCN
10104	C[C@H]1C[C@@H](C[C@H]2C[C@H](C)[C@@H](N)[C@@H](C)C2)C[C@@H](C)[C@@H]1N
10105	C[C@H]1CC[C@@H](N)C[C@@H]1N
10106	C[C@H](N)P(=O)(O)[C@@H](N)c1ccccc1
10107	C[C@](N)(c1ccc(Cl)cc1)[C@H](N)c1ccc(Cl)cc1
10108	N#C[C@@H](N)[C@@H](N)C#N
10109	CC(O)=Nc1ccc([C@H]2NC(=N)NC(=N)N2c2cccc(Cl)c2)cc1
10110	N[C@@H]1CSC[C@H]1N
10111	CO[C@H]1O[C@H](CN)[C@@H](O)[C@H](N)[C@@H]1O
10112	Cc1ccccc1[C@@H](N)[C@H](N)c1ccccc1C
10113	N[C@H]1CCCCCC[C@@H]1N
10114	COC(=O)[C@@H](N)CN
10115	N[C@H](c1ccco1)[C@@H](N)c1ccco1
10116	NC[C@@H](N)CBr
10117	CO[C@H]1O[C@@H]2CO[C@@H](c3ccccc3)O[C@H]2[C@H](N)[C@@H]1N
10118	C[C@H](N)c1ccc([C@H](C)N)cc1
10119	CC(=N/NC(=N)S)/C(C)=N/NC(=N)S
10120	CC1(C)O[C@@H]2[C@H](N)CSC[C@H](N)[C@H]2O1
10121	N#C/C(N)=C(C#N)/N=C\\C=N\\C(C#N)=C(/N)C#N
10122	C[C@@H](N)C(O)=N[C@H]1CO[C@@H](O)[C@H](N)[C@H]1O
10123	CO[C@@H]1C=C[C@@H](OC)[C@H](N)[C@H]1N
10124	C[C@H]1[C@@H](N)CCC[C@H]1N
10125	CC1(C)[C@@H](CN)CC[C@]1(C)CN
10126	C#C[C@H](N)CC[C@H](C)N
10127	CC[C@]1(C)NC(=N)NC(=N)N1c1ccc(Cl)cc1
10128	N[C@H]1C[C@@H](N)[C@H](O)[C@@H](O)[C@@H]1O[C@H]1O[C@H](CO)[C@@H](O)[C@H](O)[C@H]1O
10129	C=C[C@H](N)CN
10130	N[C@H]1CO[C@@H]2[C@H](N)CO[C@H]12
10131	CC1(C)[C@@H](N)CC[C@@]1(C)N
10132	N[C@@H]1CCC[C@H]2[C@H](N)CCC[C@@H]12
10133	N[C@H]1C[C@H]2[C@H](C(=O)O)[C@H]2[C@]1(N)C(=O)O
10134	CC1=CC[C@@H](C(C)C)[C@H](N)[C@H]1N
10135	N=C(N)N[C@@H]1[C@H](O)[C@@H](NC(=N)N)[C@@H](O)[C@@H](O)[C@@H]1O
10136	NC[C@H]1O[C@@H](n2cc(/C=C/Br)c(O)nc2=O)C[C@@H]1N
10137	CC1(C)O[C@@H]2[C@@H](N)CSC[C@H](N)[C@H]2O1
10138	N[C@H]1[C@H](O)C=C[C@@H](O)[C@@H]1N
10139	N[C@H]1C[C@@H](N)C[C@H](O)C1
10140	NC[C@H]1C[C@H]2C[C@H](CN)[C@@H]1C2
10141	CO[C@H]1C=C[C@@H](OC)[C@@H](I)[C@@H]1I
10142	COC(=O)[C@@H](I)CCI
10143	FC(F)(F)c1cccc(NN=C2C(I)=NN=C2I)c1
10144	IC1=NN=C(I)C1=NNc1nccnn1
10145	C[C@](I)(c1ccc(Cl)cc1)[C@H](I)c1ccc(Cl)cc1
10146	CC1(C)N=C(I)N=C(I)N1c1ccc(I)cc1
10147	C[C@H](I)[C@@H](I)C(=O)O
10148	C#C[C@H](I)CCCI
10149	[H]/N=C(\\I)c1cccc2c1CC/C2=N/NC(=N)I
10150	CC(O)=Nc1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10151	CC(C)(CI)C(C)(C)CI
10152	O=c1nc(O)ccn1[C@H]1C[C@H](I)[C@@H](CI)O1
10153	CC1(C)N=C(I)N=C(I)N1c1ccc(C(=O)CCl)cc1
10154	CO[C@@H]1O[C@H](CI)[C@H](O)[C@H](I)[C@@H]1O
10155	O/N=C(/I)C[C@H](I)c1ccccc1
10156	O=C1N=C(I)N=C(I)/C1=N/O
10157	CC(CI)CI
10158	Oc1ccccc1[C@H](I)[C@H](I)c1ccccc1O
10159	S=C(I)CCC(=S)I
10160	O[C@H]1[C@@H](I)[C@@H](O)[C@@H](O)[C@@H](O)[C@@H]1I
10161	CN1C(I)=NC(I)=NC1(C)C
10162	Cc1cccc(C)c1N1C(I)=NC(I)=NC12CCCCC2
10163	IC/C=C\\CI
10164	S=C(I)CC(=S)I
10165	Cc1ccccc1N1C(I)=NC(I)=NC1(C)C
10166	C[C@H](CI)C[C@@H](C)I
10167	Cc1cc(C)c([C@H](I)[C@H](I)c2c(C)cc(C)cc2C)c(C)c1
10168	ICCCCCCCI
10169	CC(C)(C)OC(=O)C1([C@](C)(I)CI)CC1
10170	IC[C@@H]1CCCC[C@@H]1I
10171	ICc1ccc(CI)c2ccccc12
10172	CCC1(CC)C(=O)N=C(I)N=C1I
10173	CC(C)(C)c1cc(CI)cc(CI)c1
10174	S=C(I)CI
10175	O=C(O)[C@@H](I)[C@H](I)C(=O)O
10176	Clc1ccc([C@@H](I)CI)cc1
10177	O/N=C(I)/C(=N\\O)C(/I)=N\\O
10178	C[C@@H](I)[C@H](I)C(=O)O
10179	OC(CI)CI
10180	CC1(C)C[C@H](I)C[C@@](C)(CI)C1
10181	[H]/N=C(/I)c1ccc(-c2cc3cc(/C(I)=N\\[H])ccc3o2)cc1
10182	O=C(O)[C@H](I)CCI
10183	O[C@@H]1[C@H](I)C[C@H](I)[C@H](O)[C@@H]1O
10184	IC1=NN=C(I)C1=NNc1ccc2ccccc2c1
10185	[H]/N=C(\\I)N1CCN(/C(I)=N\\[H])CC1
10186	CC1(C)CC(I)(CI)CC(C)(C)N1
10187	IC1=C(I)CCCC1
10189	S=C(I)N=C(S)I
10190	[H]/N=C(/I)c1ccc2cc(/C(I)=N\\[H])[nH]c2c1
10191	C[C@H](I)[C@H](I)CO
10192	CC(O)=Nc1ccc([C@@H]2N=C(I)N=C(I)N2c2cccc(Cl)c2)cc1
10193	IC[C@@H]1[C@@H]2C=C[C@@H](C2)[C@H]1CI
10194	CC(O)=Nc1ccc(NN=C2C(I)=NN=C2I)cc1
10195	CC[C@@H]1N=C(I)N=C(I)N1c1ccc(Cl)cc1
10196	SC(I)=N/N=C\\C=N\\N=C(S)I
10197	N=C(I)Nc1cccc([C@@H](I)C(=O)O)c1
10198	N=C(I)Nc1ccc2c(c1)Cc1ccc(NC(=N)I)cc1C2
10199	CN[C@@H]1[C@H](O)[C@@H](O[C@H]2[C@@H](O)[C@@H](O)[C@H](I)C[C@H]2I)OC[C@@]1(C)O
10200	ICC[C@H](I)c1ccccc1
10201	O[C@@H](CI)CCI
10202	ICc1cccc(-c2cccc(CI)c2)c1
10203	C[C@H]1C[C@@H](I)CC[C@@H]1C[C@@H]1CC[C@H](I)C[C@H]1C
10204	Clc1ccc([C@@H](I)[C@H](I)c2ccc(Cl)cc2)cc1
10205	Clc1cc(CI)cc(CI)c1
10206	N#CC1=C(I)SC(I)=C(C#N)C1c1ccccc1F
10207	COc1ccccc1N1C(I)=NC(I)=NC1(C)C
10208	O[C@H]1C[C@@H](O)[C@@H](I)C[C@H]1I
10209	CC1(C)N=C(I)N=C(I)N1c1ccc(Cc2ccccc2)cc1
10210	CC(C)(C)OC(=O)N1CC[C@@H](I)[C@@H](I)C1
10211	CC(O)=NCc1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10212	CC1(C)[C@H]2CC[C@](I)(CI)[C@@H]1C2
10213	N#CC1=C(I)/C(=C/c2ccccc2O)C(=O)N=C1I
10214	IC[C@@H]1CC[C@H]1CI
10215	O=C(O)[C@H](I)[C@@H](I)C(=O)O
10216	[H]/N=C(\\I)SCS/C(I)=N/[H]
10217	O[C@H]1[C@@H](O)[C@@H](I)[C@H](O)[C@@H](O)[C@@H]1I
10218	O=C(O)[C@@H](I)C[C@H]1C[C@H]1I
10219	ICC[C@@]12C[C@@H]3C[C@@H](C[C@@](CI)(C3)C1)C2
10220	O=C(CI)OC(=O)CI
10221	CC1(C)N=C(I)N=C(I)N1c1cccc(S(=O)(=O)F)c1
10222	[H]/N=C(\\I)N(/C(I)=N\\[H])c1ccncc1
10223	CN1CCC(I)(CI)CC1
10224	ICc1ccc(-c2ccc(CI)cn2)nc1
10225	IC1=NC2(CCCCC2)N(OCc2ccccc2)C(I)=N1
10226	Fc1cc(F)cc(NN=C2C(I)=NN=C2I)c1
10227	Oc1cccc(NN=C2C(I)=NN=C2I)c1
10228	S=C(I)SSC(=S)I
10229	CC1(C)[C@@H](I)CC[C@@]1(C)I
10230	CC(C)(C)[C@H](I)CI
10231	O[C@H](CI)[C@H](O)CI
10232	[H]/N=C(/I)SS/C(I)=N\\[H]
10233	C[C@@](I)(CI)c1ccccc1
10234	CO[C@@H]1O[C@@H]2CO[C@@H](c3ccccc3)O[C@@H]2[C@H](I)[C@H]1I
10235	C=C[C@@H](I)CI
10236	COc1ccc(NN=C2C(I)=NN=C2I)cc1F
10237	CC1(C)N=C(I)N=C(I)N1c1cccc([C@@H](O)c2ccccc2)c1
10238	SC(I)=Nc1cccc(N=C(S)I)c1
10239	Clc1ccc(N2C(I)=NC(I)=N[C@@H]2c2ccccc2)cc1
10240	CC1(C)O[C@@H]2[C@@H](I)CSC[C@@H](I)[C@@H]2O1
10241	CC1=C(I)C(=O)c2c(CO)c3n(c2C1=O)C[C@@H](I)[C@@H]3O
10242	Cc1cc(CI)c(C)cc1CI
10243	[H]/N=C(/I)SC[C@H](Br)CI
10244	CC1(C)N=C(I)N=C(I)N1OCc1ccc(Br)cc1
10245	CC(C)(I)C(=S)I
10246	COC(=O)[C@H](I)[C@@H](I)c1ccccc1
10247	ICc1ccc(-c2ccc(CI)cc2)cc1
10248	O=C1C(Cl)=C(I)C(=O)C(Cl)=C1I
10249	ICC1(I)CC1
10250	COc1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10251	[H]/N=C(\\I)SCCCI
10252	O=C1C(I)=C(I)C(=O)c2ccccc21
10253	C[C@H]1CC[C@]2(CC1)N=C(I)N=C(I)N2c1ccc(Cl)cc1
10254	C[C@]1(I)CC[C@]1(C)I
10255	CC[C@H](I)[C@H](I)CC
10256	CCOc1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10257	FC1(F)C=C(I)C(I)=C(OCCCl)[C@]1(F)Br
10258	CC1(C)C[C@H](I)C[C@](C)(CI)C1
10259	O=C(O)[C@@H](I)[C@H](I)c1ccccc1
10260	ICc1cccc(CI)n1
10261	C=C(CI)C(=C)CI
10262	CCc1ccccc1N1C(I)=NC(I)=NC1(C)C
10263	Cc1ccc([C@H](I)[C@H](I)c2ccc(C)cc2)cc1
10264	CC(O)(CI)CI
10265	Clc1ccc(CI)c(CI)c1
10266	N#C/C(I)=C(/I)C#N
10267	C[C@@](I)(c1ccccc1)[C@](C)(I)c1ccccc1
10268	N#CC1=C(I)SC(I)=C(C#N)C1c1ccncc1
10269	IC[C@@H](I)c1ccccc1
10270	SC[C@@H](I)[C@H](I)CS
10271	COc1cccc(NN=C2C(I)=NN=C2I)c1
10272	Clc1cc(Cl)cc(NN=C2C(I)=NN=C2I)c1
10273	CC1(C)CC(=O)C(CC2=C(I)CC(C)(C)CC2=O)=C(I)C1
10274	CC(C)(C)[C@@H](I)[C@H](I)C(C)(C)C
10275	CC(/C=N\\NC(=N)I)=N\\NC(=N)I
10276	C[C@](I)(c1ccc(Cl)cc1)[C@@](C)(I)c1ccc(Cl)cc1
10277	C[C@@H](I)[C@H](I)c1ccccc1
10278	[H]/N=C(\\I)c1ccc2nc(N3C(=O)C[C@H](I)c4ccccc43)[nH]c2c1
10279	[H]/N=C(/I)CCI
10280	O=C1N=C(O)/C(=C2\\C=C(I)C(=O)N=C2O)C=C1I
10281	O=C(O)[C@@H](I)CI
10282	CC1(C)N=C(I)N=C(I)N1Cc1ccccc1
10283	Clc1ccc(N2C(I)=NC(I)=NC23CCCCC3)cc1
10284	IC[C@H]1CCC[C@H](CI)C1
10285	ICc1ccc2cc(CI)ccc2c1
10286	Cc1cc(C)cc(N2C(I)=NC(I)=NC2(C)C)c1
10287	CC(C)(I)c1cccc(C(C)(C)I)c1
10288	[H]/N=C(\\I)c1ccc2cc(-c3ccc(/C(I)=N\\[H])cc3)[nH]c2c1
10289	O=C1C=C(I)C(I)=CC1=O
10290	CC(C)(CI)CI
10291	C[C@@H](I)[C@@H](C)I
10292	COC(=O)c1ccc([C@H](I)[C@H](I)c2ccc(C(=O)OC)cc2)cc1
10293	Clc1ccc(CN2C(I)=NC(I)=N[C@H]2c2ccccc2)cc1Cl
10294	COc1ccc([C@H](I)CI)cc1
10295	Ic1cccc(C#CC#Cc2cccc(I)c2)c1
10296	C[C@H]1C[C@H](C[C@H]2C[C@H](C)[C@H](I)[C@@H](C)C2)C[C@@H](C)[C@H]1I
10297	Fc1ccc(C(CI)CI)cc1
10298	CC1(C)N=C(I)N=C(I)N1c1ccc(Cl)cc1
10299	OC[C@@H](I)CI
10300	CC1(C)N=C(I)N=C(I)N1c1cccc(Cc2ccccc2)c1
10301	O/N=C(\\I)C/C(I)=N\\O
10302	I[C@H]1CC[C@H]1I
10303	O=C1C=C(I)C=C(I)C1=O
10304	O=S1(=O)N=C(I)CC(I)=N1
10305	CN(C)c1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10306	[H]/N=C(/I)N1CCC(CI)CC1
10307	CC(C)[C@H](I)CI
10308	ICC#Cc1ccccc1C#CCI
10309	[H]/N=C(\\I)c1cccc(-c2cccc(/C(I)=N\\[H])n2)n1
10310	IC1=NN=C(I)C1=NNc1ccc2c(c1)OCCO2
10311	COC(CI)CI
10312	[H]/N=C(/I)N(/N=C(/C)C=O)/C(I)=N\\[H]
10313	C[C@H](I)CCI
10314	C[C@H]1N=C(I)N=C(I)N1c1ccc(Cl)c(Cl)c1
10315	CC[C@](I)(CI)c1ccccc1
10316	OC[C@@H](I)[C@H](I)CO
10317	CCc1cccc(N2C(I)=NC(I)=NC2(C)C)c1
10318	ICC(I)(c1ccccc1)c1ccccc1
10319	Clc1ccc([C@H](I)[C@H](I)c2ccc(Cl)cc2)cc1
10320	IC1=NN=C(I)C1=NNc1cccnc1
10321	ICc1cccc(-c2cccc(CI)n2)n1
10322	C/C(I)=C(/C#N)C(=S)I
10323	Cc1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10324	CCc1cccc(NN=C2C(I)=NN=C2I)c1
10325	COc1cc(C)cc2c1C(=O)C(I)=C(c1c(C)cc3c(c1OC)C(=O)C(I)=CC3=O)C2=O
10326	S=C(I)C(=S)I
10327	N=C(I)NOC(=O)ONC(=N)I
10328	Cc1cc(C)cc([C@H](I)[C@@H](I)c2cc(C)cc(C)c2)c1
10329	O=C1C2=C(I)CCC(I)=C2C(=O)c2ccccc21
10330	CC1(C)N=C(I)N=C(I)N1c1ccc2c(Cl)cc(Cl)cc2c1
10331	IC1=N[C@]2(I)N=CN=C2C=N1
10332	ICCc1ccccc1CI
10333	O/N=C(/I)c1ccc(/C(I)=N\\O)cc1
10334	CCC[C@@H]1N=C(I)N=C(I)N1c1ccc(Cl)cc1
10335	O=C1C(I)=C(I)C(=O)c2nsnc21
10336	IC1=NN=C(I)C1=NNc1ccc2c(c1)OCO2
10337	I[C@H]1Cc2ccccc2[C@H]1I
10338	ICC#CC#CCI
10339	S=C(I)N(/C(I)=N\\Nc1ccccc1)c1ccccc1
10340	IC[C@@H]1CCCC[C@H]1I
10341	CC1(C)N=C(I)N=C(I)N1OCc1ccc2ccccc2c1Br
10342	I[C@H]1CO[C@@H]2[C@@H](I)CO[C@H]12
10343	[H]/N=C(\\I)SCCS/C(I)=N\\[H]
10344	SC(I)=N/N=C(\\I)c1ccccn1
10345	CC(C)[C@@H](I)C(C)(C)CI
10346	CC1(C)N=C(I)N=C(I)N1c1cccc(F)c1
10347	CC1(C)N=C(I)N=C(I)N1c1ccc(Br)cc1
10348	O=C1O[C@H]([C@@H](O)CO)C(I)=C1I
10349	I[C@@H]1CC[C@@H](CC2CCCCC2)[C@H](I)C1
10350	[H]/N=C(\\I)O/C(I)=N/[H]
10351	[H]/N=C(/I)c1ccc2c(c1)sc1cc(/C(I)=N\\[H])ccc12
10352	CC1(C)N=C(I)N=C(I)N1CCc1ccccc1
10353	Fc1cccc(NN=C2C(I)=NN=C2I)c1
10354	IC[C@@H]1[C@H]2CC[C@H](C2)[C@@H]1I
10355	OC(=NN=C(S)I)c1cccc(C(O)=NN=C(S)I)c1
10356	[H]/N=C(\\I)c1cccc2c1CC/C2=N\\NC(=N)I
10357	C[C@@](I)(CI)Cc1ccccc1
10358	CC(C)(C)C(CI)CI
10359	C[C@H](I)[C@H](I)C(=O)O
10360	CC1(C)N=C(I)N=C(I)N1OCc1ccc2ccccc2c1
10361	Clc1ccc([C@H]2N=C(I)N=C(I)N2c2ccc(Cl)cc2)cc1
10362	N#CC/C(I)=C(/C#N)C(I)=C(C#N)C#N
10363	N=C(I)N=C(O)NC(O)=NC(=N)I
10364	N=C(I)NN=C1C=CC(=NN=C(S)I)C=C1
10365	Cc1cccc(C)c1N1C(I)=NC(I)=NC1(C)C
10366	IC1=NN=C(I)C1=NN[C@H]1CNCCO1
10367	[H]/N=C(/I)N(C(=S)I)c1ccccc1
10368	I[C@H]1CC[C@H](CC[C@H]2CC[C@@H](I)CC2)CC1
10369	CC[C@@](C)(I)CI
10370	C[C@@](I)(C#N)[C@](C)(I)C#N
10371	C[C@@H](ON1C(I)=NC(I)=NC1(C)C)c1ccc(Cl)c(Cl)c1
10372	Fc1ccc(NN=C2C(I)=NN=C2I)c(F)c1F
10373	[H]/N=C(I)/N=N/C(I)=N/[H]
10374	O[C@H]1[C@@H](I)C[C@@H](I)[C@H](O)[C@@H]1O
10375	O=C(O)[C@@H](I)CN=C(I)NO
10376	CC1[C@@H](I)CCC[C@@H]1I
10377	Fc1ccc(NN=C2C(I)=NN=C2I)cc1F
10378	CC(=O)c1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10379	CS/C(I)=C(C#N)\\C(C#N)=C(/I)SC
10380	COC(=O)C(CI)CI
10381	CC1(C)N=C(I)N=C(I)N1c1cccc(-c2ccccc2)c1
10382	IC[C@H](I)C1CCCCC1
10383	IC[C@H]1C[C@H]2C[C@@H]1C[C@H]2CI
10384	I[C@H]1CCCCC[C@H]1I
10385	ICC1(I)CCCCC1
10386	I[C@H]1COC[C@H]1I
10387	Cc1ccc([C@H](I)CI)cc1
10388	OC[C@H]1O[C@H](O)[C@H](I)[C@@H](I)[C@@H]1O
10389	CCOC(=O)C1=C(I)NC(I)=C2C(=O)Oc3ccccc3[C@H]12
10390	O[C@@H]1[C@H](CI)O[C@H](O)[C@H](I)[C@@H]1O
10391	CC1(C)C[C@H](I)C[C@H](I)C1
10392	C[C@@H](I)C(I)(c1ccc(F)cc1)c1ccc(F)cc1
10393	N=C(I)NC(=N)Nc1cccc(NC(=N)NC(=N)I)c1
10394	IC[C@H]1C[C@H]2C[C@H](CI)[C@@H]1C2
10395	O=C1N=C(I)C(=NO)C(I)=N1
10396	O=S1(=O)N=C(I)C=C(I)N1CCc1ccccc1
10397	COc1ccc([C@H](I)[C@@H](I)c2ccc(OC)cc2)cc1
10398	O/N=C(\\I)c1cccc(/C(I)=N\\O)n1
10399	FC(F)(F)c1ccc(NN=C2C(I)=NN=C2I)cc1
10400	CC1(C)N=C(I)N=C(I)N1OCc1ccccc1
10401	C[C@H](CI)CCI
10402	CC(=O)c1cccc(N2C(I)=NC(I)=NC2(C)C)c1
10403	S=C(I)SC(=S)I
10404	Clc1ccccc1NN=C1C(I)=NN=C1I
10405	CC1(C)N=C(I)N=C(I)N1c1cccc(O)c1
10406	N=C(I)N/N=C1/C/C(=N\\NC(=N)I)c2ccccc21
10407	ICCCCCCI
10408	COc1ccc(NN=C2C(I)=NN=C2I)cc1O
10409	CO[C@H]1O[C@@H](CI)CC[C@@H]1I
10410	N=C(I)Nc1ccc2c(c1)Cc1cc(NC(=N)I)ccc1-2
10411	ICc1ccccc1-c1ccccc1CI
10412	ICC1(CI)CNC1
10413	CC1(C)N=C(I)N=C(I)N1OCc1ccc(Cl)cc1
10414	CC[C@]1(C)N=C(I)N=C(I)N1c1ccc(OC)cc1
10415	CC(C)(I)CCI
10416	CC1=CC[C@@H](C(C)C)[C@H](I)[C@H]1I
10417	N=C(I)NCCI
10418	IC12CCC(I)(CC1)CC2
10419	I[C@H]1[C@@H]2CC[C@@H](C2)[C@H]1I
10420	N#CC1=C(I)SC(I)=C(C#N)C1
10421	Cc1cc(C)c(CI)c(C)c1CI
10422	[H]/N=C1\\C=C(I)C(=O)C(I)=C1O
10423	IC1=NNN=C(I)C1
10424	Clc1cccc(N2C(I)=NC(I)=N[C@@H]2Cc2ccccc2)c1
10425	C[C@H](I)C[C@H](C)I
10426	CC1(C)N=C(I)N=C(I)N1c1cccc(I)c1
10427	C[C@H](I)CI
10428	N=C(I)NC(=N)NCCNC(=N)NC(=N)I
10429	CC1(C)O[C@H](CI)[C@@H](CI)O1
10430	C[C@H](I)C[C@@H](C)I
10431	COc1ccc(NN=C2C(I)=NN=C2I)cc1
10432	IC1=NN=C(I)C1=NNc1ccc(I)cc1
10433	CC1(C)N=C(I)N=C(I)N1c1cccc(C(=O)O)c1
10434	[H]/N=C(/I)c1cccc(-c2cc3ccc(/C(I)=N\\[H])cc3o2)c1
10435	COc1cccc([C@H](I)CI)c1
10436	CC(CI)(CI)c1ccccn1
10557	C[C@@H]1N=C(I)N=C(I)N1c1cccc(Cl)c1
10437	N=C(I)N[C@H]1[C@H](O)[C@@H](NC(=N)I)[C@@H](O)[C@@H](O)[C@@H]1O
10438	O[C@H]1CC[C@]2(OC[C@@H]1O)[C@@H](I)C[C@H](I)[C@H](O)[C@H]2O
10439	[H]/N=C(/I)CI
10440	Clc1cccc(NN=C2C(I)=NN=C2I)c1
10441	[H]/N=C(\\I)c1ccc2sc(-c3ccc(/C(I)=N\\[H])cc3)cc2c1
10442	Cc1c(C)c(CI)c(C)c(C)c1CI
10443	[H]/N=C(/I)c1ccc2oc3ccc(/C(I)=N\\[H])cc3c2c1
10444	N#C/C(I)=C(C#N)/N=C/C=N/C(C#N)=C(/I)C#N
10445	I[C@@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1I
10446	N=C1C=C(I)C(=O)C(I)=C1
10447	Clc1ccc(N2CN=C(I)N=C2I)cc1
10448	CCc1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10449	C[C@H](I)CC[C@H](C)I
10450	[H]/N=C(\\I)SCC#CCS/C(I)=N\\[H]
10451	Clc1ccc(NN=C2C(I)=NN=C2I)cc1
10452	IC[C@H]1CCCC[C@@H]1I
10453	O[C@H]1[C@H](O)[C@H]2CO[C@@H]3O[C@H](CO[C@H](O2)[C@H]1I)[C@@H](O)[C@H](O)[C@H]3I
10454	CCn1c2ccccc2c2cc(NN=C3C(I)=NN=C3I)ccc21
10455	O=C1N=C(I)N=C(I)/C1=N\\Nc1ccccc1
10456	Cc1ccc(N=C(S)I)cc1N=C(S)I
10457	ICC#CCI
10458	IC1=NN=C(I)C1=NNc1cc[nH]n1
10459	Clc1c(Cl)c(CI)c(Cl)c(CI)c1Cl
10460	CC(C)(C)OC(O)=NC(CI)CI
10461	CC(C)(I)c1ccc(C(C)(C)I)cc1
10462	COCc1c2c(n3c1[C@@H](OC)[C@H](I)C3)C(=O)C(C)=C(I)C2=O
10463	[H]/N=C(\\I)C/C(I)=N\\[H]
10464	N=C(I)NC[C@@H](I)C(=O)O
10465	C[C@@H](I)c1ccc([C@@H](C)I)cc1
10466	O=C1C(I)=C(C2=C(I)C(=O)c3ccccc3C2=O)C(=O)c2ccccc21
10467	Brc1ccccc1NN=C1C(I)=NN=C1I
10468	CC(/C=N/NC(=N)I)=N\\NC(=N)I
10469	CCOC(=O)[C@H](I)CI
10470	IC[C@H]1CCCC[C@H]1CI
10471	CC(C)[C@@](C)(I)C(=S)I
10472	CC1(C)N=C(I)N=C(I)N1c1ccc(C(F)(F)F)cc1
10473	BrC(CI)CI
10474	ICC1(CI)COC1
10475	O[C@H]1O[C@@H](CI)[C@H](O)[C@H](O)[C@H]1I
10476	O=S1(=O)N=C(I)C(=NO)C(I)=N1
10477	I[C@H]1CCC[C@H](I)C1
10478	Brc1cc(CI)cc(CI)c1
10479	CC1(C)[C@@H](CI)C[C@H]1I
10480	I[C@@H](c1ccccc1)[C@@H](I)c1ccccc1
10481	C[C@@H](I)[C@@H](I)c1ccccc1
10482	CC(C)(C)c1ccc(/N=C(I)\\C(I)=N/c2ccc(C(C)(C)C)cc2)cc1
10483	O=S1(=O)N=C(I)C(I)=N1
10484	ICC1(CI)CCC1
10485	N=C(I)N/N=C1/CC[C@H]2[C@@H](CC[C@@H]3C/C(=N\\NC(=N)I)CC[C@@H]23)C1
10486	CC(=O)[C@]1(I)C(I)=CC(I)=C(I)[C@H]1I
10487	COc1c(C)ncc(CI)c1CI
10488	ICC1(CI)CCOCC1
10489	CC1=C(I)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](I)[C@@H]3O
10490	C[C@](I)(CI)C(F)(F)F
10491	COc1cccc(N2C(I)=NC(I)=NC2(C)C)c1
10492	[H]/N=C(/I)c1ccc2[nH]c3ccc(/C(I)=N\\[H])cc3c2c1
10493	ICC(CI)c1ccccn1
10494	S=C(I)C(C(=S)I)c1ccccc1
10495	S=C1N=C(I)C(c2nnc(-c3ccccc3)c(-c3ccccc3)n2)C(I)=N1
10496	N=C(I)N=c1nnc(=NC(=N)I)[nH][nH]1
10497	CC(C)(C)OC(O)=NC[C@H](I)CI
10498	CC(C)([C@H]1CC[C@H](I)CC1)[C@H]1CC[C@@H](I)CC1
10499	CCO[C@H]1CC[C@@H](I)[C@H](CI)O1
10500	Brc1cccc(NN=C2C(I)=NN=C2I)c1
10501	CC[C@@H](I)C(O)(O)I
10502	CC(C)C[C@@H](I)CI
10503	N#CC1=C(I)SC(I)=C(C#N)C1c1ccc(F)cc1
10504	I/C=C\\C=C/I
10505	Cc1ccc(/C(I)=N/N=C(\\I)c2ccc(C)cc2)cc1
10506	C[C@@H](I)[C@@H](I)C(=O)O
10507	O[C@H]1C=C[C@@H](O)[C@H](I)[C@@H]1I
10508	C[C@@H](I)[C@@H]1CC[C@H]2[C@@H]3CC=C4C[C@@H](I)CC[C@@]4(C)[C@@H]3CC[C@]21C
10509	IC[C@H]1OCO[C@H]2[C@@H](CI)OCO[C@H]12
10510	CC(C)(I)CCCI
10511	I[C@H]1C[C@@H]2C[C@H]1C[C@H]2I
10512	CC1(C)N=C(I)N=C(I)N1c1ccccc1Cl
10513	CC1(C)N=C(I)N=C(I)N1c1cccc(C(=O)CCl)c1
10514	COc1ccc(C2C(C#N)=C(I)SC(I)=C2C#N)cc1
10515	I[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@]14C[C@@H]5C[C@@H](C[C@@](I)(C5)C1)C4)(C3)C2
10516	IC12CC3(I)C[C@H](C1)C[C@H](C2)C3
10517	O=c1nc(O)c(/C=C/Br)cn1[C@@H]1C[C@H](I)[C@@H](CI)O1
10518	SC(I)=NN=C(S)I
10519	N=C(I)NC(=N)c1cccc(C(=N)NC(=N)I)c1
10520	Fc1ccc(N2CN=C(I)N=C2I)cc1
10521	CC1=C(I)C(=O)c2c(CO)c3n(c2C1=O)C[C@@H](I)C3
10522	O/N=C(I)/C(I)=N/O
10523	CC(C)N=C(I)N=C(I)Nc1ccc(Cl)cc1
10524	C[C@H](I)C/C(I)=N\\O
10525	CO[C@@H]1O[C@H](CI)[C@@H](O)[C@H](I)[C@@H]1O
10526	[H]/N=C(\\I)c1ccc2c(c1)[nH]c1cc(/C(I)=N\\[H])ccc12
10527	SC(I)=NCCN=C(S)I
10528	I[C@@H]1CCCC[C@H]1I
10529	N#CC1=C(I)SC(I)=C(C#N)C1c1ccccc1
10530	IC[C@H]1c2ccccc2C[C@@H]1I
10531	O=C(O)[C@@H](I)/C=C/CI
10532	[H]/N=C(\\I)c1ccc(-c2cc3ccc(/C(I)=N/[H])cc3s2)cc1
10533	Brc1ccc(NN=C2C(I)=NN=C2I)c2ccccc12
10534	C[C@H](I)[C@](I)(c1ccc(F)cc1)c1ccc(F)nc1
10535	CN1CC[C@@H](I)[C@H](CI)C1
10536	N=C(I)NCCCI
10537	COc1cc(NN=C2C(I)=NN=C2I)cc(C(F)(F)F)c1
10538	CC1(C)N=C(I)N=C(I)N1OCc1cccc2cccnc12
10539	O=C1O[C@H](CI)C[C@H]1I
10540	C/C(I)=C\\C(=S)I
10541	I[C@H]1CC[C@H](I)CC1
10542	O[C@H](CI)[C@@H](O)CI
10543	N=C(I)NCCNC(=N)I
10544	O[C@@H]1[C@H](O)[C@@H](O)[C@@H](I)[C@@H](O)[C@@H]1I
10545	CC1(C)N=C(I)N=C(I)N1c1cccc(Br)c1
10546	COc1cc(C2C(C#N)=C(I)SC(I)=C2C#N)ccc1O
10547	O[C@@H]1C[C@H](I)C[C@H](I)C1
10548	CC1(C)N=C(I)N=C(I)N1OCc1cc(Cl)c(Cl)cc1Cl
10549	N#C[C@H](I)[C@H](I)C#N
10550	Oc1ccccc1[C@H](I)[C@@H](I)c1ccccc1O
10551	N=C(I)N[C@H]1CC[C@H]([C@H](I)C(=O)O)CC1
10552	CC(C)(I)[C@H](I)c1ccccc1
10553	CC1(C)C(=O)N=C(I)N=C1I
10554	O=C(/C(I)=C/I)c1ccc(Cl)cc1
10555	[H]/N=C(\\I)c1ccc2nn(-c3ccc(/C(I)=N\\[H])cc3)cc2c1
10556	IC12CCC(I)(c3ccccc31)c1ccccc12
10558	I[C@@H]1CCC[C@@H](I)C1
10559	Cc1ccc([C@@H](I)[C@H](I)c2ccc(C)cc2)cc1
10560	SC(I)=NCN=C(S)I
10561	S=C(I)N(CCI)c1ccc2nccnc2c1Br
10562	I[C@@H]1COC[C@H]1I
10563	[H]/N=C(\\I)c1ccc2oc(-c3cccc(/C(I)=N\\[H])c3)cc2c1
10564	ICC1(CI)CCCCC1
10565	S=C(I)c1cccc(C(=S)I)c1
10566	Oc1ccc2ccccc2c1NN=C1C(I)=NN=C1I
10567	CC(C)[C@@]1(C)N=C(I)N=C(I)N1c1ccc(Cl)cc1
10568	CO[C@H]1O[C@@H](CI)[C@H](O)[C@H](I)[C@@H]1O
10569	I[C@H]1CO[C@H]2[C@H](I)CO[C@@H]12
10570	I[C@H]1c2ccccc2C[C@H]1I
10571	Cc1ncc(CI)c(CI)c1Cl
10572	I[C@H]1CC[C@@H](C2([C@H]3CC[C@@H](I)CC3)CCCCC2)CC1
10573	Cc1ccc([C@H](I)[C@@H](I)c2ccc(C)cc2)cc1
10574	Fc1cccc(F)c1NN=C1C(I)=NN=C1I
10575	Cc1cn([C@@H]2C[C@@H](I)[C@@H](CI)O2)c(=O)nc1O
10576	O=C1N=C(I)N=C(O)C1I
10577	N=C(I)Nc1ccc(-c2ccc(NC(=N)I)cc2)cc1
10578	Cc1cc(C)cc([C@H](I)[C@H](I)c2cc(C)cc(C)c2)c1
10579	CC1(C)N=C(I)N=C(I)N1c1cc(Cl)ccc1Cl
10580	ICCC#CCCI
10581	IC1=NN=C(I)C1=NNc1ncc[nH]1
10582	Clc1ccc(NN=C2C(I)=NN=C2I)cc1Cl
10583	I[C@H]1CC[C@@H]1I
10584	Clc1cccc(N2C(I)=NC(I)=N[C@H]2c2ccccc2)c1
10585	N=C(I)NC[C@H](I)C(=O)O
10586	IC1=Nc2ccccc2N=C(I)C1
10587	IC1=NCN(c2ccccc2)C(I)=N1
10588	C[C@]1(I)CCC[C@@H](I)C1
10589	O=C(O)[C@@H](I)C[C@H]1CC[C@H](I)CC1
10590	ICC(CI)c1ccccc1
10591	S=C(I)[C@H](I)Cc1ccccc1
10592	CC1(C)C(I)=N/C(=N/N=C2\\N=C(I)C(C)(C)N2O)N1O
10593	CC1(C)O[C@@H]2[C@H](I)CSC[C@H](I)[C@H]2O1
10594	CC1(C)N=C(I)N=C(I)N1c1cccc2ccccc12
10595	O/N=C(\\I)CC/C(I)=N\\O
10596	CCC[C@@H](I)CI
10597	CSc1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10598	C[C@@H](CI)/C(I)=N/O
10599	COC1C[C@@H](I)C[C@H](I)C1
10600	CC(C)[C@@H]1N=C(I)N=C(I)N1c1ccc(Cl)cc1
10601	I[C@@H]1Nc2cncnc2N[C@@H]1I
10602	Fc1ccc(NN=C2C(I)=NN=C2I)cc1
10603	CO[C@H]1OC[C@H](I)[C@H](O)[C@H]1I
10604	C[C@@H](I)P(=O)(O)[C@H](I)c1ccccc1
10605	C#C[C@H](I)CC[C@@H](C)I
10606	O=C(O)[C@@H](I)CC#CCI
10607	Clc1ccccc1[C@H](I)[C@@H](I)c1ccccc1Cl
10608	IC1=N[C@H](c2ccccc2)N(c2ccccc2)C(I)=N1
10609	O=C1C(I)=C(I)C(=O)c2ncccc21
10610	IC1=NC2(c3ccccc3)N=C(I)NC2(c2ccccc2)N1
10611	CC1(C)N=C(I)N=C(I)N1Cc1ccc(Cl)cc1
10612	ICc1cccc2c(CI)cccc12
10613	ICC1(I)CCN(Cc2ccccc2)CC1
10614	[H]/N=C(\\I)c1ccc2scc(-c3ccc(/C(I)=N\\[H])cc3)c2c1
10615	OC1=NC2(I)N=C(O)NC2(I)N1
10616	C[C@@H](I)CCCI
10617	N=C(I)NC(=N)N1CCN(C(=N)NC(=N)I)CC1
10618	CO[C@@H]1C=C[C@@H](OC)[C@@H](I)[C@@H]1I
10619	Clc1ccc(N2C(I)=NC(I)=N[C@@H]2c2ccccc2)cc1Cl
10620	CC1(C)N=C(I)N=C(I)N1c1ccc(-c2ccccc2)cc1
10621	C[C@@](I)(CI)C(=O)O
10622	IC[C@H](I)Cc1c[nH]c2ccccc12
10623	C[C@@H]1CC(C)(C)[C@@H](CI)[C@H]1I
10624	I[C@@]12C[C@H]3C[C@H]4[C@@H]1C[C@H]1C[C@@H]2[C@@H](C3)[C@]4(I)C1
10625	I[C@H](c1cccc2ccccc12)[C@H](I)c1cccc2ccccc12
10626	O=C(NN=C(S)I)c1ccc(C(=O)NN=C(S)I)cc1
10627	N#CC1=C(I)Oc2c(ccc3c4c(ccc23)[C@H](c2ccc(Cl)cc2)C(C#N)=C(I)O4)[C@@H]1c1ccc(Cl)cc1
10628	ICC12CC3(CI)C[C@H](C1)C[C@H](C2)C3
10629	ICCCC1(I)CCCCC1
10630	I[C@H]1CCC[C@@H]1I
10631	Oc1ccccc1[C@@H](I)[C@H](I)c1ccccc1O
10632	IC12CCCCC1(I)CCCC2
10633	N=C(I)NNC(=N)I
10634	S=C1C=C(I)C(=S)C=C1I
10635	IC1=NN=C(I)C1=NNc1cccc(I)c1
10636	CC1(C)N=C(I)N=C(I)N1c1cccc(Cl)c1
10637	[H]/N=C(/I)SC[C@@H]1CN=C(I)S1
10638	S=C(I)Oc1ccc(OC(=S)I)cc1
10639	C[C@H]1N=C(I)N=C(I)N1c1ccc(Cl)cc1
10640	C=C(CI)CI
10641	IC/C=C/CI
10642	CC(/C=N/N=C(S)I)=N\\N=C(S)I
10643	ON=C1C(I)=NC(=S)N=C1I
10644	CC(=O)O/N=C(I)/C(I)=N/OC(C)=O
10645	[H]/N=C(/I)c1ccc(-c2cc3ccc(/C(I)=N\\[H])cc3o2)cc1
10646	CC1(C)[C@@H](CI)CC[C@]1(C)CI
10647	CC(C)(I)C(=O)C(C)(C)I
10648	N#CC1=C(I)SC(I)=C(C#N)C1c1cccc(F)c1
10649	O=C(O)[C@H]1[C@@H]2C[C@@H](I)[C@@](I)(C(=O)O)[C@@H]21
10650	I[C@H]1CC[C@@H](I)C1
10651	CCC(C)(CI)CI
10652	CC1(C)N=C(I)N=C(I)N1c1cccc(CO)c1
10653	CC1(C)N=C(I)N=C(I)N1c1cccc(C#N)c1
10654	ICC1(I)CCCC1
10655	O=C(O)c1ccc(NN=C2C(I)=NN=C2I)cc1
10656	CC[C@]1(C)N=C(I)N=C(I)N1c1c(C)cccc1C
10657	CC(C)(I)CCC(C)(C)I
10658	O/N=C(I)/C(I)=N\\O
10659	CC1(C)[C@H](I)C(C)(C)[C@@H]1I
10660	O[C@@H](CI)[C@@H](O)CI
10661	Cc1cc(C)c(CI)cc1CI
10662	I[C@H]1C[C@H]2C[C@@H](I)C[C@H]2C1
10663	IC[C@@H](I)Cc1ccccc1
10664	N#CC1=C(I)SC(I)=C(C#N)C1c1ccc(Cl)cc1
10665	CC/C(I)=C(/C#N)C(=S)I
10666	Cc1ccc(NN=C2C(I)=NN=C2I)cc1
10667	[H]/N=C1/C=C(I)/C(=N/[H])C=C1I
10668	[H]/N=C(/I)c1ccc(CI)cc1
10669	CC1(C)N=C(I)N=C(I)N1c1ccccc1
10670	Oc1cc(Cl)c([C@H](I)[C@@H](I)c2c(Cl)cc(O)cc2Cl)c(Cl)c1
10671	S=C(I)[C@@H](I)c1ccccc1
10672	N=C(I)Nc1cc(NC(=N)I)cc(C(=O)O)c1
10673	CC(C)([C@H]1CC[C@H](I)CC1)[C@H]1CC[C@H](I)CC1
10674	CC(C)(C)c1ccc(/N=C(I)/C(I)=N/c2ccc(C(C)(C)C)cc2)cc1
10675	CC1(C)N=C(I)N=C(I)N1c1ccc(Cl)c(Cl)c1
10676	I[C@@H]1CCC[C@H]1I
10677	C[C@@H]1CC[C@@H](I)C[C@@H]1I
10678	CC1(C)N=C(I)N=C(I)N1c1cc(Cl)c(Cl)cc1Cl
10679	C[C@]12CC[C@@H]3[C@@H](CC[C@@H]4C[C@H](I)CC[C@]43C)[C@@H]1CC[C@@H]2I
10680	O=C1C(I)=C(N2CC2)C(=O)C(I)=C1N1CC1
10681	CC1(C)N=C(I)N=C(I)N1OCc1ccc(Cl)c(Cl)c1
10682	IC1=NN=C(I)C1=NN=c1cc[nH]cc1
10683	ICc1c2ccccc2c(CI)c2ccccc12
10684	COC1=C(I)C(=O)C(OC)=C(I)C1=O
10685	CS/C(I)=N\\N=C(S)I
10686	S=C(I)Nc1ccc(NC(=S)I)cc1
10687	[H]/N=C(I)\\N=C1\\N=C(I)c2ccccc21
10688	O[C@H]1[C@H](O)[C@H](O)[C@@H](I)[C@H](O)[C@@H]1I
10689	CC1(C)N=C(I)N=C(I)N1c1ccc(C#N)cc1
10690	I[C@H]1CCCC[C@H]1C[C@H]1CCCC[C@@H]1I
10691	CC(C)c1ccccc1NN=C1C(I)=NN=C1I
10692	I[C@H]1CCC[C@H]2[C@@H]1CCC[C@H]2I
10693	N=C(I)NC(=N)I
10694	Clc1ccc([C@H](I)[C@@H](I)c2ccc(Cl)cc2)cc1
10695	O=C(CI)OCCI
10696	C/C(I)=C(\\C#N)C(=S)I
10697	O=P(O)(CI)CI
10698	IC[C@H]1CC[C@H](I)CC1
10699	Fc1cccc([C@H](I)CI)c1
10700	CSc1ccc(NN=C2C(I)=NN=C2I)cc1
10701	I[C@@H](c1cccc2ccccc12)[C@H](I)c1cccc2ccccc12
10702	I[C@@H](C1CCCCC1)[C@@H](I)C1CCCCC1
10703	Ic1cccc(-c2cccc(I)c2)c1
10704	ICC12CCC(CI)(CC1)CC2
10705	FC(F)(F)c1ccc([C@@H](I)CI)cc1
10706	CNC(CI)CI
10707	COc1ccc(NN=C2C(I)=NN=C2I)cc1Cl
10708	I[C@H]1CSC[C@H]1I
10709	CC1(C)N=C(I)N=C(I)N1c1ccc(F)cc1
10710	ICc1cccc2cc3cccc(CI)c3nc12
10711	[H]/N=C(C#N)\\C(I)=N\\C(C#N)=C(/I)C#N
10712	ICC1(I)CCCCCC1
10713	IC[C@@H]1CC[C@H](CI)O1
10714	Brc1ccc(NN=C2C(I)=NN=C2I)cc1
10715	ICc1ccc(CI)s1
10716	CC(=N\\N=C(S)I)/C(C)=N/N=C(S)I
10717	S=C(I)c1ccc(C(=S)I)cc1
10718	COC(=O)[C@H](I)CI
10719	IC[C@H]1CC[C@@H]1CI
10720	C[C@H](I)CC(C)(C)I
10721	[H]/N=C(/I)[C@H](I)C(=O)OCC
10722	I/C(=N/N=C(/I)c1ccccc1)c1ccccc1
10723	OC(=N[C@H]1C=C[C@@H](I)C[C@H]1I)OCc1ccccc1
10724	IC1=NC2=NCCN2C(I)=N1
10725	I[C@H]1CC[C@H](C[C@H]2CC[C@H](I)CC2)CC1
10726	C[C@@H](I)C[C@@H](C)I
10727	CC(C)(C)C1(C)O[C@@H](CI)[C@H](CI)O1
10728	N#CC1=C(I)SC(I)=C(C#N)C1c1ccco1
10729	IC1=NN=C(I)C1=NNc1cccc2ccccc12
10730	S=C(I)c1cccc(C(=S)I)n1
10731	CCC(I)(CC)CI
10732	C#Cc1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10733	C[C@H](I)[C@H](C)I
10734	CO[C@H]1O[C@@H]2CO[C@H](c3ccccc3)O[C@@H]2[C@H](I)[C@H]1I
10735	N#CC1=C(I)SC(I)=C(C#N)C1c1ccccc1Cl
10736	N=C(I)N[C@@H]1[C@H](O)[C@@H](NC(=N)I)[C@H](O)[C@@H](O)[C@H]1O
10737	[H]/N=C(/I)c1ccc(-c2cc3cc(/C(I)=N\\[H])ccc3[nH]2)cc1
10738	IC12C[C@H]3[C@@H]4CC5(I)C[C@H]([C@@H](C1)[C@@H]3C5)[C@@H]4C2
10739	I[C@H](c1ccco1)[C@H](I)c1ccco1
10740	S=C(I)SCCSC(=S)I
10741	IC[C@@]1(I)CN2CCC1CC2
10742	N#CC1=C(I)S[C@@H](c2ccccc2)[C@](C#N)(C(=S)I)[C@@H]1c1ccccc1
10743	I[C@H]1CCCC[C@@H]1SS[C@@H]1CCCC[C@H]1I
10744	IC1=NN=C(I)C1=NNc1ccccc1
10745	N=C(I)N=C(S)I
10746	N#CC1=C(I)SC(I)=C(C#N)C1c1cccs1
10747	CCCN1C(I)=NC(I)=NC1(C)C
10748	IC12[C@H]3[C@H]4[C@@H]1[C@H]1[C@@H]2[C@@H]3C41I
10749	I[C@H](C1CCCCC1)[C@H](I)C1CCCCC1
10750	COc1ccc(OC)c(N2C(I)=NC(I)=NC2(C)C)c1
10751	C[C@@H]1C[C@H](C[C@H]2CC[C@@H](I)[C@H](C)C2)CC[C@@H]1I
10752	N#C/C(I)=C(\\I)C#N
10753	N#C/C(I)=C(C#N)/N=C/I
10754	I[C@H]1[C@H](c2ccccc2)[C@H](I)[C@@H]1c1ccccc1
10755	[H]/N=C(/I)S/C(I)=N\\[H]
10756	SC(I)=NN=C1Nc2ccccc2C1=NN=C(S)I
10757	CC[C@@H]1C[C@@H](CC)[C@@H](I)[C@H](C)[C@H]1I
10758	IC1(C2(I)CCCCC2)CCCCC1
10759	CC(C)(C)OC(=O)[C@@H](I)CI
10760	CC[C@]1(C)N=C(I)N=C(I)N1c1ccc(Cl)cc1
10761	[H]/N=C(\\I)SCCI
10762	COc1cc(OC)cc(N2C(I)=NC(I)=NC2(C)C)c1
10763	OC[C@@H]1O[C@@H](O)[C@@H](I)[C@H](I)[C@@H]1O
10764	I[C@@H]1CCCC[C@H]1C[C@H]1CC[C@@H](I)CC1
10765	ICc1cccc2cc3cccc(CI)c3cc12
10766	ICc1ccccc1CI
10767	I[C@@H]1CC[C@@H]2CCCC[C@@H]2[C@H]1I
10768	I[C@@H]1C[C@H]2C[C@@H]1C[C@H]2I
10769	CC1(C)N=C(I)N=C(I)N1c1ccc(S(C)(=O)=O)cc1
10770	CC1(C)N=C(I)N=C(I)N1c1ccc2ccccc2c1
10771	ICC1(CI)CCCC1
10772	OC[C@H](I)CI
10773	COc1ccc(CN2C(I)=NC(I)=NC2(C)C)cc1
10774	C[C@](I)(C(=S)I)c1ccccc1
10775	C/C(I)=N\\Cc1cccc(CI)c1
10776	N=C(I)Nc1ccc(CI)cc1
10777	ICc1ccc2c(c1)CN1CN2Cc2cc(CI)ccc21
10778	IC1=NN=C(I)C1=NNc1nc2ccccc2s1
10779	CC(C)/C(I)=C(/C#N)C(=S)I
10780	I[C@@H]1CN(Cc2ccccc2)C[C@H]1I
10781	CC[C@@H]1C[C@@H](C)[C@@H](I)[C@@H](CC)[C@@H]1I
10782	IC[C@@H]1CCC[C@@H]1I
10783	Cc1cc(CI)c(O)c(CI)c1
10784	IC1=NN=C(I)C1=NNCC1CCNCC1
10785	Ic1cccc(C#Cc2ccccc2I)c1
10786	OCC[C@@H](I)CI
10787	CCOc1cccc(N2C(I)=NC(I)=NC2(C)C)c1
10788	OC[C@@H]1O[C@@H](O[C@H]2[C@@H](O)[C@H](O)[C@H](I)C[C@H]2I)[C@@H](O)[C@@H](O)[C@H]1O
10789	IC[C@@H](I)C12C[C@H]3C[C@@H](C1)C[C@@H](C2)C3
10790	Cc1cccc(N2C(I)=NC(I)=NC2(C)C)c1
10791	O[C@@H]1CC[C@@]2(OC[C@H]1O)[C@H](I)C[C@H](I)[C@H](O)[C@H]2O
10792	O[C@H]1O[C@@H](CI)[C@H](O)[C@H](O)[C@@H]1I
10793	I[C@H]1CC[C@@H](C[C@H]2CC[C@@H](I)CC2)CC1
10794	C[C@@H](ON1C(I)=NC(I)=NC1(C)C)c1c(Cl)cccc1Cl
10795	IC[C@H](I)Cc1ccccc1
10796	Cc1ccc(/N=C(I)/C(I)=N/c2ccc(C)cc2)cc1
10797	CC1(C)N=C(I)N=C(I)N1OCc1cccc2ccccc12
10798	I[C@H]1CCCCCC[C@H]1I
10799	CC(C)(C)c1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10800	IC[C@H]1CCCC[C@H]1I
10801	CCC1(CC)C(I)=NC(=O)N=C1I
10802	O=C(O)[C@@H]1NC(I)=N[C@H]1[C@H](O)CI
10803	N#CC1=C(I)SC(I)=C(C#N)C1c1ccc(Br)cc1
10804	I[C@H]1CC=CC[C@@H]1I
10805	O[C@H]1CO[C@]2(C[C@H]1O)[C@@H](I)C[C@@H](I)[C@@H](O)[C@@H]2O
10806	Cc1nc(CI)c(=O)[nH]c1CI
10807	I[C@@H](c1ccccn1)[C@H](I)c1ccccn1
10808	Clc1c(Cl)c(CI)c(Cl)c(Cl)c1CI
10809	CC[C@H](I)CCI
10810	Cc1ccccc1[C@H](I)[C@@H](I)c1ccccc1C
10811	I/C(=N/N=C(/I)c1ccccn1)c1ccccn1
10812	O=S(=O)(O)c1ccc(NN=C2C(I)=NN=C2I)cc1
10813	COC[C@H](I)CI
10814	I/C(=N\\N=C(\\I)c1ccccn1)c1ccccn1
10815	I[C@H]1CCCC[C@H](I)CCCC1
10816	Cl/N=C(I)\\N=N\\C(I)=N/Cl
10817	[H]/N=C(\\I)c1ccc(-c2nc3cc(/C(I)=N/[H])ccc3[nH]2)cc1
10818	IC12CNCCNCC(I)(CNCCNC1)CNCCNC2
10819	Oc1ccc([C@H](I)[C@H](I)c2ccc(O)cc2)cc1
10820	N=C(I)NN=C1C=CC(=NN=C(S)I)C=C1
10821	O=C([C@H](I)CCI)N1CCCCC1
10822	Cc1ccc(CI)cc1CI
10823	CCON1C(I)=NC(I)=NC1(C)C
10824	CC(O)=N[C@H]1[C@@H](I)C=C(C(=O)O)C[C@@H]1I
10825	O=C(CI)CI
10826	CCC[C@]1(C)N=C(I)N=C(I)N1c1ccc(Cl)cc1
10827	CC1(C)N=C(I)N=C(I)N1c1ccc(C#Cc2ccccc2)cc1
10828	O=C1CC(I)=NC(I)=N1
10829	COC(=O)[C@@H](I)CI
10830	C[C@@H]1CCC[C@H](I)[C@H]1I
10831	O[C@H](I)CI
10832	COC(=O)[C@@H](I)[C@H](I)c1ccccc1
10833	FC(F)(F)c1ccc([C@H](I)[C@H](I)c2ccc(C(F)(F)F)cc2)cc1
10834	IC[C@H](I)c1ccccc1
10835	IC[C@H]1CC[C@H](CI)CC1
10836	O=C(O)[C@H](I)[C@H](I)C(=O)O
10837	C[C@@H]1C[C@H]2C[C@@H](C)[C@](C)(I)[C@H]3CC[C@H]4[C@@H]([C@H]1CC[C@@]4(C)I)[C@@H]23
10838	N=C(I)NN=C1C=CC(=NNC(=N)I)C=C1
10839	Fc1ccc([C@@H](I)[C@H](I)c2ccc(F)cc2)cc1
10840	I[C@@H]1CCc2ccccc2[C@H]1I
10841	CC1(C)N=C(I)N=C(I)N1O
10842	O=C(CI)CCI
10843	O/N=C(/I)CI
10844	IC[C@H]1CC[C@@H](CI)CC1
10845	I[C@H]1CC[C@@H]([C@H]2CC[C@@H](I)CC2)CC1
10846	CON1C(I)=NC(I)=NC1(C)C
10847	ICC1=CC[C@H](CI)CC1
10848	CC(O)=NC1=C(I)C(=O)C(N=C(C)O)=C(I)C1=O
10849	S=C(I)Nc1ccc(-c2ccc(NC(=S)I)cc2)cc1
10850	C[C@H]1OC(=O)C(I)=C1I
10851	O/N=C(I)/C(=N\\O)C(=N\\O)/C(I)=N/O
10852	I[C@H]1CC[C@H](I)C1
10853	Cc1ccccc1NN=C1C(I)=NN=C1I
10854	BrC[C@H](I)CI
10855	OC1=NC[C@@H](O)[C@H](I)[C@H]1I
10856	O=C(CI)N=C(O)CI
10857	CCOC(=O)C1=C(I)N=C(I)CC1
10858	IC[C@@]12C[C@@H]3C[C@@H](C[C@@H](C3)C1)[C@@H]2I
10859	CC1(C)N=C(I)N=C(I)N1c1ccc(C(=O)O)cc1
10860	C[C@H](I)C(C)(C)I
10861	I[C@H](c1ccccc1)[C@H](I)c1ccccc1
10862	C[C@@H](CI)[C@@H](C)CI
10863	CC1(C)N=C(I)N=C(I)N1c1ccccc1Br
10864	Cl/N=C(I)/N=N/C(I)=N\\Cl
10865	I[C@H]1CCCC[C@@H](I)CCCC1
10866	IC1=NN=C(I)C1=NNc1nccs1
10867	O/N=C(\\I)CCI
10868	CC1(C)N=C(I)N=C(I)N1c1ccc(O)cc1
10869	CC1(C)N=C(I)N=C(I)N1c1cccc(C(O)=Nc2cccnc2)c1
10870	O=C1C=C(I)C(=O)C=C1I
10871	FC(CI)CI
10872	FC(F)(CI)CI
10873	IC1=N[C@@H]2C=C[C@H]1[C@H]1C=C[C@@H]2C(I)=N1
10874	Fc1c(F)c(F)c(NN=C2C(I)=NN=C2I)c(F)c1F
10875	Cc1ncc(CI)c(CI)c1O
10876	CCOC(=O)c1cccc(N2C(I)=NC(I)=NC2(C)C)c1
10877	CC1(C)N=C(I)N=C(I)N1c1cccc(C(F)(F)F)c1
10878	N=C(I)NC(I)=NCCc1ccccc1
10879	CC1(C)N=C(I)N=C(I)N1c1cc(Cl)cc(Cl)c1
10880	O=S(=O)(O)c1ccc(NN=C2C(I)=NN=C2I)c2ccccc12
10881	[H]/N=C(\\I)c1ccc2[nH]c(-c3ccc(/C(I)=N\\[H])cc3)nc2c1
10882	CCOC(=O)c1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10883	CC1(C)N=C(I)N=C(I)N1c1ccc(Cl)cc1Cl
10884	OC(CI)=NCCI
10885	CC(C)(C)c1cccc(N2C(I)=NC(I)=NC2(C)C)c1
10886	CC(C)/C(I)=C/C(=S)I
10887	C[C@H](I)O[C@H](C)I
10888	CC(C)(I)[C@H]1CC[C@@](C)(I)CC1
10889	C[C@H](I)Cc1cccc(C(C)(C)I)c1
10890	I[C@H]1CC2(C[C@H](I)C2)C1
10891	CC1(C)N=C(I)N=C(I)N1OCc1c2ccccc2cc2ccccc12
10892	O=S1(=O)N=C(I)C=C(I)N1Cc1ccccc1
10893	C[C@H](ON1C(I)=NC(I)=NC1(C)C)c1ccc(Cl)cc1Cl
10894	I[C@H]1CC[C@H](C[C@H]2CC[C@@H](I)CC2)CC1
10895	C[C@H]1CC[C@H](I)[C@@H](I)C1
10896	CC1(C)N=C(I)N=C(I)N1c1ccc2cc(Cl)ccc2c1
10897	C[C@H](I)c1ccc(-c2ccc([C@H](C)I)cc2)cc1
10898	ICc1ccc(CI)o1
10899	[H]/N=C(\\I)c1ccc(-c2ccc(/C(I)=N\\[H])cc2)cc1
10900	O=C1C(Br)=C(I)C(=O)C(Br)=C1I
10901	COC(=O)c1ccc(N2C(I)=NC(I)=NC2(C)C)cc1
10902	CC(=N\\NC(=N)I)/C(C)=N/NC(=N)I
10903	CC1(C)N=C(I)N=C(I)N1c1ccccc1I
10904	IC1(OOC2(I)CCCCC2)CCCCC1
10905	C[C@H](I)[C@@H](I)c1ccccc1
10906	O/N=C(\\I)[C@H](I)c1ccccc1
10907	IC[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1CI
10908	Oc1ccc(NN=C2C(I)=NN=C2I)cc1
10909	Fc1ccccc1C[C@@H](I)CI
10910	CC1(C)[C@H](CI)CC[C@@]1(C)CI
10911	[H]/N=C(/I)SCCNC(=N)I
10912	C[C@@H](I)C(O)=N[C@H]1CO[C@H](O)[C@@H](I)[C@H]1O
10913	CO[C@@H]1O[C@@H](CI)[C@@H](O)[C@@H](O)[C@@H]1I
10914	COC(=O)c1cc(CI)cc(CI)c1
10915	COC(=O)[C@@]12C[C@]1(C(=O)O)C(C(=O)O)=C[C@H]1CC(C)(C)C[C@H]12
10916	CN1CCc2cc(C(=O)O)cc(C(=O)O)c21
10917	CC1(C)CCC[C@@]2(C)[C@H]1CC[C@@]1(C(=O)O)C(=O)CC(C(=O)O)=CC[C@@H]12
10918	O=C(O)c1c(C(=O)O)n(-c2ccccc2)c2ccccc12
10919	Cc1cc2c(cc1C(=O)O)[C@H]1c3ccccc3[C@@H]2c2cc(C(=O)O)ccc21
10920	O=C(O)c1ccc2c(c1)C(=O)c1cccc3c(C(=O)O)ccc-2c13
10921	CC(C)(C)Sc1cc(O)c(C(=O)O)cc1C(=O)O
10922	O=C(O)c1cc(C(=O)O)c(N2CCCCC2)o1
10923	C/C(C#C/C(C)=C(/C)C(=O)O)=C(\\C)C(=O)O
10924	CC(C)(C)[C@@H]1CC=C(C(=O)O)[C@@H](CC(=O)O)C1
10925	CC(C)(C)n1cc(C(=O)O)c(C(=O)O)c1
10926	O=C(O)[C@@H]1C[C@H](CO)[C@@H](C(=O)O)O1
10927	O=C(O)[C@H]1C[C@H]2C=C[C@@H]1[C@@H]2C(=O)O
10928	CC1(C)CCC[C@@]2(C)[C@@H]1CC[C@H](C(=O)O)[C@]2(O)C(=O)O
10929	O=C(O)c1cc2sc3cc(C(=O)O)sc3c2s1
10930	O=C(O)c1ccc(Cl)c(C(=O)O)c1Cl
10931	COc1cc(C#CC(=O)O)c(OC)cc1C#CC(=O)O
10932	Cc1ccc2c(c1)C(C(=O)O)=C(C(=O)O)c1ccccc1C2
10933	COc1c(C(=O)O)cc(Cl)c(C)c1C(=O)O
10934	O=C(O)c1cc2ccccc2c(-c2nc(C(=O)O)cc3ccccc23)n1
10935	O=C(O)C1=C(Cl)c2cc(-c3ccc4c(c3)C(Cl)=C(C(=O)O)CC4)ccc2CC1
10936	O=C(O)c1sc(Cl)c(C(=O)O)c1Cl
10937	C/C(=C/c1ccc(C(=O)O)cc1)C(=O)O
10938	O=C(O)[C@H]1[C@H]2CC[C@H](CC2)[C@H]1C(=O)O
10939	C[C@H]1[C@@H](C)N(C(=O)O)c2ccccc2N1C(=O)O
10940	C[C@@H](C#C[C@@H](C)C(=O)O)C(=O)O
10941	O=C(O)c1ccc2cc3nc(C(=O)O)ccc3cc2n1
10942	C/C=c1/c2c(/c(=C/C)c3c1[C@H](C)[C@H](C(=O)O)C[C@@H]3C)[C@@H](C)[C@H](C(=O)O)C[C@@H]2C
10943	O=C(O)C1=CS/C(=C2\\SC=C(C(=O)O)S2)S1
10944	O=C(O)C1=C(Cl)NC(Cl)=C(C(=O)O)C1c1ccccc1
10945	O=C1c2cc(Cl)ccc2C(=O)c2c1ccc(C(=O)O)c2-c1c(C(=O)O)ccc2c1C(=O)c1ccc(Cl)cc1C2=O
10946	CO[C@@H]1[C@@H](C(=O)O)[C@@H]2C[C@H]2[C@H]1C(=O)O
10947	O=C(O)C[C@@H]1CCC[C@H](C(=O)O)C1
10948	O=C(O)[C@H]1CO[C@@H](C(=O)O)O1
10949	O=C(O)c1ccccc1-c1cc2c(cc1C(=O)O)sc1ccccc12
10950	CC1(C)CC2CC(C)(C)Oc3c(C(=O)O)c(O)c(C(=O)O)c(c32)O1
10951	Cc1cc(-c2[nH]c(C(=O)O)cc2C)[nH]c1C(=O)O
10952	CC1(C)CCC(C)(C)c2cc(C(=O)O)c(C(=O)O)cc21
10953	CC1(C)CCC=C(C(=O)O)[C@H]1C(=O)O
10954	Cc1cc(-c2ccccc2)cc(C)c2c(C(=O)O)c(C(=O)O)cc1-2
10955	O=C(O)c1cscc1C(=O)O
10956	O=C(O)/C(=C\\O)c1[nH]nc(Cl)c1C(=O)O
10957	O=C(O)C1=C2CCc3cc4c5cc3CCC2=C(C(=O)O)/C=C(CC5)\\C(=C/1)CC4
10958	N#Cc1c2cccccc-2c(C(=O)O)c1C(=O)O
10959	Cc1cc(C)c(-c2c(C)cc(C)cc2C(=O)O)c(C(=O)O)c1
10960	O=C(O)NNC(=O)O
10961	CC[C@@]12C3=CC=CC1=C(C(=O)O)C(C(=O)O)=C2C=C3
10962	O=C(O)c1ccccc1-c1cc2ccc3ccccc3c2cc1C(=O)O
10963	C[C@@]12C[C@H]3[C@H]4C[C@@H]1[C@H](C[C@@]4(C)NN3C(=O)O)N(C(=O)O)N2
10964	O=C(O)c1ccc2ccc3c(C(=O)O)ccc4ccc1c2c43
10965	C[C@H]1Cc2c(n(C(=O)O)c3ccccc23)-c2ncc(C(=O)O)c(=O)n21
10966	C=C1COC(=O)c2c(C(=O)O)cc3ccccc3c2-c2c(c(C(=O)O)cc3ccccc23)C(=O)OC1
10967	C=C1[C@@H](C(=O)O)[C@@H](CC(=O)O)C[C@H]1O
10968	CN1C=C[C@@H](c2c(C(=O)O)n(C)c3ccccc23)C(C(=O)O)=C1
10969	O=C(O)c1ccc(C#Cc2ccc3c4c(ccc(C#Cc5ccc(C(=O)O)cc5)c24)CC3)cc1
10970	O=C(O)C/C=C1/C=CC=C1C(=O)O
10971	O=C(O)c1cc(C(=O)O)c(N2CCOCC2)o1
10972	C/C(C#CC#C/C(C)=C(\\C)C(=O)O)=C(\\C)C(=O)O
10973	N=C1N[C@H]2C[C@@H](N1)[C@@H]1N(C(=O)O)[C@](O)(O2)[C@H]2[C@H]3C[C@H](NC(=N)N3)O[C@]1(O)N2C(=O)O
10974	Cc1ccc(-c2nc3c(C(=O)O)c4cccccc4n3c2C(=O)O)cc1
10975	O=C(O)N1CCOCCOCCN(C(=O)O)CC1
10976	O=C(O)c1cc(Cl)c(Cl)c(C(=O)O)c1
10977	O=C(O)c1cc(CO)c(O)c(C(=O)O)c1
10978	O=C(O)C1=CC=c2c3c(c4cccc5cccc2c54)C=CC(C(=O)O)=C1C3
10979	O=C(O)c1cc(Cl)c(C(=O)O)c(Cl)c1Cl
10980	C=C(C(=O)O)[C@@H]1CC[C@@]2(C)CCC=C(C(=O)O)[C@H]2C1
10981	CN(C(=O)O)/C(=C/O)C(=O)O
10982	O=C(O)c1c[nH]c2ccc(-c3[nH]c4ccccc4c3C(=O)O)cc12
10983	O=C(O)c1ccc2c3c(ccc2c1)OCOc1ccc2cc(C(=O)O)ccc2c1-3
10984	C[C@@H]1CC[C@@H](C(=O)O)[C@H](C(=O)O)C2=CC(C)(C)C[C@H]21
10985	O=C(O)/N=c1/c2ccccc2c2nc3/c(=N\\C(=O)O)c4ccccc4c3nc12
10986	Cc1ccc2oc(C(=O)O)c(C(=O)O)c2c1
10987	O=C(O)c1sc(C(=O)O)c2c1ncc1sccc12
10988	C[C@@H]1CC[C@H]2C(C)(C)[C@@H](O)CC[C@@]2(C)[C@@]12Cc1c(O)cc(C(=O)O)c(C(=O)O)c1O2
10989	O=C(O)C1=C(F)C(C(=O)O)=C1F
10990	O=C(O)C1=C[C@@H]2C=C(C(=O)O)[C@@H]3C=C[C@H]1[C@H]23
10991	O=C(O)c1cc2c(c(C(=O)O)c1)CCC2
10992	C[C@]12CC[C@@H]3[C@H](CC[C@H]4Cc5oc(C(=O)O)cc5C[C@]43C)[C@H]1CC[C@H]2OC(=O)O
10993	Cc1c(C(=O)O)n(C(=O)O)c2c(C)cc(Br)cc12
10994	C=C1C[C@](C)(C(=O)O)[C@@H](C(=O)O)C[C@@H]1O
10995	O=C(O)c1ccc2c(c1)C1(CC2)CCc2ccc(C(=O)O)cc21
10996	CC1(C)C[C@@H]2[C@@H](C=C(C(=O)O)[C@]3(C(=O)O)C[C@]23C)[C@@H]1O
10997	O=C(O)c1c2cccccc-2cc1-c1cc2cccccc-2c1C(=O)O
10998	Cc1cc(C)c(-c2c(C)cc(C)c(C(=O)O)c2C)c(C)c1C(=O)O
10999	COc1cccc2c1CC[C@H]1[C@@](C)(C(=O)O)CCC[C@]21C(=O)O
11000	CN1C=C(C(=O)O)CC(C(=O)O)=C1
11001	Cn1c(Cl)c(C(=O)O)c(C(=O)O)c1N1CCCCC1
11002	O=C(O)[C@@H]1/C=C/C=C\\[C@H](C(=O)O)/C=C\\C1
11003	O=C(O)[C@H]1[C@H]2C=C[C@H](CC2)[C@H]1C(=O)O
11004	CC1(C)[C@@H](C(=O)O)[C@@]2(C#N)C[C@]1(C#N)[C@@H](C(=O)O)C2(C)C
11005	O=C1C(Cl)=C2C(=O)C(Cl)=C1N(C(=O)O)CCCCCCCCCCCCN2C(=O)O
11006	C/C(=C\\[C@H]1[C@H](C(=O)O)C1(C)C)C(=O)O
11007	C[C@@H]1CN=C(S)Nc2ccccc2N(C(=O)O)CCN(C(=O)O)c2ccccc2NC(S)=N1
11008	CN1C=C[C@@H](c2c(C(=O)O)[nH]c3ccccc23)C(C(=O)O)=C1
11009	O=C(O)c1ccc2ccoc2c1N1CCN(C(=O)O)CC1
11010	C/C=c1/c2c(/c(=C\\C)c3c1C[C@@H](C(=O)O)CC3)C[C@H](C(=O)O)CC2
11011	O=C(O)c1cc(O)c(C(=O)O)s1
11012	CC1=C[C@@H]2OC=C(C(=O)O)[C@](C)(C(=O)O)[C@@H]2[C@H](CO)C1
11013	O=C(O)C1=S=C(C(=O)O)c2cc3ccccc3cc21
11014	Cc1cc(O)cc(C(=O)O)c1-c1c(C)cc(O)cc1C(=O)O
11015	CC(=O)N1[C@H](C(=O)O)Cc2c[nH]c3cccc(c23)[C@@H]1/C=C(/C)C(=O)O
11016	CC1(C)C=C(C(=O)O)C(Cl)=C(C(=O)O)C1
11017	C[C@@]12CCC=C(C(=O)O)[C@]1(C(=O)O)C2
11018	O=C(O)C1=CC=CC2=CC=CC(C(=O)O)=C1C2
11019	O=C(O)[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@H]1[C@H]4C[C@@H]5C[C@H](C4)C[C@@]1(C(=O)O)C5)(C3)C2
11020	CC1=C(C(=O)O)C2=CC=C3C=CC=C4C=CC(=C1C(=O)O)[C@]2(C)[C@]43C
11021	COc1ccc2c(c1)C(C(=O)O)=C(C(=O)O)c1ccccc1C2
11022	O=C(O)c1cc(O)c(O)cc1C(=O)O
11023	O=C(O)c1cc2ccc(O)c(C(=O)O)c2cc1O
11024	O=C(O)c1cc(C(=O)O)c(N2CCNCC2)o1
11025	O=C(O)c1ccc(N2CCN(C(=O)O)CC2)c2occc12
11026	COc1c2oc(C(=O)O)c(Cl)c2cc2c(Cl)c(C(=O)O)oc12
11027	Cc1c(C(=O)O)n(C(=O)O)c2c(Cl)ccc(Cl)c12
11028	CC1=C/C(C(=O)O)=C\\C(C)=C/C(C(=O)O)=C1
11029	O=C(O)C(=O)O[C@H]1CCC[C@@H]1C(=O)O
11030	Cc1nc2ccccc2c(C(=O)O)c1C(=O)O
11031	CC1(C)C(C(=O)O)=C(Cl)N(c2ccccc2)C(Cl)=C1C(=O)O
11032	O=C(O)c1cc2ccccc2c(C(=O)O)c1O
11033	COc1cc2c(C)c(c1)CCc1c(C)c(c(C(=O)O)c(C)c1C(=O)O)CC2
11034	O=C(O)N1CC(Br)CN1C(=O)O
11035	O=C(O)C#CC1(C#Cc2ccccc2C#CC2(C#CC(=O)O)OCCCO2)OCCCO1
11036	CN1C(=O)N2[C@@H](C(=O)O)O[C@@H](C(=O)O)CO[C@@H]2c2nc3c4ccccc4n(C)c3nc21
11037	O=C(O)/C=C\\C(O)=C/C(=O)O
11038	O=C(O)C[C@@H]1[C@H]2CC[C@H](C2)[C@H]1C(=O)O
11039	O=C(O)c1ccnc(-c2nccc(C(=O)O)n2)n1
11040	COc1c(O)c(C(=O)O)c(Br)c(C(=O)O)c1O
11041	O=C(O)C1=C(Cl)NC(Cl)=C(C(=O)O)C1c1cccc(Cl)c1
11042	COC(=O)[C@H]1CCC[C@@](C)(C(=O)O)[C@@H]1C(=O)O
11043	O=C(O)c1csc(-c2cc(C(=O)O)cs2)c1
11044	CC1=C(C(=O)O)[C@H](CC(=O)O)CC1
11045	O=C(O)c1cccc2c1Oc1c(cccc1C(=O)O)O2
11046	O=C(O)c1nc2ccc(Cl)cc2nc1C(=O)O
11047	CC1=C/C(=C2\\C=C(C)C(=O)C(C(=O)O)=C2)C=C(C(=O)O)C1=O
11048	CC(O)=Nc1c(C(=O)O)c2cccccc-2c1C(=O)O
11049	O=C(O)[C@@H]1C=C[C@@H](C(=O)O)N1
11050	C[C@H](C#C/C=C\\[C@@H](C)C(=O)O)C(=O)O
11051	C#CC1C(C(=O)O)=CN(c2c(C)cccc2C)C=C1C(=O)O
11052	O=C(O)C1=C(Cl)C(=CN2CCOCC2)C(Cl)=C(C(=O)O)C1
11053	CC(=O)O[C@@H]1[C@@H]2CC(C)(C)CC2=C(C(=O)O)[C@]2(C(=O)O)C[C@]12C
11054	CC1=CC2=C(C(=O)O)C3(CC3)[C@@](C)(O)C(=O)C2=C1C(=O)O
11055	Cc1cc(Cl)c2[nH]c(C(=O)O)c(C(=O)O)c2c1
11056	O=C(O)c1ccc2c(ccc3cc(-c4ccccc4)c(C(=O)O)cc32)c1
11057	O=C(O)[C@@]12[C@@H]3C[C@H]4[C@H]5[C@@H]3[C@@H]3C[C@H]5[C@]5([C@H]6C=C[C@H](C=C6)[C@]315)[C@]42C(=O)O
11058	O=C(O)[C@H]1CCC[C@@H](C(=O)O)[C@@H]2COC[C@H]12
11059	N#Cc1cc(C(=O)O)[nH]c1C(=O)O
11060	C[C@@]12C=C(C(=O)O)[C@](O)(C(=O)O)C[C@@H]1CCCC2
11061	O=C(O)c1oc2ccccc2c1C(=O)O
11062	O=C(O)N1CCN(C(=O)O)c2ccccc2NC(S)=NCCCN=C(S)Nc2ccccc21
11063	O=C(O)N1C=C([C@@H]2CCCCCN2C(=O)O)CCCC1
11064	O=C(O)N1CCC[C@@H]([C@H]2CCCCN2C(=O)O)C1
11065	O=C(O)c1[nH]c(C(=O)O)c2c1CCCC2
11066	C[C@@H]1C[C@H](C(=O)O)CC[C@H]1C(=O)O
11067	Cc1ccc2c(c1)[C@@H](C(=O)O)c1ccccc1[C@@H]2C(=O)O
11068	O=C(O)c1cc2c(cc1C(=O)O)CCC2
11069	O=C(O)c1c(O)cc(O)c2c1C(=O)c1c(O)cc(O)c(C(=O)O)c1C2=O
11070	CCc1c(O)c(C(=O)O)cc(C(=O)O)c1O
11071	O=C(O)/C=C\\c1cc2cccccc-2c1C(=O)O
11072	O=C(O)c1c2c(c(C(=O)O)c3c1-c1cccc4cccc-3c14)-c1cccc3cccc-2c13
11073	O=C(O)c1cc(C(=O)O)c2c(c1Cl)CCCC2
11074	O=C(O)c1cccc(C(=O)O)c1C(=O)Cl
11075	Cc1c2ccc(O)c(C(=O)O)c2c(C)c2ccc(O)c(C(=O)O)c12
11076	CC1=C2C=C(C(=O)O)S[C@]2(C)[C@]2(C)SC(C(=O)O)=CC2=C1C
11077	O=C(O)c1cc2c(s1)/C(=C1\\CCc3cc(C(=O)O)sc31)CC2
11078	O=C(O)c1cc2c(s1)-c1sc(C(=O)O)cc1C2=O
11079	CC(O)=Nc1cc(O)c(C(=O)O)cc1C(=O)O
11080	O=C(O)C=C=CC(=O)O
11081	Cc1c(C(=O)O)n(C(=O)O)c2ccc(Cl)cc12
11082	CC1=C(C(=O)O)[C@@]2(C)[C@@H](OC(=O)O)CC[C@H](C)[C@H]2[C@H]2OC(C)(C)O[C@@H]12
11083	O=C(O)C1=C2NC(Cl)=C(C(=O)O)C(=O)N2CCC1
11084	O=C(O)/C=C/C(=O)C(=O)O
11085	Cc1c(C(=O)O)ccc(O)c1C(=O)O
11086	Cc1cc(C(=O)O)c(C(=O)O)o1
11087	CC1(C)O[C@@H]2[C@@H](C(=O)O)O[C@@H](C(=O)O)[C@@H]2O1
11088	C#CC1C(C(=O)O)=CN(c2cccc(C)c2)C=C1C(=O)O
11089	Cc1c(C(=O)O)c[nH]c1C(=O)O
11090	CN(C)c1nc(Cl)c(C(=O)O)cc1C(=O)O
11091	O=C(O)c1ccccc1-c1cc2sc3ccccc3c2cc1C(=O)O
11092	O=C(O)/C=C/c1cccc2c1-c1c(C(=O)O)cccc1-2
11093	CC(C)c1cc(C(=O)O)c(Cl)c(C(=O)O)c1
11094	CC(=O)Oc1c(C(=O)O)c(C(=O)O)cc2c1C(=O)c1ccccc1C2=O
11095	CCc1cccc2c(C(=O)O)c(C(=O)O)oc12
11096	O=C(O)C12[C@@H]3C=C[C@@H](O3)C1(C(=O)O)[C@H]1C=C[C@@H]2O1
11097	O=C(O)c1nnn(-c2ccc(Br)cc2)c1C(=O)O
11098	O=C(O)[C@H]1C[C@]2(O)c3ccccc3N(C(=O)O)[C@@H]2N1C(=O)O
11099	CC1=CC[C@@H]([C@@H](C)C(=O)O)[C@H]1C(=O)O
11100	O=C(O)N1C=C([C@H]2CCCCCN2C(=O)O)CCC1
11101	Cc1c(C(=O)O)csc1C(=O)O
11102	C=C1C[C@]23C[C@@]1(O)CC[C@H]2C1=CCC[C@](C)(C(=O)O)[C@@H]1[C@@H]3C(=O)O
11103	CCN1c2cccc(C(=O)O)c2Sc2cccc(C(=O)O)c21
11104	CSc1ccc(C(=O)O)cc1C(=O)O
11105	O=C(O)c1ccnc(-c2nccc(C(=O)O)c2O)c1O
11106	O=C(O)N=C1NN(C(=O)O)C2(CCCCC2)S1
11107	O=C(O)c1c[nH]c2ccc3c(ccc4[nH]cc(C(=O)O)c43)c12
11108	O=C(O)c1cc(C(=O)O)c(O)c(C2CCCCC2)c1
11109	C[C@@H]1CCC[C@]2(C)[C@@H](C(=O)O)C(C(=O)O)=CC[C@H]12
11110	COc1c(C(=O)O)c(C(=O)O)c(Cl)n1C
11111	C=Cc1c(C(=O)O)[nH]c(C(=O)O)c1C
11112	O=C(O)c1nc2ccccc2nc1C(=O)O
11113	O=C(O)c1cc(C#Cc2ccccc2)cc(C(=O)O)n1
11114	O=C(O)Nc1ccc(C(=O)O)cc1
11115	CC1(C)CC2=C(C(=O)O)[C@]3(C(=O)O)C[C@]3(C)[C@@H](O)[C@@]2(O)C1
11116	O=C(O)c1ccc2c(c1)Nc1ccc(C(=O)O)cc1S2
11117	Cn1c(=O)n2n(c1=O)C1(C(=O)O)CC2(C(=O)O)C1
11118	C[C@H]1CC[C@H](C(=O)O)[C@H]1C(=O)O
11119	O=C(O)c1cc(C(=O)O)c(Cl)[nH]1
11120	O=C(O)C1=C(C(=O)O)[C@@H]2O[C@H]1C1=C2[C@H]2C=C[C@@H]1CC2
11121	Cc1c2ccc(O)c(C(=O)O)c2cc2ccc(O)c(C(=O)O)c12
11122	O=C(O)[C@H]1c2ccccc2[C@@H](C(=O)O)c2c1cc(F)c1ccccc21
11123	O=C(O)[C@@H](O)[C@@H](O)C(=O)O
11124	C[C@H]1C=C(C(=O)O)C(C(=O)O)=C[C@@H]2CC(C)(C)C[C@@H]12
11125	O=C(O)/C=C\\C=C(\\O)C(=O)O
11126	CC(C)(C)/C(C#CC#C/C(=C\\C(=O)O)C(C)(C)C)=C/C(=O)O
11127	O=C(O)c1c(Cl)c2ccccc2n1C(=O)O
11128	Cc1ccc(-c2ccc(C(=O)O)cc2)cc1C(=O)O
11129	O=C(O)[C@H]1O[C@@H]([C@@H](O)C(=O)O)CS1
11130	O=C(O)c1cccc2c1-c1c(cccc1C(=O)O)/C=C\\C/C=C\\2
11131	O=C(O)/C1=C/NCCC/N=C/C(C(=O)O)=C\\NCCC\\N=C/1
11132	CCc1ccc2oc(C(=O)O)c(C(=O)O)c2c1
11133	Cc1ccc(C)c2c1[C@@H](C(=O)O)c1ccccc1[C@@H]2C(=O)O
11134	O=C(O)c1ccc2c(c1)oc1ccc(C(=O)O)cc12
11135	CCc1cc(C(=O)O)c(C)c(C(=O)O)c1
11136	O=C(O)N=C1CNCC(NC(=O)O)=N1
11137	C[C@H]1C[C@H](O)[C@@H](CC(=O)O)[C@@H]1C(=O)O
11138	C[C@H]1CC[C@]2(C)C(C(=O)O)=CCC[C@H]2[C@]1(C)CC(=O)O
11139	C#CC1C(C(=O)O)=CN(c2ncccn2)C=C1C(=O)O
11140	CC1(C)CCC[C@@]2(C)[C@H]1CC=C(C(=O)O)[C@]2(C)C(=O)O
11141	O=C(O)c1cc(C(=O)O)c(N2CCCCC2)s1
11142	Cc1sc(C(=O)O)cc1C(=O)O
11143	O=C(O)[C@@H]1[C@@H](C(=O)O)C12c1ccccc1-c1ccccc12
11144	O=C(O)/C1=C(\\Cl)CCC/C(Cl)=C(/C(=O)O)C1
11145	O=C(O)c1c(Br)sc(Br)c1C(=O)O
11146	CN1CCCc2cc(C(=O)O)cc(C(=O)O)c21
11147	C=C(C(=O)O)[C@@H]1C/C=C(/C)CC/C=C(/C(=O)O)CC1
11148	CC(C)(C)c1ccc(C(=O)O)c(C(=O)O)c1
11149	O=C(O)[C@@H]1[C@H](C(=O)O)C[C@H]2[C@H]3OO[C@H](O3)[C@@H]12
11150	O=C(O)[C@H]1C[C@@H]1C(=O)O
11151	O=C(O)c1ncc(CO)c(C(=O)O)c1O
11152	O=C(O)N1C=C([C@@H]2c3ccccc3CCN2C(=O)O)CCCC1
11153	O=C(O)C[C@H]1CCC[C@H]1C(=O)O
11154	O=C(O)[C@@]1(Cl)[C@H]2CC=CC[C@@H]2[C@](Cl)(C(=O)O)[C@@H]2CC=CC[C@@H]21
11155	CC1=C(C)C[C@@H](C(=O)O)[C@@H](C(=O)O)C1
11156	O=C(O)c1[nH]c2ccc(Cl)cc2c1C(=O)O
11157	CC1(C)OCc2c(C(=O)O)cnc(C(=O)O)c2O1
11158	C[C@@H]1CC[C@@H](C(=O)O)[C@@H]1CC(=O)O
11159	O=C(O)c1nc2cc(Cl)c(Cl)cc2nc1C(=O)O
11160	O=C(O)C[C@@H]1CCc2cccc(C(=O)O)c21
11161	CC1(C)C(C(=O)O)=C(Cl)NC(Cl)=C1C(=O)O
11162	CC1(C)CC[C@H](O)[C@@]2(C)[C@H](C(=O)O)C(C(=O)O)=CC[C@@H]12
11163	O=C(O)c1cnc2c(C(=O)O)sc3cc(-c4ccccc4)nc1-n-3-2
11164	O=C(O)c1c(O)cc2c(c1O)C(=O)c1cc(O)c(C(=O)O)c(O)c1C2=O
11165	C[C@H]1C(=O)O[C@H]2/C=C(/C(=O)O)CC/C=C(/C(=O)O)CC[C@@H]21
11166	O=C(O)[C@H]1CCC[C@H](C(=O)O)CCC1
11167	COc1c(C)c(O)c(C(=O)O)c(C(=O)O)c1O
11168	O=C(O)C1=CNC(Cl)=C(C(=O)O)C1
11169	O=C(O)c1cc(C(=O)O)c(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)s1
11170	C#CC1C(C(=O)O)=CN(CC)C=C1C(=O)O
11171	C[C@@]1(C(=O)O)[C@]2(O)CC[C@](C)(CC(=O)O)[C@@]1(C)CC2
11172	O=C(O)c1[nH]c(C(=O)O)c(Br)c1Br
11173	N#CC1=C(c2ccc(Cl)cc2)[C@H](C(=O)O)S/C1=C\\C(=O)O
11174	O=C(O)c1cnc2ncc(C(=O)O)cc2c1
11175	CN(C(=O)O)c1ccccc1C(=O)O
11176	O=C(O)c1cccc2c1Oc1cccc(C(=O)O)c1O2
11177	C/C(=C\\C=C(/C)C(=O)O)C(=O)O
11178	O=C(O)c1nnc2ccccc2c1C(=O)O
11179	O=C(O)O[C@@H]1Cc2ccccc2N(C(=O)O)C1
11180	O=C(O)c1c(Cl)sc(Cl)c1C(=O)O
11181	CC(=O)O[C@@H]1CC[C@H]2C[C@@]2(C(=O)O)[C@@H]1C(=O)O
11182	COC(=O)C1=C(C)C[C@@H]2[C@H]1C=C(C(=O)O)[C@@]1(C(=O)O)C[C@@]21C
11183	Cc1cc(C(=O)O)c(S(=O)(=O)C(C)(C)C)c(C(=O)O)c1
11184	Cc1cc(N(C)C)c(C(=O)O)c(C)c1C(=O)O
11185	O=C(O)C/C=C1\\C=CC=C1C(=O)O
11186	O=C(O)C1=C(C(=O)O)[C@@H]2C=C[C@H]1c1cc3ccccc3cc12
11187	CC(C)(C)N1CN(C(=O)O)CN(C(=O)O)C1
11188	O=C(O)C1=Cc2ccccc2N(C(=O)O)c2ccccc21
11189	CCn1c(Cl)c(C(=O)O)c2cccc(C(=O)O)c21
11190	O=C(O)c1cscc1-c1ccsc1C(=O)O
11191	Cc1ccc2c(ccc3c(C(=O)O)c(C)c(C(=O)O)n32)c1
11192	O=C(O)c1ccc2nc3ccccc3c(C(=O)O)c2c1
11193	O=C(O)C1=C2c3cc4c(cc3CCN2[C@@H]2O[C@H]1N1CCc3cc5c(cc3C1=C2C(=O)O)OCO5)OCO4
11194	O=C(O)[C@H]1CCC[C@H]1[C@@H]1CCC[C@@H]1C(=O)O
11195	Cc1cc(-c2cc(C)sc2C(=O)O)c(C(=O)O)s1
11196	CC[C@]12CCCn3c(C(=O)O)c(C(=O)O)c(c31)-c1ccccc1N=C(O)CC2
11197	Cc1cc2c(cc1C(=O)O)[C@H]1c3ccccc3[C@@H]2c2ccc(C(=O)O)cc21
11198	O=C(O)c1ccn(-n2cccc2C(=O)O)c1
11199	CN1[C@H](C(=O)O)C=C[C@H]1C(=O)O
11200	O=C(O)C1=CC[C@H](C(=O)O)CC1
11201	O=C(O)N1CCN(C(=O)O)[C@H](c2ccccc2)c2ccccc2C1
11202	CC(=O)O[C@@H]1[C@@H](C(=O)O)[C@@]2(C(=O)O)C[C@@]2(C)[C@H]2CC(C)(C)C[C@@H]12
11203	CCOC(=O)N1C[C@H](C(=O)O)CC[C@H]1C(=O)O
11204	C=C1[C@@H](C)CC[C@@]2(C)[C@@H]1CC=C(C(=O)O)[C@@]2(O)C(=O)O
11205	Cc1[nH]c2c(c1C(=O)O)C(Cl)=C(C(=O)O)CC2
11206	O=C(O)C1=CC(C(=O)O)=C(C2C=CC=CC=C2)/C1=C\\O
11207	Cc1cc(C)c2cc(C(=O)O)c(C(=O)O)c-2c(C)c1
11208	Cc1c(C(=O)O)n(C(=O)O)c2c(Cl)cc(Cl)cc12
11209	O=C(O)/C=C/c1cccc(C(=O)O)c1
11210	O=C(O)c1sc(C(=O)O)c2c1Nc1ccccc1N2
11211	C[C@@H](/C=C/C#C[C@@H](C)C(=O)O)C(=O)O
11212	O=C(O)c1cnc2c(C(=O)O)sc3cccc1-n-3-2
11213	Cc1cccc2oc(C(=O)O)c(C(=O)O)c12
11214	O=C(O)Nc1cc2ccccc2nc1C(=O)O
11215	CN1C[C@@H](C(=O)O)[C@H](OC(=O)O)[C@@H]2c3ccccc3CC[C@@H]21
11216	O=C(O)c1ccc(N2CCN(C(=O)O)CC2)cc1Cl
11217	Cc1cc(C(C)(C)C)cc(C)c2c(C(=O)O)c(C(=O)O)cc1-2
11218	O=C(O)C1=C(C(=O)O)/C=C\\C=C/C=C1
11219	C=C(C(=O)O)[C@@H]1C[C@@H](O)C(C)=C1C(=O)O
11220	O=C(O)/C1=C/Nc2ccccc2N=C/C(C(=O)O)=C\\Nc2ccccc2N=C1
11221	COc1c(C(=O)O)cc(C(=O)O)c(O)c1C
11222	CC(C)(/C=C\\C(=O)O)C(=O)O
11223	CC1=C(C(=O)O)C(=O)N2C(=C(C(=O)O)CC[C@H]2C)N1
11224	O=C(O)c1c(O)nc2c(ccc3c(O)c(C(=O)O)c(O)nc32)c1O
11225	O=C(O)c1cc(C(=O)O)c2ccc3cccc4ccc1n4-n32
11226	O=C(O)c1c2ccccc2c(C(=O)O)c2cc(F)ccc12
11227	Cc1cc(-c2cc(C)c(C(=O)O)s2)sc1C(=O)O
11228	COC(C#CC(=O)O)(C#CC(=O)O)c1ccc(C(C)(C)C)cc1
11229	CC1(C)C2C3C(C)(C)C4(O)C(=O)C3(C(=O)O)C4(Cl)C3(Cl)C(=O)C1(O)C23C(=O)O
11230	O=C(O)c1cc(C(=O)O)cc([C@@H]2O/C=C\\c3occc3O/C=C\\c3occc3O2)c1
11231	C[C@@]12CC[C@@H]3[C@@H](CC[C@]4(/C=C/C(=O)O)CC(=O)CC[C@]34C)[C@@H]1CC[C@H]2C(=O)O
11232	O=C(O)c1ccc2c(c1)CC[C@H]1CCc3cc(C(=O)O)ccc3[C@H]21
11233	O=C(O)c1c[nH]c2ccc3[nH]cc(C(=O)O)c3c12
11234	C[C@H]1CCC[C@](C)(C(=O)O)[C@@H]1C(=O)O
11235	O=C(O)c1ccc(C(=O)O)n1[C@@H]1CCOC1=O
11236	O=C(O)c1cc(C(=O)O)c(Br)cc1O
11237	COc1cc2c(cc1C(=O)O)C(Cl)=C(C(=O)O)C(C)(C)O2
11238	O=C(O)c1cc2cccc3cccc(cc1C(=O)O)c32
11239	Cn1ncc(C(=O)O)c1NC(=O)O
11240	C[C@]1(O)C[C@]23CC[C@H]4[C@](C)(C(=O)O)CCC[C@@]4(C(=O)O)[C@@H]2CC[C@H]1C3
11241	C[C@@H]1CC[C@H]([C@@H](C)C(=O)O)[C@@H]1C(=O)O
11242	C[C@H]1CN(C(=O)O)CCN1C(=O)O
11243	C[C@]12CCC[C@H](C(=O)O)[C@H]1N(C(=O)O)c1ccccc12
11244	O=C(O)c1c2cccccc2n2c(C(=O)O)c(-c3ccccc3)nc12
11245	CC[C@@]1(C(=O)O)CC=C(C(=O)O)CC1
11246	O=C(O)N/C(=C/O)C(=O)O
11247	O=C(O)/C=C/[C@H]1C=CC=C1C(=O)O
11248	O=C(O)c1cc(-c2cc(C(=O)O)on2)no1
11249	O=C(O)c1c2c(c(C(=O)O)c3ccccc13)-c1cccc3cccc-2c13
11250	CC1(C)C=C[C@@H](O)[C@]2(C)[C@H](C(=O)O)C(C(=O)O)=CC[C@@H]12
11251	C/C(=C\\CC(=O)O)C(=O)O
11252	CC(C)(C)S(=O)(=O)c1c(C(=O)O)cccc1C(=O)O
11253	O=C(O)c1ccc(-c2ccc(C(=O)O)s2)[nH]1
11254	CC1(C)CCC[C@]2(C)[C@@H]3CC=C(C(=O)O)[C@H](C(=O)O)[C@@]3(C)CC[C@H]12
11255	CC(C)(C#C/C=C/C#CC(C)(C)C(=O)O)C(=O)O
11256	O=C(O)c1ccc2c(ccc3nc(C(=O)O)ccc32)n1
11257	CCn1c(C(=O)O)ccc1C(=O)O
11258	C[C@H]1CC[C@H]2C(C)(C)[C@@H](O)[C@@H](O)C[C@@]2(C)[C@@]12Cc1c(O)cc(C(=O)O)c(C(=O)O)c1O2
11259	O=C(O)c1cccc(C(=O)O)c1S
11260	O=C(O)c1c2ccccc2c(-c2c3ccccc3c(C(=O)O)c3ccccc23)c2ccccc12
11261	CC1=CC(=O)[C@]23CCC[C@]12[C@H](C(=O)O)C[C@]3(C)C(=O)O
11262	O=C(O)c1ccsc1C(=O)O
11263	O=C(O)c1cnc2c(C(=O)O)sc3cc(-c4ccccc4)cc1-n-3-2
11264	O=C(O)[C@H]1[C@H]2CC3=C(C[C@@H]21)C[C@@H]1[C@H](C3)[C@H]1C(=O)O
11265	O=C(O)C1(C#CC2(C(=O)O)CC2)CC1
11266	C[C@@]1(CC(=O)O)CCCC[C@]1(C)C(=O)O
11267	O=C(O)c1ccnc(C(=O)O)c1
11268	O=C(O)N1CCCCCCCCCCCCN(C(=O)O)c2c(O)c(Cl)c1c(O)c2Cl
11269	O=C(O)c1cc(C(=O)O)c(O)c(Br)c1O
11270	O=C(O)c1ccccc1C(=O)N1CCC[C@@H]1C(=O)O
11271	O=C(O)/C=C/c1ccc(C(=O)O)s1
11272	O=C(O)c1c(C(=O)O)c2ccccc2c2ccccc12
11273	Cc1cc2ccccn2c2c(C(=O)O)cc(C(=O)O)c1-2
11274	O=C(O)C1=CNC=C(C(=O)O)C1c1ccccc1F
11275	O=C(O)[C@H]1[C@@H]2CC[C@@H](c3ccccc32)[C@@H]1C(=O)O
11276	O=C(O)[C@H]1CC/C=C\\CC/C=C\\CC[C@H]1C(=O)O
11277	O=C(O)[C@@H]1C(c2ccccc2)[C@H]1C(=O)O
11278	C[C@H]1C=C(C(=O)O)[C@H](C(=O)O)[C@@H](O)[C@@H]2CC(C)(C)C[C@@H]12
11279	O=C(O)C1=C/C=C2/C=C\\C(=C1C(=O)O)CCc1ccc(cc1)CC2
11280	C[C@]1(O)CC[C@H]2[C@@H](C(=O)O)[C@H]([C@]3(C)C=CC(=O)C=C3C(=O)O)CC[C@@]21C
11281	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@@H]2CCC[C@H]12
11282	O=C(O)c1oc(CCl)c(C(=O)O)c(=O)c1O
11283	CC1=C(C(=O)O)C(C)(C)[C@@H](C(=O)O)CC1
11284	C/C=C1/CN(C(=O)O)[C@H]2C[C@@H]1[C@H](C(=O)OC)[C@]13CC(=O)O[C@]21N(C(=O)O)c1ccccc13
11285	Cc1cc2cc(C(=O)O)c1CCc1c(C)cc(cc1C(=O)O)CC2
11286	CC(=O)SC1CN(C(=O)O)N(C(=O)O)C1
11287	CC1(C)CCC[C@](C)([C@H]2[C@@H]3C[C@@H]4C[C@@]2(C(=O)O)C[C@]4(C)O3)[C@@H]1C(=O)O
11288	Cc1cc(C)c(C(=O)O)c(-c2cc(C)cc(C)c2C(=O)O)c1
11289	C/C(C#CC#C/C(C)=C(/C)C(=O)O)=C(\\C)C(=O)O
11290	CC1(C)CCC[C@@]2(C)[C@H]1[C@@H](O)C=C(C(=O)O)[C@]2(O)C(=O)O
11291	O=C(O)c1cc2cc3cc(C(=O)O)sc3cc2s1
11292	COC(=O)[C@@]1(C)CC[C@@H]2[C@@](C(=O)O)(CC[C@H]3[C@@](C)(C(=O)O)CCC[C@@]23C)C1
11293	O=C(O)N1CCC[C@H]1[C@H]1c2[nH]c3ccc(Br)cc3c2CCN1C(=O)O
11294	CC1=C(C(=O)O)C(C)(C)CC[C@@H]1C(=O)O
11295	Cc1ccc(C(=O)O)c(C)c1C(=O)O
11296	C/C=c1/c2c(/c(=C\\C)c3c1[C@H](C)C[C@H](C(=O)O)[C@@H]3C)[C@H](C)[C@H](C(=O)O)C[C@@H]2C
11297	CC(=O)Oc1c(Br)c(Br)c(C(=O)O)c(C(=O)O)c1Br
11298	CN1C=C(C(=O)O)[C@@H]2C[C@H]1C(C(=O)O)=CN2C
11299	C/C(=C/c1ccc(C(=O)O)o1)C(=O)O
11300	O=C(O)c1cc(C(=O)O)c2ccc(O)nc2n1
11301	C[C@]12CCC(=O)C=C1CC[C@@H]1[C@H]2[C@@H](O)C[C@]2(C(=O)O)[C@H](C(=O)C(=O)O)CC[C@H]12
11302	O=C(O)N1CCN(C(=O)O)c2ccccc2NC(S)=NCCN=C(S)Nc2ccccc21
11303	O=C(O)c1c2c(cc3c1CC1(C3)Cc3cc4c(c(C(=O)O)c3C1)CCC4)CCC2
11304	Cc1c2cc(C(=O)O)c(c1C)CCc1c(C(=O)O)cc(c(C)c1C)CC2
11305	CC(C)(C)c1ccc2c(C(=O)O)c3ccccc3c(C(=O)O)c2c1
11306	CC(C)(C)S(=O)(=O)c1cc(C(=O)O)sc1C(=O)O
11307	O=C(O)C1=Cc2ccccc2C=C(C(=O)O)O1
11308	O=C(O)c1ccc(C(=O)O)c2c1C(=O)c1ccccc1-2
11309	O=C(O)N1CCOCCN(C(=O)O)c2ccccc2NCCOCCNc2ccccc21
11310	O=C(O)[C@@]12CCCC[C@@]1(C(=O)O)C2
11311	Cc1cc2c(cc1C)[C@H](C(=O)O)c1ccccc1[C@@H]2C(=O)O
11312	O=C(O)c1ccc2nc(C(=O)O)cn2c1
11313	O=C(O)C1=CC=CC=C(C2=CC=CC=C(C(=O)O)C2)C1
11314	C/C=c1/c2c(c3c(/c1=C\\C)[C@@H](C)C[C@H](C(=O)O)[C@H]3C)[C@H](C)[C@@H](C(=O)O)C[C@H]2C
11315	O=C(O)c1nc2c(C(=O)O)nn(-c3ccccc3)c2o1
11316	O=C(O)c1ccc2c(c1)[nH]c1cc(C(=O)O)ccc12
11317	COc1cc(C(=O)O)c2c(c1C)OC(=O)c1c(C)c(Cl)c(O)c(C(=O)O)c1O2
11318	COc1ccc2c(c1C(=O)O)Oc1ccc(O)c(C(=O)O)c1O2
11319	CC(C)/C(=C/C(=O)O)C(=O)O
11320	O=C(O)C1=C(C(=O)O)[C@H]2c3ccccc3[C@@H]1c1ccccc12
11321	O=C(O)O[C@@H]1[C@H]2CC[C@H](O)[C@H]2[C@H]1C(=O)O
11322	O=C(O)c1cc(C(F)(C(F)(F)F)C(F)(F)F)cc(C(=O)O)c1O
11323	Cc1cc(N(C)C)c(C(=O)O)cc1C(=O)O
11324	O=C(O)[C@H]1[C@H]2CC=CC[C@H]2[C@@H](C(=O)O)[C@@H]2CC=CC[C@H]12
11325	O=C(O)C1C2C3CC4C2C(C(=O)O)C2C5CC(C12)C1C3C4C51
11326	O=C(O)[C@H]1OC2(CCCCC2)O[C@@H]1[C@H]1OC2(CCCCC2)O[C@@H]1C(=O)O
11327	CS[C@@]1(C(=O)O)C[C@@H]1C(=O)O
11328	CC1(C)C=C(c2ccc(C(=O)O)s2)CC(C)(C)N1C(=O)O
11329	Cc1c(C(=O)O)c2sccn2c1C(=O)O
11330	O=C(O)/C=C/C1=CC2=CC=CC=C3C=C(C(=O)O)[C@H]1C[C@H]23
11331	O=C(O)[C@]12CC=CC[C@@]1(C(=O)O)C2
11332	CC1(C)CC2(CC(C)(C)c3cc(C(=O)O)ccc32)c2ccc(C(=O)O)cc21
11333	O=C(O)C1=C(Cl)c2cc3c(cc2CC1)CCc1cc2c(cc1-3)C(Cl)=C(C(=O)O)CC2
11334	CN1C(Cl)=C(C(=O)O)C(C)(C)C(C(=O)O)=C1Cl
11335	C[C@H](C(=O)O)[C@@H]1O[C@H](C(=O)O)[C@H]2OC(C)(C)O[C@@H]12
11336	O=C(O)[C@H]1C[C@H](c2ccccc2)[C@H](C(=O)O)[C@]23OCCO[C@]12OCCO3
11337	O=C(O)[C@H]1C[C@@H]([C@H]2CCC(=O)[C@@H](C(=O)O)C2)CCC1=O
11338	O=C(O)c1ccc2ccc3ccc4ccc5ccc6ccc(C(=O)O)cc6c5c4c3c2c1
11339	O=C(O)C1=C(C(=O)O)[C@H]2C=C[C@@H]1C2
11340	Cc1sc(C)c2cc(C(=O)O)c(C(=O)O)cc12
11341	O=C(O)C1=C[C@H]2[C@H]3C=C[C@@H]1C(C(=O)O)=C[C@@H]23
11342	O=C(O)[C@@H]1C[C@H]1[C@@H]1C[C@H]1C(=O)O
11343	O=C(O)C12CCCC(C(=O)O)(C1)C2
11344	O=C(O)C1=C(C2=C(C(=O)O)CCCCC2)CCCCC1
11345	CCn1c(C)c(C(=O)O)c(C(=O)O)c1C
11346	O=C(O)C1=C(C(=O)O)[C@@H]2C=C[C@@H]3[C@H]1[C@@H]3C=C2
11347	O=C(O)c1c(Cl)nc(Cl)c(C(=O)O)c1-c1cccc(C(F)(F)F)c1
11348	O=C(O)c1ccccc1-c1cc2c(ccc3ccccc32)cc1C(=O)O
11349	CC1(C)C/C=C(/C(=O)O)CC/C=C(/C(=O)O)C[C@@H]2O[C@@H]21
11350	CC(O)=Nc1sc(C(=O)O)cc1C(=O)O
11351	C[C@]12CCC[C@@](C)(C(=O)O)[C@@H]1CC[C@@]1(C(=O)O)OC(=O)CC[C@H]21
11352	C[C@@]12OO[C@@H](O1)[C@@H]1C[C@H](C(=O)O)[C@@H](C(=O)O)[C@@H]12
11353	Cc1cc2c(ccc3sc(C(=O)O)c(-c4c(C(=O)O)sc5ccc6sc(C)cc6c45)c32)s1
11354	O=C(O)/N=c1/c2ccccc2c2nc3c(nc12)/c(=N\\C(=O)O)c1ccccc13
11355	O=C(O)c1sc(-c2cc(C#Cc3ccccc3)c(C(=O)O)s2)cc1C#Cc1ccccc1
11356	O=C(O)c1cn(-c2ccccc2)cc1C(=O)O
11357	O=C(O)c1c(O)cc(Cl)c(C(=O)O)c1O
11358	COc1c(C)c2c(c(C(=O)O)c1Cl)Oc1c(c(C)c(Cl)c(O)c1C(=O)O)C(=O)O2
11359	Cc1[nH]c2c(c1C(=O)O)Sc1[nH]c(C)c(C(=O)O)c1S2
11360	O=C(O)C(=C\\O)/C(=C/O)C(=O)O
11361	O=C(O)c1cc2ccccc2c2c1OCOc1c(C(=O)O)cc3ccccc3c1-2
11362	C#CC1C(C(=O)O)=CN(c2ccc(C)cc2)C=C1C(=O)O
11363	Cc1c(C(=O)O)cc(C(=O)O)n1C
11364	C#CC1C(C(=O)O)=CN(c2ccccc2C)C=C1C(=O)O
11365	CN(C)c1cc(Cl)c(C(=O)O)cc1C(=O)O
11366	O=C(O)c1cccc2c1[C@H]1c3ccccc3[C@@H]2c2c(C(=O)O)cccc21
11367	O=C(O)c1ccncc1C(=O)O
11368	O=C(O)c1ccc2ccc3ccc4ccc5ccc6ccc(C(=O)O)c7c6c5c4c3c2c1-7
11369	O=C(O)N=C(O)c1ccc2c(c1C(=O)O)Oc1ccccc1O2
11370	C#CC1C(C(=O)O)=CN(c2cc(C)cc(C)c2)C=C1C(=O)O
11371	CN1C=CC(=C2C=C(C(=O)O)S(=O)(=O)C(C(=O)O)=C2c2ccccc2)C=C1
11372	O=C(O)C1=CCC=C1C(=O)O
11373	O=C(O)c1c2c(cc3c1CC1(C3)Cc3cc4c(c(C(=O)O)c3C1)CCCC4)CCCC2
11374	Cc1c(C(=O)O)ccc2c(C(=O)O)cccc12
11375	CC1=C(C(=O)O)[C@H]2[C@H](C(C)C)CC[C@]1(C)[C@H]2C(=O)O
11376	Cc1ccc(C)c2cc(C(=O)O)c(C(=O)O)cc12
11377	O=C(O)[C@H]1c2ccccc2[C@@H](C(=O)O)c2cc(Cl)ccc21
11378	O=C(O)C1=CC=C[C@@H]1C(=O)O
11379	O=C(O)C1=CC[C@H]2C(Cl)=C(C(=O)O)C[C@@H]12
11380	O=C(O)[C@H]1[C@@H](C2(C(=O)O)CC2)[C@H]2C=C[C@@H]1C21CC1
11381	O=C(O)c1c2ccccc2cc2c(C(=O)O)c3ccccc3cc12
11382	CC1(C)C[C@H]2C=C(C(=O)O)[C@@]3(C(=O)O)C[C@@]3(C)[C@@H]2C1
11383	O=C(O)[C@H]1c2ccccc2[C@H](C(=O)O)c2cc3ccccc3cc21
11384	O=C(O)[C@H]1C[C@@H](C(=O)O)C1
11385	O=C(O)C1=C(C(=O)O)c2cc(Cl)ccc2Cc2ccccc21
11386	O=C(O)c1cc2c(c(C(=O)O)c1)CCCCC2
11387	O=C(O)C1=C/C(=C/O)C(Cl)=C(C(=O)O)C1
11388	Cc1c(-c2csc(C(=O)O)c2C)csc1C(=O)O
11389	C[C@]1(O)c2ccoc2[C@H](O)[C@](C)([C@@]2(O)CCCC[C@@H]2C(=O)O)[C@H]1C(=O)O
11390	C#CC1C(C(=O)O)=CN(C(=O)c2ccccc2)C=C1C(=O)O
11391	O=C(O)c1cnc2c(C(=O)O)sc3nc(-c4ccccc4)cc1-n-3-2
11392	CC(=O)O[C@H]1C[C@@H](C)[C@H](C(=O)O)[C@]2(O)[C@@H]1C(C)(C)C[C@]2(C)C(=O)O
11393	CC(C)(C)c1cc(C(=O)O)c(C(=O)O)o1
11394	O=C(O)/C=C/[C@H](Br)C(=O)O
11395	O=C(O)OC(=O)OC(=O)O
11396	O=C(O)c1cccc2c1-c1cccc(C(=O)O)c1-2
11397	O=C(O)[C@]12CCC[C@@]1(C(=O)O)C2
11398	CSc1cc(C(=O)O)cc(C(=O)O)c1
11399	C/C(C#C/C(C)=C/C(=O)O)=C/C(=O)O
11400	O=C(O)C1=C(C(=O)O)[C@H]2C=C[C@@H]1CC2
11401	O=C(O)c1ccc(O)c(C(=O)O)c1I
11402	O=C(O)C[C@@]12CCCN3CC[C@H]4c5ccccc5N(C(=O)O)[C@]4(CC1)[C@H]32
11403	C[C@@]12CCCC(C(=O)O)=C1N(C(=O)O)c1ccccc12
11404	O=C(O)[C@]12C=C[C@](C(=O)O)(OO1)O2
11405	O=C(O)C1=CC2=CC3=CC4=CC=CC=C(C=C(C=C(C=C(C(=O)O)C1)C2)C3)C4
11406	CC(=O)n1cc(C(=O)O)c2c3[nH]cc(C(=O)O)c3ccc21
11407	O=C(O)C(=O)[C@H]1CC2(C[C@@H]1C(=O)O)OCCO2
11408	O=C(O)Nc1cc2c(cc1C(=O)O)OCO2
11409	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@H]2C=CC[C@@H]12
11410	Cc1ccc(-c2cc(C(=O)O)cc(C(=O)O)c2)cc1
11411	O=C(O)C[C@@H]1[C@H](C(=O)O)[C@@H](O)C[C@H]1O
11412	Cc1cc(Br)c2c(c1)c(C)c(C(=O)O)n2C(=O)O
11413	C=C(C(=O)O)[C@@H]1CC[C@H](C)[C@H]1C(=O)O
11414	CC(C)(C(=O)O)[C@H]1C[C@H](C(=O)O)c2ccccc21
11415	O=C(O)N1C=C([C@@H]2CCCN2C(=O)O)CCC1
11416	O=C(O)N1c2ccccc2N(C(=O)O)c2nc3ccccc3nc21
11417	O=C(O)C1=NNc2c(C(=O)O)nn(-c3ccccc3)c2O1
11418	O=C(O)C1=C(C2=C(C(=O)O)CCC2)CCC1
11419	O=C(O)/C=C\\c1c(Br)cc(Br)c(O)c1C(=O)O
11420	C#C[C@@]1(OC(=O)O)CC[C@H]2[C@@H]3CC[C@H]4Cc5oc(C(=O)O)cc5C[C@@]4(C)[C@H]3CC[C@@]21C
11421	O=C(O)c1c(-c2ccc(Cl)cc2)c(C(=O)O)n2c1sc1ccccc12
11422	CC[C@@]1(C(=O)O)CCCN2CCc3c(n(C(=O)O)c4ccccc34)[C@@H]21
11423	C#CC1C(C(=O)O)=CN(C(C)=O)C=C1C(=O)O
11424	O=C(O)c1ccc2cccc(C(=O)O)c2c1O
11425	O=C(O)c1coc(-c2ccc3c(c2)OCO3)c1C(=O)O
11426	CC1(C)C[C@@H]2C=C(C(=O)O)[C@]3(C(=O)O)C[C@]3(C(=O)OC(C)(C)C)[C@@H]2C1
11427	C/C=C1\\CN(C(=O)O)[C@@H]2C[C@H]1[C@@H](C(=O)OC)[C@@]13C[C@H](O)O[C@@]21N(C(=O)O)c1ccccc13
11428	O=C(O)c1ccc(C(F)(F)F)cc1-c1cc(C(F)(F)F)ccc1C(=O)O
11429	CC/C(=C\\C(=O)O)C(=O)O
11430	O=C(O)c1nc(-c2csc(C(=O)O)n2)cs1
11431	CC1=C(C(=O)O)[C@](C)(C(=O)O)CCC1
11432	Cc1c(C(=O)O)cc(C(=O)O)c(O)c1C
11433	C[C@@H]1CC[C@@H](CC(=O)O)[C@H]1C(=O)O
11434	O=C(O)C1=CO[C@@H]2O[C@H]1OC=C2C(=O)O
11435	Cc1ccc(C)c2c1C[C@H](OC(=O)O)[C@H]1[C@@H]2[C@@]2(O)OC[C@]1(C(=O)O)[C@@H](C)[C@@H]2O
11436	CC1=C(C(=O)O)C=C(C(=O)O)/C1=C\\O
11437	O=C(O)c1cccc2c1Oc1c(cccc1C(=O)O)N2
11438	CCc1cc(C(=O)O)cc(C(=O)O)c1
11439	O=C(O)/C=C(/C(=O)O)c1cccs1
11440	C[C@@H]1CCC[C@](C)(C(=O)O)CCC2=C1[C@@](C)(CC(=O)O)CC2(C)C
11441	CC(C)(C(=O)O)[C@H]1CCC[C@H]1C(=O)O
11442	C#CC1C(C(=O)O)=CN(C)C=C1C(=O)O
11443	O=C(O)c1c[nH]nc1C(=O)O
11872	CCc1ccccc1N1C(C=O)=NC(C=O)=NC1(C)C
11444	CN1c2ccccc2C(C(=O)O)=C(N2CCN(C(=O)O)CC2)c2sccc21
11445	CC(=O)O[C@H]1CC[C@]2(C)C[C@]2(C(=O)O)[C@@H]1C(=O)O
11446	Cc1cccc2c(C(=O)O)c(C(=O)O)oc12
11447	Cc1cc2c(cc1C)Nc1c(C(=O)O)sc(C(=O)O)c1N2
11448	O=C(O)/C=C/[C@@H](I)C(=O)O
11449	Cc1cc(-c2cc(C)c(C(=O)O)[nH]2)[nH]c1C(=O)O
11450	CCC1=C(C(=O)O)[C@H](C(=O)O)[C@H](O)CC1
11451	CC(C)(C)C(=O)c1cc(C(=O)O)[nH]c1C(=O)O
11452	N#Cc1ccc2c(C(=O)O)cnc3c(C(=O)O)sc1-n-2-3
11453	CC1(C)C(=O)[C@H](C(=O)O)[C@@H](C(=O)O)C1=O
11454	O=C(O)c1cc(Br)c(-c2oc(C(=O)O)cc2Br)o1
11455	O=C(O)N1CCN(C(=O)O)c2ccccc21
11456	O=C(O)c1c2ccccc2c(C(=O)O)c2c(F)cccc12
11457	CC(=O)O[C@H]1[C@]2(O)CC(C)(C)CC2=C(C(=O)O)[C@@]2(C(=O)O)C[C@@]12C
11458	CC1(C)O[C@@H](C(=O)O)[C@@H]2[C@H](C(=O)C(=O)O)C(=O)c3ccccc3[C@]2(C)O1
11459	O=C(O)c1c2ccccc2c(C(=O)O)c2ncccc12
11460	O=C(O)[C@]12CCCC[C@@]1(C(=O)O)CC2
11461	CC(=O)[C@H]1C(C)(C)C[C@]2(C)C[C@H](C(=O)O)C[C@]12C(=O)O
11462	O=C(O)[C@H]1[C@@H]2CC[C@@H](C2)[C@H]1C(=O)O
11463	O=C(O)c1ccc(-c2ccc(C(=O)O)cc2Cl)cc1
11464	CN1C=C(C(=O)O)C=C[C@@H]1c1c(C(=O)O)[nH]c2ccccc12
11465	CC1=C(C(=O)O)C(C)(C)[C@@]2(CC1)OC(C)(C)O[C@@H]2[C@@H]1CCCC[C@@H]1C(=O)O
11466	Cn1cc(C(=O)O)c2nc3c(C(=O)O)cnc(O)c3c(-c3ccccc3)c2c1=O
11467	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@H](C(=O)O)[C@H]3C)[C@H](C)C[C@@H](C(=O)O)[C@@H]2C
11468	C#CC1C(C(=O)O)=CN(C(C)(C)C)C=C1C(=O)O
11469	O=C(O)[C@@H]1c2ccccc2[C@@H](C(=O)O)c2c(Cl)cccc21
11470	C[C@H]1[C@H](O)C[C@@H]2C(C)(C)[C@@H](O)CC[C@@]2(C)[C@@]12Cc1c(O)cc(C(=O)O)c(C(=O)O)c1O2
11471	COc1cc(C(=O)O)c(C(=O)O)c2c1C[C@]1(O2)[C@@H](C)CC[C@H]2C(C)(C)C=CC[C@]21C
11472	C#CC1C(C(=O)O)=CN(c2nc(C)cc(C)n2)C=C1C(=O)O
11473	Cc1c2ccc3ccc4c(C(=O)O)cc(ccc5cc(C(=O)O)c(cc2)c1c5C)c(C)c4c3C
11474	O=C(O)c1c[nH]c(-c2nc(C(=O)O)c[nH]2)n1
11475	CC(=O)O[C@@H]1C=C(C(=O)O)[C@@](O)(C(=O)O)[C@]2(C)CCCC(C)(C)[C@@H]12
11476	O=C(O)c1ccc2cc1CCc1ccc(C(=O)O)c(c1)CC2
11477	O=C(O)C[C@H]1O[C@@H](C(=O)O)C[C@H](O)[C@H]1O
11478	O=C(O)c1ccc(Cl)cc1-c1cc(Cl)ccc1C(=O)O
11479	O=C(O)O[C@@H]1Oc2ccccc2C(=O)N1C(=O)O
11480	Cc1c(C(=O)O)c(-c2ccccc2C(=O)O)cc2ccccc12
11481	COc1c(C(=O)O)sc2c(C(=O)O)c3cccccc-3c12
11482	O=C(O)[C@H]1C[C@H](C(=O)O)c2c1ccc1cc[nH]c21
11483	COc1cc(O)c(C(=O)O)c(O)c1C(=O)O
11484	Cn1cc(C(=O)O)c2nc3c(C(=O)O)cn(C)c(=O)c3c(-c3ccccc3)c2c1=O
11485	Cc1cc(C)cc2c(C(=O)O)cc(C(=O)O)c-2c1
11486	O=C(O)N1Cc2ccccc2CN(C(=O)O)c2cc(Cl)ccc21
11487	CC(=O)O[C@@H]1[C@@H]2C=C(C(=O)O)C3(C(=O)O)C[C@@]3(C)[C@@H]2CC1(C)C
11488	CC(C)(C)N(/C=C/C(=O)O)C(=O)O
11489	O=C(O)c1cc(C(=O)O)cc([C@H]2OC=Cc3occc3O2)c1
11490	C[C@@H](C(=O)O)N(C)C(=O)O
11491	O=C(O)C[C@H]1C=C[C@@H]2[C@H](C(=O)O)[C@H]12
11492	CC1(C)O[C@H]2[C@H](C(=O)O)C[C@H](C(=O)O)[C@H]2O1
11493	Cc1cc(Cl)c2c(c1)c(C)c(C(=O)O)n2C(=O)O
11494	O=C(O)c1oc2c(Cl)cccc2c1C(=O)O
11495	O=C(O)c1cc(Br)c(O)c(C(=O)O)c1O
11496	COc1c(C(=O)O)c2c3c(c1C(=O)O)O[C@@]1(C[C@H]3CC(C)(C)O2)[C@@H]2CC[C@@H](C2)C1(C)C
11497	Cc1ccc(-c2cc(C(=O)O)cc(C(=O)O)c2C)cc1
11498	CC(C)[C@H]1CC[C@@]2(C)[C@@H](C(=O)O)[C@@H]1[C@@H](C(=O)O)[C@]2(C)O
11499	O=C(O)O[C@@H]1C[C@H]1C(=O)O
11500	O=C(O)c1cnc2c(C(=O)O)c3cccccc3n2c1=O
11501	O=C(O)[C@H]1[C@@H]2CC[C@@H](O2)[C@@H]1C(=O)O
11502	O=C(O)c1cc(-c2cc(C(=O)O)c3ccccc3n2)nc2ccccc12
11503	O=C(O)c1cc2ccc3[nH]cc(C(=O)O)c3c2[nH]1
11504	Cc1c(C(=O)O)c2cc(c1C(=O)O)CCc1cccc(c1)CC2
11505	O=C(O)O[C@H]1CC[C@H]2CN3CCc4c([nH]c5ccccc45)[C@@H]3C[C@@H]2[C@H]1C(=O)O
11506	O=C(O)c1ccc2c(c1)C1(c3ccccc3-2)c2ccccc2-c2ccc(C(=O)O)cc21
11507	O=C(O)[C@H]1[C@@H]2C=C[C@@H](C2)[C@H]1C(=O)O
11508	O=C(O)C[C@@H]1c2ccccc2CCN1C(=O)O
11509	CC1=C(C(=O)O)[C@@H]2C=C(C(=O)O)[C@@]3(C(=O)O)C[C@@]3(C)[C@H]2C1
11510	O=C(O)N1C=C([C@H]2CCCN2C(=O)O)CC1
11511	C[C@]12C(=O)C(C(=O)O)=C(O)[C@](C)(C1=O)[C@@]1(C)C(=O)C(C(=O)O)=C(O)[C@]2(C)C1=O
11512	O=C(O)c1c[nH]c(C(=O)O)c1Cl
11513	CC(C)(C)[C@H]1CN(C(=O)O)c2ccccc2N1C(=O)O
11514	O=C(O)c1c(Br)c(O)c(Br)c(Br)c1C(=O)O
11515	Cn1c2ccccc2c2nc3c(nc21)N=C(O)N1[C@@H](C(=O)O)O[C@H](C(=O)O)CO[C@H]31
11516	CC(=O)O/C(C(=O)O)=C(/Br)C(=O)O
11517	O=C(O)c1ccc(-c2ccc(C(=O)O)o2)o1
11518	Cc1c2cc(C(=O)O)c(c1C)CCc1cc(C(=O)O)c(c(C)c1C)CC2
11519	O=C(O)c1ccccc1-c1ccc2c(C(=O)O)cccc2c1
11520	O=C(O)C1=C(C(=O)O)Sc2sc(=O)sc2S1
11521	CC1=C(C(=O)O)[C@](C)(C(=O)O)c2ccccc21
11522	O=C(O)c1c2cccc(F)c2c(C(=O)O)c2cccc(F)c12
11523	C#CC1C(C(=O)O)=CN(c2cccc3ccccc23)C=C1C(=O)O
11524	Cc1ccc2cc(-c3ccccc3C(=O)O)c(C(=O)O)c3c2c1CC3
11525	Cc1cc(Br)c2[nH]c(C(=O)O)c(C(=O)O)c2c1
11526	O=C(O)c1cccc2sc3cccc4cc(C(=O)O)n(c12)c43
11527	CC1(C)/C=C/C/C(C(=O)O)=C\\CC/C(C(=O)O)=C\\C1
11528	O=C(O)c1ccccc1-c1cccnc1C(=O)O
11529	CC(=O)[C@]1(C)[C@@H](C(=O)O)C[C@@]2(C(=O)O)CC(C)(C)C[C@@H]12
11530	O=C(O)/C=C(/Br)C(=O)O
11531	N#C/C(=C\\CC(=O)O)C(=O)O
11532	C[C@@H]1CCc2c(cc(C(=O)O)c(F)c2C(=O)O)N1
11533	O=C(O)/C=C(O)/C=C/C(=O)O
11534	O=C(O)/C1=C/C2=Cc3ccccc3C=C(/C=C(/C(=O)O)C1)C2
11535	O=C(O)c1cc(C(=O)O)c2c(c1O)CCC2
11536	Cc1c(C(=O)O)n(C(=O)O)c2c(C)cc(Cl)cc12
11537	O=C(O)N1CCN(C(=O)O)c2ccccc2NC(S)=NCCCCN=C(S)Nc2ccccc21
11538	O=C(O)[C@]12O[C@H]3CC[C@@H]4[C@H]3[C@H]1[C@@H]1[C@@H]3[C@@H]2[C@@H]2CC[C@@H]5O[C@@](C(=O)O)([C@H]3[C@@H]52)[C@H]41
11539	O=C(O)[C@H]1[C@@H]2[C@@H](C(=O)O)[C@H]12
11540	O=C(O)c1cccc2ccc3c4ccccc4cc(C(=O)O)c3c12
11541	O=C(O)c1cc(I)c(C(=O)O)[nH]1
11542	Cc1cc2c(cc1C(=O)O)CC1(C2)Cc2cc(C)c(C(=O)O)cc2C1
11543	O=C(O)[C@@]12O[C@]1(C(=O)O)[C@@H]1C[C@H]2c2ccccc21
11544	O=C(O)c1ccc2ccc(C(=O)O)nc2c1
11545	C=C(C(=O)O)[C@@H]1CC[C@]2(C)CCCC(C(=O)O)=C2C1
11546	CN1C=C(C(=O)O)C=C[C@H]1c1c(C(=O)O)n(C)c2ccccc12
11547	Cc1ccc2c(C(=O)O)c3ccccc3c(C(=O)O)c2c1Cl
11548	C=C1[C@@H](O)CC[C@](C)(C(=O)O)[C@@H]1C(=O)O
11549	O=C(O)C1=C(C(=O)O)SC(=C2SC3=C(SCCS3)S2)S1
11550	O=C(O)C#Cc1ccc(C#CC(=O)O)s1
11551	O=C(O)c1cc(CCl)c(O)c(C(=O)O)c1
11552	CC1(C)C[C@@H]2[C@H]3O[C@](C)(CC(C(=O)O)=C3C(=O)O)[C@@H]2C1
11553	O=C(O)[C@H]1CCCC/C1=C1/CCCC[C@H]1C(=O)O
11554	O=C(O)N=C(O)N=C(O)NC(=O)O
11555	O=C(O)c1ccc2c(C(=O)O)c(O)ccc2c1O
11556	O=C(O)[C@H]1CCCCCCCC[C@H](C(=O)O)CCCCCCCC1
11557	C=C1CC[C@H]2[C@H]([C@@H](C(=C)C(=O)O)[C@H]1C(=O)O)C2(C)C
11558	CC1(C)CCC[C@]2(C)[C@@H]1CC=C(C(=O)O)[C@]2(O)C(=O)O
11559	O=C(O)C1=C(O)[C@@H]2CCC(C(=O)O)=C(O)[C@@H]2CC1
11560	O=C(O)N=C1NN(C(=O)O)[C@@H](c2ccccc2)S1
11561	O=C(O)c1cc(CCl)cc(C(=O)O)c1
11562	CC1=C(C)[C@H]2CC=C(C(=O)O)[C@@H](C(=O)O)[C@@]2(C)CC1
11563	CC1(C)C[C@@H]2C[C@]3(Oc4c(C(=O)O)c(O)c(C(=O)O)c(c42)O1)[C@@H]1CC[C@@H](C1)C3(C)C
11564	O=C(O)N1CCN(C(=O)O)c2ccccc2NC(S)=NCC(O)CN=C(S)Nc2ccccc21
11565	O=C(O)c1cccc2ccc3cccc(C(=O)O)c3c12
11566	CC1(C)C(=O)[C@@H]2O[C@@H]2[C@]2(C)[C@H](C(=O)O)C(C(=O)O)=CC[C@H]12
11567	O=C(O)c1cnc2c(C(=O)O)sc3nc(C(F)(F)F)cc1-n-3-2
11568	Cc1ccc(-c2c(C(=O)O)c(C(=O)O)c(Cl)n2C)cc1
11569	O=C(O)[C@@H]1C[C@@H]2C(=O)[C@H](C(=O)O)C[C@@H]2C1=O
11570	C[C@H]1C[C@H](C(=O)O)C[C@@H]1C(=O)O
11571	O=C(O)c1c[nH]c2cc3[nH]cc(C(=O)O)c3cc12
11572	O=C(O)[C@]12CCC[C@@]1(C(=O)O)CC2
11573	CO[C@]12OO[C@H](O1)[C@@H]1C[C@@H](C(=O)O)[C@H](C(=O)O)[C@@H]12
11574	O=C(O)c1c2ccc(ccc3ccc(o3)c(C(=O)O)c3ccc(ccc4ccc1o4)o3)o2
11575	O=C(O)c1ccc(C(=O)O)n1-c1ccccc1
11576	C/C=C1\\CN2CC[C@@]34c5ccccc5N(C(=O)O)[C@H]3[C@@H](C(=O)O)[C@@H]1C[C@@H]24
11577	O=C(O)c1cc2c3ccc(ccc1-3)CCc1ccc3c(cc(C(=O)O)c-3cc1)CC2
11578	CS(C)=C1C(C(=O)O)=CC=C1C(=O)O
11579	CC1(C)C(C(=O)O)=C(Cl)CC(Cl)=C1C(=O)O
11580	O=C(O)/C1=C/C2=CC=CC=C(/C=C(/C(=O)O)CC1)C2
11581	O=C(O)c1cc(C(=O)O)c2cccnc2c1O
11582	COc1c(C(=O)O)cc(C(F)(F)F)cc1C(=O)O
11583	CO[C@@H]1[C@@H](C(=O)O)CC[C@H]1C(=O)O
11584	O=C(O)C1=C(C(=O)O)Sc2sc(=S)sc2S1
11585	CC1(C)[C@H]2CC=C(C(=O)O)[C@H](C(=O)O)[C@@]2(C)CC[C@H]1O
11586	O=C(O)c1ccc2c(c1)C(=O)c1cc(C(=O)O)ccc1C2=O
11587	COc1c(C)c(C)c(O)c(C(=O)O)c1C(=O)O
11588	O=C(O)c1cc(Br)c(C(=O)O)[nH]1
11589	O=C(O)c1cc(Br)c(O)c(C(=O)O)c1
11590	CC(C)(C)c1ccc(C(=O)O)cc1C(=O)O
11591	CC1=C(C(=O)O)[C@H]([C@H](C)C(=O)O)CC1
11592	CC1(C)[C@@H]2CC=C(C(=O)O)[C@]3(C2)[C@@H](C(=O)O)CC[C@H]13
11593	Cn1c(Cl)c(C(=O)O)c(C(=O)O)c1-c1ccccc1
11594	O=C(O)c1cc(C(=O)O)c(Cl)s1
11595	Cc1cc(O)c(C(=O)O)c(C)c1C(=O)O
11596	Cc1cccc(C(=O)O)c1-c1cc2ccccc2cc1C(=O)O
11597	O=C(O)c1ccc2sc(C(=O)O)nc2c1
11598	C/C(C(=O)O)=C(\\C)C(=O)O
11599	CC1(C)CCC[C@@]2(C)[C@H]1CC=C(C(=O)O)[C@@H]2C(=O)O
11600	O=C(O)c1cccc2c1[C@H]1c3ccccc3[C@@H]2c2cccc(C(=O)O)c21
11601	C=C(C)[C@H]1C[C@@](C)(C(=O)O)C[C@]1(C)C(=O)O
11602	O=C(O)[C@H]1c2ccccc2[C@H]2[C@H](C(=O)O)[C@H]12
11603	O=C(O)[C@H]1C[C@@]12C[C@H]2C(=O)O
11604	COc1ccc2c(C)nn(C(=O)O)c3ccc(C(=O)O)c1c23
11605	O=C(O)C[C@@H]1Cc2c(C(=O)O)c(O)c3ccccc3c2O1
11606	O=C(O)C1=CC=CC=C2C(C(=O)O)=CC=CC=C12
11607	O=C(O)C1=C(C(=O)O)[C@@]23O[C@@H]1C=C2[C@H]1C=C[C@@H]3CC1
11608	O=C(O)N1C=C([C@H]2c3ccccc3CCN2C(=O)O)CCC1
11609	COc1c(C(=O)O)c2c3c(c1C(=O)O)OC(C)(C)CC3CC(C)(C)O2
11610	O=C(O)C#Cc1cccc2cc3cccc(C#CC(=O)O)c3cc12
11611	O=C(O)N1C2=CCCC[C@@]2(C(=O)O)c2cc(Cl)ccc21
11612	O=C(O)c1ccc(N2CCN(C(=O)O)CC2)cc1Br
11613	O=C(O)c1c(-c2ccccc2)c(C(=O)O)n2c1sc1ccccc12
11614	CCc1c(C(=O)O)cc(C)cc1C(=O)O
11615	Cc1ccc(C(=O)O)c(-c2ccccc2C(=O)O)c1
11616	COc1c(C(=O)O)cc(C(=O)O)c(O)c1O
11617	O=C1c2ccc(Cl)cc2C(=O)c2c1ccc(C(=O)O)c2-c1c(C(=O)O)ccc2c1C(=O)c1cc(Cl)ccc1C2=O
11618	O=C(O)C1=C[C@@H]2[C@@H]3C=C[C@H]1C=C(C(=O)O)[C@@H]32
11619	CN1C[C@@H](C(=O)O)C[C@@H]1C(=O)O
11620	O=C(O)C1=C(Br)[C@H](C(=O)O)CCC1
11621	O=C(O)c1cc(C(=O)O)c2cc3ccc4ccc(cc1-2)n43
11622	O=C(O)C1=CC=CC=C(C(=O)O)O1
11623	O=C(O)c1cc2c(o1)c1c(c3oc(C(=O)O)cc32)C(=O)c2ccccc2C1=O
11624	CC(C)(C#CC(=O)O)C(=O)O
11625	O=C(O)C(=O)[C@@H](Br)C(=O)O
11626	CC1(C)C[C@H]2C[C@H](C(=O)O)[C@]3(C(=O)O)C[C@]3(C)[C@@H]2C1
11627	O=C(O)c1nc2ccccc2n1-n1c(C(=O)O)nc2ccccc21
11628	C#CC1C(C(=O)O)=CN(C2CCCCC2)C=C1C(=O)O
11629	O=C(O)[C@@H]1[C@H]2C=C[C@@H]3[C@H]2[C@@H]2[C@H]1C=C[C@H]2[C@@H]3C(=O)O
11630	O=C(O)c1ccc(C(=O)O)c2/c1=c1/cccc/c1=C/C=c1/cccc/c1=2
11631	O=C(O)C1=CC=CC=C(c2cc3cccccc-3c2C(=O)O)C1
11632	O=C(O)[C@]12c3ccccc3[C@H]1[C@H]1O[C@]2(C(=O)O)c2ccccc21
11633	O=C(O)C#CCCC#CC(=O)O
11634	O=C(O)c1sc(C(=O)O)c(O)c1O
11635	O=C(O)c1cc(C(=O)O)cc(-c2ccccc2)c1
11636	Cn1c(Cl)c(C(=O)O)c2cc(C(=O)O)ccc21
11637	O=C(O)C[C@@H]1C(=O)O[C@@H]2CC[C@@H](C(=O)O)[C@H]12
11638	Cc1cc(=O)oc2c(C(=O)O)c(O)c(CC(=O)O)cc12
11639	N#Cc1ccc(C(=O)O)c(C(=O)O)c1
11640	O=C(O)C1=C(C2=C(C(=O)O)CCCC2)CCCC1
11641	C[C@H]1CC[C@H](C(=O)O)O[C@@H]1[C@H]1O[C@@H](C(=O)O)CC[C@H]1C
11642	O=C(O)C1=CC(=C2C=CC=CC=C2)C=C1C(=O)O
11643	C=C1C[C@@H](C(=O)O)C(C(=O)O)=C2CC(C)(C)C[C@H]2[C@H]1OC(C)=O
11644	Cc1cc(C(=O)O)c(C)c2c1[nH]c1ccc(N(C)C)c(C(=O)O)c12
11645	O=C(O)c1ccccc1-c1cc2c(ccc3ccccc32)nc1C(=O)O
11646	CC(C)(C)OC(=O)n1c2cc(C(=O)O)ccc2c2ccc(C(=O)O)cc21
11647	O=C(O)[C@]1(C(F)(F)F)CC[C@@](C(=O)O)(C(F)(F)F)CC1
11648	Cn1c(=O)nc(O)c2nc(C(=O)O)c(C(=O)O)nc21
11649	O=C(O)c1c(O)ccc2c1Oc1ccc(O)c(C(=O)O)c1O2
11650	O=C(O)[C@H]1[C@H]2CC[C@@]13C(=O)CC[C@H]3[C@H](C(=O)O)C2
11651	CC(=O)[C@H]1[C@@H]2C=C[C@@H]([C@H]2C(=O)O)[C@@H]1C(=O)O
11652	O=C(O)c1ccccc1-c1c(C(=O)O)c2ccccc2c2ccccc12
11653	COc1cc2c(cc1C(=O)O)[C@]1(C)CC[C@@]3(C)C(Cl)=C(C(=O)O)CC[C@]3(C)[C@H]1CC2
11654	COc1c(O)cc(C(=O)O)c(C(=O)O)c1O
11655	O=C(O)c1ccc(O)c(C(=O)O)c1Br
11656	O=C(O)C1=C(C(=O)O)c2ccccc2/C1=C\\O
11657	Cc1ccccc1C1C(C(=O)O)=CNC=C1C(=O)O
11658	O=C(O)C1=C(Cl)NC(Cl)=C(C(=O)O)C1c1cccc(C(F)(F)F)c1
11659	COc1cc(C(=O)O)c(Br)c(C(=O)O)c1
11660	O=C(O)C1=CC(=O)c2cc(C(=O)O)ccc2OC1
11661	C/C=c1\\c2c(/c(=C/C)c3c1C[C@@H](C(=O)O)CC3)C[C@H](C(=O)O)CC2
11662	O=C(O)C1=C(C(=O)O)CC1
11663	O=C(O)c1cc(Br)c(C(=O)O)s1
11664	O=C(O)c1ccc(C(=O)O)c2c1Oc1ccccc1O2
11665	O=C(O)c1nnn(-c2ccc(Cl)cc2)c1C(=O)O
11666	O=C(O)c1cc(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)c(C(=O)O)s1
11667	O=C(O)[C@@]12c3ccccc3[C@H]3[C@@H]4C[C@H]4[C@@H]1[C@]32C(=O)O
11668	O=C(O)c1cnc2ccccc2c1C(=O)O
11669	C/C(=C/[C@H](C)C(=O)O)C(=O)O
11670	O=C(O)c1ccc2c(c1-c1c(C(=O)O)ccc3c1-c1ccccc1-3)-c1ccccc1-2
11671	CC1(C)CCC[C@@]2(C)[C@H]1C(=O)C=C(C(=O)O)[C@@]2(O)C(=O)O
11672	CC(=O)Oc1c(C(=O)O)cc(C)cc1C(=O)O
11673	O=C(O)C1=C2c3ccccc3CCN2[C@H]2O[C@@H]1N1CCc3ccccc3C1=C2C(=O)O
11674	O=C(O)C1=CC=C(C(=O)O)C2=CC=CC=C1C2
11675	O=C(O)C1=CC2=Nc3ccccc3N=C3C=C(C(=O)O)[C@H]1C[C@@H]32
11676	O=C(O)C[C@H]1CCn2c1c(C(=O)O)c1cc3c(cc1c2=O)OCO3
11677	O=C(O)/C=C/c1ccccc1C(=O)O
11678	CCn1c(Cl)c(C(=O)O)c2cc(C(=O)O)ccc21
11679	CC1C[C@@H](C(=O)O)/C=C\\C=C/[C@H](C(=O)O)C1
11680	CC1(C)[C@@]2(C)N=N[C@]1(C)[C@@H](C(=O)O)[C@@H]2C(=O)O
11681	O=C(O)c1cc(Cl)c2c(c1-c1c(C(=O)O)cc(Cl)c3c1C(=O)c1ccccc1C3=O)C(=O)c1ccccc1C2=O
11682	C[C@@H](C(=O)O)[C@H]1CCC=C1C(=O)O
11683	O=C(O)c1cccc2c1[C@@H]1c3cc4ccccc4cc3[C@H]2c2c(C(=O)O)cccc21
11684	Cc1cc(C(=O)O)c(C)c2c1ccc1ccc3ccc4c(C)cc(C(=O)O)c(C)c4c3c12
11685	O=C(O)c1sc(-c2sc(C(=O)O)c(Br)c2Br)c(Br)c1Br
11686	O=C(O)c1ccc(-c2ccoc2C(=O)O)[nH]1
11687	O=C(O)C1=C(C(=O)O)C(F)=C1F
11688	C[C@@H]1[C@@H](C)OC(=O)[C@@H]1n1c(C(=O)O)ccc1C(=O)O
11689	C[C@@]12CC[C@H]3[C@H](CC[C@@H]4Cc5oc(C(=O)O)cc5C[C@H]43)[C@@H]1CC[C@@H]2OC(=O)O
11690	O=C(O)C12CCC(C(=O)O)(C1)C2
11691	O=C(O)c1c(Cl)cc(Cl)c(C(=O)O)c1Cl
11692	Cc1ccc2c(C(=O)O)cccc2c1C(=O)O
11693	O=C(O)N1CCCN(C(=O)O)c2ccccc21
11694	O=C(O)c1cc(-c2cc(C(=O)O)c(O)cc2O)c(O)cc1O
11695	CC1(C)[C@@H](CC(=O)O)C[C@H]1C(=O)O
11696	C[C@H]1C[C@@H](C(=O)O)C(C(=O)O)=CC2=C1CC(C)(C)C2
11697	O=C(O)c1[nH]c2ccc(Br)cc2c1C(=O)O
11698	O=C(O)c1ccc(-c2ccccc2)c(C(=O)O)c1O
11699	O=C(O)Oc1c(C(=O)O)c2ccccc2c2ccccc12
11700	CC(C)(C)S(=O)(=O)c1c(C(=O)O)csc1C(=O)O
11701	O=C(O)c1ccc2nc3ccc4nc5ccc(C(=O)O)cc5cc4c3cc2c1
11702	O=C(O)[C@H]1C[C@H]2C[C@@H]1[C@H]1[C@@H]2[S@]2=N[S@@]1=N[S@]1=N[S@@](=N2)[C@@H]2[C@H]3C[C@H](C(=O)O)[C@H](C3)[C@@H]21
11703	O=C(O)C1=COC=C(C(=O)O)C1/C=C/Cl
11704	O=C(O)C[C@H]1CN(C(=O)O)CCC1=O
11705	COc1ccc2c(c1)[C@]1(C(=O)O)CCC[C@](C)(C(=O)O)[C@@H]1CC2
11706	O=C(O)C1=COC=C(C(=O)O)C1/C=C\\Cl
11707	O=C(O)c1cccc2c1[C@@H]1c3cccc(C(=O)O)c3[C@H]2[C@@H]2Cc3cc4ccccc4cc3C[C@H]12
11708	Cc1c(C)c2c(c(C(=O)O)c1C)CCc1c(C)c(C)c(C)c(C(=O)O)c1CC2
11709	O=C(O)c1cc2c(c(C(=O)O)c1)CCCC2
11710	Cc1csc(C(=O)O)c1C(=O)O
11711	C/C(C#C/C(C)=C(\\C)C(=O)O)=C(\\C)C(=O)O
11712	O=C(O)/C=C/C#C/C=C/C(=O)O
11713	O=C(O)c1cc(C(=O)O)c2ccccn2c1=O
11714	O=C(O)c1cc(C(=O)O)c2ccccc2c1Cl
11715	CC1(C)OC[C@@H](CC(=O)O)[C@@H](C(=O)O)O1
11716	COc1ccc(C(=O)O)c2c(O)ccc(C(=O)O)c12
11717	O=C(O)[C@H]1C[C@H]2CCC[C@@]2(C(=O)O)C1
11718	Cc1c2ccc3cc(C(=O)O)c4ccc(ccc5cc(C(=O)O)c(cc2)c1c5C)c(C)c4c3C
11719	O=C(O)c1ccc2nc3c(ccc4cc5cc(C(=O)O)ccc5nc43)cc2c1
11720	C=C1CC[C@H]2[C@@](C)(C(=O)O)CCC[C@]2(C)[C@H]1CC(=O)O
11721	CC(=O)O[C@@H]1CC[C@H]2[C@@H]3C=Cc4c(cc(C(=O)O)c(Cl)c4C(=O)O)[C@H]3CC[C@]21C
11722	Cc1ccc2cc(C(=O)O)c(C(=O)O)nc2c1
11723	CC(C)(C)Oc1cc(C(=O)O)sc1C(=O)O
11724	O=C(O)N1CCOCCNc2ccccc2N(C(=O)O)CCOCCNc2ccccc21
11725	Cc1c(C(=O)O)ccc(C(=O)O)c1C
11726	O=C(O)c1cc2cnncc2cc1C(=O)O
11727	O=C(O)c1cc(C(=O)O)c(N2CCCC2)o1
11728	CC(C)(C)c1cc(C(C)(C)C)c(C(=O)O)cc1C(=O)O
11729	O=C(O)c1ccc(I)c(C(=O)O)c1O
11730	C[C@H]1CC[C@]2(C)[C@H](CC=C(C(=O)O)[C@]2(O)C(=O)O)[C@]12CO2
11731	C[C@@]1(C(=O)O)CC[C@@H](CC(=O)O)C1=O
11732	CC1(C)CCC[C@@]2(C)[C@H](CC(=O)O)C(C(=O)O)=CC[C@H]12
11733	O=C(O)[C@@H]1CC[C@@H](C(=O)O)S1(=O)=O
11734	C/C(=C/[C@@H](C)C(=O)O)C(=O)O
11735	COc1ccc(C(=O)O)c(C(=O)O)c1O
11736	O=C(O)c1cc(C(=O)O)c2ccc3cccc4ccc1c2c43
11737	O=C(O)CN1CC[C@H](O)[C@H]1C(=O)O
11738	O=C(O)C[C@H]1CC(=O)[C@@H]2[C@@H]3CCCC[C@H]3C(=O)C[C@@]2(C(=O)O)C1
11739	CCc1cc(C(=O)O)c(C(=O)O)cc1O
11740	O=C(O)/N=c1/c2ccccc2c2nc3c(nc12)/c(=N/C(=O)O)c1ccccc13
11741	O=C(O)N1[C@@H](O)[C@H](O)N(C(=O)O)[C@H](O)[C@H]1O
11742	Cc1cc(C(=O)O)oc1C(=O)O
11743	CC1(C)O[C@H](C(=O)O)[C@@H]2[C@H](CC(=O)O)C(=O)c3ccccc3[C@]2(C)O1
11744	CO[C@@H]1C=C[C@@H](OC)[C@H](C=O)[C@@H]1C=O
11745	COC(=O)[C@H](C=O)CCC=O
11746	O=CC1=NN=C(C=O)C1=NNc1cccc(C(F)(F)F)c1
11747	O=CC1=NN=C(C=O)C1=NNc1nccnn1
11748	C[C@@](C=O)(c1ccc(Cl)cc1)[C@@H](C=O)c1ccc(Cl)cc1
11749	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(I)cc1
11750	C[C@@H](C=O)[C@H](C=O)C(=O)O
11751	C#C[C@H](C=O)CCCC=O
11752	[H]/N=C(/C=O)c1cccc2c1CC/C2=N/N=C(N)C=O
11753	CC(O)=Nc1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
11754	CC(C)(CC=O)C(C)(C)CC=O
11989	CS/C(C=O)=C(C#N)/C(C#N)=C(/C=O)SC
11755	O=CC[C@@H]1O[C@@H](n2ccc(O)nc2=O)C[C@@H]1C=O
11756	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(C(=O)CCl)cc1
11757	CO[C@@H]1O[C@@H](CC=O)[C@H](O)[C@@H](C=O)[C@H]1O
11758	O=C/C(C[C@H](C=O)c1ccccc1)=N\\O
11759	O=CC1=NC(=O)/C(=N\\O)C(C=O)=N1
11760	CC(CC=O)CC=O
11761	O=C[C@H](c1ccccc1O)[C@H](C=O)c1ccccc1O
11762	O=CC(=S)CCC(=S)C=O
11763	O=C[C@H]1[C@H](O)[C@@H](C=O)[C@@H](O)[C@@H](O)[C@@H]1O
11764	CN1C(C=O)=NC(C=O)=NC1(C)C
11765	Cc1cccc(C)c1N1C(C=O)=NC(C=O)=NC12CCCCC2
11766	O=CC/C=C/CC=O
11767	O=CC(=S)CC(=S)C=O
11768	Cc1ccccc1N1C(C=O)=NC(C=O)=NC1(C)C
11769	C[C@@H](C=O)C[C@@H](C)CC=O
11770	Cc1cc(C)c([C@@H](C=O)[C@@H](C=O)c2c(C)cc(C)cc2C)c(C)c1
11771	O=CCCCCCCCC=O
11772	O=C[C@@H]1[C@H]2CC[C@H](C2)[C@H]1C=O
11773	CC(C)(C)OC(=O)C1([C@@](C)(C=O)CC=O)CC1
11774	O=CC[C@H]1CCCC[C@@H]1C=O
11775	O=CCc1ccc(CC=O)c2ccccc12
11776	CCC1(CC)C(=O)N=C(C=O)N=C1C=O
11777	CC(C)(C)c1cc(CC=O)cc(CC=O)c1
11778	C[C@@H](C=O)CC=O
11779	O=CCC(=S)C=O
11780	O=C[C@@H](C(=O)O)[C@H](C=O)C(=O)O
11781	O=CC[C@H](C=O)c1ccc(Cl)cc1
11782	O=C/C(=N\\O)C(=NO)/C(C=O)=N/O
11783	C[C@H](C=O)[C@H](C=O)C(=O)O
11784	O=CCC(O)CC=O
11785	CC1(C)C[C@@H](C=O)C[C@](C)(CC=O)C1
11786	[H]/N=C(/C=O)c1ccc(-c2cc3cc(/C(C=O)=N\\[H])ccc3o2)cc1
11787	O=CCC[C@H](C=O)C(=O)O
11788	O=C[C@H]1C[C@@H](C=O)[C@H](O)[C@H](O)[C@H]1O
11789	O=CC1=NN=C(C=O)C1=NNc1ccc2ccccc2c1
11790	[H]/N=C(/C=O)N1CCN(/C(C=O)=N/[H])CC1
11791	CC1(C)CC(C=O)(CC=O)CC(C)(C)N1
11792	O=CC1=C(C=O)CCCC1
11793	C[C@]1(C=O)CNCCNC[C@@](C)(C=O)CNCCNC1
11794	O=CC(=S)NC(=S)C=O
11795	[H]/N=C(/C=O)c1ccc2cc(/C(C=O)=N\\[H])[nH]c2c1
11796	C[C@H](C=O)[C@@H](C=O)CO
11797	CC(O)=Nc1ccc([C@@H]2N=C(C=O)N=C(C=O)N2c2cccc(Cl)c2)cc1
11798	O=CC[C@@H]1[C@H]2C=C[C@H](C2)[C@H]1CC=O
11799	CC(O)=Nc1ccc(NN=C2C(C=O)=NN=C2C=O)cc1
11800	CC[C@@H]1N=C(C=O)N=C(C=O)N1c1ccc(Cl)cc1
11801	O=CC(=S)N/N=C\\C=N/NC(=S)C=O
11802	NC(C=O)=Nc1cccc([C@@H](C=O)C(=O)O)c1
11803	NC(C=O)=Nc1ccc2c(c1)Cc1ccc(N=C(N)C=O)cc1C2
11804	CN[C@@H]1[C@@H](O)[C@H](O[C@H]2[C@@H](C=O)C[C@H](C=O)[C@@H](O)[C@@H]2O)OC[C@]1(C)O
11805	O=CCC[C@H](C=O)c1ccccc1
11806	O=CCC[C@@H](O)CC=O
11807	O=CCc1cccc(-c2cccc(CC=O)c2)c1
11808	C[C@H]1C[C@@H](C=O)CC[C@@H]1C[C@H]1CC[C@@H](C=O)C[C@H]1C
11809	O=C[C@H](c1ccc(Cl)cc1)[C@@H](C=O)c1ccc(Cl)cc1
11810	O=CCc1cc(Cl)cc(CC=O)c1
11811	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1ccccc1F
11812	COc1ccccc1N1C(C=O)=NC(C=O)=NC1(C)C
11813	O=C[C@H]1C[C@H](C=O)[C@H](O)C[C@H]1O
11814	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(Cc2ccccc2)cc1
11815	CC(C)(C)OC(=O)N1CC[C@@H](C=O)[C@H](C=O)C1
11816	O=CC[C@@H]1CCCC[C@H]1C=O
11817	CC(O)=NCc1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
11818	CC1(C)[C@@H]2C[C@H]1CC[C@]2(C=O)CC=O
11819	N#CC1=C(C=O)/C(=C/c2ccccc2O)C(=O)N=C1C=O
11820	O=CC[C@@H]1CC[C@H]1CC=O
11821	[H]/N=C(/C=O)SCS/C(C=O)=N\\[H]
11822	O=C[C@H]1[C@H](O)[C@H](O)[C@H](C=O)[C@@H](O)[C@@H]1O
11823	O=C[C@@H](C[C@H]1C[C@H]1C=O)C(=O)O
11824	CC1(C)C[C@@H](C=O)C[C@@](C)(CC=O)C1
11825	O=CCC[C@@]12C[C@@H]3C[C@@H](C[C@@](CC=O)(C3)C1)C2
11826	O=CCC(=O)OC(=O)CC=O
11827	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(S(=O)(=O)F)c1
11828	[H]/N=C(\\C=O)N(/C(C=O)=N/[H])c1ccncc1
11829	CN1CCC(C=O)(CC=O)CC1
11830	O=CCc1ccc(-c2ccc(CC=O)cn2)nc1
11831	O=CC1=NC2(CCCCC2)N(OCc2ccccc2)C(C=O)=N1
11832	O=CC1=NN=C(C=O)C1=NNc1cc(F)cc(F)c1
11833	O=CC1=NN=C(C=O)C1=NNc1cccc(O)c1
11834	O=CC(=S)SSC(=S)C=O
11835	CC1(C)[C@@H](C=O)CC[C@@]1(C)C=O
11836	CC(C)(C)[C@H](C=O)CC=O
11837	O=CC[C@H](O)[C@@H](O)CC=O
11838	[H]/N=C(\\C=O)SS/C(C=O)=N/[H]
11839	C[C@@](C=O)(CC=O)c1ccccc1
11840	CO[C@@H]1O[C@@H]2CO[C@H](c3ccccc3)O[C@H]2[C@H](C=O)[C@H]1C=O
11841	C=C[C@@H](C=O)CC=O
11842	COc1ccc(NN=C2C(C=O)=NN=C2C=O)cc1F
11843	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc([C@@H](O)c2ccccc2)c1
11844	O=CC(=S)Nc1cccc(NC(=S)C=O)c1
11845	C[C@](C=O)(c1ccc(Cl)cc1)[C@H](C=O)c1ccc(Cl)cc1
11846	O=CC1=N[C@H](c2ccccc2)N(c2ccc(Cl)cc2)C(C=O)=N1
11847	CC1(C)O[C@@H]2[C@@H](C=O)CSC[C@H](C=O)[C@H]2O1
11848	CC1=C(C=O)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](C=O)[C@H]3O
11849	Cc1cc(CC=O)c(C)cc1CC=O
11850	[H]/N=C(/C=O)SC[C@@H](Br)CC=O
11851	CC1(C)N=C(C=O)N=C(C=O)N1OCc1ccc(Br)cc1
11852	CC(C)(C=O)C(=S)C=O
11853	COC(=O)[C@@H](C=O)[C@H](C=O)c1ccccc1
11854	O=C[C@@H]1CCCC[C@H]1C=O
11855	O=CCc1ccc(-c2ccc(CC=O)cc2)cc1
11856	O=CC1=C(Cl)C(=O)C(C=O)=C(Cl)C1=O
11857	O=CCC1(C=O)CC1
11858	COc1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
11859	[H]/N=C(\\C=O)SCCCC=O
11860	O=CC1=C(C=O)C(=O)c2ccccc2C1=O
11861	C[C@H]1CC[C@@]2(CC1)N=C(C=O)N=C(C=O)N2c1ccc(Cl)cc1
11862	C[C@]1(C=O)CC[C@]1(C)C=O
11863	CC[C@H](C=O)[C@H](C=O)CC
11864	CCOc1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
11865	O=CC1=CC(F)(F)[C@](F)(Br)C(OCCCl)=C1C=O
11866	CC1(C)C[C@H](C=O)C[C@](C)(CC=O)C1
11867	O=C[C@@H](C(=O)O)[C@H](C=O)c1ccccc1
11868	O=C[C@@H](c1ccccc1O)[C@@H](C=O)c1ccccc1O
11869	O=CCc1cccc(CC=O)n1
11870	O=C[C@H]1CC[C@@H](C=O)CC1
11871	C=C(CC=O)C(=C)CC=O
11873	Cc1ccc([C@@H](C=O)[C@@H](C=O)c2ccc(C)cc2)cc1
11874	CC(O)(CC=O)CC=O
11875	O=CCc1ccc(Cl)cc1CC=O
11876	N#C/C(C=O)=C(/C#N)C=O
11877	C[C@](C=O)(c1ccccc1)[C@](C)(C=O)c1ccccc1
11878	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1ccncc1
11879	O=CC[C@@H](C=O)c1ccccc1
11880	COc1cccc(NN=C2C(C=O)=NN=C2C=O)c1
11881	O=CC1=NN=C(C=O)C1=NNc1cc(Cl)cc(Cl)c1
11882	CC1(C)CC(=O)C(CC2=C(C=O)CC(C)(C)CC2=O)=C(C=O)C1
11883	CC(C)(C)[C@@H](C=O)[C@@H](C=O)C(C)(C)C
11884	CC(/C=N/N=C(N)C=O)=N\\N=C(N)C=O
11885	C[C@](C=O)(c1ccc(Cl)cc1)[C@](C)(C=O)c1ccc(Cl)cc1
11886	C[C@@H](C=O)[C@@H](C=O)c1ccccc1
11887	[H]/N=C(/C=O)c1ccc2nc(N3C(=O)C[C@@H](C=O)c4ccccc43)[nH]c2c1
11888	[H]/N=C(/C=O)CCC=O
11889	O=CC1=C/C(=C2\\C=C(C=O)C(O)=NC2=O)C(=O)N=C1O
11890	O=CC[C@@H](C=O)C(=O)O
11891	CC1(C)N=C(C=O)N=C(C=O)N1Cc1ccccc1
11892	O=CC1=NC2(CCCCC2)N(c2ccc(Cl)cc2)C(C=O)=N1
11893	O=CC[C@H]1CCC[C@@H](CC=O)C1
11894	O=CCc1ccc2cc(CC=O)ccc2c1
11895	Cc1cc(C)cc(N2C(C=O)=NC(C=O)=NC2(C)C)c1
11896	CC(C)(C=O)c1cccc(C(C)(C)C=O)c1
11897	[H]/N=C(/C=O)c1ccc(-c2cc3ccc(/C(C=O)=N\\[H])cc3[nH]2)cc1
11898	O=CC1=CC(=O)C(=O)C=C1C=O
11899	CC(C)(CC=O)CC=O
11900	C[C@H](C=O)[C@@H](C)C=O
11901	COC(=O)c1ccc([C@@H](C=O)[C@H](C=O)c2ccc(C(=O)OC)cc2)cc1
11902	O=CC1=N[C@@H](c2ccccc2)N(Cc2ccc(Cl)c(Cl)c2)C(C=O)=N1
11903	COc1ccc([C@H](C=O)CC=O)cc1
11904	O=Cc1cccc(C#CC#Cc2cccc(C=O)c2)c1
11905	C[C@H]1C[C@H](C[C@H]2C[C@H](C)[C@@H](C=O)[C@@H](C)C2)C[C@@H](C)[C@H]1C=O
11906	O=CCC(CC=O)c1ccc(F)cc1
11907	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(Cl)cc1
11908	O=CC[C@@H](C=O)CO
11909	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(Cc2ccccc2)c1
11910	O=C/C(C/C(C=O)=N\\O)=N\\O
11911	O=C[C@@H]1CC[C@H]1C=O
11912	O=CC1=CC(=O)C(=O)C(C=O)=C1
11913	O=CC1=NS(=O)(=O)N=C(C=O)C1
11914	CN(C)c1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
11915	[H]/N=C(\\C=O)N1CCC(CC=O)CC1
11916	O=CCC#Cc1ccccc1C#CCC=O
11917	[H]/N=C(\\C=O)c1cccc(-c2cccc(/C(C=O)=N\\[H])n2)n1
11918	O=CC1=NN=C(C=O)C1=NNc1ccc2c(c1)OCCO2
11919	COC(CC=O)CC=O
11920	[H]/N=C(/C=O)N(/N=C(/C)C=O)/C(C=O)=N/[H]
11921	C[C@H](C=O)CCC=O
11922	C[C@@H]1N=C(C=O)N=C(C=O)N1c1ccc(Cl)c(Cl)c1
11923	CC[C@@](C=O)(CC=O)c1ccccc1
11924	O=C[C@@H](CO)[C@@H](C=O)CO
11925	CCc1cccc(N2C(C=O)=NC(C=O)=NC2(C)C)c1
11926	O=CCC(C=O)(c1ccccc1)c1ccccc1
11927	O=C[C@H](c1ccc(Cl)cc1)[C@H](C=O)c1ccc(Cl)cc1
11928	O=CC1=NN=C(C=O)C1=NNc1cccnc1
11929	O=CCc1cccc(-c2cccc(CC=O)n2)n1
11930	C/C(C=O)=C(/C#N)C(=S)C=O
11931	Cc1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
11932	CCc1cccc(NN=C2C(C=O)=NN=C2C=O)c1
11933	COc1cc(C)cc2c1C(=O)C(C=O)=C(c1c(C)cc3c(c1OC)C(=O)C(C=O)=CC3=O)C2=O
11934	O=CC(=S)C(=S)C=O
11935	NC(C=O)=NOC(=O)ON=C(N)C=O
11936	Cc1cc(C)cc([C@@H](C=O)[C@@H](C=O)c2cc(C)cc(C)c2)c1
11937	O=CC1=C2C(=O)c3ccccc3C(=O)C2=C(C=O)CC1
11938	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc2c(Cl)cc(Cl)cc2c1
11939	O=CC1=N[C@]2(C=O)N=CN=C2C=N1
11940	O=CCCc1ccccc1CC=O
11941	O=C/C(=N\\O)c1ccc(/C(C=O)=N\\O)cc1
11942	CCC[C@@H]1N=C(C=O)N=C(C=O)N1c1ccc(Cl)cc1
11943	O=CC1=C(C=O)C(=O)c2nsnc2C1=O
11944	O=CC1=NN=C(C=O)C1=NNc1ccc2c(c1)OCO2
11945	O=C[C@@H]1Cc2ccccc2[C@@H]1C=O
11946	O=C[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1C=O
11947	O=CCC#CC#CCC=O
11948	O=CC(=S)N(/C(C=O)=N/Nc1ccccc1)c1ccccc1
11949	CC1(C)N=C(C=O)N=C(C=O)N1OCc1ccc2ccccc2c1Br
11950	O=C[C@H]1CO[C@@H]2[C@@H](C=O)CO[C@H]12
11951	[H]/N=C(/C=O)SCCS/C(C=O)=N\\[H]
11952	O=CC(=S)N/N=C(\\C=O)c1ccccn1
11953	CC(C)[C@H](C=O)C(C)(C)CC=O
11954	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(F)c1
11955	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(Br)cc1
11956	O=CC1=C(C=O)[C@H]([C@H](O)CO)OC1=O
11957	O=C[C@H]1CC[C@H](CC2CCCCC2)[C@H](C=O)C1
11958	[H]/N=C(/C=O)O/C(C=O)=N\\[H]
11959	[H]/N=C(/C=O)c1ccc2c(c1)sc1cc(/C(C=O)=N\\[H])ccc12
11960	CC1(C)N=C(C=O)N=C(C=O)N1CCc1ccccc1
11961	O=CC1=NN=C(C=O)C1=NNc1cccc(F)c1
11962	O=CC[C@@H]1[C@H]2CC[C@H](C2)[C@@H]1C=O
11963	O=CC(=S)NN=C(O)c1cccc(C(O)=NNC(=S)C=O)c1
11964	[H]/N=C(\\C=O)c1cccc2c1CC/C2=N/N=C(N)C=O
11965	C[C@](C=O)(CC=O)Cc1ccccc1
11966	CC(C)(C)C(CC=O)CC=O
11967	O=C[C@@H](c1ccc(F)cc1)[C@@H](C=O)c1ccc(F)cc1
11968	C[C@H](C=O)[C@@H](C=O)C(=O)O
11969	CC1(C)N=C(C=O)N=C(C=O)N1OCc1ccc2ccccc2c1
11970	O=CC1=N[C@H](c2ccc(Cl)cc2)N(c2ccc(Cl)cc2)C(C=O)=N1
11971	N#CC/C(C=O)=C(/C#N)C(C=O)=C(C#N)C#N
11972	N=C(C=O)N=C(O)NC(O)=NC(=N)C=O
11973	NC(C=O)=NN=C1C=CC(=NNC(=S)C=O)C=C1
11974	Cc1cccc(C)c1N1C(C=O)=NC(C=O)=NC1(C)C
11975	O=CC1=NN=C(C=O)C1=NN[C@H]1CNCCO1
11976	[H]/N=C(/C=O)N(C(=S)C=O)c1ccccc1
11977	O=C[C@H]1CC[C@H](CC[C@H]2CC[C@H](C=O)CC2)CC1
11978	CC[C@](C)(C=O)CC=O
11979	C[C@](C#N)(C=O)[C@](C)(C#N)C=O
11980	C[C@@H](ON1C(C=O)=NC(C=O)=NC1(C)C)c1ccc(Cl)c(Cl)c1
11981	O=CC1=NN=C(C=O)C1=NNc1ccc(F)c(F)c1F
11982	[H]/N=C(C=O)\\N=N\\C(C=O)=N\\[H]
11983	O=C[C@H]1C[C@@H](C=O)[C@@H](O)[C@@H](O)[C@@H]1O
11984	O=CC(=NO)NC[C@@H](C=O)C(=O)O
11985	O=C[C@@H]1CC[C@@H](C=O)C1
11986	CC1[C@H](C=O)CCC[C@H]1C=O
11987	O=CC1=NN=C(C=O)C1=NNc1ccc(F)c(F)c1
11988	CC(=O)c1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
11990	COC(=O)C(CC=O)CC=O
11991	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(-c2ccccc2)c1
11992	O=CC[C@@H](C=O)C1CCCCC1
11993	O=CC[C@@H]1C[C@@H]2C[C@H]1C[C@@H]2CC=O
11994	O=C[C@H]1CCCCC[C@@H]1C=O
11995	O=CCC1(C=O)CCCCC1
11996	O=C[C@@H]1COC[C@H]1C=O
11997	O=C[C@H](c1ccccc1)[C@H](C=O)c1ccccc1
11998	Cc1ccc([C@@H](C=O)CC=O)cc1
11999	O=C[C@H]1[C@H](C=O)[C@@H](O)[C@@H](CO)O[C@H]1O
12000	CCOC(=O)C1=C(C=O)NC(C=O)=C2C(=O)Oc3ccccc3[C@@H]12
12001	O=CC[C@H]1O[C@@H](O)[C@@H](C=O)[C@H](O)[C@@H]1O
12002	CC1(C)C[C@@H](C=O)C[C@@H](C=O)C1
12003	C[C@@H](C=O)C(C=O)(c1ccc(F)cc1)c1ccc(F)cc1
12004	N=C(N=C(N)C=O)Nc1cccc(NC(=N)N=C(N)C=O)c1
12005	O=CC[C@@H]1C[C@H]2C[C@H](CC=O)[C@@H]1C2
12006	O=CC1=NC(=O)N=C(C=O)C1=NO
12007	O=CC1=CC(C=O)=NS(=O)(=O)N1CCc1ccccc1
12008	COc1ccc([C@H](C=O)[C@@H](C=O)c2ccc(OC)cc2)cc1
12009	O=C/C(=N\\O)c1cccc(/C(C=O)=N/O)n1
12010	O=CC1=NN=C(C=O)C1=NNc1ccc(C(F)(F)F)cc1
12011	CC1(C)N=C(C=O)N=C(C=O)N1OCc1ccccc1
12012	C[C@@H](CC=O)CCC=O
12013	CC(=O)c1cccc(N2C(C=O)=NC(C=O)=NC2(C)C)c1
12014	O=CC(=S)SC(=S)C=O
12015	O=CC1=NN=C(C=O)C1=NNc1ccccc1Cl
12016	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(O)c1
12017	NC(C=O)=N/N=C1/C/C(=N\\N=C(N)C=O)c2ccccc21
12018	O=CCCCCCCC=O
12019	COc1ccc(NN=C2C(C=O)=NN=C2C=O)cc1O
12020	CO[C@H]1O[C@H](CC=O)CC[C@@H]1C=O
12021	NC(C=O)=Nc1ccc2c(c1)Cc1cc(N=C(N)C=O)ccc1-2
12022	O=CCC[C@@H](C=O)C(=O)O
12023	O=CCc1ccccc1-c1ccccc1CC=O
12024	O=CCC1(CC=O)CNC1
12025	CC1(C)N=C(C=O)N=C(C=O)N1OCc1ccc(Cl)cc1
12026	CC[C@]1(C)N=C(C=O)N=C(C=O)N1c1ccc(OC)cc1
12027	CC(C)(C=O)CCC=O
12028	CC1=CC[C@H](C(C)C)[C@@H](C=O)[C@@H]1C=O
12029	NC(C=O)=NCCC=O
12030	O=CC12CCC(C=O)(CC1)CC2
12031	O=C[C@H]1[C@@H]2CC[C@@H](C2)[C@H]1C=O
12032	N#CC1=C(C=O)SC(C=O)=C(C#N)C1
12033	Cc1cc(C)c(CC=O)c(C)c1CC=O
12034	[H]/N=C1\\C=C(C=O)C(=O)C(C=O)=C1O
12035	O=CC1=NNN=C(C=O)C1
12036	O=CC1=N[C@H](Cc2ccccc2)N(c2cccc(Cl)c2)C(C=O)=N1
12037	C[C@H](C=O)C[C@@H](C)C=O
12038	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(I)c1
12039	N=C(N=C(N)C=O)NCCNC(=N)N=C(N)C=O
12040	CC1(C)O[C@@H](CC=O)[C@H](CC=O)O1
12041	COc1ccc(NN=C2C(C=O)=NN=C2C=O)cc1
12042	O=CC1=NN=C(C=O)C1=NNc1ccc(I)cc1
12043	C[C@@H](C=O)[C@@H](C)C=O
12044	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(C(=O)O)c1
12045	[H]/N=C(/C=O)c1cccc(-c2cc3ccc(/C(C=O)=N\\[H])cc3o2)c1
12046	COc1cccc([C@H](C=O)CC=O)c1
12047	CC(CC=O)(CC=O)c1ccccn1
12048	NC(C=O)=N[C@H]1[C@H](O)[C@@H](O)[C@H](O)[C@H](N=C(N)C=O)[C@H]1O
12049	O=C[C@H]1C[C@@H](C=O)[C@H](O)[C@H](O)[C@]12CC[C@@H](O)[C@@H](O)CO2
12050	N=C(C=O)CC=O
12051	O=CC1=NN=C(C=O)C1=NNc1cccc(Cl)c1
12052	[H]/N=C(/C=O)c1ccc(-c2cc3cc(/C(C=O)=N\\[H])ccc3s2)cc1
12053	Cc1c(C)c(CC=O)c(C)c(C)c1CC=O
12054	[H]/N=C(/C=O)c1ccc2oc3ccc(/C(C=O)=N\\[H])cc3c2c1
12055	N#C/C(C=O)=C(C#N)\\N=C/C=N/C(C#N)=C(\\C#N)C=O
12056	N=C1C=C(C=O)C(=O)C(C=O)=C1
12057	O=CC1=NCN(c2ccc(Cl)cc2)C(C=O)=N1
12058	CCc1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
12059	C[C@H](C=O)CC[C@@H](C)C=O
12060	[H]/N=C(/C=O)SCC#CCS/C(C=O)=N\\[H]
12061	O=CC1=NN=C(C=O)C1=NNc1ccc(Cl)cc1
12062	O=CC[C@H]1CCCC[C@H]1C=O
12063	O=C[C@@H]1[C@H]2OC[C@H]3O[C@H](OC[C@@H](O2)[C@@H](O)[C@H]1O)[C@H](C=O)[C@@H](O)[C@H]3O
12064	CCn1c2ccccc2c2cc(NN=C3C(C=O)=NN=C3C=O)ccc21
12065	O=CC1=NC(=O)/C(=N/Nc2ccccc2)C(C=O)=N1
12066	Cc1ccc(NC(=S)C=O)cc1NC(=S)C=O
12067	O=CCC#CCC=O
12068	O=CC(=S)N/N=C\\C=N\\NC(=S)C=O
12069	O=CC1=NN=C(C=O)C1=NNc1cc[nH]n1
12070	O=CCc1c(Cl)c(Cl)c(Cl)c(CC=O)c1Cl
12071	CC(C)(C)OC(O)=NC(CC=O)CC=O
12072	O=C[C@@H](c1ccccc1)[C@@H](C=O)c1ccccc1
12073	CC(C)(C=O)c1ccc(C(C)(C)C=O)cc1
12074	COCc1c2c(n3c1[C@H](OC)[C@H](C=O)C3)C(=O)C(C)=C(C=O)C2=O
12075	[H]/N=C(/C=O)C/C(C=O)=N\\[H]
12076	NC(C=O)=NC[C@H](C=O)C(=O)O
12077	C[C@@H](C=O)c1ccc([C@@H](C)C=O)cc1
12078	O=CC1=C(C2=C(C=O)C(=O)c3ccccc3C2=O)C(=O)c2ccccc2C1=O
12079	O=CC1=NN=C(C=O)C1=NNc1ccccc1Br
12080	CCOC(=O)[C@H](C=O)CC=O
12081	O=CC[C@@H]1CCCC[C@H]1CC=O
12082	CC(C)[C@](C)(C=O)C(=S)C=O
12083	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(C(F)(F)F)cc1
12084	O=CCC(Br)CC=O
12085	O=CCC1(CC=O)COC1
12086	O=CC[C@@H]1O[C@@H](O)[C@@H](C=O)[C@H](O)[C@H]1O
12087	O=CC1=NS(=O)(=O)N=C(C=O)C1=NO
12088	O=CCc1cc(Br)cc(CC=O)c1
12089	CC1(C)[C@@H](C=O)C[C@@H]1CC=O
12090	C[C@H](C=O)[C@@H](C=O)c1ccccc1
12091	CC(C)(C)c1ccc(/N=C(C=O)/C(C=O)=N/c2ccc(C(C)(C)C)cc2)cc1
12092	O=CC1=NS(=O)(=O)N=C1C=O
12093	O=CCC1(CC=O)CCC1
12094	NC(C=O)=N/N=C1/CC[C@@H]2[C@H]3CC/C(=N\\N=C(N)C=O)C[C@@H]3CC[C@@H]2C1
12095	CC(=O)[C@@]1(C=O)C(I)=CC(I)=C(C=O)[C@H]1I
12096	COc1c(C)ncc(CC=O)c1CC=O
12097	O=CCC1(CC=O)CCOCC1
12098	CC1=C(C=O)C(=O)c2c(CO)c3n(c2C1=O)C[C@H](C=O)[C@@H]3O
12099	COc1cccc(N2C(C=O)=NC(C=O)=NC2(C)C)c1
12100	[H]/N=C(/C=O)c1ccc2[nH]c3ccc(/C(C=O)=N\\[H])cc3c2c1
12101	O=CCC(CC=O)c1ccccn1
12102	O=CC(=S)C(C(=S)C=O)c1ccccc1
12103	O=CC1=NC(=S)N=C(C=O)C1c1nnc(-c2ccccc2)c(-c2ccccc2)n1
12104	N=C(C=O)N=c1nnc(=NC(=N)C=O)[nH][nH]1
12105	CC(C)(C)OC(O)=NC[C@@H](C=O)CC=O
12106	CC(C)([C@H]1CC[C@H](C=O)CC1)[C@H]1CC[C@@H](C=O)CC1
12107	CCO[C@@H]1CC[C@@H](C=O)[C@@H](CC=O)O1
12108	O=CC1=NN=C(C=O)C1=NNc1cccc(Br)c1
12109	O=C[C@H]1CCC[C@H](C=O)C1
12110	CC[C@H](C=O)C(O)(O)C=O
12111	CC(C)C[C@H](C=O)CC=O
12112	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1ccc(F)cc1
12113	O=C/C=C/C=C/C=O
12114	Cc1ccc(/C(C=O)=N/N=C(\\C=O)c2ccc(C)cc2)cc1
12115	O=C[C@@H]1[C@@H](O)C=C[C@H](O)[C@@H]1C=O
12116	C[C@@H](C=O)[C@H]1CC[C@@H]2[C@H]3CC=C4C[C@H](C=O)CC[C@@]4(C)[C@H]3CC[C@]12C
12117	O=CC[C@H]1OCO[C@@H]2[C@@H](CC=O)OCO[C@H]12
12118	CC(C)(C=O)CCCC=O
12119	O=C[C@H]1C[C@@H]2C[C@H]1C[C@@H]2C=O
12120	CC1(C)N=C(C=O)N=C(C=O)N1c1ccccc1Cl
12121	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(C(=O)CCl)c1
12122	COc1ccc(C2C(C#N)=C(C=O)SC(C=O)=C2C#N)cc1
12123	O=C[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@]14C[C@@H]5C[C@@H](C[C@@](C=O)(C5)C1)C4)(C3)C2
12124	O=CC12CC3(C=O)C[C@H](C1)C[C@H](C2)C3
12125	O=CC[C@H]1O[C@H](n2cc(/C=C/Br)c(O)nc2=O)C[C@@H]1C=O
12126	O=CC(S)=NN=C(S)C=O
12127	N=C(N=C(N)C=O)c1cccc(C(=N)N=C(N)C=O)c1
12128	O=CC1=NCN(c2ccc(F)cc2)C(C=O)=N1
12129	CC1=C(C=O)C(=O)c2c(CO)c3n(c2C1=O)C[C@@H](C=O)C3
12130	O=CC(=N\\O)/C(C=O)=N\\O
12131	CC(C)NC(C=O)=NC(C=O)=Nc1ccc(Cl)cc1
12132	C[C@@H](C=O)C/C(C=O)=N/O
12133	CO[C@@H]1O[C@H](CC=O)[C@@H](O)[C@@H](C=O)[C@@H]1O
12134	[H]/N=C(\\C=O)c1ccc2c(c1)[nH]c1cc(/C(C=O)=N\\[H])ccc12
12135	O=CC(=S)NCCNC(=S)C=O
12136	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1ccccc1
12137	O=CC[C@H]1c2ccccc2C[C@@H]1C=O
12138	Cc1ccc([C@H](C=O)[C@@H](C=O)c2ccc(C)cc2)cc1
12139	O=CC/C=C/[C@@H](C=O)C(=O)O
12140	[H]/N=C(/C=O)c1ccc(-c2cc3ccc(/C(C=O)=N\\[H])cc3s2)cc1
12141	O=CC1=NN=C(C=O)C1=NNc1ccc(Br)c2ccccc12
12142	C[C@H](C=O)[C@](C=O)(c1ccc(F)cc1)c1ccc(F)nc1
12143	CN1CC[C@H](C=O)[C@@H](CC=O)C1
12144	NC(C=O)=NCCCC=O
12145	COc1cc(NN=C2C(C=O)=NN=C2C=O)cc(C(F)(F)F)c1
12146	CC1(C)N=C(C=O)N=C(C=O)N1OCc1cccc2cccnc12
12147	O=CC[C@@H]1C[C@@H](C=O)C(=O)O1
12148	C[C@@H](C=O)[C@@H](C=O)C(=O)O
12149	C/C(C=O)=C\\C(=S)C=O
12150	O=CC[C@H](O)[C@H](O)CC=O
12151	NC(C=O)=NCCN=C(N)C=O
12152	O=C[C@@H]1[C@@H](O)[C@H](O)[C@@H](O)[C@H](C=O)[C@@H]1O
12153	O=CC[C@H](C=O)C(=O)O
12154	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(Br)c1
12155	COc1cc(C2C(C#N)=C(C=O)SC(C=O)=C2C#N)ccc1O
12156	O=C[C@@H]1C[C@@H](O)C[C@H](C=O)C1
12157	CC1(C)N=C(C=O)N=C(C=O)N1OCc1cc(Cl)c(Cl)cc1Cl
12158	N#C[C@@H](C=O)[C@@H](C#N)C=O
12159	C[C@@H](C=O)C[C@@H](C)C=O
12160	NC(C=O)=N[C@H]1CC[C@H]([C@H](C=O)C(=O)O)CC1
12161	CC(C)(C=O)[C@@H](C=O)c1ccccc1
12162	CC1(C)C(=O)N=C(C=O)N=C1C=O
12163	O=C/C=C(\\C=O)C(=O)c1ccc(Cl)cc1
12164	[H]/N=C(/C=O)c1ccc(-n2cc3cc(/C(C=O)=N\\[H])ccc3n2)cc1
12165	O=CC12CCC(C=O)(c3ccccc31)c1ccccc12
12166	C[C@@H]1N=C(C=O)N=C(C=O)N1c1cccc(Cl)c1
12167	O=CC(=S)NCNC(=S)C=O
12168	O=C[C@@H]1CN(Cc2ccccc2)C[C@H]1C=O
12169	O=CCCN(C(=S)C=O)c1ccc2nccnc2c1Br
12170	O=C[C@@H]1COC[C@@H]1C=O
12171	[H]/N=C(\\C=O)c1ccc2oc(-c3cccc(/C(C=O)=N\\[H])c3)cc2c1
12172	O=CCC1(CC=O)CCCCC1
12173	O=CC(=S)c1cccc(C(=S)C=O)c1
12174	O=CC1=NN=C(C=O)C1=NNc1c(O)ccc2ccccc12
12175	CC(C)[C@]1(C)N=C(C=O)N=C(C=O)N1c1ccc(Cl)cc1
12176	C[C@H](C=O)C[C@H](C)C=O
12177	CO[C@@H]1O[C@@H](CC=O)[C@@H](O)[C@@H](C=O)[C@@H]1O
12178	O=C[C@H]1CO[C@H]2[C@H]1OC[C@H]2C=O
12179	O=C[C@@H]1c2ccccc2C[C@H]1C=O
12180	Cc1ncc(CC=O)c(CC=O)c1Cl
12181	O=C[C@H]1CC[C@H](C2([C@H]3CC[C@H](C=O)CC3)CCCCC2)CC1
12182	CC(C)C[C@@H](C=O)CC=O
12183	O=CC1=NN=C(C=O)C1=NNc1c(F)cccc1F
12184	Cc1cn([C@@H]2C[C@H](C=O)[C@@H](CC=O)O2)c(=O)nc1O
12185	O=CC1=NC(=O)C(C=O)C(O)=N1
12186	NC(C=O)=Nc1ccc(-c2ccc(N=C(N)C=O)cc2)cc1
12187	Cc1cc(C)cc([C@@H](C=O)[C@H](C=O)c2cc(C)cc(C)c2)c1
12188	CC1(C)N=C(C=O)N=C(C=O)N1c1cc(Cl)ccc1Cl
12189	O=CCCC#CCCC=O
12190	O=CC1=NN=C(C=O)C1=NNc1ncc[nH]1
12191	O=CC1=NN=C(C=O)C1=NNc1ccc(Cl)c(Cl)c1
12192	O=C[C@H]1CC[C@@H]1C=O
12193	O=CC1=N[C@H](c2ccccc2)N(c2cccc(Cl)c2)C(C=O)=N1
12194	NC(C=O)=NC[C@@H](C=O)C(=O)O
12195	O=CC1=Nc2ccccc2N=C(C=O)C1
12196	O=CC1=NCN(c2ccccc2)C(C=O)=N1
12197	C[C@@]1(C=O)CCC[C@H](C=O)C1
12198	O=C[C@H](C[C@H]1CC[C@@H](C=O)CC1)C(=O)O
12199	O=CCC(CC=O)c1ccccc1
12200	O=CC(=S)[C@@H](C=O)Cc1ccccc1
12201	CC1(C)C(C=O)=N/C(=N/N=C2/N=C(C=O)C(C)(C)N2O)N1O
12202	CC1(C)O[C@@H]2[C@@H](C=O)CSC[C@@H](C=O)[C@H]2O1
12203	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc2ccccc12
12204	O=C/C(CC/C(C=O)=N\\O)=N\\O
12205	CCC[C@H](C=O)CC=O
12206	CSc1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
12207	C[C@@H](CC=O)/C(C=O)=N/O
12208	CO[C@@H]1C[C@@H](C=O)C[C@@H](C=O)C1
12209	CC(C)[C@@H]1N=C(C=O)N=C(C=O)N1c1ccc(Cl)cc1
12210	O=C[C@H]1Nc2cncnc2N[C@H]1C=O
12211	O=CC1=NN=C(C=O)C1=NNc1ccc(F)cc1
12212	CO[C@@H]1OC[C@H](C=O)[C@@H](O)[C@H]1C=O
12213	C[C@@H](C=O)P(=O)(O)[C@@H](C=O)c1ccccc1
12214	C#C[C@H](C=O)CC[C@@H](C)C=O
12215	O=CCC#CC[C@H](C=O)C(=O)O
12216	O=C[C@H](c1ccccc1Cl)[C@@H](C=O)c1ccccc1Cl
12217	O=CC1=N[C@H](c2ccccc2)N(c2ccccc2)C(C=O)=N1
12218	O=CC1=C(C=O)C(=O)c2ncccc2C1=O
12219	O=CC1=NC2(c3ccccc3)N=C(C=O)NC2(c2ccccc2)N1
12220	CC1(C)N=C(C=O)N=C(C=O)N1Cc1ccc(Cl)cc1
12221	O=CCc1cccc2c(CC=O)cccc12
12222	O=CCC1(C=O)CCN(Cc2ccccc2)CC1
12223	[H]/N=C(/C=O)c1ccc(-c2csc3ccc(/C(C=O)=N\\[H])cc23)cc1
12224	O=CC12N=C(O)NC1(C=O)NC(O)=N2
12225	C[C@@H](C=O)CCCC=O
12226	N=C(N=C(N)C=O)N1CCN(C(=N)N=C(N)C=O)CC1
12227	CO[C@@H]1C=C[C@@H](OC)[C@H](C=O)[C@H]1C=O
12228	O=CC1=N[C@H](c2ccccc2)N(c2ccc(Cl)c(Cl)c2)C(C=O)=N1
12229	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(-c2ccccc2)cc1
12230	C[C@@](C=O)(CC=O)C(=O)O
12231	O=CC[C@H](C=O)Cc1c[nH]c2ccccc12
12232	C[C@H]1CC(C)(C)[C@@H](CC=O)[C@@H]1C=O
12233	O=C[C@@]12C[C@H]3C[C@H]4[C@@H]1C[C@H]1C[C@@H]2[C@@H](C3)[C@]4(C=O)C1
12234	O=C[C@H](c1cccc2ccccc12)[C@@H](C=O)c1cccc2ccccc12
12235	O=CC(S)=NN=C(O)c1ccc(C(O)=NN=C(S)C=O)cc1
12236	N#CC1=C(C=O)Oc2c(ccc3c4c(ccc23)[C@@H](c2ccc(Cl)cc2)C(C#N)=C(C=O)O4)[C@@H]1c1ccc(Cl)cc1
12237	O=CCC12CC3(CC=O)C[C@H](C1)C[C@H](C2)C3
12238	O=CCCCC1(C=O)CCCCC1
12239	O=CC12CCCCC1(C=O)CCCC2
12240	NC(C=O)=NN=C(N)C=O
12241	O=CC1=CC(=S)C(C=O)=CC1=S
12242	O=CC1=NN=C(C=O)C1=NNc1cccc(I)c1
12243	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(Cl)c1
12244	[H]/N=C(/C=O)SC[C@@H]1CN=C(C=O)S1
12245	O=CC(=S)Oc1ccc(OC(=S)C=O)cc1
12246	C[C@H]1N=C(C=O)N=C(C=O)N1c1ccc(Cl)cc1
12247	C=C(CC=O)CC=O
12248	CC(/C=N/NC(=S)C=O)=N\\NC(=S)C=O
12249	O=CC1=NC(=S)N=C(C=O)C1=NO
12250	CC(=O)O/N=C(C=O)/C(C=O)=N\\OC(C)=O
12251	[H]/N=C(\\C=O)c1ccc2cc(-c3ccc(/C(C=O)=N\\[H])cc3)oc2c1
12252	CC1(C)[C@H](CC=O)CC[C@]1(C)CC=O
12253	CC(C)(C=O)C(=O)C(C)(C)C=O
12254	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1cccc(F)c1
12255	O=C[C@H]1C[C@@H]2[C@@H](C(=O)O)[C@@H]2[C@]1(C=O)C(=O)O
12256	O=C[C@H]1CC[C@@H](C=O)C1
12257	CCC(C)(CC=O)CC=O
12258	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(CO)c1
12259	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(C#N)c1
12260	O=CCC1(C=O)CCCC1
12261	O=CC1=NN=C(C=O)C1=NNc1ccc(C(=O)O)cc1
12262	CC[C@]1(C)N=C(C=O)N=C(C=O)N1c1c(C)cccc1C
12263	CC(C)(C=O)CCC(C)(C)C=O
12264	O=CC(=N\\O)/C(C=O)=N/O
12265	CC1(C)[C@H](C=O)C(C)(C)[C@@H]1C=O
12266	O=CC[C@@H](O)[C@H](O)CC=O
12267	Cc1cc(C)c(CC=O)cc1CC=O
12268	O=C[C@H]1C[C@@H]2C[C@H](C=O)C[C@@H]2C1
12269	O=CC[C@H](C=O)Cc1ccccc1
12270	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1ccc(Cl)cc1
12271	CC/C(C=O)=C(\\C#N)C(=S)C=O
12272	Cc1ccc(NN=C2C(C=O)=NN=C2C=O)cc1
12273	[H]/N=C1/C=C(C=O)/C(=N/[H])C=C1C=O
12274	[H]/N=C(/C=O)c1ccc(CC=O)cc1
12275	CC1(C)N=C(C=O)N=C(C=O)N1c1ccccc1
12276	O=C[C@H](c1c(Cl)cc(O)cc1Cl)[C@@H](C=O)c1c(Cl)cc(O)cc1Cl
12277	O=CC(=S)[C@@H](C=O)c1ccccc1
12278	NC(C=O)=Nc1cc(N=C(N)C=O)cc(C(=O)O)c1
12279	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(Cl)c(Cl)c1
12280	C[C@@H]1CC[C@@H](C=O)C[C@@H]1C=O
12281	CC1(C)N=C(C=O)N=C(C=O)N1c1cc(Cl)c(Cl)cc1Cl
12282	C[C@]12CC[C@H]3[C@H](CC[C@@H]4C[C@H](C=O)CC[C@@]34C)[C@H]1CC[C@H]2C=O
12283	O=CC1=C(N2CC2)C(=O)C(C=O)=C(N2CC2)C1=O
12284	CC1(C)N=C(C=O)N=C(C=O)N1OCc1ccc(Cl)c(Cl)c1
12285	O=CC1=NN=C(C=O)C1=NN=c1cc[nH]cc1
12286	O=CCc1c2ccccc2c(CC=O)c2ccccc12
12287	COC1=C(C=O)C(=O)C(OC)=C(C=O)C1=O
12288	CS/C(C=O)=N/NC(=S)C=O
12289	O=CC(S)=Nc1ccc(N=C(S)C=O)cc1
12290	[H]/N=C(C=O)/N=C1\\N=C(C=O)c2ccccc21
12291	O=C[C@H]1[C@H](O)[C@H](C=O)[C@H](O)[C@H](O)[C@H]1O
12292	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(C#N)cc1
12293	O=C[C@H]1CCCC[C@@H]1C[C@@H]1CCCC[C@H]1C=O
12294	CC(C)c1ccccc1NN=C1C(C=O)=NN=C1C=O
12295	O=C[C@H]1CCC[C@@H]2[C@H](C=O)CCC[C@@H]12
12296	N=C(C=O)N=C(N)C=O
12297	O=CCCOC(=O)CC=O
12298	C/C(C=O)=C(\\C#N)C(=S)C=O
12299	O=CCP(=O)(O)CC=O
12300	O=CC[C@H]1CC[C@@H](C=O)CC1
12301	O=CC[C@H](C=O)c1cccc(F)c1
12302	CSc1ccc(NN=C2C(C=O)=NN=C2C=O)cc1
12303	O=C[C@@H](C1CCCCC1)[C@H](C=O)C1CCCCC1
12304	O=CCC12CCC(CC=O)(CC1)CC2
12305	O=CC[C@H](C=O)c1ccc(C(F)(F)F)cc1
12306	CNC(CC=O)CC=O
12307	COc1ccc(NN=C2C(C=O)=NN=C2C=O)cc1Cl
12308	O=C[C@H]1CSC[C@@H]1C=O
12309	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(F)cc1
12310	O=CCc1cccc2cc3cccc(CC=O)c3nc12
12311	[H]/N=C(C#N)/C(C=O)=N\\C(C#N)=C(\\C#N)C=O
12312	O=CCC1(C=O)CCCCCC1
12313	O=CC[C@H]1CC[C@H](CC=O)O1
12314	O=CC1=NN=C(C=O)C1=NNc1ccc(Br)cc1
12315	O=CCc1ccc(CC=O)s1
12316	CC(=N\\NC(=S)C=O)/C(C)=N/NC(=S)C=O
12317	O=CC(=S)c1ccc(C(=S)C=O)cc1
12318	O=CC[C@H]1CCC[C@H](CC=O)C1
12319	COC(=O)[C@@H](C=O)CC=O
12320	O=CC[C@H]1CC[C@@H]1CC=O
12321	C[C@@H](C=O)CC(C)(C)C=O
12322	[H]/N=C(\\C=O)[C@H](C=O)C(=O)OCC
12323	O=C/C(=N\\N=C(/C=O)c1ccccc1)c1ccccc1
12324	O=C[C@@H]1C=C[C@H](N=C(O)OCc2ccccc2)[C@@H](C=O)C1
12325	O=CC1=NC2=NCCN2C(C=O)=N1
12326	O=C[C@H]1CC[C@@H](C[C@H]2CC[C@@H](C=O)CC2)CC1
12327	O=C[C@@H]1C[C@@H]2C[C@H]1C[C@H]2C=O
12328	CC(C)(C)C1(C)O[C@@H](CC=O)[C@H](CC=O)O1
12329	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1ccco1
12330	O=CC1=NN=C(C=O)C1=NNc1cccc2ccccc12
12331	O=CC(=S)c1cccc(C(=S)C=O)n1
12332	CCC(C=O)(CC)CC=O
12333	C#Cc1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
12334	CO[C@@H]1O[C@H]2CO[C@H](c3ccccc3)O[C@@H]2[C@@H](C=O)[C@@H]1C=O
12335	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1ccccc1Cl
12336	NC(C=O)=N[C@@H]1[C@H](O)[C@H](O)[C@H](O)[C@@H](N=C(N)C=O)[C@@H]1O
12337	[H]/N=C(/C=O)c1ccc(-c2cc3cc(/C(C=O)=N\\[H])ccc3[nH]2)cc1
12453	C[C@H]1OC(=O)C(C=O)=C1C=O
12690	OC/C=C/C(O)=C\\CO
12338	O=CC12C[C@H]3[C@@H]4CC5(C=O)C[C@H]([C@@H](C1)[C@@H]3C5)[C@@H]4C2
12339	O=C[C@@H](c1ccco1)[C@@H](C=O)c1ccco1
12340	O=CC[C@@H]1CC[C@H](CC=O)O1
12341	O=CC(=S)SCCSC(=S)C=O
12342	O=CC[C@@]1(C=O)CN2CCC1CC2
12343	N#CC1=C(C=O)S[C@@H](c2ccccc2)[C@@](C#N)(C(=S)C=O)[C@@H]1c1ccccc1
12344	O=C[C@@H]1CCCC[C@@H]1SS[C@H]1CCCC[C@@H]1C=O
12345	O=CC1=NN=C(C=O)C1=NNc1ccccc1
12346	NC(C=O)=NC(=S)C=O
12347	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1cccs1
12348	CCCN1C(C=O)=NC(C=O)=NC1(C)C
12349	O=CC12[C@H]3[C@H]4[C@@H]1[C@H]1[C@@H]2[C@@H]3C41C=O
12350	O=C/C=C\\C=O
12351	COc1ccc(OC)c(N2C(C=O)=NC(C=O)=NC2(C)C)c1
12352	CC1(C)[C@H](C=O)CC[C@@]1(C)C=O
12353	C[C@@H]1C[C@@H](C[C@@H]2CC[C@@H](C=O)[C@H](C)C2)CC[C@@H]1C=O
12354	N#C/C(C=O)=C(\\C#N)C=O
12355	N#C/C(C=O)=C(C#N)\\N=C/C=O
12356	O=C[C@@H]1C[C@@H](C=O)[C@@H](O)C(O)[C@@H]1O
12357	O=C[C@H]1[C@@H](c2ccccc2)[C@@H](C=O)[C@H]1c1ccccc1
12358	[H]/N=C(/C=O)S/C(C=O)=N/[H]
12359	O=CC(S)=NN=C1Nc2ccccc2C1=NN=C(S)C=O
12360	CC[C@H]1C[C@@H](CC)[C@H](C=O)[C@@H](C)[C@@H]1C=O
12361	O=CC1(C2(C=O)CCCCC2)CCCCC1
12362	CC(C)(C)OC(=O)[C@@H](C=O)CC=O
12363	CC[C@@]1(C)N=C(C=O)N=C(C=O)N1c1ccc(Cl)cc1
12364	[H]/N=C(\\C=O)SCCC=O
12365	COc1cc(OC)cc(N2C(C=O)=NC(C=O)=NC2(C)C)c1
12366	O=C[C@@H]1[C@@H](O)O[C@@H](CO)[C@H](O)[C@H]1C=O
12367	O=C[C@@H]1CCCC[C@@H]1C[C@H]1CC[C@@H](C=O)CC1
12368	O=CCc1cccc2cc3cccc(CC=O)c3cc12
12369	O=CCc1ccccc1CC=O
12370	O=C[C@H]1CC[C@@H]2CCCC[C@H]2[C@@H]1C=O
12371	N#Cc1ccc([C@@H](C=O)[C@H](C=O)c2ccc(C#N)cc2)cc1
12372	O=C[C@H]1C[C@@H]2C[C@H]1C[C@H]2C=O
12373	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(S(C)(=O)=O)cc1
12374	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc2ccccc2c1
12375	O=CCC1(CC=O)CCCC1
12376	O=CC[C@H](C=O)CO
12377	COc1ccc(CN2C(C=O)=NC(C=O)=NC2(C)C)cc1
12378	C[C@](C=O)(C(=S)C=O)c1ccccc1
12379	C/C(C=O)=N/Cc1cccc(CC=O)c1
12380	NC(C=O)=Nc1ccc(CC=O)cc1
12381	O=CCc1ccc2c(c1)CN1CN2Cc2cc(CC=O)ccc21
12382	C[C@](C=O)(CC=O)C(=O)O
12383	O=C[C@H](C(=O)O)[C@H](C=O)C(=O)O
12384	O=CC1=NN=C(C=O)C1=NNc1nc2ccccc2s1
12385	CC(C)/C(C=O)=C(/C#N)C(=S)C=O
12386	CC[C@@H]1[C@@H](C=O)[C@H](CC)C[C@H](C)[C@H]1C=O
12387	O=CC[C@@H]1CCC[C@H]1C=O
12388	Cc1cc(CC=O)c(O)c(CC=O)c1
12389	O=CC1=NN=C(C=O)C1=NNCC1CCNCC1
12390	O=Cc1cccc(C#Cc2ccccc2C=O)c1
12391	O=CC[C@H](C=O)CCO
12392	CCOc1cccc(N2C(C=O)=NC(C=O)=NC2(C)C)c1
12393	O=C[C@H]1C[C@@H](C=O)[C@@H](O)[C@@H](O)[C@H]1O[C@@H]1O[C@H](CO)[C@H](O)[C@@H](O)[C@H]1O
12394	O=CC[C@H](C=O)C12C[C@H]3C[C@@H](C1)C[C@@H](C2)C3
12395	Cc1cccc(N2C(C=O)=NC(C=O)=NC2(C)C)c1
12396	O=C[C@@H]1C[C@@H](C=O)[C@@]2(CC[C@H](O)[C@H](O)CO2)[C@@H](O)[C@H]1O
12397	O=CC[C@H]1O[C@H](O)[C@H](C=O)[C@@H](O)[C@@H]1O
12398	C[C@H](ON1C(C=O)=NC(C=O)=NC1(C)C)c1c(Cl)cccc1Cl
12399	Cc1ccc(/N=C(C=O)/C(C=O)=N/c2ccc(C)cc2)cc1
12400	CC1(C)N=C(C=O)N=C(C=O)N1OCc1cccc2ccccc12
12401	CC1(C)O[C@@H](CC=O)[C@@H](CC=O)O1
12402	O=C[C@H]1CCCCCC[C@H]1C=O
12403	CC(C)(C)c1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
12404	CCC1(CC)C(C=O)=NC(=O)N=C1C=O
12405	O=CC[C@H](O)[C@H]1NC(C=O)=N[C@@H]1C(=O)O
12406	N#CC1=C(C=O)SC(C=O)=C(C#N)C1c1ccc(Br)cc1
12407	O=C[C@H]1C[C@@H](C=O)[C@@H](O)[C@@H](O)[C@]12C[C@@H](O)[C@@H](O)CO2
12408	Cc1nc(CC=O)c(=O)[nH]c1CC=O
12409	O=C[C@H](c1ccccn1)[C@H](C=O)c1ccccn1
12410	O=CCc1c(Cl)c(Cl)c(CC=O)c(Cl)c1Cl
12411	CC[C@H](C=O)CCC=O
12412	Cc1ccccc1[C@@H](C=O)[C@H](C=O)c1ccccc1C
12413	O=C/C(=N\\N=C(/C=O)c1ccccn1)c1ccccn1
12414	O=CC1=NN=C(C=O)C1=NNc1ccc(S(=O)(=O)O)cc1
12415	COC[C@H](C=O)CC=O
12416	O=C/C(=N\\N=C(\\C=O)c1ccccn1)c1ccccn1
12417	O=C[C@H]1CCCC[C@H](C=O)CCCC1
12418	O=CC(/N=N/C(C=O)=N/Cl)=N\\Cl
12419	[H]/N=C(\\C=O)c1ccc2[nH]c(-c3ccc(/C(C=O)=N\\[H])cc3)nc2c1
12420	O=CC12CNCCNCC(C=O)(CNCCNC1)CNCCNC2
12421	O=C[C@H](c1ccc(O)cc1)[C@@H](C=O)c1ccc(O)cc1
12422	NC(C=O)=NN=C1C=CC(=NNC(=S)C=O)C=C1
12423	O=CCC[C@@H](C=O)C(=O)N1CCCCC1
12424	Cc1ccc(CC=O)cc1CC=O
12425	CCON1C(C=O)=NC(C=O)=NC1(C)C
12426	CC(O)=N[C@H]1[C@@H](C=O)C=C(C(=O)O)C[C@@H]1C=O
12427	O=CCC(=O)CC=O
12428	CCC[C@@]1(C)N=C(C=O)N=C(C=O)N1c1ccc(Cl)cc1
12429	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(C#Cc2ccccc2)cc1
12430	O=CC1=NC(C=O)=NC(=O)C1
12431	Cc1ccccc1[C@H](C=O)[C@@H](C=O)c1ccccc1C
12432	C[C@@H]1CCC[C@H](C=O)[C@H]1C=O
12433	O=CC[C@@H](O)C=O
12434	COC(=O)[C@H](C=O)[C@@H](C=O)c1ccccc1
12435	O=C[C@H](c1ccc(C(F)(F)F)cc1)[C@H](C=O)c1ccc(C(F)(F)F)cc1
12436	O=CC[C@H](C=O)c1ccccc1
12437	O=CC[C@H]1CC[C@@H](CC=O)CC1
12438	O=C[C@@H](C(=O)O)[C@@H](C=O)C(=O)O
12439	C[C@H]1C[C@@H]2C[C@H](C)[C@@](C)(C=O)[C@H]3CC[C@@H]4[C@@H]([C@@H]1CC[C@@]4(C)C=O)[C@H]32
12440	O=C[C@@H]1C[C@H]1C=O
12441	NC(C=O)=NN=C1C=CC(=NN=C(N)C=O)C=C1
12442	O=C[C@H](c1ccc(F)cc1)[C@H](C=O)c1ccc(F)cc1
12443	O=C[C@H]1CCc2ccccc2[C@H]1C=O
12444	CC1(C)N=C(C=O)N=C(C=O)N1O
12445	O=CCCC(=O)CC=O
12446	O=CC/C(C=O)=N/O
12447	O=C[C@H]1CC[C@@H]([C@H]2CC[C@H](C=O)CC2)CC1
12448	O=C[C@@H](c1ccc(C(F)(F)F)cc1)[C@@H](C=O)c1ccc(C(F)(F)F)cc1
12449	CON1C(C=O)=NC(C=O)=NC1(C)C
12450	O=CCC1=CC[C@H](CC=O)CC1
12451	CC(O)=NC1=C(C=O)C(=O)C(N=C(C)O)=C(C=O)C1=O
12452	O=CC(S)=Nc1ccc(-c2ccc(N=C(S)C=O)cc2)cc1
12454	O=CC(=N\\O)/C(=N\\O)C(=N\\O)/C(C=O)=N/O
12455	Cc1ccccc1NN=C1C(C=O)=NN=C1C=O
12456	O=CC[C@H](C=O)CBr
12457	O=C[C@@H]1C(O)=NC[C@@H](O)[C@@H]1C=O
12458	O=CCC(=O)N=C(O)CC=O
12459	CCOC(=O)C1=C(C=O)N=C(C=O)CC1
12460	O=CC[C@@]12C[C@@H]3C[C@@H](C[C@@H](C3)C1)[C@H]2C=O
12461	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(C(=O)O)cc1
12462	C[C@H](C=O)C(C)(C)C=O
12463	C[C@@H](CC=O)[C@H](C)CC=O
12464	CC1(C)N=C(C=O)N=C(C=O)N1c1ccccc1Br
12465	O=CC(=N/Cl)/N=N/C(C=O)=N/Cl
12466	O=CC1=NN=C(C=O)C1=NNc1nccs1
12467	O=CCC/C(C=O)=N\\O
12468	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(O)cc1
12469	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(C(O)=Nc2cccnc2)c1
12470	O=CC1=CC(=O)C(C=O)=CC1=O
12471	O=CCC(F)CC=O
12472	O=CCC(F)(F)CC=O
12473	O=CC1=N[C@@H]2C=C[C@H]1[C@@H]1C=C[C@H]2C(C=O)=N1
12474	O=CC1=NN=C(C=O)C1=NNc1c(F)c(F)c(F)c(F)c1F
12475	Cc1ncc(CC=O)c(CC=O)c1O
12476	CCOC(=O)c1cccc(N2C(C=O)=NC(C=O)=NC2(C)C)c1
12477	CC1(C)N=C(C=O)N=C(C=O)N1c1cccc(C(F)(F)F)c1
12478	NC(C=O)=NC(C=O)=NCCc1ccccc1
12479	CC1(C)N=C(C=O)N=C(C=O)N1c1cc(Cl)cc(Cl)c1
12480	O=CC1=NN=C(C=O)C1=NNc1ccc(S(=O)(=O)O)c2ccccc12
12481	O=C[C@H]1CCC[C@@H]1C=O
12482	[H]/N=C(/C=O)c1ccc(-c2nc3cc(/C(C=O)=N\\[H])ccc3[nH]2)cc1
12483	CCOC(=O)c1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
12484	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc(Cl)cc1Cl
12485	O=CCCN=C(O)CC=O
12486	CC(C)(C)c1cccc(N2C(C=O)=NC(C=O)=NC2(C)C)c1
12487	CC(C)/C(C=O)=C\\C(=S)C=O
12488	C[C@@H](C=O)O[C@@H](C)C=O
12489	CC(C)(C=O)[C@H]1CC[C@@](C)(C=O)CC1
12490	C[C@@H](C=O)Cc1cccc(C(C)(C)C=O)c1
12491	O=C[C@H]1CC2(C[C@H](C=O)C2)C1
12492	CC1(C)N=C(C=O)N=C(C=O)N1OCc1c2ccccc2cc2ccccc12
12493	O=CC1=CC(C=O)=NS(=O)(=O)N1Cc1ccccc1
12494	O=C[C@@H](c1ccc(Cl)cc1)[C@@H](C=O)c1ccc(Cl)cc1
12495	C[C@H](ON1C(C=O)=NC(C=O)=NC1(C)C)c1ccc(Cl)cc1Cl
12496	O=C[C@H]1CC[C@H](C[C@H]2CC[C@@H](C=O)CC2)CC1
12497	C[C@H]1CC[C@@H](C=O)[C@H](C=O)C1
12498	CC1(C)N=C(C=O)N=C(C=O)N1c1ccc2cc(Cl)ccc2c1
12499	C[C@H](C=O)c1ccc(-c2ccc([C@@H](C)C=O)cc2)cc1
12500	O=CCc1ccc(CC=O)o1
12501	[H]/N=C(\\C=O)c1ccc(-c2ccc(/C(C=O)=N\\[H])cc2)cc1
12502	NC(C=O)=NN=C1C=CC(=NN=C(N)C=O)C=C1
12503	O=CC1=C(Br)C(=O)C(C=O)=C(Br)C1=O
12504	COC(=O)c1ccc(N2C(C=O)=NC(C=O)=NC2(C)C)cc1
12505	CC(=N/N=C(N)C=O)/C(C)=N/N=C(N)C=O
12506	CC1(C)N=C(C=O)N=C(C=O)N1c1ccccc1I
12507	O=CC1(OOC2(C=O)CCCCC2)CCCCC1
12508	C[C@H](C=O)[C@H](C=O)c1ccccc1
12509	O=C/C(=N\\O)[C@H](C=O)c1ccccc1
12510	O=CC[C@@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@H]1CC=O
12511	O=CC1=NN=C(C=O)C1=NNc1ccc(O)cc1
12512	O=CC[C@H](C=O)Cc1ccccc1F
12513	[H]/N=C(/C=O)SCCN=C(N)C=O
12514	C[C@H](C=O)C(O)=N[C@@H]1CO[C@H](O)[C@H](C=O)[C@@H]1O
12515	CO[C@@H]1O[C@@H](CC=O)[C@H](O)[C@@H](O)[C@H]1C=O
12516	COC(=O)c1cc(CC=O)cc(CC=O)c1
12517	COC(=O)[C@]12C[C@@]1(CO)C(CO)=C[C@H]1CC(C)(C)C[C@@H]12
12518	CN1CCc2cc(CO)cc(CO)c21
12519	OCc1cc(CO)c(N2CCCCC2)o1
12520	CC(C)(C)[C@@H]1CC=C(CO)[C@@H](CCO)C1
12521	OC[C@H]1[C@H]2C=C[C@@H]1[C@H](CO)C2
12522	CC1(C)CCC[C@]2(C)[C@H]1CC[C@H](CO)[C@]2(O)CO
12523	OCc1cc2sc3cc(CO)sc3c2s1
12524	Cc1ccc2c(c1)C(CO)=C(CO)c1ccccc1C2
12525	COc1c(CO)cc(Cl)c(C)c1CO
12526	OCC1=C(Cl)c2cc(-c3ccc4c(c3)C(Cl)=C(CO)CC4)ccc2CC1
12527	C[C@H]1[C@@H](C)N(CO)c2ccccc2N1CO
12528	OCc1ccc2cc3nc(CO)ccc3cc2n1
12529	O=C1c2cc(Cl)ccc2C(=O)c2c1ccc(CO)c2-c1c(CO)ccc2c1C(=O)c1ccc(Cl)cc1C2=O
12530	OCC[C@@H]1CCC[C@H](CO)C1
12531	OCc1ccccc1-c1cc2c(cc1CO)sc1ccccc12
12532	CC1(C)CC2CC(C)(C)Oc3c(CO)c(O)c(CO)c(c32)O1
12533	CC1(C)CCC=C(CO)[C@@H]1CO
12534	OCc1cscc1CO
12535	CN1C=C[C@H](c2c(CO)n(C)c3ccccc23)C(CO)=C1
12536	OCN1CCOCCOCCN(CO)CC1
12537	C=C(CO)[C@@H]1CC[C@@]2(C)CCC=C(CO)[C@@H]2C1
12538	OCc1ccc2c3c(ccc2c1)OCOc1ccc2cc(CO)ccc2c1-3
12539	Cc1ccc2oc(CO)c(CO)c2c1
12540	OCc1cc(CO)c2c(c1)CCC2
12541	C/C(=C/[C@H]1[C@H](CO)C1(C)C)CO
12542	C[C@H]1CN=C(S)Nc2ccccc2N(CO)CCN(CO)c2ccccc2NC(S)=N1
12543	C/C=c1\\c2c(/c(=C\\C)c3c1CC[C@H](CO)C3)CC[C@@H](CO)C2
12544	OCc1cc(O)c(O)cc1CO
12545	OCc1cc2ccc(O)c(CO)c2cc1O
12546	CC1=C/C(CO)=C\\C(C)=C/C(CO)=C1
12547	COc1cc2c(C)c(c1)CCc1c(C)c(c(CO)c(C)c1CO)CC2
12548	CN1C(=O)N2[C@@H](CO)O[C@H](CO)CO[C@@H]2c2nc3c4ccccc4n(C)c3nc21
12549	OCc1csc(-c2cc(CO)cs2)c1
12550	OCc1cccc2c1Oc1c(CO)cccc1O2
12551	OCc1nc2ccc(Cl)cc2nc1CO
12552	CC1=C/C(=C2/C=C(C)C(=O)C(CO)=C2)C=C(CO)C1=O
12553	OC[C@H]1C=C[C@H](CO)N1
12554	OCc1oc2ccccc2c1CO
12555	OCN1C=C([C@@H]2CCCCCN2CO)CCCC1
12556	OCc1[nH]c(CO)c2c1CCCC2
12557	Cc1ccc2c(c1)[C@@H](CO)c1ccccc1[C@@H]2CO
12558	OCc1cc2c(s1)/C(=C1\\CCc3cc(CO)sc31)CC2
12559	O=C(/C=C/CO)CO
12560	Cc1c(CO)c[nH]c1CO
12561	CN(C)c1nc(Cl)c(CO)cc1CO
12562	OC/C=C/c1cccc2c1-c1c(CO)cccc1-2
12563	CC(=O)Oc1c(CO)c(CO)cc2c1C(=O)c1ccccc1C2=O
12564	OC[C@]12[C@@H]3C=C[C@@H](O3)[C@@]1(CO)[C@@H]1C=C[C@H]2O1
12565	Cc1c(CO)csc1CO
12566	CSc1ccc(CO)cc1CO
12567	COc1c(CO)c(CO)c(Cl)n1C
12568	OCc1nc2ccccc2nc1CO
12569	OCc1cc(C#Cc2ccccc2)cc(CO)n1
12570	OCc1ccc2c(c1)Nc1ccc(CO)cc1S2
12571	OC[C@H]1c2ccccc2[C@H](CO)c2c1cc(F)c1ccccc21
12572	CC(C)(C)/C(C#CC#C/C(=C/CO)C(C)(C)C)=C/CO
12573	Cc1ccc(-c2ccc(CO)cc2)cc1CO
12574	OC/C1=C/NCCC/N=C\\C(CO)=C/NCCC\\N=C/1
12575	CCc1ccc2oc(CO)c(CO)c2c1
12576	OCN=C1CNCC(=NCO)N1
12577	CC1(C)CCC[C@]2(C)[C@H]1CC=C(CO)[C@@]2(C)CO
12578	OCc1cc(CO)c(N2CCCCC2)s1
12579	C=C(CO)[C@@H]1C/C=C(/C)CC/C=C(/CO)CC1
12580	OCN1C=C([C@@H]2c3ccccc3CCN2CO)CCCC1
12581	CC1=C(C)C[C@@H](CO)[C@@H](CO)C1
12582	OCc1[nH]c2ccc(Cl)cc2c1CO
12583	OCc1nc2cc(Cl)c(Cl)cc2nc1CO
12584	OCc1cnc2c(CO)sc3cc(-c4ccccc4)nc1-n-3-2
12585	OCc1cnc2ncc(CO)cc2c1
12586	C/C(=C/C=C(\\C)CO)CO
12587	OCC/C=C1/C=CC=C1CO
12588	OCC1=C(CO)[C@@H]2C=C[C@H]1c1cc3ccccc3cc12
12589	CCn1c(Cl)c(CO)c2cccc(CO)c21
12590	OCc1cscc1-c1ccsc1CO
12591	OC[C@H]1CCC[C@H]1[C@H]1CCC[C@@H]1CO
12592	CN1[C@H](CO)C=C[C@@H]1CO
12593	OCN1CCN(CO)[C@H](c2ccccc2)c2ccccc2C1
12594	CCOC(=O)N1C[C@H](CO)CC[C@@H]1CO
12595	O/C=C1\\C(CO)=CC(CO)=C1C1C=CC=CC=C1
12596	Cc1c(CO)n(CO)c2c(Cl)cc(Cl)cc12
12597	Cc1cccc2oc(CO)c(CO)c12
12598	OCC1=C(CO)/C=C\\C=C/C=C1
12599	C=C(CO)[C@@H]1C[C@@H](O)C(C)=C1CO
12600	OC/C1=C/Nc2ccccc2N=C/C(CO)=C\\Nc2ccccc2N=C1
12601	CC1(C)C2C3C(C)(C)C4(O)C(=O)C3(CO)C4(Cl)C3(Cl)C(=O)C1(O)C23CO
12602	OCc1cc(CO)cc([C@H]2O/C=C\\c3occc3O/C=C\\c3occc3O2)c1
12603	OCc1c[nH]c2ccc3[nH]cc(CO)c3c12
12604	C[C@@H]1CCC[C@@](C)(CO)[C@@H]1CO
12605	OCc1cc(CO)c(Br)cc1O
12606	COc1cc2c(cc1CO)C(Cl)=C(CO)C(C)(C)O2
12607	Cn1ncc(CO)c1NCO
12608	C[C@]1(O)C[C@]23CC[C@H]4[C@](C)(CO)CCC[C@@]4(CO)[C@@H]2CC[C@H]1C3
12609	C[C@]12CCC[C@@H](CO)[C@@H]1N(CO)c1ccccc12
12610	OCc1c2cccccc2n2c(CO)c(-c3ccccc3)nc12
12611	C/C(=C\\CCO)CO
12612	CC1(C)CCC[C@]2(C)[C@H]1CC[C@]1(C)[C@@H](CO)C(CO)=CC[C@@H]12
12613	CCn1c(CO)ccc1CO
12614	OCc1cccc(CO)c1S
12615	OCc1c2ccccc2c(-c2c3ccccc3c(CO)c3ccccc23)c2ccccc12
12616	CC1=CC(=O)[C@]23CCC[C@]12[C@@H](CO)C[C@@]3(C)CO
12617	OCc1ccsc1CO
12618	OCc1cc(CO)c(O)c(Br)c1O
12619	OC/C=C/c1ccc(CO)s1
12620	C/C=C1/CN(CO)[C@@H]2C[C@H]1[C@@H](C(=O)OC)[C@@]13CC(=O)O[C@@]21N(CO)c1ccccc13
12621	CC1(C)CCC[C@]2(C)[C@@H]1[C@@H](O)C=C(CO)[C@]2(O)CO
12622	OCN1CCc2c([nH]c3ccc(Br)cc23)[C@@H]1[C@H]1CCCN1CO
12623	CC(=O)Oc1c(Br)c(Br)c(CO)c(CO)c1Br
12624	OCc1c2c(cc3c1CC1(C3)Cc3cc4c(c(CO)c3C1)CCC4)CCC2
12625	CC(C)(C)c1ccc2c(CO)c3ccccc3c(CO)c2c1
12626	OCC1=Cc2ccccc2C=C(CO)O1
12627	OCN1CCOCCN(CO)c2ccccc2NCCOCCNc2ccccc21
12628	OC[C@]12CCCC[C@@]1(CO)C2
12629	Cc1cc2c(cc1C)[C@H](CO)c1ccccc1[C@@H]2CO
12630	OCC1=CC=CC=C(C2=CC=CC=C(CO)C2)C1
12631	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@H](CO)[C@H]3C)[C@H](C)[C@@H](CO)C[C@H]2C
12632	OCc1nc2c(CO)nn(-c3ccccc3)c2o1
12633	COc1cc(CO)c2c(c1C)OC(=O)c1c(C)c(Cl)c(O)c(CO)c1O2
12634	OCC1=C(CO)[C@H]2c3ccccc3[C@@H]1c1ccccc12
12635	OCc1cc(C(F)(C(F)(F)F)C(F)(F)F)cc(CO)c1O
12636	OCC1C2C3CC4C2C(CO)C2C5CC(C12)C1C3C4C51
12637	CS[C@@]1(CO)C[C@H]1CO
12638	OC[C@]12CC=CC[C@@]1(CO)C2
12639	CC1(C)CC2(CC(C)(C)c3cc(CO)ccc32)c2ccc(CO)cc21
12640	Cc1sc(C)c2cc(CO)c(CO)cc12
12641	OC/C=C(O)/C=C/CO
12642	OCc1c(Cl)nc(Cl)c(CO)c1-c1cccc(C(F)(F)F)c1
12643	C#CC1C(CO)=CN(c2ccccc2C)C=C1CO
12644	OCc1ccc2ccc3ccc4ccc5ccc6ccc(CO)c7c6c5c4c3c2c1-7
12645	OCC1=CC=C[C@H]1CO
12646	OCC1=CC[C@@H]2C(Cl)=C(CO)C[C@H]12
12647	OC[C@H]1[C@H](C2(CO)CC2)[C@@H]2C=C[C@H]1C21CC1
12648	OCc1c2ccccc2cc2c(CO)c3ccccc3cc12
12649	OC[C@H]1C[C@H](CO)C1
12650	OCC1=C(CO)c2cc(Cl)ccc2Cc2ccccc21
12651	C#CC1C(CO)=CN(C(=O)c2ccccc2)C=C1CO
12652	OCc1cnc2c(CO)sc3nc(-c4ccccc4)cc1-n-3-2
12653	OC/C=C/[C@H](Br)CO
12654	CSc1cc(CO)cc(CO)c1
12655	C[C@]12CCCC(CO)=C1N(CO)c1ccccc12
12656	O=C(CO)[C@H]1CC2(C[C@@H]1CO)OCCO2
12657	OCC[C@H]1[C@@H](CO)[C@H](O)C[C@H]1O
12658	OCN1c2ccccc2N(CO)c2nc3ccccc3nc21
12659	OC/C=C/c1c(Br)cc(Br)c(O)c1CO
12660	OCc1ccc2cccc(CO)c2c1O
12661	CC1=C(CO)[C@@](C)(CO)CCC1
12662	OCC1=CO[C@@H]2O[C@H]1OC=C2CO
12663	CCc1cc(CO)cc(CO)c1
12664	OCC1=CS/C(=C2\\SC=C(CO)S2)S1
12665	OC/C=C(\\CO)c1cccs1
12666	CN1c2ccccc2C(CO)=C(N2CCN(CO)CC2)c2sccc21
12667	Cc1cccc2c(CO)c(CO)oc12
12668	Cc1cc(-c2cc(C)c(CO)[nH]2)[nH]c1CO
12669	CCC1=C(CO)[C@@H](CO)[C@H](O)CC1
12670	CC(C)(C)C(=O)c1cc(CO)[nH]c1CO
12671	OCN1CCN(CO)c2ccccc21
12672	OCc1c2ccccc2c(CO)c2c(F)cccc12
12673	CC(=O)O[C@H]1[C@@]2(C)C[C@@]2(CO)C(CO)=C2CC(C)(C)C[C@@]21O
12674	OC[C@]12CCCC[C@@]1(CO)CC2
12675	OCc1ccc(-c2ccc(CO)cc2Cl)cc1
12676	CC(=O)O[C@H]1C=C(CO)[C@@](O)(CO)[C@@]2(C)CCCC(C)(C)[C@H]12
12677	COc1c(CO)sc2c(CO)c3cccccc-3c12
12678	OCN1Cc2ccccc2CN(CO)c2cc(Cl)ccc21
12679	CC(=O)O[C@@H]1[C@H]2C=C(CO)[C@]3(CO)C[C@]3(C)[C@@H]2CC1(C)C
12680	OCc1cc(CO)cc([C@@H]2OC=Cc3occc3O2)c1
12681	OCC[C@H]1C=C[C@H]2[C@H](CO)[C@H]12
12682	CC1(C)O[C@H]2[C@H](CO)C[C@@H](CO)[C@H]2O1
12683	CC(C)(C)/C(C#CC#C/C(=C\\CO)C(C)(C)C)=C/CO
12684	OC[C@H]1[C@@H]2CC[C@@H](O2)[C@@H]1CO
12685	OCc1ccc2c(c1)C1(c3ccccc3-2)c2ccccc2-c2ccc(CO)cc21
12686	OCC[C@@H]1c2ccccc2CCN1CO
12687	OCc1c(Br)c(O)c(Br)c(Br)c1CO
12688	OCc1ccccc1-c1ccc2c(CO)cccc2c1
12689	C[C@@H]1CCc2c(cc(CO)c(F)c2CO)N1
12691	OC/C1=C/C2=Cc3ccccc3C=C(/C=C(/CO)C1)C2
12692	OCN1CCN(CO)c2ccccc2NC(S)=NCCCCN=C(S)Nc2ccccc21
12693	OCc1cc(I)c(CO)[nH]1
12694	OC[C@]12O[C@@]1(CO)[C@@H]1C[C@H]2c2ccccc21
12695	Cc1ccc2c(CO)c3ccccc3c(CO)c2c1Cl
12696	C=C1[C@@H](CO)[C@@](C)(CO)CC[C@H]1O
12697	OCc1cc(CO)c(O)c(CCl)c1
12698	OCc1ccc2c(CO)c(O)ccc2c1O
12699	OC[C@H]1CCCCCCCC[C@H](CO)CCCCCCCC1
12700	CC1(C)CCC[C@]2(C)[C@H]1CC=C(CO)[C@]2(O)CO
12701	OCc1cc(CO)cc(CCl)c1
12702	OCN1CCN(CO)c2ccccc2NC(S)=NCC(O)CN=C(S)Nc2ccccc21
12703	OCc1cccc2ccc3cccc(CO)c3c12
12704	C[C@@H]1C[C@@H](CO)C[C@H]1CO
12705	OCc1c[nH]c2cc3[nH]cc(CO)c3cc12
12706	CS(C)=C1C(CO)=CC=C1CO
12707	OCc1cc(CO)c2cccnc2c1O
12708	OCC1=C(CO)Sc2sc(=S)sc2S1
12709	CC1(C)[C@H]2CC=C(CO)[C@H](CO)[C@]2(C)CC[C@H]1O
12710	COc1c(C)c(C)c(O)c(CO)c1CO
12711	OCc1cc(Br)c(CO)[nH]1
12712	OCc1cc(Br)c(O)c(CO)c1
12713	Cc1cccc(CO)c1-c1cc2ccccc2cc1CO
12714	C/C(CO)=C(/C)CO
12715	COc1ccc2c(C)nn(CO)c3ccc(CO)c1c23
12716	OCC1=C(CO)[C@@]23O[C@@H]1C=C2[C@H]1C=C[C@@H]3CC1
12717	OCN1C=C([C@@H]2c3ccccc3CCN2CO)CCC1
12718	OCN1C2=CCCC[C@@]2(CO)c2cc(Cl)ccc21
12719	OCc1ccc(N2CCN(CO)CC2)cc1Br
12720	COc1c(CO)cc(CO)c(O)c1O
12721	OCc1cc(CO)c2cc3ccc4ccc(cc1-2)n43
12722	OCC1=CC=CC=C(CO)O1
12723	O=C1c2ccccc2C(=O)c2c1c1oc(CO)cc1c1cc(CO)oc21
12724	CC(C)(C#CCO)CO
12725	OC[C@H]1[C@H]2C=C[C@H]3[C@@H](CO)[C@@H]4C=C[C@H]1[C@@H]4[C@@H]23
12726	OC/C=C(/CO)c1cccs1
12727	OC[C@]12O[C@H](c3ccccc31)[C@H]1c3ccccc3[C@]12CO
12728	OCc1cc(CO)cc(-c2ccccc2)c1
12729	OCC1=C(C2=C(CO)CCCC2)CCCC1
12730	CC(=O)[C@H]1[C@H](CO)[C@H]2C=C[C@@H]1[C@@H]2CO
12731	OCc1ccccc1-c1c(CO)c2ccccc2c2ccccc12
12732	OCc1ccc(O)c(CO)c1Br
12733	O/C=C1\\C(CO)=C(CO)c2ccccc21
12734	O=C1C=C(CO)COc2ccc(CO)cc21
12735	OCc1cc(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)c(CO)s1
12736	OCc1cnc2ccccc2c1CO
12737	OCC1=C2c3ccccc3CCN2[C@H]2O[C@@H]1N1CCc3ccccc3C1=C2CO
12738	OCC1=CC=C(CO)C2=CC=CC=C1C2
12739	C[C@H]1C[C@H](CO)/C=C\\C=C/[C@H](CO)C1
12740	OCc1sc(-c2sc(CO)c(Br)c2Br)c(Br)c1Br
12741	C[C@H]1OC(=O)[C@H](n2c(CO)ccc2CO)[C@H]1C
12742	OCc1cc(-c2cc(CO)c(O)cc2O)c(O)cc1O
12743	CC1(C)[C@@H](CO)C[C@@H]1CCO
12744	OCOc1c(CO)c2ccccc2c2ccccc12
12745	CC(C)(C)S(=O)(=O)c1c(CO)csc1CO
12746	OC[C@H]1C[C@H]2C[C@@H]1[C@H]1[C@@H]2[S@]2=N[S@@]1=N[S@]1=N[S@@](=N2)[C@H]2[C@@H]1[C@@H]1C[C@H]2C[C@H]1CO
12747	COc1ccc2c(c1)[C@@]1(CO)CCC[C@@](C)(CO)[C@H]1CC2
12748	Cc1csc(CO)c1CO
12749	OC/C=C\\C#C/C=C/CO
12750	O=c1c(CO)cc(CO)c2ccccn12
12751	CC1(C)OC[C@H](CCO)[C@@H](CO)O1
12752	COc1ccc(CO)c2c(O)ccc(CO)c12
12753	OC[C@H]1C[C@@H]2CCC[C@]2(CO)C1
12754	OCN1CCOCCNc2ccccc2N(CO)CCOCCNc2ccccc21
12755	CN(CO)/C(=C/O)CO
12756	C[C@@H]1CC[C@@]2(C)[C@@H](CC=C(CO)[C@@]2(O)CO)[C@]12CO2
12757	COc1ccc(CO)c(CO)c1O
12758	O=C1C[C@@H](CCO)C[C@@]2(CO)CC(=O)[C@@H]3CCCC[C@H]3[C@H]12
12759	OC/N=c1/c2ccccc2c2nc3c(nc12)/c(=N/CO)c1ccccc13
12760	CC12[C@@]3(C)c4ccc(C=O)cc4[C@]1(C)c1ccc(C=O)cc1[C@]2(C)c1ccc(C=O)cc13
12761	C[C@]12c3ccc(C=O)cc3[C@]3(C)c4ccc(C=O)cc4[C@](C)(c4cc(C=O)ccc41)[C@]23C
12762	CC(=O)N1[C@H]2[C@@H]3N(C=O)[C@@H]4[C@H](N2C=O)N(C(C)=O)[C@H]([C@H]1N3C(C)=O)N4C=O
12763	O=Cc1cc(Br)c2cc1/C=C\\c1cc(c(C=O)cc1Br)/C=C/c1cc(c(C=O)cc1Br)/C=C\\2
12764	O=C[C@@H]1[C@@H]2[C@@H]3OO[C@@H](O3)[C@@H]2[C@H](C=O)[C@@H]1C=O
12765	O=C[C@H]1CCC[C@@H](C=O)CCC[C@@H](C=O)CCC1
12766	O=CC1=C(C=O)c2cc(Cl)ccc2Cc2ccccc21
12767	O=CC1=C(C=O)[C@]23O[C@H]1C=C2[C@H]1C=C[C@@H]3CC1
12768	C[C@@H]1CCc2c(cc(C=O)c(F)c2C=O)N1
12769	COc1ccc(C=O)c(C=O)c1O
12770	O=Cc1cc(C=O)cc(-c2ccccc2)c1
12771	CC1(C)CCC[C@]2(C)[C@@H]1CC=C(C=O)[C@]2(O)C=O
12772	CCn1c(C=O)ccc1C=O
12773	O=C/N=c1\\c2ccccc2c2nc3c(nc12)/c(=N/C=O)c1ccccc13
12774	O=Cc1c2c(cc3c1CC1(C3)Cc3cc4c(c(C=O)c3C1)CCC4)CCC2
12775	O=Cc1cscc1C=O
12776	O=Cc1cccc(C=O)c1S
12777	O=Cc1c(Cl)nc(Cl)c(C=O)c1-c1cccc(C(F)(F)F)c1
12778	O=CC1=Cc2ccccc2C=C(C=O)O1
12779	CS[C@]1(C=O)C[C@@H]1C=O
12780	O=Cc1c2ccccc2cc2c(C=O)c3ccccc3cc12
12781	Cc1c(C=O)c[nH]c1C=O
12782	CC(C)(C)/C(C#CC#C/C(=C\\C=O)C(C)(C)C)=C/C=O
12783	COC(=O)[C@]12C[C@@]1(C=O)C(C=O)=C[C@H]1CC(C)(C)C[C@@H]12
12784	CC(C)(C)[C@@H]1CC=C(C=O)[C@@H](CC=O)C1
12785	O=C/C=C/C#C/C=C/C=O
12786	CCC1=C(C=O)[C@H](C=O)[C@@H](O)CC1
12787	O=C[C@H]1c2ccccc2[C@@H](C=O)c2c1cc(F)c1ccccc21
12788	O=CC1=C2c3ccccc3CCN2[C@@H]2O[C@H]1N1CCc3ccccc3C1=C2C=O
12789	O=Cc1ccc(O)c(C=O)c1Br
12790	O=C[C@H]1CCCCCCCC[C@@H](C=O)CCCCCCCC1
12791	Cc1cccc(C=O)c1-c1cc2ccccc2cc1C=O
12792	CC(C)(C)c1ccc2c(C=O)c3ccccc3c(C=O)c2c1
12793	O=CC[C@H]1CCC[C@@H](C=O)C1
12794	CC1=CC(=O)[C@@]23CCC[C@@]12[C@@H](C=O)C[C@@]3(C)C=O
12795	O=CC(=O)[C@H]1CC2(C[C@H]1C=O)OCCO2
12796	O=CC1=C(Cl)c2cc(-c3ccc4c(c3)C(Cl)=C(C=O)CC4)ccc2CC1
12797	O=Cc1cc2c(o1)c1c(c3oc(C=O)cc32)C(=O)c2ccccc2C1=O
12798	O=Cc1cc(C=O)c(Br)cc1O
12799	C=C(C=O)[C@H]1C[C@H](O)C(C)=C1C=O
12800	O=Cc1cc(C#Cc2ccccc2)cc(C=O)n1
12801	O=Cc1cc(C=O)c(N2CCCCC2)o1
12802	O=COc1c(C=O)c2ccccc2c2ccccc12
12803	C[C@@]1(O)C[C@]23CC[C@@H]4[C@](C)(C=O)CCC[C@@]4(C=O)[C@@H]2CC[C@H]1C3
12804	O=Cc1ccccc1-c1cc2c(cc1C=O)sc1ccccc12
12805	O=Cc1c2ccccc2c(-c2c3ccccc3c(C=O)c3ccccc23)c2ccccc12
12806	CC(=O)[C@H]1[C@H]2C=C[C@H]([C@@H]2C=O)[C@H]1C=O
12807	C=C1[C@@H](O)CC[C@@](C)(C=O)[C@@H]1C=O
12808	CC(C)(C)C(=O)c1cc(C=O)[nH]c1C=O
12809	O=Cc1cnc2c(C=O)sc3nc(-c4ccccc4)cc1-n-3-2
12810	C[C@@]12CCC[C@@H](C=O)[C@@H]1N(C=O)c1ccccc12
12811	C[C@@]12CCCC(C=O)=C1N(C=O)c1ccccc12
12812	O=Cc1csc(-c2cc(C=O)cs2)c1
12813	O=CN1CCN(C=O)c2ccccc2NC(S)=NCC(O)CN=C(S)Nc2ccccc21
12814	O=Cc1ccc2c(C=O)c(O)ccc2c1O
12815	C[C@H]1CC[C@@]2(C)[C@@H](CC=C(C=O)[C@]2(O)C=O)[C@]12CO2
12816	C/C(C=O)=C\\[C@H]1[C@@H](C=O)C1(C)C
12817	O=CC1=C(C=O)/C=C\\C=C/C=C1
12818	O=Cc1sc(-c2sc(C=O)c(Br)c2Br)c(Br)c1Br
12819	COc1ccc2c(c1)[C@@]1(C=O)CCC[C@@](C)(C=O)[C@H]1CC2
12820	O=Cc1ccc2c(c1)Nc1ccc(C=O)cc1S2
12821	O=CN1C=C([C@H]2c3ccccc3CCN2C=O)CCC1
12822	O=C/C=C/c1cccc2c1-c1c(C=O)cccc1-2
12823	O=CC1=CC=C(C=O)C2=CC=CC=C1C2
12824	O=CN1c2ccccc2N(C=O)c2nc3ccccc3nc21
12825	Cc1ccc(-c2ccc(C=O)cc2)cc1C=O
12826	O=C[C@@]12O[C@]1(C=O)[C@@H]1C[C@H]2c2ccccc21
12827	O=Cc1cccc2ccc3cccc(C=O)c3c12
12828	O=C/C=C(/C=O)c1cccs1
12829	O=Cc1cc(C=O)c(O)c(Br)c1O
12830	Cc1cccc2oc(C=O)c(C=O)c12
12831	C[C@H]1[C@@H](C)N(C=O)c2ccccc2N1C=O
12832	COc1c(C=O)cc(C=O)c(O)c1O
12833	COc1ccc(C=O)c2c(O)ccc(C=O)c12
12834	CN1c2ccccc2C(C=O)=C(N2CCN(C=O)CC2)c2sccc21
12835	O=C[C@]12CC=CC[C@@]1(C=O)C2
12836	O=Cc1oc2ccccc2c1C=O
12837	O=Cc1cc(I)c(C=O)[nH]1
12838	O=Cc1ccc(-c2ccc(C=O)cc2Cl)cc1
12839	CS(C)=C1C(C=O)=CC=C1C=O
12840	O=Cc1ccccc1-c1ccc2c(C=O)cccc2c1
12841	O=Cc1cc(Br)c(O)c(C=O)c1
12842	O=C[C@@H]1[C@@H]2C=C[C@H]([C@H]1C1(C=O)CC1)C21CC1
12843	CC1(C)CCC[C@]2(C)[C@@H]1CC=C(C=O)[C@]2(C)C=O
12844	CN1C(=O)N2[C@@H](OC[C@H](C=O)O[C@@H]2C=O)c2nc3c4ccccc4n(C)c3nc21
12845	CC1(C)CC2(CC(C)(C)c3cc(C=O)ccc32)c2ccc(C=O)cc21
12846	O=C/C=C\\C(O)=C/C=O
12847	O=Cc1ccc2cc3nc(C=O)ccc3cc2n1
12848	CC(C)(C)S(=O)(=O)c1c(C=O)csc1C=O
12849	O=CC1=CC=CC=C(C=O)O1
12850	O=Cc1ccc2cccc(C=O)c2c1O
12851	O=Cc1cc2c(s1)/C(=C1\\CCc3cc(C=O)sc31)CC2
12852	Cn1ncc(C=O)c1N=CO
12853	C#CC1C(C=O)=CN(c2ccccc2C)C=C1C=O
12854	Cc1cc2c(cc1C)[C@H](C=O)c1ccccc1[C@@H]2C=O
12855	CC(=O)Oc1c(C=O)c(C=O)cc2c1C(=O)c1ccccc1C2=O
12856	O=Cc1ccc2c(c1-c1c(C=O)ccc3c1C(=O)c1ccc(Cl)cc1C3=O)C(=O)c1ccc(Cl)cc1C2=O
12857	CC(C)(C#CC=O)C=O
12858	CC1(C)O[C@H]2[C@H](C=O)C[C@H](C=O)[C@H]2O1
12859	O=CC/C=C1\\C=CC=C1C=O
12860	C=C(C=O)[C@@H]1CC[C@@]2(C)CCC=C(C=O)[C@@H]2C1
12861	Cc1cc(-c2cc(C)c(C=O)[nH]2)[nH]c1C=O
12862	O=CC1=C(C=O)[C@@H]2C=C[C@H]1c1cc3ccccc3cc12
12863	O=Cc1cnc2ccccc2c1C=O
12864	COc1c(C)c(C)c(O)c(C=O)c1C=O
12865	O=C[C@H]1C[C@@H](C=O)C1
12866	Cc1ccc2c(C=O)c3ccccc3c(C=O)c2c1Cl
12867	C[C@H]1CCC[C@@](C)(C=O)[C@@H]1C=O
12868	O=CC1=CO[C@H]2O[C@@H]1OC=C2C=O
12869	CC1(C)CCC[C@@]2(C)[C@@H]3CC=C(C=O)[C@H](C=O)[C@@]3(C)CC[C@H]12
12870	O=Cc1cc(C=O)c2cc3ccc4ccc(cc1-2)n43
12871	CC1(C)CCC[C@]2(C)[C@@H]1CC[C@H](C=O)[C@]2(O)C=O
12872	O=CN1C2=CCCC[C@@]2(C=O)c2cc(Cl)ccc21
12873	Cc1ccc2c(c1)C(C=O)=C(C=O)c1ccccc1C2
12874	CC1(C)[C@H](O)CC[C@]2(C)[C@@H](C=O)C(C=O)=CC[C@@H]12
12875	CSc1ccc(C=O)cc1C=O
12876	O=Cc1c2ccccc2c(C=O)c2c(F)cccc12
12877	O=C/C=C(O)/C=C/C=O
12878	O=Cc1cc(C=O)cc(CCl)c1
12879	Cc1ccc2c(c1)[C@H](C=O)c1ccccc1[C@@H]2C=O
12880	O=Cc1cc(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)c(C=O)s1
12881	O=CN1CCN(C=O)c2ccccc21
12882	O=Cc1nc2c(C=O)nn(-c3ccccc3)c2o1
12883	O=CN1Cc2ccccc2CN(C=O)c2cc(Cl)ccc21
12884	O=Cc1ccsc1C=O
12885	O=CN1CCOCCNc2ccccc2N(C=O)CCOCCNc2ccccc21
12886	O=C/C1=C/C2=Cc3ccccc3C=C(/C=C(/C=O)C1)C2
12887	O=C[C@]12CCCC[C@@]1(C=O)CC2
12888	O=CN1CCOCCN(C=O)c2ccccc2NCCOCCNc2ccccc21
12889	O=Cc1ccccc1-c1c(C=O)c2ccccc2c2ccccc12
12890	O=Cc1ccc2c(c1)C1(c3ccccc3-2)c2ccccc2-c2ccc(C=O)cc21
12891	CSc1cc(C=O)cc(C=O)c1
12892	O=Cc1cc(-c2cc(C=O)c(O)cc2O)c(O)cc1O
12893	O=Cc1cc2ccc(O)c(C=O)c2cc1O
12894	COc1c(C=O)c(C=O)c(Cl)n1C
12895	O=CN1CCN(C=O)c2ccccc2NC(S)=NCCCCN=C(S)Nc2ccccc21
12896	C=C(C=O)[C@H]1C/C=C(/C)CC/C=C(/C=O)CC1
12897	O=Cc1[nH]c(C=O)c2c1CCCC2
12898	CC(=O)Oc1c(Br)c(Br)c(C=O)c(C=O)c1Br
12899	O=C/C=C\\C(=O)C=O
12900	O=Cc1nc2cc(Cl)c(Cl)cc2nc1C=O
12901	CC(=O)O[C@@H]1C=C(C=O)[C@](O)(C=O)[C@@]2(C)CCCC(C)(C)[C@H]12
12902	O=Cc1cc(O)c(O)cc1C=O
12903	O=C/C1=C/Nc2ccccc2/N=C/C(C=O)=C\\Nc2ccccc2/N=C/1
12904	O=CC1=C(C=O)[C@H]2c3ccccc3[C@@H]1c1ccccc12
12905	O=CC1=CN=C2C(C=O)=S=C3C=C(c4ccccc4)N=C1N23
12906	O=CC1=CC=CC=C(C2=CC=CC=C(C=O)C2)C1
12907	CC(=O)O[C@H]1[C@@H]2C=C(C=O)[C@]3(C=O)C[C@]3(C)[C@@H]2CC1(C)C
12908	Cc1c(C=O)csc1C=O
12909	C/C=C1/CN(C=O)[C@@H]2C[C@H]1[C@@H](C(=O)OC)[C@@]13CC(=O)O[C@@]21N(C=O)c1ccccc13
12910	C/C(C=O)=C\\CC=O
12911	COc1cc2c(C)c(c1)CCc1c(C)c(c(C=O)c(C)c1C=O)CC2
12912	O=C[C@@H]1C[C@H]2C[C@@H]1[C@@H]1[C@H]2[S@@]2=N[S@]3=N[S@@](=N[S@]1=N2)[C@@H]1[C@@H]2C[C@@H](C[C@H]2C=O)[C@H]13
12913	O=Cc1cc(C(F)(C(F)(F)F)C(F)(F)F)cc(C=O)c1O
12914	O=Cc1cc(Br)c(C=O)[nH]1
12915	O=Cc1c[nH]c2ccc3[nH]cc(C=O)c3c12
12916	CC1(C)CC2CC(C)(C)Oc3c(C=O)c(O)c(C=O)c(c32)O1
12917	O=CC[C@H]1CC(=O)[C@H]2[C@@H]3CCCC[C@H]3C(=O)C[C@@]2(C=O)C1
12918	COc1c(C=O)cc(Cl)c(C)c1C=O
12919	O=CN1CCOCCOCCN(C=O)CC1
12920	O=CN=C1CNCC(N=CO)=N1
12921	O=Cc1c(Br)c(O)c(Br)c(Br)c1C=O
12922	O=Cc1ccc(N2CCN(C=O)CC2)cc1Br
12923	O=Cc1cc(C=O)c2ccccn2c1=O
12924	CC1=C/C(C=O)=C\\C(C)=C/C(C=O)=C1
12925	C[C@@H]1[C@@H](C)OC(=O)[C@@H]1n1c(C=O)ccc1C=O
12926	O=Cc1cc(C=O)c2cccnc2c1O
12927	O=CN1CCC[C@@H]1[C@@H]1c2[nH]c3ccc(Br)cc3c2CCN1C=O
12928	COc1cc2c(cc1C=O)C(Cl)=C(C=O)C(C)(C)O2
12929	C/C(C=O)=C\\C=C(/C)C=O
12930	CC1=C(C)C[C@@H](C=O)[C@H](C=O)C1
12931	O=CC1=CC=C[C@H]1C=O
12932	O=Cc1cc(C=O)c(O)c(CCl)c1
12933	O=C[C@H]1C=C[C@H](C=O)N1
12934	CCc1cc(C=O)cc(C=O)c1
12935	O=C[C@H]1C[C@@H]2CCC[C@]2(C=O)C1
12936	CC1(C)OC[C@@H](CC=O)[C@@H](C=O)O1
12937	O=Cc1cscc1-c1ccsc1C=O
12938	O=C[C@@H]1[C@@H]2CC[C@@H](O2)[C@H]1C=O
12939	O=Cc1ccc2c3c(ccc2c1)OCOc1ccc2cc(C=O)ccc2c1-3
12940	O=Cc1nc2ccc(Cl)cc2nc1C=O
12941	CN(C)c1nc(Cl)c(C=O)cc1C=O
12942	O=CN1CCN(C=O)[C@@H](c2ccccc2)c2ccccc2C1
12943	CN1[C@H](C=O)C=C[C@@H]1C=O
12944	CN1C=C[C@@H](c2c(C=O)n(C)c3ccccc23)C(C=O)=C1
12945	Cc1sc(C)c2cc(C=O)c(C=O)cc12
12946	O=CC12[C@@H]3C=C[C@@H](O3)C1(C=O)[C@H]1C=C[C@@H]2O1
12947	CN1CCc2cc(C=O)cc(C=O)c21
12948	O=Cc1ccc2ccc3ccc4ccc5ccc6ccc(C=O)c7c6c5c4c3c2c1-7
12949	CCOC(=O)N1C[C@@H](C=O)CC[C@H]1C=O
12950	O=C[C@H]1[C@H]2C=C[C@@H]1[C@H](C=O)C2
12951	O=CC1=C(C=O)Sc2sc(=S)sc2S1
12952	O=CC1=CC(C=O)=C(C2C=CC=CC=C2)/C1=C/O
12953	CN(C=O)/C(C=O)=C\\O
12954	O=CC[C@H]1[C@@H](O)C[C@@H](O)[C@@H]1C=O
12955	O=Cc1c[nH]c2cc3[nH]cc(C=O)c3cc12
12956	C/C=c1\\c2c(/c(=C/C)c3c1C[C@@H](C=O)CC3)C[C@H](C=O)CC2
12957	O=C/C=C\\c1ccc(C=O)s1
12958	CCn1c(Cl)c(C=O)c2cccc(C=O)c21
12959	CC1=C(C=O)[C@](C)(C=O)CCC1
12960	O=CC1=C(C=O)c2ccccc2/C1=C\\O
12961	O=CC1=CC(=O)c2cc(C=O)ccc2OC1
12962	O=Cc1nc2ccccc2nc1C=O
12963	CC1=C/C(=C2\\C=C(C)C(=O)C(C=O)=C2)C=C(C=O)C1=O
12964	O=Cc1cc(C=O)c(O)c(CO)c1
12965	O=C/C=C/[C@H](Br)C=O
12966	C[C@@H]1C[C@H](C=O)/C=C\\C=C/[C@H](C=O)C1
12967	O=Cc1cc(C=O)c(N2CCCCC2)s1
12968	O=Cc1c2cccccc2n2c(C=O)c(-c3ccccc3)nc12
12969	O=Cc1cnc2ncc(C=O)cc2c1
12970	COc1c(C=O)sc2c(C=O)c3cccccc-3c12
12971	O=C[C@]12CCCC[C@]1(C=O)C2
12972	O=Cc1cc(C=O)cc([C@H]2OC=Cc3occc3O2)c1
12973	O=Cc1cc(C=O)cc([C@@H]2O/C=C\\c3occc3O/C=C\\c3occc3O2)c1
12974	O=C[C@H]1[C@H]2C=C[C@@H]3[C@H]2[C@@H]2[C@H](C=C[C@@H]12)[C@H]3C=O
12975	O=Cc1cc2sc3cc(C=O)sc3c2s1
12976	O=CC[C@H]1c2ccccc2CCN1C=O
12977	Cc1csc(C=O)c1C=O
12978	O=C/C=C(\\C=O)c1cccs1
12979	Cc1cccc2c(C=O)c(C=O)oc12
12980	C/C(C=O)=C(/C)C=O
12981	O=CC1=CS/C(=C2\\SC=C(C=O)S2)S1
12982	O=CC[C@H]1C=C[C@@H]2[C@@H](C=O)[C@H]12
12983	C[C@H]1CN=C(S)Nc2ccccc2N(C=O)CCN(C=O)c2ccccc2NC(S)=N1
12984	O=CN1C=C([C@H]2c3ccccc3CCN2C=O)CCCC1
12985	O=C/C=C/c1c(Br)cc(Br)c(O)c1C=O
12986	O=C[C@H]1[C@@H]2[C@H]3C[C@@H]4[C@H]5[C@@H]6[C@@H]([C@H]7C[C@@H]6[C@@H]([C@@H](C=O)[C@@H]24)[C@H]17)[C@@H]35
12987	COc1ccc2c(C)nn(C=O)c3ccc(C=O)c1c23
12988	O=C/C1=C/NCCC/N=C/C(C=O)=C\\NCCC\\N=C/1
12989	COc1cc(C=O)c2c(c1C)OC(=O)c1c(C)c(Cl)c(O)c(C=O)c1O2
12990	CCc1ccc2oc(C=O)c(C=O)c2c1
12991	Cc1c(C=O)n(C=O)c2c(Cl)cc(Cl)cc12
12992	CC1(C)[C@@H](C=O)C[C@H]1CC=O
12993	C/C=c1/c2c(c3c(/c1=C\\C)[C@@H](C)C[C@@H](C=O)[C@H]3C)[C@@H](C)[C@H](C=O)C[C@H]2C
12994	O=Cc1[nH]c2ccc(Cl)cc2c1C=O
12995	C#CC1C(C=O)=CN(C(=O)c2ccccc2)C=C1C=O
12996	O=C[C@H]1CCC[C@H]1[C@@H]1CCC[C@H]1C=O
12997	Cc1ccc2oc(C=O)c(C=O)c2c1
12998	O=CC1=CC[C@@H]2C(Cl)=C(C=O)C[C@H]12
12999	CC1(C)CCC=C(C=O)[C@@H]1C=O
13000	C[C@H]1C[C@H](C=O)C[C@H]1C=O
13001	CC1(C)[C@@H]2[C@H]3C(C)(C)[C@]4(O)C(=O)[C@@]3(C=O)[C@]4(Cl)[C@@]3(Cl)C(=O)[C@@]1(O)[C@]23C=O
13002	CC(C)(C)/C(C#CC#C/C(=C/C=O)C(C)(C)C)=C/C=O
13003	CC1(C)CCC[C@@]2(C)[C@@H]1[C@H](O)C=C(C=O)[C@]2(O)C=O
13004	O=C[C@]12O[C@H](c3ccccc31)[C@H]1c3ccccc3[C@]12C=O
13005	O=CC1=C(C2=C(C=O)CCCC2)CCCC1
13006	CC(=O)O[C@H]1[C@@]2(O)CC(C)(C)CC2=C(C=O)[C@@]2(C=O)C[C@@]12C
13007	O=Cc1cccc2c1Oc1c(C=O)cccc1O2
13008	O=CN1C=C([C@H]2CCCCCN2C=O)CCCC1
13009	O=Cc1cc(C=O)c2c(c1)CCC2
13010	O=C/C=C(\\Br)C=O
13011	Cc1cc(Br)c2c(c1)c(C)c(C=O)n2C=O
13012	O=Cc1cc(C=O)c(O)c(C2CCCCC2)c1
13013	O=Cc1ccn(-n2cccc2C=O)c1
13014	O=Cc1nc2ccccc2n1-n1c(C=O)nc2ccccc21
13015	O=CC=C=CC=O
13016	CC1(C)C[C@H]2[C@H](C=C(C=O)[C@]3(C=O)C[C@]23C)[C@@H]1O
13017	N#Cc1cc(C=O)[nH]c1C=O
13018	COc1ccc2c(c1)C(C=O)=C(C=O)c1ccccc1C2
13019	O=C[C@@H](O)[C@@H]1CS[C@H](C=O)O1
13020	O=COC(=O)OC=O
13021	C#CC1C(C=O)=CN(c2c(C)cccc2C)C=C1C=O
13022	CC1(C)/C=C\\C/C(C=O)=C\\CC/C(C=O)=C\\C1
13023	O=CC1=C2CCc3cc4c5cc3CCC2=C(C=O)/C=C(/CC5)C(=C1)CC4
13024	O=CC(=O)[C@@H](Br)C=O
13025	CC(=O)SC1CN(C=O)N(C=O)C1
13026	O=Cc1cc(Br)c(O)c(C=O)c1O
13027	CN1C[C@H](C=O)[C@H](OC=O)[C@H]2c3ccccc3CC[C@@H]21
13028	O=Cc1cccc2c1-c1cccc(C=O)c1-2
13029	O=Cc1c2ccccc2c(C=O)c2cc(F)ccc12
13030	O=C[C@@]12O[C@@H]3CC[C@H]4[C@@H]3[C@@H]1[C@H]1[C@H]3[C@@H]2[C@@H]2CC[C@H]5O[C@](C=O)([C@@H]3[C@H]52)[C@@H]14
13031	O=Cc1cc2c(s1)-c1sc(C=O)cc1C2=O
13032	O=Cc1ccc(-c2ccoc2C=O)[nH]1
13033	O=Cc1ccc(Cl)c(C=O)c1Cl
13034	O=CC1=CNC=C(C=O)C1c1ccccc1F
13035	O=Cc1cccc2c1Oc1cccc(C=O)c1O2
13036	Cc1cc(-c2[nH]c(C=O)cc2C)[nH]c1C=O
13037	O=Cc1cc2ccccc2c(C=O)c1O
13038	CC1=C(C=O)C2=CC=C3C=CC=C4C=CC(=C1C=O)[C@@]2(C)[C@]43C
13039	O=Cc1cc(C=O)c(Cl)s1
13040	CC1(C)O[C@@H]2[C@H](C=O)O[C@H](C=O)[C@@H]2O1
13041	O=C[C@]1(C(F)(F)F)CC[C@@](C=O)(C(F)(F)F)CC1
13042	O=C[C@H]1C[C@@H](C=O)[C@@H]2CC=C[C@H]12
13043	O=Cc1cnc2c(C=O)sc3cc(-c4ccccc4)cc1-n-3-2
13044	Cc1cc(C)c(C=O)c(-c2cc(C)cc(C)c2C=O)c1
13045	O=C[C@H]1c2ccccc2[C@@H](C=O)c2c(Cl)cccc21
13046	CN1C[C@@H](C=O)C[C@H]1C=O
13047	C[C@@H](C#C/C=C/[C@H](C)C=O)C=O
13048	Cc1c2ccc(O)c(C=O)c2c(C)c2ccc(O)c(C=O)c12
13049	O=Cc1sc(C=O)c(O)c1O
13050	O=Cc1c(O)ccc2c1Oc1ccc(O)c(C=O)c1O2
13051	O=CC1=CNC(Cl)=C(C=O)C1
13052	O=C/N=c1/c2ccccc2c2nc3/c(=N\\C=O)c4ccccc4c3nc12
13053	O=Cc1cc2c3ccc(ccc1-3)CCc1ccc3c(C=O)cc(c-3cc1)CC2
13054	O=Cc1cc(-c2cc(C=O)on2)no1
13055	Cc1cc2c(cc1C)Nc1c(C=O)sc(C=O)c1N2
13056	O=C[C@]12CCC[C@@]1(C=O)CC2
13057	C/C=c1/c2c(/c(=C/C)c3c1[C@H](C)[C@H](C=O)C[C@@H]3C)[C@H](C)[C@H](C=O)C[C@H]2C
13058	CC1=CC2=C(C=O)C3(CC3)[C@](C)(O)C(=O)C2=C1C=O
13059	CC1=C(C)[C@@H]2CC=C(C=O)[C@H](C=O)[C@@]2(C)CC1
13060	O=CC[C@H]1CN(C=O)CCC1=O
13061	O=CC#Cc1ccc(C#CC=O)s1
13062	O=Cc1ccccc1-c1cc2ccc3ccccc3c2cc1C=O
13063	Cc1c(C)c(C=O)c2c(c1C)CCc1c(C=O)c(C)c(C)c(C)c1CC2
13064	Cc1c2cc(C=O)c(c1C)CCc1c(C=O)cc(c(C)c1C)CC2
13065	O=CO[C@H]1CC[C@@H]2CN3CCc4c([nH]c5ccccc45)[C@H]3C[C@@H]2[C@H]1C=O
13066	O=Cc1cccc(C=O)c1C(=O)Cl
13067	C[C@H]1Cc2c(n(C=O)c3ccccc23)-c2ncc(C=O)c(=O)n21
13068	O=C(N=CO)N=C(O)N=CO
13069	CC(O)=Nc1cc(O)c(C=O)cc1C=O
13070	O=Cc1cc2cc3cc(C=O)sc3cc2s1
13071	CC1(C)CCC[C@@](C)([C@@H]2[C@@H]3C[C@@H]4C[C@@]2(C=O)C[C@]4(C)O3)[C@@H]1C=O
13072	O=CC(=C/O)/C(C=O)=C\\O
13073	O=Cc1cc(C=O)c2c(c1O)CCC2
13074	CC(=O)[C@]1(C)[C@H](C=O)C[C@@]2(C=O)CC(C)(C)C[C@@H]12
13075	O=CC[C@H]1O[C@@H](C=O)C[C@H](O)[C@H]1O
13076	O=CN1CCN(C=O)c2ccccc2NC(S)=NCCN=C(S)Nc2ccccc21
13077	O=C[C@]12C=C[C@](C=O)(OO1)O2
13078	Cn1c(=O)n2n(c1=O)C1(C=O)CC2(C=O)C1
13079	O=C[C@@H]1/C=C\\C=C/[C@H](C=O)/C=C\\C1
13080	O=CC1=C(F)C(C=O)=C1F
13081	COc1cc(C=O)c(Br)c(C=O)c1
13082	O=Cc1ccc(C=O)c2c1C(=O)c1ccccc1-2
13083	O=Cc1ccc(C=O)c2c1=c1ccccc1=CC=c1ccccc1=2
13084	C[C@@H](C=O)N(C)C=O
13085	CC(C)(C=O)[C@H]1C[C@@H](C=O)c2ccccc21
13086	O=Cc1ccccc1C(=O)N1CCC[C@@H]1C=O
13087	CC1=C(C=O)C(C)(C)[C@H](C=O)CC1
13088	CN1C=C(C=O)C=C[C@H]1c1c(C=O)n(C)c2ccccc12
13089	C#CC1C(C=O)=CN(C(C)(C)C)C=C1C=O
13090	C/C(C#CC#C/C(C)=C(/C)C=O)=C(\\C)C=O
13091	CC1=C(C=O)C(C)(C)CC[C@H]1C=O
13092	O=CN1CCCCCCCCCCCCN(C=O)c2c(O)c(Cl)c1c(O)c2Cl
13093	O=Cc1ccc2nc3ccc4nc5ccc(C=O)cc5cc4c3cc2c1
13094	O=Cc1cc(Cl)c(Cl)c(C=O)c1
13095	N#CC1=C(c2ccc(Cl)cc2)[C@@H](C=O)S/C1=C/C=O
13096	O=Cc1cccc2ccc3c4ccccc4cc(C=O)c3c12
13097	CC(=O)O/C(C=O)=C(\\Br)C=O
13098	Cc1ccc(-c2cc(C=O)cc(C=O)c2)cc1
13099	O=Cc1sc(Cl)c(C=O)c1Cl
13100	O=Cc1ncc(CO)c(C=O)c1O
13101	O=C[C@@H]1[C@H]2CC[C@H](CC2)[C@H]1C=O
13102	O=CO[C@@H]1Cc2ccccc2N(C=O)C1
13103	CC[C@]1(C=O)CC=C(C=O)CC1
13104	O=Cc1c[nH]nc1C=O
13105	O=Cc1c[nH]c(C=O)c1Cl
13106	O=Cc1c2c(c(C=O)c3c1-c1cccc4cccc-3c14)-c1cccc3cccc-2c13
13107	O=C[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@@H]1[C@H]4C[C@@H]5C[C@H](C4)C[C@@]1(C=O)C5)(C3)C2
13108	O=C[C@H]1CCC[C@@H](C=O)CCC1
13109	O=Cc1cc2ccccc2c2c1OCOc1c(C=O)cc3ccccc3c1-2
13110	C/C(C=O)=C\\[C@H](C)C=O
13111	Cc1ccccc1C1C(C=O)=CNC=C1C=O
13112	O=C[C@H]1[C@H]2CC3=C(C[C@@H]12)C[C@H]1[C@@H](C=O)[C@H]1C3
13113	O=Cc1sc(C=O)c2c1Nc1ccccc1N2
13114	O=Cc1ccc2c(c1)[nH]c1cc(C=O)ccc12
13115	O=CC(=O)O[C@H]1CCC[C@@H]1C=O
13116	O=CC#CCCC#CC=O
13117	Cc1cc(C=O)c(C=O)o1
13118	O=CC1=C(C=O)[C@H]2C=C[C@@H]1CC2
13119	O=C[C@H]1C[C@@H]2CC[C@@]3(C(=O)CC[C@@H]13)[C@@H]2C=O
13120	C=C(C=O)[C@H]1CC[C@@H](C)[C@@H]1C=O
13121	O=Cc1c(O)cc(O)c2c1C(=O)c1c(O)cc(O)c(C=O)c1C2=O
13122	Cc1cc(C)c(-c2c(C)cc(C)c(C=O)c2C)c(C)c1C=O
13123	CC1=C(C(=O)O)[C@@H]2C=C(C=O)[C@]3(C=O)C[C@]3(C)[C@@H]2C1
13124	O=Cc1ccc2c(c1)oc1ccc(C=O)cc12
13125	C[C@@]12CC[C@@H]3[C@H]4Cc5cc(C=O)oc5C[C@@H]4CC[C@H]3[C@@H]1CC[C@@H]2OC=O
13126	O=Cc1cccc2c1-c1c(C=O)cccc1/C=C\\C/C=C\\2
13127	CO[C@@H]1[C@@H](C=O)CC[C@H]1C=O
13128	COc1cc(O)c(C=O)c(O)c1C=O
13129	C[C@@]1(C=O)[C@]2(O)CC[C@](C)(CC=O)[C@@]1(C)CC2
13130	O=C/C=C/C1=CC2=CC=CC=C3C=C(C=O)[C@H]1C[C@@H]32
13131	COc1c(C=O)cc(C=O)c(O)c1C
13132	C[C@H]1CC[C@H](C=O)[C@H](C=O)C2=CC(C)(C)C[C@H]21
13133	CN1C(Cl)=C(C=O)C(C)(C)C(C=O)=C1Cl
13134	O=Cc1cc2ccccc2c(-c2nc(C=O)cc3ccccc23)n1
13135	C=C(C)[C@H]1C[C@](C)(C=O)C[C@@]1(C)C=O
13136	C=C1C[C@](C)(C=O)[C@@H](C=O)C[C@H]1O
13137	CC(C)/C(C=O)=C\\C=O
13138	Cc1cc(-c2ccccc2)cc(C)c2c(C=O)c(C=O)cc1-2
13139	O=C[C@H]1[C@@H]2[C@H](C=O)[C@H]12
13140	CCc1cccc2c(C=O)c(C=O)oc12
13141	O=CC1=C(C=O)SC(=C2SC3=C(SCCS3)S2)S1
13142	Cc1cc(Cl)c2[nH]c(C=O)c(C=O)c2c1
13143	O=CC1=CC(=C2C=CC=CC=C2)C=C1C=O
13144	CCc1cc(C=O)c(C=O)cc1O
13145	C[C@H]1CC[C@H]([C@@H](C)C=O)[C@H]1C=O
13146	O=C[C@@H](O)[C@H](O)C=O
13147	O=CC1=S=C(C=O)c2cc3ccccc3cc21
13148	COC(C#CC=O)(C#CC=O)c1ccc(C(C)(C)C)cc1
13149	O=Cc1nnc2ccccc2c1C=O
13150	O=CC1=C(C2=C(C=O)CCC2)CCC1
13151	O=Cc1cc(C=O)c2ccc(O)nc2n1
13152	O=Cc1cnc2c(C=O)c3cccccc3n2c1=O
13153	O=Cc1ccc2ccoc2c1N1CCN(C=O)CC1
13154	CC(C)(C)OC(=O)n1c2cc(C=O)ccc2c2ccc(C=O)cc21
13155	O=Cc1ccc2ccc3c(C=O)ccc4ccc1c2c43
13156	COc1cccc2c1CC[C@H]1[C@@](C)(C=O)CCC[C@]21C=O
13157	O=Cc1cc(C=O)c(N2CCNCC2)o1
13158	COC(=O)C1=C(C)C[C@H]2[C@@H]1C=C(C=O)[C@]1(C=O)C[C@]21C
13159	CC1(C)CCC[C@@]2(C)[C@H]1CC=C(C=O)[C@@H]2CC=O
13160	CC1(C)OCc2c(C=O)cnc(C=O)c2O1
13161	O=Cc1cc(Br)c(-c2oc(C=O)cc2Br)o1
13162	O=CN1C=C([C@H]2CCCCCN2C=O)CCC1
13163	C[C@@H]1CC[C@@H]2C(C)(C)[C@H](O)[C@H](O)C[C@]2(C)[C@@]12Cc1c(O)cc(C=O)c(C=O)c1O2
13164	O=CC[C@]12CCCN3CC[C@H]4c5ccccc5N(C=O)[C@@]4(CC1)[C@@H]32
13165	O=C[C@H]1CCCC/C1=C1\\CCCC[C@H]1C=O
13166	O=Cc1[nH]c2ccc(Br)cc2c1C=O
13167	C=C1C[C@@H](C=O)C(C=O)=C2CC(C)(C)C[C@H]2[C@@H]1OC(C)=O
13168	CC1(C)CC2=C(C=O)[C@@]3(C=O)C[C@@]3(C)[C@@H](O)[C@@]2(O)C1
13169	CN1CCCc2cc(C=O)cc(C=O)c21
13170	Cc1c(C=O)cc(C=O)n1C
13171	O=C[C@@H]1CO[C@H](C=O)O1
13172	Cc1[nH]c2c(c1C=O)Sc1[nH]c(C)c(C=O)c1S2
13173	Cc1cc2c(ccc3sc(C=O)c(-c4c(C=O)sc5ccc6sc(C)cc6c45)c32)s1
13174	O=Cc1ccc(O)c(C=O)c1I
13175	CCn1c(C)c(C=O)c(C=O)c1C
13176	Cc1cc(C)c2cc(C=O)c(C=O)c-2c(C)c1
13177	CC1(C)C(C=O)=C(Cl)NC(Cl)=C1C=O
13178	CC(C)(C=O)/C=C/C=O
13179	O=Cc1cccc2c1[C@H]1c3cccc(C=O)c3[C@@H]2[C@H]2Cc3cc4ccccc4cc3C[C@@H]21
13180	O=Cc1cc(C=O)c(N2CCCC2)o1
13181	O=Cc1cccc2c1[C@H]1c3cc4ccccc4cc3[C@@H]2c2c(C=O)cccc21
13182	Cc1cc(C)cc2c(C=O)cc(C=O)c-2c1
13183	Cc1[nH]c2c(c1C=O)C(Cl)=C(C=O)CC2
13184	C#CC1C(C=O)=CN(C(C)=O)C=C1C=O
13185	C[C@@H]1[C@@H](O)C[C@H]2C(C)(C)[C@H](O)CC[C@]2(C)[C@@]12Cc1c(O)cc(C=O)c(C=O)c1O2
13186	C/C(C#C/C(C)=C(\\C)C=O)=C(/C)C=O
13187	O=Cc1c2cccc(F)c2c(C=O)c2cccc(F)c12
13188	N#C/C(C=O)=C/CC=O
13189	C=Cc1c(C=O)[nH]c(C=O)c1C
13190	O=Cc1ccc(C=O)c2c1Oc1ccccc1O2
13191	CC(=O)O[C@H]1CC[C@H]2[C@@H]3C=Cc4c(cc(C=O)c(Cl)c4C=O)[C@H]3CC[C@@]12C
13192	O=C/C=C\\C(O)=C\\C=O
13193	O=Cc1ccc2c(c1)CC[C@H]1CCc3cc(C=O)ccc3[C@@H]21
13194	O=CC1=C(C=O)C2=C/C=C(\\C=C/1)CCc1ccc(cc1)CC2
13195	C#CC1C(C=O)=CN(C2CCCCC2)C=C1C=O
13196	O=CC12CCC(C=O)(C1)C2
13197	O=Cc1ccc2c(c1)C(=O)c1cc(C=O)ccc1C2=O
13198	Cn1c(Cl)c(C=O)c2cc(C=O)ccc21
13199	O=CN1CCC[C@@H]([C@@H]2CCCCN2C=O)C1
13200	C#CC1C(C=O)=CN(c2nc(C)cc(C)n2)C=C1C=O
13201	C[C@H]1C=C(C=O)C(C=O)=C[C@H]2CC(C)(C)C[C@H]21
13202	C[C@@H]1CCC[C@]2(C)[C@@H](C=O)C(C=O)=CC[C@H]12
13203	C/C=C1/CN2CC[C@]34c5ccccc5N(C=O)[C@H]3[C@H](C=O)C1C[C@H]24
13204	Cc1ccc(C)c2c1[C@@H](C=O)c1ccccc1[C@H]2C=O
13205	CC(C)(C)c1ccc(C=O)c(C=O)c1
13206	Cc1c(C=O)ccc(C=O)c1C
13207	O=Cc1c(-c2ccccc2)c(C=O)n2c1sc1ccccc12
13208	O=C[C@H]1CCC[C@H](C=O)[C@@H]2COC[C@H]12
13209	O=Cc1sc(-c2cc(C#Cc3ccccc3)c(C=O)s2)cc1C#Cc1ccccc1
13210	O=C/C=C/c1cc2cccccc-2c1C=O
13211	CC(=O)Oc1c(C=O)cc(C)cc1C=O
13212	O=CC1=C(C=O)C(F)=C1F
13213	C#CC1C(C=O)=CN(c2cccc(C)c2)C=C1C=O
13214	Cc1c(C=O)n(C=O)c2c(C)cc(Cl)cc12
13215	C#CC1C(C=O)=CN(CC)C=C1C=O
13216	O=Cc1c(Br)sc(Br)c1C=O
13217	CN(C)c1cc(Cl)c(C=O)cc1C=O
13218	O=CC12CCCC(C=O)(C1)C2
13219	O=C/C=C/C=O
13220	O=C[C@H]1CC[C@H](C=O)S1(=O)=O
13221	O=CN1c2ccccc2[C@]2(O)C[C@@H](C(=O)O)N(C=O)[C@H]12
13222	O=Cc1cc(C=O)c2ccc3cccc4ccc1c2c43
13223	O=Cc1ccc(I)c(C=O)c1O
13224	O=CC#CC1(C#Cc2ccccc2C#CC2(C#CC=O)OCCCO2)OCCCO1
13225	O=C[C@@H]1C[C@H]([C@@H]2CCC(=O)[C@H](C=O)C2)CCC1=O
13226	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)[C@@H](C=O)C[C@H]3C)[C@H](C)[C@H](C=O)C[C@H]2C
13227	O=Cc1ccccc1-c1cc2c(ccc3ccccc32)nc1C=O
13228	COc1c(C)c2c(c(C=O)c1Cl)Oc1c(C=O)c(O)c(Cl)c(C)c1C(=O)O2
13229	O=CC1=C[C@@H]2C=C(C=O)[C@@H]3C=C[C@H]1[C@H]23
13230	CC/C(C=O)=C\\C=O
13231	O=Cc1oc(CCl)c(C=O)c(=O)c1O
13232	C#CC1C(C=O)=CN(c2cccc3ccccc23)C=C1C=O
13233	CC(O)=Nc1sc(C=O)cc1C=O
13234	O=C[C@]1(Cl)[C@H]2CC=CC[C@H]2[C@@](Cl)(C=O)[C@@H]2CC=CC[C@H]21
13235	Cc1c2cc(C=O)c(c1C)CCc1cc(C=O)c(c(C)c1C)CC2
13236	C#CC1C(C=O)=CN(c2cc(C)cc(C)c2)C=C1C=O
13237	C[C@H]1CN(C=O)CCN1C=O
13238	CC(C)[C@H]1CC[C@@]2(C)[C@@H](C=O)[C@@H]1[C@@H](C=O)[C@]2(C)O
13239	C=C(C=O)[C@@H]1CC[C@@]2(C)CCCC(C=O)=C2C1
13240	O=Cc1cc2ccc3[nH]cc(C=O)c3c2[nH]1
13241	O=CC/C=C1/C=CC=C1C=O
13242	CC(C)(C#C/C=C\\C#CC(C)(C)C=O)C=O
13243	Cc1ccc(C)c2cc(C=O)c(C=O)cc12
13244	O=Cc1nc2ccccc2cc1N=CO
13245	CC1(C)C[C@H]2[C@H](C[C@H](C=O)[C@]3(C=O)C[C@]23C)C1
13246	CC(C)(C=O)[C@H]1CCC[C@H]1C=O
13247	O=C[C@@]12[C@@H]3C[C@H]4[C@H]5[C@@H]3[C@@H]3C[C@H]5[C@]5([C@H]6C=C[C@H](C=C6)[C@]315)[C@]42C=O
13248	O=Cc1c[nH]c2ccc(-c3[nH]c4ccccc4c3C=O)cc12
13249	CC1(C)C[C@H]2C[C@@]3(Oc4c(C=O)c(O)c(C=O)c(c42)O1)[C@H]1CC[C@H](C1)C3(C)C
13250	CN1C=C(C=O)CC(C=O)=C1
13251	O=CO[C@H]1Oc2ccccc2C(=O)N1C=O
13252	C/C(C#C/C(C)=C\\C=O)=C/C=O
13253	Cc1cc(N(C)C)c(C=O)cc1C=O
13254	O=C[C@H]1C(c2ccccc2)[C@@H]1C=O
13255	O=Cc1cc(C=O)c2ccccc2c1Cl
13256	O=Cc1cc(C=O)c2c(c1)CCCCC2
13257	O=Cc1ccc(-c2ccc(C=O)o2)o1
13258	O=Cc1cccc2c1[C@H]1c3ccccc3[C@@H]2c2c(C=O)cccc21
13259	O=Cc1cc(Br)c(C=O)s1
13260	C[C@]12CC[C@H]3[C@@H](CC[C@@]4(/C=C/C=O)CC(=O)CC[C@@]34C)[C@@H]1CC[C@@H]2C=O
13261	CC1=C(C=O)[C@@H]2[C@H](C(C)C)CC[C@@]1(C)[C@@H]2C=O
13262	C[C@]12OO[C@H](O1)[C@H]1C[C@@H](C=O)[C@@H](C=O)[C@H]12
13263	O=Cc1ccc2c(ccc3cc(-c4ccccc4)c(C=O)cc32)c1
13264	O=CC1=C(Cl)NC(Cl)=C(C=O)C1c1cccc(C(F)(F)F)c1
13265	C[C@]12CCC=C(C=O)[C@@]1(C=O)C2
13266	O=Cc1c2ccccc2c(C=O)c2ncccc12
13267	C[C@@H]1CC[C@@H](C=O)[C@H]1C=O
13268	Cc1cc2ccccn2c2c(C=O)cc(C=O)c1-2
13269	CO[C@@]12OO[C@@H](O1)[C@@H]1C[C@H](C=O)[C@H](C=O)[C@@H]12
13270	CC[C@@]1(C=O)CCCN2CCc3c(n(C=O)c4ccccc34)[C@H]21
13271	Cc1cc(-c2cc(C)c(C=O)s2)sc1C=O
13272	CC(O)=Nc1c(C=O)c2cccccc-2c1C=O
13273	O=CC1=C(C=O)[C@@H]2C=C[C@@H]3[C@H]1[C@@H]3C=C2
13274	C[C@]1(C=O)CC[C@@H](CC=O)C1=O
13275	C[C@H]1CC[C@H](C=O)O[C@@H]1[C@H]1O[C@@H](C=O)CC[C@@H]1C
13276	O=CC1=Cc2ccccc2N(C=O)c2ccccc21
13277	Cc1c2ccc(O)c(C=O)c2cc2ccc(O)c(C=O)c12
13278	COc1c(C)c(O)c(C=O)c(C=O)c1O
13279	O=Cc1c(Cl)sc(Cl)c1C=O
13280	CC1(C)C(C=O)=C(Cl)CC(Cl)=C1C=O
13281	COc1cc2c(cc1C=O)[C@]1(C)CC[C@@]3(C)C(Cl)=C(C=O)CC[C@@]3(C)[C@@H]1CC2
13282	O=C[C@@H]1c2ccccc2[C@@H]2[C@H]1[C@H]2C=O
13283	O=C[C@H]1C[C@H]1[C@H]1C[C@H]1C=O
13284	O=Cc1ccc2sc(C=O)nc2c1
13285	CC1(C)[C@@]2(C)N=N[C@]1(C)[C@H](C=O)[C@@H]2C=O
13286	O=Cc1cc(C=O)c2ccc3cccc4ccc1n4-n32
13287	O=C[C@H]1c2ccccc2[C@@H](C=O)c2cc(Cl)ccc21
13288	O=Cc1ccc2ccc(C=O)nc2c1
13289	Cc1ccc(-c2nc3c(C=O)c4cccccc4n3c2C=O)cc1
13290	C[C@]12CCC(=O)C=C1CC[C@H]1[C@@H]2[C@H](O)C[C@]2(C=O)[C@@H](C(=O)C=O)CC[C@H]12
13291	Cc1ccc2c(ccc3c(C=O)c(C)c(C=O)n32)c1
13292	Cc1c(C=O)cc(C=O)c(O)c1C
13293	O=Cc1ccc2c(c1-c1c(C=O)ccc3c1C(=O)c1cc(Cl)ccc1C3=O)C(=O)c1cc(Cl)ccc1C2=O
13294	O=C/C1=C/C2=C/C3=C/C4=CC=CC=C(/C=C(/C=C(/C=C(/C=O)C1)C2)C3)C4
13295	CC1(C)[C@H](C=O)[C@]2(C#N)C[C@@]1(C#N)[C@@H](C=O)C2(C)C
13296	O=C[C@@H]1C[C@@H]2C(=O)[C@@H](C=O)C[C@@H]2C1=O
13297	CC1(C)CC[C@H](O)[C@@]2(C)[C@H]1CC=C(C=O)[C@@H]2C=O
13298	N#Cc1ccc(C=O)c(C=O)c1
13299	O=Cc1cc2cccc3cccc(cc1C=O)c32
13300	O=Cc1cc(-c2cc(C=O)c3ccccc3n2)nc2ccccc12
13301	CC(C)(C)S(=O)(=O)c1c(C=O)cccc1C=O
13302	O=CC1=C(Cl)NC(Cl)=C(C=O)C1c1ccccc1
13303	O=Cc1ccc(-c2ccc(C=O)s2)[nH]1
13304	CCn1c(Cl)c(C=O)c2cc(C=O)ccc21
13305	C#CC1C(C=O)=CN(C)C=C1C=O
13306	COc1c(O)c(C=O)c(Br)c(C=O)c1O
13307	C=C1CC[C@H]2[C@@](C)(C=O)CCC[C@]2(C)[C@H]1CC=O
13308	O=CN1N=C(N=CO)SC12CCCCC2
13309	O=CC1=COC=C(C=O)C1/C=C\\Cl
13310	O=Cc1ccc2nc3c(ccc4cc5cc(C=O)ccc5nc43)cc2c1
13311	CN(C=O)/C(C=O)=C/O
13312	C/C=C1/CN(C=O)[C@H]2C[C@@H]1[C@@H](C(=O)OC)[C@@]13C[C@@H](O)O[C@@]21N(C=O)c1ccccc13
13313	CC(=O)O[C@H]1[C@@H]2CC(C)(C)CC2=C(C=O)[C@]2(C=O)C[C@]12C
13314	O=CN1C=C([C@@H]2CCCN2C=O)CC1
13315	Cc1c2ccc3c(C=O)cc(ccc4cc(C=O)c5ccc(cc2)c(C)c5c4C)c(C)c13
13316	O=Cc1cc(C=O)c2c(c1)CCCC2
13317	C[C@H]1C[C@H](O)[C@@H](CC=O)[C@H]1C=O
13318	Cc1ccc(-c2c(C=O)c(C=O)c(Cl)n2C)cc1
13319	O=Cc1c(O)cc2c(c1O)C(=O)c1cc(O)c(C=O)c(O)c1C2=O
13320	O=C/C=C/[C@@H](I)C=O
13321	O=Cc1ccc2c(c1)C(=O)c1cccc3c(C=O)ccc-2c13
13322	C[C@@]1(O)c2ccoc2[C@@H](O)[C@@](C)([C@@]2(O)CCCC[C@@H]2C=O)[C@H]1C=O
13323	O=C/C=C/C(O)=C\\C=O
13324	O=Cc1ccnc(C=O)c1
13325	O=C[C@H]1[C@H]2CC=CC[C@@H]2[C@H](C=O)[C@@H]2CC=CC[C@@H]12
13326	O=Cc1ccc(C(F)(F)F)cc1-c1cc(C(F)(F)F)ccc1C=O
13327	Cc1cc(C)c(-c2c(C)cc(C)cc2C=O)c(C=O)c1
13328	O=CC#Cc1cccc2cc3cccc(C#CC=O)c3cc12
13329	O=Cc1ccc2cc1CCc1ccc(C=O)c(c1)CC2
13330	CC1=C2C=C(C=O)S[C@]2(C)[C@]2(C)SC(C=O)=CC2=C1C
13331	O=CC1=C(C=O)CC1
13332	C[C@H]1CC[C@H]2C(C)(C)[C@H](O)CC[C@@]2(C)[C@]12Cc1c(O)cc(C=O)c(C=O)c1O2
13333	O=CC1=C(C=O)Sc2sc(=O)sc2S1
13334	O=Cc1ccc(N2CCN(C=O)CC2)cc1Cl
13335	Cc1ccc(-c2cc(C=O)cc(C=O)c2C)cc1
13336	CO[C@@H]1[C@@H](C=O)[C@H]2C[C@H]2[C@H]1C=O
13337	C[C@@H](C=O)[C@@H]1CCC=C1C=O
13338	O=CC1=CC2=Nc3ccccc3N=C3C=C(C=O)[C@H]1C[C@@H]32
13339	Cc1cc2cc(C=O)c1CCc1c(C)cc(cc1C=O)CC2
13340	CC1(C)CCC[C@@]2(C)[C@H]1C(=O)C=C(C=O)[C@]2(O)C=O
13341	O=CN1CCN(C=O)c2ccccc2NC(S)=NCCCN=C(S)Nc2ccccc21
13342	C/C(C=O)=C\\c1ccc(C=O)cc1
13343	COc1c(C=O)cc(C(F)(F)F)cc1C=O
13344	O=CC1=CC=CC2=CC=CC(C=O)=C1C2
13345	Cc1sc(C=O)cc1C=O
13346	CC(C)(C)Sc1cc(O)c(C=O)cc1C=O
13347	CC1(C)C[C@H]2[C@H](C=C(C=O)[C@]3(C=O)C[C@]23C(=O)OC(C)(C)C)C1
13348	C[C@]1([C@H]2CC[C@@]3(C)[C@H](CC[C@]3(C)O)[C@@H]2C=O)C=CC(=O)C=C1C=O
13349	Cc1cc(Cl)c2c(c1)c(C)c(C=O)n2C=O
13350	CC1=C(C=O)[C@@](C)(C=O)c2ccccc21
13351	O=Cc1ccccc1-c1cc2c(ccc3ccccc32)cc1C=O
13352	O=CC1=CCC=C1C=O
13353	O=Cc1ccnc(-c2nccc(C=O)c2O)c1O
13354	O=C/C1=C/C2=CC=CC=C(/C=C(/C=O)CC1)C2
13355	C[C@H]1CC[C@H](CC=O)[C@@H]1C=O
13356	CN1C=CC(=C2C=C(C=O)S(=O)(=O)C(C=O)=C2c2ccccc2)C=C1
13357	CC1(C)O[C@@H](C=O)[C@H]2[C@H](C(=O)C=O)C(=O)c3ccccc3[C@@]2(C)O1
13358	C[C@@]12C=C(C=O)[C@](O)(C=O)C[C@H]1CCCC2
13359	Cc1cc(=O)oc2c(C=O)c(O)c(CC=O)cc12
13360	Cn1c(=O)nc(O)c2nc(C=O)c(C=O)nc21
13361	O=Cc1cn(-c2ccccc2)cc1C=O
13362	C[C@]1(C=O)CCCC[C@]1(C)CC=O
13363	O=Cc1nc(-c2csc(C=O)n2)cs1
13364	CC1=C[C@H]2OC=C(C=O)[C@](C)(C=O)[C@H]2[C@H](CO)C1
13365	O=CO[C@@H]1C[C@@H]1C=O
13366	O=Cc1c(-c2ccc(Cl)cc2)c(C=O)n2c1sc1ccccc12
13367	O=Cc1cnc2c(C=O)sc3cccc1-n-3-2
13588	O=C/C=C/c1ccccc1C=O
13368	O=CC1=C[C@@H]2[C@@H]3C=C[C@H]1C=C(C=O)[C@@H]32
13369	CC1=C(C=O)C(C)(C)[C@]2(CC1)OC(C)(C)O[C@H]2[C@@H]1CCCC[C@H]1C=O
13370	O=Cc1cc(C=O)c(N2CCOCC2)o1
13371	O=CC(=C\\O)/C(C=O)=C\\O
13372	Cc1c(C=O)c(-c2ccccc2C=O)cc2ccccc12
13373	Cn1c(Cl)c(C=O)c(C=O)c1N1CCCCC1
13374	O=CC1=C2c3cc4c(cc3CCN2[C@H]2O[C@@H]1N1CCc3cc5c(cc3C1=C2C=O)OCO5)OCO4
13375	O=Cc1cc(Cl)c2c(c1-c1c(C=O)cc(Cl)c3c1C(=O)c1ccccc1C3=O)C(=O)c1ccccc1C2=O
13376	O=CN1C=C([C@@H]2CCCN2C=O)CCC1
13377	O=Cc1c(Cl)c2ccccc2n1C=O
13378	O=C[C@H]1CC12C[C@@H]2C=O
13379	CC(C)(C)N(C=O)/C=C\\C=O
13380	O=C[C@H]1[C@H]2C=C[C@H](CC2)[C@H]1C=O
13381	O=Cc1c(C(=O)N=CO)ccc2c1Oc1ccccc1O2
13382	Cc1cc(C=O)oc1C=O
13383	Cc1cc(C(C)(C)C)cc(C)c2c(C=O)c(C=O)cc1-2
13384	O=Cc1oc2c(Cl)cccc2c1C=O
13385	C[C@H]1C[C@@H](C=O)CC[C@H]1C=O
13386	N#Cc1c2cccccc-2c(C=O)c1C=O
13387	O=C[C@@H]1C[C@@H](C=O)[C@@H]2CCC[C@H]12
13388	O=CC1=C(Cl)C(=CN2CCOCC2)C(Cl)=C(C=O)C1
13389	CC(C)(C)n1cc(C=O)c(C=O)c1
13390	CC1(C)CCC[C@]2(C)[C@H](C=O)C(C=O)=CC[C@H]12
13391	O=Cc1c2ccc(ccc3ccc(o3)c(C=O)c3ccc(ccc4ccc1o4)o3)o2
13392	O=CN1N=C(N=CO)S[C@@H]1c1ccccc1
13393	CC(C)(C)N1CN(C=O)CN(C=O)C1
13394	COc1cc(C#CC=O)c(OC)cc1C#CC=O
13395	O=C[C@H]1OC2(CCCCC2)O[C@H]1[C@@H]1OC2(CCCCC2)O[C@@H]1C=O
13396	C=C1[C@H](C)CC[C@]2(C)[C@@H]1CC=C(C=O)[C@]2(O)C=O
13397	O=C/C=C\\C=C(\\O)C=O
13398	CC1(C)C[C@@H]2[C@@H]3O[C@@](C)(CC(C=O)=C3C=O)[C@@H]2C1
13399	Cc1c(C=O)ccc2c(C=O)cccc12
13400	O=CC[C@H]1Cc2c(C=O)c(O)c3ccccc3c2O1
13401	CCc1cc(C=O)c(C)c(C=O)c1
13402	CC1=C(C=O)[C@@H]([C@H](C)C=O)CC1
13403	O=Cc1c2c(c(C=O)c3ccccc13)-c1cccc3cccc-2c13
13404	C[C@]12CCC[C@@](C)(C=O)[C@@H]1CC[C@@]1(C=O)OC(=O)CC[C@H]21
13405	CC1(C)C=C(C=O)C(Cl)=C(C=O)C1
13406	O=Cc1ccc(C=O)n1[C@H]1CCOC1=O
13407	CC(C)(C)Oc1cc(C=O)sc1C=O
13408	O=Cc1cccc2sc3cccc4cc(C=O)n(c12)c43
13409	Cn1c(Cl)c(C=O)c(C=O)c1-c1ccccc1
13410	C/C(C#C/C(C)=C(/C)C=O)=C(\\C)C=O
13411	C/C(C#CC#C/C(C)=C(\\C)C=O)=C(\\C)C=O
13412	O=CN1CCCCCCCCCCCCN(C=O)C2=C(Cl)C(=O)C1=C(Cl)C2=O
13413	Cn1cc(C=O)c2nc3c(C=O)cnc(O)c3c(-c3ccccc3)c2c1=O
13414	O=Cc1cc(C=O)c(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)s1
13415	N#Cc1ccc2c(C=O)cnc3c(C=O)sc1-n-2-3
13416	O=CC1=C(C=O)[C@H]2C=C[C@@H]1C2
13417	OC=NN=CO
13418	CC1(C)C(=O)[C@@H](C=O)[C@H](C=O)C1=O
13419	O=C/C=C/c1cccc(C=O)c1
13420	O=CC1=C2NC(Cl)=C(C=O)C(=O)N2CCC1
13421	C[C@H]1C=C(C=O)[C@@H](C=O)[C@@H](O)[C@@H]2CC(C)(C)C[C@H]12
13422	CC(C)(C)S(=O)(=O)c1cc(C=O)sc1C=O
13423	CC(=O)[C@@H]1C(C)(C)C[C@@]2(C)C[C@H](C=O)C[C@@]12C=O
13424	O=Cc1ccc2ccc3ccc4ccc5ccc6ccc(C=O)cc6c5c4c3c2c1
13425	O=Cc1sc(C=O)c2c1ncc1sccc12
13426	O=CC[C@H]1CCn2c1c(C=O)c1cc3c(cc1c2=O)OCO3
13427	C#CC1C(C=O)=CN(c2ncccn2)C=C1C=O
13428	O=C/C=C\\c1cccc(C=O)c1
13429	Cc1nc2ccccc2c(C=O)c1C=O
13430	O=Cc1ccc2c(c1)C1(CC2)CCc2ccc(C=O)cc21
13431	Cc1c(C=O)ccc(O)c1C=O
13432	Cc1ccc2c(C=O)cccc2c1C=O
13433	CCc1c(O)c(C=O)cc(C=O)c1O
13434	O=Cc1ccc(C=O)n1-c1ccccc1
13435	O=CC1=CC[C@H](C=O)CC1
13436	Cc1c(C=O)n(C=O)c2c(C)cc(Br)cc12
13437	O=Cc1c2c(cc3c1CC1(C3)Cc3cc4c(c(C=O)c3C1)CCCC4)CCCC2
13438	CCN1c2cccc(C=O)c2Sc2cccc(C=O)c21
13439	O=Cc1c(O)nc2c(ccc3c(O)c(C=O)c(O)nc32)c1O
13440	O=Cc1cc(C=O)c2c(c1Cl)CCCC2
13441	COc1c2oc(C=O)c(Cl)c2cc2c(Cl)c(C=O)oc12
13442	O=Cc1cccc2c1Oc1c(C=O)cccc1N2
13443	O=Cc1cc2c(cc1C=O)CCC2
13444	O=Cc1nnn(-c2ccc(Br)cc2)c1C=O
13445	O=C/N=c1/c2ccccc2c2nc3c(nc12)/c(=N/C=O)c1ccccc13
13446	O=CC1=CS/C(=C2/SC=C(C=O)S2)S1
13447	O=CN1CC(Br)CN1C=O
13448	CN1C=C(C=O)C=C[C@@H]1c1c(C=O)[nH]c2ccccc12
13449	O=CC1=CN=C2C(C=O)=S=C3N=C(C(F)(F)F)C=C1N23
13450	CC(=O)O[C@H]1CC[C@@H]2C[C@]2(C=O)[C@@H]1C=O
13451	C=C1CC[C@H]2[C@@H]([C@@H](C(=C)C=O)[C@@H]1C=O)C2(C)C
13452	CC(=O)O[C@H]1C[C@@H](C)[C@H](C=O)[C@@]2(O)[C@@H]1C(C)(C)C[C@]2(C)C=O
13453	CC(C)c1cc(C=O)c(Cl)c(C=O)c1
13454	O=Cc1c2cccccc-2cc1-c1cc2cccccc-2c1C=O
13455	O=CC1=C(C=O)[C@@H]2O[C@H]1C1=C2[C@H]2C=C[C@@H]1CC2
13456	Cc1cc2c(cc1C=O)[C@@H]1c3ccccc3[C@H]2c2ccc(C=O)cc21
13457	O=Cc1ccc(-c2ccccc2)c(C=O)c1O
13458	O=C[C@@H]1C[C@H](CO)[C@H](C=O)O1
13459	CC1(C)CCC(C)(C)c2cc(C=O)c(C=O)cc21
13460	O=Cc1c[nH]c2ccc3c(ccc4[nH]cc(C=O)c43)c12
13461	O=Cc1cc(C=O)c(Cl)[nH]1
13462	Cc1cc2c(cc1C=O)[C@@H]1c3ccccc3[C@H]2c2cc(C=O)ccc21
13463	O=Cc1coc(-c2ccc3c(c2)OCO3)c1C=O
13464	CC(C)(C)[C@@H]1CN(C=O)c2ccccc2N1C=O
13465	O=C[C@@H]1[C@H](c2ccccc2)C[C@H](C=O)[C@]23OCCO[C@]12OCCO3
13466	CC(=O)O[C@H]1CC[C@]2(C)C[C@]2(C=O)[C@@H]1C=O
13467	O=CC1=CC=CC=C(c2cc3cccccc-3c2C=O)C1
13468	O=CCN1CC[C@H](O)[C@@H]1C=O
13469	C=C1COC(=O)c2c(C=O)cc3ccccc3c2-c2c(c(C=O)cc3ccccc23)C(=O)OC1
13470	COc1c(C=O)c2c3c(c1C=O)O[C@]1(C[C@@H]3CC(C)(C)O2)[C@H]2CC[C@H](C2)C1(C)C
13471	COc1cc(C=O)c(C=O)c2c1C[C@@]1(O2)[C@H](C)CC[C@@H]2C(C)(C)C=CC[C@@]21C
13472	Cc1cc(C=O)c(C)c2c1[nH]c1ccc(N(C)C)c(C=O)c12
13473	O=C/C(=C/O)c1[nH]nc(Cl)c1C=O
13474	O=Cc1ccc2c(ccc3nc(C=O)ccc32)n1
13475	O=Cc1cccc2c1[C@H]1c3ccccc3[C@@H]2c2cccc(C=O)c21
13476	O=C[C@H]1[C@@H]2CC[C@@H](c3ccccc32)[C@H]1C=O
13477	Cc1cc(O)cc(C=O)c1-c1c(C)cc(O)cc1C=O
13478	CC1(C)C(=O)[C@@H]2O[C@@H]2[C@@]2(C)[C@@H](C=O)C(C=O)=CC[C@@H]12
13479	Cc1cc2c(cc1C=O)CC1(C2)Cc2cc(C)c(C=O)cc2C1
13480	CC1=C(C=O)[C@H](CC=O)CC1
13481	Cc1cc(N(C)C)c(C=O)c(C)c1C=O
13482	O=Cc1ccc(N2CCN(C=O)CC2)c2occc12
13483	O=Cc1c(O)cc(Cl)c(C=O)c1O
13484	C[C@@]12C(=O)[C@](C)(C(=O)C(C=O)=C1O)[C@@]1(C)C(=O)[C@]2(C)C(=O)C(C=O)=C1O
13485	O=C/C1=C(\\Cl)CCC/C(Cl)=C(/C=O)C1
13486	O=CC[C@H]1C(=O)O[C@H]2CC[C@H](C=O)[C@H]21
13487	COC(=O)[C@H]1CCC[C@@](C)(C=O)[C@@H]1C=O
13488	O=CC1=CC=CC=C2C(C=O)=CC=CC=C12
13489	O=C/C=C/C(=O)C=O
13490	Cc1ccc2cc(-c3ccccc3C=O)c(C=O)c3c2c1CC3
13491	Cc1cc(C=O)c(C)c2c1ccc1ccc3ccc4c(C)cc(C=O)c(C)c4c3c12
13492	O=C[C@H]1CC/C=C\\CC/C=C\\CC[C@@H]1C=O
13493	O=C[C@@H]1[C@@H]2C=C[C@@H](C2)[C@H]1C=O
13494	CC(=O)O[C@@H]1[C@@H](C=O)[C@@]2(C=O)C[C@@]2(C)[C@H]2CC(C)(C)C[C@@H]12
13495	O=CO[C@H]1[C@@H](C=O)[C@H]2[C@@H]1CC[C@H]2O
13496	C[C@H]1CCC[C@](C)(C=O)CCC2=C1[C@](C)(CC=O)CC2(C)C
13497	N#C/C(C=O)=C\\CC=O
13498	CC1=C(C=O)[C@@]2(C)[C@@H](OC=O)CC[C@@H](C)[C@@H]2[C@H]2OC(C)(C)O[C@@H]12
13499	O=CC[C@H]1CCc2cccc(C=O)c21
13500	C/C=c1/c2c(/c(=C\\C)c3c1[C@H](C)[C@H](C=O)C[C@H]3C)[C@H](C)C[C@H](C=O)[C@H]2C
13501	O=CC[C@H]1[C@H]2CC[C@H](C2)[C@H]1C=O
13502	O=CC1=C/C(=C/O)C(Cl)=C(C=O)C1
13503	O=C/C(=C\\O)c1[nH]nc(Cl)c1C=O
13504	O=C[C@H]1[C@H](C=O)C12c1ccccc1-c1ccccc12
13505	C/C(C=O)=C\\c1ccc(C=O)o1
13506	CC1(C)C/C=C(/C=O)CC/C=C(/C=O)C[C@@H]2O[C@@H]21
13507	C/C(C=O)=C/[C@H](C)C=O
13508	O=CC1=CC=c2c3c(c4cccc5cccc2c54)C=CC(C=O)=C1C3
13509	O=Cc1c(C=O)n(-c2ccccc2)c2ccccc12
13510	O=Cc1c[nH]c(-c2nc(C=O)c[nH]2)n1
13511	CC1=C(C=O)C=C(C=O)/C1=C\\O
13512	CC1=CC[C@H]([C@@H](C)C=O)[C@@H]1C=O
13513	C[C@@H]1CC[C@]2(C)C(C=O)=CCC[C@H]2[C@]1(C)CC=O
13514	O=Cc1ccc2c(c1-c1c(C=O)ccc3c1-c1ccccc1-3)-c1ccccc1-2
13515	O=Cc1[nH]c(C=O)c(Br)c1Br
13516	O=C[C@H]1c2ccccc2[C@@H](C=O)c2cc3ccccc3cc21
13517	COc1c(O)cc(C=O)c(C=O)c1O
13518	CCc1c(C=O)cc(C)cc1C=O
13519	O=Cc1nnn(-c2ccc(Cl)cc2)c1C=O
13520	O=C[C@H]1C[C@@H](C=O)c2c1ccc1cc[nH]c21
13521	Cc1c(C=O)c2sccn2c1C=O
13522	Cc1c(C=O)n(C=O)c2ccc(Cl)cc12
13523	Cc1ccc(C=O)c(C)c1C=O
13524	CC[C@]12C3=CC=C1C(C=O)=C(C=O)C2=CC=C3
13525	O=Cc1c(Cl)cc(Cl)c(C=O)c1Cl
13526	O=Cc1ccnc(-c2nccc(C=O)n2)n1
13527	O=Cc1ccccc1-c1cc2sc3ccccc3c2cc1C=O
13528	O=Cc1ccc2nc(C=O)cn2c1
13529	O=CC1=C(C2=C(C=O)CCCCC2)CCCCC1
13530	Cc1cc(Br)c2[nH]c(C=O)c(C=O)c2c1
13531	O=CC1=NNc2c(C=O)nn(-c3ccccc3)c2O1
13532	O=CC1=C[C@H]2[C@H]3C=C[C@@H]1C(C=O)=C[C@@H]23
13533	O=C[C@@H]1C[C@@H]2[C@@H]3OO[C@@H](O3)[C@@H]2[C@@H]1C=O
13534	O=Cc1ccc(Cl)cc1-c1cc(Cl)ccc1C=O
13535	O=C/C(=C/O)N=CO
13536	C[C@]12C[C@H]3[C@H]4C[C@H]1[C@@H](C[C@@]4(C)NN3C=O)N(C=O)N2
13537	O=CC1=C(Br)[C@@H](C=O)CCC1
13538	Cc1c(C=O)c2cc(c1C=O)CCc1cccc(c1)CC2
13539	Cc1cc(C=O)c(S(=O)(=O)C(C)(C)C)c(C=O)c1
13540	Cn1cc(C=O)c2nc3c(C=O)cn(C)c(=O)c3c(-c3ccccc3)c2c1=O
13541	O=Cc1c(C=O)c2ccccc2c2ccccc12
13542	O=Cc1cc2cnncc2cc1C=O
13543	Cc1cc(-c2cc(C)sc2C=O)c(C=O)s1
13544	CC(C)(C)c1cc(C(C)(C)C)c(C=O)cc1C=O
13545	CC1(C)C=C(c2ccc(C=O)s2)CC(C)(C)N1C=O
13546	CC1(C)[C@H]2CC=C(C=O)[C@@]3(C2)[C@@H](C=O)CC[C@H]13
13547	C[C@H]1CC[C@@H](C=O)[C@@H]1CC=O
13548	CC(C)(C)c1cc(C=O)c(C=O)o1
13549	C[C@]12Cc3cc(C=O)oc3C[C@@H]1CC[C@@H]1[C@@H]2CC[C@@]2(C)[C@@H](OC=O)CC[C@@H]12
13550	Cn1c2ccccc2c2nc3c(nc21)N=C(O)N1[C@H]3OC[C@H](C=O)O[C@@H]1C=O
13551	O=C[C@]12c3ccccc3[C@@H]3[C@H]4C[C@H]4[C@H]1[C@@]32C=O
13552	C[C@H](C#C/C=C\\[C@@H](C)C=O)C=O
13553	CC(=O)N1[C@@H](/C=C(\\C)C=O)c2cccc3[nH]cc(c23)C[C@@H]1C=O
13554	O=CC1=C(Cl)NC(Cl)=C(C=O)C1c1cccc(Cl)c1
13555	O=C/C=C\\[C@H]1C=CC=C1C=O
13556	CN(C=O)c1ccccc1C=O
13557	CC1=C(C=O)C(=O)N2C(=C(C=O)CC[C@@H]2C)N1
13558	C/C=c1/c2c(/c(=C\\C)c3c1C[C@@H](C=O)CC3)C[C@@H](C=O)CC2
13559	O=C[C@]12CCC[C@@]1(C=O)C2
13560	CC[C@]12CCCn3c(C=O)c(C=O)c(c31)-c1ccccc1N=C(O)CC2
13561	CC1(C)C=C[C@@H](O)[C@@]2(C)[C@H]1CC=C(C=O)[C@@H]2C=O
13562	O=CC1=C(Cl)c2cc3c(cc2CC1)CCc1cc2c(cc1-3)C(Cl)=C(C=O)CC2
13563	O=Cc1cc(O)c(C=O)s1
13564	O=CN1[C@@H](O)[C@H](O)N(C=O)[C@H](O)[C@H]1O
13565	O=CC1(C#CC2(C=O)CC2)CC1
13566	CC(=O)n1cc(C=O)c2c3[nH]cc(C=O)c3ccc21
13567	C[C@H](C=O)[C@@H]1O[C@H](C=O)[C@@H]2OC(C)(C)O[C@H]12
13568	C[C@@H](C#C[C@H](C)C=O)C=O
13569	O=Cc1ccc(C#Cc2ccc3c4c(ccc(C#Cc5ccc(C=O)cc5)c24)CC3)cc1
13570	C#C[C@]1(OC=O)CC[C@H]2[C@@H]3CC[C@H]4Cc5oc(C=O)cc5C[C@]4(C)[C@H]3CC[C@]21C
13571	Cc1c2ccc3c(C=O)cc(ccc4ccc5c(C=O)cc(cc2)c(C)c5c4C)c(C)c13
13572	C[C@@H]1C(=O)O[C@@H]2/C=C(/C=O)CC/C=C(/C=O)CC[C@H]21
13573	CC1(C)CCC[C@@]2(C)[C@H]1CC[C@@]1(C=O)C(=O)CC(C=O)=CC[C@H]21
13574	O=Cc1ccccc1-c1cccnc1C=O
13575	CC1(C)C(C=O)=C(Cl)N(c2ccccc2)C(Cl)=C1C=O
13576	N=C1N[C@H]2C[C@H](N1)O[C@]1(O)[C@@H]3[C@H]4C[C@H](NC(=N)N4)O[C@](O)([C@H]2N1C=O)N3C=O
13577	Cc1c(-c2csc(C=O)c2C)csc1C=O
13578	C=C1[C@@H](O)C[C@H](CC=O)[C@@H]1C=O
13579	O=Cc1cc2c(cc1N=CO)OCO2
13580	O=Cc1ccc(N=CO)cc1
13581	O=Cc1ccc2nc3ccccc3c(C=O)c2c1
13582	O=CN1CCCN(C=O)c2ccccc21
13583	Cc1ccc(C)c2c1C[C@H](OC=O)[C@@H]1[C@H]2[C@]2(O)OC[C@@]1(C=O)[C@H](C)[C@@H]2O
13584	C=C1C[C@@]23C[C@]1(O)CC[C@@H]2C1=CCC[C@](C)(C=O)[C@@H]1[C@H]3C=O
13585	CC1(C)C[C@H]2[C@H](C=C(C=O)[C@]3(C=O)C[C@]23C)C1
13586	CC(C)(C)c1ccc(C=O)cc1C=O
13587	C#CC1C(C=O)=CN(c2ccc(C)cc2)C=C1C=O
13589	O=Cc1cc(Cl)c(C=O)c(Cl)c1Cl
13590	Cc1ccc(C=O)c(-c2ccccc2C=O)c1
13591	O=CC1=COC=C(C=O)C1/C=C/Cl
13592	Cc1ccc2cc(C=O)c(C=O)nc2c1
13593	O=CC1=C(O)[C@@H]2CCC(C=O)=C(O)[C@@H]2CC1
13594	O=C[C@H]1CC[C@H](C=O)C1
13595	COc1ccc2c(c1C=O)Oc1ccc(O)c(C=O)c1O2
13596	C[C@@H]1C[C@H](C=O)C(C=O)=CC2=C1CC(C)(C)C2
13597	Cc1cc(O)c(C=O)c(C)c1C=O
13598	Cc1c(C=O)n(C=O)c2c(Cl)ccc(Cl)c12
13599	O=Cc1ccncc1C=O
13600	CN1C=C(C=O)[C@H]2C[C@@H]1C(C=O)=CN2C
13601	CC1(C)O[C@H](C=O)[C@H]2[C@@H](CC=O)C(=O)c3ccccc3[C@@]2(C)O1
13602	COC(=O)[C@@]1(C)CC[C@@H]2[C@](C=O)(CC[C@@H]3[C@](C)(C=O)CCC[C@@]23C)C1
13603	CN1C=C[C@H](c2c(C=O)[nH]c3ccccc23)C(C=O)=C1
13604	COc1c(C=O)c2c3c(c1C=O)OC(C)(C)CC3CC(C)(C)O2
13605	O=C(O)N1CCOCCN(C(=O)O)CCN(C(=O)O)CC1
13606	C[C@@]12c3cc(C(=O)O)ccc3[C@]3(C)c4cc(C(=O)O)ccc4[C@](C)(c4cc(C(=O)O)ccc41)[C@]23C
13607	O=C(O)c1ccc(C#Cc2ccc(N(c3ccc(C#Cc4ccc(C(=O)O)cc4)cc3)c3ccc(C#Cc4ccc(C(=O)O)cc4)cc3)cc2)cc1
13608	O=C(O)c1c2cccccc-2c(C(=O)O)c1C(=O)O
13609	O=C(O)c1coc(C(=O)O)c1C(=O)O
13610	Cc1c(C(=O)O)c(S)c(C(=O)O)c(C(C)(C)C)c1C(=O)O
13611	O=C(O)c1cc(C(=O)O)c(Cl)c(C(=O)O)c1
13612	C=C1COCCN(C(=O)O)CCN(C(=O)O)CCN(C(=O)O)CCOC1
13613	O=C(O)N1CCN(C(=O)O)CCN(C(=O)O)CC1
13614	O=C(O)[C@H]1O[C@@H](C(=O)O)O[C@@H](C(=O)O)O1
13615	O=C(O)[C@H]1C[C@@H](C(=O)O)C[C@@H](C(=O)O)C1
13616	O=C(O)c1ccc(-c2ccc(N(c3ccc(-c4ccc(C(=O)O)cc4)cc3)c3ccc(-c4ccc(C(=O)O)cc4)cc3)cc2)cc1
13617	O=C(O)c1cc2c(O)c(c1)Sc1cc(C(=O)O)cc(c1O)Sc1cc(C(=O)O)cc(c1O)Sc1cccc(c1O)S2
13618	O=C(O)C=C1SC(C(=O)O)=C(C(=O)O)S1
13619	O=C(O)c1ccc2c(C(=O)O)ccc(C(=O)O)c2c1
13620	C[C@]12[C@]3(C)c4ccc(C(=O)O)cc4[C@@]1(C)c1ccc(C(=O)O)cc1[C@@]2(C)c1cc(C(=O)O)ccc13
13621	O=C(O)c1cc2c(cc1O)Cc1cc(C(=O)O)c(O)cc1Cc1cc(C(=O)O)c(O)cc1C2
13622	C[C@]1(C(=O)O)C[C@](C)(C(=O)O)C[C@@](C)(C(=O)O)C1
13623	O=C(O)c1cc(Br)c2cc1/C=C\\c1cc(c(C(=O)O)cc1Br)/C=C\\c1cc(c(C(=O)O)cc1Br)/C=C\\2
13624	O=C(O)N1CCOCCOCCOCCN(C(=O)O)CCN(C(=O)O)CC1
13625	O=C(O)c1cc(C(=O)O)c(Cl)c(C(=O)O)c1Cl
13626	Cc1c(C(=O)O)cc(C(=O)O)c(Cl)c1C(=O)O
13627	COc1cc2c(cc1C(=O)O)Cc1cc(OC)c(C(=O)O)cc1Cc1cc(OC)c(C(=O)O)cc1C2
13628	O=C(O)c1cc(C(=O)O)c(C(=O)O)[nH]1
13629	O=C(O)c1csc(C(=O)O)c1C(=O)O
13630	O=C(O)c1ccc2c(c1)[C@H]1c3ccc(C(=O)O)cc3[C@@H]2c2cc(C(=O)O)ccc21
13631	CC(C(=O)O)=C1NC(=C(C)C(=O)O)NC(=C(C)C(=O)O)N1
13632	O=C(O)c1cc(Br)c2cc1/C=C\\c1cc(c(C(=O)O)cc1Br)/C=C\\c1cc(c(Br)cc1C(=O)O)/C=C\\2
13633	O=C(O)c1cccc2c1[nH]c1c3[nH]c4c(C(=O)O)cccc4c3c3c4cccc(C(=O)O)c4[nH]c3c21
13634	O=C(O)c1cc(C(=O)O)c(Br)c(C(=O)O)c1O
13635	O=C(O)N1CCNCCN(C(=O)O)CCN(C(=O)O)CC1
13636	Cc1c(C(=O)O)c2n(c1C(=O)O)CCn1c-2cc(C(=O)O)c1C
13637	O=C(O)N1CCOCCOCCOCCOCCN(C(=O)O)CCN(C(=O)O)CC1
13638	O=C(O)c1ccc2[nH]c3c4[nH]c5ccc(C(=O)O)cc5c4c4c5cc(C(=O)O)ccc5[nH]c4c3c2c1
13639	O=C(O)c1ccc(C#Cc2cc(C(=O)O)cc(C(=O)O)c2)cc1
13640	O=C(O)c1cc2c3c4c1Cc1cc(C(=O)O)c5c(c14)c1c(cc(C(=O)O)c(c31)C2)C5
13641	CC(=O)N1[C@@H]2[C@H]3N(C(C)=O)[C@@H]4[C@@H](N(C(=O)O)[C@H]1[C@H](N2C(=O)O)N4C(=O)O)N3C(C)=O
13642	O=C(O)c1cccc(C#Cc2ccc(C#Cc3ccccc3C(=O)O)cc2C(=O)O)c1
13643	O=C(O)c1c(O)c(C(=O)O)c(Cl)c(C(=O)O)c1Cl
13644	O=C(O)[C@H]1CCC[C@H](C(=O)O)CCC[C@@H](C(=O)O)CCC1
13645	O=C(O)c1cc(C(=O)O)c2cc(C(=O)O)ccc2c1
13646	Cc1c(C(=O)O)c(C(=O)O)c(C(=O)O)n1C
13647	O=C(O)c1ccc2nc3cc(C(=O)O)c4cc5cc(C(=O)O)ccc5nc4c3cc2c1
13648	O=C(O)N1CCCN(C(=O)O)CCOCCN(C(=O)O)CCC1
13649	O=C(O)c1ccc(C(=O)O)c(C(=O)O)c1
13650	O=C(O)c1cc(C#Cc2ccc(C#Cc3ccccc3C(=O)O)cc2C(=O)O)ccc1O
13651	O=C(O)c1cc(C(=O)O)c(C(=O)O)s1
13652	O=C(O)c1c(Cl)c(Cl)c(C(=O)O)c(C(=O)O)c1Cl
13653	O=C(O)N1CCOCCOCCN(C(=O)O)CCN(C(=O)O)CC1
13654	O=C(O)[C@H]1[C@H](C(=O)O)[C@H]1C(=O)O
13655	O=C(O)c1cccc2[nH]c3c4[nH]c5cccc(C(=O)O)c5c4c4c([nH]c5cccc(C(=O)O)c54)c3c12
13656	O=C(O)c1ccc2c(c1)[nH]c1c3[nH]c4cc(C(=O)O)ccc4c3c3c4ccc(C(=O)O)cc4[nH]c3c21
13657	Cn1c(C(=O)O)cc(C(=O)O)c1C(=O)O
13658	O=C(O)c1c(Cl)c(C(=O)O)c(Cl)c(C(=O)O)c1Cl
13659	Cc1cc(C(=O)O)c(C(=O)O)cc1C(=O)O
13660	O=C(O)[C@H]1[C@@H](C(=O)O)[C@@H]2[C@@H]3OO[C@@H](O3)[C@@H]2[C@H]1C(=O)O
13661	O=C(O)c1c(Br)c(C(=O)O)c(Br)c(C(=O)O)c1Br
13662	O=C(O)N1CCCN(C(=O)O)CCN(C(=O)O)CCCNCC1
13663	O[C@@H]1[C@H](O[C@@H]2[C@@H](F)C[C@H](F)[C@@H](O)[C@H]2O)O[C@H](CF)[C@H](O)[C@@H]1O
13664	O[C@H]1[C@@H](F)[C@H](O)[C@H](F)[C@@H](O)[C@@H]1F
13665	C[C@H](F)N([C@H](C)F)[C@@H](C)F
13666	OC[C@@H]1O[C@H](O[C@H]2[C@@H](O)[C@@H](O)[C@H](F)C[C@H]2F)[C@H](O)[C@@H](F)[C@H]1O
13667	OC[C@@H]1O[C@H](O[C@@H]2[C@H](F)C[C@H](F)[C@H](O)[C@H]2O)[C@@H](F)[C@@H](O)[C@H]1O
13668	N=C(F)N=c1[nH]c(=NC(=N)F)[nH]c(=NC(=N)F)[nH]1
13669	F[C@H]1CCC[C@H](F)CCC[C@@H](F)CCC1
13670	O[C@H]1[C@H](F)[C@@H](O)[C@H](F)[C@@H](O)[C@@H]1F
13671	OC[C@H]1O[C@H](O[C@H]2[C@@H](O)[C@@H](O)[C@H](F)C[C@H]2F)[C@@H](F)[C@H](O)[C@H]1O
13672	O[C@H]1[C@H](F)[C@H](O)[C@H](F)[C@@H](O)[C@@H]1F
13673	O=S(=O)(O)[C@@H]1NC(F)=NC(F)=C1F
13674	O=S1(=O)N=C(F)C(F)=C(F)N1
13675	C[C@@H](F)N([C@@H](C)F)[C@@H](C)F
13676	CC(CF)(CF)CF
13677	O=C1OC[C@@H](F)C(=O)OC[C@H](F)C(=O)OC[C@@H]1F
13678	FCc1cc(CF)cc(CF)c1
13679	FC[C@H]1C[C@H](CF)C[C@@H](CF)C1
13680	O=C1O[C@H](CF)[C@@H](F)[C@H]1F
13681	O=P(CF)(CF)CF
13682	CC(C)(F)c1cc(C(C)(C)F)c(O)c(C(C)(C)F)c1
13683	F[C@H]1C[C@@H](F)C[C@@H](F)C1
13684	O[C@H]1[C@H](F)[C@H](O)[C@@H](F)[C@@H](O)[C@H]1F
13685	OC[C@H]1O[C@H](O[C@H]2[C@H](F)C[C@H](F)[C@@H](O)[C@H]2O)[C@H](F)[C@H](O)[C@H]1O
13686	OC[C@H]1O[C@H](O[C@@H]2[C@@H](F)C[C@@H](F)[C@@H](O)[C@@H]2O)[C@H](O)[C@@H](F)[C@@H]1O
13687	F/C=N\\N=C1C=CC(=NN=C(F)S)C=C1
13688	FCC(CF)CF
13689	FC[C@H]1C[C@@H](CF)C[C@@H](CF)C1
13690	O[C@H]1[C@@H](O)[C@@H](O)[C@@H](CF)O[C@@H]1O[C@H]1[C@H](F)C[C@@H](F)[C@@H](O)[C@H]1O
13691	O[C@H]1[C@@H](O)[C@@H](F)C[C@@H](F)[C@@H]1O[C@@H]1O[C@H](CF)[C@H](O)[C@@H](O)[C@H]1O
13692	FCC[C@H](F)CF
13693	FC[C@H]1O[C@H](CF)O[C@@H](CF)O1
13694	[H]/N=C(/F)C(F)/C(F)=N\\[H]
13695	OC[C@@H]1O[C@H](O[C@@H]2[C@@H](O)[C@@H](O)[C@H](F)C[C@H]2F)[C@H](F)[C@H](O)[C@H]1O
13696	FC12CN3CC(F)(C1)CC(F)(C3)C2
13697	F/C=N\\N=C1C=CC(=NN=C(F)S)C=C1
13698	O[C@H]1[C@H](F)[C@H](O)[C@H](F)[C@@H](O)[C@H]1F
13699	OC[C@H]1O[C@H](O[C@H]2[C@H](F)C[C@H](F)[C@@H](O)[C@H]2O)[C@H](F)[C@@H](O)[C@@H]1O
13700	O=CC[C@H]1O[C@H](O[C@H]2[C@@H](C=O)C[C@@H](C=O)[C@H](O)[C@@H]2O)[C@H](O)[C@H](O)[C@H]1O
13701	O=C[C@H]1[C@@H](O)[C@@H](C=O)[C@@H](O)[C@@H](C=O)[C@@H]1O
13702	C[C@@H](C=O)N([C@@H](C)C=O)[C@@H](C)C=O
13703	O=C[C@H]1C[C@@H](C=O)[C@@H](O)[C@@H](O)[C@H]1O[C@@H]1O[C@H](CO)[C@@H](O)[C@H](C=O)[C@H]1O
13704	O=C[C@@H]1[C@H](O[C@H]2[C@H](C=O)C[C@H](C=O)[C@@H](O)[C@H]2O)O[C@@H](CO)[C@@H](O)[C@@H]1O
13705	NC(C=O)=Nc1nc(N=C(N)C=O)nc(N=C(N)C=O)n1
13706	O=C[C@H]1[C@H](O)[C@H](C=O)[C@H](O)[C@@H](C=O)[C@@H]1O
13707	O=C[C@@H]1[C@@H](O[C@H]2[C@H](C=O)C[C@@H](C=O)[C@@H](O)[C@H]2O)O[C@H](CO)[C@@H](O)[C@H]1O
13708	O=C[C@H]1[C@H](O)[C@@H](C=O)[C@H](O)[C@@H](C=O)[C@H]1O
13709	O=CC1=N[C@@H](S(=O)(=O)O)C(C=O)=C(C=O)N1
13710	O=CC1=NS(=O)(=O)NC(C=O)=C1C=O
13711	C[C@@H](C=O)N([C@H](C)C=O)[C@H](C)C=O
13712	CC(CC=O)(CC=O)CC=O
13713	O=C[C@@H]1COC(=O)[C@H](C=O)COC(=O)[C@@H](C=O)COC1=O
13714	O=CCc1cc(CC=O)cc(CC=O)c1
13715	O=CC[C@H]1C[C@H](CC=O)C[C@@H](CC=O)C1
13716	O=CC[C@@H]1OC(=O)[C@@H](C=O)[C@@H]1C=O
13717	O=CCP(=O)(CC=O)CC=O
13718	O=CCC(C=O)CC=O
13719	CC(C)(C=O)c1cc(C(C)(C)C=O)c(O)c(C(C)(C)C=O)c1
13720	O=CC1=N[C@H](S(=O)(=O)O)C(C=O)=C(C=O)N1
13721	O=C[C@@H]1C[C@@H](C=O)[C@H](O[C@@H]2O[C@@H](CO)[C@H](O)[C@H](O)[C@H]2C=O)[C@H](O)[C@H]1O
13722	O=C[C@H]1C[C@@H](C=O)[C@H](O[C@@H]2O[C@@H](CO)[C@H](O)[C@@H](C=O)[C@@H]2O)[C@H](O)[C@H]1O
13723	O=C/C=N/N=C1C=CC(=NNC(=S)C=O)C=C1
13724	O=CCC(CC=O)CC=O
13725	O=CC[C@@H]1O[C@H](O[C@H]2[C@@H](C=O)C[C@H](C=O)[C@H](O)[C@@H]2O)[C@@H](O)[C@@H](O)[C@@H]1O
13726	O=CC[C@@H]1O[C@H](O[C@H]2[C@@H](C=O)C[C@@H](C=O)[C@H](O)[C@H]2O)[C@H](O)[C@H](O)[C@H]1O
13727	O=CCC[C@@H](C=O)CC=O
13728	O=CC[C@H]1O[C@@H](CC=O)O[C@@H](CC=O)O1
13729	[H]/N=C(/C=O)C(C=O)/C(C=O)=N\\[H]
13730	O=C[C@H]1C[C@@H](C=O)[C@@H](O[C@@H]2O[C@H](CO)[C@H](O)[C@@H](O)[C@H]2C=O)[C@H](O)[C@H]1O
13731	O=CC12CN3CC(C=O)(C1)CC(C=O)(C3)C2
13732	O=C/C=N\\N=C1C=CC(=NNC(=S)C=O)C=C1
13733	O=C[C@H]1[C@H](O)[C@@H](C=O)[C@H](O)[C@H](C=O)[C@H]1O
13734	O=C[C@H]1C[C@H](C=O)[C@@H](O)[C@@H](O)[C@H]1O[C@H]1O[C@H](CO)[C@H](O)[C@H](O)[C@@H]1C=O
13735	COC(=O)[C@@]12C[C@]1(F)C(F)=C[C@@H]1CC(C)(C)C[C@H]12
13736	CN1CCc2cc(F)cc(F)c21
13737	CC1(C)CCC[C@@]2(C)[C@@H]1CC[C@]1(F)C(=O)CC(F)=CC[C@H]21
13738	Fc1c(F)n(-c2ccccc2)c2ccccc12
13739	Cc1cc2c(cc1F)[C@@H]1c3ccccc3[C@H]2c2cc(F)ccc21
13740	O=C1c2cc(F)ccc2-c2ccc(F)c3cccc1c23
13741	CC(C)(C)Sc1cc(O)c(F)cc1F
13742	Fc1cc(F)c(N2CCCCC2)o1
13743	C/C(F)=C(\\C)C#C/C(C)=C(\\C)F
13744	CC(C)(C)[C@@H]1CC=C(F)[C@H](CF)C1
13745	CC(C)(C)n1cc(F)c(F)c1
13746	OC[C@@H]1C[C@@H](F)O[C@@H]1F
13747	F[C@H]1C[C@@H]2C=C[C@H]1[C@@H]2F
13748	CC1(C)CCC[C@]2(C)[C@H]1CC[C@H](F)[C@]2(O)F
13749	Fc1cc2sc3cc(F)sc3c2s1
13750	Fc1ccc(Cl)c(F)c1Cl
13751	COc1cc(C#CF)c(OC)cc1C#CF
13752	Cc1ccc2c(c1)C(F)=C(F)c1ccccc1C2
13753	COc1c(F)cc(Cl)c(C)c1F
13754	Fc1cc2ccccc2c(-c2nc(F)cc3ccccc23)n1
13755	FC1=C(Cl)c2cc(-c3ccc4c(c3)C(Cl)=C(F)CC4)ccc2CC1
13756	Fc1sc(Cl)c(F)c1Cl
13757	C/C(F)=C/c1ccc(F)cc1
13758	F[C@H]1[C@H]2CC[C@H](CC2)[C@H]1F
13759	C[C@@H]1[C@@H](C)N(F)c2ccccc2N1F
13760	C[C@H](F)C#C[C@@H](C)F
13761	Fc1ccc2cc3nc(F)ccc3cc2n1
13762	C/C=c1\\c2c(/c(=C/C)c3c1[C@@H](C)[C@@H](F)C[C@@H]3C)[C@@H](C)[C@H](F)C[C@H]2C
13763	FC1=CS/C(=C2/SC=C(F)S2)S1
13764	FC1=C(Cl)NC(Cl)=C(F)C1c1ccccc1
13765	O=C1c2cc(Cl)ccc2C(=O)c2c1ccc(F)c2-c1c(F)ccc2c1C(=O)c1ccc(Cl)cc1C2=O
13766	CO[C@H]1[C@H](F)[C@H]2C[C@H]2[C@H]1F
13767	FC[C@H]1CCC[C@@H](F)C1
13768	F[C@H]1CO[C@@H](F)O1
13769	Fc1ccccc1-c1cc2c(cc1F)sc1ccccc12
13770	CC1(C)CC2CC(C)(C)Oc3c(F)c(O)c(F)c(c32)O1
13771	Cc1cc(-c2[nH]c(F)cc2C)[nH]c1F
13772	CC1(C)CCC(C)(C)c2cc(F)c(F)cc21
13773	CC1(C)CCC=C(F)[C@@H]1F
13774	Cc1cc(-c2ccccc2)cc(C)c2c(F)c(F)cc1-2
13775	Fc1cscc1F
13776	O/C=C(\\F)c1[nH]nc(Cl)c1F
13777	FC1=C2CCc3cc4c5cc3CCC2=C(F)/C=C(CC5)\\C(=C/1)CC4
13778	N#Cc1c2cccccc-2c(F)c1F
13779	Cc1cc(C)c(-c2c(C)cc(C)cc2F)c(F)c1
13780	FNNF
13781	CC[C@]12C3=CC=CC1=C(F)C(F)=C2C=C3
13782	Fc1ccccc1-c1cc2ccc3ccccc3c2cc1F
13783	C[C@@]12C[C@H]3[C@H]4C[C@@H]1[C@H](C[C@@]4(C)NN3F)N(F)N2
13784	Fc1ccc2ccc3c(F)ccc4ccc1c2c43
13785	C[C@@H]1Cc2c(n(F)c3ccccc23)-c2ncc(F)c(=O)n21
13786	C=C1COC(=O)c2c(F)cc3ccccc3c2-c2c(c(F)cc3ccccc23)C(=O)OC1
13787	C=C1[C@@H](O)C[C@@H](CF)[C@@H]1F
13788	CN1C=C[C@H](c2c(F)n(C)c3ccccc23)C(F)=C1
13789	Fc1ccc(C#Cc2ccc3c4c(ccc(C#Cc5ccc(F)cc5)c24)CC3)cc1
13790	FC/C=C1/C=CC=C1F
13791	Fc1cc(F)c(N2CCOCC2)o1
13792	C/C(F)=C(\\C)C#CC#C/C(C)=C(\\C)F
13793	N=C1N[C@H]2C[C@@H](N1)[C@@H]1N(F)[C@](O)(O2)[C@H]2[C@H]3C[C@H](NC(=N)N3)O[C@]1(O)N2F
13794	Cc1ccc(-c2nc3c(F)c4cccccc4n3c2F)cc1
13795	FN1CCOCCOCCN(F)CC1
13796	Fc1cc(F)c(Cl)c(Cl)c1
13797	OCc1cc(F)cc(F)c1O
13798	FC1=CC=c2c3c(c4cccc5cccc2c54)C=CC(F)=C1C3
13799	Fc1cc(Cl)c(F)c(Cl)c1Cl
13800	C=C(F)[C@H]1CC[C@]2(C)CCC=C(F)[C@H]2C1
13801	CN(F)/C(F)=C\\O
13802	Fc1c[nH]c2ccc(-c3[nH]c4ccccc4c3F)cc12
13803	Fc1ccc2c3c(ccc2c1)OCOc1ccc2cc(F)ccc2c1-3
13804	C[C@@H]1CC[C@H](F)[C@@H](F)C2=CC(C)(C)C[C@H]21
13805	F/N=c1/c2ccccc2c2nc3/c(=N/F)c4ccccc4c3nc12
13806	Cc1ccc2oc(F)c(F)c2c1
13807	Fc1sc(F)c2c1ncc1sccc12
13808	C[C@@H]1CC[C@@H]2C(C)(C)[C@H](O)CC[C@@]2(C)[C@@]12Cc1c(O)cc(F)c(F)c1O2
13809	FC1=C(F)C(F)=C1F
13810	FC1=C[C@@H]2C=C(F)[C@@H]3C=C[C@H]1[C@H]23
13811	Fc1cc(F)c2c(c1)CCC2
13812	C[C@]12CC[C@@H]3[C@@H](CC[C@H]4Cc5oc(F)cc5C[C@]43C)[C@@H]1CC[C@@H]2OF
13813	Cc1c(F)n(F)c2c(C)cc(Br)cc12
13814	C=C1C[C@](C)(F)[C@H](F)C[C@@H]1O
13815	Fc1ccc2c(c1)C1(CC2)CCc2ccc(F)cc21
13816	CC1(C)C[C@H]2[C@H](C=C(F)[C@@]3(F)C[C@@]23C)[C@@H]1O
13817	Fc1c2cccccc-2cc1-c1cc2cccccc-2c1F
13818	Cc1cc(C)c(-c2c(C)cc(C)c(F)c2C)c(C)c1F
13819	COc1cccc2c1CC[C@H]1[C@](C)(F)CCC[C@]21F
13820	CN1C=C(F)CC(F)=C1
13821	Cn1c(Cl)c(F)c(F)c1N1CCCCC1
13822	F[C@@H]1/C=C\\C=C/[C@H](F)/C=C\\C1
13823	F[C@H]1[C@H]2C=C[C@H](CC2)[C@H]1F
13824	CC1(C)[C@H](F)[C@@]2(C#N)C[C@]1(C#N)[C@@H](F)C2(C)C
13825	O=C1C(Cl)=C2C(=O)C(Cl)=C1N(F)CCCCCCCCCCCCN2F
13826	C/C(F)=C/[C@@H]1[C@@H](F)C1(C)C
13827	C[C@H]1CN=C(S)Nc2ccccc2N(F)CCN(F)c2ccccc2NC(S)=N1
13828	CN1C=C[C@H](c2c(F)[nH]c3ccccc23)C(F)=C1
13829	Fc1ccc2ccoc2c1N1CCN(F)CC1
13830	C/C=c1/c2c(/c(=C\\C)c3c1C[C@@H](F)CC3)C[C@@H](F)CC2
13831	Oc1cc(F)sc1F
13832	CC1=C[C@@H]2OC=C(F)[C@](C)(F)[C@H]2[C@H](CO)C1
13833	FC1=S=C(F)c2cc3ccccc3cc21
13834	Cc1cc(O)cc(F)c1-c1c(C)cc(O)cc1F
13835	CC(=O)N1[C@@H](/C=C(\\C)F)c2cccc3[nH]cc(c23)C[C@H]1F
13836	CC1(C)C=C(F)C(Cl)=C(F)C1
13837	C[C@]12CCC=C(F)[C@@]1(F)C2
13838	FC1=CC=CC2=CC=CC(F)=C1C2
13839	F[C@@]12C[C@H]3C[C@@H](C1)C[C@]([C@H]1[C@H]4C[C@@H]5C[C@H](C4)C[C@@]1(F)C5)(C3)C2
13840	CC1=C(F)C2=CC=C3C=CC=C4C=CC(=C1F)[C@]2(C)[C@]43C
13841	COc1ccc2c(c1)C(F)=C(F)c1ccccc1C2
13842	Oc1cc(F)c(F)cc1O
13843	Oc1cc2c(F)c(O)ccc2cc1F
13844	Fc1cc(F)c(N2CCNCC2)o1
13845	Fc1ccc(N2CCN(F)CC2)c2occc12
13846	COc1c2oc(F)c(Cl)c2cc2c(Cl)c(F)oc12
13847	Cc1c(F)n(F)c2c(Cl)ccc(Cl)c12
13848	CC1=C/C(F)=C\\C(C)=C/C(F)=C1
13849	O=C(F)O[C@@H]1CCC[C@@H]1F
13850	Cc1nc2ccccc2c(F)c1F
13851	CC1(C)C(F)=C(Cl)N(c2ccccc2)C(Cl)=C1F
13852	Oc1c(F)cc2ccccc2c1F
13853	COc1cc2c(C)c(c1)CCc1c(C)c(c(F)c(C)c1F)CC2
13854	FN1CC(Br)CN1F
13855	FC#CC1(C#Cc2ccccc2C#CC2(C#CF)OCCCO2)OCCCO1
13856	CN1C(=O)N2[C@H](F)O[C@@H](F)CO[C@H]2c2nc3c4ccccc4n(C)c3nc21
13857	OC(/C=C\\F)=C/F
13858	Fc1ccnc(-c2nccc(F)n2)n1
13859	COc1c(O)c(F)c(Br)c(F)c1O
13860	FC1=C(Cl)NC(Cl)=C(F)C1c1cccc(Cl)c1
13861	COC(=O)[C@H]1CCC[C@@](C)(F)[C@H]1F
13862	Fc1csc(-c2cc(F)cs2)c1
13863	CC1=C(F)[C@H](CF)CC1
13864	Fc1cccc2c1Oc1c(F)cccc1O2
13865	Fc1nc2ccc(Cl)cc2nc1F
13866	CC1=C/C(=C2/C=C(C)C(=O)C(F)=C2)C=C(F)C1=O
13867	CC(O)=Nc1c(F)c2cccccc-2c1F
13868	F[C@@H]1C=C[C@@H](F)N1
13869	C[C@H](F)/C=C/C#C[C@@H](C)F
13870	C#CC1C(F)=CN(c2c(C)cccc2C)C=C1F
13871	FC1=C(Cl)C(=CN2CCOCC2)C(Cl)=C(F)C1
13872	CC(=O)O[C@H]1[C@@H]2CC(C)(C)CC2=C(F)[C@@]2(F)C[C@@]12C
13873	CC1=CC2=C(F)C3(CC3)[C@](C)(O)C(=O)C2=C1F
13874	Cc1cc(Cl)c2[nH]c(F)c(F)c2c1
13875	Fc1ccc2c(ccc3cc(-c4ccccc4)c(F)cc32)c1
13876	F[C@@]12[C@@H]3C[C@H]4[C@H]5[C@@H]3[C@@H]3C[C@H]5[C@]5([C@H]6C=C[C@H](C=C6)[C@]315)[C@]42F
13877	F[C@H]1CCC[C@H](F)[C@H]2COC[C@@H]12
13878	N#Cc1cc(F)[nH]c1F
13879	C[C@]12C=C(F)[C@](O)(F)C[C@@H]1CCCC2
13880	Fc1oc2ccccc2c1F
13881	FN1CCN(F)c2ccccc2NC(S)=NCCCN=C(S)Nc2ccccc21
13882	FN1C=C([C@@H]2CCCCCN2F)CCCC1
13883	O/C=C(/F)c1[nH]nc(Cl)c1F
13884	FN1CCC[C@@H]([C@H]2CCCCN2F)C1
13885	Fc1[nH]c(F)c2c1CCCC2
13886	C[C@@H]1C[C@@H](F)CC[C@H]1F
13887	Cc1ccc2c(c1)[C@H](F)c1ccccc1[C@@H]2F
13888	Fc1cc2c(cc1F)CCC2
13889	O=C1c2c(O)cc(O)c(F)c2C(=O)c2c(O)cc(O)c(F)c21
13890	CCc1c(O)c(F)cc(F)c1O
13891	F/C=C/c1cc2cccccc-2c1F
13892	Fc1c2c(c(F)c3c1-c1cccc4cccc-3c14)-c1cccc3cccc-2c13
13893	Fc1cc(F)c2c(c1Cl)CCCC2
13894	O=C(Cl)c1c(F)cccc1F
13895	Cc1c2ccc(O)c(F)c2c(C)c2ccc(O)c(F)c12
13896	CC1=C2C=C(F)S[C@]2(C)[C@@]2(C)SC(F)=CC2=C1C
13897	Fc1cc2c(s1)/C(=C1/CCc3cc(F)sc31)CC2
13898	O=C1c2cc(F)sc2-c2sc(F)cc21
13899	CC(O)=Nc1cc(O)c(F)cc1F
13900	FC=C=CF
13901	Cc1c(F)n(F)c2ccc(Cl)cc12
13902	CC1=C(F)[C@]2(C)[C@@H](OF)CC[C@@H](C)[C@H]2[C@@H]2OC(C)(C)O[C@@H]12
13903	O=C1C(F)=C(Cl)NC2=C(F)CCCN12
13904	O=C(F)/C=C\\F
13905	Cc1c(F)ccc(O)c1F
13906	Cc1cc(F)c(F)o1
13907	CC1(C)O[C@@H]2[C@@H](F)O[C@@H](F)[C@@H]2O1
13908	C#CC1C(F)=CN(c2cccc(C)c2)C=C1F
13909	Cc1c(F)c[nH]c1F
13910	CN(C)c1nc(Cl)c(F)cc1F
13911	Fc1ccccc1-c1cc2sc3ccccc3c2cc1F
13912	F/C=C/c1cccc2c1-c1c(F)cccc1-2
13913	CC(C)c1cc(F)c(Cl)c(F)c1
13914	CC(=O)Oc1c(F)c(F)cc2c1C(=O)c1ccccc1C2=O
13915	CCc1cccc2c(F)c(F)oc12
13916	F[C@]12[C@@H]3C=C[C@@H](O3)[C@@]1(F)[C@@H]1C=C[C@H]2O1
13917	Fc1nnn(-c2ccc(Br)cc2)c1F
13918	O=C(O)[C@@H]1C[C@]2(O)c3ccccc3N(F)[C@@H]2N1F
13919	CC1=CC[C@H]([C@H](C)F)[C@@H]1F
13920	FN1C=C([C@H]2CCCCCN2F)CCC1
13921	Cc1c(F)csc1F
13922	C=C1C[C@@]23C[C@]1(O)CC[C@@H]2C1=CCC[C@@](C)(F)[C@@H]1[C@H]3F
13923	CCN1c2cccc(F)c2Sc2cccc(F)c21
13924	CSc1ccc(F)cc1F
13925	Oc1c(F)ccnc1-c1nccc(F)c1O
13926	FN=C1NN(F)C2(CCCCC2)S1
13927	Fc1c[nH]c2ccc3c(ccc4[nH]cc(F)c43)c12
13928	Oc1c(F)cc(F)cc1C1CCCCC1
13929	C[C@@H]1CCC[C@@]2(C)[C@@H](F)C(F)=CC[C@H]12
13930	COc1c(F)c(F)c(Cl)n1C
13931	C=Cc1c(F)[nH]c(F)c1C
13932	Fc1nc2ccccc2nc1F
13933	Fc1cc(C#Cc2ccccc2)cc(F)n1
13934	FNc1ccc(F)cc1
13935	CC1(C)CC2=C(F)[C@]3(F)C[C@@]3(C)[C@H](O)[C@]2(O)C1
13936	Fc1ccc2c(c1)Nc1ccc(F)cc1S2
13937	Cn1c(=O)n2n(c1=O)C1(F)CC2(F)C1
13938	C[C@H]1CC[C@H](F)[C@@H]1F
13939	Fc1cc(F)c(Cl)[nH]1
13940	FC1=C(F)[C@@H]2O[C@H]1C1=C2[C@H]2C=C[C@@H]1CC2
13941	Cc1c2ccc(O)c(F)c2cc2ccc(O)c(F)c12
13942	Fc1cc2c(c3ccccc13)[C@H](F)c1ccccc1[C@@H]2F
13943	O[C@H](F)[C@H](O)F
13944	C[C@@H]1C=C(F)C(F)=C[C@@H]2CC(C)(C)C[C@@H]12
13945	O/C(F)=C/C=C/F
13946	CC(C)(C)/C(C#CC#C/C(=C/F)C(C)(C)C)=C/F
13947	Fc1c(Cl)c2ccccc2n1F
13948	Cc1ccc(-c2ccc(F)cc2)cc1F
13949	O[C@@H](F)[C@H]1CS[C@@H](F)O1
13950	Fc1cccc2c1-c1c(F)cccc1/C=C\\C/C=C\\2
13951	F/C1=C/NCCC/N=C\\C(F)=C/NCCC\\N=C/1
13952	CCc1ccc2oc(F)c(F)c2c1
13953	Cc1ccc(C)c2c1[C@@H](F)c1ccccc1[C@H]2F
13954	Fc1ccc2c(c1)oc1ccc(F)cc12
13955	CCc1cc(F)c(C)c(F)c1
13956	FN=C1CNCC(NF)=N1
13957	C[C@H]1C[C@@H](O)[C@@H](CF)[C@@H]1F
13958	C[C@H]1CC[C@@]2(C)C(F)=CCC[C@H]2[C@]1(C)CF
13959	C#CC1C(F)=CN(c2ncccn2)C=C1F
13960	CC1(C)CCC[C@]2(C)[C@@H]1CC=C(F)[C@]2(C)F
13961	Fc1cc(F)c(N2CCCCC2)s1
13962	Cc1sc(F)cc1F
13963	F[C@@H]1[C@H](F)C12c1ccccc1-c1ccccc12
13964	F/C1=C(\\Cl)CCC/C(Cl)=C(/F)C1
13965	Fc1c(Br)sc(Br)c1F
13966	CN1CCCc2cc(F)cc(F)c21
13967	C=C(F)[C@@H]1C/C=C(/C)CC/C=C(/F)CC1
13968	CC(C)(C)c1ccc(F)c(F)c1
13969	F[C@@H]1C[C@@H]2[C@H]3OO[C@H](O3)[C@@H]2[C@H]1F
13970	F[C@H]1C[C@H]1F
13971	OCc1cnc(F)c(O)c1F
13972	FN1C=C([C@@H]2c3ccccc3CCN2F)CCCC1
13973	FC[C@H]1CCC[C@@H]1F
13974	F[C@]1(Cl)[C@H]2CC=CC[C@H]2[C@](F)(Cl)[C@@H]2CC=CC[C@H]21
13975	CC1=C(C)C[C@@H](F)[C@@H](F)C1
13976	Fc1[nH]c2ccc(Cl)cc2c1F
13977	CC1(C)OCc2c(F)cnc(F)c2O1
13978	C[C@@H]1CC[C@@H](F)[C@H]1CF
13979	Fc1nc2cc(Cl)c(Cl)cc2nc1F
13980	FC[C@@H]1CCc2cccc(F)c21
13981	CC1(C)C(F)=C(Cl)NC(Cl)=C1F
13982	CC1(C)CC[C@@H](O)[C@@]2(C)[C@@H](F)C(F)=CC[C@H]12
13983	Fc1cnc2c(F)sc3cc(-c4ccccc4)nc1-n-3-2
13984	O=C1c2cc(O)c(F)c(O)c2C(=O)c2cc(O)c(F)c(O)c21
13985	C[C@H]1C(=O)O[C@@H]2/C=C(/F)CC/C=C(/F)CC[C@H]21
13986	F[C@H]1CCC[C@H](F)CCC1
13987	COc1c(C)c(O)c(F)c(F)c1O
13988	FC1=CNC(Cl)=C(F)C1
13989	Fc1cc(F)c(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)s1
13990	C#CC1C(F)=CN(CC)C=C1F
13991	C[C@]1(CF)CC[C@]2(O)CC[C@@]1(C)[C@@]2(C)F
13992	Fc1[nH]c(F)c(Br)c1Br
13993	N#CC1=C(c2ccc(Cl)cc2)[C@@H](F)S/C1=C/F
13994	Fc1cnc2ncc(F)cc2c1
13995	CN(F)c1ccccc1F
13996	Fc1cccc2c1Oc1cccc(F)c1O2
13997	C/C(F)=C/C=C(\\C)F
13998	Fc1nnc2ccccc2c1F
13999	FO[C@@H]1Cc2ccccc2N(F)C1
14000	Fc1c(Cl)sc(Cl)c1F
14001	CC(=O)O[C@H]1CC[C@H]2C[C@@]2(F)[C@H]1F
14002	COC(=O)C1=C(C)C[C@@H]2[C@H]1C=C(F)[C@@]1(F)C[C@]21C
14003	Cc1cc(F)c(S(=O)(=O)C(C)(C)C)c(F)c1
14004	Cc1cc(N(C)C)c(F)c(C)c1F
14005	FC/C=C1\\C=CC=C1F
14006	FC1=C(F)[C@@H]2C=C[C@H]1c1cc3ccccc3cc12
14007	CC(C)(C)N1CN(F)CN(F)C1
14008	FC1=Cc2ccccc2N(F)c2ccccc21
14009	CCn1c(Cl)c(F)c2cccc(F)c21
14010	Fc1cscc1-c1ccsc1F
14011	Cc1ccc2c(ccc3c(F)c(C)c(F)n32)c1
14012	Fc1ccc2nc3ccccc3c(F)c2c1
14013	FC1=C2c3cc4c(cc3CCN2[C@H]2O[C@@H]1N1CCc3cc5c(cc3C1=C2F)OCO5)OCO4
14014	F[C@H]1CCC[C@H]1[C@H]1CCC[C@H]1F
14015	Cc1cc(-c2cc(C)sc2F)c(F)s1
14016	CC[C@@]12CCCn3c(F)c(F)c(c31)-c1ccccc1N=C(O)CC2
14017	Cc1cc2c(cc1F)[C@@H]1c3ccccc3[C@H]2c2ccc(F)cc21
14018	Fc1ccn(-n2cccc2F)c1
14019	CN1[C@@H](F)C=C[C@H]1F
14020	FC1=CC[C@H](F)CC1
14021	FN1CCN(F)[C@H](c2ccccc2)c2ccccc2C1
14022	CC(=O)O[C@H]1[C@@H]2CC(C)(C)C[C@H]2[C@]2(C)C[C@]2(F)[C@@H]1F
14023	CCOC(=O)N1C[C@H](F)CC[C@H]1F
14024	C=C1[C@@H](C)CC[C@]2(C)[C@H]1CC=C(F)[C@]2(O)F
14025	Cc1[nH]c2c(c1F)C(Cl)=C(F)CC2
14026	O/C=C1\\C(F)=CC(F)=C1C1C=CC=CC=C1
14027	Cc1cc(C)c2cc(F)c(F)c-2c(C)c1
14028	Cc1c(F)n(F)c2c(Cl)cc(Cl)cc12
14029	F/C=C/c1cccc(F)c1
14030	Fc1sc(F)c2c1Nc1ccccc1N2
14031	C[C@@H](F)C#C/C=C/[C@@H](C)F
14032	Fc1cnc2c(F)sc3cccc1-n-3-2
14033	Cc1cccc2oc(F)c(F)c12
14034	FNc1cc2ccccc2nc1F
14035	CN1C[C@H](F)[C@@H](OF)[C@@H]2c3ccccc3CC[C@H]21
14036	Fc1ccc(N2CCN(F)CC2)cc1Cl
14037	Cc1cc(C(C)(C)C)cc(C)c2c(F)c(F)cc1-2
14038	FC1=C(F)/C=C\\C=C/C=C1
14039	C=C(F)[C@@H]1C[C@@H](O)C(C)=C1F
14040	F/C1=C/Nc2ccccc2/N=C/C(F)=C\\Nc2ccccc2\\N=C/1
14041	COc1c(F)cc(F)c(O)c1C
14042	CC(C)(F)/C=C\\F
14043	CC1=C(F)C(=O)N2C(=C(F)CC[C@H]2C)N1
14044	Oc1nc2c(ccc3c(O)c(F)c(O)nc32)c(O)c1F
14045	Fc1cc(F)c2ccc3cccc4ccc1n4-n32
14046	Fc1ccc2c(F)c3ccccc3c(F)c2c1
14047	Cc1cc(-c2cc(C)c(F)s2)sc1F
14048	COC(C#CF)(C#CF)c1ccc(C(C)(C)C)cc1
14049	CC1(C)C2C3C(C)(C)C4(O)C(=O)C3(F)C4(Cl)C3(Cl)C(=O)C1(O)C23F
14050	Fc1cc(F)cc([C@@H]2O/C=C\\c3occc3O/C=C/c3occc3O2)c1
14051	C[C@]12CC[C@@H]3[C@@H](CC[C@]4(/C=C/F)CC(=O)CC[C@@]34C)[C@H]1CC[C@@H]2F
14052	Fc1ccc2c(c1)CC[C@H]1CCc3cc(F)ccc3[C@H]21
14053	Fc1c[nH]c2ccc3[nH]cc(F)c3c12
14054	C[C@H]1CCC[C@](C)(F)[C@@H]1F
14055	O=C1OCC[C@@H]1n1c(F)ccc1F
14056	Oc1cc(Br)c(F)cc1F
14057	COc1cc2c(cc1F)C(Cl)=C(F)C(C)(C)O2
14058	Fc1cc2cccc3cccc(cc1F)c32
14059	Cn1ncc(F)c1NF
14060	C[C@]1(O)C[C@@]23CC[C@@H]4[C@](C)(F)CCC[C@@]4(F)[C@@H]2CC[C@@H]1C3
14061	C[C@@H](F)[C@@H]1CC[C@@H](C)[C@H]1F
14062	C[C@@H]1CN(F)CCN1F
14063	C[C@@]12CCC[C@@H](F)[C@@H]1N(F)c1ccccc12
14064	Fc1c2cccccc2n2c(F)c(-c3ccccc3)nc12
14065	CC[C@]1(F)CC=C(F)CC1
14066	O/C=C(/F)NF
14067	F/C=C/[C@H]1C=CC=C1F
14068	Fc1cc(-c2cc(F)on2)no1
14069	Fc1c2c(c(F)c3ccccc13)-c1cccc3cccc-2c13
14070	CC1(C)C=C[C@@H](O)[C@]2(C)[C@@H](F)C(F)=CC[C@H]12
14071	C/C(F)=C\\CF
14072	CC(C)(C)S(=O)(=O)c1c(F)cccc1F
14073	Fc1ccc(-c2ccc(F)s2)[nH]1
14074	CC1(C)CCC[C@]2(C)[C@@H]3CC=C(F)[C@H](F)[C@]3(C)CC[C@H]12
14075	CC(C)(F)C#C/C=C/C#CC(C)(C)F
14076	Fc1ccc2c(ccc3nc(F)ccc32)n1
14077	CCn1c(F)ccc1F
14078	C[C@@H]1CC[C@H]2C(C)(C)[C@H](O)[C@H](O)C[C@]2(C)[C@]12Cc1c(O)cc(F)c(F)c1O2
14079	Fc1cccc(F)c1S
14080	Fc1c2ccccc2c(-c2c3ccccc3c(F)c3ccccc23)c2ccccc12
14081	CC1=CC(=O)[C@@]23CCC[C@@]12[C@@H](F)C[C@]3(C)F
14082	Fc1ccsc1F
14083	Fc1cnc2c(F)sc3cc(-c4ccccc4)cc1-n-3-2
14084	F[C@H]1[C@H]2CC3=C(C[C@@H]4[C@@H](F)[C@@H]4C3)C[C@@H]12
14085	FC1(C#CC2(F)CC2)CC1
14086	C[C@]1(F)CCCC[C@@]1(C)CF
14087	Fc1ccnc(F)c1
14088	Oc1c(Cl)c2c(O)c(Cl)c1N(F)CCCCCCCCCCCCN2F
14089	Oc1c(F)cc(F)c(O)c1Br
14090	O=C(c1ccccc1F)N1CCC[C@@H]1F
14091	F/C=C\\c1ccc(F)s1
14092	Fc1c(F)c2ccccc2c2ccccc12
14093	Cc1cc2ccccn2c2c(F)cc(F)c1-2
14094	O=C(F)/C=C/F
14095	FC1=CNC=C(F)C1c1ccccc1F
14096	F[C@H]1[C@H]2CC[C@H](c3ccccc32)[C@H]1F
14097	F[C@H]1CC/C=C\\CC/C=C\\CC[C@@H]1F
14098	F[C@H]1C(c2ccccc2)[C@@H]1F
14099	C[C@H]1C=C(F)[C@@H](F)[C@H](O)[C@H]2CC(C)(C)C[C@H]21
14100	FC1=C/C=C2/C=C\\C(=C1F)CCc1ccc(cc1)CC2
14101	C[C@@]1([C@H]2CC[C@]3(C)[C@H](CC[C@]3(C)O)[C@@H]2F)C=CC(=O)C=C1F
14102	F[C@H]1C[C@@H](F)[C@@H]2CCC[C@@H]12
14103	O=c1c(O)c(F)oc(CCl)c1F
14104	CC1=C(F)C(C)(C)[C@@H](F)CC1
14105	C/C=C1\\CN(F)[C@H]2C[C@@H]1[C@@H](C(=O)OC)[C@@]13CC(=O)O[C@@]21N(F)c1ccccc13
14106	Cc1cc2cc(F)c1CCc1c(C)cc(cc1F)CC2
14107	CC(=O)SC1CN(F)N(F)C1
14108	CC1(C)CCC[C@@](C)([C@H]2[C@@H]3C[C@@H]4C[C@@]2(F)C[C@]4(C)O3)[C@H]1F
14109	Cc1cc(C)c(F)c(-c2cc(C)cc(C)c2F)c1
14110	CC1(C)CCC[C@]2(C)[C@@H]1[C@H](O)C=C(F)[C@@]2(O)F
14111	Fc1cc2cc3cc(F)sc3cc2s1
14112	COC(=O)[C@]1(C)CC[C@H]2[C@](F)(CC[C@@H]3[C@@](C)(F)CCC[C@]32C)C1
14113	FN1CCc2c([nH]c3ccc(Br)cc23)[C@@H]1[C@H]1CCCN1F
14114	CC1=C(F)C(C)(C)CC[C@H]1F
14115	Cc1ccc(F)c(C)c1F
14116	C/C=c1/c2c(/c(=C\\C)c3c1[C@@H](C)[C@H](F)C[C@H]3C)[C@H](C)C[C@@H](F)[C@H]2C
14117	CC(=O)Oc1c(Br)c(F)c(F)c(Br)c1Br
14118	CN1C=C(F)[C@H]2C[C@@H]1C(F)=CN2C
14119	C/C(F)=C/c1ccc(F)o1
14120	Oc1ccc2c(F)cc(F)nc2n1
14121	C[C@@]12CCC(=O)C=C1CC[C@@H]1[C@H]2[C@@H](O)C[C@]2(F)[C@H](C(=O)F)CC[C@H]12
14122	FN1CCN(F)c2ccccc2NC(S)=NCCN=C(S)Nc2ccccc21
14123	Fc1c2c(cc3c1CC1(C3)Cc3cc4c(c(F)c3C1)CCC4)CCC2
14124	Cc1c2cc(F)c(c1C)CCc1c(F)cc(c(C)c1C)CC2
14125	CC(C)(C)c1ccc2c(F)c3ccccc3c(F)c2c1
14126	CC(C)(C)S(=O)(=O)c1cc(F)sc1F
14127	FC1=Cc2ccccc2C=C(F)O1
14128	O=C1c2ccccc2-c2c(F)ccc(F)c21
14129	FN1CCOCCN(F)c2ccccc2NCCOCCNc2ccccc21
14130	F[C@]12CCCC[C@@]1(F)C2
14131	Cc1cc2c(cc1C)[C@H](F)c1ccccc1[C@@H]2F
14132	Fc1ccc2nc(F)cn2c1
14133	FC1=CC=CC=C(C2=CC=CC=C(F)C2)C1
14134	C/C=c1/c2c(c3c(/c1=C\\C)[C@@H](C)C[C@H](F)[C@@H]3C)[C@@H](C)[C@@H](F)C[C@@H]2C
14135	Fc1nc2c(F)nn(-c3ccccc3)c2o1
14136	Fc1ccc2c(c1)[nH]c1cc(F)ccc12
14137	COc1cc(F)c2c(c1C)OC(=O)c1c(C)c(Cl)c(O)c(F)c1O2
14138	COc1ccc2c(c1F)Oc1ccc(O)c(F)c1O2
14139	CC(C)/C(F)=C\\F
14140	FC1=C(F)[C@H]2c3ccccc3[C@@H]1c1ccccc12
14141	O[C@H]1CC[C@H]2[C@H](OF)[C@H](F)[C@@H]12
14142	Oc1c(F)cc(C(F)(C(F)(F)F)C(F)(F)F)cc1F
14143	Cc1cc(N(C)C)c(F)cc1F
14144	F[C@H]1[C@H]2CC=CC[C@@H]2[C@H](F)[C@@H]2CC=CC[C@@H]12
14145	FC1C2C3CC4C2C(F)C2C5CC(C12)C1C3C4C51
14146	F[C@H]1OC2(CCCCC2)O[C@H]1[C@H]1OC2(CCCCC2)O[C@@H]1F
14147	CS[C@]1(F)C[C@H]1F
14148	CC1(C)C=C(c2ccc(F)s2)CC(C)(C)N1F
14149	Cc1c(F)c2sccn2c1F
14150	F/C=C/C1=CC2=CC=CC=C3C=C(F)[C@@H]1C[C@H]32
14151	F[C@@]12CC=CC[C@@]1(F)C2
14152	CC1(C)CC2(CC(C)(C)c3cc(F)ccc32)c2ccc(F)cc21
14153	FC1=C(Cl)c2cc3c(cc2CC1)CCc1cc2c(cc1-3)C(Cl)=C(F)CC2
14154	CN1C(Cl)=C(F)C(C)(C)C(F)=C1Cl
14155	C[C@@H](F)[C@@H]1O[C@@H](F)[C@H]2OC(C)(C)O[C@H]21
14156	F[C@H]1C[C@@H](c2ccccc2)[C@@H](F)[C@]23OCCO[C@]12OCCO3
14157	O=C1CC[C@H]([C@@H]2CCC(=O)[C@@H](F)C2)C[C@@H]1F
14158	Fc1ccc2ccc3ccc4ccc5ccc6ccc(F)cc6c5c4c3c2c1
14159	FC1=C(F)[C@H]2C=C[C@@H]1C2
14160	Cc1sc(C)c2cc(F)c(F)cc12
14161	FC1=C[C@H]2[C@H]3C=C[C@@H]1C(F)=C[C@@H]23
14162	F[C@H]1C[C@@H]1[C@@H]1C[C@H]1F
14163	FC12CCCC(F)(C1)C2
14164	OC(/C=C/F)=C/F
14165	FC1=C(C2=C(F)CCCCC2)CCCCC1
14166	CCn1c(C)c(F)c(F)c1C
14167	FC1=C(F)[C@@H]2C=C[C@@H]3[C@H]1[C@@H]3C=C2
14168	Fc1c(Cl)nc(Cl)c(F)c1-c1cccc(C(F)(F)F)c1
14169	Fc1ccccc1-c1cc2c(ccc3ccccc32)cc1F
14170	CC1(C)C/C=C(/F)CC/C=C(/F)C[C@H]2O[C@@H]21
14171	CC(O)=Nc1sc(F)cc1F
14172	C[C@]1(F)CCC[C@@]2(C)[C@H]1CC[C@@]1(F)OC(=O)CC[C@@H]12
14173	C[C@@]12OO[C@@H](O1)[C@@H]1C[C@H](F)[C@@H](F)[C@@H]12
14174	Cc1cc2c(ccc3sc(F)c(-c4c(F)sc5ccc6sc(C)cc6c45)c32)s1
14175	F/N=c1/c2ccccc2c2nc3c(nc12)/c(=N/F)c1ccccc13
14176	Fc1sc(-c2cc(C#Cc3ccccc3)c(F)s2)cc1C#Cc1ccccc1
14177	Fc1cn(-c2ccccc2)cc1F
14178	Oc1cc(Cl)c(F)c(O)c1F
14179	COc1c(C)c2c(c(F)c1Cl)Oc1c(F)c(O)c(Cl)c(C)c1C(=O)O2
14180	Cc1[nH]c2c(c1F)Sc1[nH]c(C)c(F)c1S2
14181	O/C=C(F)/C(F)=C/O
14182	Fc1cc2ccccc2c2c1OCOc1c(F)cc3ccccc3c1-2
14183	C#CC1C(F)=CN(c2ccc(C)cc2)C=C1F
14184	Cc1c(F)cc(F)n1C
14185	C#CC1C(F)=CN(c2ccccc2C)C=C1F
14186	CN(C)c1cc(Cl)c(F)cc1F
14187	Fc1cccc2c1[C@H]1c3ccccc3[C@@H]2c2c(F)cccc21
14188	Fc1ccncc1F
14189	Fc1ccc2ccc3ccc4ccc5ccc6ccc(F)c7c6c5c4c3c2c1-7
14190	OC(=NF)c1ccc2c(c1F)Oc1ccccc1O2
14191	C#CC1C(F)=CN(c2cc(C)cc(C)c2)C=C1F
14192	CN1C=CC(=C2C=C(F)S(=O)(=O)C(F)=C2c2ccccc2)C=C1
14193	FC1=CCC=C1F
14194	Fc1c2c(cc3c1CC1(C3)Cc3cc4c(c(F)c3C1)CCCC4)CCCC2
14195	Cc1c(F)ccc2c(F)cccc12
14196	CC1=C(F)[C@H]2[C@H](C(C)C)CC[C@]1(C)[C@@H]2F
14197	Cc1ccc(C)c2cc(F)c(F)cc12
14198	F[C@@H]1c2ccccc2[C@@H](F)c2cc(Cl)ccc21
14199	FC1=CC=C[C@H]1F
14200	FC1=CC[C@@H]2C(Cl)=C(F)C[C@H]12
14201	F[C@H]1[C@H]2C=C[C@@H]([C@H]1C1(F)CC1)C21CC1
14202	Fc1c2ccccc2cc2c(F)c3ccccc3cc12
14203	F[C@H]1[C@H]2c3ccccc3[C@H](c3ccccc32)[C@@H]1F
14204	CC1(C)C[C@@H]2C=C(F)[C@@]3(F)C[C@@]3(C)[C@H]2C1
14205	F[C@@H]1c2ccccc2[C@@H](F)c2cc3ccccc3cc21
14206	F[C@H]1C[C@@H](F)C1
14207	FC1=C(F)c2cc(Cl)ccc2Cc2ccccc21
14208	Fc1cc(F)c2c(c1)CCCCC2
14209	O/C=C1/C=C(F)CC(F)=C1Cl
14210	Cc1c(-c2csc(F)c2C)csc1F
14211	C[C@@]1(O)c2ccoc2[C@H](O)[C@](C)([C@@]2(O)CCCC[C@H]2F)[C@@H]1F
14212	C#CC1C(F)=CN(C(=O)c2ccccc2)C=C1F
14213	Fc1cnc2c(F)sc3nc(-c4ccccc4)cc1-n-3-2
14214	CC(=O)O[C@@H]1C[C@@H](C)[C@H](F)[C@@]2(O)[C@H]1C(C)(C)C[C@]2(C)F
14215	CC(C)(C)c1cc(F)c(F)o1
14216	F/C=C\\[C@@H](F)Br
14217	O=C(OF)OF
14218	Fc1cccc2c1-c1cccc(F)c1-2
14219	F[C@]12CCC[C@@]1(F)C2
14220	CSc1cc(F)cc(F)c1
14221	C/C(C#C/C(C)=C/F)=C\\F
14222	FC1=C(F)[C@H]2C=C[C@@H]1CC2
14223	Oc1ccc(F)c(I)c1F
14224	FC[C@@]12CCCN3CC[C@H]4c5ccccc5N(F)[C@]4(CC1)[C@H]32
14225	C[C@@]12CCCC(F)=C1N(F)c1ccccc12
14226	F[C@]12C=C[C@](F)(OO1)O2
14227	FC1=CC2=CC3=CC4=CC=CC=C(C=C(C=C(C=C(F)C1)C2)C3)C4
14228	CC(=O)n1cc(F)c2c3[nH]cc(F)c3ccc21
14229	O=C(F)[C@@H]1CC2(C[C@H]1F)OCCO2
14230	FNc1cc2c(cc1F)OCO2
14231	F[C@@H]1C[C@@H](F)[C@@H]2CC=C[C@H]12
14232	Cc1ccc(-c2cc(F)cc(F)c2)cc1
14233	O[C@H]1C[C@@H](O)[C@@H](F)[C@H]1CF
14234	Cc1cc(Br)c2c(c1)c(C)c(F)n2F
14235	C=C(F)[C@@H]1CC[C@@H](C)[C@@H]1F
14236	CC(C)(F)[C@H]1C[C@@H](F)c2ccccc21
14237	FN1C=C([C@@H]2CCCN2F)CCC1
14238	FN1c2ccccc2N(F)c2nc3ccccc3nc21
14239	FC1=NNc2c(F)nn(-c3ccccc3)c2O1
14240	FC1=C(C2=C(F)CCC2)CCC1
14241	Oc1c(Br)cc(Br)c(/C=C/F)c1F
14242	C#C[C@@]1(OF)CC[C@@H]2[C@H]3CC[C@H]4Cc5oc(F)cc5C[C@@]4(C)[C@H]3CC[C@]21C
14243	Fc1c(-c2ccc(Cl)cc2)c(F)n2c1sc1ccccc12
14244	CC[C@]1(F)CCCN2CCc3c(n(F)c4ccccc34)[C@H]21
14245	C#CC1C(F)=CN(C(C)=O)C=C1F
14246	Oc1c(F)ccc2cccc(F)c12
14247	Fc1coc(-c2ccc3c(c2)OCO3)c1F
14248	CC1(C)C[C@@H]2C=C(F)[C@]3(F)C[C@]3(C(=O)OC(C)(C)C)[C@H]2C1
14249	C/C=C1\\CN(F)[C@@H]2C[C@H]1[C@@H](C(=O)OC)[C@@]13C[C@H](O)O[C@@]21N(F)c1ccccc13
14250	Fc1ccc(C(F)(F)F)cc1-c1cc(C(F)(F)F)ccc1F
14251	CC/C(F)=C/F
14252	Fc1nc(-c2csc(F)n2)cs1
14253	CC1=C(F)[C@@](C)(F)CCC1
14254	Cc1c(F)cc(F)c(O)c1C
14255	C[C@H]1CC[C@H](CF)[C@@H]1F
14256	FC1=CO[C@H]2O[C@@H]1OC=C2F
14257	Cc1ccc(C)c2c1C[C@@H](OF)[C@@H]1[C@H]2[C@@]2(O)OC[C@]1(F)[C@@H](C)[C@@H]2O
14258	CC1=C(F)C=C(F)/C1=C/O
14259	Fc1cccc2c1Oc1c(F)cccc1N2
14260	CCc1cc(F)cc(F)c1
14261	FC1=CS/C(=C2\\SC=C(F)S2)S1
14262	F/C=C(/F)c1cccs1
14263	C[C@@H]1CCC[C@](C)(F)CCC2=C1[C@@](C)(CF)CC2(C)C
14264	CC(C)(F)[C@H]1CCC[C@H]1F
14265	C#CC1C(F)=CN(C)C=C1F
14266	Fc1c[nH]nc1F
14267	CN1c2ccccc2C(F)=C(N2CCN(F)CC2)c2sccc21
14268	CC(=O)O[C@@H]1CC[C@]2(C)C[C@]2(F)[C@H]1F
14269	Cc1cccc2c(F)c(F)oc12
14270	Cc1cc2c(cc1C)Nc1c(F)sc(F)c1N2
14271	F/C=C\\[C@H](F)I
14272	Cc1cc(-c2cc(C)c(F)[nH]2)[nH]c1F
14273	CCC1=C(F)[C@@H](F)[C@@H](O)CC1
14274	CC(C)(C)C(=O)c1cc(F)[nH]c1F
14275	N#Cc1ccc2c(F)cnc3c(F)sc1-n-2-3
14276	CC1(C)C(=O)[C@H](F)[C@@H](F)C1=O
14277	Fc1cc(Br)c(-c2oc(F)cc2Br)o1
14278	FN1CCN(F)c2ccccc21
14279	Fc1c2ccccc2c(F)c2c(F)cccc12
14280	CC(=O)O[C@@H]1[C@]2(O)CC(C)(C)CC2=C(F)[C@]2(F)C[C@]12C
14281	CC1(C)O[C@@H](F)[C@@H]2[C@H](C(=O)F)C(=O)c3ccccc3[C@]2(C)O1
14282	Fc1c2ccccc2c(F)c2ncccc12
14283	F[C@]12CCCC[C@@]1(F)CC2
14284	CC(=O)[C@H]1C(C)(C)C[C@]2(C)C[C@H](F)C[C@]12F
14285	F[C@H]1[C@H]2CC[C@H](C2)[C@@H]1F
14286	Fc1ccc(-c2ccc(F)cc2Cl)cc1
14287	CN1C=C(F)C=C[C@H]1c1c(F)[nH]c2ccccc12
14288	CC1=C(F)C(C)(C)[C@]2(CC1)OC(C)(C)O[C@H]2[C@@H]1CCCC[C@@H]1F
14289	Cn1cc(F)c2nc3c(F)cnc(O)c3c(-c3ccccc3)c2c1=O
14290	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@H](F)[C@H]3C)[C@@H](C)C[C@H](F)[C@@H]2C
14291	C#CC1C(F)=CN(C(C)(C)C)C=C1F
14292	F[C@H]1c2ccccc2[C@@H](F)c2cccc(Cl)c21
14293	C[C@H]1[C@H](O)C[C@@H]2C(C)(C)[C@@H](O)CC[C@@]2(C)[C@]12Cc1c(O)cc(F)c(F)c1O2
14294	COc1cc(F)c(F)c2c1C[C@@]1(O2)[C@H](C)CC[C@H]2C(C)(C)C=CC[C@@]21C
14295	C#CC1C(F)=CN(c2nc(C)cc(C)n2)C=C1F
14296	Cc1c2ccc3ccc4c(F)cc(ccc5cc(F)c(cc2)c1c5C)c(C)c4c3C
14297	Fc1c[nH]c(-c2nc(F)c[nH]2)n1
14298	CC(=O)O[C@H]1C=C(F)[C@](O)(F)[C@]2(C)CCCC(C)(C)[C@H]12
14299	Fc1ccc2cc1CCc1ccc(F)c(c1)CC2
14300	O[C@@H]1C[C@@H](F)O[C@@H](CF)[C@@H]1O
14301	Fc1ccc(Cl)cc1-c1cc(Cl)ccc1F
14302	O=C1c2ccccc2O[C@H](OF)N1F
14303	Cc1c(F)c(-c2ccccc2F)cc2ccccc12
14304	COc1c(F)sc2c(F)c3cccccc-3c12
14305	F[C@H]1C[C@@H](F)c2c1ccc1cc[nH]c21
14306	COc1cc(O)c(F)c(O)c1F
14307	Cn1cc(F)c2nc3c(F)cn(C)c(=O)c3c(-c3ccccc3)c2c1=O
14308	Cc1cc(C)cc2c(F)cc(F)c-2c1
14309	FN1Cc2ccccc2CN(F)c2cc(Cl)ccc21
14310	CC(=O)O[C@@H]1[C@@H]2C=C(F)[C@@]3(F)C[C@@]3(C)[C@H]2CC1(C)C
14311	CC(C)(C)N(F)/C=C/F
14312	Fc1cc(F)cc([C@@H]2OC=Cc3occc3O2)c1
14313	C[C@@H](F)N(C)F
14314	FC[C@@H]1C=C[C@@H]2[C@@H](F)[C@@H]21
14315	CC1(C)O[C@@H]2[C@H](F)C[C@@H](F)[C@@H]2O1
14316	Cc1cc(Cl)c2c(c1)c(C)c(F)n2F
14317	Fc1oc2c(Cl)cccc2c1F
14318	Oc1c(F)cc(Br)c(O)c1F
14319	COc1c(F)c2c3c(c1F)O[C@@]1(C[C@@H]3CC(C)(C)O2)[C@@H]2CC[C@@H](C2)C1(C)C
14320	Cc1ccc(-c2cc(F)cc(F)c2C)cc1
14321	CC(C)[C@H]1CC[C@@]2(C)[C@@H](F)[C@@H]1[C@H](F)[C@@]2(C)O
14322	CC(C)(C)/C(C#CC#C/C(=C\\F)C(C)(C)C)=C/F
14323	FO[C@@H]1C[C@H]1F
14324	O=c1c(F)cnc2c(F)c3cccccc3n12
14325	F[C@H]1[C@@H]2CC[C@@H](O2)[C@H]1F
14326	Fc1cc(-c2cc(F)c3ccccc3n2)nc2ccccc12
14327	Fc1cc2ccc3[nH]cc(F)c3c2[nH]1
14328	Cc1c(F)c2cc(c1F)CCc1cccc(c1)CC2
14329	FO[C@H]1CC[C@@H]2CN3CCc4c([nH]c5ccccc45)[C@@H]3C[C@@H]2[C@H]1F
14330	Fc1ccc2c(c1)C1(c3ccccc3-2)c2ccccc2-c2ccc(F)cc21
14331	F[C@H]1[C@@H]2C=C[C@@H](C2)[C@H]1F
14332	FC[C@@H]1c2ccccc2CCN1F
14333	CC1=C(C(=O)O)[C@@H]2C=C(F)[C@@]3(F)C[C@@]3(C)[C@@H]2C1
14334	FN1C=C([C@@H]2CCCN2F)CC1
14335	C[C@@]12C(=O)[C@@](C)(C(=O)C(F)=C1O)[C@@]1(C)C(=O)[C@]2(C)C(=O)C(F)=C1O
14336	Fc1c[nH]c(F)c1Cl
14337	CC(C)(C)[C@H]1CN(F)c2ccccc2N1F
14338	Oc1c(Br)c(F)c(F)c(Br)c1Br
14339	Cn1c2ccccc2c2nc3c(nc21)N=C(O)N1[C@H]3OC[C@@H](F)O[C@@H]1F
14340	CC(=O)O/C(F)=C(\\F)Br
14341	Fc1ccc(-c2ccc(F)o2)o1
14342	Cc1c2cc(F)c(c1C)CCc1cc(F)c(c(C)c1C)CC2
14343	Fc1ccccc1-c1ccc2c(F)cccc2c1
14344	O=c1sc2c(s1)SC(F)=C(F)S2
14345	CC1=C(F)[C@](C)(F)c2ccccc21
14346	Fc1cccc2c(F)c3c(F)cccc3c(F)c12
14347	C#CC1C(F)=CN(c2cccc3ccccc23)C=C1F
14348	Cc1ccc2cc(-c3ccccc3F)c(F)c3c2c1CC3
14349	Cc1cc(Br)c2[nH]c(F)c(F)c2c1
14350	Fc1cccc2sc3cccc4cc(F)n(c12)c43
14351	CC1(C)/C=C\\C/C(F)=C\\CC/C(F)=C\\C1
14352	Fc1ccccc1-c1cccnc1F
14353	CC(=O)[C@]1(C)[C@@H](F)C[C@]2(F)CC(C)(C)C[C@H]21
14354	F/C=C(\\F)Br
14355	N#C/C(F)=C\\CF
14356	C[C@@H]1CCc2c(cc(F)c(F)c2F)N1
14357	F/C1=C/C2=Cc3ccccc3C=C(/C=C(/F)C1)C2
14358	Oc1c(F)cc(F)c2c1CCC2
14359	Cc1c(F)n(F)c2c(C)cc(Cl)cc12
14360	FN1CCN(F)c2ccccc2NC(S)=NCCCCN=C(S)Nc2ccccc21
14361	F[C@]12O[C@H]3CC[C@@H]4[C@H]3[C@H]1[C@@H]1[C@H]3[C@@H]5[C@H]6[C@H](CC[C@H]6[C@H]32)O[C@]5(F)[C@H]41
14362	F[C@H]1[C@H]2[C@@H](F)[C@@H]12
14363	Fc1cccc2ccc3c4ccccc4cc(F)c3c12
14364	Fc1cc(I)c(F)[nH]1
14365	Cc1cc2c(cc1F)CC1(C2)Cc2cc(C)c(F)cc2C1
14366	F[C@]12O[C@@]1(F)[C@H]1C[C@@H]2c2ccccc21
14367	Fc1ccc2ccc(F)nc2c1
14368	C=C(F)[C@H]1CC[C@]2(C)CCCC(F)=C2C1
14369	CN1C=C(F)C=C[C@@H]1c1c(F)n(C)c2ccccc12
14370	Cc1ccc2c(F)c3ccccc3c(F)c2c1Cl
14371	C=C1[C@@H](O)CC[C@@](C)(F)[C@@H]1F
14372	FC1=C(F)SC(=C2SC3=C(SCCS3)S2)S1
14373	FC#Cc1ccc(C#CF)s1
14374	Oc1c(F)cc(F)cc1CCl
14375	CC1(C)C[C@H]2[C@@H](C1)[C@@H]1O[C@@]2(C)CC(F)=C1F
14376	F[C@H]1CCCC/C1=C1/CCCC[C@H]1F
14377	OC(=NF)N=C(O)NF
14378	Oc1ccc2c(O)c(F)ccc2c1F
14379	F[C@H]1CCCCCCCC[C@H](F)CCCCCCCC1
14380	C=C1CC[C@H]2[C@@H]([C@@H](C(=C)F)[C@H]1F)C2(C)C
14381	CC1(C)CCC[C@@]2(C)[C@@H]1CC=C(F)[C@]2(O)F
14382	OC1=C(F)CC[C@@H]2C(O)=C(F)CC[C@H]12
14383	FN=C1NN(F)[C@@H](c2ccccc2)S1
14384	Fc1cc(F)cc(CCl)c1
14385	CC1=C(C)[C@H]2CC=C(F)[C@@H](F)[C@@]2(C)CC1
14386	CC1(C)C[C@@H]2C[C@@]3(Oc4c(F)c(O)c(F)c(c42)O1)[C@H]1CC[C@H](C1)C3(C)C
14387	OC1CN=C(S)Nc2ccccc2N(F)CCN(F)c2ccccc2NC(S)=NC1
14388	Fc1cccc2ccc3cccc(F)c3c12
14389	CC1(C)C(=O)[C@H]2O[C@H]2[C@@]2(C)[C@H](F)C(F)=CC[C@@H]12
14390	Fc1cnc2c(F)sc3nc(C(F)(F)F)cc1-n-3-2
14391	Cc1ccc(-c2c(F)c(F)c(Cl)n2C)cc1
14392	O=C1[C@@H](F)C[C@H]2C(=O)[C@H](F)C[C@@H]12
14393	C[C@@H]1C[C@@H](F)C[C@@H]1F
14394	Fc1c[nH]c2cc3[nH]cc(F)c3cc12
14395	F[C@]12CCC[C@@]1(F)CC2
14396	CO[C@@]12OO[C@@H](O1)[C@@H]1C[C@@H](F)[C@@H](F)[C@@H]12
14397	Fc1c2ccc(ccc3ccc(o3)c(F)c3ccc(ccc4ccc1o4)o3)o2
14398	Fc1ccc(F)n1-c1ccccc1
14399	C/C=C1/CN2CC[C@@]34c5ccccc5N(F)[C@H]3[C@@H](F)[C@@H]1C[C@@H]24
14400	Fc1cc2c3ccc(ccc1-3)CCc1ccc3c(F)cc(c-3cc1)CC2
14401	CS(C)=C1C(F)=CC=C1F
14402	CC1(C)C(F)=C(Cl)CC(Cl)=C1F
14403	F/C1=C/C2=CC=CC=C(/C=C(/F)CC1)C2
14404	Oc1c(F)cc(F)c2cccnc12
14405	COc1c(F)cc(C(F)(F)F)cc1F
14406	COC1[C@@H](F)CC[C@@H]1F
14407	FC1=C(F)Sc2sc(=S)sc2S1
14408	CC1(C)[C@@H](O)CC[C@]2(C)[C@H](F)C(F)=CC[C@H]12
14409	O=C1c2ccc(F)cc2C(=O)c2cc(F)ccc21
14410	COc1c(C)c(C)c(O)c(F)c1F
14411	Fc1cc(Br)c(F)[nH]1
14412	Oc1c(F)cc(F)cc1Br
14413	CC(C)(C)c1ccc(F)cc1F
14414	CC1=C(F)[C@@H]([C@@H](C)F)CC1
14415	CC1(C)[C@H]2CC=C(F)[C@]3(C2)[C@H]1CC[C@H]3F
14416	Cn1c(Cl)c(F)c(F)c1-c1ccccc1
14417	Fc1cc(F)c(Cl)s1
14418	Cc1cc(O)c(F)c(C)c1F
14419	Cc1cccc(F)c1-c1cc2ccccc2cc1F
14420	Fc1ccc2sc(F)nc2c1
14421	C/C(F)=C(/C)F
14422	CC1(C)CCC[C@]2(C)[C@@H](F)C(F)=CC[C@H]12
14423	Fc1cccc2c1[C@H]1c3ccccc3[C@@H]2c2cccc(F)c21
14424	C=C(C)[C@H]1C[C@](C)(F)C[C@]1(C)F
14425	F[C@H]1[C@H]2c3ccccc3[C@H](F)[C@@H]12
14426	F[C@H]1C[C@@]12C[C@H]2F
14427	COc1ccc2c(C)nn(F)c3ccc(F)c1c23
14428	Oc1c(F)c2c(c3ccccc13)O[C@@H](CF)C2
14429	FC1=CC=CC=C2C(F)=CC=CC=C12
14430	FC1=C(F)[C@@]23O[C@@H]1C=C2[C@H]1C=C[C@@H]3CC1
14431	FN1C=C([C@H]2c3ccccc3CCN2F)CCC1
14432	COc1c(F)c2c3c(c1F)OC(C)(C)CC3CC(C)(C)O2
14433	FC#Cc1cccc2cc3cccc(C#CF)c3cc12
14434	FN1C2=CCCC[C@@]2(F)c2cc(Cl)ccc21
14435	Fc1ccc(N2CCN(F)CC2)cc1Br
14436	Fc1c(-c2ccccc2)c(F)n2c1sc1ccccc12
14437	CCc1c(F)cc(C)cc1F
14438	Cc1ccc(F)c(-c2ccccc2F)c1
14439	COc1c(F)cc(F)c(O)c1O
14440	O=C1c2ccc(Cl)cc2C(=O)c2c1ccc(F)c2-c1c(F)ccc2c1C(=O)c1cc(Cl)ccc1C2=O
14441	FC1=C[C@@H]2[C@@H]3C=C[C@H]1C=C(F)[C@@H]32
14442	CN1C[C@H](F)C[C@H]1F
14443	FC1=C(Br)[C@@H](F)CCC1
14444	Fc1cc(F)c2cc3ccc4ccc(cc1-2)n43
14445	FC1=CC=CC=C(F)O1
14446	O=C1c2ccccc2C(=O)c2c1c1oc(F)cc1c1cc(F)oc21
14447	CC(C)(F)C#CF
14448	O=C(F)[C@H](F)Br
14449	CC1(C)C[C@H]2C[C@@H](F)[C@@]3(F)C[C@@]3(C)[C@@H]2C1
14450	Fc1nc2ccccc2n1-n1c(F)nc2ccccc21
14451	C#CC1C(F)=CN(C2CCCCC2)C=C1F
14452	F[C@H]1[C@H]2C=C[C@H]3[C@H](F)[C@@H]4C=C[C@@H]1[C@H]4[C@@H]23
14453	F/C=C(\\F)c1cccs1
14454	Fc1ccc(F)c2/c1=c1/cccc/c1=C/C=c1/cccc/c1=2
14455	FC1=CC=CC=C(c2cc3cccccc-3c2F)C1
14456	F[C@@]12O[C@@H](c3ccccc31)[C@@H]1c3ccccc3[C@@]12F
14457	FC#CCCC#CF
14458	Oc1c(F)sc(F)c1O
14459	Fc1cc(F)cc(-c2ccccc2)c1
14460	N#C/C(F)=C/CF
14461	Cn1c(Cl)c(F)c2cc(F)ccc21
14462	O=C1O[C@@H]2CC[C@H](F)[C@H]2[C@@H]1CF
14463	Cc1cc(=O)oc2c(F)c(O)c(CF)cc12
14464	N#Cc1ccc(F)c(F)c1
14465	FC1=C(C2=C(F)CCCC2)CCCC1
14466	C[C@H]1CC[C@H](F)O[C@H]1[C@@H]1O[C@@H](F)CC[C@H]1C
14467	FC1=CC(=C2C=CC=CC=C2)C=C1F
14468	C=C1C[C@H](F)C(F)=C2CC(C)(C)C[C@H]2[C@H]1OC(C)=O
14469	Cc1cc(F)c(C)c2c1[nH]c1ccc(N(C)C)c(F)c12
14470	Fc1ccccc1-c1cc2c(ccc3ccccc32)nc1F
14471	CC(C)(C)OC(=O)n1c2cc(F)ccc2c2ccc(F)cc21
14472	FC(F)(F)[C@]1(F)CC[C@@](F)(C(F)(F)F)CC1
14473	Cn1c(=O)nc(O)c2nc(F)c(F)nc21
14474	Oc1ccc2c(c1F)Oc1ccc(O)c(F)c1O2
14475	O=C1CC[C@H]2[C@H](F)C[C@H]3CC[C@@]12[C@@H]3F
14476	CC(=O)[C@H]1[C@H](F)[C@H]2C=C[C@@H]1[C@@H]2F
14477	Fc1ccccc1-c1c(F)c2ccccc2c2ccccc12
14478	COc1cc2c(cc1F)[C@@]1(C)CC[C@@]3(C)C(Cl)=C(F)CC[C@]3(C)[C@H]1CC2
14479	COc1c(O)cc(F)c(F)c1O
14480	Oc1ccc(F)c(Br)c1F
14481	O/C=C1/C(F)=C(F)c2ccccc21
14482	Cc1ccccc1C1C(F)=CNC=C1F
14483	FC1=C(Cl)NC(Cl)=C(F)C1c1cccc(C(F)(F)F)c1
14484	COc1cc(F)c(Br)c(F)c1
14485	O=C1C=C(F)COc2ccc(F)cc21
14486	C/C=c1\\c2c(/c(=C\\C)c3c1CC[C@H](F)C3)CC[C@@H](F)C2
14487	FC1=C(F)CC1
14488	Fc1cc(Br)c(F)s1
14489	Fc1ccc(F)c2c1Oc1ccccc1O2
14490	Fc1nnn(-c2ccc(Cl)cc2)c1F
14491	Fc1cc(C23C[C@H]4C[C@@H](C2)C[C@@H](C3)C4)c(F)s1
14492	F[C@]12c3ccccc3[C@@H]3[C@H]4C[C@@H]4[C@H]1[C@@]32F
14493	Fc1cnc2ccccc2c1F
14494	C/C(F)=C/[C@@H](C)F
14495	Fc1ccc2c(c1-c1c(F)ccc3c1-c1ccccc1-3)-c1ccccc1-2
14496	CC1(C)CCC[C@]2(C)[C@H]1C(=O)C=C(F)[C@]2(O)F
14497	CC(=O)Oc1c(F)cc(C)cc1F
14498	FC1=C2c3ccccc3CCN2[C@@H]2O[C@H]1N1CCc3ccccc3C1=C2F
14499	FC1=CC=C(F)C2=CC=CC=C1C2
14500	FC1=CC2=Nc3ccccc3N=C3C=C(F)[C@H]1C[C@@H]32
14501	O=c1c2cc3c(cc2c(F)c2n1CC[C@@H]2CF)OCO3
14502	F/C=C\\c1ccccc1F
14503	CCn1c(Cl)c(F)c2cc(F)ccc21
14504	C[C@H]1C[C@H](F)/C=C\\C=C/[C@H](F)C1
14505	CC1(C)[C@]2(C)N=N[C@@]1(C)[C@@H](F)[C@H]2F
14506	O=C1c2ccccc2C(=O)c2c1c(Cl)cc(F)c2-c1c(F)cc(Cl)c2c1C(=O)c1ccccc1C2=O
14507	C[C@@H](F)[C@H]1CCC=C1F
14508	Fc1cccc2c1[C@H]1c3cc4ccccc4cc3[C@@H]2c2c(F)cccc21
14509	Cc1cc(F)c(C)c2c1ccc1ccc3ccc4c(C)cc(F)c(C)c4c3c12
14510	Fc1sc(-c2sc(F)c(Br)c2Br)c(Br)c1Br
14511	Fc1ccc(-c2ccoc2F)[nH]1
14512	C[C@@H]1OC(=O)[C@H](n2c(F)ccc2F)[C@H]1C
14513	C[C@]12CC[C@@H]3[C@H](CC[C@@H]4Cc5oc(F)cc5C[C@@H]34)[C@H]1CC[C@@H]2OF
14514	FC12CCC(F)(C1)C2
14515	Cc1ccc2c(F)cccc2c1F
14516	FN1CCCN(F)c2ccccc21
14517	Oc1cc(O)c(-c2cc(F)c(O)cc2O)cc1F
14518	CC1(C)[C@@H](F)C[C@H]1CF
14519	OC(/C=C\\F)=C\\F
14520	C[C@@H]1C[C@@H](F)C(F)=CC2=C1CC(C)(C)C2
14521	Fc1[nH]c2ccc(Br)cc2c1F
14522	Oc1c(F)ccc(-c2ccccc2)c1F
14523	FOc1c(F)c2ccccc2c2ccccc12
14524	CC(C)(C)S(=O)(=O)c1c(F)csc1F
14525	Fc1ccc2nc3ccc4nc5ccc(F)cc5cc4c3cc2c1
14526	F[C@@H]1C[C@H]2C[C@@H]1[C@@H]1[C@H]2S2=N[S@]1=N[S@@]1=N[S@](=N2)[C@H]2[C@@H]3C[C@@H]([C@H](F)C3)[C@H]21
14527	FC1=COC=C(F)C1/C=C/Cl
14528	O=C1CCN(F)C[C@@H]1CF
14529	COc1ccc2c(c1)[C@@]1(F)CCC[C@](C)(F)[C@H]1CC2
14530	FC1=COC=C(F)C1/C=C\\Cl
14531	Fc1cccc2c1[C@@H]1c3cccc(F)c3[C@H]2[C@@H]2Cc3cc4ccccc4cc3C[C@H]12
14532	Cc1c(C)c(F)c2c(c1C)CCc1c(F)c(C)c(C)c(C)c1CC2
14533	Fc1cc(F)c2c(c1)CCCC2
14534	Cc1csc(F)c1F
14535	F/C=C/C#C/C=C/F
14536	O=c1c(F)cc(F)c2ccccn12
14537	Fc1cc(F)c2ccccc2c1Cl
14538	CC1(C)OC[C@H](CF)[C@H](F)O1
14539	COc1ccc(F)c2c(O)ccc(F)c12
14540	F[C@@H]1C[C@H]2CCC[C@@]2(F)C1
14541	Cc1c2ccc3cc(F)c4ccc(ccc5cc(F)c(cc2)c1c5C)c(C)c4c3C
14542	Fc1ccc2nc3c(ccc4cc5cc(F)ccc5nc43)cc2c1
14543	C=C1CC[C@@H]2[C@@](C)(CCC[C@@]2(C)F)[C@H]1CF
14544	CC(=O)O[C@H]1CC[C@@H]2[C@@H]3C=Cc4c(cc(F)c(Cl)c4F)[C@@H]3CC[C@]12C
14545	Cc1ccc2cc(F)c(F)nc2c1
14546	CC(C)(C)Oc1cc(F)sc1F
14547	FN1CCOCCNc2ccccc2N(F)CCOCCNc2ccccc21
14548	Cc1c(F)ccc(F)c1C
14549	Fc1cc2cnncc2cc1F
14550	Fc1cc(F)c(N2CCCC2)o1
14551	CC(C)(C)c1cc(C(C)(C)C)c(F)cc1F
14552	Oc1c(F)ccc(I)c1F
14553	C[C@H]1CC[C@]2(C)[C@H](CC=C(F)[C@]2(O)F)[C@]12CO2
14554	C[C@]1(F)CC[C@H](CF)C1=O
14555	CC1(C)CCC[C@]2(C)[C@H]1CC=C(F)[C@H]2CF
14556	O=S1(=O)[C@H](F)CC[C@@H]1F
14557	C/C(F)=C\\[C@H](C)F
14558	COc1ccc(F)c(F)c1O
14559	Fc1cc(F)c2ccc3cccc4ccc1c2c43
14560	O[C@@H]1CCN(CF)[C@@H]1F
14561	O=C1C[C@@H](CF)C[C@]2(F)CC(=O)[C@@H]3CCCC[C@H]3[C@@H]12
14562	CCc1cc(F)c(F)cc1O
14563	O/C=C(F)/C(F)=C\\O
14564	F/N=c1/c2ccccc2c2nc3c(nc12)/c(=N\\F)c1ccccc13
14565	O[C@@H]1[C@@H](O)N(F)[C@H](O)[C@@H](O)N1F
14566	Cc1cc(F)oc1F
14567	CC1(C)O[C@@H](F)[C@@H]2[C@H](CF)C(=O)c3ccccc3[C@]2(C)O1
14568	COC(=O)[C@]12C[C@@]1(C=O)C(C=O)=C[C@@H]1CC(C)(C)C[C@H]12
14569	CC1(C)CCC[C@]2(C)[C@H]1CC[C@]1(C=O)C(=O)CC(C=O)=CC[C@H]12
14570	Cc1cc2c(cc1C=O)[C@H]1c3ccccc3[C@@H]2c2cc(C=O)ccc21
14571	CC(C)(C)[C@H]1CC=C(C=O)[C@@H](CC=O)C1
14572	O=C[C@H]1O[C@@H](C=O)C[C@H]1CO
14573	O=C[C@H]1C[C@@H]2C=C[C@H]1[C@H]2C=O
14574	CC1(C)CCC[C@@]2(C)[C@H]1CC[C@H](C=O)[C@@]2(O)C=O
14575	O=C[C@H]1[C@H]2CC[C@H](CC2)[C@@H]1C=O
14576	C[C@@H]1[C@@H](C)N(C=O)c2ccccc2N1C=O
14577	C[C@@H](C#C[C@@H](C)C=O)C=O
14578	C/C=c1/c2c(/c(=C\\C)c3c1[C@H](C)[C@@H](C=O)C[C@@H]3C)[C@H](C)[C@H](C=O)C[C@@H]2C
14579	O=C[C@@H]1CO[C@@H](C=O)O1
14580	CC1(C)CCC=C(C=O)[C@H]1C=O
14581	O=CC1=C2CCc3cc4c5cc3CCC2=C(C=O)/C=C(CC5)\\C(=C/1)CC4
14582	CC[C@@]12C3=CC=C1C(C=O)=C(C=O)C2=CC=C3
14583	C[C@@]12C[C@H]3[C@H]4C[C@@H]1[C@H](C[C@@]4(C)NN3C=O)N(C=O)N2
14584	C=C1[C@@H](O)C[C@@H](CC=O)[C@H]1C=O
14585	CN1C=C[C@H](c2c(C=O)n(C)c3ccccc23)C(C=O)=C1
14586	N=C1N[C@@H]2C[C@H](N1)[C@@H]1N(C=O)[C@](O)(O2)[C@@H]2[C@@H]3C[C@H](NC(=N)N3)O[C@@]1(O)N2C=O
14587	O=C[C@@H]1CC=CC[C@H]1C=O
14588	C[C@H]1CC[C@@H](C=O)[C@@H](C=O)C2=CC(C)(C)C[C@H]21
14589	O=C/N=c1/c2ccccc2c2nc3/c(=N/C=O)c4ccccc4c3nc12
14590	C[C@H]1CC[C@H]2C(C)(C)[C@H](O)CC[C@@]2(C)[C@@]12Cc1c(O)cc(C=O)c(C=O)c1O2
14591	C[C@@]12CC[C@@H]3[C@H](CC[C@@H]4Cc5oc(C=O)cc5C[C@]43C)[C@@H]1CC[C@H]2OC=O
14592	C=C1C[C@](C)(C=O)[C@H](C=O)C[C@H]1O
14593	CC1(C)C[C@@H]2[C@@H](C=C(C=O)[C@]3(C=O)C[C@]23C)[C@@H]1O
14594	COc1cccc2c1CC[C@H]1[C@@](C)(C=O)CCC[C@@]21C=O
14595	O=C[C@@H]1/C=C\\C=C/[C@H](C=O)C/C=C\\1
14596	O=C[C@H]1[C@@H]2C=C[C@@H](CC2)[C@@H]1C=O
14597	CC1(C)[C@@H](C=O)[C@@]2(C#N)C[C@]1(C#N)[C@H](C=O)C2(C)C
14598	C/C(C=O)=C/[C@@H]1[C@H](C=O)C1(C)C
14599	C[C@@H]1CN=C(S)Nc2ccccc2N(C=O)CCN(C=O)c2ccccc2NC(S)=N1
14600	C/C=c1\\c2c(/c(=C\\C)c3c1CC[C@@H](C=O)C3)CC[C@@H](C=O)C2
14601	C[C@@]12CCC=C(C=O)[C@]1(C=O)C2
14602	CN1C(=O)N2[C@@H](OC[C@@H](C=O)O[C@@H]2C=O)c2nc3c4ccccc4n(C)c3nc21
14603	O=CC[C@H]1[C@@H](C=O)[C@H]2CC[C@@H]1C2
14604	COC(=O)[C@H]1CCC[C@](C)(C=O)[C@@H]1C=O
14605	CC1=C(C=O)[C@@H](CC=O)CC1
14606	CC1=C/C(=C2/C=C(C)C(=O)C(C=O)=C2)C=C(C=O)C1=O
14607	C[C@H](C=O)/C=C/C#C[C@@H](C)C=O
14608	CC(=O)O[C@H]1[C@H]2CC(C)(C)CC2=C(C=O)[C@@]2(C=O)C[C@@]12C
14609	CC1=CC2=C(C=O)C3(CC3)[C@@](C)(O)C(=O)C2=C1C=O
14610	O=C[C@H]1CCC[C@@H](C=O)[C@H]2COC[C@@H]12
14611	C[C@]12C=C(C=O)[C@@](O)(C=O)C[C@H]1CCCC2
14612	O=CN1CCC[C@@H]([C@H]2CCCCN2C=O)C1
14613	C[C@H]1C[C@@H](C=O)CC[C@@H]1C=O
14614	Cc1ccc2c(c1)[C@@H](C=O)c1ccccc1[C@H]2C=O
14615	CC1=C(C=O)[C@@]2(C)[C@H](OC=O)CC[C@H](C)[C@H]2[C@H]2OC(C)(C)O[C@@H]12
14616	CC1(C)O[C@@H]2[C@@H](C=O)O[C@@H](C=O)[C@@H]2O1
14617	CC1=CC[C@@H]([C@H](C)C=O)[C@@H]1C=O
14618	C=C1C[C@@]23C[C@]1(O)CC[C@H]2C1=CCC[C@@](C)(C=O)[C@H]1[C@H]3C=O
14619	C[C@H]1CCC[C@@]2(C)[C@H]1CC=C(C=O)[C@@H]2C=O
14620	CC1(C)CC2=C(C=O)[C@@]3(C=O)C[C@@]3(C)[C@H](O)[C@@]2(O)C1
14621	C[C@H]1CC[C@@H](C=O)[C@@H]1C=O
14622	O=CC1=C(C=O)[C@@H]2O[C@H]1C1=C2[C@@H]2C=C[C@H]1CC2
14623	O=C[C@H]1c2ccccc2[C@@H](C=O)c2cc(F)c3ccccc3c21
14624	O=C[C@@H](O)[C@@H](O)C=O
14625	C[C@@H]1C=C(C=O)C(C=O)=C[C@@H]2CC(C)(C)C[C@@H]12
14626	O=C[C@@H](O)[C@H]1CS[C@H](C=O)O1
14627	C[C@H]1C[C@@H](O)[C@H](CC=O)[C@@H]1C=O
14628	C[C@H]1CC[C@]2(C)C(C=O)=CCC[C@H]2[C@]1(C)CC=O
14629	CC1(C)CCC[C@@]2(C)[C@H]1CC=C(C=O)[C@]2(C)C=O
14630	O=C[C@@H]1[C@@H](C=O)C12c1ccccc1-c1ccccc12
14631	C=C(C=O)[C@@H]1C/C=C(/C)CC/C=C(/C=O)CC1
14632	O=C[C@H]1C[C@H]2[C@H]3OO[C@H](O3)[C@H]2[C@@H]1C=O
14633	O=C[C@H]1C[C@H]1C=O
14634	O=CN1C=C([C@@H]2c3ccccc3CCN2C=O)CCCC1
14635	O=CC[C@H]1CCC[C@H]1C=O
14636	O=C[C@]1(Cl)[C@H]2CC=CC[C@@H]2[C@](Cl)(C=O)[C@H]2CC=CC[C@H]21
14637	CC1=C(C)C[C@@H](C=O)[C@@H](C=O)C1
14638	O=CC[C@@H]1CCc2cccc(C=O)c21
14639	CC1(C)CC[C@H](O)[C@]2(C)[C@H](C=O)C(C=O)=CC[C@@H]12
14640	C[C@@H]1C(=O)O[C@H]2/C=C(/C=O)CC/C=C(/C=O)CC[C@@H]12
14641	C[C@]1(CC=O)CC[C@]2(O)CC[C@@]1(C)[C@@]2(C)C=O
14642	N#CC1=C(c2ccc(Cl)cc2)[C@H](C=O)S/C1=C\\C=O
14643	C/C(C=O)=C/C=C(\\C)C=O
14644	O=CO[C@H]1Cc2ccccc2N(C=O)C1
14645	CC(=O)O[C@@H]1CC[C@H]2C[C@@]2(C=O)[C@@H]1C=O
14646	COC(=O)C1=C(C)C[C@@H]2[C@H]1C=C(C=O)[C@]1(C=O)C[C@]21C
14647	O=CC1=CC[C@@H](C=O)CC1
14648	O=CN1CCN(C=O)[C@H](c2ccccc2)c2ccccc2C1
14649	CC(=O)O[C@H]1[C@H]2CC(C)(C)C[C@@H]2[C@@]2(C)C[C@@]2(C=O)[C@@H]1C=O
14650	CCOC(=O)N1C[C@H](C=O)CC[C@H]1C=O
14651	C=C1[C@@H](C)CC[C@]2(C)[C@@H]1CC=C(C=O)[C@]2(O)C=O
14652	CN1C[C@H](C=O)[C@H](OC=O)[C@@H]2c3ccccc3CC[C@H]21
14653	O=CC1=C(C=O)/C=C\\C=C/C=C1
14654	C=C(C=O)[C@H]1C[C@@H](O)C(C)=C1C=O
14655	CC1(C)C2C3C(C)(C)C4(O)C(=O)C3(C=O)C4(Cl)C3(Cl)C(=O)C1(O)C23C=O
14656	C[C@@]12CC[C@H]3[C@H](CC[C@]4(/C=C/C=O)CC(=O)CC[C@]34C)[C@H]1CC[C@H]2C=O
14657	O=Cc1ccc2c(c1)CC[C@H]1CCc3cc(C=O)ccc3[C@H]21
14658	C[C@@H]1CCC[C@@](C)(C=O)[C@@H]1C=O
14659	C[C@H]1CC[C@@H]([C@@H](C)C=O)[C@@H]1C=O
14660	C[C@@H]1CN(C=O)CCN1C=O
14661	CC[C@@]1(C=O)CC=C(C=O)CC1
14662	CC1(C)C=C[C@@H](O)[C@]2(C)[C@H]1CC=C(C=O)[C@@H]2C=O
14663	C/C(C=O)=C/CC=O
14664	CC1(C)CCC[C@]2(C)[C@@H]1CC[C@@]1(C)[C@H](C=O)C(C=O)=CC[C@@H]12
14665	CC(C)(C#C/C=C/C#CC(C)(C)C=O)C=O
14666	C[C@H]1CC[C@H]2C(C)(C)[C@H](O)[C@@H](O)C[C@]2(C)[C@@]12Cc1c(O)cc(C=O)c(C=O)c1O2
14667	CC1=CC(=O)[C@@]23CCC[C@@]12[C@H](C=O)C[C@]3(C)C=O
14668	O=C[C@H]1[C@@H]2CC3=C(C[C@H]4[C@H](C=O)[C@@H]4C3)C[C@@H]12
14669	C[C@@]1(CC=O)CCCC[C@@]1(C)C=O
14670	O=C/C=C/c1ccc(C=O)s1
14671	O=C[C@@H]1[C@@H]2CC[C@@H](c3ccccc32)[C@H]1C=O
14672	O=C[C@H]1CC/C=C\\CC/C=C\\CC[C@H]1C=O
14673	C[C@@H]1C=C(C=O)[C@H](C=O)[C@H](O)[C@H]2CC(C)(C)C[C@@H]12
14674	O=CC1=C(C=O)C2=C/C=C(\\C=C/1)CCc1ccc(cc1)CC2
14675	C[C@]1([C@@H]2CC[C@@]3(C)[C@H](CC[C@@]3(C)O)[C@@H]2C=O)C=CC(=O)C=C1C=O
14676	O=C[C@H]1C[C@@H](C=O)[C@@H]2CCC[C@H]12
14677	CC1=C(C=O)C(C)(C)[C@@H](C=O)CC1
14678	C/C=C1/CN(C=O)[C@@H]2C[C@H]1[C@H](C(=O)OC)[C@@]13CC(=O)O[C@@]21N(C=O)c1ccccc13
14679	CC1(C)CCC[C@](C)([C@@H]2[C@@H]3C[C@@H]4C[C@@]2(C=O)C[C@]4(C)O3)[C@@H]1C=O
14680	CC1(C)CCC[C@]2(C)[C@H]1[C@H](O)C=C(C=O)[C@@]2(O)C=O
14681	COC(=O)[C@@]1(C)CC[C@H]2[C@@]3(C)CCC[C@@](C)(C=O)[C@@H]3CC[C@@]2(C=O)C1
14682	O=CN1CCC[C@H]1[C@@H]1c2[nH]c3ccc(Br)cc3c2CCN1C=O
14683	CC1=C(C=O)C(C)(C)CC[C@@H]1C=O
14684	C/C=c1\\c2c(/c(=C/C)c3c1[C@@H](C)[C@H](C=O)C[C@@H]3C)[C@H](C)C[C@H](C=O)[C@@H]2C
14685	CN1C=C(C=O)[C@@H]2C[C@H]1C(C=O)=CN2C
14686	C/C(C=O)=C/c1ccc(C=O)o1
14687	C[C@@]12CCC(=O)C=C1CC[C@H]1[C@@H]2[C@H](O)C[C@]2(C=O)[C@@H](C(=O)C=O)CC[C@H]12
14688	O=C[C@]12CCCC[C@@]1(C=O)C2
14689	Cc1cc2c(cc1C)[C@H](C=O)c1ccccc1[C@H]2C=O
14690	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@H](C=O)[C@@H]3C)[C@@H](C)[C@@H](C=O)C[C@@H]2C
14691	O=CO[C@H]1[C@@H](C=O)[C@H]2[C@@H](O)CC[C@H]21
14692	O=C[C@H]1[C@H]2CC=CC[C@@H]2[C@@H](C=O)[C@@H]2CC=CC[C@H]12
14693	O=CC1C2C3CC4C2C(C=O)C2C5CC(C12)C1C3C4C51
14694	O=C[C@@H]1OC2(CCCCC2)O[C@@H]1[C@H]1OC2(CCCCC2)O[C@H]1C=O
14695	CS[C@@]1(C=O)C[C@@H]1C=O
14696	O=C/C=C/C1=CC2=CC=CC=C3C=C(C=O)[C@@H]1C[C@H]32
14697	C[C@H](C=O)[C@@H]1O[C@@H](C=O)[C@H]2OC(C)(C)O[C@@H]12
14698	O=C[C@@H]1C[C@H](c2ccccc2)[C@@H](C=O)[C@]23OCCO[C@]12OCCO3
14699	O=C[C@H]1C[C@@H]([C@@H]2CCC(=O)[C@@H](C=O)C2)CCC1=O
14700	O=C[C@H]1C[C@H]1[C@@H]1C[C@H]1C=O
14701	CC1(C)C/C=C(/C=O)CC/C=C(/C=O)C[C@H]2O[C@@H]21
14702	C[C@]1(C=O)CCC[C@@]2(C)[C@H]1CC[C@]1(C=O)OC(=O)CC[C@@H]12
14703	C[C@@]12OO[C@@H](O1)[C@@H]1C[C@@H](C=O)[C@@H](C=O)[C@@H]12
14704	CC1=C(C=O)[C@@H]2[C@@H](C(C)C)CC[C@@]1(C)[C@@H]2C=O
14705	O=C[C@H]1c2ccccc2[C@H](C=O)c2cc(Cl)ccc21
14706	O=CC1=CC=C[C@@H]1C=O
14707	O=CC1=CC[C@H]2C(Cl)=C(C=O)C[C@@H]12
14708	O=C[C@H]1[C@H](C2(C=O)CC2)[C@@H]2C=C[C@H]1C21CC1
14709	CC1(C)C[C@@H]2C=C(C=O)[C@@]3(C=O)C[C@@]3(C)[C@@H]2C1
14710	O=C[C@@H]1c2ccccc2[C@@H](C=O)c2cc3ccccc3cc21
14711	O=C[C@H]1C[C@H](C=O)C1
14712	O=CC1=C/C(=C\\O)C(Cl)=C(C=O)C1
14713	C[C@]1(O)c2ccoc2[C@H](O)[C@](C)([C@]2(O)CCCC[C@H]2C=O)[C@@H]1C=O
14714	CC(=O)O[C@H]1C[C@H](C)[C@H](C=O)[C@]2(O)[C@H]1C(C)(C)C[C@@]2(C)C=O
14715	C/C(C#C/C(C)=C/C=O)=C\\C=O
14716	O=CC1=CC2=CC3=CC4=CC=CC=C(C=C(C=C(C=C(C=O)C1)C2)C3)C4
14717	O=C[C@H]1C[C@@H](C=O)[C@@H]2C=CC[C@H]12
14718	O=CC[C@H]1[C@@H](O)C[C@H](O)[C@@H]1C=O
14719	C=C(C=O)[C@H]1CC[C@H](C)[C@@H]1C=O
14720	CC(C)(C=O)[C@@H]1C[C@@H](C=O)c2ccccc21
14721	C#C[C@@]1(OC=O)CC[C@H]2[C@H]3CC[C@@H]4Cc5oc(C=O)cc5C[C@@]4(C)[C@@H]3CC[C@]21C
14722	CC[C@]1(C=O)CCCN2CCc3c(n(C=O)c4ccccc34)[C@@H]21
14723	C/C=C1\\CN(C=O)[C@@H]2C[C@H]1[C@@H](C(=O)OC)[C@]13C[C@@H](O)O[C@]21N(C=O)c1ccccc13
14724	CC1=C(C=O)[C@@](C)(C=O)CCC1
14725	C[C@@H]1CC[C@H](CC=O)[C@@H]1C=O
14726	Cc1ccc(C)c2c1C[C@@H](OC=O)[C@H]1[C@H]2[C@]2(O)OC[C@@]1(C=O)[C@H](C)[C@H]2O
14727	CC1=C(C=O)C=C(C=O)/C1=C/O
14728	C[C@H]1CCC[C@@](C)(C=O)CCC2=C1[C@@](C)(CC=O)CC2(C)C
14729	CC(C)(C=O)[C@H]1CCC[C@@H]1C=O
14730	O=C/C=C\\[C@@H](I)C=O
14731	CCC1=C(C=O)[C@@H](C=O)[C@@H](O)CC1
14732	CC1(C)C(=O)[C@H](C=O)[C@@H](C=O)C1=O
14733	CC(=O)O[C@@H]1[C@@]2(O)CC(C)(C)CC2=C(C=O)[C@@]2(C=O)C[C@@]12C
14734	CC1(C)O[C@@H](C=O)[C@@H]2[C@@H](C(=O)C=O)C(=O)c3ccccc3[C@]2(C)O1
14735	CC(=O)[C@@H]1C(C)(C)C[C@]2(C)C[C@H](C=O)C[C@]12C=O
14736	C/C=c1/c2c(c3c(/c1=C\\C)[C@H](C)C[C@H](C=O)[C@@H]3C)[C@H](C)C[C@@H](C=O)[C@@H]2C
14737	O=C[C@H]1c2ccccc2[C@H](C=O)c2c(Cl)cccc21
14738	C[C@H]1[C@H](O)C[C@@H]2C(C)(C)[C@@H](O)CC[C@@]2(C)[C@@]12Cc1c(O)cc(C=O)c(C=O)c1O2
14739	COc1cc(C=O)c(C=O)c2c1C[C@]1(O2)[C@@H](C)CC[C@H]2C(C)(C)C=CC[C@]21C
14740	Cc1c2ccc3ccc4c(C=O)cc(ccc5cc(C=O)c(cc2)c1c5C)c(C)c4c3C
14741	CC(=O)O[C@H]1C=C(C=O)[C@](O)(C=O)[C@@]2(C)CCCC(C)(C)[C@H]12
14742	O=CC[C@H]1O[C@H](C=O)C[C@H](O)[C@@H]1O
14743	O=C[C@H]1C[C@H](C=O)c2c1ccc1cc[nH]c21
14744	CC(=O)O[C@@H]1[C@@H]2C=C(C=O)[C@@]3(C=O)C[C@@]3(C)[C@H]2CC1(C)C
14745	O=Cc1cc(C=O)cc([C@@H]2OC=Cc3occc3O2)c1
14746	O=CC[C@H]1C=C[C@@H]2[C@H]1[C@H]2C=O
14747	CC1(C)O[C@H]2[C@H](C=O)C[C@@H](C=O)[C@H]2O1
14748	COc1c(C=O)c2c3c(c1C=O)O[C@]1(C[C@H]3CC(C)(C)O2)[C@H]2CC[C@H](C2)C1(C)C
14749	CC(C)[C@@H]1CC[C@]2(C)[C@H](C=O)[C@H]1[C@H](C=O)[C@]2(C)O
14750	O=CO[C@@H]1C[C@H]1C=O
14751	CC1=C(C(=O)O)[C@@H]2C=C(C=O)[C@]3(C=O)C[C@]3(C)[C@H]2C1
14752	C[C@@]12C(=O)C(C=O)=C(O)[C@@](C)(C1=O)[C@]1(C)C(=O)C(C=O)=C(O)[C@@]2(C)C1=O
14753	CC(C)(C)[C@H]1CN(C=O)c2ccccc2N1C=O
14754	Cn1c2ccccc2c2nc3c(nc21)N=C(O)N1[C@@H](C=O)O[C@H](C=O)CO[C@H]31
14755	CC(=O)[C@@]1(C)[C@H]2CC(C)(C)C[C@]2(C=O)C[C@H]1C=O
14756	C[C@H]1CCc2c(cc(C=O)c(F)c2C=O)N1
14757	O=C[C@]12O[C@@H]3CC[C@@H]4[C@H]5[C@H]([C@H]6[C@@H]1[C@@H]1CC[C@H]7O[C@]5(C=O)[C@@H]6[C@H]71)[C@H]2[C@@H]43
14758	C=C(C=O)[C@H]1CC[C@@]2(C)CCCC(C=O)=C2C1
14759	C=C1[C@@H](O)CC[C@](C)(C=O)[C@@H]1C=O
14760	CC1(C)C[C@H]2[C@@H](C1)[C@@H]1O[C@@]2(C)CC(C=O)=C1C=O
14761	O=C[C@H]1CCCC/C1=C1/CCCC[C@H]1C=O
14762	C=C(C=O)[C@H]1[C@@H]2[C@@H](CCC(=C)[C@@H]1C=O)C2(C)C
14763	CC1(C)CCC[C@@]2(C)[C@@H]1CC=C(C=O)[C@]2(O)C=O
14764	O=CC1=C(O)[C@H]2CCC(C=O)=C(O)[C@H]2CC1
14765	O=CN1N=C(N=CO)S[C@H]1c1ccccc1
14766	CC1=C(C)[C@H]2CC=C(C=O)[C@H](C=O)[C@]2(C)CC1
14767	CC1(C)C(=O)[C@H]2O[C@@H]2[C@@]2(C)[C@H](C=O)C(C=O)=CC[C@H]12
14768	O=C[C@H]1C[C@H]2C(=O)[C@@H](C=O)C[C@H]2C1=O
14769	C[C@H]1C[C@@H](C=O)C[C@H]1C=O
14770	CO[C@@]12OO[C@@H](O1)[C@@H]1C[C@@H](C=O)[C@H](C=O)[C@@H]12
14771	O=Cc1c2ccc(ccc3ccc(o3)c(C=O)c3ccc(ccc4ccc1o4)o3)o2
14772	C/C=C1/CN2CC[C@@]34c5ccccc5N(C=O)[C@@H]3[C@@H](C=O)[C@@H]1C[C@@H]24
14773	CC1(C)[C@@H](O)CC[C@]2(C)[C@H](C=O)C(C=O)=CC[C@@H]12
14774	CC1=C(C=O)[C@@H]([C@@H](C)C=O)CC1
14775	CC1(C)[C@H]2CC=C(C=O)[C@@]3(C2)[C@H](C=O)CC[C@H]13
14776	CC1(C)CCC[C@@]2(C)[C@H](C=O)C(C=O)=CC[C@@H]12
14777	C=C(C)[C@@H]1C[C@@](C)(C=O)C[C@]1(C)C=O
14778	O=C[C@H]1c2ccccc2[C@H]2[C@H](C=O)[C@H]12
14779	O=C[C@H]1C[C@]12C[C@H]2C=O
14780	O=CC1=C(C=O)[C@]23O[C@H]1C=C2[C@@H]1C=C[C@H]3CC1
14781	O=CN1C2=CCCC[C@]2(C=O)c2cc(Cl)ccc21
14782	O=CC1=C[C@H]2[C@H]3C=C[C@@H]1C=C(C=O)[C@@H]23
14783	CN1C[C@@H](C=O)C[C@@H]1C=O
14784	O=CC1=C(Br)[C@H](C=O)CCC1
14785	O=CC(=O)[C@H](Br)C=O
14786	CC1(C)C[C@H]2[C@H](C[C@@H](C=O)[C@@]3(C=O)C[C@@]23C)C1
14787	O=C[C@H]1[C@H]2C=C[C@@H]3[C@H]2[C@@H]2[C@@H]1C=C[C@@H]2[C@H]3C=O
14788	O=Cc1ccc(C=O)c2/c1=c1/cccc/c1=C/C=c1/cccc/c1=2
14789	O=CC[C@H]1C(=O)O[C@H]2CC[C@@H](C=O)[C@@H]21
14790	C[C@H]1CC[C@@H](C=O)O[C@@H]1[C@@H]1O[C@@H](C=O)CC[C@H]1C
14791	C=C1C[C@@H](C=O)C(C=O)=C2CC(C)(C)C[C@@H]2[C@H]1OC(C)=O
14792	O=C[C@H]1C[C@@H]2CC[C@@]3(C(=O)CC[C@H]13)[C@H]2C=O
14793	CC(=O)[C@H]1[C@H]2C=C[C@@H]([C@@H]1C=O)[C@H]2C=O
14794	COc1cc2c(cc1C=O)[C@@]1(C)CC[C@]3(C)C(Cl)=C(C=O)CC[C@@]3(C)[C@H]1CC2
14795	O=CC1=C(C=O)c2ccccc2/C1=C/O
14796	C/C=c1/c2c(/c(=C\\C)c3c1C[C@@H](C=O)CC3)C[C@H](C=O)CC2
14797	O=C[C@@]12c3ccccc3[C@H]3[C@H]4C[C@H]4[C@@H]1[C@]32C=O
14798	CC1(C)CCC[C@@]2(C)[C@H]1C(=O)C=C(C=O)[C@@]2(O)C=O
14799	O=CC[C@@H]1CCn2c1c(C=O)c1cc3c(cc1c2=O)OCO3
14800	C[C@H]1C[C@H](C=O)/C=C\\C=C/[C@H](C=O)C1
14801	CC1(C)[C@@]2(C)N=N[C@]1(C)[C@@H](C=O)[C@H]2C=O
14802	C[C@H](C=O)[C@H]1CCC=C1C=O
14803	O=Cc1cccc2c1[C@@H]1c3cc4ccccc4cc3[C@H]2c2c(C=O)cccc21
14804	C[C@@H]1OC(=O)[C@H](n2c(C=O)ccc2C=O)[C@@H]1C
14805	C[C@@]12CC[C@H]3[C@@H](CC[C@@H]4Cc5oc(C=O)cc5C[C@H]43)[C@@H]1CC[C@@H]2OC=O
14806	CC1(C)[C@H](C=O)C[C@@H]1CC=O
14807	O=C[C@H]1C[C@H]2C[C@@H]1[C@H]1[C@@H]2[S@@]2=N[S@]1=N[S@@]1=N[S@](=N2)[C@@H]2[C@@H]3C[C@H]([C@@H]21)[C@H](C=O)C3
14808	COc1ccc2c(c1)[C@@]1(C=O)CCC[C@](C)(C=O)[C@H]1CC2
14809	O=Cc1cccc2c1[C@H]1c3cccc(C=O)c3[C@@H]2[C@@H]2Cc3cc4ccccc4cc3C[C@H]12
14810	C/C(C#C/C(C)=C(\\C)C=O)=C(\\C)C=O
14811	O=C/C=C\\C#C/C=C/C=O
14812	CC1(C)OC[C@H](CC=O)[C@@H](C=O)O1
14813	O=C[C@@H]1C[C@H]2CCC[C@@]2(C=O)C1
14814	Cc1c2ccc3cc(C=O)c4ccc(ccc5cc(C=O)c(cc2)c1c5C)c(C)c4c3C
14815	C=C1CC[C@@H]2[C@@](C)(CCC[C@@]2(C)C=O)[C@@H]1CC=O
14816	CC(=O)O[C@@H]1CC[C@H]2[C@@H]3C=Cc4c(cc(C=O)c(Cl)c4C=O)[C@@H]3CC[C@]21C
14817	C[C@H]1CC[C@@]2(C)[C@H](CC=C(C=O)[C@@]2(O)C=O)[C@@]12CO2
14818	C[C@@]1(C=O)CC[C@@H](CC=O)C1=O
14819	CC1(C)CCC[C@@]2(C)[C@H](CC=O)C(C=O)=CC[C@@H]12
14820	O=C[C@@H]1CC[C@H](C=O)S1(=O)=O
14821	O=CCN1CC[C@@H](O)[C@@H]1C=O
14822	O=CC[C@@H]1CC(=O)[C@H]2[C@@H]3CCCC[C@H]3C(=O)C[C@@]2(C=O)C1
14823	O=CN1[C@@H](O)[C@H](O)N(C=O)[C@H](O)[C@@H]1O
14824	CC1(C)O[C@H](C=O)[C@H]2[C@H](CC=O)C(=O)c3ccccc3[C@@]2(C)O1
14825	O=C(O)C[C@@H]1O[C@H](O[C@@H]2[C@@H](O)[C@@H](O)[C@@H](C(=O)O)C[C@H]2C(=O)O)[C@H](O)[C@@H](O)[C@@H]1O
14826	O=C(O)[C@H]1[C@H](O)[C@H](C(=O)O)[C@H](O)[C@@H](C(=O)O)[C@@H]1O
14827	C[C@@H](C(=O)O)N([C@H](C)C(=O)O)[C@H](C)C(=O)O
14828	O=C(O)[C@@H]1C[C@@H](C(=O)O)[C@H](O[C@@H]2O[C@H](CO)[C@@H](O)[C@@H](C(=O)O)[C@H]2O)[C@H](O)[C@H]1O
14829	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@@H](O[C@@H]2O[C@@H](CO)[C@@H](O)[C@H](O)[C@H]2C(=O)O)[C@@H](O)[C@H]1O
14830	NC(=Nc1nc(N=C(N)C(=O)O)nc(N=C(N)C(=O)O)n1)C(=O)O
14831	O=C(O)[C@H]1CCC[C@@H](C(=O)O)CCC[C@@H](C(=O)O)CCC1
14832	O=C(O)[C@H]1[C@@H](O)[C@@H](C(=O)O)[C@@H](O)[C@H](C(=O)O)[C@@H]1O
14833	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@H](O)[C@H](O)[C@H]1O[C@H]1O[C@H](CO)[C@H](O)[C@H](O)[C@H]1C(=O)O
14834	O=C(O)C1=N[C@H](S(=O)(=O)O)C(C(=O)O)=C(C(=O)O)N1
14835	O=C(O)C1=NS(=O)(=O)NC(C(=O)O)=C1C(=O)O
14836	C[C@@H](C(=O)O)N([C@@H](C)C(=O)O)[C@H](C)C(=O)O
14837	CC(CC(=O)O)(CC(=O)O)CC(=O)O
14838	O=C(O)[C@H]1COC(=O)[C@@H](C(=O)O)COC(=O)[C@@H](C(=O)O)COC1=O
14839	O=C(O)Cc1cc(CC(=O)O)cc(CC(=O)O)c1
14840	O=C(O)C[C@H]1C[C@H](CC(=O)O)C[C@@H](CC(=O)O)C1
14841	O=C(O)C[C@H]1OC(=O)[C@@H](C(=O)O)[C@@H]1C(=O)O
14842	O=C(O)CP(=O)(CC(=O)O)CC(=O)O
14843	O=C(O)CC(CC(=O)O)C(=O)O
14844	CC(C)(C(=O)O)c1cc(C(C)(C)C(=O)O)c(O)c(C(C)(C)C(=O)O)c1
14845	O=C(O)[C@H]1[C@@H](O)[C@@H](C(=O)O)[C@@H](O)[C@@H](C(=O)O)[C@@H]1O
14846	O=C(O)[C@H]1[C@H](O)[C@@H](O)[C@H](CO)O[C@H]1O[C@@H]1[C@@H](C(=O)O)C[C@H](C(=O)O)[C@@H](O)[C@@H]1O
14847	O=C(O)[C@H]1C[C@@H](C(=O)O)[C@@H](O[C@H]2O[C@@H](CO)[C@@H](O)[C@@H](C(=O)O)[C@@H]2O)[C@H](O)[C@H]1O
14848	O=C(O)/C=N\\N=C1C=CC(=NNC(=S)C(=O)O)C=C1
14849	O=C(O)CC(CC(=O)O)CC(=O)O
14850	O=C(O)C[C@H]1C[C@@H](CC(=O)O)C[C@@H](CC(=O)O)C1
14851	O=C(O)C[C@H]1O[C@@H](O[C@H]2[C@@H](O)[C@H](O)[C@@H](C(=O)O)C[C@H]2C(=O)O)[C@H](O)[C@@H](O)[C@@H]1O
14852	C=CC(=O)O.O=CO
14853	O=C(O)C[C@H]1O[C@H](O[C@H]2[C@@H](C(=O)O)C[C@H](C(=O)O)[C@@H](O)[C@@H]2O)[C@H](O)[C@H](O)[C@H]1O
14854	O=C(O)CC[C@H](CC(=O)O)C(=O)O
14855	O=C(O)C[C@H]1O[C@H](CC(=O)O)O[C@@H](CC(=O)O)O1
14856	[H]/N=C(\\C(=O)O)[C@H](C(=O)O)/C(=N\\[H])C(=O)O
14857	O=C(O)[C@@H]1[C@H](O[C@@H]2[C@@H](O)[C@H](O)[C@H](C(=O)O)C[C@H]2C(=O)O)O[C@@H](CO)[C@H](O)[C@@H]1O
14858	O=C(O)C12CN3CC(C(=O)O)(C1)CC(C(=O)O)(C3)C2
14859	O=C(O)[C@@H]1C[C@@H](C(=O)O)[C@H](O[C@@H]2O[C@H](CO)[C@H](O)[C@@H](O)[C@H]2C(=O)O)[C@H](O)[C@H]1O
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.scores (id, sco, user_id, mol_id) FROM stdin;
622	0	9	10985
623	0	9	13212
624	1	9	80
625	0	9	12405
626	0	9	7277
627	0	9	14415
628	1	9	10199
629	1	9	7710
630	1	9	10705
631	1	9	10813
632	1	9	6565
633	0	9	9740
634	0	9	12283
635	1	9	4934
636	1	9	347
637	0	9	10515
638	1	9	2262
639	1	9	10948
640	1	9	6678
641	0	9	13299
642	1	9	7319
643	1	9	6909
644	1	9	8140
645	1	9	4216
646	1	9	13755
647	1	9	5374
648	1	9	523
649	1	9	13462
650	1	9	994
651	0	9	5953
652	1	9	1254
653	0	9	12521
654	0	9	7616
655	0	9	11223
656	1	9	5658
657	1	9	10749
658	0	9	13295
659	1	9	9912
660	1	9	9021
661	0	9	6014
662	0	9	6095
663	1	9	8708
664	0	9	11982
665	0	9	5516
666	1	9	11449
667	1	9	207
668	1	9	4817
669	0	9	13566
670	1	9	12122
671	1	9	8926
672	0	9	11019
673	1	9	8233
675	0	9	3754
676	1	9	1131
677	0	9	9337
678	1	9	7126
679	0	9	2664
680	1	9	8730
681	1	9	4998
682	1	9	9672
683	0	9	6391
684	0	9	12178
685	0	9	9689
686	0	9	839
687	0	9	8512
688	1	9	4569
689	0	9	3746
690	0	9	10714
691	0	9	7760
692	1	9	5512
693	0	9	3639
694	1	9	4851
695	1	9	10466
696	0	9	11748
697	0	9	4020
698	1	9	7746
699	0	9	12284
700	1	9	9129
701	1	9	11120
702	0	9	371
703	0	9	5903
704	1	9	12557
705	0	9	14137
706	1	9	7811
707	1	9	2986
708	1	9	11985
709	0	9	9103
710	1	9	12239
711	1	9	12239
712	1	9	3519
713	1	9	9785
714	0	9	4780
715	0	9	5275
716	1	9	931
717	1	9	931
718	0	9	13192
719	0	9	12794
720	0	9	3142
721	1	9	5273
722	1	9	7293
723	1	9	6687
724	0	9	6399
725	0	9	2911
726	0	9	7441
727	1	9	13218
728	1	9	10658
729	0	9	2167
730	1	9	10511
731	1	9	11153
732	1	9	6799
733	0	9	3041
734	1	9	217
735	0	9	13125
736	1	9	11754
737	1	9	9446
738	0	9	12718
739	0	9	4145
740	0	9	6490
741	0	9	8862
742	1	9	10847
743	1	9	160
744	0	9	10119
745	1	9	949
746	0	9	10742
747	0	9	2613
748	0	9	5859
749	1	9	2864
750	1	9	5669
751	0	9	3577
752	1	9	7903
753	1	9	14
754	0	9	14021
755	0	9	10304
756	0	9	8308
757	1	9	9064
758	1	9	8892
759	0	9	1586
760	1	9	1190
761	1	9	4686
762	1	9	7959
763	1	9	9563
764	1	9	8967
765	1	9	7617
766	0	9	5636
767	0	9	10111
768	1	9	1399
769	1	9	50
770	0	9	2604
771	1	9	11454
772	0	9	3393
773	0	9	3556
774	0	9	9909
775	1	9	9051
776	1	9	6574
777	1	9	4779
778	1	9	2580
779	1	9	2580
780	0	9	9116
781	0	9	9177
782	0	9	9177
783	0	9	1449
784	0	9	6701
785	1	9	11442
786	1	9	87
787	0	9	8703
788	1	9	8
789	0	9	9090
790	0	9	10016
791	0	9	9704
792	0	9	9704
793	1	9	9228
794	0	9	4590
795	1	9	13953
796	0	9	14204
797	1	9	5906
798	0	9	9458
799	0	9	12995
800	0	9	11567
801	0	9	5411
802	0	9	5394
803	0	9	7581
804	1	9	7307
805	0	9	5239
806	0	9	1027
807	0	9	4134
808	0	9	8380
809	1	9	12435
810	0	9	14099
811	1	9	1024
812	0	9	9898
813	0	9	14167
814	0	9	10441
815	1	9	11694
816	0	9	13644
817	0	9	12852
818	0	9	12852
819	0	9	14507
820	0	9	4761
821	0	9	14805
822	0	9	1747
823	0	9	13788
824	1	9	3073
825	0	9	7508
826	0	9	7713
827	0	9	7713
828	0	9	10422
829	0	9	13781
830	1	9	5614
831	0	9	9886
832	1	9	4717
835	1	9	11305
834	1	9	2287
833	0	9	7637
836	0	9	14028
837	0	9	7259
838	0	9	7357
839	0	9	6480
840	0	9	7250
841	0	9	7250
842	0	9	5688
843	0	9	1873
844	1	9	7716
845	1	9	3194
846	0	9	13674
847	0	9	9898
848	1	9	6700
849	1	9	9987
850	0	9	7059
851	0	9	13398
852	0	9	2248
853	0	9	8197
854	1	9	11187
855	0	9	8157
856	0	9	3227
857	0	9	6949
858	0	9	2532
859	0	9	2628
860	1	9	3501
861	1	9	10871
862	0	9	4561
863	0	9	7420
864	0	9	8088
865	0	9	3645
866	0	9	13263
867	0	9	9660
868	0	9	1391
869	1	9	1335
870	0	9	11973
871	0	9	11987
872	1	9	752
873	0	9	7490
874	1	9	8742
875	0	9	4354
876	0	9	6049
877	0	9	10880
878	0	9	10880
879	1	9	11662
880	1	9	10103
881	1	9	528
882	1	9	2269
883	0	9	9217
884	0	9	3855
885	0	9	11560
886	0	9	11054
887	1	9	3538
888	0	9	14681
889	0	9	12382
890	1	9	4704
891	1	9	12668
892	1	9	13279
893	0	9	2245
894	0	9	2292
895	1	9	129
896	1	9	6153
897	1	9	5387
898	0	9	5769
899	1	9	4378
900	1	9	4642
901	0	9	10441
902	0	9	8419
903	0	9	12174
904	1	9	5261
905	1	9	1035
906	1	9	1035
907	0	9	1986
908	0	9	6399
909	1	9	13528
910	0	9	8846
911	0	9	12997
912	1	9	5760
913	0	9	14296
914	0	9	10117
915	0	9	11977
916	0	9	7024
917	0	9	3540
918	0	9	12126
919	1	9	12618
920	1	9	8245
921	0	9	11834
922	1	9	4801
923	1	9	279
924	0	9	11298
925	1	9	727
926	1	9	9075
927	0	9	10812
928	0	9	13674
929	0	9	5276
930	1	9	665
931	0	9	3048
932	0	9	8843
933	0	9	13464
934	1	9	3816
935	0	9	12978
936	0	9	4691
937	0	9	1887
938	1	9	2663
939	1	9	5599
940	1	9	14392
941	1	9	5518
942	0	9	8986
943	0	9	14763
944	0	9	13198
945	0	9	7804
946	0	9	8887
947	0	9	9390
948	0	9	12735
949	0	9	6132
950	1	9	3468
951	0	9	2240
952	0	9	12910
953	1	9	1716
954	1	9	2600
955	0	9	14622
956	1	9	1204
957	0	9	2402
967	1	9	14160
968	0	9	4826
958	1	9	12306
960	0	9	13032
961	1	9	10095
969	1	9	8788
970	0	9	6583
971	1	9	10069
972	1	9	9821
973	0	9	14550
959	1	9	8460
962	1	9	12975
964	0	9	11129
974	0	9	14615
965	0	9	9984
975	1	9	4224
976	0	9	9052
977	1	9	13722
978	1	9	1240
979	0	9	13294
980	0	9	14630
981	1	9	1419
982	0	9	1510
983	0	9	6747
984	1	9	7975
985	0	9	1562
986	0	9	11556
987	0	9	14255
988	0	9	2675
989	1	9	2447
990	1	9	3576
991	1	9	9869
992	0	9	4436
993	0	9	13404
994	1	9	10795
995	1	9	11854
996	1	9	753
997	0	9	14149
998	1	9	11766
999	0	9	8754
1000	1	9	6483
1001	1	9	180
1002	0	9	8723
1003	0	9	11412
1004	1	9	10547
1005	0	9	8583
1006	0	9	8583
1007	1	9	1432
1008	0	9	7423
1009	0	9	11954
1010	0	9	2939
1011	1	9	9513
1012	1	9	10959
1014	0	9	13290
1013	0	9	13043
1015	0	9	4784
1016	0	9	11946
1017	0	9	852
1018	0	9	691
1019	1	9	106
1020	1	9	4916
1021	1	9	9824
1022	0	9	9351
1023	0	9	2974
1024	0	9	2812
1025	0	9	330
1026	0	9	13555
1027	0	9	10371
1028	1	9	217
1029	0	9	11800
1030	1	9	594
1031	1	9	13562
1032	0	9	7350
1033	1	9	11455
1034	0	9	6345
1035	0	9	1121
1036	0	9	9090
1037	0	9	11620
1038	0	9	8929
1039	0	9	6118
1040	0	9	10392
1041	0	9	8594
1042	1	9	2318
1043	1	9	14800
1044	1	9	10660
1045	0	9	6632
1046	1	9	3992
1047	0	9	12413
1048	1	9	3871
1049	0	9	6117
1050	0	9	2798
1051	0	9	11443
1052	0	9	14431
1053	1	9	8758
1054	1	9	8549
1055	1	9	1960
1056	1	9	387
1057	1	9	13395
1058	0	9	14561
1059	1	9	8538
1060	1	9	3575
1061	0	9	5745
1062	0	9	4408
1063	1	9	4228
1064	0	9	11067
1065	0	9	6061
1066	1	9	1746
1067	1	9	9502
1068	0	9	13517
1069	1	9	9671
1070	1	9	7901
1071	0	9	5707
1072	0	9	11292
1073	0	9	14676
1074	0	9	12961
1075	1	9	3128
1076	0	9	14801
1077	0	9	3667
1078	0	9	5908
1079	1	9	11596
1080	1	9	7140
1081	0	9	10974
1082	0	9	9245
1083	0	9	7575
1084	0	9	9577
1085	1	9	12451
1086	0	9	7497
1087	0	9	2096
1088	0	9	2082
1089	0	9	4621
1090	1	9	11945
1091	1	9	1208
1092	0	9	6877
1093	0	9	11036
1094	0	9	13654
1095	0	9	8810
1096	1	9	415
1097	1	9	4987
1098	0	9	9371
1099	1	9	7512
1100	1	9	12576
1101	1	9	285
1102	1	9	6788
1103	1	9	3123
1104	0	9	12835
1105	1	9	7028
1106	0	9	1931
1107	0	9	10426
1108	0	9	3612
1109	0	9	1177
1110	1	9	8116
1111	1	9	1939
1112	0	9	12533
1113	0	9	10748
1114	0	9	13807
1115	0	9	13807
1116	1	9	12546
1117	1	9	6593
1118	1	9	3063
1119	1	9	3063
1120	0	9	2646
1121	1	9	2356
1122	1	9	236
1123	0	9	2551
1124	0	9	11959
1125	0	9	8813
1126	1	9	1030
1127	1	9	1030
1128	0	9	9988
1129	0	9	9988
1130	0	9	7167
1131	0	9	5593
1132	0	9	10262
1133	0	9	2139
1134	0	9	5580
1135	1	9	7888
1136	1	9	7888
1137	0	9	10902
1138	1	9	1118
1139	1	9	1118
1140	0	9	7695
1141	0	9	13882
1142	0	9	13882
1143	1	9	13995
1144	0	9	13691
1145	1	9	12639
1146	1	9	12639
1147	1	9	4283
1148	1	9	8788
1149	0	9	4179
1150	1	9	6887
1151	1	9	12417
1152	1	9	14251
1153	1	9	3928
1154	1	9	2997
1155	0	9	10372
1156	1	9	6610
1157	0	9	4536
1158	0	9	2597
1159	1	9	9459
1160	1	9	9459
1161	0	9	1990
1162	0	9	7288
1163	0	9	2640
1164	0	9	2530
1165	1	9	426
1166	1	9	973
1167	0	9	3403
1168	1	9	135
1169	1	9	135
1170	1	9	9931
1171	0	9	11962
1172	0	9	11962
1173	0	9	7118
1174	1	9	6035
1175	0	9	3615
1176	0	9	3747
1177	0	9	10392
1178	0	9	13988
1179	0	9	14841
1180	0	9	4845
1181	0	9	12125
1182	0	9	6824
1183	0	9	12387
1184	0	9	6673
1185	1	9	12205
1186	1	9	21
1187	1	9	21
1188	0	9	12727
1189	0	9	12788
1190	1	9	10338
1191	1	9	10338
1192	1	9	10940
1193	0	9	9059
1194	1	9	7667
1195	0	9	11721
1196	0	9	8252
1197	1	9	5499
1198	0	9	7951
1199	0	9	2730
1200	1	9	2038
1201	0	9	3286
1202	1	9	11575
1203	1	9	7487
1204	1	9	2346
1205	0	9	2704
1206	1	9	4732
1207	1	9	1379
1208	0	9	13105
1209	0	9	2096
1210	1	9	11583
1211	1	9	5964
1212	1	9	8282
1213	1	9	8788
1214	1	9	9719
1215	1	9	8486
1216	0	9	1754
1217	1	9	3768
1218	0	9	13849
1219	1	9	8404
1220	1	9	6378
1221	0	9	8154
1222	0	9	5181
1223	1	9	9837
1224	0	9	11847
1225	1	9	5884
1226	0	9	12620
1227	1	9	14825
1228	1	9	13474
1229	1	9	8839
1230	1	9	8140
1231	0	9	4871
1232	1	9	11719
1233	0	9	13490
1234	1	9	5662
1235	0	9	6166
1236	0	9	3703
1237	0	9	3703
1238	1	9	791
1239	0	9	2570
1240	0	9	2570
1241	1	9	837
1242	1	9	3103
1243	0	9	1745
1244	0	9	6587
1245	1	9	92
1246	0	9	4012
1247	0	9	5631
1248	0	9	8184
1249	0	9	10723
1250	0	9	10723
1251	0	9	8038
1252	0	9	3485
1253	0	9	4703
1254	0	9	4703
1255	0	9	7777
1256	0	9	7719
1257	0	9	4815
1258	0	9	3059
1259	0	9	7141
1260	1	9	11319
1261	1	9	11319
1262	1	9	3638
1263	1	9	3638
1264	0	9	9454
1265	1	9	616
1266	1	9	12208
1267	1	9	13514
1268	1	9	4177
1269	0	9	10400
1270	1	9	9853
1271	0	9	4815
1272	1	9	13310
1273	0	9	10847
1274	0	9	10847
1275	0	9	8969
1276	0	9	8969
1277	0	9	1737
1278	0	9	13360
1279	0	9	6995
1280	1	9	4859
1281	1	9	13590
1282	1	9	7945
1283	1	9	9992
1284	0	9	14358
1285	0	9	13906
1286	1	9	11995
1287	0	9	7488
1288	1	9	186
1289	0	9	13573
1290	0	9	13565
1291	0	9	13446
1292	0	9	6184
1293	0	9	8732
1294	1	9	1401
1295	0	9	6910
1296	1	9	13568
1297	1	9	2846
1298	0	9	1430
1299	1	9	6402
1300	0	9	12505
1301	0	9	7469
1302	0	9	6886
1303	0	9	6664
1304	1	9	4365
1305	1	9	4325
1306	0	9	280
1307	1	9	4949
1308	1	9	5980
1309	0	9	14503
1310	0	9	14678
1311	1	9	9427
1312	0	9	7011
1313	0	9	10920
1314	0	9	9618
1315	0	9	9211
1316	0	9	2673
1317	1	9	1318
1318	1	9	14762
1319	0	9	7711
1320	1	9	31
1321	0	9	4086
1322	0	9	12831
1323	0	9	6515
1324	0	9	14102
1325	0	9	13158
1326	1	9	11890
1327	0	9	11264
1328	0	9	3028
1329	0	9	11624
1330	1	9	5517
1331	1	9	8793
1332	0	9	12938
1333	0	9	3592
1334	0	9	12449
1335	0	9	13017
1336	0	9	9367
1337	1	9	2003
1338	0	9	3229
1339	0	9	11673
1340	1	9	11929
1341	0	9	8586
1342	1	9	5072
1343	1	9	8750
1344	0	9	370
1345	0	9	13757
1346	0	9	3227
1347	0	9	1959
1348	1	9	574
1349	0	9	8624
1350	1	9	11900
1351	0	9	7756
1352	1	9	6110
1353	0	9	13436
1354	0	9	14396
1355	0	9	1842
1356	0	9	12042
1357	1	9	8724
1358	1	9	12508
1359	0	9	11923
1360	1	9	1190
1361	0	9	7317
1362	0	9	14564
1363	0	9	8745
1364	1	9	2038
1365	1	9	7986
1366	0	9	3755
1367	0	9	4709
1368	1	9	12879
1369	0	9	2057
1370	1	9	3900
1371	0	9	7142
1372	0	9	3493
1373	0	9	2170
1374	0	9	12972
1375	0	9	11539
1376	0	9	14570
1377	0	9	11216
1378	0	9	7644
1379	0	9	12442
1380	0	9	5349
1381	0	9	2055
1382	0	9	3497
1383	0	9	9297
1384	0	9	14519
1385	0	9	4908
1386	0	9	4124
1387	1	9	10208
1388	0	9	475
1389	1	9	1360
1390	0	9	13191
1391	0	9	12655
1392	1	9	503
1393	0	9	3876
1394	0	9	13478
1395	0	9	3467
1396	0	9	3085
1397	1	9	13784
1398	0	9	11119
1399	0	9	4859
1400	0	9	13431
1401	0	9	3429
1402	0	9	10532
1403	0	9	2877
1404	0	9	13990
1405	0	9	11648
1406	1	9	3104
1407	0	9	65
1408	0	9	6782
1409	0	9	14064
1410	1	9	9912
1411	0	9	8516
1412	0	9	4636
1413	1	9	12409
1414	0	9	11373
1415	0	9	6057
1416	0	9	9277
1417	1	9	8800
1418	1	9	377
1419	1	9	712
1420	1	9	12576
1421	0	9	7501
1422	1	9	14295
1423	0	9	5472
1424	1	9	3040
1425	1	9	14790
1426	0	9	13293
1427	0	9	6503
1428	0	9	4296
1429	0	9	7573
1430	1	9	13419
1431	0	9	7489
1432	0	9	8150
1433	0	9	2140
1434	1	9	829
1435	1	9	245
1436	0	9	3784
1437	1	9	851
1438	0	9	12055
1439	0	9	10075
1440	0	9	14480
1441	0	9	12177
1442	0	9	10050
1443	0	9	2001
1444	0	9	5152
1445	0	9	5893
1446	0	9	3994
1447	1	9	3578
1448	1	9	14853
1449	1	9	6564
1450	0	9	10924
1451	0	9	370
1452	0	9	6297
1453	0	9	3589
1454	0	9	9255
1455	0	9	4260
1456	0	9	14662
1457	0	9	7990
1458	0	9	14385
1459	0	9	14385
1460	0	9	13840
1461	0	9	10784
1462	0	9	13431
1463	1	9	2571
1464	0	9	13444
1465	1	9	3538
1466	0	9	12584
1467	0	9	3595
1468	0	9	11747
1469	0	9	914
1470	0	9	14531
1471	0	9	12938
1472	0	9	14375
1473	0	9	2406
1474	0	9	13656
1475	0	9	11109
1476	1	9	8274
1477	0	9	4085
1478	0	9	2578
1479	1	9	4767
1480	0	9	4517
1481	0	9	4517
1482	0	9	13663
1483	0	9	7901
1484	1	9	8183
1485	0	9	7409
1486	1	9	9956
1487	1	9	9462
1488	0	9	10400
1489	0	9	5625
1490	0	9	9113
1491	0	9	1827
1492	0	9	10735
1493	0	9	9718
1494	0	9	13774
1495	0	9	9023
1496	0	9	13337
1497	0	9	9667
1498	0	9	8680
1499	0	9	335
1500	0	9	9361
1501	1	9	1568
1502	1	9	908
1503	1	9	5176
1504	1	9	9969
1505	1	9	6828
1506	0	9	7795
1507	1	9	12269
1508	0	9	14166
1509	1	9	5012
1510	0	9	9304
1511	0	9	4112
1512	1	9	1470
1513	1	9	6750
1514	0	9	12677
1515	0	9	5598
1549	1	9	4944
1516	0	9	7447
1517	0	9	12723
1518	1	9	1133
1519	1	9	12805
1520	0	9	7209
1521	0	9	12169
1522	0	9	4809
1523	0	9	11011
1524	0	9	8069
1525	0	9	4784
1526	0	9	14682
1527	1	9	8872
1528	0	9	14044
1529	0	9	8752
1530	1	9	5393
1531	1	9	11807
1532	0	9	640
1533	0	9	11279
1534	0	9	3824
1535	0	9	7652
1536	0	9	9418
1537	0	9	2518
1538	1	9	8741
1539	0	9	13550
1540	1	9	10178
1541	0	9	8749
1542	0	9	1451
1543	0	9	13428
1544	0	9	8835
1545	0	9	6850
1546	0	9	7657
1547	0	9	5021
1548	0	9	8348
1550	0	9	12128
1551	0	9	7620
1552	1	9	1314
1553	1	9	14836
1554	1	9	10650
1555	0	9	9058
1556	0	9	2005
1557	1	9	226
1558	0	9	10797
1559	1	9	2384
1560	0	9	2134
1561	0	9	7055
1562	1	9	12037
1563	0	9	11676
1564	0	9	12662
1565	0	9	12030
1566	0	9	200
1567	1	9	12782
1568	1	9	673
1569	1	9	7410
1570	1	9	2174
1571	1	9	6238
1572	0	9	6881
1573	0	9	13725
1574	0	9	7090
1575	1	9	11582
1576	1	9	10386
1577	1	9	12865
1578	1	9	1305
1579	1	9	6273
1580	1	9	9162
1581	1	9	1302
1582	0	9	11108
1583	1	9	10810
1584	1	9	5419
1585	0	9	11246
1586	0	9	11757
1587	1	9	1508
1588	0	9	6250
1589	0	9	11275
1590	0	9	473
1591	1	9	10114
1592	0	9	11950
1593	1	9	8935
1594	1	9	962
1595	1	9	10596
1596	0	9	12979
1597	0	9	8628
1598	0	9	13804
1599	1	9	14260
1600	1	9	14527
1601	0	9	9573
1602	1	9	14092
1603	1	9	704
1604	0	9	9946
1605	1	9	5689
1606	0	9	2069
1607	1	9	1413
1608	0	9	14515
1609	1	9	11051
1610	1	9	6539
1611	0	9	7471
1612	0	9	12600
1613	0	9	6644
1614	1	9	8852
1615	0	9	11282
1616	0	9	10109
1617	0	9	10619
1618	1	9	13324
1619	0	9	10824
1620	0	9	6473
1621	1	9	8149
1622	0	9	10143
1623	0	9	10340
1624	0	9	10340
1625	1	9	9114
1626	1	9	10124
1627	0	9	14460
1628	0	9	13074
1629	1	9	127
1630	1	9	8655
1631	1	9	10556
1632	1	9	10556
1633	1	9	1013
1634	0	9	3095
1635	0	9	3095
1636	1	9	1789
1637	0	9	5740
1638	1	9	10407
1639	1	9	532
1640	1	9	532
1641	0	9	3049
1643	0	9	11850
1642	0	9	3049
1644	1	9	7699
1645	0	9	5444
1646	0	9	9508
1647	1	9	334
1648	1	9	1758
1649	1	9	1809
1650	1	9	416
1651	0	9	4510
1652	0	9	11060
1653	0	9	11060
1654	0	9	13439
1655	0	9	13439
1656	0	9	8848
1657	0	9	8848
1658	1	9	10060
1659	1	9	10060
1660	0	9	2392
1661	0	9	2392
1662	0	9	8535
1663	0	9	8535
1664	1	9	10852
1665	0	9	5792
1666	0	9	7700
1667	0	9	14620
1668	1	9	2697
1669	0	9	1113
1670	0	9	2378
1671	0	9	4015
1672	1	9	1375
1673	0	9	10181
1674	0	9	4285
1675	0	9	7392
1676	0	9	1062
1677	1	9	12304
1678	0	9	7745
1679	0	9	11513
1680	0	9	4423
1681	0	9	10036
1682	0	9	11946
1683	1	9	675
1684	0	9	1233
1685	0	9	4074
1686	0	9	5663
1687	0	9	3752
1688	1	9	10097
1689	0	9	2509
1690	1	9	3802
1691	0	9	802
1692	0	9	3650
1693	1	9	1408
1694	0	9	2922
1695	0	9	6179
1696	0	9	12069
1697	0	9	7345
1698	0	9	5368
1699	1	9	377
1700	1	9	12318
1701	0	9	7654
1702	0	9	2308
1703	0	9	12571
1704	1	9	10925
1705	0	9	10514
1706	0	9	13977
1707	0	9	10585
1708	0	9	2747
1709	0	9	4820
1710	0	9	11362
1711	0	9	13645
1712	0	9	13651
1713	0	9	5942
1714	0	9	13651
1715	0	9	12843
1716	0	9	6546
1717	0	9	9007
1718	0	9	14052
1719	1	9	12438
1720	1	9	9425
1721	0	9	2429
1722	1	9	4188
1723	0	9	11673
1724	0	9	2153
1725	0	9	12867
1726	0	9	13809
1727	1	9	279
1728	1	9	932
1729	0	9	2870
1730	0	9	2108
1731	0	9	10742
1732	1	9	3536
1733	0	9	2928
1734	0	9	7359
1735	0	9	7210
1736	0	9	4823
1737	0	9	6468
1738	0	9	14604
1739	0	9	5745
1740	0	9	10734
1741	0	9	9637
1742	0	9	2669
1743	1	9	6750
1744	1	9	10821
1745	0	9	8422
1746	0	9	10791
1747	0	9	1695
1748	1	9	1257
1749	0	9	9071
1750	0	9	2010
1751	0	9	8312
1752	1	9	10934
1753	1	9	4996
1754	0	9	10565
1755	1	9	469
1756	0	9	1820
1757	0	9	2539
1758	0	9	4320
1759	0	9	1623
1760	1	9	14232
1761	1	9	2166
1762	1	9	14637
1763	0	9	12090
1764	0	9	5705
1765	0	9	12016
1766	0	9	4239
1767	0	9	12237
1768	1	9	1290
1769	0	9	12651
1770	0	9	8200
1771	0	9	12157
1772	0	9	8908
1773	1	9	7856
1774	0	9	10489
1775	1	9	11159
1776	1	9	9353
1777	0	9	6922
1778	0	9	5088
1779	0	9	5733
1780	1	9	12375
1781	1	9	2174
1782	0	9	4143
1783	0	9	4464
1784	1	9	13009
1785	0	9	10873
1786	1	9	5217
1787	0	9	12948
1788	1	9	595
1789	1	9	4
1790	0	9	14159
1791	1	9	4775
1792	1	9	267
1793	1	9	4688
1794	1	9	310
1795	0	9	7064
1796	0	9	10347
1797	0	9	8972
1798	1	9	4494
1799	0	9	9589
1800	0	9	13694
1801	1	9	1540
1802	1	9	4571
1803	1	9	610
1804	1	9	8164
1805	0	9	2585
1806	0	9	3083
1807	1	9	5694
1808	1	9	1214
1809	1	9	5361
1810	0	9	3122
1811	0	9	13856
1812	0	9	13663
1813	1	9	14077
1814	0	9	9511
1815	0	9	2136
1816	0	9	8979
1817	1	9	7465
1818	0	9	5705
1819	0	9	2243
1820	1	9	1171
1821	0	9	1599
1822	0	9	10464
1823	0	9	11815
1824	0	9	8850
1825	0	9	9786
1826	1	9	2576
1827	0	9	11638
1828	0	9	11287
1829	0	9	4284
1830	0	9	14687
1831	1	9	2163
1832	1	9	972
1833	1	9	9611
1834	0	9	10782
1835	0	9	2655
1836	0	9	6226
1837	0	9	7886
1838	0	9	14488
1839	0	9	14456
1840	0	9	13727
1841	1	9	3220
1842	1	9	960
1843	1	9	2452
1844	1	9	9213
1845	0	9	11932
1846	0	9	3210
1847	0	9	11541
1848	0	9	4378
1849	0	9	1264
1850	1	9	8335
1851	1	9	6901
1852	1	9	2152
1853	1	9	550
1854	1	9	12445
1855	0	9	14604
1856	1	9	11625
1857	0	9	7595
1858	0	9	11895
1859	0	9	7921
1860	0	9	11132
1861	0	9	12045
1862	0	9	1580
1863	1	9	1332
1864	0	9	13508
1865	0	9	13024
1866	0	9	10067
1867	0	9	11297
1868	1	9	1363
1869	0	9	1974
1870	0	9	12454
1871	0	9	7044
1872	1	9	11929
1873	0	9	13852
1874	0	9	3388
1875	0	9	4304
1876	1	9	11256
1877	1	9	1315
1878	0	9	2222
1879	1	9	8261
1880	1	9	5013
1881	1	9	11388
1882	0	9	6665
1883	0	9	6701
1884	1	9	3676
1885	0	9	8458
1886	0	9	10482
1887	0	9	2587
1888	1	9	1289
1889	1	9	5870
1890	1	9	10931
1891	0	9	13709
1892	1	9	1118
1893	1	9	1075
1894	1	9	4880
1895	0	9	5376
1896	0	9	2706
1897	1	9	281
1898	0	9	9166
1899	1	9	5901
1900	0	9	2036
1901	0	9	7017
1902	1	9	4011
1903	0	9	4096
1904	1	9	9655
1905	0	9	9026
1906	1	9	2504
1907	0	9	6431
1908	0	9	5109
1909	0	9	6961
1910	0	9	10258
1911	1	9	1103
1912	0	9	10756
1913	1	9	1410
1914	0	9	12738
1915	0	9	7414
1916	0	9	10240
1917	1	9	165
1918	0	9	7216
1919	0	9	3694
1920	0	9	10963
1921	0	9	9312
1922	1	9	11565
1923	1	9	8065
1924	1	9	6522
1925	0	9	5789
1926	0	9	13294
1927	0	9	6685
1928	1	9	1152
1929	0	9	4771
1930	0	9	1440
1931	0	9	3001
1932	0	9	9202
1933	0	9	3482
1934	1	9	7492
1935	0	9	12026
1936	0	9	10597
1937	0	9	5173
1938	0	9	1695
1939	0	9	14320
1940	1	9	9789
1941	1	9	2385
1942	0	9	8936
1943	0	9	2602
1944	0	9	7219
1945	1	9	421
1946	0	9	4368
1947	0	9	9365
1948	0	9	3037
1949	1	9	11916
1950	0	9	6439
1951	1	9	13817
1952	0	9	9784
1953	0	9	3719
1954	1	9	5273
1955	1	9	13802
1956	0	9	10528
1957	0	9	9568
1958	1	9	771
1959	0	9	5523
1960	0	9	6089
1961	0	9	8157
1962	0	9	4631
1963	0	9	14089
1964	1	9	3926
1965	0	9	6172
1966	0	9	11091
1967	0	9	10274
1968	1	9	1383
1969	1	9	1582
1970	1	9	7770
1971	0	9	13011
1972	1	9	803
1973	0	9	8050
1974	0	9	1913
1975	1	9	151
1976	0	9	2509
1977	0	9	3042
1978	0	9	10823
1979	0	9	12230
1980	0	9	13478
1981	0	9	2737
1982	1	9	8713
1983	0	9	10379
1984	0	9	3854
1985	0	9	7764
1986	0	9	8160
1987	0	9	7964
1988	0	9	5270
1989	0	9	5749
1990	1	9	4889
1991	0	9	9299
1992	1	9	2028
1993	1	9	12390
1994	0	9	9967
1995	0	9	3415
1996	0	9	1650
1997	1	9	13243
1998	0	9	2563
1999	0	9	12460
2000	0	9	4901
2001	0	9	5112
2002	0	9	13384
2003	1	9	652
2004	1	9	7295
2005	0	9	11970
2006	0	9	13808
2007	0	9	7275
2008	0	9	8057
2009	0	9	4509
2010	0	9	9081
2011	0	9	12709
2012	1	9	9953
2013	0	9	7263
2014	0	9	9925
2015	0	9	13671
2016	0	9	10088
2017	0	9	6529
2018	1	9	4130
2019	0	9	10760
2020	1	9	4769
2021	0	9	13837
2022	0	9	11453
2023	0	9	11917
2024	0	9	4525
2025	0	9	5549
2026	1	9	11460
2027	0	9	6330
2028	1	9	7386
2029	0	9	10212
2030	0	9	6858
2031	1	9	1505
2032	0	9	6085
2033	1	9	13323
2034	0	9	2927
2035	0	9	12028
2036	0	9	7555
2037	0	9	3859
2038	0	9	13908
2039	0	9	5674
2040	0	9	647
2041	0	9	2381
2042	1	9	4828
2043	1	9	711
2044	1	9	14260
2045	1	9	9789
2046	0	9	13873
2047	0	9	9782
2048	0	9	6811
2049	0	9	13860
2050	0	9	10481
2051	1	9	12371
2052	0	9	14804
2053	1	9	8931
2054	0	9	7897
2055	1	9	11480
2056	1	9	6389
2057	0	9	10987
2058	0	9	2045
2059	1	9	850
2060	1	9	8132
2061	0	9	1732
2062	0	9	10817
2063	0	9	9996
2064	0	9	5327
2065	1	9	428
2066	0	9	7961
2067	1	9	8876
2068	0	9	5258
2069	0	9	2321
2070	0	9	9642
2071	0	9	3696
2072	1	9	3927
2073	1	9	14842
2074	1	9	681
2075	0	9	6710
2076	1	9	1209
2077	1	9	12729
2078	0	9	5054
2079	1	9	8343
2080	0	9	13941
2081	1	9	5803
2082	0	9	14790
2083	1	9	11761
2084	0	9	14191
2085	0	9	13941
2086	0	9	4756
2087	0	9	10069
2088	0	9	6918
2089	0	9	12144
2090	0	9	9358
2091	0	9	5611
2092	0	9	1274
2093	1	9	5873
2094	0	9	3064
2095	1	9	6384
2096	0	9	3532
2097	0	9	12635
2098	0	9	9209
2099	0	9	4032
2100	1	9	10037
2101	0	9	3606
2102	1	9	10765
2103	0	9	8930
2104	1	9	8388
2105	1	9	53
2106	0	9	14276
2107	0	9	10643
2108	0	9	14066
2109	0	9	3046
2110	0	9	9414
2111	0	9	12860
2112	0	9	10042
2113	0	9	10194
2114	0	9	3394
2115	0	9	3260
2116	1	9	11829
2117	0	9	5047
2118	0	9	8874
2119	1	9	4271
2120	0	9	5760
2121	0	9	10915
2122	0	9	8942
2123	0	9	9774
2124	0	9	14420
2125	0	9	1849
2126	1	9	13155
2127	1	9	11348
2128	0	9	9241
2129	0	9	10505
2130	0	9	5975
2131	1	9	12410
2132	0	9	4364
2133	1	9	5127
2134	1	9	4818
2135	0	9	3317
2136	0	9	11322
2137	0	9	13822
2138	1	9	3721
2139	0	9	4066
2140	1	9	508
2141	1	9	6816
2142	0	9	4190
2143	0	9	11684
2144	0	9	3236
2145	0	9	5959
2146	1	9	9979
2147	0	9	7688
2148	0	9	4925
2149	1	9	749
2150	0	9	9960
2151	1	9	12481
2152	1	9	4401
2153	0	9	2425
2154	0	9	10249
2155	0	9	8151
2156	0	9	3984
2157	0	9	3958
2158	0	9	3606
2159	0	9	2143
2160	0	9	6658
2161	0	9	11531
2162	0	9	12669
2163	0	9	12237
2164	0	9	7830
2165	0	9	6686
2166	1	9	11775
2167	0	9	2187
2168	1	9	9230
2169	0	9	8084
2170	0	9	1526
2171	0	9	11092
2172	0	9	6504
2173	0	9	5392
2174	0	9	5512
2175	0	9	14814
2176	0	9	936
2177	0	9	6823
2178	0	9	2309
2179	0	9	3073
2180	1	9	1242
2181	0	9	364
2182	0	9	7873
2183	1	9	12526
2184	1	9	442
2185	1	9	5633
2186	0	9	10526
2187	0	9	7154
2188	0	9	8518
2189	1	9	9789
2190	0	9	7381
2191	0	9	6979
2192	0	9	253
2193	1	9	881
2194	0	9	7780
2195	1	9	11610
2196	1	9	149
2197	0	9	7430
2198	0	9	4061
2199	0	9	11508
2200	0	9	7359
2201	1	9	9872
2202	0	9	1679
2203	0	9	3168
2204	1	9	8358
2205	1	9	4840
2206	1	9	1415
2207	0	9	10945
2208	0	9	7944
2209	0	9	7247
2210	0	9	5865
2211	0	9	324
2212	1	9	920
2213	0	9	7180
2214	1	9	477
2215	0	9	3088
2216	0	9	5472
2217	0	9	2491
2218	0	9	12079
2219	0	9	4322
2220	0	9	8996
2221	0	9	9286
2222	0	9	2861
2223	0	9	1041
2224	0	9	5260
2225	0	9	12423
2226	0	9	13385
2227	0	9	13972
2228	0	9	3756
2229	0	9	6198
2230	1	9	7294
2231	1	9	9665
2232	0	9	5683
2233	0	9	7849
2234	0	9	10672
2235	0	9	9238
2236	0	9	9901
2237	0	9	45
2238	0	9	8062
2239	0	9	6258
2240	0	9	9984
2241	0	9	3551
2242	0	9	4264
2243	0	9	611
2244	0	9	1453
2245	0	9	1066
2246	0	9	7898
2247	1	9	9546
2248	0	9	14359
2249	0	9	11107
2250	0	9	7642
2251	0	9	1866
2252	0	9	8809
2253	0	9	11680
2254	0	9	12691
2255	0	9	3836
2256	0	9	695
2257	1	9	1290
2258	0	9	10970
2259	1	9	356
2260	1	9	1330
2261	0	9	13780
2263	1	9	8141
2264	1	9	5846
2262	1	9	90
2265	0	9	14292
2266	0	9	11971
2267	0	9	7164
2268	0	9	10723
2269	1	9	6309
2270	0	9	10702
2271	0	9	10689
2272	0	9	7390
2273	0	9	898
2274	0	9	13350
2275	0	9	3091
2276	0	9	14740
2277	1	9	4062
2278	0	9	8701
2279	0	9	11978
2280	1	9	750
2281	1	9	6387
2282	1	9	14409
2283	0	9	8807
2284	0	9	14037
2285	0	9	2197
2286	0	9	11786
2287	0	9	7517
2288	0	9	5091
2289	1	9	10191
2290	1	9	2038
2291	1	9	807
2292	0	9	10994
2293	0	9	7223
2294	0	9	1715
2295	0	9	3865
2296	0	9	7569
2297	0	9	1880
2298	0	9	8867
2299	0	9	9924
2300	0	9	11732
2301	0	9	13978
2302	0	9	7582
2303	0	9	10032
2304	1	9	8773
2305	1	9	3578
2306	0	9	9848
2307	1	9	5140
2308	0	9	13768
2309	0	9	4793
2310	0	9	10684
2311	0	9	7744
2312	0	9	3204
2313	1	9	14489
2314	1	9	9009
2315	1	9	43
2316	1	9	10337
2317	0	9	840
2318	1	9	9305
2319	0	9	11971
2320	0	9	11390
2321	1	9	12321
2322	1	9	4821
2323	0	9	11512
2324	0	9	9287
2325	0	9	7992
2326	0	9	7508
2327	1	9	4873
2328	0	9	6989
2329	0	9	2418
2330	0	9	1645
2331	1	9	4063
2332	0	9	13506
2333	1	9	9640
2334	0	9	13246
2335	0	9	14223
2336	0	9	10552
2337	0	9	3987
2338	0	9	13439
2339	0	9	6575
2340	1	9	3169
2341	0	9	2361
2342	1	9	5434
2343	0	9	166
2344	1	9	7920
2345	0	9	12931
2346	0	9	3359
2347	0	9	9984
2348	1	9	4055
2349	0	9	4201
2350	0	9	8246
2351	0	9	2416
2352	0	9	1943
2353	0	9	10447
2354	0	9	14283
2355	1	9	11295
2356	1	9	34
2357	0	9	8044
2358	0	9	5538
2359	0	9	2030
2360	0	9	14556
2361	0	9	10154
2362	0	9	9394
2363	0	9	9102
2364	1	9	7675
2365	0	9	10508
2366	0	9	12374
2367	1	9	11598
2368	0	9	5769
2369	0	9	7581
2370	0	9	12016
2371	1	9	10163
2372	1	9	31
2373	0	9	5209
2374	0	9	14145
2375	1	9	4729
2376	0	9	7695
2377	0	9	3189
2378	0	9	2741
2379	0	9	11681
2380	0	9	10884
2381	1	9	4182
2382	0	9	793
2383	1	9	9552
2384	0	9	2022
2385	0	9	4419
2386	0	9	13470
2387	1	9	5551
2388	0	9	1299
2389	0	9	4609
2390	0	9	3782
2391	1	9	2886
2392	1	9	189
2393	0	9	9664
2394	1	9	11610
2395	0	9	6531
2396	0	9	7941
2397	0	9	3527
2398	0	9	1446
2399	0	9	14551
2400	0	9	10987
2401	0	9	13130
2402	0	9	2187
2403	1	9	10541
2404	1	9	10035
2405	0	9	4799
2406	0	9	13902
2407	0	9	9038
2408	0	9	3953
2409	0	9	13181
2410	1	9	6917
2411	0	9	14780
2412	0	9	10733
2413	0	9	10331
2414	1	9	8668
2415	0	9	13079
2416	1	9	8935
2417	1	9	7289
2418	1	9	8426
2419	0	9	12281
2420	1	9	1293
2421	0	9	6907
2422	0	9	9997
2423	1	9	917
2424	0	9	13654
2425	0	9	8874
2426	0	9	3143
2427	1	9	443
2428	1	9	5820
2429	0	9	10908
2430	0	9	1829
2431	0	9	11323
2432	0	9	14788
2433	0	9	11769
2434	0	9	9054
2435	0	9	1309
2436	0	9	8117
2437	0	9	5815
2438	0	9	8551
2439	0	9	11884
2440	0	9	11969
2441	0	9	5009
2442	1	9	4140
2443	1	9	13616
2444	1	9	13616
2445	0	9	8552
2446	0	9	2014
2447	1	9	752
2448	0	9	5439
2449	1	9	11837
2450	0	9	7061
2451	0	9	3379
2452	0	9	6741
2453	0	9	3252
2454	0	9	12174
2455	0	9	8605
2456	0	9	12834
2457	0	9	7126
2458	1	9	6900
2459	1	9	1780
2460	1	9	11259
2461	0	9	11711
2462	1	9	1314
2463	0	9	13341
2464	1	9	14010
2465	1	9	13820
2466	0	9	14778
2467	0	9	3946
2468	0	9	3946
2469	0	9	11671
2470	1	9	3945
2471	0	9	239
2472	0	9	5943
2473	0	9	6633
2474	1	9	2716
2475	0	9	5507
2476	0	9	1683
2477	1	9	12630
2478	1	9	959
2479	1	9	8887
2480	0	9	8196
2481	0	9	13354
2482	1	9	4680
2483	0	9	4702
2484	0	9	12764
2485	0	9	13812
2486	0	9	2579
2487	0	9	12454
2488	1	9	8909
2489	0	9	12498
2490	0	9	9823
2491	1	9	7397
2492	0	9	8336
2493	1	9	9624
2494	1	9	3253
2495	1	9	13209
2496	1	9	439
2497	0	9	8695
2498	0	9	3603
2499	0	9	10505
2500	0	9	12309
2501	0	9	14296
2502	0	9	12950
2503	0	9	13251
2504	1	9	5423
2505	0	9	4256
2506	1	9	10810
2507	0	9	6974
2508	0	9	3109
2509	0	9	10203
2510	0	9	12739
2511	0	9	12565
2512	1	9	7032
2513	1	9	605
2514	0	9	8077
2515	0	9	3756
2516	1	9	769
2517	0	9	4180
2518	0	9	11415
2519	0	9	4407
2520	0	9	2761
2521	0	9	11887
2522	0	9	2736
2523	0	9	9370
2524	0	9	11544
2525	1	9	9959
2526	0	9	7296
2527	0	9	13051
2528	0	9	6582
2529	0	9	10336
2530	0	9	13758
2531	0	9	12697
2532	0	9	9364
2533	0	9	505
2534	1	9	2787
2535	0	9	9674
2536	0	9	3981
2537	0	9	3593
2538	0	9	10402
2539	0	9	10924
2540	1	9	7914
2541	0	9	4720
2542	0	9	11599
2543	0	9	703
2544	0	9	2741
2545	0	9	4173
2546	0	9	12748
2547	1	9	10766
2548	1	9	8129
2549	0	9	6018
2550	1	9	4627
2551	1	9	8802
2552	0	9	14708
2553	0	9	5328
2554	0	9	11740
2555	0	9	12380
2556	0	9	11998
2557	1	9	10338
2558	0	9	12808
2559	1	9	847
2560	1	9	4309
2561	0	9	9793
2562	0	9	2104
2563	0	9	11675
2564	0	9	1751
2565	0	9	11891
2566	1	9	98
2567	0	9	7734
2568	0	9	3266
2569	0	9	10850
2570	0	9	5932
2571	0	9	4841
2572	0	9	4722
2573	0	9	6617
2574	1	9	4654
2575	1	9	5847
2576	0	9	8201
2577	0	9	8618
2578	0	9	11687
2579	0	9	6687
2580	0	9	7410
2581	1	9	847
2582	0	9	3642
2583	0	9	7915
2584	0	9	10757
2585	1	9	4064
2586	0	9	4048
2587	0	9	4265
2588	0	9	10253
2589	0	9	1315
2590	0	9	10642
2591	0	9	8280
2592	0	9	14616
2593	0	9	12816
2594	1	9	10158
2595	1	9	5432
2596	0	9	3601
2597	0	9	12000
2598	0	9	12155
2599	0	9	3198
2600	0	9	3550
2601	1	9	5738
2602	0	9	12429
2603	0	9	3791
2604	1	9	644
2605	1	9	11792
2606	1	9	9684
2607	0	9	8206
2608	1	9	4412
2609	1	9	38
2610	1	9	1226
2611	0	9	11501
2612	1	9	11289
2613	0	9	1808
2614	0	9	13447
2615	1	9	6493
2616	0	9	495
2617	1	9	4675
2618	0	9	9051
2619	1	9	4914
2620	0	9	2463
2621	1	9	8233
2622	0	9	14719
2623	0	9	11699
2624	1	9	13394
2625	0	9	8216
2626	0	9	13286
2627	0	9	3062
2628	1	9	5964
2629	1	9	3264
2630	1	9	5672
2631	0	9	13852
2632	0	9	6988
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.users (id, username, email, password_hash, experience, last_seen) FROM stdin;
9	fts21	fake_email@geemail.com	pbkdf2:sha256:150000$2WAtcxpR$3a01e6988ca2f56249d1071fc94261921e54a0b332258ce7a506d72a385aaef9	\N	2019-07-08 13:17:05.765374
10	stevenbennett	stevenbennett@steven.com	pbkdf2:sha256:150000$WD4klukI$4bb12c4f8ad638aef8b01200cbb9dacade180d9205231e60f8340a6138a21584	\N	2019-07-01 10:20:56.729924
\.


--
-- Name: molecules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example
--

SELECT pg_catalog.setval('public.molecules_id_seq', 14859, true);


--
-- Name: scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example
--

SELECT pg_catalog.setval('public.scores_id_seq', 2632, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: molecules molecules_pkey; Type: CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.molecules
    ADD CONSTRAINT molecules_pkey PRIMARY KEY (id);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: example
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: example
--

CREATE UNIQUE INDEX ix_users_username ON public.users USING btree (username);


--
-- Name: scores scores_mol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_mol_id_fkey FOREIGN KEY (mol_id) REFERENCES public.molecules(id);


--
-- Name: scores scores_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

