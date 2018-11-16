--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: boreek
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    "time" timestamp without time zone,
    client_name text,
    client_phone text,
    client_address text,
    client_email text
);


ALTER TABLE public.orders OWNER TO boreek;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: boreek
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO boreek;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boreek
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_products; Type: TABLE; Schema: public; Owner: boreek
--

CREATE TABLE public.orders_products (
    order_id integer,
    product_id integer,
    quantity integer
);


ALTER TABLE public.orders_products OWNER TO boreek;

--
-- Name: products; Type: TABLE; Schema: public; Owner: boreek
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text,
    price numeric(8,2),
    quantity integer,
    image text
);


ALTER TABLE public.products OWNER TO boreek;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: boreek
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO boreek;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boreek
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: boreek
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: boreek
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: boreek
--

COPY public.products (id, name, price, quantity, image) FROM stdin;
2	Macbook pro 15 mid 2010	250.00	5	10mbp13hero_02.jpg
3	Surface laptop	850.00	10	51RP4JNY6dL._SL1200_.jpg
4	HP chromebook 14	520.00	100	c05916330.png
1	VIZIO CT14-A0	650.00	-3	Vizio-Thin--Light_2.jpg
\.

--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boreek
--

SELECT pg_catalog.setval('public.products_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--
