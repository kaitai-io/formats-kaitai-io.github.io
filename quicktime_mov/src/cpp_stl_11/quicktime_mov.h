#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * \sa https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF Source
 */

class quicktime_mov_t : public kaitai::kstruct {

public:
    class mvhd_body_t;
    class ftyp_body_t;
    class fixed32_t;
    class fixed16_t;
    class atom_t;
    class tkhd_body_t;
    class atom_list_t;

    enum atom_type_t {
        ATOM_TYPE_XTRA = 1484026465,
        ATOM_TYPE_DINF = 1684631142,
        ATOM_TYPE_DREF = 1685218662,
        ATOM_TYPE_EDTS = 1701082227,
        ATOM_TYPE_ELST = 1701606260,
        ATOM_TYPE_FREE = 1718773093,
        ATOM_TYPE_FTYP = 1718909296,
        ATOM_TYPE_HDLR = 1751411826,
        ATOM_TYPE_IODS = 1768907891,
        ATOM_TYPE_MDAT = 1835295092,
        ATOM_TYPE_MDHD = 1835296868,
        ATOM_TYPE_MDIA = 1835297121,
        ATOM_TYPE_META = 1835365473,
        ATOM_TYPE_MINF = 1835626086,
        ATOM_TYPE_MOOF = 1836019558,
        ATOM_TYPE_MOOV = 1836019574,
        ATOM_TYPE_MVHD = 1836476516,
        ATOM_TYPE_SMHD = 1936549988,
        ATOM_TYPE_STBL = 1937007212,
        ATOM_TYPE_STCO = 1937007471,
        ATOM_TYPE_STSC = 1937011555,
        ATOM_TYPE_STSD = 1937011556,
        ATOM_TYPE_STSZ = 1937011578,
        ATOM_TYPE_STTS = 1937011827,
        ATOM_TYPE_TKHD = 1953196132,
        ATOM_TYPE_TRAF = 1953653094,
        ATOM_TYPE_TRAK = 1953653099,
        ATOM_TYPE_TREF = 1953654118,
        ATOM_TYPE_UDTA = 1969517665,
        ATOM_TYPE_VMHD = 1986881636
    };

    enum brand_t {
        BRAND_X_3G2A = 862401121,
        BRAND_X_3GE6 = 862414134,
        BRAND_X_3GE7 = 862414135,
        BRAND_X_3GE9 = 862414137,
        BRAND_X_3GF9 = 862414393,
        BRAND_X_3GG6 = 862414646,
        BRAND_X_3GG9 = 862414649,
        BRAND_X_3GH9 = 862414905,
        BRAND_X_3GM9 = 862416185,
        BRAND_X_3GMA = 862416193,
        BRAND_X_3GP4 = 862416948,
        BRAND_X_3GP5 = 862416949,
        BRAND_X_3GP6 = 862416950,
        BRAND_X_3GP7 = 862416951,
        BRAND_X_3GP8 = 862416952,
        BRAND_X_3GP9 = 862416953,
        BRAND_X_3GR6 = 862417462,
        BRAND_X_3GR9 = 862417465,
        BRAND_X_3GS6 = 862417718,
        BRAND_X_3GS9 = 862417721,
        BRAND_X_3GT8 = 862417976,
        BRAND_X_3GT9 = 862417977,
        BRAND_X_3GTV = 862418038,
        BRAND_X_3GVR = 862418546,
        BRAND_X_3VRA = 863400545,
        BRAND_X_3VRB = 863400546,
        BRAND_X_3VRM = 863400557,
        BRAND_ARRI = 1095914057,
        BRAND_CAEP = 1128351056,
        BRAND_CDES = 1128555891,
        BRAND_J2P0 = 1244811312,
        BRAND_J2P1 = 1244811313,
        BRAND_LCAG = 1279476039,
        BRAND_M4A = 1295270176,
        BRAND_M4B = 1295270432,
        BRAND_M4P = 1295274016,
        BRAND_M4V = 1295275552,
        BRAND_MA1A = 1296118081,
        BRAND_MA1B = 1296118082,
        BRAND_MFSM = 1296454477,
        BRAND_MGSV = 1296520022,
        BRAND_MPPI = 1297109065,
        BRAND_MSNV = 1297305174,
        BRAND_MIAB = 1298743618,
        BRAND_MIAC = 1298743619,
        BRAND_MIAN = 1298743662,
        BRAND_MIBU = 1298743925,
        BRAND_MICM = 1298744173,
        BRAND_MIHA = 1298745409,
        BRAND_MIHB = 1298745410,
        BRAND_MIHE = 1298745413,
        BRAND_MIPR = 1298747506,
        BRAND_ROSS = 1380930387,
        BRAND_SEAU = 1397047637,
        BRAND_SEBK = 1397047883,
        BRAND_XAVC = 1480676931,
        BRAND_ADTI = 1633973353,
        BRAND_AID3 = 1634296883,
        BRAND_AV01 = 1635135537,
        BRAND_AVC1 = 1635148593,
        BRAND_AVCI = 1635148649,
        BRAND_AVCS = 1635148659,
        BRAND_AVDE = 1635148901,
        BRAND_AVIF = 1635150182,
        BRAND_AVIO = 1635150191,
        BRAND_AVIS = 1635150195,
        BRAND_BBXM = 1650620525,
        BRAND_CA4M = 1667314797,
        BRAND_CA4S = 1667314803,
        BRAND_CAAA = 1667326305,
        BRAND_CAAC = 1667326307,
        BRAND_CABL = 1667326572,
        BRAND_CAMA = 1667329377,
        BRAND_CAMC = 1667329379,
        BRAND_CAQV = 1667330422,
        BRAND_CASU = 1667330933,
        BRAND_CCEA = 1667458401,
        BRAND_CCFF = 1667458662,
        BRAND_CDM1 = 1667525937,
        BRAND_CDM4 = 1667525940,
        BRAND_CEAC = 1667588451,
        BRAND_CFHD = 1667655780,
        BRAND_CFSD = 1667658596,
        BRAND_CHD1 = 1667785777,
        BRAND_CHD2 = 1667785778,
        BRAND_CHDF = 1667785830,
        BRAND_CHEV = 1667786102,
        BRAND_CHH1 = 1667786801,
        BRAND_CHHD = 1667786852,
        BRAND_CINT = 1667853940,
        BRAND_CLG1 = 1668048689,
        BRAND_CLG2 = 1668048690,
        BRAND_CMF2 = 1668113970,
        BRAND_CMFC = 1668114019,
        BRAND_CMFF = 1668114022,
        BRAND_CMFL = 1668114028,
        BRAND_CMFS = 1668114035,
        BRAND_CMHM = 1668114541,
        BRAND_CMHS = 1668114547,
        BRAND_COMP = 1668246896,
        BRAND_CSH1 = 1668507697,
        BRAND_CUD1 = 1668637745,
        BRAND_CUD2 = 1668637746,
        BRAND_CUD8 = 1668637752,
        BRAND_CUD9 = 1668637753,
        BRAND_CUVD = 1668642404,
        BRAND_CVID = 1668704612,
        BRAND_CVVC = 1668707939,
        BRAND_CWVT = 1668773492,
        BRAND_DA0A = 1684090977,
        BRAND_DA0B = 1684090978,
        BRAND_DA1A = 1684091233,
        BRAND_DA1B = 1684091234,
        BRAND_DA2A = 1684091489,
        BRAND_DA2B = 1684091490,
        BRAND_DA3A = 1684091745,
        BRAND_DA3B = 1684091746,
        BRAND_DASH = 1684108136,
        BRAND_DBY1 = 1684175153,
        BRAND_DMB1 = 1684890161,
        BRAND_DSMS = 1685286259,
        BRAND_DTS1 = 1685353265,
        BRAND_DTS2 = 1685353266,
        BRAND_DTS3 = 1685353267,
        BRAND_DV1A = 1685467489,
        BRAND_DV1B = 1685467490,
        BRAND_DV2A = 1685467745,
        BRAND_DV2B = 1685467746,
        BRAND_DV3A = 1685468001,
        BRAND_DV3B = 1685468002,
        BRAND_DVR1 = 1685484081,
        BRAND_DVT1 = 1685484593,
        BRAND_DXO = 1685614368,
        BRAND_EMSG = 1701671783,
        BRAND_HEIC = 1751476579,
        BRAND_HEIM = 1751476589,
        BRAND_HEIS = 1751476595,
        BRAND_HEIX = 1751476600,
        BRAND_HEOI = 1751478121,
        BRAND_HEVC = 1751479907,
        BRAND_HEVD = 1751479908,
        BRAND_HEVI = 1751479913,
        BRAND_HEVM = 1751479917,
        BRAND_HEVS = 1751479923,
        BRAND_HEVX = 1751479928,
        BRAND_HVCE = 1752589157,
        BRAND_HVCI = 1752589161,
        BRAND_HVCX = 1752589176,
        BRAND_HVTI = 1752593513,
        BRAND_IFAA = 1768317281,
        BRAND_IFAH = 1768317288,
        BRAND_IFAI = 1768317289,
        BRAND_IFAS = 1768317299,
        BRAND_IFAU = 1768317301,
        BRAND_IFAV = 1768317302,
        BRAND_IFHD = 1768319076,
        BRAND_IFHH = 1768319080,
        BRAND_IFHR = 1768319090,
        BRAND_IFHS = 1768319091,
        BRAND_IFHU = 1768319093,
        BRAND_IFHX = 1768319096,
        BRAND_IFRM = 1768321645,
        BRAND_IFSD = 1768321892,
        BRAND_IM1I = 1768763753,
        BRAND_IM1T = 1768763764,
        BRAND_IM2I = 1768764009,
        BRAND_IM2T = 1768764020,
        BRAND_ISC2 = 1769169714,
        BRAND_ISO2 = 1769172786,
        BRAND_ISO3 = 1769172787,
        BRAND_ISO4 = 1769172788,
        BRAND_ISO5 = 1769172789,
        BRAND_ISO6 = 1769172790,
        BRAND_ISO7 = 1769172791,
        BRAND_ISO8 = 1769172792,
        BRAND_ISO9 = 1769172793,
        BRAND_ISOA = 1769172833,
        BRAND_ISOB = 1769172834,
        BRAND_ISOC = 1769172835,
        BRAND_ISOM = 1769172845,
        BRAND_J2IS = 1781688691,
        BRAND_J2KI = 1781689193,
        BRAND_J2KS = 1781689203,
        BRAND_JP2 = 1785737760,
        BRAND_JPEG = 1785750887,
        BRAND_JPGS = 1785751411,
        BRAND_JPM = 1785752864,
        BRAND_JPOI = 1785753449,
        BRAND_JPSI = 1785754473,
        BRAND_JPX = 1785755680,
        BRAND_JPXB = 1785755746,
        BRAND_JXL = 1786276896,
        BRAND_JXS = 1786278688,
        BRAND_JXSC = 1786278755,
        BRAND_JXSI = 1786278761,
        BRAND_JXSS = 1786278771,
        BRAND_LHTE = 1818784869,
        BRAND_LHTI = 1818784873,
        BRAND_LMSG = 1819112295,
        BRAND_MIAF = 1835622758,
        BRAND_MIF1 = 1835623985,
        BRAND_MIF2 = 1835623986,
        BRAND_MJ2S = 1835676275,
        BRAND_MJP2 = 1835692082,
        BRAND_MP21 = 1836069425,
        BRAND_MP41 = 1836069937,
        BRAND_MP42 = 1836069938,
        BRAND_MP71 = 1836070705,
        BRAND_MPUF = 1836086630,
        BRAND_MSDH = 1836278888,
        BRAND_MSF1 = 1836279345,
        BRAND_MSIX = 1836280184,
        BRAND_NIKO = 1852402543,
        BRAND_NLSL = 1852601196,
        BRAND_NRAS = 1852989811,
        BRAND_OA2D = 1868640868,
        BRAND_OABL = 1868653164,
        BRAND_ODCF = 1868850022,
        BRAND_OMPP = 1869443184,
        BRAND_OPF2 = 1869637170,
        BRAND_OPX2 = 1869641778,
        BRAND_OVDP = 1870029936,
        BRAND_OVLY = 1870031993,
        BRAND_PAFF = 1885431398,
        BRAND_PANA = 1885433441,
        BRAND_PIFF = 1885955686,
        BRAND_PMFF = 1886217830,
        BRAND_PNVI = 1886287465,
        BRAND_PRED = 1886545252,
        BRAND_QT = 1903435808,
        BRAND_RELO = 1919249519,
        BRAND_RISX = 1919513464,
        BRAND_SDV = 1935963680,
        BRAND_SENV = 1936027254,
        BRAND_SIMS = 1936289139,
        BRAND_SISX = 1936290680,
        BRAND_SITI = 1936290921,
        BRAND_SITV = 1936290934,
        BRAND_SLH1 = 1936484401,
        BRAND_SLH2 = 1936484402,
        BRAND_SLH3 = 1936484403,
        BRAND_SSSS = 1936946035,
        BRAND_TTML = 1953787244,
        BRAND_TTWV = 1953789814,
        BRAND_UHVI = 1969780329,
        BRAND_UNIF = 1970170214,
        BRAND_UVVU = 1970697845,
        BRAND_V3MP = 1983081840,
        BRAND_V3MT = 1983081844,
        BRAND_V3NT = 1983082100,
        BRAND_V3ST = 1983083380,
        BRAND_VVCI = 1987470185,
        BRAND_VVOI = 1987473257,
        BRAND_VWPT = 1987539060,
        BRAND_YT4 = 2037658656
    };

    quicktime_mov_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, quicktime_mov_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~quicktime_mov_t();

    /**
     * \sa https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG Source
     */

    class mvhd_body_t : public kaitai::kstruct {

    public:

        mvhd_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent = nullptr, quicktime_mov_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mvhd_body_t();

    private:
        uint8_t m_version;
        std::string m_flags;
        uint32_t m_creation_time;
        uint32_t m_modification_time;
        uint32_t m_time_scale;
        uint32_t m_duration;
        std::unique_ptr<fixed32_t> m_preferred_rate;
        std::unique_ptr<fixed16_t> m_preferred_volume;
        std::string m_reserved1;
        std::string m_matrix;
        uint32_t m_preview_time;
        uint32_t m_preview_duration;
        uint32_t m_poster_time;
        uint32_t m_selection_time;
        uint32_t m_selection_duration;
        uint32_t m_current_time;
        uint32_t m_next_track_id;
        quicktime_mov_t* m__root;
        quicktime_mov_t::atom_t* m__parent;

    public:

        /**
         * Version of this movie header atom
         */
        uint8_t version() const { return m_version; }
        std::string flags() const { return m_flags; }
        uint32_t creation_time() const { return m_creation_time; }
        uint32_t modification_time() const { return m_modification_time; }

        /**
         * A time value that indicates the time scale for this
         * movie - the number of time units that pass per second
         * in its time coordinate system. A time coordinate system that
         * measures time in sixtieths of a second, for example, has a
         * time scale of 60.
         */
        uint32_t time_scale() const { return m_time_scale; }

        /**
         * A time value that indicates the duration of the movie in
         * time scale units. Note that this property is derived from
         * the movie's tracks. The value of this field corresponds to
         * the duration of the longest track in the movie.
         */
        uint32_t duration() const { return m_duration; }

        /**
         * The rate at which to play this movie. A value of 1.0 indicates normal rate.
         */
        fixed32_t* preferred_rate() const { return m_preferred_rate.get(); }

        /**
         * How loud to play this movie's sound. A value of 1.0 indicates full volume.
         */
        fixed16_t* preferred_volume() const { return m_preferred_volume.get(); }
        std::string reserved1() const { return m_reserved1; }

        /**
         * A matrix shows how to map points from one coordinate space into another.
         */
        std::string matrix() const { return m_matrix; }

        /**
         * The time value in the movie at which the preview begins.
         */
        uint32_t preview_time() const { return m_preview_time; }

        /**
         * The duration of the movie preview in movie time scale units.
         */
        uint32_t preview_duration() const { return m_preview_duration; }

        /**
         * The time value of the time of the movie poster.
         */
        uint32_t poster_time() const { return m_poster_time; }

        /**
         * The time value for the start time of the current selection.
         */
        uint32_t selection_time() const { return m_selection_time; }

        /**
         * The duration of the current selection in movie time scale units.
         */
        uint32_t selection_duration() const { return m_selection_duration; }

        /**
         * The time value for current time position within the movie.
         */
        uint32_t current_time() const { return m_current_time; }

        /**
         * Indicates a value to use for the track ID number of the next
         * track added to this movie. Note that 0 is not a valid track
         * ID value.
         */
        uint32_t next_track_id() const { return m_next_track_id; }
        quicktime_mov_t* _root() const { return m__root; }
        quicktime_mov_t::atom_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF Source
     */

    class ftyp_body_t : public kaitai::kstruct {

    public:

        ftyp_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent = nullptr, quicktime_mov_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~ftyp_body_t();

    private:
        brand_t m_major_brand;
        std::string m_minor_version;
        std::unique_ptr<std::vector<brand_t>> m_compatible_brands;
        quicktime_mov_t* m__root;
        quicktime_mov_t::atom_t* m__parent;

    public:
        brand_t major_brand() const { return m_major_brand; }
        std::string minor_version() const { return m_minor_version; }
        std::vector<brand_t>* compatible_brands() const { return m_compatible_brands.get(); }
        quicktime_mov_t* _root() const { return m__root; }
        quicktime_mov_t::atom_t* _parent() const { return m__parent; }
    };

    /**
     * Fixed-point 32-bit number.
     */

    class fixed32_t : public kaitai::kstruct {

    public:

        fixed32_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, quicktime_mov_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~fixed32_t();

    private:
        int16_t m_int_part;
        uint16_t m_frac_part;
        quicktime_mov_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        int16_t int_part() const { return m_int_part; }
        uint16_t frac_part() const { return m_frac_part; }
        quicktime_mov_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * Fixed-point 16-bit number.
     */

    class fixed16_t : public kaitai::kstruct {

    public:

        fixed16_t(kaitai::kstream* p__io, quicktime_mov_t::mvhd_body_t* p__parent = nullptr, quicktime_mov_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~fixed16_t();

    private:
        int8_t m_int_part;
        uint8_t m_frac_part;
        quicktime_mov_t* m__root;
        quicktime_mov_t::mvhd_body_t* m__parent;

    public:
        int8_t int_part() const { return m_int_part; }
        uint8_t frac_part() const { return m_frac_part; }
        quicktime_mov_t* _root() const { return m__root; }
        quicktime_mov_t::mvhd_body_t* _parent() const { return m__parent; }
    };

    class atom_t : public kaitai::kstruct {

    public:

        atom_t(kaitai::kstream* p__io, quicktime_mov_t::atom_list_t* p__parent = nullptr, quicktime_mov_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~atom_t();

    private:
        bool f_len;
        int32_t m_len;

    public:
        int32_t len();

    private:
        uint32_t m_len32;
        atom_type_t m_atom_type;
        uint64_t m_len64;
        bool n_len64;

    public:
        bool _is_null_len64() { len64(); return n_len64; };

    private:
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        quicktime_mov_t* m__root;
        quicktime_mov_t::atom_list_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:
        uint32_t len32() const { return m_len32; }
        atom_type_t atom_type() const { return m_atom_type; }
        uint64_t len64() const { return m_len64; }
        kaitai::kstruct* body() const { return m_body.get(); }
        quicktime_mov_t* _root() const { return m__root; }
        quicktime_mov_t::atom_list_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

    /**
     * \sa https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550 Source
     */

    class tkhd_body_t : public kaitai::kstruct {

    public:

        tkhd_body_t(kaitai::kstream* p__io, quicktime_mov_t::atom_t* p__parent = nullptr, quicktime_mov_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~tkhd_body_t();

    private:
        uint8_t m_version;
        std::string m_flags;
        uint32_t m_creation_time;
        uint32_t m_modification_time;
        uint32_t m_track_id;
        std::string m_reserved1;
        uint32_t m_duration;
        std::string m_reserved2;
        uint16_t m_layer;
        uint16_t m_alternative_group;
        uint16_t m_volume;
        uint16_t m_reserved3;
        std::string m_matrix;
        std::unique_ptr<fixed32_t> m_width;
        std::unique_ptr<fixed32_t> m_height;
        quicktime_mov_t* m__root;
        quicktime_mov_t::atom_t* m__parent;

    public:
        uint8_t version() const { return m_version; }
        std::string flags() const { return m_flags; }
        uint32_t creation_time() const { return m_creation_time; }
        uint32_t modification_time() const { return m_modification_time; }

        /**
         * Integer that uniquely identifies the track. The value 0 cannot be used.
         */
        uint32_t track_id() const { return m_track_id; }
        std::string reserved1() const { return m_reserved1; }
        uint32_t duration() const { return m_duration; }
        std::string reserved2() const { return m_reserved2; }
        uint16_t layer() const { return m_layer; }
        uint16_t alternative_group() const { return m_alternative_group; }
        uint16_t volume() const { return m_volume; }
        uint16_t reserved3() const { return m_reserved3; }
        std::string matrix() const { return m_matrix; }
        fixed32_t* width() const { return m_width.get(); }
        fixed32_t* height() const { return m_height.get(); }
        quicktime_mov_t* _root() const { return m__root; }
        quicktime_mov_t::atom_t* _parent() const { return m__parent; }
    };

    class atom_list_t : public kaitai::kstruct {

    public:

        atom_list_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, quicktime_mov_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~atom_list_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<atom_t>>> m_items;
        quicktime_mov_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::vector<std::unique_ptr<atom_t>>* items() const { return m_items.get(); }
        quicktime_mov_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<atom_list_t> m_atoms;
    quicktime_mov_t* m__root;
    kaitai::kstruct* m__parent;

public:
    atom_list_t* atoms() const { return m_atoms.get(); }
    quicktime_mov_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};
