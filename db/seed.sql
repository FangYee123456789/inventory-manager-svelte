--
-- PostgreSQL database dump
--

\restrict lFR3eNNljIaN5mErdPN2WKUPg3eylfbUhax3ufZrbmx0byGYLfb4biQTZN5KOlp

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

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

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public.categories (id, name) FROM stdin;
2	Home
3	Condiments
4	Electronics
5	Travel
6	Fitness
7	Health/Protein
8	Tool
1	Accessories
38	Tools
42	brotherrrrrrrr
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public.suppliers (id, name) FROM stdin;
3	Tromp-Swift
4	Volkman-Davis
5	Von LLC
6	Hegmann, O'Kon and Jast
7	Conroy-Homenick
8	Cruickshank LLC
9	Hoppe Group
10	Morissette, Gislason and Nitzsche
1	Hyatt LLC
2	Russel-Maggio
62	Asdf
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public.items (id, name, category_id, supplier_id, thumbnail, photos, master_number, quantity, last_changed, disabled) FROM stdin;
1	Spinach and Cheese Stuffed Shells	6	10	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/208x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/218x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/153x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/137x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/148x100.png/dddddd/000000"}]	697l	40	2026-05-18 00:00:00+08	f
2	Travel Document Organizer	2	3	http://dummyimage.com/223x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/160x100.png/dddddd/000000"}]	819k	35	2026-05-18 00:00:00+08	f
127	Brush 42	38	1	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	42	4	2026-05-20 13:06:46.922903+08	f
4	Pressure Cooker	4	4	http://dummyimage.com/215x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	582c	43	2026-05-18 00:00:00+08	f
128	Brush 43	38	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	43	0	2026-05-20 13:12:12.967536+08	f
6	Wireless Gaming Headset	5	10	http://dummyimage.com/135x100.png/cc0000/ffffff	[{"item": "http://dummyimage.com/117x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/213x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/223x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/204x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/152x100.png/ff4444/ffffff"}]	915i	9	2026-05-18 00:00:00+08	f
7	Thai Peanut Noodles	5	2	http://dummyimage.com/131x100.png/dddddd/000000	[{"item": "http://dummyimage.com/186x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/164x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/202x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/116x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/177x100.png/cc0000/ffffff"}]	968i	16	2026-05-18 00:00:00+08	f
129	Brush 45	4	3	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	45	0	2026-05-20 13:22:21.098881+08	f
130	Brush 46	38	4	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	46	0	2026-05-20 13:26:03.967501+08	f
10	Pet Leash	5	8	http://dummyimage.com/165x100.png/dddddd/000000	[{"item": "http://dummyimage.com/142x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/112x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/249x100.png/ff4444/ffffff"}]	010g	40	2026-05-18 00:00:00+08	f
131	Brush 47	38	4	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	47	0	2026-05-20 13:26:48.311189+08	f
132	Brush 48	38	4	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	48	0	2026-05-20 13:27:10.36687+08	f
13	Greek Yogurt Parfait	6	1	http://dummyimage.com/164x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/169x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/177x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/212x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/124x100.png/ff4444/ffffff"}]	022m	3	2026-05-18 00:00:00+08	f
16	Creamy Coleslaw Mix	2	8	http://dummyimage.com/104x100.png/5fa2dd/ffffff	[{"item": "http://dummyimage.com/164x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/178x100.png/dddddd/000000"}]	868g	37	2026-05-18 00:00:00+08	f
17	Puff Pastry	4	9	http://dummyimage.com/189x100.png/dddddd/000000	[]	711u	1	2026-05-18 00:00:00+08	f
18	Thermostatic Shower Valve Kit	6	1	http://dummyimage.com/181x100.png/5fa2dd/ffffff	[{"item": "http://dummyimage.com/237x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/104x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/202x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/108x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/226x100.png/cc0000/ffffff"}]	280b	1	2026-05-18 00:00:00+08	f
19	Coffee Maker	6	9	http://dummyimage.com/179x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/202x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/136x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/100x100.png/cc0000/ffffff"}]	588j	31	2026-05-18 00:00:00+08	f
20	Apple Cinnamon Granola	7	1	http://dummyimage.com/188x100.png/cc0000/ffffff	[{"item": "http://dummyimage.com/168x100.png/cc0000/ffffff"}]	675i	20	2026-05-18 00:00:00+08	f
21	Classic White T-Shirt	4	8	http://dummyimage.com/209x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/242x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/150x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/159x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/115x100.png/cc0000/ffffff"}]	652a	14	2026-05-18 00:00:00+08	f
24	Mediterranean Flatbread	3	1	http://dummyimage.com/103x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/157x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/101x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/128x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/238x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/246x100.png/dddddd/000000"}]	678h	1	2026-05-18 00:00:00+08	f
31	Ice Pack	6	4	http://dummyimage.com/185x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/213x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/102x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/250x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/112x100.png/5fa2dd/ffffff"}]	260a	26	2026-05-18 00:00:00+08	f
151	Brush 71	5	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	71	0	2026-05-21 12:52:03.752839+08	f
152	Brush 72	2	3	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	72	0	2026-05-21 12:52:44.568966+08	f
153	Brush 74	3	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	74	0	2026-05-21 12:53:06.770361+08	f
154	Brush 75	2	6	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	75	0	2026-05-21 12:53:42.389832+08	f
159	Brush 84	3	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	84	0	2026-05-21 12:56:18.06393+08	f
160	Brush 85	2	6	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	85	0	2026-05-21 12:56:53.908804+08	f
161	Brush 86	3	8	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	86	0	2026-05-21 12:57:03.610972+08	f
42	Stainless Steel Grater	7	6	http://dummyimage.com/119x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/236x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/146x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/218x100.png/cc0000/ffffff"}]	098s	15	2026-05-18 00:00:00+08	f
43	Chiffon Blouse	5	4	http://dummyimage.com/128x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/228x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/142x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/225x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/155x100.png/5fa2dd/ffffff"}]	728i	17	2026-05-18 00:00:00+08	f
44	Pumpkin Ice Cream	1	5	http://dummyimage.com/246x100.png/cc0000/ffffff	[{"item": "http://dummyimage.com/159x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/173x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/199x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/233x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/224x100.png/5fa2dd/ffffff"}]	066h	45	2026-05-18 00:00:00+08	f
45	Travel Size Toiletry Bottles	6	10	http://dummyimage.com/240x100.png/ff4444/ffffff	[]	071d	28	2026-05-18 00:00:00+08	f
133	Brush 49	4	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	500a	0	2026-05-22 12:23:37.814+08	f
134	Brush 51	4	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	60b	0	2026-05-22 12:28:42.582+08	f
46	Portable Pet Stroller	6	7	http://dummyimage.com/107x100.png/5fa2dd/ffffff	[{"item": "http://dummyimage.com/154x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/231x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/159x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/107x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/144x100.png/dddddd/000000"}]	010o	27	2026-05-18 00:00:00+08	f
165	Brush 101	4	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	101	0	2026-05-21 13:16:31.448696+08	f
50	Chickpea Salad	6	7	http://dummyimage.com/169x100.png/dddddd/000000	[{"item": "http://dummyimage.com/190x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/dddddd/000000"}]	986b	10	2026-05-18 00:00:00+08	f
167	Brush 103	5	8	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	103	0	2026-05-21 13:17:24.812104+08	f
54	Wall Art Stickers	7	3	http://dummyimage.com/218x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/195x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/223x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/143x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/231x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/105x100.png/5fa2dd/ffffff"}]	979f	42	2026-05-18 00:00:00+08	f
56	Golf Polo Shirt	6	4	http://dummyimage.com/129x100.png/dddddd/000000	[{"item": "http://dummyimage.com/114x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/233x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/171x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/199x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/145x100.png/5fa2dd/ffffff"}]	727p	45	2026-05-18 00:00:00+08	f
57	Smart Wi-Fi Camera	4	2	http://dummyimage.com/115x100.png/dddddd/000000	[{"item": "http://dummyimage.com/148x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/226x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/137x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/109x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}]	206c	43	2026-05-18 00:00:00+08	f
59	Home Cleaning Robot	1	8	http://dummyimage.com/100x100.png/dddddd/000000	[]	019m	11	2026-05-18 00:00:00+08	f
61	Outdoor Portable Fire Pit	7	1	http://dummyimage.com/226x100.png/5fa2dd/ffffff	[{"item": "http://dummyimage.com/146x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/140x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/157x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/dddddd/000000"}]	255h	26	2026-05-18 00:00:00+08	f
64	Scent Diffuser	4	9	http://dummyimage.com/100x100.png/cc0000/ffffff	[{"item": "http://dummyimage.com/123x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/126x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/206x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/107x100.png/ff4444/ffffff"}]	191m	29	2026-05-18 00:00:00+08	f
65	Pet Safety Belt for Car	4	5	http://dummyimage.com/244x100.png/dddddd/000000	[]	206w	35	2026-05-18 00:00:00+08	f
66	Mushrooms	5	2	http://dummyimage.com/209x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/196x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/197x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/218x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/127x100.png/5fa2dd/ffffff"}]	820j	25	2026-05-18 00:00:00+08	f
67	Garden Hose	1	1	http://dummyimage.com/179x100.png/ff4444/ffffff	[]	010p	44	2026-05-18 00:00:00+08	f
68	Chickpea Salad Deluxe	7	3	http://dummyimage.com/189x100.png/5fa2dd/ffffff	[{"item": "http://dummyimage.com/171x100.png/ff4444/ffffff"}]	529y	15	2026-05-18 00:00:00+08	f
69	Children's Educational Puzzle	3	9	http://dummyimage.com/200x100.png/5fa2dd/ffffff	[]	069x	8	2026-05-18 00:00:00+08	f
70	Car Trash Can	6	4	http://dummyimage.com/222x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/119x100.png/cc0000/ffffff"}]	920u	29	2026-05-18 00:00:00+08	f
72	Cinnamon Roll Kit	2	3	http://dummyimage.com/118x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/250x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/134x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/113x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/123x100.png/ff4444/ffffff"}]	182y	15	2026-05-18 00:00:00+08	f
140	Brush 60	2	3	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	60	0	2026-05-21 10:59:19.799447+08	f
74	Insulated Sport Tumbler	1	10	http://dummyimage.com/176x100.png/dddddd/000000	[{"item": "http://dummyimage.com/121x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/244x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/248x100.png/dddddd/000000"}]	925b	28	2026-05-18 00:00:00+08	f
75	Athletic Compression Tights	7	2	http://dummyimage.com/156x100.png/cc0000/ffffff	[]	527t	5	2026-05-18 00:00:00+08	f
170	Brush 112	3	10	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	112	0	2026-05-21 15:05:57.277762+08	f
169	Brush 110	3	6	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	111	0	2026-05-22 12:22:49.97+08	f
81	BBQ Lentil Chips	3	7	http://dummyimage.com/142x100.png/cc0000/ffffff	[{"item": "http://dummyimage.com/149x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/216x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/143x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/244x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/215x100.png/dddddd/000000"}]	662t	50	2026-05-18 00:00:00+08	f
83	Honey Lemon Tea	1	6	http://dummyimage.com/229x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/148x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/121x100.png/dddddd/000000"}]	815i	47	2026-05-18 00:00:00+08	f
84	Decorative Wall Tapestry	5	7	http://dummyimage.com/106x100.png/dddddd/000000	[{"item": "http://dummyimage.com/131x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/233x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/137x100.png/cc0000/ffffff"}]	890w	18	2026-05-18 00:00:00+08	f
86	Portable UV Sterilizer	2	6	http://dummyimage.com/139x100.png/5fa2dd/ffffff	[{"item": "http://dummyimage.com/180x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/148x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/177x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/115x100.png/cc0000/ffffff"}]	020a	2	2026-05-18 00:00:00+08	f
87	Multi-Cooker	2	1	http://dummyimage.com/231x100.png/5fa2dd/ffffff	[{"item": "http://dummyimage.com/122x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/226x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/249x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/147x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/213x100.png/cc0000/ffffff"}]	022t	38	2026-05-18 00:00:00+08	f
88	Pesto Pasta Salad	7	2	http://dummyimage.com/185x100.png/5fa2dd/ffffff	[{"item": "http://dummyimage.com/104x100.png/dddddd/000000"}]	268m	9	2026-05-18 00:00:00+08	f
89	Ramen Noodle Soup Cups	7	5	http://dummyimage.com/142x100.png/5fa2dd/ffffff	[{"item": "http://dummyimage.com/120x100.png/cc0000/ffffff"}]	816x	13	2026-05-18 00:00:00+08	f
90	Emergency Preparedness Kit	7	7	http://dummyimage.com/112x100.png/cc0000/ffffff	[{"item": "http://dummyimage.com/238x100.png/dddddd/000000"}]	652n	14	2026-05-18 00:00:00+08	f
91	Plant-Based Cookbook	2	6	http://dummyimage.com/125x100.png/dddddd/000000	[{"item": "http://dummyimage.com/119x100.png/dddddd/000000"}]	290v	3	2026-05-18 00:00:00+08	f
92	Crafting Kit	2	7	http://dummyimage.com/229x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/174x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/244x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/162x100.png/cc0000/ffffff"}]	106g	32	2026-05-18 00:00:00+08	f
93	Cheddar Cheese Slices	3	2	http://dummyimage.com/136x100.png/dddddd/000000	[{"item": "http://dummyimage.com/206x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/218x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/185x100.png/cc0000/ffffff"}]	728h	17	2026-05-18 00:00:00+08	f
94	Peach Preserves	5	9	http://dummyimage.com/195x100.png/dddddd/000000	[{"item": "http://dummyimage.com/113x100.png/cc0000/ffffff"}]	059y	5	2026-05-18 00:00:00+08	f
96	Trackpad for Laptop	7	4	http://dummyimage.com/120x100.png/cc0000/ffffff	[{"item": "http://dummyimage.com/123x100.png/dddddd/000000"}]	658g	13	2026-05-18 00:00:00+08	f
97	Quinoa	3	8	http://dummyimage.com/232x100.png/ff4444/ffffff	[{"item": "http://dummyimage.com/138x100.png/5fa2dd/ffffff"}, {"item": "http://dummyimage.com/217x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/219x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/195x100.png/dddddd/000000"}]	725v	25	2026-05-18 00:00:00+08	f
98	Banana Peanut Butter Smoothie	1	5	http://dummyimage.com/142x100.png/cc0000/ffffff	[{"item": "http://dummyimage.com/202x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/157x100.png/dddddd/000000"}]	952z	38	2026-05-18 00:00:00+08	f
143	Brush 63	3	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	63	0	2026-05-21 11:23:28.873096+08	f
144	Brush 64	3	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	64	0	2026-05-21 11:23:56.188393+08	f
145	Brush 65	6	6	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	65	0	2026-05-21 11:24:27.285825+08	f
147	Brush 67	6	62	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	67	0	2026-05-21 11:26:22.991177+08	f
148	Brush 68	2	6	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	68	0	2026-05-21 11:26:42.859073+08	f
150	Brush 70	5	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	70	0	2026-05-21 12:44:07.492228+08	f
155	Brush 77	3	6	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	77	0	2026-05-21 12:54:27.329781+08	f
156	Brush 78	6	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	78	0	2026-05-21 12:54:39.530772+08	f
157	Brush 80	3	5	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	80	0	2026-05-21 12:55:44.984592+08	f
158	Brush 81	1	1	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	81	0	2026-05-21 12:55:55.974595+08	f
163	Brush 91	5	4	http://dummyimage.com/173x100.png/dddddd/000000	[{"item": "http://dummyimage.com/108x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/116x100.png/dddddd/000000"}, {"item": "http://dummyimage.com/182x100.png/cc0000/ffffff"}, {"item": "http://dummyimage.com/239x100.png/ff4444/ffffff"}, {"item": "http://dummyimage.com/194x100.png/cc0000/ffffff"}]	91	0	2026-05-21 13:00:04.39354+08	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public.users (id, email, name, password_hash, role, initial_quantity) FROM stdin;
13	faethychan@gmail.com	12345678	$2b$10$xSw5GiLiQRgAMpSE.AzLRuFKFF76PzkJJWOSS5SgtKTM1TrlCNKwW	QS	0
14	faethy@gmail.com	1234567	$2b$10$8KaP76TJ/oDSLZd9emt95OfK.w2KGGujaZwirRZtIBvidepq5KeZ2	QS	0
17	faethychanasdf@gmail.com	Jerry	$2b$10$aP0xZEMfiI.cns.t.EZmcuCQOFOsG4ajcRFjEOy8C90ErWu0wuOWC	Procurement	0
18	sadfasdf@gmail.com	123123123131231	$2b$10$RXSNYCjUvMqBU8/2nH.QROPhjp7t8k9wYwV7IK9r7Khz2gzmr1Qv6	Project	0
19	asdfsfa@121321.com	Adsfsa	$2b$10$cSxVSCwyo9VClN/9HEi6wOL5kI4XVVlt1lo1lLUmYLr3ySuJdEXmi	Procurement	0
20	asdfsdfa@gmail.com	2131231231	$2b$10$ckK0k0oyshrY0aso1lNMhOSQlaROZ0FQ.F7kjCkaW2BQ3XA01H7cO	QS	0
21	asdfasd@adfasdfas.com	12312312	$2b$10$Q/yNnxaGrxszFPmCZ2MjPumCu/nm9NErFhgojt9s2LGqu2rdUkUBK	Project	0
23	faethychang@gmail.com	John	$2b$10$bzvQ6DHircI7aYuVKdsaa.hLDv6IAMYxKCUmoIF93tIuAWQlVEcE.	Procurement	0
24	faethu@gmail.com	12323412342	$2b$10$bDPdh9/J82wyLhhAYsY4hu3nG/jvB1bY0bZ.Q8Zsg3PmQyQMqevHC	Procurement	0
25	dfasdfa@gmail.com	231231231	$2b$10$fuTf/f9g4MWfQCx1mLkfQ.fKlNHwq4JhiF/jJ8BiOqHg/b1jUcOKO	Procurement	0
26	asdfasf@gmail.com	Sdfas	$2b$10$NuyhEhL.J65/xO4QKnZK3uoBnuIG2X5ltiE/yyGCEmEIJpXR2dwXm	Procurement	0
27	sdfasd@gmail.comasdfsad	Asdfsdfasd	$2b$10$1mjDWOtoK0d/D3k3U9q9NOMe6FxldFC76ZZ1WUK7ESusEhgj8wiPm	Procurement	0
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public.sessions (id, secret_hash, created_at, user_id) FROM stdin;
s8uwf7r5wwesv7q4685y5x2r	\\xeb7c2e3d04e7d11b4e262639b0abfb9ec6dfbb832a841a4f25710147da736d4b	1779184098	13
8qbas5akjvv33fkwqg6kidsk	\\xefc752d867d8843852f894e79902d700597476d8e09ae00c9001356d637ee53f	1779241864	13
qrvgwk8zpjnnm794fnyxwf2w	\\x95142b7efb8cef3b481efee351d38775bb42506a737c585e04ea117a64540346	1779337620	13
k4ybjc3nks8v4vnpva5xeuju	\\x76803466aad3dfd6f68172acde573b97fef92e59832bac74c4004038406eb710	1779680074	13
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inventory_user
--

SELECT pg_catalog.setval('public.categories_id_seq', 88, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inventory_user
--

SELECT pg_catalog.setval('public.items_id_seq', 170, true);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inventory_user
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 86, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inventory_user
--

SELECT pg_catalog.setval('public.users_id_seq', 27, true);


--
-- PostgreSQL database dump complete
--

\unrestrict lFR3eNNljIaN5mErdPN2WKUPg3eylfbUhax3ufZrbmx0byGYLfb4biQTZN5KOlp

