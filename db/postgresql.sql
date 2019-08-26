PGDMP     7    4                w            venus    10.9    10.9 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    19610    venus    DATABASE     �   CREATE DATABASE venus WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Chinese (Simplified)_China.936' LC_CTYPE = 'Chinese (Simplified)_China.936';
    DROP DATABASE venus;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    14                        2615    19611    tiger    SCHEMA        CREATE SCHEMA tiger;
    DROP SCHEMA tiger;
             postgres    false                        2615    19612 
   tiger_data    SCHEMA        CREATE SCHEMA tiger_data;
    DROP SCHEMA tiger_data;
             postgres    false                        2615    19613    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
             postgres    false            �           0    0    SCHEMA topology    COMMENT     9   COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
                  postgres    false    15                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            
            3079    19614    address_standardizer 	   EXTENSION     H   CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;
 %   DROP EXTENSION address_standardizer;
                  false    14            �           0    0    EXTENSION address_standardizer    COMMENT     �   COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';
                       false    10            	            3079    19621    address_standardizer_data_us 	   EXTENSION     P   CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;
 -   DROP EXTENSION address_standardizer_data_us;
                  false    14            �           0    0 &   EXTENSION address_standardizer_data_us    COMMENT     `   COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';
                       false    9                        3079    19664    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                  false    14            �           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                       false    8                        3079    19675    ogr_fdw 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;
    DROP EXTENSION ogr_fdw;
                  false    14            �           0    0    EXTENSION ogr_fdw    COMMENT     L   COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';
                       false    7                        3079    19679    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    14            �           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    6                        3079    21207 	   pgrouting 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;
    DROP EXTENSION pgrouting;
                  false    14    6            �           0    0    EXTENSION pgrouting    COMMENT     9   COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';
                       false    5                        3079    21409 
   pointcloud 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;
    DROP EXTENSION pointcloud;
                  false    14            �           0    0    EXTENSION pointcloud    COMMENT     G   COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';
                       false    4                        3079    21505    pointcloud_postgis 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;
 #   DROP EXTENSION pointcloud_postgis;
                  false    4    14    6            �           0    0    EXTENSION pointcloud_postgis    COMMENT     n   COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';
                       false    3                        3079    21516    postgis_sfcgal 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;
    DROP EXTENSION postgis_sfcgal;
                  false    6    14            �           0    0    EXTENSION postgis_sfcgal    COMMENT     C   COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';
                       false    2                        3079    21534    postgis_tiger_geocoder 	   EXTENSION     I   CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
 '   DROP EXTENSION postgis_tiger_geocoder;
                  false    21    8    6            �           0    0     EXTENSION postgis_tiger_geocoder    COMMENT     ^   COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
                       false    11                        3079    21960    postgis_topology 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
 !   DROP EXTENSION postgis_topology;
                  false    15    6            �           0    0    EXTENSION postgis_topology    COMMENT     Y   COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
                       false    12            �           1255    22399    customgcj02towgs84(numeric[])    FUNCTION     R  CREATE FUNCTION public.customgcj02towgs84(lnglatarray numeric[]) RETURNS numeric[]
    LANGUAGE plpgsql
    AS $$
declare 
	res numeric[];
	arrLen integer:= array_length(lngLatArray, 1);
	len integer:= 0;
	lat numeric;
	lng numeric;
	radLat numeric;
	magic numeric;
	magicsqrt numeric;
	const_ee numeric:= 0.00669342162296594323;
	const_a numeric:= 6378245.0;
BEGIN
	while len > arrLen
		loop
			lng := customtransformlng(lngLatArray[len][0] - 105, lngLatArray[len][1] - 35);
			lat := customtransformlat(lngLatArray[len][0] - 105, lngLatArray[len][1] - 35);
			radLat :=  lngLatArray[len][1] / 180 * PI();
			magic := sin(radLat);
			magic := 1 - const_ee * magic * magic;
			magicsqrt := sqrt(magic);
			lng := (lng * 180) / (const_a / magicsqrt * cos(radLat) * PI());
			lat := (lat * 180) / ((const_a * (1 - const_ee)) / (magic * magicsqrt) * PI());
			res := array_append(res, array[lng, lat]);
			len := len + 1;
			lng := lngLatArray[len];
			lat := lngLatArray[len];
			res := array_append(res, array[lng, lat]);
			len := len + 1;
		 end loop;
	 return lngLatArray::json ->0 ::json -> 0;
END;
$$;
 @   DROP FUNCTION public.customgcj02towgs84(lnglatarray numeric[]);
       public       postgres    false    14    1            �           1255    22411    customgcj02towgs84(numeric)    FUNCTION     E  CREATE FUNCTION public.customgcj02towgs84(lnglatarray numeric) RETURNS numeric[]
    LANGUAGE plpgsql
    AS $$
declare 
	res numeric[];
	arrLen integer:= array_length(lngLatArray, 1);
	len integer:= 0;
	lat numeric;
	lng numeric;
	radLat numeric;
	magic numeric;
	magicsqrt numeric;
	const_ee numeric:= 0.00669342162296594323;
	const_a numeric:= 6378245.0;
BEGIN
	while len > arrLen
		loop
			lng := customtransformlng(lngLatArray[len][0] - 105, lngLatArray[len][1] - 35);
			lat := customtransformlat(lngLatArray[len][0] - 105, lngLatArray[len][1] - 35);
			radLat :=  lngLatArray[len][1] / 180 * PI();
			magic := sin(radLat);
			magic := 1 - const_ee * magic * magic;
			magicsqrt := sqrt(magic);
			lng := (lng * 180) / (const_a / magicsqrt * cos(radLat) * PI());
			lat := (lat * 180) / ((const_a * (1 - const_ee)) / (magic * magicsqrt) * PI());
			res := array_append(res, array[lng, lat]);
			len := len + 1;
			lng := lngLatArray[len];
			lat := lngLatArray[len];
			res := array_append(res, array[lng, lat]);
			len := len + 1;
		 end loop;
	 return lngLatArray::json -> 0;
END;
$$;
 >   DROP FUNCTION public.customgcj02towgs84(lnglatarray numeric);
       public       postgres    false    14    1            �           1255    22412 %   customgcj02towgs84(character varying)    FUNCTION     �  CREATE FUNCTION public.customgcj02towgs84(lnglatarray character varying) RETURNS numeric[]
    LANGUAGE plpgsql
    AS $$
declare 
	res numeric[];
-- 	arrLen integer:= array_length(lngLatArray, 1);
	len integer:= 0;
	lat numeric;
	lng numeric;
	radLat numeric;
	magic numeric;
	magicsqrt numeric;
	const_ee numeric:= 0.00669342162296594323;
	const_a numeric:= 6378245.0;
BEGIN
-- 	while len > arrLen
-- 		loop
-- 			lng := customtransformlng(lngLatArray[len][0] - 105, lngLatArray[len][1] - 35);
-- 			lat := customtransformlat(lngLatArray[len][0] - 105, lngLatArray[len][1] - 35);
-- 			radLat :=  lngLatArray[len][1] / 180 * PI();
-- 			magic := sin(radLat);
-- 			magic := 1 - const_ee * magic * magic;
-- 			magicsqrt := sqrt(magic);
-- 			lng := (lng * 180) / (const_a / magicsqrt * cos(radLat) * PI());
-- 			lat := (lat * 180) / ((const_a * (1 - const_ee)) / (magic * magicsqrt) * PI());
-- 			res := array_append(res, array[lng, lat]);
-- 			len := len + 1;
-- 			lng := lngLatArray[len];
-- 			lat := lngLatArray[len];
-- 			res := array_append(res, array[lng, lat]);
-- 			len := len + 1;
-- 		 end loop;
	 return lngLatArray::json ->0;
END;
$$;
 H   DROP FUNCTION public.customgcj02towgs84(lnglatarray character varying);
       public       postgres    false    14    1            �           1255    22379 !   customisinchina(numeric, numeric)    FUNCTION     �   CREATE FUNCTION public.customisinchina(lat numeric, lng numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
begin
	return lng >= 73.66 and lng <= 135.05 and lat >= 3.86 and lat <= 53.55;
end;
$$;
 @   DROP FUNCTION public.customisinchina(lat numeric, lng numeric);
       public       postgres    false    14    1            �           1255    22380 $   customtransformlat(numeric, numeric)    FUNCTION     �  CREATE FUNCTION public.customtransformlat(lat numeric, lng numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
declare 
	res numeric;
begin
	res := -100 + 2 * lat + 3 * lng + 0.2 * lng * lng + 0.1 * lat * lng + 0.2 * sqrt(abs(lat));
    res := res + (20 * sin(6 * lat * PI()) + 20 * sin(2 * lat * PI())) * 2 / 3;
    res := res +(20 * sin(lng * PI()) + 40 * sin(lng / 3 * PI())) * 2 / 3;
    res := res +(160 * sin(lng / 12 * PI()) + 320 * sin(lng * PI() / 30)) * 2 / 3;
    return res;
end;
$$;
 C   DROP FUNCTION public.customtransformlat(lat numeric, lng numeric);
       public       postgres    false    14    1            �           1255    22381 $   customtransformlng(numeric, numeric)    FUNCTION     �  CREATE FUNCTION public.customtransformlng(lat numeric, lng numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
declare 
	res numeric;
begin
	res := 300 + lat + 2 * lng + 0.1 * lat * lat + 0.1 * lat * lng + 0.1 * sqrt(abs(lat));
    res := res + (20 * sin(6 * lat * PI()) + 20 * sin(2 * lat * PI())) * 2 / 3;
    res := res + (20 * sin(lat * PI()) + 40 * sin(lat / 3 * PI())) * 2 / 3;
    res := res + (150 * sin(lat / 12 * PI()) + 300 * sin(lat / 30 * PI())) * 2 / 3;
    return res;
end;
$$;
 C   DROP FUNCTION public.customtransformlng(lat numeric, lng numeric);
       public       postgres    false    14    1            %           1259    22101    buildings_gid_seq    SEQUENCE     z   CREATE SEQUENCE public.buildings_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.buildings_gid_seq;
       public       postgres    false    14            &           1259    22103    geo_boundary_gid_seq    SEQUENCE     }   CREATE SEQUENCE public.geo_boundary_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.geo_boundary_gid_seq;
       public       postgres    false    14            K           1259    22453    geo_boundary    TABLE       CREATE TABLE public.geo_boundary (
    gid integer DEFAULT nextval('public.geo_boundary_gid_seq'::regclass) NOT NULL,
    pid integer NOT NULL,
    name character varying(128),
    layer integer NOT NULL,
    height integer NOT NULL,
    level integer NOT NULL,
    type integer NOT NULL,
    color character varying(128),
    selected_color character varying(128),
    area_code character varying(128),
    create_user_id bigint,
    create_time timestamp without time zone,
    geom public.geometry(Polygon,4326)
);
     DROP TABLE public.geo_boundary;
       public         postgres    false    294    6    14    6    14    6    14    6    14    6    14    6    14    6    14    6    14    14            '           1259    22112    qrtz_blob_triggers    TABLE     �   CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);
 &   DROP TABLE public.qrtz_blob_triggers;
       public         postgres    false    14            (           1259    22118    qrtz_calendars    TABLE     �   CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);
 "   DROP TABLE public.qrtz_calendars;
       public         postgres    false    14            )           1259    22124    qrtz_cron_triggers    TABLE       CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);
 &   DROP TABLE public.qrtz_cron_triggers;
       public         postgres    false    14            *           1259    22130    qrtz_fired_triggers    TABLE     2  CREATE TABLE public.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);
 '   DROP TABLE public.qrtz_fired_triggers;
       public         postgres    false    14            +           1259    22136    qrtz_job_details    TABLE     �  CREATE TABLE public.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);
 $   DROP TABLE public.qrtz_job_details;
       public         postgres    false    14            ,           1259    22142 
   qrtz_locks    TABLE     �   CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);
    DROP TABLE public.qrtz_locks;
       public         postgres    false    14            -           1259    22145    qrtz_paused_trigger_grps    TABLE     �   CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);
 ,   DROP TABLE public.qrtz_paused_trigger_grps;
       public         postgres    false    14            .           1259    22148    qrtz_scheduler_state    TABLE     �   CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);
 (   DROP TABLE public.qrtz_scheduler_state;
       public         postgres    false    14            /           1259    22151    qrtz_simple_triggers    TABLE     .  CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);
 (   DROP TABLE public.qrtz_simple_triggers;
       public         postgres    false    14            0           1259    22157    qrtz_simprop_triggers    TABLE       CREATE TABLE public.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);
 )   DROP TABLE public.qrtz_simprop_triggers;
       public         postgres    false    14            1           1259    22163    qrtz_triggers    TABLE     }  CREATE TABLE public.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);
 !   DROP TABLE public.qrtz_triggers;
       public         postgres    false    14            2           1259    22169    schedule_job    TABLE       CREATE TABLE public.schedule_job (
    job_id bigint NOT NULL,
    bean_name character varying(200),
    params character varying(2000),
    cron_expression character varying(100),
    status integer,
    remark character varying(255),
    create_time timestamp without time zone
);
     DROP TABLE public.schedule_job;
       public         postgres    false    14            3           1259    22175    schedule_job_job_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_job_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.schedule_job_job_id_seq;
       public       postgres    false    306    14            �           0    0    schedule_job_job_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.schedule_job_job_id_seq OWNED BY public.schedule_job.job_id;
            public       postgres    false    307            4           1259    22177    schedule_job_log    TABLE     4  CREATE TABLE public.schedule_job_log (
    log_id bigint NOT NULL,
    job_id bigint NOT NULL,
    bean_name character varying(200),
    params character varying(2000),
    status integer NOT NULL,
    error character varying(2000),
    times integer NOT NULL,
    create_time timestamp without time zone
);
 $   DROP TABLE public.schedule_job_log;
       public         postgres    false    14            5           1259    22183    schedule_job_log_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_job_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.schedule_job_log_log_id_seq;
       public       postgres    false    14    308            �           0    0    schedule_job_log_log_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.schedule_job_log_log_id_seq OWNED BY public.schedule_job_log.log_id;
            public       postgres    false    309            6           1259    22185    sys_captcha    TABLE     �   CREATE TABLE public.sys_captcha (
    uuid character varying(36) NOT NULL,
    code character varying(6) NOT NULL,
    expire_time timestamp without time zone
);
    DROP TABLE public.sys_captcha;
       public         postgres    false    14            7           1259    22188 
   sys_config    TABLE     �   CREATE TABLE public.sys_config (
    id bigint NOT NULL,
    param_key character varying(50),
    param_value character varying(2000),
    status integer DEFAULT 1,
    remark character varying(500)
);
    DROP TABLE public.sys_config;
       public         postgres    false    14            8           1259    22195    sys_config_id_seq    SEQUENCE     z   CREATE SEQUENCE public.sys_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sys_config_id_seq;
       public       postgres    false    14    311            �           0    0    sys_config_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.sys_config_id_seq OWNED BY public.sys_config.id;
            public       postgres    false    312            9           1259    22197    sys_log    TABLE     /  CREATE TABLE public.sys_log (
    id bigint NOT NULL,
    username character varying(50),
    operation character varying(50),
    method character varying(200),
    params character varying(5000),
    "time" bigint NOT NULL,
    ip character varying(64),
    create_date timestamp without time zone
);
    DROP TABLE public.sys_log;
       public         postgres    false    14            :           1259    22203    sys_log_id_seq    SEQUENCE     w   CREATE SEQUENCE public.sys_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.sys_log_id_seq;
       public       postgres    false    14    313            �           0    0    sys_log_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.sys_log_id_seq OWNED BY public.sys_log.id;
            public       postgres    false    314            ;           1259    22205    sys_menu    TABLE     �   CREATE TABLE public.sys_menu (
    menu_id bigint NOT NULL,
    parent_id bigint,
    name character varying(50),
    url character varying(200),
    perms character varying(500),
    type integer,
    icon character varying(50),
    order_num integer
);
    DROP TABLE public.sys_menu;
       public         postgres    false    14            <           1259    22211    sys_menu_menu_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_menu_menu_id_seq;
       public       postgres    false    315    14            �           0    0    sys_menu_menu_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_menu_menu_id_seq OWNED BY public.sys_menu.menu_id;
            public       postgres    false    316            =           1259    22213    sys_oss    TABLE     �   CREATE TABLE public.sys_oss (
    id bigint NOT NULL,
    url character varying(200),
    create_date timestamp without time zone
);
    DROP TABLE public.sys_oss;
       public         postgres    false    14            >           1259    22216    sys_oss_id_seq    SEQUENCE     w   CREATE SEQUENCE public.sys_oss_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.sys_oss_id_seq;
       public       postgres    false    317    14            �           0    0    sys_oss_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.sys_oss_id_seq OWNED BY public.sys_oss.id;
            public       postgres    false    318            ?           1259    22218    sys_role    TABLE     �   CREATE TABLE public.sys_role (
    role_id bigint NOT NULL,
    role_name character varying(100),
    remark character varying(100),
    create_user_id bigint,
    create_time timestamp without time zone
);
    DROP TABLE public.sys_role;
       public         postgres    false    14            @           1259    22221    sys_role_menu    TABLE     f   CREATE TABLE public.sys_role_menu (
    id bigint NOT NULL,
    role_id bigint,
    menu_id bigint
);
 !   DROP TABLE public.sys_role_menu;
       public         postgres    false    14            A           1259    22224    sys_role_menu_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_role_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_role_menu_id_seq;
       public       postgres    false    14    320            �           0    0    sys_role_menu_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_role_menu_id_seq OWNED BY public.sys_role_menu.id;
            public       postgres    false    321            B           1259    22226    sys_role_role_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_role_role_id_seq;
       public       postgres    false    14    319            �           0    0    sys_role_role_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_role_role_id_seq OWNED BY public.sys_role.role_id;
            public       postgres    false    322            C           1259    22228    sys_user    TABLE     Q  CREATE TABLE public.sys_user (
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100),
    salt character varying(20),
    email character varying(100),
    mobile character varying(100),
    status integer,
    create_user_id bigint,
    create_time timestamp without time zone
);
    DROP TABLE public.sys_user;
       public         postgres    false    14            D           1259    22231    sys_user_role    TABLE     f   CREATE TABLE public.sys_user_role (
    id bigint NOT NULL,
    user_id bigint,
    role_id bigint
);
 !   DROP TABLE public.sys_user_role;
       public         postgres    false    14            E           1259    22234    sys_user_role_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_user_role_id_seq;
       public       postgres    false    324    14            �           0    0    sys_user_role_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_user_role_id_seq OWNED BY public.sys_user_role.id;
            public       postgres    false    325            F           1259    22236    sys_user_token    TABLE     �   CREATE TABLE public.sys_user_token (
    user_id bigint NOT NULL,
    token character varying(100) NOT NULL,
    expire_time timestamp without time zone,
    update_time timestamp without time zone
);
 "   DROP TABLE public.sys_user_token;
       public         postgres    false    14            G           1259    22239    sys_user_token_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_user_token_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.sys_user_token_user_id_seq;
       public       postgres    false    14    326            �           0    0    sys_user_token_user_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.sys_user_token_user_id_seq OWNED BY public.sys_user_token.user_id;
            public       postgres    false    327            H           1259    22241    sys_user_user_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_user_user_id_seq;
       public       postgres    false    14    323            �           0    0    sys_user_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_user_user_id_seq OWNED BY public.sys_user.user_id;
            public       postgres    false    328            I           1259    22243    tb_user    TABLE     �   CREATE TABLE public.tb_user (
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    mobile character varying(20) NOT NULL,
    password character varying(64),
    create_time timestamp without time zone
);
    DROP TABLE public.tb_user;
       public         postgres    false    14            J           1259    22246    tb_user_user_id_seq    SEQUENCE     |   CREATE SEQUENCE public.tb_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tb_user_user_id_seq;
       public       postgres    false    14    329            �           0    0    tb_user_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tb_user_user_id_seq OWNED BY public.tb_user.user_id;
            public       postgres    false    330            �           2604    22248    schedule_job job_id    DEFAULT     z   ALTER TABLE ONLY public.schedule_job ALTER COLUMN job_id SET DEFAULT nextval('public.schedule_job_job_id_seq'::regclass);
 B   ALTER TABLE public.schedule_job ALTER COLUMN job_id DROP DEFAULT;
       public       postgres    false    307    306            �           2604    22249    schedule_job_log log_id    DEFAULT     �   ALTER TABLE ONLY public.schedule_job_log ALTER COLUMN log_id SET DEFAULT nextval('public.schedule_job_log_log_id_seq'::regclass);
 F   ALTER TABLE public.schedule_job_log ALTER COLUMN log_id DROP DEFAULT;
       public       postgres    false    309    308            �           2604    22250    sys_config id    DEFAULT     n   ALTER TABLE ONLY public.sys_config ALTER COLUMN id SET DEFAULT nextval('public.sys_config_id_seq'::regclass);
 <   ALTER TABLE public.sys_config ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    312    311            �           2604    22251 
   sys_log id    DEFAULT     h   ALTER TABLE ONLY public.sys_log ALTER COLUMN id SET DEFAULT nextval('public.sys_log_id_seq'::regclass);
 9   ALTER TABLE public.sys_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    314    313            �           2604    22252    sys_menu menu_id    DEFAULT     t   ALTER TABLE ONLY public.sys_menu ALTER COLUMN menu_id SET DEFAULT nextval('public.sys_menu_menu_id_seq'::regclass);
 ?   ALTER TABLE public.sys_menu ALTER COLUMN menu_id DROP DEFAULT;
       public       postgres    false    316    315            �           2604    22253 
   sys_oss id    DEFAULT     h   ALTER TABLE ONLY public.sys_oss ALTER COLUMN id SET DEFAULT nextval('public.sys_oss_id_seq'::regclass);
 9   ALTER TABLE public.sys_oss ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    318    317            �           2604    22254    sys_role role_id    DEFAULT     t   ALTER TABLE ONLY public.sys_role ALTER COLUMN role_id SET DEFAULT nextval('public.sys_role_role_id_seq'::regclass);
 ?   ALTER TABLE public.sys_role ALTER COLUMN role_id DROP DEFAULT;
       public       postgres    false    322    319            �           2604    22255    sys_role_menu id    DEFAULT     t   ALTER TABLE ONLY public.sys_role_menu ALTER COLUMN id SET DEFAULT nextval('public.sys_role_menu_id_seq'::regclass);
 ?   ALTER TABLE public.sys_role_menu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    321    320            �           2604    22256    sys_user user_id    DEFAULT     t   ALTER TABLE ONLY public.sys_user ALTER COLUMN user_id SET DEFAULT nextval('public.sys_user_user_id_seq'::regclass);
 ?   ALTER TABLE public.sys_user ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    328    323            �           2604    22257    sys_user_role id    DEFAULT     t   ALTER TABLE ONLY public.sys_user_role ALTER COLUMN id SET DEFAULT nextval('public.sys_user_role_id_seq'::regclass);
 ?   ALTER TABLE public.sys_user_role ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    325    324            �           2604    22258    sys_user_token user_id    DEFAULT     �   ALTER TABLE ONLY public.sys_user_token ALTER COLUMN user_id SET DEFAULT nextval('public.sys_user_token_user_id_seq'::regclass);
 E   ALTER TABLE public.sys_user_token ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    327    326            �           2604    22259    tb_user user_id    DEFAULT     r   ALTER TABLE ONLY public.tb_user ALTER COLUMN user_id SET DEFAULT nextval('public.tb_user_user_id_seq'::regclass);
 >   ALTER TABLE public.tb_user ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    330    329            �          0    22453    geo_boundary 
   TABLE DATA               �   COPY public.geo_boundary (gid, pid, name, layer, height, level, type, color, selected_color, area_code, create_user_id, create_time, geom) FROM stdin;
    public       postgres    false    331   �      b          0    21411    pointcloud_formats 
   TABLE DATA               @   COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
    public       postgres    false    235   �      �          0    22112    qrtz_blob_triggers 
   TABLE DATA               `   COPY public.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
    public       postgres    false    295   �      �          0    22118    qrtz_calendars 
   TABLE DATA               M   COPY public.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
    public       postgres    false    296         �          0    22124    qrtz_cron_triggers 
   TABLE DATA               t   COPY public.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
    public       postgres    false    297   $      �          0    22130    qrtz_fired_triggers 
   TABLE DATA               �   COPY public.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
    public       postgres    false    298   y      �          0    22136    qrtz_job_details 
   TABLE DATA               �   COPY public.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
    public       postgres    false    299   �      �          0    22142 
   qrtz_locks 
   TABLE DATA               ;   COPY public.qrtz_locks (sched_name, lock_name) FROM stdin;
    public       postgres    false    300   C      �          0    22145    qrtz_paused_trigger_grps 
   TABLE DATA               M   COPY public.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
    public       postgres    false    301   �      �          0    22148    qrtz_scheduler_state 
   TABLE DATA               n   COPY public.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
    public       postgres    false    302   �      �          0    22151    qrtz_simple_triggers 
   TABLE DATA               �   COPY public.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
    public       postgres    false    303   �      �          0    22157    qrtz_simprop_triggers 
   TABLE DATA               �   COPY public.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
    public       postgres    false    304         �          0    22163    qrtz_triggers 
   TABLE DATA               �   COPY public.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
    public       postgres    false    305   3      �          0    22169    schedule_job 
   TABLE DATA               o   COPY public.schedule_job (job_id, bean_name, params, cron_expression, status, remark, create_time) FROM stdin;
    public       postgres    false    306   �      �          0    22177    schedule_job_log 
   TABLE DATA               p   COPY public.schedule_job_log (log_id, job_id, bean_name, params, status, error, times, create_time) FROM stdin;
    public       postgres    false    308   .      c          0    19988    spatial_ref_sys 
   TABLE DATA               X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       postgres    false    218   �      �          0    22185    sys_captcha 
   TABLE DATA               >   COPY public.sys_captcha (uuid, code, expire_time) FROM stdin;
    public       postgres    false    310   �      �          0    22188 
   sys_config 
   TABLE DATA               P   COPY public.sys_config (id, param_key, param_value, status, remark) FROM stdin;
    public       postgres    false    311   �      �          0    22197    sys_log 
   TABLE DATA               c   COPY public.sys_log (id, username, operation, method, params, "time", ip, create_date) FROM stdin;
    public       postgres    false    313   M!      �          0    22205    sys_menu 
   TABLE DATA               _   COPY public.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) FROM stdin;
    public       postgres    false    315   M.      �          0    22213    sys_oss 
   TABLE DATA               7   COPY public.sys_oss (id, url, create_date) FROM stdin;
    public       postgres    false    317   �1      �          0    22218    sys_role 
   TABLE DATA               [   COPY public.sys_role (role_id, role_name, remark, create_user_id, create_time) FROM stdin;
    public       postgres    false    319   �1      �          0    22221    sys_role_menu 
   TABLE DATA               =   COPY public.sys_role_menu (id, role_id, menu_id) FROM stdin;
    public       postgres    false    320   �1      �          0    22228    sys_user 
   TABLE DATA               y   COPY public.sys_user (user_id, username, password, salt, email, mobile, status, create_user_id, create_time) FROM stdin;
    public       postgres    false    323   <2      �          0    22231    sys_user_role 
   TABLE DATA               =   COPY public.sys_user_role (id, user_id, role_id) FROM stdin;
    public       postgres    false    324   93      �          0    22236    sys_user_token 
   TABLE DATA               R   COPY public.sys_user_token (user_id, token, expire_time, update_time) FROM stdin;
    public       postgres    false    326   \3      �          0    22243    tb_user 
   TABLE DATA               S   COPY public.tb_user (user_id, username, mobile, password, create_time) FROM stdin;
    public       postgres    false    329   �3      f          0    19638    us_gaz 
   TABLE DATA               J   COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    public       postgres    false    214   M4      d          0    19624    us_lex 
   TABLE DATA               J   COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    public       postgres    false    212   j4      e          0    19652    us_rules 
   TABLE DATA               7   COPY public.us_rules (id, rule, is_custom) FROM stdin;
    public       postgres    false    216   �4      g          0    21540    geocode_settings 
   TABLE DATA               T   COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
    tiger       postgres    false    238   �4      h          0    21893    pagc_gaz 
   TABLE DATA               K   COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger       postgres    false    282   �4      i          0    21905    pagc_lex 
   TABLE DATA               K   COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger       postgres    false    284   �4      j          0    21917 
   pagc_rules 
   TABLE DATA               8   COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
    tiger       postgres    false    286   �4      k          0    21963    topology 
   TABLE DATA               G   COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
    topology       postgres    false    288   5      l          0    21976    layer 
   TABLE DATA               �   COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
    topology       postgres    false    289   55      �           0    0    buildings_gid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.buildings_gid_seq', 11, true);
            public       postgres    false    293            �           0    0    geo_boundary_gid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.geo_boundary_gid_seq', 69, true);
            public       postgres    false    294            �           0    0    schedule_job_job_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.schedule_job_job_id_seq', 12, true);
            public       postgres    false    307            �           0    0    schedule_job_log_log_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.schedule_job_log_log_id_seq', 257, true);
            public       postgres    false    309            �           0    0    sys_config_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.sys_config_id_seq', 1, true);
            public       postgres    false    312            �           0    0    sys_log_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sys_log_id_seq', 110, true);
            public       postgres    false    314            �           0    0    sys_menu_menu_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_menu_menu_id_seq', 40, true);
            public       postgres    false    316            �           0    0    sys_oss_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sys_oss_id_seq', 1, false);
            public       postgres    false    318            �           0    0    sys_role_menu_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_role_menu_id_seq', 20, true);
            public       postgres    false    321            �           0    0    sys_role_role_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sys_role_role_id_seq', 1, true);
            public       postgres    false    322            �           0    0    sys_user_role_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sys_user_role_id_seq', 1, true);
            public       postgres    false    325            �           0    0    sys_user_token_user_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sys_user_token_user_id_seq', 1, false);
            public       postgres    false    327            �           0    0    sys_user_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sys_user_user_id_seq', 2, true);
            public       postgres    false    328            �           0    0    tb_user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tb_user_user_id_seq', 1, true);
            public       postgres    false    330                       2606    22461    geo_boundary geo_boundary_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.geo_boundary
    ADD CONSTRAINT geo_boundary_pkey PRIMARY KEY (gid);
 H   ALTER TABLE ONLY public.geo_boundary DROP CONSTRAINT geo_boundary_pkey;
       public         postgres    false    331            �           2606    22263 *   qrtz_blob_triggers qrtz_blob_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 T   ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT qrtz_blob_triggers_pkey;
       public         postgres    false    295    295    295            �           2606    22265 "   qrtz_calendars qrtz_calendars_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);
 L   ALTER TABLE ONLY public.qrtz_calendars DROP CONSTRAINT qrtz_calendars_pkey;
       public         postgres    false    296    296            �           2606    22267 *   qrtz_cron_triggers qrtz_cron_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 T   ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT qrtz_cron_triggers_pkey;
       public         postgres    false    297    297    297            �           2606    22269 ,   qrtz_fired_triggers qrtz_fired_triggers_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);
 V   ALTER TABLE ONLY public.qrtz_fired_triggers DROP CONSTRAINT qrtz_fired_triggers_pkey;
       public         postgres    false    298    298            �           2606    22271 &   qrtz_job_details qrtz_job_details_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);
 P   ALTER TABLE ONLY public.qrtz_job_details DROP CONSTRAINT qrtz_job_details_pkey;
       public         postgres    false    299    299    299            �           2606    22273    qrtz_locks qrtz_locks_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);
 D   ALTER TABLE ONLY public.qrtz_locks DROP CONSTRAINT qrtz_locks_pkey;
       public         postgres    false    300    300            �           2606    22275 6   qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);
 `   ALTER TABLE ONLY public.qrtz_paused_trigger_grps DROP CONSTRAINT qrtz_paused_trigger_grps_pkey;
       public         postgres    false    301    301            �           2606    22277 .   qrtz_scheduler_state qrtz_scheduler_state_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);
 X   ALTER TABLE ONLY public.qrtz_scheduler_state DROP CONSTRAINT qrtz_scheduler_state_pkey;
       public         postgres    false    302    302            �           2606    22279 .   qrtz_simple_triggers qrtz_simple_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 X   ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT qrtz_simple_triggers_pkey;
       public         postgres    false    303    303    303            �           2606    22281 0   qrtz_simprop_triggers qrtz_simprop_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 Z   ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT qrtz_simprop_triggers_pkey;
       public         postgres    false    304    304    304            �           2606    22283     qrtz_triggers qrtz_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 J   ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT qrtz_triggers_pkey;
       public         postgres    false    305    305    305            �           2606    22285 &   schedule_job_log schedule_job_log_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.schedule_job_log
    ADD CONSTRAINT schedule_job_log_pkey PRIMARY KEY (log_id);
 P   ALTER TABLE ONLY public.schedule_job_log DROP CONSTRAINT schedule_job_log_pkey;
       public         postgres    false    308            �           2606    22287    schedule_job schedule_job_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.schedule_job
    ADD CONSTRAINT schedule_job_pkey PRIMARY KEY (job_id);
 H   ALTER TABLE ONLY public.schedule_job DROP CONSTRAINT schedule_job_pkey;
       public         postgres    false    306            �           2606    22289    sys_captcha sys_captcha_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sys_captcha
    ADD CONSTRAINT sys_captcha_pkey PRIMARY KEY (uuid);
 F   ALTER TABLE ONLY public.sys_captcha DROP CONSTRAINT sys_captcha_pkey;
       public         postgres    false    310            �           2606    22291 #   sys_config sys_config_param_key_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.sys_config
    ADD CONSTRAINT sys_config_param_key_key UNIQUE (param_key);
 M   ALTER TABLE ONLY public.sys_config DROP CONSTRAINT sys_config_param_key_key;
       public         postgres    false    311            �           2606    22293    sys_config sys_config_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sys_config
    ADD CONSTRAINT sys_config_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.sys_config DROP CONSTRAINT sys_config_pkey;
       public         postgres    false    311            �           2606    22295    sys_log sys_log_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.sys_log
    ADD CONSTRAINT sys_log_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.sys_log DROP CONSTRAINT sys_log_pkey;
       public         postgres    false    313            �           2606    22297    sys_menu sys_menu_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pkey PRIMARY KEY (menu_id);
 @   ALTER TABLE ONLY public.sys_menu DROP CONSTRAINT sys_menu_pkey;
       public         postgres    false    315            �           2606    22299    sys_oss sys_oss_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.sys_oss
    ADD CONSTRAINT sys_oss_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.sys_oss DROP CONSTRAINT sys_oss_pkey;
       public         postgres    false    317                       2606    22301     sys_role_menu sys_role_menu_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_role_menu
    ADD CONSTRAINT sys_role_menu_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sys_role_menu DROP CONSTRAINT sys_role_menu_pkey;
       public         postgres    false    320            �           2606    22303    sys_role sys_role_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sys_role
    ADD CONSTRAINT sys_role_pkey PRIMARY KEY (role_id);
 @   ALTER TABLE ONLY public.sys_role DROP CONSTRAINT sys_role_pkey;
       public         postgres    false    319                       2606    22305    sys_user sys_user_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_pkey PRIMARY KEY (user_id);
 @   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT sys_user_pkey;
       public         postgres    false    323                       2606    22307     sys_user_role sys_user_role_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_user_role
    ADD CONSTRAINT sys_user_role_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sys_user_role DROP CONSTRAINT sys_user_role_pkey;
       public         postgres    false    324            	           2606    22309 "   sys_user_token sys_user_token_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.sys_user_token
    ADD CONSTRAINT sys_user_token_pkey PRIMARY KEY (user_id);
 L   ALTER TABLE ONLY public.sys_user_token DROP CONSTRAINT sys_user_token_pkey;
       public         postgres    false    326                       2606    22311 '   sys_user_token sys_user_token_token_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.sys_user_token
    ADD CONSTRAINT sys_user_token_token_key UNIQUE (token);
 Q   ALTER TABLE ONLY public.sys_user_token DROP CONSTRAINT sys_user_token_token_key;
       public         postgres    false    326                       2606    22313    sys_user sys_user_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT sys_user_username_key;
       public         postgres    false    323                       2606    22315    tb_user tb_user_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.tb_user DROP CONSTRAINT tb_user_pkey;
       public         postgres    false    329                       2606    22317    tb_user tb_user_username_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_username_key UNIQUE (username);
 F   ALTER TABLE ONLY public.tb_user DROP CONSTRAINT tb_user_username_key;
       public         postgres    false    329                       1259    22462    buildings_gix    INDEX     E   CREATE INDEX buildings_gix ON public.geo_boundary USING gist (geom);
 !   DROP INDEX public.buildings_gix;
       public         postgres    false    6    6    6    14    14    6    14    14    6    14    6    14    6    14    6    14    6    14    6    14    6    14    6    14    6    14    331            �           1259    22319    idx_qrtz_ft_inst_job_req_rcvry    INDEX     �   CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);
 2   DROP INDEX public.idx_qrtz_ft_inst_job_req_rcvry;
       public         postgres    false    298    298    298            �           1259    22320    idx_qrtz_ft_j_g    INDEX     j   CREATE INDEX idx_qrtz_ft_j_g ON public.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);
 #   DROP INDEX public.idx_qrtz_ft_j_g;
       public         postgres    false    298    298    298            �           1259    22321    idx_qrtz_ft_jg    INDEX     _   CREATE INDEX idx_qrtz_ft_jg ON public.qrtz_fired_triggers USING btree (sched_name, job_group);
 "   DROP INDEX public.idx_qrtz_ft_jg;
       public         postgres    false    298    298            �           1259    22322    idx_qrtz_ft_t_g    INDEX     r   CREATE INDEX idx_qrtz_ft_t_g ON public.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);
 #   DROP INDEX public.idx_qrtz_ft_t_g;
       public         postgres    false    298    298    298            �           1259    22323    idx_qrtz_ft_tg    INDEX     c   CREATE INDEX idx_qrtz_ft_tg ON public.qrtz_fired_triggers USING btree (sched_name, trigger_group);
 "   DROP INDEX public.idx_qrtz_ft_tg;
       public         postgres    false    298    298            �           1259    22324    idx_qrtz_ft_trig_inst_name    INDEX     o   CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.qrtz_fired_triggers USING btree (sched_name, instance_name);
 .   DROP INDEX public.idx_qrtz_ft_trig_inst_name;
       public         postgres    false    298    298            �           1259    22325    idx_qrtz_j_grp    INDEX     \   CREATE INDEX idx_qrtz_j_grp ON public.qrtz_job_details USING btree (sched_name, job_group);
 "   DROP INDEX public.idx_qrtz_j_grp;
       public         postgres    false    299    299            �           1259    22326    idx_qrtz_j_req_recovery    INDEX     m   CREATE INDEX idx_qrtz_j_req_recovery ON public.qrtz_job_details USING btree (sched_name, requests_recovery);
 +   DROP INDEX public.idx_qrtz_j_req_recovery;
       public         postgres    false    299    299            �           1259    22327    idx_qrtz_t_c    INDEX     [   CREATE INDEX idx_qrtz_t_c ON public.qrtz_triggers USING btree (sched_name, calendar_name);
     DROP INDEX public.idx_qrtz_t_c;
       public         postgres    false    305    305            �           1259    22328    idx_qrtz_t_g    INDEX     [   CREATE INDEX idx_qrtz_t_g ON public.qrtz_triggers USING btree (sched_name, trigger_group);
     DROP INDEX public.idx_qrtz_t_g;
       public         postgres    false    305    305            �           1259    22329    idx_qrtz_t_j    INDEX     a   CREATE INDEX idx_qrtz_t_j ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);
     DROP INDEX public.idx_qrtz_t_j;
       public         postgres    false    305    305    305            �           1259    22330    idx_qrtz_t_jg    INDEX     X   CREATE INDEX idx_qrtz_t_jg ON public.qrtz_triggers USING btree (sched_name, job_group);
 !   DROP INDEX public.idx_qrtz_t_jg;
       public         postgres    false    305    305            �           1259    22331    idx_qrtz_t_n_g_state    INDEX     r   CREATE INDEX idx_qrtz_t_n_g_state ON public.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);
 (   DROP INDEX public.idx_qrtz_t_n_g_state;
       public         postgres    false    305    305    305            �           1259    22332    idx_qrtz_t_n_state    INDEX     ~   CREATE INDEX idx_qrtz_t_n_state ON public.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);
 &   DROP INDEX public.idx_qrtz_t_n_state;
       public         postgres    false    305    305    305    305            �           1259    22333    idx_qrtz_t_next_fire_time    INDEX     i   CREATE INDEX idx_qrtz_t_next_fire_time ON public.qrtz_triggers USING btree (sched_name, next_fire_time);
 -   DROP INDEX public.idx_qrtz_t_next_fire_time;
       public         postgres    false    305    305            �           1259    22334    idx_qrtz_t_nft_misfire    INDEX     u   CREATE INDEX idx_qrtz_t_nft_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);
 *   DROP INDEX public.idx_qrtz_t_nft_misfire;
       public         postgres    false    305    305    305            �           1259    22335    idx_qrtz_t_nft_st    INDEX     p   CREATE INDEX idx_qrtz_t_nft_st ON public.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);
 %   DROP INDEX public.idx_qrtz_t_nft_st;
       public         postgres    false    305    305    305            �           1259    22336    idx_qrtz_t_nft_st_misfire    INDEX     �   CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);
 -   DROP INDEX public.idx_qrtz_t_nft_st_misfire;
       public         postgres    false    305    305    305    305            �           1259    22337    idx_qrtz_t_nft_st_misfire_grp    INDEX     �   CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);
 1   DROP INDEX public.idx_qrtz_t_nft_st_misfire_grp;
       public         postgres    false    305    305    305    305    305            �           1259    22338    idx_qrtz_t_state    INDEX     _   CREATE INDEX idx_qrtz_t_state ON public.qrtz_triggers USING btree (sched_name, trigger_state);
 $   DROP INDEX public.idx_qrtz_t_state;
       public         postgres    false    305    305            �           1259    22339    index_job_id    INDEX     K   CREATE INDEX index_job_id ON public.schedule_job_log USING btree (job_id);
     DROP INDEX public.index_job_id;
       public         postgres    false    308                       2606    22340 5   qrtz_blob_triggers qrtz_blob_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 _   ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT qrtz_blob_triggers_sched_name_fkey;
       public       postgres    false    295    295    5100    305    305    305    295                       2606    22345 5   qrtz_cron_triggers qrtz_cron_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 _   ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT qrtz_cron_triggers_sched_name_fkey;
       public       postgres    false    5100    305    305    297    297    297    305                       2606    22350 9   qrtz_simple_triggers qrtz_simple_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 c   ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT qrtz_simple_triggers_sched_name_fkey;
       public       postgres    false    5100    305    303    303    303    305    305                       2606    22355 ;   qrtz_simprop_triggers qrtz_simprop_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 e   ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT qrtz_simprop_triggers_sched_name_fkey;
       public       postgres    false    305    5100    305    305    304    304    304                       2606    22360 +   qrtz_triggers qrtz_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES public.qrtz_job_details(sched_name, job_name, job_group);
 U   ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT qrtz_triggers_sched_name_fkey;
       public       postgres    false    305    305    299    299    299    5076    305            �      x��X��,�<�|�;ƀ�E���&��W� A����&7�����s��lu�$�X,v�����?���[}���?��Ͽ��/Z��k�I�������oT�?-]@�龟�r��Kj�d�O*O�穀�D�>9m����W���V�4Z��F��YWf��2~�$t�a��C���l�x:{�m#����e�7n���4-7nU{-gٹqՑ��8��h����{e�U׍�ݪ�́)2����rN����l�H��o������3��9��_e�TM|�5)-�c�ߢ�������5�ǧ�lk�F|�V�u���~�GmM�=3��Mr�����'#i^۬e��s���Ĺ�Q��Q�1oum�{Q��A�٬z�g�&������o\��ʵS���E(pͧ�.����*Rs�O��,���U{㣵:�<u�I��� �������Ϫ�7.E�dZe_���uB�µ��I�2�f�O�ՒS�U�|d܁���zjE��&���Bb�t&��Nc�휱g�o�+#�~~�g�J,�'��+/�L��7ۨ����_9Nyޅ���9#���G��<��`��q��~ 3������Vnۂ_���{��m�U�����AS�?�Yg6�7~�Y���%�� ki��S���8g<�Hbmq#K:N��k��V��>�2����c--Y/�|�E2�S�#��	�\��g���@=?z-��	�o6�U7r�UTSN��|���Ϸ'�67.�pO������b�΄�Pq��uG;·��r5����y(��Yg�-�������B0{]G�ʱ8j���v��P�A�*x�wiH��߯��!9dR^2���"�ruӒ�S����Jr:�* Q��w��E� #���x�\ڨ�k�ͫɸ�_�v�*U3I�x�)(t���Z�!��4y���ά��	l��d���ߞ����U��Jv"��%Y�O��r"7�B۳������Vvϑ�3����hm���Vtu8��n<��eh���},Hs���2R_4���.�n�;�8.}�bx�6�ذcݟ_�,=��,�L�}l�}�\�(�UV"e-����w���G �B9�n��Aݻ@�nO��sJw|vH�@R8�ˢ���%.F�����A^��v��A�����z�L���?<��n����[�����OD[P�χ�_�����,�P�^x[�2x�zC�`B'�'p�Y�^�ơ�>��=纴�"��?R[F�)#�ʈ�;,��͒sn�=sNĠ���Z��Z�Lp���횺D��c� ��[T�m�4O�� *+z��?�	�/L��A��C����,�I�n����>2FFU)y%7�y�ѻ���!t�Ih@��LF�]�^��a߹6ҩ�A�eN�m��Aخŧ�ʲ���¦���Ca����R��DC���(fOj}��z�/
}��p&�HKȄۖ���ڰ)Qi_.m���=f�J׌����v��vfW���C,��a�b�b}38�
�q��N{��`����?���_3����|h*�������oxk�T�^��L�#��e��5���F1XI-���CA_���i!B������9h�3�(���Cz�-�X_e��S���A-ƞ=ր1��}��N�����?Tb���o��������y�@���=Ohm6�;���-~���kA���v���ʗ��!�Q�i|ᣢ0+�p���?w�;~���:B��`)d��q���W�8�A�c�f4�vi�6�1�����1������I���Ҵ��ݫ �0��ƈ_��8������3���5P��ɺV91��H����?仗M����]����_N�\#�pvu��:�z��Ce�8�Ļ��ZG�M�A`�a������C
Xם\��cI���C� q�+�j~�0�x�ٯ�\H}��k���J��)'G�"�P��?h�{A��q��??�C�������,���l�E��:C�����<

fbnD���f��!�8�&]t�o���]/nۀ���CY�|��_��� ��a      b      x������ � �      �      x������ � �      �      x������ � �      �   E   x�K�+-N�HM)�I-�q��74�tqus�	�4P0�7R�C{N���D���ļ��L�=... z��      �      x������ � �      �   �  x��TMo�0=����x�q��� .-�VB�cP�J�"~>�N�t��$�|�y��O����m�R����csws���ͫ�on>����?l��a��Y���q��vO?��?�VǷ���˽��s��H�9�j��Ŝ�:c6r	�V�0�'Lx�PE_b��('�?����z���s�9�_QI����T�:��L�)��}MYd��391xXe��̼�xN�yD�ÊxF���z	��E���nJ �c���DO>�^��|אuğ����:��	� k��-���'b�k�=HȦ1��*M�|C��X ^�ܶZÀ�ߨ#l������xe��[�\�a
c���
'��!�aF�E=�N���wiL���L�|��޽3`|5hC%�墴3��\g�:�QQU�x('�^���Ba\���S��S��\"��5�зYO����_�_�3�]}�3�h���me�?��Y��кxB�FM��:D������ӳ5�uZ/z>�B��3-j�γ"{�c�m����k*WU���N�ё	�n���sU��4)�ȱ`�e*-�S=3�xz|ez��������@�9��~�����l>�٢��t5j���� n�4�B�t��%D��<����=~���X⑰�,�h~9��N��f��+ ���n���>�v�      �   5   x�K�+-N�HM)�I-�	�tww�wtvv�
C�qq����qqq ���      �      x������ � �      �   D   x�K�+-N�HM)�I-�O�K�(MI�74533�0�44224��,�L̀<�=... ���      �      x������ � �      �      x������ � �      �   �  x��Tˎ�0<g�d��aW�rbv9��b����Oٙ'3���]���|�?�m˷�<�?�ǻ��������wO���w&/J����^�I�OwOۇ���珧i�}���v��s�FĂ�sXՌԨ�7Qodl3U��)1c/x�Բ�����]Ɏ:�ŞP7� >i�@U@k�V5�*��?���U�z��H.�XB�Ed�8��̸�*8�����V�*x����/�g��R���!��@��=�|�xo\tƗ��v�����@k��?�<2����q�p�l��/���Ż�Yp���U _�;���r�L�;��ȃ5E���	�bz}��1?jXx��$M{!F��qf��2��y�֡�t%�B� o��st�A�����rﴳ5���CyJGxZzǹ� |=�k>z�Q;�[�#~�N#�D���~�}|���]5�ØAF�]��V��9��+�K�]<1Tsݧ�:d�̨��2���\��ދ�^�KCiQwZ9��h��k�]��ҽ.������i�Ӎ�wy͋:�+�;Rh)��ͧ+4rרG���U�V/%6
K[�<�f�����?��̄Z�d�����/.'�.��k;�N�P�|���_� S4;l9�>Z����N��f�q��
ov�7��tP      �   @   x�34�,I-.	I,�F0����^��!cd`h�k`�k`�`hnehjeb�gdl����� �C      �   d  x���=��6���S��� ��9�#��8p�p��e`$���FWM0I��Oh�Ez���~����_�����/zq��Gl?����r~����{E�#F����%����UT/Q(��+T��qQ|����R	����J8�ݻ(�ܗ�P�ŀ��ե�ڧ*�@�{U\U�m�x�N+`AK�pA�Ƞ��  jw3xC���d �;x�`� `0Y- f�U^��7���We�1H��z�eJ-}Q6?�w��l%-2+�7��@d���;W��	��;gH�%�������JUY��h���-&�ٵ
��Q�d��J!%�Z5/�H��(!�Z�W�j�;Ω!��yN򐵏�t"Վ���I����-#�dkI�Q�e�E�(y<��$�(yT;�!��{��w��*�W�Q򨖻��%kKJ��Q�vt&ˎ�/�O�d%�%q�q�m�M��l�SܳDeWKj
�=KTvt�ʎ�U6��=KT6Z�%*˶ �Y���%�/.�Y���?du��ݛ��Bu��YK�^e6K�{���Z5���qd*B��8ZmG�ڒ�q��{��,��PݳDef��=KTv�h%�����v���};��̒l/NCfI��4��l�4��b�4���qĨB�p��̒b&�J����SB�8g8��C��~J�;����Pw��O	M�s��%"���!��C�8R��8d�#�������O	ّ�ÉP���%�qJ8�g�YKN����8'B�p��$���D(I��%�L�D(I�{=J�����Jv�!��w&d�����a:�y��-��Y�TJ��w����߯�����oX�K�K�y4�#?-<��D~Zؼ���6�Q����V��p��*�G~\��Gu�e�n@M�&��sw }kɏ'wR��C�����݃�#��%(�-l/�M�̈́��^u��'F`b�ۇj�w#j��,�`a�񔶑+���ۉ��e��>t<>� ��<��-���D�w"���>�	�g+�F�k�2ڟͪn8�?�U��)�?/�<E��Ϫn��?�U��@��kݓ~��󒺧p����=��OF�:�Kې��_��)���|Bۘv�usо ���}��d� ��6�}�ln��O�8���6�;f@V�씢:�����v�"� qm��1��d]>�{\'�Hl�k �M}\��ҿ��̿yI�`��>��]QB��HB����^�.�dY= ��ShE����T��]��z�����܊��������|�te��6��їmz���mE��o����?sɖ^��?]r7�z�>dcO $�َ2�7�9�=�^7�9�0B�l�ω���^�q��X����%�9ȲAn�'Z/y��6�}覾 ��o'�s�q ߦ��n:; qn��m���7��6�}�/@��͎T���nR���@�kw?���e\X��.����C�Kp��b	�/���@ަ�k���QYt~^J��"2?.v�P/�����Yt����ω�2>�0�"�Ɏ�uK�#�e뮺{̳,�>湉n����E��rn!���@��\������\�L��x�������\�ءC�[ �-v��z~`j�����`�V�s�n����jsPd��K�c����MvW�=�,;���> ٭�����R�9�Mvy�6'�h��9�w{���Cg�,���� '�!�p���Nߕ�v�����uWZu����֭��>%o��G�0��6K���qiS2��dw�M7�d�͘�n3��;����3}N?.m�p��dw������K�.0�6�}��C���T��d�QϾ1�����@�ۦ��\�m�鏝�.��0�\��u�F�����^�k���Og�{�z���d�!�i��B��Gd0      c      x������ � �      �   -  x�m�Kn�@D��)|�!�?=<K6��*�v�n���@�cUuu�:;�	��$�[r�5ak�@�$Ҷ����9AyC;�O�Cs�Y�Xh5eN�fM�3�n���X��ͮǟ��?z"�����nˆ����P���9�<�{���Y�z|"�ޠ�H��A�����&	�!ɘ#�����BCվ�vϷ>�"��|0�nC���ߺX�3y�OK��bE�ڣ���`9��u��b�\#S�V'�e&s�G�� ~�|B�p�5���s����F�LiT�2:�Ĳ�uc}E ��!+�Z��1T�=�pO�W����n���+��n�!�vj$�����fq�B�mF�?#G6ڋ�ӊ�L�8kT+��e����M�����Jd�{+j�jM:f���������@�M����å�YZ�b��!T�1@H���PV-(��d�W����B�x!�4b��J�)�h�QYT��~]��,�I���*X��J�-�ӈ����� o׽�������k5�Nf.���y�Sݸ�ͷ)����A��ݧ�L�+s��+5�1�X������|�{ќc�F�<�Y�DJ�r��y�^�k������ײز�I񱕼�����^!F��{����b����!1SQN�hV�Hj���=��?�!�T~-c�G<M�0��yv"���R����{�_T��Q> �F�У�h1�@Įs��j�1�6�n����1�w��$��q.��5GK�����M��7�ĭ��w8��K�f���@bQ�q$R���uXF�k-�#��)������/�5j�      �   A  x�e�?O�@���ct�B5�	[���B	�	)w�^�w��8h�������&�/���ZRp}�<�<��5�]�'zK�(���(��~M�q�e�92 ��j(T����ml 0G4}*00A�aMQ�����N�(l�l��9� &3`��b�^��3.K��,�����l�J��Q}(̠���B��3�D9�Ȧ��Ē������ݨ���X���֍g���l�0��xWd*��9qd��&����Z��\�X0��p�.��ȯ���\G��(�Q�2�<H;vu���4t�2钓������~u��us����|��z�OE��0Ȳ�      �   �  x��\[o$�~v�
k� �6u��K�(D���}{������x�v	llB@ V��"��!�?����sjzfg�����m�ݕ������wN}u���Z���l������>�~���|���_~����M_�ۃ^��iZy/�ig#����N��w�n��x�����{Wy+��<����ʕ5%�h6���q��%j.Q��D&U&tj�#����~?�󻫰�W�[�<�X��񤶑��O�w�ZV���.����;����jIm�ޭ���N?������N�;/�u�^��i�u����|�!��[�@�_��4�u��z������~�t�����u�����,�&cb��'j/]YcTU�O�F3Vb%M�)
lg����X5;i7oÿS�J��
Q�����H�"5�|i���(+��i��i�Ra�* :�����;x�ӣ�8D�A��J@���6���Ft9o�4d�7h�A[d�h&h*�?����$g��U�ө��r�,	ј7b�+c%�(�.f�ASD��2�|*e�F��F��7l%�*cf�a+0�O�\J�X4�($���D���T0E�I4�T�X22e`�*}A��k��:2,,d1B0���*�ԩ"1X"M*�#l<j����囫��^}��'��0s���qi<8^�h���U�A���RG-a&�(��TQ*�K�S%��S�]H�W�ȸͤ�����V)՜0��NX��%-QP9�j�������Z֒{�	�s�)�a1�p^QE1'\ĵ�U[�M*�&\��M��Р!2eAЀ1*~���U�������PY�j����h�T��h��שt�pF�x���G���0V��`b����KyW�`�1��&.a �Z錁��`��/�[�v(��"�+YFդ��z�t*���z�aS����ۛ�q��D���ӛc�yn�'�9!��3h3~1�3{�I;�OE�ό��4���	�h
�;(
����Os��_��������A���\�}��m��W��}���[�֦`��l���ӷFh?�˻ŏ�3k|���ײg/i��ʱ�<2؞D&����#��0++��B��S�S��÷o\�|!(�ܹP
?���m{~�D}����Y�O��V��r�6,�K�6��[�Y���h�U��M#���[¹-�Ֆn(�6T�7����T{t���>������3x�����
����"ƍb�q���Gv��ng��B�@��T7�E$'a`W�*%��erw*"J��:"f��ћ7��o,�'��܈��T���"o����El����~u�H@`�m�����;��������J���n4���܄`��'�� ���0�U_99��W>�+z^8{���osv;�<�7��)��RV\9Ϧ�����y^6ϛ8�2�S���kV�>x���h�ר��� � W��]���.S.�J���u� O��|�7�m�q\��̍EC�:6˴���H����[� ��w�>�5��Fg�nԻ��h5{�����oTG8}�D�oF��ח�@YO{���)�V�cB�*x N@�`%�/Tj�!R���#*����;�_��|!aI	|o!��`Y6鵗ǲ�kb:5N��$9
q��~�6Ob ��xd���~>��~�Q�R�/s�Ȉ�J��{��'�7_��w�lo˙V8�-�
,���.qv�ԕΎrwE�J�rʉ���5e���gÏ�P�.��E�-׎���U�0"�m���}��`ƴ���;�F�o(��
WX�@�[K�cKx��w��GK8��sƉbq,Q�Npu@�5Ʀ�I�M+A�cʨ����T��5J�&츨���t�L��͢#վ׍B���y׏�;ys{��R�2�����Zw{�� �3d���<Y��9w��+o\�|2�~�Ә���|�@�hʈ� ��pT��h�*C����(Ã�- U���.�Z�#�4� L&L%�5��7�L�q���&�H&��+`ւ��3l$3,v�+�����It\Tƺƚ�%l���`�M�D��]�i�a0�<�[i�!5�,f�xYIQg�p��L�L��jF4?<V5����y�-_p@Dt��S&�QE�r���dݱUR��SSSU���,i炇T�e�訢d9<�Z���\�vXQ�����,U�0�G|� .� �=w0.9$��DG]jZA�/���lou�rV�L��Kb�d`����W4�Kd\tIRNL\I���`]��py6#
 "Ej9#�|4iXq �W�$��I���[��f,�s -H&a(K���&��߽��� ��|�($�I �pĨ8�f�f�n��	ܷ7�f��Z/n1Q���c����_�� o���+���=S����џqX���=�@{�,� Ȩ�Y���DmNm"8׌12��!��FA[FlT(���S$�N9�C��Jb��?Q��s�pT����Q�4�q���_ z(��+TYbE!�Ey�b���H�HP/��UF@�����W�PÉ�qL�2�*�:�&���*�uO�����8j�ZGl$9%]��,Oh����Ds)W`JT��'<����	>ٍ�LP�y1m�� 6��RK�B�S>U|��+F�C�_ ��T��	&�"6���M�A�t�a�`Z#0�k�$�FW�0����8�vVs�J��pѴX�)b���)���bk9`��Gy"�����2:c<UVUv��:dB��#d�Nu=x5ŷ�ߪdRwgQi���0�$e�l�]!e*��or2�o��،�Ϯ3d��Q�J�)��(<�c.��|Em�#�P�� ެ��E� <P�K/ߙͩ����M�Zi���/�)����s&�!s�$�*h>����Օ� 0��\��,Z*i	{z���|��ٺ C�� �ޚ3�wg˔>V�Z�y˿'d�̼dI��r����g눖�탃��V��Z�٢��(\���1�Ѻ"j��"jf��{Nf�X0��;��S��Hs��T\9c���Vy�Ɩ1��u�՝���ܸ6S[��:�,��F�h��T(���� =,G�#�s%N�rg���ÿ�2�q����/�u��~/�w��~�9�5�3|n���zTQq2�O�6�c��HV0j��탿~��#�W�y���q�(h�㗍�x�7>;�~{�F�ډ�@Q���[������Y-�%��*���~��?�e6���f�B(���������❖��0�f�F�߳)���c�ĉ����$%��B�P�      �   /  x�u��n�@������'�~��R���8؀+cSlGJ��Eȉ����&�	Q�D���FMCI���6�Eg��x�*��]�<�ﰈD ��8���A�q���Ɨ@���D�$"��;�諿ݛn�K�s��"Q��a��!�^����s!ֲM=�h$q9��~�8E5tˋ(�\·o^��G��5��nS�yӮ�f�v\�$�~P�eUu\^ky��;�͕��0�L�"9� �?<	z������w��T�����犤@�������P�2��p�̎aUm"Q��
����3BG]��X���0�<�`^SS� ���ٷ��馞"E|�I���gȦ
�����e7�t�k,H��Ǟ߽v����,�Y	�ô�+��F�9���y�X�q���U�X��
�Yʠ�T��8`I�M4E�X��&����D��T�dw��K�\It��@P�t=}�N;�'
l�T��?��@�VO5l��LrK�'�y��s�`��[=뤔[?���_R@�v@����[>lǷ���b[U�F5Q��(^cO�uR�N����I���Ie��E<}6�7��3:��V���/���~�;y<'����8|*�i�;N��K�i��:�����6tf�I�m�R�"U%�'M��Uk�������Y���Xx�X��xX,��+"�<��7By
E�B� ��x�P&c��գ?�ė�:'Il!�%j�ߛ��(���t[P��X��t�@�LS��=����DɦmX�C�OVM3�X��n~��)�	��"9B�ɟ�v�?�iBӨ�݊��"?�V�����q�?����      �      x������ � �      �   <   x�3�|���rv�Ӊ38����t�>ߐ����R��B��R��������@��Ę+F��� T#O      �   7   x�ű� ����������C�E%��oh�@�;�>��'������6�#
�      �   �   x�5�AN�0E��)z�F���骢;$H �������44!��D ���y`��Ǔ��%�-��#Ш��9ǔ9{d�a��rpQcI)U� ��\@��5����%�<NWѾ+f������=��h`Z�k������<��.~��RDR�y��}e��%KSʁ�T�$R�����%����m'�6����|��O�l���@�v{>�y���%K$�U�������Æ�u�׶i��uO/      �      x�3�4�4����� �Y      �   p   x�M��!@ѳVac��e.��	;�u�z��ԗ��v�����>u-�i 	���*�o��zU��X`ϐx�lQ3�I}.��B�#~+����6��ߡ�O�9ϗ&�      �   a   x���1�X���G����'�8q��wQ�����X���:Lw�.h��k��d퍾NB-�t�3%��q�P��ǀj���E�"��nA}޵�?���      f      x������ � �      d      x������ � �      e      x������ � �      g      x������ � �      h      x������ � �      i      x������ � �      j      x������ � �      k      x������ � �      l      x������ � �     