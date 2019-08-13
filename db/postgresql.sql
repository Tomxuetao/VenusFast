PGDMP                         w            venus    9.6.12    10.9 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    30385    venus    DATABASE     �   CREATE DATABASE venus WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Chinese (Simplified)_China.936' LC_CTYPE = 'Chinese (Simplified)_China.936';
    DROP DATABASE venus;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                        0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    14                        2615    44289    tiger    SCHEMA        CREATE SCHEMA tiger;
    DROP SCHEMA tiger;
             postgres    false                        2615    44559 
   tiger_data    SCHEMA        CREATE SCHEMA tiger_data;
    DROP SCHEMA tiger_data;
             postgres    false                        2615    44068    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
             postgres    false            !           0    0    SCHEMA topology    COMMENT     9   COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
                  postgres    false    15                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            "           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                        3079    44239    address_standardizer 	   EXTENSION     H   CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;
 %   DROP EXTENSION address_standardizer;
                  false    14            #           0    0    EXTENSION address_standardizer    COMMENT     �   COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';
                       false    7                        3079    44246    address_standardizer_data_us 	   EXTENSION     P   CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;
 -   DROP EXTENSION address_standardizer_data_us;
                  false    14            $           0    0 &   EXTENSION address_standardizer_data_us    COMMENT     `   COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';
                       false    6                        3079    44228    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                  false    14            %           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                       false    8                        3079    44920    ogr_fdw 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;
    DROP EXTENSION ogr_fdw;
                  false    14            &           0    0    EXTENSION ogr_fdw    COMMENT     L   COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';
                       false    4            
            3079    42542    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    14            '           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    10                        3079    44718 	   pgrouting 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;
    DROP EXTENSION pgrouting;
                  false    14    10            (           0    0    EXTENSION pgrouting    COMMENT     9   COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';
                       false    5                        3079    44924 
   pointcloud 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;
    DROP EXTENSION pointcloud;
                  false    14            )           0    0    EXTENSION pointcloud    COMMENT     G   COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';
                       false    3                        3079    45020    pointcloud_postgis 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;
 #   DROP EXTENSION pointcloud_postgis;
                  false    10    3    14            *           0    0    EXTENSION pointcloud_postgis    COMMENT     n   COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';
                       false    2            	            3079    44210    postgis_sfcgal 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;
    DROP EXTENSION postgis_sfcgal;
                  false    10    14            +           0    0    EXTENSION postgis_sfcgal    COMMENT     C   COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';
                       false    9                        3079    44290    postgis_tiger_geocoder 	   EXTENSION     I   CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
 '   DROP EXTENSION postgis_tiger_geocoder;
                  false    10    17    8            ,           0    0     EXTENSION postgis_tiger_geocoder    COMMENT     ^   COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
                       false    12                        3079    44069    postgis_topology 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
 !   DROP EXTENSION postgis_topology;
                  false    10    15            -           0    0    EXTENSION postgis_topology    COMMENT     Y   COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
                       false    11            >           1259    45062    buildings_gid_seq    SEQUENCE     z   CREATE SEQUENCE public.buildings_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.buildings_gid_seq;
       public       postgres    false    14            ?           1259    45092    geo_boundary_gid_seq    SEQUENCE     }   CREATE SEQUENCE public.geo_boundary_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.geo_boundary_gid_seq;
       public       postgres    false    14            @           1259    45136    geo_boundary    TABLE     �  CREATE TABLE public.geo_boundary (
    gid integer DEFAULT nextval('public.geo_boundary_gid_seq'::regclass) NOT NULL,
    name character varying(128),
    layer integer NOT NULL,
    height integer NOT NULL,
    color character varying(128),
    selected_color character varying(128),
    area_code character varying(128),
    create_user_id bigint,
    create_time timestamp without time zone,
    geom public.geometry(Polygon,4326)
);
     DROP TABLE public.geo_boundary;
       public         postgres    false    319    10    14    10    14    10    14    10    14    10    14    10    14    10    14    10    14    14            �            1259    30572    qrtz_blob_triggers    TABLE     �   CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);
 &   DROP TABLE public.qrtz_blob_triggers;
       public         postgres    false    14            �            1259    30585    qrtz_calendars    TABLE     �   CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);
 "   DROP TABLE public.qrtz_calendars;
       public         postgres    false    14            �            1259    30546    qrtz_cron_triggers    TABLE       CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);
 &   DROP TABLE public.qrtz_cron_triggers;
       public         postgres    false    14            �            1259    30598    qrtz_fired_triggers    TABLE     2  CREATE TABLE public.qrtz_fired_triggers (
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
       public         postgres    false    14            �            1259    30512    qrtz_job_details    TABLE     �  CREATE TABLE public.qrtz_job_details (
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
       public         postgres    false    14            �            1259    30611 
   qrtz_locks    TABLE     �   CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);
    DROP TABLE public.qrtz_locks;
       public         postgres    false    14            �            1259    30593    qrtz_paused_trigger_grps    TABLE     �   CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);
 ,   DROP TABLE public.qrtz_paused_trigger_grps;
       public         postgres    false    14            �            1259    30606    qrtz_scheduler_state    TABLE     �   CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);
 (   DROP TABLE public.qrtz_scheduler_state;
       public         postgres    false    14            �            1259    30533    qrtz_simple_triggers    TABLE     .  CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);
 (   DROP TABLE public.qrtz_simple_triggers;
       public         postgres    false    14            �            1259    30559    qrtz_simprop_triggers    TABLE       CREATE TABLE public.qrtz_simprop_triggers (
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
       public         postgres    false    14            �            1259    30520    qrtz_triggers    TABLE     }  CREATE TABLE public.qrtz_triggers (
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
       public         postgres    false    14            �            1259    30481    schedule_job    TABLE       CREATE TABLE public.schedule_job (
    job_id bigint NOT NULL,
    bean_name character varying(200),
    params character varying(2000),
    cron_expression character varying(100),
    status integer,
    remark character varying(255),
    create_time timestamp without time zone
);
     DROP TABLE public.schedule_job;
       public         postgres    false    14            �            1259    30479    schedule_job_job_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_job_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.schedule_job_job_id_seq;
       public       postgres    false    14    219            .           0    0    schedule_job_job_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.schedule_job_job_id_seq OWNED BY public.schedule_job.job_id;
            public       postgres    false    218            �            1259    30492    schedule_job_log    TABLE     4  CREATE TABLE public.schedule_job_log (
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
       public         postgres    false    14            �            1259    30490    schedule_job_log_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_job_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.schedule_job_log_log_id_seq;
       public       postgres    false    221    14            /           0    0    schedule_job_log_log_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.schedule_job_log_log_id_seq OWNED BY public.schedule_job_log.log_id;
            public       postgres    false    220            �            1259    30417    sys_captcha    TABLE     �   CREATE TABLE public.sys_captcha (
    uuid character varying(36) NOT NULL,
    code character varying(6) NOT NULL,
    expire_time timestamp without time zone
);
    DROP TABLE public.sys_captcha;
       public         postgres    false    14            �            1259    30448 
   sys_config    TABLE     �   CREATE TABLE public.sys_config (
    id bigint NOT NULL,
    param_key character varying(50),
    param_value character varying(2000),
    status integer DEFAULT 1,
    remark character varying(500)
);
    DROP TABLE public.sys_config;
       public         postgres    false    14            �            1259    30446    sys_config_id_seq    SEQUENCE     z   CREATE SEQUENCE public.sys_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sys_config_id_seq;
       public       postgres    false    213    14            0           0    0    sys_config_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.sys_config_id_seq OWNED BY public.sys_config.id;
            public       postgres    false    212            �            1259    30462    sys_log    TABLE     /  CREATE TABLE public.sys_log (
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
       public         postgres    false    14            �            1259    30460    sys_log_id_seq    SEQUENCE     w   CREATE SEQUENCE public.sys_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.sys_log_id_seq;
       public       postgres    false    14    215            1           0    0    sys_log_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.sys_log_id_seq OWNED BY public.sys_log.id;
            public       postgres    false    214            �            1259    30388    sys_menu    TABLE     �   CREATE TABLE public.sys_menu (
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
       public         postgres    false    14            �            1259    30386    sys_menu_menu_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_menu_menu_id_seq;
       public       postgres    false    200    14            2           0    0    sys_menu_menu_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_menu_menu_id_seq OWNED BY public.sys_menu.menu_id;
            public       postgres    false    199            �            1259    30473    sys_oss    TABLE     �   CREATE TABLE public.sys_oss (
    id bigint NOT NULL,
    url character varying(200),
    create_date timestamp without time zone
);
    DROP TABLE public.sys_oss;
       public         postgres    false    14            �            1259    30471    sys_oss_id_seq    SEQUENCE     w   CREATE SEQUENCE public.sys_oss_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.sys_oss_id_seq;
       public       postgres    false    217    14            3           0    0    sys_oss_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.sys_oss_id_seq OWNED BY public.sys_oss.id;
            public       postgres    false    216            �            1259    30424    sys_role    TABLE     �   CREATE TABLE public.sys_role (
    role_id bigint NOT NULL,
    role_name character varying(100),
    remark character varying(100),
    create_user_id bigint,
    create_time timestamp without time zone
);
    DROP TABLE public.sys_role;
       public         postgres    false    14            �            1259    30440    sys_role_menu    TABLE     f   CREATE TABLE public.sys_role_menu (
    id bigint NOT NULL,
    role_id bigint,
    menu_id bigint
);
 !   DROP TABLE public.sys_role_menu;
       public         postgres    false    14            �            1259    30438    sys_role_menu_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_role_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_role_menu_id_seq;
       public       postgres    false    14    211            4           0    0    sys_role_menu_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_role_menu_id_seq OWNED BY public.sys_role_menu.id;
            public       postgres    false    210            �            1259    30422    sys_role_role_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_role_role_id_seq;
       public       postgres    false    207    14            5           0    0    sys_role_role_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_role_role_id_seq OWNED BY public.sys_role.role_id;
            public       postgres    false    206            �            1259    30399    sys_user    TABLE     Q  CREATE TABLE public.sys_user (
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
       public         postgres    false    14            �            1259    30432    sys_user_role    TABLE     f   CREATE TABLE public.sys_user_role (
    id bigint NOT NULL,
    user_id bigint,
    role_id bigint
);
 !   DROP TABLE public.sys_user_role;
       public         postgres    false    14            �            1259    30430    sys_user_role_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_user_role_id_seq;
       public       postgres    false    14    209            6           0    0    sys_user_role_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_user_role_id_seq OWNED BY public.sys_user_role.id;
            public       postgres    false    208            �            1259    30409    sys_user_token    TABLE     �   CREATE TABLE public.sys_user_token (
    user_id bigint NOT NULL,
    token character varying(100) NOT NULL,
    expire_time timestamp without time zone,
    update_time timestamp without time zone
);
 "   DROP TABLE public.sys_user_token;
       public         postgres    false    14            �            1259    30407    sys_user_token_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_user_token_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.sys_user_token_user_id_seq;
       public       postgres    false    204    14            7           0    0    sys_user_token_user_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.sys_user_token_user_id_seq OWNED BY public.sys_user_token.user_id;
            public       postgres    false    203            �            1259    30397    sys_user_user_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sys_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_user_user_id_seq;
       public       postgres    false    202    14            8           0    0    sys_user_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_user_user_id_seq OWNED BY public.sys_user.user_id;
            public       postgres    false    201            �            1259    30504    tb_user    TABLE     �   CREATE TABLE public.tb_user (
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    mobile character varying(20) NOT NULL,
    password character varying(64),
    create_time timestamp without time zone
);
    DROP TABLE public.tb_user;
       public         postgres    false    14            �            1259    30502    tb_user_user_id_seq    SEQUENCE     |   CREATE SEQUENCE public.tb_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tb_user_user_id_seq;
       public       postgres    false    223    14            9           0    0    tb_user_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tb_user_user_id_seq OWNED BY public.tb_user.user_id;
            public       postgres    false    222            �           2604    30484    schedule_job job_id    DEFAULT     z   ALTER TABLE ONLY public.schedule_job ALTER COLUMN job_id SET DEFAULT nextval('public.schedule_job_job_id_seq'::regclass);
 B   ALTER TABLE public.schedule_job ALTER COLUMN job_id DROP DEFAULT;
       public       postgres    false    219    218    219            �           2604    30495    schedule_job_log log_id    DEFAULT     �   ALTER TABLE ONLY public.schedule_job_log ALTER COLUMN log_id SET DEFAULT nextval('public.schedule_job_log_log_id_seq'::regclass);
 F   ALTER TABLE public.schedule_job_log ALTER COLUMN log_id DROP DEFAULT;
       public       postgres    false    221    220    221            �           2604    30451    sys_config id    DEFAULT     n   ALTER TABLE ONLY public.sys_config ALTER COLUMN id SET DEFAULT nextval('public.sys_config_id_seq'::regclass);
 <   ALTER TABLE public.sys_config ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    213    213            �           2604    30465 
   sys_log id    DEFAULT     h   ALTER TABLE ONLY public.sys_log ALTER COLUMN id SET DEFAULT nextval('public.sys_log_id_seq'::regclass);
 9   ALTER TABLE public.sys_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    215    215            �           2604    30391    sys_menu menu_id    DEFAULT     t   ALTER TABLE ONLY public.sys_menu ALTER COLUMN menu_id SET DEFAULT nextval('public.sys_menu_menu_id_seq'::regclass);
 ?   ALTER TABLE public.sys_menu ALTER COLUMN menu_id DROP DEFAULT;
       public       postgres    false    199    200    200            �           2604    30476 
   sys_oss id    DEFAULT     h   ALTER TABLE ONLY public.sys_oss ALTER COLUMN id SET DEFAULT nextval('public.sys_oss_id_seq'::regclass);
 9   ALTER TABLE public.sys_oss ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216    217            �           2604    30427    sys_role role_id    DEFAULT     t   ALTER TABLE ONLY public.sys_role ALTER COLUMN role_id SET DEFAULT nextval('public.sys_role_role_id_seq'::regclass);
 ?   ALTER TABLE public.sys_role ALTER COLUMN role_id DROP DEFAULT;
       public       postgres    false    206    207    207            �           2604    30443    sys_role_menu id    DEFAULT     t   ALTER TABLE ONLY public.sys_role_menu ALTER COLUMN id SET DEFAULT nextval('public.sys_role_menu_id_seq'::regclass);
 ?   ALTER TABLE public.sys_role_menu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    211    211            �           2604    30402    sys_user user_id    DEFAULT     t   ALTER TABLE ONLY public.sys_user ALTER COLUMN user_id SET DEFAULT nextval('public.sys_user_user_id_seq'::regclass);
 ?   ALTER TABLE public.sys_user ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    201    202    202            �           2604    30435    sys_user_role id    DEFAULT     t   ALTER TABLE ONLY public.sys_user_role ALTER COLUMN id SET DEFAULT nextval('public.sys_user_role_id_seq'::regclass);
 ?   ALTER TABLE public.sys_user_role ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    209    209            �           2604    30412    sys_user_token user_id    DEFAULT     �   ALTER TABLE ONLY public.sys_user_token ALTER COLUMN user_id SET DEFAULT nextval('public.sys_user_token_user_id_seq'::regclass);
 E   ALTER TABLE public.sys_user_token ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    204    203    204            �           2604    30507    tb_user user_id    DEFAULT     r   ALTER TABLE ONLY public.tb_user ALTER COLUMN user_id SET DEFAULT nextval('public.tb_user_user_id_seq'::regclass);
 >   ALTER TABLE public.tb_user ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    223    222    223                      0    45136    geo_boundary 
   TABLE DATA               �   COPY public.geo_boundary (gid, name, layer, height, color, selected_color, area_code, create_user_id, create_time, geom) FROM stdin;
    public       postgres    false    320   ��       �          0    44926    pointcloud_formats 
   TABLE DATA               @   COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
    public       postgres    false    316   u�                 0    30572    qrtz_blob_triggers 
   TABLE DATA               `   COPY public.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
    public       postgres    false    229   ��                 0    30585    qrtz_calendars 
   TABLE DATA               M   COPY public.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
    public       postgres    false    230   ��                 0    30546    qrtz_cron_triggers 
   TABLE DATA               t   COPY public.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
    public       postgres    false    227   ��                 0    30598    qrtz_fired_triggers 
   TABLE DATA               �   COPY public.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
    public       postgres    false    232   !�                 0    30512    qrtz_job_details 
   TABLE DATA               �   COPY public.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
    public       postgres    false    224   >�                 0    30611 
   qrtz_locks 
   TABLE DATA               ;   COPY public.qrtz_locks (sched_name, lock_name) FROM stdin;
    public       postgres    false    234   ��                 0    30593    qrtz_paused_trigger_grps 
   TABLE DATA               M   COPY public.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
    public       postgres    false    231   0�                 0    30606    qrtz_scheduler_state 
   TABLE DATA               n   COPY public.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
    public       postgres    false    233   M�                 0    30533    qrtz_simple_triggers 
   TABLE DATA               �   COPY public.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
    public       postgres    false    226   ��                 0    30559    qrtz_simprop_triggers 
   TABLE DATA               �   COPY public.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
    public       postgres    false    228   ��                 0    30520    qrtz_triggers 
   TABLE DATA               �   COPY public.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
    public       postgres    false    225   ��                 0    30481    schedule_job 
   TABLE DATA               o   COPY public.schedule_job (job_id, bean_name, params, cron_expression, status, remark, create_time) FROM stdin;
    public       postgres    false    219   ��       	          0    30492    schedule_job_log 
   TABLE DATA               p   COPY public.schedule_job_log (log_id, job_id, bean_name, params, status, error, times, create_time) FROM stdin;
    public       postgres    false    221   ��       �          0    42851    spatial_ref_sys 
   TABLE DATA               X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       postgres    false    236   H      �          0    30417    sys_captcha 
   TABLE DATA               >   COPY public.sys_captcha (uuid, code, expire_time) FROM stdin;
    public       postgres    false    205   e                0    30448 
   sys_config 
   TABLE DATA               P   COPY public.sys_config (id, param_key, param_value, status, remark) FROM stdin;
    public       postgres    false    213   Q                0    30462    sys_log 
   TABLE DATA               c   COPY public.sys_log (id, username, operation, method, params, "time", ip, create_date) FROM stdin;
    public       postgres    false    215   �      �          0    30388    sys_menu 
   TABLE DATA               _   COPY public.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) FROM stdin;
    public       postgres    false    200   |                0    30473    sys_oss 
   TABLE DATA               7   COPY public.sys_oss (id, url, create_date) FROM stdin;
    public       postgres    false    217   c      �          0    30424    sys_role 
   TABLE DATA               [   COPY public.sys_role (role_id, role_name, remark, create_user_id, create_time) FROM stdin;
    public       postgres    false    207   �      �          0    30440    sys_role_menu 
   TABLE DATA               =   COPY public.sys_role_menu (id, role_id, menu_id) FROM stdin;
    public       postgres    false    211   �      �          0    30399    sys_user 
   TABLE DATA               y   COPY public.sys_user (user_id, username, password, salt, email, mobile, status, create_user_id, create_time) FROM stdin;
    public       postgres    false    202         �          0    30432    sys_user_role 
   TABLE DATA               =   COPY public.sys_user_role (id, user_id, role_id) FROM stdin;
    public       postgres    false    209         �          0    30409    sys_user_token 
   TABLE DATA               R   COPY public.sys_user_token (user_id, token, expire_time, update_time) FROM stdin;
    public       postgres    false    204   3                0    30504    tb_user 
   TABLE DATA               S   COPY public.tb_user (user_id, username, mobile, password, create_time) FROM stdin;
    public       postgres    false    223   �      �          0    44263    us_gaz 
   TABLE DATA               J   COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    public       postgres    false    260   "      �          0    44249    us_lex 
   TABLE DATA               J   COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    public       postgres    false    258   ?      �          0    44277    us_rules 
   TABLE DATA               7   COPY public.us_rules (id, rule, is_custom) FROM stdin;
    public       postgres    false    262   \      �          0    44296    geocode_settings 
   TABLE DATA               T   COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
    tiger       postgres    false    264   y      �          0    44651    pagc_gaz 
   TABLE DATA               K   COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger       postgres    false    308   �      �          0    44663    pagc_lex 
   TABLE DATA               K   COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger       postgres    false    310   �      �          0    44675 
   pagc_rules 
   TABLE DATA               8   COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
    tiger       postgres    false    312   �      �          0    44072    topology 
   TABLE DATA               G   COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
    topology       postgres    false    251   �      �          0    44085    layer 
   TABLE DATA               �   COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
    topology       postgres    false    252   
      :           0    0    buildings_gid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.buildings_gid_seq', 11, true);
            public       postgres    false    318            ;           0    0    geo_boundary_gid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.geo_boundary_gid_seq', 48, true);
            public       postgres    false    319            <           0    0    schedule_job_job_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.schedule_job_job_id_seq', 12, true);
            public       postgres    false    218            =           0    0    schedule_job_log_log_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.schedule_job_log_log_id_seq', 257, true);
            public       postgres    false    220            >           0    0    sys_config_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.sys_config_id_seq', 1, true);
            public       postgres    false    212            ?           0    0    sys_log_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sys_log_id_seq', 82, true);
            public       postgres    false    214            @           0    0    sys_menu_menu_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_menu_menu_id_seq', 37, true);
            public       postgres    false    199            A           0    0    sys_oss_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sys_oss_id_seq', 1, false);
            public       postgres    false    216            B           0    0    sys_role_menu_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_role_menu_id_seq', 20, true);
            public       postgres    false    210            C           0    0    sys_role_role_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sys_role_role_id_seq', 1, true);
            public       postgres    false    206            D           0    0    sys_user_role_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sys_user_role_id_seq', 1, true);
            public       postgres    false    208            E           0    0    sys_user_token_user_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sys_user_token_user_id_seq', 1, false);
            public       postgres    false    203            F           0    0    sys_user_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sys_user_user_id_seq', 2, true);
            public       postgres    false    201            G           0    0    tb_user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tb_user_user_id_seq', 1, true);
            public       postgres    false    222            p           2606    45144    geo_boundary geo_boundary_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.geo_boundary
    ADD CONSTRAINT geo_boundary_pkey PRIMARY KEY (gid);
 H   ALTER TABLE ONLY public.geo_boundary DROP CONSTRAINT geo_boundary_pkey;
       public         postgres    false    320            ]           2606    30579 *   qrtz_blob_triggers qrtz_blob_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 T   ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT qrtz_blob_triggers_pkey;
       public         postgres    false    229    229    229            _           2606    30592 "   qrtz_calendars qrtz_calendars_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);
 L   ALTER TABLE ONLY public.qrtz_calendars DROP CONSTRAINT qrtz_calendars_pkey;
       public         postgres    false    230    230            Y           2606    30553 *   qrtz_cron_triggers qrtz_cron_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 T   ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT qrtz_cron_triggers_pkey;
       public         postgres    false    227    227    227            i           2606    30605 ,   qrtz_fired_triggers qrtz_fired_triggers_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);
 V   ALTER TABLE ONLY public.qrtz_fired_triggers DROP CONSTRAINT qrtz_fired_triggers_pkey;
       public         postgres    false    232    232            G           2606    30519 &   qrtz_job_details qrtz_job_details_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);
 P   ALTER TABLE ONLY public.qrtz_job_details DROP CONSTRAINT qrtz_job_details_pkey;
       public         postgres    false    224    224    224            m           2606    30615    qrtz_locks qrtz_locks_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);
 D   ALTER TABLE ONLY public.qrtz_locks DROP CONSTRAINT qrtz_locks_pkey;
       public         postgres    false    234    234            a           2606    30597 6   qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);
 `   ALTER TABLE ONLY public.qrtz_paused_trigger_grps DROP CONSTRAINT qrtz_paused_trigger_grps_pkey;
       public         postgres    false    231    231            k           2606    30610 .   qrtz_scheduler_state qrtz_scheduler_state_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);
 X   ALTER TABLE ONLY public.qrtz_scheduler_state DROP CONSTRAINT qrtz_scheduler_state_pkey;
       public         postgres    false    233    233            W           2606    30540 .   qrtz_simple_triggers qrtz_simple_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 X   ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT qrtz_simple_triggers_pkey;
       public         postgres    false    226    226    226            [           2606    30566 0   qrtz_simprop_triggers qrtz_simprop_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 Z   ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT qrtz_simprop_triggers_pkey;
       public         postgres    false    228    228    228            U           2606    30527     qrtz_triggers qrtz_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 J   ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT qrtz_triggers_pkey;
       public         postgres    false    225    225    225            ?           2606    30500 &   schedule_job_log schedule_job_log_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.schedule_job_log
    ADD CONSTRAINT schedule_job_log_pkey PRIMARY KEY (log_id);
 P   ALTER TABLE ONLY public.schedule_job_log DROP CONSTRAINT schedule_job_log_pkey;
       public         postgres    false    221            <           2606    30489    schedule_job schedule_job_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.schedule_job
    ADD CONSTRAINT schedule_job_pkey PRIMARY KEY (job_id);
 H   ALTER TABLE ONLY public.schedule_job DROP CONSTRAINT schedule_job_pkey;
       public         postgres    false    219            ,           2606    30421    sys_captcha sys_captcha_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sys_captcha
    ADD CONSTRAINT sys_captcha_pkey PRIMARY KEY (uuid);
 F   ALTER TABLE ONLY public.sys_captcha DROP CONSTRAINT sys_captcha_pkey;
       public         postgres    false    205            4           2606    30459 #   sys_config sys_config_param_key_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.sys_config
    ADD CONSTRAINT sys_config_param_key_key UNIQUE (param_key);
 M   ALTER TABLE ONLY public.sys_config DROP CONSTRAINT sys_config_param_key_key;
       public         postgres    false    213            6           2606    30457    sys_config sys_config_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sys_config
    ADD CONSTRAINT sys_config_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.sys_config DROP CONSTRAINT sys_config_pkey;
       public         postgres    false    213            8           2606    30470    sys_log sys_log_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.sys_log
    ADD CONSTRAINT sys_log_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.sys_log DROP CONSTRAINT sys_log_pkey;
       public         postgres    false    215            "           2606    30396    sys_menu sys_menu_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pkey PRIMARY KEY (menu_id);
 @   ALTER TABLE ONLY public.sys_menu DROP CONSTRAINT sys_menu_pkey;
       public         postgres    false    200            :           2606    30478    sys_oss sys_oss_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.sys_oss
    ADD CONSTRAINT sys_oss_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.sys_oss DROP CONSTRAINT sys_oss_pkey;
       public         postgres    false    217            2           2606    30445     sys_role_menu sys_role_menu_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_role_menu
    ADD CONSTRAINT sys_role_menu_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sys_role_menu DROP CONSTRAINT sys_role_menu_pkey;
       public         postgres    false    211            .           2606    30429    sys_role sys_role_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sys_role
    ADD CONSTRAINT sys_role_pkey PRIMARY KEY (role_id);
 @   ALTER TABLE ONLY public.sys_role DROP CONSTRAINT sys_role_pkey;
       public         postgres    false    207            $           2606    30404    sys_user sys_user_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_pkey PRIMARY KEY (user_id);
 @   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT sys_user_pkey;
       public         postgres    false    202            0           2606    30437     sys_user_role sys_user_role_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_user_role
    ADD CONSTRAINT sys_user_role_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sys_user_role DROP CONSTRAINT sys_user_role_pkey;
       public         postgres    false    209            (           2606    30414 "   sys_user_token sys_user_token_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.sys_user_token
    ADD CONSTRAINT sys_user_token_pkey PRIMARY KEY (user_id);
 L   ALTER TABLE ONLY public.sys_user_token DROP CONSTRAINT sys_user_token_pkey;
       public         postgres    false    204            *           2606    30416 '   sys_user_token sys_user_token_token_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.sys_user_token
    ADD CONSTRAINT sys_user_token_token_key UNIQUE (token);
 Q   ALTER TABLE ONLY public.sys_user_token DROP CONSTRAINT sys_user_token_token_key;
       public         postgres    false    204            &           2606    30406    sys_user sys_user_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT sys_user_username_key;
       public         postgres    false    202            A           2606    30509    tb_user tb_user_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.tb_user DROP CONSTRAINT tb_user_pkey;
       public         postgres    false    223            C           2606    30511    tb_user tb_user_username_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_username_key UNIQUE (username);
 F   ALTER TABLE ONLY public.tb_user DROP CONSTRAINT tb_user_username_key;
       public         postgres    false    223            n           1259    45145    buildings_gix    INDEX     E   CREATE INDEX buildings_gix ON public.geo_boundary USING gist (geom);
 !   DROP INDEX public.buildings_gix;
       public         postgres    false    10    10    14    10    14    10    14    10    14    10    14    10    14    10    14    10    14    10    14    10    14    10    14    10    14    14    320            b           1259    30631    idx_qrtz_ft_inst_job_req_rcvry    INDEX     �   CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);
 2   DROP INDEX public.idx_qrtz_ft_inst_job_req_rcvry;
       public         postgres    false    232    232    232            c           1259    30632    idx_qrtz_ft_j_g    INDEX     j   CREATE INDEX idx_qrtz_ft_j_g ON public.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);
 #   DROP INDEX public.idx_qrtz_ft_j_g;
       public         postgres    false    232    232    232            d           1259    30633    idx_qrtz_ft_jg    INDEX     _   CREATE INDEX idx_qrtz_ft_jg ON public.qrtz_fired_triggers USING btree (sched_name, job_group);
 "   DROP INDEX public.idx_qrtz_ft_jg;
       public         postgres    false    232    232            e           1259    30634    idx_qrtz_ft_t_g    INDEX     r   CREATE INDEX idx_qrtz_ft_t_g ON public.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);
 #   DROP INDEX public.idx_qrtz_ft_t_g;
       public         postgres    false    232    232    232            f           1259    30635    idx_qrtz_ft_tg    INDEX     c   CREATE INDEX idx_qrtz_ft_tg ON public.qrtz_fired_triggers USING btree (sched_name, trigger_group);
 "   DROP INDEX public.idx_qrtz_ft_tg;
       public         postgres    false    232    232            g           1259    30630    idx_qrtz_ft_trig_inst_name    INDEX     o   CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.qrtz_fired_triggers USING btree (sched_name, instance_name);
 .   DROP INDEX public.idx_qrtz_ft_trig_inst_name;
       public         postgres    false    232    232            D           1259    30617    idx_qrtz_j_grp    INDEX     \   CREATE INDEX idx_qrtz_j_grp ON public.qrtz_job_details USING btree (sched_name, job_group);
 "   DROP INDEX public.idx_qrtz_j_grp;
       public         postgres    false    224    224            E           1259    30616    idx_qrtz_j_req_recovery    INDEX     m   CREATE INDEX idx_qrtz_j_req_recovery ON public.qrtz_job_details USING btree (sched_name, requests_recovery);
 +   DROP INDEX public.idx_qrtz_j_req_recovery;
       public         postgres    false    224    224            H           1259    30620    idx_qrtz_t_c    INDEX     [   CREATE INDEX idx_qrtz_t_c ON public.qrtz_triggers USING btree (sched_name, calendar_name);
     DROP INDEX public.idx_qrtz_t_c;
       public         postgres    false    225    225            I           1259    30621    idx_qrtz_t_g    INDEX     [   CREATE INDEX idx_qrtz_t_g ON public.qrtz_triggers USING btree (sched_name, trigger_group);
     DROP INDEX public.idx_qrtz_t_g;
       public         postgres    false    225    225            J           1259    30618    idx_qrtz_t_j    INDEX     a   CREATE INDEX idx_qrtz_t_j ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);
     DROP INDEX public.idx_qrtz_t_j;
       public         postgres    false    225    225    225            K           1259    30619    idx_qrtz_t_jg    INDEX     X   CREATE INDEX idx_qrtz_t_jg ON public.qrtz_triggers USING btree (sched_name, job_group);
 !   DROP INDEX public.idx_qrtz_t_jg;
       public         postgres    false    225    225            L           1259    30624    idx_qrtz_t_n_g_state    INDEX     r   CREATE INDEX idx_qrtz_t_n_g_state ON public.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);
 (   DROP INDEX public.idx_qrtz_t_n_g_state;
       public         postgres    false    225    225    225            M           1259    30623    idx_qrtz_t_n_state    INDEX     ~   CREATE INDEX idx_qrtz_t_n_state ON public.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);
 &   DROP INDEX public.idx_qrtz_t_n_state;
       public         postgres    false    225    225    225    225            N           1259    30625    idx_qrtz_t_next_fire_time    INDEX     i   CREATE INDEX idx_qrtz_t_next_fire_time ON public.qrtz_triggers USING btree (sched_name, next_fire_time);
 -   DROP INDEX public.idx_qrtz_t_next_fire_time;
       public         postgres    false    225    225            O           1259    30627    idx_qrtz_t_nft_misfire    INDEX     u   CREATE INDEX idx_qrtz_t_nft_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);
 *   DROP INDEX public.idx_qrtz_t_nft_misfire;
       public         postgres    false    225    225    225            P           1259    30626    idx_qrtz_t_nft_st    INDEX     p   CREATE INDEX idx_qrtz_t_nft_st ON public.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);
 %   DROP INDEX public.idx_qrtz_t_nft_st;
       public         postgres    false    225    225    225            Q           1259    30628    idx_qrtz_t_nft_st_misfire    INDEX     �   CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);
 -   DROP INDEX public.idx_qrtz_t_nft_st_misfire;
       public         postgres    false    225    225    225    225            R           1259    30629    idx_qrtz_t_nft_st_misfire_grp    INDEX     �   CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);
 1   DROP INDEX public.idx_qrtz_t_nft_st_misfire_grp;
       public         postgres    false    225    225    225    225    225            S           1259    30622    idx_qrtz_t_state    INDEX     _   CREATE INDEX idx_qrtz_t_state ON public.qrtz_triggers USING btree (sched_name, trigger_state);
 $   DROP INDEX public.idx_qrtz_t_state;
       public         postgres    false    225    225            =           1259    30501    index_job_id    INDEX     K   CREATE INDEX index_job_id ON public.schedule_job_log USING btree (job_id);
     DROP INDEX public.index_job_id;
       public         postgres    false    221            u           2606    30580 5   qrtz_blob_triggers qrtz_blob_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 _   ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT qrtz_blob_triggers_sched_name_fkey;
       public       postgres    false    229    229    225    225    4437    225    229            s           2606    30554 5   qrtz_cron_triggers qrtz_cron_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 _   ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT qrtz_cron_triggers_sched_name_fkey;
       public       postgres    false    227    225    225    225    4437    227    227            r           2606    30541 9   qrtz_simple_triggers qrtz_simple_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 c   ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT qrtz_simple_triggers_sched_name_fkey;
       public       postgres    false    4437    225    225    225    226    226    226            t           2606    30567 ;   qrtz_simprop_triggers qrtz_simprop_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 e   ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT qrtz_simprop_triggers_sched_name_fkey;
       public       postgres    false    225    228    228    225    4437    225    228            q           2606    30528 +   qrtz_triggers qrtz_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES public.qrtz_job_details(sched_name, job_name, job_group);
 U   ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT qrtz_triggers_sched_name_fkey;
       public       postgres    false    4423    224    225    225    225    224    224               �  x��Y�n$�]��b�	0�!���I���$@�}r�9�ʫ��=�s=��*I|��F�۟��ϟo�&!���_���_����!��E��
������ǣ�Ɓ���A�+�w�wΏX�[�����a&
��G��G�u	������ٗ�d1	�>���H+�3΍��ji\�s�R�+>g�S_3�O�\G���kM�e�?�d�C�'�#�(\_�O%\�Zz�/�Us�V��_��d�J�:j�Xe�x�)�Z��5��!�6�+?���H�D]�(����!�'�������֎�|�_�U�r�OI�4�8�a}���HV�d�W\[�����G��fSZ����+X��{��!�G�S�������Ԯ��J��_�3vc����64�?���F������BE~V��I[�{��W�bǘ]�g�R"?����T�J�ڟ�H�k��� ��1^�*E-��}>Rc`�Q�x�����%�+��͢�&+��y��Ï�>r�W櫄!�����Z�2�r|!t��k�k6 "����w�*Dq%�W�K�|���O��
V��z������C|���k��e����B3�4;��6s��3�=I ����b����2h4��=�yr�;{�����'��";��Wؽ?g�ͮ O�g���yRT㻺=40W��P�$�l�ot����B�+�.sv�~@�����!��t�g~��w�w{ї�3���}b�[�p�=���ސ6�Fo ��8Z�is�CH�JJ�������^�4#{��u����_'�9ˎI_��D�>(
��/p�'d�^Bo�}�3�8���ēz�7���8צ�|���"|���9��G���8�q5u�X�XfK�:�������+��єB=���,�G�����9< �_��9;|�
���_P����|�igb��dJP[8�������}�w���Ά�|�ڥtb]͟_��Y;0��"��V�⌄R�s�{�f\�c�/Җ���jW|$�YV���=��gsu�Z��HW<*���ڒ+.��{���"� �ք����; �ag)Pc:Aخ^�+QLmw�u~�����|��H�|����y��$t�|�"�������r�{Qo�et�c�Q�եV��P	V@���m�����d�#~�9�ң�yE���M�:�῁Pq o���B�ݾ�����L�v��RG a��a gZ��'H�@x����1}~�_z`^�u�ӭ��C���J�T�q��ϯ#����a��z��*)�$`7ς~�p科T@�6�O�?�7��+?L؏�c�V�y���N��m�ã�L&���@����4 `�q$ TXr��8c�����Bd;�l�#~�y<��C}�/�x�'hmc,��+�X��o��x,RI��RW>��rx�m��@ם�#T�x����gL[5���\)ܵ�xE�i���?+Ԁ}q_�0^����H��ۼ��C���n�8m>����N�0V����_C����}Vl����U&��]�8w�8΢�������Ȅ�t�߀�5����.J�񸌹P�����@��|�y�E;c�ܻ����]_3���F.C@�;��?��}��"=Rx�~4��0ߗ{���G-�/?(�I��z,��V���a�胛[�.�6N��
$STL��GKv|x��!?`^�g0U/�GB<�6��/��K�}��;�pޗg�0Lm��UHm�9�)���a�Y3�5w�k9B]z<[����#�Q�{��b�5��:���M9��h.�r�/J���n}Q�y��u{՛-dٗ�5�|;l{%x�����D~H!O_��UJ��6�Gȫ�.�o����r�	#�3����0�0��� +��/�H�i[ާ�d1��z�����"��?/_1_�+}�z�K@�T���s�S�[�;sַ7��X�i��G識m��?w�'� �?�
��ϝgV>��O4�
�|���UH:�+`"!p|�K=��C��<����������� V�q�����3bn9����QQ�����
���+��O1g�z?�y�����l��/�YM�)��_�hX�^篴���z��ؠAw�UfX^��qBy�d��aRe��J��I��C��)ɞo03���y��>@��3F0v���=�.u�7�ѶS?_���{������y��/}����>�%CR$�����k
P����%a��y|R&��_���Sw�<���o��8��L�      �      x������ � �            x������ � �            x������ � �         E   x�K�+-N�HM)�I-�q��74�tqus�	�4P0�7R�C{N���D���ļ��L�=... z��            x������ � �         �  x��TMo�0=����x�q��� .-�VB�cP�J�"~>�N�t��$�|�y��O����m�R����csws���ͫ�on>����?l��a��Y���q��vO?��?�VǷ���˽��s��H�9�j��Ŝ�:c6r	�V�0�'Lx�PE_b��('�?����z���s�9�_QI����T�:��L�)��}MYd��391xXe��̼�xN�yD�ÊxF���z	��E���nJ �c���DO>�^��|אuğ����:��	� k��-���'b�k�=HȦ1��*M�|C��X ^�ܶZÀ�ߨ#l������xe��[�\�a
c���
'��!�aF�E=�N���wiL���L�|��޽3`|5hC%�墴3��\g�:�QQU�x('�^���Ba\���S��S��\"��5�зYO����_�_�3�]}�3�h���me�?��Y��кxB�FM��:D������ӳ5�uZ/z>�B��3-j�γ"{�c�m����k*WU���N�ё	�n���sU��4)�ȱ`�e*-�S=3�xz|ez��������@�9��~�����l>�٢��t5j���� n�4�B�t��%D��<����=~���X⑰�,�h~9��N��f��+ ���n���>�v�         5   x�K�+-N�HM)�I-�	�tww�wtvv�
C�qq����qqq ���            x������ � �         B   x�K�+-N�HM)�I-�O�K�(MI�74535�05�0664��,���<�=... ���            x������ � �            x������ � �         �  x��Tˎ�0<g�d��aW�rbv9��b����Oٙ'3���]���|�?�m˷�<�?�ǻ��������wO���w&/J����^�I�OwOۇ���珧i�}���v��s�FĂ�sXՌԨ�7Qodl3U��)1c/x�Բ�����]Ɏ:�ŞP7� >i�@U@k�V5�*��?���U�z��H.�XB�Ed�8��̸�*8�����V�*x����/�g��R���!��@��=�|�xo\tƗ��v�����@k��?�<2����q�p�l��/���Ż�Yp���U _�;���r�L�;��ȃ5E���	�bz}��1?jXx��$M{!F��qf��2��y�֡�t%�B� o��st�A�����rﴳ5���CyJGxZzǹ� |=�k>z�Q;�[�#~�N#�D���~�}|���]5�ØAF�]��V��9��+�K�]<1Tsݧ�:d�̨��2���\��ދ�^�KCiQwZ9��h��k�]��ҽ.������i�Ӎ�wy͋:�+�;Rh)��ͧ+4rרG���U�V/%6
K[�<�f�����?��̄Z�d�����/.'�.��k;�N�P�|���_� S4;l9�>Z����N��f�q��
ov�7��tP         @   x�34�,I-.	I,�F0����^��!cd`h�k`�k`�`hnehjeb�gdl����� �C      	   d  x���=��6���S��� ��9�#��8p�p��e`$���FWM0I��Oh�Ez���~����_�����/zq��Gl?����r~����{E�#F����%����UT/Q(��+T��qQ|����R	����J8�ݻ(�ܗ�P�ŀ��ե�ڧ*�@�{U\U�m�x�N+`AK�pA�Ƞ��  jw3xC���d �;x�`� `0Y- f�U^��7���We�1H��z�eJ-}Q6?�w��l%-2+�7��@d���;W��	��;gH�%�������JUY��h���-&�ٵ
��Q�d��J!%�Z5/�H��(!�Z�W�j�;Ω!��yN򐵏�t"Վ���I����-#�dkI�Q�e�E�(y<��$�(yT;�!��{��w��*�W�Q򨖻��%kKJ��Q�vt&ˎ�/�O�d%�%q�q�m�M��l�SܳDeWKj
�=KTvt�ʎ�U6��=KT6Z�%*˶ �Y���%�/.�Y���?du��ݛ��Bu��YK�^e6K�{���Z5���qd*B��8ZmG�ڒ�q��{��,��PݳDef��=KTv�h%�����v���};��̒l/NCfI��4��l�4��b�4���qĨB�p��̒b&�J����SB�8g8��C��~J�;����Pw��O	M�s��%"���!��C�8R��8d�#�������O	ّ�ÉP���%�qJ8�g�YKN����8'B�p��$���D(I��%�L�D(I�{=J�����Jv�!��w&d�����a:�y��-��Y�TJ��w����߯�����oX�K�K�y4�#?-<��D~Zؼ���6�Q����V��p��*�G~\��Gu�e�n@M�&��sw }kɏ'wR��C�����݃�#��%(�-l/�M�̈́��^u��'F`b�ۇj�w#j��,�`a�񔶑+���ۉ��e��>t<>� ��<��-���D�w"���>�	�g+�F�k�2ڟͪn8�?�U��)�?/�<E��Ϫn��?�U��@��kݓ~��󒺧p����=��OF�:�Kې��_��)���|Bۘv�usо ���}��d� ��6�}�ln��O�8���6�;f@V�씢:�����v�"� qm��1��d]>�{\'�Hl�k �M}\��ҿ��̿yI�`��>��]QB��HB����^�.�dY= ��ShE����T��]��z�����܊��������|�te��6��їmz���mE��o����?sɖ^��?]r7�z�>dcO $�َ2�7�9�=�^7�9�0B�l�ω���^�q��X����%�9ȲAn�'Z/y��6�}覾 ��o'�s�q ߦ��n:; qn��m���7��6�}�/@��͎T���nR���@�kw?���e\X��.����C�Kp��b	�/���@ަ�k���QYt~^J��"2?.v�P/�����Yt����ω�2>�0�"�Ɏ�uK�#�e뮺{̳,�>湉n����E��rn!���@��\������\�L��x�������\�ءC�[ �-v��z~`j�����`�V�s�n����jsPd��K�c����MvW�=�,;���> ٭�����R�9�Mvy�6'�h��9�w{���Cg�,���� '�!�p���Nߕ�v�����uWZu����֭��>%o��G�0��6K���qiS2��dw�M7�d�͘�n3��;����3}N?.m�p��dw������K�.0�6�}��C���T��d�QϾ1�����@�ۦ��\�m�鏝�.��0�\��u�F�����^�k���Og�{�z���d�!�i��B��Gd0      �      x������ � �      �   �   x�mϽm�0@�ښ��!�?�4K���3����s�Y��{1�c��4�M��p��r�yn�x=��dl�+��@�b]t���ǁ:���W�9�M����>��ބt̝e7�hzh���8�U���Y�a��5�y�X�u,]�^
&!]͔�2p��G�?d�"~��U�����N�S��!6�Ο�
�k�M�^���6��?��Yk��SJ_H�R         A  x�e�?O�@���ct�B5�	[���B	�	)w�^�w��8h�������&�/���ZRp}�<�<��5�]�'zK�(���(��~M�q�e�92 ��j(T����ml 0G4}*00A�aMQ�����N�(l�l��9� &3`��b�^��3.K��,�����l�J��Q}(̠���B��3�D9�Ȧ��Ē������ݨ���X���֍g���l�0��xWd*��9qd��&����Z��\�X0��p�.��ȯ���\G��(�Q�2�<H;vu���4t�2钓������~u��us����|��z�OE��0Ȳ�         �	  x��[[o$�~v���<�-�Խ�%+�XeI)��mO۞03�� �V	��""V��P"%BH��0^�ȩ����OyY[+��f���|u�S=��4������_���g���ﯿ�r��{[{�6})����m[i����K���A��j�=�ӽ��߸���>��H[� }��[�`ggK�-�~�g�1s���X�Xhj�#<����4�����O^ʐ���ßi�c�wӤ�l�N�q���N�{��ͤ�B=�%����;��?���z��^>��~�����ē��D��=�$�!��E�^�Nz/̾6M��f���[5�|�5���AԞ�Qeg��"ȏ�F2Ws%M�؁*�,�U�K{i�/�+1�+��,��fJ,������\� �gUr��9e��S���o������OO�}1�z�N�+����w� �X7+�эǢE)�����s\^	��p���,W��"?�:.�-�͊Mt#1W�2W��r�B�E�KX�'�� @��׍��n`-�*3э�e�)�� ����H$�LR� )�T�X!3�CZD��J_�d5"Yn,d�B�Ƅ�`k��ҩ1"��
�LV͓_�zw�:J��t�ʕ�p����^Ɠ���ՏG��YL���h`@Q�,r�`*�(s�K�S�%���)��Q��S"�6�r:�XG8ZQ�9�/�r��H�G��r��ҍȐ�H�xF���lFe`������h1�p�^E.Q̛bN����pC%ӄː+���=D�,��W[Ye*�K�������-q��J���<�Jg	��i�)^�Io���ǃq��_���m���9��*���bC�g��o ��:D�c@���o����2��y�,fj�(��z<�J �dž�ߔ^��Πp�LZ" ������yn|OwsB �Kh��������ȧ��gƣ�%MD8C�|C�C����BiC�|����ߟ��� ���9���t[��4�4�S������o<����;�gh��|��W���l?�O{�[��3�5��z|������SÃiVp�lи՞7���[�������3޽r�?KQ��.�b�ǁ��?v�T�o$G�`��_u{8����K�۵�H�����
�PB�6��*�g�q�|_8�ϴ��e�ޮJx�9i!I���ݏ��χ���������7��EΛ-���8���/b m����6[:�:�	�ffF��i`gA��3��$#����dD	��#b�J������{Ke��_����걀�\�����~�T�߽>V$20����QڛX���Q������F�9h4�����d��g�m��BQM��*DV99�.V>��<���/����`��i�9�	/���q�0|���F�E��i�*f�:�Y�ⳓw�X��� |B���I%z��K4����Q-�ĸ�XWN�l���yϿ������ɞ��l�K��e:���HNꢀ��;������O�ݟ�`�;�4���9Z��"�����wG~�.��oG��͓�4P�Ӟr�ߖ�m�<$�RAF�#H�����i���,�Ə��g�aR$�h��2,�6��p_������	"U��$�R!Τ�m�YO�$�x/6��O���ר�W)/8Ed@_�
�=����}�2�9��D[��<X�o��4V� ��v<w��4�3N��)��>}���p�;.l�w̃��[%y�!���/a��ô�t����Q ^�X�u��(D<���&�#��d�'
� Q����.j,L�K�M+Ae�Ԍ��Ti�C4J��|�E�/�C3��4�T���n%�i/[-���!�c�eDS������n�d;d!TՐ����;��+mlW�ę�lwӿZ����v�Q�
���*��]e�RA�E|��%�������R+�t���#dd*�XC�y�R�0.X��	�T�X����X�a����_�K\꩓�踠�u�5�+�³�)!�XK�D�Z�]�Y�q1�:��E<Bj�!d�xQIQ�����+cac���@4��Zr�Q~<@�b�<#:��)CtPS�#F�!�9X!U|�Jn]tPSR�GiI�RQ�蠦d5>.ۓ��Q��U�?�Q^Q3>P��q>��%�p�#v�d\qH��$:�Q��|�ܕfg��T���\4`�J.�aWP��"��	��=�E��ncKʉ	kI�J|�-\^Ί��HA-b6�I�����
���d��P�41玤��d'�0���syS����3�)� �c�W-�$�F8bT�}3�f�"n"�8x��(�ebf3sc�	������-|�g'�gqv�5{E��B`���}�1�����*��K�W.��
��K���5A�3lt�Yr�!����[ 6�Ev�%RrN9�Cj%�Aݟ(:�d:*�a��GhbÚ�%**��P��W�����?�	�      �   �  x�u��N�@�ϻ����	~��R�+;�+ǦY�#����
Q!D�J	�*/��-:�vlo�J�<;��ggfǫ�$�d|�܍�ϛd�-�d��X`��LU���]ttm���R
��GT!��s<�P����ί,b}ߵS�[*�!u8��KT���F�`��&9?�?ݒn����-���,0�rS�Ve��&$�:��>�ݠ禑`EjT+�;����8�����Z]�
g����i��$��I�{腤�e�^	�k�D坢M��GW�+Bf��3l���]�����+��"m_�|������%R���6��a�\1�rPEp�*�>��}����ԀL~�E���t�_�C/�kvp=���t���p,��8BEs���XEG��Y�`W�'�`ВV�k`�m暴��U5�[�Us�^$�\<V^_�+PeT���*�i��\��B̟+J�W5*h��F�^�Hm.�<RWȾ�
!{Έً�T����|�s*Tb��������F||_�:Z��v:\��EE�k*����u)�̓���,�N�E��E�<��e�LOD!�jPM3>ٚ�'�w'.�Ϙ���0]��TS���P������&!�L�c9m@�jp�po�}J��3�c�P��}t|��a%�A�.��Z!�Z1²z��_+��B@U#Z>\��	��ALG,;w�/7��e#%b�U�P�C養?Y���+Ȗ(�� �_}�            x������ � �      �   <   x�3�|���rv�Ӊ38����t�>ߐ����R��B��R��������@��Ę+F��� T#O      �   7   x�ű� ����������C�E%��oh�@�;�>��'������6�#
�      �   �   x�5�AN�0E��)z�F���骢;$H �������44!��D ���y`��Ǔ��%�-��#Ш��9ǔ9{d�a��rpQcI)U� ��\@��5����%�<NWѾ+f������=��h`Z�k������<��.~��RDR�y��}e��%KSʁ�T�$R�����%����m'�6����|��O�l���@�v{>�y���%K$�U�������Æ�u�׶i��uO/      �      x�3�4�4����� �Y      �   n   x�Uͱ�0D�Z��X�QMz�4"%�?B�JI��'E�[,�k�L��O��9�F E~��h�r7��}���
4y��U���y4�iW��N
��UT��|;�+} F�$�         a   x���1�X���G����'�8q��wQ�����X���:Lw�.h��k��d퍾NB-�t�3%��q�P��ǀj���E�"��nA}޵�?���      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     