--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
    reactionable_type character varying NOT NULL,
    reactionable_id uuid NOT NULL,
    deleted_at timestamp without time zone DEFAULT 'infinity'::timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE likes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    reactionable_type character varying NOT NULL,
    reactionable_id uuid NOT NULL,
    liked_at timestamp with time zone DEFAULT now() NOT NULL,
    unliked_at timestamp with time zone DEFAULT 'infinity'::timestamp with time zone NOT NULL
);


--
-- Name: photos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE photos (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    url text NOT NULL,
    size double precision DEFAULT 0.0 NOT NULL,
    original_file_name text DEFAULT ''::text NOT NULL,
    deleted_at timestamp without time zone DEFAULT 'infinity'::timestamp without time zone NOT NULL,
    photo_timeline_item_id uuid NOT NULL
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
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone DEFAULT 'infinity'::timestamp without time zone NOT NULL,
    pinned_at timestamp without time zone,
    number_of_photos_attached integer DEFAULT 0
);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: timeline_items timeline_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY timeline_items
    ADD CONSTRAINT timeline_items_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_reactionable_id_and_reactionable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_reactionable_id_and_reactionable_type ON comments USING btree (reactionable_id, reactionable_type);


--
-- Name: index_comments_on_reactionable_type_and_reactionable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_reactionable_type_and_reactionable_id ON comments USING btree (reactionable_type, reactionable_id);


--
-- Name: index_likes_on_reactionable_id_and_reactionable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_likes_on_reactionable_id_and_reactionable_type ON likes USING btree (reactionable_id, reactionable_type);


--
-- Name: index_photos_on_photo_timeline_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_photos_on_photo_timeline_item_id ON photos USING btree (photo_timeline_item_id);


--
-- Name: index_photos_on_url; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_photos_on_url ON photos USING btree (url);


--
-- Name: photos fk_rails_ac6b523f09; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT fk_rails_ac6b523f09 FOREIGN KEY (photo_timeline_item_id) REFERENCES timeline_items(id);


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
('20160913112637'),
('20160914110751'),
('20160914112218'),
('20161015003836'),
('20170116103749'),
('20170202143619'),
('20170203154933'),
('20170205094940');


