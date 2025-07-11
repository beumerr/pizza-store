PGDMP      	                }           pizza-store    17.4    17.5    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    42223    pizza-store    DATABASE     s   CREATE DATABASE "pizza-store" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE "pizza-store";
                     doadmin    false                       1259    42937    coupons    TABLE     m  CREATE TABLE public.coupons (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    code character varying(255),
    "discountPercentage" integer,
    "amountOfUses" integer DEFAULT '-1'::integer,
    "consumeCount" integer DEFAULT 0,
    "order" integer
);
    DROP TABLE public.coupons;
       public         heap r       postgres    false                       1259    42936    coupons_id_seq    SEQUENCE     �   CREATE SEQUENCE public.coupons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.coupons_id_seq;
       public               postgres    false    258            �           0    0    coupons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;
          public               postgres    false    257            �            1259    42848    directus_access    TABLE     �   CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);
 #   DROP TABLE public.directus_access;
       public         heap r       postgres    false            �            1259    42286    directus_activity    TABLE     {  CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);
 %   DROP TABLE public.directus_activity;
       public         heap r       postgres    false            �            1259    42285    directus_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_activity_id_seq;
       public               postgres    false    223            �           0    0    directus_activity_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;
          public               postgres    false    222            �            1259    42224    directus_collections    TABLE     o  CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);
 (   DROP TABLE public.directus_collections;
       public         heap r       postgres    false            �            1259    42872    directus_comments    TABLE     l  CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);
 %   DROP TABLE public.directus_comments;
       public         heap r       postgres    false            �            1259    42595    directus_dashboards    TABLE     I  CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);
 '   DROP TABLE public.directus_dashboards;
       public         heap r       postgres    false            �            1259    42804    directus_extensions    TABLE     �   CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);
 '   DROP TABLE public.directus_extensions;
       public         heap r       postgres    false            �            1259    42263    directus_fields    TABLE     �  CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);
 #   DROP TABLE public.directus_fields;
       public         heap r       postgres    false            �            1259    42262    directus_fields_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.directus_fields_id_seq;
       public               postgres    false    221            �           0    0    directus_fields_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;
          public               postgres    false    220            �            1259    42310    directus_files    TABLE     [  CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);
 "   DROP TABLE public.directus_files;
       public         heap r       postgres    false            �            1259    42709    directus_flows    TABLE       CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 "   DROP TABLE public.directus_flows;
       public         heap r       postgres    false            �            1259    42300    directus_folders    TABLE     z   CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);
 $   DROP TABLE public.directus_folders;
       public         heap r       postgres    false            �            1259    42474    directus_migrations    TABLE     �   CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.directus_migrations;
       public         heap r       postgres    false            �            1259    42655    directus_notifications    TABLE     �  CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);
 *   DROP TABLE public.directus_notifications;
       public         heap r       postgres    false            �            1259    42654    directus_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.directus_notifications_id_seq;
       public               postgres    false    243            �           0    0    directus_notifications_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;
          public               postgres    false    242            �            1259    42726    directus_operations    TABLE     �  CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 '   DROP TABLE public.directus_operations;
       public         heap r       postgres    false            �            1259    42609    directus_panels    TABLE     /  CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 #   DROP TABLE public.directus_panels;
       public         heap r       postgres    false            �            1259    42336    directus_permissions    TABLE       CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);
 (   DROP TABLE public.directus_permissions;
       public         heap r       postgres    false            �            1259    42335    directus_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.directus_permissions_id_seq;
       public               postgres    false    227            �           0    0    directus_permissions_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;
          public               postgres    false    226            �            1259    42827    directus_policies    TABLE     p  CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);
 %   DROP TABLE public.directus_policies;
       public         heap r       postgres    false            �            1259    42355    directus_presets    TABLE     �  CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);
 $   DROP TABLE public.directus_presets;
       public         heap r       postgres    false            �            1259    42354    directus_presets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.directus_presets_id_seq;
       public               postgres    false    229            �           0    0    directus_presets_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;
          public               postgres    false    228            �            1259    42380    directus_relations    TABLE     �  CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);
 &   DROP TABLE public.directus_relations;
       public         heap r       postgres    false            �            1259    42379    directus_relations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_relations_id_seq;
       public               postgres    false    231            �           0    0    directus_relations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;
          public               postgres    false    230            �            1259    42399    directus_revisions    TABLE       CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);
 &   DROP TABLE public.directus_revisions;
       public         heap r       postgres    false            �            1259    42398    directus_revisions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_revisions_id_seq;
       public               postgres    false    233            �           0    0    directus_revisions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;
          public               postgres    false    232            �            1259    42234    directus_roles    TABLE     �   CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);
 "   DROP TABLE public.directus_roles;
       public         heap r       postgres    false            �            1259    42422    directus_sessions    TABLE     !  CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);
 %   DROP TABLE public.directus_sessions;
       public         heap r       postgres    false            �            1259    42435    directus_settings    TABLE     �  CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json
);
 %   DROP TABLE public.directus_settings;
       public         heap r       postgres    false            �            1259    42434    directus_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_settings_id_seq;
       public               postgres    false    236            �           0    0    directus_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;
          public               postgres    false    235            �            1259    42675    directus_shares    TABLE     �  CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);
 #   DROP TABLE public.directus_shares;
       public         heap r       postgres    false            �            1259    42760    directus_translations    TABLE     �   CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);
 )   DROP TABLE public.directus_translations;
       public         heap r       postgres    false            �            1259    42245    directus_users    TABLE       CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);
 "   DROP TABLE public.directus_users;
       public         heap r       postgres    false            �            1259    42767    directus_versions    TABLE     �  CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);
 %   DROP TABLE public.directus_versions;
       public         heap r       postgres    false            �            1259    42463    directus_webhooks    TABLE     $  CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);
 %   DROP TABLE public.directus_webhooks;
       public         heap r       postgres    false            �            1259    42462    directus_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_webhooks_id_seq;
       public               postgres    false    238            �           0    0    directus_webhooks_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;
          public               postgres    false    237                       1259    42958    orders    TABLE     �  CREATE TABLE public.orders (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    "totalInc" numeric(10,5),
    "totalExc" numeric(10,5),
    "taxPercentage" numeric(10,5) DEFAULT '21'::numeric,
    "discountPercentage" numeric(10,5) DEFAULT '0'::numeric,
    "discountValue" numeric(10,5)
);
    DROP TABLE public.orders;
       public         heap r       postgres    false                       1259    42957    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public               postgres    false    260            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public               postgres    false    259                       1259    43049    orders_pizzas    TABLE     m   CREATE TABLE public.orders_pizzas (
    id integer NOT NULL,
    orders_id integer,
    pizzas_id integer
);
 !   DROP TABLE public.orders_pizzas;
       public         heap r       postgres    false                       1259    43048    orders_pizzas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.orders_pizzas_id_seq;
       public               postgres    false    270            �           0    0    orders_pizzas_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.orders_pizzas_id_seq OWNED BY public.orders_pizzas.id;
          public               postgres    false    269                       1259    42975    pizzas    TABLE     �   CREATE TABLE public.pizzas (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    type character varying(255),
    name character varying(255)
);
    DROP TABLE public.pizzas;
       public         heap r       postgres    false                       1259    42974    pizzas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pizzas_id_seq;
       public               postgres    false    262            �           0    0    pizzas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.pizzas_id_seq OWNED BY public.pizzas.id;
          public               postgres    false    261                       1259    42994    pizzas_toppings    TABLE     q   CREATE TABLE public.pizzas_toppings (
    id integer NOT NULL,
    pizzas_id integer,
    toppings_id integer
);
 #   DROP TABLE public.pizzas_toppings;
       public         heap r       postgres    false                       1259    42993    pizzas_toppings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pizzas_toppings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pizzas_toppings_id_seq;
       public               postgres    false    264            �           0    0    pizzas_toppings_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pizzas_toppings_id_seq OWNED BY public.pizzas_toppings.id;
          public               postgres    false    263                       1259    43074    settings    TABLE     �   CREATE TABLE public.settings (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    "taxRateHigh" numeric(10,5) DEFAULT '21'::numeric
);
    DROP TABLE public.settings;
       public         heap r       postgres    false                       1259    43073    settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.settings_id_seq;
       public               postgres    false    272            �           0    0    settings_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;
          public               postgres    false    271            
           1259    43015    showcase    TABLE     �   CREATE TABLE public.showcase (
    id integer NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255)
);
    DROP TABLE public.showcase;
       public         heap r       postgres    false            	           1259    43014    showcase_id_seq    SEQUENCE     �   CREATE SEQUENCE public.showcase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.showcase_id_seq;
       public               postgres    false    266            �           0    0    showcase_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.showcase_id_seq OWNED BY public.showcase.id;
          public               postgres    false    265                       1259    43032    showcase_pizzas    TABLE     q   CREATE TABLE public.showcase_pizzas (
    id integer NOT NULL,
    showcase_id integer,
    pizzas_id integer
);
 #   DROP TABLE public.showcase_pizzas;
       public         heap r       postgres    false                       1259    43031    showcase_pizzas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.showcase_pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.showcase_pizzas_id_seq;
       public               postgres    false    268            �           0    0    showcase_pizzas_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.showcase_pizzas_id_seq OWNED BY public.showcase_pizzas.id;
          public               postgres    false    267                        1259    42918    sizes    TABLE     7  CREATE TABLE public.sizes (
    id integer NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    "sizeLabel" character varying(255),
    "sizeDiameter" character varying(255),
    "startPrice" real
);
    DROP TABLE public.sizes;
       public         heap r       postgres    false            �            1259    42917    sizes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sizes_id_seq;
       public               postgres    false    256            �           0    0    sizes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sizes_id_seq OWNED BY public.sizes.id;
          public               postgres    false    255            �            1259    42893    toppings    TABLE     �  CREATE TABLE public.toppings (
    id integer NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255),
    "priceCm2" real DEFAULT '0.0040743668'::real,
    "priceBase" real DEFAULT '0.5'::real,
    icon uuid,
    "isHidden" boolean DEFAULT false,
    "displaySize" character varying(255) DEFAULT 'medium'::character varying
);
    DROP TABLE public.toppings;
       public         heap r       postgres    false            �            1259    42892    toppings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.toppings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.toppings_id_seq;
       public               postgres    false    254            �           0    0    toppings_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.toppings_id_seq OWNED BY public.toppings.id;
          public               postgres    false    253            @           2604    42940 
   coupons id    DEFAULT     h   ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);
 9   ALTER TABLE public.coupons ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    257    258    258            	           2604    42289    directus_activity id    DEFAULT     |   ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);
 C   ALTER TABLE public.directus_activity ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223                       2604    42266    directus_fields id    DEFAULT     x   ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);
 A   ALTER TABLE public.directus_fields ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220    221            (           2604    42658    directus_notifications id    DEFAULT     �   ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);
 H   ALTER TABLE public.directus_notifications ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    242    243    243                       2604    42339    directus_permissions id    DEFAULT     �   ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);
 F   ALTER TABLE public.directus_permissions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    226    227                       2604    42358    directus_presets id    DEFAULT     z   ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);
 B   ALTER TABLE public.directus_presets ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    228    229                       2604    42383    directus_relations id    DEFAULT     ~   ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);
 D   ALTER TABLE public.directus_relations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    231    230    231                       2604    42402    directus_revisions id    DEFAULT     ~   ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);
 D   ALTER TABLE public.directus_revisions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    233    233                       2604    42438    directus_settings id    DEFAULT     |   ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);
 C   ALTER TABLE public.directus_settings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    236    235    236                       2604    42466    directus_webhooks id    DEFAULT     |   ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);
 C   ALTER TABLE public.directus_webhooks ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    238    238            C           2604    42961 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    260    259    260            J           2604    43052    orders_pizzas id    DEFAULT     t   ALTER TABLE ONLY public.orders_pizzas ALTER COLUMN id SET DEFAULT nextval('public.orders_pizzas_id_seq'::regclass);
 ?   ALTER TABLE public.orders_pizzas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    269    270    270            F           2604    42978 	   pizzas id    DEFAULT     f   ALTER TABLE ONLY public.pizzas ALTER COLUMN id SET DEFAULT nextval('public.pizzas_id_seq'::regclass);
 8   ALTER TABLE public.pizzas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    262    261    262            G           2604    42997    pizzas_toppings id    DEFAULT     x   ALTER TABLE ONLY public.pizzas_toppings ALTER COLUMN id SET DEFAULT nextval('public.pizzas_toppings_id_seq'::regclass);
 A   ALTER TABLE public.pizzas_toppings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    263    264    264            K           2604    43077    settings id    DEFAULT     j   ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);
 :   ALTER TABLE public.settings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    272    271    272            H           2604    43018    showcase id    DEFAULT     j   ALTER TABLE ONLY public.showcase ALTER COLUMN id SET DEFAULT nextval('public.showcase_id_seq'::regclass);
 :   ALTER TABLE public.showcase ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    266    265    266            I           2604    43035    showcase_pizzas id    DEFAULT     x   ALTER TABLE ONLY public.showcase_pizzas ALTER COLUMN id SET DEFAULT nextval('public.showcase_pizzas_id_seq'::regclass);
 A   ALTER TABLE public.showcase_pizzas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    267    268    268            ?           2604    42921    sizes id    DEFAULT     d   ALTER TABLE ONLY public.sizes ALTER COLUMN id SET DEFAULT nextval('public.sizes_id_seq'::regclass);
 7   ALTER TABLE public.sizes ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    255    256    256            :           2604    42896    toppings id    DEFAULT     j   ALTER TABLE ONLY public.toppings ALTER COLUMN id SET DEFAULT nextval('public.toppings_id_seq'::regclass);
 :   ALTER TABLE public.toppings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    253    254    254            �          0    42937    coupons 
   TABLE DATA           �   COPY public.coupons (id, user_created, date_created, user_updated, date_updated, code, "discountPercentage", "amountOfUses", "consumeCount", "order") FROM stdin;
    public               postgres    false    258   ��      �          0    42848    directus_access 
   TABLE DATA           I   COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
    public               postgres    false    251   Ջ      |          0    42286    directus_activity 
   TABLE DATA           v   COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
    public               postgres    false    223   v�      v          0    42224    directus_collections 
   TABLE DATA           *  COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
    public               postgres    false    217   $�      �          0    42872    directus_comments 
   TABLE DATA           �   COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
    public               postgres    false    252   ��      �          0    42595    directus_dashboards 
   TABLE DATA           f   COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
    public               postgres    false    240   җ      �          0    42804    directus_extensions 
   TABLE DATA           R   COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
    public               postgres    false    249   �      z          0    42263    directus_fields 
   TABLE DATA           �   COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
    public               postgres    false    221   �      ~          0    42310    directus_files 
   TABLE DATA           6  COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
    public               postgres    false    225   �      �          0    42709    directus_flows 
   TABLE DATA           �   COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
    public               postgres    false    245   3�      }          0    42300    directus_folders 
   TABLE DATA           <   COPY public.directus_folders (id, name, parent) FROM stdin;
    public               postgres    false    224   P�      �          0    42474    directus_migrations 
   TABLE DATA           I   COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
    public               postgres    false    239   m�      �          0    42655    directus_notifications 
   TABLE DATA           �   COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
    public               postgres    false    243   ,�      �          0    42726    directus_operations 
   TABLE DATA           �   COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
    public               postgres    false    246   I�      �          0    42609    directus_panels 
   TABLE DATA           �   COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
    public               postgres    false    241   f�      �          0    42336    directus_permissions 
   TABLE DATA           x   COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
    public               postgres    false    227   ��      �          0    42827    directus_policies 
   TABLE DATA           z   COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
    public               postgres    false    250   ��      �          0    42355    directus_presets 
   TABLE DATA           �   COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
    public               postgres    false    229   ?�      �          0    42380    directus_relations 
   TABLE DATA           �   COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
    public               postgres    false    231   ʥ      �          0    42399    directus_revisions 
   TABLE DATA           j   COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
    public               postgres    false    233   Ӧ      w          0    42234    directus_roles 
   TABLE DATA           M   COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
    public               postgres    false    218   ��      �          0    42422    directus_sessions 
   TABLE DATA           n   COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
    public               postgres    false    234   	�      �          0    42435    directus_settings 
   TABLE DATA           �  COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls) FROM stdin;
    public               postgres    false    236   �      �          0    42675    directus_shares 
   TABLE DATA           �   COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
    public               postgres    false    244   .�      �          0    42760    directus_translations 
   TABLE DATA           I   COPY public.directus_translations (id, language, key, value) FROM stdin;
    public               postgres    false    247   K�      x          0    42245    directus_users 
   TABLE DATA           T  COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
    public               postgres    false    219   h�      �          0    42767    directus_versions 
   TABLE DATA           �   COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
    public               postgres    false    248   v�      �          0    42463    directus_webhooks 
   TABLE DATA           �   COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
    public               postgres    false    238   ��      �          0    42958    orders 
   TABLE DATA           �   COPY public.orders (id, user_created, date_created, user_updated, date_updated, "totalInc", "totalExc", "taxPercentage", "discountPercentage", "discountValue") FROM stdin;
    public               postgres    false    260   ��      �          0    43049    orders_pizzas 
   TABLE DATA           A   COPY public.orders_pizzas (id, orders_id, pizzas_id) FROM stdin;
    public               postgres    false    270   ͼ      �          0    42975    pizzas 
   TABLE DATA           h   COPY public.pizzas (id, user_created, date_created, user_updated, date_updated, type, name) FROM stdin;
    public               postgres    false    262   �      �          0    42994    pizzas_toppings 
   TABLE DATA           E   COPY public.pizzas_toppings (id, pizzas_id, toppings_id) FROM stdin;
    public               postgres    false    264   �      �          0    43074    settings 
   TABLE DATA           Q   COPY public.settings (id, user_updated, date_updated, "taxRateHigh") FROM stdin;
    public               postgres    false    272   $�      �          0    43015    showcase 
   TABLE DATA           k   COPY public.showcase (id, sort, user_created, date_created, user_updated, date_updated, title) FROM stdin;
    public               postgres    false    266   A�      �          0    43032    showcase_pizzas 
   TABLE DATA           E   COPY public.showcase_pizzas (id, showcase_id, pizzas_id) FROM stdin;
    public               postgres    false    268   ^�      �          0    42918    sizes 
   TABLE DATA           �   COPY public.sizes (id, sort, user_created, date_created, user_updated, date_updated, "sizeLabel", "sizeDiameter", "startPrice") FROM stdin;
    public               postgres    false    256   {�      �          0    42893    toppings 
   TABLE DATA           �   COPY public.toppings (id, sort, user_created, date_created, user_updated, date_updated, name, "priceCm2", "priceBase", icon, "isHidden", "displaySize") FROM stdin;
    public               postgres    false    254   ��      �           0    0    coupons_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.coupons_id_seq', 1, false);
          public               postgres    false    257            �           0    0    directus_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_activity_id_seq', 187, true);
          public               postgres    false    222            �           0    0    directus_fields_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_fields_id_seq', 72, true);
          public               postgres    false    220            �           0    0    directus_notifications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);
          public               postgres    false    242            �           0    0    directus_permissions_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.directus_permissions_id_seq', 1, false);
          public               postgres    false    226            �           0    0    directus_presets_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_presets_id_seq', 3, true);
          public               postgres    false    228            �           0    0    directus_relations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_relations_id_seq', 21, true);
          public               postgres    false    230            �           0    0    directus_revisions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.directus_revisions_id_seq', 186, true);
          public               postgres    false    232            �           0    0    directus_settings_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);
          public               postgres    false    235            �           0    0    directus_webhooks_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);
          public               postgres    false    237            �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public               postgres    false    259            �           0    0    orders_pizzas_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orders_pizzas_id_seq', 1, false);
          public               postgres    false    269            �           0    0    pizzas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pizzas_id_seq', 1, false);
          public               postgres    false    261            �           0    0    pizzas_toppings_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pizzas_toppings_id_seq', 1, false);
          public               postgres    false    263            �           0    0    settings_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.settings_id_seq', 1, false);
          public               postgres    false    271            �           0    0    showcase_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.showcase_id_seq', 1, false);
          public               postgres    false    265            �           0    0    showcase_pizzas_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.showcase_pizzas_id_seq', 1, false);
          public               postgres    false    267            �           0    0    sizes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.sizes_id_seq', 1, false);
          public               postgres    false    255            �           0    0    toppings_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.toppings_id_seq', 1, false);
          public               postgres    false    253            �           2606    42954    coupons coupons_code_unique 
   CONSTRAINT     V   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_code_unique UNIQUE (code);
 E   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_code_unique;
       public                 postgres    false    258            �           2606    42942    coupons coupons_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_pkey;
       public                 postgres    false    258            �           2606    42852 $   directus_access directus_access_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_pkey;
       public                 postgres    false    251            \           2606    42294 (   directus_activity directus_activity_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_activity DROP CONSTRAINT directus_activity_pkey;
       public                 postgres    false    223            N           2606    42233 .   directus_collections directus_collections_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);
 X   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_pkey;
       public                 postgres    false    217            �           2606    42880 (   directus_comments directus_comments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_comments DROP CONSTRAINT directus_comments_pkey;
       public                 postgres    false    252            r           2606    42603 ,   directus_dashboards directus_dashboards_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_pkey;
       public                 postgres    false    240            �           2606    42813 ,   directus_extensions directus_extensions_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_extensions DROP CONSTRAINT directus_extensions_pkey;
       public                 postgres    false    249            Z           2606    42274 $   directus_fields directus_fields_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_fields DROP CONSTRAINT directus_fields_pkey;
       public                 postgres    false    221            `           2606    42319 "   directus_files directus_files_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_pkey;
       public                 postgres    false    225            z           2606    42720 .   directus_flows directus_flows_operation_unique 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);
 X   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_operation_unique;
       public                 postgres    false    245            |           2606    42718 "   directus_flows directus_flows_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_pkey;
       public                 postgres    false    245            ^           2606    42304 &   directus_folders directus_folders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_pkey;
       public                 postgres    false    224            p           2606    42481 ,   directus_migrations directus_migrations_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);
 V   ALTER TABLE ONLY public.directus_migrations DROP CONSTRAINT directus_migrations_pkey;
       public                 postgres    false    239            v           2606    42663 2   directus_notifications directus_notifications_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_pkey;
       public                 postgres    false    243            ~           2606    42733 ,   directus_operations directus_operations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_pkey;
       public                 postgres    false    246            �           2606    42742 5   directus_operations directus_operations_reject_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);
 _   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_unique;
       public                 postgres    false    246            �           2606    42735 6   directus_operations directus_operations_resolve_unique 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_unique;
       public                 postgres    false    246            t           2606    42618 $   directus_panels directus_panels_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_pkey;
       public                 postgres    false    241            b           2606    42343 .   directus_permissions directus_permissions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_pkey;
       public                 postgres    false    227            �           2606    42837 (   directus_policies directus_policies_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_policies DROP CONSTRAINT directus_policies_pkey;
       public                 postgres    false    250            d           2606    42363 &   directus_presets directus_presets_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_pkey;
       public                 postgres    false    229            f           2606    42387 *   directus_relations directus_relations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_relations DROP CONSTRAINT directus_relations_pkey;
       public                 postgres    false    231            h           2606    42406 *   directus_revisions directus_revisions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_pkey;
       public                 postgres    false    233            P           2606    42244 "   directus_roles directus_roles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_pkey;
       public                 postgres    false    218            j           2606    42428 (   directus_sessions directus_sessions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);
 R   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_pkey;
       public                 postgres    false    234            l           2606    42446 (   directus_settings directus_settings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_pkey;
       public                 postgres    false    236            x           2606    42683 $   directus_shares directus_shares_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_pkey;
       public                 postgres    false    244            �           2606    42766 0   directus_translations directus_translations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.directus_translations DROP CONSTRAINT directus_translations_pkey;
       public                 postgres    false    247            R           2606    42645 *   directus_users directus_users_email_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_email_unique;
       public                 postgres    false    219            T           2606    42643 8   directus_users directus_users_external_identifier_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);
 b   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_external_identifier_unique;
       public                 postgres    false    219            V           2606    42254 "   directus_users directus_users_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_pkey;
       public                 postgres    false    219            X           2606    42653 *   directus_users directus_users_token_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_token_unique;
       public                 postgres    false    219            �           2606    42775 (   directus_versions directus_versions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_pkey;
       public                 postgres    false    248            n           2606    42473 (   directus_webhooks directus_webhooks_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_pkey;
       public                 postgres    false    238            �           2606    43054     orders_pizzas orders_pizzas_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.orders_pizzas
    ADD CONSTRAINT orders_pizzas_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.orders_pizzas DROP CONSTRAINT orders_pizzas_pkey;
       public                 postgres    false    270            �           2606    42963    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    260            �           2606    42980    pizzas pizzas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_pkey;
       public                 postgres    false    262            �           2606    42999 $   pizzas_toppings pizzas_toppings_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.pizzas_toppings
    ADD CONSTRAINT pizzas_toppings_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.pizzas_toppings DROP CONSTRAINT pizzas_toppings_pkey;
       public                 postgres    false    264            �           2606    43079    settings settings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public                 postgres    false    272            �           2606    43037 $   showcase_pizzas showcase_pizzas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.showcase_pizzas
    ADD CONSTRAINT showcase_pizzas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.showcase_pizzas DROP CONSTRAINT showcase_pizzas_pkey;
       public                 postgres    false    268            �           2606    43020    showcase showcase_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.showcase
    ADD CONSTRAINT showcase_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.showcase DROP CONSTRAINT showcase_pkey;
       public                 postgres    false    266            �           2606    42923    sizes sizes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sizes DROP CONSTRAINT sizes_pkey;
       public                 postgres    false    256            �           2606    42898    toppings toppings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_pkey;
       public                 postgres    false    254            �           2606    43067    coupons coupons_order_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_order_foreign FOREIGN KEY ("order") REFERENCES public.orders(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_order_foreign;
       public               postgres    false    258    260    5016            �           2606    42943 $   coupons coupons_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 N   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_user_created_foreign;
       public               postgres    false    4950    219    258            �           2606    42948 $   coupons coupons_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 N   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_user_updated_foreign;
       public               postgres    false    219    258    4950            �           2606    42863 .   directus_access directus_access_policy_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_policy_foreign;
       public               postgres    false    251    5002    250            �           2606    42853 ,   directus_access directus_access_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_role_foreign;
       public               postgres    false    251    4944    218            �           2606    42858 ,   directus_access directus_access_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_user_foreign;
       public               postgres    false    4950    251    219            �           2606    42647 7   directus_collections directus_collections_group_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);
 a   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_group_foreign;
       public               postgres    false    4942    217    217            �           2606    42881 8   directus_comments directus_comments_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.directus_comments DROP CONSTRAINT directus_comments_user_created_foreign;
       public               postgres    false    252    4950    219            �           2606    42886 8   directus_comments directus_comments_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 b   ALTER TABLE ONLY public.directus_comments DROP CONSTRAINT directus_comments_user_updated_foreign;
       public               postgres    false    252    4950    219            �           2606    42604 <   directus_dashboards directus_dashboards_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_user_created_foreign;
       public               postgres    false    240    219    4950            �           2606    42560 ,   directus_files directus_files_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_folder_foreign;
       public               postgres    false    224    4958    225            �           2606    42497 1   directus_files directus_files_modified_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_modified_by_foreign;
       public               postgres    false    225    4950    219            �           2606    42492 1   directus_files directus_files_uploaded_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_uploaded_by_foreign;
       public               postgres    false    4950    219    225            �           2606    42721 2   directus_flows directus_flows_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_user_created_foreign;
       public               postgres    false    219    4950    245            �           2606    42502 0   directus_folders directus_folders_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);
 Z   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_parent_foreign;
       public               postgres    false    4958    224    224            �           2606    42664 ?   directus_notifications directus_notifications_recipient_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_recipient_foreign;
       public               postgres    false    243    4950    219            �           2606    42669 <   directus_notifications directus_notifications_sender_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);
 f   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_sender_foreign;
       public               postgres    false    219    4950    243            �           2606    42748 4   directus_operations directus_operations_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_flow_foreign;
       public               postgres    false    246    4988    245            �           2606    42743 6   directus_operations directus_operations_reject_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_foreign;
       public               postgres    false    4990    246    246            �           2606    42736 7   directus_operations directus_operations_resolve_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);
 a   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_foreign;
       public               postgres    false    246    4990    246            �           2606    42753 <   directus_operations directus_operations_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_user_created_foreign;
       public               postgres    false    4950    246    219            �           2606    42619 1   directus_panels directus_panels_dashboard_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_dashboard_foreign;
       public               postgres    false    4978    240    241            �           2606    42624 4   directus_panels directus_panels_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_user_created_foreign;
       public               postgres    false    219    241    4950            �           2606    42843 8   directus_permissions directus_permissions_policy_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_policy_foreign;
       public               postgres    false    227    5002    250            �           2606    42575 .   directus_presets directus_presets_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_role_foreign;
       public               postgres    false    4944    218    229            �           2606    42570 .   directus_presets directus_presets_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_user_foreign;
       public               postgres    false    219    229    4950            �           2606    42580 6   directus_revisions directus_revisions_activity_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_activity_foreign;
       public               postgres    false    223    233    4956            �           2606    42527 4   directus_revisions directus_revisions_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);
 ^   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_parent_foreign;
       public               postgres    false    4968    233    233            �           2606    42792 5   directus_revisions directus_revisions_version_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_version_foreign;
       public               postgres    false    248    4998    233            �           2606    42838 ,   directus_roles directus_roles_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);
 V   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_parent_foreign;
       public               postgres    false    218    218    4944            �           2606    42699 1   directus_sessions directus_sessions_share_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_share_foreign;
       public               postgres    false    234    244    4984            �           2606    42585 0   directus_sessions directus_sessions_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_user_foreign;
       public               postgres    false    4950    234    219            �           2606    42537 8   directus_settings directus_settings_project_logo_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);
 b   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_project_logo_foreign;
       public               postgres    false    236    225    4960            �           2606    42547 =   directus_settings directus_settings_public_background_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_background_foreign;
       public               postgres    false    236    225    4960            �           2606    42799 :   directus_settings directus_settings_public_favicon_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);
 d   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_favicon_foreign;
       public               postgres    false    4960    225    236            �           2606    42542 =   directus_settings directus_settings_public_foreground_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_foreground_foreign;
       public               postgres    false    4960    236    225            �           2606    42822 D   directus_settings directus_settings_public_registration_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_registration_role_foreign;
       public               postgres    false    218    236    4944            �           2606    42635 B   directus_settings directus_settings_storage_default_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_storage_default_folder_foreign;
       public               postgres    false    236    4958    224            �           2606    42684 2   directus_shares directus_shares_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_collection_foreign;
       public               postgres    false    4942    244    217            �           2606    42689 ,   directus_shares directus_shares_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_role_foreign;
       public               postgres    false    4944    218    244            �           2606    42694 4   directus_shares directus_shares_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_user_created_foreign;
       public               postgres    false    219    4950    244            �           2606    42590 *   directus_users directus_users_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_role_foreign;
       public               postgres    false    219    218    4944            �           2606    42776 6   directus_versions directus_versions_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_collection_foreign;
       public               postgres    false    4942    248    217            �           2606    42781 8   directus_versions directus_versions_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_created_foreign;
       public               postgres    false    4950    248    219            �           2606    42786 8   directus_versions directus_versions_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 b   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_updated_foreign;
       public               postgres    false    248    4950    219            �           2606    42815 9   directus_webhooks directus_webhooks_migrated_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_migrated_flow_foreign;
       public               postgres    false    245    238    4988            �           2606    43060 -   orders_pizzas orders_pizzas_orders_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_pizzas
    ADD CONSTRAINT orders_pizzas_orders_id_foreign FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.orders_pizzas DROP CONSTRAINT orders_pizzas_orders_id_foreign;
       public               postgres    false    5016    270    260            �           2606    43055 -   orders_pizzas orders_pizzas_pizzas_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_pizzas
    ADD CONSTRAINT orders_pizzas_pizzas_id_foreign FOREIGN KEY (pizzas_id) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.orders_pizzas DROP CONSTRAINT orders_pizzas_pizzas_id_foreign;
       public               postgres    false    5018    270    262            �           2606    42964 "   orders orders_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_created_foreign;
       public               postgres    false    219    4950    260            �           2606    42969 "   orders orders_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_updated_foreign;
       public               postgres    false    4950    260    219            �           2606    43005 1   pizzas_toppings pizzas_toppings_pizzas_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas_toppings
    ADD CONSTRAINT pizzas_toppings_pizzas_id_foreign FOREIGN KEY (pizzas_id) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY public.pizzas_toppings DROP CONSTRAINT pizzas_toppings_pizzas_id_foreign;
       public               postgres    false    262    264    5018            �           2606    43000 3   pizzas_toppings pizzas_toppings_toppings_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas_toppings
    ADD CONSTRAINT pizzas_toppings_toppings_id_foreign FOREIGN KEY (toppings_id) REFERENCES public.toppings(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.pizzas_toppings DROP CONSTRAINT pizzas_toppings_toppings_id_foreign;
       public               postgres    false    5008    254    264            �           2606    42981 "   pizzas pizzas_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_user_created_foreign;
       public               postgres    false    262    4950    219            �           2606    42986 "   pizzas pizzas_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_user_updated_foreign;
       public               postgres    false    219    262    4950            �           2606    43080 &   settings settings_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_user_updated_foreign;
       public               postgres    false    4950    219    272            �           2606    43038 1   showcase_pizzas showcase_pizzas_pizzas_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase_pizzas
    ADD CONSTRAINT showcase_pizzas_pizzas_id_foreign FOREIGN KEY (pizzas_id) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY public.showcase_pizzas DROP CONSTRAINT showcase_pizzas_pizzas_id_foreign;
       public               postgres    false    5018    262    268            �           2606    43043 3   showcase_pizzas showcase_pizzas_showcase_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase_pizzas
    ADD CONSTRAINT showcase_pizzas_showcase_id_foreign FOREIGN KEY (showcase_id) REFERENCES public.showcase(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.showcase_pizzas DROP CONSTRAINT showcase_pizzas_showcase_id_foreign;
       public               postgres    false    266    5022    268            �           2606    43021 &   showcase showcase_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase
    ADD CONSTRAINT showcase_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.showcase DROP CONSTRAINT showcase_user_created_foreign;
       public               postgres    false    4950    219    266            �           2606    43026 &   showcase showcase_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase
    ADD CONSTRAINT showcase_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.showcase DROP CONSTRAINT showcase_user_updated_foreign;
       public               postgres    false    4950    219    266            �           2606    42929     sizes sizes_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 J   ALTER TABLE ONLY public.sizes DROP CONSTRAINT sizes_user_created_foreign;
       public               postgres    false    256    4950    219            �           2606    42924     sizes sizes_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 J   ALTER TABLE ONLY public.sizes DROP CONSTRAINT sizes_user_updated_foreign;
       public               postgres    false    4950    256    219            �           2606    42911    toppings toppings_icon_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_icon_foreign FOREIGN KEY (icon) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_icon_foreign;
       public               postgres    false    4960    225    254            �           2606    42899 &   toppings toppings_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_user_created_foreign;
       public               postgres    false    254    4950    219            �           2606    42904 &   toppings toppings_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_user_updated_foreign;
       public               postgres    false    254    4950    219            �      x������ � �      �   �   x���1D��"��@� �q�%�+��?i��fV/��"A,}$�T����.�X�0H���ׁ(���C�kɊ$p�����m���.<ZO4�@��]�v '�BΑ�g���B0�V���J�j���u��i���>3g      |   �	  x�՝M�5�ϓ_1G�������H\����$�dV;��뱻ۛAu���ûʁ��'��O��e��=�ݿ���18w.67>iw��&��o����{�zc�:^X���s�3Q�6}���ؤt�a6?>�oo�.���/~߿�9�}��������r��E�/��D����������?�O��%��������������m��]�y�r�����_�K�?Ao�zsu���f��>}8��p�����;���ˇ���!�������i��/�u�*��_ƛ����1��Q=�H�g �\�N@��l�z5~T��5�5}Ԗ5
��	����6�lxܜww��o�v�a[�"�'�h�5����m$V���L cm%VĝB����i�X�\`�����z�`���V\�d�*���*.؀����*h2��J��[�;m:gT����HَI�v��]H*�D�'��Y)T��|�"�P�A�=�R��`ɒZ#�zv�G���-_)ٳ+E��e�VX)ݳ+M��,0R�gW֡�F�ꌑTʮ,E������]����� ��(5@��ܚ��$���T���Ġ%K�d���PR�6<XȤb��8kɶ +巶EF6v��|d�(�:ĤL�lT����>�IUX2��RB��`�f��RB����d��J	�CL��zVJbP�%@=���Ç��Oq)[�Q9M�X)r+�X���Z�6��<�!.U��Z���BJ	�R��s���%X�X�i�,]\���G\ʆ�4�V��EF6��˶fEXĥl�tYKV�pR�����d�������K��x����l�:)��@��l#+�?��e�y��o�^�9߳M�3)'%}�JUX����J�O�Lj�ec��1 E�����| @"5²�
+Yc�Dj�e���Q�n����bT�t�*6{��*�$A��z��֮�U��^i��p^�B���O*���a�r��V5�mKYPDDj�m5[��������2��݁^��v��Z����pӋ@!j5�6d��l("j��q��lgA^ʆ"bT�t.�^-�GVX)�H��²�g)��R�,ѹ�J�PDJT#*ۊ�*GD�*,Ye*H�����dyA��1!BUaYvٳ+��__w7�R��[��+YsBT��N��l
�5&H����x��!�aYF�����\��j���Gֱ��9Aj�ö�mbKҜ�jU����4�=eWB�Re�����.Wj��e�M>��e�� c���	4-���5r�j���n�X��pF����pnV�V8�fL.&�q4+�,�Q3n^ˊ�r�8�'�>�w7�ׂ��1�/��R��EƗ~��@�6B3.��~^�5x������6��[��
7�>>i/-�lQ��~{j�[f���r�����l�(>il-jl��q��	[�
[�g���Ң�V���)qiQ[��4�c>E\ a���,�O��ѐ��Ќ�m�Z��dm�f��I5����2�.FC�6r3�����h��l�����f4$m#6��.�6�!m��#͝��k�ѐ�����6;�e�(u}f7G͍�zn�*o���bf6s��[�fnPu��4�����k�͟a3*̜��m>�8�J�چ�τ_�Fݭ`3f*�jW���S����tڃ
��3n��g@�+،ˌ�XP�zlF��M݂W����gA�3�!(��t)?�t��q��C����fĞ�q���܌5���iU���[�f��9q���pʠ>U����ԔU���܁�V�	����I࠻���	�t\s��l�2�\Xs���܌�dX����X^CԔŧ_O�{yiC����j9������ �aL�\m�f�٘����̧c�j�t+�1�O�aP_��͘�MW<�i#6cH���P��
θ�͔Y<$j7M���⡢ZJ��pu��F�=7�AQ����$=���`f�5�/3&a�[hjΪD9�3�;��2�s<�� ���Q0���Gji�W �`X��J+��4�3 ��q�b��I/�.�H���:J�0��H�X�*���@/[��D�,�r+����>�Af���,� 5�� �6�<�,5�yZ��mp����Vj�i����Q���]i��&"�L�b�%�Y!�J���а$�Vjuj�� Z��U�Vj�i�� 2�k�>n��R�O=�R�l[DS#�E�Ж���|�]i��z`�%��I��G*,Y&��� z�ҲT4�Jw��i�hx!�d}�W��ZXfї��ę��<�)�sڴ^&�a�Qy�[Qs�{���'p�~B�6�?]���8ӧ�i���6e�������ܳ���ϕ����6�u���մ�|�5c4_T�^T��Q��I̧�e������=��� �@Om�r��:MRC���+�������d�P��G����@Ǝ%�i�S�'�t���z�&����/�	�Q�&�x]`��JSv{[�1���ŋ|��      v   �  x��SKN�0];��E�eÞ%B��V�\g�X8�v(m�'�8E��I�|[H� P�x�8�ͼy��[4�Y�$p��|a�'V(�xE���܄8	&��`k�� ���4��m4c�0�`��:B��󬞸�b��fÛ�<���Ƴ.�B��>^�0�C��Rx`�
�\��3�dTНV���_,�#���j��j�j��P��i�Rŏb�����й���u��~.,�f�&�9[�	�e��Z6\���,����P�()�q����I��kU��o[w�Ӱ���.�q?M�t��x˪2K	rx��i��d�ْ�DH9�!At��F��q�iz/������g��w�a5�q���T���������&��/{C\C      �      x������ � �      �      x������ � �      �      x������ � �      z   �  x��Y�n�6��<!`@Rة��/�~li�h.X֢�2�D�$ѐ�$�a`ϴG��FʺP���^	l��s��;�<���H<I5�kwW�g��/�?P�0�ǂ�yd��S��5 0�� Kqr�%1��~�Iq�=��:��S܏L��u��Y������="�����IRv���U=}��벴)
��nٵ[>7Q�%:}��H�Ŝ�=�̽"��/�dx����M9-��_3Pv�Ā���b��$g@�lȀ�m
�=k	q��'�Ā�>N�q�u���O-��K�'샀&b��~�聛��\menP[�Ԛ��MO[���ǀx
���)���S����.�1h)\27�������6��|����|�m�%�x�-8��/�yk����I������e�W�J+��F���Q ��P���>�5�˪�@i�Q���D����R�wK;�*&�t�]L?���©}'�ʫ?�t����l��t��G���h</c>Ba�E�Ñd��T�%	j3��?��妱m��&؍���Ʃc�ע}j�f4��`V�_=��n�V��	7E\�v���8E0�&�7��m��)��
�^~�?��ts}ſޝ7�*:��QD��]�R�K�MD�E� �s�7��AM#I=a�'��8�H.D$�ǰ�G�F�é<8�O��s$q�Y�τ+��E5w5���ф{�[�[��}H�n��W��u�j��@Bݲ��c�[�6#//hG����RϠ�j��6�(�5ֿG��Fi�}��X��rHoJ�1'���U?3���)}��{�#
3ABZ-z�c8Ɖ�VznR�-��p��a餺x,��=!�M�h�e���^m��Ĝrg���u�#�ꈴ����JQs��
T�� �`��I9��n�IxsɈ����/���$��'����G�Ldͅy��#X�oϠ��c;?i 6ŀ�d�qҤ�L^J�)���z�n��=��Xv�گ�_��R2;f��=V͎U�b��]wH����5D��v�k�S��7[�5�]���[g6g��L����˓�:��:��C��ry�� �)��������2gT�ۙH�h!��ItahW
���(C���^����8��P�ԭ�=�+	@��)����FKM�\�#�k�Q�<�����E���.�Wi�k�ܺ^��BQ�"DQ'7HQ]��6�g�w!��Ƿ8������W�u� �~���A�����o�=�L;ކ�M������fk�,      ~      x������ � �      �      x������ � �      }      x������ � �      �   �  x��XMS�8=ï�}+�>-)7BB-��b�\�bfĠ�c;� !�~[��Dbp��T�Sw����	"#"O����|��Y��zӚ�H.�Z�]���_�#�����&�~D�#G'��Tѿ:&�r4뗦���Z���S�Q���}4�� !��oF��X�
Iƈ��n��Y�l��;s��Q�C����cV�t�M�?��Sr{}�ܼTzO%'S 2�NM�e�i�p�v1w	W��Io���ԟM19=�n��'7�g;��\0�(���u�\����|�X��3�/�'�1�t�O���}>_9��$!<�/�t�)����Mnڗy��)�4����q9<d�H�+���l�=p��0<��s�,�i�n�v�~��Xʔ�rH>�Y(Dl�)���f	9��1M�SrS��N��p�B�{8���r:�P��X0��Y4f���S�Ju���ϵ����,��fA��#S�5��뺅�A���I7�	�s��)�塁�p"��`*ڹ~Ⱥ�̷:R,���\��O��+�\�]9P*BB�&�{gjP�7�U��-�F�V۬=xh��D2D9Q��g�{��H�d=��<����x��g]�u[�����Li�i�E�7�m�n_D�2����T�Ӯ}LVu�lb���TH EDR�)�^��Y��'�ʰ��/�m��b�mW�a�1S��=t�X�����|�wYa~��4�!�P<��ߦC��3&\�/xI�oH��Q����F�A<l�k�bd�ml�,2�"�IY SA��CϣR��M2م/�GDs�@��04&tCr[��|��:�)�t$O!{E��]Wzc���<^r���l�960aMk��� )�3��(�К��l�<�J���d���cVG�����h������6��TmdAI�	N�\Q���S|�I�`W$c���}V?[2+��8R����h��Y�>�j)�<R;�~p9�l�S��M��ʳ�䘊�cTŁ�.��6�RQ��"�]a~��\2�^A�v�,���<����A3D��A�fg�:�b�Z�� G�"/D�N)��IM�ڎ�ds*��,�8;:��
f��e<���}r�Jʇ^ݞc.W��;��3��1�u�c�ޞF%%�)G�b�Z�ձ�<�L?=눡RP%?_a���Hn��q���k�����{��W�kZH�^[ʹ�� K�d�毵��6�7@BGӥ��rZ¯�j���HС�UC�'�5�l����Ȕ�ÛB`�iv�=�}J�!G�PG�8
m�/ZB[p���F�Qk��;�l��n�'���޻��G��Uw��}�+���R���&��y�#������A�V�	 0g~; ����Oȵ���^:=u�|z�m��*#�5�	x�O�A[2Y��~"�����@ksN��ͽ�����_�b��}^se����� ͅ+�|� 4�H��>�Urߺ�#�*��A6��W�}n6����Wmd� ���}a���֍���)��y�u��A��M������?��4|?8��^��k�+]�Mo��J��D& � "��$�Ƶw�\�b�>�3�>�A�Z�*�E���u�)S��	�<��썀~��S.������I���.ۼ��>���Ѫ�����a��m����;�PP��4(�'x��z2@)�X� �=9>>��}N�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�e�A
� E��9����Ƙ]/�ʨ3 �I0��/��By��><�2�q]4	-�)�����y-V��K��W\Jz,y���љ�T��ʶ�|9Q,9���n�=k���.��Ň�p�ϲ��Uj[�7�"����/7hj�*�>�|9      �   {   x�3���4H23564K�56�H�5170�MJ1M�5M3011M464JN�+Ȭ�J,���Z�$1�4'�HɪZ� 1=U�ʰ�*	DI��ٹ�E�@6�)�gV��c�1)�$���cM� �Vp      �   �   x����
� ��]L�U7�2ԕ0�L%�����Z
�!�>�}���@)�pQ`1Y��GF�Q����|����=��U��F�z�iN�੎��'��'Vd�ѼN �H1���} 1��y��1b�|�$������t�-��|�̩Z��,��YT�:.)����#w7�*Vt�ϼ�����^�� �L:�/j�J/*��V�q�������^eG��z���73����Ŵ.}�Ϋ���B��      �      x��]k����=�! �nн1�� ���.6�1�$A�݁����Bdˑ��mr� �r��@�(QO��l�K&���,�U�ɪ�(
#yA�/�m�x��KF�Jũ��)O���k�Eo�;%X�~��.}���٦ʝ�����{�V��|���"hBI��&X?&��=��-��4F?��]��ה��-�I�FC���!��A+���d�/7T^|�l?�_��R�S�4EI|�ɽG/z��_��mH����YI��&�_½���;7u��n����I�X�+?���'ew�xA�p��9p5Ux����Je	��E!x��oK��td0~����E�E�wi���R�����4����;?ofWiK~v ���(��@&��Qjk���x���B�n�oK��Ld1~`�1Y�X��z}���Q����
���wR��U>��B?%�>�a�wY����r��a��*Q��qJ��z����\�OQ��0y��1�mFF�������?(��� � #�/\es�˚�\�<������RX�4a�2����O���f���m����_�>��?f��}��_�������Ƚ����r��ly����b���)�wz	߫�ߺI�ņo�j��Q�*˙7{~B�>X���Ҙ�u2'֐y������([�~��{ߛ=D��M�����n��ۯf����-���e�B��ٍKXjxa6�#s��dF�5��9�	O�:�3�R~�Z���^�x�c9Kk��Kcw��e��Vn��^��i��8�n�/߹a๹��W+?I�� ��{ڷ�c���0���=����4����5s �fST��2��h�A�qF5� a6��5�7��6�B�]7��%$O��7oz����r��.�U�D���E�f��¥�&�y���_�?������
�VL��s(7^>A~RD�͋�f_�)��r�*��ٖBn��˼��].��:u�a�����\����e�v��9sש7[��ppb[w�E�້�w��~���Q�ΏhlC�B����K�-�mֹ�s��I�F�h�*g#�&rX�qn�3X�T�l2��["s�&�!�i!f�T6���T��6�Q�2�*2�<K7��ܔ���&��'7Yp����&����Q��H����zt�7oHe�*RY��:r���Dԡ�iH���|v�qly�dG��
�#�M{q��HmY�J+�)���6�ū�h��k��G�*5��TN�Z�'�څȪ�����!�y"~��E2����SŠ�2��Vq���6ٲ����3�B�u��O� p*���U��_��<�ܘ�_�԰j���tp��LBPC�He3��P���y�&�q�2��6�5�����	�z�}�KДX�l�L�ݑ7G�̪���SO�Y�ߔ��0���R����<�(�*�8;�E�*'�+� ߔ��4���hU�?st95�d� �H3�4��h�?�o�ﭴ{il��6�u����Q�0$�毋�����w���������*[.#�oRD� 5��46�UOج�
�Y�r?�M�)�#�,�������Y���/�uJ�ؔ�G�k!��p���V#�F1�����C�~ m���]��{�S� 3�R8jXi���¤��0u4;L�ڥ�p3���'� ��I^�M�j{Wa��x(�GL��˰�����:'q?t�q�y��n�lW�K"�),ۑ�Q�1�9�j��mָ�٣�z~��6c�3Rg����j�~MK�T��I�6?��0���>+ۧ�iH�<ъo�HbL~K:S7���ԩPM�Sч�g �Mx5�H$�[ҙ���t6u����L�Sч�g!]�4k~g7V�P�;i�6���Y3������S�d���f�ҒϘ��t��>̑����5����x*�P�02ؔY�oi�g �%�������T���C�Ӑ!�C�����-��Nڷ���M�c�2{���S,}��{2�>@c����2�>��$ť�]y�W�ڏ����k�7m��*U{���͞z⸔�@�`3Z��n����[�K��f���,�W\�¯ ����9�6�'��p�a��X��������3ec�jm��fC�[)w�*�glJ�W�j��I
1�Ji�����9�q��u�Ψ�2�d[�Ĺ~W��(tR#�Q�92�HdQ;���Nd�(�jC�X�?l8O^�d�*<F&��z=�?��M�M�)�!ڢbk�dNz��`u��e���P.����z����U�U~�v��n�X_���s���c�~@��7#��g�z�>�3��<na��6�{�&^CuW�&)LB�HG&'����&Vq�z�*���v}H�x0�ԐmR5Ldr�:G�PM��������`!�_����YɁy:Qmd�!��L�$�H̷�5uYl�o�uj̤%��hD�N�#K���y$C�v���J����:�v 3��P���+3� ��텪�"�-n���<G��p�Ψ�����س�;�^to38�*��,��M�����d�*��,Λ̞�~��Z6P|s oз5*��,6�0���:�C�EŶ�%��S�eE���/���{�rA <��_�x�%��%�6����&�N=�7�4&$��գN��]�.�w�=�������&��[7}ZD�ԋ2v�Y��E�)W�4}���{	s���{7.]�B�x��YB����ɁY���7	����D����{��Q�G�́���OC�`T����[B�:m`�4>t:��![P�(�
��Cp��2�����|Xd�2��T
g���D��,�ӑ�˱�Vs`XM>��Et=��	&=RqJk��#�:���lw"�3<�����|P��v�e�#G@H>��Y�p�m�ϑ#��$4>�#����A��#��Q�A��#����A����I�`HX/�������U�>��#`}$u0V>u|��#!����3F<G�>�{��d�FI�h�\��I~�����IÞ�An��mV k ���FI��\A�#��x.���QAT<�A�Q+M���sȘ�֩��x����(u�߯�?:ڻ��K-�R�%�����X�������/�3��24���C^��G+C�Q��Bs,C��� *Ƃ�\��3?�Z3݀U#�pK���NSF���lB�
VW�^}d�aU�[����#۹�Hf))�I� ��<���1W�1�9X�ȍ��{�-�������9	��@f۬@� dI=U1�K2U��T�ê��"S�+OU 8�v�/�\�y��a��� *��$����%
���܄!ª��"��iI ƪ�5U"�Ū<7i�t �U�s�M� -��YJS%�Z��ӵ?=q�u ƚ !�a��W`�k�z��Ʊ��XlZy�F1��f+������٠],]��h��{�n�PS5;^d$É���Fy���+9�is2 0�$'3UN�Ś�dF� ����u�q��º<�h�< B��C�>�j9�e���� �<����0cS�{�ú�7"�H^j+��uy"��,�:�( ��|:�� ĺ�����G�0=2�G�j��E���
\��
\a�|@�`�/�O��o��,`���b�>3�+?^�`�G����e��G���王$�g��(sWG��a��h�\\d�����g��A�ޯԕR;��{�\xs�St��������D!�/���;*�)���-��(�o�h�X��
S����'qT�77�M���m�X�&
1US@k4~}6�<��!��m�Co�}�y=�i�����r�:p7`K�А�+4�/�GtEOj}zK�А���Wd�^��O�x�,w[�Ǡ�>��{M]bm��a�*~������A3����{QV��i��_�`���hl�]���<�T�Ė�@!y��n�
\��
\-A�BV�FS}�%(\ ���[�<��N�����S�@�%*e��c�+7��2���Y[&�H ԰Y愼# �L���)�������`��o��P�m_��f�)�/}�����y.�| �  ^f����decL����vh_Y��$���/�Ԁc�f�26 ��h��{�Y��R���P�ə�)�u6笺z)�3ċT�U�\��mS�@)l�U�L�l��5����3�a�2�`�>�d�
�Q��sN�$jJ"�Pr��e��
9�T�T\�\�AU0���
�de�{/�6^�~}�R#e/�^1k�����E��jr�%V%>p��UcQ��}�.3@�mr�/Ua�L�����y/T�|�4Y���y�TSkW=����T#�PR5�}7�ը�զ�m����L��>o�2���sS7�����!��tA�/|~���~�,뜣o�B�
��5��o��݆�-�g���d3�QK���4+2��+�P�+�k-0Q�34Jw>]�k�~v ��Ѩ �StT��3I�C���� �y����}���v�J�Ex ��.x|Rvgm��@��֩Gm)Y��lW�>�!YN�����B\���5��� )����[?X?�?~����햫�f�����pV��)���>�=
����`��q ��O!��-�W�g.��sa��UyO8�p/�M���@�3�Q��
�
��:GGY���o�0r�6g�k�����!Á�F�\��Cd��ؖ\̀;�h��:�+���}{@�m�=d�C El�w�~�ws�j*j� ���?���#�[R      w   ]   x��K
�  е����(���@'b��"����-�&-����޸"�*�A��H7U��l���S���2w��Jy�NϤVY8yX9��F�      �   �   x�=��j�@E�ǯ�Ǆv�̌g�䩄��47*XJ�h/�Dm��
-e���b�mT;�b����{���}����锧�`�I�����n�׽Ɗ{� O��@ Q(��L*7e��%)f3�m�%Ǆ�@1	TH_
�+��x@�pL�ɺʺ�-4�N��6�݄��xF�B�3���)}h�ZG:Y����1����c�~��uYi�c�L鼸6gmq�� �%��k���Æ}������wq��4��LB      �      x������ � �      �      x������ � �      �      x������ � �      x   �   x�m�Ak�0���W��M��K�X&�;��(l��$Fg�(��_;���假�)�J�A��l
QbQ΅ʬAY��'7�K�'��΍�U��vc��z�z��"^R��]*� �)���ǡy�o�	�a8�:W;4Y�??L^-n�V�n�^�`�r��츰7zz�m�e5M:��3mC�8����S���;�p�U����%܀1�Gg�	L$f��`lO��"mm����y�?D�+�܆�P�S�Λ(���Y�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     