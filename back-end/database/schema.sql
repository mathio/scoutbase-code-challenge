--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-1.pgdg16.04+1)
-- Dumped by pg_dump version 11.3

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
-- Name: movie_person; Type: TABLE; Schema: public; Owner: pfdcavqbqrtuif
--

CREATE TABLE public.movie_person (
    movie_id integer,
    person_id integer,
    role public.role
);


ALTER TABLE public.movie_person OWNER TO pfdcavqbqrtuif;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: pfdcavqbqrtuif
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying,
    year character varying(4),
    rating numeric(4,2),
    poster character varying
);


ALTER TABLE public.movies OWNER TO pfdcavqbqrtuif;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: pfdcavqbqrtuif
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO pfdcavqbqrtuif;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pfdcavqbqrtuif
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: pfdcavqbqrtuif
--

CREATE TABLE public.people (
    id integer NOT NULL,
    name character varying,
    birthday date,
    country character varying
);


ALTER TABLE public.people OWNER TO pfdcavqbqrtuif;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: pfdcavqbqrtuif
--

CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_id_seq OWNER TO pfdcavqbqrtuif;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pfdcavqbqrtuif
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: pfdcavqbqrtuif
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: pfdcavqbqrtuif
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Data for Name: movie_person; Type: TABLE DATA; Schema: public; Owner: pfdcavqbqrtuif
--

COPY public.movie_person (movie_id, person_id, role) FROM stdin;
474350	5530	actor
474350	83002	actor
474350	19278	actor
474350	5296	actor
474350	223901	actor
474350	1237603	actor
474350	1330888	actor
474350	137905	actor
474350	143593	actor
474350	129985	actor
474350	1113116	director
384018	18918	actor
384018	976	actor
384018	17605	actor
384018	556356	actor
384018	1222992	actor
384018	1665	actor
384018	183048	actor
384018	1619648	actor
384018	2152103	actor
384018	1752964	actor
384018	40684	director
593961	591998	actor
593961	1128305	actor
593961	1887270	actor
593961	1246880	actor
593961	591023	actor
593961	1708160	actor
593961	1716307	actor
593961	933413	actor
593961	1185025	actor
593961	1928071	actor
593961	93106	director
423204	17276	actor
423204	192	actor
423204	9575	actor
423204	129101	actor
423204	1462	actor
423204	15555	actor
423204	1733	actor
423204	6413	actor
423204	119893	actor
423204	76543	actor
423204	76422	director
420818	119589	actor
420818	14386	actor
420818	15152	actor
420818	5294	actor
420818	1981	actor
420818	84292	actor
420818	51878	actor
420818	19274	actor
420818	973651	actor
420818	934159	actor
420818	15277	director
521777	1277188	actor
521777	2239159	actor
521777	2177190	actor
521777	1782117	actor
521777	1984116	actor
521777	62831	actor
521777	96529	actor
521777	75318	actor
521777	1488961	actor
521777	1274210	actor
521777	84416	director
535581	1532	actor
535581	1023139	actor
535581	3063	actor
535581	2838	actor
535581	77948	actor
535581	2887	actor
535581	884	actor
535581	2047	actor
535581	572541	actor
535581	6403	actor
535581	4429	director
571627	1347525	actor
571627	17121	actor
571627	1845057	actor
571627	1255881	actor
571627	1988598	actor
571627	2097275	actor
571627	2391356	actor
571627	1164503	actor
571627	1606060	actor
571627	2391351	actor
571627	1410322	director
506574	1098962	actor
506574	75041	actor
506574	1331457	actor
506574	121868	actor
506574	1421393	actor
506574	1729496	actor
506574	80613	actor
506574	2056277	actor
506574	2362059	actor
506574	212828	actor
506574	65310	director
466272	6193	actor
466272	287	actor
466272	234352	actor
466272	46593	actor
466272	1392137	actor
466272	18082	actor
466272	1651362	actor
466272	86654	actor
466272	501	actor
466272	6905	actor
466272	138	director
447404	10859	actor
447404	1029934	actor
447404	221192	actor
447404	2440	actor
447404	3899	actor
447404	62879	actor
447404	1325961	actor
447404	174708	actor
447404	2300244	actor
447404	1089873	actor
447404	65630	director
301528	31	actor
301528	12898	actor
301528	8873	actor
301528	3234	actor
301528	25147	actor
301528	6384	actor
301528	298410	actor
301528	291263	actor
301528	110014	actor
301528	209596	actor
301528	84496	director
412117	10872	actor
412117	156962	actor
412117	55638	actor
412117	213001	actor
412117	475512	actor
412117	25703	actor
412117	56159	actor
412117	500427	actor
412117	452205	actor
412117	1230868	actor
412117	124748	director
504608	1303037	actor
504608	478	actor
504608	512991	actor
504608	18997	actor
504608	9138	actor
504608	978	actor
504608	126457	actor
504608	2316169	actor
504608	1538851	actor
504608	142389	actor
504608	974	director
567609	1372369	actor
567609	1533	actor
567609	225411	actor
567609	11702	actor
567609	15319	actor
567609	5889	actor
567609	207491	actor
567609	1309774	actor
567609	199486	actor
567609	33343	actor
567609	66681	director
456740	35029	actor
456740	63	actor
456740	6972	actor
456740	1535218	actor
456740	1115	actor
456740	18307	actor
456740	2598	actor
456740	56100	actor
456740	63364	actor
456740	1146114	actor
456740	57581	director
616584	2364949	actor
616584	2364963	actor
616584	2364968	actor
616584	2364967	actor
616584	2404918	actor
616584	2404919	actor
616584	2364961	actor
616584	2404920	actor
616584	2404921	actor
616584	2404922	actor
616584	2364949	director
531309	9281	actor
531309	62562	actor
531309	2020904	actor
531309	191202	actor
531309	449513	actor
531309	1215392	actor
531309	1683095	actor
531309	37937	actor
531309	1832081	actor
531309	1569986	actor
531309	1362815	director
516700	1203378	actor
516700	2135392	actor
516700	562217	actor
516700	1154466	actor
516700	2367272	actor
516700	1028460	actor
516700	1331143	actor
516700	235425	actor
516700	1206436	actor
516700	1185538	actor
516700	121798	director
499701	1428070	actor
499701	11160	actor
499701	1826682	actor
499701	1121	actor
499701	239574	actor
499701	7242	actor
499701	52605	actor
499701	454	actor
499701	1494865	actor
499701	1109111	actor
499701	26205	director
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: pfdcavqbqrtuif
--

COPY public.movies (id, title, year, rating, poster) FROM stdin;
474350	It Chapter Two	2019	7.40	/4W0FnjSGn4x0mKZlBRx8OjFxQUM.jpg
384018	Fast & Furious Presents: Hobbs & Shaw	2019	6.50	/hpgda6P9GutvdkDX5MUJ92QG9aj.jpg
593961	Hello, Love, Goodbye	2019	5.50	/foMDjFHrTrex6Rr6bApB8TbWlie.jpg
423204	Angel Has Fallen	2019	5.80	/k2WyDw2NTUIWnuEs5gT7wgrCQg6.jpg
420818	The Lion King	2019	7.20	/1TUg5pO1VZ4B0Q1amk3OlXvlpXV.jpg
521777	Good Boys	2019	6.60	/6Xsz9KHQmCcIcj3CoWQq5eLtVoT.jpg
535581	The Dead Don't Die	2019	5.70	/cXyfAViYly0Lk2CVpEKgYbt9wKQ.jpg
571627	사자	2019	3.80	/7cGsa6sqTFsrws322p0QaIe7GUX.jpg
506574	Descendants 3	2019	7.50	/gzdxeOiO76hDoOSKYCxegj7bk4T.jpg
466272	Once Upon a Time in Hollywood	2019	7.60	/kKTPv9LKKs5L3oO1y5FNObxAPWI.jpg
447404	Pokémon Detective Pikachu	2019	7.00	/nDP33LmQwNsnPv29GQazz59HjJI.jpg
301528	Toy Story 4	2019	7.70	/m67smI1IIMmYzCl9axvKNULVKLr.jpg
412117	The Secret Life of Pets 2	2019	6.60	/etaok7q2E5tV36oXe7GQzhUQ4fX.jpg
504608	Rocketman	2019	7.50	/oAr5bgf49vxga9etWoQpAeRMvhp.jpg
567609	Ready or Not	2019	7.20	/aNrNi5QExO6b8MnEGsfpgp21NIY.jpg
456740	Hellboy	2019	5.10	/5BkSkNtfrnTuKOtTaZhl8avn4wU.jpg
616584	K-12	2019	7.90	/fSlfaF0Ydfr2SK6hOYHvDsb7a9Z.jpg
531309	Brightburn	2019	5.80	/uHEI6v8ApQusjbaRZ8o7WcLYeWb.jpg
516700	Gundala	2019	6.70	/nmHCKQ1GtlPLZVAtBfsYDqVPhPW.jpg
499701	Dora and the Lost City of Gold	2019	6.00	/61sbyO47yIpsMFyLhY1MWcqjg1Q.jpg
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: pfdcavqbqrtuif
--

COPY public.people (id, name, birthday, country) FROM stdin;
5530	James McAvoy	1979-04-21	Port Glasgow, Scotland, UK
83002	Jessica Chastain	1977-03-24	Southern California, California, USA
19278	Bill Hader	1978-06-07	Tulsa, Oklahoma, USA
5296	James Ransone	1979-06-02	Baltimore, Maryland, USA
223901	Jay Ryan	1981-08-29	Auckland, New Zealand
1237603	Isaiah Mustafa	1974-02-11	Portland - Oregon - USA
1330888	Andy Bean	\N	\N
137905	Bill Skarsgård	1990-08-09	Vällingby, Sweden
143593	Xavier Dolan	1989-03-20	Montréal, Québec, Canada
129985	Teach Grant	1973-01-25	Toronto, Ontario,  Canada
1113116	Andy Muschietti	1973-08-26	Buenos Aires, Argentina
18918	Dwayne Johnson	1972-05-02	Hayward, California, USA
976	Jason Statham	1967-07-26	Shirebrook, Derbyshire, England, UK
17605	Idris Elba	1972-09-06	Hackney, London, England, UK
556356	Vanessa Kirby	1988-04-18	Wimbledon, London, England, UK
1222992	Eiza González	1990-01-30	Mexico City, Mexico
1665	Eddie Marsan	1968-06-23	Stepney, East London, England
183048	Stephanie Vogt	\N	\N
1619648	David Mumeni	\N	\N
2152103	Axel Nu	\N	\N
1752964	Lampros Kalfuntzos	1980-07-19	Athens, Greece
40684	David Leitch	1969-12-31	Stratford, Texas, USA
591998	Kathryn Bernardo	1996-03-26	\N
1128305	Alden Richards	\N	\N
1887270	Maymay Entrata	1997-05-06	Mambajao, Camiguin, Philippines
1246880	Maricel Laxa	\N	\N
591023	Joross Gamboa	1984-11-28	Daet, Camarines Norte, Philippines
1708160	Jameson Blake	\N	\N
1716307	Kakai Bautista	\N	\N
933413	Lito Pimentel	\N	\N
1185025	Jeffrey Tam	\N	\N
1928071	Lovely Abella	\N	\N
93106	Cathy Garcia-Molina	1971-11-28	\N
17276	Gerard Butler	1969-11-13	Paisley, Scotland, UK 
192	Morgan Freeman	1937-06-01	Memphis, Tennessee, USA
9575	Jada Pinkett Smith	1971-09-18	Baltimore, Maryland, USA
129101	Lance Reddick	1969-12-31	Baltimore, Maryland, USA
1462	Tim Blake Nelson	1964-05-11	Tulsa - Oklahoma - USA
15555	Piper Perabo	1976-10-31	 Dallas, Texas, USA
1733	Nick Nolte	1941-02-08	Omaha, Nebraska, USA
6413	Danny Huston	1962-05-14	Rome, Italy
119893	Mark Arnold	1957-05-23	Broomall, Pennsylvania, USA
76543	Chris Browning	\N	\N
76422	Ric Roman Waugh	1968-02-20	Los Angeles, California, Stati Uniti
119589	Donald Glover	1983-09-25	Stone Mountain, Georgia, USA
14386	Beyoncé Knowles	1981-09-04	Houston, Texas, United States
15152	James Earl Jones	1931-01-17	Arkabutla, Mississippi, USA
5294	Chiwetel Ejiofor	1977-07-10	Forest Gate, London, UK
1981	Alfre Woodard	1952-11-08	Tulsa, Oklahoma, USA
84292	John Oliver	1977-04-23	Birmingham - England - UK
51878	John Kani	1943-11-30	New Brighton, Port Elizabeth, Sudafrica
19274	Seth Rogen	1982-04-15	Vancouver, British Columbia, Canada
973651	Billy Eichner	1978-09-18	New York City, New York, USA
934159	Eric André	1983-04-04	Boca Raton, Florida, USA
15277	Jon Favreau	1966-10-19	Queens, New York, USA
1277188	Jacob Tremblay	2006-10-05	Vancouver, British Columbia, Canada
2239159	Brady Noon	\N	\N
2177190	Keith L. Williams	2007-05-21	Fort Worth, Texas, USA
1782117	Molly Gordon	1995-12-06	  United States
1984116	Midori Francis	\N	\N
62831	Will Forte	1970-06-17	Alameda County, California, USA
96529	Josh Caras	\N	\N
75318	Retta	\N	Marietta Sirleaf, New Jersey
1488961	LilRel Howery	1979-12-17	\tChicago, Illinois
1274210	Millie Davis	2007-06-18	Toronto, Ontario,  Canada
84416	Gene Stupnitsky	1977-08-26	\N
1532	Bill Murray	1950-09-21	Wilmette, Illinois, USA
1023139	Adam Driver	1983-11-19	San Diego, California, USA
3063	Tilda Swinton	1960-11-05	London, England, UK
2838	Chloë Sevigny	1974-11-18	Springfield, Massachusetts, USA
77948	Selena Gomez	1992-07-22	Grand Prairie, Texas, USA 
2887	Tom Waits	1949-12-07	Pomona, California, USA
884	Steve Buscemi	1957-12-13	New York City, New York, USA
2047	Danny Glover	1946-07-22	San Francisco, California, USA
572541	Caleb Landry Jones	1989-12-07	 Garland, Texas, USA
6403	Sara Driver	1955-12-15	Westfield, New Jersey, USA
4429	Jim Jarmusch	1953-01-22	Akron, Ohio, USA
1347525	Park Seo-joon	1988-12-16	Seoul, South Korea
17121	Ahn Sung-ki	1952-01-01	Daegu, South Korea
1845057	Woo Do-Hwan	1992-07-12	\N
1255881	Choi Woo-shik	1990-03-26	Seoul, South Korea
1988598	Park Ji-hyun	1994-11-26	\N
2097275	Jung Ji-hoon	2007-05-31	South Korea
2391356	Lee Seung-hee	\N	\N
1164503	Sim Hee-seop	1986-02-26	\N
1606060	Kim See-eun	\N	\N
2391351	Kim Seon-min	\N	\N
1410322	Kim Joo-hwan	\N	\N
1098962	Dove Cameron	1996-01-15	 Seattle, Washington, USA
75041	Cameron Boyce	1999-05-28	Los Angeles, California, USA
1331457	Sofia Carson	1993-04-10	\N
121868	Booboo Stewart	1994-01-21	Beverly Hills, California, USA
1421393	Mitchell Hope	1994-06-27	\tMelbourne, Australia
1729496	Thomas Doherty	1995-04-21	Scozia, Regno Unito
80613	China Anne McClain	1998-08-25	Atlanta, Georgia, USA
2056277	Aaron J Christopher	\N	\N
2362059	Kane Nelson	\N	\N
212828	Cheyenne Jackson	1975-07-12	Newport - Washington - USA
65310	Kenny Ortega	1950-04-18	Palo Alto, California, USA
6193	Leonardo DiCaprio	1974-11-11	Los Angeles, California, USA
287	Brad Pitt	1963-12-18	Shawnee, Oklahoma, USA
234352	Margot Robbie	1990-07-02	Gold Coast, Queensland, Australia 
46593	Emile Hirsch	1985-03-13	Topanga Canyon, California, USA
1392137	Margaret Qualley	1994-10-23	Montana, USA
18082	Timothy Olyphant	1968-05-20	Honolulu, Hawaii, USA
1651362	Julia Butters	2007-04-15	\N
86654	Austin Butler	1991-08-17	Anaheim, California, USA
501	Dakota Fanning	1994-02-23	Conyers, Georgia, USA
6905	Bruce Dern	1936-06-04	Chicago, Illinois, USA
138	Quentin Tarantino	1963-03-27	Knoxville, Tennessee, USA
10859	Ryan Reynolds	1976-10-23	Vancouver, British Columbia, Canada
1029934	Justice Smith	1995-08-09	Los Angeles, California, USA
221192	Kathryn Newton	1997-02-08	Los Angeles, California, USA
2440	Bill Nighy	1949-12-12	Surrey, England, UK 
3899	Ken Watanabe	1959-10-21	Koide, Niigata, Japan
62879	Chris Geere	1981-03-18	Cambridge, Cambridgeshire, England, UK
1325961	Suki Waterhouse	1992-01-05	Hammersmith, London, England, UK
174708	Josette Simon	\N	\N
2300244	Alejandro De Mesa	\N	\N
1089873	Rita Ora	1990-11-26	Pristina, Serbia, Yugoslavia
65630	Rob Letterman	1970-10-31	Honolulu, Hawaii, USA
31	Tom Hanks	1956-07-09	Concord, California, USA
12898	Tim Allen	1953-06-13	Denver, Colorado, USA
8873	Annie Potts	1952-10-28	Franklin, Kentucky, USA
3234	Joan Cusack	1962-10-11	New York City, New York, USA
25147	Tony Hale	1970-09-30	West Point, New York, USA
6384	Keanu Reeves	1964-09-02	Beirut, Lebanon
298410	Keegan-Michael Key	1971-03-22	Southfield - Michigan - USA
291263	Jordan Peele	1979-02-21	New York City, USA
110014	Christina Hendricks	1975-05-03	Knoxville, Tennessee, USA
209596	Ally Maki	1986-01-01	Seattle, Washington, U.S.A
84496	Josh Cooley	1980-05-23	Los Angeles, California, USA
10872	Patton Oswalt	1969-01-27	Portsmouth, Virginia, USA
156962	Eric Stonestreet	1971-09-09	Kansas City, Kansas, USA
55638	Kevin Hart	1979-07-06	Philadelphia, Pennsylvania, USA 
213001	Jenny Slate	1982-03-25	Milton, Massachusetts, USA
475512	Ellie Kemper	1980-05-02	Kansas City, Missouri, USA
25703	Lake Bell	1979-03-24	New York City, New York, USA
56159	Dana Carvey	1955-06-02	Missoula, Montana, USA
500427	Hannibal Buress	1983-02-04	Chicago, Illinois, US
452205	Bobby Moynihan	1978-01-31	\N
1230868	Tiffany Haddish	1979-12-03	Los Angeles, California, USA
124748	Chris Renaud	\N	\N
1303037	Taron Egerton	1989-11-10	Birkenhead, Merseyside, England, UK
478	Jamie Bell	1986-03-14	Billingham, Stockton on Tees, England, UK
512991	Richard Madden	1986-06-18	Elderslie, Renfrewshire, Scotland, UK
18997	Bryce Dallas Howard	1981-03-02	Los Angeles, California, USA
9138	Gemma Jones	1942-12-04	Marylebone, London, England, UK
978	Steven Mackintosh	1967-04-30	Cambridge, Cambridgeshire, England, UK
126457	Tom Bennett	\N	\N
2316169	Matthew Illesley	\N	\N
1538851	Kit Connor	\N	\N
142389	Charlie Rowe	1996-04-23	Islington, London, England
974	Dexter Fletcher	1966-01-31	North London, England, UK
1372369	Samara Weaving	1992-02-23	Adelaide, Australia
1533	Andie MacDowell	1958-04-21	Gaffney, South Carolina, USA
225411	Mark O'Brien	1984-05-07	Canada 
11702	Adam Brody	1979-12-15	San Diego, California, USA
15319	Henry Czerny	1959-02-08	Toronto, Ontario, Canada
5889	Nicky Guadagni	\N	Montréal, Québec, Canada
207491	Melanie Scrofano	\N	Ottawa, Ontario, Canada
1309774	Kristian Bruun	1979-10-25	Toronto, Ontario, Canada
199486	Elyse Levesque	1985-09-10	Regina, Saskatchewan, Canada
33343	John Ralston	1964-10-09	Miramichi, New Brunswick, Canada
66681	Matt Bettinelli-Olpin	1978-02-19	California, - USA
35029	David Harbour	1974-04-10	New York City, New York, USA
63	Milla Jovovich	1975-12-17	Kiev, Ukraine
6972	Ian McShane	1942-09-29	Blackburn, Lancashire, England, UK
1535218	Sasha Lane	1995-09-29	Houston, Texas, USA
1115	Stephen Graham	1973-08-03	Kirkby, Lancashire, England, UK
18307	Daniel Dae Kim	1968-08-04	Pusan, South Korea
2598	Sophie Okonedo	1969-01-01	London, England, UK
56100	Alistair Petrie	1970-09-30	\N
63364	Brian Gleeson	1987-11-14	Dublin, Ireland
1146114	Penelope Mitchell	1991-07-24	Melbourne, Victoria, Australia
57581	Neil Marshall	1970-05-25	Newcastle upon Tyne - England - UK
2364949	Melanie Martinez	1995-04-28	Astoria, Queens, New York
2364963	Elita Harkov	1995-08-19	St. John's, Newfoundland, Canada
2364968	Megan Gage	\N	San Francisco, California 
2364967	Maggie Budzyna	\N	\N
2404918	Adrian Jurics	\N	\N
2404919	Gergely Kiss	\N	\N
2364961	Natalia Toth	\N	\N
2404920	Tamas Gog	\N	\N
2404921	Robert Szabolcs	\N	\N
2404922	Bence Balogh	\N	\N
9281	Elizabeth Banks	1974-02-10	Pittsfield, Massachusetts, USA
62562	David Denman	1973-07-25	 Newport Beach, California, USA
2020904	Jackson A. Dunn	2003-12-09	San Diego, California, USA
191202	Matt Jones	1981-11-01	Sacramento, California, USA
449513	Meredith Hagner	1987-05-31	\N
1215392	Becky Wahlstrom	1975-04-25	Chicago, Illinois, USA
1683095	Emmie Hunter	\N	\N
37937	Gregory Alan Williams	1956-06-12	Des Moines, Iowa, USA
1832081	Annie Humphrey	\N	\N
1569986	Abraham Clinkscales	\N	\N
1362815	David Yarovesky	\N	\N
1203378	Abimana Aryasatya	\N	\N
2135392	Muzakki Ramdhan	\N	\N
562217	Bront Palarae	1978-09-27	Alor Setar, Kedah, Malaysia
1154466	Tara Basro	1990-06-11	Jakarta, Indonesia
2367272	Fariz Fajar	\N	\N
1028460	Rio Dewanto	1987-08-28	\N
1331143	Marissa Anita	1983-03-29	Surabaya, Indonesia
235425	Ario Bayu	1985-02-06	Jakarta, Indonesia
1206436	Lukman Sardi	1971-07-14	Jakarta, Indonesia
1185538	Pevita Pearce	1992-10-06	Jakarta, Indonesia
121798	Joko Anwar	1976-01-03	Medan, Indonesia
1428070	Isabela Moner	2001-07-10	Cleveland, Ohio, USA
11160	Danny Trejo	1944-05-16	Los Angeles, California, USA
1826682	Jeffrey Wahlberg	\N	\N
1121	Benicio del Toro	1967-02-19	San Germán, Puerto Rico
239574	Eugenio Derbez	1962-09-02	Mexico City - Distrito Federal - Mexico
7242	Temuera Morrison	1960-12-26	Rotorua, Île du Nord, Nouvelle-Zélande
52605	Eva Longoria	1975-03-15	Corpus Christi, Texas, USA
454	Michael Peña	1976-01-13	Chicago, Illinois, USA 
1494865	Nicholas Coombe	\N	\N
1109111	Madeleine Madden	\N	Australia
26205	James Bobin	\N	\N
\.


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pfdcavqbqrtuif
--

SELECT pg_catalog.setval('public.movies_id_seq', 1, false);


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pfdcavqbqrtuif
--

SELECT pg_catalog.setval('public.people_id_seq', 1, false);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: pfdcavqbqrtuif
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: pfdcavqbqrtuif
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: movie_person movie_person_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pfdcavqbqrtuif
--

ALTER TABLE ONLY public.movie_person
    ADD CONSTRAINT movie_person_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- Name: movie_person movie_person_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pfdcavqbqrtuif
--

ALTER TABLE ONLY public.movie_person
    ADD CONSTRAINT movie_person_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.people(id);


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO pfdcavqbqrtuif;


--
-- PostgreSQL database dump complete
--

