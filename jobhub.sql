--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Homebrew)
-- Dumped by pg_dump version 14.8 (Homebrew)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO havisdino;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO havisdino;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO havisdino;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO havisdino;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO havisdino;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO havisdino;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO havisdino;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO havisdino;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO havisdino;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO havisdino;

--
-- Name: polls_application; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.polls_application (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    xxx character varying(10),
    profile_id_id bigint NOT NULL,
    recuitment_id_id bigint NOT NULL
);


ALTER TABLE public.polls_application OWNER TO havisdino;

--
-- Name: polls_application_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.polls_application ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: polls_catergory; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.polls_catergory (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.polls_catergory OWNER TO havisdino;

--
-- Name: polls_catergory_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.polls_catergory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_catergory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: polls_company; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.polls_company (
    id bigint NOT NULL,
    company_img character varying(100),
    name character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(12) NOT NULL,
    field character varying(20) NOT NULL,
    description_text text,
    employer integer NOT NULL
);


ALTER TABLE public.polls_company OWNER TO havisdino;

--
-- Name: polls_company_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.polls_company ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: polls_profile; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.polls_profile (
    id bigint NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    dob date NOT NULL,
    phone character varying(12) NOT NULL,
    address character varying(100) NOT NULL,
    country character varying(50) NOT NULL,
    facebook character varying(200) NOT NULL,
    description_text text NOT NULL,
    img character varying(100),
    user_id integer NOT NULL
);


ALTER TABLE public.polls_profile OWNER TO havisdino;

--
-- Name: polls_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.polls_profile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: polls_recuitmentnews; Type: TABLE; Schema: public; Owner: havisdino
--

CREATE TABLE public.polls_recuitmentnews (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    job_descrip text NOT NULL,
    job_demand text NOT NULL,
    salary integer,
    experience_demand interval,
    catergory_id bigint NOT NULL,
    company_id bigint
);


ALTER TABLE public.polls_recuitmentnews OWNER TO havisdino;

--
-- Name: polls_recuitmentnews_id_seq; Type: SEQUENCE; Schema: public; Owner: havisdino
--

ALTER TABLE public.polls_recuitmentnews ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.polls_recuitmentnews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add catergory	1	add_catergory
2	Can change catergory	1	change_catergory
3	Can delete catergory	1	delete_catergory
4	Can view catergory	1	view_catergory
5	Can add company	2	add_company
6	Can change company	2	change_company
7	Can delete company	2	delete_company
8	Can view company	2	view_company
9	Can add recuitment news	3	add_recuitmentnews
10	Can change recuitment news	3	change_recuitmentnews
11	Can delete recuitment news	3	delete_recuitmentnews
12	Can view recuitment news	3	view_recuitmentnews
13	Can add profile	4	add_profile
14	Can change profile	4	change_profile
15	Can delete profile	4	delete_profile
16	Can view profile	4	view_profile
17	Can add application	5	add_application
18	Can change application	5	change_application
19	Can delete application	5	delete_application
20	Can view application	5	view_application
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add permission	7	add_permission
26	Can change permission	7	change_permission
27	Can delete permission	7	delete_permission
28	Can view permission	7	view_permission
29	Can add group	8	add_group
30	Can change group	8	change_group
31	Can delete group	8	delete_group
32	Can view group	8	view_group
33	Can add user	9	add_user
34	Can change user	9	change_user
35	Can delete user	9	delete_user
36	Can view user	9	view_user
37	Can add content type	10	add_contenttype
38	Can change content type	10	change_contenttype
39	Can delete content type	10	delete_contenttype
40	Can view content type	10	view_contenttype
41	Can add session	11	add_session
42	Can change session	11	change_session
43	Can delete session	11	delete_session
44	Can view session	11	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	polls	catergory
2	polls	company
3	polls	recuitmentnews
4	polls	profile
5	polls	application
6	admin	logentry
7	auth	permission
8	auth	group
9	auth	user
10	contenttypes	contenttype
11	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-07-13 15:51:47.724863+07
2	auth	0001_initial	2023-07-13 15:51:47.7673+07
3	admin	0001_initial	2023-07-13 15:51:47.778175+07
4	admin	0002_logentry_remove_auto_add	2023-07-13 15:51:47.7827+07
5	admin	0003_logentry_add_action_flag_choices	2023-07-13 15:51:47.786729+07
6	contenttypes	0002_remove_content_type_name	2023-07-13 15:51:47.794766+07
7	auth	0002_alter_permission_name_max_length	2023-07-13 15:51:47.799898+07
8	auth	0003_alter_user_email_max_length	2023-07-13 15:51:47.803527+07
9	auth	0004_alter_user_username_opts	2023-07-13 15:51:47.80661+07
10	auth	0005_alter_user_last_login_null	2023-07-13 15:51:47.80974+07
11	auth	0006_require_contenttypes_0002	2023-07-13 15:51:47.810975+07
12	auth	0007_alter_validators_add_error_messages	2023-07-13 15:51:47.81532+07
13	auth	0008_alter_user_username_max_length	2023-07-13 15:51:47.82079+07
14	auth	0009_alter_user_last_name_max_length	2023-07-13 15:51:47.824495+07
15	auth	0010_alter_group_name_max_length	2023-07-13 15:51:47.830799+07
16	auth	0011_update_proxy_permissions	2023-07-13 15:51:47.834802+07
17	auth	0012_alter_user_first_name_max_length	2023-07-13 15:51:47.838132+07
18	polls	0001_initial	2023-07-13 15:51:47.872011+07
19	sessions	0001_initial	2023-07-13 15:51:47.878076+07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: polls_application; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.polls_application (id, "time", xxx, profile_id_id, recuitment_id_id) FROM stdin;
\.


--
-- Data for Name: polls_catergory; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.polls_catergory (id, name) FROM stdin;
\.


--
-- Data for Name: polls_company; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.polls_company (id, company_img, name, email, phone, field, description_text, employer) FROM stdin;
\.


--
-- Data for Name: polls_profile; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.polls_profile (id, first_name, last_name, email, dob, phone, address, country, facebook, description_text, img, user_id) FROM stdin;
\.


--
-- Data for Name: polls_recuitmentnews; Type: TABLE DATA; Schema: public; Owner: havisdino
--

COPY public.polls_recuitmentnews (id, name, job_descrip, job_demand, salary, experience_demand, catergory_id, company_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: polls_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.polls_application_id_seq', 1, false);


--
-- Name: polls_catergory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.polls_catergory_id_seq', 1, false);


--
-- Name: polls_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.polls_company_id_seq', 1, false);


--
-- Name: polls_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.polls_profile_id_seq', 1, false);


--
-- Name: polls_recuitmentnews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: havisdino
--

SELECT pg_catalog.setval('public.polls_recuitmentnews_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: polls_application polls_application_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_application
    ADD CONSTRAINT polls_application_pkey PRIMARY KEY (id);


--
-- Name: polls_catergory polls_catergory_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_catergory
    ADD CONSTRAINT polls_catergory_pkey PRIMARY KEY (id);


--
-- Name: polls_company polls_company_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_company
    ADD CONSTRAINT polls_company_pkey PRIMARY KEY (id);


--
-- Name: polls_profile polls_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_profile
    ADD CONSTRAINT polls_profile_pkey PRIMARY KEY (id);


--
-- Name: polls_profile polls_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_profile
    ADD CONSTRAINT polls_profile_user_id_key UNIQUE (user_id);


--
-- Name: polls_recuitmentnews polls_recuitmentnews_pkey; Type: CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_recuitmentnews
    ADD CONSTRAINT polls_recuitmentnews_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: polls_application_profile_id_id_5ff9fdb9; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX polls_application_profile_id_id_5ff9fdb9 ON public.polls_application USING btree (profile_id_id);


--
-- Name: polls_application_recuitment_id_id_94062231; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX polls_application_recuitment_id_id_94062231 ON public.polls_application USING btree (recuitment_id_id);


--
-- Name: polls_recuitmentnews_catergory_id_6120f7a7; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX polls_recuitmentnews_catergory_id_6120f7a7 ON public.polls_recuitmentnews USING btree (catergory_id);


--
-- Name: polls_recuitmentnews_company_id_e575b1db; Type: INDEX; Schema: public; Owner: havisdino
--

CREATE INDEX polls_recuitmentnews_company_id_e575b1db ON public.polls_recuitmentnews USING btree (company_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_application polls_application_profile_id_id_5ff9fdb9_fk_polls_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_application
    ADD CONSTRAINT polls_application_profile_id_id_5ff9fdb9_fk_polls_profile_id FOREIGN KEY (profile_id_id) REFERENCES public.polls_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_application polls_application_recuitment_id_id_94062231_fk_polls_rec; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_application
    ADD CONSTRAINT polls_application_recuitment_id_id_94062231_fk_polls_rec FOREIGN KEY (recuitment_id_id) REFERENCES public.polls_recuitmentnews(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_profile polls_profile_user_id_093c2fb0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_profile
    ADD CONSTRAINT polls_profile_user_id_093c2fb0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_recuitmentnews polls_recuitmentnews_catergory_id_6120f7a7_fk_polls_cat; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_recuitmentnews
    ADD CONSTRAINT polls_recuitmentnews_catergory_id_6120f7a7_fk_polls_cat FOREIGN KEY (catergory_id) REFERENCES public.polls_catergory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_recuitmentnews polls_recuitmentnews_company_id_e575b1db_fk_polls_company_id; Type: FK CONSTRAINT; Schema: public; Owner: havisdino
--

ALTER TABLE ONLY public.polls_recuitmentnews
    ADD CONSTRAINT polls_recuitmentnews_company_id_e575b1db_fk_polls_company_id FOREIGN KEY (company_id) REFERENCES public.polls_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

