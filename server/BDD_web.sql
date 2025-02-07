PGDMP             	            y            web_project     14.1 (Ubuntu 14.1-2.pgdg20.04+1)     14.1 (Ubuntu 14.1-2.pgdg20.04+1) +    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    16407    web_project    DATABASE     `   CREATE DATABASE web_project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'fr_FR.UTF-8';
    DROP DATABASE web_project;
                postgres    false            �            1259    16436    admins    TABLE     ^   CREATE TABLE public.admins (
    id integer NOT NULL,
    password text,
    last_log date
);
    DROP TABLE public.admins;
       public         heap    postgres    false            �            1259    16435    admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.admins_id_seq;
       public          postgres    false    212            /           0    0    admins_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;
          public          postgres    false    211            �            1259    16418    articles    TABLE     �   CREATE TABLE public.articles (
    id integer NOT NULL,
    name text,
    description text,
    price integer,
    image text
);
    DROP TABLE public.articles;
       public         heap    postgres    false            �            1259    16417    articles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.articles_id_seq;
       public          postgres    false    210            0           0    0    articles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;
          public          postgres    false    209            �            1259    16463    events    TABLE     �   CREATE TABLE public.events (
    id integer NOT NULL,
    title text,
    description text,
    image text,
    available_seats integer NOT NULL,
    localisation text,
    date timestamp with time zone DEFAULT now(),
    offer boolean
);
    DROP TABLE public.events;
       public         heap    postgres    false            �            1259    16462    events_id_seq    SEQUENCE     �   CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.events_id_seq;
       public          postgres    false    216            1           0    0    events_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;
          public          postgres    false    215            �            1259    16472    participations    TABLE     �   CREATE TABLE public.participations (
    id integer NOT NULL,
    "codeQr" text,
    user_id integer NOT NULL,
    event_id integer NOT NULL
);
 "   DROP TABLE public.participations;
       public         heap    postgres    false            �            1259    16471    participations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.participations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.participations_id_seq;
       public          postgres    false    218            2           0    0    participations_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.participations_id_seq OWNED BY public.participations.id;
          public          postgres    false    217            �            1259    16454    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    nom text,
    prenom text,
    mail text,
    password text,
    identity_card text,
    created date,
    last_log date,
    statut boolean
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16453    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    214            3           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    213            �           2604    16439 	   admins id    DEFAULT     f   ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);
 8   ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    16421    articles id    DEFAULT     j   ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);
 :   ALTER TABLE public.articles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    16466 	   events id    DEFAULT     f   ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);
 8   ALTER TABLE public.events ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16475    participations id    DEFAULT     v   ALTER TABLE ONLY public.participations ALTER COLUMN id SET DEFAULT nextval('public.participations_id_seq'::regclass);
 @   ALTER TABLE public.participations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16457    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    214    213    214            "          0    16436    admins 
   TABLE DATA           8   COPY public.admins (id, password, last_log) FROM stdin;
    public          postgres    false    212   .                  0    16418    articles 
   TABLE DATA           G   COPY public.articles (id, name, description, price, image) FROM stdin;
    public          postgres    false    210   /.       &          0    16463    events 
   TABLE DATA           k   COPY public.events (id, title, description, image, available_seats, localisation, date, offer) FROM stdin;
    public          postgres    false    216   ?2       (          0    16472    participations 
   TABLE DATA           I   COPY public.participations (id, "codeQr", user_id, event_id) FROM stdin;
    public          postgres    false    218   �\       $          0    16454    users 
   TABLE DATA           o   COPY public.users (user_id, nom, prenom, mail, password, identity_card, created, last_log, statut) FROM stdin;
    public          postgres    false    214   ]       4           0    0    admins_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.admins_id_seq', 1, false);
          public          postgres    false    211            5           0    0    articles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.articles_id_seq', 10, true);
          public          postgres    false    209            6           0    0    events_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.events_id_seq', 11, true);
          public          postgres    false    215            7           0    0    participations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.participations_id_seq', 11, true);
          public          postgres    false    217            8           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);
          public          postgres    false    213            �           2606    16443    admins admins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    212            �           2606    16425    articles articles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
       public            postgres    false    210            �           2606    16470    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    216            �           2606    16479 "   participations participations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.participations
    ADD CONSTRAINT participations_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.participations DROP CONSTRAINT participations_pkey;
       public            postgres    false    218            �           2606    16461    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    214            �           1259    16492    fki_event_id    INDEX     K   CREATE INDEX fki_event_id ON public.participations USING btree (event_id);
     DROP INDEX public.fki_event_id;
       public            postgres    false    218            �           1259    16486    fki_user_id    INDEX     I   CREATE INDEX fki_user_id ON public.participations USING btree (user_id);
    DROP INDEX public.fki_user_id;
       public            postgres    false    218            �           2606    24663    participations event_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.participations
    ADD CONSTRAINT event_id FOREIGN KEY (event_id) REFERENCES public.events(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 A   ALTER TABLE ONLY public.participations DROP CONSTRAINT event_id;
       public          postgres    false    216    218    3213            �           2606    16481    participations user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.participations
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 @   ALTER TABLE ONLY public.participations DROP CONSTRAINT user_id;
       public          postgres    false    218    214    3211            "      x������ � �             x����v�6Ek�+���M �%�J3+v�L{f�4	Q�I��C��k��;�cs.(�v%/-�|@�>��s�%���}��In����t܆Y�WV��qL��(�� ���/k�Fw�7&��e׫�a�d��e�b�H�4Mv�O������i�vʵ&h�h͸�:�/+|�e�,�􀿥�cU�uU�,��bi��Y��������`�O��=e܋o�v��j/�4,����<�-;��F�4�1�v
A��;�r��D���$���e�:�^�����ӴYḪ�uE�Nz�I���TC:���p#tg $jF�E���2���=3�8�lD��\�u�ڪ� �>��Vg˝�ֽ#�˽�}^��#Xo��������PZт���8J�5|��tn&-�o�x��7�� Z��PO+�W�8(��Ǔ|�
�1�����<s�4�EhW�4ͪf]�M����$���҉�[�>8�v'l/Q��+�C�_%��f���I�MF��_�����_<%�*{j� _ۀ�����&(�I�ߧ��|�iV�u�6�*����ɱ�V��t:���͉��&j��;�`���Q1����5�n�-���(u�Z�%4z�	�v�����d_`��RV����v��Ҧ�ʺZ�$e��`�>p����������١�.��a��Z��ޑ��P��k�%�*l�C�sjv���u��s���a�����*���NV�/�W�v|�Ct�>�!Z��m���&�S�hl�m�٠ H�� �|�-e�����za��*�
�>+�Ƨ�����VEV�%��q��68�K�E�urgB�<N~�9��,�k���˃�R�)X���<_؝�
�|O?�����I�{7��X�>��b�>h*j��,�l�U5i��!�O����'�
��jP�v0���ss�4���0_��\�/qA��������@�
b������X3*'-u);��@����8Y6kD�,-�+&g.*J}��W���MÛ��c��������蜜      &      x��{ǎ�`z���S�}i�d�/�s΄ ���s�Yϡ3�Ɩ`��x�]]�n�M���Nh�@�/{��*�=��dq1մ忼j���w���j�U���# �Y���:�$���0��: o�  @  ��V�Y���7��L��?co�o�X�B�_Ɵ{�ƈ_o��z��������Z����e�������oe�|Η_J����O�}���3��w�������,^����ȁz̋���K��� 5 ��i7�d$E�����I2���Y��r=�,<�rC�*b�b�����
��?�s)�l��h-�䤭\��Ƙ _��q�Q��ư},
K�p��p��x�������{��//  I�I� qR�Ă�Y�eXS N�L������}����R��P��) `I�|β�sC�!G.E��˞{���,�p�s�X�T�<����tJܲ*��eo����;�*
���C�<�!��mϸL�2I�MR)�e/D�4E�<T�<�}��Ԓ�ē�����+X^�YW�Jb� ����E�,i�g����(��"|�i>�`A��'\��B�2hԣy#���o_R�;�-)�:��Z�^�8듲�<Ǫ�����Zӻ���r��%�����m��
k����\}Z���z���͎�yu+Q.)�J/�z��o-�\"��b� ���M(Bw �;�z�1,@���x�zf�ۮ ��� ;n�t'�Zf�Zl��,�5R�:6���2Ɨc�Չ3LA��q�H����Z�E��yhg�N��m�gJ�[�"�!�iƻ���F�b�u�g���=�঒qG�U��dה0v��|��8͞E��W�A��S���صvKWQ�u��팘ҚV\4�j�|F�$�|��}�<,�.p�2b��k���ٺ�2�1�@%�a6�+������ Q<���tBռ��l��A��U���UH8>����G�� ޗ���"�t�R��dz$R��Z���@̌)�<Sw4U%�����E�ä���a�vp�'�)���Փ.��ZQ��2��J�{�D��8x�)��Ƽ���}uk������I�a'�3R����}3q7�>��4�jELV�g�ƈ�M7��4�'������
������q��>a	��`�P>�Hg 9�.ek���z�`�� (jF���j,FƍZ�h,�IhoJ�(�+�*�GA<.w �i_��t\�"[���)׊�����v��$q}n��7%��� �&��ŇB�����G��UD�b��2%��*����D�� >i{(�*�����1t����hF�OFN��+O{$���ӈ��z��,w�|��y���T_e��6R����ɬ�*>6tK�,���T2���B���4K�^X��*#%f�5���]�
`(prysP��SP���>#�G�7����"�R�~ꭾH�h���Q�3�E,������n��=��ǚ�,&-��i|�ƪ��A��KNoP˔8Sn1�:���Nޥd�my��t���ny5����A�$	�3�y[6D���d�Y���.7�S���7]� ɰ.�Uy}XE*���$a"Ei�2M��<���\��(�+M�%�l��79���w��a�� H"1E��p�Dܭ-��-4Ҥ�&�����j�H����l���*myK�}*/�.�46����pAQ��2�fG_Y'��5P��8PigQ�)e��Il��፦�,��9*;�8�Ccy5�(�jE���<��r!}H*�.Q�3�Y|�[���k�ddT��C�y]4�t��S$퀓�kaP"u��}����1������36p���˱C���>�7 ຜ\���,+��� �Sx#@Խ�RQ�ɲ��\�XT4��m��f| ��,�id������*�QF��[ك0�-��\�r��r~Km0��?{*�tG+'}(�f2��yw�bj5[@G�ٶ)��n����#�H��v��Y�k�%|K��Оt�çf"�(9� �-k�v�4w�W9E 2������R��Zۀ5���w>�Ge���*��Ն�$�7�������&^$j�;F�n	r<�]H���V�d;�>�
X��pX�C# �ʷݷJ:��LG>J*���+�i;ؼkQ��eH�e8ڶ����M+So�L�FH�"l:n=j�~�/�aa�WU��d&��/�l��~��Ko?�A�8��vm5�R�_�+)QtO.2�g~̽�g�+�\Agw._����(�4(�n���eԺS�S�q���3�t�!����a+y@�٤�} 1�s�i �,}=xp� �:pZ5G�cBל7�_��K�B�@�ÃԹ���I)u��D*�l�i��Q'bHh���fw��LI"E����Zof�di���2]^(-��bX`i>��}0`O���(���tO���d��}���CR�+��ė6���e��G{fKmꆌ�|kԄu�}�x#����lF.n�K�B��)o�l��)M�=L��	�^�,�������i�q�x!"S��\&9+�5#J��gxCR��!�����֧^i�A�	Q�i�a�l��.4�f~Vo�rv�U���ޯ4����@���?�DQ���#󙱻�1��`5i���h���2*A�'{�s��I�QA<Maje#��>�/@<H?� ��=%��4�2�&ӯ">M_fS<�|�歡(]i�m�j̣�EKp��ɺ��[c��NϠf�mكeG�0;����]��*��c����J'�'���o�U��t;�;g��/��
��J���{�W&aѶ���U�X�ˎ�xsAD
��]����l�JK>au�F±>����F�T���i'�w9�F?���Q���R�(���0X���c��C�f��A�"�ߖ$�h��HRx�ݗ�\q�)����Vy��	6�Bڂ$WBb=���J��0�2���?^�Ġ/udW����b
�)���g���lD!r�����<۞|sPe��Ev;��l8lu��E�eY�"�x�j���Y��T2�'~?��|i���%��C)?��E	c3��x%G�5�͕��'F��`7��(��` c�km���z�fr3.��QѺʓ3fY)R���d!Q�E��%�h�?]<9Ż�c�҅�7q�� �AqY9S��<L�_j����~�4�D�!p�=��]�br���n3e����������qP��)�ts�h�@��(rE�8+T=ƀ$
-�7H���C��0>93j��%���]����5[I�R�^ݫ.�4���A���0��ɻqI;�M	�k8�84vg��~�����%*")�Ў�.��n'K�S@�׼�V-E�u���z�W*��q�`d�m�����AMGJh�w��涠B�HR��;�0�B 7�Zy��̭O�4��DN�-��Z43� ��%�n��b���C����X	:P.��/LS�
�Q��#I�������k$�>���Ci[&��{��Ẁ�|1]a���=���і
w�0��V���b  en�Xt�������;�E[ؤ]�7)�йq
'a�
%��DZ�Y�/��#^�[v�[��"I�B��kΪAs��	����ڋ��Q�p{AG��iQ�3(/��
;p&8z�����m���9LvÆ%��6Ӭ�ɝU
D_zC�2-�������.���ޫ�aVT�:�5�6���}6�*=}�GZ��A��D��(h�ղR�>%���#c�2��mn �)s��q���� �l�V!���z����)D���z�?��F���,�u��H������|���XC)!#9n��rQ�F_���<�����WB�J�s��.pI6l���^���©����>���yQ��lQ˩)	�+���v���w腚��
�~������'6�:J�����-&N'�w����$�j��Mv7:h��ґD�Jb�K�"����R�m�4x�LK=#HW�|�¦��j�} fJV��>5�sG-J�9��кu����/���T�g�u.9����摅q�ڣ0C�_1�~�j��+TᩄJT�� �,�{���k�	q;N�B�    3zq��Z�n�M{έ��	7�(@Y��|�.�X(�]�N�"����ȃ�U�����;�/)��8)�ʀ�r��ΚL9�
/��Ћ�cg�=be��C�|�����CԂ�8��^~��7�?{���-ō�~+�N�%�iGe�,�/��b7��=���Ax��J�g��
.���Ƥ�|.^o���pۉ��2.ƫ�h����)��!@:�¶���/H
���^\�GN�on_��ӟImw�+:b��Q՝e�?�-�ۉM�������Fd{�"58��F��`���W��<���N���J^���)#���FAM���J_��X�b)��~�����VB$RAy�h��ɍ'(��<ұ!�I��XK�L�A?^��vs�trj��q6� U����~8�_���՗􌮵<�y�x'�x��:-��wK�b��6�/����U}��_�W@̼�/�,�/�sC�X��z��{'���Oe�
m����暢��2���CV� ;��֮�g3���L���5n�S9�b�z'�g�c�w)�}�|�L7�ˠ���#�l�D�<����S�-5�G���x�8#cN�4M�����I	mƎ�^X��
�F�yQ�=���>�>�@s"�����-=U�B2�V����%7I��L P�/��G��V>ӓ�f�����@6��H�Sq���b�Y�c_���n�c��y�4d�[�f�"]K��V.L�,��T��$d�xk߱Q������Э�n���S[���#� �R�ᗺ��C]�c�F(�K�Krަ�Vs�#�܏7�������܂j��2=�2�˞F�X�TD��@�)��x���%�Y�	�������)�L�2��9Yj�	v����zE��
���")S��kfd�ʏF?è�����Wlp�8�a�%�F$"t�q]q����Jf�ˋ侼�~v�\ʄ��/�����]O5W���Bl�i
����D�i9�h�!x�dA�|C���a~C��W� ��c2�8sU�QJ���_�Uȑ�z��齯�tF�v��-��׊$��/1Vgn�4G[@��Lv����N��s���A�5ª���c�w��ElH��V�(���v�i��%xs�x���|����[h�ƌ�$"P����S�@ͻX�@,>��������4��F�$�d�^{̙,A+P�觐���7��SEg;E���?`���qY�/�����pxMBژ��.0��nݧ��xh'��7%?�6�SsBY��7DJ%9�U�2@/�e�*H7��-�u)ʁ.dN���"��Ӊ��UX�U� �-6~�X��,>�-���NA�|�S2��k�b�dC��'�5_ldPx숶�Iz����h�i��E�}��W��$�/�v]�Y@���<����Kb�Fj�yd���m$��u����AlΚ��De\�{�?r��#��ok��-Ώ0���?�|�4B��֛N�%ɍ,�X2��I��ۈ-��ez�|�j�c�9���D2}��8Fi￷3bؖ�?����#��J[X��>>�k?�%�E�T{~��$��G�ᛲ
B"�	�wE�i��W84���R�:l_�����N-��w�,�Nm�B<&�r��*�h�'� 5�]7�^��I�����v+���1���S��@Jg�`a�skoF����������jb��Æ�䙛,AZAYXm/�X�~�?���}�^�cO=�c�s���m�R�]鳎��U�w�D�嘧av�L�`fu��s/&G!��{�d,��g(�{�^ҹ5��	y?�����'^�!�z�#{\dOPFf'zn����8�5��ȫ���2Z��?]��$���1�i�#�^ ��ҍ��Q�=�l��ii[�,z*�����"��h�1���zV&��V���ʼ��_��#;f����[Ts�����ze���Q1{��T$�MG���CCBg2ېi�9�\0�\�YcT��%bfg�}a�S�̪�m���X��}\�Q������
��#��{�9\�U�Y�K)�~n~��g������C�5�����a�YΡ��k��Uljvb���oz<tIߨ}�JY���eN�ȑR�2v�w}Ce��T;��R)�x��ۿ�֡��'7�A5}�Ė�W�QՅ21Q���<��8̌e�N��2��3�����@,\v��M`�����-�m&�"
>M>y{��I���]s-Y�1+��lk�J-A�ZŦ�5n�Q
8v�F������!��Oa�$ac��nuwҜ�ђίo�A��|ȵ(6�2��2,F���-��n?�verg�J<�������h(�c����q��\�)Z ��E1eկlt��Q���h� 2����j��M'wmO~D����������b�i>мU�����(�2�l��.�srtl�����dcEh
!ޝJ�\TY��<z�L�wCfُ0�
�-?��2$f�Gp�-��ܒ�l1�u����	�T#��E��}p;_�R�����זy��PN,��j�YEz;��z\m�K����hj��k��j�idE^��u��QjPժ��i�I|M6����%�zd�i�la�6[��X_���O��@1�Z�իl���p*���0�R_T�F��
R���J��ƈH���*N��k�]w�H� �m��@���U�������6���7w�E�]���R^ײ����<r�##�:��"�>��p�����``?�YHy�Z��Q�i���D�>ͤ�����8p� G����Oy�"�#���MïG�sa���ț��k	�����0a�#���3���צ��·�ږ@��߹�[����,k̷o�[H��M.y��5�kl����>���?k/�"��0J	��Y�:��w�|G�0��H��i6-���{n�����ة�f�<W� U[��M�w�%�c�O�M�z�,ܻ��?�Z�V���q8ϡfH�Q9a)\�ͧ�N���{%��~�r�2��E��j�:H{�T���xD�e�>��k�=R���&1�
�Y�0W����Z�Fp�ն>)lTI	( iX_�)��B>4��߉В�l�)	��s�mK	3�SUb����3����*d���܅B��-��98던���RW*�r�:l��p�������x��c|H1���g�D�����"�1i&��
ߺ�X�A���+/�A���.'?���s�FχDb���u��a��Z�ci�#���������Ν���R�.O�.�B���L��Z�l�)!��b$�Ŗ"�&�v��n��VV�1�U�����C�5��G��[�U_�U�����	�h�R+gƆ��Nh�p#�%!E��Ts��i���GuH�!)vI.L-.��E|.�^Y�_�,l-�.��ps��hx�r0|&�7s����ñ�$dc��E?�[��g	e�Ǚ�4�߫����]LWE
	&�N��@v��ض��x�UjsJ�]���V����?͗/V
�!�.�)(���vEF�][8�%	_~Zχ�҇���.	��nK�����VKW)T�<�<�Z =��^J��-��}G`h�Kf��-;��Ks�G��T�r�2�S�a�]l}��遇mνUM&�#�n�Sɬ9��P��DE��+?�LB�]���l;Y?#A�~���g2���@��}}z�3kچ6�:^�_-�+f/�Ե�N�*1q��q.�����dK��z���*���fEb�Jw
��M�x0��[��">M	��٢�:.�Ʒy|>�ʇ	�JU�k�x�F�RX�Cș�dGqO�]�W[a��<�����(y���*���'�Nw�
��}�U;B�z�p�dD+7l�X�>�?� ����=-ae�Vm5o�ƌ�|O��Dm�Qe�%o�'K �D��RY�b��<�GΫ��D˶
�u@�4eC$��K�/��3�u�2sX-��u.�,>'���滆����O-������Q��<�n�o�p�X��`�3��w�������/�8?5#��]�΂	����k��-"��%3)�n�u!چL����J�@�0�+��@˸��k��n�]�e����x����
��e�+=j��ǔ��c�J� �
  G֎
:!���T�a{v�Gk���>��'~�_�ѹ���Iap
�;u�+��˒�U�@��y"i"?�?���G8^���zkb����C��� �){�W�R�9��l�ܨ��ͻvʢ�:{!�#��J�~){MY1x�\8�bJQ���RU�,GlP�1�����I���~����eX�x='�ȫ�"��&�)j6u{��Ǹ:�X5H��iw�������2��x�
�VvZ�f���~˲Ic�A�P9����V��HU�ƕ���Z�c�������}6 �c��� ������Τ���(����F��9�&s��}��/׿*P��M�D�)����DٛL� ZP�}�:��{0�_S�DC,�y|g:
�T[��D&]�~��yG*3��f��ϲ�/�*,eGs$�M�YSO�}�C�SNݺp��X���D!)�YR!:-�	�_�x7�.�B��[9t��eh�\E�r��^�InZ�JR�{6���6	�[K��|BK��֋�����d=��E�����g��)����u���'}������L�}�lV�� �{a���H����х��(�g!��=����������l�����rj��6M y���!
��G#uU�(��ᱨ�iƏq�i�Ͱ�z�}9m)�h����;P\g��ao'E��0�+���B��[�8	-*�6/�{?��������N�ڍٟ�%?���@�c�5Lދ�Ϝ{?�C�=�˸�a�
�������3m�&px!�|-�����[2��Ƭy��gi�C�_��� �x��qu.��H����tARtCW�	�敒��Ak=\5�7��Q���-��>��^+k�igz�.K�\}�T|]��%'L������,Q}���}��8줂�S��~��;@s5V���O��la�h�q��
��hd<��e�tU[߉�/�|�D!~�������9}����wikW��D��@�l6������ƋOKŮ
+e��F�"������3���I�a�1�����-�y�p)�--�UK�&MjwLBT�4nb;����j$��d��<yU� ��o�5�gTv�<����n�� Yr��7'V��'G��l7!������&��I%�"�PɱQ��c%�����co�l�瑦;_݉�N�ƩnΟ�9��J}af�x��;�d&5�~i^͒=ݜÉ�0a�M�4��4 ���������ҁ��G�)q��������6Iaц-��'� ��v[����_����dU�$��p�������.jV�L$&�	�	�T�}��z�8���[� [3
��O3��Ī�A���N�v�T4�(�q��d;V��j��J*�zvC���#kL���1�^H��j�y���E���ٛ�)��t�����6���KWq������ֆ(Y��v",�\S��h�F���]'e���R��Yz�hZ�~��;�ᶭ�le����!=W��"�=0h�n�[�]�VUQR�5��qQ��,<���� �
D��s��dR1�G��麽��g��q�>���%6�r���AJ�iZ�2x�M%����Q��qϑ5����B��Q0ꐧq�I��;L�jq��zN������|���=2�H��Ë~eJ���=q��޴@*�#s�+�2��W@��e��8�_�9*����JG��� ���PCAUq{�����W�u�i��@���i6������5'U�pw�����M���^(���7Msl�- ��͊@�U�D�����G/�)@�����t�x����%۷b=�Vl�F�R�e��Swp���?}�u$]dò��"�O�T_��r?���8)A��}�ݪ�|4$��.�6=�G0>��zf��@�X������3�e����4����Y\C
��x�|,�^=(Ce|�ou��
r�KK�_,7���]`f�V�[L���r�q{B%�k|
G��)�B2���*X����Cs|]_��t��q����Rh�K"f����`x�;p<�¿3�������v;��=�( ���}x�9�bf�`ĉxI[j���S���+�Qs)ե�ܰ�z����3.l�L���!��*����78�Q˃�Ȓ�@�o�@�w�A��*����3Фy=��o���w������?�A��n�*L��y�l2�������\}���� ��,1�źLCw��PY�Z����f;�E��fG�������#ό��j  ����V7x���+>����pWk���#�K�m �ʡ�����y��$A��7�N+XP8�q���ܛ{��O0UN!��'�Ĭ�DFz�j";���@����I��_ �tg6-��Ww��ca%-�Շ�|�I&��U�h��/� �_t��q���9�����1�+��O�����졚��_��ڐ���>����Y������o�m ����h�y��7N����cmc_�����ϙ6�S��=��_����������������\�I��$�~�k?ɵ���Or�'���\�I��$�~�k?ɵ���Or�'���\�I��$�~�k?ɵ���Or�'���\�I��$�~�k?ɵ���Or�'���\�I��$�~�k?ɵ���Or�'���\�I��$�~�k?ɵ���Or�'���\�I��$�~�k?ɵ��ɵ7���~��9���1���
�kr�������q��      (      x�����4�4����� )      $   �   x�u�K�P�����Z�쵋J$�+^K��8GŬN����`f�Oc@HȐ�m9�?^�J�?{h�w�?;d�˚*�~X�N����}?Ț&�˃]fو���qo���)��oy����h�/HogU4ʪ��)ɡj�ʚ��2�9d�9g�ŰGF=�ݽjln�9���J+��U$Iz~OSp     