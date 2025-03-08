--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-08 02:08:47 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 24590)
-- Name: category; Type: TABLE; Schema: public; Owner: preprod_user
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(100) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.category OWNER TO preprod_user;

--
-- TOC entry 219 (class 1259 OID 24589)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: preprod_user
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_category_id_seq OWNER TO preprod_user;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 219
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preprod_user
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- TOC entry 228 (class 1259 OID 24643)
-- Name: discount; Type: TABLE; Schema: public; Owner: preprod_user
--

CREATE TABLE public.discount (
    discount_id integer NOT NULL,
    product_id integer NOT NULL,
    discount_code character varying(50) NOT NULL,
    discount_percentage numeric(5,2) NOT NULL,
    valid_from date NOT NULL,
    valid_to date NOT NULL,
    max_uses integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.discount OWNER TO preprod_user;

--
-- TOC entry 227 (class 1259 OID 24642)
-- Name: discount_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: preprod_user
--

CREATE SEQUENCE public.discount_discount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.discount_discount_id_seq OWNER TO preprod_user;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 227
-- Name: discount_discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preprod_user
--

ALTER SEQUENCE public.discount_discount_id_seq OWNED BY public.discount.discount_id;


--
-- TOC entry 224 (class 1259 OID 24615)
-- Name: orders; Type: TABLE; Schema: public; Owner: preprod_user
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_amount numeric(10,2) NOT NULL,
    status character varying(50) DEFAULT 'Pending'::character varying
);


ALTER TABLE public.orders OWNER TO preprod_user;

--
-- TOC entry 223 (class 1259 OID 24614)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: preprod_user
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO preprod_user;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preprod_user
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 222 (class 1259 OID 24602)
-- Name: product; Type: TABLE; Schema: public; Owner: preprod_user
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    category_id integer,
    stock integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product OWNER TO preprod_user;

--
-- TOC entry 221 (class 1259 OID 24601)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: preprod_user
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_product_id_seq OWNER TO preprod_user;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preprod_user
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- TOC entry 226 (class 1259 OID 24629)
-- Name: shipment; Type: TABLE; Schema: public; Owner: preprod_user
--

CREATE TABLE public.shipment (
    shipment_id integer NOT NULL,
    order_id integer,
    shipment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    delivery_status character varying(50) DEFAULT 'In Transit'::character varying
);


ALTER TABLE public.shipment OWNER TO preprod_user;

--
-- TOC entry 225 (class 1259 OID 24628)
-- Name: shipment_shipment_id_seq; Type: SEQUENCE; Schema: public; Owner: preprod_user
--

CREATE SEQUENCE public.shipment_shipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipment_shipment_id_seq OWNER TO preprod_user;

--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 225
-- Name: shipment_shipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preprod_user
--

ALTER SEQUENCE public.shipment_shipment_id_seq OWNED BY public.shipment.shipment_id;


--
-- TOC entry 218 (class 1259 OID 24578)
-- Name: users; Type: TABLE; Schema: public; Owner: preprod_user
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO preprod_user;

--
-- TOC entry 217 (class 1259 OID 24577)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: preprod_user
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO preprod_user;

--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: preprod_user
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3237 (class 2604 OID 24593)
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 24646)
-- Name: discount discount_id; Type: DEFAULT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.discount ALTER COLUMN discount_id SET DEFAULT nextval('public.discount_discount_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 24618)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 24605)
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 24632)
-- Name: shipment shipment_id; Type: DEFAULT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.shipment ALTER COLUMN shipment_id SET DEFAULT nextval('public.shipment_shipment_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 24581)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3424 (class 0 OID 24590)
-- Dependencies: 220
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: preprod_user
--

COPY public.category (category_id, category_name, description, created_at) FROM stdin;
\.


--
-- TOC entry 3432 (class 0 OID 24643)
-- Dependencies: 228
-- Data for Name: discount; Type: TABLE DATA; Schema: public; Owner: preprod_user
--

COPY public.discount (discount_id, product_id, discount_code, discount_percentage, valid_from, valid_to, max_uses, is_active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3428 (class 0 OID 24615)
-- Dependencies: 224
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: preprod_user
--

COPY public.orders (order_id, user_id, order_date, total_amount, status) FROM stdin;
\.


--
-- TOC entry 3426 (class 0 OID 24602)
-- Dependencies: 222
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: preprod_user
--

COPY public.product (product_id, product_name, price, category_id, stock, created_at) FROM stdin;
\.


--
-- TOC entry 3430 (class 0 OID 24629)
-- Dependencies: 226
-- Data for Name: shipment; Type: TABLE DATA; Schema: public; Owner: preprod_user
--

COPY public.shipment (shipment_id, order_id, shipment_date, delivery_status) FROM stdin;
\.


--
-- TOC entry 3422 (class 0 OID 24578)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: preprod_user
--

COPY public.users (user_id, username, email, password, created_at) FROM stdin;
\.


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 219
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preprod_user
--

SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 227
-- Name: discount_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preprod_user
--

SELECT pg_catalog.setval('public.discount_discount_id_seq', 1, false);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preprod_user
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preprod_user
--

SELECT pg_catalog.setval('public.product_product_id_seq', 1, false);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 225
-- Name: shipment_shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preprod_user
--

SELECT pg_catalog.setval('public.shipment_shipment_id_seq', 1, false);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: preprod_user
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- TOC entry 3259 (class 2606 OID 24600)
-- Name: category category_category_name_key; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_category_name_key UNIQUE (category_name);


--
-- TOC entry 3261 (class 2606 OID 24598)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3269 (class 2606 OID 24654)
-- Name: discount discount_discount_code_key; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_discount_code_key UNIQUE (discount_code);


--
-- TOC entry 3271 (class 2606 OID 24652)
-- Name: discount discount_pkey; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (discount_id);


--
-- TOC entry 3265 (class 2606 OID 24622)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3263 (class 2606 OID 24608)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3267 (class 2606 OID 24636)
-- Name: shipment shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_pkey PRIMARY KEY (shipment_id);


--
-- TOC entry 3253 (class 2606 OID 24588)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3255 (class 2606 OID 24584)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3257 (class 2606 OID 24586)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3275 (class 2606 OID 24655)
-- Name: discount fk_product; Type: FK CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


--
-- TOC entry 3273 (class 2606 OID 24623)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3272 (class 2606 OID 24609)
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- TOC entry 3274 (class 2606 OID 24637)
-- Name: shipment shipment_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: preprod_user
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


-- Completed on 2025-03-08 02:08:47 UTC

--
-- PostgreSQL database dump complete
--

