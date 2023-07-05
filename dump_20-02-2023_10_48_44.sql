--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE anguch;




--
-- Drop roles
--

DROP ROLE root;


--
-- Roles
--

CREATE ROLE root;
ALTER ROLE root WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:rxA0qmSWfwH0suMBnc64qA==$kHNiiaXWqqQhxQdWD+KVH2EAi/lY1Y7NGWRf34fPjPI=:r+nw5nxziwbm7HHm0FHxhbUNA4OgGBLoENdsvxxhfzk=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO root;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: root
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: root
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "anguch" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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

--
-- Name: anguch; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE anguch WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE anguch OWNER TO root;

\connect anguch

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: catastrophe; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.catastrophe (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    "typeCatastrophe" character varying(300),
    date character varying(300),
    heure character varying(30),
    "nbreTotalMenage" integer,
    "nbreTotalPersonne" integer,
    "nbreHomme" integer,
    "nbreFemme" integer,
    "nbreEnfant" integer,
    "quantiteDenre" integer,
    "typeDenre" json,
    "uniteDenre" character varying,
    material json,
    duree character varying,
    "uniteDuree" character varying,
    traite character varying,
    description character varying,
    cause character varying(300),
    "lieuInstallation" json,
    lat character varying(255),
    lng character varying(255),
    altitude character varying(255),
    "precision" character varying(255),
    "regionId" integer,
    "prefectureId" integer,
    "communeId" integer,
    "userId" integer,
    "isDelete" boolean DEFAULT false,
    revision character varying(255),
    "nbreBlesse" integer,
    "nbreMort" integer
);


ALTER TABLE public.catastrophe OWNER TO root;

--
-- Name: catastrophe_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.catastrophe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catastrophe_id_seq OWNER TO root;

--
-- Name: catastrophe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.catastrophe_id_seq OWNED BY public.catastrophe.id;


--
-- Name: commune; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.commune (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    nom character varying(60) NOT NULL,
    slug character varying(60) NOT NULL,
    "prefectureId" integer NOT NULL
);


ALTER TABLE public.commune OWNER TO root;

--
-- Name: commune_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.commune_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_id_seq OWNER TO root;

--
-- Name: commune_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.commune_id_seq OWNED BY public.commune.id;


--
-- Name: deplaceinterne; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.deplaceinterne (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    "lieuProvenance" character varying(300) NOT NULL,
    cause json NOT NULL,
    date character varying(300),
    heure character varying(30),
    "lieuInstallation" json NOT NULL,
    "nbreTotalPersonne" integer NOT NULL,
    "nbreHomme" character varying(30),
    "nbreFemme" character varying(30),
    "nbreEnfant" character varying(30),
    difficulite character varying(255),
    description text,
    "position" character varying NOT NULL,
    lat character varying(255),
    lng character varying(255),
    altitude character varying(255),
    "precision" character varying(255),
    "autreCause" character varying(255),
    "autreLieuxInstallation" character varying(255),
    "catastropheId" integer,
    "personneId" integer,
    "regionId" integer,
    "prefectureId" integer,
    "communeId" integer,
    "userId" integer,
    revision character varying(255)
);


ALTER TABLE public.deplaceinterne OWNER TO root;

--
-- Name: deplaceinterne_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.deplaceinterne_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deplaceinterne_id_seq OWNER TO root;

--
-- Name: deplaceinterne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.deplaceinterne_id_seq OWNED BY public.deplaceinterne.id;


--
-- Name: deplaces; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.deplaces (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    "causeDepart" character varying(300) NOT NULL,
    "zoneRelocalisation" character varying(300) NOT NULL,
    date character varying(300) NOT NULL,
    observation character varying(300),
    "regionId" integer,
    "prefectureId" integer,
    "communeId" integer,
    "personneId" integer,
    "catastropheId" integer
);


ALTER TABLE public.deplaces OWNER TO root;

--
-- Name: deplaces_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.deplaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deplaces_id_seq OWNER TO root;

--
-- Name: deplaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.deplaces_id_seq OWNED BY public.deplaces.id;


--
-- Name: file; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.file (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    path character varying NOT NULL,
    type_data character varying,
    "objectId" integer
);


ALTER TABLE public.file OWNER TO root;

--
-- Name: forgot; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.forgot (
    id integer NOT NULL,
    hash character varying NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    "userId" integer
);


ALTER TABLE public.forgot OWNER TO root;

--
-- Name: forgot_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.forgot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forgot_id_seq OWNER TO root;

--
-- Name: forgot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.forgot_id_seq OWNED BY public.forgot.id;


--
-- Name: materiels; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.materiels (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.materiels OWNER TO root;

--
-- Name: materiels_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.materiels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materiels_id_seq OWNER TO root;

--
-- Name: materiels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.materiels_id_seq OWNED BY public.materiels.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: personne; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.personne (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    code character varying(300) NOT NULL,
    nom character varying(300) NOT NULL,
    prenom character varying(300) NOT NULL,
    telephone character varying(300),
    email character varying(300),
    profession character varying(300) NOT NULL,
    age integer NOT NULL,
    sexe character varying(300) NOT NULL,
    "situationMatrimonial" character varying(300) NOT NULL,
    vulnerabilite character varying(300),
    "situationSanitaire" character varying(300),
    "pointEntre" character varying(300),
    "paysProvenance" character varying(300),
    "dateArrive" character varying(300),
    "codeOim" character varying(300),
    "isDeplace" character varying(300),
    type character varying(300) NOT NULL,
    observation character varying(300),
    cause character varying(300),
    "lieuInstallation" json,
    "regionId" integer,
    "prefectureId" integer,
    "communeId" integer,
    revision character varying(255)
);


ALTER TABLE public.personne OWNER TO root;

--
-- Name: personne_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.personne_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personne_id_seq OWNER TO root;

--
-- Name: personne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.personne_id_seq OWNED BY public.personne.id;


--
-- Name: personnedeplaceinterne; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.personnedeplaceinterne (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    "deplaceinterneId" integer,
    "personneId" integer,
    revision character varying(255)
);


ALTER TABLE public.personnedeplaceinterne OWNER TO root;

--
-- Name: personnedeplaceinterne_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.personnedeplaceinterne_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personnedeplaceinterne_id_seq OWNER TO root;

--
-- Name: personnedeplaceinterne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.personnedeplaceinterne_id_seq OWNED BY public.personnedeplaceinterne.id;


--
-- Name: prefecture; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.prefecture (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    nom character varying(60) NOT NULL,
    slug character varying(60) NOT NULL,
    "regionId" integer NOT NULL
);


ALTER TABLE public.prefecture OWNER TO root;

--
-- Name: prefecture_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.prefecture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prefecture_id_seq OWNER TO root;

--
-- Name: prefecture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.prefecture_id_seq OWNED BY public.prefecture.id;


--
-- Name: produit_prefectures; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.produit_prefectures (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    prix character varying NOT NULL,
    date date NOT NULL,
    unite character varying NOT NULL,
    "produitId" integer,
    "prefectureId" integer,
    "userId" integer,
    revision character varying(255)
);


ALTER TABLE public.produit_prefectures OWNER TO root;

--
-- Name: produit_prefectures_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.produit_prefectures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produit_prefectures_id_seq OWNER TO root;

--
-- Name: produit_prefectures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.produit_prefectures_id_seq OWNED BY public.produit_prefectures.id;


--
-- Name: produits; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.produits (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    revision character varying(255)
);


ALTER TABLE public.produits OWNER TO root;

--
-- Name: produits_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.produits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produits_id_seq OWNER TO root;

--
-- Name: produits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.produits_id_seq OWNED BY public.produits.id;


--
-- Name: reference; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reference (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    catastrophe json,
    habitude_alimentaire json,
    accessibilite_saison json,
    ong json,
    couverture_reseau json,
    accessibilite_moyen json,
    disponibilite_produit json,
    "userId" integer,
    "isDelete" boolean DEFAULT false,
    revision character varying(255),
    periode date,
    date_enregistrement date
);


ALTER TABLE public.reference OWNER TO root;

--
-- Name: reference_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_id_seq OWNER TO root;

--
-- Name: reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.reference_id_seq OWNED BY public.reference.id;


--
-- Name: region; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.region (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    nom character varying(60) NOT NULL,
    slug character varying(60) NOT NULL
);


ALTER TABLE public.region OWNER TO root;

--
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_seq OWNER TO root;

--
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO root;

--
-- Name: status; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.status (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.status OWNER TO root;

--
-- Name: traitementCatastrophe; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."traitementCatastrophe" (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    date character varying(300),
    commentaire json,
    fichier character varying(300),
    "catastropheId" integer,
    "userId" integer,
    revision character varying(255)
);


ALTER TABLE public."traitementCatastrophe" OWNER TO root;

--
-- Name: traitementCatastrophe_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."traitementCatastrophe_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."traitementCatastrophe_id_seq" OWNER TO root;

--
-- Name: traitementCatastrophe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."traitementCatastrophe_id_seq" OWNED BY public."traitementCatastrophe".id;


--
-- Name: type_catastrophes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.type_catastrophes (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.type_catastrophes OWNER TO root;

--
-- Name: type_catastrophes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.type_catastrophes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_catastrophes_id_seq OWNER TO root;

--
-- Name: type_catastrophes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.type_catastrophes_id_seq OWNED BY public.type_catastrophes.id;


--
-- Name: type_denres; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.type_denres (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.type_denres OWNER TO root;

--
-- Name: type_denres_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.type_denres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_denres_id_seq OWNER TO root;

--
-- Name: type_denres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.type_denres_id_seq OWNED BY public.type_denres.id;


--
-- Name: untites; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.untites (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.untites OWNER TO root;

--
-- Name: untites_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.untites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.untites_id_seq OWNER TO root;

--
-- Name: untites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.untites_id_seq OWNED BY public.untites.id;


--
-- Name: untites_produits_produits; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.untites_produits_produits (
    "untitesId" integer NOT NULL,
    "produitsId" integer NOT NULL
);


ALTER TABLE public.untites_produits_produits OWNER TO root;

--
-- Name: user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying,
    password character varying,
    provider character varying DEFAULT 'email'::character varying NOT NULL,
    "socialId" character varying,
    first_name character varying,
    last_name character varying,
    phone character varying,
    hash character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    "photoId" uuid,
    "roleId" integer,
    "statusId" integer,
    "regionId" integer,
    "prefectureId" integer,
    "communeId" integer,
    token_firebase character varying
);


ALTER TABLE public."user" OWNER TO root;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO root;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: catastrophe id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catastrophe ALTER COLUMN id SET DEFAULT nextval('public.catastrophe_id_seq'::regclass);


--
-- Name: commune id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.commune ALTER COLUMN id SET DEFAULT nextval('public.commune_id_seq'::regclass);


--
-- Name: deplaceinterne id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaceinterne ALTER COLUMN id SET DEFAULT nextval('public.deplaceinterne_id_seq'::regclass);


--
-- Name: deplaces id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaces ALTER COLUMN id SET DEFAULT nextval('public.deplaces_id_seq'::regclass);


--
-- Name: forgot id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.forgot ALTER COLUMN id SET DEFAULT nextval('public.forgot_id_seq'::regclass);


--
-- Name: materiels id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.materiels ALTER COLUMN id SET DEFAULT nextval('public.materiels_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personne id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personne ALTER COLUMN id SET DEFAULT nextval('public.personne_id_seq'::regclass);


--
-- Name: personnedeplaceinterne id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personnedeplaceinterne ALTER COLUMN id SET DEFAULT nextval('public.personnedeplaceinterne_id_seq'::regclass);


--
-- Name: prefecture id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prefecture ALTER COLUMN id SET DEFAULT nextval('public.prefecture_id_seq'::regclass);


--
-- Name: produit_prefectures id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.produit_prefectures ALTER COLUMN id SET DEFAULT nextval('public.produit_prefectures_id_seq'::regclass);


--
-- Name: produits id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.produits ALTER COLUMN id SET DEFAULT nextval('public.produits_id_seq'::regclass);


--
-- Name: reference id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reference ALTER COLUMN id SET DEFAULT nextval('public.reference_id_seq'::regclass);


--
-- Name: region id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- Name: traitementCatastrophe id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."traitementCatastrophe" ALTER COLUMN id SET DEFAULT nextval('public."traitementCatastrophe_id_seq"'::regclass);


--
-- Name: type_catastrophes id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.type_catastrophes ALTER COLUMN id SET DEFAULT nextval('public.type_catastrophes_id_seq'::regclass);


--
-- Name: type_denres id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.type_denres ALTER COLUMN id SET DEFAULT nextval('public.type_denres_id_seq'::regclass);


--
-- Name: untites id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.untites ALTER COLUMN id SET DEFAULT nextval('public.untites_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: catastrophe; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.catastrophe (id, uuid, created_at, updated_at, "typeCatastrophe", date, heure, "nbreTotalMenage", "nbreTotalPersonne", "nbreHomme", "nbreFemme", "nbreEnfant", "quantiteDenre", "typeDenre", "uniteDenre", material, duree, "uniteDuree", traite, description, cause, "lieuInstallation", lat, lng, altitude, "precision", "regionId", "prefectureId", "communeId", "userId", "isDelete", revision, "nbreBlesse", "nbreMort") FROM stdin;
48	1fc4e1ea-afd7-47e0-b915-3cba096e0734	2023-01-30 17:19:33.348609+00	2023-01-30 17:19:33.348609+00	Incendie	2023-01-10 12:30:00.000	2023-01-10 12:30:00.000	25	33	13	12	8	\N	[{"name":"Riz","quantite":"35","unite":"Sac"},{"name":"Mais","quantite":"15","unite":"Sac"},{"name":"Arachides","quantite":"5","unite":"Sac"}]	\N	[{"name":"Lits","quantite":"18"},{"name":"Matelas","quantite":"20"},{"name":"Ustensibles","quantite":"55"},{"name":"Habits","quantite":"70"},{"name":"Lattrines","quantite":"4"},{"name":"Argents","quantite":"1000000"},{"name":"Puits","quantite":"7"}]	4	Heures	NON	mobiliser rapidement l'assistance humanitaire\n	Test	"Kindia"	10.37	-9.31	\N	\N	6	19	166	10	f	\N	\N	\N
50	768bd524-b15f-4c6c-a94f-2a43d27ab5fb	2023-01-30 17:30:06.62032+00	2023-01-30 17:30:06.62032+00	Incendie	2022-12-20 22:50:00.000	2022-12-20 22:50:00.000	1	20	7	7	6	\N	[{"name":"Riz","quantite":"5","unite":"Sac"},{"name":"Mais","quantite":"100","unite":"Kg"},{"name":"Arachides","quantite":"25","unite":"Kg"},{"name":"Sorgho","quantite":"10","unite":"Kg"},{"name":"Bananes","quantite":"1","unite":"Sac"},{"name":"Pommes de terre","quantite":"2","unite":"Sac"},{"name":"Patattes","quantite":"2","unite":"Sac"},{"name":"Manioc","quantite":"1","unite":"Tonne"}]	\N	[{"name":"Lits","quantite":"4"},{"name":"Matelas","quantite":"4"},{"name":"Ustensibles","quantite":"10"},{"name":"Habits","quantite":"100"},{"name":"Lattrines","quantite":"2"},{"name":"Argents","quantite":"1000000"},{"name":"Puits","quantite":"1"}]	4	Heures	NON	null	Test	"Kindia"	10.95	-14.28	\N	\N	2	2	10	3	f	\N	\N	\N
51	4e5d30f9-7486-4e3c-bf57-88ca0aa2486e	2023-01-30 17:38:18.62362+00	2023-01-30 17:38:18.62362+00	Incendie	2023-01-02 14:00:00.000	2023-01-02 14:00:00.000	25	25	10	10	5	\N	[{"name":"Riz","quantite":"10","unite":"Sac"},{"name":"Arachides","quantite":"8","unite":"Sac"},{"name":"Patattes","quantite":"12","unite":"Sac"}]	\N	[{"name":"Lits","quantite":"6"},{"name":"Matelas","quantite":"9"}]	2	Heures	NON	les sinistrés demandent une assistance auprès des autorités	Test	"Kindia"	10.37	-12.08	\N	\N	4	12	87	16	f	\N	\N	\N
52	777d3e08-019d-45ca-b0c7-6ab321806bf9	2023-01-30 18:09:05.89966+00	2023-01-30 18:09:05.89966+00	Incendie	2022-12-02 12:30:00.000	2022-12-02 12:30:00.000	37	142	22	95	25	\N	[{"name":"Riz","quantite":"2","unite":"Tonne"},{"name":"Manioc","quantite":"25","unite":"Sac"}]	\N	[{"name":"Lits","quantite":"30"},{"name":"Matelas","quantite":"31"},{"name":"Ustensibles","quantite":"50"},{"name":"Habits","quantite":"45"},{"name":"Lattrines","quantite":"3"},{"name":"Argents","quantite":"1500000"},{"name":"Puits","quantite":"12"}]	2	Heures	NON	les sinistrés demande une assistance auprès de l'ANGUCH\n\n\n\n\n\n\n	Test	"Kindia"	9.19	-10.08	\N	\N	5	18	158	9	f	\N	\N	\N
53	97c1ef77-0632-4b59-a81d-7d3fa48a0b5c	2023-01-30 19:00:32.714357+00	2023-01-30 19:00:32.714357+00	Incendie	2022-12-23 18:30:00.000	2022-12-23 18:30:00.000	5	100	25	60	15	\N	[{"name":"Riz","quantite":"90","unite":"Sac"},{"name":"Mais","quantite":"40","unite":"Sac"},{"name":"Arachides","quantite":"120","unite":"Sac"},{"name":"Sorgho","quantite":"100","unite":"Kg"},{"name":"Bananes","quantite":"100","unite":"Kg"},{"name":"Pommes de terre","quantite":"150","unite":"Sac"},{"name":"Patattes","quantite":"180","unite":"Kg"},{"name":"Manioc","quantite":"85","unite":"Tonne"}]	\N	[{"name":"Lits","quantite":"7"},{"name":"Matelas","quantite":"7"},{"name":"Ustensibles","quantite":"100"},{"name":"Habits","quantite":"30"},{"name":"Lattrines","quantite":"3"},{"name":"Argents","quantite":"16000000"},{"name":"Puits","quantite":"1"}]	2	Heures	NON	besoin de soutien	Test	"Kindia"			\N	\N	2	6	36	4	f	\N	\N	\N
56	5444b4ee-aea3-46dc-bc21-4fab38e14d20	2023-01-31 10:14:29.512888+00	2023-01-31 10:14:29.512888+00	Glissement de terrain	2023-01-05 13:00:00.000	2023-01-05 13:00:00.000	5	105	25	50	30	\N	[]	\N	[]	2	Jours	NON	Les victimes de ce aller on besoin d'une acistant de la par de la direction 	Test	"Kindia"	10.62	-8.70	\N	\N	6	22	204	12	f	\N	\N	\N
59	da8ef07c-9499-4f39-aa21-20a56bb417d4	2023-01-31 11:11:49.279614+00	2023-01-31 11:11:49.279614+00	Inondation	2023-01-02 12:00:00.000	2023-01-02 12:00:00.000	5	50	15	20	15	\N	[{"name":"Riz","quantite":"2","unite":"Tonne"},{"name":"Mais","quantite":"80","unite":"Sac"},{"name":"Arachides","quantite":"45","unite":"Sac"},{"name":"Sorgho","quantite":"0","unite":"Sac"},{"name":"Bananes","quantite":"0","unite":"Sac"},{"name":"Pommes de terre","quantite":"12","unite":"Tonne"},{"name":"Patattes","quantite":"0","unite":"Sac"},{"name":"Manioc","quantite":"52","unite":"Sac"}]	\N	[{"name":"Lits","quantite":"10"},{"name":"Matelas","quantite":"10"},{"name":"Ustensibles","quantite":"50"},{"name":"Habits","quantite":"100"},{"name":"Lattrines","quantite":"3"},{"name":"Argents","quantite":"50000000"},{"name":"Puits","quantite":"3"}]	4	Heures	NON	nous prions l'agence d'assister les populations sinistrées \n	Test	"Kindia"	9.79	-13.52	\N	\N	3	9	\N	15	f	\N	\N	\N
45	2c4e0620-9212-46b5-be9b-249085c5d216	2023-01-30 16:24:04.353617+00	2023-01-30 16:24:04.353617+00	Incendie	2023-01-20 14:00:00.000	2023-01-20 14:00:00.000	36	217	88	102	27	\N	[]	\N	[]	1	Heures	NON	la population passe la nuit a la belle étoile, elle compte sur l'appui du gouvernement, des partenaires sociaux et toute personne de bonne volonté 	Test	"Kindia"	11.42	-9.17	\N	\N	6	23	214	13	f	\N	\N	\N
46	18a4e9b0-13ae-4f03-bead-7863a3a704b9	2023-01-30 16:34:15.014636+00	2023-01-30 16:34:15.014636+00	Inondation	2022-11-12 06:30:00.000	2022-11-12 06:30:00.000	168	261	100	109	52	\N	[{"name":"Riz","quantite":"200","unite":"Sac"},{"name":"Mais","quantite":"150","unite":"Sac"}]	\N	[{"name":"Lits","quantite":"20"},{"name":"Matelas","quantite":"20"},{"name":"Ustensibles","quantite":"50"},{"name":"Habits","quantite":"150"},{"name":"Lattrines","quantite":"5"},{"name":"Argents","quantite":"2500000"},{"name":"Puits","quantite":"15"}]	3	Jours	NON	Assistance des ménages sinistrés par L'ÉTAT Guineen à travers L'ANGUCH	Test	"Kindia"	10.65	-9.88	\N	\N	6	21	186	11	f	\N	\N	\N
47	5a001841-6ad0-4c72-b19e-475412ab4047	2023-01-30 16:49:43.439315+00	2023-01-30 16:49:43.439315+00	Inondation	2023-01-30 02:10:00.000	2023-01-30 02:10:00.000	25	215	125	75	15	\N	[{"name":"Riz","quantite":"30","unite":"Sac"},{"name":"Mais","quantite":"10","unite":"Sac"},{"name":"Arachides","quantite":"12","unite":"Sac"}]	\N	[]	4	Heures	NON	null	Test	"Kindia"			\N	\N	3	8	56	14	f	\N	\N	\N
60	cec56f5e-ea91-4db3-a51d-744a4dd4abaa	2023-01-31 11:11:49.380575+00	2023-01-31 11:11:49.380575+00	Incendie	2023-01-12 12:00:00.000	2023-01-12 12:00:00.000	10	70	10	36	24	\N	[]	\N	[{"name":"Lits","quantite":"10"},{"name":"Matelas","quantite":"10"},{"name":"Ustensibles","quantite":"25"},{"name":"Habits","quantite":"50"},{"name":"Lattrines","quantite":"2"},{"name":"Argents","quantite":"5000000"},{"name":"Puits","quantite":"2"}]	4	Heures	NON	vernir au secours des sinistrés 	Test	"Kindia"	9.71	-13.46	\N	\N	3	9	61	15	f	\N	\N	\N
61	1377fb46-3052-4b14-9689-fcbdb6f73254	2023-01-31 11:19:10.228221+00	2023-01-31 11:19:10.228221+00	Eboulement	2023-01-17 18:00:00.000	2023-01-17 18:00:00.000	15	15	9	5	1	\N	[]	\N	[]	3	Heures	NON	Défaut de réglementation de l'orpaillage 	Test	"Kindia"	9.51	-13.72	\N	\N	1	1	5	6	f	\N	\N	\N
62	48690c03-b3a4-4cb5-a680-5e22403077bc	2023-01-31 11:27:58.836156+00	2023-01-31 11:27:58.836156+00	Eboulement	2023-01-23 12:00:00.000	2023-01-23 12:00:00.000	9	9	6	2	1	\N	[]	\N	[]	4	Heures	NON	Manque de réglementation 	Test	"Kindia"	9.51	-13.72	\N	\N	1	1	4	7	f	\N	\N	\N
63	c8714c99-b69c-4d32-9a45-edc8e1e07541	2023-02-01 11:15:41.883613+00	2023-02-01 11:15:41.883613+00	Incendie	2023-02-01 12:00:00.000	2023-02-01 12:00:00.000	500	2570	350	800	1420	\N	[{"name":"Riz","quantite":"40","unite":"Tonne"},{"name":"Mais","quantite":"715","unite":"Tonne"}]	\N	[]	2	Jours	NON	nous d3mandons ue assisrtence	Test	"Kindia"	9.51	-13.72	\N	\N	1	1	1	35	f	\N	\N	\N
64	f817d0d4-c6d8-493b-9ff7-ac106b030116	2023-02-06 12:23:34.143275+00	2023-02-06 12:23:34.143275+00	Incendie	2023-02-06 12:00:00.000	2023-02-06 12:00:00.000	5	35	10	10	15	\N	[{"name":"Riz","quantite":"100","unite":"Kg"},{"name":"Mais","quantite":"10","unite":"Sac"},{"name":"Arachides","quantite":"12","unite":"Sac"},{"name":"Sorgho","quantite":"2","unite":"Kg"},{"name":"Bananes","quantite":"1","unite":"Grenier"},{"name":"Pommes de terre","quantite":"5","unite":"Sac"},{"name":"Patattes","quantite":"2","unite":"Sac"},{"name":"Manioc","quantite":"1","unite":"Grenier"}]	\N	[{"name":"Lits","quantite":"10"},{"name":"Matelas","quantite":"10"},{"name":"Ustensibles","quantite":"25"},{"name":"Habits","quantite":"100"},{"name":"Lattrines","quantite":"3"},{"name":"Argents","quantite":"1000000"},{"name":"Puits","quantite":"2"}]	4	Heures	NON	Une assistance immédiate en faveur des victimes.	Test	"Kindia"	9.51	-13.72	\N	\N	2	2	6	3	f	\N	\N	\N
65	d548486b-ab5b-4189-a65f-2340e446c90b	2023-02-06 12:33:20.128928+00	2023-02-06 12:33:20.128928+00	Tornades	2023-02-05 16:00:00.000	2023-02-05 16:00:00.000	8	65	20	20	25	\N	[{"name":"Riz","quantite":"10","unite":"Sac"},{"name":"Mais","quantite":"2","unite":"Grenier"},{"name":"Arachides","quantite":"3","unite":"Grenier"},{"name":"Sorgho","quantite":"5","unite":"Sac"},{"name":"Bananes","quantite":"5","unite":"Sac"},{"name":"Pommes de terre","quantite":"20","unite":"Kg"},{"name":"Patattes","quantite":"5","unite":"Kg"},{"name":"Manioc","quantite":"3","unite":"Sac"}]	\N	[{"name":"Lits","quantite":"20"},{"name":"Matelas","quantite":"25"},{"name":"Ustensibles","quantite":"100"},{"name":"Habits","quantite":"125"},{"name":"Lattrines","quantite":"4"},{"name":"Argents","quantite":"10000000"},{"name":"Puits","quantite":"4"}]	5	Heures	NON	La levée d'une mission d'assistance aux sinistrés pour minimiser leur vulnérabilité.	Test	"Kindia"	9.51	-13.72	\N	\N	2	2	11	3	f	\N	\N	\N
75	9e10602d-f279-4af4-9e81-ad84dcf5080c	2023-02-10 09:13:28.268627+00	2023-02-10 09:16:48.880702+00	Conflits	2023-02-09 12:00:00.000	2023-02-09 12:00:00.000	2	9	3	2	4	\N	[{"nom":"Pommes de terre","quantite":"test","unite":"Grenier"}]	\N	[{"nom":"Argents","quantite":"20000"},{"nom":"Habits","quantite":"45"}]	1	Jours	Encours	Test	Test	\N	9.51	-13.71	\N	\N	1	1	1	1	t	\N	\N	\N
76	aba7c799-fcde-40ff-9ac8-7d724347c7c4	2023-02-10 09:16:09.931758+00	2023-02-10 09:17:01.045634+00	Conflits	2023-02-09 12:00:00.000	2023-02-09 12:00:00.000	2	9	3	2	4	\N	[]	\N	[{"nom":"Argents","quantite":"20000"},{"nom":"Habits","quantite":"45"}]	1	Jours	Non	Test	Test	\N	9.51	-13.71	\N	\N	1	1	1	1	t	\N	\N	\N
\.


--
-- Data for Name: commune; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.commune (id, uuid, created_at, updated_at, nom, slug, "prefectureId") FROM stdin;
1	b42ac7bc-a727-4882-8881-81cb1d3ecaab	2023-01-22 08:56:00.204114+00	2023-01-22 08:56:00.204114+00	Kaloum	1	1
2	2478229f-4fe1-429d-83b4-209d04789e46	2023-01-22 08:56:00.23374+00	2023-01-22 08:56:00.23374+00	Dixinn	2	1
3	2addda9e-21eb-4dc1-b575-0cdb854b2059	2023-01-22 08:56:00.248034+00	2023-01-22 08:56:00.248034+00	Matam	3	1
4	a4923637-a22a-43a2-b008-007d07825346	2023-01-22 08:56:00.262416+00	2023-01-22 08:56:00.262416+00	Ratoma	4	1
5	f91a434f-2ef2-4022-ad8b-44fde10ba9c6	2023-01-22 08:56:00.270319+00	2023-01-22 08:56:00.270319+00	Matoto	5	1
6	c1cfcedb-7bfd-4e77-964e-b49a6ee23d79	2023-01-22 08:56:00.283973+00	2023-01-22 08:56:00.283973+00	Boké Centre	6	2
7	1f513fd4-0ad4-4acb-aa98-171626c08802	2023-01-22 08:56:00.291917+00	2023-01-22 08:56:00.291917+00	Bintimodiya	7	2
8	53a8cd5e-d40b-465b-859e-106c5e5f1db7	2023-01-22 08:56:00.304826+00	2023-01-22 08:56:00.304826+00	Dabiss	8	2
9	b4ccff4f-f7eb-407b-8a0b-8c8bb9c35ec4	2023-01-22 08:56:00.322139+00	2023-01-22 08:56:00.322139+00	Kamsar	9	2
10	7b568ce3-5820-4902-a1d2-ee3eb85b0c12	2023-01-22 08:56:00.330242+00	2023-01-22 08:56:00.330242+00	Kanfarandé	10	2
11	4821e99f-0be1-46a9-8417-e84c22919c49	2023-01-22 08:56:00.340298+00	2023-01-22 08:56:00.340298+00	Kolaboui	11	2
12	ca7359d0-ead1-44bb-ae3f-957be4f59abd	2023-01-22 08:56:00.348309+00	2023-01-22 08:56:00.348309+00	Malapouyah	12	2
13	3cc702a1-795d-4e1f-b1fe-4b0b71edeae6	2023-01-22 08:56:00.360287+00	2023-01-22 08:56:00.360287+00	Sangaredi	13	2
14	1af1c58f-512b-4f81-be7e-1036fc35ff20	2023-01-22 08:56:00.368112+00	2023-01-22 08:56:00.368112+00	Sansalé	14	2
15	18408861-ff0c-4a11-9e0c-a2a9ebb9229e	2023-01-22 08:56:00.377727+00	2023-01-22 08:56:00.377727+00	Tanéné	15	2
16	ef6ff213-98d0-495e-a9d7-e5660d76907a	2023-01-22 08:56:00.390319+00	2023-01-22 08:56:00.390319+00	Boffa Centre	16	3
18	6f7fce35-0355-4cf9-9c2f-c7c5775f2ac2	2023-01-22 08:56:00.4251+00	2023-01-22 08:56:00.4251+00	Douprou	18	3
19	09b7dbec-1c28-4a3b-83ed-a22c8ac4c026	2023-01-22 08:56:00.435096+00	2023-01-22 08:56:00.435096+00	Koba-Tatema	19	3
20	2f622b7b-8ca9-4d83-9693-99c4738bc753	2023-01-22 08:56:00.452553+00	2023-01-22 08:56:00.452553+00	Lisso	20	3
21	b86f1a32-b757-450f-9bd2-d931c863ee6b	2023-01-22 08:56:00.466551+00	2023-01-22 08:56:00.466551+00	Mankountan	21	3
22	35aade6d-3552-4fef-bfbf-c9a9442d7414	2023-01-22 08:56:00.478964+00	2023-01-22 08:56:00.478964+00	Tamita	22	3
23	42209923-954a-46af-85f6-d6a9c95a0144	2023-01-22 08:56:00.489001+00	2023-01-22 08:56:00.489001+00	Tougnifili	23	3
24	4ddc8989-f6d9-464b-b728-87bfef87d74b	2023-01-22 08:56:00.508382+00	2023-01-22 08:56:00.508382+00	Fria-Centre	24	4
25	0517401c-942b-4fe4-b7a1-e10a560a1b28	2023-01-22 08:56:00.515722+00	2023-01-22 08:56:00.515722+00	Baguinet	25	4
26	776f3cb7-c8e3-4ca7-8da0-d9cc19498d46	2023-01-22 08:56:00.525499+00	2023-01-22 08:56:00.525499+00	Banguingny	26	4
27	c63a2f16-02cb-4b52-9001-0293734dc6c7	2023-01-22 08:56:00.53967+00	2023-01-22 08:56:00.53967+00	Tormelin	27	4
28	5495d7cc-524d-4077-b9aa-18b9bca578e3	2023-01-22 08:56:00.546118+00	2023-01-22 08:56:00.546118+00	Gaoual-Centre	28	5
29	420beaf0-6576-4c5e-a81e-f88ef1dcd6fe	2023-01-22 08:56:00.555541+00	2023-01-22 08:56:00.555541+00	Koumbia	29	5
30	a5fe6db3-3185-4294-873a-1f6784029e39	2023-01-22 08:56:00.565756+00	2023-01-22 08:56:00.565756+00	Kakony	30	5
31	d20b17e7-4581-49be-9f5f-4ce7e0dece33	2023-01-22 08:56:00.57271+00	2023-01-22 08:56:00.57271+00	Touba	31	5
32	9cbd0808-ac7b-4dc9-8509-4335a373e96d	2023-01-22 08:56:00.58596+00	2023-01-22 08:56:00.58596+00	Foulamory	32	5
33	527204bd-d88d-4764-8f25-80e327766dd2	2023-01-22 08:56:00.598123+00	2023-01-22 08:56:00.598123+00	Wendou M'Bour	33	5
34	b1dc2e71-7d8f-4b19-9cc3-eebd57704b58	2023-01-22 08:56:00.605433+00	2023-01-22 08:56:00.605433+00	Kounsitel	34	5
35	c7279e82-6a30-4f6f-a7ab-0f2161f332af	2023-01-22 08:56:00.617977+00	2023-01-22 08:56:00.617977+00	Malanta	35	5
36	1654c529-2b44-4aec-b7eb-c1d2fe292421	2023-01-22 08:56:00.628642+00	2023-01-22 08:56:00.628642+00	Koundara-Centre	36	6
37	75517afe-6ef2-40ff-9bf1-2667126d9dca	2023-01-22 08:56:00.641549+00	2023-01-22 08:56:00.641549+00	Guingan	37	6
38	db2e54a8-9087-4c68-a75e-de85d6d11744	2023-01-22 08:56:00.652331+00	2023-01-22 08:56:00.652331+00	Kamaby	38	6
39	2128950f-8c65-4816-94ca-b8b96fbd75d6	2023-01-22 08:56:00.661249+00	2023-01-22 08:56:00.661249+00	Sambailo	39	6
40	559937ba-0ec0-4513-8726-364c4aff2fdf	2023-01-22 08:56:00.672994+00	2023-01-22 08:56:00.672994+00	Sareboido	40	6
41	e7c0e477-328a-4761-901a-8563ae1b7ae6	2023-01-22 08:56:00.692428+00	2023-01-22 08:56:00.692428+00	Termesse	41	6
42	cad7be5e-b71b-4922-aa2c-280a21237820	2023-01-22 08:56:00.701335+00	2023-01-22 08:56:00.701335+00	Youkounkoun	42	6
43	59fa02b8-293c-48ab-aa40-a1dfd5f74158	2023-01-22 08:56:00.712175+00	2023-01-22 08:56:00.712175+00	Kindia Centre	43	7
44	592a8018-3cee-46e4-bbca-6d878ade75cb	2023-01-22 08:56:00.719735+00	2023-01-22 08:56:00.719735+00	Bangouyah	44	7
45	4c902e43-babd-4dbb-9097-e18424a616d4	2023-01-22 08:56:00.732385+00	2023-01-22 08:56:00.732385+00	Damankanyah	45	7
46	d7661479-f722-44b5-a849-9d2ad86fd066	2023-01-22 08:56:00.741159+00	2023-01-22 08:56:00.741159+00	Friguiagbé	46	7
47	df873e1f-8c9a-4405-8968-c7ff66c2ba70	2023-01-22 08:56:00.749167+00	2023-01-22 08:56:00.749167+00	Kolente	47	7
48	504838be-87b9-453a-9b37-dab0d874f417	2023-01-22 08:56:00.763104+00	2023-01-22 08:56:00.763104+00	Madina Oula	48	7
50	3a358848-d365-4b23-8375-e32c4f777006	2023-01-22 08:56:00.800383+00	2023-01-22 08:56:00.800383+00	Molota	50	7
51	405e72ed-a9ce-4137-aabe-230169a645f8	2023-01-22 08:56:00.809705+00	2023-01-22 08:56:00.809705+00	Samayah	51	7
52	8d7569ce-aac9-41d6-828e-543e6c1bd9ef	2023-01-22 08:56:00.820269+00	2023-01-22 08:56:00.820269+00	Sougueta	52	7
54	ac4253a0-0a19-4520-b3c7-d05ff6717104	2023-01-22 08:56:00.838344+00	2023-01-22 08:56:00.838344+00	Manéah	54	8
56	f131a3c3-4ba3-4b3c-95a9-ab4277fdddb5	2023-01-22 08:56:00.858998+00	2023-01-22 08:56:00.858998+00	Wonkifong	56	8
57	46584c69-d061-41fd-930e-ed4c468614b3	2023-01-22 08:56:00.867105+00	2023-01-22 08:56:00.867105+00	Wassou	57	9
58	9df25744-1f99-4344-859e-15de13de2f3d	2023-01-22 08:56:00.880842+00	2023-01-22 08:56:00.880842+00	Khorira	58	9
59	1f03fe2f-3544-4b41-b15e-3ab173dd690b	2023-01-22 08:56:00.89458+00	2023-01-22 08:56:00.89458+00	Badi	59	9
60	74a34a7c-9209-4591-bb33-96a09070f02f	2023-01-22 08:56:00.902423+00	2023-01-22 08:56:00.902423+00	Falissade	60	9
61	89f94e12-d053-435b-b68b-2bb02ebe3dc1	2023-01-22 08:56:00.909755+00	2023-01-22 08:56:00.909755+00	Tondon	61	9
49	d1ea6ab2-e00d-47ab-943b-ca87c192fe61	2023-01-22 08:56:00.777112+00	2023-01-22 08:56:00.777112+00	Mambia	49	7
53	9d8b5922-35cc-4902-9e7e-d83c2d6c270a	2023-01-22 08:56:00.8282+00	2023-01-22 08:56:00.8282+00	Coyah-centre	53	8
55	6d8b9364-6b16-4615-88d9-197cbab6f498	2023-01-22 08:56:00.846371+00	2023-01-22 08:56:00.846371+00	Kouriah	55	8
69	e2d7ac61-f08e-4595-8e7d-323d1ddbf090	2023-01-22 08:56:01.022968+00	2023-01-22 08:56:01.022968+00	Sikhourou	69	10
62	ac186035-a279-451d-943c-99eed371efd7	2023-01-22 08:56:00.927311+00	2023-01-22 08:56:00.927311+00	Forécariah Centre	62	10
63	c979cc3a-80d5-43ae-a649-ab91dec6f319	2023-01-22 08:56:00.956402+00	2023-01-22 08:56:00.956402+00	Alassoya	63	10
64	6c448539-7032-4597-8ad5-603ef397c31b	2023-01-22 08:56:00.965412+00	2023-01-22 08:56:00.965412+00	Farmoriah	64	10
65	d93f7976-f7cc-4930-a4ce-7958d9af8177	2023-01-22 08:56:00.974884+00	2023-01-22 08:56:00.974884+00	Kakossa	65	10
66	fe255be0-e38a-4b2c-9916-bd99cb698cfa	2023-01-22 08:56:00.988566+00	2023-01-22 08:56:00.988566+00	Kallia	66	10
68	47394ffa-9b1f-4679-ae22-4524bfd36367	2023-01-22 08:56:01.008988+00	2023-01-22 08:56:01.008988+00	Moussayah	68	10
70	9cfb1819-65da-40d0-8f0f-a7b1f0b6eb2a	2023-01-22 08:56:01.030197+00	2023-01-22 08:56:01.030197+00	Benty	70	10
71	a1f83a59-6c44-49e5-986d-7c189b3057c4	2023-01-22 08:56:01.042484+00	2023-01-22 08:56:01.042484+00	Kaback	71	10
72	f40f6768-59d8-48ef-9601-84645e244aa1	2023-01-22 08:56:01.049874+00	2023-01-22 08:56:01.049874+00	Télimélé Centre	72	11
73	238b4e20-686d-4822-bec2-e31f74a345a8	2023-01-22 08:56:01.063594+00	2023-01-22 08:56:01.063594+00	Bourouwal	73	11
74	bfd06b63-e2c0-4859-9ada-7f0298eb6e3b	2023-01-22 08:56:01.071377+00	2023-01-22 08:56:01.071377+00	Daramagnaky	74	11
75	09b6e1a8-73d9-4f25-9681-6890f003427d	2023-01-22 08:56:01.084844+00	2023-01-22 08:56:01.084844+00	Gougoudjé	75	11
76	f14da602-7764-491d-9dfc-1a2d3cc8012d	2023-01-22 08:56:01.092757+00	2023-01-22 08:56:01.092757+00	Koba	76	11
77	df6e40c3-93e0-416b-a3fc-0d932208076f	2023-01-22 08:56:01.105286+00	2023-01-22 08:56:01.105286+00	Kollet	77	11
78	4b16b1ba-919c-4d0f-9752-8108b22d8353	2023-01-22 08:56:01.122694+00	2023-01-22 08:56:01.122694+00	Konsotamy	78	11
79	28362f1d-cccf-4d50-b31e-befa7e0033b5	2023-01-22 08:56:01.13121+00	2023-01-22 08:56:01.13121+00	Missira	79	11
80	eead6464-db25-4884-85bc-96dc5a839867	2023-01-22 08:56:01.14081+00	2023-01-22 08:56:01.14081+00	Santou	80	11
82	a696bffa-7f40-4e85-8463-e8c60a4cd006	2023-01-22 08:56:01.160702+00	2023-01-22 08:56:01.160702+00	Sinta	82	11
83	a6932995-9190-43e9-980b-19a7c5396819	2023-01-22 08:56:01.16905+00	2023-01-22 08:56:01.16905+00	Sogolon	83	11
84	f6d921d3-a2a9-46a1-a4a6-4ead4941bc26	2023-01-22 08:56:01.182548+00	2023-01-22 08:56:01.182548+00	Tarihoye	84	11
85	d02a965f-40b1-4e00-9da0-5fad9c0bd0b3	2023-01-22 08:56:01.193993+00	2023-01-22 08:56:01.193993+00	Thionthian	85	11
87	15b37778-d6c9-4eb0-a01e-e681f91c95a1	2023-01-22 08:56:01.218742+00	2023-01-22 08:56:01.218742+00	Bouliwel	87	12
88	1e568d10-b303-490b-8be8-76c6f8b8769a	2023-01-22 08:56:01.230048+00	2023-01-22 08:56:01.230048+00	Dounet	88	12
89	c238f6ab-0e2d-4141-83d3-71c22ab4255e	2023-01-22 08:56:01.238395+00	2023-01-22 08:56:01.238395+00	Gongoret	89	12
90	5e7158a4-4ad1-42a6-b72b-b248c9404881	2023-01-22 08:56:01.254511+00	2023-01-22 08:56:01.254511+00	Kégnéko	90	12
91	f44182fc-2a72-471a-a1fc-b0852f675224	2023-01-22 08:56:01.278194+00	2023-01-22 08:56:01.278194+00	Konkouré	91	12
92	2ece3cb5-1e91-4627-96e2-9c2fc571e4a3	2023-01-22 08:56:01.291576+00	2023-01-22 08:56:01.291576+00	Nyagara	92	12
93	ac5e1b25-6a21-4c1c-a8a3-f49798f0ae0e	2023-01-22 08:56:01.307195+00	2023-01-22 08:56:01.307195+00	Ouré Kaba	93	12
86	f2a326a7-2c0a-4f86-ad4a-098407aac3e9	2023-01-22 08:56:01.204109+00	2023-01-22 08:56:01.204109+00	Mamou Centre	86	12
173	aff51f28-0294-4d4a-936c-210dfb8fb866	2023-01-22 08:56:02.167507+00	2023-01-22 08:56:02.167507+00	Tokounou	176	19
126	45d4a6b1-b2da-4805-b492-291b68fdeacd	2023-01-22 08:56:01.721539+00	2023-01-22 08:56:01.721539+00	Kobikoro	126	15
175	156d43e2-a4ac-4ffd-a1cb-12f305e94eaa	2023-01-22 08:56:02.179581+00	2023-01-22 08:56:02.179581+00	Damaro	175	20
94	7050a867-639b-4791-9081-850f4738f232	2023-01-22 08:56:01.32018+00	2023-01-22 08:56:01.32018+00	Porédaka	94	12
95	9b7aca22-d350-40ff-9618-8dde57f317a9	2023-01-22 08:56:01.332897+00	2023-01-22 08:56:01.332897+00	Saramoussaya	95	12
96	e17f66b7-bf7c-4f18-8e41-516f5ff71689	2023-01-22 08:56:01.34094+00	2023-01-22 08:56:01.34094+00	Soyah	96	12
97	de89e4ed-34f4-47a0-81be-897707b2ef83	2023-01-22 08:56:01.35474+00	2023-01-22 08:56:01.35474+00	Téguéréya	97	12
98	0f3f6214-cef1-456b-9fb9-d15fd9631995	2023-01-22 08:56:01.369573+00	2023-01-22 08:56:01.369573+00	Timbo	98	12
99	12338ca9-197c-4bef-87e8-9e3ec12f92df	2023-01-22 08:56:01.381248+00	2023-01-22 08:56:01.381248+00	Tolo	99	12
100	35bc80bc-0986-4a74-b76a-5413f70132fc	2023-01-22 08:56:01.395507+00	2023-01-22 08:56:01.395507+00	Dalaba Centre	100	13
101	b0104c47-5770-4de8-bf01-be2b318dd9e7	2023-01-22 08:56:01.406458+00	2023-01-22 08:56:01.406458+00	Bodié	101	13
102	579f786a-2374-4bdc-9a49-dd184eec61a2	2023-01-22 08:56:01.414586+00	2023-01-22 08:56:01.414586+00	Ditinn	102	13
103	6eb0063b-763e-4e8b-8c92-e0151e72110b	2023-01-22 08:56:01.426868+00	2023-01-22 08:56:01.426868+00	Kaala	103	13
104	e3f76fee-7819-4894-9848-09071e2e7a8a	2023-01-22 08:56:01.434744+00	2023-01-22 08:56:01.434744+00	Kankalabé	104	13
105	66944812-7a56-48ae-952a-f88d34f068e7	2023-01-22 08:56:01.453509+00	2023-01-22 08:56:01.453509+00	Kébali	105	13
106	b5c1eab9-8c72-4662-b3e5-eeca8d54d64c	2023-01-22 08:56:01.468283+00	2023-01-22 08:56:01.468283+00	Mafara	106	13
107	15595423-1892-4d93-8ad5-91e99d35466e	2023-01-22 08:56:01.478594+00	2023-01-22 08:56:01.478594+00	Mitty	107	13
108	d671400d-903b-463b-9ce1-063d2969df01	2023-01-22 08:56:01.492629+00	2023-01-22 08:56:01.492629+00	Mombéyah	108	13
109	7fd4289c-53ab-4255-9255-af40b9d53bb4	2023-01-22 08:56:01.512306+00	2023-01-22 08:56:01.512306+00	Pita Centre	109	14
110	c8826855-e839-425b-8a30-6e9d698c66bf	2023-01-22 08:56:01.525929+00	2023-01-22 08:56:01.525929+00	Bantignel	110	14
111	6f623366-ff64-4f46-a2f2-b9dae9d32418	2023-01-22 08:56:01.533709+00	2023-01-22 08:56:01.533709+00	Bourouwal-Tappé	111	14
112	8f811c95-7baf-485f-bcf6-3ce1e130f505	2023-01-22 08:56:01.5472+00	2023-01-22 08:56:01.5472+00	Donghol-Touma	112	14
113	6c19785c-9f0d-444f-b974-89122d7014d0	2023-01-22 08:56:01.559317+00	2023-01-22 08:56:01.559317+00	Gongoré	113	14
114	5d6fc62a-dc70-4dca-a000-9332a3c30f25	2023-01-22 08:56:01.566929+00	2023-01-22 08:56:01.566929+00	Ley-Miro	114	14
115	819e3ec2-319d-4fca-a51d-864813ac9784	2023-01-22 08:56:01.58641+00	2023-01-22 08:56:01.58641+00	Maci	115	14
117	9a4031d5-052a-4e3d-9835-d9b42f11ff95	2023-01-22 08:56:01.606521+00	2023-01-22 08:56:01.606521+00	Sangaréyah	117	14
118	fc0ed89b-8a37-4d38-90ee-0b0a1599a68a	2023-01-22 08:56:01.618134+00	2023-01-22 08:56:01.618134+00	Sintali	118	14
119	69d8b120-0e34-4631-a49e-e01f8f12e396	2023-01-22 08:56:01.642428+00	2023-01-22 08:56:01.642428+00	Timbi Touny	119	14
120	907c5dca-a490-4146-ad34-b0edc71a233b	2023-01-22 08:56:01.651222+00	2023-01-22 08:56:01.651222+00	Timbi Madina	120	14
121	a9fe1dd2-533f-4435-b869-ae6610bcd720	2023-01-22 08:56:01.663997+00	2023-01-22 08:56:01.663997+00	Faranah Centre	121	15
122	60781b25-c35e-450d-9ed2-fdfb080f1a36	2023-01-22 08:56:01.671154+00	2023-01-22 08:56:01.671154+00	Banian	122	15
124	0e93b7e9-667c-4255-a233-d6f294c24fff	2023-01-22 08:56:01.693578+00	2023-01-22 08:56:01.693578+00	Gnaléah	124	15
125	0f6f69e7-3fca-4ccb-8e55-ea7c4bd389d6	2023-01-22 08:56:01.711282+00	2023-01-22 08:56:01.711282+00	Hérémakono	125	15
127	a5c8d57d-003c-4e6e-a692-9ce14a5e8245	2023-01-22 08:56:01.733888+00	2023-01-22 08:56:01.733888+00	Marela	127	15
128	49d4ce82-ffc4-4d10-b777-77f496c1671d	2023-01-22 08:56:01.747829+00	2023-01-22 08:56:01.747829+00	Passayah	128	15
129	6e04dd45-0a53-4561-8bb2-06053f7955bb	2023-01-22 08:56:01.764513+00	2023-01-22 08:56:01.764513+00	Sandéniah	129	15
130	f48a722f-2a6c-4fa8-9b31-f8dc135e6bb6	2023-01-22 08:56:01.774035+00	2023-01-22 08:56:01.774035+00	Songoyah	130	15
131	40a3fddc-ee69-49ae-b841-e83067520cb5	2023-01-22 08:56:01.78353+00	2023-01-22 08:56:01.78353+00	Tindo	131	15
132	508e9c25-57b5-4b85-9236-d07bea0996d8	2023-01-22 08:56:01.79591+00	2023-01-22 08:56:01.79591+00	Tiro	132	15
133	cea15bfa-3ae9-4534-b529-cc1fb9ab92ce	2023-01-22 08:56:01.807427+00	2023-01-22 08:56:01.807427+00	Arfamoussaya	133	16
134	9377b33a-e87b-4cc4-b676-a94f1f1fbb27	2023-01-22 08:56:01.814899+00	2023-01-22 08:56:01.814899+00	Banko	134	16
135	6dc1ddc3-626d-4f05-bddb-c155dd05d69e	2023-01-22 08:56:01.822317+00	2023-01-22 08:56:01.822317+00	Bissikrima	135	16
136	1bb3754c-ac2c-4222-856e-4abe8f833d2f	2023-01-22 08:56:01.833818+00	2023-01-22 08:56:01.833818+00	Dogomet	136	16
137	b487dce1-fbd4-4bdf-83cb-bb2edae19059	2023-01-22 08:56:01.845716+00	2023-01-22 08:56:01.845716+00	Kankama	137	16
138	c09f8047-9838-4890-bcfd-90f07dbd9c68	2023-01-22 08:56:01.859294+00	2023-01-22 08:56:01.859294+00	Kindoye	138	16
139	e7f1f992-63ad-42f2-8fa0-549624d7d344	2023-01-22 08:56:01.870843+00	2023-01-22 08:56:01.870843+00	Konindou	139	16
140	e49364f5-6aa2-493d-bb94-50c18b0c2b7d	2023-01-22 08:56:01.881787+00	2023-01-22 08:56:01.881787+00	Ndéma	140	16
142	9345d2bd-60ed-414e-8bf5-8a18c9ffd4ce	2023-01-22 08:56:01.896781+00	2023-01-22 08:56:01.896781+00	Banora	142	17
143	546b504a-340d-490a-86de-6820d97442ed	2023-01-22 08:56:01.902959+00	2023-01-22 08:56:01.902959+00	Dialakoro	143	17
144	92c772ee-0318-407d-80e6-7e15caf4a616	2023-01-22 08:56:01.908997+00	2023-01-22 08:56:01.908997+00	Diatiféré	144	17
145	afa73663-2fba-40ea-a0a2-d85153e18765	2023-01-22 08:56:01.918808+00	2023-01-22 08:56:01.918808+00	Gagnakali	145	17
146	35d178aa-c19d-461c-ac5f-9ff48bb9104f	2023-01-22 08:56:01.925052+00	2023-01-22 08:56:01.925052+00	Kalinko	146	17
147	32ddef51-2af9-4eda-b97c-ef27e4d7349c	2023-01-22 08:56:01.931942+00	2023-01-22 08:56:01.931942+00	Lansanya	147	17
148	42bccd5f-0310-4b43-bd90-1e6876c46e39	2023-01-22 08:56:01.941391+00	2023-01-22 08:56:01.941391+00	Sélouma	148	17
149	97254292-b762-4d21-8c06-f79760902915	2023-01-22 08:56:01.947535+00	2023-01-22 08:56:01.947535+00	Kissidougou Centre	149	18
150	18b166ce-205c-4ba8-ad1f-608497206c1d	2023-01-22 08:56:01.954336+00	2023-01-22 08:56:01.954336+00	Albadaria	150	18
151	24961c99-ea77-442d-9590-f8f25bb040b8	2023-01-22 08:56:01.965526+00	2023-01-22 08:56:01.965526+00	Banama	151	18
152	3c1dbbfb-827c-4f25-9685-5703155549f7	2023-01-22 08:56:01.972087+00	2023-01-22 08:56:01.972087+00	Bardou	152	18
154	1233de89-7a74-4c74-af2d-b25297b4aa22	2023-01-22 08:56:01.990728+00	2023-01-22 08:56:01.990728+00	Firawa	154	18
155	65fde03a-1a9a-4441-89bc-f896df3f1be8	2023-01-22 08:56:01.996865+00	2023-01-22 08:56:01.996865+00	Gbangbadou	155	18
156	5ecf2af3-5599-43e0-ab79-6fa12836284b	2023-01-22 08:56:02.005097+00	2023-01-22 08:56:02.005097+00	Kondiatou	156	18
157	8143f47b-6e1e-426e-a182-045e61abe5e0	2023-01-22 08:56:02.011405+00	2023-01-22 08:56:02.011405+00	Manfran	157	18
158	ccbbef8d-bf0c-484e-ad79-3ee0189ad5ec	2023-01-22 08:56:02.017217+00	2023-01-22 08:56:02.017217+00	Sangardo	158	18
159	2896cd1f-1f0f-4d45-8391-b83acac06de3	2023-01-22 08:56:02.043598+00	2023-01-22 08:56:02.043598+00	Yendé-Millimou	159	18
160	49812683-5665-4d0f-addb-cf383cd467e7	2023-01-22 08:56:02.057913+00	2023-01-22 08:56:02.057913+00	Yombiro	160	18
161	9078acb7-b04f-4a16-8d49-79b3a4c591e5	2023-01-22 08:56:02.069608+00	2023-01-22 08:56:02.069608+00	Kankan Centre	161	19
162	25b6d5b5-ee50-4e31-9727-87bb0496aca0	2023-01-22 08:56:02.076537+00	2023-01-22 08:56:02.076537+00	Balandougou	162	19
163	c7a46e18-7d37-4a09-bd92-80dc80dade7c	2023-01-22 08:56:02.090923+00	2023-01-22 08:56:02.090923+00	Bate-Nafadji	163	19
164	e3e8d340-0608-4963-a064-83abd5707000	2023-01-22 08:56:02.097236+00	2023-01-22 08:56:02.097236+00	Boula	164	19
166	7e9a1fb1-f5b0-45c3-97f0-7a210bf2accb	2023-01-22 08:56:02.109455+00	2023-01-22 08:56:02.109455+00	Kanfamoriyah	166	19
167	a38eb77e-116f-4a3d-8439-27828f89c91c	2023-01-22 08:56:02.121778+00	2023-01-22 08:56:02.121778+00	Koumban	167	19
168	7bcd4d89-51b5-4c19-8914-b02e6508d79d	2023-01-22 08:56:02.131898+00	2023-01-22 08:56:02.131898+00	Mamouroudou	168	19
169	681fed15-ae60-427f-b1c7-c7502e37f39a	2023-01-22 08:56:02.143436+00	2023-01-22 08:56:02.143436+00	Missamana	169	19
170	57649f40-4855-42b1-a513-e7157e29e855	2023-01-22 08:56:02.149497+00	2023-01-22 08:56:02.149497+00	Moribayah	170	19
171	2bddffcc-d43e-485c-94a9-f4170c3d3a7b	2023-01-22 08:56:02.155767+00	2023-01-22 08:56:02.155767+00	Sabadou-Baranama	171	19
172	2e8ff4f6-eb6f-46d8-b970-678bcaf00207	2023-01-22 08:56:02.161523+00	2023-01-22 08:56:02.161523+00	Tinti-Oulena	172	19
174	6a6198f1-886f-4f05-bac4-6ecd027d78f5	2023-01-22 08:56:02.173502+00	2023-01-22 08:56:02.173502+00	Kérouané-centre	174	20
176	d82eef8b-65ec-4d14-a49c-78217c6452d0	2023-01-22 08:56:02.185195+00	2023-01-22 08:56:02.185195+00	Banankoro	176	20
177	a618d421-b9eb-46c5-b729-64a27f2a073a	2023-01-22 08:56:02.190995+00	2023-01-22 08:56:02.190995+00	Komodou	177	20
178	a82edfe8-b6e2-416a-a0b2-064e2427c284	2023-01-22 08:56:02.213115+00	2023-01-22 08:56:02.213115+00	Kounsankoro	178	20
179	931698f5-2bbb-4f88-b933-394c042decc2	2023-01-22 08:56:02.219947+00	2023-01-22 08:56:02.219947+00	Linko	179	20
180	acd4ea38-6450-4f30-9a01-76b9dac13ea0	2023-01-22 08:56:02.226139+00	2023-01-22 08:56:02.226139+00	Sibiribaro	180	20
181	4e4cb68c-8f3c-4b1f-9bf3-3dd01c803181	2023-01-22 08:56:02.233152+00	2023-01-22 08:56:02.233152+00	Soromaya	181	20
182	1feccf2d-255e-4a78-aee5-ee5f483bbc80	2023-01-22 08:56:02.242359+00	2023-01-22 08:56:02.242359+00	Kouroussa Centre	182	21
183	44c0575b-d264-4337-bb01-d7dbce5f6ff8	2023-01-22 08:56:02.248207+00	2023-01-22 08:56:02.248207+00	Balato	183	21
184	78a0a8c0-c19b-487a-89da-9cb645f22b89	2023-01-22 08:56:02.254126+00	2023-01-22 08:56:02.254126+00	Banfélé	184	21
261	a3d54240-8d12-44e6-ba78-78208334180d	2023-01-22 08:56:02.942633+00	2023-01-22 08:56:02.942633+00	Kansangui	261	28
262	9b282e4f-c03f-470f-aae8-21e2f1bcbcd6	2023-01-22 08:56:02.948554+00	2023-01-22 08:56:02.948554+00	Kolangui 	262	28
263	0c52adec-4271-4ed0-97f1-40c0cb3ebf0a	2023-01-22 08:56:02.959061+00	2023-01-22 08:56:02.959061+00	Konah	263	28
264	bf602d76-cab6-4163-8ea2-799941c834e9	2023-01-22 08:56:02.965674+00	2023-01-22 08:56:02.965674+00	Kouratongo	264	28
265	57ec62df-63c4-4cfe-97a6-a21d464b2db4	2023-01-22 08:56:02.972769+00	2023-01-22 08:56:02.972769+00	Koïn	265	28
266	e5ba11f7-5b4b-48c6-b42e-37f3003007c5	2023-01-22 08:56:02.980696+00	2023-01-22 08:56:02.980696+00	Tangaly	266	28
268	f373be54-d88d-4ffc-95ef-59b1ac1e0403	2023-01-22 08:56:02.998465+00	2023-01-22 08:56:02.998465+00	Bounouma	268	29
269	e8182f8a-da0b-46d7-bab6-e2de3be8a0a9	2023-01-22 08:56:03.00431+00	2023-01-22 08:56:03.00431+00	Gouécké	269	29
270	999f07ce-0b9a-4685-b9f9-8459745f77aa	2023-01-22 08:56:03.012945+00	2023-01-22 08:56:03.012945+00	Kobéla	270	29
271	f47e2c47-a3b0-492e-8573-26eb12f0f863	2023-01-22 08:56:03.020263+00	2023-01-22 08:56:03.020263+00	Koropara	271	29
272	2c92c570-1630-4651-bd06-d186f7dc4709	2023-01-22 08:56:03.02735+00	2023-01-22 08:56:03.02735+00	Koulé	272	29
273	e77ee649-9d16-4a5d-a02d-6dbea4486288	2023-01-22 08:56:03.038616+00	2023-01-22 08:56:03.038616+00	Palé	273	29
274	2407a0b3-f5fb-433c-bffa-5e36358859ad	2023-01-22 08:56:03.045728+00	2023-01-22 08:56:03.045728+00	Samoé	274	29
275	ecd79654-85df-4730-8245-9f5b02ddfe35	2023-01-22 08:56:03.052522+00	2023-01-22 08:56:03.052522+00	Soulouta	275	29
276	fdaca610-ea48-4ddf-8254-1db5e5645383	2023-01-22 08:56:03.061787+00	2023-01-22 08:56:03.061787+00	Womey	276	29
201	7789a2d7-d29e-4f5c-8550-749fe69ee5ff	2023-01-22 08:56:02.371338+00	2023-01-22 08:56:02.371338+00	Morodou	201	22
226	2c8525d8-5028-45a8-972e-e1a421a49d01	2023-01-22 08:56:02.59405+00	2023-01-22 08:56:02.59405+00	Noussy	226	24
239	e659c5f8-5660-4660-89d4-7ec98c0b4102	2023-01-22 08:56:02.73327+00	2023-01-22 08:56:02.73327+00	Korbe	239	26
185	b05d37e0-5e34-48dc-8c75-16e60de9a376	2023-01-22 08:56:02.260083+00	2023-01-22 08:56:02.260083+00	Babila	185	21
186	2c55fdf1-e8b7-47fa-a281-5830db41759a	2023-01-22 08:56:02.265712+00	2023-01-22 08:56:02.265712+00	Baro	186	21
187	05f5c944-81d2-4929-9478-13ad2436b32d	2023-01-22 08:56:02.271183+00	2023-01-22 08:56:02.271183+00	Cisséla	187	21
188	5717aa2b-3f77-482a-a20c-f7e91a11c53c	2023-01-22 08:56:02.276716+00	2023-01-22 08:56:02.276716+00	Douako	188	21
189	a58547db-076c-4827-90a6-8c4b457fda11	2023-01-22 08:56:02.282585+00	2023-01-22 08:56:02.282585+00	Doura	189	21
191	5bc5b469-7a76-432e-a204-4eb88a1de15c	2023-01-22 08:56:02.296588+00	2023-01-22 08:56:02.296588+00	Komola-Koura	191	21
192	eed4a869-8c9d-41e4-8cdf-da5e0a8e5f5a	2023-01-22 08:56:02.302893+00	2023-01-22 08:56:02.302893+00	Koumana	192	21
193	0257c92c-74b7-44e0-8520-b345f1614172	2023-01-22 08:56:02.308984+00	2023-01-22 08:56:02.308984+00	Sanguiana	193	21
194	88a7864d-37c5-4b58-bffb-fc06e20561e3	2023-01-22 08:56:02.314809+00	2023-01-22 08:56:02.314809+00	Mandian Centre	194	22
195	8c97d724-930d-4749-b5a4-40c0dfe81ba8	2023-01-22 08:56:02.320644+00	2023-01-22 08:56:02.320644+00	Balandougouba	195	22
196	f6b71afc-64cb-4cab-8cff-f44b6f731065	2023-01-22 08:56:02.331389+00	2023-01-22 08:56:02.331389+00	Faralako	196	22
197	fe6a04aa-afb1-44d0-b670-6c30e03550af	2023-01-22 08:56:02.337754+00	2023-01-22 08:56:02.337754+00	Kantoumania	197	22
198	4b9ec062-41ec-4edc-a9dd-e3025c80f923	2023-01-22 08:56:02.344085+00	2023-01-22 08:56:02.344085+00	Kiniéran	198	22
199	fd96abd3-1171-4af4-9224-d53849133351	2023-01-22 08:56:02.356262+00	2023-01-22 08:56:02.356262+00	Koundian	199	22
200	a42f85a4-8837-4a9a-8ee9-338b657bd187	2023-01-22 08:56:02.364663+00	2023-01-22 08:56:02.364663+00	Koundianakoro	200	22
202	ce9b673b-4ca4-4847-9988-577d64c7e028	2023-01-22 08:56:02.377956+00	2023-01-22 08:56:02.377956+00	Niantania	202	22
203	47838eda-b174-4c45-b5f6-862ba2460e7e	2023-01-22 08:56:02.384762+00	2023-01-22 08:56:02.384762+00	Saladou	203	22
204	73029b49-c9ae-455f-ba7d-0a5c5a37b411	2023-01-22 08:56:02.393372+00	2023-01-22 08:56:02.393372+00	Sansando	204	22
205	0d457f25-27ac-4dae-afcb-cc09ae072a10	2023-01-22 08:56:02.399973+00	2023-01-22 08:56:02.399973+00	Siguiri Centre	205	23
206	a132ef6f-e86b-4c32-85e3-e58b6407238b	2023-01-22 08:56:02.406189+00	2023-01-22 08:56:02.406189+00	Bankon	206	23
207	f6df1ccd-4fb5-45bc-8cc3-4d88aee2e355	2023-01-22 08:56:02.414832+00	2023-01-22 08:56:02.414832+00	Doko	207	23
208	49b476fb-a34e-4655-9ba1-a0f9e5e9d49a	2023-01-22 08:56:02.421102+00	2023-01-22 08:56:02.421102+00	Kiniébakoura	208	23
209	56f81fba-3728-4e65-8382-6f80012fe733	2023-01-22 08:56:02.445997+00	2023-01-22 08:56:02.445997+00	Kintinian	209	23
210	d20f6e28-258a-4dfa-8db5-82775948caa4	2023-01-22 08:56:02.452363+00	2023-01-22 08:56:02.452363+00	Maléa	210	23
211	5233258a-d963-4e38-a122-60121fb43bf9	2023-01-22 08:56:02.458299+00	2023-01-22 08:56:02.458299+00	Naboun	211	23
213	b6ca3792-1487-4d4a-8e50-76bc50c0a036	2023-01-22 08:56:02.471052+00	2023-01-22 08:56:02.471052+00	Niandankoro	213	23
214	81aa312d-58dc-4667-b866-aab7adc826f0	2023-01-22 08:56:02.477489+00	2023-01-22 08:56:02.477489+00	Norassoba	214	23
215	423a81cf-8c8b-44d9-800a-e1a1c2a1726d	2023-01-22 08:56:02.483458+00	2023-01-22 08:56:02.483458+00	Nounkounkan	215	23
216	71a84252-2226-435d-9768-2ef874c9d8f6	2023-01-22 08:56:02.489389+00	2023-01-22 08:56:02.489389+00	Siguirini	216	23
217	cdde8ac5-6ce4-4f90-8960-1dfbe1d3d21b	2023-01-22 08:56:02.495362+00	2023-01-22 08:56:02.495362+00	Labé Centre	217	24
218	85ff296b-c17b-49cb-b8d2-9fa5739a2028	2023-01-22 08:56:02.501514+00	2023-01-22 08:56:02.501514+00	Dalein	218	24
219	60e28910-103d-4350-aa32-e7de7f4e3b2d	2023-01-22 08:56:02.507838+00	2023-01-22 08:56:02.507838+00	Daralabe	219	24
220	25349c45-8adc-42cd-98dd-90b438748a6c	2023-01-22 08:56:02.51392+00	2023-01-22 08:56:02.51392+00	Diari	220	24
221	c0e6fbb9-5c7c-4f56-b67c-aa7678771023	2023-01-22 08:56:02.520145+00	2023-01-22 08:56:02.520145+00	Dionfo	221	24
222	ed963c64-71e3-490c-8a16-59f9fe905949	2023-01-22 08:56:02.526211+00	2023-01-22 08:56:02.526211+00	Garambé	222	24
223	970e0958-1d82-4cb2-9ef6-727a40a7f222	2023-01-22 08:56:02.532401+00	2023-01-22 08:56:02.532401+00	Hafia	223	24
224	e25c3ff0-f171-4efd-a2a9-45368b47eb40	2023-01-22 08:56:02.556152+00	2023-01-22 08:56:02.556152+00	Kaalan	224	24
225	84a4475f-4736-4189-8554-34cfc933d779	2023-01-22 08:56:02.577032+00	2023-01-22 08:56:02.577032+00	Kouramangui	225	24
227	d124f18b-a103-4b3e-b575-88dba812ff4a	2023-01-22 08:56:02.608361+00	2023-01-22 08:56:02.608361+00	Popodara	227	24
228	9b975b03-300e-4b7f-ad18-cdac3239b966	2023-01-22 08:56:02.620704+00	2023-01-22 08:56:02.620704+00	Sannou	228	24
229	f8dcb8da-8992-4d60-8bbb-f5b060177aa9	2023-01-22 08:56:02.635977+00	2023-01-22 08:56:02.635977+00	Taranbaly	229	24
230	5d798b09-5c4d-44df-8265-70b53edf7553	2023-01-22 08:56:02.644155+00	2023-01-22 08:56:02.644155+00	Tountouroun	230	24
231	c7464cc8-f00b-41e5-abd5-2aff28d632f8	2023-01-22 08:56:02.660671+00	2023-01-22 08:56:02.660671+00	Koubia Centre	231	25
232	995b7d4b-0576-44a4-81b4-dd411de7b73b	2023-01-22 08:56:02.672771+00	2023-01-22 08:56:02.672771+00	Fafaya	232	25
233	f09c65b2-c252-4926-b7fa-8bdd168c1dc2	2023-01-22 08:56:02.684446+00	2023-01-22 08:56:02.684446+00	Gadha-Woundou	233	25
234	bbcf36c1-6bde-4565-8d4f-bc41618f2ed6	2023-01-22 08:56:02.692414+00	2023-01-22 08:56:02.692414+00	Matakaou	234	25
235	1ada6291-9303-4b77-9b78-2adb4430f4f8	2023-01-22 08:56:02.702866+00	2023-01-22 08:56:02.702866+00	Pilimini	235	25
237	36944dbc-dc6a-47c0-b878-a86fa9ecade6	2023-01-22 08:56:02.721244+00	2023-01-22 08:56:02.721244+00	Balaya	237	26
238	57321612-02ef-4bd8-adac-a8050423d0c0	2023-01-22 08:56:02.727226+00	2023-01-22 08:56:02.727226+00	Diountou	238	26
240	6c242375-65fb-4120-a6a5-f81d71388423	2023-01-22 08:56:02.744426+00	2023-01-22 08:56:02.744426+00	Herico	240	26
241	6bcd81d0-1093-4ac6-a01b-089cc7bd1d71	2023-01-22 08:56:02.751801+00	2023-01-22 08:56:02.751801+00	Lafou	241	26
242	1c9bb910-7448-4ff4-abb4-4fa5a577c337	2023-01-22 08:56:02.762005+00	2023-01-22 08:56:02.762005+00	Manda	242	26
243	a0870b5e-463a-49f1-9925-7907c004a2ba	2023-01-22 08:56:02.768946+00	2023-01-22 08:56:02.768946+00	Parawol	243	26
244	8c57323f-e94f-4da5-9612-cc872639dbb3	2023-01-22 08:56:02.781003+00	2023-01-22 08:56:02.781003+00	Sagalé	244	26
245	859eba0c-a048-421c-8223-49a26955c232	2023-01-22 08:56:02.78834+00	2023-01-22 08:56:02.78834+00	Tyanguel-Bori	245	26
246	b38f082d-a2ae-4377-8dca-fcf5be2b9677	2023-01-22 08:56:02.797592+00	2023-01-22 08:56:02.797592+00	Mali Centre	246	27
247	e6111960-ac69-4059-8624-9898b0d3a713	2023-01-22 08:56:02.803612+00	2023-01-22 08:56:02.803612+00	Balaki	247	27
248	1a202b30-911c-4081-b105-2734494d1b0a	2023-01-22 08:56:02.81269+00	2023-01-22 08:56:02.81269+00	Donghol Sigon	248	27
249	b793c677-e3b8-41dc-9fa6-317b4c3d2c17	2023-01-22 08:56:02.818341+00	2023-01-22 08:56:02.818341+00	Dougountouny	249	27
250	534d241e-3bf9-414b-815d-dec61f8e8190	2023-01-22 08:56:02.826852+00	2023-01-22 08:56:02.826852+00	Fougou	250	27
251	f0d6e6cf-04f8-4db2-9f55-ca444f02b63e	2023-01-22 08:56:02.855666+00	2023-01-22 08:56:02.855666+00	Gayah	251	27
252	9acfd059-f448-4a18-9a82-3a9fb000d82d	2023-01-22 08:56:02.862336+00	2023-01-22 08:56:02.862336+00	Hidayatou	252	27
253	336a4ecc-588a-4560-956e-c91db9c93aec	2023-01-22 08:56:02.869284+00	2023-01-22 08:56:02.869284+00	Lébékéré	253	27
254	e1a005dd-6cc7-4de6-8e16-4c68f26e5407	2023-01-22 08:56:02.876457+00	2023-01-22 08:56:02.876457+00	Yembereng	254	27
255	ba08cbeb-b533-4434-9199-7dfe025d4fe4	2023-01-22 08:56:02.893725+00	2023-01-22 08:56:02.893725+00	Téliré	255	27
256	9177059b-6ed5-42c5-9351-00becb15586b	2023-01-22 08:56:02.899859+00	2023-01-22 08:56:02.899859+00	Salambande	256	27
257	363c50ab-1742-4e8f-a35d-3918bdb9e202	2023-01-22 08:56:02.905869+00	2023-01-22 08:56:02.905869+00	Madina Wora	257	27
259	7949de8d-a732-4025-be40-11aee54decbc	2023-01-22 08:56:02.925951+00	2023-01-22 08:56:02.925951+00	Fatako	259	28
278	f220c418-8fc7-4172-93e9-550c26d920a3	2023-01-22 08:56:03.073751+00	2023-01-22 08:56:03.073751+00	Guéckédou Centre	278	30
279	1029e27d-fb4c-42ec-9d85-7eff9f53d693	2023-01-22 08:56:03.081322+00	2023-01-22 08:56:03.081322+00	Bolodou	279	30
280	2ac31bc0-440a-453b-9f9b-6f65328eb90b	2023-01-22 08:56:03.087176+00	2023-01-22 08:56:03.087176+00	Fangamadou	280	30
281	4ceb4f56-e9c7-4ac9-adc8-533dedda67a6	2023-01-22 08:56:03.099224+00	2023-01-22 08:56:03.099224+00	Guendembou	281	30
282	2ec60f90-0102-4239-8627-b9d30859106a	2023-01-22 08:56:03.130087+00	2023-01-22 08:56:03.130087+00	Kassadou	282	30
283	23be4cd1-8a07-41e5-8f1c-aee1441f13e4	2023-01-22 08:56:03.145276+00	2023-01-22 08:56:03.145276+00	Kouindou	283	30
302	936ca7e1-e576-4040-b664-6ef0c87ee498	2023-01-22 08:56:03.354602+00	2023-01-22 08:56:03.354602+00	Lola Centre	302	32
285	da6fb144-1be7-4ffc-9b2d-f0a422c2439c	2023-01-22 08:56:03.157911+00	2023-01-22 08:56:03.157911+00	Ouéndé-Kénéma	285	30
286	77e1d4c6-9640-45b6-a4ef-f33101bbdeb1	2023-01-22 08:56:03.163446+00	2023-01-22 08:56:03.163446+00	Tékoulo	286	30
287	74c2e07a-db3d-4ece-96a0-6a3085070a92	2023-01-22 08:56:03.221443+00	2023-01-22 08:56:03.221443+00	Terméssadou Djibo	287	30
288	22fd9cc4-e160-43d0-a406-98e69fde2772	2023-01-22 08:56:03.238023+00	2023-01-22 08:56:03.238023+00	Beyla	288	31
289	ab939a3d-7001-4d53-ae86-683280a7f393	2023-01-22 08:56:03.255567+00	2023-01-22 08:56:03.255567+00	Boola	289	31
290	0fc5d99c-01a6-4022-8823-1ce52516a9e1	2023-01-22 08:56:03.261918+00	2023-01-22 08:56:03.261918+00	Fouala	290	31
291	6944e2b7-713e-4ac6-b507-df8aa0c2ec98	2023-01-22 08:56:03.269537+00	2023-01-22 08:56:03.269537+00	Sokourala	291	31
292	e76b5af5-13c5-45bd-8fcf-c5e9c8f6528e	2023-01-22 08:56:03.281842+00	2023-01-22 08:56:03.281842+00	Sinko	292	31
293	671b358c-6d3c-4c98-8b11-d09275d12952	2023-01-22 08:56:03.293982+00	2023-01-22 08:56:03.293982+00	Koumandou	293	31
294	f5a70980-0b02-41c3-b812-04fc75ded834	2023-01-22 08:56:03.300663+00	2023-01-22 08:56:03.300663+00	Samana	294	31
295	8f845ea8-2d83-4841-b97e-1b1d0299c056	2023-01-22 08:56:03.306917+00	2023-01-22 08:56:03.306917+00	Gbèssoba	295	31
296	19ad52d0-6d77-4e7c-a98b-3feb063c19a4	2023-01-22 08:56:03.313409+00	2023-01-22 08:56:03.313409+00	Nionsomoridou	296	31
297	20b1925f-18f1-45ee-b6a2-de9262363762	2023-01-22 08:56:03.319933+00	2023-01-22 08:56:03.319933+00	Karala	297	31
298	df0af170-f4de-4f68-8e69-e0337ced9ec6	2023-01-22 08:56:03.326721+00	2023-01-22 08:56:03.326721+00	Gbackédou	298	31
299	e8a1738c-e2bd-4659-927e-6ff44ee02739	2023-01-22 08:56:03.333329+00	2023-01-22 08:56:03.333329+00	Moussadou	299	31
300	9d2de8fe-9ab2-423b-a58c-07e5991f7a75	2023-01-22 08:56:03.341241+00	2023-01-22 08:56:03.341241+00	Diassadou	300	31
301	fda6ce43-9542-40c6-b952-9240f4200261	2023-01-22 08:56:03.347798+00	2023-01-22 08:56:03.347798+00	Diara-guerela	301	31
355	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Engbédou	355	34
303	792d47ac-c3d4-4905-a58f-1de3e5fc5015	2023-01-22 08:56:03.361175+00	2023-01-22 08:56:03.361175+00	Bossou	303	32
304	38876ddb-42f8-4150-8a88-d1e003be48ce	2023-01-22 08:56:03.368727+00	2023-01-22 08:56:03.368727+00	Foumbadou	304	32
305	cbbeb66a-1ea1-4d31-bd9c-c6d18ec1f7e2	2023-01-22 08:56:03.374789+00	2023-01-22 08:56:03.374789+00	Gama Bèrèma	305	32
306	d2cb4bae-b445-41cf-b611-8f2d7e6bbe49	2023-01-22 08:56:03.381152+00	2023-01-22 08:56:03.381152+00	Guéassou	306	32
307	973de480-6a54-499b-aac6-5c11fcc55189	2023-01-22 08:56:03.387238+00	2023-01-22 08:56:03.387238+00	Kokota	307	32
308	90886715-8a01-4e30-9041-6ff005f674b7	2023-01-22 08:56:03.394687+00	2023-01-22 08:56:03.394687+00	Lainé	308	32
309	171191b1-0103-4228-9ef6-4017a4ff8c21	2023-01-22 08:56:03.405889+00	2023-01-22 08:56:03.405889+00	N'Zoo	309	32
310	eb37c208-4f00-42e6-8a98-e1c5cf27a4c2	2023-01-22 08:56:03.429575+00	2023-01-22 08:56:03.429575+00	Tounkarata	310	32
311	a28599a6-0394-427b-9b32-91fe077a906f	2023-01-22 08:56:03.436836+00	2023-01-22 08:56:03.436836+00	Yomou Centre	311	33
312	9e820645-5780-42d2-92e8-2d5a3a328d11	2023-01-22 08:56:03.443468+00	2023-01-22 08:56:03.443468+00	Banié	312	33
313	d3d15165-e3c2-411a-a97d-1549ae22a0a1	2023-01-22 08:56:03.453392+00	2023-01-22 08:56:03.453392+00	Bheeta	313	33
314	934a1d3b-8b5f-467e-96d8-153d3a4ea14c	2023-01-22 08:56:03.459478+00	2023-01-22 08:56:03.459478+00	Bignamou	314	33
315	c7275a1e-7711-4b41-a20b-5089c459b0fb	2023-01-22 08:56:03.469273+00	2023-01-22 08:56:03.469273+00	Bowé	315	33
316	7e6f352d-b297-4694-b7ca-3cb036f82d61	2023-01-22 08:56:03.486532+00	2023-01-22 08:56:03.486532+00	Diécké	316	33
356	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Sérédou	356	34
318	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Macenta centre	318	34
17	940d518e-7253-4494-8673-5b21cf7c5ad8	2023-01-22 08:56:00.418121+00	2023-01-22 08:56:00.418121+00	Kolia	17	3
319	c63a2f16-02cb-4b52-9001-0293734dc6c7	2023-01-22 08:56:00.53967+00	2023-01-22 08:56:00.53967+00	Bangouyah	319	4
320	420beaf0-6576-4c5e-a81e-f88ef1dcd6fe	2023-01-22 08:56:00.555541+00	2023-01-22 08:56:00.555541+00	Bantala	320	5
317	ad9dff5f-e615-42cf-9158-2954b74e49c3	2023-01-22 08:56:03.49327+00	2023-01-22 08:56:03.49327+00	Péla	317	33
324	89f94e12-d053-435b-b68b-2bb02ebe3dc1	2023-01-22 08:56:00.909755+00	2023-01-22 08:56:00.909755+00	Ouassou	324	9
325	89f94e12-d053-435b-b68b-2bb02ebe3dc1	2023-01-22 08:56:00.909755+00	2023-01-22 08:56:00.909755+00	Tanéné dubréka	325	9
323	89f94e12-d053-435b-b68b-2bb02ebe3dc1	2023-01-22 08:56:00.909755+00	2023-01-22 08:56:00.909755+00	Dubréka-centre	323	9
326	e3f76fee-7819-4894-9848-09071e2e7a8a	2023-01-22 08:56:01.434744+00	2023-01-22 08:56:01.434744+00	Koba dalaba	326	13
327	ad4749f1-d7ba-446c-9df2-22791809f58d	2023-01-22 08:56:01.680347+00	2023-01-22 08:56:01.680347+00	Bindougou	327	15
328	508e9c25-57b5-4b85-9236-d07bea0996d8	2023-01-22 08:56:01.79591+00	2023-01-22 08:56:01.79591+00	Nialia	328	15
330	32ddef51-2af9-4eda-b97c-ef27e4d7349c	2023-01-22 08:56:01.931942+00	2023-01-22 08:56:01.931942+00	Kallia	330	17
329	cea15bfa-3ae9-4534-b529-cc1fb9ab92ce	2023-01-22 08:56:01.807427+00	2023-01-22 08:56:01.807427+00	Dalaba-centre	329	16
331	65fde03a-1a9a-4441-89bc-f896df3f1be8	2023-01-22 08:56:01.996865+00	2023-01-22 08:56:01.996865+00	Beindou	331	18
153	94778b29-6245-4b73-93b7-65d8843bac54	2023-01-22 08:56:01.984146+00	2023-01-22 08:56:01.984146+00	Fermesadou	156	18
332	db7cfac4-475f-4310-93ac-397e40bfc5f3	2023-01-22 08:56:02.103409+00	2023-01-22 08:56:02.103409+00	Baranama	332	19
333	fe6a04aa-afb1-44d0-b670-6c30e03550af	2023-01-22 08:56:02.337754+00	2023-01-22 08:56:02.337754+00	Dialakoro kankan	333	22
334	a132ef6f-e86b-4c32-85e3-e58b6407238b	2023-01-22 08:56:02.406189+00	2023-01-22 08:56:02.406189+00	Franwalia	334	23
335	1ada6291-9303-4b77-9b78-2adb4430f4f8	2023-01-22 08:56:02.702866+00	2023-01-22 08:56:02.702866+00	Missira	335	25
337	8c57323f-e94f-4da5-9612-cc872639dbb3	2023-01-22 08:56:02.781003+00	2023-01-22 08:56:02.781003+00	Pétoye	337	26
336	8c57323f-e94f-4da5-9612-cc872639dbb3	2023-01-22 08:56:02.781003+00	2023-01-22 08:56:02.781003+00	Linsan saran	336	26
338	e1a005dd-6cc7-4de6-8e16-4c68f26e5407	2023-01-22 08:56:02.876457+00	2023-01-22 08:56:02.876457+00	Touba mali	338	27
339	e1a005dd-6cc7-4de6-8e16-4c68f26e5407	2023-01-22 08:56:02.876457+00	2023-01-22 08:56:02.876457+00	Madina	339	27
340	7949de8d-a732-4025-be40-11aee54decbc	2023-01-22 08:56:02.925951+00	2023-01-22 08:56:02.925951+00	Tougué-centre	340	28
341	7949de8d-a732-4025-be40-11aee54decbc	2023-01-22 08:56:02.925951+00	2023-01-22 08:56:02.925951+00	Fello-koundoua	341	28
342	7949de8d-a732-4025-be40-11aee54decbc	2023-01-22 08:56:02.925951+00	2023-01-22 08:56:02.925951+00	Kollet tougué	342	28
343	74c2e07a-db3d-4ece-96a0-6a3085070a92	2023-01-22 08:56:03.221443+00	2023-01-22 08:56:03.221443+00	Beindou	343	30
284	2a9e0808-e34d-4d0e-b825-c02ab63b269d	2023-01-22 08:56:03.151909+00	2023-01-22 08:56:03.151909+00	Nongoa	284	30
344	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Balizia	344	34
346	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Binikala	346	34
347	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Bofossou	347	34
348	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Daro	348	34
349	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Fassankoni	349	34
350	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Kouankan	350	34
351	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Koyamah	351	34
352	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	N'zébéla	352	34
353	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Ourémaï	353	34
354	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Panziazou	354	34
357	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Vassérédou	357	34
358	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Watanka	358	34
67	b776321f-dc66-471d-b87b-181ec7292ae0	2023-01-22 08:56:01.001546+00	2023-01-22 08:56:01.001546+00	Maferinya	67	10
123	ad4749f1-d7ba-446c-9df2-22791809f58d	2023-01-22 08:56:01.680347+00	2023-01-22 08:56:01.680347+00	Beindou	123	15
258	321112a2-1100-4afc-b53d-7b5d687abd06	2023-01-22 08:56:02.912364+00	2023-01-22 08:56:02.912364+00	Tougué Centre	258	28
260	3941b502-276b-4b8d-b13a-e35033218926	2023-01-22 08:56:02.933188+00	2023-01-22 08:56:02.933188+00	Fello Koundoua	260	28
277	9ecdfc64-2665-4905-9af7-6cb68858be36	2023-01-22 08:56:03.067775+00	2023-01-22 08:56:03.067775+00	Yalenzou	277	29
321	fe255be0-e38a-4b2c-9916-bd99cb698cfa	2023-01-22 08:56:00.988566+00	2023-01-22 08:56:00.988566+00	Kalinko	321	10
322	f6d921d3-a2a9-46a1-a4a6-4ead4941bc26	2023-01-22 08:56:01.182548+00	2023-01-22 08:56:01.182548+00	Tarihoye	322	11
345	a1fe3eb1-ac04-4888-b8b2-da9bff95fc10	2023-01-31 20:26:53.774502+00	2023-01-31 20:26:53.774502+00	Soulouta	345	34
81	3febaef3-2c1b-4f92-9196-c61cb243eec7	2023-01-22 08:56:01.152342+00	2023-01-22 08:56:01.152342+00	Sarékaly	81	11
116	eaa27091-047d-4fd7-89cb-e5f199f58966	2023-01-22 08:56:01.594189+00	2023-01-22 08:56:01.594189+00	Ninguélandé	116	14
141	3e163cbb-34f5-41c7-8118-bc75d6cf0461	2023-01-22 08:56:01.88819+00	2023-01-22 08:56:01.88819+00	Dinguiraye Centre	141	17
165	db7cfac4-475f-4310-93ac-397e40bfc5f3	2023-01-22 08:56:02.103409+00	2023-01-22 08:56:02.103409+00	Gbérédou-Baranama	165	19
190	a21aa36f-0d1f-4136-91ab-30cd4874ecf5	2023-01-22 08:56:02.288561+00	2023-01-22 08:56:02.288561+00	Kiniéro	190	21
212	71261e54-e24b-485c-b614-02809339021a	2023-01-22 08:56:02.464588+00	2023-01-22 08:56:02.464588+00	Niagassola	212	23
236	ffc9ffb3-473c-4b5d-b760-2c38bfb39d4e	2023-01-22 08:56:02.711412+00	2023-01-22 08:56:02.711412+00	Lélouma Centre	236	26
267	2f7276aa-e58b-4afe-8fe2-b4fb89558aa9	2023-01-22 08:56:02.986832+00	2023-01-22 08:56:02.986832+00	Nzérékoré Centre	267	29
\.


--
-- Data for Name: deplaceinterne; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.deplaceinterne (id, uuid, created_at, updated_at, "lieuProvenance", cause, date, heure, "lieuInstallation", "nbreTotalPersonne", "nbreHomme", "nbreFemme", "nbreEnfant", difficulite, description, "position", lat, lng, altitude, "precision", "autreCause", "autreLieuxInstallation", "catastropheId", "personneId", "regionId", "prefectureId", "communeId", "userId", revision) FROM stdin;
\.


--
-- Data for Name: deplaces; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.deplaces (id, uuid, created_at, updated_at, "causeDepart", "zoneRelocalisation", date, observation, "regionId", "prefectureId", "communeId", "personneId", "catastropheId") FROM stdin;
\.


--
-- Data for Name: file; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.file (id, path, type_data, "objectId") FROM stdin;
35498472-2b41-486f-8a2a-4f5f3304b121	/api/files/f3389a8e-ee0f-405c-ad08-a098358914db.png	catastrophe	48
\.


--
-- Data for Name: forgot; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.forgot (id, hash, "createdAt", "deletedAt", "userId") FROM stdin;
\.


--
-- Data for Name: materiels; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.materiels (id, name) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1674070271695	initialeTable1674070271695
2	1674746281503	generateTypeData1674746281503
3	1674755777702	alterTable1674755777702
4	1675171333554	addColumn1675171333554
5	1675184430176	alterIsDeleteReferenceCatastrophe1675184430176
6	1675642902684	addField1675642902684
7	1676224683390	addColumnCatastrophe1676224683390
8	1676363260729	addRegionPrefectureCommune1676363260729
9	1675766062883	alterUser1675766062883
\.


--
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.personne (id, uuid, created_at, updated_at, code, nom, prenom, telephone, email, profession, age, sexe, "situationMatrimonial", vulnerabilite, "situationSanitaire", "pointEntre", "paysProvenance", "dateArrive", "codeOim", "isDeplace", type, observation, cause, "lieuInstallation", "regionId", "prefectureId", "communeId", revision) FROM stdin;
\.


--
-- Data for Name: personnedeplaceinterne; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.personnedeplaceinterne (id, uuid, created_at, updated_at, "deplaceinterneId", "personneId", revision) FROM stdin;
\.


--
-- Data for Name: prefecture; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.prefecture (id, uuid, created_at, updated_at, nom, slug, "regionId") FROM stdin;
1	a41b2251-b41a-454e-8691-ef6508fc0001	2023-01-22 08:55:59.695261+00	2023-01-22 08:55:59.695261+00	Conakry	1	1
2	c2a40da1-0441-403a-bbaa-d50be2b99e3e	2023-01-22 08:55:59.710065+00	2023-01-22 08:55:59.710065+00	Boké	2	2
3	089c072c-119d-48fb-a559-c994a8d4f5c9	2023-01-22 08:55:59.724383+00	2023-01-22 08:55:59.724383+00	Boffa	3	2
4	5ba3475f-412a-4dca-9837-8ef57bbdb7d0	2023-01-22 08:55:59.734752+00	2023-01-22 08:55:59.734752+00	Fria	4	2
5	3ee8ad8c-a224-4e4c-a454-bdcfbda6b48c	2023-01-22 08:55:59.7488+00	2023-01-22 08:55:59.7488+00	Gaoual	5	2
6	99dd5172-ca87-459d-9ec0-fdb980fba398	2023-01-22 08:55:59.764303+00	2023-01-22 08:55:59.764303+00	Koundara	6	2
7	9295802b-0974-43d0-b625-b58d0041ef4c	2023-01-22 08:55:59.785029+00	2023-01-22 08:55:59.785029+00	Kindia	7	3
8	136a6549-5054-4357-93e0-7b56102d5982	2023-01-22 08:55:59.794484+00	2023-01-22 08:55:59.794484+00	Coyah	8	3
9	d2b3e09e-3be7-4329-9a57-3ef85612fd74	2023-01-22 08:55:59.803834+00	2023-01-22 08:55:59.803834+00	Dubréka	9	3
10	ace2e36a-3d7e-4bcc-a57b-61c2ff347a7d	2023-01-22 08:55:59.814037+00	2023-01-22 08:55:59.814037+00	Forécariah	10	3
11	258ac0b4-f732-416b-bf99-43ef74f22a76	2023-01-22 08:55:59.822102+00	2023-01-22 08:55:59.822102+00	Télimélé	11	3
12	c2d50f8a-3ea2-4221-88a1-55cb24bf0d6a	2023-01-22 08:55:59.834908+00	2023-01-22 08:55:59.834908+00	Mamou	12	4
13	2246afac-f4d5-4b5a-9101-1757356d68b7	2023-01-22 08:55:59.843298+00	2023-01-22 08:55:59.843298+00	Dalaba	13	4
14	e339028a-d49c-4550-b8de-a14695f9bce6	2023-01-22 08:55:59.857664+00	2023-01-22 08:55:59.857664+00	Pita	14	4
15	92553483-99a7-42b9-b80c-11085dc7ec6e	2023-01-22 08:55:59.866145+00	2023-01-22 08:55:59.866145+00	Faranah	15	5
16	a2180ec0-efe4-426d-9f02-d202f42c6a10	2023-01-22 08:55:59.874353+00	2023-01-22 08:55:59.874353+00	Dabola	16	5
17	c553b58e-aaa3-4b9f-9785-6422718212d7	2023-01-22 08:55:59.886688+00	2023-01-22 08:55:59.886688+00	Dinguiraye	17	5
18	b34f84f4-93f4-4980-b3c3-43f713103c95	2023-01-22 08:55:59.896056+00	2023-01-22 08:55:59.896056+00	Kissidougou	18	5
19	36c79698-5f8e-4b58-9cf3-d7d59273f44a	2023-01-22 08:55:59.909428+00	2023-01-22 08:55:59.909428+00	Kankan	19	6
20	d1e4a221-1675-4ae0-99c1-9b5d476bf05b	2023-01-22 08:55:59.938825+00	2023-01-22 08:55:59.938825+00	Kérouané	20	6
21	77b3b024-e90d-4e36-85af-f0d2805ad6c6	2023-01-22 08:55:59.947301+00	2023-01-22 08:55:59.947301+00	Kouroussa	21	6
22	3c20e4e6-e471-4b75-80d5-4772168dae2b	2023-01-22 08:55:59.958919+00	2023-01-22 08:55:59.958919+00	Mandiana	22	6
23	323762cd-f704-421c-a493-f9eb162faaad	2023-01-22 08:55:59.981018+00	2023-01-22 08:55:59.981018+00	Siguiri	23	6
24	4167dc35-6e80-483c-9213-68372e537c6d	2023-01-22 08:55:59.995679+00	2023-01-22 08:55:59.995679+00	Labé	24	7
25	d2edc408-7113-4122-828c-4f9f1cb511d3	2023-01-22 08:56:00.040356+00	2023-01-22 08:56:00.040356+00	Koubia	25	7
26	60652927-c90b-485a-9bc0-dd8111675269	2023-01-22 08:56:00.050359+00	2023-01-22 08:56:00.050359+00	Lélouma	26	7
27	1a9e57fa-d3d5-40b3-8dae-1def619371da	2023-01-22 08:56:00.05905+00	2023-01-22 08:56:00.05905+00	Mali	27	7
28	6be6a115-9b07-43d2-af89-e45f5d27ceac	2023-01-22 08:56:00.068049+00	2023-01-22 08:56:00.068049+00	Tougué	28	7
29	b2674405-f51a-4896-980a-01f7fecb30e0	2023-01-22 08:56:00.109223+00	2023-01-22 08:56:00.109223+00	Nzérékoré	29	8
30	2b66aaaf-1f12-4032-a2ba-4c9108cee5b5	2023-01-22 08:56:00.138254+00	2023-01-22 08:56:00.138254+00	Guéckédou	30	8
31	f19468ac-23b8-4975-ad11-18cdb38c945a	2023-01-22 08:56:00.1471+00	2023-01-22 08:56:00.1471+00	Beyla	31	8
32	9709ebe4-9a69-43b6-8f9e-3d9e38470a61	2023-01-22 08:56:00.159463+00	2023-01-22 08:56:00.159463+00	Lola	32	8
33	9839cd0e-ca95-40f8-b2ec-aeb66d13b510	2023-01-22 08:56:00.178199+00	2023-01-22 08:56:00.178199+00	Yomou	33	8
34	7c3e32dc-20bc-4a78-8c4a-5a70ba92092d	2023-01-22 08:56:00.194308+00	2023-01-22 08:56:00.194308+00	Macenta	34	8
\.


--
-- Data for Name: produit_prefectures; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.produit_prefectures (id, created_at, updated_at, prix, date, unite, "produitId", "prefectureId", "userId", revision) FROM stdin;
18	2023-01-31 12:43:13.918157+00	2023-01-31 12:43:13.918157+00	10000 	2023-01-31	Kg	1	23	13	\N
19	2023-01-31 12:43:13.934362+00	2023-01-31 12:43:13.934362+00	5000 	2023-01-31	Kg	2	23	13	\N
20	2023-01-31 12:43:13.943912+00	2023-01-31 12:43:13.943912+00	12000 	2023-01-31	Kg	3	23	13	\N
21	2023-01-31 12:43:13.966753+00	2023-01-31 12:43:13.966753+00	8000 	2023-01-31	Kg	4	23	13	\N
22	2023-01-31 12:43:13.986549+00	2023-01-31 12:43:13.986549+00	10000 	2023-01-31	Kg	7	23	13	\N
23	2023-01-31 12:43:14.005117+00	2023-01-31 12:43:14.005117+00	7000 	2023-01-31	Kg	11	23	13	\N
24	2023-01-31 12:43:14.023588+00	2023-01-31 12:43:14.023588+00	10000 	2023-01-31	Kg	12	23	13	\N
25	2023-01-31 12:43:14.043572+00	2023-01-31 12:43:14.043572+00	10000 	2023-01-31	Kg	23	23	13	\N
26	2023-01-31 12:43:14.070414+00	2023-01-31 12:43:14.070414+00	10000 	2023-01-31	Kg	24	23	13	\N
27	2023-01-31 12:43:14.078596+00	2023-01-31 12:43:14.078596+00	8000 	2023-01-31	Kg	16	23	13	\N
28	2023-01-31 12:43:14.099637+00	2023-01-31 12:43:14.099637+00	8000 	2023-01-31	Kg	18	23	13	\N
29	2023-01-31 12:43:14.11222+00	2023-01-31 12:43:14.11222+00	5000 	2023-01-31	Kg	25	23	13	\N
30	2023-01-31 12:43:14.12019+00	2023-01-31 12:43:14.12019+00	5000 	2023-01-31	Kg	25	23	13	\N
31	2023-01-31 12:43:14.127945+00	2023-01-31 12:43:14.127945+00	10000 	2023-01-31	Kg	20	23	13	\N
32	2023-01-31 12:43:14.138453+00	2023-01-31 12:43:14.138453+00	10000 	2023-01-31	Kg	19	23	13	\N
33	2023-01-31 12:43:14.145194+00	2023-01-31 12:43:14.145194+00	10000 	2023-01-31	Kg	21	23	13	\N
34	2023-01-31 12:43:14.155518+00	2023-01-31 12:43:14.155518+00	45000 	2023-01-31	Kg	26	23	13	\N
35	2023-01-31 12:43:14.167466+00	2023-01-31 12:43:14.167466+00	40000 	2023-01-31	Kg	27	23	13	\N
36	2023-01-31 12:43:14.177561+00	2023-01-31 12:43:14.177561+00	15000 	2023-01-31	Kg	28	23	13	\N
37	2023-01-31 12:43:14.186205+00	2023-01-31 12:43:14.186205+00	10000 	2023-01-31	Kg	29	23	13	\N
38	2023-01-31 12:43:14.194266+00	2023-01-31 12:43:14.194266+00	8000 	2023-01-31	Kg	30	23	13	\N
39	2023-01-31 12:43:14.202583+00	2023-01-31 12:43:14.202583+00	15000 	2023-01-31	Litre	31	23	13	\N
40	2023-01-31 12:43:14.207678+00	2023-01-31 12:43:14.207678+00	20000 	2023-01-31	Litre	22	23	13	\N
41	2023-01-31 12:43:14.212611+00	2023-01-31 12:43:14.212611+00	4500 	2023-01-31	Unité	8	23	13	\N
42	2023-01-31 12:43:14.221997+00	2023-01-31 12:43:14.221997+00	35000 	2023-01-31	Kg	32	23	13	\N
43	2023-01-31 17:08:50.909867+00	2023-01-31 17:08:50.909867+00	10000 	2023-01-31	Kg	1	21	11	\N
44	2023-01-31 17:08:50.950661+00	2023-01-31 17:08:50.950661+00	30000 	2023-01-31	Kg	2	21	11	\N
45	2023-01-31 17:08:50.982997+00	2023-01-31 17:08:50.982997+00	14000 	2023-01-31	Kg	3	21	11	\N
46	2023-01-31 17:08:51.003576+00	2023-01-31 17:08:51.003576+00	50000 	2023-01-31	Kg	4	21	11	\N
47	2023-01-31 17:08:51.039129+00	2023-01-31 17:08:51.039129+00	5000 	2023-01-31	Kg	7	21	11	\N
48	2023-01-31 17:08:51.060237+00	2023-01-31 17:08:51.060237+00	13000 	2023-01-31	Kg	11	21	11	\N
49	2023-01-31 17:08:51.084858+00	2023-01-31 17:08:51.084858+00	7500 	2023-01-31	Kg	12	21	11	\N
50	2023-01-31 17:08:51.135875+00	2023-01-31 17:08:51.135875+00	10000 	2023-01-31	Kg	23	21	11	\N
51	2023-01-31 17:08:51.158265+00	2023-01-31 17:08:51.158265+00	10000 	2023-01-31	Kg	24	21	11	\N
52	2023-01-31 17:08:51.188945+00	2023-01-31 17:08:51.188945+00	7000 	2023-01-31	Kg	16	21	11	\N
53	2023-01-31 17:08:51.217596+00	2023-01-31 17:08:51.217596+00	10000 	2023-01-31	Kg	18	21	11	\N
54	2023-01-31 17:08:51.245204+00	2023-01-31 17:08:51.245204+00	17000 	2023-01-31	Kg	25	21	11	\N
55	2023-01-31 17:08:51.282527+00	2023-01-31 17:08:51.282527+00	10000 	2023-01-31	Kg	20	21	11	\N
56	2023-01-31 17:08:51.310064+00	2023-01-31 17:08:51.310064+00	20000 	2023-01-31	Kg	19	21	11	\N
57	2023-01-31 17:08:51.362499+00	2023-01-31 17:08:51.362499+00	2000 	2023-01-31	Kg	21	21	11	\N
58	2023-01-31 17:08:51.400475+00	2023-01-31 17:08:51.400475+00	45000 	2023-01-31	Kg	26	21	11	\N
59	2023-01-31 17:08:51.433632+00	2023-01-31 17:08:51.433632+00	35000 	2023-01-31	Kg	33	21	11	\N
60	2023-01-31 17:08:51.459995+00	2023-01-31 17:08:51.459995+00	50000 	2023-01-31	Kg	27	21	11	\N
61	2023-01-31 17:08:51.481457+00	2023-01-31 17:08:51.481457+00	40000 	2023-01-31	Kg	28	21	11	\N
62	2023-01-31 17:08:51.501563+00	2023-01-31 17:08:51.501563+00	10000 	2023-01-31	Kg	29	21	11	\N
63	2023-01-31 17:08:51.527867+00	2023-01-31 17:08:51.527867+00	10000 	2023-01-31	Kg	30	21	11	\N
64	2023-01-31 17:08:51.566325+00	2023-01-31 17:08:51.566325+00	35000 	2023-01-31	Litre	31	21	11	\N
65	2023-01-31 17:08:51.58579+00	2023-01-31 17:08:51.58579+00	20000 	2023-01-31	Litre	22	21	11	\N
66	2023-01-31 17:08:51.600694+00	2023-01-31 17:08:51.600694+00	2500 	2023-01-31	Unité	8	21	11	\N
67	2023-01-31 18:37:18.366838+00	2023-01-31 18:37:18.366838+00	8750 	2023-01-31	Kg	1	12	16	\N
68	2023-01-31 18:37:18.38798+00	2023-01-31 18:37:18.38798+00	15000 	2023-01-31	Kg	2	12	16	\N
69	2023-01-31 18:37:18.398907+00	2023-01-31 18:37:18.398907+00	17500 	2023-01-31	Kg	3	12	16	\N
70	2023-01-31 18:37:18.432438+00	2023-01-31 18:37:18.432438+00	17500 	2023-01-31	Kg	7	12	16	\N
71	2023-01-31 18:37:18.452012+00	2023-01-31 18:37:18.452012+00	11000 	2023-01-31	Kg	11	12	16	\N
72	2023-01-31 18:37:18.4644+00	2023-01-31 18:37:18.4644+00	7500 	2023-01-31	Kg	12	12	16	\N
73	2023-01-31 18:37:18.479827+00	2023-01-31 18:37:18.479827+00	8500 	2023-01-31	Kg	23	12	16	\N
74	2023-01-31 18:37:18.493506+00	2023-01-31 18:37:18.493506+00	10000 	2023-01-31	Kg	24	12	16	\N
75	2023-01-31 18:37:18.505525+00	2023-01-31 18:37:18.505525+00	12000 	2023-01-31	Kg	16	12	16	\N
76	2023-01-31 18:37:18.520016+00	2023-01-31 18:37:18.520016+00	12000 	2023-01-31	Kg	18	12	16	\N
77	2023-01-31 18:37:18.530987+00	2023-01-31 18:37:18.530987+00	4000 	2023-01-31	Kg	25	12	16	\N
78	2023-01-31 18:37:18.540968+00	2023-01-31 18:37:18.540968+00	5000 	2023-01-31	Kg	20	12	16	\N
79	2023-01-31 18:37:18.555236+00	2023-01-31 18:37:18.555236+00	12000 	2023-01-31	Kg	19	12	16	\N
80	2023-01-31 18:37:18.58111+00	2023-01-31 18:37:18.58111+00	9000 	2023-01-31	Kg	21	12	16	\N
81	2023-01-31 18:37:18.595174+00	2023-01-31 18:37:18.595174+00	45000 	2023-01-31	Kg	26	12	16	\N
82	2023-01-31 18:37:18.605512+00	2023-01-31 18:37:18.605512+00	30000 	2023-01-31	Kg	27	12	16	\N
83	2023-01-31 18:37:18.614071+00	2023-01-31 18:37:18.614071+00	25000 	2023-01-31	Kg	28	12	16	\N
84	2023-01-31 18:38:56.670761+00	2023-01-31 18:38:56.670761+00	10000 	2023-01-31	Kg	1	17	23	\N
85	2023-01-31 18:38:56.699894+00	2023-01-31 18:38:56.699894+00	3000 	2023-01-31	Kg	2	17	23	\N
86	2023-01-31 18:38:56.714086+00	2023-01-31 18:38:56.714086+00	10000 	2023-01-31	Kg	3	17	23	\N
87	2023-01-31 18:38:56.734727+00	2023-01-31 18:38:56.734727+00	11000 	2023-01-31	Kg	4	17	23	\N
88	2023-01-31 18:38:56.748611+00	2023-01-31 18:38:56.748611+00	10000 	2023-01-31	Kg	7	17	23	\N
89	2023-01-31 18:38:56.76886+00	2023-01-31 18:38:56.76886+00	12000 	2023-01-31	Kg	11	17	23	\N
90	2023-01-31 18:38:56.781864+00	2023-01-31 18:38:56.781864+00	7500 	2023-01-31	Kg	12	17	23	\N
91	2023-01-31 18:38:56.799521+00	2023-01-31 18:38:56.799521+00	10000 	2023-01-31	Kg	23	17	23	\N
92	2023-01-31 18:38:56.811282+00	2023-01-31 18:38:56.811282+00	8500 	2023-01-31	Kg	24	17	23	\N
93	2023-01-31 18:38:56.82161+00	2023-01-31 18:38:56.82161+00	5000 	2023-01-31	Kg	16	17	23	\N
94	2023-01-31 18:38:56.834956+00	2023-01-31 18:38:56.834956+00	13000 	2023-01-31	Kg	18	17	23	\N
95	2023-01-31 18:38:56.842747+00	2023-01-31 18:38:56.842747+00	10000 	2023-01-31	Kg	25	17	23	\N
96	2023-01-31 18:38:56.850488+00	2023-01-31 18:38:56.850488+00	10000 	2023-01-31	Kg	20	17	23	\N
97	2023-01-31 18:38:56.866137+00	2023-01-31 18:38:56.866137+00	9500 	2023-01-31	Kg	19	17	23	\N
98	2023-01-31 18:38:56.874142+00	2023-01-31 18:38:56.874142+00	9000 	2023-01-31	Kg	21	17	23	\N
99	2023-01-31 18:38:56.88039+00	2023-01-31 18:38:56.88039+00	40000 	2023-01-31	Kg	26	17	23	\N
100	2023-01-31 18:38:56.88677+00	2023-01-31 18:38:56.88677+00	30000 	2023-01-31	Kg	32	17	23	\N
101	2023-01-31 18:38:56.893488+00	2023-01-31 18:38:56.893488+00	40000 	2023-01-31	Kg	27	17	23	\N
102	2023-01-31 18:38:56.901436+00	2023-01-31 18:38:56.901436+00	20000 	2023-01-31	Kg	28	17	23	\N
103	2023-01-31 18:38:56.913015+00	2023-01-31 18:38:56.913015+00	7500 	2023-01-31	Kg	29	17	23	\N
104	2023-01-31 18:38:56.923655+00	2023-01-31 18:38:56.923655+00	8000 	2023-01-31	Kg	30	17	23	\N
105	2023-01-31 18:38:56.930279+00	2023-01-31 18:38:56.930279+00	18000 	2023-01-31	Litre	31	17	23	\N
106	2023-01-31 18:38:56.938378+00	2023-01-31 18:38:56.938378+00	18000 	2023-01-31	Litre	22	17	23	\N
107	2023-01-31 18:38:56.944307+00	2023-01-31 18:38:56.944307+00	4500 	2023-01-31	Unité	8	17	23	\N
108	2023-01-31 18:39:35.91713+00	2023-01-31 18:39:35.91713+00	10000 	2023-01-31	Kg	1	19	10	\N
109	2023-01-31 18:39:35.930695+00	2023-01-31 18:39:35.930695+00	6000 	2023-01-31	Kg	2	19	10	\N
110	2023-01-31 18:39:35.939952+00	2023-01-31 18:39:35.939952+00	10000 	2023-01-31	Kg	3	19	10	\N
111	2023-01-31 18:39:35.952237+00	2023-01-31 18:39:35.952237+00	8500 	2023-01-31	Kg	4	19	10	\N
112	2023-01-31 18:39:35.961713+00	2023-01-31 18:39:35.961713+00	10000 	2023-01-31	Kg	7	19	10	\N
113	2023-01-31 18:39:35.971136+00	2023-01-31 18:39:35.971136+00	10000 	2023-01-31	Kg	11	19	10	\N
114	2023-01-31 18:39:35.985941+00	2023-01-31 18:39:35.985941+00	8500 	2023-01-31	Kg	12	19	10	\N
115	2023-01-31 18:39:35.995439+00	2023-01-31 18:39:35.995439+00	6500 	2023-01-31	Kg	23	19	10	\N
116	2023-01-31 18:39:36.004197+00	2023-01-31 18:39:36.004197+00	8000 	2023-01-31	Kg	24	19	10	\N
117	2023-01-31 18:39:36.013594+00	2023-01-31 18:39:36.013594+00	10000 	2023-01-31	Kg	16	19	10	\N
118	2023-01-31 18:39:36.021792+00	2023-01-31 18:39:36.021792+00	5000 	2023-01-31	Kg	18	19	10	\N
119	2023-01-31 18:39:36.030434+00	2023-01-31 18:39:36.030434+00	10000 	2023-01-31	Kg	25	19	10	\N
120	2023-01-31 18:39:36.049143+00	2023-01-31 18:39:36.049143+00	15000 	2023-01-31	Kg	20	19	10	\N
121	2023-01-31 18:39:36.056313+00	2023-01-31 18:39:36.056313+00	2000 	2023-01-31	Kg	19	19	10	\N
122	2023-01-31 18:39:36.070381+00	2023-01-31 18:39:36.070381+00	1000 	2023-01-31	Kg	21	19	10	\N
123	2023-01-31 18:39:36.0975+00	2023-01-31 18:39:36.0975+00	43000 	2023-01-31	Kg	26	19	10	\N
124	2023-01-31 18:39:36.120665+00	2023-01-31 18:39:36.120665+00	35000 	2023-01-31	Kg	27	19	10	\N
125	2023-01-31 18:39:36.164417+00	2023-01-31 18:39:36.164417+00	20000 	2023-01-31	Kg	28	19	10	\N
126	2023-01-31 18:39:36.201948+00	2023-01-31 18:39:36.201948+00	5000 	2023-01-31	Kg	29	19	10	\N
127	2023-01-31 18:39:36.270144+00	2023-01-31 18:39:36.270144+00	10000 	2023-01-31	Kg	30	19	10	\N
128	2023-01-31 18:39:36.300761+00	2023-01-31 18:39:36.300761+00	20000 	2023-01-31	Litre	31	19	10	\N
129	2023-01-31 18:39:36.325276+00	2023-01-31 18:39:36.325276+00	20000 	2023-01-31	Litre	22	19	10	\N
130	2023-01-31 18:39:36.340225+00	2023-01-31 18:39:36.340225+00	3000 	2023-01-31	Unité	8	19	10	\N
131	2023-01-31 18:39:36.361146+00	2023-01-31 18:39:36.361146+00	35000 	2023-01-31	Kg	34	19	10	\N
132	2023-01-31 18:39:36.371885+00	2023-01-31 18:39:36.371885+00	50000 	2023-01-31	Kg	35	19	10	\N
133	2023-01-31 18:55:42.13976+00	2023-01-31 18:55:42.13976+00	9000 	2023-01-31	Kg	1	22	12	\N
134	2023-01-31 18:55:42.17004+00	2023-01-31 18:55:42.17004+00	5000 	2023-01-31	Kg	2	22	12	\N
135	2023-01-31 18:55:42.1821+00	2023-01-31 18:55:42.1821+00	10000 	2023-01-31	Kg	3	22	12	\N
136	2023-01-31 18:55:42.194973+00	2023-01-31 18:55:42.194973+00	7000 	2023-01-31	Kg	4	22	12	\N
137	2023-01-31 18:55:42.203133+00	2023-01-31 18:55:42.203133+00	12000 	2023-01-31	Kg	7	22	12	\N
138	2023-01-31 18:55:42.209559+00	2023-01-31 18:55:42.209559+00	7000 	2023-01-31	Kg	11	22	12	\N
139	2023-01-31 18:55:42.218936+00	2023-01-31 18:55:42.218936+00	8000 	2023-01-31	Kg	12	22	12	\N
140	2023-01-31 18:55:42.23645+00	2023-01-31 18:55:42.23645+00	8000 	2023-01-31	Kg	23	22	12	\N
141	2023-01-31 18:55:42.243665+00	2023-01-31 18:55:42.243665+00	10000 	2023-01-31	Kg	24	22	12	\N
142	2023-01-31 18:55:42.25172+00	2023-01-31 18:55:42.25172+00	8000 	2023-01-31	Kg	16	22	12	\N
143	2023-01-31 18:55:42.258426+00	2023-01-31 18:55:42.258426+00	10000 	2023-01-31	Kg	18	22	12	\N
144	2023-01-31 18:55:42.266053+00	2023-01-31 18:55:42.266053+00	15000 	2023-01-31	Kg	25	22	12	\N
145	2023-01-31 18:55:42.272312+00	2023-01-31 18:55:42.272312+00	25000 	2023-01-31	Kg	20	22	12	\N
146	2023-01-31 18:55:42.279827+00	2023-01-31 18:55:42.279827+00	20000 	2023-01-31	Kg	19	22	12	\N
147	2023-01-31 18:55:42.287084+00	2023-01-31 18:55:42.287084+00	15000 	2023-01-31	Kg	21	22	12	\N
148	2023-01-31 18:55:42.292957+00	2023-01-31 18:55:42.292957+00	45000 	2023-01-31	Kg	26	22	12	\N
149	2023-01-31 18:55:42.301766+00	2023-01-31 18:55:42.301766+00	35000 	2023-01-31	Kg	27	22	12	\N
150	2023-01-31 18:55:42.314278+00	2023-01-31 18:55:42.314278+00	40000 	2023-01-31	Kg	28	22	12	\N
151	2023-01-31 18:55:42.324208+00	2023-01-31 18:55:42.324208+00	10000 	2023-01-31	Kg	29	22	12	\N
152	2023-01-31 18:55:42.331297+00	2023-01-31 18:55:42.331297+00	10000 	2023-01-31	Kg	30	22	12	\N
153	2023-01-31 18:55:42.342115+00	2023-01-31 18:55:42.342115+00	15000 	2023-01-31	Litre	31	22	12	\N
154	2023-01-31 18:55:42.349983+00	2023-01-31 18:55:42.349983+00	20000 	2023-01-31	Litre	22	22	12	\N
155	2023-01-31 18:55:42.361677+00	2023-01-31 18:55:42.361677+00	35000 	2023-01-31	Kg	36	22	12	\N
156	2023-01-31 19:31:06.744918+00	2023-01-31 19:31:06.744918+00	10000 	2023-01-31	Kg	1	20	24	\N
157	2023-01-31 19:31:06.77342+00	2023-01-31 19:31:06.77342+00	4000 	2023-01-31	Kg	2	20	24	\N
158	2023-01-31 19:31:06.800115+00	2023-01-31 19:31:06.800115+00	8000 	2023-01-31	Kg	3	20	24	\N
159	2023-01-31 19:31:06.821497+00	2023-01-31 19:31:06.821497+00	10000 	2023-01-31	Kg	4	20	24	\N
160	2023-01-31 19:31:06.844869+00	2023-01-31 19:31:06.844869+00	4500 	2023-01-31	Kg	7	20	24	\N
161	2023-01-31 19:31:06.860097+00	2023-01-31 19:31:06.860097+00	15000 	2023-01-31	Kg	11	20	24	\N
162	2023-01-31 19:31:06.879829+00	2023-01-31 19:31:06.879829+00	7500 	2023-01-31	Kg	12	20	24	\N
163	2023-01-31 19:31:06.896988+00	2023-01-31 19:31:06.896988+00	7000 	2023-01-31	Kg	23	20	24	\N
164	2023-01-31 19:31:06.916538+00	2023-01-31 19:31:06.916538+00	10000 	2023-01-31	Kg	24	20	24	\N
165	2023-01-31 19:31:06.932171+00	2023-01-31 19:31:06.932171+00	8000 	2023-01-31	Kg	16	20	24	\N
166	2023-01-31 19:31:06.956509+00	2023-01-31 19:31:06.956509+00	9000 	2023-01-31	Kg	18	20	24	\N
167	2023-01-31 19:31:06.968608+00	2023-01-31 19:31:06.968608+00	15000 	2023-01-31	Kg	25	20	24	\N
168	2023-01-31 19:31:06.988547+00	2023-01-31 19:31:06.988547+00	40000 	2023-01-31	Kg	20	20	24	\N
169	2023-01-31 19:31:07.011847+00	2023-01-31 19:31:07.011847+00	10000 	2023-01-31	Kg	19	20	24	\N
170	2023-01-31 19:31:07.029672+00	2023-01-31 19:31:07.029672+00	15000 	2023-01-31	Kg	21	20	24	\N
171	2023-01-31 19:31:07.047781+00	2023-01-31 19:31:07.047781+00	35000 	2023-01-31	Kg	26	20	24	\N
172	2023-01-31 19:31:07.062346+00	2023-01-31 19:31:07.062346+00	30000 	2023-01-31	Kg	27	20	24	\N
173	2023-01-31 19:31:07.09327+00	2023-01-31 19:31:07.09327+00	30000 	2023-01-31	Kg	33	20	24	\N
174	2023-01-31 19:31:07.112831+00	2023-01-31 19:31:07.112831+00	20000 	2023-01-31	Kg	28	20	24	\N
175	2023-01-31 19:31:07.138333+00	2023-01-31 19:31:07.138333+00	5000 	2023-01-31	Kg	29	20	24	\N
176	2023-01-31 19:31:07.153111+00	2023-01-31 19:31:07.153111+00	5000 	2023-01-31	Kg	30	20	24	\N
177	2023-01-31 19:31:07.165413+00	2023-01-31 19:31:07.165413+00	15000 	2023-01-31	Litre	31	20	24	\N
178	2023-01-31 19:31:07.18074+00	2023-01-31 19:31:07.18074+00	20000 	2023-01-31	Litre	22	20	24	\N
179	2023-01-31 19:31:07.194278+00	2023-01-31 19:31:07.194278+00	3000 	2023-01-31	Unité	8	20	24	\N
180	2023-01-31 19:44:06.054639+00	2023-01-31 19:44:06.054639+00	25000 	2023-01-31	Kg	1	1	21	\N
181	2023-01-31 19:44:06.067458+00	2023-01-31 19:44:06.067458+00	10000 	2023-01-31	Kg	2	1	21	\N
182	2023-01-31 19:44:06.07712+00	2023-01-31 19:44:06.07712+00	15000 	2023-01-31	Kg	3	1	21	\N
183	2023-01-31 19:44:06.093109+00	2023-01-31 19:44:06.093109+00	20000 	2023-01-31	Kg	4	1	21	\N
184	2023-01-31 19:44:06.114173+00	2023-01-31 19:44:06.114173+00	12000 	2023-01-31	Kg	7	1	21	\N
185	2023-01-31 19:44:06.133208+00	2023-01-31 19:44:06.133208+00	25000 	2023-01-31	Kg	11	1	21	\N
186	2023-01-31 19:44:06.142939+00	2023-01-31 19:44:06.142939+00	6000 	2023-01-31	Kg	12	1	21	\N
187	2023-01-31 19:44:06.154534+00	2023-01-31 19:44:06.154534+00	10000 	2023-01-31	Kg	23	1	21	\N
188	2023-01-31 19:44:06.16541+00	2023-01-31 19:44:06.16541+00	8500 	2023-01-31	Kg	24	1	21	\N
189	2023-01-31 19:44:06.175264+00	2023-01-31 19:44:06.175264+00	3000 	2023-01-31	Kg	16	1	21	\N
190	2023-01-31 19:44:06.183963+00	2023-01-31 19:44:06.183963+00	15000 	2023-01-31	Kg	18	1	21	\N
191	2023-01-31 19:44:06.203077+00	2023-01-31 19:44:06.203077+00	5000 	2023-01-31	Kg	25	1	21	\N
192	2023-01-31 19:44:06.223502+00	2023-01-31 19:44:06.223502+00	30000 	2023-01-31	Kg	20	1	21	\N
193	2023-01-31 19:44:06.231369+00	2023-01-31 19:44:06.231369+00	15000 	2023-01-31	Kg	19	1	21	\N
194	2023-01-31 19:44:06.24468+00	2023-01-31 19:44:06.24468+00	12000 	2023-01-31	Kg	21	1	21	\N
195	2023-01-31 19:44:06.268463+00	2023-01-31 19:44:06.268463+00	65000 	2023-01-31	Kg	26	1	21	\N
196	2023-01-31 19:44:06.279276+00	2023-01-31 19:44:06.279276+00	40000 	2023-01-31	Kg	32	1	21	\N
197	2023-01-31 19:44:06.291117+00	2023-01-31 19:44:06.291117+00	25000 	2023-01-31	Kg	27	1	21	\N
198	2023-01-31 19:44:06.30022+00	2023-01-31 19:44:06.30022+00	35000 	2023-01-31	Kg	28	1	21	\N
199	2023-01-31 19:44:06.307396+00	2023-01-31 19:44:06.307396+00	12000 	2023-01-31	Kg	29	1	21	\N
200	2023-01-31 19:44:06.314204+00	2023-01-31 19:44:06.314204+00	15000 	2023-01-31	Kg	30	1	21	\N
201	2023-01-31 19:44:06.324794+00	2023-01-31 19:44:06.324794+00	4500 	2023-01-31	Unité	8	1	21	\N
202	2023-01-31 19:44:06.332963+00	2023-01-31 19:44:06.332963+00	35000 	2023-01-31	Litre	31	1	21	\N
203	2023-01-31 19:44:06.342607+00	2023-01-31 19:44:06.342607+00	30000 	2023-01-31	Litre	22	1	21	\N
204	2023-01-31 19:56:10.969083+00	2023-01-31 19:56:10.969083+00	10000 	2023-01-31	Kg	1	24	31	\N
205	2023-01-31 19:56:10.989009+00	2023-01-31 19:56:10.989009+00	7000 	2023-01-31	Kg	2	24	31	\N
206	2023-01-31 19:56:11.003685+00	2023-01-31 19:56:11.003685+00	13000 	2023-01-31	Kg	3	24	31	\N
207	2023-01-31 19:56:11.022907+00	2023-01-31 19:56:11.022907+00	22000 	2023-01-31	Kg	4	24	31	\N
208	2023-01-31 19:56:11.039636+00	2023-01-31 19:56:11.039636+00	9000 	2023-01-31	Kg	7	24	31	\N
209	2023-01-31 19:56:11.049299+00	2023-01-31 19:56:11.049299+00	7500 	2023-01-31	Kg	11	24	31	\N
210	2023-01-31 19:56:11.067025+00	2023-01-31 19:56:11.067025+00	7500 	2023-01-31	Kg	12	24	31	\N
211	2023-01-31 19:56:11.08123+00	2023-01-31 19:56:11.08123+00	9000 	2023-01-31	Kg	23	24	31	\N
212	2023-01-31 19:56:11.094131+00	2023-01-31 19:56:11.094131+00	12 	2023-01-31	Kg	18	24	31	\N
213	2023-01-31 19:56:11.105242+00	2023-01-31 19:56:11.105242+00	12000 	2023-01-31	Kg	18	24	31	\N
214	2023-01-31 19:56:11.126256+00	2023-01-31 19:56:11.126256+00	20000 	2023-01-31	Kg	25	24	31	\N
215	2023-01-31 19:56:11.138742+00	2023-01-31 19:56:11.138742+00	20000 	2023-01-31	Kg	20	24	31	\N
216	2023-01-31 19:56:11.150882+00	2023-01-31 19:56:11.150882+00	15000 	2023-01-31	Kg	19	24	31	\N
217	2023-01-31 19:56:11.161815+00	2023-01-31 19:56:11.161815+00	12000 	2023-01-31	Kg	21	24	31	\N
218	2023-01-31 19:56:11.180449+00	2023-01-31 19:56:11.180449+00	55000 	2023-01-31	Kg	26	24	31	\N
219	2023-01-31 19:56:11.195765+00	2023-01-31 19:56:11.195765+00	35000 	2023-01-31	Kg	37	24	31	\N
220	2023-01-31 19:56:11.211576+00	2023-01-31 19:56:11.211576+00	40000 	2023-01-31	Kg	27	24	31	\N
221	2023-01-31 19:56:11.226979+00	2023-01-31 19:56:11.226979+00	3000 	2023-01-31	Kg	28	24	31	\N
222	2023-01-31 19:56:11.236441+00	2023-01-31 19:56:11.236441+00	15000 	2023-01-31	Kg	29	24	31	\N
223	2023-01-31 19:56:11.24771+00	2023-01-31 19:56:11.24771+00	10000 	2023-01-31	Kg	30	24	31	\N
224	2023-01-31 19:56:11.258187+00	2023-01-31 19:56:11.258187+00	18000 	2023-01-31	Litre	31	24	31	\N
225	2023-01-31 19:56:11.26596+00	2023-01-31 19:56:11.26596+00	18000 	2023-01-31	Litre	22	24	31	\N
226	2023-01-31 19:56:11.277054+00	2023-01-31 19:56:11.277054+00	4500 	2023-01-31	Unité	8	24	31	\N
227	2023-01-31 19:56:11.297905+00	2023-01-31 19:56:11.297905+00	3000 	2023-01-31	Kg	16	24	31	\N
228	2023-01-31 19:56:11.307413+00	2023-01-31 19:56:11.307413+00	10000 	2023-01-31	Kg	1	24	31	\N
229	2023-01-31 22:13:55.868641+00	2023-01-31 22:13:55.868641+00	10000 	2023-01-31	Kg	1	3	18	\N
230	2023-01-31 22:13:55.914496+00	2023-01-31 22:13:55.914496+00	6000 	2023-01-31	Kg	2	3	18	\N
231	2023-01-31 22:13:55.935149+00	2023-01-31 22:13:55.935149+00	14000 	2023-01-31	Kg	3	3	18	\N
232	2023-01-31 22:13:55.958013+00	2023-01-31 22:13:55.958013+00	25000 	2023-01-31	Kg	4	3	18	\N
233	2023-01-31 22:13:55.972101+00	2023-01-31 22:13:55.972101+00	8000 	2023-01-31	Kg	7	3	18	\N
234	2023-01-31 22:13:55.994263+00	2023-01-31 22:13:55.994263+00	13000 	2023-01-31	Kg	11	3	18	\N
235	2023-01-31 22:13:56.008762+00	2023-01-31 22:13:56.008762+00	7000 	2023-01-31	Kg	12	3	18	\N
236	2023-01-31 22:13:56.01784+00	2023-01-31 22:13:56.01784+00	9000 	2023-01-31	Kg	23	3	18	\N
237	2023-01-31 22:13:56.027105+00	2023-01-31 22:13:56.027105+00	9000 	2023-01-31	Kg	24	3	18	\N
238	2023-01-31 22:13:56.048931+00	2023-01-31 22:13:56.048931+00	3000 	2023-01-31	Kg	16	3	18	\N
239	2023-01-31 22:13:56.061298+00	2023-01-31 22:13:56.061298+00	50000 	2023-01-31	Kg	26	3	18	\N
240	2023-01-31 22:13:56.075447+00	2023-01-31 22:13:56.075447+00	40000 	2023-01-31	Kg	36	3	18	\N
241	2023-01-31 22:13:56.091057+00	2023-01-31 22:13:56.091057+00	40000 	2023-01-31	Kg	28	3	18	\N
242	2023-02-06 18:11:01.858415+00	2023-02-06 18:11:01.858415+00	7500 	2023-02-06	Kg	1	2	3	\N
243	2023-02-06 18:11:01.880851+00	2023-02-06 18:11:01.880851+00	3000 	2023-02-06	Kg	2	2	3	\N
244	2023-02-06 18:11:01.915865+00	2023-02-06 18:11:01.915865+00	12000 	2023-02-06	Kg	3	2	3	\N
245	2023-02-06 18:11:01.9424+00	2023-02-06 18:11:01.9424+00	12000 	2023-02-06	Kg	4	2	3	\N
246	2023-02-06 18:11:01.954407+00	2023-02-06 18:11:01.954407+00	5000 	2023-02-06	Kg	7	2	3	\N
247	2023-02-06 18:11:01.981582+00	2023-02-06 18:11:01.981582+00	12000 	2023-02-06	Kg	11	2	3	\N
248	2023-02-06 18:11:02.003921+00	2023-02-06 18:11:02.003921+00	6500 	2023-02-06	Kg	12	2	3	\N
249	2023-02-06 18:11:02.027591+00	2023-02-06 18:11:02.027591+00	7000 	2023-02-06	Kg	23	2	3	\N
250	2023-02-06 18:11:02.048263+00	2023-02-06 18:11:02.048263+00	9000 	2023-02-06	Kg	24	2	3	\N
251	2023-02-06 18:11:02.065855+00	2023-02-06 18:11:02.065855+00	3000 	2023-02-06	Kg	16	2	3	\N
252	2023-02-06 18:11:02.073783+00	2023-02-06 18:11:02.073783+00	12000 	2023-02-06	Kg	18	2	3	\N
253	2023-02-06 18:11:02.08283+00	2023-02-06 18:11:02.08283+00	10000 	2023-02-06	Kg	25	2	3	\N
254	2023-02-06 18:11:02.092244+00	2023-02-06 18:11:02.092244+00	15000 	2023-02-06	Kg	20	2	3	\N
255	2023-02-06 18:11:02.101277+00	2023-02-06 18:11:02.101277+00	5000 	2023-02-06	Kg	19	2	3	\N
256	2023-02-06 18:11:02.116199+00	2023-02-06 18:11:02.116199+00	7000 	2023-02-06	Kg	21	2	3	\N
257	2023-02-06 18:11:02.127924+00	2023-02-06 18:11:02.127924+00	45000 	2023-02-06	Kg	26	2	3	\N
258	2023-02-06 18:11:02.136088+00	2023-02-06 18:11:02.136088+00	100000 	2023-02-06	Kg	27	2	3	\N
259	2023-02-06 18:11:02.144118+00	2023-02-06 18:11:02.144118+00	150000 	2023-02-06	Kg	36	2	3	\N
260	2023-02-06 18:11:02.158109+00	2023-02-06 18:11:02.158109+00	45000 	2023-02-06	Kg	28	2	3	\N
261	2023-02-06 18:11:02.166235+00	2023-02-06 18:11:02.166235+00	5000 	2023-02-06	Kg	29	2	3	\N
262	2023-02-06 18:11:02.175551+00	2023-02-06 18:11:02.175551+00	5000 	2023-02-06	Kg	30	2	3	\N
263	2023-02-06 18:11:02.187666+00	2023-02-06 18:11:02.187666+00	17000 	2023-02-06	Litre	31	2	3	\N
264	2023-02-06 18:11:02.197189+00	2023-02-06 18:11:02.197189+00	20000 	2023-02-06	Litre	22	2	3	\N
265	2023-02-06 18:11:02.206906+00	2023-02-06 18:11:02.206906+00	4500 	2023-02-06	Unité	8	2	3	\N
266	2023-02-06 18:11:02.221233+00	2023-02-06 18:11:02.221233+00	2000 	2023-02-06	Unité	38	2	3	\N
267	2023-02-06 18:11:02.238532+00	2023-02-06 18:11:02.238532+00	5000 	2023-02-06	Unité	39	2	3	\N
268	2023-02-06 18:32:47.210899+00	2023-02-06 18:32:47.210899+00	8000 	2023-02-06	Kg	1	4	19	\N
269	2023-02-06 18:32:47.226108+00	2023-02-06 18:32:47.226108+00	8000 	2023-02-06	Kg	2	4	19	\N
270	2023-02-06 18:32:47.236003+00	2023-02-06 18:32:47.236003+00	23000 	2023-02-06	Kg	4	4	19	\N
271	2023-02-06 18:32:47.244518+00	2023-02-06 18:32:47.244518+00	15000 	2023-02-06	Kg	3	4	19	\N
272	2023-02-06 18:32:47.254272+00	2023-02-06 18:32:47.254272+00	6000 	2023-02-06	Kg	7	4	19	\N
273	2023-02-06 18:32:47.272343+00	2023-02-06 18:32:47.272343+00	6000 	2023-02-06	Kg	7	4	19	\N
274	2023-02-06 18:32:47.286914+00	2023-02-06 18:32:47.286914+00	15000 	2023-02-06	Kg	11	4	19	\N
275	2023-02-06 18:32:47.299091+00	2023-02-06 18:32:47.299091+00	6500 	2023-02-06	Kg	12	4	19	\N
276	2023-02-06 18:32:47.323712+00	2023-02-06 18:32:47.323712+00	7500 	2023-02-06	Kg	23	4	19	\N
277	2023-02-06 18:32:47.33814+00	2023-02-06 18:32:47.33814+00	9000 	2023-02-06	Kg	24	4	19	\N
278	2023-02-06 18:32:47.352031+00	2023-02-06 18:32:47.352031+00	2500 	2023-02-06	Kg	16	4	19	\N
279	2023-02-06 18:32:47.364136+00	2023-02-06 18:32:47.364136+00	10000 	2023-02-06	Kg	18	4	19	\N
280	2023-02-06 18:32:47.387251+00	2023-02-06 18:32:47.387251+00	15000 	2023-02-06	Kg	25	4	19	\N
281	2023-02-06 18:32:47.395426+00	2023-02-06 18:32:47.395426+00	10000 	2023-02-06	Kg	20	4	19	\N
282	2023-02-06 18:32:47.40677+00	2023-02-06 18:32:47.40677+00	7000 	2023-02-06	Kg	19	4	19	\N
283	2023-02-06 18:32:47.416269+00	2023-02-06 18:32:47.416269+00	10000 	2023-02-06	Kg	21	4	19	\N
284	2023-02-06 18:32:47.426412+00	2023-02-06 18:32:47.426412+00	50000 	2023-02-06	Kg	26	4	19	\N
285	2023-02-06 18:32:47.436815+00	2023-02-06 18:32:47.436815+00	50000 	2023-02-06	Kg	27	4	19	\N
286	2023-02-06 18:32:47.443453+00	2023-02-06 18:32:47.443453+00	30000 	2023-02-06	Kg	36	4	19	\N
287	2023-02-06 18:32:47.45773+00	2023-02-06 18:32:47.45773+00	10000 	2023-02-06	Kg	28	4	19	\N
288	2023-02-06 18:32:47.471205+00	2023-02-06 18:32:47.471205+00	10000 	2023-02-06	Kg	29	4	19	\N
289	2023-02-06 18:32:47.481733+00	2023-02-06 18:32:47.481733+00	5000 	2023-02-06	Kg	30	4	19	\N
290	2023-02-06 18:32:47.492827+00	2023-02-06 18:32:47.492827+00	20000 	2023-02-06	Litre	31	4	19	\N
291	2023-02-06 18:32:47.501913+00	2023-02-06 18:32:47.501913+00	18000 	2023-02-06	Litre	22	4	19	\N
292	2023-02-06 18:32:47.516496+00	2023-02-06 18:32:47.516496+00	4000 	2023-02-06	Unité	8	4	19	\N
293	2023-02-06 19:05:51.036372+00	2023-02-06 19:05:51.036372+00	15000 	2023-02-06	Kg	1	6	4	\N
294	2023-02-06 19:05:51.05034+00	2023-02-06 19:05:51.05034+00	9000 	2023-02-06	Kg	2	6	4	\N
295	2023-02-06 19:05:51.072589+00	2023-02-06 19:05:51.072589+00	20000 	2023-02-06	Kg	3	6	4	\N
296	2023-02-06 19:05:51.090577+00	2023-02-06 19:05:51.090577+00	30000 	2023-02-06	Kg	4	6	4	\N
297	2023-02-06 19:05:51.100716+00	2023-02-06 19:05:51.100716+00	15000 	2023-02-06	Kg	7	6	4	\N
298	2023-02-06 19:05:51.112418+00	2023-02-06 19:05:51.112418+00	15000 	2023-02-06	Kg	11	6	4	\N
299	2023-02-06 19:05:51.140375+00	2023-02-06 19:05:51.140375+00	12000 	2023-02-06	Kg	12	6	4	\N
300	2023-02-06 19:05:51.160631+00	2023-02-06 19:05:51.160631+00	15000 	2023-02-06	Kg	23	6	4	\N
301	2023-02-06 19:05:51.181317+00	2023-02-06 19:05:51.181317+00	10000 	2023-02-06	Kg	24	6	4	\N
302	2023-02-06 19:05:51.193312+00	2023-02-06 19:05:51.193312+00	3000 	2023-02-06	Kg	16	6	4	\N
303	2023-02-06 19:05:51.203182+00	2023-02-06 19:05:51.203182+00	15000 	2023-02-06	Kg	18	6	4	\N
304	2023-02-06 19:05:51.214588+00	2023-02-06 19:05:51.214588+00	25000 	2023-02-06	Kg	25	6	4	\N
305	2023-02-06 19:05:51.227076+00	2023-02-06 19:05:51.227076+00	25000 	2023-02-06	Kg	20	6	4	\N
306	2023-02-06 19:05:51.234896+00	2023-02-06 19:05:51.234896+00	25000 	2023-02-06	Kg	19	6	4	\N
307	2023-02-06 19:05:51.244029+00	2023-02-06 19:05:51.244029+00	15000 	2023-02-06	Kg	21	6	4	\N
308	2023-02-06 19:05:51.253213+00	2023-02-06 19:05:51.253213+00	40000 	2023-02-06	Kg	26	6	4	\N
309	2023-02-06 19:05:51.260706+00	2023-02-06 19:05:51.260706+00	85000 	2023-02-06	Kg	27	6	4	\N
310	2023-02-06 19:05:51.272187+00	2023-02-06 19:05:51.272187+00	40000 	2023-02-06	Kg	25	6	4	\N
311	2023-02-06 19:05:51.281849+00	2023-02-06 19:05:51.281849+00	15000 	2023-02-06	Kg	28	6	4	\N
312	2023-02-06 19:05:51.291073+00	2023-02-06 19:05:51.291073+00	15000 	2023-02-06	Kg	29	6	4	\N
313	2023-02-06 19:05:51.300097+00	2023-02-06 19:05:51.300097+00	15000 	2023-02-06	Kg	30	6	4	\N
314	2023-02-06 19:05:51.307543+00	2023-02-06 19:05:51.307543+00	20000 	2023-02-06	Litre	31	6	4	\N
315	2023-02-06 19:05:51.333769+00	2023-02-06 19:05:51.333769+00	20000 	2023-02-06	Litre	22	6	4	\N
316	2023-02-06 19:05:51.347617+00	2023-02-06 19:05:51.347617+00	4000 	2023-02-06	Unité	8	6	4	\N
317	2023-02-06 19:05:51.364511+00	2023-02-06 19:05:51.364511+00	5000 	2023-02-06	Litre	40	6	4	\N
318	2023-02-06 21:09:11.160712+00	2023-02-06 21:09:11.160712+00	10000 	2023-02-06	Kg	1	7	28	\N
319	2023-02-06 21:09:11.172167+00	2023-02-06 21:09:11.172167+00	11000 	2023-02-06	Kg	2	7	28	\N
320	2023-02-06 21:09:11.183857+00	2023-02-06 21:09:11.183857+00	20000 	2023-02-06	Kg	3	7	28	\N
321	2023-02-06 21:09:11.195621+00	2023-02-06 21:09:11.195621+00	25000 	2023-02-06	Kg	4	7	28	\N
322	2023-02-06 21:09:11.207786+00	2023-02-06 21:09:11.207786+00	10000 	2023-02-06	Kg	7	7	28	\N
323	2023-02-06 21:09:11.217218+00	2023-02-06 21:09:11.217218+00	14000 	2023-02-06	Kg	11	7	28	\N
324	2023-02-06 21:09:11.22673+00	2023-02-06 21:09:11.22673+00	7000 	2023-02-06	Kg	12	7	28	\N
325	2023-02-06 21:09:11.237313+00	2023-02-06 21:09:11.237313+00	8000 	2023-02-06	Kg	23	7	28	\N
326	2023-02-06 21:09:11.250149+00	2023-02-06 21:09:11.250149+00	9000 	2023-02-06	Kg	24	7	28	\N
327	2023-02-06 21:09:11.258878+00	2023-02-06 21:09:11.258878+00	3000 	2023-02-06	Kg	16	7	28	\N
328	2023-02-06 21:09:11.268734+00	2023-02-06 21:09:11.268734+00	12000 	2023-02-06	Kg	18	7	28	\N
329	2023-02-06 21:09:11.279207+00	2023-02-06 21:09:11.279207+00	25000 	2023-02-06	Kg	25	7	28	\N
330	2023-02-06 21:09:11.29683+00	2023-02-06 21:09:11.29683+00	10000 	2023-02-06	Kg	20	7	28	\N
331	2023-02-06 21:09:11.312159+00	2023-02-06 21:09:11.312159+00	10000 	2023-02-06	Kg	19	7	28	\N
332	2023-02-06 21:09:11.327073+00	2023-02-06 21:09:11.327073+00	20000 	2023-02-06	Kg	21	7	28	\N
333	2023-02-06 21:09:11.335187+00	2023-02-06 21:09:11.335187+00	50000 	2023-02-06	Kg	26	7	28	\N
334	2023-02-06 21:09:11.349536+00	2023-02-06 21:09:11.349536+00	25000 	2023-02-06	Kg	36	7	28	\N
335	2023-02-06 21:09:11.36988+00	2023-02-06 21:09:11.36988+00	50000 	2023-02-06	Kg	27	7	28	\N
336	2023-02-06 21:09:11.388179+00	2023-02-06 21:09:11.388179+00	50000 	2023-02-06	Kg	28	7	28	\N
337	2023-02-06 21:09:11.404482+00	2023-02-06 21:09:11.404482+00	20000 	2023-02-06	Kg	29	7	28	\N
338	2023-02-06 21:09:11.417209+00	2023-02-06 21:09:11.417209+00	10000 	2023-02-06	Kg	30	7	28	\N
339	2023-02-06 21:09:11.43173+00	2023-02-06 21:09:11.43173+00	30000 	2023-02-06	Litre	31	7	28	\N
340	2023-02-06 21:09:11.440424+00	2023-02-06 21:09:11.440424+00	30000 	2023-02-06	Litre	22	7	28	\N
341	2023-02-06 21:09:11.465659+00	2023-02-06 21:09:11.465659+00	4500 	2023-02-06	Unité	8	7	28	\N
342	2023-02-07 10:51:17.442525+00	2023-02-07 10:51:17.442525+00	10000 	2023-02-07	Kg	1	10	25	\N
343	2023-02-07 10:51:17.470987+00	2023-02-07 10:51:17.470987+00	7000 	2023-02-07	Kg	2	10	25	\N
344	2023-02-07 10:51:17.481796+00	2023-02-07 10:51:17.481796+00	11000 	2023-02-07	Kg	3	10	25	\N
345	2023-02-07 10:51:17.491467+00	2023-02-07 10:51:17.491467+00	20000 	2023-02-07	Kg	4	10	25	\N
346	2023-02-07 10:51:17.499225+00	2023-02-07 10:51:17.499225+00	9000 	2023-02-07	Kg	7	10	25	\N
347	2023-02-07 10:51:17.508766+00	2023-02-07 10:51:17.508766+00	20000 	2023-02-07	Kg	11	10	25	\N
348	2023-02-07 10:51:17.517568+00	2023-02-07 10:51:17.517568+00	6000 	2023-02-07	Kg	12	10	25	\N
349	2023-02-07 10:51:17.530876+00	2023-02-07 10:51:17.530876+00	7000 	2023-02-07	Kg	23	10	25	\N
350	2023-02-07 10:51:17.541538+00	2023-02-07 10:51:17.541538+00	9000 	2023-02-07	Kg	24	10	25	\N
351	2023-02-07 10:51:17.550975+00	2023-02-07 10:51:17.550975+00	4000 	2023-02-07	Kg	16	10	25	\N
352	2023-02-07 10:51:17.558825+00	2023-02-07 10:51:17.558825+00	10000 	2023-02-07	Kg	18	10	25	\N
353	2023-02-07 10:51:17.567852+00	2023-02-07 10:51:17.567852+00	8000 	2023-02-07	Kg	25	10	25	\N
354	2023-02-07 10:51:17.57487+00	2023-02-07 10:51:17.57487+00	4000 	2023-02-07	Kg	20	10	25	\N
355	2023-02-07 10:51:17.584348+00	2023-02-07 10:51:17.584348+00	20000 	2023-02-07	Kg	19	10	25	\N
356	2023-02-07 10:51:17.591545+00	2023-02-07 10:51:17.591545+00	150000 	2023-02-07	Kg	21	10	25	\N
357	2023-02-07 10:51:17.601794+00	2023-02-07 10:51:17.601794+00	50000 	2023-02-07	Kg	26	10	25	\N
358	2023-02-07 10:51:17.611707+00	2023-02-07 10:51:17.611707+00	420000 	2023-02-07	Kg	36	10	25	\N
359	2023-02-07 10:51:17.634803+00	2023-02-07 10:51:17.634803+00	60000 	2023-02-07	Kg	27	10	25	\N
360	2023-02-07 10:51:17.646619+00	2023-02-07 10:51:17.646619+00	100000 	2023-02-07	Kg	28	10	25	\N
361	2023-02-07 10:51:17.65746+00	2023-02-07 10:51:17.65746+00	400000 	2023-02-07	Kg	29	10	25	\N
362	2023-02-07 10:51:17.666455+00	2023-02-07 10:51:17.666455+00	190000 	2023-02-07	Kg	30	10	25	\N
363	2023-02-07 10:51:17.674588+00	2023-02-07 10:51:17.674588+00	20000 	2023-02-07	Litre	31	10	25	\N
364	2023-02-07 10:51:17.687425+00	2023-02-07 10:51:17.687425+00	20000 	2023-02-07	Litre	22	10	25	\N
365	2023-02-07 10:51:17.696675+00	2023-02-07 10:51:17.696675+00	5000 	2023-02-07	Unité	8	10	25	\N
\.


--
-- Data for Name: produits; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.produits (id, created_at, updated_at, name, revision) FROM stdin;
1	2023-01-22 08:56:03.500311+00	2023-01-22 08:56:03.500311+00	Arachides (décortiquées)	\N
2	2023-01-22 08:56:03.513731+00	2023-01-22 08:56:03.513731+00	Farine de manioc (gari)	\N
3	2023-01-22 08:56:03.52557+00	2023-01-22 08:56:03.52557+00	Fonio	\N
4	2023-01-22 08:56:03.531961+00	2023-01-22 08:56:03.531961+00	Haricots (niébé, blanc)	\N
5	2023-01-22 08:56:03.537506+00	2023-01-22 08:56:03.537506+00	Huile (palme)	\N
6	2023-01-22 08:56:03.549127+00	2023-01-22 08:56:03.549127+00	Huile (végétale)	\N
7	2023-01-22 08:56:03.554685+00	2023-01-22 08:56:03.554685+00	Maïs	\N
8	2023-01-22 08:56:03.559964+00	2023-01-22 08:56:03.559964+00	Pain	\N
9	2023-01-22 08:56:03.589498+00	2023-01-22 08:56:03.589498+00	Poisson	\N
10	2023-01-22 08:56:03.595822+00	2023-01-22 08:56:03.595822+00	Poisson (sec)	\N
11	2023-01-22 08:56:03.607868+00	2023-01-22 08:56:03.607868+00	Pomme de terre	\N
12	2023-01-22 08:56:03.613954+00	2023-01-22 08:56:03.613954+00	Riz (importé)	\N
13	2023-01-22 08:56:03.627034+00	2023-01-22 08:56:03.627034+00	Rice (local)	\N
14	2023-01-22 08:56:03.633572+00	2023-01-22 08:56:03.633572+00	sugar	\N
15	2023-01-22 08:56:03.653488+00	2023-01-22 08:56:03.653488+00	Viande (bœuf)	\N
16	2023-01-22 08:56:03.660017+00	2023-01-22 08:56:03.660017+00	Sel	\N
17	2023-01-22 08:56:03.665812+00	2023-01-22 08:56:03.665812+00	Piment	\N
18	2023-01-22 08:56:03.673223+00	2023-01-22 08:56:03.673223+00	Oignon	\N
19	2023-01-22 08:56:03.680518+00	2023-01-22 08:56:03.680518+00	Aubergine	\N
20	2023-01-22 08:56:03.688963+00	2023-01-22 08:56:03.688963+00	Tomate	\N
21	2023-01-22 08:56:03.694821+00	2023-01-22 08:56:03.694821+00	Gombo	\N
22	2023-01-24 18:19:55.174648+00	2023-01-24 18:19:55.174648+00	Huile d’arachide	\N
23	2023-01-31 12:43:14.034796+00	2023-01-31 12:43:14.034796+00	Riz (local)	\N
24	2023-01-31 12:43:14.058113+00	2023-01-31 12:43:14.058113+00	Sucre	\N
25	2023-01-31 12:43:14.106985+00	2023-01-31 12:43:14.106985+00	Piment frais	\N
26	2023-01-31 12:43:14.150847+00	2023-01-31 12:43:14.150847+00	Viande de bœuf	\N
27	2023-01-31 12:43:14.163511+00	2023-01-31 12:43:14.163511+00	Poisson sec	\N
28	2023-01-31 12:43:14.173888+00	2023-01-31 12:43:14.173888+00	Igname	\N
29	2023-01-31 12:43:14.182059+00	2023-01-31 12:43:14.182059+00	Taro	\N
30	2023-01-31 12:43:14.190265+00	2023-01-31 12:43:14.190265+00	Patate	\N
31	2023-01-31 12:43:14.19845+00	2023-01-31 12:43:14.19845+00	Huile de palme	\N
32	2023-01-31 12:43:14.217756+00	2023-01-31 12:43:14.217756+00	poisson frais 	\N
33	2023-01-31 17:08:51.418909+00	2023-01-31 17:08:51.418909+00	Poisson Frais	\N
34	2023-01-31 18:39:36.353234+00	2023-01-31 18:39:36.353234+00	Poisson Frais 	\N
35	2023-01-31 18:39:36.366654+00	2023-01-31 18:39:36.366654+00	Viande de bœuf sans os.	\N
36	2023-01-31 18:55:42.355822+00	2023-01-31 18:55:42.355822+00	Poisson frais	\N
37	2023-01-31 19:56:11.187687+00	2023-01-31 19:56:11.187687+00	poisson frais	\N
38	2023-02-06 18:11:02.213155+00	2023-02-06 18:11:02.213155+00	Pain d'or	\N
39	2023-02-06 18:11:02.229046+00	2023-02-06 18:11:02.229046+00	Pain à four électric	\N
40	2023-02-06 19:05:51.355702+00	2023-02-06 19:05:51.355702+00	Lait	\N
\.


--
-- Data for Name: reference; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reference (id, created_at, updated_at, catastrophe, habitude_alimentaire, accessibilite_saison, ong, couverture_reseau, accessibilite_moyen, disponibilite_produit, "userId", "isDelete", revision, periode, date_enregistrement) FROM stdin;
12	2023-01-31 12:32:22.009671+00	2023-01-31 12:32:22.009671+00	["Inondation","Eboulement","Feux de brousse","Vent violent"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Igname","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Mauvaise","raison_indisponibilite":"Production locale."}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"OIM","type":"Institution Internationale","resident":"NON","point_focal":"Tounkara"},{"nom":"CRG","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"AJP","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"Hèrè Guinée ","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"CeCoJe Siguiri","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"OUI","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Igname","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Mauvaise","raison_indisponibilite":"Production locale."}]	13	f	\N	\N	\N
20	2023-01-31 19:27:39.805579+00	2023-01-31 19:32:06.513147+00	["Sècheresse","Tornades","Feux de brousse"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNFPA","type":"Institution Internationale","resident":"OUI","point_focal":""}]	{"disponible":["MTN","Cellcom"],"dominant":"MTN"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	1	t	\N	\N	\N
10	2023-01-31 10:48:43.292194+00	2023-01-31 20:48:18.085069+00	["Feux de brousse","Conflits","Tremblement de terre"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Patattes","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OMS","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"FAO","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"ALIMA","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"SOLTHIS","type":"ONG Internationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"MTN"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Patattes","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	1	t	\N	\N	\N
11	2023-01-31 12:13:39.170039+00	2023-01-31 12:13:39.170039+00	["Conflits","Tremblement de terre","Test 4"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Sorgho","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNOPS","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"CICR","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"CHILD FUND","type":"ONG Internationale","resident":"OUI","point_focal":""}]	{"disponible":["MTN","Orange"],"dominant":"MTN"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Sorgho","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	7	f	\N	\N	\N
13	2023-01-31 17:02:18.920111+00	2023-01-31 17:02:18.920111+00	["Incendie","Inondation","Tornades","Eboulement","Naufrage "]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Insuffisance de producteur ","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Insuffisance de producteur","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Insuffisance de producteur","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"NON"}	[{"nom":"OCPH","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"OUI","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Insuffisance de producteur ","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Insuffisance de producteur","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Insuffisance de producteur","disponibilite":"Bonne","raison_indisponibilite":""}]	11	f	\N	\N	\N
25	2023-01-31 20:35:06.84889+00	2023-01-31 20:35:54.017373+00	["Sècheresse","Tornades","Feux de brousse"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"PNUD","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNICEF","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"MSF","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"CRS","type":"ONG Internationale","resident":"OUI","point_focal":""}]	{"disponible":["MTN"],"dominant":"MTN"}	{"Moto":"NON","Avion":"NON","Auto":"NON"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	28	t	\N	\N	\N
15	2023-01-31 18:37:18.31594+00	2023-01-31 18:37:18.31594+00	["Inondation","Incendie","Tornades","chenille légionaire"]	[{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"tomate","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Patattes","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNFPA","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PNUD","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OMS","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"CHILD FUND","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"PLAN GUINEE","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"GIZ","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"ENABEL","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"CRG","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"UGAS","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AFVDD","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":[],"dominant":""}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"tomate","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Patattes","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	16	f	\N	\N	\N
9	2023-01-30 18:25:25.38425+00	2023-02-07 10:44:34.428491+00	["Noyade","Inondation","Accident de Circulation","Tornades","Incendie"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de culture commerciale","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de culture commerciale","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de culture commerciale","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile rouge","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile d'arachide","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Igname","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Mauvaise","raison_indisponibilite":"pas de culture commerciale"}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"PLAN GUINEE","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"Stop palu+","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"AGIL","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"CRG PREFECTORALE","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de culture commerciale","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de culture commerciale","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de culture commerciale","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile rouge","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile d'arachide","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Igname","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Mauvaise","raison_indisponibilite":"pas de culture commerciale"}]	25	f	\N	\N	\N
14	2023-01-31 18:31:14.241828+00	2023-01-31 18:31:14.241828+00	["Inondation","Incendie","Feux de brousse","Vent Violent"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PAM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OMS","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNFPA","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PNUD","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"Banque Mondiale","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"CRG","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"Croix Rouge Guinnéenne ","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"OCPH","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"Enfant du Globe","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"PACOPE","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"Club des jeunes filles leaders","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"OGLMI","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"OUI","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	10	f	\N	\N	\N
16	2023-01-31 18:38:56.146173+00	2023-01-31 18:38:56.146173+00	["Incendie","Eboulement","Inondation","vents violants"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"moins consommer \\n","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"miel","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"PAM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNICEF","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"CRS","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"PLAN GUINEE","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"Dinguiraye en Action","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"Dinguiraye Emergeant","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"Tinkisso","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"IBDDG","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"CENAPCIG","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"NAFAYA","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"moins consommer \\n","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"miel","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	23	f	\N	\N	\N
17	2023-01-31 19:03:53.608958+00	2023-01-31 19:03:53.608958+00	["Incendie","Tornades"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"fonio","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"nėrė","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"TOUNKARAEle"},{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OMS","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PAM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNFPA","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PLAN GUINEE","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"CHILD FUND","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"TERRE DES HOMMES","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"INTEGRA","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"OLH","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AJERPI","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AVODEPI","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"fonio","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"nėrė","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	27	f	\N	\N	\N
18	2023-01-31 19:12:12.31874+00	2023-01-31 19:12:12.31874+00	["Incendie","Eboulement","Inondation","Vents violents"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Importé ","disponibilite":"Très mauvaise","raison_indisponibilite":"Importé "},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Importé ","disponibilite":"Très mauvaise","raison_indisponibilite":"Importé "},{"aliment":"Huile","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Importé ","disponibilite":"Très mauvaise","raison_indisponibilite":"Importé "}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OMS","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PNUD","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PAM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"JUD","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AJP","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AJVDM","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"VUPAD-G","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Importé ","disponibilite":"Très mauvaise","raison_indisponibilite":"Importé "},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Importé ","disponibilite":"Très mauvaise","raison_indisponibilite":"Importé "},{"aliment":"Huile","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Importé ","disponibilite":"Très mauvaise","raison_indisponibilite":"Importé "}]	12	f	\N	\N	\N
19	2023-01-31 19:27:39.648343+00	2023-01-31 19:27:39.648343+00	["Sècheresse","Tornades","Feux de brousse"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[]	{"disponible":["Orange"],"dominant":"Orange"}	{"Moto":"NON","Avion":"NON","Auto":"NON"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	1	f	\N	\N	\N
21	2023-01-31 19:39:54.68707+00	2023-01-31 19:39:54.68707+00	["Eboulement","Incendie","Inondation","Vents Violents"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Mons consommé ","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Moins consommé ","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Moins consommé ","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Farine","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"Paul Kamano "},{"nom":"OIM","type":"Institution Internationale","resident":"NON","point_focal":"Paul Kamano"},{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"Paul Kamano"}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Mons consommé ","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Moins consommé ","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"Moins consommé ","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Farine","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	24	f	\N	\N	\N
22	2023-01-31 19:40:24.288145+00	2023-01-31 19:40:24.288145+00	["Incendie","vent violent"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"fonio","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PAM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OMS","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNFPA","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNHCR","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"HCDH","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"CAM","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"AVGRN","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"PED","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"UVP","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"VDD","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AJDT","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"UGVD","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"USDG","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"OUI","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"fonio","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	31	f	\N	\N	\N
23	2023-01-31 19:44:06.037496+00	2023-01-31 19:44:06.037496+00	["Inondation","Incendie"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricots ","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"moins de consommation ","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"Enabel","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"ASIWA","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"MSF","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"CNOSC","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"Vision de Guinée","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"Racine de Guinée","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"Mutuelle des Santé","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"OUI","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricots ","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"moins de consommation ","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	21	f	\N	\N	\N
24	2023-01-31 19:56:11.360814+00	2023-01-31 19:56:11.360814+00	[]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"PLAN GUINEE","type":"INTERNATIONALE"},{"nom":"AGIL ","type":"NATIONALE"},{"nom":"croix rouge préfectoral ","type":"NATIONALE"}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	14	f	\N	\N	\N
26	2023-01-31 22:13:55.778452+00	2023-01-31 22:13:55.778452+00	["Feux de brousse","Inondation","Incendie","Nauffrage"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile rouge","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNOPS","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"UNHCR","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PNUD","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"FAO","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"OMS","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"HCDH","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"ACCORD","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"Search for Common Ground","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"Aide et Action","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile rouge","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	18	f	\N	\N	\N
27	2023-02-06 15:59:13.00065+00	2023-02-06 15:59:13.00065+00	["poussière","Invasion d'insecte","Feux de brousse","Inondation"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Huile rouge","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"acajou","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Taro","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"rareté","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"poisson","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"ignam","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"rareté","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"OIM","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PNUD","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"UNFPA","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"HCDH","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"FAO","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"UNHCR","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PLAN GUINEE","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"USAID","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"Stop palu+(projet)","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"Grdr","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"JHPiego","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PSR/KSW","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PNUD/UNCDF/AGREM","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"OIM","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PNUD","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"UNFPA","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"HCDH","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"FAO","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"UNHCR","type":"Institution Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PLAN GUINEE","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"USAID","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"Stop palu+(projet)","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"Grdr","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"JHPiego","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PSR/KSW","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"PNUD/UNCDF/AGREM","type":"ONG Internationale","resident":"NON","point_focal":"Mohamed Lamine Camara"},{"nom":"CAM(Club des Amis du monde)","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"INAASPO(Initiatives des actions pour l'amélioration des santé des population)","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"RAJ/GUI","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"CEFACAM","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"CEFAD(centre de formation et d'appui du developpement)","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"IBGRN(initiative des bases pour la gestion des données naturelles)","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":[],"dominant":""}	{"Moto":"NON","Avion":"NON","Auto":"NON"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Huile rouge","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"acajou","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Taro","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"rareté","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"poisson","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"ignam","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"rareté","disponibilite":"Bonne","raison_indisponibilite":""}]	3	f	\N	\N	\N
28	2023-02-06 17:47:20.885261+00	2023-02-06 17:47:20.885261+00	["Accident de circulation","Feux de brousse","Incendie","Vents violents ","Nauffrage"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Huile rouge","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Sucre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Farine","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Viande","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Ignames","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"OIM","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"UNFPA","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"PNUD","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"UNOPS","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"UNHCR","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"FAO","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"OMS","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"HCDH","type":"Institution Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"KSW","type":"ONG Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"PLAN GUINEE","type":"ONG Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"CHILD FUND","type":"ONG Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"TERRE DES HOMMES","type":"ONG Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"MSF","type":"ONG Internationale","resident":"NON","point_focal":"Bendoua Leno"},{"nom":"ARCHIF","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":[],"dominant":""}	{"Moto":"NON","Avion":"NON","Auto":"NON"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Huile rouge","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Sucre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Farine","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Viande","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Ignames","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	19	f	\N	\N	\N
29	2023-02-06 18:57:44.588516+00	2023-02-06 18:57:44.588516+00	["Incendie","Éboulement de terre","Inondation","Accident de circulation"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile de palme","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Sel","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Sucre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Viande de boeuf","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Patate","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"Mariama Ciré Boiro"},{"nom":"CRG National","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"VGD","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"COJERECK","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":null}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile de palme","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Sel","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Sucre","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Viande de boeuf","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Patate","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	4	f	\N	\N	\N
30	2023-02-06 19:50:41.142574+00	2023-02-06 19:50:41.142574+00	["Feux de brousse","Inondation","Tornades"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"\\n","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Patattes","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"très peu consomé","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Arachides","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"fonio","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"PNUD","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"OIM","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"PNUD","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"OIM","type":"Institution Internationale","resident":"NON","point_focal":"CPA"}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"\\n","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Patattes","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"très peu consomé","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Arachides","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"fonio","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	30	f	\N	\N	\N
31	2023-02-06 20:20:45.448878+00	2023-02-06 20:20:45.448878+00	["Incendie","Tornades","vent violent"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"peu cultivé","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"peu cultivé","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"peu cultivé","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"OIM","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"PNUD","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"PLAN GUINEE","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"AFDD","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AJEPH","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":[],"dominant":""}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"peu cultivé","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"peu cultivé","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"peu cultivé","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	32	f	\N	\N	\N
32	2023-02-06 20:27:25.740116+00	2023-02-06 20:27:25.740116+00	["Incendie","Inondation","Tornades","Eboulement","Epidémie"]	[{"aliment":"Riz","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Mais","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Huile de palme","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Gingimbre","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OMS","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"FAO","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"HCDH","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNFPA","type":"Institution Internationale","resident":"NON","point_focal":"Boubacar Siddy Barry"},{"nom":"UNHCR","type":"Institution Internationale","resident":"NON","point_focal":"Boubacar Siddy Barry"},{"nom":"UNOPS","type":"Institution Internationale","resident":"NON","point_focal":"Boubacar Siddy Barry"},{"nom":"PNUD","type":"Institution Internationale","resident":"NON","point_focal":"Boubacar Siddy Barry"},{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"Boubacar Siddy Barry"},{"nom":"ALIMA","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"TERRE DES HOMMES","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"FMK(Ffédération mounafanyi de Kindia)","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"OGDH","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"MSP(Murielle de la santé préfectorzle)","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AGBEF","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"FIDH","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":[],"dominant":""}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Haricot","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Mais","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Manioc","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Huile de palme","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"},{"aliment":"Gingimbre","grossiste":"NON","capacite":"NON","magasin":"NON","flotte":"NON","raison":"pas de production commerciale","disponibilite":"Mauvaise","raison_indisponibilite":"pas de production commerciale"}]	29	f	\N	\N	\N
33	2023-02-06 21:00:12.34744+00	2023-02-06 21:00:12.34744+00	["Incendie","Inondation","Accident de circulation"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Huile de palme","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Fonio","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"arachide","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pain","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"OIM","type":"Institution Internationale","resident":"NON","point_focal":"Mamadou Kéita"},{"nom":"OMS","type":"Institution Internationale","resident":"NON","point_focal":"Mamadou Kéita"},{"nom":"UNICEF","type":"Institution Internationale","resident":"NON","point_focal":"Mamadou Kéita"},{"nom":"UNFPA","type":"Institution Internationale","resident":"NON","point_focal":"Mamadou Kéita"},{"nom":"CRS","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"Guinée 44","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"TRIAS","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"ENABEL","type":"ONG Internationale","resident":"NON","point_focal":"Mamadou Kéita"},{"nom":"CRG","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"FMU","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AGEBEF","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"FEJED/GUINEE","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"GAD","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"CROSC/KINDIA","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"CECE","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"PNJDD","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":["Orange","MTN","Cellcom"],"dominant":"Orange"}	{"Moto":"NON","Avion":"OUI","Auto":"NON"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Huile de palme","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Fonio","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"arachide","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Pain","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""}]	28	f	\N	\N	\N
34	2023-02-06 21:00:12.46979+00	2023-02-06 21:00:12.46979+00	["Incendie","Inondation","Accident de Circulation"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile de palme","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Fonio","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Pain","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"arachide","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Patattes","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OMS","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNICEF","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"UNFPA","type":"Institution Internationale","resident":"NON","point_focal":"Mamadou Kéita"},{"nom":"PAM","type":"Institution Internationale","resident":"NON","point_focal":"Mamadou Kéita"},{"nom":"CRS","type":"ONG Internationale","resident":"NON","point_focal":"Mamadou Kéita"},{"nom":"PLAN GUINEE","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"Guinée 44","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"TRIAS","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"ENABEL","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"CRG","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"FMU","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AGEBEF","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"FEJED/GUINEE","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"GAD","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"CROSC/KINDIA","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"CECE","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"PNJDD","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":[],"dominant":""}	{"Moto":"NON","Avion":"NON","Auto":"NON"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Mais","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Huile de palme","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Fonio","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Pain","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"arachide","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Haricot","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Patattes","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"OUI","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	28	f	\N	\N	\N
35	2023-02-06 21:14:42.127697+00	2023-02-06 21:14:42.127697+00	["Incendie","Inondation","Tremblement de terre","Tornades","vent violent"]	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	{"seche":"OUI","pluie":"OUI"}	[{"nom":"UNICEF","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OIM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"PAM","type":"Institution Internationale","resident":"OUI","point_focal":""},{"nom":"OMS","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"UNFPA","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"PNUD","type":"Institution Internationale","resident":"NON","point_focal":"CPA"},{"nom":"WCF","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"UICM","type":"ONG Internationale","resident":"OUI","point_focal":""},{"nom":"CRG","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"OGDH","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"UDT","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"VAPE","type":"ONG Nationale","resident":"OUI","point_focal":""},{"nom":"AVGRN","type":"ONG Nationale","resident":"OUI","point_focal":""}]	{"disponible":[],"dominant":""}	{"Moto":"OUI","Avion":"NON","Auto":"OUI"}	[{"aliment":"Riz","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Très bonne","raison_indisponibilite":""},{"aliment":"Manioc","grossiste":"OUI","capacite":"NON","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"huile","grossiste":"OUI","capacite":"OUI","magasin":"OUI","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""},{"aliment":"Pommes de terre","grossiste":"OUI","capacite":"NON","magasin":"NON","flotte":"NON","raison":"","disponibilite":"Bonne","raison_indisponibilite":""}]	34	f	\N	\N	\N
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.region (id, uuid, created_at, updated_at, nom, slug) FROM stdin;
1	3836bd14-b750-4d9d-b50d-07d3433ca9dc	2023-01-22 08:55:59.536755+00	2023-01-22 08:55:59.536755+00	Conakry	1
2	ebc34251-5a1f-4a98-9427-f2cf022bb9ba	2023-01-22 08:55:59.554143+00	2023-01-22 08:55:59.554143+00	Boké	2
3	368bd19c-3362-4e73-9f35-71d768082cdd	2023-01-22 08:55:59.570075+00	2023-01-22 08:55:59.570075+00	Kindia	3
4	59aaa20c-c02e-48e8-a2e5-3c26095d39f4	2023-01-22 08:55:59.585903+00	2023-01-22 08:55:59.585903+00	Mamou	4
5	e51024d4-e54f-4be3-99f6-aadb454abf3a	2023-01-22 08:55:59.602227+00	2023-01-22 08:55:59.602227+00	Faranah	5
6	825bb3a7-4413-4c9e-a2cd-36d1dec64df3	2023-01-22 08:55:59.618488+00	2023-01-22 08:55:59.618488+00	Kankan	6
7	91ddfd79-08d6-4e4b-a5ff-d81085d0683c	2023-01-22 08:55:59.658175+00	2023-01-22 08:55:59.658175+00	Labé	7
8	e0f08307-6b8a-400f-a7e9-e70f8d4fd084	2023-01-22 08:55:59.683138+00	2023-01-22 08:55:59.683138+00	Nzérékoré	8
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.roles (id, name) FROM stdin;
2	User
1	Admin
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.status (id, name) FROM stdin;
1	Active
2	Inactive
\.


--
-- Data for Name: traitementCatastrophe; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."traitementCatastrophe" (id, uuid, created_at, updated_at, date, commentaire, fichier, "catastropheId", "userId", revision) FROM stdin;
\.


--
-- Data for Name: type_catastrophes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.type_catastrophes (id, name) FROM stdin;
1	Volcan
2	Séisme
3	Epidémie
4	Conflits
5	Incendie
6	Eboulement
7	Inondation
8	Conflits sociaux politique
9	Conflits entre agriculteurs et éleveurs
10	Glissement de terrain
11	Tornades
\.


--
-- Data for Name: type_denres; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.type_denres (id, name) FROM stdin;
\.


--
-- Data for Name: untites; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.untites (id, created_at, updated_at, name) FROM stdin;
1	2023-01-22 08:56:03.702894+00	2023-01-22 08:56:03.702894+00	Kg
2	2023-01-22 08:56:03.715726+00	2023-01-22 08:56:03.715726+00	Tonne
3	2023-01-22 08:56:03.722347+00	2023-01-22 08:56:03.722347+00	Sac
4	2023-01-22 08:56:03.728188+00	2023-01-22 08:56:03.728188+00	Grenier
5	2023-01-22 08:56:03.734191+00	2023-01-22 08:56:03.734191+00	Litre
6	2023-01-22 08:56:03.740183+00	2023-01-22 08:56:03.740183+00	baquette
\.


--
-- Data for Name: untites_produits_produits; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.untites_produits_produits ("untitesId", "produitsId") FROM stdin;
1	1
1	2
1	3
1	4
1	7
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	20
1	21
5	5
5	6
5	9
3	11
3	12
3	13
3	17
3	18
3	19
3	20
3	21
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."user" (id, email, password, provider, "socialId", first_name, last_name, phone, hash, created_at, updated_at, "deletedAt", "photoId", "roleId", "statusId", "regionId", "prefectureId", "communeId", token_firebase) FROM stdin;
2	user@admin.com	$2a$10$.jU0RMlocu8I.a0CetWfBe9NyZtUnyiuRdOuQX2ZpgDlFJmVFvztm	email	\N	Admin user	Admin user	622124579	\N	2023-01-22 08:56:04.055968	2023-01-22 08:56:04.055968	\N	\N	2	1	1	1	1	\N
26	cpa.dalaba@anguch.gov.gn	$2a$10$Q6agaELsgf.IvIr76MPC.ewJgm9uvXYR4At.yDXdFEeqPXyH87ooq	email	\N	DALABA	CPA	000029	f9077c57917f7ac69041a5895406b34108f3f23edf8e4b65a3aa81b5f87b3f3c	2023-01-31 17:21:35.657088	2023-01-31 17:21:35.657088	\N	\N	2	1	4	13	100	\N
11	cpa.kouroussa@anguch.gov.gn	$2a$10$hhV7XYZCqhOs/MgjMlBMNubSOyoPWTLeBw4uA7mifqtdEmZffzBUa	email	\N	CPA	KOUROUSSA	00009	79d3e2d7b0a151df26179861f6b7a14c2b95675be2f44fa133fce891224adbf0	2023-01-30 12:18:47.108421	2023-01-31 18:48:58.156668	\N	\N	2	1	6	21	182	\N
1	admin@admin.com	$2a$10$KuEAjAkHDn5uZb7wOHHfVefn2oWpI8J.8GYtxXsuTAEKEqPVPv8tC	email	\N	Admin	Carter	622124578	\N	2023-01-22 08:56:03.871295	2023-01-30 18:04:56.059092	\N	\N	1	1	1	1	1	\N
18	cpa.boffa@anguch.gov.gn	$2a$10$9TMa50736mFui/6R1EWWF.YaYgaKn4iRnqdlmXzIrKQjpT2ls7ojO	email	\N	BOFFA	CPA	000020	17100adc59c7800947c1929cb20ee8c49f60516f5f7cec9a456194361b347756	2023-01-31 16:54:21.225778	2023-01-31 16:54:21.225778	\N	\N	2	1	2	3	16	\N
19	cpa.fria@anguch.gov.gn	$2a$10$o78djXnuisddEp1ib9aCnu4vCpVpjAc5Xl3Go4U8QCueJ5k/6ufnm	email	\N	FRIA	CPA	000021	2218010d9145c53768d50af6274a90556f9e997ce0fd24bc1fbf64b366e0f6ed	2023-01-31 16:56:00.14785	2023-01-31 16:56:00.14785	\N	\N	2	1	2	4	24	\N
20	cpa.gaoual@anguch.gov.gn	$2a$10$xosFbI14dX9Xr3BWjW1Kgu6pqAanyPQ0N7mQPe7HMWp/6yRAaxWK.	email	\N	GAOUAL	CPA	000022	be32dcca2a9ba7a74f19587aa825aa45aa9d89020c6ace2e0102f6ca348cb84f	2023-01-31 16:57:38.969092	2023-01-31 16:57:38.969092	\N	\N	2	1	2	5	28	\N
21	cca.dixinn@anguch.gov.gn	$2a$10$CnmoIhYl.1ulf0tF.Qx5wOyrwdmkXNi9BLNG/bwRZMbijvD0XKCeq	email	\N	DIXINN	CCA	000024	9ddbeb476680619b225cd007bbbdfd88c979933b4fa9244c08287ff4982feba5	2023-01-31 16:58:46.483351	2023-01-31 16:58:46.483351	\N	\N	2	1	1	1	2	\N
22	cca.matam@anguch.gov.gn	$2a$10$.ZIX.yMRfLZODN59CLDTF.FexzYOHeClHcf.LKP.alq1D/BaXzsUG	email	\N	MATAM	CCA	000025	7a260f7313b34521d05b9454a3f806b402bbecf2bcc3918fa2a258143cc74c78	2023-01-31 16:59:40.797121	2023-01-31 16:59:40.797121	\N	\N	2	1	1	1	3	\N
23	cpa.dinguiraye@anguch.gov.gn	$2a$10$2kx7Tz42FvyOVPwXwJ8bzuY96Lxavo4cQYv924AnsmaCfa8nH2S3O	email	\N	DINGUIRAYE	CPA	000026	9c83c63af038d8808dd4e7565889041516573bddeed9a35454982f46d770aceb	2023-01-31 17:07:57.733639	2023-01-31 17:07:57.733639	\N	\N	2	1	5	17	141	\N
24	cpa.kerouane@anguch.gov.gn	$2a$10$Np4boHvY3sqJl35JK7lbHe1nXNhytT.T8etHjgiggGrGRonCcVT0K	email	\N	KEROUANE	CPA	000027	ca0c52391429dacf6d5a793ba32c4b83747217bf9616481fa4b08e0b21a94e6e	2023-01-31 17:10:28.707772	2023-01-31 17:10:28.707772	\N	\N	2	1	6	20	174	\N
25	cpa.forecariah@anguch.gov.gn	$2a$10$YmVvzjbZDrnhv90ZPVyXq.Uhv1fLEe4AivHWbMbicd6BwhDg2LLqi	email	\N	FORECARIAH	CPA	000028	61ffb53f7901330739bbe3d2212b2dcde78ebb6602907c99293c06d8826726e6	2023-01-31 17:13:47.247211	2023-01-31 17:13:47.247211	\N	\N	2	1	3	10	62	\N
27	cpa.pita@anguch.gov.gn	$2a$10$gNu0dObvp621TsiR2eKSjOh6xzlrjnQkMJl.c3eYGew0Z2YgcxYFW	email	\N	PITA	CPA	000030	5ce1e599e4121beda2141662d923a05e255a8e0711c68c013b8190817e1da0c0	2023-01-31 17:22:33.824346	2023-01-31 17:22:33.824346	\N	\N	2	1	4	14	109	\N
28	cpa.kindia@anguch.gov.gn	$2a$10$U6zsKP.Bd7tU77dBQrce.einWkCYU.VUDJp4OBQ9F6ftid6UI3Pr.	email	\N	KINDIA	CPA	000031	a8f4bc8094775f00d4a23bbececc522a933e03bc5ae74ccc8cd9dbc19f372b4c	2023-01-31 17:25:10.227831	2023-01-31 17:25:10.227831	\N	\N	2	1	3	7	43	\N
29	cpa.telimele@anguch.gov.gn	$2a$10$oXjBWTISEO0RuKZNjrR8R.y5o9DgJWAprhfUxN./OElAV.7zsYtmO	email	\N	TELIMELE	CPA	000032	4354bb8b8f93154f1b434efb97ed2d47a6fceda2edd60a636d99b94870310003	2023-01-31 17:26:18.912925	2023-01-31 17:26:18.912925	\N	\N	2	1	3	11	72	\N
30	cpa.koubia@anguch.gov.gn	$2a$10$Dfur3wSPuO5Oa3mYUTNFWuOuXdDGLPmi5eoPAEim1aBT5JxfUJe0.	email	\N	KOUBIA	CPA	000033	218ee1c7aec0a208f87842416d7f00653aa200a1a119ee25d8348ef788912a90	2023-01-31 17:27:42.250047	2023-01-31 17:27:42.250047	\N	\N	2	1	7	25	231	\N
31	cpa.labe@anguch.gov.gn	$2a$10$Ntx8b.foYuFWX.Nr4kCV5uo6FU3zvY94XiIdLrkDzxQnSAME9NCi6	email	\N	LABE	CPA	000034	6e2d2f594e95f3e0fce47773f99e2105bf78fc9d92c9b185b9ca2e3ff9aaf221	2023-01-31 17:29:01.803989	2023-01-31 17:29:01.803989	\N	\N	2	1	7	24	217	\N
16	cpa.mamou@anguch.gov.gn	$2a$10$FcnYjgTTPCtDXrGQZyJuquGTeL4gAwaCzKxmVNk4vckvsxFz4/hhy	email	\N	CPA	MAMOU	00014	a592fce2be034fbc05ed7a76338ea5c493915a5e9c76fcd6f0c16fdc971e73e0	2023-01-30 12:30:29.562914	2023-01-31 18:41:38.535814	\N	\N	2	1	4	12	86	\N
15	cpa.dubreka@anguch.gov.gn	$2a$10$u/kb4LqrtTTAroF4RcFpR.VmMZoiF8cb/tMaZYzYZpul2iptf8oPK	email	\N	CPA	DUBREKA	00013	4e994c72e242ea1473bc4138870dbc8f884c1b0a64ce5af74428ab5d5a4dad56	2023-01-30 12:28:11.07473	2023-01-31 18:42:03.308856	\N	\N	2	1	3	9	57	\N
14	cpa.coyah@anguch.gov.gn	$2a$10$fbZeHST2SUt3dCT4lCAR4eu2NuCG0a41vLD91iR0DRIeins2m02oy	email	\N	CPA	COYAH	00012	719e404fb9e90b044558d230aefad4f9b2200f40239d19d4dec5bc90c07e9103	2023-01-30 12:22:58.409896	2023-01-31 18:42:34.084552	\N	\N	2	1	3	8	53	\N
13	cpa.siguiri@anguch.gov.gn	$2a$10$FV708dzNfMNgyXzySuOO5eRav.I0GrA.aVsKbmfb7ru.HUYU.kXDS	email	\N	CPA	SIGUIRI	00011	17e27646776df016a77ee56760641e9420510c026ba2c2fcbc00eaad7bfd7f1b	2023-01-30 12:20:44.928148	2023-01-31 18:43:55.543427	\N	\N	2	1	6	23	205	\N
6	cca.matoto@anguch.gov.gn	$2a$10$VfKfEMf0FcLtcPfGT1Xrj.pNhhUkPq37nSIFfS61v5Mp1qDPK1JnS	email	\N	CCA	MATOTO	00004	12c37bfe6f3417a3a132df004eb41bb798b029328f8cb163166971858749abd3	2023-01-30 12:10:45.535064	2023-01-31 18:47:19.994275	\N	\N	2	1	1	1	5	\N
5	cc.kaloum@anguch.gov.gn	$2a$10$jXA8/Gz2TJB4TNPlcfW1X.vPcMW3UcMbO7QoEEM7eRVtOpXwN9UOW	email	\N	CCA	KALOUM	00003	455c1b82a66cea1d718a459f544e5adeb14feda57e125d7d48a432fe0a6a5435	2023-01-30 12:09:18.330288	2023-01-31 18:47:30.091418	\N	\N	2	1	1	1	1	\N
4	cpa.koundara@anguch.gov.gn	$2a$10$n4lgmdaun22E6pU7OnDTi.4lN8Jx4RjEd4CszAsn7vpipVXa1mvRu	email	\N	CPA	KOUNDARA	626732525	892fb524e4b71fba74227f2911f75839901b87b969c2cf1cfeed65a5cdb32fff	2023-01-30 12:06:40.961347	2023-01-31 18:48:35.388198	\N	\N	2	1	2	6	36	\N
12	cpa.mandiana@anguch.gov.gn	$2a$10$5W/5CMD5.W2VXtr8jhEHW.0ZwhV9LpnjKuTqzSR8rJui7xIzoNXMu	email	\N	CPA	MANDIANA	00010	73f4c2799c3b289695ca898b639c763871e9397238e4a6086e2a3f7d3fadf566	2023-01-30 12:19:56.348129	2023-01-31 18:49:25.801236	\N	\N	2	1	6	22	194	\N
10	cpa.kankan@anguch.gov.gn	$2a$10$uAzQe4alQR34N2Zt3PW5je7KQ4MXzI1uXBGdqtHc99nqAlEuq5Ci2	email	\N	CPA	KANKAN	00008	e1d1d08b9d7a6cf4def7e6bb06d7baf0345a05cd7d5feebefb3623be714e78b4	2023-01-30 12:15:07.559737	2023-01-31 18:49:52.073083	\N	\N	2	1	6	19	161	\N
9	cpa.kissidougou@anguch.gov.gn	$2a$10$RN/7MfsqEXtnIMNAiq8hcuGWiMBt2WhNxJ8wxV.LnnFdMuysKkUSC	email	\N	CPA	KISSIDOUGOU	00007	b20d77680dbb9b7f87310bdc3f2d9689ac57b9e077c1ba18fef627370e3778a9	2023-01-30 12:14:14.244249	2023-01-31 18:50:44.650959	\N	\N	2	1	5	18	149	\N
8	cpa.faranah@anguch.gov.gn	$2a$10$WO9UXCEwnE6TTZg5eBIt8./3lWBSxh8i6afALhGpia6KXQcfzC22.	email	\N	CPA	FARANAH	00006	fbdcf582b3c217efba44154ef9c941c991bd0fa6c013f59a880468149a18a5e0	2023-01-30 12:13:10.188346	2023-01-31 18:51:27.786942	\N	\N	2	1	5	15	121	\N
7	cca.ratoma@anguch.gov.gn	$2a$10$1MXrs4uj/EAnBS7WjcZuQu7pwLsBDInahnIP5wh8dbDfipHO4M2ua	email	\N	CCA	RATOMA	00005	b0a0be37aa5b97970a0798e730a2504605c8ad70ff24e2c15b0be791ddc8fcbe	2023-01-30 12:11:37.90611	2023-01-31 18:52:12.576167	\N	\N	2	1	1	1	4	\N
3	cpa.boke@anguch.gov.gn	$2a$10$uyAN9wjJxktTrSuIlfmPeOPYJUP74GWGaRzuKSlkEjbcnx1cV.fIy	email	\N	CPA	BOKE	00001	cd081aba743e26c59a27f3c10875216b38751f06b87d5a5a0c4d7c1f8d61bc3b	2023-01-30 12:00:31.394792	2023-01-31 23:09:22.640087	\N	\N	2	1	2	2	6	\N
32	cpa.lelouma@anguch.gov.gn	$2a$10$4cKF550LFqKtol.FH6ikhe3N0khy65JHEjiANgadNXjYZcClcZo0C	email	\N	LELOUMA	CPA	000035	6b43684165ea3d77940e303b2a0c91803a82ce0635e1c1ffeaaf2e8aecd00f74	2023-01-31 17:29:48.557857	2023-01-31 17:29:48.557857	\N	\N	2	1	7	26	236	\N
33	cpa.mali@anguch.gov.gn	$2a$10$s55nS0EjZrvUtSrKq/8e1u3pzSVziBRwXL/.dkq8OHYREQ2IUKItu	email	\N	MALI	CPA	000036	370443fbf297d3401952339c5f054dc833e9d6aa7a5a8441ac5beff682009126	2023-01-31 17:30:32.321541	2023-01-31 17:30:32.321541	\N	\N	2	1	7	27	246	\N
34	cpa.tougue@anguch.gov.gn	$2a$10$O.1EZkDnlKewF2C/XOYTTOUwky03ODiedP9FlABsmmZSEB56iqo9m	email	\N	TOUGUE	CPA	000037	2850de7c8bdaab2543a42f029a13c93bcd8c9d3e03b7374297571d4c989508ad	2023-01-31 20:49:33.984849	2023-01-31 20:49:33.984849	\N	\N	2	1	7	28	258	\N
35	cca.kaloum@anguch.gov.gn	$2a$10$JU36PomyviB0QEpwJJGwyOc9t3bx5i3L80FY7XWAfdLExw.JTkOtK	email	\N	KALOUM	CCA	000039	a04b1eecb955cf52f31d558f29e9ab3e14de7b7b94ffd943105d058141945e38	2023-01-31 21:16:10.059088	2023-01-31 21:16:10.059088	\N	\N	2	1	1	1	1	\N
17	cpa.nzerekore@anguch.gov.gn	$2a$10$tqwdHdeI95TDqNiJ4ORQy.PWwqsdBKPXg4uU11v7wtEmz90LH.zPm	email	\N	CPA	NZEREKORE	00015	7aca0b26fe579e771973cbae52cd48ba41da6171ba2254b728044c6ac470736a	2023-01-30 12:33:22.85325	2023-02-08 15:27:06.671756	\N	\N	2	1	8	29	267	\N
36	ismaeld@anguch.gov.gn	$2a$10$bV2jd5iIdPCB.Un0/4Dcj.RT1xEspizCjvkblV3E1U7TulqSZpkiG	email	\N	DIAKITE	ISMAEL	627721018	bc9516aa28bdd35cce8e56158b6101cd4f99e1deaad70075218280ed759e4581	2023-02-09 11:29:11.928105	2023-02-10 13:03:01.726379	\N	\N	1	1	1	1	1	\N
\.


--
-- Name: catastrophe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.catastrophe_id_seq', 76, true);


--
-- Name: commune_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.commune_id_seq', 321, true);


--
-- Name: deplaceinterne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.deplaceinterne_id_seq', 1, false);


--
-- Name: deplaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.deplaces_id_seq', 1, false);


--
-- Name: forgot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.forgot_id_seq', 1, false);


--
-- Name: materiels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.materiels_id_seq', 87, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 9, true);


--
-- Name: personne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.personne_id_seq', 1, false);


--
-- Name: personnedeplaceinterne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.personnedeplaceinterne_id_seq', 1, false);


--
-- Name: prefecture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.prefecture_id_seq', 34, true);


--
-- Name: produit_prefectures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.produit_prefectures_id_seq', 365, true);


--
-- Name: produits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.produits_id_seq', 40, true);


--
-- Name: reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reference_id_seq', 35, true);


--
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.region_id_seq', 8, true);


--
-- Name: traitementCatastrophe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."traitementCatastrophe_id_seq"', 1, false);


--
-- Name: type_catastrophes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.type_catastrophes_id_seq', 11, true);


--
-- Name: type_denres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.type_denres_id_seq', 108, true);


--
-- Name: untites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.untites_id_seq', 6, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_id_seq', 36, true);


--
-- Name: reference PK_01bacbbdd90839b7dce352e4250; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT "PK_01bacbbdd90839b7dce352e4250" PRIMARY KEY (id);


--
-- Name: forgot PK_087959f5bb89da4ce3d763eab75; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.forgot
    ADD CONSTRAINT "PK_087959f5bb89da4ce3d763eab75" PRIMARY KEY (id);


--
-- Name: personnedeplaceinterne PK_0ebb0fad126735a912e23cac8a4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personnedeplaceinterne
    ADD CONSTRAINT "PK_0ebb0fad126735a912e23cac8a4" PRIMARY KEY (id);


--
-- Name: catastrophe PK_2d016431f1cbf0e71200b76e74f; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catastrophe
    ADD CONSTRAINT "PK_2d016431f1cbf0e71200b76e74f" PRIMARY KEY (id);


--
-- Name: file PK_36b46d232307066b3a2c9ea3a1d; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.file
    ADD CONSTRAINT "PK_36b46d232307066b3a2c9ea3a1d" PRIMARY KEY (id);


--
-- Name: deplaces PK_3811673f0772b14307536900b08; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaces
    ADD CONSTRAINT "PK_3811673f0772b14307536900b08" PRIMARY KEY (id);


--
-- Name: prefecture PK_3fce91cb7a6284afbd2de69011a; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prefecture
    ADD CONSTRAINT "PK_3fce91cb7a6284afbd2de69011a" PRIMARY KEY (id);


--
-- Name: materiels PK_46a33de7cd630abfc7fb0e3ba91; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.materiels
    ADD CONSTRAINT "PK_46a33de7cd630abfc7fb0e3ba91" PRIMARY KEY (id);


--
-- Name: untites_produits_produits PK_5621b14f01df0aa9d758a4bcd16; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.untites_produits_produits
    ADD CONSTRAINT "PK_5621b14f01df0aa9d758a4bcd16" PRIMARY KEY ("untitesId", "produitsId");


--
-- Name: region PK_5f48ffc3af96bc486f5f3f3a6da; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT "PK_5f48ffc3af96bc486f5f3f3a6da" PRIMARY KEY (id);


--
-- Name: produits PK_738095029a8d184b11939537702; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT "PK_738095029a8d184b11939537702" PRIMARY KEY (id);


--
-- Name: produit_prefectures PK_81635c7b69651dd8e071e728be4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.produit_prefectures
    ADD CONSTRAINT "PK_81635c7b69651dd8e071e728be4" PRIMARY KEY (id);


--
-- Name: personne PK_8bcf83a7d5b107c761ac76acba5; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT "PK_8bcf83a7d5b107c761ac76acba5" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: type_denres PK_9d23e16f76f00ea992808099935; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.type_denres
    ADD CONSTRAINT "PK_9d23e16f76f00ea992808099935" PRIMARY KEY (id);


--
-- Name: untites PK_9d3617ec7551fb523d70a66bb63; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.untites
    ADD CONSTRAINT "PK_9d3617ec7551fb523d70a66bb63" PRIMARY KEY (id);


--
-- Name: traitementCatastrophe PK_a42912fdda8480474faf41713f0; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."traitementCatastrophe"
    ADD CONSTRAINT "PK_a42912fdda8480474faf41713f0" PRIMARY KEY (id);


--
-- Name: commune PK_bc512eb8412b43c9dc6e2c9e683; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.commune
    ADD CONSTRAINT "PK_bc512eb8412b43c9dc6e2c9e683" PRIMARY KEY (id);


--
-- Name: roles PK_c1433d71a4838793a49dcad46ab; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "PK_c1433d71a4838793a49dcad46ab" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: status PK_e12743a7086ec826733f54e1d95; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT "PK_e12743a7086ec826733f54e1d95" PRIMARY KEY (id);


--
-- Name: deplaceinterne PK_e9c68092c1f7e8e84955254b0fc; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaceinterne
    ADD CONSTRAINT "PK_e9c68092c1f7e8e84955254b0fc" PRIMARY KEY (id);


--
-- Name: type_catastrophes PK_f7ca4fcf43a031303cbf552b1e2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.type_catastrophes
    ADD CONSTRAINT "PK_f7ca4fcf43a031303cbf552b1e2" PRIMARY KEY (id);


--
-- Name: user UQ_e12875dfb3b1d92d7d7c5377e22; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e22" UNIQUE (email);


--
-- Name: IDX_390c3806693d6f9d9e16f26855; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "IDX_390c3806693d6f9d9e16f26855" ON public.untites_produits_produits USING btree ("produitsId");


--
-- Name: IDX_6937e802be2946855a3ad0e6be; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "IDX_6937e802be2946855a3ad0e6be" ON public."user" USING btree (last_name);


--
-- Name: IDX_7a4fd2a547828e5efe420e50d1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "IDX_7a4fd2a547828e5efe420e50d1" ON public."user" USING btree (first_name);


--
-- Name: IDX_9bd2fe7a8e694dedc4ec2f666f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "IDX_9bd2fe7a8e694dedc4ec2f666f" ON public."user" USING btree ("socialId");


--
-- Name: IDX_befe88aa46ef00a2c0087c72ea; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "IDX_befe88aa46ef00a2c0087c72ea" ON public.untites_produits_produits USING btree ("untitesId");


--
-- Name: IDX_df507d27b0fb20cd5f7bef9b9a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "IDX_df507d27b0fb20cd5f7bef9b9a" ON public.forgot USING btree (hash);


--
-- Name: IDX_e282acb94d2e3aec10f480e4f6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "IDX_e282acb94d2e3aec10f480e4f6" ON public."user" USING btree (hash);


--
-- Name: deplaces FK_092f083568eea37196f5a353fde; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaces
    ADD CONSTRAINT "FK_092f083568eea37196f5a353fde" FOREIGN KEY ("prefectureId") REFERENCES public.prefecture(id);


--
-- Name: personnedeplaceinterne FK_097f6a2d578ecd41add4e887210; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personnedeplaceinterne
    ADD CONSTRAINT "FK_097f6a2d578ecd41add4e887210" FOREIGN KEY ("personneId") REFERENCES public.personne(id);


--
-- Name: catastrophe FK_0bb1444fedcdfc9255f8b1d8d8f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catastrophe
    ADD CONSTRAINT "FK_0bb1444fedcdfc9255f8b1d8d8f" FOREIGN KEY ("communeId") REFERENCES public.commune(id);


--
-- Name: user FK_0ef576903e04eb64261c1047dd1; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_0ef576903e04eb64261c1047dd1" FOREIGN KEY ("prefectureId") REFERENCES public.prefecture(id);


--
-- Name: deplaceinterne FK_114912608452cd4d8b0ea700e67; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaceinterne
    ADD CONSTRAINT "FK_114912608452cd4d8b0ea700e67" FOREIGN KEY ("regionId") REFERENCES public.region(id);


--
-- Name: deplaces FK_115147e5ec459d867fd29d349fc; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaces
    ADD CONSTRAINT "FK_115147e5ec459d867fd29d349fc" FOREIGN KEY ("personneId") REFERENCES public.personne(id);


--
-- Name: prefecture FK_1348706fd1686ca3f2d5b7a15e5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prefecture
    ADD CONSTRAINT "FK_1348706fd1686ca3f2d5b7a15e5" FOREIGN KEY ("regionId") REFERENCES public.region(id);


--
-- Name: produit_prefectures FK_16dd2cd289408cbf0990c3f7c63; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.produit_prefectures
    ADD CONSTRAINT "FK_16dd2cd289408cbf0990c3f7c63" FOREIGN KEY ("produitId") REFERENCES public.produits(id);


--
-- Name: commune FK_22763cf367fe1d679ec9909f51c; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.commune
    ADD CONSTRAINT "FK_22763cf367fe1d679ec9909f51c" FOREIGN KEY ("prefectureId") REFERENCES public.prefecture(id);


--
-- Name: catastrophe FK_2a6fba9d9dde2b841fa72c85c7d; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catastrophe
    ADD CONSTRAINT "FK_2a6fba9d9dde2b841fa72c85c7d" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: traitementCatastrophe FK_2ace56ec071abb2831b5a7a9017; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."traitementCatastrophe"
    ADD CONSTRAINT "FK_2ace56ec071abb2831b5a7a9017" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: forgot FK_31f3c80de0525250f31e23a9b83; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.forgot
    ADD CONSTRAINT "FK_31f3c80de0525250f31e23a9b83" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: untites_produits_produits FK_390c3806693d6f9d9e16f26855d; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.untites_produits_produits
    ADD CONSTRAINT "FK_390c3806693d6f9d9e16f26855d" FOREIGN KEY ("produitsId") REFERENCES public.produits(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personnedeplaceinterne FK_429032c35c561c1ec5049fb4d4d; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personnedeplaceinterne
    ADD CONSTRAINT "FK_429032c35c561c1ec5049fb4d4d" FOREIGN KEY ("deplaceinterneId") REFERENCES public.deplaceinterne(id);


--
-- Name: catastrophe FK_4703ed92474b4e7771ebed9eb3e; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catastrophe
    ADD CONSTRAINT "FK_4703ed92474b4e7771ebed9eb3e" FOREIGN KEY ("prefectureId") REFERENCES public.prefecture(id);


--
-- Name: deplaces FK_649dc324b84ed3e5b8561a00f50; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaces
    ADD CONSTRAINT "FK_649dc324b84ed3e5b8561a00f50" FOREIGN KEY ("regionId") REFERENCES public.region(id);


--
-- Name: personne FK_6d9d55c1e7777e2eff2136a8476; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT "FK_6d9d55c1e7777e2eff2136a8476" FOREIGN KEY ("communeId") REFERENCES public.commune(id);


--
-- Name: user FK_75e2be4ce11d447ef43be0e374f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_75e2be4ce11d447ef43be0e374f" FOREIGN KEY ("photoId") REFERENCES public.file(id);


--
-- Name: produit_prefectures FK_780c7f749e8844ffeb518160a04; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.produit_prefectures
    ADD CONSTRAINT "FK_780c7f749e8844ffeb518160a04" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: catastrophe FK_8ab44703b5b4fda4e18ac323e0b; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catastrophe
    ADD CONSTRAINT "FK_8ab44703b5b4fda4e18ac323e0b" FOREIGN KEY ("regionId") REFERENCES public.region(id);


--
-- Name: personne FK_a7fcd300fe69f9fc07c9853f608; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT "FK_a7fcd300fe69f9fc07c9853f608" FOREIGN KEY ("regionId") REFERENCES public.region(id);


--
-- Name: deplaceinterne FK_aab3b985616cd32bb03bf623002; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaceinterne
    ADD CONSTRAINT "FK_aab3b985616cd32bb03bf623002" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: deplaceinterne FK_b8a7da54013317ec02f23b273e4; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaceinterne
    ADD CONSTRAINT "FK_b8a7da54013317ec02f23b273e4" FOREIGN KEY ("personneId") REFERENCES public.personne(id);


--
-- Name: untites_produits_produits FK_befe88aa46ef00a2c0087c72ea0; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.untites_produits_produits
    ADD CONSTRAINT "FK_befe88aa46ef00a2c0087c72ea0" FOREIGN KEY ("untitesId") REFERENCES public.untites(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user FK_c28e52f758e7bbc53828db92194; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_c28e52f758e7bbc53828db92194" FOREIGN KEY ("roleId") REFERENCES public.roles(id);


--
-- Name: produit_prefectures FK_c5b09887902ae0acb97b3c6cade; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.produit_prefectures
    ADD CONSTRAINT "FK_c5b09887902ae0acb97b3c6cade" FOREIGN KEY ("prefectureId") REFERENCES public.prefecture(id);


--
-- Name: deplaceinterne FK_cd578cf8a9648ff4ead67860351; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaceinterne
    ADD CONSTRAINT "FK_cd578cf8a9648ff4ead67860351" FOREIGN KEY ("communeId") REFERENCES public.commune(id);


--
-- Name: deplaces FK_d4bbb0ee3b5838e7ec34bc8f369; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaces
    ADD CONSTRAINT "FK_d4bbb0ee3b5838e7ec34bc8f369" FOREIGN KEY ("catastropheId") REFERENCES public.catastrophe(id);


--
-- Name: user FK_dc18daa696860586ba4667a9d31; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_dc18daa696860586ba4667a9d31" FOREIGN KEY ("statusId") REFERENCES public.status(id);


--
-- Name: deplaces FK_de3a2578c309e4d62b7fb9961af; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaces
    ADD CONSTRAINT "FK_de3a2578c309e4d62b7fb9961af" FOREIGN KEY ("communeId") REFERENCES public.commune(id);


--
-- Name: deplaceinterne FK_dea8db96e7329d35f60e76f66b3; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaceinterne
    ADD CONSTRAINT "FK_dea8db96e7329d35f60e76f66b3" FOREIGN KEY ("prefectureId") REFERENCES public.prefecture(id);


--
-- Name: deplaceinterne FK_e9c75c8ec031f44afbb4a321eda; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.deplaceinterne
    ADD CONSTRAINT "FK_e9c75c8ec031f44afbb4a321eda" FOREIGN KEY ("catastropheId") REFERENCES public.catastrophe(id);


--
-- Name: user FK_f1a2565b8f2580a146871cf1142; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_f1a2565b8f2580a146871cf1142" FOREIGN KEY ("regionId") REFERENCES public.region(id);


--
-- Name: user FK_f3d3a059661d374a90e0c696f0d; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_f3d3a059661d374a90e0c696f0d" FOREIGN KEY ("communeId") REFERENCES public.commune(id);


--
-- Name: personne FK_f5d0497914efba2859bd8a1cf53; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT "FK_f5d0497914efba2859bd8a1cf53" FOREIGN KEY ("prefectureId") REFERENCES public.prefecture(id);


--
-- Name: reference FK_f6bc1bb76bfba7386b489e6307e; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT "FK_f6bc1bb76bfba7386b489e6307e" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: traitementCatastrophe FK_f739292c8e266da2732d0d2142d; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."traitementCatastrophe"
    ADD CONSTRAINT "FK_f739292c8e266da2732d0d2142d" FOREIGN KEY ("catastropheId") REFERENCES public.catastrophe(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO root;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

