--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET search_path = public, pg_catalog;

--
-- Name: check_length_of_comment_text(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION check_length_of_comment_text(text) RETURNS boolean
    LANGUAGE sql
    AS $_$
  SELECT length( $1 ) <= 500;
$_$;


--
-- Name: comment_text; Type: DOMAIN; Schema: public; Owner: -
--

CREATE DOMAIN comment_text AS text
	CONSTRAINT max_length CHECK (check_length_of_comment_text(VALUE));


--
-- Name: DOMAIN comment_text; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON DOMAIN comment_text IS 'A special type for the text of a comment. Allows us to change character limits transparently';


--
-- Name: check_length_of_timeline_item_text(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION check_length_of_timeline_item_text(text) RETURNS boolean
    LANGUAGE sql
    AS $_$
  SELECT length( $1 ) <= 500;
$_$;


--
-- Name: timeline_item_text; Type: DOMAIN; Schema: public; Owner: -
--

CREATE DOMAIN timeline_item_text AS text
	CONSTRAINT max_length CHECK (check_length_of_timeline_item_text(VALUE));


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE comments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    content comment_text NOT NULL,
    deleted_at timestamp without time zone DEFAULT 'infinity'::timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    reactionable_id uuid NOT NULL,
    reactionable_type text NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: timeline_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE timeline_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    item_text timeline_item_text DEFAULT ''::text NOT NULL,
    type text DEFAULT ''::text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: timeline_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY timeline_items
    ADD CONSTRAINT timeline_items_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_reactionable_id_and_reactionable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_reactionable_id_and_reactionable_type ON comments USING btree (reactionable_id, reactionable_type);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES
('20160910193731'),
('20160911092133'),
('20160911093911'),
('20160912100109'),
('20160912100841'),
('20160913084056'),
('20160913112504'),
('20160913112637');


