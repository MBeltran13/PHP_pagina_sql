PGDMP                  
    {            ISPv2    16.1    16.0 3    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16399    ISPv2    DATABASE     }   CREATE DATABASE "ISPv2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "ISPv2";
                postgres    false            �            1259    16581    cliente    TABLE       CREATE TABLE public.cliente (
    id_cliente numeric NOT NULL,
    nombre_cliente character varying(100) NOT NULL,
    apellido_cliente character varying(100) NOT NULL,
    direccion_cliente character varying(255),
    telefono_cliente character varying(30),
    id_empresa integer
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16575    empresa    TABLE     �   CREATE TABLE public.empresa (
    id_empresa integer NOT NULL,
    nombre_empresa character varying(100) NOT NULL,
    direccion character varying(255),
    telefono character varying(30)
);
    DROP TABLE public.empresa;
       public         heap    postgres    false            �            1259    16574    empresa_id_empresa_seq    SEQUENCE     �   CREATE SEQUENCE public.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.empresa_id_empresa_seq;
       public          postgres    false    216            �           0    0    empresa_id_empresa_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.empresa_id_empresa_seq OWNED BY public.empresa.id_empresa;
          public          postgres    false    215            �            1259    16625    mantenimiento    TABLE       CREATE TABLE public.mantenimiento (
    id_mantenimiento integer NOT NULL,
    fecha_mantenimiento date,
    descripcion character varying(255),
    id_servicio integer,
    id_personal integer,
    id_tecnologia integer,
    id_empresa integer,
    id_cliente integer
);
 !   DROP TABLE public.mantenimiento;
       public         heap    postgres    false            �            1259    16624 "   mantenimiento_id_mantenimiento_seq    SEQUENCE     �   CREATE SEQUENCE public.mantenimiento_id_mantenimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mantenimiento_id_mantenimiento_seq;
       public          postgres    false    225            �           0    0 "   mantenimiento_id_mantenimiento_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.mantenimiento_id_mantenimiento_seq OWNED BY public.mantenimiento.id_mantenimiento;
          public          postgres    false    224            �            1259    16606    personal    TABLE     �   CREATE TABLE public.personal (
    id_personal integer NOT NULL,
    nombre_personal character varying(100) NOT NULL,
    cargo character varying(50),
    id_empresa integer
);
    DROP TABLE public.personal;
       public         heap    postgres    false            �            1259    16605    personal_id_personal_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_id_personal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.personal_id_personal_seq;
       public          postgres    false    221            �           0    0    personal_id_personal_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.personal_id_personal_seq OWNED BY public.personal.id_personal;
          public          postgres    false    220            �            1259    16594 	   servicios    TABLE     �   CREATE TABLE public.servicios (
    id_servicio integer NOT NULL,
    nombre_servicio character varying(100) NOT NULL,
    descripcion character varying(255),
    costo numeric(10,2),
    id_empresa integer,
    id_tecnologia integer
);
    DROP TABLE public.servicios;
       public         heap    postgres    false            �            1259    16593    servicios_id_servicio_seq    SEQUENCE     �   CREATE SEQUENCE public.servicios_id_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.servicios_id_servicio_seq;
       public          postgres    false    219            �           0    0    servicios_id_servicio_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.servicios_id_servicio_seq OWNED BY public.servicios.id_servicio;
          public          postgres    false    218            �            1259    16618    tipotecnologia    TABLE     �   CREATE TABLE public.tipotecnologia (
    id_tecnologia integer NOT NULL,
    nombre_tecnologia character varying(100) NOT NULL
);
 "   DROP TABLE public.tipotecnologia;
       public         heap    postgres    false            �            1259    16617     tipotecnologia_id_tecnologia_seq    SEQUENCE     �   CREATE SEQUENCE public.tipotecnologia_id_tecnologia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.tipotecnologia_id_tecnologia_seq;
       public          postgres    false    223            �           0    0     tipotecnologia_id_tecnologia_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.tipotecnologia_id_tecnologia_seq OWNED BY public.tipotecnologia.id_tecnologia;
          public          postgres    false    222            2           2604    16578    empresa id_empresa    DEFAULT     x   ALTER TABLE ONLY public.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.empresa_id_empresa_seq'::regclass);
 A   ALTER TABLE public.empresa ALTER COLUMN id_empresa DROP DEFAULT;
       public          postgres    false    215    216    216            6           2604    16628    mantenimiento id_mantenimiento    DEFAULT     �   ALTER TABLE ONLY public.mantenimiento ALTER COLUMN id_mantenimiento SET DEFAULT nextval('public.mantenimiento_id_mantenimiento_seq'::regclass);
 M   ALTER TABLE public.mantenimiento ALTER COLUMN id_mantenimiento DROP DEFAULT;
       public          postgres    false    224    225    225            4           2604    16609    personal id_personal    DEFAULT     |   ALTER TABLE ONLY public.personal ALTER COLUMN id_personal SET DEFAULT nextval('public.personal_id_personal_seq'::regclass);
 C   ALTER TABLE public.personal ALTER COLUMN id_personal DROP DEFAULT;
       public          postgres    false    221    220    221            3           2604    16597    servicios id_servicio    DEFAULT     ~   ALTER TABLE ONLY public.servicios ALTER COLUMN id_servicio SET DEFAULT nextval('public.servicios_id_servicio_seq'::regclass);
 D   ALTER TABLE public.servicios ALTER COLUMN id_servicio DROP DEFAULT;
       public          postgres    false    218    219    219            5           2604    16621    tipotecnologia id_tecnologia    DEFAULT     �   ALTER TABLE ONLY public.tipotecnologia ALTER COLUMN id_tecnologia SET DEFAULT nextval('public.tipotecnologia_id_tecnologia_seq'::regclass);
 K   ALTER TABLE public.tipotecnologia ALTER COLUMN id_tecnologia DROP DEFAULT;
       public          postgres    false    223    222    223            �          0    16581    cliente 
   TABLE DATA           �   COPY public.cliente (id_cliente, nombre_cliente, apellido_cliente, direccion_cliente, telefono_cliente, id_empresa) FROM stdin;
    public          postgres    false    217   Y@       �          0    16575    empresa 
   TABLE DATA           R   COPY public.empresa (id_empresa, nombre_empresa, direccion, telefono) FROM stdin;
    public          postgres    false    216   G       �          0    16625    mantenimiento 
   TABLE DATA           �   COPY public.mantenimiento (id_mantenimiento, fecha_mantenimiento, descripcion, id_servicio, id_personal, id_tecnologia, id_empresa, id_cliente) FROM stdin;
    public          postgres    false    225   K       �          0    16606    personal 
   TABLE DATA           S   COPY public.personal (id_personal, nombre_personal, cargo, id_empresa) FROM stdin;
    public          postgres    false    221   )K       �          0    16594 	   servicios 
   TABLE DATA           p   COPY public.servicios (id_servicio, nombre_servicio, descripcion, costo, id_empresa, id_tecnologia) FROM stdin;
    public          postgres    false    219   �O       �          0    16618    tipotecnologia 
   TABLE DATA           J   COPY public.tipotecnologia (id_tecnologia, nombre_tecnologia) FROM stdin;
    public          postgres    false    223   *Q       �           0    0    empresa_id_empresa_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.empresa_id_empresa_seq', 1, false);
          public          postgres    false    215            �           0    0 "   mantenimiento_id_mantenimiento_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.mantenimiento_id_mantenimiento_seq', 1, false);
          public          postgres    false    224            �           0    0    personal_id_personal_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.personal_id_personal_seq', 1, false);
          public          postgres    false    220            �           0    0    servicios_id_servicio_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.servicios_id_servicio_seq', 1, false);
          public          postgres    false    218            �           0    0     tipotecnologia_id_tecnologia_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.tipotecnologia_id_tecnologia_seq', 1, false);
          public          postgres    false    222            :           2606    16587    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    217            8           2606    16580    empresa empresa_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);
 >   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_pkey;
       public            postgres    false    216            B           2606    16630     mantenimiento mantenimiento_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_pkey PRIMARY KEY (id_mantenimiento);
 J   ALTER TABLE ONLY public.mantenimiento DROP CONSTRAINT mantenimiento_pkey;
       public            postgres    false    225            >           2606    16611    personal personal_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id_personal);
 @   ALTER TABLE ONLY public.personal DROP CONSTRAINT personal_pkey;
       public            postgres    false    221            <           2606    16599    servicios servicios_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (id_servicio);
 B   ALTER TABLE ONLY public.servicios DROP CONSTRAINT servicios_pkey;
       public            postgres    false    219            @           2606    16623 "   tipotecnologia tipotecnologia_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.tipotecnologia
    ADD CONSTRAINT tipotecnologia_pkey PRIMARY KEY (id_tecnologia);
 L   ALTER TABLE ONLY public.tipotecnologia DROP CONSTRAINT tipotecnologia_pkey;
       public            postgres    false    223            C           2606    16588    cliente cliente_id_empresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);
 I   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_id_empresa_fkey;
       public          postgres    false    4664    217    216            G           2606    16656 +   mantenimiento mantenimiento_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 U   ALTER TABLE ONLY public.mantenimiento DROP CONSTRAINT mantenimiento_id_cliente_fkey;
       public          postgres    false    4666    225    217            H           2606    16651 +   mantenimiento mantenimiento_id_empresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);
 U   ALTER TABLE ONLY public.mantenimiento DROP CONSTRAINT mantenimiento_id_empresa_fkey;
       public          postgres    false    225    216    4664            I           2606    16636 ,   mantenimiento mantenimiento_id_personal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_id_personal_fkey FOREIGN KEY (id_personal) REFERENCES public.personal(id_personal);
 V   ALTER TABLE ONLY public.mantenimiento DROP CONSTRAINT mantenimiento_id_personal_fkey;
       public          postgres    false    4670    225    221            J           2606    16631 ,   mantenimiento mantenimiento_id_servicio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_id_servicio_fkey FOREIGN KEY (id_servicio) REFERENCES public.servicios(id_servicio);
 V   ALTER TABLE ONLY public.mantenimiento DROP CONSTRAINT mantenimiento_id_servicio_fkey;
       public          postgres    false    225    4668    219            K           2606    16646 .   mantenimiento mantenimiento_id_tecnologia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento
    ADD CONSTRAINT mantenimiento_id_tecnologia_fkey FOREIGN KEY (id_tecnologia) REFERENCES public.tipotecnologia(id_tecnologia);
 X   ALTER TABLE ONLY public.mantenimiento DROP CONSTRAINT mantenimiento_id_tecnologia_fkey;
       public          postgres    false    223    225    4672            F           2606    16612 !   personal personal_id_empresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);
 K   ALTER TABLE ONLY public.personal DROP CONSTRAINT personal_id_empresa_fkey;
       public          postgres    false    4664    216    221            D           2606    16600 #   servicios servicios_id_empresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);
 M   ALTER TABLE ONLY public.servicios DROP CONSTRAINT servicios_id_empresa_fkey;
       public          postgres    false    216    4664    219            E           2606    16641 &   servicios servicios_id_tecnologia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_id_tecnologia_fkey FOREIGN KEY (id_tecnologia) REFERENCES public.tipotecnologia(id_tecnologia);
 P   ALTER TABLE ONLY public.servicios DROP CONSTRAINT servicios_id_tecnologia_fkey;
       public          postgres    false    4672    223    219            �   �  x�]VKoI>��n�@�E�zm'qƙ�,�`�������H�;hII���c`�0 �H~/2��+�)��w_�S=���n��^K���xQ4�\�$mT��ڈ/�H�t���4��~��;҇i�.|ɞ��0;y��)��s"�M��duL���_U�X��4����wUZ�����^��J"�M�!x����G���O�>�+>�Q�x��J��jRפ�P,'t3֡�v��k�Fd|�2�����NB��XR�S)���#���qS��&S8�K�
Ji5�7�D�(��u���i��a8�B<��Cz��x�^=I�B.�/��0Wz5=��ә`�Z����,H���w.�]�����t�ti� ʜM�ܲ�@�	���0}8�7 ��m�W�����0M3-��u�p>�6�W��@_�J��|X��<M_;�ϟ�����R.�s.(逋�%}r>:.�a��{ s��1��4��C�h�M1 �M� 5߄�=;�]� �Ho���n�̈���dP��(;<e��d�������o���ч~���b��g���`+9317PRp��
��*�7s��"��`� ���z4�^S�ܰB����G����0?����mT�3� T��Yɧ&��<��;���9~�ҍ���FMt���%{u��ј�1�=t����4�7�?�z(�u`����c3�P�#�_�OW[���m4Gt
%�N��c�̮ �{�x���z[��瘂M������W)DD@r��jG��i���q�i�谚�U�$�AJ!D4���p���i�o~TLx��;�@� H��D����F�� �G������k�~�T2����'hC�BD�7C;�L7Oc�К�զ�ϐ1��a���P��4^F��#=Tx��M��0
-Ղ���1j�a*��o�gd�nS�hh`�z<O��Ȝ1�DX�G&���K��������^s�#ޗ޼,�\���c`R�|���#�}G�P~�"�<3�o�^�,F�ff|�'d�xOu����חV��)�~��j5���2ӻ#���մ}�J�LuJd�U<�
4�]p�͈��Pκ�o�q����*�|]<%_�9fQ�X�v�� ������P���.�;=ĒA���z8�D�2�W-?L������_OC��H���ۓ@g�Ւ��C��p�m�w���)��V�r���?1BB���\'�����ЁT�c����w�"0����i
l�����ai ;�!&Wu~2�������1@�P)�/��0 }_s���i��|�������`�S�������a�+�Y/v�x����\�52;�׬mI����,U�Y2����X=�]� �f@�U��_o�y�+B�gÝ��;\�����H�DL�����+l��~����"��Jh��-��`{	�o�8�0�ߺ���%n����|�DkD�*���z;0���
��L ��(�V�!Bę�"�y=<v3�%ˏ:��_�zKt�z(�85)A�G����~�WmO�Ы�,y��F�DZ�3�T�N��pI�����DP^N=�x���b���t[a�n���K��E��Ղ]`� ��γeV����Lz7�z=ᣥb�+c:ז��w%m����r��?�6�Ի��������j��FX�t�yXG8b���Σ�Oa*�l32=n1����w�4��0      �   �  x�ETKo7>��6�H��Z�H��������HZÖؿ��J{�Iܙ�9��O��D�<�]��M�r�p�h-���m:�>�bt'V7Z����9��/��Ӵڍd�D�1��v�S����=�iv�����-�.ZMQji���m�*M�uK�[���,��t�{�����.8[4+
}��=G�y9p���-T��^7�iM�*_'�u %Ǧ����WOJw�� �5C����4ၥ
��0!7��J��Hș����
C�uq#���S�2�����_�7��Hկ�`�ޢ�`�\�4�����o��A�=��y 쑒����c���>���;c��s�$��4�l�w��� 0�|3�.�)<
���z�_�,@P����W`���v5��߹�hir6������� =.�kF.=[�����N>�3��xA�g�:=o�~t����	|�XV��L���8�hjef!9�%fM����t|{)����xQU��u^��N�5���ڐ_�*1���z���k��5��<��Zv�8�Ɖl�Cٱl���Ч��:��<#mie���������j?�(x�9�TS
E���tIf�Z��Q�$ѯ�~���x���!3Z<��U�'�S�	2��@j�;���ҁ��j�[�j.V�M���C-�����b��h�~;PIW���*!V����q�-u�9����=<m֯��~,w�3�.��V�xfLʥi��+K6�)}s��,���㰆)!ch�%@A!#7$��q{������84��n�A����˛�dT�j��K�x�e=��<�B�Ii�DW�㲡T�\�s�q���5���*�	f�'#]��p���]��{�k���)�G��F�7o�#γ���@+��ӧ�c�������bD[�9���8W�cD��e�$�E�/�
��['Y�$��ڸ���j|�Ǣ_+\Q wi)�0����~��z�:wä_�Tj���¿>Fgo      �      x������ � �      �   �  x��U�v9]_���f�<z��_b|�f6����D$5N���
�3Ɍwv#��>��$=���jbdo���w[��{�bl�iC�$��4���#�9Њ��ٸ��?S����@ҭjY�9�V޻zR�ĸ,]c����QGʼ�e�lT-&Fym�kg*Z�M|Q����k�Ֆϵe֑����km���X�-]5Ֆ�_?��[�h���"ѕwn�L�h�����؊�&zVe-�.�2:D�k�+L1U;w�T�m�D������Z�WVmٓp�>�+�Z��d����c�`(KH�!͝7���F���2����W����:�[��Y;�1*qö�tA�=��9���QL��;Ks���s��ļ�:���h��	ǖ.�+�w	��e�����^��a�+�~f�	'-{h���h���Ѐ�����F����'����w�Mz��G��Ro'�1�وe���W�n�����8�9Z�v�b\}�ӟu�@tx x�x`���A�;=G>(h\�U%�1��_���tS�G��P��;U~m�6o�8s�Q�`��AP/V:T:ԴT�����=��O��g=ؤ��km����hp�/q�>I�S����k�[�������D�e���n�J'fP��ߖ�K��Y��.�[\k�q���Po ������X�}�4mN�q����-�C��2��5x0��޿x#�!=f[��6z���#E�=!�}����!��l�3�B�� �/���:v�{���I�%prDc�dO�v�|���C y;���.���Z����:�/�_�1YR]i����E��^j]��\�q��td���	�-=/�ω��FÌ>�c��Q�ﴨ�߫2�ɋ�!ݨ4�K6/ھ��I�n/K��X���@��h�@$=�C��TN|��sA������{4S���Ua����O�g�.=8�uD����Z�nZ#�ۣYD@���Ftm0��$�O��"�h
S8PUp �}g�b�Μ�U�G����`]R���!!�����F�i��{��Ӭ)���Ó
Lb�k�9Y	��p]m�Gu�h�f{�飶8􁷮���%VaY��9N #�Pg��}R�]	�;��-x�92n�>o�o�Ji�W�.�I�[��4Ij�Y������+�X�z[��x母j�w�W����N��fѹA      �   2  x���MO�0�s�sĘl��@7�V��&�'/U1i���w@��m����y�2�䂍Mۼ��p	����Y}s]�q��n_�S���L(F���2�L��=	�YH.@���{�6�	�r|�njg�VH��T���v_�GH�5��v�/<�x�f0�,��z��_��6���ٶ>L�:ӿ��ӚΌ�y� v��]eݙ#a*
<�e�F+H�Fi2�-���4Rc�,��;ܒ47����!(�d�V�5�&-��ʠV|g��Ga*�yc�4�� �R�ͭ����S�s՛�6y�$I�	[�N�      �   M   x�340�tt	��240�t	� 2�A' Ä�3 $�0�4rRf�� ʜ�DYp���iKNS׀��͙+F��� ���     