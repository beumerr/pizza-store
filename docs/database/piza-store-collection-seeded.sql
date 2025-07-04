PGDMP                      }           pizza-store    17.4    17.5    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
          public               postgres    false    237                       1259    43108    drinks    TABLE       CREATE TABLE public.drinks (
    id integer NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255),
    image uuid,
    price numeric(10,5)
);
    DROP TABLE public.drinks;
       public         heap r       postgres    false                       1259    43107    drinks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.drinks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.drinks_id_seq;
       public               postgres    false    274            �           0    0    drinks_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.drinks_id_seq OWNED BY public.drinks.id;
          public               postgres    false    273                       1259    42958    orders    TABLE     �  CREATE TABLE public.orders (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    "totalInc" numeric(10,5),
    "totalExc" numeric(10,5),
    "taxPercentage" numeric(10,5) DEFAULT '21'::numeric,
    "discountPercentage" numeric(10,5) DEFAULT '0'::numeric,
    "discountValue" numeric(10,5),
    "orderStatus" character varying(255) DEFAULT 'new'::character varying
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
          public               postgres    false    269                       1259    42975    pizzas    TABLE       CREATE TABLE public.pizzas (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    type character varying(255),
    name character varying(255),
    image uuid
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
          public               postgres    false    267                        1259    42918    sizes    TABLE     [  CREATE TABLE public.sizes (
    id integer NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    "sizeLabel" character varying(255),
    "sizeDiameter" character varying(255),
    "priceCm2" numeric(10,5) DEFAULT 0.014147106052612919
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
          public               postgres    false    253            F           2604    42940 
   coupons id    DEFAULT     h   ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);
 9   ALTER TABLE public.coupons ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    257    258    258                       2604    42289    directus_activity id    DEFAULT     |   ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);
 C   ALTER TABLE public.directus_activity ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223            	           2604    42266    directus_fields id    DEFAULT     x   ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);
 A   ALTER TABLE public.directus_fields ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220    221            -           2604    42658    directus_notifications id    DEFAULT     �   ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);
 H   ALTER TABLE public.directus_notifications ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    243    242    243                       2604    42339    directus_permissions id    DEFAULT     �   ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);
 F   ALTER TABLE public.directus_permissions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    226    227    227                       2604    42358    directus_presets id    DEFAULT     z   ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);
 B   ALTER TABLE public.directus_presets ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    228    229                       2604    42383    directus_relations id    DEFAULT     ~   ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);
 D   ALTER TABLE public.directus_relations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    231    231                       2604    42402    directus_revisions id    DEFAULT     ~   ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);
 D   ALTER TABLE public.directus_revisions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    233    233                       2604    42438    directus_settings id    DEFAULT     |   ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);
 C   ALTER TABLE public.directus_settings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    235    236    236            "           2604    42466    directus_webhooks id    DEFAULT     |   ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);
 C   ALTER TABLE public.directus_webhooks ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    238    238            T           2604    43111 	   drinks id    DEFAULT     f   ALTER TABLE ONLY public.drinks ALTER COLUMN id SET DEFAULT nextval('public.drinks_id_seq'::regclass);
 8   ALTER TABLE public.drinks ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    273    274    274            I           2604    42961 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    259    260    260            Q           2604    43052    orders_pizzas id    DEFAULT     t   ALTER TABLE ONLY public.orders_pizzas ALTER COLUMN id SET DEFAULT nextval('public.orders_pizzas_id_seq'::regclass);
 ?   ALTER TABLE public.orders_pizzas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    270    269    270            M           2604    42978 	   pizzas id    DEFAULT     f   ALTER TABLE ONLY public.pizzas ALTER COLUMN id SET DEFAULT nextval('public.pizzas_id_seq'::regclass);
 8   ALTER TABLE public.pizzas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    261    262    262            N           2604    42997    pizzas_toppings id    DEFAULT     x   ALTER TABLE ONLY public.pizzas_toppings ALTER COLUMN id SET DEFAULT nextval('public.pizzas_toppings_id_seq'::regclass);
 A   ALTER TABLE public.pizzas_toppings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    263    264    264            R           2604    43077    settings id    DEFAULT     j   ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);
 :   ALTER TABLE public.settings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    272    271    272            O           2604    43018    showcase id    DEFAULT     j   ALTER TABLE ONLY public.showcase ALTER COLUMN id SET DEFAULT nextval('public.showcase_id_seq'::regclass);
 :   ALTER TABLE public.showcase ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    265    266    266            P           2604    43035    showcase_pizzas id    DEFAULT     x   ALTER TABLE ONLY public.showcase_pizzas ALTER COLUMN id SET DEFAULT nextval('public.showcase_pizzas_id_seq'::regclass);
 A   ALTER TABLE public.showcase_pizzas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    268    267    268            D           2604    42921    sizes id    DEFAULT     d   ALTER TABLE ONLY public.sizes ALTER COLUMN id SET DEFAULT nextval('public.sizes_id_seq'::regclass);
 7   ALTER TABLE public.sizes ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    255    256    256            ?           2604    42896    toppings id    DEFAULT     j   ALTER TABLE ONLY public.toppings ALTER COLUMN id SET DEFAULT nextval('public.toppings_id_seq'::regclass);
 :   ALTER TABLE public.toppings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    254    253    254            �          0    42937    coupons 
   TABLE DATA           �   COPY public.coupons (id, user_created, date_created, user_updated, date_updated, code, "discountPercentage", "amountOfUses", "consumeCount", "order") FROM stdin;
    public               postgres    false    258   ��      �          0    42848    directus_access 
   TABLE DATA           I   COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
    public               postgres    false    251   U�      �          0    42286    directus_activity 
   TABLE DATA           v   COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
    public               postgres    false    223   ��      �          0    42224    directus_collections 
   TABLE DATA           *  COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
    public               postgres    false    217   ��      �          0    42872    directus_comments 
   TABLE DATA           �   COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
    public               postgres    false    252   �      �          0    42595    directus_dashboards 
   TABLE DATA           f   COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
    public               postgres    false    240   :�      �          0    42804    directus_extensions 
   TABLE DATA           R   COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
    public               postgres    false    249   W�      �          0    42263    directus_fields 
   TABLE DATA           �   COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
    public               postgres    false    221   t�      �          0    42310    directus_files 
   TABLE DATA           6  COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
    public               postgres    false    225   �      �          0    42709    directus_flows 
   TABLE DATA           �   COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
    public               postgres    false    245   	�      �          0    42300    directus_folders 
   TABLE DATA           <   COPY public.directus_folders (id, name, parent) FROM stdin;
    public               postgres    false    224   &�      �          0    42474    directus_migrations 
   TABLE DATA           I   COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
    public               postgres    false    239   ��      �          0    42655    directus_notifications 
   TABLE DATA           �   COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
    public               postgres    false    243   ��      �          0    42726    directus_operations 
   TABLE DATA           �   COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
    public               postgres    false    246   ��      �          0    42609    directus_panels 
   TABLE DATA           �   COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
    public               postgres    false    241   ��      �          0    42336    directus_permissions 
   TABLE DATA           x   COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
    public               postgres    false    227   ��      �          0    42827    directus_policies 
   TABLE DATA           z   COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
    public               postgres    false    250   ��      �          0    42355    directus_presets 
   TABLE DATA           �   COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
    public               postgres    false    229   d�      �          0    42380    directus_relations 
   TABLE DATA           �   COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
    public               postgres    false    231   :�      �          0    42399    directus_revisions 
   TABLE DATA           j   COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
    public               postgres    false    233   c�      �          0    42234    directus_roles 
   TABLE DATA           M   COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
    public               postgres    false    218          �          0    42422    directus_sessions 
   TABLE DATA           n   COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
    public               postgres    false    234   �      �          0    42435    directus_settings 
   TABLE DATA           �  COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls) FROM stdin;
    public               postgres    false    236   C
      �          0    42675    directus_shares 
   TABLE DATA           �   COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
    public               postgres    false    244   �
      �          0    42760    directus_translations 
   TABLE DATA           I   COPY public.directus_translations (id, language, key, value) FROM stdin;
    public               postgres    false    247   	      �          0    42245    directus_users 
   TABLE DATA           T  COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
    public               postgres    false    219   &      �          0    42767    directus_versions 
   TABLE DATA           �   COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
    public               postgres    false    248   1      �          0    42463    directus_webhooks 
   TABLE DATA           �   COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
    public               postgres    false    238   N      �          0    43108    drinks 
   TABLE DATA           v   COPY public.drinks (id, sort, user_created, date_created, user_updated, date_updated, name, image, price) FROM stdin;
    public               postgres    false    274   k      �          0    42958    orders 
   TABLE DATA           �   COPY public.orders (id, user_created, date_created, user_updated, date_updated, "totalInc", "totalExc", "taxPercentage", "discountPercentage", "discountValue", "orderStatus") FROM stdin;
    public               postgres    false    260   j      �          0    43049    orders_pizzas 
   TABLE DATA           A   COPY public.orders_pizzas (id, orders_id, pizzas_id) FROM stdin;
    public               postgres    false    270   �      �          0    42975    pizzas 
   TABLE DATA           o   COPY public.pizzas (id, user_created, date_created, user_updated, date_updated, type, name, image) FROM stdin;
    public               postgres    false    262   �      �          0    42994    pizzas_toppings 
   TABLE DATA           E   COPY public.pizzas_toppings (id, pizzas_id, toppings_id) FROM stdin;
    public               postgres    false    264   �      �          0    43074    settings 
   TABLE DATA           Q   COPY public.settings (id, user_updated, date_updated, "taxRateHigh") FROM stdin;
    public               postgres    false    272         �          0    43015    showcase 
   TABLE DATA           k   COPY public.showcase (id, sort, user_created, date_created, user_updated, date_updated, title) FROM stdin;
    public               postgres    false    266   %      �          0    43032    showcase_pizzas 
   TABLE DATA           E   COPY public.showcase_pizzas (id, showcase_id, pizzas_id) FROM stdin;
    public               postgres    false    268   �      �          0    42918    sizes 
   TABLE DATA           �   COPY public.sizes (id, sort, user_created, date_created, user_updated, date_updated, "sizeLabel", "sizeDiameter", "priceCm2") FROM stdin;
    public               postgres    false    256         �          0    42893    toppings 
   TABLE DATA           �   COPY public.toppings (id, sort, user_created, date_created, user_updated, date_updated, name, "priceCm2", "priceBase", icon, "isHidden", "displaySize") FROM stdin;
    public               postgres    false    254   �      �           0    0    coupons_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.coupons_id_seq', 3, true);
          public               postgres    false    257            �           0    0    directus_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_activity_id_seq', 428, true);
          public               postgres    false    222            �           0    0    directus_fields_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_fields_id_seq', 86, true);
          public               postgres    false    220            �           0    0    directus_notifications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);
          public               postgres    false    242            �           0    0    directus_permissions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.directus_permissions_id_seq', 1, true);
          public               postgres    false    226            �           0    0    directus_presets_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_presets_id_seq', 8, true);
          public               postgres    false    228            �           0    0    directus_relations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_relations_id_seq', 25, true);
          public               postgres    false    230            �           0    0    directus_revisions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.directus_revisions_id_seq', 409, true);
          public               postgres    false    232            �           0    0    directus_settings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);
          public               postgres    false    235            �           0    0    directus_webhooks_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);
          public               postgres    false    237            �           0    0    drinks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.drinks_id_seq', 4, true);
          public               postgres    false    273            �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public               postgres    false    259            �           0    0    orders_pizzas_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orders_pizzas_id_seq', 1, false);
          public               postgres    false    269            �           0    0    pizzas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pizzas_id_seq', 10, true);
          public               postgres    false    261            �           0    0    pizzas_toppings_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pizzas_toppings_id_seq', 26, true);
          public               postgres    false    263            �           0    0    settings_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.settings_id_seq', 1, false);
          public               postgres    false    271            �           0    0    showcase_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.showcase_id_seq', 3, true);
          public               postgres    false    265            �           0    0    showcase_pizzas_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.showcase_pizzas_id_seq', 12, true);
          public               postgres    false    267            �           0    0    sizes_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sizes_id_seq', 4, true);
          public               postgres    false    255            �           0    0    toppings_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.toppings_id_seq', 11, true);
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
       public                 postgres    false    251            d           2606    42294 (   directus_activity directus_activity_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_activity DROP CONSTRAINT directus_activity_pkey;
       public                 postgres    false    223            V           2606    42233 .   directus_collections directus_collections_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);
 X   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_pkey;
       public                 postgres    false    217            �           2606    42880 (   directus_comments directus_comments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_comments DROP CONSTRAINT directus_comments_pkey;
       public                 postgres    false    252            z           2606    42603 ,   directus_dashboards directus_dashboards_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_pkey;
       public                 postgres    false    240            �           2606    42813 ,   directus_extensions directus_extensions_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_extensions DROP CONSTRAINT directus_extensions_pkey;
       public                 postgres    false    249            b           2606    42274 $   directus_fields directus_fields_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_fields DROP CONSTRAINT directus_fields_pkey;
       public                 postgres    false    221            h           2606    42319 "   directus_files directus_files_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_pkey;
       public                 postgres    false    225            �           2606    42720 .   directus_flows directus_flows_operation_unique 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);
 X   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_operation_unique;
       public                 postgres    false    245            �           2606    42718 "   directus_flows directus_flows_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_pkey;
       public                 postgres    false    245            f           2606    42304 &   directus_folders directus_folders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_pkey;
       public                 postgres    false    224            x           2606    42481 ,   directus_migrations directus_migrations_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);
 V   ALTER TABLE ONLY public.directus_migrations DROP CONSTRAINT directus_migrations_pkey;
       public                 postgres    false    239            ~           2606    42663 2   directus_notifications directus_notifications_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_pkey;
       public                 postgres    false    243            �           2606    42733 ,   directus_operations directus_operations_pkey 
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
       public                 postgres    false    246            |           2606    42618 $   directus_panels directus_panels_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_pkey;
       public                 postgres    false    241            j           2606    42343 .   directus_permissions directus_permissions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_pkey;
       public                 postgres    false    227            �           2606    42837 (   directus_policies directus_policies_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_policies DROP CONSTRAINT directus_policies_pkey;
       public                 postgres    false    250            l           2606    42363 &   directus_presets directus_presets_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_pkey;
       public                 postgres    false    229            n           2606    42387 *   directus_relations directus_relations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_relations DROP CONSTRAINT directus_relations_pkey;
       public                 postgres    false    231            p           2606    42406 *   directus_revisions directus_revisions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_pkey;
       public                 postgres    false    233            X           2606    42244 "   directus_roles directus_roles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_pkey;
       public                 postgres    false    218            r           2606    42428 (   directus_sessions directus_sessions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);
 R   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_pkey;
       public                 postgres    false    234            t           2606    42446 (   directus_settings directus_settings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_pkey;
       public                 postgres    false    236            �           2606    42683 $   directus_shares directus_shares_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_pkey;
       public                 postgres    false    244            �           2606    42766 0   directus_translations directus_translations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.directus_translations DROP CONSTRAINT directus_translations_pkey;
       public                 postgres    false    247            Z           2606    42645 *   directus_users directus_users_email_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_email_unique;
       public                 postgres    false    219            \           2606    42643 8   directus_users directus_users_external_identifier_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);
 b   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_external_identifier_unique;
       public                 postgres    false    219            ^           2606    42254 "   directus_users directus_users_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_pkey;
       public                 postgres    false    219            `           2606    42653 *   directus_users directus_users_token_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_token_unique;
       public                 postgres    false    219            �           2606    42775 (   directus_versions directus_versions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_pkey;
       public                 postgres    false    248            v           2606    42473 (   directus_webhooks directus_webhooks_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_pkey;
       public                 postgres    false    238            �           2606    43113    drinks drinks_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.drinks DROP CONSTRAINT drinks_pkey;
       public                 postgres    false    274            �           2606    43054     orders_pizzas orders_pizzas_pkey 
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
       public               postgres    false    5024    258    260            �           2606    42943 $   coupons coupons_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 N   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_user_created_foreign;
       public               postgres    false    258    219    4958            �           2606    42948 $   coupons coupons_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 N   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_user_updated_foreign;
       public               postgres    false    4958    219    258            �           2606    42863 .   directus_access directus_access_policy_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_policy_foreign;
       public               postgres    false    251    250    5010            �           2606    42853 ,   directus_access directus_access_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_role_foreign;
       public               postgres    false    218    4952    251            �           2606    42858 ,   directus_access directus_access_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_user_foreign;
       public               postgres    false    251    4958    219            �           2606    42647 7   directus_collections directus_collections_group_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);
 a   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_group_foreign;
       public               postgres    false    4950    217    217            �           2606    42881 8   directus_comments directus_comments_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.directus_comments DROP CONSTRAINT directus_comments_user_created_foreign;
       public               postgres    false    252    219    4958            �           2606    42886 8   directus_comments directus_comments_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 b   ALTER TABLE ONLY public.directus_comments DROP CONSTRAINT directus_comments_user_updated_foreign;
       public               postgres    false    219    4958    252            �           2606    42604 <   directus_dashboards directus_dashboards_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_user_created_foreign;
       public               postgres    false    219    240    4958            �           2606    42560 ,   directus_files directus_files_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_folder_foreign;
       public               postgres    false    4966    224    225            �           2606    42497 1   directus_files directus_files_modified_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_modified_by_foreign;
       public               postgres    false    219    225    4958            �           2606    42492 1   directus_files directus_files_uploaded_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_uploaded_by_foreign;
       public               postgres    false    225    4958    219            �           2606    42721 2   directus_flows directus_flows_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_user_created_foreign;
       public               postgres    false    4958    245    219            �           2606    42502 0   directus_folders directus_folders_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);
 Z   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_parent_foreign;
       public               postgres    false    224    4966    224            �           2606    42664 ?   directus_notifications directus_notifications_recipient_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_recipient_foreign;
       public               postgres    false    243    219    4958            �           2606    42669 <   directus_notifications directus_notifications_sender_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);
 f   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_sender_foreign;
       public               postgres    false    4958    243    219            �           2606    42748 4   directus_operations directus_operations_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_flow_foreign;
       public               postgres    false    245    4996    246            �           2606    42743 6   directus_operations directus_operations_reject_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_foreign;
       public               postgres    false    246    4998    246            �           2606    42736 7   directus_operations directus_operations_resolve_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);
 a   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_foreign;
       public               postgres    false    246    4998    246            �           2606    42753 <   directus_operations directus_operations_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_user_created_foreign;
       public               postgres    false    246    4958    219            �           2606    42619 1   directus_panels directus_panels_dashboard_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_dashboard_foreign;
       public               postgres    false    241    240    4986            �           2606    42624 4   directus_panels directus_panels_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_user_created_foreign;
       public               postgres    false    4958    219    241            �           2606    42843 8   directus_permissions directus_permissions_policy_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_policy_foreign;
       public               postgres    false    5010    227    250            �           2606    42575 .   directus_presets directus_presets_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_role_foreign;
       public               postgres    false    218    4952    229            �           2606    42570 .   directus_presets directus_presets_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_user_foreign;
       public               postgres    false    229    219    4958            �           2606    42580 6   directus_revisions directus_revisions_activity_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_activity_foreign;
       public               postgres    false    233    4964    223            �           2606    42527 4   directus_revisions directus_revisions_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);
 ^   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_parent_foreign;
       public               postgres    false    233    233    4976            �           2606    42792 5   directus_revisions directus_revisions_version_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_version_foreign;
       public               postgres    false    248    233    5006            �           2606    42838 ,   directus_roles directus_roles_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);
 V   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_parent_foreign;
       public               postgres    false    4952    218    218            �           2606    42699 1   directus_sessions directus_sessions_share_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_share_foreign;
       public               postgres    false    4992    244    234            �           2606    42585 0   directus_sessions directus_sessions_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_user_foreign;
       public               postgres    false    219    4958    234            �           2606    42537 8   directus_settings directus_settings_project_logo_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);
 b   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_project_logo_foreign;
       public               postgres    false    225    236    4968            �           2606    42547 =   directus_settings directus_settings_public_background_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_background_foreign;
       public               postgres    false    225    236    4968            �           2606    42799 :   directus_settings directus_settings_public_favicon_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);
 d   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_favicon_foreign;
       public               postgres    false    4968    225    236            �           2606    42542 =   directus_settings directus_settings_public_foreground_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_foreground_foreign;
       public               postgres    false    236    4968    225            �           2606    42822 D   directus_settings directus_settings_public_registration_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_registration_role_foreign;
       public               postgres    false    4952    218    236            �           2606    42635 B   directus_settings directus_settings_storage_default_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_storage_default_folder_foreign;
       public               postgres    false    236    224    4966            �           2606    42684 2   directus_shares directus_shares_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_collection_foreign;
       public               postgres    false    217    244    4950            �           2606    42689 ,   directus_shares directus_shares_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_role_foreign;
       public               postgres    false    218    244    4952            �           2606    42694 4   directus_shares directus_shares_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_user_created_foreign;
       public               postgres    false    4958    244    219            �           2606    42590 *   directus_users directus_users_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_role_foreign;
       public               postgres    false    218    219    4952            �           2606    42776 6   directus_versions directus_versions_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_collection_foreign;
       public               postgres    false    248    217    4950            �           2606    42781 8   directus_versions directus_versions_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_created_foreign;
       public               postgres    false    219    4958    248            �           2606    42786 8   directus_versions directus_versions_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 b   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_updated_foreign;
       public               postgres    false    4958    219    248            �           2606    42815 9   directus_webhooks directus_webhooks_migrated_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_migrated_flow_foreign;
       public               postgres    false    4996    245    238            �           2606    43126    drinks drinks_image_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.drinks DROP CONSTRAINT drinks_image_foreign;
       public               postgres    false    274    4968    225            �           2606    43119 "   drinks drinks_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.drinks DROP CONSTRAINT drinks_user_created_foreign;
       public               postgres    false    4958    274    219            �           2606    43114 "   drinks drinks_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.drinks DROP CONSTRAINT drinks_user_updated_foreign;
       public               postgres    false    274    4958    219            �           2606    43060 -   orders_pizzas orders_pizzas_orders_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_pizzas
    ADD CONSTRAINT orders_pizzas_orders_id_foreign FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.orders_pizzas DROP CONSTRAINT orders_pizzas_orders_id_foreign;
       public               postgres    false    5024    270    260            �           2606    43055 -   orders_pizzas orders_pizzas_pizzas_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_pizzas
    ADD CONSTRAINT orders_pizzas_pizzas_id_foreign FOREIGN KEY (pizzas_id) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.orders_pizzas DROP CONSTRAINT orders_pizzas_pizzas_id_foreign;
       public               postgres    false    5026    270    262            �           2606    42964 "   orders orders_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_created_foreign;
       public               postgres    false    219    260    4958            �           2606    42969 "   orders orders_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_updated_foreign;
       public               postgres    false    260    219    4958            �           2606    43086    pizzas pizzas_image_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_image_foreign;
       public               postgres    false    4968    225    262            �           2606    43005 1   pizzas_toppings pizzas_toppings_pizzas_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas_toppings
    ADD CONSTRAINT pizzas_toppings_pizzas_id_foreign FOREIGN KEY (pizzas_id) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY public.pizzas_toppings DROP CONSTRAINT pizzas_toppings_pizzas_id_foreign;
       public               postgres    false    5026    264    262            �           2606    43000 3   pizzas_toppings pizzas_toppings_toppings_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas_toppings
    ADD CONSTRAINT pizzas_toppings_toppings_id_foreign FOREIGN KEY (toppings_id) REFERENCES public.toppings(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.pizzas_toppings DROP CONSTRAINT pizzas_toppings_toppings_id_foreign;
       public               postgres    false    254    5016    264            �           2606    42981 "   pizzas pizzas_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_user_created_foreign;
       public               postgres    false    219    4958    262            �           2606    42986 "   pizzas pizzas_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_user_updated_foreign;
       public               postgres    false    4958    262    219            �           2606    43080 &   settings settings_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_user_updated_foreign;
       public               postgres    false    219    4958    272            �           2606    43038 1   showcase_pizzas showcase_pizzas_pizzas_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase_pizzas
    ADD CONSTRAINT showcase_pizzas_pizzas_id_foreign FOREIGN KEY (pizzas_id) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY public.showcase_pizzas DROP CONSTRAINT showcase_pizzas_pizzas_id_foreign;
       public               postgres    false    262    268    5026            �           2606    43043 3   showcase_pizzas showcase_pizzas_showcase_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase_pizzas
    ADD CONSTRAINT showcase_pizzas_showcase_id_foreign FOREIGN KEY (showcase_id) REFERENCES public.showcase(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.showcase_pizzas DROP CONSTRAINT showcase_pizzas_showcase_id_foreign;
       public               postgres    false    266    268    5030            �           2606    43021 &   showcase showcase_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase
    ADD CONSTRAINT showcase_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.showcase DROP CONSTRAINT showcase_user_created_foreign;
       public               postgres    false    4958    266    219            �           2606    43026 &   showcase showcase_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase
    ADD CONSTRAINT showcase_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.showcase DROP CONSTRAINT showcase_user_updated_foreign;
       public               postgres    false    219    4958    266            �           2606    42929     sizes sizes_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 J   ALTER TABLE ONLY public.sizes DROP CONSTRAINT sizes_user_created_foreign;
       public               postgres    false    256    219    4958            �           2606    42924     sizes sizes_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 J   ALTER TABLE ONLY public.sizes DROP CONSTRAINT sizes_user_updated_foreign;
       public               postgres    false    219    256    4958            �           2606    42911    toppings toppings_icon_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_icon_foreign FOREIGN KEY (icon) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_icon_foreign;
       public               postgres    false    225    254    4968            �           2606    42899 &   toppings toppings_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_user_created_foreign;
       public               postgres    false    254    219    4958            �           2606    42904 &   toppings toppings_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_user_updated_foreign;
       public               postgres    false    4958    219    254            �   �   x���=
�@�z��2���L�v!D0j��s�#�A��T���ݔ���킩!�y�m���,��Đ%��JV�mcG"��z}�w��FAv�v��\�=}�$��f=���݁	��t��6�U�^�[�?x�!��F4      �   �   x���1D��"��@� �q�%�+��?i��fV/��"A,}$�T����.�X�0H���ׁ(���C�kɊ$p�����m���.<ZO4�@��]�v '�BΑ�g���B0�V���J�j���u��i���>3g      �      x�ݝ[�&Gr��[��/w�3���S핱����.�a��Ԩw���AF�ޙu��>8��+*FH !i4�DeF���o�~��|�����>v����� ܠ \m�i����co������:�R�F� U�C���᷻���G'���~��{������v����m��t���x�/��������w_t6H�o������_��o��~�o��oy�����������N����k=�_��_r��}�ۯߞ>}{�<��������/?t�s?���K_��V�H���1����{�����/R����^�Au��l���? ��ߚQ�> 5�B�j��:��}���w����������矞�D�6Vzn_8 �ZX�����2۸c�4Vg�v�X�J�N.V�֑k^�������uZ���`�DV/x^��u�T)%�b&��{PA��R�ҕ�2*f�Ucю�>�k*�c��!,�AA5q�
��l��@O�Q/`����A����ł=sPH���}X,�3��Xfр�>s0��3��hLJ�����\���S���;�����%�՞����!�*WA��@c
ҐD�+!_r�,II�*�v�0;�ߚD�����1��(��()*�eS[`ѲEI-��ą�KQR,(n�,EI-�̼��KQR,�P�`��(����z.ۇo��6EK���U�B��A�`�o������A���J�+I`'/���R�TI+��p��,(
,TJK��/c�(Zʸ����P��s�۞Ea)ZʄJ�/k��,,� EK-��"[��?@�R3,3glыo$5�2۲�$�fXn_�$�fX.'����KW��"Ԕ�������X��(Y��Kз�bя#)�	�+�%)��r��X<�HBj���XL5:���a����^����j�+;�����FrS��Ie�	APf5 ����RU����e8��i_����!emFF�mcQ���	6)n
��<EHͰ\>�����mGO�V3�aV��EZͰ��h,�i�$=�Z`ѐ�(*Е����EG.�X8�)I���{��!O�T,＠b�����fTn;�aR�S��,3�0�(�j�e8L=��Z`���/�����k[?�7EJenp�'n�Ś"��T*If'��Tc 	�	�qۼ��y���a�|��o�~Z��������#�o���@�V#l��6&�%[�aM������J��T��)	lD��{$	.[r�6q�M>���UjM��vl���E��oM�f5S�y��[��������9l���cp�z�#l������/I)5�?p��gw��\�9��}b<�$ی�E��}�Izm��շ�yQ���x�߰Tl{<Q5[��x����D�l^r���֩���23����[�*���ы�*�DUl����'�U�z��|]�$�n+���5ᒨj-C�y���Bl��=�	�o�I����۪jъ$�fl�bmC�jE�k38Ǵ˺vъ��fn��{��Ҋ��&l6��ݚM+�h��9J�}�M+�l�=�;9�mZ�t���Q�m~x�v��^����9U�1���ښ*�
7G�q�k�z+����T�T閩��3���7����ْ�G�Ͽ ��w����~���
6�He�v#�����J�2��w�%����P_�p���
6ǈeC����9r�ꆨ�
6�=������e��t/?Q�~�������9bo�8���9�7|Q��$�Ͻ�����`s��[��P�[g��ײ�v�35ˬ�Vxn�ʭ�	`���]�D�6�sP���%j���1���,Q���#�U�Fj��LCT,�O�����$����L<��-�F�j��}I�M����O#I����3_�i$��K�B8z��8�ԗ����g�$�fl�.m˗���/���4����ͦ��n�����R����&*5��[��(�Fn�^m}�u�z���M�ic�c�y���52��������p�c�4��ʔ�`\��>X#HM�0�:�%�Zh�^��4`��xRO�{��K�0�[f��c�05i�L��Z��&Mp�ρ�X����4 cC������4 �:�?2��6-�����GǍk��I�T��g��^h���Sb��Y�%��f%I�P���%�Xh�V��4`��s�j�Ś}j�<�Lk��m-��S��X��1p��hhD��R	����-�F̴�r@c�P��Y$�؀4`���x���~]+-&�,+2���|fT/�gڱ�b����І�br���K�y+jk}��^����w�h���ꕛ�J_Ov����6��g��x��\b��u�p<�w�fy�{����W�����=a��HZj6#1�s�����n��a4�g�5@�p���iy�uZ�&��|���uו0_ ��r߳|�����2�/NM��Ҽۥ�\�Y6�^W/��Wl��mU��L�^*���vv̈�3ke,}Qo&q	�.�M��㩵���$`Ӈ{���g�`�ƶ��꬀^���B�5mlk��ra��d��sY��_�0f`�-�6c�w�Rd[��ҳ�Mv��df�X��a3jx�SK��nPJ��Myw;%��hmС	p@�(����� �1z���'=x#��W"z߉�l�}q����1Nz�eC,I`�S�����(m&��!�>ŀ^u �(b�t�2���h��g3(�b�!�����F@׃��Ңn4.��5%�U��s��#BQ�VU6J��A�<�!�8ȴ%B�����iS�0�`�������b7�a�����^�i�P��\i�8����e�.�lJQ-v��F\i���-v��\i��[��~�8�+-�}�rQ��L�'=�%.(�X6���i��^FS.�eZ��0�z\R�uc�UЊ��R��HK�K�u����5��g�s�9��5|�4�P�*����	��U�����U�Z�����\H���H�$�R7���1��kTi�Y���[��'�*�0ڵ�6��M� ���a���um���n��_S�x�9xy��Z��Qx��8��a�./��v����qGJ����`�Y�Z���N4�ɮc�F�}j���o���������9�dh�Ց:���6ڔ@E�ٝ�6t�t�=)%�����f�l��D[�Tj'�h��>�λ(凌�B����`ӭm2G0�;$a���%U�;~�)��;4nR�n6�Y���Z�^ѵE��&�TC5�z�|S�iCҤ�RQ�����ٹk�=� �/���A�k��Ȍ����aH�t2��z\�ա�[�7!{Ҧ�D�\Y~Ճ�;p�+cH�t��s֚�л�Ec��Di�u��Nl�c7��!����<i
uV�u#�Pd�UQ�Y���e�C�U�u�4:���i{ݴ"�D9dQ���m�5j��:��D�A�,WG��Ѫ�$�����4��y�C�aPup�i�w�ƐD�d6��&s�������U�[�͎���=xT��(���\��I�4��}�*6eG�X%��$)6����$���xy�΄�gK4u�������vh����becH�t6/��%�EF�r�VV��K��Y�}�{k�|K���ͅ����ҭ��l�����\4�7"9�D[�:Ђ a`D6��\��3�hTrZ����>*��z�������x�����L�%���p�ލ��!�ځp�.r��jS+�U*G�n���?h�PY'�B=�Ƒ��`(�Τf��]��] E9��L���KS	�t�H�ik�l�&-��ykggǭ��Jube���R���I��DԲy2�MKI:U�hFψ&Z�� a(�.����fh�6-E�eZ��m���}�m���t��*=����Jm���J�����=}BD@On|�u�v��Kc@I���hJ��C�	?]��$3�[��춍[_�8u��lݻ�	�FDk��'�#�ON���e=o�$/6�a�)����M��F/\h��y4�D��p���Z42%LZ��r�L�r�;�����JM�,\i�9��@�K�WZ.���Z���� ~	  /h�F��0b['=��R�I�X-��q�ۂ�vC��R1o���"���pp!��6a�hR;.�~W���@]������*alC�]��-'�6�0��sVSiU��;6<w��3����+6?������z�^������+5��kw��S�]3u�r��n�h<%�`s\�k�a�C�.O0�G���u������>\#��ds�����.%���O��S������	3F8-�y��-@q���-�=a��M&u��')��gb�Ww�r'�9S`���˝$�&l�����I�n� ��|��'̃���c9�g=B'̃�Rs)��䄁6�1[�	�@�+8�e���!.�l���LAL�Vj��>�(��bo�q�^��K�FTl#8G�����*�P�B�~r&>L���[�~�F��p��xn��q� �u�Ʒ\Z�ʴ�1]?�U�l��{çQu����+�67U�%	��_�&��2��eI|wz�0��b�u���NTk#4�<�ZN��/L�ٱ��eU�Y�`�6�����_�9:�U�f	��/�W��G��.�Wh�mU�Y(w Li�iY_�����'�+[,a�
o��~�S(h[��F6��rM{�j	FZce�7���&Lv��8����^>2��j�+�e#�%�����FdZ(/�bತ�&��B�a@4�s������A����5j�5>�����:�i�V��h� ��Z]�u��\���,VzE�2ŤIQ4�D��%�a�t,a2���K�pc�mt^	�܎൨-�bpzpF�nH����<��pJw��0�|�'��7ծ�p
�� ��3�$�\��hN��81b/�,a0��h���/�L��<5�t����p�vܭ�I��Ji��7�jk)e�i�lrH[��!�Ҿ2F6���y�o�iC�O�5p���������a�� JK��DWߞ�S�] �5<��RJz6OF>��de`#�?��d��X���`�D��3�\��[�*�5F�OW�hM���ҳ���0ǭQHF���h�X�5��X�Z��ٯ4��ёb��5B�t��'�˕4�u|��D	�u�ƼP�A�=���(]i%sr:�B�O�p��P�҅�d_vaD;�p�nb�>
��/�h��T'Jc��\(�&��������;Y�] �Ve�'H�R����B�5U�p�P<Qf!l,�L�����2����g�;�%I��2�Þݼ�*|Ф��ifi�y���+&*��OȘ:�3�Ͼr8]����f���ؓ7�kXT�E
Ͱg�T~�j[GQD��Ni������
c���r����u���2�Qe��6�V/�'���O�^��x����}��!#yv����Dô�#��2۩h�v|��3ؓ/̋?K)*��Ɲ�A��E������g�~��Ǉ<�e�z?��<%���Є�r�$�dˍu�l�7_U����?�e��py�I��U�KǦ�8]�ubS�����G%R��M7t�F7�����fs�Y̑B�m0�����%bW�"(�2�7Il��%;��兀�$�5Ӳ���hQ��I�k�����'�-?��>���/�����?�=ٗ��EO�@�[3�ɥ�7��J>޳�-�(	��dIyM���$�����fZ��EI�*����~���.�'PZ$� m:Q�&	�Z� �5IX�J�Lg�~|���D@ 	�����6h �t���w�i�@�U�DƉY�����F@� �j��>#h�&�J+4L��eUe��b���i)�k�嶝Ѡ0R��B��S��H�϶����id�0)R�L�m��QR�x��YǠQR"9♖�#^)4�{1{�(�4&ܼ�)�Q����ٺo�/��;>��J����aC	}�8�-Y.��;��4��1���FQ׭�᠅������IM�1{��n�=����$�L����Sh�Ŀ$�/���5:��$���?;���ïm��ں�(I����a�/K��3����5,z�&R�3Þ�u_âO"<3��j�]٬��N�e���E^�b�}SP�HǕ>
N�^/`,�E�H��e�װX���fXf~+���ؓK֯a��9(�v�a��YTG�"��P)/7���H�i�e�#��(�j�i��LP��~�Wڳyoh�mKJϴL�-���x{�L	c����W����ȥҷП�E�M�FT/���Fg�(���5�E]��$�Zf�֢.XSZ̴��#T��`M��/��*;�R��.]i�>^�Т�><+�-��ĊO><�-3��иNS2O-�}�Q/u�s����E�	uR�;�?�e��ۣN�x��g�̎[�f�wnF�mۢ�6�R*2�uɆ$�\i����s���5$)�J�Ls�õ�S���j_%0$-���}v����RĔS�R�h~���?��o��h      �   �  x����n�0���Sp�Lv�}�iB�)
��i%a���-m��V֢M����?�o;F���o�B&���G�x#y���b4�fYcz4F�+
�
W�n_��fJ�ք�+:eZPa��8�t��J�kK�S�[/m��^gda�F	��.��q|:�"�@Z������aBP�F��3�o�x�=b'�H*ש
��/g�$F_گl	*D}?_d���G7hy��RO��3W��;��r�Ԏ+9P��DIE�HB��M�9Xڳ5�Ԕ��=�-\�5�����o��9��ƠL�Eu}n�ť��������6���^5�0U*����zhD�����rhQ���aˌ0ڞ�?Q눺��W�mB���C�$_��X      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x��Y�n�6��<� `@[X�H��ǖvm�6��h�-Q11]\]����=�a/�W)�)GL�՝��&i��t�wΡ�V�9�/+�����F�yS��꿦@K�4�גnx ��UQ�7H(8N��	4./������
�8�͸,�qq��,��Q�l��ߍ#c�@_P���R_,RV�E�2�NS�͌eK��ek3�&7���bŔE'���&fg���(1��|�r�e��-+g��;�@3�{�Ɏ,����,�%i- N�ho��߳bR�N�0�z�i�K��o�m:ۥ���C��ܨP�2BT7N:�����y ,��"�����$�d
$��Zv<h� HL�Ŗx^l���{���8�)_~."e�vj39(3.��iZ\�XO�2Cuu���>�OO���^�yI"���L�P�&Ԭ^�8ƹQW0�E�b�k�[���V�ox;� ���v@���}�	அ�5H O�~O ���;pס�������B���>�
<�j�ze5������&gb�8��L>�O���Q�P�HǸ)��N������?�|x�����w>?-*�y�oY���V8�E����.�������@����!���u��"V���/�߼;}sB��>��#t�QV4y�&yW��5^m�EɆ&`c��u�'$�&�cC�7#�"����kV"d$7�����5���ɈP��$��PC��y�d��ɰ��Zvg7+���uV\E�̘�o�P�e0�RBk6��ڧ�c�Jj恛�]�����[Lh���6 ������E�On��l��Ը���4q�R|0B�VoRQ#=���: Vo�
�C*��w�D�k�4�X�3&F���̓�r�mx�c�dl� ly��K,�H���蟠7�K��ZV��OPz=�:]O�eS��(�j���m�A~���	{
�TS�V/��{O0���T�.�`�ťk��jR�c���]�#q!��=���6ht�{#��oS����P+J����5�����Zy`@h[�<{M�Bm��g���3W�מ�i�r�V����`%����fŰ\ʙ_Ձ{}Y�rg�7���l,A������ �=����Է}.ծ+};��ߓB�%�wX�;�T�ߣJY��X��%�y�s\2i�}�ݚ\�(��#�v.�ag�\r�v�ⶤ����#�Cw���ha�MS|���8JPZ��z�5�z�ݝ���2KN����S��zS��F~)�����LN�!��,��()r�o�����".}���]<S�>�y���zA.g#�t�ྭ~�/,f�
��;�Zvj���=�2ѫ�ˆ� Y(�W��v�� Ew����ӯ]\���ݴğR�\�2�'�:�r���V��p|`y�= C��k������?с51��"ۊ2�b���mo\}O�K���]��}~z�V���}j���K��68�$���	���[����P�E3@N@��"�N���T���	�<ˌ�ih:��7�bs깉��>��D�FV�6}����U�vb���S��lsy،�����a�;
1jY��,�����qP� ���i3OID�⺨o��{P�nX�L�گ��M{����_	�BNgB?�*��nb$⦳&�0��mU�&RCyDE���%aۯ�ț�Ղ��,����m�/
[���e�J�t�������_E�@�      �   �  x�͚KoG����=(n?�_��&0��7�:��\�_� �d�	����5=ӔlS�X����М�X�V��NIBY� fԐ]�1�DB���>����P����V7i��hßyxц��-]�����s%�5Z������LS�!-U�+%�aAᅐ��]
�A�?1lqtU�i�%��O�6z����}6<���m����h�!C�C'Y!mr�EM�9���K�[Ѷ��$��8�{N|�d@�YH�F���$���)�M	��kjy�~��<�pZ����1�F���6`��GH��)
IHPF�b��q�8GuĶ-�p��T���>\��?I�L�Ƣ��S��_l� S`�Z㽷������P�Ч���+ww�~�����p��&�7�0�"�u�,��(ƚD"V����*������"��g��ضtu�^�@���a� G�Nr���1�稤I�b?g�G����jH��&�sTGn閶�)~h���)~=$�sg�s-����1D�sU*�X-KB�������5�N7��M^��`�}U� �9�p�!�b9���a1y𚓅�)j�|N�S�Ց��~�ۏ⯃� =�O��=Dj�Σ�[YcQh�A@��[ё��'
�ǁ��N�{����?��%	�
��{X�ZY�5�X��:���rV�@yk�9M /�Gm�!�!7�Np�����!]��ox���6�$ɓ�$�D"���9�d�:[�9usRa B�\�Fr�9������	�4yA~�dq:]T\ܜ���X;������&��
��Lb��#ؔ�8Cu����j��A���x�?�C�.��UP��d��,%�c����ׯ�.�� �����!Tj)�W����G���~#;Q3��ޙDV� Q�R&|sT�;�:�&�����_ �lB�\��4���8�F�@�8�&��-��g�6h״m���vap/ԀӁ�]J�M8\pĵ0E�n���@\'s�[��VU{���:Zޡ�k��E7��*�����֞����Qr:����'����VA�$�l����:2�I�vt��M�Kғ&|�5��u*H�p�g�t�7� jV�{8C�1�>~����G~7FhO"쀝6���z1��&�T伊Qx�tℐ�ks��qsT���ͧ��~�e�u��9�xt���pc�p��� �<�I9�ƀ�Ѥ��)2ǟ�6b�� ~v���c���!_�x�oa]K����2ԁˑ�䪂��M����:ž]���C��FC|�ߋk�ڟ�0�\��Ir^-�͊�	�X"ph�^�d��=�Pm�w7�]��=H��3/��O�ok����X砸t�RLʐ�2�+bk�3WǾ;���a���}m��N��V�s�5vT���	c�\���-�A�DM�)��sT�k����&��³7mA�~;�zd�19I`J�8�����L]J�Tf��VC/����E���y�D���S�W��B�m?o�b�lI\�e'Duh���_�6^�ƪ��~������c������n��J�Xi��G��F.�8z1��>Ord,"&[�������}�oo��_%_���}ձ�j��� X����a��f8+����j�(�sx�窍Y��È�� -��X��t�C�g���j�f�k7UE��#(:[��w���I�\3�sS���Q��<��������I�ǹ�vcܑ�i�w�����w|_��X��yN�(*+?�>�p�Sf���>�����?��$�#��̽}3�7:�^�Ѹ��O���9��TT �M��.�����Qop��~��&��.>���~?AN�/e�(s��}Z=dgk�X�#�l��ǈ.��+���[X������9��Q��`�����8����e�_�k�4�	�H5����8g�k~�����Tt��Ў!y J�,
�1g�\>u���:��Nx��M���%�iyi�&�#e��*v~��}�;�۬����6��      �      x������ � �      �   �   x��̻m�0 �Zڅ�dR���M�&���H�3��x�$�xb3J@�
��RE���?����yr��� j^�3O���{���Ƕ=�\�� �Y���A��Ҝz�хұ���հ�p�3��	[�[4Y�D��m���9�_0�N�      �   �  x��XMS�8=ï�}+�>-)7BB-��b�\�bfĠ�c;� !�~[��Dbp��T�Sw����	"#"O����|��Y��zӚ�H.�Z�]���_�#�����&�~D�#G'��Tѿ:&�r4뗦���Z���S�Q���}4�� !��oF��X�
Iƈ��n��Y�l��;s��Q�C����cV�t�M�?��Sr{}�ܼTzO%'S 2�NM�e�i�p�v1w	W��Io���ԟM19=�n��'7�g;��\0�(���u�\����|�X��3�/�'�1�t�O���}>_9��$!<�/�t�)����Mnڗy��)�4����q9<d�H�+���l�=p��0<��s�,�i�n�v�~��Xʔ�rH>�Y(Dl�)���f	9��1M�SrS��N��p�B�{8���r:�P��X0��Y4f���S�Ju���ϵ����,��fA��#S�5��뺅�A���I7�	�s��)�塁�p"��`*ڹ~Ⱥ�̷:R,���\��O��+�\�]9P*BB�&�{gjP�7�U��-�F�V۬=xh��D2D9Q��g�{��H�d=��<����x��g]�u[�����Li�i�E�7�m�n_D�2����T�Ӯ}LVu�lb���TH EDR�)�^��Y��'�ʰ��/�m��b�mW�a�1S��=t�X�����|�wYa~��4�!�P<��ߦC��3&\�/xI�oH��Q����F�A<l�k�bd�ml�,2�"�IY SA��CϣR��M2م/�GDs�@��04&tCr[��|��:�)�t$O!{E��]Wzc���<^r���l�960aMk��� )�3��(�К��l�<�J���d���cVG�����h������6��TmdAI�	N�\Q���S|�I�`W$c���}V?[2+��8R����h��Y�>�j)�<R;�~p9�l�S��M��ʳ�䘊�cTŁ�.��6�RQ��"�]a~��\2�^A�v�,���<����A3D��A�fg�:�b�Z�� G�"/D�N)��IM�ڎ�ds*��,�8;:��
f��e<���}r�Jʇ^ݞc.W��;��3��1�u�c�ޞF%%�)G�b�Z�ձ�<�L?=눡RP%?_a���Hn��q���k�����{��W�kZH�^[ʹ�� K�d�毵��6�7@BGӥ��rZ¯�j���HС�UC�'�5�l����Ȕ�ÛB`�iv�=�}J�!G�PG�8
m�/ZB[p���F�Qk��;�l��n�'���޻��G��Uw��}�+���R���&��y�#������A�V�	 0g~; ����Oȵ���^:=u�|z�m��*#�5�	x�O�A[2Y��~"�����@ksN��ͽ�����_�b��}^se����� ͅ+�|� 4�H��>�Urߺ�#�*��A6��W�}n6����Wmd� ���}a���֍���)��y�u��A��M������?��4|?8��^��k�+]�Mo��J��D& � "��$�Ƶw�\�b�>�3�>�A�Z�*�E���u�)S��	�<��썀~��S.������I���.ۼ��>���Ѫ�����a��m����;�PP��4(�'x��z2@)�X� �=9>>��}N�      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�-�K��0е}���j��"�#�!gfe|��0PԢxYV�߿�l�C�êM����)��9{=DWw��"g����]ň⃇�;��sV�))����/��G�<��b�I�C�>R�=��x0b51+�&5X��S��NVC2��A��3A�I��d��&!s�}���p���u+-$��6�и2P�>�7�@��{���H      �   �   x�e�A
� E��9����Ƙ]/�ʨ3 �I0��/��By��><�2�q]4	-�)�����y-V��K��W\Jz,y���љ�T��ʶ�|9Q,9���n�=k���.��Ň�p�ϲ��Uj[�7�"����/7hj�*�>�|9      �   �  x��T�n�0>'O�lI����u��v٩-Y�["�eH��0�g٣�IF)n�FDQ4�}��-�,�y�D�T�Qz-�x���\$E��8NX�����	Ԓ���,�qδ0��	YFi��mS*&�ث�hس�l��cc����Fj�H��h�̠�V^\�=iM��~6N��������LI�, +
}��
�VN_�ԡb�@�2�����g3�����-�v��(K����2��U�X���O̼˷��|^Fn^QؗQ�Ҥ�����Uۨ�R�\	��U����⻑���ƴ��uJ�
4܉ߤ沶�K J��P��5�f;��+��2��?�?�����3R!�ԗ�h:�Oǹ����e3'J��#���C/�5�i�f��z���X&�F�:u�xV>n��)�?f�nh2��^�+��0���D}΍�nn�A>^-�˿=^�      �     x����n� �������iח�TB��Z�����B�t�@�>ǖ�F���k�&T�~�jNGk�����#��<�TMB[�2�v��J�P'���N�H�ѼJw@�UR���3�R��{��!b�t�(���H��#8S�q0��1�eh<袯oa�v�e�s�T�J��:r��B{Ëz�%xf7v'����Ȥ��*G��E�wu��^\\�~�r���C���ӝ�����EU���X���y"��3��jZ`�W��6�3�r7�9~�oUU��s      �      x��}�丑�o�)
�X`��*�w���1�{��xn�a�=HPՕ;ys^�{�(`q�d���G��;�'9AIL](e�2�Y�U<�,�"#��� ��ē��6��8��i�v��y�^�6�����n�j>z�Ymի�d�Q�DFj�~/��ѫ�J�x1��dʤ���1���)T>Y@��b���߯G�h᯿���;���Z���U)2�����:3�C-Ȯ=�j�^�h"���m�j�F ���G?TIY+݈��x�q����^,u����ϣ��-��%���Y~�������9��֛�\�T��T��ݿœ5|ऍ7�Ue��$��A�;9MF�$��cC�a)�,�3=����$B+���6��w��L=���R��qI�+�|PY5����`�|8��c��c;n����e|�m?����:��K�N"����<��w���p��'���(�vLɜ�qm�_û���J9]�C�;���N�	,=;TD���Cj��N+�����4�n�z􇬵ݓn���ۛ��u��S9��ݳ��+d��,i�S�'�]� ���#�?��?���M<�_D����~��j��~����������O��?��������$Rof�$�'J^&Z,B�l��A'�;5�K�.�X�5�!5�Q^��xՖ��T���|�F��Q?�cb	�$E�Ҟ/�	���t�Q�7�b5����w��������M:t�m��f�<��$�7��El.x� ۿ�c��zD���-hR�����n�K��b��w3���FI3�%��Y��ZOk��2�u�ǓZKU��_-�K��Nb�I��d<S�փ`sG�V[ܡGd{�~������44��	�]`���(u���9��C�և!Z��h�+�&\6�A���J�>Tr�XL��W���'׼���h��&�����������j�I�c�RWS��������ϟs7sd��e�7)�\Ew��˿�P.��b�уV�Q���vG�v���ɣ�Q���72�L'�>�T�A,�ծ���x��N�L93�)Wk~W\�V.�ZF����.W��D}oW�^�A��P'�&�֓�Rޡ-��ʍ�f^O����6�����9D��8�������3��K
��E��X�b<�^b�%�[����G,��m?���:Wi�T�����r=n��ͣ1��=ז�rp�o^�[_@���/��\	��m�EE0��C�u��	;9x���ٔO-���ȏs��m���C�_�����<��7l��W2�����PM���JS.F�����6$c�w��[+x�D�W����[p�T2raq۫���ZP=ز����gM��(��6�b 8l{��X.�Nq��2�i�ˢf��[Bz�bə���;��|SAi%�^�*�Q�23/%ڸW�-
8�v����
#�TK�l���<#�s����Jb�sw�m��(�sE@��Kܖ�yua �g�P vHC�p[Z���m�_ӹ"�؋Ѹ-?��|j�g�P uk�E5�������͛g��W\���`O׭�V���?��|����~�|��e]�
YF�XUCDO��\x�!�7�OHV�M�8��tFx
�}j���s�Ao��ҷj��F�'DS.D_.^����tFC,Ѵ.V��������]w�L��]����|�����ࠚ&\�a:Pm?N�!F_Jl栰��W �68�&�׳
;�ć"{���R�;ʻ\@�68�M>�#�u�����L�ф�e;���}��w�D�q=j|�ڣ��;BW���Cgy���՚��,�`���R�+��X��r��ٮ��=�І��%�,��$�s5�:��R�\BM�υ�>�P��%�%�,�_Ϲp�ڮ;��%�dA�\���m�͚�<	+K�cɼmߡ��Lع̐,q�|fή����a�#I�K��-��$��S<��.'��,� ~.���!��.3�_ҔoA��x�� ;��%��Y`A�\���#k�!�J6^��X2o�:���"���v�����n1�����I���ѻ���(�	����ͣ�W�b�Vs��%gʽ�=���a̙*m��i�g=�ȁb�=Zj�i=ݰ���AQ[,��C���	/��Ҽ x3�{�E(��4�;�QN�����X��	�$f/�J��T[?�^�rW�@[��w��R�"�Z[L�N���f��l��p`?���샿.�X�x�p�٦���?�Ǐ:��|+��p����'�E'�S	F��R�XR��;��h�x�p������s3S��G]9�����-"1�k�̲svSv�wi��Vœ��Tb�=(��\�/O����t*ϏU� y��{7:K�f2��ܩx�L�oa�_���6�+���PV�A$F$�Q�7���\���λ@9����_�'a3�g�9��F]��z�A�A�,�sU��W�D��.X� ���(��w�m�2��z����_׹*���|��A�kZ6��|8��N������G�P�����"Gؾ#���?���<��f���ϱ��bG؋����7�b�<\���q��1d{2[���i�$'�:�esS퓣��&���%'�9�����ӯW[�̛��֖��a���xTcM�>����h��)��m��A�_�#	�.X!`�_j��x�e��wh��,n6�S��OKCBn�&z��Q��"��{���^3�o�[����x��ċ4:V]�(	�F�Z����������_��N�D�W�:w#��gR`������q������I3������Q�{��n�8~K~�.�)�{�nt�g�H3t��[\C{A��j���\3�3��gXi3������]ʅc=�ʚA��r+��9��}���gXy3�����-�	�U0�#����{�=C'����%v2��?�~Ϡ�͠N����A�l� @N�,�A��B��خs��-!�!t-� ����x 񠫌n�zv� �48B}�z��`�E������� nAK�g\k<Z�AC�� A� �\�0׈�U��B�N�xW���"�%�7��z|@C������=��>j�Y�L �!t�a �@гiP�7���](H����`�Q��0b k�!c�C�x6O�������f=x�h�j��
�Җ���^_�{8�DI����_�g��>��7��Uh�q��i~��9����3�T�ZL�ǞyjIt=�Y�["��[b��e{5�-@�p��:X�O޲�n�[���l=�ў��z��:`�=�!=�W��9���+�����O�w�oX�?g��?��:��<��Uj1�W�ɻ* �-k(����] ���C��<sd?���T��}�Xm�Q�����"�[VZ+�y�FxH�z�����ܤ�7 ����I��{�@@��p��s����k?Zx�"�, �H�C4�QW?�����f�u̳  "-I+�6��5ɦ� ���1̻i�G�
RT�����7lR`��EF�9qs� ڣ5�UY�� �!&�c2 0"CL��d ZD��̕[�>����%�c.D�C��=� Dt8��1f˾��Ue.p�#���o�d� t���M�p�$/��("�<&��,)����+1\@D[�@èzU�#$["=�y� ���#���V�����i'� -�H��;�xp���El ����ުU�@v�Փ��)O�x@����vр��=J��rt�R)#�a~���Yo��z���lT:��/#���W@z��瑚�p�ެTJRa����dXx5Z��m��ؠ�ċ����gͦ�j�&F}}��m��U\M�7UM�QckcK*'Ta��@fKX��	�Ym�e���O��^<��|�W6t������\�x�cM�h�Y��F�	����S�*D�^�!|4��u�쳿�zD�b6L�t�{Y�G��~����z����C��@�ͦi��<�Փ��y>�^4�"q�R�`�?��|�k���;���u��&-C�ɻ}�kUY�&�hY�V��f�	 DbX�x�"{.Z���]�a���Y�@�h[����잌�T    ��C���Zy� @�oGN��`���wS���i�t��.�X��}��2��B*6�j�qod���I%��e���R5XY�S��$���O�3�^�Kf�K�k� �j�2> �Ȑ]�;�,Rg�]_*_`r�f����g�Kwt}\�"?�s��sԝ3L!n����=�>����f�Uu���Z�������Ya�z%��B��Z(yH0�G��T!'�W*�]F�Jl��V��鲑��x�q���b�7�^D�*{d�c�Ml6,�����ѳӢ��R���5i� �7oX~)F�a�5$�1����[�a�Q�m��,76�R���w�����Z0L������Deͯ4�l�j�n�0$���Х���<����=�?'��z3��~�<����������J��Pwr��@�ߎ����6� �=QYK-�EW�&�p3���R^�]���Z>C�������ԛ� �|82 ����΃*�tˉ�#��E`�۞�}���v)�P��~2�f��ntֺMD+N=jk���Pf;�wY�z^Nh��@T�o;m���� ���2TS����ϯ&0������on������f��[�h���w�vo(����_�`������X��.c��8V�v�
M@�	��5����Ág8��$�R���t:GgMя��B�4���4���4/��r�p�����g�v��1s/�� ��Czȵ�� ���C�Az����.��q��Ϧmu  �G܅�t 1V��N7ZXJ���+0�� ��צ~꯬�O��JH�(B��b�R�EnS��B�a�G���TO�:�sC�O�K�>S�����jA�p��K��,�T��{����ƘtMr������#��A��"c���4�����iTj�*/;*ޔ�6�r��ӯ���Ki7o���x�E���m:9N`�z2�iu�"�я�/�]Wna�v'�������,����G����|�[��e6��j3N{1P1����{�z�g�a�-������^���d1�+���P�����~��O�Վ��"�N𻪋:V�h5Yn��lژ���m����߿��:���tg_�$���8Ԟ�T���)���i�]��x#�j��+�
�r�c�3���j���y�Z��J�?���&Jn�+UQҌQP��z��3�����$?���Ԍ�M�V����FV�nl����z+�cO6S��|��L�Nh��C����T��ւ�o�&��@���]�q}}|��g���N�`_N��}��md]�m}���j���J����HD�<�J��D(����w����ר?1�h�������r�*�O\ʔ����n����(��)y�K�Rs�[J˔�P��/��%�����ԥ!"nq�Ƙ)�3���$d��]dQ��5>����C���.eu�����E���|$�+��4Vԕ�C�=2�H�%I�&t��Dx'�����p"��hN2�:�-�e��s&*} ��# �=��v�p��B5AX?�e����̪i�ف�䦔������h,�a ��h<P+�����p8!������d^�H�L�{ Q٢2j8سs��1N):Ta���v2@�«;#�o�������;�QN&�0Y�v���{�N�X�ZY�}m�h���FONFk��b�ވCX�����u������)�tn�q�͹5$מ�<��}7�H�!H���(=�,���i��y�H��'@���u�=+p��{��0��C���Ѝ����-����:�C��� I�
Ⱥh�l� b���D|�ߩ�I�Ol��	��^�uj��U�)�n��"�=��{A��Ⓗ�]�u��d ����zƈ���m{�ZO����n1�Tf(n�'ힿ+��<+�d������UΣ)�~�,5���̟���VP��s����7�oO�y9���V��P����$WA�E(���S"+=*�?(P7h��5��#�Ԝ/C����Z�x`I�rv�=�b����(F^=�N�D�F��إ���ϡč����K"�}��.5�˙ZM"9�-�qҼ����e=3.֔{���e���e�$���c�Ke�A�!3/R\����X���^�maif�_J�g"�������D�+���WA����e��s����x�ު�R��IKK��V~�$u��g}��Lc�1��#�(]0V�D��=�r$qD�%qpK��T���Y�//%��I1r% Dj�n�D^$}�c~)�@�XŠ�A'��b�O�r��F�Mۘ7���|�F��3��j�u��B�!��	®TA�r�TDi"|����7����P�]J���b��@���� ��a7
` �4�]��$'P��n������|���F���T{&��u$,��zD��s#�H@�d��	wab�0X��qҘ��n!W��޷��^l��#[�m�_����c�.�9ٲ��=x���-:E��ZlW7o�J}�&�(�Fi�K���DY����:1�V�p�H���@����By��R���v���m�Kҗ�pߤ��߆-�M�0���
�R�S�`LpY���Q\��N)l3{5%W��k+<��O��!�>>1�lA� FKg1�B��U���,��+.82�*�,=5�Xv���֙yv9��J��'���oc,�9P�J_���+�\�,����Q|#]���I��قߋ-��� ��nH����`�+%G(@�DJ���[��i������I�,�������+���C�-(0e`����@*Bb�CX��ݦ�//'�3cd�A���IC"C7�#��ʈ�,)�*��S��s��r�{.����?ÖƐ�#D��P0h�I��#��b����n�ܛZ�w��o��RG˶&���d�&��B�Gn�$�,�Qz���2��i7���5�b�l������G
�����q��W�<D��Ę����v��[-m�,}9��� #c�h۬�QQ0�1�s	�v���	|0ς�Tf��r�Gk�����3�d���|� A��s
����R��B�H�/:����ze����~w9��NJ.W�)&vZ72yL���TZ�-eG)i�&)t���z�f������t�Q�7zǬܬ_߼��_ݼ�ݯ���[�n��x�
�)9C`5�&�uz���Kf;�H��/�.��,)�#Q��x��	M� �J�W7}�����\kN��P���i���Y���H���f�2$�qi����h=���;FpF-��!v��(.���W���j��i}���sƩ���8#�����~�M{���U�� ��Y=%�5�g�	�$���3��������Hh�I�����x"����~��j��~����������O��?������i�!�{��'�*&�P�Ѱi����'
�>� 2xuԶ�Eq�U�+��^�f�3�3���ì f�m��������U>�B?$����ٞ��> �r�c��?z�G�>���z���5 ���|�y��B�j�ǘ���t+��D=h��-���3O�3��YM�-j���-R�`*WY�}�{��}%MK��P��Dk�O6��弑�WE�~=�n=���D�0���(�OX��[�����G4��w��Fe�>� p2��]*<�9c��,�(e� �@PeW,(����q�?x�5��r��ѫ�Vʇ�_|U����kϿ%��G.�� ["�(��1���� ��0!?�<!?;;r�РԻ4r��y�`|>䐸ž�#�gx��~
���`^i�O'<7t�5C��F���8�C�>W<q�;r�"��Vs=FpX&`#������Y����mu�*�B{��b>W��~�-�W���g�uW�a\fS"��}[���U�����_��	0��}D�(n�^}��9����ܒ�b~I<� S4f����ǘs��#܁����Bf/��������m��/�g��3{��/�g����tn3�@~.� 	 �7�2��9��(�Z�'�c�6T�K��U"���Y<|U9o�v��9�4l�{��YW    �_�q��.#�V.�Z	B�X$�I»F�>���qԞԒ{��L���W�.@���en��:��b�\�|{���up-��y�ũ��d��=��~�Se�VlXg���-:\&{��ɶ�Y �7o�pt�z���d�7B�չ��
�[n"�Yq͖J��k�|�0��Y�n5o��tH,�����u���[|��:�k�Z[���0�A_�u��8���g �8�����V=c�ĻPKbf?U.p��;�G7�V�����~�4�[r�zgz�{�K-.�0�^����-~�0�����d�u`a�⑞2���2��aq7I�D�N��¢ũ��3������b��d �ua������^�
�,���W��`�c;����ᚂ�aN>w>�{�/@f rK|gX�;ò��u���~K(kX����[��������Z/xK�o	u��2�Ѓ!u��'c�����K�ҏab������0w?[��5�����v��C��Q�!�}�A��-��侢 7�<@����lS�Q��.7^�e�������b��C�9���urb�s����t��'��v�_��R��9�H��h�ֲ��mFa�o;�8��P}r�n�č��%��ŕ��;�����V7�-+��c�㕛ݲr��[G�g���
����@�p�"�C^��!�-�M���C񻎆�lS[��h��W������l��K���*������ �Wz#B��?���W�0���aX�~�C������!��ixϏ��#�L������p=����v��x�0�iܶ������} �%GaX�x�u�s��쁣���/v��q�w�ΰ�u��[�2�O_h�x[8��<����A��!����G�����ʋ���=F�7{��\y�1����+Ó��������ڙ&qv^��V_$��1���p��2��N�[�/�T\SC.��˩��Sj�?��",��TH�I(ܘ*/�x�D��k�{��2\S�P���2�?g ��LV�법JJ*���$r)J�2J]�B?��A�N`��b*[X=���i�DY�!�X]�	��g@����#W�܄��aO�$`'��+	#o�~wi�J��'�^�w#��rn�_��sN��7�Aq\�k����`% a��E3��=�L��6�{��$�y@�o�&E3Z�D�n#�������h�4V�V�L�V*�p�S�!f2�p��{V�W-q�ޓ,�\�w�]fE��c��>�In�w���\��V�Q�9#o�����JL��v�C�T����$/җI�
�)i�0�c�Zj,YZ�d-"J������o��z����6mvX*�7�nf���[O����/缴�O��I�� ��cy�Sj]ZM�#�|קB�T���0�.���qFxをw�����Jߟ�V��U�L�f�?,fr�(��̘�
�&�~q�rHEHĉ_&���a`�QV�3��O��ۼ� A�P�&
I���B7`^����2]�}n����Y����d�����#/ݘk�	X<~H�هB?Y`!��i|��sV0�$$(XaE���T�&%谈�[n(}��'�+�\�D����2�G~o�za������CIy<BD�	�n@CO��Q�D��B���a��Y�a�`A�Ͷ��b1+�G
��v��v��]��Kb��e�ޣk0� ��eU�����H� �q7	��x��	h�I�xR�G�WU���a`�QR�*Nm�ż�T��4$:��n�h\Q}�U"��䉨�vt�<��)��-Z��1��|�:B�=�5���_]����-¾��eqa�w�y�y)��ϟ�R|��=r(���j_�uҦ��B9��<�{�>}#g��I!e�P����]	��pH&\Ŕ	����|lh�)���lT2<�J��,�&8H8�XnHp�`�u}�BT!�H�*6Ʊ���g��5ayL��F�$�QN&堀�|ë�3&�R��	R���Q1F�6�����"Y�c�G�Z*6�.�KwZ�߿�T�v-��{��dd��XMU������oL9*r�W��R#���Ŵ�́�F}�9ܥڭ9Zj��E�9҉l�#{^�A�-���r���mqu��~>@\�x�c���R�n]���vy���b��x��V� ����*�(��Ȑ(7 K��H�$ � ��ˌo��A�z�2��?Ö�Ъ"�n��^L+J��Xͱ.��nͱrs0�03Ѥ#p+�g`/��8��H�ѫM��r�2�����#�2`Gk�U�e�\�-�]F��۠�5�8	GFk�>��j;Wm̥��'�8���#컁��+�M�c<��2��]��u�po4LHf��~U�h�a���V�T��d�	t��wk���'�{�=�u�HtkO�ۃY��Y �[U�[�z�V��:f�D^$}�c��y0�b0�Dq�|/��T5;�K<Izs%�0�s{�G5��u���bߴ=0�u��BA�R���ܥ��� ��D�I��%�C�����Y�)1�N�n�I�3��"�g��3������v	��D`�b?d.� 0��%{��̑Sd�G�������ݥ��3!F�0�s3��.Ҟ�̬ԟ���e����M�ɒlBnۄ������bZK�����1+ҩ"+����i�x"v��؇���.��e�$��:�G���}c����;&ە۶+��D���^L���=0^E��ʺTD��G��w(���R�e,�۵V�h��D'AuhE�`�;H��.5�n�r{`�˶�1�+�!7�q)±+\�",ƨ`�)&�bsS�m5�j����J�~T�n^��z��G��`����5��e����]`���p��v��0�6P-N�wjۋi�I�H�6�:UԵ�r�&��E����Ӑ���.�ߥؓnH����FqH�p��=����w�*�x͝qi
��������k�I�7�P�:p�Y��.��'y~�`�z�m�	�bBA�!���֠�=��|�z¸KEV,��خ=���!�f��ch;%���Fa�"XO�����A��7��n���B����-�د>+��n�!�x��w��w��?����"K,����^a�
�4@�e� �h�j�Q�:�v/�5$m���vy���"v#��K��w��؞`ı�Y�O0���]k8z������;)9�0�H2�dl�U"�]���] ���7=\]�!�u�ҭl�=���/�[����݌;�oO�]�`Pȉ`B�c�t��5�o�|��w�䞞�V�"5ߤ�����L �!�.���7�}�廖
���4m�	�J[i��<3*~͂[NйfT��÷~6cwī����%߯���R�h���7���5�X��!ؘ5��夀
:Y�;f��2�͞��\�':d��Yձ�|S���ꗇ�Qׂ�kAzp�}\��V
�䱙h�Z����Ŵ2�́=0�9ܥԭ9Tn���[͑.��n��rs���j�v��vk������2s���4T�v�C7���w�=��|��
�r����apP�W��,W;¾��j�=��	�X�1�t-�;�����©؞5ư����imŴR��ahY��.��n͑rs��Vs�K=�[s����՜ߥ�ܦ�V�4�,�������̄�`��,�����p�,��FL����Y5��ܶ����43׵�V��9���N59X�߭=�ܞ�����Ǧ���b��hϷ۳�Ǧ��Ƕb�=p�)�8��pw�������{y��|�+���<�t,�W&U�m��Y�ƫ�RG�F�Q��o��He'm�'�m�;�q�>�����ҝ#�&����/z��"��J���Y�69���Ju�Q�د�Z(����]-�}�g�زxX*�{�l�U�V�Qz�QŮK���B���F�\�Q��@��`���I�pZ�Nb�3;�9M�z�^����jמ9t��"{� 	:I%<XqW�׼�ao�vQ]���X����������d�ތ���?���_���t�M�[w� �  q���&O�:���/��4��n����\n�V��V@�o�@��6����A�e<��;��'�I�
Ⱥh�\ˡCh�zk�9m��O[lV|�{�ys}��^�ujG�WAgqt]$��b��5����������.�ڱ�U �KC��oH=:�+k�]d��u�׺��z~U6cM��
n?��us&�)�	��Gj.éz�G�r�dߥ�n�Gx9�����H���^��� ���b#���GqϮuj����� �b����y�����������)������@nL2~�$��O�p�c����W�R]v;�"�����`�a�����֢e�Z�'��g�#����v�����G=O]��W��w�7"JQ;�ŅATt����wA|UP5Kp�I#l`��P�X����h�cj�?:b�*�	o�D#X��#M��:���7�WU��n5�Nq)\�V�M�e7W]�ͷZ�'��k���M��=�(��o�O�z�K�z������ �CE�U^L\���cJ�X�8��Hz�>�{���h�,VJKJ_�7��e�c�2
r����N�c��6���,����G��x��w��o��[��@���߰�~�R���h�g�h��W�Dn���ٲ���Z��rW~��O�Վ��"�N𻪋:V�h5Yn��MS9�͏ә�����0����x�5k]�\"?�/�5���Rɕ�Щ���N����N��8{Z��ͷ��d&ӎR�t��$V��D����f]��X�~4�O�՘��ԗS��Ū����p���i�v�*:���#u�w�| hx7:&�Oc p25ݺ��j1U{��*�]͙���z+�c�H�Ժ���i��}��b��C�=�J�	:}ϝވ����{��C�R��U�����K½�aP8Ϡ�_�f�����~���P��      �   ]   x��K
�  е����(���@'b��"����-�&-����޸"�*�A��H7U��l���S���2w��Jy�NϤVY8yX9��F�      �   �  x���˲�8 ��)\v���$\�
�"���*��� WEx��g�f����.�TR_��c��>�S>�rJݖ�a5���� 3+��]�����GӋ�ܬ�RP�m'V��,���وB,R���CS$A&�G`8
�1�'�� 0�G��#��,�>	����5,�f�Y�4�1~N��������iYf�>��$��;��,-u��8K/�X��K�}<O�"�>!��06�ث���~j��m����w������q�k��u=���,Qr�_ɅIc�g��yӭ�����z[	���C��AZ��K,d ��7fivk5��q:8�>Pl��ܜ���˩�\�&�9�:��p���>srKT�Ҧu�
�"�i��ߗe}�K�S�&�	*�j�����5%J<7�W6��)�6���ܥ�p���z�Ap�}Y|Et8�{��:�jL.�e��D١�`�����Z��ZU����$ط��E�И#�˲��s�Y�v�^�ϗ;ߞ.�E��ĶԽ7�9�i���A�U^;6����n7����;�{Wn�Yu��(�b���yt�j�R���l�GW���9k��Ae�K�Z�tJ7L�	��,=+�{_�k��G�M�ݸ;�.\�6��V�8�ƣ|�;�QܝΝ�pU,n��49�n��a�x� ��,Q�MH9�����zD�����$��u�({�Q*�����,��#�N�~mxCP�/����8,���QC5g�4���L�/b^���e0y�l�z��EN��.���N�DJ�'���b��	d~U/�k��[@]7kk�ܝ��)�53�u�-�%43e���jp��m�G�m���S��P_� ����y'7%TS���u�ѐ\�����Y�鍔H�o�zL��$�WzC�/N �@Ls荳�]3k���_���f�������	���      �   �   x�]M�
�0����t5r��*n>p�Eܺ�7�5S��$����p8/8�|G��+�,;�w`���UQI��!@Y9��[��p����ˁm�h
��z����[/g'���u�Qӵ}tb#2cU���O�-"�4�� ̵x���,�������<�      �      x������ � �      �      x������ � �      �   �   x�m�Mk�0 ��s�+v�MS�m"&�;��6�֪M��t���`�!��d�XxH�t�-����1�5���vC�6�+8�!���t��8�R_�1�ޕ�ƪj�9�T���fe:�6�{�xs�m�ܺ�^N�R�L�e���ѧ���>�,�Tr����^��s��؁����M}�@S$�Hh��j!�RB�d���"f�1�w'�p�$�	��+N*��!��cH>�E<�����[};�?)���}U��lZ\      �      x������ � �      �      x������ � �      �   �   x����NA뽧H�|��?{�� J��iַ�*"Q��EBI���S�|K�L6�m� �k��hcʫ��Y��0�I��sV~B�"�Nk����R�I�P����/.+����g�ޔ-�=�\��^.��q>�KZ���-Pe���G@/�Qĺv��?
ꜫ�^��wK�Ƌ��zeAcJ��F՛]�3͂���1����xLL,���o�n�F����բZ����4M��Ny�      �      x������ � �      �      x������ � �      �   �  x����n�@Ek�+�H9}��&A� ��p^�l�b�Ŀ�ٴQ���wh��Ցo�|� �����#.ybd���@�R\%.��qz�v���g��6=٧m�d�14��S� ����Q+"=D�3�3����a/��MLZ��>���]�DC��qO�i�iv����{�^���M]C���A-	$�I����Ռ�d�C�a�.�{��_o��6Uo���j��$�	��P}�0�!�[U�ݭ����nۇM=���"xnDq�ϭR��"V������qo�'{���5h�z�R�֭�]�Ns8D���s�G��N�mJ�yxĬ �b5�����h���iEY�׽�/W�޶b��A$Hq����CW��eNG:p8�~�+wq	���������^.V�(YBu$��h0�;(,��dHH3�W�%��|�q=I4s
s�-�
��Z-j��y���'�L�      �   g   x�%���0ߨ��6���:N$-Z��F#B��fvlSE*e�8�Ƶ����p@Z�1�k�VSSX`	:=#e�`۝�>i=5�F���cs��z������&      �      x������ � �      �   �   x��̱
�0 �9�
w�p�˥5���N]�6-�@�Q��W��7?R�]a���3��'p2�If����dǤ,Z�`݉(�x1^��/~�5�VFm���:��[�Ϻ���4]��ވ�����򩥕���`��_X>      �   >   x�˻ 1�X[��H��z���0Ƀ �EZQ6i۬H�m�c7�j�E�A�q�������>	�      �   �   x���=j�@��z������	ܬ"�$vr���:
L���Mɕ�5�9Z&����2�,_�GJQ�Dܼ6%�U?���9n����o��ĩ������挵�x��^YSEJ����m�'�؃�B�FU���R���e^��TC��U\P,WQA�>��߯�{�3�~3�w�      �   (  x��Ի��@�����r����4�I�m�y�
��l�?�[�ؕ 7�!��^i��c��Sh�C��=X�ґYԓ+�q�0��/D;�;��P�"�?b������68!2F�!�q!��#��cn!YW�B	ǋC�n�7�>��[�a�����}>���f'M��a<O��v!k�����[�ߎ[�$a�	��i>��=�R!��H��27�,h�+�Th��ZOڡL����ϧ����Ag���jx���>:����9'3���z��a+�I��_H�����Ag.�&�b�FF�� H)����QXr~����a�� !�|��c��P!���K&��j�3����i������|>ދBt�� Gc��o	�Q�^].	��$��N��].�z>=h-Ge�:&;ZS�	�p֮�%���bJ�M&��nZs�Xe�cu��R�(�4C�m|�C�Z�zG�R\	�pµ��w�&�n���>(�:ѨZ�Y���
:v��c�=��q	�h=�є��y���:�'�1�a�=��2��X�)��(�h
_Z[HO�v��R���     