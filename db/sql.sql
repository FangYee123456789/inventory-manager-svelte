--
-- PostgreSQL database dump
--

\restrict wn6t7thgPCJCexbf6CXCoeSlctGbjvtoYW0n2wIaMKxiC6bju24gXeaXwMQcbbE

-- Dumped from database version 17.6
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
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.role AS ENUM (
    'QS',
    'Procurement',
    'Project',
    'Admin'
);


ALTER TYPE public.role OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in',
    'like',
    'ilike',
    'is',
    'match',
    'imatch',
    'isdistinct'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text,
	negate boolean
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
begin
    if not exists (
        select 1
        from pg_event_trigger_ddl_commands() ev
        join pg_catalog.pg_extension e on ev.objid = e.oid
        where e.extname = 'pg_graphql'
    ) then
        return;
    end if;

    drop function if exists graphql_public.graphql;
    create or replace function graphql_public.graphql(
        "operationName" text default null,
        query text default null,
        variables jsonb default null,
        extensions jsonb default null
    )
        returns jsonb
        language sql
    as $$
        select graphql.resolve(
            query := query,
            variables := coalesce(variables, '{}'),
            "operationName" := "operationName",
            extensions := extensions
        );
    $$;

    -- Attach the wrapper to the extension so DROP EXTENSION cascades to it,
    -- which in turn triggers set_graphql_placeholder to reinstall the "not enabled" stub.
    alter extension pg_graphql add function graphql_public.graphql(text, text, jsonb, jsonb);

    grant usage on schema graphql to postgres, anon, authenticated, service_role;
    grant execute on function graphql.resolve to postgres, anon, authenticated, service_role;
    grant usage on schema graphql to postgres with grant option;
    grant usage on schema graphql_public to postgres with grant option;
end;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: graphql(text, text, jsonb, jsonb); Type: FUNCTION; Schema: graphql_public; Owner: supabase_admin
--

CREATE FUNCTION graphql_public.graphql("operationName" text DEFAULT NULL::text, query text DEFAULT NULL::text, variables jsonb DEFAULT NULL::jsonb, extensions jsonb DEFAULT NULL::jsonb) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;


ALTER FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) OWNER TO supabase_admin;

--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
    -- Regclass of the table e.g. public.notes
    entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

    -- I, U, D, T: insert, update ...
    action realtime.action = (
        case wal ->> 'action'
            when 'I' then 'INSERT'
            when 'U' then 'UPDATE'
            when 'D' then 'DELETE'
            else 'ERROR'
        end
    );

    -- Is row level security enabled for the table
    is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

    subscriptions realtime.subscription[] = array_agg(subs)
        from
            realtime.subscription subs
        where
            subs.entity = entity_
            -- Filter by action early - only get subscriptions interested in this action
            -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
            and (subs.action_filter = '*' or subs.action_filter = action::text);

    -- Subscription vars
    working_role regrole;
    working_selected_columns text[];
    claimed_role regrole;
    claims jsonb;

    subscription_id uuid;
    subscription_has_access bool;
    visible_to_subscription_ids uuid[] = '{}';

    -- structured info for wal's columns
    columns realtime.wal_column[];
    -- previous identity values for update/delete
    old_columns realtime.wal_column[];

    error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

    -- Primary jsonb output for record
    output jsonb;

    -- Loop record for iterating unique roles (outer loop)
    role_record record;
    -- Loop record for iterating unique selected_columns within a role (inner loop)
    cols_record record;
    -- Subscription ids visible at the role level (before fanning out by selected_columns)
    visible_role_sub_ids uuid[] = '{}';

begin
    perform set_config('role', null, true);

    columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'columns') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    old_columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'identity') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    for role_record in
        select claims_role
        from (select distinct claims_role from unnest(subscriptions)) t
        order by claims_role::text
    loop
        working_role := role_record.claims_role;

        -- Update `is_selectable` for columns and old_columns (once per role)
        columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(columns) c;

        old_columns =
                array_agg(
                    (
                        c.name,
                        c.type_name,
                        c.type_oid,
                        c.value,
                        c.is_pkey,
                        pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                    )::realtime.wal_column
                )
                from
                    unnest(old_columns) c;

        if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
            -- Fan out 400 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 400: Bad Request, no primary key']
                )::realtime.wal_rls;
            end loop;

        -- The claims role does not have SELECT permission to the primary key of entity
        elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
            -- Fan out 401 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 401: Unauthorized']
                )::realtime.wal_rls;
            end loop;

        else
            -- Create the prepared statement (once per role)
            if is_rls_enabled and action <> 'DELETE' then
                if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                    deallocate walrus_rls_stmt;
                end if;
                execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
            end if;

            -- Collect all visible subscription IDs for this role (filter check + RLS check)
            visible_role_sub_ids = '{}';

            for subscription_id, claims in (
                    select
                        subs.subscription_id,
                        subs.claims
                    from
                        unnest(subscriptions) subs
                    where
                        subs.entity = entity_
                        and subs.claims_role = working_role
                        and (
                            realtime.is_visible_through_filters(columns, subs.filters)
                            or (
                              action = 'DELETE'
                              and realtime.is_visible_through_filters(old_columns, subs.filters)
                            )
                        )
            ) loop

                if not is_rls_enabled or action = 'DELETE' then
                    visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                else
                    -- Check if RLS allows the role to see the record
                    perform
                        -- Trim leading and trailing quotes from working_role because set_config
                        -- doesn't recognize the role as valid if they are included
                        set_config('role', trim(both '"' from working_role::text), true),
                        set_config('request.jwt.claims', claims::text, true);

                    execute 'execute walrus_rls_stmt' into subscription_has_access;

                    if subscription_has_access then
                        visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                    end if;
                end if;
            end loop;

            perform set_config('role', null, true);

            -- Inner loop: per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;

                output = jsonb_build_object(
                    'schema', wal ->> 'schema',
                    'table', wal ->> 'table',
                    'type', action,
                    'commit_timestamp', to_char(
                        ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                        'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
                    ),
                    'columns', (
                        select
                            jsonb_agg(
                                jsonb_build_object(
                                    'name', pa.attname,
                                    'type', pt.typname
                                )
                                order by pa.attnum asc
                            )
                        from
                            pg_attribute pa
                            join pg_type pt
                                on pa.atttypid = pt.oid
                            left join (
                                select unnest(conkey) as pkey_attnum
                                from pg_constraint
                                where conrelid = entity_ and contype = 'p'
                            ) pk on pk.pkey_attnum = pa.attnum
                        where
                            attrelid = entity_
                            and attnum > 0
                            and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
                            and (working_selected_columns is null or pa.attname = any(working_selected_columns) or pk.pkey_attnum is not null)
                    )
                )
                -- Add "record" key for insert and update
                || case
                    when action in ('INSERT', 'UPDATE') then
                        jsonb_build_object(
                            'record',
                            (
                                select
                                    jsonb_object_agg(
                                        -- if unchanged toast, get column name and value from old record
                                        coalesce((c).name, (oc).name),
                                        case
                                            when (c).name is null then (oc).value
                                            else (c).value
                                        end
                                    )
                                from
                                    unnest(columns) c
                                    full outer join unnest(old_columns) oc
                                        on (c).name = (oc).name
                                where
                                    coalesce((c).is_selectable, (oc).is_selectable)
                                    and (working_selected_columns is null or coalesce((c).name, (oc).name) = any(working_selected_columns) or coalesce((c).is_pkey, (oc).is_pkey))
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            )
                        )
                    else '{}'::jsonb
                end
                -- Add "old_record" key for update and delete
                || case
                    when action = 'UPDATE' then
                        jsonb_build_object(
                                'old_record',
                                (
                                    select jsonb_object_agg((c).name, (c).value)
                                    from unnest(old_columns) c
                                    where
                                        (c).is_selectable
                                        and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                        and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                )
                            )
                    when action = 'DELETE' then
                        jsonb_build_object(
                            'old_record',
                            (
                                select jsonb_object_agg((c).name, (c).value)
                                from unnest(old_columns) c
                                where
                                    (c).is_selectable
                                    and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                    and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                            )
                        )
                    else '{}'::jsonb
                end;

                -- Filter visible_role_sub_ids to those matching the current selected_columns group
                visible_to_subscription_ids = coalesce(
                    (
                        select array_agg(s.subscription_id)
                        from unnest(subscriptions) s
                        where s.claims_role = working_role
                          and (s.selected_columns is not distinct from working_selected_columns)
                          and s.subscription_id = any(visible_role_sub_ids)
                    ),
                    '{}'::uuid[]
                );

                return next (
                    output,
                    is_rls_enabled,
                    visible_to_subscription_ids,
                    case
                        when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                        else '{}'
                    end
                )::realtime.wal_rls;
            end loop;

        end if;
    end loop;

    perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
/*
Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
*/
declare
    op_symbol text = (
        case
            when op = 'eq' then '='
            when op = 'neq' then '!='
            when op = 'lt' then '<'
            when op = 'lte' then '<='
            when op = 'gt' then '>'
            when op = 'gte' then '>='
            when op = 'in' then '= any'
            else 'UNKNOWN OP'
        end
    );
    res boolean;
begin
    execute format(
        'select %L::'|| type_::text || ' ' || op_symbol
        || ' ( %L::'
        || (
            case
                when op = 'in' then type_::text || '[]'
                else type_::text end
        )
        || ')', val_1, val_2) into res;
    return res;
end;
$$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text, negate boolean) RETURNS boolean
    LANGUAGE plpgsql STABLE
    AS $$
declare
    op_symbol text;
    res boolean;
begin
    -- IS DISTINCT FROM / IS NOT DISTINCT FROM: infix, both sides typed literals
    if op = 'isdistinct' then
        execute format(
            'select %L::%s %s %L::%s',
            val_1,
            type_::text,
            case when negate then 'IS NOT DISTINCT FROM' else 'IS DISTINCT FROM' end,
            val_2,
            type_::text
        ) into res;
        return res;
    end if;

    -- IS requires a keyword RHS (NULL, TRUE, FALSE, UNKNOWN), not a typed literal
    if op = 'is' then
        if val_2 not in ('null', 'true', 'false', 'unknown') then
            raise exception 'invalid value for is filter: must be null, true, false, or unknown';
        end if;
        execute format(
            'select %L::%s %s %s',
            val_1,
            type_::text,
            case when negate then 'IS NOT' else 'IS' end,
            upper(val_2)
        ) into res;
        return res;
    end if;

    op_symbol = case
        when op = 'eq'    then '='
        when op = 'neq'   then '!='
        when op = 'lt'    then '<'
        when op = 'lte'   then '<='
        when op = 'gt'    then '>'
        when op = 'gte'   then '>='
        when op = 'in'    then '= any'
        when op = 'like'   then 'LIKE'
        when op = 'ilike'  then 'ILIKE'
        when op = 'match'  then '~'
        when op = 'imatch' then '~*'
        else null
    end;

    if op_symbol is null then
        raise exception 'unsupported equality operator: %', op::text;
    end if;

    execute format(
        'select %L::%s %s (%L::%s)',
        val_1,
        type_::text,
        op_symbol,
        val_2,
        case when op = 'in' then type_::text || '[]' else type_::text end
    ) into res;

    return case when negate then not res else res end;
end;
$$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text, negate boolean) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
    select
        filters is null
        or array_length(filters, 1) is null
        or coalesce(
            count(col.name) = count(1)
            and sum(
                realtime.check_equality_op(
                    op:=f.op,
                    type_:=coalesce(col.type_oid::regtype, col.type_name::regtype),
                    val_1:=col.value #>> '{}',
                    val_2:=f.value,
                    negate:=coalesce(f.negate, false)
                )::int
            ) filter (where col.name is not null) = count(col.name),
            false
        )
    from
        unnest(filters) f
        left join unnest(columns) col
            on f.column_name = col.name;
$$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS TABLE(wal jsonb, is_rls_enabled boolean, subscription_ids uuid[], errors text[], slot_changes_count bigint)
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
  WITH pub AS (
    SELECT
      concat_ws(
        ',',
        CASE WHEN bool_or(pubinsert) THEN 'insert' ELSE NULL END,
        CASE WHEN bool_or(pubupdate) THEN 'update' ELSE NULL END,
        CASE WHEN bool_or(pubdelete) THEN 'delete' ELSE NULL END
      ) AS w2j_actions,
      coalesce(
        string_agg(
          realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
          ','
        ) filter (WHERE ppt.tablename IS NOT NULL),
        ''
      ) AS w2j_add_tables
    FROM pg_publication pp
    LEFT JOIN pg_publication_tables ppt ON pp.pubname = ppt.pubname
    WHERE pp.pubname = publication
    GROUP BY pp.pubname
    LIMIT 1
  ),
  -- MATERIALIZED ensures pg_logical_slot_get_changes is called exactly once
  w2j AS MATERIALIZED (
    SELECT x.*, pub.w2j_add_tables
    FROM pub,
         pg_logical_slot_get_changes(
           slot_name, null, max_changes,
           'include-pk', 'true',
           'include-transaction', 'false',
           'include-timestamp', 'true',
           'include-type-oids', 'true',
           'format-version', '2',
           'actions', pub.w2j_actions,
           'add-tables', pub.w2j_add_tables
         ) x
  ),
  slot_count AS (
    SELECT count(*)::bigint AS cnt
    FROM w2j
    WHERE w2j.w2j_add_tables <> ''
  ),
  rls_filtered AS (
    SELECT xyz.wal, xyz.is_rls_enabled, xyz.subscription_ids, xyz.errors
    FROM w2j,
         realtime.apply_rls(
           wal := w2j.data::jsonb,
           max_record_bytes := max_record_bytes
         ) xyz(wal, is_rls_enabled, subscription_ids, errors)
    WHERE w2j.w2j_add_tables <> ''
      AND xyz.subscription_ids[1] IS NOT NULL
  )
  SELECT rf.wal, rf.is_rls_enabled, rf.subscription_ids, rf.errors, sc.cnt
  FROM rls_filtered rf, slot_count sc

  UNION ALL

  SELECT null, null, null, null, sc.cnt
  FROM slot_count sc
  WHERE NOT EXISTS (SELECT 1 FROM rls_filtered)
$$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  SELECT
    realtime.wal2json_escape_identifier(nsp.nspname::text)
    || '.'
    || realtime.wal2json_escape_identifier(pc.relname::text)
  FROM pg_class pc
  JOIN pg_namespace nsp ON pc.relnamespace = nsp.oid
  WHERE pc.oid = entity
$$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      RAISE WARNING 'WarnSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: send_binary(bytea, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
BEGIN
  BEGIN
    generated_id := gen_random_uuid();

    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    INSERT INTO realtime.messages (id, binary_payload, event, topic, private, extension)
    VALUES (generated_id, payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      RAISE WARNING 'WarnSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
    col_names text[] = coalesce(
            array_agg(a.attname order by a.attnum),
            '{}'::text[]
        )
        from
            pg_catalog.pg_attribute a
        where
            a.attrelid = new.entity
            and a.attnum > 0
            and not a.attisdropped
            and pg_catalog.has_column_privilege(
                (new.claims ->> 'role'),
                a.attrelid,
                a.attnum,
                'SELECT'
            );
    filter realtime.user_defined_filter;
    col_type regtype;
    in_val jsonb;
    selected_col text;
begin
    for filter in select * from unnest(new.filters) loop
        if not filter.column_name = any(col_names) then
            raise exception 'invalid column for filter %', filter.column_name;
        end if;

        col_type = (
            select atttypid::regtype
            from pg_catalog.pg_attribute
            where attrelid = new.entity
                  and attname = filter.column_name
        );
        if col_type is null then
            raise exception 'failed to lookup type for column %', filter.column_name;
        end if;

        if filter.op = 'in'::realtime.equality_op then
            in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
            if coalesce(jsonb_array_length(in_val), 0) > 100 then
                raise exception 'too many values for `in` filter. Maximum 100';
            end if;
        elsif filter.op = 'is'::realtime.equality_op then
            -- `is` requires a keyword RHS rather than a typed literal
            if filter.value not in ('null', 'true', 'false', 'unknown') then
                raise exception 'invalid value for is filter: must be null, true, false, or unknown';
            end if;
            -- IS NULL works for any type, but IS TRUE/FALSE/UNKNOWN require a boolean
            -- operand. Reject the non-null keywords on non-boolean columns here so they
            -- don't abort apply_rls at WAL time.
            if filter.value <> 'null' and col_type <> 'boolean'::regtype then
                raise exception 'is % filter requires a boolean column, got %', filter.value, col_type::text;
            end if;
        elsif filter.op in ('like'::realtime.equality_op, 'ilike'::realtime.equality_op) then
            -- like/ilike apply the text pattern operator (~~); reject column types that
            -- have no such operator instead of failing at WAL time
            if not exists (
                select 1 from pg_catalog.pg_operator
                where oprname = '~~' and oprleft = col_type
            ) then
                raise exception 'operator % requires a text-compatible column type, got %', filter.op::text, col_type::text;
            end if;
        elsif filter.op in ('match'::realtime.equality_op, 'imatch'::realtime.equality_op) then
            -- match/imatch apply the regex operators ~ / ~*; reject column types that have
            -- no such operator (e.g. integer) instead of failing at WAL time, mirroring the
            -- like/ilike guard above.
            if not exists (
                select 1 from pg_catalog.pg_operator
                where oprname = case when filter.op = 'imatch'::realtime.equality_op then '~*' else '~' end
                  and oprleft = col_type
                  and oprright = col_type
                  and oprresult = 'boolean'::regtype
            ) then
                raise exception 'operator % requires a text-compatible column type, got %', filter.op::text, col_type::text;
            end if;
            -- validate the regex eagerly so a bad pattern is rejected here, not inside
            -- apply_rls where it would abort the WAL stream for the entity
            begin
                perform '' ~ filter.value;
            exception when others then
                raise exception 'invalid regular expression for % filter: %', filter.op::text, sqlerrm;
            end;
        else
            -- eq/neq/lt/lte/gt/gte: value must be coercable to the type
            perform realtime.cast(filter.value, col_type);
        end if;
    end loop;

    if new.selected_columns is not null then
        for selected_col in select * from unnest(new.selected_columns) loop
            if not selected_col = any(col_names) then
                raise exception 'invalid column for select %', selected_col;
            end if;
        end loop;
    end if;

    -- Apply consistent order to filters so the unique constraint can't be tricked by a
    -- different filter order. negate is part of the sort key.
    new.filters = coalesce(
        array_agg(f order by f.column_name, f.op, f.value, f.negate),
        '{}'
    ) from unnest(new.filters) f;

    new.selected_columns = (
        select array_agg(c order by c)
        from unnest(new.selected_columns) c
    );

    return new;
end;
$$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: wal2json_escape_identifier(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.wal2json_escape_identifier(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  -- Prefix `\`, `,`, `.`, and any whitespace with `\`
  SELECT regexp_replace(name, '([\\,.[:space:]])', '\\\1', 'g')
$$;


ALTER FUNCTION realtime.wal2json_escape_identifier(name text) OWNER TO supabase_admin;

--
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_any_operation(expected_operations text[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT CASE
      WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
      ELSE raw_operation
    END AS current_operation
    FROM current_operation
  )
  SELECT EXISTS (
    SELECT 1
    FROM normalized n
    CROSS JOIN LATERAL unnest(expected_operations) AS expected_operation
    WHERE expected_operation IS NOT NULL
      AND expected_operation <> ''
      AND n.current_operation = CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END
  );
$$;


ALTER FUNCTION storage.allow_any_operation(expected_operations text[]) OWNER TO supabase_storage_admin;

--
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_only_operation(expected_operation text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT
      CASE
        WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
        ELSE raw_operation
      END AS current_operation,
      CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END AS requested_operation
    FROM current_operation
  )
  SELECT CASE
    WHEN requested_operation IS NULL OR requested_operation = '' THEN FALSE
    ELSE COALESCE(current_operation = requested_operation, FALSE)
  END
  FROM normalized;
$$;


ALTER FUNCTION storage.allow_only_operation(expected_operation text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Get the last path segment (the actual filename)
    SELECT _parts[array_length(_parts, 1)] INTO _filename;
    -- Extract extension: reverse, split on '.', then reverse again
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint)::bigint as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    custom_claims_allowlist text[] DEFAULT '{}'::text[] NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_challenges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    challenge_type text NOT NULL,
    session_data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    CONSTRAINT webauthn_challenges_challenge_type_check CHECK ((challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])))
);


ALTER TABLE auth.webauthn_challenges OWNER TO supabase_auth_admin;

--
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_credentials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    credential_id bytea NOT NULL,
    public_key bytea NOT NULL,
    attestation_type text DEFAULT ''::text NOT NULL,
    aaguid uuid,
    sign_count bigint DEFAULT 0 NOT NULL,
    transports jsonb DEFAULT '[]'::jsonb NOT NULL,
    backup_eligible boolean DEFAULT false NOT NULL,
    backed_up boolean DEFAULT false NOT NULL,
    friendly_name text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone
);


ALTER TABLE auth.webauthn_credentials OWNER TO supabase_auth_admin;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name public.citext NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: incoming_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incoming_items (
    transaction_id bigint NOT NULL,
    item_id bigint NOT NULL,
    quantity bigint NOT NULL,
    CONSTRAINT chk_natural CHECK ((quantity > 0))
);


ALTER TABLE public.incoming_items OWNER TO postgres;

--
-- Name: incoming_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incoming_transactions (
    id bigint NOT NULL,
    logger_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    delivery_date date DEFAULT CURRENT_DATE NOT NULL,
    supplier_id bigint NOT NULL,
    delivery_ref public.citext,
    purchase_ref public.citext,
    invoice_ref public.citext
);


ALTER TABLE public.incoming_transactions OWNER TO postgres;

--
-- Name: incoming_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.incoming_transactions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.incoming_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    name public.citext NOT NULL,
    category_id bigint DEFAULT 107 NOT NULL,
    thumbnail text DEFAULT 'https://dummyimage.com/600x400/000/fff'::text NOT NULL,
    gallery jsonb,
    master_number text NOT NULL,
    initial_quantity bigint DEFAULT 0 NOT NULL,
    last_stocked timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    minimum_quantity bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: outgoing_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outgoing_items (
    transaction_id bigint NOT NULL,
    item_id bigint NOT NULL,
    quantity bigint NOT NULL,
    CONSTRAINT chk_natural CHECK ((quantity > 0))
);


ALTER TABLE public.outgoing_items OWNER TO postgres;

--
-- Name: net_quantity; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.net_quantity AS
 SELECT i.item_id,
    COALESCE(inc.total_incoming, (0)::numeric) AS incoming_quantity,
    COALESCE("out".total_outgoing, (0)::numeric) AS outgoing_quantity,
    (COALESCE(inc.total_incoming, (0)::numeric) - COALESCE("out".total_outgoing, (0)::numeric)) AS net
   FROM ((( SELECT incoming_items.item_id
           FROM public.incoming_items
        UNION
         SELECT outgoing_items.item_id
           FROM public.outgoing_items) i
     LEFT JOIN ( SELECT incoming_items.item_id,
            sum(incoming_items.quantity) AS total_incoming
           FROM public.incoming_items
          GROUP BY incoming_items.item_id) inc ON ((i.item_id = inc.item_id)))
     LEFT JOIN ( SELECT outgoing_items.item_id,
            sum(outgoing_items.quantity) AS total_outgoing
           FROM public.outgoing_items
          GROUP BY outgoing_items.item_id) "out" ON ((i.item_id = "out".item_id)));


ALTER VIEW public.net_quantity OWNER TO postgres;

--
-- Name: outgoing_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outgoing_transactions (
    id bigint NOT NULL,
    logger_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expend_date date DEFAULT CURRENT_DATE NOT NULL,
    expender text,
    remarks text
);


ALTER TABLE public.outgoing_transactions OWNER TO postgres;

--
-- Name: outgoing_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.outgoing_transactions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.outgoing_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: quantity_trend; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.quantity_trend AS
 WITH combined_items AS (
         SELECT i_1.item_id,
            i_1.quantity,
            (date_trunc('week'::text, (t.delivery_date)::timestamp with time zone))::date AS week_starting
           FROM (public.incoming_items i_1
             JOIN public.incoming_transactions t ON ((i_1.transaction_id = t.id)))
        UNION ALL
         SELECT out_i.item_id,
            (out_i.quantity * '-1'::integer) AS quantity,
            (date_trunc('week'::text, (out_t.expend_date)::timestamp with time zone))::date AS week_starting
           FROM (public.outgoing_items out_i
             JOIN public.outgoing_transactions out_t ON ((out_i.transaction_id = out_t.id)))
        )
 SELECT i.id,
    (COALESCE((ci.week_starting)::timestamp with time zone, date_trunc('week'::text, i.last_stocked)))::date AS week_starting,
    ((i.initial_quantity)::numeric + sum(COALESCE(sum(ci.quantity), (0)::numeric)) OVER (PARTITION BY i.id ORDER BY ci.week_starting ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) AS cumulative_net_quantity
   FROM (combined_items ci
     RIGHT JOIN public.items i ON ((ci.item_id = i.id)))
  GROUP BY ci.week_starting, i.initial_quantity, i.id, i.last_stocked
  ORDER BY i.id, ci.week_starting;


ALTER VIEW public.quantity_trend OWNER TO postgres;

--
-- Name: quantity_trend_timeline; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.quantity_trend_timeline AS
 WITH RECURSIVE time_spine AS (
         SELECT (date_bin('7 days'::interval, (min(t.min_date))::timestamp without time zone, '2026-06-26 00:00:00'::timestamp without time zone))::date AS week_starting,
            (date_bin('7 days'::interval, (CURRENT_DATE)::timestamp without time zone, '2026-06-26 00:00:00'::timestamp without time zone))::date AS max_date
           FROM ( SELECT min(incoming_transactions.delivery_date) AS min_date
                   FROM public.incoming_transactions
                UNION ALL
                 SELECT min(outgoing_transactions.expend_date) AS min
                   FROM public.outgoing_transactions) t
        UNION ALL
         SELECT ((time_spine.week_starting + '7 days'::interval))::date AS date,
            time_spine.max_date
           FROM time_spine
          WHERE (time_spine.week_starting < time_spine.max_date)
        ), item_weeks AS (
         SELECT i.id AS item_id,
            i.master_number,
            i.name,
            i.initial_quantity,
            ts.week_starting
           FROM (public.items i
             CROSS JOIN time_spine ts)
        ), weekly_activity AS (
         SELECT sub.item_id,
            sub.week_starting,
            sum(sub.quantity) AS weekly_net
           FROM ( SELECT i.item_id,
                    i.quantity,
                    (date_bin('7 days'::interval, (t.delivery_date)::timestamp without time zone, '2026-06-26 00:00:00'::timestamp without time zone))::date AS week_starting
                   FROM (public.incoming_items i
                     JOIN public.incoming_transactions t ON ((i.transaction_id = t.id)))
                UNION ALL
                 SELECT out_i.item_id,
                    (out_i.quantity * '-1'::integer) AS quantity,
                    (date_bin('7 days'::interval, (out_t.expend_date)::timestamp without time zone, '2026-06-26 00:00:00'::timestamp without time zone))::date AS week_starting
                   FROM (public.outgoing_items out_i
                     JOIN public.outgoing_transactions out_t ON ((out_i.transaction_id = out_t.id)))) sub
          GROUP BY sub.item_id, sub.week_starting
        )
 SELECT iw.item_id AS id,
    iw.master_number,
    iw.name,
    iw.week_starting,
    ((iw.initial_quantity)::numeric + COALESCE(sum(wa.weekly_net) OVER (PARTITION BY iw.item_id ORDER BY iw.week_starting ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), (0)::numeric)) AS cumulative_net_quantity
   FROM (item_weeks iw
     LEFT JOIN weekly_activity wa ON (((iw.item_id = wa.item_id) AND (iw.week_starting = wa.week_starting))))
  ORDER BY iw.item_id, iw.week_starting;


ALTER VIEW public.quantity_trend_timeline OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id text NOT NULL,
    secret_hash bytea NOT NULL,
    created_at integer NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    id bigint NOT NULL,
    name public.citext NOT NULL
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.suppliers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email public.citext NOT NULL,
    name public.citext NOT NULL,
    password_hash text NOT NULL,
    role public.role NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    selected_columns text[],
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb,
    metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at, custom_claims_allowlist) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
20260302000000
20260625000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
106	Tools
111	General Material
140	Adhesive and Silicon
\.


--
-- Data for Name: incoming_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incoming_items (transaction_id, item_id, quantity) FROM stdin;
87	251	12
87	254	6
87	255	4
87	260	4
88	261	4
88	262	4
88	263	4
88	264	12
88	204	12
89	203	1
90	205	3
91	252	72
92	247	48
92	292	24
92	249	4
92	250	4
92	257	24
92	258	24
92	270	8
92	271	8
92	197	24
92	198	4
106	268	1
108	277	6
109	242	20
109	243	20
110	276	60
111	259	32
112	193	6
112	274	10
112	276	10
113	277	39
114	265	16
114	193	24
114	216	50
114	220	1440
114	221	50
114	225	384
114	231	4
114	245	16
114	269	4
114	274	32
114	211	1
115	290	1
116	224	72
116	227	1
116	239	20
118	228	200
118	214	900
118	215	200
82	252	24
119	275	2
120	233	24
121	248	80
121	226	4
121	235	2
121	273	80
121	212	5
123	223	50
86	219	12
86	251	12
86	254	10
86	255	12
86	256	16
86	260	12
86	266	4
86	267	4
123	229	100
124	207	2
124	208	1
124	209	1
125	199	1
125	200	1
125	201	1
125	202	1
126	221	50
126	224	180
126	238	12
127	218	10
128	270	8
129	224	252
130	276	90
131	232	1500
132	222	50
132	239	10
133	235	10
133	245	30
134	222	300
134	223	300
134	238	100
134	239	100
135	213	1
136	228	1000
137	220	21
138	248	10
138	216	8
138	224	9
138	226	5
138	246	2
138	197	96
139	226	2
139	227	1
140	280	1
141	262	10
141	266	10
142	205	6
143	229	800
144	216	250
145	276	240
146	210	1
147	205	1
150	241	2
150	194	2
150	195	2
150	288	2
150	196	2
150	286	2
150	287	2
151	248	40
151	219	16
151	220	20
151	226	4
151	231	1
151	233	20
151	245	30
151	249	2
152	225	8
153	248	40
153	224	7
153	226	4
153	228	1000
153	233	20
153	241	2
153	245	5
153	246	3
153	272	4
153	273	3
156	266	4
126	216	30
174	227	1
153	220	18
174	224	72
174	239	20
176	224	252
177	221	50
178	216	30
178	221	50
178	224	180
178	238	12
179	248	80
112	220	2
112	225	4
179	226	4
179	273	80
179	212	1
179	235	2
180	265	16
180	193	24
180	216	50
180	220	40
180	221	50
180	225	16
180	231	4
180	245	16
180	269	4
180	274	32
180	211	4
181	245	30
181	235	10
182	228	1000
183	226	2
183	227	1
185	248	10
185	216	8
185	224	9
185	226	5
185	246	2
185	197	4
186	280	1
187	286	2
187	287	2
187	241	2
187	194	2
187	195	2
187	288	2
187	196	2
188	282	1
189	220	2
189	224	18
189	215	1000
\.


--
-- Data for Name: incoming_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incoming_transactions (id, logger_id, created_at, delivery_date, supplier_id, delivery_ref, purchase_ref, invoice_ref) FROM stdin;
156	11	2026-07-03 03:17:43.352+00	2026-06-29	154	2606203	\N	\N
183	11	2026-07-10 07:43:52.721+00	2026-05-20	184	D06/26/01827	2026-04/1168	06/2605/003
177	11	2026-07-10 07:10:32.885+00	2026-04-16	184	2026-04/1132	2026-04/1132	06/2604/066
178	11	2026-07-10 07:14:56.14+00	2026-04-16	184	D06/26/01766	2026-04/1132	06/2604/066
119	1	2026-06-29 19:34:04.765+00	2026-04-09	184	D06/26/01719	2026-04/1132	06/2604/089
121	1	2026-06-29 19:35:28.178+00	2026-04-09	184	D06-26/01766	2026-04-1132	06/2604/066
179	11	2026-07-10 07:21:48.422+00	2026-04-09	184	D06/26/01723	2026-04/1120(R1)	06/2604/067
185	11	2026-07-10 07:55:48.233+00	2026-05-20	184	D06/26/01826	2026-04/1168	06/2605/003
114	1	2026-06-29 19:28:09.02+00	2026-04-06	184	D06/26/01723	2026-04/1120(R1))	\N
120	1	2026-06-29 19:34:35.812+00	2026-04-09	184	D06/26/01721	\N	06/2604/067
180	11	2026-07-10 07:33:27.372+00	2026-04-06	184	D06/26/01701	2026-04/1102(R4)	06/2604/053
116	1	2026-06-29 19:30:17.698+00	2026-04-08	184	D06/26/01716	\N	\N
82	1	2026-06-26 06:55:03.456+00	2026-03-25	154	2603174	\N	\N
174	11	2026-07-10 06:56:49.963+00	2026-04-08	184	D06/26/01715	2026-05/1199	06/2604/031
186	11	2026-07-10 07:56:46.521+00	2026-05-20	184	D06/26/01828	2026-04/1165	06/2605/002
189	11	2026-07-10 08:16:22.787+00	2026-06-24	184	D06/26/02076	2026-06/1298	06/2606/113
86	1	2026-06-26 07:45:54.429+00	2026-03-30	154	2603201	\N	\N
87	1	2026-06-26 07:50:16.8+00	2026-03-31	154	2603211	\N	\N
88	1	2026-06-26 07:51:22.47+00	2026-04-02	154	2604013	\N	\N
89	1	2026-06-26 07:52:05.702+00	2026-04-02	152	DO26-000764	\N	\N
90	1	2026-06-26 07:52:35.207+00	2026-04-02	152	DO26-000756	\N	\N
91	1	2026-06-26 07:53:11.902+00	2026-04-09	154	2604047	\N	\N
92	1	2026-06-26 07:54:40.095+00	2026-04-06	164	1189836	\N	\N
126	1	2026-06-29 19:41:10.006+00	2026-04-16	184	D06/26/01715	2026-05/1199	06/2604/031
133	1	2026-06-29 19:44:24.868+00	2026-04-24	184	D06/26/01721	2026-04/1102(R4)	06/2604/053
181	11	2026-07-10 07:37:19.198+00	2026-04-24	184	D06/26/01799	2026-04/1159	06/2604/106
150	1	2026-06-29 19:53:22.629+00	2026-06-04	184	D06/26/01826	2026-04/1168	06/2605/003
136	1	2026-06-29 19:45:46.829+00	2026-04-28	184	D06/26/01799	2026-04/1159	06/2604/106
182	11	2026-07-10 07:40:25.608+00	2026-04-28	184	D06/26/01812	2026-04/1164	06/2604/116
176	11	2026-07-10 07:07:58.156+00	2026-04-17	184	D06/26/01769	2026-04/1132	06/2604/089
187	11	2026-07-10 08:00:56.587+00	2026-06-04	184	D06/26/01967	2026-06/1249	06/2606/010
188	11	2026-07-10 08:02:36.245+00	2026-06-05	184	D06/26/01968	2026-06/1248	06/2606/016
139	1	2026-06-29 19:47:37.666+00	2026-05-02	184	D06/26/01812	2026-04/1164	06/2604/116
106	1	2026-06-29 19:20:00.577+00	2026-04-06	152	DO26-000766	\N	\N
151	1	2026-06-29 19:54:39.685+00	2026-06-05	184	D06/26/01969	2026-06/1251	06/2606/015
108	1	2026-06-29 19:21:54.252+00	2026-03-27	165		\N	\N
109	1	2026-06-29 19:22:46.876+00	2026-03-30	181		\N	\N
110	1	2026-06-29 19:23:32.232+00	2026-04-06	182		\N	\N
111	1	2026-06-29 19:23:58.215+00	2026-04-08	183	9106106392	\N	\N
113	1	2026-06-29 19:26:15.911+00	2026-04-06	185		\N	\N
115	1	2026-06-29 19:29:19.17+00	2026-04-06	184	D06/26/01703	\N	\N
118	1	2026-06-29 19:33:35.589+00	2026-04-08	184	POS05/26/10697	\N	\N
153	1	2026-06-29 19:56:32.047+00	2026-06-22	184	D06/26/02055	2026-06/1298	06/2606/113
123	1	2026-06-29 19:38:35.197+00	2026-04-14	182		\N	\N
124	1	2026-06-29 19:39:23.719+00	2026-04-15	196		\N	\N
125	1	2026-06-29 19:40:04.14+00	2026-04-16	154	2604094	\N	\N
127	1	2026-06-29 19:41:36.047+00	2026-04-17	199	SGSDO-00196490	\N	\N
128	1	2026-06-29 19:42:00.524+00	2026-04-16	200		\N	\N
129	1	2026-06-29 19:42:24.677+00	2026-04-18	184		\N	\N
130	1	2026-06-29 19:42:52.091+00	2026-04-20	182		\N	\N
131	1	2026-06-29 19:43:19.165+00	2026-04-17	182		\N	\N
132	1	2026-06-29 19:43:50.47+00	2026-04-21	182		\N	\N
134	1	2026-06-29 19:44:57.504+00	2026-04-27	182		\N	\N
135	1	2026-06-29 19:45:22.682+00	2026-04-27	207	D026-000944	\N	\N
137	1	2026-06-29 19:46:01.275+00	2026-04-29	182		\N	\N
138	1	2026-06-29 19:47:02.411+00	2026-05-02	184	D06/26/01826	\N	\N
140	1	2026-06-29 19:47:54.66+00	2026-05-02	184	D06/26/01828	\N	\N
141	1	2026-06-29 19:48:27.621+00	2026-05-04	154	2605001	\N	\N
142	1	2026-06-29 19:48:51.905+00	2026-05-05	207	D026-001006	\N	\N
143	1	2026-06-29 19:49:10.591+00	2026-05-13	182		\N	\N
144	1	2026-06-29 19:49:26.39+00	2026-05-14	182		\N	\N
145	1	2026-06-29 19:49:49.203+00	2026-05-18	182		\N	\N
146	1	2026-06-29 19:50:18.746+00	2026-06-04	154	2606020	\N	\N
147	1	2026-06-29 19:50:39.076+00	2026-06-04	152	DO26-001233	\N	\N
112	1	2026-06-29 19:25:40.655+00	2026-03-30	184	D06/26/01672	2026-05/1197	06/2603/102
152	1	2026-06-29 19:55:08.631+00	2026-06-06	184	D06/26/01974	2026-06/1255	06/2606/017
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, name, category_id, thumbnail, gallery, master_number, initial_quantity, last_stocked, disabled, minimum_quantity) FROM stdin;
214	Silver stainless steel, cabinet screw M4 x 25 mm	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_214_1782450870582.webp	\N	118	0	2026-07-08 05:08:48.479+00	f	0
194	2" Putty Scrapers Stainless Steel	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_194_1782449475424.webp	\N	100a	0	2026-07-10 08:00:56.983+00	f	0
205	Wearmax Ekolac 2000 W/B PU Varnish-clear matt 10% 5L	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_205_1782450646461.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782450646572.webp"}]	110	0	2026-07-08 05:39:58.376+00	f	0
212	1" painter  tape	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_212_1782450779651.webp	\N	115	0	2026-07-10 07:21:48.805+00	f	0
218	WA202 WALL ADHESIVE | Goodrich Global 5KG	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_218_1782450946230.webp	\N	123	0	2026-07-08 06:16:30.214+00	f	0
195	4" Putty Scrapers Stainless Steel	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_195_1782449491272.webp	\N	100b	0	2026-07-10 08:00:56.983+00	f	0
227	GLOVE DISPOSABLE POWDERED LATEX GLOVES BRAND: ASSURE. SIZE: S/M/(L)/XL (100PCS/BOX)	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_227_1782447205964.webp	\N	25	0	2026-07-10 07:43:53.108+00	f	0
196	8" wall paper Scrapers Stainless Steel	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_196_1782449531725.webp	\N	100d	0	2026-07-10 08:00:56.983+00	f	0
211	Polybest Putty 4KG	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_211_1782450760306.webp	\N	114	0	2026-07-10 07:33:27.764+00	f	0
222	CL33 ; Sandpaper Grade 180	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_222_1782447106551.webp	\N	20	0	2026-07-08 04:59:46.109+00	f	0
221	TURBO SEALING TAPE (PLUMBER TAPE) 1/2"X0.075X10M	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_221_1782447083509.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782447084693.webp"}]	18	0	2026-07-10 07:33:27.764+00	f	0
226	Garbage Bag Black 36" x 48" Per Pack 25 PCS	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_226_1782447188615.webp	\N	24	0	2026-07-10 07:55:48.613+00	f	0
208	Miles CKT 380 ( 1L) - Red	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_208_1782450703674.webp	\N	112b	0	2026-06-29 19:39:23.912+00	f	0
230	Measurement Cup 2000ML	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_230_1782447281150.webp	\N	28	0	2026-06-25 03:38:04.538983+00	f	0
234	3M 1600 WHITE FOAM TAPE 20MM X 5M PER ROLL	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_234_1782447401063.webp	\N	36	0	2026-06-25 03:38:04.538983+00	f	0
236	CUTTER NT A300GRP METAL GRIP	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_236_1782447447014.webp	[]	41	0	2026-06-25 03:38:04.538983+00	f	0
206	Colorland Metallic Pearl Pure Champagne 1L/5L	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_206_1782450663665.webp	\N	111	0	2026-06-25 03:38:04.538983+00	f	0
199	5L AsiaPaint /colorland 4 Based colour,Red	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_199_1782449593020.webp	\N	104	0	2026-06-29 19:40:04.33+00	f	0
200	5L AsiaPaint /colorland 4 Based colour, Yellow	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_200_1782450501402.webp	\N	105	0	2026-06-29 19:40:04.33+00	f	0
272	6" Roller Handle	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_272_1782449000336.webp	\N	92	0	2026-06-29 19:56:32.239+00	f	0
209	Miles CKT 390 ( 1L) - Black	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_209_1782450724108.webp	\N	112c	0	2026-06-29 19:39:23.912+00	f	0
217	Glove	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_217_1782450925176.webp	\N	120	0	2026-06-25 03:38:04.538983+00	f	0
201	5L AsiaPaint /colorland 4 Based colour, black	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_201_1782450531799.webp	\N	106	0	2026-06-29 19:40:04.33+00	f	0
248	4" YS Roller Refill	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_248_1782446875933.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782446879284.webp"}]	6	0	2026-07-10 07:55:48.613+00	f	0
275	White Colour double side tape- thin type - 12mm	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_275_1782449102470.webp	\N	97	0	2026-06-29 19:34:04.955+00	f	0
220	2" Masking Tape (36 pcs per box) Painting Use	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_220_1782447061607.webp	\N	15	0	2026-07-10 08:16:23.165+00	f	0
243	495 ; Loctite 495 All Purpose Adhesive 20G	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_243_1782447701600.webp	\N	49	0	2026-07-08 02:32:59.876+00	f	0
193	6" Green Painters Roller Refill	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_193_1782446954431.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782446955787.webp"}]	10	0	2026-07-10 07:33:27.764+00	f	0
260	5 Litres Berger Oil Sealer (Fast Dry)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_260_1782448774660.webp	\N	74	0	2026-07-08 05:08:48.479+00	f	0
277	CIF Cleanboost Cream 100% Tough Dirt Removal (Original | Lemon | Spring Blossom) (660g)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_277_1782449138520.webp	\N	99	0	2026-06-29 19:26:16.103+00	f	0
261	5 Litres Colorland Lacquer Thinner Based For Main Door Wood Panel	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_261_1782448799480.webp	\N	75	0	2026-06-26 07:51:22.666+00	f	0
263	5 Litres Colorland Lacquer Thinner Based For Room Corridor Skirting	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_263_1782448832519.webp	\N	77	0	2026-06-26 07:51:22.666+00	f	0
245	ADHESIVE SUPER GLUE, 502	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_245_1782447715089.webp	\N	50	0	2026-07-10 07:37:19.581+00	f	0
216	Chinese Writing Brush	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_216_1782446972988.webp	\N	12	0	2026-07-10 07:55:48.613+00	f	0
244	4" Roller Handle	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_244_1782446836655.webp	\N	5	0	2026-07-10 04:23:31.739+00	f	0
242	454 ; Loctite 454 Prism Instant Adhesive; Surface Insentive Gel 20Grm	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_242_1782447682147.webp	\N	48	0	2026-07-08 06:17:55.695+00	f	0
257	Jotun Balcony Silk Grey (5L/Pail) Majestic Supreme F. Silky Matt (Based on sample 90% Match)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_257_1782448548369.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448548981.webp"}]	69	0	2026-07-08 05:23:42.133+00	f	0
271	Water-Based Wood & Grain Filler - Walnut - 8 oz By Goodfilla	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_271_1782448979097.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448979803.webp"}]	91	0	2026-07-08 05:23:42.133+00	f	0
239	CUTTER NT SPARE BLAED BD-100 (1 PACK CONTAINS 5PCS)	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_239_1782447514977.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782447516096.webp"}]	44	0	2026-07-10 06:56:50.355+00	f	0
281	ROMAN Eco-888 Wallpaper Adhesive 18.9L	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782449235239.webp	[]	122	0	2026-06-26 04:47:13.664705+00	f	0
284	3M 6200 Series Half Mask Mask Respirator	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782449287490.webp	[]	126	0	2026-06-26 04:48:05.893046+00	f	0
285	3M 6001 Filter Box	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782449305457.webp	[]	127a	0	2026-06-26 04:48:23.864249+00	f	0
292	XTRASEAL 100% RTV NEUTRAL SILICONE SEALANT (SN-501) GREY (24pcs/ctn) same as 60b	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782451514044.webp	[]	59	0	2026-06-26 07:54:40.291+00	t	0
280	3HP 30L 220V Oil Free & Silent Air Compressor	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782449220963.webp	[]	121	0	2026-07-10 07:56:46.9+00	f	0
202	5L AsiaPaint /colorland 4 Based colour, white	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_202_1782450554130.webp	\N	107	0	2026-06-29 19:40:04.33+00	f	0
291	KA JIN SPRAY PAINT (MATCH COLOUR)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_291_1782451836117.webp	[]	129	0	2026-06-26 05:17:39.136011+00	f	0
273	4" Fine Finishing Roller 10 pcs/box	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_273_1782449055955.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782449056466.webp"}]	93	0	2026-07-10 07:21:48.805+00	f	0
286	3M 5N11  P95 Filter Cotton	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782449317541.webp	[]	127b	0	2026-07-10 08:00:56.983+00	f	0
246	MAXBOND320 ; Contructive Adhesive; Catriadge Fuller Hb Fuller Maxbond 320G Cartridge Std Pack: 20Nos/Box	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_246_1782451821362.webp	\N	53	0	2026-07-10 07:55:48.613+00	f	0
203	Asia Paing Lacquer NC Super Matt Clear 5L	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_203_1782450575755.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782450576267.webp"}]	108	0	2026-06-26 08:06:03.04+00	f	0
287	3M 501 Filter Cap	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782449334506.webp	[]	127c	0	2026-07-10 08:00:56.983+00	f	0
288	6" Putty Scrapers Stainless Steel	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782449516127.webp	[]	100c	0	2026-07-10 08:00:56.983+00	f	0
250	X'traseal SN-501 RTV Neutral Silicon, Clear (24 pcs/ctn)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_250_1782448342382.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448325210.webp"}]	60c	0	2026-07-08 03:44:15.512+00	f	0
215	Gold colour stainless steel, flat head socket cap screw M4 x 12 mm	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_215_1782450899063.webp	\N	119	0	2026-07-10 08:16:23.165+00	f	0
282	Meiji  Spray Gun F110-S15T with 7Sb Cup; Model: SG-MF110S15T	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782449253515.webp	[]	124	0	2026-07-10 08:02:36.626+00	f	0
198	X'traseal SN-505 RTV Neutral Silicon,Clear (oil based)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_198_1782449573102.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782449573503.webp"}]	102	0	2026-07-08 05:45:01.534+00	f	0
283	Meiji Air Spray Gun Filter	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782449268538.webp	[]	125	0	2026-07-08 02:39:41.8+00	f	0
258	Jotun Majestic Supreme Finish Silky Matt as per sample Emperor Grey - 5L	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_258_1782448742147.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448742624.webp"}]	70	0	2026-07-08 06:10:40.362+00	f	0
225	PLASTICDROPCLOTH9X12FT ; 003 Premium drop sheet with anti skid 24 Packs / Carton	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_225_1782447167256.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782447168294.webp"}]	23	0	2026-07-10 07:33:27.764+00	f	0
232	Reusable fastening cable ties (50pcs) Dimension:12mm x 150mm   * Cable tie 4mm X 150mm L	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_232_1782447332673.webp	\N	32	0	2026-06-29 19:43:19.356+00	f	0
270	Water-Based Wood & Grain Filler - Base/Neutral - 8 oz By Goodfilla	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_270_1782448957270.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448958574.webp"}]	90	0	2026-07-08 03:27:15.029+00	f	0
237	CUTTER NT L-500GRP	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_237_1782447463009.webp	\N	42	0	2026-06-25 03:38:04.538983+00	f	0
241	SILICONE GUN ; HEAVY DUTY	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_241_1782447656749.webp	\N	47	0	2026-07-10 08:00:56.983+00	f	0
240	Ingco Voltage Test Pen 100V-500V 140MM	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_240_1782447555151.webp	\N	46	0	2026-06-25 03:38:04.538983+00	f	0
279	GSR1800WITHBATTERY ; Battery Drill (Bosch) (Gsr1800-Li) 18V With Extra Battery (Worx 20V Max BL 13mm Impact Drill w/2pcs 2.0ah Battery ST)	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782447601494.webp	[]	45	0	2026-06-26 04:19:59.858371+00	f	0
223	CL50 ; Sandpaper Grade 240	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_223_1782447123595.webp	\N	21	0	2026-07-08 06:20:48.279+00	f	0
233	1256 ; Rubber Bumper; Model 1256 (Per Pack Of 6Pcs)	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_233_1782447380493.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782447381634.webp"}]	33	0	2026-07-08 05:58:52.286+00	f	0
224	Plastic Sheet Drop Cloth 9Ft x 12Ft JI	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_224_1782447149248.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782447152101.webp"}]	22	0	2026-07-10 08:16:23.165+00	f	0
253	20 Litres Nippon Super Matex 00E55 White	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_253_1782448438565.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448439304.webp"}]	63	0	2026-06-25 03:38:04.538983+00	f	0
247	MC -808 Acrylic Gap Silicon Beige (Barley) 24pcs/Ctn	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_247_1782447770979.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782447771504.webp"}]	54	0	2026-07-08 05:45:01.534+00	f	0
238	CUTTER NT SPARE BLADES BL-150P	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_238_1782447489515.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782447490622.webp"}, {"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_1_1782447490915.webp"}]	43	0	2026-07-10 07:14:56.522+00	f	0
268	5 Litres Acrylic Clear Gloss (NC LAQUER CLEAR 750)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_268_1782448916894.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448917519.webp"}]	85	0	2026-06-29 19:20:00.771+00	f	0
255	5 Litre Nippon Aqua Water Based MBS White	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_255_1782448499048.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448499630.webp"}]	66	0	2026-07-08 03:49:04.137+00	f	0
249	X'traseal SN-501 RTV Neutral Silicon, Grey (24 pcs/ctn)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_249_1782447856571.webp	[]	60b	0	2026-07-08 05:30:32.159+00	f	0
210	Milesi MQT 157 Metal Effect Copper	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_210_1782450740243.webp	\N	113	0	2026-07-08 02:15:27.375+00	f	0
269	S11 ; S11 Compound; 20Kg Per Pack	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_269_1782448932814.webp	\N	89	0	2026-07-10 07:33:27.764+00	f	0
235	Bosch Starlock Multi Tool Starter Set, 3 Pieces/MAKITA	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_235_1782447419373.webp	\N	40	0	2026-07-10 07:37:19.581+00	f	0
197	MC -800 Acrylic Gap Silicon (White)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_197_1782449552066.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782449552481.webp"}]	101	0	2026-07-10 07:55:48.613+00	f	0
252	20 Litres Nippon Interior Emulsion SS150 TU 11779E (98YY82/023-S1)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_252_1782448417254.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448418069.webp"}]	62	0	2026-07-08 03:51:38.259+00	f	0
213	Asia Paint ABPC 4428952 5L Acrylic Clear	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_213_1782450852538.webp	\N	117	0	2026-07-08 03:49:04.137+00	f	0
290	Cored Multi Tool (320W, AC) (TM3010Cx6)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_1782450833157.webp	[]	116	0	2026-06-29 19:29:19.363+00	f	0
219	Make-Up Brush (Small) S.10	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_219_1782447040075.webp	\N	14	0	2026-07-08 05:58:52.286+00	f	0
267	4Gal Colorland Turpentine	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_267_1782448899827.webp	\N	84	0	2026-06-26 08:06:03.04+00	f	0
229	Clear L Shape Corner Guard  Dimension: 35mm X 35mm,  Thickness 4.5mm	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_229_1782447261407.webp	\N	27	0	2026-07-08 06:10:40.362+00	f	0
256	5 Litres Nippon Aqua Bodelac INNOCENCE	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_256_1782448521331.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448521790.webp"}]	67	0	2026-07-08 03:49:04.137+00	f	0
207	Miles CKT 310 ( 1L) - Yellow	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_207_1782450683556.webp	\N	112a	0	2026-06-29 19:39:23.912+00	f	0
264	400CC Special Mix Lacquer Spray T2 2nd Coating For Chrome Item	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_264_1782448852988.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448853489.webp"}]	79	0	2026-07-08 03:44:15.512+00	f	0
259	DULUX WS FLEXX GRAY SANDS -20975-20L (Ref:  25024-O/S 4)	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_259_1782448726766.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448727245.webp"}]	72	0	2026-07-08 06:16:30.214+00	f	0
204	Colorland Atomis Silver Spray NP107	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_204_1782450604546.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782450605247.webp"}]	109	0	2026-07-08 05:18:43.743+00	f	0
262	5 Litres Colorland Lacquer Thinner Based For Room Area Panel	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_262_1782448815657.webp	\N	76	0	2026-07-08 05:39:58.376+00	f	0
231	WD40 FOR RUSTY PIPE USE (382 ML)	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_231_1782447310120.webp	\N	29	0	2026-07-10 07:33:27.764+00	f	0
265	NIPPON PAINT BRUSH 1.5" TOTAL BRUSH 118	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_265_1782446893281.webp	[]	8	0	2026-07-10 07:33:27.764+00	f	0
274	NIPPON PAINT BRUSH 1"	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_274_1782449085587.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782449086161.webp"}]	96	0	2026-07-10 07:33:27.764+00	f	0
228	Phillips countersunk head self tapping screw A2 (#8(4.2),5/8”(16),stainless steel) Dimension: M4 x 15mm	111	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_228_1782447236050.webp	\N	26	0	2026-07-10 07:40:25.99+00	f	0
251	18 Litres Nippon Matex Emulsion NP OW2147P Melted Cream	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_251_1782448390193.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448390710.webp"}]	61	0	2026-07-08 06:17:55.695+00	f	0
254	20 Litres Nippon Vinilex Emulsion NP OW2147P Melted Cream	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_254_1782448474004.webp	[{"item": "https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/gallery_0_1782448474661.webp"}]	64	0	2026-07-08 06:17:55.695+00	f	0
276	300Plastic Drop Sheet Roll,24 pcs per box(3000 mm) from Taobao	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_276_1782449119087.webp	\N	98	0	2026-07-08 06:19:47.783+00	f	0
266	4Gal Colorland AAA (888) Thinner	140	https://oyqsxibmeioqmvqotzdh.supabase.co/storage/v1/object/public/item-photos/public/thumbnail_266_1782448875323.webp	\N	83	0	2026-07-10 04:23:31.739+00	f	0
\.


--
-- Data for Name: outgoing_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outgoing_items (transaction_id, item_id, quantity) FROM stdin;
52	220	3
52	223	20
52	225	3
52	226	1
52	229	40
52	235	1
52	238	2
52	239	3
52	245	3
52	252	1
52	262	1
52	260	1
52	266	1
52	276	25
52	204	2
52	205	1
52	218	1
54	248	1
54	193	1
54	220	2
54	222	15
54	225	1
22	265	5
22	216	8
22	220	4
22	225	3
22	229	40
22	239	6
22	245	6
22	252	3
22	259	4
22	266	1
22	267	1
22	274	3
22	276	30
22	197	12
22	203	1
22	218	2
23	248	1
23	193	2
23	216	3
23	220	3
23	226	1
23	229	40
23	231	1
23	235	1
23	239	2
23	245	3
23	252	1
23	259	1
23	256	1
23	269	1
23	273	1
23	276	20
54	229	40
54	238	2
54	239	1
54	247	2
54	249	1
54	262	2
54	273	1
54	276	20
54	197	6
54	204	1
54	205	1
54	211	1
54	218	1
69	254	1
69	258	1
69	220	3
56	193	1
56	219	2
56	220	1
56	225	1
56	274	1
56	276	10
56	197	5
69	223	20
69	229	40
69	245	4
69	276	2
69	224	20
69	226	1
60	220	2
60	223	20
60	225	2
60	229	40
60	238	2
60	239	2
60	245	3
60	276	21
60	204	1
60	242	2
60	266	1
60	205	1
60	211	1
60	233	5
60	216	2
60	219	2
61	220	2
61	223	15
61	229	40
61	238	2
61	245	3
61	276	25
61	205	1
61	216	2
61	219	2
61	235	1
61	231	1
61	262	1
61	193	1
61	265	1
61	271	2
61	198	1
61	257	1
70	193	1
70	224	1
63	254	1
63	220	2
63	223	15
63	229	40
63	245	3
63	276	20
63	216	3
63	219	1
63	265	1
63	198	1
63	249	1
63	197	4
63	226	1
66	276	8
66	247	1
66	198	1
66	216	2
66	219	1
66	193	2
67	254	1
67	238	2
67	220	2
67	223	15
67	229	40
67	245	3
70	276	5
70	220	1
70	274	1
67	276	90
67	216	1
67	265	1
67	226	1
67	259	1
67	266	1
67	251	1
71	224	1
71	220	1
71	223	20
71	276	25
71	274	2
71	218	1
71	259	1
71	248	1
71	238	2
71	239	2
71	245	4
71	211	1
71	242	1
72	254	1
72	251	1
72	193	2
72	220	2
72	223	10
72	231	1
72	245	4
72	224	1
72	276	30
72	242	1
72	239	2
72	238	1
73	224	1
73	220	1
73	276	7
38	250	1
38	276	30
38	245	4
38	226	1
38	218	1
38	239	2
38	254	1
39	224	1
39	222	10
39	223	10
39	276	30
39	259	1
39	248	1
39	238	2
39	239	1
39	245	2
39	243	2
39	242	1
39	233	6
39	228	100
39	205	1
39	220	1
40	254	1
40	251	1
40	259	1
40	220	2
40	223	20
40	227	1
40	216	2
40	219	2
40	274	2
40	245	4
40	224	2
40	276	30
40	239	2
40	238	2
40	226	1
40	270	1
40	269	1
40	210	1
41	224	2
41	220	2
41	222	10
41	276	10
41	252	30
41	259	1
41	273	1
41	238	2
41	239	2
41	245	2
41	243	2
41	235	2
41	226	1
41	269	1
44	224	1
44	220	2
44	222	5
44	223	5
44	276	8
44	245	1
44	283	1
44	266	1
45	224	1
45	220	1
45	222	5
45	276	8
45	245	2
45	274	2
74	211	1
47	220	3
47	223	40
47	225	2
47	229	40
47	238	2
47	239	2
47	245	50
47	252	1
47	255	1
47	259	1
47	266	1
47	276	20
47	197	8
47	205	1
47	213	1
47	214	2
48	216	3
48	219	2
48	220	2
48	223	20
48	225	2
48	226	1
48	229	40
48	238	2
48	239	2
48	245	3
48	252	2
48	255	1
48	256	1
48	257	1
48	259	2
48	264	1
48	270	1
48	274	1
48	276	20
48	197	12
48	204	1
48	205	1
49	250	2
49	262	2
49	266	1
50	220	3
50	223	20
50	225	3
50	229	40
50	235	1
50	238	1
50	239	3
50	242	1
50	245	4
50	247	4
50	250	1
50	252	2
50	255	1
50	256	1
50	257	1
50	259	2
50	262	1
50	264	1
50	266	1
50	276	25
50	204	1
50	205	1
50	211	1
50	218	1
51	220	3
51	223	25
51	225	2
51	228	200
51	229	40
51	238	2
51	239	2
51	245	3
51	252	1
51	255	1
51	256	1
51	257	1
51	259	1
51	276	25
51	204	2
51	213	1
51	218	1
74	245	4
74	223	6
57	220	2
57	265	1
57	225	1
57	229	400
57	238	1
57	239	1
57	245	3
57	254	1
57	251	1
57	276	20
57	233	4
57	258	1
57	231	1
57	214	1
57	260	1
57	193	2
57	219	1
57	228	1
57	218	1
57	197	4
57	247	1
57	235	1
45	193	2
65	220	2
65	229	40
65	276	25
65	205	1
65	262	1
65	266	1
65	259	1
65	241	1
65	238	2
65	226	1
65	274	2
68	224	3
68	223	20
68	276	30
68	216	13
68	219	3
68	218	2
68	220	3
68	226	1
68	228	1
68	215	1
68	227	1
68	197	1
68	233	6
68	259	1
38	220	2
38	223	10
\.


--
-- Data for Name: outgoing_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outgoing_transactions (id, logger_id, created_at, expend_date, expender, remarks) FROM stdin;
22	1	2026-06-26 08:06:02.82+00	2026-04-11		
23	1	2026-06-26 08:09:34.628+00	2026-04-18		
24	1	2026-06-29 20:02:01.179+00	2026-04-25		
38	2	2026-07-07 01:45:28.802+00	2026-07-06	Mahabub	
39	15	2026-07-08 02:05:03.573+00	2026-07-06	Zikra	
40	15	2026-07-08 02:15:26.953+00	2026-06-29	Mahabub	
41	15	2026-07-08 02:32:59.47+00	2026-06-29	Zikra	
42	15	2026-07-08 02:37:27.771+00	2026-06-29	Zikra	PSR
44	15	2026-07-08 02:39:41.421+00	2026-06-29	ZIikra	PSR
45	15	2026-07-08 02:40:55.464+00	2026-06-29	Zikra	LVS
47	15	2026-07-08 03:20:40.238+00	2026-04-27	Zikra	
48	15	2026-07-08 03:27:13.676+00	2026-04-27	Mahabub	
49	15	2026-07-08 03:28:22.358+00	2026-04-28	Mahabub	
50	15	2026-07-08 03:44:15.004+00	2026-05-04	Mahabub	
51	15	2026-07-08 03:49:03.754+00	2026-05-04	Zikra	
52	15	2026-07-08 03:51:37.88+00	2026-05-11	Zikra	
53	15	2026-07-08 03:59:14.944+00	2026-05-18		
54	15	2026-07-08 04:59:44.75+00	2026-05-18	Zikra	
55	15	2026-07-08 05:02:18.7+00	2026-05-25	Zikra	VVIP
56	15	2026-07-08 05:03:29.665+00	2026-05-18	Zikra	VVIP
57	15	2026-07-08 05:08:48.08+00	2026-05-25	Zikra	
58	15	2026-07-08 05:15:06.45+00	2026-05-25	Mahabub	
60	15	2026-07-08 05:18:43.361+00	2026-05-25	Mahabub	
61	15	2026-07-08 05:23:41.743+00	2026-06-01	Zikra	
62	15	2026-07-08 05:28:17.472+00	2026-06-01	Mahabub	
63	15	2026-07-08 05:30:30.811+00	2026-06-01	Mahabub	
65	15	2026-07-08 05:39:57.996+00	2026-06-08	Zikra	
66	15	2026-07-08 05:45:01.132+00	2026-06-09	Zikra	LVS
67	15	2026-07-08 05:48:32.623+00	2026-06-08	Mahabub	
68	15	2026-07-08 05:58:50.936+00	2026-06-15	Zikra	
69	15	2026-07-08 06:10:39.009+00	2026-06-15	Mahabub	
70	15	2026-07-08 06:14:24.195+00	2026-06-10	Zikra	Corridor Ad-Hoc
71	15	2026-07-08 06:16:29.834+00	2026-06-22	Zikra	
72	15	2026-07-08 06:17:55.317+00	2026-06-22		Mahabub
73	15	2026-07-08 06:19:46.456+00	2026-05-18	Zikra	15088 Decora
74	15	2026-07-08 06:20:47.893+00	2026-06-19	Zikra	
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, secret_hash, created_at, user_id) FROM stdin;
5q6v8bevsrdfm6n4fj8si2sd	\\xc2735317b13e4a2dd6a1b5d263443cfdb1518d8eaa62df7987a6e388817c7268	1782356065	2
p9vtg7z5vdri5rkstth6cit8	\\x8003120ac7e5aa3e9a6a5bd64d3d60df3b929df4e8a84f38292f9c26db1c9395	1782372679	1
y3pq3bhnupkynkuuzawacdm7	\\x1db06332052ff0537a28dd23e9ff834c75ebf8d3f18ecc53dba57668f5000dd2	1782445336	1
b9nzjm349f9wad3nrt7efsgn	\\x3cb4dfcae3cba052fc1fdf7ebc69100141ebdaaa5c0d05de202486102033fb10	1782717756	1
b32t7sunyb3gix8pe8hjq8rq	\\x70cfa7e84ff0f307a7eb06b0e310e14ae6500c554f175cd34fe942d4574bcdbb	1782719598	1
8tq97xnbgpgg8uf47mhhjrin	\\xaa4c835482388fe3c594c396a4edb69a6d1e7b1121a3a3095196ed4999eaccd1	1782758905	1
5z54dfjik8gjpaixey5j346m	\\x9d41a4b43ffd1a6bee241274ee6f4237096f9d58a184240116d3fc92c96ed2a7	1782759222	1
qufigarajrp63djihzrx2iu8	\\x96d957590eba3582e24e320426b5dc8c7504d5b8f3e3e209981b584ef0b739a4	1782785694	1
hx3kpwtjd5rpsrske86iujwa	\\xf6a08155477f5d220b2729b84c28bd84079ecad03ca743054ba77ccc21c05bfa	1782789606	2
65h4kyb4evvkgvf5wintc3s7	\\x34949819b1cc7873fa9af80c6aaf3594bdec7c1ddc573627494195ec47a5a343	1782790140	1
ses5naaih3zpd9sratxqb7i9	\\xbb546d268c647e1371107472878942221b5fa3d2f84f8c0b0c1b490939cd84b0	1782798721	1
sqp6ripzr6tiyurd2zqqhxb6	\\x485291470855893e6c5df2cefb855813dd33510db7cc24c5cc482f32c53116c4	1782812515	2
pmib8dsx3264puhnxi6zsbbg	\\xfb41d06e9681ab0043ebb5d0e8094e9e697f33800c1a69987bf8156fd092c707	1782873531	1
zxj8u7k7fp7t99q7jby25fsu	\\x7d42f0033f6d32c0a5e5b526e87d76150da97f39ae2e41592f1caf6664c389be	1782874143	1
35d7wi34cjxkvuuxptjgfjrf	\\x02a3889639e428a63d25a8a2e3402917a8b35b9f610ead48c69f9bca370c4d56	1782877926	1
rg9hbefze9vg7gwzvi8w42bi	\\x29d7f1c4e367c9945bad43a864a8d37a4a6f8b641ef8243c93cd6206ceda1843	1782956916	1
gq6qr5uyvcfynkzfn23tv7dh	\\xbe3b5f3dfa92a623beff1d554a115d13802c9fc17250e872e07c78d4873d4dec	1782962154	1
jke5dfd73hw96iu8a9jzi9ip	\\x6d4b3f427f2b3812f7672b0af1ab82a788f8bf5ccff1308cfce3435a2ed002b6	1783048488	1
st8vsrvd4bnresmy7q5ymr8b	\\x3498e7086460cdaa844f6f3459fad53c3a4b5b02ed00f4c4c98583c975198063	1783048496	2
6reb8tsvrtgaca4n4pame6wt	\\x665cae7e550b80fd660647c6f96fa96ea7127b878e20735215bc833c534eb17a	1783070653	1
xkzx737rxvkr9eirwxcxwftp	\\x8cad8f40cd5687fd0b2cdce44a5347ce402bb71db4ca74cbc5e97f5cc2ca26f1	1783070686	1
3sihr4drv78it3vz2mr9wrkg	\\x2cfdfad2ab4109e57a1f4ac54e93df7eb22a0d5c610dae3baf1a3ef23e537eda	1783388519	2
w8jcz7gthpn76a7cbmd5cfry	\\x78cdfd43b7bd066b4aa32a09576e94013abe2a70c7e94bfa3f363682eaba1f0d	1783390455	1
vcutkyr32vxz9cvjhvq8fh6e	\\xf7cc266514cdc20762692e6a8fcb25cff599014b71dd2554dfa449b9ed602c05	1783412882	1
rzuzsuf28frc5cfp7jyawnk8	\\x23a0acc961dd1aa5f6064c103072abacee50c17f2529ff6baa79833974dddbb7	1783413851	1
it47w6drfrqe8ghq4ej4qh7e	\\xd1d84ef1208aec92794bd3e586ce041bb593b54e8f2cb77ce88f0bdafbd8048c	1783414533	1
5wrd96p5zybknb27hjp79gsm	\\x8b5cac00de2101874f8252e3c36cc96c2161523e38210483f2e2414cfc7bd6ca	1783414647	1
9zc5tprjvxegakhnjybu6e2f	\\x8825c30902b29984f2ed6317b894110406b19e1f438b58ba9663438799c5c5b7	1783415242	1
2s88pwveyq6z9cbehces4den	\\x6c56b8b54007e194b9817a20c527765169fe64e6523fff48d683678217a186c5	1783415653	1
ijcedye9dwpamhwp24jzhexr	\\xf6d8e77226bcca838850211ca758fe65b7e65940949356914bd695ef5e8ed809	1783415949	1
bnyikp3bnxaqjg55dcagercb	\\x4514b685b87605ba88dc4d635b68dfeee2d56f4248a83c01b06bee2b31ad99a0	1783439298	2
x6xm74b64ykyxnn8pskm4m6r	\\xf5ca123c10c3539995f8f5e76f6a7daa8eb4a0f1bb6cfe15373cba0f8d9dd1e7	1783474916	15
uh82uimr424nr9sjge3psdf3	\\x960ac2d8a699a35bf51bd85c5b6de2e4cff709f3b6e2edafe50ef13e9c735eff	1783559843	1
gpz5g83kjup9c86bfs9ht7kq	\\x0350c4be3a7be35cce474f0227ce777253174b2288409a21f6371d90de465d64	1783563169	2
a9zh4fyru67yj257hpr4iau2	\\xd2ba9393a764ae3c7b824ab5014817d4603b8ad60c362aa22d1a18e3e745b55d	1783579017	1
b99mn76pucjjrtwd6jdb9t8c	\\x8ddabedd4efe465820154809d38f942c829037bfe701ae2ad53c21c0d89a559f	1783579984	15
kmacx2y3ff69byum56rr3rgi	\\xf71ffbc58cad490a601069d6eca00d836f7105301dd6876ca868f633318d3b59	1783585708	1
uzsyagkiwtfaym5cuea64nie	\\x74a121b4af86fc13c916bd1d4611933349759b0a74f08ed843dab9b570e585dd	1783586135	1
54drii37h97jdq2za5fn4aac	\\xd4fd4fa7029892ca9191c1086250541b7a35dd830ec90773757eba397baa52ce	1783588710	1
ecvqffpk9ur7rgkwd6ethdkh	\\x7d46c6cacb28779079ccd88283a6e64c33d15b7cf9812cc23a3a9abd48b56f9b	1783588940	1
pymbqhttb5assu9xaqqctpd3	\\x721cd1bc684d1eca1b5f8c3d5ca227cbfbdeefd12a7af6475596322bbf7b6cb9	1783652064	1
pvk2sasiimn6zc2skzvqaan5	\\xc4e088e08f486e5b1985b4f7218477710d66499f5139962e0bb03b45d8f27f68	1783652830	1
4ijsguvb7rjcqippbssn7s9n	\\x80aab500f21f9db1835a6ea7518417e01410d726b478555712e01402757f21e9	1783653355	11
d25vw9tja8uirrzeyeqrfxps	\\x721a69e8f6295a817057cfa0b3b93b86cbe50b03729201dff5266d8eaac1d143	1783653641	11
ue8sus2ab247ae4ixzbbanuk	\\x9ee7259e855f9d2f4e4efa85af04c8f75e32952850892f82b748fb0703e0f94f	1783654418	1
wmy97a3xzz8fer3utbtncutt	\\x1d58e303742775cc4ffadf68bfe9ad5252bc53d4a20c75046298c1d7a8200cda	1783671322	1
dzgv68pgq9xuetxntjzum9zj	\\x9b3a58b1a4c2036b47fa19659d78f26e566019c6db472f86dd033d1f82585f7b	1783671746	1
a2556tvthzpq2qkgb64m2y8m	\\xcf73e8727f6d7d56399b54c1a14745fe9530ab0edf8e400459636e55d7fae98c	1783671781	1
th9ntk75dqjn9ukc2icbfwda	\\xfec265c35f324f14bba56905b25ea41e455082b6864869c146ef31ddbefee4d1	1783672196	1
vxpxydge8em69ugjua3nzv4c	\\xe057765eaeca8154b0ac6bd147f8a0d7a416649b85b680ae3997995d3df41979	1783673100	1
jcnz65bxdrehjetzbyd4a7qu	\\x586d1718f599dcdd47ea732078b79dedd0afb14071ea23b7e7833ad92615d4cc	1783674449	1
928f9gt32kzy8v2pm24v8jvu	\\xad3f67ab11fe48a8786f5bd52250fd92a4d949be277f31dae33aeb33670648cb	1783675652	1
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (id, name) FROM stdin;
152	Asia Paint
154	Colorland
164	Forance
165	ShengSiong
181	Shopee
182	Taobao
183	AkzoNobel
184	Unidbox
185	Lazada
196	Quali-Tech
199	Goodrich
200	Amazon
207	AsiaPaint
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, name, password_hash, role) FROM stdin;
2	fangyee@s-teamgroup.com	Fang Yee	$2b$10$B0aJXi1tRqWrpcPJQXa8bu5mc3PFjGPZLMBjI8gfvOo68CQgjvVQ.	Admin
11	procurement@s-teamgroup.com	Emily	$2b$10$U6FO061W7ZCZAp7uN1Z5xeRD1M9ReqMVx/ZrXFdRkCdLad23sB7U.	Procurement
15	michell@s-teamgroup.com	Michell	$2b$10$QNRaLWNgp6jA1k4AChZGnOucXkqss7W/biJg8dGnol1zJPV8jVDgG	Project
1	steamandmbs@gmail.com	Admin	$2b$10$sPLI4S8roJx2ZGlyQeNLF.SjQvlekFSpE183y7owKJVUqxI5t2rK6	Admin
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-05-24 21:05:03
20211116045059	2026-05-24 21:05:03
20211116050929	2026-05-24 21:05:03
20211116051442	2026-05-24 21:05:03
20211116212300	2026-05-24 21:05:03
20211116213355	2026-05-24 21:05:03
20211116213934	2026-05-24 21:05:03
20211116214523	2026-05-24 21:05:03
20211122062447	2026-05-24 21:05:03
20211124070109	2026-05-24 21:05:03
20211202204204	2026-05-24 21:05:03
20211202204605	2026-05-24 21:05:03
20211210212804	2026-05-24 21:05:03
20211228014915	2026-05-24 21:05:03
20220107221237	2026-05-24 21:05:03
20220228202821	2026-05-24 21:05:03
20220312004840	2026-05-24 21:05:03
20220603231003	2026-05-24 21:05:03
20220603232444	2026-05-24 21:05:03
20220615214548	2026-05-24 21:05:03
20220712093339	2026-05-24 21:05:03
20220908172859	2026-05-24 21:05:03
20220916233421	2026-05-24 21:05:03
20230119133233	2026-05-24 21:05:03
20230128025114	2026-05-24 21:05:03
20230128025212	2026-05-24 21:05:03
20230227211149	2026-05-24 21:05:03
20230228184745	2026-05-24 21:05:03
20230308225145	2026-05-24 21:05:03
20230328144023	2026-05-24 21:05:03
20231018144023	2026-05-24 21:05:03
20231204144023	2026-05-24 21:05:03
20231204144024	2026-05-24 21:05:03
20231204144025	2026-05-24 21:05:03
20240108234812	2026-05-24 21:05:03
20240109165339	2026-05-24 21:05:03
20240227174441	2026-05-24 21:05:03
20240311171622	2026-05-24 21:05:03
20240321100241	2026-05-24 21:05:03
20240401105812	2026-05-24 21:05:03
20240418121054	2026-05-24 21:05:03
20240523004032	2026-05-24 21:05:03
20240618124746	2026-05-24 21:05:03
20240801235015	2026-05-24 21:05:03
20240805133720	2026-05-24 21:05:03
20240827160934	2026-05-24 21:05:03
20240919163303	2026-05-24 21:05:03
20240919163305	2026-05-24 21:05:03
20241019105805	2026-05-24 21:05:03
20241030150047	2026-05-24 21:05:03
20241108114728	2026-05-24 21:05:03
20241121104152	2026-05-24 21:05:03
20241130184212	2026-05-24 21:05:03
20241220035512	2026-05-24 21:05:03
20241220123912	2026-05-24 21:05:03
20241224161212	2026-05-24 21:05:03
20250107150512	2026-05-24 21:05:03
20250110162412	2026-05-24 21:05:03
20250123174212	2026-05-24 21:05:03
20250128220012	2026-05-24 21:05:03
20250506224012	2026-05-24 21:05:03
20250523164012	2026-05-24 21:05:03
20250714121412	2026-05-24 21:05:03
20250905041441	2026-05-24 21:05:03
20251103001201	2026-05-24 21:05:03
20251120212548	2026-05-24 21:05:03
20251120215549	2026-05-24 21:05:03
20260218120000	2026-05-24 21:05:03
20260326120000	2026-05-24 21:05:03
20260514120000	2026-06-03 05:47:33
20260527120000	2026-06-03 05:47:33
20260528120000	2026-06-03 05:47:33
20260603120000	2026-06-04 01:38:35
20260605120000	2026-06-16 01:53:00
20260606110000	2026-06-16 01:53:00
20260616120000	2026-06-25 01:39:05
20260624120000	2026-06-25 01:39:05
20260626120000	2026-07-07 01:37:27
20260706120000	2026-07-07 01:37:27
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter, selected_columns) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
item-photos	item-photos	\N	2026-06-25 02:32:22.15802+00	2026-06-25 02:32:22.15802+00	t	f	409600	{image/*}	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-05-24 21:05:04.541989
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-05-24 21:05:04.557295
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-05-24 21:05:04.561072
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-05-24 21:05:04.580703
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-05-24 21:05:04.591135
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-05-24 21:05:04.59405
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-05-24 21:05:04.596605
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-05-24 21:05:04.601163
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-05-24 21:05:04.603464
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-05-24 21:05:04.607159
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-05-24 21:05:04.609711
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-05-24 21:05:04.61449
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-05-24 21:05:04.617851
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-05-24 21:05:04.622422
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-05-24 21:05:04.624935
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-05-24 21:05:04.647826
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-05-24 21:05:04.650502
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-05-24 21:05:04.652819
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-05-24 21:05:04.655014
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-05-24 21:05:06.196924
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-05-24 21:05:06.2258
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-05-24 21:05:06.248649
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-05-24 21:05:06.275607
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-05-24 21:05:06.288973
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-05-24 21:05:06.296921
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-05-24 21:05:06.30447
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-05-24 21:05:06.310221
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-05-24 21:05:06.315893
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-05-24 21:05:06.321752
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-05-24 21:05:06.327349
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-05-24 21:05:06.332276
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-05-24 21:05:06.338347
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-05-24 21:05:06.343899
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-05-24 21:05:06.349768
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-05-24 21:05:06.355181
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-05-24 21:05:06.360547
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-05-24 21:05:06.365553
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-05-24 21:05:06.370695
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-05-24 21:05:06.377274
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-05-24 21:05:06.387774
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-05-24 21:05:06.393308
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-05-24 21:05:06.398311
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-05-24 21:05:06.403582
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-05-24 21:05:06.408432
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-05-24 21:05:06.413203
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-05-24 21:05:06.41864
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-05-24 21:05:06.429965
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-05-24 21:05:06.43514
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-05-24 21:05:06.440337
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-05-24 21:05:06.465847
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-05-24 21:05:06.471467
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-05-24 21:05:07.143969
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-05-24 21:05:07.14609
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-05-24 21:05:07.156904
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-05-24 21:05:07.160475
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-05-24 21:05:07.162621
56	fix-optimized-search-function	b823ed1e418101032fa01374edc9a436e54e3ed4	2026-05-24 21:05:07.169285
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-05-24 21:05:07.176547
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-05-24 21:05:07.181958
59	drop-unused-functions	38456f13e39691c2bbb4b5151d0d1cdbabd4a8c4	2026-05-24 21:05:07.187507
60	optimize-existing-functions-again	db35e1c91a9201e59f4fef8d972c2f277d68b157	2026-05-24 21:05:07.193831
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
79462b08-48cb-442b-8713-c4b5e6f48a47	item-photos	public/thumbnail_1782355163704.webp	\N	2026-06-25 02:39:23.117717+00	2026-06-25 02:39:23.117717+00	2026-06-25 02:39:23.117717+00	{"eTag": "\\"6970a415d86255bd685cdab20dfb9cb2\\"", "size": 1322, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-25T02:39:24.000Z", "contentLength": 1322, "httpStatusCode": 200}	45aecfa6-2c7a-45c8-818c-1f0cab798654	\N	{}
bf98a882-55ef-4455-8fe6-c7d4c3e0bbf0	item-photos	public/thumbnail_247_1782447770979.webp	\N	2026-06-26 04:22:49.232458+00	2026-06-26 04:22:49.232458+00	2026-06-26 04:22:49.232458+00	{"eTag": "\\"7376b99b33a839ba5c6c804fd66fbdc9\\"", "size": 4984, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:22:50.000Z", "contentLength": 4984, "httpStatusCode": 200}	333b9067-fd96-4a47-b71d-d979fe5df38d	\N	{}
bb21147f-15ed-454b-b31b-2c225ad4d803	item-photos	public/thumbnail_1782445395895.webp	\N	2026-06-26 03:43:14.402601+00	2026-06-26 03:43:14.402601+00	2026-06-26 03:43:14.402601+00	{"eTag": "\\"ea964829046ad0b47fbc6f08928b897a\\"", "size": 3990, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T03:43:15.000Z", "contentLength": 3990, "httpStatusCode": 200}	ac027835-e407-4f15-8e20-9c4d3ce79cc8	\N	{}
1c775a71-0874-47df-add2-9ba3c1f16a37	item-photos	public/thumbnail_204_1782450604546.webp	\N	2026-06-26 05:10:02.818087+00	2026-06-26 05:10:02.818087+00	2026-06-26 05:10:02.818087+00	{"eTag": "\\"3773118fd4abee32c2f8eb76f87375de\\"", "size": 3134, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:10:03.000Z", "contentLength": 3134, "httpStatusCode": 200}	19f50c9a-2b24-435b-9817-d77ae2bb0ac1	\N	{}
8087d4d9-a928-4ca3-b76a-7667c6fcafbd	item-photos	public/gallery_0_1782445396543.webp	\N	2026-06-26 03:43:14.719696+00	2026-06-26 03:43:14.719696+00	2026-06-26 03:43:14.719696+00	{"eTag": "\\"bb0b9559eb938a2d981237306cfb2275\\"", "size": 4450, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T03:43:15.000Z", "contentLength": 4450, "httpStatusCode": 200}	7b5cd20b-d991-48d3-b651-23de18cdfa5a	\N	{}
1342c5b1-0bb1-47be-8beb-d4468ce56551	item-photos	public/gallery_0_1782447771504.webp	\N	2026-06-26 04:22:49.841675+00	2026-06-26 04:22:49.841675+00	2026-06-26 04:22:49.841675+00	{"eTag": "\\"0fcc8e0d1b396bc3b942fc4d104e87e3\\"", "size": 3968, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:22:50.000Z", "contentLength": 3968, "httpStatusCode": 200}	d6a2a845-0f4e-4b35-bd07-cdca62dd2df0	\N	{}
301eb28f-2d2b-48b0-92dd-62c33a177dea	item-photos	public/gallery_1_1782445396839.webp	\N	2026-06-26 03:43:15.013179+00	2026-06-26 03:43:15.013179+00	2026-06-26 03:43:15.013179+00	{"eTag": "\\"18f60025f3bfa27a4b7010dfe7513a96\\"", "size": 5350, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T03:43:15.000Z", "contentLength": 5350, "httpStatusCode": 200}	26b6811b-79d3-43ff-a204-5617aa447c87	\N	{}
8a3d312c-4b06-4c3c-a673-0336957a89c2	item-photos	public/gallery_0_1782448325210.webp	\N	2026-06-26 04:32:03.454763+00	2026-06-26 04:32:03.454763+00	2026-06-26 04:32:03.454763+00	{"eTag": "\\"6a4983fe84edb904d31398871016443f\\"", "size": 3398, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:32:04.000Z", "contentLength": 3398, "httpStatusCode": 200}	d7b2d3f5-ce1b-4ad1-9c1a-b5b0b244f615	\N	{}
8a0c4e3e-c4fd-4685-8342-9bf441202c09	item-photos	public/gallery_2_1782445397119.webp	\N	2026-06-26 03:43:15.469135+00	2026-06-26 03:43:15.469135+00	2026-06-26 03:43:15.469135+00	{"eTag": "\\"e2e22fee9b6ca8ba88da624c1710bde2\\"", "size": 4544, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T03:43:16.000Z", "contentLength": 4544, "httpStatusCode": 200}	cd0f2a66-5c98-40e5-b411-9b1720fda0f7	\N	{}
88b66691-b89c-43dd-ab4a-8e3ee7478497	item-photos	public/thumbnail_278_1782445628759.webp	\N	2026-06-26 03:47:07.24945+00	2026-06-26 03:47:07.24945+00	2026-06-26 03:47:07.24945+00	{"eTag": "\\"d474334ca0c30e95cca85db9749c74a7\\"", "size": 6970, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T03:47:08.000Z", "contentLength": 6970, "httpStatusCode": 200}	b688e3ff-5778-443e-8306-d284cb654569	\N	{}
ccd4fa46-a4ea-49f6-8379-64a5565de6f5	item-photos	public/thumbnail_252_1782448417254.webp	\N	2026-06-26 04:33:35.5218+00	2026-06-26 04:33:35.5218+00	2026-06-26 04:33:35.5218+00	{"eTag": "\\"3854645d2a9f65a0d627d353afc978d8\\"", "size": 11786, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:33:36.000Z", "contentLength": 11786, "httpStatusCode": 200}	d7ed773c-e927-4fd2-8537-2b3c04544e81	\N	{}
3a522c24-fa0f-4407-9e67-d750b2174d5a	item-photos	public/thumbnail_251_1782446226109.webp	\N	2026-06-26 03:57:04.731295+00	2026-06-26 03:57:04.731295+00	2026-06-26 03:57:04.731295+00	{"eTag": "\\"d474334ca0c30e95cca85db9749c74a7\\"", "size": 6970, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T03:57:05.000Z", "contentLength": 6970, "httpStatusCode": 200}	aaa74316-9ff5-4ccd-8385-f571442b0ada	\N	{}
5c23d100-b369-43fc-9561-c015361a153d	item-photos	public/thumbnail_244_1782446836655.webp	\N	2026-06-26 04:07:15.380745+00	2026-06-26 04:07:15.380745+00	2026-06-26 04:07:15.380745+00	{"eTag": "\\"d48a5e96d7211dc9385e801d18753834\\"", "size": 1142, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:07:16.000Z", "contentLength": 1142, "httpStatusCode": 200}	9fbcbee9-98a6-4bf1-a221-27d417fddfab	\N	{}
ede0bb77-6b7f-4741-93bd-2bf4ed1f97e1	item-photos	public/thumbnail_248_1782446875933.webp	\N	2026-06-26 04:07:54.255815+00	2026-06-26 04:07:54.255815+00	2026-06-26 04:07:54.255815+00	{"eTag": "\\"2fa23ffdfbcd78d9e9174bea585ab8fa\\"", "size": 8402, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:07:55.000Z", "contentLength": 8402, "httpStatusCode": 200}	3bed5129-9e1d-4fc3-9ebe-d0ab1fbfc98c	\N	{}
ee48b404-1537-4ef8-aec5-02fefc57169f	item-photos	public/gallery_0_1782446879284.webp	\N	2026-06-26 04:07:57.459341+00	2026-06-26 04:07:57.459341+00	2026-06-26 04:07:57.459341+00	{"eTag": "\\"b1ffbcd2b6cb9ef1b891969ec50723a3\\"", "size": 3290, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:07:58.000Z", "contentLength": 3290, "httpStatusCode": 200}	df921f58-4c26-403c-8dcf-158002a983f7	\N	{}
297c4ff2-fb9c-4f36-9a7b-cecc554eacb4	item-photos	public/thumbnail_265_1782446893281.webp	\N	2026-06-26 04:08:11.575509+00	2026-06-26 04:08:11.575509+00	2026-06-26 04:08:11.575509+00	{"eTag": "\\"bcac8409b02e9c1357ad367e75dd0871\\"", "size": 3424, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:08:12.000Z", "contentLength": 3424, "httpStatusCode": 200}	5383ed1b-effa-44a7-b07a-04799c0b3dbc	\N	{}
022a5970-3d6e-4ed0-ae92-2114c14ba38e	item-photos	public/gallery_0_1782446898532.webp	\N	2026-06-26 04:08:16.774874+00	2026-06-26 04:08:16.774874+00	2026-06-26 04:08:16.774874+00	{"eTag": "\\"e69023999b372ccd6a2d079dc1c4cc39\\"", "size": 4858, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:08:17.000Z", "contentLength": 4858, "httpStatusCode": 200}	92f8193d-3e80-4be3-90e6-4e5621591bdd	\N	{}
48c09143-a0e2-40e2-88da-ebabab1ec253	item-photos	public/thumbnail_249_1782447856571.webp	\N	2026-06-26 04:24:14.863385+00	2026-06-26 04:24:14.863385+00	2026-06-26 04:24:14.863385+00	{"eTag": "\\"9d537c160b49974b94613750a7100575\\"", "size": 4410, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:24:15.000Z", "contentLength": 4410, "httpStatusCode": 200}	afe2d9ab-ac17-4b0d-a380-a3765ff1c306	\N	{}
8982476e-b845-4261-9aef-a94805286d39	item-photos	public/gallery_0_1782446955787.webp	\N	2026-06-26 04:09:13.98102+00	2026-06-26 04:09:13.98102+00	2026-06-26 04:09:13.98102+00	{"eTag": "\\"f1aa46c0eae88c2803c3450c42034e3a\\"", "size": 4690, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:09:14.000Z", "contentLength": 4690, "httpStatusCode": 200}	24f1bfda-c12c-42be-a60c-280f0b895854	\N	{}
f57ca347-eba0-4506-ba8b-ea9e27e14ae4	item-photos	public/gallery_0_1782450605247.webp	\N	2026-06-26 05:10:03.49139+00	2026-06-26 05:10:03.49139+00	2026-06-26 05:10:03.49139+00	{"eTag": "\\"d8a9fea2ba3e304ce51a17b1135de959\\"", "size": 4242, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:10:04.000Z", "contentLength": 4242, "httpStatusCode": 200}	49c638de-1ad8-48ef-8b8c-688b3fd1e183	\N	{}
38709dad-2c6b-4021-aea8-556039ae43eb	item-photos	public/thumbnail_220_1782447061607.webp	\N	2026-06-26 04:10:59.893173+00	2026-06-26 04:10:59.893173+00	2026-06-26 04:10:59.893173+00	{"eTag": "\\"f971295baef1f5caf83d1e918c14a46e\\"", "size": 7186, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:11:00.000Z", "contentLength": 7186, "httpStatusCode": 200}	d3d6e469-bb60-4048-8149-afcf28715a6b	\N	{}
2e7bd142-01e4-41e1-ba0b-54e96d08154f	item-photos	public/gallery_0_1782447084693.webp	\N	2026-06-26 04:11:22.856836+00	2026-06-26 04:11:22.856836+00	2026-06-26 04:11:22.856836+00	{"eTag": "\\"1b3b58bc73b1ad6829784bf76b6cb6c6\\"", "size": 1692, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:11:23.000Z", "contentLength": 1692, "httpStatusCode": 200}	464d48b4-b2a9-4387-bd00-e73d7f5997b6	\N	{}
03a73764-29c2-4fe0-9918-666246452c20	item-photos	public/gallery_0_1782447857986.webp	\N	2026-06-26 04:24:16.395491+00	2026-06-26 04:24:16.395491+00	2026-06-26 04:24:16.395491+00	{"eTag": "\\"41aa44ec6a438e211048c7e4636395e3\\"", "size": 3490, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:24:17.000Z", "contentLength": 3490, "httpStatusCode": 200}	b66daa9c-3944-43ba-a50e-befc68650769	\N	{}
1dd1e472-29b0-4439-ac46-04067d613f3f	item-photos	public/thumbnail_223_1782447123595.webp	\N	2026-06-26 04:12:01.853822+00	2026-06-26 04:12:01.853822+00	2026-06-26 04:12:01.853822+00	{"eTag": "\\"763843bbdec828636683aefa215521a0\\"", "size": 8084, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:12:02.000Z", "contentLength": 8084, "httpStatusCode": 200}	708e3fc3-fbb0-4e9b-a075-110b7b2b5c3a	\N	{}
aa6147e1-63e0-42b5-a081-b742c6b24f61	item-photos	public/gallery_0_1782447152101.webp	\N	2026-06-26 04:12:30.302868+00	2026-06-26 04:12:30.302868+00	2026-06-26 04:12:30.302868+00	{"eTag": "\\"9a2e223311fcf65a618204f2b09e4cbc\\"", "size": 5460, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:12:31.000Z", "contentLength": 5460, "httpStatusCode": 200}	f27e1d48-9f07-4b41-9978-11c363aeb459	\N	{}
4bb8b1a3-b1d7-4069-adb2-58716565c086	item-photos	public/thumbnail_227_1782447205964.webp	\N	2026-06-26 04:13:24.198169+00	2026-06-26 04:13:24.198169+00	2026-06-26 04:13:24.198169+00	{"eTag": "\\"ab79610c615909813b69a233794c88f3\\"", "size": 7008, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:13:25.000Z", "contentLength": 7008, "httpStatusCode": 200}	c00dfeaa-57f7-4661-85e6-989ea66a1fcf	\N	{}
8487e0dd-9d5d-49aa-b39f-9065ad36c0dd	item-photos	public/thumbnail_250_1782448324708.webp	\N	2026-06-26 04:32:03.420912+00	2026-06-26 04:32:03.420912+00	2026-06-26 04:32:03.420912+00	{"eTag": "\\"9d537c160b49974b94613750a7100575\\"", "size": 4410, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:32:04.000Z", "contentLength": 4410, "httpStatusCode": 200}	7c598ce2-7a5c-42b2-87f2-e13e3ddddae1	\N	{}
517c6793-6976-4179-90c9-71e8baa8d9a9	item-photos	public/thumbnail_229_1782447261407.webp	\N	2026-06-26 04:14:19.819168+00	2026-06-26 04:14:19.819168+00	2026-06-26 04:14:19.819168+00	{"eTag": "\\"65fe52e992e36d0dc1e170acb97dd1e0\\"", "size": 5140, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:14:20.000Z", "contentLength": 5140, "httpStatusCode": 200}	afc3eab8-a090-4fa7-abf7-7c53d4f459cd	\N	{}
66d814b5-86d3-42d9-88ab-76720492fcda	item-photos	public/thumbnail_231_1782447310120.webp	\N	2026-06-26 04:15:08.426132+00	2026-06-26 04:15:08.426132+00	2026-06-26 04:15:08.426132+00	{"eTag": "\\"7aa09448a8659cba94ed997228d50cab\\"", "size": 4762, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:15:09.000Z", "contentLength": 4762, "httpStatusCode": 200}	b58c647b-6937-43ba-b0b8-8b357b939ba7	\N	{}
87f8f7d2-0bd6-4f71-8694-24d1b4a9678c	item-photos	public/thumbnail_232_1782447332673.webp	\N	2026-06-26 04:15:30.933065+00	2026-06-26 04:15:30.933065+00	2026-06-26 04:15:30.933065+00	{"eTag": "\\"247c08bcf3ca63d08251ae3789134106\\"", "size": 5648, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:15:31.000Z", "contentLength": 5648, "httpStatusCode": 200}	c5924e8c-19b3-4d87-8baf-5cab187a45a1	\N	{}
49c32e2c-0e59-4b9d-bc46-d7e216e7e8f4	item-photos	public/thumbnail_235_1782447419373.webp	\N	2026-06-26 04:16:57.624428+00	2026-06-26 04:16:57.624428+00	2026-06-26 04:16:57.624428+00	{"eTag": "\\"6fba14e479f6de8f6f07c17d67de8de0\\"", "size": 5334, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:16:58.000Z", "contentLength": 5334, "httpStatusCode": 200}	6df105bb-9e99-4882-9d44-920a8866acf1	\N	{}
2dea606c-8cce-4bf0-b64c-f1464ed63916	item-photos	public/thumbnail_250_1782448342382.webp	\N	2026-06-26 04:32:20.590697+00	2026-06-26 04:32:20.590697+00	2026-06-26 04:32:20.590697+00	{"eTag": "\\"9d537c160b49974b94613750a7100575\\"", "size": 4410, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:32:21.000Z", "contentLength": 4410, "httpStatusCode": 200}	af2eca12-c3cc-49dd-80ea-22b37e6509e8	\N	{}
815f087f-a6d7-4bc2-b203-d1c36ec66845	item-photos	public/thumbnail_193_1782446954431.webp	\N	2026-06-26 04:09:12.677967+00	2026-06-26 04:09:12.677967+00	2026-06-26 04:09:12.677967+00	{"eTag": "\\"2b363bc6ef4da0591f02d286b5a3f6ff\\"", "size": 4002, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:09:13.000Z", "contentLength": 4002, "httpStatusCode": 200}	00e3030d-f61e-4df9-9561-06ef5ea8155e	\N	{}
7c25b3b5-a4bd-4914-b7e9-178a22806a03	item-photos	public/thumbnail_205_1782450646461.webp	\N	2026-06-26 05:10:44.756645+00	2026-06-26 05:10:44.756645+00	2026-06-26 05:10:44.756645+00	{"eTag": "\\"1fb2f771c198f32fe3c7739d40b08df6\\"", "size": 4126, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:10:45.000Z", "contentLength": 4126, "httpStatusCode": 200}	da31f3c5-1b57-4c2d-aac0-bbc82b277df2	\N	{}
55f7dbdf-ebb2-4512-a3a4-c08eaa1832e0	item-photos	public/thumbnail_216_1782446972988.webp	\N	2026-06-26 04:09:31.421468+00	2026-06-26 04:09:31.421468+00	2026-06-26 04:09:31.421468+00	{"eTag": "\\"a4157b853218e4b89790227bcd93b5b6\\"", "size": 4036, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:09:32.000Z", "contentLength": 4036, "httpStatusCode": 200}	c7d5de02-16c3-4287-b671-a0f2efd1f930	\N	{}
773dc5f6-a097-48ce-8301-32b251a46d3c	item-photos	public/thumbnail_251_1782448390193.webp	\N	2026-06-26 04:33:08.455453+00	2026-06-26 04:33:08.455453+00	2026-06-26 04:33:08.455453+00	{"eTag": "\\"14760361cc0e1d6229f87a889a30f9ec\\"", "size": 10832, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:33:09.000Z", "contentLength": 10832, "httpStatusCode": 200}	f8aca650-4e4a-4a32-b124-611c25c0b6b6	\N	{}
c273b89b-db3c-418e-ba46-feac278632c2	item-photos	public/thumbnail_219_1782447040075.webp	\N	2026-06-26 04:10:38.310689+00	2026-06-26 04:10:38.310689+00	2026-06-26 04:10:38.310689+00	{"eTag": "\\"97b78dd8c1a9f6268a75fd920109adae\\"", "size": 1474, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:10:39.000Z", "contentLength": 1474, "httpStatusCode": 200}	8bb7c78f-1e7c-42a8-ba05-228ca5164cde	\N	{}
1c21382c-8285-4bca-b216-1c9fed7362bd	item-photos	public/gallery_0_1782450646572.webp	\N	2026-06-26 05:10:44.844459+00	2026-06-26 05:10:44.844459+00	2026-06-26 05:10:44.844459+00	{"eTag": "\\"b297e97989ad4570f81923daa2d21139\\"", "size": 9968, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:10:45.000Z", "contentLength": 9968, "httpStatusCode": 200}	8952b32e-2143-40af-8ecb-57478d7d717b	\N	{}
62e3c9a5-588a-4699-9e89-5a3a4c4db123	item-photos	public/thumbnail_221_1782447083509.webp	\N	2026-06-26 04:11:21.764871+00	2026-06-26 04:11:21.764871+00	2026-06-26 04:11:21.764871+00	{"eTag": "\\"61663b6e6c3e2f377456a928bafd1022\\"", "size": 7002, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:11:22.000Z", "contentLength": 7002, "httpStatusCode": 200}	28789908-679f-4386-8d2c-82309a7b413f	\N	{}
4aeeef39-7c28-464a-a073-7354b0616817	item-photos	public/gallery_0_1782448390710.webp	\N	2026-06-26 04:33:08.923949+00	2026-06-26 04:33:08.923949+00	2026-06-26 04:33:08.923949+00	{"eTag": "\\"958c11b6e47092651e6b5924ce098ffd\\"", "size": 4322, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:33:09.000Z", "contentLength": 4322, "httpStatusCode": 200}	8005cf82-dc73-4a4c-85af-6f2972a708ff	\N	{}
a6ab2c49-36de-44f3-8347-1aace6ee98d8	item-photos	public/thumbnail_222_1782447106551.webp	\N	2026-06-26 04:11:44.800512+00	2026-06-26 04:11:44.800512+00	2026-06-26 04:11:44.800512+00	{"eTag": "\\"e4f1b95171c9a866a7b1a2d933a767a0\\"", "size": 8294, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:11:45.000Z", "contentLength": 8294, "httpStatusCode": 200}	08343335-5753-412d-afd3-3ee18dce7d8d	\N	{}
f0e83218-17e1-466b-9cfd-81de202fd4d7	item-photos	public/thumbnail_253_1782448438565.webp	\N	2026-06-26 04:33:56.811694+00	2026-06-26 04:33:56.811694+00	2026-06-26 04:33:56.811694+00	{"eTag": "\\"75e077498894c85e41332b62c72d62ec\\"", "size": 11580, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:33:57.000Z", "contentLength": 11580, "httpStatusCode": 200}	86c27efb-d5b9-4f7e-9d03-e781482cd7c0	\N	{}
8cff61bf-b0ac-4c31-8c07-35b94765b1d2	item-photos	public/thumbnail_224_1782447149248.webp	\N	2026-06-26 04:12:27.497775+00	2026-06-26 04:12:27.497775+00	2026-06-26 04:12:27.497775+00	{"eTag": "\\"22af0d08339dd4153cdec92485e9bca6\\"", "size": 9646, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:12:28.000Z", "contentLength": 9646, "httpStatusCode": 200}	c707ecc2-83ae-47c1-aa51-85f70972578b	\N	{}
48406a2e-0c44-4301-a57f-2e9cc4adb84a	item-photos	public/thumbnail_225_1782447167256.webp	\N	2026-06-26 04:12:45.50118+00	2026-06-26 04:12:45.50118+00	2026-06-26 04:12:45.50118+00	{"eTag": "\\"8f99311d946b1cb92c75b59756abe785\\"", "size": 9392, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:12:46.000Z", "contentLength": 9392, "httpStatusCode": 200}	71d02679-959a-43a8-9aa3-78ab3aa3c48d	\N	{}
4cdef03f-a079-429b-9cc2-8cee3d16b76c	item-photos	public/gallery_0_1782447168294.webp	\N	2026-06-26 04:12:46.481841+00	2026-06-26 04:12:46.481841+00	2026-06-26 04:12:46.481841+00	{"eTag": "\\"72b6ae4f6e4eb4bd92be7f0577950ce4\\"", "size": 10964, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:12:47.000Z", "contentLength": 10964, "httpStatusCode": 200}	7bbb3562-ad63-432b-8bee-21e2073643a5	\N	{}
11ab6450-a4ff-49aa-8c1a-898c33183b70	item-photos	public/thumbnail_226_1782447188615.webp	\N	2026-06-26 04:13:06.864326+00	2026-06-26 04:13:06.864326+00	2026-06-26 04:13:06.864326+00	{"eTag": "\\"d4a963b88644b596600fbbe94f8d1d7b\\"", "size": 3246, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:13:07.000Z", "contentLength": 3246, "httpStatusCode": 200}	3247edeb-4021-4861-9413-dd5fea0e1a92	\N	{}
2c83f792-0347-45cb-9a02-9fd071d57517	item-photos	public/thumbnail_228_1782447236050.webp	\N	2026-06-26 04:13:54.31404+00	2026-06-26 04:13:54.31404+00	2026-06-26 04:13:54.31404+00	{"eTag": "\\"bf6cb34fb735554f5d238ba3e933b070\\"", "size": 2390, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:13:55.000Z", "contentLength": 2390, "httpStatusCode": 200}	b316bb07-0857-43f6-904b-4b1162cdb785	\N	{}
339454fa-4144-481e-843b-5269c18863e5	item-photos	public/thumbnail_230_1782447281150.webp	\N	2026-06-26 04:14:39.423237+00	2026-06-26 04:14:39.423237+00	2026-06-26 04:14:39.423237+00	{"eTag": "\\"5c3a542877c051d5816733ffc7b39c05\\"", "size": 2308, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:14:40.000Z", "contentLength": 2308, "httpStatusCode": 200}	aa1d5b66-174a-4dcb-815b-03e608debca1	\N	{}
caac54ff-d0c4-4c48-bf71-fa3accd04190	item-photos	public/thumbnail_233_1782447354333.webp	\N	2026-06-26 04:15:52.563072+00	2026-06-26 04:15:52.563072+00	2026-06-26 04:15:52.563072+00	{"eTag": "\\"44f395f651d0ab7cc005b2f2f9410b0e\\"", "size": 8012, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:15:53.000Z", "contentLength": 8012, "httpStatusCode": 200}	6d9d1506-a925-4fde-86f2-0a6e8d0d32a3	\N	{}
5b6d8651-cd08-4001-b7e2-20f6759459d0	item-photos	public/gallery_0_1782448418069.webp	\N	2026-06-26 04:33:36.26899+00	2026-06-26 04:33:36.26899+00	2026-06-26 04:33:36.26899+00	{"eTag": "\\"7ccdedc08ea27f55cfd1739079c577cd\\"", "size": 4882, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:33:37.000Z", "contentLength": 4882, "httpStatusCode": 200}	2e3deee0-9417-4a85-930c-6ab9de16ac24	\N	{}
f561f58c-a9dc-4dbe-9e7f-7cd1c76fe3bc	item-photos	public/thumbnail_233_1782447380493.webp	\N	2026-06-26 04:16:18.744381+00	2026-06-26 04:16:18.744381+00	2026-06-26 04:16:18.744381+00	{"eTag": "\\"44f395f651d0ab7cc005b2f2f9410b0e\\"", "size": 8012, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:16:19.000Z", "contentLength": 8012, "httpStatusCode": 200}	b293e80a-8050-4fff-88ba-d7535c6994d8	\N	{}
e142947c-108e-47be-b322-fc4c91508740	item-photos	public/thumbnail_255_1782448499048.webp	\N	2026-06-26 04:34:57.30985+00	2026-06-26 04:34:57.30985+00	2026-06-26 04:34:57.30985+00	{"eTag": "\\"1b82b477247194e5af91d1f933661b71\\"", "size": 8408, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:34:58.000Z", "contentLength": 8408, "httpStatusCode": 200}	073c54ca-831b-4263-af2f-51cda4e927f2	\N	{}
163f7fb4-ee13-4cb5-9d33-045f2aef6710	item-photos	public/gallery_0_1782447381634.webp	\N	2026-06-26 04:16:19.803808+00	2026-06-26 04:16:19.803808+00	2026-06-26 04:16:19.803808+00	{"eTag": "\\"ca1cfa44ccae48b45cf5e4b91b5bab3e\\"", "size": 2238, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:16:20.000Z", "contentLength": 2238, "httpStatusCode": 200}	e54722c9-67af-47f9-bc09-93bd020a0191	\N	{}
a08121dd-a1cc-4654-9929-dfc31526b1f4	item-photos	public/thumbnail_1783409088443.webp	\N	2026-07-07 07:24:48.622915+00	2026-07-07 07:24:48.622915+00	2026-07-07 07:24:48.622915+00	{"eTag": "\\"e641f868e89387e32501a399479211a3\\"", "size": 8050, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T07:24:49.000Z", "contentLength": 8050, "httpStatusCode": 200}	147888a5-1432-451d-9e15-9d381aa8225c	\N	{}
956f8057-0301-4f24-8716-d55ab49e91d6	item-photos	public/thumbnail_234_1782447401063.webp	\N	2026-06-26 04:16:39.304683+00	2026-06-26 04:16:39.304683+00	2026-06-26 04:16:39.304683+00	{"eTag": "\\"f2971b74a17c3360c2b21587303f40f8\\"", "size": 4440, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:16:40.000Z", "contentLength": 4440, "httpStatusCode": 200}	6e1d2170-d37b-478b-9ebd-ed53c39597de	\N	{}
19cce4bb-89d7-4929-83e4-b399424e04ca	item-photos	public/gallery_0_1782448499630.webp	\N	2026-06-26 04:34:57.82687+00	2026-06-26 04:34:57.82687+00	2026-06-26 04:34:57.82687+00	{"eTag": "\\"3da0c4699b3a911eb26c8e115ab16221\\"", "size": 7106, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:34:58.000Z", "contentLength": 7106, "httpStatusCode": 200}	b90cf561-9c93-43db-86ec-34fda8cd1b2d	\N	{}
fd4953e7-8b9b-4ce4-a82c-76b591c103c9	item-photos	public/thumbnail_236_1782447447014.webp	\N	2026-06-26 04:17:25.253407+00	2026-06-26 04:17:25.253407+00	2026-06-26 04:17:25.253407+00	{"eTag": "\\"86079b119211b5ba98571ae16d58f2cc\\"", "size": 1702, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:17:26.000Z", "contentLength": 1702, "httpStatusCode": 200}	444191aa-af47-495a-895f-fbacad386e93	\N	{}
23734934-e2d2-428e-9c67-525392ed48aa	item-photos	public/thumbnail_237_1782447463009.webp	\N	2026-06-26 04:17:41.31295+00	2026-06-26 04:17:41.31295+00	2026-06-26 04:17:41.31295+00	{"eTag": "\\"567c9a07defd594865254cfa76f47c29\\"", "size": 3156, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:17:42.000Z", "contentLength": 3156, "httpStatusCode": 200}	debf5db8-85a4-4ba6-ba89-0633c9ca6b4f	\N	{}
9617c8fe-56db-4505-bf54-2c329ca6ddb9	item-photos	public/thumbnail_256_1782448521331.webp	\N	2026-06-26 04:35:19.608104+00	2026-06-26 04:35:19.608104+00	2026-06-26 04:35:19.608104+00	{"eTag": "\\"d4a62c0f6cfbacc8ec5b9bcdad8b0edd\\"", "size": 8272, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:35:20.000Z", "contentLength": 8272, "httpStatusCode": 200}	2c1cb14f-ec4d-43d3-9267-0bb63a86dea4	\N	{}
d73dc9d3-453b-4bfa-84cd-4e3e59a8c45c	item-photos	public/thumbnail_239_1782447514977.webp	\N	2026-06-26 04:18:33.248115+00	2026-06-26 04:18:33.248115+00	2026-06-26 04:18:33.248115+00	{"eTag": "\\"53986fe95366db3cee1346c9bc657684\\"", "size": 4988, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:18:34.000Z", "contentLength": 4988, "httpStatusCode": 200}	b651ee90-7b1d-427d-9b6a-1812db4a674a	\N	{}
bcd85d4e-74f6-4ffb-84a5-0e168bbf0b69	item-photos	public/gallery_0_1782447516096.webp	\N	2026-06-26 04:18:34.294526+00	2026-06-26 04:18:34.294526+00	2026-06-26 04:18:34.294526+00	{"eTag": "\\"1d92e08b812e502325855c45c3ae6e25\\"", "size": 2996, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:18:35.000Z", "contentLength": 2996, "httpStatusCode": 200}	96b560e0-2973-4b52-92a8-a816173a3bc6	\N	{}
b22b97da-984a-4eb1-b7e4-4a65b7c8a5f9	item-photos	public/thumbnail_240_1782447531907.webp	\N	2026-06-26 04:18:50.139497+00	2026-06-26 04:18:50.139497+00	2026-06-26 04:18:50.139497+00	{"eTag": "\\"4136426c1cc900a034f6f34a8dec6ab4\\"", "size": 5134, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:18:51.000Z", "contentLength": 5134, "httpStatusCode": 200}	6a5a0513-059b-4a39-8559-5331f7009602	\N	{}
9228c553-811e-44bd-bcfd-18560d5b25ec	item-photos	public/thumbnail_242_1782447682147.webp	\N	2026-06-26 04:21:20.365848+00	2026-06-26 04:21:20.365848+00	2026-06-26 04:21:20.365848+00	{"eTag": "\\"6c7f88de7df455c79d4b458786a5622d\\"", "size": 2614, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:21:21.000Z", "contentLength": 2614, "httpStatusCode": 200}	f0e29108-1943-4704-be59-4b5ac391359b	\N	{}
93f50a61-cc6b-4563-8aa3-9db682407c06	item-photos	public/gallery_0_1782448439304.webp	\N	2026-06-26 04:33:57.492413+00	2026-06-26 04:33:57.492413+00	2026-06-26 04:33:57.492413+00	{"eTag": "\\"8d346a32ea6139fbbd5d80622d2edb16\\"", "size": 5326, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:33:58.000Z", "contentLength": 5326, "httpStatusCode": 200}	ee75681e-89ee-44ed-802f-4f13757e2e1f	\N	{}
e48389d3-2448-4007-8236-d640d5b34c65	item-photos	public/thumbnail_238_1782447489515.webp	\N	2026-06-26 04:18:07.791606+00	2026-06-26 04:18:07.791606+00	2026-06-26 04:18:07.791606+00	{"eTag": "\\"bf36a59447a63592ce57aea231ce1107\\"", "size": 4972, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:18:08.000Z", "contentLength": 4972, "httpStatusCode": 200}	9953a636-73bb-46cf-b914-7fbea13dc48d	\N	{}
a302cf2d-0cc2-43ea-9c1c-cb0ac54bea31	item-photos	public/gallery_0_1782447490622.webp	\N	2026-06-26 04:18:08.819885+00	2026-06-26 04:18:08.819885+00	2026-06-26 04:18:08.819885+00	{"eTag": "\\"e475287e364eb91abbe231a84448232b\\"", "size": 2856, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:18:09.000Z", "contentLength": 2856, "httpStatusCode": 200}	92ce3c5c-192e-4599-8bb1-26c7bd70a840	\N	{}
adfcf0eb-12a4-4459-8604-8a69d41100a5	item-photos	public/gallery_0_1782448521790.webp	\N	2026-06-26 04:35:19.993739+00	2026-06-26 04:35:19.993739+00	2026-06-26 04:35:19.993739+00	{"eTag": "\\"8afe9e27a71f712068af02bb01df7594\\"", "size": 5672, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:35:20.000Z", "contentLength": 5672, "httpStatusCode": 200}	0da421a3-9731-4cff-bbee-1d54ed59c968	\N	{}
6dd6330a-fb40-4202-9db3-7a5d4fe188eb	item-photos	public/gallery_1_1782447490915.webp	\N	2026-06-26 04:18:09.096606+00	2026-06-26 04:18:09.096606+00	2026-06-26 04:18:09.096606+00	{"eTag": "\\"9966d0b5d36dfa2c192fc22a25a82086\\"", "size": 3704, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:18:10.000Z", "contentLength": 3704, "httpStatusCode": 200}	d5bd2085-ae78-47dc-9f43-bf1a648f32ff	\N	{}
4339c5a3-3a97-4bd4-84ba-8db63259c528	item-photos	public/thumbnail_206_1782450663665.webp	\N	2026-06-26 05:11:01.930974+00	2026-06-26 05:11:01.930974+00	2026-06-26 05:11:01.930974+00	{"eTag": "\\"32587cb33f5f6f7fe4cd9165f925fc23\\"", "size": 10948, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:11:02.000Z", "contentLength": 10948, "httpStatusCode": 200}	fca41566-b04c-4dee-92d2-eb36fcdd721b	\N	{}
863e6890-ad14-4909-9038-6153b05b90b2	item-photos	public/thumbnail_240_1782447555151.webp	\N	2026-06-26 04:19:13.401767+00	2026-06-26 04:19:13.401767+00	2026-06-26 04:19:13.401767+00	{"eTag": "\\"368792b1c72305132a9811c802e69fa0\\"", "size": 2412, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:19:14.000Z", "contentLength": 2412, "httpStatusCode": 200}	da2828df-b971-48bf-acfb-964004f1247a	\N	{}
a0875066-c275-44df-80e9-1cd3de848c77	item-photos	public/thumbnail_258_1782448701011.webp	\N	2026-06-26 04:38:19.639402+00	2026-06-26 04:38:19.639402+00	2026-06-26 04:38:19.639402+00	{"eTag": "\\"389dee779312584ed7e65ce4340681f0\\"", "size": 6470, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:38:20.000Z", "contentLength": 6470, "httpStatusCode": 200}	fd4609f4-ac5f-4704-9b29-3ea3d98a8782	\N	{}
aa1ff596-5d32-4ad6-bc23-87b5dccb2048	item-photos	public/thumbnail_1782447601494.webp	\N	2026-06-26 04:19:59.730969+00	2026-06-26 04:19:59.730969+00	2026-06-26 04:19:59.730969+00	{"eTag": "\\"4136426c1cc900a034f6f34a8dec6ab4\\"", "size": 5134, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:20:00.000Z", "contentLength": 5134, "httpStatusCode": 200}	81d0816a-d8fa-4f91-922b-605682bac030	\N	{}
461a167c-0233-4c48-b656-b77ac028267d	item-photos	public/thumbnail_241_1782447656749.webp	\N	2026-06-26 04:20:55.163686+00	2026-06-26 04:20:55.163686+00	2026-06-26 04:20:55.163686+00	{"eTag": "\\"809aa340e5e905e7d013d8586b4a52d4\\"", "size": 3804, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:20:56.000Z", "contentLength": 3804, "httpStatusCode": 200}	e4870eee-0c54-4806-92e1-7f388ce0b938	\N	{}
86402865-ac38-4506-b3ba-92cca6e55c86	item-photos	public/gallery_0_1782448701705.webp	\N	2026-06-26 04:38:19.928848+00	2026-06-26 04:38:19.928848+00	2026-06-26 04:38:19.928848+00	{"eTag": "\\"544c4bd8dc941e79354728f5211f3a20\\"", "size": 3448, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:38:20.000Z", "contentLength": 3448, "httpStatusCode": 200}	1a109bf9-7863-4388-94f9-81422ad62590	\N	{}
4039df91-8d7d-49fc-9a1e-443317f73781	item-photos	public/thumbnail_243_1782447701600.webp	\N	2026-06-26 04:21:39.846227+00	2026-06-26 04:21:39.846227+00	2026-06-26 04:21:39.846227+00	{"eTag": "\\"979c7a5e83a67a7a4df0be07bbd38141\\"", "size": 3722, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:21:40.000Z", "contentLength": 3722, "httpStatusCode": 200}	deb38402-5569-4dd8-885d-c72b2440467d	\N	{}
aea8bd3e-4afe-46fd-8fa3-665827ef3f48	item-photos	public/thumbnail_208_1782450703674.webp	\N	2026-06-26 05:11:42.706399+00	2026-06-26 05:11:42.706399+00	2026-06-26 05:11:42.706399+00	{"eTag": "\\"7c82bd28cb66388b32f82caaed24015a\\"", "size": 5846, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:11:43.000Z", "contentLength": 5846, "httpStatusCode": 200}	ae32a2c8-8b55-47fc-a341-10723325deba	\N	{}
fb660a5d-ce93-4f24-aca8-ccf6c22ec911	item-photos	public/thumbnail_259_1782448726766.webp	\N	2026-06-26 04:38:45.22089+00	2026-06-26 04:38:45.22089+00	2026-06-26 04:38:45.22089+00	{"eTag": "\\"389dee779312584ed7e65ce4340681f0\\"", "size": 6470, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:38:46.000Z", "contentLength": 6470, "httpStatusCode": 200}	99f642ca-c982-494a-9bb4-7c9a1ea3c352	\N	{}
2cd94027-ac01-44a7-96cd-8fb25aa5f1cc	item-photos	public/gallery_0_1782448727245.webp	\N	2026-06-26 04:38:45.500897+00	2026-06-26 04:38:45.500897+00	2026-06-26 04:38:45.500897+00	{"eTag": "\\"544c4bd8dc941e79354728f5211f3a20\\"", "size": 3448, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:38:46.000Z", "contentLength": 3448, "httpStatusCode": 200}	d1cfccef-b0f2-4d79-826c-5a8fedc7f530	\N	{}
61e0cc17-05a1-4e5d-9175-a4d438039558	item-photos	public/thumbnail_245_1782447715089.webp	\N	2026-06-26 04:21:53.367385+00	2026-06-26 04:21:53.367385+00	2026-06-26 04:21:53.367385+00	{"eTag": "\\"91896b56af1648448f2d698c38eaf4d2\\"", "size": 1724, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:21:54.000Z", "contentLength": 1724, "httpStatusCode": 200}	034934c5-daaa-49a1-be59-6c21a96ba87a	\N	{}
90d1a2dc-b8e1-4cc9-b8e9-65b88c2f8a65	item-photos	public/thumbnail_254_1782448474004.webp	\N	2026-06-26 04:34:32.291074+00	2026-06-26 04:34:32.291074+00	2026-06-26 04:34:32.291074+00	{"eTag": "\\"1b11f44af238168f1887df1f709093c9\\"", "size": 12536, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:34:33.000Z", "contentLength": 12536, "httpStatusCode": 200}	739d5f47-bf51-4e4e-bd8a-69403646431b	\N	{}
2e4bdaf5-0019-451a-a38b-876c79d6e36b	item-photos	public/thumbnail_207_1782450683556.webp	\N	2026-06-26 05:11:21.853817+00	2026-06-26 05:11:21.853817+00	2026-06-26 05:11:21.853817+00	{"eTag": "\\"83e532a9e0a24beb1d3352af246878dd\\"", "size": 4506, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:11:22.000Z", "contentLength": 4506, "httpStatusCode": 200}	baed0e58-a95d-4729-ae44-c66332bb560a	\N	{}
6d0d363d-14c8-4b35-a6ab-1c400d53bc4e	item-photos	public/gallery_0_1782448474661.webp	\N	2026-06-26 04:34:32.846899+00	2026-06-26 04:34:32.846899+00	2026-06-26 04:34:32.846899+00	{"eTag": "\\"16f4146387943b5a8166a3567e1a6c4f\\"", "size": 7834, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:34:33.000Z", "contentLength": 7834, "httpStatusCode": 200}	1de09d95-6d15-481c-aef0-50a0846e2d39	\N	{}
e7c60026-1419-4161-801d-bb3c2c204418	item-photos	public/thumbnail_257_1782448548369.webp	\N	2026-06-26 04:35:46.66758+00	2026-06-26 04:35:46.66758+00	2026-06-26 04:35:46.66758+00	{"eTag": "\\"21820d1fd71cd99919ed6be5ac77af20\\"", "size": 10210, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:35:47.000Z", "contentLength": 10210, "httpStatusCode": 200}	3517f57a-a1fd-4de6-a29a-c0b44caf8799	\N	{}
b779c3ab-b4fe-4eb1-883f-3f7607924242	item-photos	public/thumbnail_209_1782450724108.webp	\N	2026-06-26 05:12:02.395569+00	2026-06-26 05:12:02.395569+00	2026-06-26 05:12:02.395569+00	{"eTag": "\\"7a1cc8dfb14c2ce0cb6d4fcdd33802f2\\"", "size": 4768, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:12:03.000Z", "contentLength": 4768, "httpStatusCode": 200}	f2c43c59-6af3-4833-b43a-68393e52eeab	\N	{}
44cd8657-a020-402f-88fc-41ed1b6391a0	item-photos	public/gallery_0_1782448548981.webp	\N	2026-06-26 04:35:47.178522+00	2026-06-26 04:35:47.178522+00	2026-06-26 04:35:47.178522+00	{"eTag": "\\"bec7373f6a52d506cca347d67e9428d2\\"", "size": 6302, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:35:48.000Z", "contentLength": 6302, "httpStatusCode": 200}	477c23aa-fe47-408e-a5f3-a6a104484c8c	\N	{}
4aa6cc90-f3b7-4dca-9fde-6eaf048882ba	item-photos	public/thumbnail_258_1782448742147.webp	\N	2026-06-26 04:39:00.384944+00	2026-06-26 04:39:00.384944+00	2026-06-26 04:39:00.384944+00	{"eTag": "\\"e95b1aa90e20b495cc956826ad8ff5b6\\"", "size": 9104, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:39:01.000Z", "contentLength": 9104, "httpStatusCode": 200}	a5efddad-933b-4d0b-8cd7-0011726925ff	\N	{}
870704fd-a85d-4b3a-b011-5131d86d84e1	item-photos	public/gallery_0_1782448742624.webp	\N	2026-06-26 04:39:00.87727+00	2026-06-26 04:39:00.87727+00	2026-06-26 04:39:00.87727+00	{"eTag": "\\"c860cc00b8d363d8769b8d0b72551801\\"", "size": 6550, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:39:01.000Z", "contentLength": 6550, "httpStatusCode": 200}	028c69b4-c623-45dd-aa8a-15d33af33424	\N	{}
6db1d5d1-99ec-470b-85c6-942a0cd5ec4a	item-photos	public/thumbnail_211_1782450760306.webp	\N	2026-06-26 05:12:38.644495+00	2026-06-26 05:12:38.644495+00	2026-06-26 05:12:38.644495+00	{"eTag": "\\"f0630c315056cb743788ed9d2bb1af0f\\"", "size": 9024, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:12:39.000Z", "contentLength": 9024, "httpStatusCode": 200}	637293ea-f7d1-4e10-9281-86e86ed54b47	\N	{}
ed3b31df-44d5-4e16-98ad-9a477514208b	item-photos	public/thumbnail_260_1782448774660.webp	\N	2026-06-26 04:39:32.901468+00	2026-06-26 04:39:32.901468+00	2026-06-26 04:39:32.901468+00	{"eTag": "\\"713ff360582260ceaf4274ba841846fa\\"", "size": 8110, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:39:33.000Z", "contentLength": 8110, "httpStatusCode": 200}	b8622183-f61d-4d8f-8b4c-f33f713d6b23	\N	{}
b617ba1e-7503-4164-a17d-2efc77adbaa7	item-photos	public/thumbnail_261_1782448799480.webp	\N	2026-06-26 04:39:57.734186+00	2026-06-26 04:39:57.734186+00	2026-06-26 04:39:57.734186+00	{"eTag": "\\"4dfa5643ce48a33135e705266ce4d25c\\"", "size": 8704, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:39:58.000Z", "contentLength": 8704, "httpStatusCode": 200}	e5afe7b7-d3e6-44ac-8f12-67e122083fe3	\N	{}
e2bc64b4-9f6c-488d-ba4d-469ee860f3d6	item-photos	public/thumbnail_262_1782448815657.webp	\N	2026-06-26 04:40:13.947558+00	2026-06-26 04:40:13.947558+00	2026-06-26 04:40:13.947558+00	{"eTag": "\\"6c17272036b1e78bc3fcef00c34c8b03\\"", "size": 9134, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:40:14.000Z", "contentLength": 9134, "httpStatusCode": 200}	5a95d1ec-ce0e-468f-a571-fe33846b2cfd	\N	{}
c3ee1076-fa80-4148-ad37-b10ad3cf5fc9	item-photos	public/thumbnail_263_1782448832519.webp	\N	2026-06-26 04:40:30.812825+00	2026-06-26 04:40:30.812825+00	2026-06-26 04:40:30.812825+00	{"eTag": "\\"a32ce4100ba2c9995040599c5c0501c1\\"", "size": 8362, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:40:31.000Z", "contentLength": 8362, "httpStatusCode": 200}	df074de3-bc8e-4e20-8c4a-cca156506eaf	\N	{}
7fe4aa28-c870-4c43-b92b-2e722c1ae101	item-photos	public/thumbnail_264_1782448852988.webp	\N	2026-06-26 04:40:51.257546+00	2026-06-26 04:40:51.257546+00	2026-06-26 04:40:51.257546+00	{"eTag": "\\"4c62f0585941880ee5a05730a743fa47\\"", "size": 3026, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:40:52.000Z", "contentLength": 3026, "httpStatusCode": 200}	a40d59ed-968e-4471-8c9c-ba614777fd86	\N	{}
39656f23-a6b0-4e86-9a9a-00971f582b86	item-photos	public/thumbnail_210_1782450740243.webp	\N	2026-06-26 05:12:18.531913+00	2026-06-26 05:12:18.531913+00	2026-06-26 05:12:18.531913+00	{"eTag": "\\"93ce87a5055ff2e01f65cd976dd9df3f\\"", "size": 6400, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:12:19.000Z", "contentLength": 6400, "httpStatusCode": 200}	3ad996c4-a660-4329-9efa-27083000bb38	\N	{}
750e4ab5-f252-4c1d-9073-35e0de0c4c80	item-photos	public/gallery_0_1782448853489.webp	\N	2026-06-26 04:40:51.666479+00	2026-06-26 04:40:51.666479+00	2026-06-26 04:40:51.666479+00	{"eTag": "\\"fa23af99b1ab2e0a9975f5518def966f\\"", "size": 3226, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:40:52.000Z", "contentLength": 3226, "httpStatusCode": 200}	c48de4ba-ebb4-4ce9-937b-70029f3834e9	\N	{}
9c79c1bf-9a32-4353-bbc4-c3ba6d638357	item-photos	public/thumbnail_266_1782448875323.webp	\N	2026-06-26 04:41:13.583707+00	2026-06-26 04:41:13.583707+00	2026-06-26 04:41:13.583707+00	{"eTag": "\\"4837b87127a199eb21b082ff73dd5a8a\\"", "size": 8878, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:41:14.000Z", "contentLength": 8878, "httpStatusCode": 200}	a1211230-c587-4bb9-817f-148dac56f896	\N	{}
d208826c-3c7e-4bbc-a5df-84ff1bbb645c	item-photos	public/thumbnail_212_1782450779651.webp	\N	2026-06-26 05:12:58.112393+00	2026-06-26 05:12:58.112393+00	2026-06-26 05:12:58.112393+00	{"eTag": "\\"eca90dd331b314991db46b2e91c715a1\\"", "size": 9398, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:12:59.000Z", "contentLength": 9398, "httpStatusCode": 200}	a2ab9072-ae3b-449d-8fbd-c9834fcb2ba7	\N	{}
0d166277-3799-44aa-8252-c16c6ddc4293	item-photos	public/thumbnail_268_1782448916894.webp	\N	2026-06-26 04:41:55.141714+00	2026-06-26 04:41:55.141714+00	2026-06-26 04:41:55.141714+00	{"eTag": "\\"6b31388dea8582ab10790dca1fcfde47\\"", "size": 9158, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:41:56.000Z", "contentLength": 9158, "httpStatusCode": 200}	37fcbe15-d302-4fb4-865e-09419c74bae7	\N	{}
9eb42435-6cab-4125-bcbe-b6fc4f7a50d6	item-photos	public/gallery_0_1782448917519.webp	\N	2026-06-26 04:41:55.730852+00	2026-06-26 04:41:55.730852+00	2026-06-26 04:41:55.730852+00	{"eTag": "\\"22750ee590b8ca06f96e8a8b47ce56e4\\"", "size": 8244, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:41:56.000Z", "contentLength": 8244, "httpStatusCode": 200}	ae8c6ffb-c287-4f3f-a06a-0fbf3c738195	\N	{}
2017bb71-ce2d-4433-8551-d3213628f7bf	item-photos	public/thumbnail_1782450816907.webp	\N	2026-06-26 05:13:35.352126+00	2026-06-26 05:13:35.352126+00	2026-06-26 05:13:35.352126+00	{"eTag": "\\"b816d8e5dd06b0690dd52795b20e9401\\"", "size": 11434, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:13:36.000Z", "contentLength": 11434, "httpStatusCode": 200}	9b30959d-e555-45da-b683-236f7869c363	\N	{}
5aed5036-e4cc-433a-b64f-6510533bef66	item-photos	public/thumbnail_269_1782448932814.webp	\N	2026-06-26 04:42:11.083047+00	2026-06-26 04:42:11.083047+00	2026-06-26 04:42:11.083047+00	{"eTag": "\\"2d8cd203ecf62203604d0a59ab9f9d42\\"", "size": 9442, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:42:12.000Z", "contentLength": 9442, "httpStatusCode": 200}	3f38e306-7f65-4dca-a8bb-29f739fad427	\N	{}
a8f11301-a876-404e-af87-ba7876481a34	item-photos	public/thumbnail_272_1782449000336.webp	\N	2026-06-26 04:43:18.579391+00	2026-06-26 04:43:18.579391+00	2026-06-26 04:43:18.579391+00	{"eTag": "\\"78d41714185416a26d72a5c2254e5cd3\\"", "size": 1568, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:43:19.000Z", "contentLength": 1568, "httpStatusCode": 200}	0c4dbc2b-b109-4957-985b-c5605c989bfa	\N	{}
5ed16f45-97c2-4d39-b062-68e5e939ffd0	item-photos	public/thumbnail_1782450833157.webp	\N	2026-06-26 05:13:51.432905+00	2026-06-26 05:13:51.432905+00	2026-06-26 05:13:51.432905+00	{"eTag": "\\"ee401639e715bdaa876148cfec422b99\\"", "size": 2772, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:13:52.000Z", "contentLength": 2772, "httpStatusCode": 200}	21d88126-1458-40c6-bce4-31db3fb5d33a	\N	{}
5e41709e-a445-419b-8ea7-3bda15331f28	item-photos	public/thumbnail_273_1782449055955.webp	\N	2026-06-26 04:44:14.399931+00	2026-06-26 04:44:14.399931+00	2026-06-26 04:44:14.399931+00	{"eTag": "\\"45d0ecf54c0b101d6905a05cf6acb59e\\"", "size": 6444, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:44:15.000Z", "contentLength": 6444, "httpStatusCode": 200}	0261ce16-31d3-4bee-9282-91aa1e69f173	\N	{}
e1d0f7ca-043c-496b-aae6-8f8290953c53	item-photos	public/thumbnail_1783409113635.webp	\N	2026-07-07 07:25:13.057619+00	2026-07-07 07:25:13.057619+00	2026-07-07 07:25:13.057619+00	{"eTag": "\\"e641f868e89387e32501a399479211a3\\"", "size": 8050, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T07:25:14.000Z", "contentLength": 8050, "httpStatusCode": 200}	4ea59f02-b86d-4bab-87d0-7eb64977403e	\N	{}
3ade0d8d-53cd-47b1-ac32-7670b8b63f2d	item-photos	public/gallery_0_1782449056466.webp	\N	2026-06-26 04:44:14.730733+00	2026-06-26 04:44:14.730733+00	2026-06-26 04:44:14.730733+00	{"eTag": "\\"b51770fa1d38bf17282e47b1ad374de5\\"", "size": 3938, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:44:15.000Z", "contentLength": 3938, "httpStatusCode": 200}	1dfb6bb6-bda6-4fb6-961c-b1f8a843df12	\N	{}
66f23e73-7c63-4eb8-b0e8-10ed7763d55a	item-photos	public/thumbnail_1782449235239.webp	\N	2026-06-26 04:47:13.495461+00	2026-06-26 04:47:13.495461+00	2026-06-26 04:47:13.495461+00	{"eTag": "\\"fcbea086aea47522d1e6ec213a544f84\\"", "size": 9166, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:47:14.000Z", "contentLength": 9166, "httpStatusCode": 200}	75db5f9e-3c2f-4d52-bb7d-679bb28f7b6b	\N	{}
a125ef83-7b78-4a21-bbd4-974b4b211c37	item-photos	public/thumbnail_267_1782448899827.webp	\N	2026-06-26 04:41:38.067484+00	2026-06-26 04:41:38.067484+00	2026-06-26 04:41:38.067484+00	{"eTag": "\\"2e61d586a72e4589f528e09c806c108c\\"", "size": 7002, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:41:39.000Z", "contentLength": 7002, "httpStatusCode": 200}	a1cc41ca-8b13-4de2-8e40-dafdc00d4f27	\N	{}
4be818d9-38b4-4680-99e7-dc9c0be5fb5e	item-photos	public/thumbnail_213_1782450852538.webp	\N	2026-06-26 05:14:10.863639+00	2026-06-26 05:14:10.863639+00	2026-06-26 05:14:10.863639+00	{"eTag": "\\"b816d8e5dd06b0690dd52795b20e9401\\"", "size": 11434, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:14:11.000Z", "contentLength": 11434, "httpStatusCode": 200}	25d989c0-bc75-4c13-80bb-380db1bd4812	\N	{}
1b90ca63-99a4-4878-adb9-620f97382041	item-photos	public/thumbnail_270_1782448957270.webp	\N	2026-06-26 04:42:35.531522+00	2026-06-26 04:42:35.531522+00	2026-06-26 04:42:35.531522+00	{"eTag": "\\"7bdfc14f5184a8e451fd0662ebaf554a\\"", "size": 5862, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:42:36.000Z", "contentLength": 5862, "httpStatusCode": 200}	70a9c662-55a1-42d9-a9e5-6373ea1f0c55	\N	{}
8da42f7d-6a39-4ff9-928c-b3edb6083f00	item-photos	public/gallery_0_1782448958574.webp	\N	2026-06-26 04:42:36.774702+00	2026-06-26 04:42:36.774702+00	2026-06-26 04:42:36.774702+00	{"eTag": "\\"4a246e98d5155779a815736567b7bd82\\"", "size": 5230, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:42:37.000Z", "contentLength": 5230, "httpStatusCode": 200}	8fe17d8d-4979-481a-b8f5-7c6b450b250d	\N	{}
67e53929-3be3-4f1b-9657-631ffdcd939a	item-photos	public/thumbnail_214_1782450870582.webp	\N	2026-06-26 05:14:29.131403+00	2026-06-26 05:14:29.131403+00	2026-06-26 05:14:29.131403+00	{"eTag": "\\"8257a9527fa91a076f69a8620d2df62c\\"", "size": 2786, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:14:30.000Z", "contentLength": 2786, "httpStatusCode": 200}	cfd44141-0d48-4696-975c-a83a5a4782ab	\N	{}
50abeec9-c274-4d81-a7b0-f0eafc1602f8	item-photos	public/thumbnail_271_1782448979097.webp	\N	2026-06-26 04:42:57.366451+00	2026-06-26 04:42:57.366451+00	2026-06-26 04:42:57.366451+00	{"eTag": "\\"c32dcd92fd3959705a1e24c957e57297\\"", "size": 5398, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:42:58.000Z", "contentLength": 5398, "httpStatusCode": 200}	c0673727-48a3-41b8-a4ac-0f6a3325c10e	\N	{}
ba97a5b0-8aa1-4bc8-858d-9e84a69fa051	item-photos	public/gallery_0_1782448979803.webp	\N	2026-06-26 04:42:58.005094+00	2026-06-26 04:42:58.005094+00	2026-06-26 04:42:58.005094+00	{"eTag": "\\"8c5584e6f3539041f47b376cc2395865\\"", "size": 4144, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:42:58.000Z", "contentLength": 4144, "httpStatusCode": 200}	cc366f13-8d2b-48fd-91d9-a7287b9e2183	\N	{}
26cd7428-d3b5-4597-9a0c-e692be7a3399	item-photos	public/thumbnail_215_1782450899063.webp	\N	2026-06-26 05:14:57.371023+00	2026-06-26 05:14:57.371023+00	2026-06-26 05:14:57.371023+00	{"eTag": "\\"3305ba6f53d068c7189c95835f34e892\\"", "size": 4778, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:14:58.000Z", "contentLength": 4778, "httpStatusCode": 200}	c6439792-ef73-4255-86e1-9aaf9c3703c2	\N	{}
931cc08c-320c-414a-8562-83c8cc62d7fe	item-photos	public/thumbnail_274_1782449085587.webp	\N	2026-06-26 04:44:43.871348+00	2026-06-26 04:44:43.871348+00	2026-06-26 04:44:43.871348+00	{"eTag": "\\"111960802d9b64a8e58bad6e155505a8\\"", "size": 3064, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:44:44.000Z", "contentLength": 3064, "httpStatusCode": 200}	76a5da53-735f-4d06-b988-4eb8fb64bad7	\N	{}
ece5c9ed-f312-4fa7-9b8f-6bbf353bb165	item-photos	public/gallery_0_1782449086161.webp	\N	2026-06-26 04:44:44.568869+00	2026-06-26 04:44:44.568869+00	2026-06-26 04:44:44.568869+00	{"eTag": "\\"7d866e8b4b147b635bddff2dc42cc15a\\"", "size": 5166, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:44:45.000Z", "contentLength": 5166, "httpStatusCode": 200}	77a4ac42-0126-4449-8ff2-5b2ec506de16	\N	{}
711cf3aa-b3d4-432f-a114-b15c7c654645	item-photos	public/thumbnail_246_1782451821362.webp	\N	2026-06-26 05:30:20.204841+00	2026-06-26 05:30:20.204841+00	2026-06-26 05:30:20.204841+00	{"eTag": "\\"da2a5b08a8b9e7eec0c3afc891a5e992\\"", "size": 4110, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:30:21.000Z", "contentLength": 4110, "httpStatusCode": 200}	f20ae261-3087-48f5-8fe0-202d953e5336	\N	{}
5e6b9224-b028-467d-bece-b0c90641575d	item-photos	public/thumbnail_275_1782449102470.webp	\N	2026-06-26 04:45:00.728513+00	2026-06-26 04:45:00.728513+00	2026-06-26 04:45:00.728513+00	{"eTag": "\\"2c5d5e03e5c8f6d7532bf983469a9122\\"", "size": 1852, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:45:01.000Z", "contentLength": 1852, "httpStatusCode": 200}	dee6cebd-ef6c-46ac-b859-71d36106864b	\N	{}
ef4c32a7-2484-428b-a7e0-2a4e4f27f4b8	item-photos	public/thumbnail_276_1782449119087.webp	\N	2026-06-26 04:45:17.369115+00	2026-06-26 04:45:17.369115+00	2026-06-26 04:45:17.369115+00	{"eTag": "\\"e6694a1a2cb7be7b7f49d3ea502f6355\\"", "size": 8910, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:45:18.000Z", "contentLength": 8910, "httpStatusCode": 200}	790de1ee-642e-4926-9f87-d2bd45ad8408	\N	{}
d293f5a0-6b5d-4a72-a119-db3d68952e9b	item-photos	public/thumbnail_277_1782449138520.webp	\N	2026-06-26 04:45:37.068395+00	2026-06-26 04:45:37.068395+00	2026-06-26 04:45:37.068395+00	{"eTag": "\\"9e300050dba41ba5b869cd3613d50cbf\\"", "size": 5154, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:45:38.000Z", "contentLength": 5154, "httpStatusCode": 200}	63dd99db-28c4-4e3b-8243-37be3b6dbceb	\N	{}
eacd01e4-502a-49af-af4c-a269e9a53eb7	item-photos	public/thumbnail_1782449220963.webp	\N	2026-06-26 04:46:59.386597+00	2026-06-26 04:46:59.386597+00	2026-06-26 04:46:59.386597+00	{"eTag": "\\"00ef0d612446869c90d0631229b59f82\\"", "size": 8800, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:47:00.000Z", "contentLength": 8800, "httpStatusCode": 200}	92f3816c-d3d5-4d48-b36d-ace574a76ae3	\N	{}
95492c72-8db0-4f42-bc88-61de4a3bd438	item-photos	public/thumbnail_1782449253515.webp	\N	2026-06-26 04:47:31.803415+00	2026-06-26 04:47:31.803415+00	2026-06-26 04:47:31.803415+00	{"eTag": "\\"b31eb4c194630abe84555f25f106540a\\"", "size": 5052, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:47:32.000Z", "contentLength": 5052, "httpStatusCode": 200}	cb080c24-44de-459b-bd4d-7ed0de9c3ad2	\N	{}
7723938a-a07b-47dc-bf35-fbee5ffba29c	item-photos	public/thumbnail_217_1782450925176.webp	\N	2026-06-26 05:15:23.446312+00	2026-06-26 05:15:23.446312+00	2026-06-26 05:15:23.446312+00	{"eTag": "\\"42a575ff3327532190ab85f8a99fa221\\"", "size": 3614, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:15:24.000Z", "contentLength": 3614, "httpStatusCode": 200}	2741d73e-1c16-453f-8e58-31786c91c7c4	\N	{}
68568432-4764-4b1f-9775-590bc647e4c3	item-photos	public/thumbnail_1782449268538.webp	\N	2026-06-26 04:47:46.824433+00	2026-06-26 04:47:46.824433+00	2026-06-26 04:47:46.824433+00	{"eTag": "\\"a272e87793071adcbafcff3528f49e6e\\"", "size": 3970, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:47:47.000Z", "contentLength": 3970, "httpStatusCode": 200}	21171044-84dd-4ec7-abee-42859a65872f	\N	{}
ccc10eb4-b380-4360-8d0a-3b6b40fbd877	item-photos	public/thumbnail_1782449287490.webp	\N	2026-06-26 04:48:05.746332+00	2026-06-26 04:48:05.746332+00	2026-06-26 04:48:05.746332+00	{"eTag": "\\"2eee15a9c9a627ff166827fe168195ec\\"", "size": 5854, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:48:06.000Z", "contentLength": 5854, "httpStatusCode": 200}	5a96454c-9553-429d-92fb-1731c338ef2d	\N	{}
a46e4979-54ca-49b5-a3f9-0d0c4fda39eb	item-photos	public/thumbnail_218_1782450946230.webp	\N	2026-06-26 05:15:44.567462+00	2026-06-26 05:15:44.567462+00	2026-06-26 05:15:44.567462+00	{"eTag": "\\"275df50de128117cde739379c8d39477\\"", "size": 6678, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:15:45.000Z", "contentLength": 6678, "httpStatusCode": 200}	ec464fe6-43d9-4477-963a-dfef7ff28a14	\N	{}
63f033ee-c96f-4b74-b503-cdde7cef10d5	item-photos	public/thumbnail_1782449305457.webp	\N	2026-06-26 04:48:23.733176+00	2026-06-26 04:48:23.733176+00	2026-06-26 04:48:23.733176+00	{"eTag": "\\"9cd5b820d9a5d6ad6db168079686a43d\\"", "size": 6822, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:48:24.000Z", "contentLength": 6822, "httpStatusCode": 200}	5f85c52d-13a5-4f41-9810-f9b5508d4fa9	\N	{}
b51ee32c-fa76-4249-945a-3a14917a1abb	item-photos	public/thumbnail_1782449317541.webp	\N	2026-06-26 04:48:35.805909+00	2026-06-26 04:48:35.805909+00	2026-06-26 04:48:35.805909+00	{"eTag": "\\"cf1b639b675c96f6fe2093da74c6199c\\"", "size": 6898, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:48:36.000Z", "contentLength": 6898, "httpStatusCode": 200}	4c8b910d-b3bf-4c05-9468-dd5ce5a6488a	\N	{}
449c5559-7ffe-4bec-8653-939fa61c0867	item-photos	public/thumbnail_1782451060311.webp	\N	2026-06-26 05:17:38.983454+00	2026-06-26 05:17:38.983454+00	2026-06-26 05:17:38.983454+00	{"eTag": "\\"1cbb355d5bfd635c2846a539473407cd\\"", "size": 1428, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:17:39.000Z", "contentLength": 1428, "httpStatusCode": 200}	60bdfc44-264b-4bbf-aee0-9d86522a4089	\N	{}
cef21dbe-83eb-4ccd-8552-cf043803a8d6	item-photos	public/thumbnail_1782449334506.webp	\N	2026-06-26 04:48:52.763489+00	2026-06-26 04:48:52.763489+00	2026-06-26 04:48:52.763489+00	{"eTag": "\\"3b33b06d47396fd420e544562bad628f\\"", "size": 1928, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:48:53.000Z", "contentLength": 1928, "httpStatusCode": 200}	0bffb742-cae9-4d53-ae2c-f0a17fe79dff	\N	{}
fba4f589-abd3-4aa8-96ee-d03c018ed747	item-photos	public/thumbnail_194_1782449475424.webp	\N	2026-06-26 04:51:13.905121+00	2026-06-26 04:51:13.905121+00	2026-06-26 04:51:13.905121+00	{"eTag": "\\"00b759a440ad21e0f16a57073cd54217\\"", "size": 3408, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:51:14.000Z", "contentLength": 3408, "httpStatusCode": 200}	3d1ee86a-bf63-41c5-be16-8349beede36f	\N	{}
bab43596-8a39-49e6-a44a-908f916de1fe	item-photos	public/thumbnail_1782451514044.webp	\N	2026-06-26 05:25:12.725111+00	2026-06-26 05:25:12.725111+00	2026-06-26 05:25:12.725111+00	{"eTag": "\\"70780291352b438683f1e43332c44853\\"", "size": 12704, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:25:13.000Z", "contentLength": 12704, "httpStatusCode": 200}	2be46659-fb7f-49b5-8038-7d0ced1ce288	\N	{}
59e7400b-2355-4f89-9afb-f96e9cd669b3	item-photos	public/thumbnail_195_1782449491272.webp	\N	2026-06-26 04:51:29.532472+00	2026-06-26 04:51:29.532472+00	2026-06-26 04:51:29.532472+00	{"eTag": "\\"6711f0a55f2a0c716f67b099af6a9960\\"", "size": 5430, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:51:30.000Z", "contentLength": 5430, "httpStatusCode": 200}	6e21e9e4-82c1-4c76-923e-4ffc03532ab1	\N	{}
247e6319-2799-4dc2-b3d7-43009a066f09	item-photos	public/thumbnail_1782449516127.webp	\N	2026-06-26 04:51:54.399998+00	2026-06-26 04:51:54.399998+00	2026-06-26 04:51:54.399998+00	{"eTag": "\\"637a42f9373a0566fb90b9e6fa6d89db\\"", "size": 4944, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:51:55.000Z", "contentLength": 4944, "httpStatusCode": 200}	68c7ac2d-2c25-4630-8722-28b398b4117d	\N	{}
0e5384ab-ccd2-423c-bd1d-4c1629e878b9	item-photos	public/thumbnail_196_1782449531725.webp	\N	2026-06-26 04:52:09.99391+00	2026-06-26 04:52:09.99391+00	2026-06-26 04:52:09.99391+00	{"eTag": "\\"f9650710b3e7e9f77e93124e1859fb2d\\"", "size": 4042, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:52:10.000Z", "contentLength": 4042, "httpStatusCode": 200}	97318642-412e-44c0-904c-4c67506b08be	\N	{}
49d6f730-d7a1-4f8e-892f-dfb2bd1f90b1	item-photos	public/thumbnail_197_1782449552066.webp	\N	2026-06-26 04:52:30.376757+00	2026-06-26 04:52:30.376757+00	2026-06-26 04:52:30.376757+00	{"eTag": "\\"3eee5ef5e7c6c12c560e7fbf518cb1d4\\"", "size": 4382, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:52:31.000Z", "contentLength": 4382, "httpStatusCode": 200}	c4f010a4-5ae1-479c-b4e1-f7cf5240c201	\N	{}
0e4751f2-a0dc-4cc8-b8cf-3093e4998514	item-photos	public/gallery_0_1782449552481.webp	\N	2026-06-26 04:52:30.712184+00	2026-06-26 04:52:30.712184+00	2026-06-26 04:52:30.712184+00	{"eTag": "\\"59e28ad3ecf591839fe769bfac5553ff\\"", "size": 4176, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:52:31.000Z", "contentLength": 4176, "httpStatusCode": 200}	205a696e-42cb-413a-9184-3ffe6a175384	\N	{}
667c9d16-1782-44a5-b57e-79b12f44e542	item-photos	public/thumbnail_198_1782449573102.webp	\N	2026-06-26 04:52:51.366169+00	2026-06-26 04:52:51.366169+00	2026-06-26 04:52:51.366169+00	{"eTag": "\\"a925d2edd4ba6f6298a923af3a4106e3\\"", "size": 3892, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:52:52.000Z", "contentLength": 3892, "httpStatusCode": 200}	7c00b27c-4df8-41e6-8bb5-113fc48883ca	\N	{}
5b8ec02c-c350-4bf4-a1e0-d12767cc5976	item-photos	public/thumbnail_291_1782451836117.webp	\N	2026-06-26 05:30:34.420174+00	2026-06-26 05:30:34.420174+00	2026-06-26 05:30:34.420174+00	{"eTag": "\\"a468468a90d281f3f77c66dc5f1e272a\\"", "size": 7204, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:30:35.000Z", "contentLength": 7204, "httpStatusCode": 200}	99cf4882-d347-4b6e-99ee-82d9504f3a1b	\N	{}
f80f8f13-ca9c-43f1-9604-9be5dfbf6fca	item-photos	public/gallery_0_1782449573503.webp	\N	2026-06-26 04:52:51.778894+00	2026-06-26 04:52:51.778894+00	2026-06-26 04:52:51.778894+00	{"eTag": "\\"043d807870179926348bcc45ebe4d7c3\\"", "size": 3558, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:52:52.000Z", "contentLength": 3558, "httpStatusCode": 200}	62db22e7-796f-4081-8bb4-d3d7ff43641f	\N	{}
e979be09-523c-4266-a895-c5e32f46d6bc	item-photos	public/thumbnail_199_1782449593020.webp	\N	2026-06-26 04:53:11.324694+00	2026-06-26 04:53:11.324694+00	2026-06-26 04:53:11.324694+00	{"eTag": "\\"686750503e266557402a6e0f77cf4b68\\"", "size": 9160, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T04:53:12.000Z", "contentLength": 9160, "httpStatusCode": 200}	e37103c3-60bc-4360-be25-aa6f2bf5a79e	\N	{}
aecf84b7-348b-4fee-9be9-6432108dd12f	item-photos	public/thumbnail_1783409377675.webp	\N	2026-07-07 07:29:37.370688+00	2026-07-07 07:29:37.370688+00	2026-07-07 07:29:37.370688+00	{"eTag": "\\"e641f868e89387e32501a399479211a3\\"", "size": 8050, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T07:29:38.000Z", "contentLength": 8050, "httpStatusCode": 200}	d720ad33-09e7-400e-aa46-9d66c6c20f15	\N	{}
db3bf4b2-eda9-4335-9849-53f313fe2137	item-photos	public/thumbnail_200_1782450501402.webp	\N	2026-06-26 05:08:20.144802+00	2026-06-26 05:08:20.144802+00	2026-06-26 05:08:20.144802+00	{"eTag": "\\"ed052c88ccfd687256fe3897457cead9\\"", "size": 8534, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:08:21.000Z", "contentLength": 8534, "httpStatusCode": 200}	8b24687d-752e-4a67-83d4-a7e3d7bf03cf	\N	{}
c913e0b4-a7c9-4fa3-b424-05ed10c723a5	item-photos	public/thumbnail_201_1782450531799.webp	\N	2026-06-26 05:08:50.183047+00	2026-06-26 05:08:50.183047+00	2026-06-26 05:08:50.183047+00	{"eTag": "\\"cfa2cc1ad4911b8ed53883389d34329a\\"", "size": 8790, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:08:51.000Z", "contentLength": 8790, "httpStatusCode": 200}	08f15454-8810-465e-9a75-31d937aa0907	\N	{}
c1f86937-b287-4995-a577-61660e477654	item-photos	public/thumbnail_1783409391151.webp	\N	2026-07-07 07:29:50.580757+00	2026-07-07 07:29:50.580757+00	2026-07-07 07:29:50.580757+00	{"eTag": "\\"e641f868e89387e32501a399479211a3\\"", "size": 8050, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T07:29:51.000Z", "contentLength": 8050, "httpStatusCode": 200}	33f4cefe-f53c-472c-a263-3e9b920b31a3	\N	{}
2f9d5cb9-2837-40df-a8bc-80d048e0052c	item-photos	public/thumbnail_202_1782450554130.webp	\N	2026-06-26 05:09:12.400821+00	2026-06-26 05:09:12.400821+00	2026-06-26 05:09:12.400821+00	{"eTag": "\\"06030ba78916b3f143aff4ac1ec006ad\\"", "size": 8252, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:09:13.000Z", "contentLength": 8252, "httpStatusCode": 200}	2d65aa98-fb96-453c-a3c5-09cceea38ac3	\N	{}
38096e2b-79be-4559-8a33-334d89265417	item-photos	public/thumbnail_203_1782450575755.webp	\N	2026-06-26 05:09:34.100048+00	2026-06-26 05:09:34.100048+00	2026-06-26 05:09:34.100048+00	{"eTag": "\\"b4ec554834c1516ac1bf8f33eb1ea755\\"", "size": 10092, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:09:35.000Z", "contentLength": 10092, "httpStatusCode": 200}	9f83c880-b4dd-4ce0-b893-77ba6c9a944d	\N	{}
db9099e3-ff63-4378-a3b3-c12d2b9455eb	item-photos	public/thumbnail_1783409416590.webp	\N	2026-07-07 07:30:16.005488+00	2026-07-07 07:30:16.005488+00	2026-07-07 07:30:16.005488+00	{"eTag": "\\"e641f868e89387e32501a399479211a3\\"", "size": 8050, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T07:30:16.000Z", "contentLength": 8050, "httpStatusCode": 200}	e57c4445-1a19-439a-832b-a1ba39ba15b4	\N	{}
16587298-fe55-4c26-82e8-8551917c68ed	item-photos	public/gallery_0_1782450576267.webp	\N	2026-06-26 05:09:34.67356+00	2026-06-26 05:09:34.67356+00	2026-06-26 05:09:34.67356+00	{"eTag": "\\"e7f99b02f18b17ad42f064abe8c5cc75\\"", "size": 7520, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-06-26T05:09:35.000Z", "contentLength": 7520, "httpStatusCode": 200}	3e02378a-5b32-4e7a-8801-7dadd260a279	\N	{}
2dddb551-4f92-4046-ae28-3b7c44364edd	item-photos	public/thumbnail_1783412904912.webp	\N	2026-07-07 08:28:25.74318+00	2026-07-07 08:28:25.74318+00	2026-07-07 08:28:25.74318+00	{"eTag": "\\"0a71c9758a1b12f978335096922c71cd\\"", "size": 6834, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:28:26.000Z", "contentLength": 6834, "httpStatusCode": 200}	9f9548de-1da1-45f1-85d0-2dc73c4b40db	\N	{}
21e81537-e85b-4f7e-8767-02c3045f85af	item-photos	public/thumbnail_298_1783412984787.webp	\N	2026-07-07 08:29:44.471987+00	2026-07-07 08:29:44.471987+00	2026-07-07 08:29:44.471987+00	{"eTag": "\\"1b59b306a68207afb886e1e93eaae974\\"", "size": 13818, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:29:45.000Z", "contentLength": 13818, "httpStatusCode": 200}	28f5a4fe-b222-4998-a70b-1c96904eb0ed	\N	{}
bbcaf393-b643-46aa-be0b-871896150986	item-photos	public/thumbnail_298_1783412990706.webp	\N	2026-07-07 08:29:50.129626+00	2026-07-07 08:29:50.129626+00	2026-07-07 08:29:50.129626+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:29:51.000Z", "contentLength": 10020, "httpStatusCode": 200}	4229bb10-236d-4100-abb7-c5b6a6a82b77	\N	{}
468ea49f-ef3b-4297-8f5e-059582dc6282	item-photos	public/thumbnail_1783413052332.webp	\N	2026-07-07 08:30:53.205676+00	2026-07-07 08:30:53.205676+00	2026-07-07 08:30:53.205676+00	{"eTag": "\\"0a71c9758a1b12f978335096922c71cd\\"", "size": 6834, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:30:54.000Z", "contentLength": 6834, "httpStatusCode": 200}	1f9b6a4d-8b72-4f49-91c9-13123800a023	\N	{}
285ddcfb-ec36-4185-b9a6-1bbc32b8cc5b	item-photos	public/thumbnail_1783413073052.webp	\N	2026-07-07 08:31:13.663398+00	2026-07-07 08:31:13.663398+00	2026-07-07 08:31:13.663398+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:31:14.000Z", "contentLength": 10020, "httpStatusCode": 200}	c621d25e-0632-4076-83ee-1df373745bd5	\N	{}
2e189192-b743-4870-93f1-449095070df2	item-photos	public/thumbnail_1783413792962.webp	\N	2026-07-07 08:43:13.440793+00	2026-07-07 08:43:13.440793+00	2026-07-07 08:43:13.440793+00	{"eTag": "\\"1b59b306a68207afb886e1e93eaae974\\"", "size": 13818, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:43:14.000Z", "contentLength": 13818, "httpStatusCode": 200}	bb095b2e-eddd-4c75-902d-27910acf15bc	\N	{}
0e16d939-98f9-4783-9add-3b8bc144b4c5	item-photos	public/thumbnail_1783413810759.webp	\N	2026-07-07 08:43:30.197896+00	2026-07-07 08:43:30.197896+00	2026-07-07 08:43:30.197896+00	{"eTag": "\\"0a71c9758a1b12f978335096922c71cd\\"", "size": 6834, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:43:31.000Z", "contentLength": 6834, "httpStatusCode": 200}	5c538501-99af-4e26-8744-1a4129530fd4	\N	{}
6a867c87-9b9a-4828-bf97-5841164ee7fa	item-photos	public/thumbnail_1783413828081.webp	\N	2026-07-07 08:43:47.517084+00	2026-07-07 08:43:47.517084+00	2026-07-07 08:43:47.517084+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:43:48.000Z", "contentLength": 10020, "httpStatusCode": 200}	1a95ffb6-ab43-46e0-b1d6-795cf553fcec	\N	{}
e510903e-e78d-456e-8a0c-1876175727b2	item-photos	public/thumbnail_1783414668978.webp	\N	2026-07-07 08:57:49.588184+00	2026-07-07 08:57:49.588184+00	2026-07-07 08:57:49.588184+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:57:50.000Z", "contentLength": 10020, "httpStatusCode": 200}	2b813b11-b7c0-458a-bb40-d8de4bd3a137	\N	{}
7bd4faad-e988-4036-babf-327db853ed13	item-photos	public/thumbnail_1783414686812.webp	\N	2026-07-07 08:58:07.055883+00	2026-07-07 08:58:07.055883+00	2026-07-07 08:58:07.055883+00	{"eTag": "\\"0a71c9758a1b12f978335096922c71cd\\"", "size": 6834, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T08:58:08.000Z", "contentLength": 6834, "httpStatusCode": 200}	bdd8a243-aadf-4652-b039-30b48b7a79ad	\N	{}
115c3cc4-9ac0-4461-8843-84a191510354	item-photos	public/thumbnail_1783415270471.webp	\N	2026-07-07 09:07:51.405577+00	2026-07-07 09:07:51.405577+00	2026-07-07 09:07:51.405577+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T09:07:52.000Z", "contentLength": 10020, "httpStatusCode": 200}	c287ebaf-c2a2-446d-90a1-c91ec92ea919	\N	{}
b3408ffb-4a3d-4b43-b591-80b22d9f7988	item-photos	public/thumbnail_1783415363084.webp	\N	2026-07-07 09:09:23.298867+00	2026-07-07 09:09:23.298867+00	2026-07-07 09:09:23.298867+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T09:09:24.000Z", "contentLength": 10020, "httpStatusCode": 200}	6e528bf7-08f9-4c82-a935-3ae89278e22f	\N	{}
459033e4-ea9b-4826-8e9d-3fe4ad6f80d1	item-photos	public/thumbnail_1783415669343.webp	\N	2026-07-07 09:14:29.946124+00	2026-07-07 09:14:29.946124+00	2026-07-07 09:14:29.946124+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T09:14:30.000Z", "contentLength": 10020, "httpStatusCode": 200}	5563372d-1ff0-4e50-9532-82d409ac121d	\N	{}
7d17e763-17a0-43d7-aa3f-f9748f3ec927	item-photos	public/thumbnail_1783415709098.webp	\N	2026-07-07 09:15:09.705492+00	2026-07-07 09:15:09.705492+00	2026-07-07 09:15:09.705492+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T09:15:10.000Z", "contentLength": 10020, "httpStatusCode": 200}	bf53651d-acb3-4b2c-a262-1cb253edc624	\N	{}
73f4dfd4-216c-4c4b-acdc-9f1608d2e4be	item-photos	public/thumbnail_1783415968410.webp	\N	2026-07-07 09:19:29.229044+00	2026-07-07 09:19:29.229044+00	2026-07-07 09:19:29.229044+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T09:19:30.000Z", "contentLength": 10020, "httpStatusCode": 200}	2adeb2bd-945d-45a3-8cc5-44b6a9034b8d	\N	{}
e4a7d448-f66a-4ec3-898c-682a02c59f28	item-photos	public/gallery_0_1783415970325.webp	\N	2026-07-07 09:19:30.903603+00	2026-07-07 09:19:30.903603+00	2026-07-07 09:19:30.903603+00	{"eTag": "\\"0a71c9758a1b12f978335096922c71cd\\"", "size": 6834, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T09:19:31.000Z", "contentLength": 6834, "httpStatusCode": 200}	e618e5c9-bfe9-4d1a-b626-8a4f686f0c19	\N	{}
a3557b3e-cf2b-41f5-844c-dfd7ba1bcd6f	item-photos	public/thumbnail_1783415986521.webp	\N	2026-07-07 09:19:47.211348+00	2026-07-07 09:19:47.211348+00	2026-07-07 09:19:47.211348+00	{"eTag": "\\"0a71c9758a1b12f978335096922c71cd\\"", "size": 6834, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T09:19:48.000Z", "contentLength": 6834, "httpStatusCode": 200}	5a6a6ddc-26da-45ea-b79e-ad60bbf6aa01	\N	{}
acfc1ba7-8537-4df2-a53f-4d848ee5a78f	item-photos	public/gallery_0_1783415987605.webp	\N	2026-07-07 09:19:48.19821+00	2026-07-07 09:19:48.19821+00	2026-07-07 09:19:48.19821+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T09:19:49.000Z", "contentLength": 10020, "httpStatusCode": 200}	f4a3a6d2-769a-40d6-9157-8b62b86257f2	\N	{}
320c11ca-965a-44d9-9ad6-7395f8daee0f	item-photos	public/thumbnail_1783416046882.webp	\N	2026-07-07 09:20:47.558931+00	2026-07-07 09:20:47.558931+00	2026-07-07 09:20:47.558931+00	{"eTag": "\\"0a71c9758a1b12f978335096922c71cd\\"", "size": 6834, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-07T09:20:48.000Z", "contentLength": 6834, "httpStatusCode": 200}	6bfb57d6-2eaf-4828-8fe0-9b70adf21b63	\N	{}
0b9a330c-3458-4faa-b047-c32447dedd70	item-photos	public/thumbnail_1783585811378.webp	\N	2026-07-09 08:30:12.323533+00	2026-07-09 08:30:12.323533+00	2026-07-09 08:30:12.323533+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-09T08:30:13.000Z", "contentLength": 10020, "httpStatusCode": 200}	f94e3f28-0b7a-45c7-b5ca-d13463f08879	\N	{}
72c61ac3-22a8-44fe-8566-afb5fea1195c	item-photos	public/thumbnail_1783588748035.webp	\N	2026-07-09 09:19:09.175132+00	2026-07-09 09:19:09.175132+00	2026-07-09 09:19:09.175132+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-09T09:19:10.000Z", "contentLength": 10020, "httpStatusCode": 200}	4143d032-f36a-4eed-9db8-52dfac6aa5ab	\N	{}
80221c26-0237-4350-a069-96c3bd0d7d22	item-photos	public/thumbnail_1783588763959.webp	\N	2026-07-09 09:19:24.61964+00	2026-07-09 09:19:24.61964+00	2026-07-09 09:19:24.61964+00	{"eTag": "\\"7b7f0c3ee0b9718854ee4e1e17d50561\\"", "size": 10020, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-07-09T09:19:25.000Z", "contentLength": 10020, "httpStatusCode": 200}	bd31e26f-141b-4723-9502-da8ceff68689	\N	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 237, true);


--
-- Name: incoming_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incoming_transactions_id_seq', 189, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 315, true);


--
-- Name: outgoing_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outgoing_transactions_id_seq', 78, true);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 264, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: incoming_items incoming_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_items
    ADD CONSTRAINT incoming_items_pkey PRIMARY KEY (transaction_id, item_id);


--
-- Name: incoming_transactions incoming_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_transactions
    ADD CONSTRAINT incoming_transactions_pkey PRIMARY KEY (id);


--
-- Name: items items_master_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_master_number_key UNIQUE (master_number);


--
-- Name: items items_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_name_key UNIQUE (name);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: outgoing_items outgoing_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_items
    ADD CONSTRAINT outgoing_items_pkey PRIMARY KEY (transaction_id, item_id);


--
-- Name: outgoing_transactions outgoing_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_transactions
    ADD CONSTRAINT outgoing_transactions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_name_key UNIQUE (name);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: messages messages_payload_exclusive; Type: CHECK CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages
    ADD CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL))) NOT VALID;


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: idx_users_created_at_desc; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_users_created_at_desc ON auth.users USING btree (created_at DESC);


--
-- Name: idx_users_email; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_users_email ON auth.users USING btree (email);


--
-- Name: idx_users_last_sign_in_at_desc; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_users_last_sign_in_at_desc ON auth.users USING btree (last_sign_in_at DESC);


--
-- Name: idx_users_name; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_users_name ON auth.users USING btree (((raw_user_meta_data ->> 'name'::text))) WHERE ((raw_user_meta_data ->> 'name'::text) IS NOT NULL);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_selec; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_selec ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter, COALESCE(selected_columns, '{}'::text[]));


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: incoming_items incoming_items_incoming_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_items
    ADD CONSTRAINT incoming_items_incoming_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.incoming_transactions(id) ON DELETE CASCADE;


--
-- Name: incoming_items incoming_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_items
    ADD CONSTRAINT incoming_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: outgoing_items incoming_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_items
    ADD CONSTRAINT incoming_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: incoming_transactions incoming_transactions_logger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_transactions
    ADD CONSTRAINT incoming_transactions_logger_id_fkey FOREIGN KEY (logger_id) REFERENCES public.users(id);


--
-- Name: incoming_transactions incoming_transactions_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_transactions
    ADD CONSTRAINT incoming_transactions_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);


--
-- Name: items items_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: outgoing_items outgoing_items_outgoing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_items
    ADD CONSTRAINT outgoing_items_outgoing_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.outgoing_transactions(id) ON DELETE CASCADE;


--
-- Name: outgoing_transactions outgoing_transactions_logger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_transactions
    ADD CONSTRAINT outgoing_transactions_logger_id_fkey FOREIGN KEY (logger_id) REFERENCES public.users(id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Give anon users access to JPG images in folder 13j4whn_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give anon users access to JPG images in folder 13j4whn_0" ON storage.objects FOR SELECT USING (((bucket_id = 'item-photos'::text) AND (storage.extension(name) = 'webp'::text) AND (lower((storage.foldername(name))[1]) = 'public'::text) AND (auth.role() = 'anon'::text)));


--
-- Name: objects Give anon users access to JPG images in folder 13j4whn_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give anon users access to JPG images in folder 13j4whn_1" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'item-photos'::text) AND (storage.extension(name) = 'webp'::text) AND (lower((storage.foldername(name))[1]) = 'public'::text) AND (auth.role() = 'anon'::text)));


--
-- Name: objects Give anon users access to JPG images in folder 13j4whn_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give anon users access to JPG images in folder 13j4whn_2" ON storage.objects FOR UPDATE USING (((bucket_id = 'item-photos'::text) AND (storage.extension(name) = 'webp'::text) AND (lower((storage.foldername(name))[1]) = 'public'::text) AND (auth.role() = 'anon'::text)));


--
-- Name: objects Give anon users access to JPG images in folder 13j4whn_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give anon users access to JPG images in folder 13j4whn_3" ON storage.objects FOR DELETE USING (((bucket_id = 'item-photos'::text) AND (storage.extension(name) = 'webp'::text) AND (lower((storage.foldername(name))[1]) = 'public'::text) AND (auth.role() = 'anon'::text)));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION citextin(cstring); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citextin(cstring) TO postgres;
GRANT ALL ON FUNCTION public.citextin(cstring) TO anon;
GRANT ALL ON FUNCTION public.citextin(cstring) TO authenticated;
GRANT ALL ON FUNCTION public.citextin(cstring) TO service_role;


--
-- Name: FUNCTION citextout(public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citextout(public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citextout(public.citext) TO anon;
GRANT ALL ON FUNCTION public.citextout(public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citextout(public.citext) TO service_role;


--
-- Name: FUNCTION citextrecv(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citextrecv(internal) TO postgres;
GRANT ALL ON FUNCTION public.citextrecv(internal) TO anon;
GRANT ALL ON FUNCTION public.citextrecv(internal) TO authenticated;
GRANT ALL ON FUNCTION public.citextrecv(internal) TO service_role;


--
-- Name: FUNCTION citextsend(public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citextsend(public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citextsend(public.citext) TO anon;
GRANT ALL ON FUNCTION public.citextsend(public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citextsend(public.citext) TO service_role;


--
-- Name: FUNCTION citext(boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext(boolean) TO postgres;
GRANT ALL ON FUNCTION public.citext(boolean) TO anon;
GRANT ALL ON FUNCTION public.citext(boolean) TO authenticated;
GRANT ALL ON FUNCTION public.citext(boolean) TO service_role;


--
-- Name: FUNCTION citext(character); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext(character) TO postgres;
GRANT ALL ON FUNCTION public.citext(character) TO anon;
GRANT ALL ON FUNCTION public.citext(character) TO authenticated;
GRANT ALL ON FUNCTION public.citext(character) TO service_role;


--
-- Name: FUNCTION citext(inet); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext(inet) TO postgres;
GRANT ALL ON FUNCTION public.citext(inet) TO anon;
GRANT ALL ON FUNCTION public.citext(inet) TO authenticated;
GRANT ALL ON FUNCTION public.citext(inet) TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION citext_cmp(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_cmp(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_cmp(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_cmp(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_cmp(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_eq(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_eq(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_eq(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_eq(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_eq(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_ge(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_ge(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_ge(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_ge(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_ge(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_gt(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_gt(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_gt(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_gt(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_gt(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_hash(public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_hash(public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_hash(public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_hash(public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_hash(public.citext) TO service_role;


--
-- Name: FUNCTION citext_hash_extended(public.citext, bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_hash_extended(public.citext, bigint) TO postgres;
GRANT ALL ON FUNCTION public.citext_hash_extended(public.citext, bigint) TO anon;
GRANT ALL ON FUNCTION public.citext_hash_extended(public.citext, bigint) TO authenticated;
GRANT ALL ON FUNCTION public.citext_hash_extended(public.citext, bigint) TO service_role;


--
-- Name: FUNCTION citext_larger(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_larger(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_larger(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_larger(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_larger(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_le(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_le(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_le(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_le(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_le(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_lt(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_lt(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_lt(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_lt(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_lt(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_ne(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_ne(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_ne(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_ne(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_ne(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_pattern_cmp(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_pattern_cmp(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_pattern_cmp(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_pattern_cmp(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_pattern_cmp(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_pattern_ge(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_pattern_ge(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_pattern_ge(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_pattern_ge(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_pattern_ge(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_pattern_gt(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_pattern_gt(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_pattern_gt(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_pattern_gt(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_pattern_gt(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_pattern_le(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_pattern_le(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_pattern_le(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_pattern_le(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_pattern_le(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_pattern_lt(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_pattern_lt(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_pattern_lt(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_pattern_lt(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_pattern_lt(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION citext_smaller(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.citext_smaller(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.citext_smaller(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.citext_smaller(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.citext_smaller(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION regexp_match(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_match(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.regexp_match(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.regexp_match(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_match(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION regexp_match(public.citext, public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_match(public.citext, public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.regexp_match(public.citext, public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.regexp_match(public.citext, public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_match(public.citext, public.citext, text) TO service_role;


--
-- Name: FUNCTION regexp_matches(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_matches(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.regexp_matches(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.regexp_matches(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_matches(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION regexp_matches(public.citext, public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_matches(public.citext, public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.regexp_matches(public.citext, public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.regexp_matches(public.citext, public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_matches(public.citext, public.citext, text) TO service_role;


--
-- Name: FUNCTION regexp_replace(public.citext, public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_replace(public.citext, public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.regexp_replace(public.citext, public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.regexp_replace(public.citext, public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_replace(public.citext, public.citext, text) TO service_role;


--
-- Name: FUNCTION regexp_replace(public.citext, public.citext, text, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_replace(public.citext, public.citext, text, text) TO postgres;
GRANT ALL ON FUNCTION public.regexp_replace(public.citext, public.citext, text, text) TO anon;
GRANT ALL ON FUNCTION public.regexp_replace(public.citext, public.citext, text, text) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_replace(public.citext, public.citext, text, text) TO service_role;


--
-- Name: FUNCTION regexp_split_to_array(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_split_to_array(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.regexp_split_to_array(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.regexp_split_to_array(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_split_to_array(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION regexp_split_to_array(public.citext, public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_split_to_array(public.citext, public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.regexp_split_to_array(public.citext, public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.regexp_split_to_array(public.citext, public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_split_to_array(public.citext, public.citext, text) TO service_role;


--
-- Name: FUNCTION regexp_split_to_table(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_split_to_table(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.regexp_split_to_table(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.regexp_split_to_table(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_split_to_table(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION regexp_split_to_table(public.citext, public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.regexp_split_to_table(public.citext, public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.regexp_split_to_table(public.citext, public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.regexp_split_to_table(public.citext, public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.regexp_split_to_table(public.citext, public.citext, text) TO service_role;


--
-- Name: FUNCTION replace(public.citext, public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.replace(public.citext, public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.replace(public.citext, public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.replace(public.citext, public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.replace(public.citext, public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION split_part(public.citext, public.citext, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.split_part(public.citext, public.citext, integer) TO postgres;
GRANT ALL ON FUNCTION public.split_part(public.citext, public.citext, integer) TO anon;
GRANT ALL ON FUNCTION public.split_part(public.citext, public.citext, integer) TO authenticated;
GRANT ALL ON FUNCTION public.split_part(public.citext, public.citext, integer) TO service_role;


--
-- Name: FUNCTION strpos(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.strpos(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.strpos(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.strpos(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.strpos(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION texticlike(public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.texticlike(public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.texticlike(public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.texticlike(public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.texticlike(public.citext, text) TO service_role;


--
-- Name: FUNCTION texticlike(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.texticlike(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.texticlike(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.texticlike(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.texticlike(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION texticnlike(public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.texticnlike(public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.texticnlike(public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.texticnlike(public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.texticnlike(public.citext, text) TO service_role;


--
-- Name: FUNCTION texticnlike(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.texticnlike(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.texticnlike(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.texticnlike(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.texticnlike(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION texticregexeq(public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.texticregexeq(public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.texticregexeq(public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.texticregexeq(public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.texticregexeq(public.citext, text) TO service_role;


--
-- Name: FUNCTION texticregexeq(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.texticregexeq(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.texticregexeq(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.texticregexeq(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.texticregexeq(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION texticregexne(public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.texticregexne(public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.texticregexne(public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.texticregexne(public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.texticregexne(public.citext, text) TO service_role;


--
-- Name: FUNCTION texticregexne(public.citext, public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.texticregexne(public.citext, public.citext) TO postgres;
GRANT ALL ON FUNCTION public.texticregexne(public.citext, public.citext) TO anon;
GRANT ALL ON FUNCTION public.texticregexne(public.citext, public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.texticregexne(public.citext, public.citext) TO service_role;


--
-- Name: FUNCTION translate(public.citext, public.citext, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.translate(public.citext, public.citext, text) TO postgres;
GRANT ALL ON FUNCTION public.translate(public.citext, public.citext, text) TO anon;
GRANT ALL ON FUNCTION public.translate(public.citext, public.citext, text) TO authenticated;
GRANT ALL ON FUNCTION public.translate(public.citext, public.citext, text) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text, negate boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text, negate boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text, negate boolean) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text, negate boolean) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text, negate boolean) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text, negate boolean) TO service_role;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION send_binary(payload bytea, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION wal2json_escape_identifier(name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.wal2json_escape_identifier(name text) TO postgres;
GRANT ALL ON FUNCTION realtime.wal2json_escape_identifier(name text) TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION max(public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.max(public.citext) TO postgres;
GRANT ALL ON FUNCTION public.max(public.citext) TO anon;
GRANT ALL ON FUNCTION public.max(public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.max(public.citext) TO service_role;


--
-- Name: FUNCTION min(public.citext); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.min(public.citext) TO postgres;
GRANT ALL ON FUNCTION public.min(public.citext) TO anon;
GRANT ALL ON FUNCTION public.min(public.citext) TO authenticated;
GRANT ALL ON FUNCTION public.min(public.citext) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE webauthn_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_challenges TO postgres;
GRANT ALL ON TABLE auth.webauthn_challenges TO dashboard_user;


--
-- Name: TABLE webauthn_credentials; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_credentials TO postgres;
GRANT ALL ON TABLE auth.webauthn_credentials TO dashboard_user;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.categories TO anon;
GRANT ALL ON TABLE public.categories TO authenticated;
GRANT ALL ON TABLE public.categories TO service_role;


--
-- Name: SEQUENCE categories_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.categories_id_seq TO anon;
GRANT ALL ON SEQUENCE public.categories_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.categories_id_seq TO service_role;


--
-- Name: TABLE incoming_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.incoming_items TO anon;
GRANT ALL ON TABLE public.incoming_items TO authenticated;
GRANT ALL ON TABLE public.incoming_items TO service_role;


--
-- Name: TABLE incoming_transactions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.incoming_transactions TO anon;
GRANT ALL ON TABLE public.incoming_transactions TO authenticated;
GRANT ALL ON TABLE public.incoming_transactions TO service_role;


--
-- Name: SEQUENCE incoming_transactions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.incoming_transactions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.incoming_transactions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.incoming_transactions_id_seq TO service_role;


--
-- Name: TABLE items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.items TO anon;
GRANT ALL ON TABLE public.items TO authenticated;
GRANT ALL ON TABLE public.items TO service_role;


--
-- Name: SEQUENCE items_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.items_id_seq TO anon;
GRANT ALL ON SEQUENCE public.items_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.items_id_seq TO service_role;


--
-- Name: TABLE outgoing_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.outgoing_items TO anon;
GRANT ALL ON TABLE public.outgoing_items TO authenticated;
GRANT ALL ON TABLE public.outgoing_items TO service_role;


--
-- Name: TABLE net_quantity; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.net_quantity TO anon;
GRANT ALL ON TABLE public.net_quantity TO authenticated;
GRANT ALL ON TABLE public.net_quantity TO service_role;


--
-- Name: TABLE outgoing_transactions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.outgoing_transactions TO anon;
GRANT ALL ON TABLE public.outgoing_transactions TO authenticated;
GRANT ALL ON TABLE public.outgoing_transactions TO service_role;


--
-- Name: SEQUENCE outgoing_transactions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.outgoing_transactions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.outgoing_transactions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.outgoing_transactions_id_seq TO service_role;


--
-- Name: TABLE quantity_trend; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.quantity_trend TO anon;
GRANT ALL ON TABLE public.quantity_trend TO authenticated;
GRANT ALL ON TABLE public.quantity_trend TO service_role;


--
-- Name: TABLE quantity_trend_timeline; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.quantity_trend_timeline TO anon;
GRANT ALL ON TABLE public.quantity_trend_timeline TO authenticated;
GRANT ALL ON TABLE public.quantity_trend_timeline TO service_role;


--
-- Name: TABLE sessions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.sessions TO anon;
GRANT ALL ON TABLE public.sessions TO authenticated;
GRANT ALL ON TABLE public.sessions TO service_role;


--
-- Name: TABLE suppliers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.suppliers TO anon;
GRANT ALL ON TABLE public.suppliers TO authenticated;
GRANT ALL ON TABLE public.suppliers TO service_role;


--
-- Name: SEQUENCE suppliers_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.suppliers_id_seq TO anon;
GRANT ALL ON SEQUENCE public.suppliers_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.suppliers_id_seq TO service_role;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO anon;
GRANT ALL ON TABLE public.users TO authenticated;
GRANT ALL ON TABLE public.users TO service_role;


--
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.users_id_seq TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict wn6t7thgPCJCexbf6CXCoeSlctGbjvtoYW0n2wIaMKxiC6bju24gXeaXwMQcbbE

