PGDMP      :                }           pizza-store    17.4    17.5 /   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    43985    pizza-store    DATABASE     s   CREATE DATABASE "pizza-store" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE "pizza-store";
                     doadmin    false            �            1259    43986    cartItem    TABLE     �  CREATE TABLE public."cartItem" (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    pizza integer,
    "pizzaSize" integer,
    uid character varying(255) DEFAULT NULL::character varying NOT NULL,
    drink integer,
    "productType" character varying(255),
    quantity integer DEFAULT 1,
    "totalPrice" numeric(10,5)
);
    DROP TABLE public."cartItem";
       public         heap r       postgres    false            �            1259    43993    cartItem_id_seq    SEQUENCE     �   CREATE SEQUENCE public."cartItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."cartItem_id_seq";
       public               postgres    false    217            �           0    0    cartItem_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."cartItem_id_seq" OWNED BY public."cartItem".id;
          public               postgres    false    218            �            1259    43994    cartItem_pizzas    TABLE     u   CREATE TABLE public."cartItem_pizzas" (
    id integer NOT NULL,
    "cartItem_id" integer,
    pizzas_id integer
);
 %   DROP TABLE public."cartItem_pizzas";
       public         heap r       postgres    false            �            1259    43997    cartItem_pizzas_id_seq    SEQUENCE     �   CREATE SEQUENCE public."cartItem_pizzas_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."cartItem_pizzas_id_seq";
       public               postgres    false    219            �           0    0    cartItem_pizzas_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."cartItem_pizzas_id_seq" OWNED BY public."cartItem_pizzas".id;
          public               postgres    false    220                       1259    44735    cartItem_toppings    TABLE     y   CREATE TABLE public."cartItem_toppings" (
    id integer NOT NULL,
    "cartItem_id" integer,
    toppings_id integer
);
 '   DROP TABLE public."cartItem_toppings";
       public         heap r       postgres    false                       1259    44734    cartItem_toppings_id_seq    SEQUENCE     �   CREATE SEQUENCE public."cartItem_toppings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."cartItem_toppings_id_seq";
       public               postgres    false    278            �           0    0    cartItem_toppings_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."cartItem_toppings_id_seq" OWNED BY public."cartItem_toppings".id;
          public               postgres    false    277            �            1259    43998    coupons    TABLE     m  CREATE TABLE public.coupons (
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
       public         heap r       postgres    false            �            1259    44003    coupons_id_seq    SEQUENCE     �   CREATE SEQUENCE public.coupons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.coupons_id_seq;
       public               postgres    false    221            �           0    0    coupons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;
          public               postgres    false    222            �            1259    44004    directus_access    TABLE     �   CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);
 #   DROP TABLE public.directus_access;
       public         heap r       postgres    false            �            1259    44007    directus_activity    TABLE     {  CREATE TABLE public.directus_activity (
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
       public         heap r       postgres    false            �            1259    44013    directus_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_activity_id_seq;
       public               postgres    false    224            �           0    0    directus_activity_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;
          public               postgres    false    225            �            1259    44014    directus_collections    TABLE     o  CREATE TABLE public.directus_collections (
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
       public         heap r       postgres    false            �            1259    44025    directus_comments    TABLE     l  CREATE TABLE public.directus_comments (
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
       public         heap r       postgres    false            �            1259    44032    directus_dashboards    TABLE     I  CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);
 '   DROP TABLE public.directus_dashboards;
       public         heap r       postgres    false            �            1259    44039    directus_extensions    TABLE     �   CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);
 '   DROP TABLE public.directus_extensions;
       public         heap r       postgres    false            �            1259    44045    directus_fields    TABLE     �  CREATE TABLE public.directus_fields (
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
       public         heap r       postgres    false            �            1259    44054    directus_fields_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.directus_fields_id_seq;
       public               postgres    false    230            �           0    0    directus_fields_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;
          public               postgres    false    231            �            1259    44055    directus_files    TABLE     [  CREATE TABLE public.directus_files (
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
       public         heap r       postgres    false            �            1259    44062    directus_flows    TABLE       CREATE TABLE public.directus_flows (
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
       public         heap r       postgres    false            �            1259    44070    directus_folders    TABLE     z   CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);
 $   DROP TABLE public.directus_folders;
       public         heap r       postgres    false            �            1259    44073    directus_migrations    TABLE     �   CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.directus_migrations;
       public         heap r       postgres    false            �            1259    44079    directus_notifications    TABLE     �  CREATE TABLE public.directus_notifications (
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
       public         heap r       postgres    false            �            1259    44086    directus_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.directus_notifications_id_seq;
       public               postgres    false    236            �           0    0    directus_notifications_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;
          public               postgres    false    237            �            1259    44087    directus_operations    TABLE     �  CREATE TABLE public.directus_operations (
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
       public         heap r       postgres    false            �            1259    44093    directus_panels    TABLE     /  CREATE TABLE public.directus_panels (
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
       public         heap r       postgres    false            �            1259    44101    directus_permissions    TABLE       CREATE TABLE public.directus_permissions (
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
       public         heap r       postgres    false            �            1259    44106    directus_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.directus_permissions_id_seq;
       public               postgres    false    240            �           0    0    directus_permissions_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;
          public               postgres    false    241            �            1259    44107    directus_policies    TABLE     p  CREATE TABLE public.directus_policies (
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
       public         heap r       postgres    false            �            1259    44116    directus_presets    TABLE     �  CREATE TABLE public.directus_presets (
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
       public         heap r       postgres    false            �            1259    44123    directus_presets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.directus_presets_id_seq;
       public               postgres    false    243            �           0    0    directus_presets_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;
          public               postgres    false    244            �            1259    44124    directus_relations    TABLE     �  CREATE TABLE public.directus_relations (
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
       public         heap r       postgres    false            �            1259    44130    directus_relations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_relations_id_seq;
       public               postgres    false    245            �           0    0    directus_relations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;
          public               postgres    false    246            �            1259    44131    directus_revisions    TABLE       CREATE TABLE public.directus_revisions (
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
       public         heap r       postgres    false            �            1259    44136    directus_revisions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_revisions_id_seq;
       public               postgres    false    247            �           0    0    directus_revisions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;
          public               postgres    false    248            �            1259    44137    directus_roles    TABLE     �   CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);
 "   DROP TABLE public.directus_roles;
       public         heap r       postgres    false            �            1259    44143    directus_sessions    TABLE     !  CREATE TABLE public.directus_sessions (
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
       public         heap r       postgres    false            �            1259    44148    directus_settings    TABLE     �  CREATE TABLE public.directus_settings (
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
       public         heap r       postgres    false            �            1259    44161    directus_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_settings_id_seq;
       public               postgres    false    251            �           0    0    directus_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;
          public               postgres    false    252            �            1259    44162    directus_shares    TABLE     �  CREATE TABLE public.directus_shares (
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
       public         heap r       postgres    false            �            1259    44169    directus_translations    TABLE     �   CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);
 )   DROP TABLE public.directus_translations;
       public         heap r       postgres    false            �            1259    44174    directus_users    TABLE       CREATE TABLE public.directus_users (
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
       public         heap r       postgres    false                        1259    44183    directus_versions    TABLE     �  CREATE TABLE public.directus_versions (
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
       public         heap r       postgres    false                       1259    44190    directus_webhooks    TABLE     $  CREATE TABLE public.directus_webhooks (
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
       public         heap r       postgres    false                       1259    44199    directus_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_webhooks_id_seq;
       public               postgres    false    257            �           0    0    directus_webhooks_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;
          public               postgres    false    258                       1259    44200    drinks    TABLE       CREATE TABLE public.drinks (
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
       public         heap r       postgres    false                       1259    44203    drinks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.drinks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.drinks_id_seq;
       public               postgres    false    259            �           0    0    drinks_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.drinks_id_seq OWNED BY public.drinks.id;
          public               postgres    false    260                       1259    44204    orders    TABLE       CREATE TABLE public.orders (
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
    "orderStatus" character varying(255) DEFAULT 'new'::character varying,
    "subTotal" numeric(10,5),
    "taxTotal" numeric(10,5)
);
    DROP TABLE public.orders;
       public         heap r       postgres    false                       1259    44752    orders_cartItem    TABLE     u   CREATE TABLE public."orders_cartItem" (
    id integer NOT NULL,
    orders_id integer,
    "cartItem_id" integer
);
 %   DROP TABLE public."orders_cartItem";
       public         heap r       postgres    false                       1259    44751    orders_cartItem_id_seq    SEQUENCE     �   CREATE SEQUENCE public."orders_cartItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."orders_cartItem_id_seq";
       public               postgres    false    280            �           0    0    orders_cartItem_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."orders_cartItem_id_seq" OWNED BY public."orders_cartItem".id;
          public               postgres    false    279                       1259    44210    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public               postgres    false    261            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public               postgres    false    262                       1259    44211    pizzas    TABLE     <  CREATE TABLE public.pizzas (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255),
    image uuid,
    "pizzaType" character varying(255) DEFAULT 'generated'::character varying
);
    DROP TABLE public.pizzas;
       public         heap r       postgres    false                       1259    44217    pizzas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pizzas_id_seq;
       public               postgres    false    263            �           0    0    pizzas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.pizzas_id_seq OWNED BY public.pizzas.id;
          public               postgres    false    264            	           1259    44218    pizzas_toppings    TABLE     q   CREATE TABLE public.pizzas_toppings (
    id integer NOT NULL,
    pizzas_id integer,
    toppings_id integer
);
 #   DROP TABLE public.pizzas_toppings;
       public         heap r       postgres    false            
           1259    44221    pizzas_toppings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pizzas_toppings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pizzas_toppings_id_seq;
       public               postgres    false    265            �           0    0    pizzas_toppings_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pizzas_toppings_id_seq OWNED BY public.pizzas_toppings.id;
          public               postgres    false    266                       1259    44222    settings    TABLE     �   CREATE TABLE public.settings (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    "taxRateHigh" numeric(10,5) DEFAULT '21'::numeric
);
    DROP TABLE public.settings;
       public         heap r       postgres    false                       1259    44226    settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.settings_id_seq;
       public               postgres    false    267                        0    0    settings_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;
          public               postgres    false    268                       1259    44227    showcase    TABLE     �   CREATE TABLE public.showcase (
    id integer NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255)
);
    DROP TABLE public.showcase;
       public         heap r       postgres    false                       1259    44230    showcase_id_seq    SEQUENCE     �   CREATE SEQUENCE public.showcase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.showcase_id_seq;
       public               postgres    false    269                       0    0    showcase_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.showcase_id_seq OWNED BY public.showcase.id;
          public               postgres    false    270                       1259    44231    showcase_pizzas    TABLE     q   CREATE TABLE public.showcase_pizzas (
    id integer NOT NULL,
    showcase_id integer,
    pizzas_id integer
);
 #   DROP TABLE public.showcase_pizzas;
       public         heap r       postgres    false                       1259    44234    showcase_pizzas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.showcase_pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.showcase_pizzas_id_seq;
       public               postgres    false    271                       0    0    showcase_pizzas_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.showcase_pizzas_id_seq OWNED BY public.showcase_pizzas.id;
          public               postgres    false    272                       1259    44235    sizes    TABLE     [  CREATE TABLE public.sizes (
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
       public         heap r       postgres    false                       1259    44241    sizes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sizes_id_seq;
       public               postgres    false    273                       0    0    sizes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sizes_id_seq OWNED BY public.sizes.id;
          public               postgres    false    274                       1259    44242    toppings    TABLE     �  CREATE TABLE public.toppings (
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
       public         heap r       postgres    false                       1259    44251    toppings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.toppings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.toppings_id_seq;
       public               postgres    false    275                       0    0    toppings_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.toppings_id_seq OWNED BY public.toppings.id;
          public               postgres    false    276                       2604    44252    cartItem id    DEFAULT     n   ALTER TABLE ONLY public."cartItem" ALTER COLUMN id SET DEFAULT nextval('public."cartItem_id_seq"'::regclass);
 <   ALTER TABLE public."cartItem" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217                       2604    44253    cartItem_pizzas id    DEFAULT     |   ALTER TABLE ONLY public."cartItem_pizzas" ALTER COLUMN id SET DEFAULT nextval('public."cartItem_pizzas_id_seq"'::regclass);
 C   ALTER TABLE public."cartItem_pizzas" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219            h           2604    44738    cartItem_toppings id    DEFAULT     �   ALTER TABLE ONLY public."cartItem_toppings" ALTER COLUMN id SET DEFAULT nextval('public."cartItem_toppings_id_seq"'::regclass);
 E   ALTER TABLE public."cartItem_toppings" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    278    277    278                       2604    44254 
   coupons id    DEFAULT     h   ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);
 9   ALTER TABLE public.coupons ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221                       2604    44255    directus_activity id    DEFAULT     |   ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);
 C   ALTER TABLE public.directus_activity ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    224            !           2604    44256    directus_fields id    DEFAULT     x   ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);
 A   ALTER TABLE public.directus_fields ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    231    230            ,           2604    44257    directus_notifications id    DEFAULT     �   ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);
 H   ALTER TABLE public.directus_notifications ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    236            3           2604    44258    directus_permissions id    DEFAULT     �   ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);
 F   ALTER TABLE public.directus_permissions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    241    240            8           2604    44259    directus_presets id    DEFAULT     z   ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);
 B   ALTER TABLE public.directus_presets ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    244    243            ;           2604    44260    directus_relations id    DEFAULT     ~   ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);
 D   ALTER TABLE public.directus_relations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    246    245            =           2604    44261    directus_revisions id    DEFAULT     ~   ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);
 D   ALTER TABLE public.directus_revisions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    248    247            ?           2604    44262    directus_settings id    DEFAULT     |   ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);
 C   ALTER TABLE public.directus_settings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    252    251            P           2604    44263    directus_webhooks id    DEFAULT     |   ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);
 C   ALTER TABLE public.directus_webhooks ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    258    257            U           2604    44264 	   drinks id    DEFAULT     f   ALTER TABLE ONLY public.drinks ALTER COLUMN id SET DEFAULT nextval('public.drinks_id_seq'::regclass);
 8   ALTER TABLE public.drinks ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    260    259            V           2604    44265 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    262    261            i           2604    44755    orders_cartItem id    DEFAULT     |   ALTER TABLE ONLY public."orders_cartItem" ALTER COLUMN id SET DEFAULT nextval('public."orders_cartItem_id_seq"'::regclass);
 C   ALTER TABLE public."orders_cartItem" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    279    280    280            Z           2604    44266 	   pizzas id    DEFAULT     f   ALTER TABLE ONLY public.pizzas ALTER COLUMN id SET DEFAULT nextval('public.pizzas_id_seq'::regclass);
 8   ALTER TABLE public.pizzas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    264    263            \           2604    44267    pizzas_toppings id    DEFAULT     x   ALTER TABLE ONLY public.pizzas_toppings ALTER COLUMN id SET DEFAULT nextval('public.pizzas_toppings_id_seq'::regclass);
 A   ALTER TABLE public.pizzas_toppings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    266    265            ]           2604    44268    settings id    DEFAULT     j   ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);
 :   ALTER TABLE public.settings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    268    267            _           2604    44269    showcase id    DEFAULT     j   ALTER TABLE ONLY public.showcase ALTER COLUMN id SET DEFAULT nextval('public.showcase_id_seq'::regclass);
 :   ALTER TABLE public.showcase ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    270    269            `           2604    44270    showcase_pizzas id    DEFAULT     x   ALTER TABLE ONLY public.showcase_pizzas ALTER COLUMN id SET DEFAULT nextval('public.showcase_pizzas_id_seq'::regclass);
 A   ALTER TABLE public.showcase_pizzas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    272    271            a           2604    44271    sizes id    DEFAULT     d   ALTER TABLE ONLY public.sizes ALTER COLUMN id SET DEFAULT nextval('public.sizes_id_seq'::regclass);
 7   ALTER TABLE public.sizes ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    274    273            c           2604    44272    toppings id    DEFAULT     j   ALTER TABLE ONLY public.toppings ALTER COLUMN id SET DEFAULT nextval('public.toppings_id_seq'::regclass);
 :   ALTER TABLE public.toppings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    276    275            �          0    43986    cartItem 
   TABLE DATA           �   COPY public."cartItem" (id, user_created, date_created, user_updated, date_updated, pizza, "pizzaSize", uid, drink, "productType", quantity, "totalPrice") FROM stdin;
    public               postgres    false    217   y�      �          0    43994    cartItem_pizzas 
   TABLE DATA           I   COPY public."cartItem_pizzas" (id, "cartItem_id", pizzas_id) FROM stdin;
    public               postgres    false    219   ~�      �          0    44735    cartItem_toppings 
   TABLE DATA           M   COPY public."cartItem_toppings" (id, "cartItem_id", toppings_id) FROM stdin;
    public               postgres    false    278   ��      �          0    43998    coupons 
   TABLE DATA           �   COPY public.coupons (id, user_created, date_created, user_updated, date_updated, code, "discountPercentage", "amountOfUses", "consumeCount", "order") FROM stdin;
    public               postgres    false    221   ~�      �          0    44004    directus_access 
   TABLE DATA           I   COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
    public               postgres    false    223   ,�      �          0    44007    directus_activity 
   TABLE DATA           v   COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
    public               postgres    false    224   ��      �          0    44014    directus_collections 
   TABLE DATA           *  COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
    public               postgres    false    226   e�      �          0    44025    directus_comments 
   TABLE DATA           �   COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
    public               postgres    false    227   @�      �          0    44032    directus_dashboards 
   TABLE DATA           f   COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
    public               postgres    false    228   ]�      �          0    44039    directus_extensions 
   TABLE DATA           R   COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
    public               postgres    false    229   z�      �          0    44045    directus_fields 
   TABLE DATA           �   COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
    public               postgres    false    230   ��      �          0    44055    directus_files 
   TABLE DATA           6  COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
    public               postgres    false    232   r      �          0    44062    directus_flows 
   TABLE DATA           �   COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
    public               postgres    false    233   �      �          0    44070    directus_folders 
   TABLE DATA           <   COPY public.directus_folders (id, name, parent) FROM stdin;
    public               postgres    false    234   �      �          0    44073    directus_migrations 
   TABLE DATA           I   COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
    public               postgres    false    235   V      �          0    44079    directus_notifications 
   TABLE DATA           �   COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
    public               postgres    false    236         �          0    44087    directus_operations 
   TABLE DATA           �   COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
    public               postgres    false    238   2      �          0    44093    directus_panels 
   TABLE DATA           �   COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
    public               postgres    false    239   b      �          0    44101    directus_permissions 
   TABLE DATA           x   COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
    public               postgres    false    240         �          0    44107    directus_policies 
   TABLE DATA           z   COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
    public               postgres    false    242   \      �          0    44116    directus_presets 
   TABLE DATA           �   COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
    public               postgres    false    243   �      �          0    44124    directus_relations 
   TABLE DATA           �   COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
    public               postgres    false    245   .      �          0    44131    directus_revisions 
   TABLE DATA           j   COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
    public               postgres    false    247   �      �          0    44137    directus_roles 
   TABLE DATA           M   COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
    public               postgres    false    249   �w      �          0    44143    directus_sessions 
   TABLE DATA           n   COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
    public               postgres    false    250   x      �          0    44148    directus_settings 
   TABLE DATA           �  COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls) FROM stdin;
    public               postgres    false    251   �      �          0    44162    directus_shares 
   TABLE DATA           �   COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
    public               postgres    false    253   ��      �          0    44169    directus_translations 
   TABLE DATA           I   COPY public.directus_translations (id, language, key, value) FROM stdin;
    public               postgres    false    254   э      �          0    44174    directus_users 
   TABLE DATA           T  COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
    public               postgres    false    255   �      �          0    44183    directus_versions 
   TABLE DATA           �   COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
    public               postgres    false    256   �      �          0    44190    directus_webhooks 
   TABLE DATA           �   COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
    public               postgres    false    257   �      �          0    44200    drinks 
   TABLE DATA           v   COPY public.drinks (id, sort, user_created, date_created, user_updated, date_updated, name, image, price) FROM stdin;
    public               postgres    false    259   �      �          0    44204    orders 
   TABLE DATA           �   COPY public.orders (id, user_created, date_created, user_updated, date_updated, "totalInc", "totalExc", "taxPercentage", "discountPercentage", "discountValue", "orderStatus", "subTotal", "taxTotal") FROM stdin;
    public               postgres    false    261   �      �          0    44752    orders_cartItem 
   TABLE DATA           I   COPY public."orders_cartItem" (id, orders_id, "cartItem_id") FROM stdin;
    public               postgres    false    280   ;�      �          0    44211    pizzas 
   TABLE DATA           v   COPY public.pizzas (id, user_created, date_created, user_updated, date_updated, name, image, "pizzaType") FROM stdin;
    public               postgres    false    263   ��      �          0    44218    pizzas_toppings 
   TABLE DATA           E   COPY public.pizzas_toppings (id, pizzas_id, toppings_id) FROM stdin;
    public               postgres    false    265   s�      �          0    44222    settings 
   TABLE DATA           Q   COPY public.settings (id, user_updated, date_updated, "taxRateHigh") FROM stdin;
    public               postgres    false    267   ��      �          0    44227    showcase 
   TABLE DATA           k   COPY public.showcase (id, sort, user_created, date_created, user_updated, date_updated, title) FROM stdin;
    public               postgres    false    269   ϗ      �          0    44231    showcase_pizzas 
   TABLE DATA           E   COPY public.showcase_pizzas (id, showcase_id, pizzas_id) FROM stdin;
    public               postgres    false    271   c�      �          0    44235    sizes 
   TABLE DATA           �   COPY public.sizes (id, sort, user_created, date_created, user_updated, date_updated, "sizeLabel", "sizeDiameter", "priceCm2") FROM stdin;
    public               postgres    false    273   ��      �          0    44242    toppings 
   TABLE DATA           �   COPY public.toppings (id, sort, user_created, date_created, user_updated, date_updated, name, "priceCm2", "priceBase", icon, "isHidden", "displaySize") FROM stdin;
    public               postgres    false    275   s�                 0    0    cartItem_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."cartItem_id_seq"', 61, true);
          public               postgres    false    218                       0    0    cartItem_pizzas_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."cartItem_pizzas_id_seq"', 1, false);
          public               postgres    false    220                       0    0    cartItem_toppings_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."cartItem_toppings_id_seq"', 146, true);
          public               postgres    false    277                       0    0    coupons_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.coupons_id_seq', 3, true);
          public               postgres    false    222            	           0    0    directus_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_activity_id_seq', 905, true);
          public               postgres    false    225            
           0    0    directus_fields_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.directus_fields_id_seq', 122, true);
          public               postgres    false    231                       0    0    directus_notifications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);
          public               postgres    false    237                       0    0    directus_permissions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.directus_permissions_id_seq', 1, true);
          public               postgres    false    241                       0    0    directus_presets_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.directus_presets_id_seq', 10, true);
          public               postgres    false    244                       0    0    directus_relations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_relations_id_seq', 38, true);
          public               postgres    false    246                       0    0    directus_revisions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.directus_revisions_id_seq', 726, true);
          public               postgres    false    248                       0    0    directus_settings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);
          public               postgres    false    252                       0    0    directus_webhooks_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);
          public               postgres    false    258                       0    0    drinks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.drinks_id_seq', 4, true);
          public               postgres    false    260                       0    0    orders_cartItem_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."orders_cartItem_id_seq"', 59, true);
          public               postgres    false    279                       0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 20, true);
          public               postgres    false    262                       0    0    pizzas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pizzas_id_seq', 48, true);
          public               postgres    false    264                       0    0    pizzas_toppings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.pizzas_toppings_id_seq', 154, true);
          public               postgres    false    266                       0    0    settings_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.settings_id_seq', 1, true);
          public               postgres    false    268                       0    0    showcase_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.showcase_id_seq', 3, true);
          public               postgres    false    270                       0    0    showcase_pizzas_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.showcase_pizzas_id_seq', 12, true);
          public               postgres    false    272                       0    0    sizes_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sizes_id_seq', 4, true);
          public               postgres    false    274                       0    0    toppings_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.toppings_id_seq', 11, true);
          public               postgres    false    276            m           2606    44274 $   cartItem_pizzas cartItem_pizzas_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."cartItem_pizzas"
    ADD CONSTRAINT "cartItem_pizzas_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."cartItem_pizzas" DROP CONSTRAINT "cartItem_pizzas_pkey";
       public                 postgres    false    219            k           2606    44276    cartItem cartItem_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."cartItem"
    ADD CONSTRAINT "cartItem_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."cartItem" DROP CONSTRAINT "cartItem_pkey";
       public                 postgres    false    217            �           2606    44740 (   cartItem_toppings cartItem_toppings_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."cartItem_toppings"
    ADD CONSTRAINT "cartItem_toppings_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."cartItem_toppings" DROP CONSTRAINT "cartItem_toppings_pkey";
       public                 postgres    false    278            o           2606    44278    coupons coupons_code_unique 
   CONSTRAINT     V   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_code_unique UNIQUE (code);
 E   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_code_unique;
       public                 postgres    false    221            q           2606    44280    coupons coupons_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_pkey;
       public                 postgres    false    221            s           2606    44282 $   directus_access directus_access_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_pkey;
       public                 postgres    false    223            u           2606    44284 (   directus_activity directus_activity_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_activity DROP CONSTRAINT directus_activity_pkey;
       public                 postgres    false    224            w           2606    44286 .   directus_collections directus_collections_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);
 X   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_pkey;
       public                 postgres    false    226            y           2606    44288 (   directus_comments directus_comments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_comments DROP CONSTRAINT directus_comments_pkey;
       public                 postgres    false    227            {           2606    44290 ,   directus_dashboards directus_dashboards_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_pkey;
       public                 postgres    false    228            }           2606    44292 ,   directus_extensions directus_extensions_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_extensions DROP CONSTRAINT directus_extensions_pkey;
       public                 postgres    false    229                       2606    44294 $   directus_fields directus_fields_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_fields DROP CONSTRAINT directus_fields_pkey;
       public                 postgres    false    230            �           2606    44296 "   directus_files directus_files_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_pkey;
       public                 postgres    false    232            �           2606    44298 .   directus_flows directus_flows_operation_unique 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);
 X   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_operation_unique;
       public                 postgres    false    233            �           2606    44300 "   directus_flows directus_flows_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_pkey;
       public                 postgres    false    233            �           2606    44302 &   directus_folders directus_folders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_pkey;
       public                 postgres    false    234            �           2606    44304 ,   directus_migrations directus_migrations_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);
 V   ALTER TABLE ONLY public.directus_migrations DROP CONSTRAINT directus_migrations_pkey;
       public                 postgres    false    235            �           2606    44306 2   directus_notifications directus_notifications_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_pkey;
       public                 postgres    false    236            �           2606    44308 ,   directus_operations directus_operations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_pkey;
       public                 postgres    false    238            �           2606    44310 5   directus_operations directus_operations_reject_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);
 _   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_unique;
       public                 postgres    false    238            �           2606    44312 6   directus_operations directus_operations_resolve_unique 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_unique;
       public                 postgres    false    238            �           2606    44314 $   directus_panels directus_panels_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_pkey;
       public                 postgres    false    239            �           2606    44316 .   directus_permissions directus_permissions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_pkey;
       public                 postgres    false    240            �           2606    44318 (   directus_policies directus_policies_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_policies DROP CONSTRAINT directus_policies_pkey;
       public                 postgres    false    242            �           2606    44320 &   directus_presets directus_presets_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_pkey;
       public                 postgres    false    243            �           2606    44322 *   directus_relations directus_relations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_relations DROP CONSTRAINT directus_relations_pkey;
       public                 postgres    false    245            �           2606    44324 *   directus_revisions directus_revisions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_pkey;
       public                 postgres    false    247            �           2606    44326 "   directus_roles directus_roles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_pkey;
       public                 postgres    false    249            �           2606    44328 (   directus_sessions directus_sessions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);
 R   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_pkey;
       public                 postgres    false    250            �           2606    44330 (   directus_settings directus_settings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_pkey;
       public                 postgres    false    251            �           2606    44332 $   directus_shares directus_shares_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_pkey;
       public                 postgres    false    253            �           2606    44334 0   directus_translations directus_translations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.directus_translations DROP CONSTRAINT directus_translations_pkey;
       public                 postgres    false    254            �           2606    44336 *   directus_users directus_users_email_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_email_unique;
       public                 postgres    false    255            �           2606    44338 8   directus_users directus_users_external_identifier_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);
 b   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_external_identifier_unique;
       public                 postgres    false    255            �           2606    44340 "   directus_users directus_users_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_pkey;
       public                 postgres    false    255            �           2606    44342 *   directus_users directus_users_token_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_token_unique;
       public                 postgres    false    255            �           2606    44344 (   directus_versions directus_versions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_pkey;
       public                 postgres    false    256            �           2606    44346 (   directus_webhooks directus_webhooks_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_pkey;
       public                 postgres    false    257            �           2606    44348    drinks drinks_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.drinks DROP CONSTRAINT drinks_pkey;
       public                 postgres    false    259            �           2606    44757 $   orders_cartItem orders_cartItem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."orders_cartItem"
    ADD CONSTRAINT "orders_cartItem_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."orders_cartItem" DROP CONSTRAINT "orders_cartItem_pkey";
       public                 postgres    false    280            �           2606    44350    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    261            �           2606    44352    pizzas pizzas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_pkey;
       public                 postgres    false    263            �           2606    44354 $   pizzas_toppings pizzas_toppings_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.pizzas_toppings
    ADD CONSTRAINT pizzas_toppings_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.pizzas_toppings DROP CONSTRAINT pizzas_toppings_pkey;
       public                 postgres    false    265            �           2606    44356    settings settings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public                 postgres    false    267            �           2606    44358 $   showcase_pizzas showcase_pizzas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.showcase_pizzas
    ADD CONSTRAINT showcase_pizzas_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.showcase_pizzas DROP CONSTRAINT showcase_pizzas_pkey;
       public                 postgres    false    271            �           2606    44360    showcase showcase_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.showcase
    ADD CONSTRAINT showcase_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.showcase DROP CONSTRAINT showcase_pkey;
       public                 postgres    false    269            �           2606    44362    sizes sizes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sizes DROP CONSTRAINT sizes_pkey;
       public                 postgres    false    273            �           2606    44364    toppings toppings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_pkey;
       public                 postgres    false    275            �           2606    44365    cartItem cartitem_drink_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."cartItem"
    ADD CONSTRAINT cartitem_drink_foreign FOREIGN KEY (drink) REFERENCES public.drinks(id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."cartItem" DROP CONSTRAINT cartitem_drink_foreign;
       public               postgres    false    5045    217    259            �           2606    44370    cartItem cartitem_pizza_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."cartItem"
    ADD CONSTRAINT cartitem_pizza_foreign FOREIGN KEY (pizza) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."cartItem" DROP CONSTRAINT cartitem_pizza_foreign;
       public               postgres    false    263    5049    217            �           2606    44375 3   cartItem_pizzas cartitem_pizzas_cartitem_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."cartItem_pizzas"
    ADD CONSTRAINT cartitem_pizzas_cartitem_id_foreign FOREIGN KEY ("cartItem_id") REFERENCES public."cartItem"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY public."cartItem_pizzas" DROP CONSTRAINT cartitem_pizzas_cartitem_id_foreign;
       public               postgres    false    219    217    4971            �           2606    44380 1   cartItem_pizzas cartitem_pizzas_pizzas_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."cartItem_pizzas"
    ADD CONSTRAINT cartitem_pizzas_pizzas_id_foreign FOREIGN KEY (pizzas_id) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."cartItem_pizzas" DROP CONSTRAINT cartitem_pizzas_pizzas_id_foreign;
       public               postgres    false    263    219    5049            �           2606    44385 #   cartItem cartitem_pizzasize_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."cartItem"
    ADD CONSTRAINT cartitem_pizzasize_foreign FOREIGN KEY ("pizzaSize") REFERENCES public.sizes(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."cartItem" DROP CONSTRAINT cartitem_pizzasize_foreign;
       public               postgres    false    273    217    5059                       2606    44746 7   cartItem_toppings cartitem_toppings_cartitem_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."cartItem_toppings"
    ADD CONSTRAINT cartitem_toppings_cartitem_id_foreign FOREIGN KEY ("cartItem_id") REFERENCES public."cartItem"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY public."cartItem_toppings" DROP CONSTRAINT cartitem_toppings_cartitem_id_foreign;
       public               postgres    false    217    278    4971                       2606    44741 7   cartItem_toppings cartitem_toppings_toppings_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."cartItem_toppings"
    ADD CONSTRAINT cartitem_toppings_toppings_id_foreign FOREIGN KEY (toppings_id) REFERENCES public.toppings(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY public."cartItem_toppings" DROP CONSTRAINT cartitem_toppings_toppings_id_foreign;
       public               postgres    false    278    275    5061            �           2606    44390 &   cartItem cartitem_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."cartItem"
    ADD CONSTRAINT cartitem_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 R   ALTER TABLE ONLY public."cartItem" DROP CONSTRAINT cartitem_user_created_foreign;
       public               postgres    false    255    5037    217            �           2606    44395 &   cartItem cartitem_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."cartItem"
    ADD CONSTRAINT cartitem_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 R   ALTER TABLE ONLY public."cartItem" DROP CONSTRAINT cartitem_user_updated_foreign;
       public               postgres    false    255    5037    217            �           2606    44400    coupons coupons_order_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_order_foreign FOREIGN KEY ("order") REFERENCES public.orders(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_order_foreign;
       public               postgres    false    261    221    5047            �           2606    44405 $   coupons coupons_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 N   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_user_created_foreign;
       public               postgres    false    255    5037    221            �           2606    44410 $   coupons coupons_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 N   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_user_updated_foreign;
       public               postgres    false    5037    221    255            �           2606    44415 .   directus_access directus_access_policy_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_policy_foreign;
       public               postgres    false    242    223    5015            �           2606    44420 ,   directus_access directus_access_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_role_foreign;
       public               postgres    false    249    5023    223            �           2606    44425 ,   directus_access directus_access_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_access DROP CONSTRAINT directus_access_user_foreign;
       public               postgres    false    5037    223    255            �           2606    44430 7   directus_collections directus_collections_group_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);
 a   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_group_foreign;
       public               postgres    false    226    4983    226            �           2606    44435 8   directus_comments directus_comments_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.directus_comments DROP CONSTRAINT directus_comments_user_created_foreign;
       public               postgres    false    5037    255    227            �           2606    44440 8   directus_comments directus_comments_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 b   ALTER TABLE ONLY public.directus_comments DROP CONSTRAINT directus_comments_user_updated_foreign;
       public               postgres    false    5037    255    227            �           2606    44445 <   directus_dashboards directus_dashboards_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_user_created_foreign;
       public               postgres    false    5037    228    255            �           2606    44450 ,   directus_files directus_files_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_folder_foreign;
       public               postgres    false    4999    234    232            �           2606    44455 1   directus_files directus_files_modified_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_modified_by_foreign;
       public               postgres    false    255    5037    232            �           2606    44460 1   directus_files directus_files_uploaded_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_uploaded_by_foreign;
       public               postgres    false    5037    232    255            �           2606    44465 2   directus_flows directus_flows_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_user_created_foreign;
       public               postgres    false    5037    233    255            �           2606    44470 0   directus_folders directus_folders_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);
 Z   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_parent_foreign;
       public               postgres    false    4999    234    234            �           2606    44475 ?   directus_notifications directus_notifications_recipient_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_recipient_foreign;
       public               postgres    false    255    5037    236            �           2606    44480 <   directus_notifications directus_notifications_sender_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);
 f   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_sender_foreign;
       public               postgres    false    5037    255    236            �           2606    44485 4   directus_operations directus_operations_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_flow_foreign;
       public               postgres    false    4997    238    233            �           2606    44490 6   directus_operations directus_operations_reject_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_foreign;
       public               postgres    false    238    5005    238            �           2606    44495 7   directus_operations directus_operations_resolve_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);
 a   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_foreign;
       public               postgres    false    238    5005    238            �           2606    44500 <   directus_operations directus_operations_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_user_created_foreign;
       public               postgres    false    255    5037    238            �           2606    44505 1   directus_panels directus_panels_dashboard_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_dashboard_foreign;
       public               postgres    false    4987    228    239            �           2606    44510 4   directus_panels directus_panels_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_user_created_foreign;
       public               postgres    false    5037    255    239            �           2606    44515 8   directus_permissions directus_permissions_policy_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_policy_foreign;
       public               postgres    false    240    242    5015            �           2606    44520 .   directus_presets directus_presets_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_role_foreign;
       public               postgres    false    5023    243    249            �           2606    44525 .   directus_presets directus_presets_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_user_foreign;
       public               postgres    false    243    5037    255            �           2606    44530 6   directus_revisions directus_revisions_activity_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_activity_foreign;
       public               postgres    false    4981    224    247            �           2606    44535 4   directus_revisions directus_revisions_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);
 ^   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_parent_foreign;
       public               postgres    false    5021    247    247            �           2606    44540 5   directus_revisions directus_revisions_version_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_version_foreign;
       public               postgres    false    247    5041    256            �           2606    44545 ,   directus_roles directus_roles_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);
 V   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_parent_foreign;
       public               postgres    false    249    249    5023            �           2606    44550 1   directus_sessions directus_sessions_share_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_share_foreign;
       public               postgres    false    250    253    5029            �           2606    44555 0   directus_sessions directus_sessions_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_user_foreign;
       public               postgres    false    255    250    5037            �           2606    44560 8   directus_settings directus_settings_project_logo_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);
 b   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_project_logo_foreign;
       public               postgres    false    251    232    4993            �           2606    44565 =   directus_settings directus_settings_public_background_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_background_foreign;
       public               postgres    false    4993    232    251            �           2606    44570 :   directus_settings directus_settings_public_favicon_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);
 d   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_favicon_foreign;
       public               postgres    false    4993    251    232            �           2606    44575 =   directus_settings directus_settings_public_foreground_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_foreground_foreign;
       public               postgres    false    232    251    4993            �           2606    44580 D   directus_settings directus_settings_public_registration_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_registration_role_foreign;
       public               postgres    false    5023    251    249            �           2606    44585 B   directus_settings directus_settings_storage_default_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_storage_default_folder_foreign;
       public               postgres    false    4999    234    251            �           2606    44590 2   directus_shares directus_shares_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_collection_foreign;
       public               postgres    false    4983    253    226            �           2606    44595 ,   directus_shares directus_shares_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_role_foreign;
       public               postgres    false    249    253    5023            �           2606    44600 4   directus_shares directus_shares_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_user_created_foreign;
       public               postgres    false    255    253    5037            �           2606    44605 *   directus_users directus_users_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_role_foreign;
       public               postgres    false    255    5023    249            �           2606    44610 6   directus_versions directus_versions_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_collection_foreign;
       public               postgres    false    256    226    4983            �           2606    44615 8   directus_versions directus_versions_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_created_foreign;
       public               postgres    false    255    256    5037            �           2606    44620 8   directus_versions directus_versions_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 b   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_updated_foreign;
       public               postgres    false    5037    255    256            �           2606    44625 9   directus_webhooks directus_webhooks_migrated_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_migrated_flow_foreign;
       public               postgres    false    257    233    4997            �           2606    44630    drinks drinks_image_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.drinks DROP CONSTRAINT drinks_image_foreign;
       public               postgres    false    259    4993    232                        2606    44635 "   drinks drinks_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.drinks DROP CONSTRAINT drinks_user_created_foreign;
       public               postgres    false    255    5037    259                       2606    44640 "   drinks drinks_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.drinks DROP CONSTRAINT drinks_user_updated_foreign;
       public               postgres    false    255    5037    259                       2606    44758 3   orders_cartItem orders_cartitem_cartitem_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."orders_cartItem"
    ADD CONSTRAINT orders_cartitem_cartitem_id_foreign FOREIGN KEY ("cartItem_id") REFERENCES public."cartItem"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY public."orders_cartItem" DROP CONSTRAINT orders_cartitem_cartitem_id_foreign;
       public               postgres    false    217    280    4971                       2606    44763 1   orders_cartItem orders_cartitem_orders_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."orders_cartItem"
    ADD CONSTRAINT orders_cartitem_orders_id_foreign FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."orders_cartItem" DROP CONSTRAINT orders_cartitem_orders_id_foreign;
       public               postgres    false    280    5047    261                       2606    44645 "   orders orders_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_created_foreign;
       public               postgres    false    261    5037    255                       2606    44650 "   orders orders_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_updated_foreign;
       public               postgres    false    5037    255    261                       2606    44655    pizzas pizzas_image_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_image_foreign;
       public               postgres    false    263    232    4993                       2606    44660 1   pizzas_toppings pizzas_toppings_pizzas_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas_toppings
    ADD CONSTRAINT pizzas_toppings_pizzas_id_foreign FOREIGN KEY (pizzas_id) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY public.pizzas_toppings DROP CONSTRAINT pizzas_toppings_pizzas_id_foreign;
       public               postgres    false    265    5049    263                       2606    44665 3   pizzas_toppings pizzas_toppings_toppings_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas_toppings
    ADD CONSTRAINT pizzas_toppings_toppings_id_foreign FOREIGN KEY (toppings_id) REFERENCES public.toppings(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.pizzas_toppings DROP CONSTRAINT pizzas_toppings_toppings_id_foreign;
       public               postgres    false    275    5061    265                       2606    44670 "   pizzas pizzas_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_user_created_foreign;
       public               postgres    false    255    263    5037                       2606    44675 "   pizzas pizzas_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 L   ALTER TABLE ONLY public.pizzas DROP CONSTRAINT pizzas_user_updated_foreign;
       public               postgres    false    255    263    5037            	           2606    44680 &   settings settings_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_user_updated_foreign;
       public               postgres    false    267    5037    255                       2606    44685 1   showcase_pizzas showcase_pizzas_pizzas_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase_pizzas
    ADD CONSTRAINT showcase_pizzas_pizzas_id_foreign FOREIGN KEY (pizzas_id) REFERENCES public.pizzas(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY public.showcase_pizzas DROP CONSTRAINT showcase_pizzas_pizzas_id_foreign;
       public               postgres    false    271    5049    263                       2606    44690 3   showcase_pizzas showcase_pizzas_showcase_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase_pizzas
    ADD CONSTRAINT showcase_pizzas_showcase_id_foreign FOREIGN KEY (showcase_id) REFERENCES public.showcase(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public.showcase_pizzas DROP CONSTRAINT showcase_pizzas_showcase_id_foreign;
       public               postgres    false    271    5055    269            
           2606    44695 &   showcase showcase_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase
    ADD CONSTRAINT showcase_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.showcase DROP CONSTRAINT showcase_user_created_foreign;
       public               postgres    false    269    5037    255                       2606    44700 &   showcase showcase_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.showcase
    ADD CONSTRAINT showcase_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.showcase DROP CONSTRAINT showcase_user_updated_foreign;
       public               postgres    false    5037    269    255                       2606    44705     sizes sizes_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 J   ALTER TABLE ONLY public.sizes DROP CONSTRAINT sizes_user_created_foreign;
       public               postgres    false    273    5037    255                       2606    44710     sizes sizes_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 J   ALTER TABLE ONLY public.sizes DROP CONSTRAINT sizes_user_updated_foreign;
       public               postgres    false    273    5037    255                       2606    44715    toppings toppings_icon_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_icon_foreign FOREIGN KEY (icon) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_icon_foreign;
       public               postgres    false    232    4993    275                       2606    44720 &   toppings toppings_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_user_created_foreign;
       public               postgres    false    255    275    5037                       2606    44725 &   toppings toppings_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.toppings
    ADD CONSTRAINT toppings_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 P   ALTER TABLE ONLY public.toppings DROP CONSTRAINT toppings_user_updated_foreign;
       public               postgres    false    275    5037    255            �   �  x�}�K��8EǯV�y�ŏ$�Ed��� A�F�Y}�e���İ�#��KIz|�� $�@�K����Ȕ�B<����HOey��Nc����^WoIN>�������E�7���ƟGV��P����J�'S�)�vz�c��������7�_3��Xc�ꭁ��]��'`��̱y��C6��tap>��1���2��47h3%�m�ʵ[e�+}Ͱ{��VW�O�Tp�lA]�ln{�_2���Ğ�,�<dA����d�PC/;D�!�I����Er.�gj���!q稢vhEd�5�Vjݶ��f\Z���c�M�q���A��^��5JX�ݷ�3r�I�Ş\tŹp�pU�<h���\���1_3.<��Zʀ�9�p=W�b[�cȖq�����V�Q�8���Z#��B05e�˛��\�1�`�O	\�ŰA.�b�$'/��Ŗ���&�zO�� ,r&]�jbZE�J87ra��D��ψ{�OD�Î�/�K�=J�S��Σ�dI֛��(�i���j$9����@ʅA�g�qޠ�r����2c|A��g�S~a\�U��NS�CKت"B�x��Qu-���r����ݒ�M�C9lU�!paZg�_��	:��Б�
9�C�B`�$Ic�8(Ph���=d��w����s��1�T��Ro�����
�3WM+u����M��!W��h��9V��-�vή��e\�p��D�?�U�s,˹b�ʘg8�nS�k=Q3i\�[ȷ�������      �      x������ � �      �   �  x�-���E!C��b�jS��_�$���|��	�����X<��<����l�x[|-���ì5%�-�R���ߏ�W�k}�֗�-�[�l���ږ�[�n�����l}�>p�c�s�~�g�s�>ǹ�7������g�ku��.�w~�<uG@����'^��x���Cʇ��x�x��p�ɀ䉀Sw\`c�6'! V�-�l�|:�=C�([h;��vI�=lh1 6�8�64 �L6��-	�!�)�%��J������ ��p l�xܚ('����m[�h;�.�6��:|UC룞������N�`���,[h;��vI�=l>	�aT�cd���.6LIr�̃@[0�[C��а��#�J��l�Mk��W�������w�k9�J���#��X�U_hy#���8����q9;.����o�/U_��T}��R��w�����bI+!�T��3��Tm�\      �   �   x����
�@���St�;�sɵ��R�Ա��������[!S��}D gS!{z�z�1��y���1�]�30�z4ϱ"�Q2r0�"LC�S�����gm61}�?ZW��h�R�ąގ㹽~�T��3(��A��۫Hߴk�v��H	N�9��B�      �   �   x���1D��"��@� �q�%�+��?i��fV/��"A,}$�T����.�X�0H���ׁ(���C�kɊ$p�����m���.<ZO4�@��]�v '�BΑ�g���B0�V���J�j���u��i���>3g      �      x�ݝ[��ȑ��O��쒝��i��.fg`��� oe��#Hjx�O���T��N�<�0�p6��*����\2B~����/D㬖�/�]a��E��Ka/�[k�����JT�Ҫ�����7!>H�K��#?����_>��������{�������e����1�g����s�?��ׯ����y��վ���?�����������_����o}�Ǐ��/�^���"�����K��e�W>t/����o�?�����}�_~��Z������ �����~��=j1t%Ti�e����s���P5��"U �9�T�B� �= ���5 �; ��ݚP-��@��P��V2Am_?N������?^�~}���� v�a+]:no��RX���-�f���U�X�.�e�!V�v��2��2�bM{��~���a�,�Ӽ`��Y]i���
~���+!J+�	(��E*(�Q�J�J�2f�UBގ��;ª��Ҳ�N�)�Fn]�X:6�j~ɐ�'�2���S+!WO!u�,��r�RH��r�|gX��SH%u����ç�q�%�c����R�P�,y�<������� �J��&;��q3T��T$Qe+����1���T$Qe���OKRR�J?��#HA����7�*�}>f���%%}�\�٤�fX0�CQR3,3q� �@S��k�m9���fXf�XA��(����� �@S���@-ec������ 6EK��K-��
�42�7����2*n�4EK�W,;y����rX�%���]�`����J�R����66-�lv	���?FQެb��7�R���HoV1�Yh��1-5�2�l5�����`�c������Ր�cHj���f!�ǐ����Yz�ߺ\�PS�{*$p~JJCN��D�fX.N�y?���FXn��j�������*C��%	�	����a!�hIBj���V�����^CV�R���T%7�h �l�	J�ʔ�۷�RU�5�܊���@{�Ɨ�[�KRZWF��q�Ɛ�(Bj������� GR,��|}ڨvti5�+f�M^��H�	60��EZ��*�\���!GQTFV:�Y����a!w�Q�T3,7��C�"�FX.�yF��!G	QM�ܾXIeGT3,�Ȕ�ԣ����_`!��)�j��r�ޕ����om����)R*q[����T��H)�*Kf'��T�'	��r�x���$!5�ry�o}��V#s�$�F|6���]C�ٓ�� %���fO�V%XJ���{N%J-Uⶢ4lD��{ 	.�c�:r�M.���J-)�Z�ش(���)eV5��p��5���5㽿�9 [+�ast.V�8���5��k_�:Pr�����o�݁r[p��h����@�l>1���o �	�㧾�ϋRo���R�m|㑪�27�s|U�D�fs%���n���-1��Z�_�E�b�����b�TŖ�9��}�-R[��l�ׅK�권��_.���4���.$�6���0_y�R����Ѿ��)Hbm��(ֶ�ȷ��'�й�A���ښB��W��/m�n��cn{�+��cl_^���<����[Zh�>��c�g]+IA҈7Gk�z^JA҈#6���n�(I$N���>�(I&��M��e�$�8�sԉ�/���+Y�ꁪ�Ro�mI����j�8�%U-fn��}�5�T閨��O��c���as�0���6����w�l���Ħj����S٩�H���ԥd�ڻ�n��x��k8I�p��ǲ!eQ����uETp��7���)���y�G�t/?Q�e~����)���9bo�8���9Ɯ7lQ��Xz��{�ۦ귌�Q�o	7En��Q_�J���O�,�[�&*�<���%�w��� ��A]�k���26�0ԖY�D�6ps�PV����qy��`|�ӏ�o�MRj�ږ���e�HZmw?�M#i���0ߴi$�6qs4��6�$�\�h=GK�� �����h�!ɴ	��I۲�� 38�Cl#�bHBm�f�O~�d1���C�?��MTjl��69Q�����&'�4������(ӆ�1G'l�#*5�J��}o|ݖ(�l������VT*!��=7�OJ�ԁ��J.��L�����3-Ǔz���^���^3{�j�)I�&Z�%'0�B�7%i�U�x�lư�W%�Y	�����`�/�9*I����%s�n�R��Z=̌��h�V��4�����ұ�zϴP�Q�(�Dku�ŗ�f%I,����Ł�i��d^~����/�8�H���	�p����}����?=_�%�CW�O�׼�P�SI���hudt�n����J�@r�5xn'誑&"ؘ��u�t�H#&Zfك�
i(���3�B��0�r��܅�?�R݄		2��J�ҳ)S�_3��	M���y[��nE�=^��Y��������l����G��㳽7n�;}=�����+6��o�8>�{7\|��yn��1^�Y����{=>�{��h�w�%z#K�f$�{β�O&p��AG��	�j�J�s��*5I����e��V�-a�B��>�cy�bݨ�+$l���`�5z�I'�Y�ҳlB��^�n�E۪z!LW�])Xv����#�#kI����T��]5Z��Z�����aӇ���9���5�meыN�m1��|�5mhk!�ta�¸�����~��1n·���"�2n(�d.>�)sj5}ۊ�0����!�����]�(Z���u[QDy�E���O��d"ⓝÂH��2Ѽ .
���>�Kal/��\WD������ />:,����\>�yA�Ѧ2/Cc
�Ȅ�&�N��������aAt,��]->�:,��c3(� /����:4��zS�NȢn�ilеi:pA(� ��|ʮ�X��Ԣҡ�ܪ<d1�V�j%�3��;���:J��"��H��=�ҳ�4��H�(¤��6������S�q7Z6�m��\/��_V.�n�<޴�}Y�P��l���Pe�"̚�ҲI�ʹPe�"����rq�gZ�2NJ�h����)���-��v�D��щ�O�n]|)¨�,�}z�P9����DkB��f��l�h��i�и�6y��RtQۮq��K.���u9�Py5\4���Պ��&9[El�ץ�h{Wח p5�wD�����z�Q��^�.E4�6�������H�||мJ�ִMS�&&�F�ia�3;Y�Kl{{��_R��r���Ҋ��S�h+�r��K[$��E�հ!�D9��`��Ե��]��&���TE�ǶpZ��1�\����r��`��#v�w�l�1c�P�̩�m����%�D8�����8#�7Qm�_ۢ�ɦ��+J����B�O����޸^y��%*8�@l,�Hߎ��e�^RtsZ>�3/G�j�zዮ�"�U����Em�������0�"iRU�P6=F���q�6Y�}a��?KHa۴3�k;pw(�&���c=lek_�m�7>YҦ��Z_$�U_\�^JS��I���u�j�z�]��hGQ�m��vRFit�C�TJ�Tش�,i�uR�uS\|�Z��N*5�.���!��6$��rw8��^6m��(�,"���Fmd�N���� �R�����h�u,.�O��iL��]r�/Q{۪���I������n\�ܵ6���I��iD]�КB��ptI�{jtE��r�:W.}�D���s}�TtL��Ѣ�.*jCӀM��"I�q1/��)�\��M�d9|]�k�֡mC�C%ܕ"I�i9xY�.�$2����;lrX��Z�b�kݥs��h�$�l
��c�"�le:f{�vGR�Ec���V4A�2�0!@�CW6��1�HPrj��t�^װ�����ח�߇ju��Z��i����ir���z�����}�PKk
��,oMRvml��H��\$(t�����{��J�R�)�W�)m	b�5�R2��&I�&��d��T(��#�Ɣ,�y!!�S���l�MZJ�ݤO;;n	hXXQ��&TZ��Q�s��A1R1_��l�xn�R�V�?�ѵ��,�$��1�qe`3�n�����M�m���%�j]nu{���t�%d�;S�Q'�    L��x���ӵ��Jh/7�e<�e��/���#I��ln�E�8�/�ٺw�[$���.�;�ٰ�,S���Mz^s	^l
���[;([Z6�zfZ0�D�q�����aR����iAϔ0��F��3�_��n��J�t�h�� @��捖Kht�u�^��
:k�I����6�$�B�0�#�'+%�p������ҷ.g�X���ElU_$�ޫ΃��aÂhSJ�e����)��@]���:$KF��;}g�s�Ɂ�V�FgmǶ�[�9Q�WUR�����}�����as9w�ѷS9��+8�p�~�����5pw$�Q�ou�"7v��T����9��v��0!$Q�+*ɢqq���\���D�lGxW���{7;%�'s�:)J���G����}Z7��XY*����� I�M+�ō�o�	�4��l"��=I���"Ӿ���;IͩJF�0ޱ�Irn�VO��/����*�����Iٱ���ܨ�$��䄁"36�1*[�	�@�8�m�n�E��l/�L��Ժ�,�7lQ������D�6`��6���p�ze��&��L�r����M�2bFݔ��4��6�s{u��\�=�=�e�"U�ep�N���2-cs��7lU��R�]�����2-�Fp����D���ܱL��/&z\W�ca���� �1βSӄi#u2l��jYk�0H�Ͳ"`C�h�T�8G�j�4a����._�h�0���Ѣ�j5-<�B�����M�?�Z�E���6��'8�Թl8�qD�a�"�&�h�.���q�om��;�� �l��%C�2�$�2�?d����.�h¨�Dk��l�I��&=�)���n]ͥ�EgzѴ�ݥ��T��r9꾮M/E�\��ȋ+kLal��:��y'L���Kb�w��&Oyib(�_��q�&m��6�	�+���d�1/N�Da}�k�,jm��b��*��K�-%�&lZ+Je�>Ɠ~�����W���##|�D�͵�����##t�KG�Z�������N��ե9�sܭ�I��J�R��7�j��)d�hc��Đ�jE�]�T��D÷j�oP�h}���J��֢�ޚ��1�ŏ�\��w��V�V�VB��͕�VÓVC�ҳ���F �FR,�M��V#�VêҰ)������ď<]����Z��M��VC�W#7��տ�/��c^�)Aq�j�j���4���H��p^^_	����_ʵ��`� ��&�Qgk�+%�DY����-�L�X6G��5:n8��ͭmNO\Wt�4:r�)C���m�2��&�����f����+%�7��H�t)J�	���Y)�=����j�:�9BW��/z])���ڠ�#ev������j���̔q�(g_;��.IB,��'��f7!���F��x��QT7LPp�'*$L��g�@�ܟ�յ�(�����T��`Ͼ9�j[KQD3��Fi�� �^������+�p�γ��-$��MLg)��z-�qؓ_�#,���-,`Y�8���Y�/��<�O�MÏXX�2�RAw?aa{r�ôy᳔��T:j���_(���)�`�ns�:��a
X����Q�G3-M*G�I:W舳g=�QH{y}��'�й�A���IY�Nt����܍�O���JoԽ�8x�3̐��YX�.]�1G�c����lr�c�|/�%4u_�:��Q��6E�w�Kt���r$�6-�Jռ��N{�24�0�"���u��m8/I���%<��/�lw$u7Ѳ�����s$�7��p�@�đ�氟����Bj �aj^=>�Hyu�����|�<�>x�z�ޜhON�=т_~����N�Ҟ�GZnn��bO҄-�	~�$��{t�K��(�L�Ĝ�����H�u�bam���Z�m.I��J�2�݊�i���Oz#-3K��8�'�	����x���b��#3�-���N7�	�P%��}BR��X)@�-P�WR�*_�fa��������:��"�fZ�T�}ֹES鹝F
����h�m_�K
K=�2�()�K�$C<Ѳ0�+����"��M���@����^~ڿ`�?u�Fˣg尡�>z��5���S���F5�+Z����6u���j�u]l7x$�)5��ϖ���o_�f��HQy�x��ɧ�	�I�]���q��!I���f+��8�����������J@#%h5��]���Yk�G���7�O�~;d+"���d������I�{����Hr�&ؓ5��b�oG�<���9�:�B���ges	aN�:70�4A�d#��i�GX�g6���&XfvJCAI,ΰ'��a�(�$�6�2�fA�bI��J��r���lI4M��t�2���&Zn�$(~^������-�ْ�-����? Q�!&���%�sL ��ȥܷҝ�E�I'��$���D�x��x�ՠ	����L���j�KJK���1���A,)ن��Y&I�V
=t�F{���D��=+sA�,:�b��s1��l��:I�<ʹ̾[Z)|��-���4R���Xf��h����̎[F����>[0Ҧ�R��pt�IV$)es#Dwv_��ǭ"I��ۦ��/�]i��?~���2���b�#��M�\���"ѱ��wТ{�|/���e�K|߽~~��{���Ǜ\�M�8�y���籥yܝ��A�P7S���\�໘ϓ�Hq��gژ��fq�z���8�2��Ǒu����8|>[d�y��؎軪� c�nܓ�(c�#/L)3���ݳg�<2���`�!�v�^�r��3,�j�ʹ�`�m� f��]��h�m��D�ݵ�h��3-����䎖�;������~���_Apd]�>��<�.��5�QVl���<�}�-fŶᾣ�r��M=�_@��R�%���Oo3c[s/i#���<n��h�8̝a�%�v�Jm�1���m����M�H�[/��[�$�ޠE&LfZ��8f�?p����|�ke�=�5�'�F
�/Y�r�����|�-���AG�"�%KZnǭ=}�̖��2�5��[d��-��@Yz��ef���;d�ɒU0�j���!+O�h�8�[M4�#	)U	Qzn.��N&))�{Jk6C��mII��ߖ�l��q�8�~�y4�:�Py����_�,O^\���s�ё䊮�N?âx��8�H�yȧ;��n늲#�l��vڳk�7�&$�ե9�k���kO�]:ߝ
gg�.]{��2Y~ͣ��z��2���� ��{��2����"r��1�M���r�*}�`�'��������9��<�(��Y)sc��,%��X�<Pg7E�&�A��GJ�'Q�ҟ].�M��.=R����<e�ݥ���`� �lw�;Z.V��B�k�7h(�T�
DfQV�U����]�NIFEO�������X%P�p�(C��9oV����i����@��ʹ��pIo���F�x�C���7R"M3-����FJ�i�=ۓ�Q���ӌ�La����-3�����i�e�7���i���y�p�<�C�+k˳[�>ӂ�HRSz=�SS��"����هkGl��-��P;ZARS-��jG/=q�X�9$�C(2�� ɷqy��7P�Z���=Y���)*�¶$59�>���g+Hrr�ef��C�
��q����W��R;6�rs�C�
Rpn�e�傾�t9i;o�M�
V���ɷ����w\S��$-Mn ®"�@K���-�Jn�t��$)�	����I����w�̤�$ak/i��r@'�bk��2�ɰςm�}G��d��q���Yq�����p�|�Ŷ־�e��}lk�;Zfg�#`[k/i���]��͵g\���e'��E����mB��L>x8IcM�\,���[������b;p/��|�K�?�e�/ݧ��˗_� �i����
�����&ɱ�������$}6�s�ޘ�Z���}�e��}��'i����1���i���V�����5I�1�_���*��sOkԻT��j�L�S�{�i��3���VSug,�h���    μ���#XS�g璞�o���3Ss4��M��J��gdFwP�g���i�:�Qu*Sj6Q�v�$7]�%��F��SCҙ>�Ւ��\86nH���.b�1�iC�l�Ҫl���%�3�kJ�x�fϐ4��Y��&LK�b�2�(f��Wrц$��Г�.\eH:k�Uܶ2\eI�j�墫6�,ILM�\�8��P���Fڟ����L��]��"��q��7O\R+����[ e��i���M&��	���ZqpI��g\.a�m�hq��������z��$�n���y�:p��u�Nd��_ɕp��;P'Z�p��g�|���������ʋ��#�yp�����R�=�iσ��x����q�t��]�����!dE��R{������i�&�y�??�L�����	�_�h�=�s����g��R?^�=�}��͑��K�!bl��ރ�=�.ͣ�I{�q��r${x��N��8�>�nh�C8M�ɝ��=M�4�'�#�ap�����l%��������g�wZ��� Zf1F>�g7cZ0�)����CUD�����<KҞ�pJ�U�|LqО�pL�S�ǩ:��!��y�qhL$�I*�Tֱ�C�:����V$x��T6��#����K�}_/ƺ\Ts����>��I�xa��<�l��>�s߁�����t�!���b��N;Uyl$L{��`c:�K����t����9t}�Cz�d��;�tp}:Ȝ��3���A��yd��Q�>��a|������G�O��y�/ݑ��I��0>O(գ�D{tK~�aЦ|���f�:|���h*��,���e f5�$�dI�6����.�NC�,��� G,}���	y��?�0P���U*�$�`g:=vn�=�`��ȷ�Ǌ�/�t���!+�yb��:�N)t�0=�ʩv���"+�4�V�:ؔ�`n:e�+�����;E0��V������=.?(�>�v��cٜ��A��M#P��Oz ;g3�r��@��NS����e���r��!�r���h?C爈L�s����=�)/G~C�d�H�j���^Z�䔷���C���;��ފw=�����o����;��L���a�z�,��]�c���4g�[��(�1��2_�}L!2�D^�)U>O��w��.���,4S�`�cAV���]O-eٝZ�Ku��q���E��:��M������w$�j6Mg\	F'��|&ܘ~���U���÷��r��vp�>Zf�U����w�Ѳk���K�ZfV�(��-|�\������M]�VG��᳠ev�(��-|���3�r�=|���^-�Q��[��`;\������Y���Ѝy�o�3���>��+_.��ψk4Ƿ�K��uɜ*���y�oב�������^"� CpۤgJ~1��:W��`>"w��K�/�>�oqY80����l,�����0�o��v����gҷ��[re���D6C./���z�5���"��ua:#�&��P�ij�Z׷01	y3*+K�x��g,z]���`ʔ���[y�������~�-S��{a�=u���e�!N�7����̛��ϑi3��9�ߪ�x�A;� %a=��[����Ƥd��|�C�&��D��$���y���t���sr��p�Ͻeǟ�~%"��Qf��(!N�d�8�Х�,o��e�,}����%0�&0��ڤ�Q�J6n���&�&P���;'���[�i���&�G��o�l&����Gd<s4�6_����N3�p�]V;�]g�4�]T>GԑC��S�耨�˗\�c���ǀ�J�X� DQ�]���/陥�C�D;��+�&k��p���&$y�d��>[��NtU߂�K��]2 6��s�[�����i��u��0�p��7��
<Ma;������߃��(��0������D����|���{oy�O�7V�|���{��}P>�q�����c��c����p����p��!�è�����`���/�%C�����t�ތh>��`�������.q�#�or�ΔMz	�&xF�揁O�cJ��4�\���O�M} N��c��,{��|�o��e`E�c�����|�/ ��<�{Z.9ج�Y�l��ծ�W�������3�C^�����kϯ�:䅯%�eV|-%T��-^��<K���.0Ag��gf�ܢ�웨��؂�_��eF��}��`w�ֹ��D_�tn|��1��?�f��ǟ<E��?����P�R�4��[��s��1 ��#�~F'��_�F��ޙ��o_�A
)� �i��GZ��*#�;iRA�҂@F����T��>g�j��_�>�>���������o?�B�?d9ǒ���i!�2r��}�*;�R�A �Tw�\Rt�hH���I-i��%u�w+��;Zn�*|�J����ev�:�La��/h5�)i3-h�����h���wP]s�t1Ŧpd���� �Z�a���@q]�Ci���KRS�2�����+�$9�r�~��}6.��I���h��e��S$95�r3˰ӧHjj�嶓A5�Hjj�e�/`�O���D��8}���F����g��N�"ɩ��݁A���p�me��ST5�h٥ca5�PS������w�̂ʰ�����ev��>.�
�,�����bo�̸��;�:�}����r���%AO�v�νǗ��hY�=\Ђ�_�w��'�|O�`�X�/C�ўSޘi�-��O�J�J�R�=����sF,r�Ј;�<�1�.�Ν�&��]��e���p���,�t��6и�e���p���-��������R0���p�В�l��p���.�Ga'H,i�����3�	w�̌�J�;Bb��-����#$�h����xv��-��G9�S�*�XW�7�-�}%�{��=�]� ]��~nW����(j����{��;ވ@_<�tK�/b
N��6Aq}%�i�[)�@S0�9��ð�407��r�"7�{n�{�
��ة.W\W6�v�]�����L\��rG����16�T�%�c���i����rG��Á�lؙ.KZn�+d�hgAˬ� �a/�.i�9��w�/h�9�+A6���p��/KTS���)���)n��W��;@M9fgd��G��e�/� �;@M��~�]��osC�J�����~N���w��md_�6=�	�,�LzE�����T�ml_�a9���)=���_�o���-�:v�+���3����R�������:��Te�5�S�O�".t��a9T(�j+0���,
�>�M�|�h�"+eK�m�<��n�����,�?��n�
��VI;רR=��\IM���E]Is���jL?�ez��s+c��8�͡�M�C%D��ޙ��(�0���4�}�Y4���������������$4����U2�6~Zy<��?넅 ��L 6"Wm6�r���X��џq��ʺ�X.g�L��L�WlJ�X&�v�RJ&���Er:l)=2��S2��2�w�9/�iƟ��w��oe��\�[~�W���}꾽|�l�o({[6y��
�������;Q�-��g�u��]8��#Y]_Z6�+�#R��N��EqaF���aw]6i	��s?��l��u.�'�ݨ�Dq�"�Fh��=�9��Mp��8������8� �?G������7�;Ƕ��,�-C�Mn�Q��9���s��}������6l���߄R�� [�&��G�<���^ڳ����,�����ow��W�~?�`��@�\�:C�e$9��#$X����'���>�y�;ȓ��fH�����$X���Kȓ}����ȾAw�L �k��,��p�<��
iJyv�Ы�[�@�<����=�*z2����	��@�=�d/�	 ��ɘ'��+�	�JV�����'c�=��	�]�*2��j��	z^���Xa��W�j��y�b�a��W<@��@�@ga(�?1Z�X�v���m��w��]U��\���]��.4��{k��X��.��gU	s~��������G ��(�@fFq,���Pxf�� y  �D�M�0d�D�̓,y�>��������@�!��Ѱ�;D��Eldf�7�ξ,|�� %Q氢Hl
䎒K�
>"�R�%|H��@��m�I�=�%��xT�o�3�OKl䎒K�
</�Y��`���fA�0����j%�͂,1���I����d{��6	��?�$OL8l~@V���gڅx@R��M7L0�H���l�	&��Iuǥn�H���������Pn�`R=�T�	&��I��o��0!u�Iu>��:�∤:y��:Z�Y`�οMqk�A�C]ȓ�#��:���-K�j��=��"�RcG�x6_*$�8B�s��ihGq����Ґ���!�%�e !��������      �   �  x��T�n� >��ȱ{h�I{�}/+U�H�1�@c� �l���.}�>��v��q�V�3�����7n����XU	���^��^�ʉR���=�EV��#d���s��f����
�m#�]�=M����
�),=�O+|���^<jKLW��!b���e�c�	��Q�v��6[�mqoFq%�<��|0RsYh��!IP)o�ӪR&�o�:H�Pl�0�K�a6�>`��t �4po�K[,հ\»9��<K5�k�3�`w�ːh�v��&�AO�̐�r�fJO[����l��9� ~���%�>�co�$�l���|�3g���^|��.�Y7�F�r�\*�|TN��G��*�pV�G�z��UJq
��K�g�?`e6��.���N��=��}���O��Q�b9j���pa�ANq���F����1i�u@�$~P
�L��a���둎�$�O�sqZ��l2���1�      �      x������ � �      �      x������ � �      �   C   x�+�LJ10�L64�54�H�5�LN�M2OJ�501�H4II6J�0��/JI-���ON�������� ���      �   �  x��Z�n�6��<� `@;X�H��ǖvm�6��h�-Q	1]\�j��L{���^i�lJ�l)�wF�Xd��s>����f$�,*��
Ig%���� %*㸝���=�n/���!1����(�_9F��@��8�z�g�0�N�f�\�8����ځ6�������N��#��"E	��1jF�]M��e*W(�ֲe�l�숆�j��J\�i��Z�W�+��%�������;���E�����ϖ�A�sR# 6D��?�m���l�h�1�|��!Ι�g�ej�J�������V�%�=0�8�Hq;*�j�0��T�H��?:I�e%@�Ot|�u�y�n���=�	u�0]ǟ�{&;��Hč��0�ȯq�]�P��<A�8PO?���'�/��~��,'�(����	1�W$q�L�i���
��(�kP)�7<�U s�y�� �r�.�	`/�ڶ� �(������o�A ����Mq��#^p���8~�W��3�]�0|�����t���ױ����Q}��=	���'���<�����ɿ�?�O>�����Ӟ�7��a%��Y��L
`���+��"h6l=���h��H��"Ж�^���i�
�p ���tq�����c������N�A�!���L���}���^{5+s���Q�3��*I#�2�7�a�0�"��?�y�SZe	I�0�t�>c�ÔmT��������mZ�	>�xX9ٸk��f
b�B�UvTiƌ|��
%���+TlU}�8Կ��d0w�t�還��F����v�CX撫�NQ$�F��ϲVh4�#5��X�
)��C� &&��`ޞ�HW��t��^e,6���7��}Z�Sm����u|��&͂78$e"�H�(����}���1�V���UXf���+����\�9�Y��muyL첼v��D��[
����F���kZ��`G2Vv0�b�j��Y�и��p��ݐ�X���#�Y�ь�lw�ؠs�GN� dy���u
!�idv�)��2]������v$94}I�-�&�k���5�{���$.h�z4ȅ�Yݼc�^�˫c���7yX�qv;{@F��bR������8�d�]6sr��f��Ҙ?�cFcq��m4�'ь��(zn{ �8�D��M�����H�o]�#Zq�"%��n�����&���Pi[���d�Ҩ8$Eݑ�Ƅ��n1���'z��7�,�aC@x�i x�a�����T`L��J7� �Jd��]���9I��\�{\��z|�.�	�Ϲ�v����;R#x@���g�jSy�/� ' �7�4xV�����a>�#8�FS_�������Ա#�u]������f�o*�����e�o��h�.s|{���2�5�\�^�-�
P�a�Zb`����zmly6�=�����<�R
F�(R�6U��j�\�@iXgsM�W��/R��3��0K�[� Bq�'�U�2���KIr��-x�,uC ���>I�Ź��ע��YLfIh��(���〵X��2���we��5"��T6�^���[���אoF�e��Ʒ0=�!7*^{-J;��y-�[��|����R>�`��R
�g�7ˀ>��=��Y(gk�k��UT�Q��ZW���״��6��%��h��Zu�.d3'6[����Z�Z�����u�_Ml(t�M$�����ů���Z.�%�å�n&�R�AdS�A=���/"NK�K�RJ��:k{�W���v֓������ �@x9щ�	��\!����
�{��@�p�u��d�@���X�8��Q�RD�bc?��'������ v5��Z\tZơ��h�Dj(K9>%,�yQ������`J,F�vRX�Ge*3�󩍃�M��(�g�m�\�@	 ڊCDV܂��Ǧ���g���)������x7�      �     x�͚KoG����=(n?�_�m�0�o�u��\�_� �d�	����5=ӔlQ�X��z�М�X�nV��NIBY� fԐ]�1�DB���>����P����V7i��h���W7[�*������hih�3���3L���T)��P��B^*w)�� İ��Y�Y��?���������2��YS�NL���7�d����z5M|�n~/�nE�r�hG���}8�ij�B
�6"`�L'1��LAoJ�_�P�K�%�Q�ӬF�<��6�}%=P�C�>B�vHQ@HB�2"KT���9�#�m�����r?����I�f�5�?�b5.�b#�X��"･���}u��>���]��+����8|߇���{S�("ZgϢ��b�I$�`{(Q ���OH�J/2�Nq��mK�W���4���r��$G�9�|�J��)F�1�{F�p$�ZI��TL�a�8Gu���ni;��&/�Ϝ��C":w&>�	��C�8W�*!�ղ$�꼬=��P�]��t3�{��%���guB���`�(��[
���9Y8��F���=��Q�=�w��(�2�ҳ�=�C���<z��5�v$˹ �-p� y�Ap����{��N��8X����龇Y���\��
�#���)g���������}�V�r��税����=��R>���~p�S{�$ɓ�$�D"���9�d�:[�9usRa B�\�Fr�9��O���)�i�����:t����9Ǘ�7�vN))5NMܗ�;%�Ħ�[�),q������d��������U���VA�S�����6p�/^�
��~���+���P������;���i��Fv�f,��3���A�N�L��6fwt7ttM~?�|���(لԹ �i�%(�qz����q�MU[2'���PmЮi�������^��w��B�p.���ka�P�P�iၸN榷�+�����7Gu��C;�l�nn)�/T���;bg�=�a+��t*)@�w9��	b���I*�~~5Gudx���������'Mx�5��u*H�p�g�t�7� jV�'{8C�1�~�x}�ߏ�n,�ОD�;m�[�b��MR;��y� �>!��	!s��l���6h�ۛϣ��<H˲�;s8�2��������/"yb�rT��I�g�S>d�?WmĦ�A�� a)z/�eM���C�>��º��Q�e0��#Q�U��3�~3Gu�}�Bww��7���B/<n���?ah)�J!��Z$�7�D���&�f%{
��ڠ}���wM�u�Eg^:ן�u���_�;�7��Aq��0��!�eW��*Zg��}w����~K�&���e�D�g��k�!��X����[
�܉��#&.RR�9樶k����&���� {�|=2����
0�jw���og�.%^*��G�
��̆M@r�"W�y�8��>���d���rۏ��P�-���섨m6�����+��X5��?�/ƪy9��X����nx�[t��(V���j��K8�^�`8ϓ\G����`+�~w�j�v_2�O��m��/~��_`�ul��*��3 Vc�7���g%�X�Y���`�p�ژU�=�(��r����={��N�Y�6�\;�*2T�@��?���'�r͜�M��;G��yl�������I�۹�vcܑ�q�w�����g|_���X��yN�(*o+��>�p�Sf���>�����?��$�#�dϽ}3�:�^�Ѹ��O���9��TT �M��.�����Qop��~����?\|y���~�0��_ʰQ�H��8{����^G��Jk�]��Wna��\u�+L9�}v;��:�;�Y����=����������"\å�MpG������9�^�ǅ�؆p5��ː�v�Q�dQx�9�����w�Cll�&/�O�K#7A)g��{�Zi]T�"��+��2
��Na�d��%�C�9���4]��HK\���&A:�������]>+dN�"_,�N~۬�����      �   �   x�M��n� ���)*�+���îk������L˴w_�.�,��g���h��@&��L^0/�br8z�=�Ğ���RWqRĩ�S%��V.Ը ��q����{Fz�m�'��%�^i��Q�[������0�,�V�eOCN	%�q]]ٮj��8����[�[�������+H/�$X�,X`Z#0e�aV��D�8�H�=�&�N�NR��8'����7��?�y�#�#WJ�^����?�f<      �   �   x��̻m�0 �Zڅ�dR���M�&���H�3��x�$�xb3J@�
��RE���?����yr��� j^�3O���{���Ƕ=�\�� �Y���A��Ҝz�хұ���հ�p�3��	[�[4Y�D��m���9�_0�N�      �   �  x��XMS�8=ï�}+�>-)7BB-��b�\�bfĠ�c;� !�~[��Dbp��T�Sw����	"#"O����|��Y��zӚ�H.�Z�]���_�#�����&�~D�#G'��Tѿ:&�r4뗦���Z���S�Q���}4�� !��oF��X�
Iƈ��n��Y�l��;s��Q�C����cV�t�M�?��Sr{}�ܼTzO%'S 2�NM�e�i�p�v1w	W��Io���ԟM19=�n��'7�g;��\0�(���u�\����|�X��3�/�'�1�t�O���}>_9��$!<�/�t�)����Mnڗy��)�4����q9<d�H�+���l�=p��0<��s�,�i�n�v�~��Xʔ�rH>�Y(Dl�)���f	9��1M�SrS��N��p�B�{8���r:�P��X0��Y4f���S�Ju���ϵ����,��fA��#S�5��뺅�A���I7�	�s��)�塁�p"��`*ڹ~Ⱥ�̷:R,���\��O��+�\�]9P*BB�&�{gjP�7�U��-�F�V۬=xh��D2D9Q��g�{��H�d=��<����x��g]�u[�����Li�i�E�7�m�n_D�2����T�Ӯ}LVu�lb���TH EDR�)�^��Y��'�ʰ��/�m��b�mW�a�1S��=t�X�����|�wYa~��4�!�P<��ߦC��3&\�/xI�oH��Q����F�A<l�k�bd�ml�,2�"�IY SA��CϣR��M2م/�GDs�@��04&tCr[��|��:�)�t$O!{E��]Wzc���<^r���l�960aMk��� )�3��(�К��l�<�J���d���cVG�����h������6��TmdAI�	N�\Q���S|�I�`W$c���}V?[2+��8R����h��Y�>�j)�<R;�~p9�l�S��M��ʳ�䘊�cTŁ�.��6�RQ��"�]a~��\2�^A�v�,���<����A3D��A�fg�:�b�Z�� G�"/D�N)��IM�ڎ�ds*��,�8;:��
f��e<���}r�Jʇ^ݞc.W��;��3��1�u�c�ޞF%%�)G�b�Z�ձ�<�L?=눡RP%?_a���Hn��q���k�����{��W�kZH�^[ʹ�� K�d�毵��6�7@BGӥ��rZ¯�j���HС�UC�'�5�l����Ȕ�ÛB`�iv�=�}J�!G�PG�8
m�/ZB[p���F�Qk��;�l��n�'���޻��G��Uw��}�+���R���&��y�#������A�V�	 0g~; ����Oȵ���^:=u�|z�m��*#�5�	x�O�A[2Y��~"�����@ksN��ͽ�����_�b��}^se����� ͅ+�|� 4�H��>�Urߺ�#�*��A6��W�}n6����Wmd� ���}a���֍���)��y�u��A��M������?��4|?8��^��k�+]�Mo��J��D& � "��$�Ƶw�\�b�>�3�>�A�Z�*�E���u�)S��	�<��썀~��S.������I���.ۼ��>���Ѫ�����a��m����;�PP��4(�'x��z2@)�X� �=9>>��}N�      �      x������ � �      �      x�-P�j�0<�_tm�m˷�{[hnM�v�]\۵�B��*���3����I��3�i�-s:ʴ� ���L�_[���[&�A��s?����ۑ>��:��tu=�я���Nq�k���?~�g,�0å���ӉnW�twfU�NpR�q.��c	�L��UE���=��������a�r�ʎ��~�<c?-�8D��y�?�y���9=��O1d2J�t�j&�&�$*"y�qˤ�	�	��o�|���`���m�c�`3�km�2�괯��%�k2      �      x������ � �      �   �   x�-�K��0е}���j��"�#�!gfe|��0PԢxYV�߿�l�C�êM����)��9{=DWw��"g����]ň⃇�;��sV�))����/��G�<��b�I�C�>R�=��x0b51+�&5X��S��NVC2��A��3A�I��d��&!s�}���p���u+-$��6�и2P�>�7�@��{���H      �   �   x�e�A
� E��9����Ƙ]/�ʨ3 �I0��/��By��><�2�q]4	-�)�����y-V��K��W\Jz,y���љ�T��ʶ�|9Q,9���n�=k���.��Ň�p�ϲ��Uj[�7�"����/7hj�*�>�|9      �   #  x����j�0Ư���NJ��i|�n���ۮ�bd��-#�kcس���$;���I�,t$K>�����|p�a0M�`1a�/�d��.&	�I�N�ˀ.fs��}ZlA��ФʨԤ�HT�T@�5����=M #c�4
����9�k��㏂�<^7�s�/�r�S��xx�ʕ(6�{�H��{@��v`��͎�u�`���e�*e�K�q�_ 3�-*�eU���W�_P�pmqʅf6��Aa�"��.��}�%�P�L��Td�QU\cB7�tZ*cK�Te&)��P�?��F""
��x����2�����p�4�lU����Ү�����A����h9n��@*,I����P!�i �"�� ����P��T(mbkb[*.d����$.ݞ ���T[�햞k��k3�,Eqo�������҇r��LN��~s����`ݽ�A?w�����s���φ�����i�	ih������iP1S�C�#�|��ןŃ|d(ٙ�I;;�S�vv^���]{�_�̍���11n/���o�@z      �   p  x����n� ���b񿗰��t�M�QڑY1�Y���uB҃������W8�:�>�Q���Ԥ�z����c�i��!�� 2衫�XѤ������T�W�TG�*�@E���^p��ݒ. ��׹G�ˊu�CБq,�C��#GF�~,_�ե��POg�Kl�(�Hΰң�Nӕ��?UɰW/Rw�F&q$ҶꐐT䖇����6�A�0�O>ZFȳ|��O>�Aݓ��/d��\��N�Nۢ��;�O��sw̹���F*�1_,])�;~�q����
o�!@C�ֵ��{H��yR˼���]<��eA�٧���h��q���ӹ��S�)�E�H��cjå�\�N�g9a�U�ނ ����      �      x����r�ȕ'�7�)��{FP#��؈�]��=v�k�ʞ�ݡ��D7%�$UUv�"6�I�������'�NH D$(I�1� 0/�w2�\� ;�t����M2�g��AΗ�r�XM����vE���z�x�/'��U�H�0�\������d���~�7�Mڊ~��p>�A��941Y�������������v�5?\��[��-�����f6�Pk��\N�q8�g��?M����`�8���>�e�;q���!��w����?�~���/�U|�0�_·_�����xz���%�.���{�.N�9�M�.'�t	�p���Z���i����o�Y2))�{c��ʯk�P�Y|@��5�D�bE����.�u��+-�o*]�@���8k橜����ό2���-�X1[fs��Ct�m���5��#,>�E���-yY�����(�O8�į�t�/���N�%���+�h�ϖ�6�=���8��,>*�YN)������3�o�����}�ۅ^I�Շ��?�y��g����+�yp%��/+\r,��h��Yē�`�~�����qM���w?��w�;~\�//�ϯ.~����?^��߾�?�����.�~XL������H�����E[U^u|�n�/�,�������(��r�����,v�w��x��7��zO� ���������l6�G�|q篖�����ˋ����E�u�����rۄ�!�y:������;�ǁj�w�Nk��&&�c�)N��u�\��^���/�g�K��/����V�~���J[�;�G�ZO�$���?>����4�3�՟���˥�` sG���X�Gdk�2GO��N�]�`���B�@��lU倪]���]âh�	B��� [�D[Z'r0��b�~}�Ayr͛;���_g�}:X?�t���V)�����i�ذԚ��?~z���������%W3'6[Y�{C����#��?���l�7����`��b������4
?��+?�Φ+�>�)�Y�b��do�Ǉ�4̘3c�j���5״���F�X����?N�O7��bU�Khh��E�Iw*hI���Pf�����Vl�|>9� [�C�?�s}:�5�O@9�V�}M��:�_єsG��`[�C�\��u��d:��;�ֳ(����X�{��������6�n`|깵�t����
,�u�|ESΙ ;��_TCO�D]�L���GL�E����Y��I������^TZ��4m����@<�mJ�f��*"��w~��3��:�����ji�Ӫm�����7�Y��!~3�MKk\���FN,�`ۋ���Ս-��|�4��b%�B�fS �mm��n~��� �yM�/k�pj��j��Β��J:��|SBi&�^�&�a��d^��q#Q[\9�V��`q�!�TSb0�L�A��9�Vf�Z`ṫ�6�_դsF@��K��yrf 䳙P vHC�p[X�Y��6ȯj�9#���h��yr:���L(�:�5�	�O��7��kD��i�=s���⵸��t]�kI����7���������旖tm�W�2�G�����;��f���w��T
��?�&��%�T���o|�:K�Ƌ0�_i�ykʁƗ�W8�A��-������O����>�mw�����}��1�(�V:�AA5!L�ô��~��m}-����nV^Pڠ���B\�*�wE���k�2�H�fpYڠ��|\G��r��/��7z��Xٞ�_>}��u�X�q�j���gq��^]�54��Mǫ5��O��	;�VJ�7�yk��]e@�Y�~>=�І�V��I�_Ӝs6�:��b|.�&�s�Os����Hįi�9p�ڪ;��bf� >����	��d�f_n��U)��˼o�P[{&l(1$N�)�ϧ�f+����#�"�k�s~��0[�$�\��s�Or��2���|��4���Tru.b���'��8�%�8�r��R�P�/��.n*�9|��ho��0�?��W�ghl��v�)�2A�����<z�,>�U|/rʙ�>Ϟ~�[�IU�-�����xZ�ȁb�5Zj�i=ܰ���FQ�,��C��~��6P���7��WZ�"{
���?��Ƌh���{-���H8�v�J���Z?�͵9�wWA[�Y:�V�iiS�9�g��
d����i���%��^g��_�,��r��lSҮ�o��o&�W#y*��p�I���OP�N��L�w:c)��Аy�4�>Z��n+C�V��gen�oֲ@�h+6q��p��%�~�������N�]9������]勻�A�����c��;=��k�~@^��ޅ�ҿ��_�n�x�L?<��?_ԑm�W��;h���#IIr&�o��P��R�;@���`Y]�{^aO��6�ip�7u��Bu�F�B��Y� n���k�d������Q�t�-�2�b�:Kcd̯k�9+(G�B>�U#�)-`>��w'{�hQ̷ϼ��N���>)r���0��ef��y��l���������O;�vn0ڿ"�0��p���G؊!���]���f�K#�@�#Z��j?y���4�>Z���P��w����V��f�A���sGت[s�?��&�Gm���h���m�e��/ӝ�$�l  ��_j��x�e#���#��f�9u7���`��˄�Oc=9z��vO�m�.�W����ۈ��u�'�����?��yj[wtTc�g�+�l:�b�9r��|�����]"�|�nk��9��6���W	��TS{�ؑ��2��%;��J}u������G��Ga�M��#t�#=CG����lQm��j�����+�V�+s$U�C�p�gPY3�ܑ-U)l3��\�`�=�ʛa�l3��7���_�xNgg�+R��h�N:��v2։�T�3��T���xv��a�
9��X0ڃ��B���n���sT��o���=��A'j��h:I{�F{��ك S��4����0!�T�Y�F��Q[} 7�b�M�jDU�=h\�'b P򆊇9E<OR}�"o{��h�;I��y-v��>p���Z�;�vxBk�n�� ȣ�$�@8䍆��3iP�7�����AE^�1h�(���1���1����9��m��9_���܇;��vn�p� .m�{������A��J2�_G�!P�Q��<��G.�#Ы���hG��$Es�9E���T�ZD�q���Z!]�^#�rK���p�Ms�lOF�n9]G���%[����(��d�IGk��	�,#+��@k�cx�){��9�E�+����N[�'���=�C��n�Y ȣ��U��qiTU�^U�n񡌪ʑ�* �[�KG[�0gd?���Tm��}	[mEQ�Q�.��"�[<-��{�Bj�����"<ޛt�� ᶌ�њ�;�64 ���w)��A�Ed�]���9g`DZ�Q�:��E�͟3�Q�q������[��!�>,~����.ڛз�k�Pǡ���4)LsK!�Q�D�0��(MdM��2 w�ɜ�M Fd�ɜ�M�Ed�ɜ�D(����<��T9����z�@��x��K��}�Q��\��Wh�gm�D� t���M�P�G$�("�b<��9,)��b��\@D[�@�zR�#$[,=�y� �B�/a��\��\� ��>0�i߄�q���}0瑁ާD{/�h�!>z���Xm��Z:����}��+�<X�3R6\����sջ�f��ʽ�w��uo��?^��st�L�{?��oq:����X�����d����J�h~?�[�fQ�l��F}z#6   � ��T��o��F���n,��ф&�a��5�~}�wՒ�e���aZ<�}�Wt�{��lI��9�ǖ̠Age�4����*�5hm���d:k��:I�ٿo��El�F�.����^�&�o$u����C�y �ժ�_o����e����� �H��je�cY�۴v ��'��=���h"���0�����d	.����m1z�N��"1:.��q("��qђ�_    W��������H��2��1œ��BG�f��Z#yi� @��-'�,���q�����Me/
��u�k_Y&�:/�d��O�hu�%�)�Xb=_�>��zZ7V��)���On���T2�^�T����Y"#e#C�5*;U�O�ø~��Z�d�n�t���gO��P}R�?��se�C��O&���5H'��0�[�/���I-��Z�����T�W�Gɼ�(�[��]�9�m�2sR�Sqd�2�@Pb��|����h1����;<�l�����5����؅�&�i68KD9�����)f�T���4d ݛ7�_J�(�=l�fL尧a7S}�s{j܍MC)��m��BZ����3IPո]M���*���2^���%���e���<�G�/`���%�.���<��˗�_�Ko?�	�v�0�u
��֟%��oo����u��0h��Ě/�B�lY����.�u��+-XR�hT���8��f��@�ό��<���J=�R�7��f �[�e�E���]1%T$��&��~��<ڶ1� ižWmMR��y�����	=�`(֕m�m��}����������La��?=�w?���������X��N�ׇx�	۽�P0
0	��/�`~�������u�F�90㴣UrN��r�����x/��B�
�KH1@�����I8��?���Q^�s~�T����uTJ�	 �2:,Ķ������Y�K�1<���C B$��3�k��̎���i��f	� �+v����Q�����&V��s�שg�kӾ�����3P�$�{qi�nQ�F"��P���iTjO�6�sA���K�>�XK]7ڄ��R���~p� �~ 	-e5�C�U�h	{Lꓜ�h����AFB�C81��V濮�t���;��6^LW�^/wYsI��^�K��8t)�bW�8rUa��~�Xɬ�kX�y�ן�TrZ�'�T�,}�9���ӏ���~G1���裏��!;�ck�B��+���.�~��MY]9Hy-K)�X���_��MN�o�o'�ʊ6��Md�_�}�/eQ�f6�0�ﰜ���zn8k�vp_l^���j|Qݡ�G����������
 �,��/��@��y���P�|i���xu�n�0��b�\��O�/�����&\.�͙(�ϴ�7 ���vi���7?��p����,��.ꤎ�e��>��M��1��?<f�߻x7)�k{��f���e�r���jnܰc�/W�1l>���w�G7s��Sh����_���3����"�N��b��2]�<x���4�U���ט4�(��t�Z�!������1M�vMg��m�n1����(����.��MMW٤*76�����<Rh\���q�,r�Fs��w�*����@���.�8�5��5>��A��w�{��g��>��6�.�6��]�L9n�0N����P�
V�\��D �e�C��垍<U)�OL?��v?\y4����	�J��J�AW��* q,+�T�)�"��s�2����h�̅�\�=E	�<�gP���A�c7�,���J
Z���n��B�5?�3��ϞG��v��T��wF�Xq��h�c"<�q��K���>����$>�
�ӏZ׮��ğ�h��D�L�g�����
Z֐eb��f�h���2����Mnf4Y�l��k��� �H��h�? �&���p�z��2��`�'c��_�֞�����Ԃ���mݼ���5�c$�M*�v����G�pJѶ�K`�n�y������������X��]��w�g�m�=d���V�~_4m����H`�Vs,��|+�r�%l�2�v��5.�̔MQÅW����9$#����{vz���4�=3�G��t�o޼PT�Pc+R����ð���Ǟ�F�]l=yo=��o�_߶@w���$9) �ݐ�AĞ��F�RvZ�e����z�I�^��U_�P�3�{�c�������(ACY���%�$�%Z8�MP�,����Z���ݕ�q������&��, 
�N�$�, �i'l\@s����ZuҚ)4����A�g"o�)�l.k�����Χa�	ݫ��6u�+%�<��"Z_��*����w�g���%��/	hŌ�z��)��.|t���pA�FF�(�$gA�Ya�Q���}�T=2����Z�$��lk/5W2���L��V:b�[�[�{�7�l��}#J��ȫ�~@�h�ʀG.Uqk%n��.���{Ȧ_�ŋi���-�o�_}������?�SXh@9����:���*�2pC�%.���x���c����=��(�3��n�ҝy(4 Cc4�V5J�<pҮ@%����LJ��(��{L�m��/��Ӗ)=���R���1�:�1b!��偂�" 1P��.G>NT�$R{L�?����L_����Е -#E� �}�c50�q=����Йjf��:ߓ"F�� ��a׏U�r���DH��e��JN�)F�<�I���2�+��WE^�a�l���ҕ9�P���o����󖹬��CQ�������%3P��<7�AT���%�.l>l�e�'�������շ��l��0����"Y����c�(K΁�L�҃m�'R)��[�m��?..���q�6M)�/�0��P4pP�֠"+�-⾇cO�Q���KW�T�>���=�_�3����m]��<����+�m��ۄ� 	3�i�.�ux�	.�9#<��x�S8`9����3��������le_~09m��@F�g1��n8�?r}ƄJ���8�,�h����9U{��'���o#,@9����wa����0� `a(#"�h��t�F�chz/��^�U�#�݀(��Rh��R��0����[_�j;������ �1����°��-00e ��s�ǄD@p�Ǆ����U�L�_����m-�W	���Dh}�x��C
���"��؇Y:�HǿC���3l�gy<DD�	����JR���AD���1��g���<��~w8��>CW�h��� P���D�0� �DE�����q�^�lf���m6��rn��1�%��o]�8�Q��w=P}}K�HyI�9��c:�=.o�y�t��>}��1w�lV���a�܈볍(��Q��J�x��b���x��5��Cr�@C2t]�X��J��B�\�@���h��y�$>��1�?�k�`����ѷ���t�bb��#Ǆ�qL�h��ӡ���-��_��^g�����l�)�.t���Z^_���./���W����9��!x>YK� e�T�!����ezWz�M��=�D��Q�HK�ΑP�� �j|B$`H�߯n��el/���s:��:��Ni�?>e�"6"�Wg�˫���K}UW�F�a�[9�9�3l	z��-EY�^��E�vmv}I�;��t̾�	�pF
m��_Q����!2�z�D_<��B��P��NB�=��P�qh؎�	M=���.��E4��o��w�;~\�//�ϯ.~����?^��߾�?������]��v��Tvz���!����¼��{�Z��bQ��V%pc%DS`��3l/f�&k�d
�%+�Y��M�4C�]z�����{���[�����M��kQ<��%[(`�s@Z���X��.�\��<�,/��˼'�AO,�	�~G��;��Y]m���
,�y_����_dQ���۳����	t*�h���,y��q��岾�xW�Jp���<L%��\z�x�[�m�ـBBe�ni>�a�|�T�����3�@�}0r��@�X�ģ���0��ecx��w1}�k&���:���r=-u���_U�������?rrm�"!EX��@��+$aBRy��>�9�W���.�>r��"�WX�:rv�#��̧��	�U����ǡ���])9 t�\yסk?+�93�9PX��0��\�l�	Ȉ���j}A��oc�yKݽ��йX��U)��o��h    1��i�J�E�f��r0��Q��n�Լ>��$�yJ��h&2��;e1��j��p����w�l&�k�s�pDcf_�!����9��@�� ��|��2�}$˲���.#����k��a�ٙ�v�eIs��Ku�� ���� H @�l�̾�g^��٦�Mt{��(A%g��H�%���^弓�%$OC4i��)�F]��K�뀶@�4��B��k%L�#���2�<�:�g�`��G�A-�ֽKd�)h\N� �!���Q��)��ҹF��L_��Zr[���ωh�k�eI�=Ce66l��$o)�;�_>���mm�����[j�E�'��&�-���f�/���-��fI�Z���������FP�yK��1��p��`��,a%���`c�S����D�U3�c�����c,�M�7��j�]�k�`�#�+s�j	��i3K�ě��#�4��=Ϸ��ͤ9L�%v��I�+�`{/h�E�����x%�آ��Gh�*M?H��6A��t�}v\���m����j�� �-J��5`J\_7�[�͗ # y�
;.�c^��+P��3��@��r�b;z~^�vM��x&��yc�%�@n��N��v�z�e�)kt����t#,[LW���l}��-a�b�E�W$�)��1t��cЪ�l�r���!N��A�²��5��g+����U��<�~�{���6ZMF#���p[����}BFn�y�d�}��ݦr�U��.7����29+],���Ԑ�[<D�����lg<��3�q�/i���%��!녘���뵍k=Բ����L�~��iȁ�c.]Eu5�@I7��č��%��Ek��wZi���,.�*+��k装�UY�z�����m�
w��鋀�p#�K^e��ז��q���R���a��mZkH��]jĤ_��9&uoO+�w'G�=�O�"B���Y}�糅vLb�"1��#:4_�L��p��О_��#Vc$�k3�s@}�O8]p���{��6� T*��쯹iC�o�(�Á�1�,m�啁�)+=�_���|	��[b2F�΋�u��T,ؕ���#�v�L�ژ�4��Nם� �12����[@��jLQ:��a��w����6#�õr��*��c�kQ�G��iی�<F�Q�~qf8
[Hk:�b4�t��aA��|X�����TU����1���P�)�l�k.ƭW�Qu�GaA݀G̥�Gn�h�!OO�=b�~���_d�k
-�Q��>L�� �1���:m�����7�Х(�n�(u)d@C�0�c:o�3�e*�'�ah�� -AD�N˄q"�	���q����n�P°�D�=��;o�<��0��u�� {!ndhTւx߹9~Y�9Xv�W��q��DO�a����6.���+�n�l����LЛÖfؤ��@k����mC�-3\�Uf��좲W�^��^���Ӝ4�d��柩�+�e������.�2��+̤�>bJ�T���by;���T�x��T
��x�Uk%�ˬ�6I�&��X}�җH�
�>a�p�c�5�,�K�� *Ʃ
���:�ͦ˕���˴Y�'�TRmb�<�ug���4�j��_��В�&
�G���C+m��3�6��o��!&]I�pi����wY����a�ˑ���=�=-��4P�f V^N�r������y�]�0c"`n�bZ�����s�ǄD*Jdu�����'D���������y�*A
Q�&1�]�|8;h��y�$>"2D�q=��fX Y�r6���Ǡ��*��(�7�z�$-�aE��A���PV��i���`�I�*�����3�nZ��0�s�|	4���	c.�~�PF@��:�g�����e��Ϧ+d`��!"�M(,x�+eH]*D�E�'���g�f
���)�������b>�+;��1
B� �#�X�<@�K"��eu��n����p98Ye�0��Y�S ������⌢Q"Y����8�|�U��{30��()�*������TJ�4 >,\@۠Ѹ~Hu����}����=�	3<8�)]�[j�2�cn�빞<Bמ����C|�z�}u��+��n�eY ޻�<X��p.����`�A_/�._�-Ҧ�C���xZ=㽒�~��Uw8���8�ڏ\N;8ᐟ�8�LxUf|Ώ͘�Ȧ�#U���F�/�&X%v,7 
�)8c])X�k#�	�5��c#�u3�����r�DE�((�ɟN�Fߓ�W7Pz1&�~�B���&B��(b�:-���%�E�.o�z��S峛��a�Y��t��C��C�=i�%�(�ų8����O�0,�rT�Lq�&/W:Am����f��;Ѩ���]ڡݺ����QTYݑN��:Nϫv��}(��y^���G�sr��-�O�Y��י�t[Z�i�'�$ F���7�o�
��o1�� �Rm�H�*��]�|�(P�Hfc�޴OwR�_@�g��������%�zF��X�vX��X�;8h�9h���5e���%c�?�5����(�.�Rr?i��À��͡'=/ä �2nq��[�n���ljpp���M������m���={B�?��U>U�j��=�_�����ټ�
fo8DHf��r��h�m��3�z)��lRui�w�W�%�{�<�uiHt�OT�!�[�{%bN�[�Xz�����]��=O���~�N����g���Çi����~w��&u�y�l���E�s(h�M���]e��H%2�c7&wi,=W�Z�O�(�$�,A�Y�{)ϧ9%p�>�PME������4����\�pҩ!KG���t"
EAl�Ҭ�f�}�0h����ѹo��1����&����1��G���l�L���?8�E�I̺4D��G����+���Ґu�V�ꦰ�M$:�+A�(
��5N$����u����l#,نF����\�	�R�#׏�r�H���{����.JC}�`q;_��W���.^����s�Y� �B��C��ȷ�.�HP@ϗ}N|jL��D�TSzd����3�5i 	[�^���vX�T,R���m�TD$p�L�K���A{�4��Â�G�)�?����k^��Cw�x���`C�9��!$�!�*�ۭg�rhf�uA�(�hg?A,HOҖ�pͱ��m!�iJ��I���]������%���4����9m�N�i� =ɗj����柾�3��e�<�wr7n�h��@~���9�9@�w��7P�O�Ȣ���	�K�/1�Q4�J��F퍡fϙ��ݵ���C�>A^��%ˍ��8�b�T������	"A��)����Ο��w-��2}y(�����X��KT1�mq?߮Y>���`������a�f���+b�X�#�r�o����i��0�&D؁L>,��J!'�Qg���4�o�~����ឦ���a|�JagO��3k4 ؇L?����_����Z����e���'��z{m�j���"
�2S�(�m'��or���;�[�1yo�@�5���ANE֐I-l�����+N�P������nls9�����?,�p�R	r�x�я'���|�XF�~0�LJ�`KR�1�r�kҽg�r9��\*]�i�oʝ��QT7����ҭ�+��$KE�o�X���@͓���f��;�>���]�AݺC��@�U��tiw�W��]	�;ڥڭ;Z�N�	��u�0ST�Ջ�T$��m��₋����s	�MD�X�u�z���t�-�;حfZ�]u�sH�y�}q���Jfj�F �g�1��y�n[Z�g����0t���x�vH��H�;�a�;ѥޭ;^�Bw��Nvi'׀�}g:şz�\����:��o��N������prI���m���T�b� �-�:ߐ��u�L�Uڝ��lq'�1mmHv�OV��П-� Kzlj�A�i���OA����j�>3�)�k�xFY%�q�������}w-�i���̤`+n�J��j��X�%n��?h��ĺE�z���|��e0��3�6�}�i�
>����=�K/���\�.?0Zx�w�a���g��Y�5�>���5gU>�֟��d    *��]�a�^��g��ʧ?�������Qz�͚\�j�U�K����,6XYF��Y( D �^(b
N�z�I��id�4������t��U���v�rm(ƠM�~f�$h$k��5uU�q͛7�>Pa����5�������ŗ/�t�\����2����;o�޺C�K�o�Yr�P�a�T�]�^�^T9�}I=���mͺ��~��~����h���;���1�%l�@���N��	�"��A�E{�~�^3�㳽z͛�[���@��P��{tP&�A7�ER�.6�X#���m��V/;) 뤭��]��~ˉ$�d)��i�v�7��
�qU�ݯ�x�U"Ѭ�(�E*�(����(�o����S����[�)3�ƝSەQ��>��m��W��_�?|��{��-W�o �{���N��`�F��[��|��~sD�<U��F���7��=#��ri��/?�<>�x��jf��`�ǶXr#B�"���\1��4H�:{B(�iW̡+X�F3�VlV��|�К�Z������iKy^��6�?=��I�G:-s[I�b�R@Զ�qa[8�C��K�T�,f��l�7�#�*=�N����/�9I�
��h�X�el�UG]���u�j.�O���a,�2X�,"��+����X�\�n.��*�X gdE����ޘJO����M��y�\���o��£^�����\�
��ȍ���4�B7�(q#GA(C�������l�$�E����;�^~�S�*����[�����_iYy��,��/��`��<��Ŏ������xu��4��nbJJ��X��?������&\.��Eq�?�V7fgo���(�����盟�b8w��滨�:���b��*\�>f�����ү{�:�"������B3�F���X�l�b��T�p�%�ru��7�ӒE.����{B���3]L�8��JdSnI7��f#�M��ڌ9"t=Px:_Ty2<~hx�������x8����E��+����c��� �������b>�7��5PTCͷ���џ�İkd�Z�[�.4-W��/�?���X��G��q����YK?&q8���j�h˝���zyu��]F��YI���~�1��0	�7�<UxQq]J��v�0d�M��W������`����;n�G��^Vjc�~I�b2����͛i^��shu��QHK�	�|qח�4��U�Q�~�K'a��he(��FR�tiC�7���>_�����hm4���'��]�D_�����8R�G�~���'�SV�x:�az"��햖��[~�ͷ�=XgS�Oo=�Ib�R۷+e�\;�(��qf�𲖈�m�]�6�@�R_J��<':x��?;��%�v��3#"m��)ӣ�~>o���ۀ~]�6���l��BY�s"�_���}>32 r �n����A=�ū�Ȼ�R��5c0���BW��:_{��V�j�� ���I�����^���j�U�P��f�tݽ,*���ъq���Bm����Q,��^&�-����:@mu@��(�����^�2�5��f��d�w����g(ܐV�i�R/��	���.֐�g��H=�����ɰ;9ʷ%��!���L��Y}�ɰG�ɰ:F���t:�I�јVoc2�`@��]ϔ��i��g�z|f3یɰ/�ɰ��E�- s:Q�V�;�����`;G��U�m�V�?�Yb�ڞaEP�X��o��Uz(��^��ʮ��;4��Q|C�(%��r��A�o���I��J}Q���_&�Cߚ��_^}����a��S���|���_�h��թ��7��P���÷����hoʧ%��6ȌՀ�0�c#�7%� 7�|��׶'�8��K��������21�W�}��e�}(���p�a�]��**�U�U�<��5�W���{���ׁ����g�Nl��N�jI��I��T��4A��c���8�4iվ�����WJ��K|��;k�v��r@Д��v���w��A��0�"�Ο�wU1b!��偂��
A�8Qa̒HuB�^���g�W�'�������,Bv��?J�����}��p[�/⾇cO�Qȡ�KW�T�>���=�_t�O^�K�B3�B��a�q"�a $׌^�j9 ���KQ��;��6^LW�Z�I��^�K��8t)�`bPBUa� �E>��0�b	� M�Y���s�]��+!\��\1Q�E�z�U�P2�l��r�� �S�I)�"���R��F�O���z4f 4�1BvM������+�i+D�j���D~��$�:d�sU��O�(�$�,Aݖ�D/ ǘ��!��ԕv�X�r�C�����.�Q]}JĜ?�s��x��|߅<O�L�@z��%�H\"�H�3-�ĀdQj޸��0H�k�^)ΆB�^{ޕG��B��.���4���4̨�\�	�R�#P,�r�H�����T���RM9�F0��/�]̏\yX5�{��ގ�Ze���O���t��rV�i�:�_	>��3�W�S��j#w��^bv����O������e��$�折��ۮyJA�`��@��Đ����˼9��H�ӿǿ�xýܧX�;h�B�#�!7(SSF�S���V�&������f�j���,ҕ�K ^�i.�l�y���o��Pi�v�2�QC��DN*ꭴ��WiS��@��xK�ˑ�L�31���� ����$�xi;�W�yl�U���ʔ/��i��9�-�ǵY�٦�	Hn�C�9e�sqL<��d۞z�@:��U
�E=x�	�1��8��%����*� vil����ߘ�2 ����0�=eC�1s�z��6��P^�]�P��A�0�,����hc"ʀ��[*���I�!�����"u����fx�J-�T:Ր����:��:�]gc�-W5�;c`�A .̀�b��Dy�5�����<N ��±�A�]7M�V��g��P8��;f*p
06YC�kY�\��\��s�bz�S��A^jx����T��9Fז��z���]Tv�|We4�7���[7�4��b=����,�:��6��E�h\ ,�юv�v4.���wG;ڑ����+�y�юv�v4���e������0mS�hG;;�� NST+��_@�E4�5�wy�U����dq8���,�'ih�fdpm��}��ԓ4íYR[Lp�����gIզ����2��i4�Hێ��R�s�v5 ��>�N�Uл~#�����O7tV��U��!�Z��ΉM_���&����4��|z�����PU���7��}�x��x��Zk7L���t6]i�*���W��EG���Mi��eQm�����&����$�?�Z�|X���jͯ��b	m��97�Z�)φ;*G�y@���۹���R�](����W���E���X�O���37�K�۶���,`�b��l����gn��o0A���#ss�� fST�(�K8�t�ѥ 0@S����{N��_���X�%p^w>�YZ�Ae��B�h�?��X�A�e�!�l��������2l��Fk�Qc����*��0���T��{���G����*��#@|��"#��!^.��|��} ok������۲r��k/��`6c�=��\< �v�%��m)��6+���G7��ol}P���ۛ��*��;b��V��F��� .k��j��뀦K�(�Y�fBݍޱG$ۗk?H��y$��#�e�K���p`I����|`�`+W�m��k���gp[�:J �
|����a�7�s�u
#-����w����f�z%l�j�|�Q��Y���!G��4�9�H��i�O[�љ���֧3݃)��b}��S�~tn%#-&��=�#�����uY o�E�Ɗ��gu�%#-��h��\: �v�%��at��q�,5���f�=e���T6����.�>󈸵���������Mra(�x��zJZML?�����_�=�Iۂ�j��?�L^��ϋ���d��p3�Y鮱�~1�k8��n8�9;'��u ;����Q    �-�}��W{������9�G��)J&'���z��)��	^xs>
��J�U[J+��z���/��4��%	��p'�ysnu��3�U�ā��.�;���k� �|}j%*Pi��0�}��w_�oF*�w_���W:�����ƻ��������5T<�:ﻯt�8c����#s���t8cc5�W{���g��S�.��T�W��n��K'�3�z�7��AJ��tx�ε`�	;�����1�~��+�P1�[��#t6ހ�s�����g�=�[̪����a���o���efn�t����mt}��W:f��=�Y+�#��Q�F�Y�'^�A<v	��K�G� b���R���@+�U���{��w1}��5��T^a���r�^�[�寊��{��=rM��B��o:��?�ө�3�KYf���1��@�K�]?V��	�CJ!�Vгs"ݏ&�����_jA��x���ė�G���װ�+�#�ג'��]�g���܏`�ʛt	6���E��7��8�^g�pS�b��� C�0��t,�rl�," �����sg	���\��]�YD��h�ѝu��,8QyS����:0wqg�9�bPGw�kqg�y�_w(����ǝ� o��Y#K���Q�7Ĥ"O'T�-�Zk��I����]1�7D��ޥѻ��w������c��K�����n�x�eR�B��Y}��'Dϻj��ǋT�~:lgf��H�3./+"�a��a�Tޙ���M�t�r�7�>���فt�"�3�]���+v�6�v��VU%\1�F�$�d�9G�eQ��cj�P�J
X�)��<X��¹�x��k�kj�-����.�ɇI����Ե'���&��%��X���N��\ؒ��#*��U��>�q}z���捴O}�O٭)ڵOZ�B���Su��y�^�+�h�-w��X��������A��}�zd[����^ޥ�E���0󕶙tͧ�b�  �.G��RJ#�'I�&q�D(�(��J(d�B�x߃b��ꃉ_)�7j�~��7��`H�=��Aq+��Z���>�FA7�����[�i��t�<�5tc�dk7_��F��~�GT�绕b�}�\�i���x���t����̼F^�Ms���&��g���.�q�<=��?W[�(���CtE�bOG<���R
s�j�?h��wwi.R͸�{��V|��{_����^��-T��{��C���J8Ŧ`�Q� dz�+��B&���5aW�G*B�w����<5���;Z�%����/�	/X�� ̅1
Ba�\�gU,] �%��R����y8G&;�&wq4}��++#�� !J�^�
�գE
5ZQ�>Gq�lE��l��z���,� YKdG ��8}�)N��hz���j���1�QC>.�o徢����Sb�
�jޤ��~]b�I=~��c��	������R.�˕��zn7��0��|͟5��N�����%�.Q��烬>��F��g���&\y4�����KY칒��U\$�%��OW� 7�Ef�}��F{�u��DWmZ�Wˏ�יΚ���G���.�dV�Ef���ÜDG2cmR�0����,m虞�m?6#��N�֓�ݲb�N���nBX�~Tֲ���mq�[ƛ[��Z�в�->f��2f��i�(�s-e2�n=��ց4�����=G��%�k�͕Rlvk�Oa2�h+L6��Z��jZ�D�[r^��j�T��</�6On�Y<V�۸|M	�=0���}qG(�4��E���/q��cl(��\�V���p�Y�n�� �"Ih��K%�C!
�$F �+���W1/��GD�h'�W[�Ò��q�v�+1�)�j~�\�Bw�!�UK��1��(o}�q�2\��+�nI�}�
��6c~�K��Cv+��n�n��@�9
�,6��z�e�r� H;rR�XiY��z���{�j�}`RVu<@%��M�9��vU���c�q��ٲxVmͿatk͙G�Ͼ���%ك�'os��n+�=�+��'���[�G�*5wKmH����i�܈|�QD�����C{�*Tې��%|\��8��m-��p.z`��Tې9�%�l�67��*�!S/�O����XA9�6%�2����ZL[:L��-#��R"�F���0�"�O|��$��>��m:0#�o�ɻ�煀�O�o~O�;8�������c���y�F��ݖ�/���a�������Һ��̿��XP�L��e����O��A?Le;�q���|�I�q�E�J\K�**7�H�H��3�'�L�	�y��>�ˑ����P�d�8ͼ�Q���3��p�ǋ{vo�WS �������~�̓��7���Yh�4��=<��B�!��oc��?�?�M?ܮ��?Ƌ�bi�`�{�Ϧ�4��~�bL-�L)��e��@^޻)<G��d�w�<9z�i˰ eC�w�޲�ݬ����v�nZc���e�1G�-u�o������[;[�+N��[E�eH2����<[& �������=�H�-L;I�m�.��q9w� ��f	����̥h3��l/`94��4��(�'��ײ�Խ���6$s�-���m��* y����V
��%�������vnj�m�9���?(����ڊ��&�>�L4�b�)q�$�I��`��(�1Rn��&q��m��h3�e���VRI�n���1#�� `�p�X����W�59�jɒ�AT4tce`�S_�n�(�!Ѝl���ꩯv7_�P�F5t����n��ዢ؅6I�x�TWZOu���)�UIJU�1dBn��4��	C�ҋ�ɷt-�[ɹ�{^a�#�e0!�z.�� b�ʠ��٩��	Z���Z�׈]	ϫ�����4a�K�Z!�
�1BL��
��X�d��I��o�Y��`�C���D(�&̑�lr���n��~�
�6�}(9`d��q�·ƨ��F/S��t�ôN��w���ȫwdN.B0��G.��s�%���	�KD|�����g�͵�����+���&~t7����>���U�%�7����i(�+"���OC��OC.�\�?�槡����)�l犵�i�-[~�j�Zn�S��Oc����T��M���,4�`T}�5U�����_���W�|���"�
������gZ�Հ���I3(ꀚ��D?�n��/�B�d���$[��1(�D������R������Em=���j	2���~� ��Jf���"`�-��W3lע��gT�����]+'����~K�^}��g��r����=g�9�*�y�'&�y�h?&�JR�\��fÚ���K��.)��tgn.y�����/�	����~�T�"�H�M�*�iI;a���m�^�����I���{A�+���F� ��0'}��I]m�p�fK.�� ��\��×��+��"�x#����@��I�j�ٶ���;�Fg�~ѮJԝ�LIG3�h0xi��A�s�P {K���;u�ඤU����1� ɖ܉1�m��~�mV՘� l��p9n��%�6��I�.Ֆ�XG��@��d02I�1D�3�d rKx�x
��6-�m񚏧��o�
`�r��x��F�< x�O�� �@��,#_`3���4��V�&���+)���5R:͊g��(������O�������~�}򇥾��M���ǻ��~�查4+��m-;�2b�W��Eg�E'�^�y�W�셫̉��Kj���5���_�B�,R��PXd�d5{n�R��_y�Y����f�#�R�o��O3;��0]H���h�S�Wn��ĥA@]E�����q������f�J�T1�ag_�l�#�}�x�~i�<����6���N�5��F����F�X��s���Z$ʭ��3|�o(�^hYl��n1j��a���=�ږ���7$��)�{=���O=�f�
ډ(�R� W����i�
9�p��Bj�4RK��[n;�hr�}`��}X7�m}�}��."I���ȶ>��>8ݕ5�JQ�]}B}�G��٨��#T%�����u�����vS�
Q9Tl7����Y���� �	  ���ܖ�����l�"�aG��X�0�:۟s�ǄD*J�v���U���t(Q�\���C�>lD?̖^QʻD�o����f`�s*���Z��'�L\��4�f�I�B���a	R��/�_��p��j�T�5AWؓ�vx�vS�C-��
%� �*^b�r��!0��U��׌\)�Z��m��/��Sv�^�W�>��� w�I�i�R?�E,}�'b��]�!E<���)YU����ݢ���.;�������2�$�K�� i0��I盤�4�g����� �.eS9 m#�X6��˦r��V۱l�1 �K�T�0i؆��{�����*�[�8�2M&P{�^���]�	�$Ӗ�l_y�r�f�e�2�Jˠ;q�u�L��u�f�i%�H�zn%3n &��5R��JJ�cd��>
u�-^#����}؅:`���5���?��࠰T/Hyy�r*�BI�$.�s}R7`��%J���r�	�lOnȆU��6U[h`ŵK�����~�7EكnXC7���^���ዢ�4ܰV^� ��M��
ݰ&7���k������Y��5��KtP�W��|��`����2�ۀ�5FW���l�ػ�T������w���qx$��\��ĕ���s Q���zxKB�� ����˻�!L�]=t��+ū޾����b�]8�Nw�ҽ���c�.��ȥ�Ob�� )/�0�����v��(5x�]TB�bےoS��Uu6�k�޺��΁�	���>-Г�E��zң9{���J�U>z��2��>[Ϫ��Գ��̣�g�������A哷��.������ʇ�O������-̣��vwl�l���][5�2h�@	�߆��bǷڏ��M/}��8%��T3�o�G:5H�8���i+�w/��<%��T3�oDHB�Ղ�0�V�_Q���Q��O�jf�M��}�[��Ԫs5ݩ�R�K �ʎ*8�pO+�`�U�-�lv���^�{��׮�m�Pԑ���<���]|���m���9��'�z*��P�sT=�C�T�M��y4�����%F��8TO� ����z��/9��)��$+x�Zi�Z�f=S�N������lv���/�����g\)G_'��:V�9�J9�rIm
a\�Y�u��9��)�T!�z�%8��R[}3�^,CN_1#��/�rg�!'<P�����r� �r�m�5ԅsl�7�F'3ȆbΣ�����[�3F$����[5z�N�[���$����[u�*��'�.	�UG���^�!wi�V��Jg�I����U��B�j�͟���<�UH�t����UG��B`kpڏު#�V!`5x�Go��y�@�k��g�OK'�~(vq��Ke�� q�b)?�Ǥ�J�8i|Φ��'�]��Y~�Y�%���b�P��2���'~�ZgZ+ì�t��I�1�j��n[�3�@��\?�SZBfy��&��?3I�����?S��X�Rm����*E��ӿ���������P'����4R��7�>_�T�7��it�vr9$&6�[P:nL���E6�*�HE.cq�RN��h��0�(B�ז���x���c|�Ty���9�Ő�)uԏz	�<��#pd�BZ������y�;c>̗�q�Y��R�wv���0�O�槂ws>��L�����xu;״~����]kr�Z=\��l����ruM<����~�(�|�#�ї�?�y����q���IBe��(bJ%X�1P!a��$A��EZ��Y}Hio��������ޓSB�~(�}}��%�����#){"��hS�&��|���n�HwDAļR«܎�ݎ�cЁoǨ�3,ʭ��♇�r?d��c����3s��r^k��_O����\�.N߫�Q���m6b]���)%_zމ�c�Қv]�W��ֿ7�2�~����p�?u��Qu�_`JM�޽���=|��0��n��}�����oq������;M'�6��2�	�N���So���V��x�y�"�br���gݗw>���ب`	�߇�(-�8	o�J�r��4��}�-sL�4���ٗ�b>KK<)<�(P�Kc)��e��У	?���/[�v�f��p?��i�_QSM��-�
6�+�����}7��t6�bW����uz�R������x�������/4������bD\~�����w����M�/~�?�~�6ϻ�+D����w~�/��O�^��4K�ٵ�ӫ^�@S���㿪������w����>���_��/�a�݇_�o�M���C�͸��~�����̿��ѷ���?�����|[7�7JWv408���ĩ]�������+ʼ�_�V
�\�6� P�8���KX�g�Q�(	 ��(�=��#~�ۓ��{E��2����Yiy-7��_|�C�"�uq�'08.�?wˋ(@D�Y�ņ��E��"��������k�M      �   ]   x��K
�  е����(���@'b��"����-�&-����޸"�*�A��H7U��l���S���2w��Jy�NϤVY8yX9��F�      �      x�͛Ɏ�H���UO�ntS�y�^qIq&E�h@ �y���[��]��P!�o�U8���1�sϵk��w+�"mGn��B8����]�2����Q�Px��VŠ�7&�[c��!&#C <���  ���RE���G�7�1 $ ��_0��'�����	|����vq�������"�'��5�j��Mb��j-�Se���\8�5��0a	�?� 5��+7ԗR�I0�~���� �3��E]��a'�ǿyEw��Cs^�q����?p��~l8��?辯/��b�C����7�쨗��QU�CLU��?�|��7��7�?�0����[�|����~��	bط,�}n'0�q�0r1�K���*�H���2_iS���A��<�c"c�&����q�#Y�/<��/,�t�qg�L+��q x_K�O�\C{�9�#o,e}H=�x|2A�p*�_�V�e��A���,���a�v���\�t� ��Jʠ����$E��V��ݥQ�B�O�ؓ?O-��CY�Я+K�p�>b�[�,4x����\��f�#7Žݑ�\8C�ǆ_yt���r�CY0��د+�'���8���ѕe�$�r+e�0�Q��E��+97cTI͟��E��~FD��,��ږ�_�] ��y�muU��;I����n�a ����Z7��&�f�z(�஦�eA�����,w��4[?mм��8�5�\��vV.	�Ⱥ�:�s׬\#�R�·����|"F}!�	C�_W���h ��0��`g�sM_�sו�@�Wb�~�g>8K�l�e+<��,q"��ҝMPN��f`���h(�zķ1(z���5S;-N�f`�����A<��*���L"��LܽT�A�+E-J���p���!b�P2�"�W��*0����H1�ac�^,���.��@�BO���z�+�w]��hC1h)�v~%k�1�<��>���bV8��3�`?2	�!�p�З�QȻ��򃈣�l�q�1���~u�0�U��9 ���i�˷s4ƅ��T
�Tֳ<[~��/��B����g���ٮ�
Э����?�*R)L޾���L;
��+��6U�k��������}�_���S��|;��Q5�@�I�WNb�>�FBl$qp��Z��l	��pA�?{�4z"��H�ć�Y�k[���<q�v"��r<����%d�:�-;^��ڠS����fHz�)vBѷ�!}Pӵ�����Ԑl=�G�;Eq���� ���Q��z?�b�L���m� �/��@�bo{b�a�m4��i&}�|���8V��	����e$�<
x-O��ǵ����~�m@��S�9��=&[�e�^���+���m:w�R�Z�'���m�G;��b��y|�B�������`���-��e������ȭ-X��$&��5{s�.��0�2~�KB�HL�h�9�א�g�`Jx��[�Xn_���4�>�՜�����tu�L�O��`'��c��Tk��>5X��o���a!d��J���Ui�;V-ޅi��c}��=�"e@k4Ɖh,u����9xX�����_-��O�j?�E%��-�n���)�i��Q�� �~J��U����u	7/,hf�@9�����SyWA&�C͡s��
����J���c�ѩc_�s=6=�K=n ic���⏥��Ik�O�#y��@Ȱ�x�
Q==O��E} �%�[U� ��+�8��_��Hb�����?��;.�a��G9N�=�BMcXƪ�@c�J��X�6�ZP'Y�� k��@�}�,��wX$�V��Nq���_��M���5��%�&8T��QZ5�~.�Rn����6N��
h<�`/0��ކTe;5�;h!��ۘ��5s�Ԯ!�~����祝�	��:��O����E7>�_$�[�x�'8���Y�B�A�-�`*a��x_�<��ʐ~w�vq~m�����%�������T��AV�U�Jř��H/R��^� �5�������@��",�r�F�>'z����bB���Ϲ�l���"Dk�7'�s^����wK��s�}N'c陨���Q�[�F�6�	�V���y���
W�ŋ�o>?�U����{r@�U��ȅ�S�0���	yz:	��
�*~��I�Yo�Gi��+���d�H*��fѬ!��\&��:�b������*���qT��3pJ�Q�l�}ן�p�J��zQQ� �"�u���!���=�Ð��ŐP�"*2��ZS������-3��k��q_E}��V���w�2ז�.���u4?]���	�v離3XMe� �H�l�	j�`��O�8�kr��8���
���h�ր�A_(xB���Z�:*���� ��Z��vI�=��/	��Jg��%�C�)r�x�m���f[��%�&?��w"ऻO�ZGh�!�5FZM/T(�~��\:�Z{ٯ�6�RI�S�5\�p��?��� �_����e����r�}��@&dʂ��7�����ށ�[�a=$5.���~���z�uF�y��;. Ũ�5od/�D��i����m]�x0ˣQ��M`Rq��C�l�f��d���L0�FN8�6� O^ n�8&���ҙ�$�D�k�Q���&;��{��[�q.>�U��1�fQo�O�^y~���T�*w20q�:���gP6���A�v�������A���Z�d��u���g/T� {��Կ w�b�rs�.VM�C<zh,�ǐ;kb�7o ��+�IiU�\Y=-��ř�_v��O`$B�k��_�P��xEyU�T�W��}T��F�3�󱣦q���1�Qd�	*��>�~��uz��>���Wi�������2�{C"W�L����� ���iy#�ẇ��nWd�����[��ŗ�{�co�2��ݶx�k�K���A0A��aE��U����7�ID�l�O�P��� �>� T�VV��d�U��)�'�+"�*�>���t�X�K��ല������/���W���~���i ���m�<���|mY�u�"�`H�V�[��U���%�~T�������}�s)��1Nk)��?'�2�%�4���f>Y�釈7�siC��+h���d�(���~�z���|��CgL�S�d���E�K]^�H����Q�zم�=S�~ �|�c�Q�9������{����	�O��`/bjX*^� ��&�ڨ9t��|%����dԳ?ZJ���W[+�I�ݸ�K{�]n�s�?���ܾ ���j�2x�
�I��P��Fǵ��ٻ���z�������BP^�9�v��f�Q �V^��Æ�����P9��df�s�I}B] �#0���թ��G��#XiA�a�e"�L <��7rM��X�#)
�R����_4)�ϡM|�c�`/�mI*�� #�ow�ՠ��\!:T��N���ik@��,�5�t�X}��VǦ����o�ő���7C0tI:�6�E/E.��R�#=�)�1�����j/.9����4�`�	��1ŝ"�\ۍ�~�ŵ����l{�~8@V��3F���o�je�*�e������P�G`��������L�<07Ӫh����!��?�^�+��XT;ǜ�3,j�l��HP����?��WԲ\�h|Z\Bػ�Y���E���� ,��
�q=ܘ�&�k-��)��q�������f� n��g1�0����1A;�3��q�o���<�k0� 3��H}��]�c�g_Ľ���{a�E�u��h��a�Ă�U�*��<QNܬ;��rr�/u{�٤l�gb�\zX��M������/�y6 ��qd<F���V�]�d�g2j���ݶX����%}:
�fge�<��;Ô9�>{��}��s�z?(�jfAC��1D�yw��M��!ش.ѫ�>{�yp�z�WP9��9o���;F���ƿmq�� �� �+/�x�x��G{__[�����Xia(�7^�z<"��?#O�7YIx����@E.��`i��sꦅ�����i%N�@�1�,U����5��f��¾{ �  ��ݮ�(�4�Dw���B��Mp7Ñ6LF�)X���vb5���|��}����}ȅ�H����/`v�m����� &�q��~{��LPwB!��A���CN�J��UT-��g����x"��0A0ҢQ�#�Thn�[�Ǚ��b�Q��B|�|lT.ī⢐2��.�/}
F����ʼ��;�*Y������w�~Ơ%gvR�Y�Oc/��أ�Gl-V�K�s޾4��_`��`��b��O���<�qVV�sXm��4J!<���s߶'/��&�^��ڮ�7oL�x̟���U%Τ�ѥy�C�jw���9�uhp��y�vዽO�Va)��u�1���������<��_��rehp�� �Mu�=��jI%�Weɕ]2
�m
dbW��P�l_�F���S0���<
I,��;��bxk��E(���l��c4� �;����޻DЇ�F)0�!߁z����+�{��j�n�6(�I�GT$Ã�����WH0�f�������iw�?��vH�DW׬T N�D�H9d��hb��n�;fblS�D>��!D${�<���n/���u����╏�h�dr�F�W�1(�M�����Vo8��ńܥ����+�L�(���?��g�o�p��<p(� �C��هk;Ć�\�{��U4���7v+e��c�,�^��炿�+����ۂDJ���m0Ҳe4D+�l�alP\w1VF�a����Ut�M!�G�{3e�ٸП�'�z;������U[���1�
�DZ��v�pAv�-�mf�#�����7�
[��>������b0���g��P
Ç�x�F8s9����vx���c�T3\&�u�5aץ@5  �o��ہ?���~���5��������� +X�C�Ƣ�x�� F���:��lR9FK��eVYL�W����W�|{(Cޡ*�>d M�2>Kck�2p#���L�y���:�,M|
��˖����ף|��|�w����;�Ek�����X��W`��S*�t��6ZS���B_{�'�߸���\0x��`2��7��k�������೘����2T�Yx����:A��#;��}̺�"�A�?��O��GY��kt�4˱2��Ҥ�I�Θ�\�D���q*�̞\��	�n��p� L��^f���\��U�@#|��9��+�m!����BVz���/�ijVm�𥹗���D3�T��������~NT�_Q�_Y��^���������D�{      �   �   x�]M�
�0����t5r��*n>p�Eܺ�7�5S��$����p8/8�|G��+�,;�w`���UQI��!@Y9��[��p����ˁm�h
��z����[/g'���u�Qӵ}tb#2cU���O�-"�4�� ̵x���,�������<�      �      x������ � �      �      x������ � �      �   �  x���[��0��ï�C�X/vl'�JHK�l�U�V���	�� N`��u��J�R+�f^f��|:P�#W�2�1��F�F�*0rBi�T��ֺ�GkW��u���q&��>,2�ǸȝD�Mq;뺔b��t�]�%�ُ��K�Q���s�V����l��0nts��b~Ω#v��ଷnm^'m�U[/���M�hK`�<�
�$� ьNX��x��R�ۺ
��	9�{����	����\g]^�YJG�N͛��C�E�+�\ C�(F ǔ $D$�Q�\k�uh���_ow�ZW��x�b��H;���ȯ�'{9�աҟ�&��pƷv�邂�|��<H�������hx�y�Sd����q�\�����/?k���:;�qq�8��#�x�%�\YFW�w�d=���T$K�A�*�.�ƴ_�K<����%�1��5=�QP�s�������U";[���P;`�����x�o�Z� �p��      �      x������ � �      �      x������ � �      �   �   x����NA뽧H�|��?{�� J��iַ�*"Q��EBI���S�|K�L6�m� �k��hcʫ��Y��0�I��sV~B�"�Nk����R�I�P����/.+����g�ޔ-�=�\��^.��q>�KZ���-Pe���G@/�Qĺv��?
ꜫ�^��wK�Ƌ��zeAcJ��F՛]�3͂���1����xLL,���o�n�F����բZ����4M��Ny�      �      x������ � �      �   �   x�=��	�0��j�����d�N���hV����/������S;��s���YG���&���C~2VX�6�ЗI�
���x�^���x�^OhYYVC�5�e�,A�� �:!˺ ˺!��,�B��JG��*-Uj���Oi�SS���ܑ;rG��y"O�<O�'�D���7���f8      �   h  x����n#7E����> QU��?`�M� ������eȞ��-;�F�1�6���K��M���U�bF�"MIf�)���D�U�;ę`6��o �e�a6f6��څ�;~����P2甔M�/�LU;a1R�J+az�;���ޘ���s��F�;i�U��𰟚��M�7š4زｍ%>��&s�Q4�'��ht��_�?����b#P�J�}�L^��AE�*�Mѝ�e����5�'�����?������qj�e��+K5+�Q�Zz�C.=�Hgs��\fc��O\�fs����~��O��j�U\=��%��bi�/��n��]���g��������~
�Z��'Q�/1���,ιk��:��:X�j�3�s*��y���'.]�U g#+%��5v���a���>R4}��h���8����o�X&ω]1I�o^1AT}*�ŉsI!�E��/[�I;�y��=X�^'�]�z`I�\Q���y���1c/��RJ�.��h���k�2Y�p��~ ��珸�����E����ԕCV�`���yl�a����{;G�Qq�V{W{�-{�`�f�>�O������ߟ��˻��P���-���5���;����ޤ��9,N��tiq�0-�y�.-��FO���G�����,��JԮ��L�i��VH��Nl=ԿEy��GhXA�2>I�}��
څI[��+�[�����0���Ah��{����/$ؑ0_�a�+�ǌ�$oQ���94v5˴08h��~�E�w������kr���KtD�
����9_G�l���tFe`���:H!_G���o@�8���u�.�Q�W��:�W����W}ss�ц�/      �   #  x�%��1�C0~ZЖ�#p�q���FM���z,�+�7���K��wGo��޿�Ƿ�)��\.`F� �#	{��}�hؿ�r /���5�%����ƗE_S�p+5fqQ���\����WVȘ�j1ۏ��1�?c��3S�_"����3�ExD�M�]��C����4SĿD�-�H�y�f2�?q�"�W��8��AxD^;9��K�'�uXG��"<�,�n����xaO>Ex���"��q��~����d��~����y�%�8�L��Y���W�V��k�qCq	h�7E����B"���"�W��i�xD�
M�M�+^�p��l8%�q5 ���4F/��jT��oJї-e�r)�Z�Η��L�(�ɠv�~�d�(jH���R�/�hz&Jߖa֘2��b�{֌6"ړ�مY�)E �+�DK�@tP�O}�I�d��i �����=�E��i�:�����"%K��)���q��2z��Ǥi�&C'ch �w�^O��ٜ�mk���2(�2�2���'�	˪��?����      �      x�3��!#C=������ 0��      �   �   x��̱
�0 �9�
w�p�˥5���N]�6-�@�Q��W��7?R�]a���3��'p2�If����dǤ,Z�`݉(�x1^��/~�5�VFm���:��[�Ϻ���4]��ވ�����򩥕���`��_X>      �   >   x�˻ 1�X[��H��z���0Ƀ �EZQ6i۬H�m�c7�j�E�A�q�������>	�      �   �   x���=j�@��z������	ܬ"�$vr���:
L���Mɕ�5�9Z&����2�,_�GJQ�Dܼ6%�U?���9n����o��ĩ������挵�x��^YSEJ����m�'�؃�B�FU���R���e^��TC��U\P,WQA�>��߯�{�3�~3�w�      �   �  x������FE��pnP �d=�n���lg��^ކ��3^�K{{��d(�dy�KP�ЁCj J�:PD����<z����*����Y�z��>����v��_7�"c!�u-{�Xj��I
ۀ�u��Hn�ko�/�Svr�$�Q=J�W�%c����S�=�_a��w�M
[�� aL`U*��=���0����hX�8���������q�ȑ�+� �J���d(�dŒ؈S�;9:��	+˒$o�>��ҿ%��b��H$��w�T��VJ8�j��b��Sr�^)�L���fO���{�����+
떮���P�L�a�>�U�@�V������y���r�.�`Z���s䭞d%Z�����|~�ݮ� ~��D\��v*��9���{�P(�h>̏o�E.bɫ�e��(K��L�t>���ڷ�Kܴj��:en���u�Lµ�;�8:6)iE]$�m����<��==��y�RG�%�/�¶R9OM���%�R4Jp��"�&�+��r��;j�0T�C�JA��� �iO�4�_ը�Ր,B|W�]�z����c�:})��f�h`Ch�Rkjs��7�C��G~a�wA��=5jѬB/�Ls����p^�d#�&���r:��_��L     