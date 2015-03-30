--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE attachments (
    id integer NOT NULL,
    attached_to_id integer,
    attached_to_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    file_file_name character varying(255),
    file_content_type character varying(255),
    file_file_size integer,
    file_updated_at timestamp without time zone,
    category character varying(255)
);


ALTER TABLE public.attachments OWNER TO staging;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO staging;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- Name: base_port_managers; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE base_port_managers (
    id integer NOT NULL,
    name character varying(255),
    contact text,
    charter_company_id integer,
    base_port_id integer
);


ALTER TABLE public.base_port_managers OWNER TO staging;

--
-- Name: base_port_managers_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE base_port_managers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_port_managers_id_seq OWNER TO staging;

--
-- Name: base_port_managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE base_port_managers_id_seq OWNED BY base_port_managers.id;


--
-- Name: base_ports; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE base_ports (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    region_id integer,
    contact character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    latitude double precision,
    longitude double precision,
    city character varying(255),
    description text
);


ALTER TABLE public.base_ports OWNER TO staging;

--
-- Name: base_ports_charter_companies; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE base_ports_charter_companies (
    id integer NOT NULL,
    charter_company_id integer,
    base_port_id integer,
    city character varying(255),
    address character varying(255),
    country_code character varying(255),
    phone character varying(255),
    fax character varying(255),
    info text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.base_ports_charter_companies OWNER TO staging;

--
-- Name: base_ports_charter_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE base_ports_charter_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_ports_charter_companies_id_seq OWNER TO staging;

--
-- Name: base_ports_charter_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE base_ports_charter_companies_id_seq OWNED BY base_ports_charter_companies.id;


--
-- Name: base_ports_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE base_ports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_ports_id_seq OWNER TO staging;

--
-- Name: base_ports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE base_ports_id_seq OWNED BY base_ports.id;


--
-- Name: catalogues; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE catalogues (
    id integer NOT NULL,
    name character varying(255),
    charter_company_id integer,
    year integer,
    active boolean
);


ALTER TABLE public.catalogues OWNER TO staging;

--
-- Name: catalogues_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE catalogues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogues_id_seq OWNER TO staging;

--
-- Name: catalogues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE catalogues_id_seq OWNED BY catalogues.id;


--
-- Name: charter_companies; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE charter_companies (
    id integer NOT NULL,
    code character varying(255),
    name character varying(255),
    fullname character varying(255),
    city character varying(255),
    address character varying(255),
    phone character varying(255),
    fax character varying(255),
    url character varying(255),
    email character varying(255),
    country_code character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    info text,
    general_charter_conditions text,
    payment_type_id integer,
    billing_method_id integer,
    account_number character varying(255),
    transit_log_payment_id integer,
    account_for_billing character varying(255),
    check_in_time time without time zone,
    check_out_time time without time zone,
    check_in_day integer,
    check_out_day integer,
    payment_instructions text
);


ALTER TABLE public.charter_companies OWNER TO staging;

--
-- Name: charter_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE charter_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.charter_companies_id_seq OWNER TO staging;

--
-- Name: charter_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE charter_companies_id_seq OWNED BY charter_companies.id;


--
-- Name: charter_company_base_port_infos; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE charter_company_base_port_infos (
    id integer NOT NULL,
    charter_company_id integer,
    base_port_id integer,
    city character varying(255),
    address character varying(255),
    country_code character varying(255),
    phone character varying(255),
    fax character varying(255),
    info text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.charter_company_base_port_infos OWNER TO staging;

--
-- Name: charter_company_base_port_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE charter_company_base_port_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.charter_company_base_port_infos_id_seq OWNER TO staging;

--
-- Name: charter_company_base_port_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE charter_company_base_port_infos_id_seq OWNED BY charter_company_base_port_infos.id;


--
-- Name: charter_packs; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE charter_packs (
    id integer NOT NULL,
    name character varying(255),
    description text,
    season_id integer
);


ALTER TABLE public.charter_packs OWNER TO staging;

--
-- Name: charter_packs_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE charter_packs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.charter_packs_id_seq OWNER TO staging;

--
-- Name: charter_packs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE charter_packs_id_seq OWNED BY charter_packs.id;


--
-- Name: charter_packs_ships; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE charter_packs_ships (
    charter_pack_id integer,
    ship_id integer
);


ALTER TABLE public.charter_packs_ships OWNER TO staging;

--
-- Name: deposit_items; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE deposit_items (
    id integer NOT NULL,
    name character varying(255),
    price character varying(255),
    deposit_type_id integer,
    charter_company_id integer
);


ALTER TABLE public.deposit_items OWNER TO staging;

--
-- Name: deposit_items_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE deposit_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposit_items_id_seq OWNER TO staging;

--
-- Name: deposit_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE deposit_items_id_seq OWNED BY deposit_items.id;


--
-- Name: deposit_items_ships; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE deposit_items_ships (
    deposit_item_id integer,
    ship_id integer
);


ALTER TABLE public.deposit_items_ships OWNER TO staging;

--
-- Name: equipment; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE equipment (
    id integer NOT NULL,
    name character varying(255),
    equipment_type_id integer,
    equipment_category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ship_type_id integer,
    "position" integer
);


ALTER TABLE public.equipment OWNER TO staging;

--
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipment_id_seq OWNER TO staging;

--
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE equipment_id_seq OWNED BY equipment.id;


--
-- Name: equipment_ships; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE equipment_ships (
    equipment_id integer NOT NULL,
    ship_id integer NOT NULL
);


ALTER TABLE public.equipment_ships OWNER TO staging;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE expenses (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.expenses OWNER TO staging;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_id_seq OWNER TO staging;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE expenses_id_seq OWNED BY expenses.id;


--
-- Name: extra_items; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE extra_items (
    id integer NOT NULL,
    name character varying(255),
    charter_company_id integer
);


ALTER TABLE public.extra_items OWNER TO staging;

--
-- Name: extra_items_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE extra_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_items_id_seq OWNER TO staging;

--
-- Name: extra_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE extra_items_id_seq OWNED BY extra_items.id;


--
-- Name: extra_items_templates; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE extra_items_templates (
    extra_item_id integer,
    extra_template_id integer
);


ALTER TABLE public.extra_items_templates OWNER TO staging;

--
-- Name: extra_templates; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE extra_templates (
    id integer NOT NULL,
    name character varying(255),
    charter_company_id integer,
    price double precision
);


ALTER TABLE public.extra_templates OWNER TO staging;

--
-- Name: extra_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE extra_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_templates_id_seq OWNER TO staging;

--
-- Name: extra_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE extra_templates_id_seq OWNED BY extra_templates.id;


--
-- Name: extra_templates_ships; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE extra_templates_ships (
    extra_template_id integer,
    ship_id integer
);


ALTER TABLE public.extra_templates_ships OWNER TO staging;

--
-- Name: fees; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE fees (
    id integer NOT NULL,
    charter_company_id integer,
    ship_type_id integer,
    price double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.fees OWNER TO staging;

--
-- Name: fees_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE fees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fees_id_seq OWNER TO staging;

--
-- Name: fees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE fees_id_seq OWNED BY fees.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    item_id integer,
    item_type character varying(255),
    image_type_id integer,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.images OWNER TO staging;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO staging;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: periods; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE periods (
    id integer NOT NULL,
    start_date date,
    end_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    season_id integer
);


ALTER TABLE public.periods OWNER TO staging;

--
-- Name: periods_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE periods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.periods_id_seq OWNER TO staging;

--
-- Name: periods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE periods_id_seq OWNED BY periods.id;


--
-- Name: price_lists; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE price_lists (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    season_id integer
);


ALTER TABLE public.price_lists OWNER TO staging;

--
-- Name: price_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE price_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_lists_id_seq OWNER TO staging;

--
-- Name: price_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE price_lists_id_seq OWNED BY price_lists.id;


--
-- Name: price_lists_ships; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE price_lists_ships (
    price_list_id integer,
    ship_id integer
);


ALTER TABLE public.price_lists_ships OWNER TO staging;

--
-- Name: price_per_weeks; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE price_per_weeks (
    id integer NOT NULL,
    season_ship_id integer,
    price double precision,
    start date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.price_per_weeks OWNER TO staging;

--
-- Name: price_per_weeks_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE price_per_weeks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_per_weeks_id_seq OWNER TO staging;

--
-- Name: price_per_weeks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE price_per_weeks_id_seq OWNED BY price_per_weeks.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    parent_id integer,
    latitude double precision,
    longitude double precision,
    season_id integer,
    ancestry character varying(255),
    description text
);


ALTER TABLE public.regions OWNER TO staging;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO staging;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: sailings; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE sailings (
    id integer NOT NULL,
    season_ship_id integer,
    start_date date,
    price double precision
);


ALTER TABLE public.sailings OWNER TO staging;

--
-- Name: sailings_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE sailings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sailings_id_seq OWNER TO staging;

--
-- Name: sailings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE sailings_id_seq OWNED BY sailings.id;


--
-- Name: sailings_transactions; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE sailings_transactions (
    transaction_id integer,
    sailing_id integer
);


ALTER TABLE public.sailings_transactions OWNER TO staging;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO staging;

--
-- Name: season_ships; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE season_ships (
    id integer NOT NULL,
    ship_id integer,
    season_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    price double precision
);


ALTER TABLE public.season_ships OWNER TO staging;

--
-- Name: season_ships_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE season_ships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.season_ships_id_seq OWNER TO staging;

--
-- Name: season_ships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE season_ships_id_seq OWNED BY season_ships.id;


--
-- Name: seasons; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE seasons (
    id integer NOT NULL,
    name character varying(255),
    catalogue_id integer,
    price double precision
);


ALTER TABLE public.seasons OWNER TO staging;

--
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE seasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seasons_id_seq OWNER TO staging;

--
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE seasons_id_seq OWNED BY seasons.id;


--
-- Name: ship_manufacturers; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE ship_manufacturers (
    id integer NOT NULL,
    name character varying(255),
    country_code character varying(255),
    url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ship_manufacturers OWNER TO staging;

--
-- Name: ship_manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE ship_manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ship_manufacturers_id_seq OWNER TO staging;

--
-- Name: ship_manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE ship_manufacturers_id_seq OWNED BY ship_manufacturers.id;


--
-- Name: ship_models; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE ship_models (
    id integer NOT NULL,
    name character varying(255),
    ship_manufacturer_id integer,
    ship_type_id integer,
    hull_type_id integer,
    fuel_type_id integer,
    length double precision,
    beam double precision,
    draught double precision,
    fuel_capacity double precision,
    water_capacity double precision,
    no_of_engines integer,
    engine_power double precision,
    engine_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    variant character varying(255)
);


ALTER TABLE public.ship_models OWNER TO staging;

--
-- Name: ship_models_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE ship_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ship_models_id_seq OWNER TO staging;

--
-- Name: ship_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE ship_models_id_seq OWNED BY ship_models.id;


--
-- Name: ships; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE ships (
    id integer NOT NULL,
    name character varying(255),
    charter_company_id integer,
    ship_model_id integer,
    base_port_id integer,
    year_of_manufacture integer,
    no_of_engines integer,
    engine_name character varying(255),
    engine_power double precision,
    fuel_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description text,
    length double precision,
    beam double precision,
    draught double precision,
    fuel_capacity double precision,
    water_capacity double precision,
    max_no_of_people integer,
    no_of_berths character varying(255),
    no_of_crew_cabins integer,
    no_of_heads integer,
    variant character varying(255),
    no_of_bunk_cabins integer,
    no_of_double_cabins integer,
    no_of_skipper_cabins integer,
    hull_type_id integer,
    ship_type_id integer,
    no_of_single_cabins integer,
    no_of_triple_cabins integer,
    charter_type_id integer
);


ALTER TABLE public.ships OWNER TO staging;

--
-- Name: ships_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE ships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ships_id_seq OWNER TO staging;

--
-- Name: ships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE ships_id_seq OWNED BY ships.id;


--
-- Name: ships_transit_log_templates; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE ships_transit_log_templates (
    ship_id integer,
    transit_log_template_id integer
);


ALTER TABLE public.ships_transit_log_templates OWNER TO staging;

--
-- Name: to_do_items; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE to_do_items (
    id integer NOT NULL,
    "position" integer DEFAULT 0,
    text text,
    status boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    assignee_id integer,
    assignee_type character varying(255),
    user_id integer,
    due_date date
);


ALTER TABLE public.to_do_items OWNER TO staging;

--
-- Name: to_do_items_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE to_do_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.to_do_items_id_seq OWNER TO staging;

--
-- Name: to_do_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE to_do_items_id_seq OWNED BY to_do_items.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE transactions (
    id integer NOT NULL,
    transaction_status_id integer,
    check_in date,
    check_out date,
    base_in_id integer,
    base_out_id integer,
    charter_company_id integer,
    client_id integer,
    price character varying(255),
    payment_type_id integer,
    agency_agreement character varying(255),
    agent_id integer,
    creation_date date,
    option_date date,
    expiry_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    notes text,
    payment_status double precision DEFAULT 0,
    reservation_date date
);


ALTER TABLE public.transactions OWNER TO staging;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO staging;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE transactions_id_seq OWNED BY transactions.id;


--
-- Name: transit_log_items; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE transit_log_items (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.transit_log_items OWNER TO staging;

--
-- Name: transit_log_items_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE transit_log_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transit_log_items_id_seq OWNER TO staging;

--
-- Name: transit_log_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE transit_log_items_id_seq OWNED BY transit_log_items.id;


--
-- Name: transit_log_items_templates; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE transit_log_items_templates (
    transit_log_item_id integer,
    transit_log_template_id integer
);


ALTER TABLE public.transit_log_items_templates OWNER TO staging;

--
-- Name: transit_log_templates; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE transit_log_templates (
    id integer NOT NULL,
    name character varying(255),
    price double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    charter_company_id integer
);


ALTER TABLE public.transit_log_templates OWNER TO staging;

--
-- Name: transit_log_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE transit_log_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transit_log_templates_id_seq OWNER TO staging;

--
-- Name: transit_log_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE transit_log_templates_id_seq OWNED BY transit_log_templates.id;


--
-- Name: translations; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE translations (
    id integer NOT NULL,
    translatable_id integer,
    translatable_type character varying(255),
    translatable_field character varying(255),
    locale character varying(255),
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.translations OWNER TO staging;

--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_id_seq OWNER TO staging;

--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE translations_id_seq OWNED BY translations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: staging; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    role_id integer
);


ALTER TABLE public.users OWNER TO staging;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: staging
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO staging;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staging
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY base_port_managers ALTER COLUMN id SET DEFAULT nextval('base_port_managers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY base_ports ALTER COLUMN id SET DEFAULT nextval('base_ports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY base_ports_charter_companies ALTER COLUMN id SET DEFAULT nextval('base_ports_charter_companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY catalogues ALTER COLUMN id SET DEFAULT nextval('catalogues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY charter_companies ALTER COLUMN id SET DEFAULT nextval('charter_companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY charter_company_base_port_infos ALTER COLUMN id SET DEFAULT nextval('charter_company_base_port_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY charter_packs ALTER COLUMN id SET DEFAULT nextval('charter_packs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY deposit_items ALTER COLUMN id SET DEFAULT nextval('deposit_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY equipment ALTER COLUMN id SET DEFAULT nextval('equipment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY extra_items ALTER COLUMN id SET DEFAULT nextval('extra_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY extra_templates ALTER COLUMN id SET DEFAULT nextval('extra_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY fees ALTER COLUMN id SET DEFAULT nextval('fees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY periods ALTER COLUMN id SET DEFAULT nextval('periods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY price_lists ALTER COLUMN id SET DEFAULT nextval('price_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY price_per_weeks ALTER COLUMN id SET DEFAULT nextval('price_per_weeks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY sailings ALTER COLUMN id SET DEFAULT nextval('sailings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY season_ships ALTER COLUMN id SET DEFAULT nextval('season_ships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY seasons ALTER COLUMN id SET DEFAULT nextval('seasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY ship_manufacturers ALTER COLUMN id SET DEFAULT nextval('ship_manufacturers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY ship_models ALTER COLUMN id SET DEFAULT nextval('ship_models_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY ships ALTER COLUMN id SET DEFAULT nextval('ships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY to_do_items ALTER COLUMN id SET DEFAULT nextval('to_do_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY transit_log_items ALTER COLUMN id SET DEFAULT nextval('transit_log_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY transit_log_templates ALTER COLUMN id SET DEFAULT nextval('transit_log_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY translations ALTER COLUMN id SET DEFAULT nextval('translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staging
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY attachments (id, attached_to_id, attached_to_type, created_at, updated_at, file_file_name, file_content_type, file_file_size, file_updated_at, category) FROM stdin;
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('attachments_id_seq', 1, false);


--
-- Data for Name: base_port_managers; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY base_port_managers (id, name, contact, charter_company_id, base_port_id) FROM stdin;
\.


--
-- Name: base_port_managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('base_port_managers_id_seq', 1, false);


--
-- Data for Name: base_ports; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY base_ports (id, name, address, region_id, contact, created_at, updated_at, latitude, longitude, city, description) FROM stdin;
2	Nowy port	Nowy port	2	{ "phone": "1234589765432"}	2015-03-26 12:21:38.979018	2015-03-26 12:21:38.979018	54.397627	18.6648910000000008	Gdansk	\N
\.


--
-- Data for Name: base_ports_charter_companies; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY base_ports_charter_companies (id, charter_company_id, base_port_id, city, address, country_code, phone, fax, info, created_at, updated_at) FROM stdin;
\.


--
-- Name: base_ports_charter_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('base_ports_charter_companies_id_seq', 1, false);


--
-- Name: base_ports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('base_ports_id_seq', 2, true);


--
-- Data for Name: catalogues; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY catalogues (id, name, charter_company_id, year, active) FROM stdin;
\.


--
-- Name: catalogues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('catalogues_id_seq', 1, true);


--
-- Data for Name: charter_companies; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY charter_companies (id, code, name, fullname, city, address, phone, fax, url, email, country_code, created_at, updated_at, info, general_charter_conditions, payment_type_id, billing_method_id, account_number, transit_log_payment_id, account_for_billing, check_in_time, check_out_time, check_in_day, check_out_day, payment_instructions) FROM stdin;
\.


--
-- Name: charter_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('charter_companies_id_seq', 1, false);


--
-- Data for Name: charter_company_base_port_infos; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY charter_company_base_port_infos (id, charter_company_id, base_port_id, city, address, country_code, phone, fax, info, created_at, updated_at) FROM stdin;
1	1	2	Reyes and Carr LLC	Myers Rose LLC	AS	+566-40-2823709	Daniels Oliver Inc	.	2015-03-26 12:27:41.655529	2015-03-26 12:27:41.655529
\.


--
-- Name: charter_company_base_port_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('charter_company_base_port_infos_id_seq', 1, true);


--
-- Data for Name: charter_packs; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY charter_packs (id, name, description, season_id) FROM stdin;
\.


--
-- Name: charter_packs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('charter_packs_id_seq', 1, false);


--
-- Data for Name: charter_packs_ships; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY charter_packs_ships (charter_pack_id, ship_id) FROM stdin;
\.


--
-- Data for Name: deposit_items; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY deposit_items (id, name, price, deposit_type_id, charter_company_id) FROM stdin;
3	Rafael Emerson	547	1	\N
\.


--
-- Name: deposit_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('deposit_items_id_seq', 3, true);


--
-- Data for Name: deposit_items_ships; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY deposit_items_ships (deposit_item_id, ship_id) FROM stdin;
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY equipment (id, name, equipment_type_id, equipment_category_id, created_at, updated_at, ship_type_id, "position") FROM stdin;
1	Deirdre Bauer	\N	1	2015-03-26 12:38:41.400645	2015-03-26 12:38:41.400645	1	1
3	Nita Gamble	\N	3	2015-03-26 12:39:28.589707	2015-03-26 12:39:28.589707	0	1
5	Shafira Santiago	\N	5	2015-03-26 12:40:02.204187	2015-03-26 12:40:02.204187	0	1
2	Gloria Walters	\N	2	2015-03-26 12:39:05.255425	2015-03-26 12:41:49.938034	2	1
6	fghj	\N	4	2015-03-26 12:45:03.580906	2015-03-26 12:45:29.429576	4	3
4	Ariel Abbott	\N	4	2015-03-26 12:39:38.55956	2015-03-26 12:45:42.714486	0	2
7	 nm	\N	4	2015-03-26 12:45:37.129921	2015-03-26 12:45:44.612075	3	1
8	Kaden Haley	\N	1	2015-03-26 14:09:33.459066	2015-03-26 14:09:33.459066	0	2
\.


--
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('equipment_id_seq', 8, true);


--
-- Data for Name: equipment_ships; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY equipment_ships (equipment_id, ship_id) FROM stdin;
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY expenses (id, name, description, created_at, updated_at) FROM stdin;
1	Clarke Marsh	Consequatur? Ducimus, et cupiditate occaecat officiis ex sapiente consequuntur sit, alias qui minima nulla.	2015-03-26 14:58:40.266474	2015-03-26 14:58:40.266474
\.


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('expenses_id_seq', 1, true);


--
-- Data for Name: extra_items; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY extra_items (id, name, charter_company_id) FROM stdin;
1	Morgan Burke	\N
\.


--
-- Name: extra_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('extra_items_id_seq', 1, true);


--
-- Data for Name: extra_items_templates; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY extra_items_templates (extra_item_id, extra_template_id) FROM stdin;
\.


--
-- Data for Name: extra_templates; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY extra_templates (id, name, charter_company_id, price) FROM stdin;
\.


--
-- Name: extra_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('extra_templates_id_seq', 1, false);


--
-- Data for Name: extra_templates_ships; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY extra_templates_ships (extra_template_id, ship_id) FROM stdin;
\.


--
-- Data for Name: fees; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY fees (id, charter_company_id, ship_type_id, price, created_at, updated_at) FROM stdin;
\.


--
-- Name: fees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('fees_id_seq', 1, false);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY images (id, item_id, item_type, image_type_id, image_file_name, image_content_type, image_file_size, image_updated_at, created_at, updated_at) FROM stdin;
1	1	ShipModel	1	Bavaria_30C_layout.jpeg	image/jpeg	11840	2015-03-24 12:46:36.975463	2015-03-24 12:46:37.611516	2015-03-24 12:46:37.611516
2	1	ShipModel	2	Bavaria_30_C_cabin.jpeg	image/jpeg	14672	2015-03-24 12:46:37.427969	2015-03-24 12:46:38.389558	2015-03-24 12:46:38.389558
3	1	ShipModel	2	Bavaria_30_C_head.jpeg	image/jpeg	14005	2015-03-24 12:46:37.46576	2015-03-24 12:46:38.702698	2015-03-24 12:46:38.702698
4	1	ShipModel	2	Bavaria_30C_kitchen.jpeg	image/jpeg	25020	2015-03-24 12:46:37.514197	2015-03-24 12:46:38.992471	2015-03-24 12:46:38.992471
5	1	ShipModel	2	Bavaria_30C_salon.jpeg	image/jpeg	32666	2015-03-24 12:46:37.565226	2015-03-24 12:46:39.376877	2015-03-24 12:46:39.376877
6	1	ShipModel	3	Bavaria_30_C_(1).jpeg	image/jpeg	13544	2015-03-24 12:47:06.312746	2015-03-24 12:47:06.399165	2015-03-24 12:47:06.399165
7	1	ShipModel	3	Bavaria_30C.jpeg	image/jpeg	35152	2015-03-24 12:47:06.353225	2015-03-24 12:47:07.061676	2015-03-24 12:47:07.061676
8	2	ShipModel	1	Bavaria_32C_layout.jpeg	image/jpeg	8806	2015-03-24 14:15:57.336524	2015-03-24 14:15:57.560938	2015-03-24 14:15:57.560938
9	2	ShipModel	2	Bavaria_32C_cabin.jpeg	image/jpeg	20764	2015-03-24 14:15:57.365386	2015-03-24 14:15:58.15948	2015-03-24 14:15:58.15948
10	2	ShipModel	2	Bavaria_32C_navigation_table.jpeg	image/jpeg	26288	2015-03-24 14:15:57.403237	2015-03-24 14:15:58.503281	2015-03-24 14:15:58.503281
11	2	ShipModel	2	Bavaria_32C_salon_1.jpeg	image/jpeg	31489	2015-03-24 14:15:57.441592	2015-03-24 14:15:59.065575	2015-03-24 14:15:59.065575
12	2	ShipModel	2	Bavaria_32C_salon.jpeg	image/jpeg	27831	2015-03-24 14:15:57.479761	2015-03-24 14:15:59.393109	2015-03-24 14:15:59.393109
13	2	ShipModel	3	Bavaria_32C.jpeg	image/jpeg	28524	2015-03-24 14:15:57.518359	2015-03-24 14:15:59.726461	2015-03-24 14:15:59.726461
14	3	ShipModel	1	613133640000100096__480.jpg	image/jpeg	17698	2015-03-24 14:25:49.746828	2015-03-24 14:25:50.01529	2015-03-24 14:25:50.01529
15	3	ShipModel	2	613133590000100096_-int_480.JPG	image/jpeg	48261	2015-03-24 14:25:49.785569	2015-03-24 14:25:50.888537	2015-03-24 14:25:50.888537
16	3	ShipModel	2	613134010000100096_-int1_640.JPG	image/jpeg	66460	2015-03-24 14:25:49.824317	2015-03-24 14:25:51.371545	2015-03-24 14:25:51.371545
17	3	ShipModel	2	613134040000100096_-int2_640.JPG	image/jpeg	85387	2015-03-24 14:25:49.873461	2015-03-24 14:25:51.954102	2015-03-24 14:25:51.954102
18	3	ShipModel	2	613134070000100096__-int3_640.JPG	image/jpeg	53133	2015-03-24 14:25:49.923196	2015-03-24 14:25:52.328284	2015-03-24 14:25:52.328284
19	3	ShipModel	3	613133540000100096_-ex_480.JPG	image/jpeg	50114	2015-03-24 14:25:49.971973	2015-03-24 14:25:52.706978	2015-03-24 14:25:52.706978
20	4	ShipModel	1	Sun_Odyssey_370_layout.jpeg	image/jpeg	8797	2015-03-24 14:37:40.558962	2015-03-24 14:37:40.973939	2015-03-24 14:37:40.973939
21	4	ShipModel	2	Sun_Odyssey-379_head.jpg	image/jpeg	149950	2015-03-24 14:37:40.587002	2015-03-24 14:37:41.546587	2015-03-24 14:37:41.546587
22	4	ShipModel	2	Sun_Odyssey-379_interieur.jpg	image/jpeg	139616	2015-03-24 14:37:40.693729	2015-03-24 14:37:42.246635	2015-03-24 14:37:42.246635
23	4	ShipModel	2	Sun_Odyssey-379_navigation_table.jpg	image/jpeg	176668	2015-03-24 14:37:40.756745	2015-03-24 14:37:42.686959	2015-03-24 14:37:42.686959
24	4	ShipModel	2	Sun_Odyssey-379_salon.jpg	image/jpeg	85009	2015-03-24 14:37:40.848635	2015-03-24 14:37:43.033795	2015-03-24 14:37:43.033795
25	4	ShipModel	3	Sun_Odyssey_379_exterieur.jpg	image/jpeg	112443	2015-03-24 14:37:40.910511	2015-03-24 14:37:43.380216	2015-03-24 14:37:43.380216
26	5	ShipModel	1	Sun_Fast_32i_-_layout.jpeg	image/jpeg	18579	2015-03-25 08:39:38.94011	2015-03-25 08:39:39.10256	2015-03-25 08:39:39.10256
27	5	ShipModel	2	Sun_Fast_32i_-_cabin.jpeg	image/jpeg	6423	2015-03-25 08:39:38.981606	2015-03-25 08:39:40.152403	2015-03-25 08:39:40.152403
28	5	ShipModel	2	Sun_Fast_32i_-_head.jpeg	image/jpeg	7686	2015-03-25 08:39:39.007608	2015-03-25 08:39:40.472077	2015-03-25 08:39:40.472077
29	5	ShipModel	2	Sun_Fast_32i_-_salon.jpeg	image/jpeg	8283	2015-03-25 08:39:39.033768	2015-03-25 08:39:40.812835	2015-03-25 08:39:40.812835
30	5	ShipModel	3	Sun_Fast_32i_-_outside.jpg	image/jpeg	30115	2015-03-25 08:39:39.059952	2015-03-25 08:39:41.173995	2015-03-25 08:39:41.173995
31	6	ShipModel	1	Sun_Fast_26_-_layout.jpeg	image/jpeg	10680	2015-03-25 08:45:05.995489	2015-03-25 08:45:06.127792	2015-03-25 08:45:06.127792
32	6	ShipModel	2	Sun_Fast_-_cabin.jpeg	image/jpeg	6476	2015-03-25 08:45:06.024752	2015-03-25 08:45:06.729742	2015-03-25 08:45:06.729742
33	6	ShipModel	2	Sun_Fast_26_-_kitchen.jpeg	image/jpeg	6697	2015-03-25 08:45:06.04973	2015-03-25 08:45:07.007725	2015-03-25 08:45:07.007725
34	6	ShipModel	2	Sun_Fast_26_-_salon.jpeg	image/jpeg	8380	2015-03-25 08:45:06.072077	2015-03-25 08:45:07.421173	2015-03-25 08:45:07.421173
35	6	ShipModel	3	Sun_Fast_26_-_outside.jpeg	image/jpeg	6001	2015-03-25 08:45:06.094583	2015-03-25 08:45:07.693165	2015-03-25 08:45:07.693165
36	7	ShipModel	1	Sun_Odyssey_32i_-_layout.jpg	image/jpeg	49352	2015-03-25 09:00:57.039231	2015-03-25 09:00:57.239212	2015-03-25 09:00:57.239212
37	7	ShipModel	2	Sun_Odyssey_32i_-_kitchen.jpg	image/jpeg	44227	2015-03-25 09:00:57.08328	2015-03-25 09:00:58.045754	2015-03-25 09:00:58.045754
38	7	ShipModel	2	Sun_Odyssey_32i_-_navigation_table.jpg	image/jpeg	17976	2015-03-25 09:00:57.120939	2015-03-25 09:00:58.431033	2015-03-25 09:00:58.431033
39	7	ShipModel	2	Sun_Odyssey_32i_-_salon.jpg	image/jpeg	65530	2015-03-25 09:00:57.151672	2015-03-25 09:00:58.725912	2015-03-25 09:00:58.725912
40	7	ShipModel	3	Sun_Odyssey_32i_-_outside.jpg	image/jpeg	47346	2015-03-25 09:00:57.195156	2015-03-25 09:00:59.101656	2015-03-25 09:00:59.101656
41	8	ShipModel	1	Sun_Odyssey_30i_-_layout.jpg	image/jpeg	70834	2015-03-25 09:11:31.275538	2015-03-25 09:11:31.625728	2015-03-25 09:11:31.625728
42	8	ShipModel	2	Sun_Odyssey_30i_-_kitchen_island.jpg	image/jpeg	140059	2015-03-25 09:11:31.336752	2015-03-25 09:11:32.702744	2015-03-25 09:11:32.702744
43	8	ShipModel	2	Sun_Odyssey_30i_-_kitchen.jpg	image/jpeg	108429	2015-03-25 09:11:31.425077	2015-03-25 09:11:33.329912	2015-03-25 09:11:33.329912
44	8	ShipModel	2	Sun_Odyssey_30i_-_salon_berth.jpg	image/jpeg	91722	2015-03-25 09:11:31.471871	2015-03-25 09:11:33.803431	2015-03-25 09:11:33.803431
45	8	ShipModel	2	Sun-Odyssey_30i_-_cabin.jpg	image/jpeg	80251	2015-03-25 09:11:31.517365	2015-03-25 09:11:34.177477	2015-03-25 09:11:34.177477
46	8	ShipModel	3	Sun_Odyssey_30i_-_exterieur.jpg	image/jpeg	144852	2015-03-25 09:11:31.561128	2015-03-25 09:11:34.577957	2015-03-25 09:11:34.577957
47	9	ShipModel	1	layout.jpg	image/jpeg	17496	2015-03-25 11:53:28.248451	2015-03-25 11:53:28.334621	2015-03-25 11:53:28.334621
48	9	ShipModel	2	main.jpg	image/jpeg	7332	2015-03-25 11:53:28.295528	2015-03-25 11:53:29.045022	2015-03-25 11:53:29.045022
49	9	ShipModel	2	n1.jpg	image/jpeg	7907	2015-03-25 11:57:41.266848	2015-03-25 11:57:41.380897	2015-03-25 11:57:41.380897
50	9	ShipModel	2	Sun_Odyssey_30i_-_cabin.jpg	image/jpeg	7473	2015-03-25 11:57:41.290124	2015-03-25 11:57:42.053205	2015-03-25 11:57:42.053205
51	9	ShipModel	2	Sun_Odyssey_30i_-_exterieur.jpg	image/jpeg	144852	2015-03-25 11:57:41.317364	2015-03-25 11:57:42.333649	2015-03-25 11:57:42.333649
52	10	ShipModel	1	01e24391b062_(1).jpg	image/jpeg	73169	2015-03-26 12:33:39.633987	2015-03-26 12:33:39.699816	2015-03-26 12:33:39.699816
53	11	ShipModel	1	Hanse_320_layout.jpeg	image/jpeg	8677	2015-03-26 13:33:02.064483	2015-03-26 13:33:02.143312	2015-03-26 13:33:02.143312
54	11	ShipModel	3	Hanse_320_-_outside_1.jpeg	image/jpeg	8715	2015-03-26 13:33:02.09169	2015-03-26 13:33:02.899747	2015-03-26 13:33:02.899747
55	11	ShipModel	3	Hanse_320_-_outside.jpeg	image/jpeg	7403	2015-03-26 13:33:02.115381	2015-03-26 13:33:03.204021	2015-03-26 13:33:03.204021
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('images_id_seq', 55, true);


--
-- Data for Name: periods; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY periods (id, start_date, end_date, created_at, updated_at, season_id) FROM stdin;
\.


--
-- Name: periods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('periods_id_seq', 1, false);


--
-- Data for Name: price_lists; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY price_lists (id, created_at, updated_at, name, season_id) FROM stdin;
\.


--
-- Name: price_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('price_lists_id_seq', 1, false);


--
-- Data for Name: price_lists_ships; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY price_lists_ships (price_list_id, ship_id) FROM stdin;
\.


--
-- Data for Name: price_per_weeks; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY price_per_weeks (id, season_ship_id, price, start, created_at, updated_at) FROM stdin;
\.


--
-- Name: price_per_weeks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('price_per_weeks_id_seq', 1, false);


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY regions (id, name, created_at, updated_at, parent_id, latitude, longitude, season_id, ancestry, description) FROM stdin;
1	Gdansk	2015-03-26 12:12:27.97463	2015-03-26 12:12:27.97463	\N	54.3550681105814633	18.7802002139169417	\N	\N	<p>nice city</p>
\.


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('regions_id_seq', 3, true);


--
-- Data for Name: sailings; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY sailings (id, season_ship_id, start_date, price) FROM stdin;
\.


--
-- Name: sailings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('sailings_id_seq', 1, false);


--
-- Data for Name: sailings_transactions; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY sailings_transactions (transaction_id, sailing_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY schema_migrations (version) FROM stdin;
20140325144924
20140325151331
20140403154233
20140404081636
20140414151802
20140415130515
20140415153307
20140416100844
20140416111129
20140416122055
20140416133118
20140422122853
20140709070540
20140709071905
20140709072757
20140709074659
20140709124246
20140715131024
20140807111941
20140808083842
20140811065905
20140811070238
20140811073809
20140811101546
20140820134058
20140827144147
20140911093819
20140911093834
20140918124349
20140922082246
20140922082949
20140922084029
20140922090632
20140922093943
20140922094219
20140922094704
20140922100847
20140922101705
20140923080648
20140923080749
20140923143108
20140924112454
20140924132003
20141009091356
20141009092557
20141009102946
20141014131558
20141014133009
20141014133845
20141014134522
20141014134710
20141014135034
20141014144848
20141016105000
20141016113037
20141016114103
20141020083119
20141020083851
20141020090036
20141020090324
20141020094912
20141020095115
20141020102337
20141020103329
20141020105422
20141020105456
20141021083007
20141021085252
20141021085720
20141021090024
20141021090141
20141021094531
20141021102431
20141021102955
20141021103212
20141021105311
20141021110543
20141021125013
20141027140315
20141027144324
20141027144909
20141027145701
20141027150217
20141027151221
20141027151919
20141027160232
20141126124519
20141126124748
20141126125740
20141127090559
20141202073411
20141202074333
20150116083246
20150116083247
20150116083248
20150128133245
20150130100942
20150202132717
20150202135329
20150202152849
20150205141635
20150205144335
20150205145953
20150205154302
20150209093647
20150209094057
20150213080101
20150213080938
20150213090118
20150216061818
20150216125037
20150217133647
20150304111806
20150305091735
20150309073448
20150310140313
20150310150113
20150311104528
20150313062022
20150313062356
20150313085221
20150318064813
20150318064856
20150318070223
20150319163732
20150320071323
20150320082832
20150320120636
\.


--
-- Data for Name: season_ships; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY season_ships (id, ship_id, season_id, created_at, updated_at, price) FROM stdin;
\.


--
-- Name: season_ships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('season_ships_id_seq', 1, false);


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY seasons (id, name, catalogue_id, price) FROM stdin;
\.


--
-- Name: seasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('seasons_id_seq', 1, false);


--
-- Data for Name: ship_manufacturers; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY ship_manufacturers (id, name, country_code, url, created_at, updated_at) FROM stdin;
1	Bavaria	DE		2015-03-24 12:42:57.081982	2015-03-24 12:42:57.081982
2	Jeanneau	FR		2015-03-24 14:14:07.464843	2015-03-24 14:14:07.464843
5	Hanse	DE	https://www.hanseyachts.com/gb.html	2015-03-26 13:31:42.341234	2015-03-26 13:31:42.341234
\.


--
-- Name: ship_manufacturers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('ship_manufacturers_id_seq', 5, true);


--
-- Data for Name: ship_models; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY ship_models (id, name, ship_manufacturer_id, ship_type_id, hull_type_id, fuel_type_id, length, beam, draught, fuel_capacity, water_capacity, no_of_engines, engine_power, engine_name, created_at, updated_at, variant) FROM stdin;
1	Bavaria 30C	1	2	1	1	9.44999999999999929	3.29000000000000004	1.85000000000000009	90	150	\N	\N	Volvo	2015-03-24 12:46:37.6102	2015-03-24 12:46:37.6102	2006
2	Bavaria 32C	1	2	1	1	9.99000000000000021	\N	1.64999999999999991	150	150	\N	\N	Volvo Penta	2015-03-24 14:15:57.559644	2015-03-24 14:15:57.559644	2010
3	Bavaria 33C	1	2	1	1	9.99000000000000021	3.41999999999999993	1.94999999999999996	150	150	\N	\N	Volvo	2015-03-24 14:25:50.01378	2015-03-24 14:25:50.01378	2013
4	Sun Odyssey 379	2	2	1	1	11.3399999999999999	3.75999999999999979	1.94999999999999996	130	200	\N	\N	Yanmar	2015-03-24 14:37:40.972424	2015-03-24 14:37:40.972424	2013
5	Sun Fast 32i	2	2	1	1	9.59999999999999964	3.29999999999999982	1.97999999999999998	70	170	\N	\N		2015-03-25 08:39:39.100883	2015-03-25 08:39:39.100883	2005
6	Sun Fast 26	2	2	1	1	7.62999999999999989	2.9700000000000002	1.5	25	100	\N	\N		2015-03-25 08:45:06.12594	2015-03-25 08:45:06.12594	
7	Sun Odyssey 32i	2	2	1	1	9.59999999999999964	3.29999999999999982	2	70	170	\N	\N		2015-03-25 09:00:57.237706	2015-03-25 09:00:57.237706	2008
8	Sun Odyssey 30i	2	2	1	1	8.99000000000000021	3.18000000000000016	1.75	50	160	\N	\N	Yanmar	2015-03-25 09:11:31.624195	2015-03-25 09:11:31.624195	2012
9	petra	3	2	1	1	8	5	2	300	250	\N	\N	Volvo Penta	2015-03-25 11:52:33.151538	2015-03-25 11:52:33.151538	2012
10	Vielka Rocha	1	1	1	1	41	24	91	87	5	\N	\N	Aubrey Velazquez	2015-03-26 12:33:39.69823	2015-03-26 12:33:39.69823	Aperiam magnam tempor laborum aliquip aliqua Natus dolor quas perspiciatis commodo eveniet deleniti ipsa neque ut excepturi molestiae nostrum consequatur
11	Hanse 320	5	2	1	1	9.63000000000000078	3.29999999999999982	1.75	110	260	\N	\N	Yanmar	2015-03-26 13:33:02.141807	2015-03-26 13:33:02.141807	2008
\.


--
-- Name: ship_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('ship_models_id_seq', 11, true);


--
-- Data for Name: ships; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY ships (id, name, charter_company_id, ship_model_id, base_port_id, year_of_manufacture, no_of_engines, engine_name, engine_power, fuel_type_id, created_at, updated_at, description, length, beam, draught, fuel_capacity, water_capacity, max_no_of_people, no_of_berths, no_of_crew_cabins, no_of_heads, variant, no_of_bunk_cabins, no_of_double_cabins, no_of_skipper_cabins, hull_type_id, ship_type_id, no_of_single_cabins, no_of_triple_cabins, charter_type_id) FROM stdin;
1	Alec Sparks	1	3	2	27	39	Isaiah Sweeney	20	1	2015-03-26 12:28:14.776742	2015-03-26 12:28:14.776742	Earum mollit facere saepe tempor id, qui harum rerum commodo voluptatum reprehenderit, nesciunt, est, iusto architecto ipsam alias id vel.	17	45	62	46	50	66	Hic reiciendis est in qui	37	40	Officia vitae quaerat a asperiores voluptas amet quaerat	1	36	59	1	2	66	1	1
\.


--
-- Name: ships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('ships_id_seq', 1, true);


--
-- Data for Name: ships_transit_log_templates; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY ships_transit_log_templates (ship_id, transit_log_template_id) FROM stdin;
\.


--
-- Data for Name: to_do_items; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY to_do_items (id, "position", text, status, created_at, updated_at, assignee_id, assignee_type, user_id, due_date) FROM stdin;
\.


--
-- Name: to_do_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('to_do_items_id_seq', 1, false);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY transactions (id, transaction_status_id, check_in, check_out, base_in_id, base_out_id, charter_company_id, client_id, price, payment_type_id, agency_agreement, agent_id, creation_date, option_date, expiry_date, created_at, updated_at, notes, payment_status, reservation_date) FROM stdin;
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('transactions_id_seq', 1, false);


--
-- Data for Name: transit_log_items; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY transit_log_items (id, name, created_at, updated_at) FROM stdin;
1	Tashya Byers	2015-03-26 14:15:13.863076	2015-03-26 14:15:13.863076
\.


--
-- Name: transit_log_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('transit_log_items_id_seq', 1, true);


--
-- Data for Name: transit_log_items_templates; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY transit_log_items_templates (transit_log_item_id, transit_log_template_id) FROM stdin;
\.


--
-- Data for Name: transit_log_templates; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY transit_log_templates (id, name, price, created_at, updated_at, charter_company_id) FROM stdin;
\.


--
-- Name: transit_log_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('transit_log_templates_id_seq', 2, true);


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY translations (id, translatable_id, translatable_type, translatable_field, locale, content, created_at, updated_at) FROM stdin;
1	1	Expense	description	en		2015-03-26 14:58:40.267845	2015-03-26 14:58:40.267845
2	1	Expense	description	hr		2015-03-26 14:58:40.269107	2015-03-26 14:58:40.269107
3	1	Expense	description	de		2015-03-26 14:58:40.26982	2015-03-26 14:58:40.26982
4	1	Expense	description	fr		2015-03-26 14:58:40.270478	2015-03-26 14:58:40.270478
\.


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('translations_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: staging
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, role_id) FROM stdin;
2	josip@infinum.hr	$2a$10$xT/ABToXw.jJvaVFS2obf.IUAnBdBWdHcsn2Nlj7YMWo1fJ6XX3Py	\N	\N	\N	1	2015-03-24 10:02:27.046451	2015-03-24 10:02:27.046451	213.147.102.42	213.147.102.42	2015-03-24 09:57:14.211133	2015-03-24 10:02:27.047701	1
1	admin@infinum.co	$2a$10$5qBBHSFqkq1WNOi4PVwsa.yx0ieVQCLZakFjOuF1zQK991ZE4CJQi	\N	\N	\N	3	2015-03-26 11:39:59.06348	2015-03-24 09:56:56.666934	213.147.102.42	213.147.102.42	2015-03-24 07:42:56.321559	2015-03-26 11:39:59.064812	1
3	maja@miramoclub.com	$2a$10$hBUyeSxrRwN1d8hgD1wlFOB6zlSjnQ/w2PSpBG.yFgheARKPnsIu6	\N	\N	2015-03-24 10:21:34.515682	4	2015-03-26 13:06:34.247288	2015-03-25 11:48:33.592827	151.252.233.169	5.39.142.122	2015-03-24 10:02:58.680854	2015-03-26 13:06:34.248275	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staging
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: base_managers_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY base_port_managers
    ADD CONSTRAINT base_managers_pkey PRIMARY KEY (id);


--
-- Name: base_ports_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY base_ports
    ADD CONSTRAINT base_ports_pkey PRIMARY KEY (id);


--
-- Name: catalogues_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY catalogues
    ADD CONSTRAINT catalogues_pkey PRIMARY KEY (id);


--
-- Name: charter_companies_base_ports_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY base_ports_charter_companies
    ADD CONSTRAINT charter_companies_base_ports_pkey PRIMARY KEY (id);


--
-- Name: charter_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY charter_companies
    ADD CONSTRAINT charter_companies_pkey PRIMARY KEY (id);


--
-- Name: charter_company_base_port_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY charter_company_base_port_infos
    ADD CONSTRAINT charter_company_base_port_infos_pkey PRIMARY KEY (id);


--
-- Name: charter_packs_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY charter_packs
    ADD CONSTRAINT charter_packs_pkey PRIMARY KEY (id);


--
-- Name: deposit_items_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY deposit_items
    ADD CONSTRAINT deposit_items_pkey PRIMARY KEY (id);


--
-- Name: equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- Name: expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: extra_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY extra_templates
    ADD CONSTRAINT extra_templates_pkey PRIMARY KEY (id);


--
-- Name: extras_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY extra_items
    ADD CONSTRAINT extras_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: periods_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);


--
-- Name: price_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY price_lists
    ADD CONSTRAINT price_lists_pkey PRIMARY KEY (id);


--
-- Name: price_per_weeks_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY price_per_weeks
    ADD CONSTRAINT price_per_weeks_pkey PRIMARY KEY (id);


--
-- Name: prices_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY sailings
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- Name: provisions_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY fees
    ADD CONSTRAINT provisions_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: season_ships_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY season_ships
    ADD CONSTRAINT season_ships_pkey PRIMARY KEY (id);


--
-- Name: seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- Name: ship_manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY ship_manufacturers
    ADD CONSTRAINT ship_manufacturers_pkey PRIMARY KEY (id);


--
-- Name: ship_models_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY ship_models
    ADD CONSTRAINT ship_models_pkey PRIMARY KEY (id);


--
-- Name: ships_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY ships
    ADD CONSTRAINT ships_pkey PRIMARY KEY (id);


--
-- Name: to_do_items_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY to_do_items
    ADD CONSTRAINT to_do_items_pkey PRIMARY KEY (id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: transit_log_items_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY transit_log_items
    ADD CONSTRAINT transit_log_items_pkey PRIMARY KEY (id);


--
-- Name: transit_log_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY transit_log_templates
    ADD CONSTRAINT transit_log_templates_pkey PRIMARY KEY (id);


--
-- Name: translations_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: staging; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_base_ports_charter_companies_on_base_port_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_base_ports_charter_companies_on_base_port_id ON base_ports_charter_companies USING btree (base_port_id);


--
-- Name: index_base_ports_charter_companies_on_charter_company_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_base_ports_charter_companies_on_charter_company_id ON base_ports_charter_companies USING btree (charter_company_id);


--
-- Name: index_charter_company_base_port_infos_on_base_port_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_charter_company_base_port_infos_on_base_port_id ON charter_company_base_port_infos USING btree (base_port_id);


--
-- Name: index_charter_company_base_port_infos_on_charter_company_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_charter_company_base_port_infos_on_charter_company_id ON charter_company_base_port_infos USING btree (charter_company_id);


--
-- Name: index_equipment_ships_on_equipment_id_and_ship_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_equipment_ships_on_equipment_id_and_ship_id ON equipment_ships USING btree (equipment_id, ship_id);


--
-- Name: index_equipment_ships_on_ship_id_and_equipment_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_equipment_ships_on_ship_id_and_equipment_id ON equipment_ships USING btree (ship_id, equipment_id);


--
-- Name: index_fees_on_charter_company_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_fees_on_charter_company_id ON fees USING btree (charter_company_id);


--
-- Name: index_images_on_item_id_and_item_type; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_images_on_item_id_and_item_type ON images USING btree (item_id, item_type);


--
-- Name: index_price_per_weeks_on_season_ship_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_price_per_weeks_on_season_ship_id ON price_per_weeks USING btree (season_ship_id);


--
-- Name: index_regions_on_ancestry; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_regions_on_ancestry ON regions USING btree (ancestry);


--
-- Name: index_sailings_transactions_on_sailing_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_sailings_transactions_on_sailing_id ON sailings_transactions USING btree (sailing_id);


--
-- Name: index_sailings_transactions_on_transaction_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_sailings_transactions_on_transaction_id ON sailings_transactions USING btree (transaction_id);


--
-- Name: index_season_ships_on_season_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_season_ships_on_season_id ON season_ships USING btree (season_id);


--
-- Name: index_season_ships_on_ship_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_season_ships_on_ship_id ON season_ships USING btree (ship_id);


--
-- Name: index_ship_models_on_ship_manufacturer_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_ship_models_on_ship_manufacturer_id ON ship_models USING btree (ship_manufacturer_id);


--
-- Name: index_ships_on_base_port_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_ships_on_base_port_id ON ships USING btree (base_port_id);


--
-- Name: index_ships_on_ship_model_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_ships_on_ship_model_id ON ships USING btree (ship_model_id);


--
-- Name: index_transactions_on_agent_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_transactions_on_agent_id ON transactions USING btree (agent_id);


--
-- Name: index_transactions_on_base_in_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_transactions_on_base_in_id ON transactions USING btree (base_in_id);


--
-- Name: index_transactions_on_base_out_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_transactions_on_base_out_id ON transactions USING btree (base_out_id);


--
-- Name: index_transactions_on_charter_company_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_transactions_on_charter_company_id ON transactions USING btree (charter_company_id);


--
-- Name: index_transactions_on_client_id; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX index_transactions_on_client_id ON transactions USING btree (client_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: record_translations_index; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE INDEX record_translations_index ON translations USING btree (translatable_id, translatable_type, locale);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: staging; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

