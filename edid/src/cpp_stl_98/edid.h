#ifndef EDID_H_
#define EDID_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class edid_t : public kaitai::kstruct {

public:
    class chromacity_info_t;
    class est_timings_info_t;
    class std_timing_t;

    edid_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, edid_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~edid_t();

    /**
     * Chromaticity information: colorimetry and white point
     * coordinates. All coordinates are stored as fixed precision
     * 10-bit numbers, bits are shuffled for compactness.
     */

    class chromacity_info_t : public kaitai::kstruct {

    public:

        chromacity_info_t(kaitai::kstream* p__io, edid_t* p__parent = 0, edid_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chromacity_info_t();

    private:
        bool f_green_x_int;
        int32_t m_green_x_int;

    public:
        int32_t green_x_int();

    private:
        bool f_red_y;
        double m_red_y;

    public:

        /**
         * Red Y coordinate
         */
        double red_y();

    private:
        bool f_green_y_int;
        int32_t m_green_y_int;

    public:
        int32_t green_y_int();

    private:
        bool f_white_y;
        double m_white_y;

    public:

        /**
         * White Y coordinate
         */
        double white_y();

    private:
        bool f_red_x;
        double m_red_x;

    public:

        /**
         * Red X coordinate
         */
        double red_x();

    private:
        bool f_white_x;
        double m_white_x;

    public:

        /**
         * White X coordinate
         */
        double white_x();

    private:
        bool f_blue_x;
        double m_blue_x;

    public:

        /**
         * Blue X coordinate
         */
        double blue_x();

    private:
        bool f_white_x_int;
        int32_t m_white_x_int;

    public:
        int32_t white_x_int();

    private:
        bool f_white_y_int;
        int32_t m_white_y_int;

    public:
        int32_t white_y_int();

    private:
        bool f_green_x;
        double m_green_x;

    public:

        /**
         * Green X coordinate
         */
        double green_x();

    private:
        bool f_red_x_int;
        int32_t m_red_x_int;

    public:
        int32_t red_x_int();

    private:
        bool f_red_y_int;
        int32_t m_red_y_int;

    public:
        int32_t red_y_int();

    private:
        bool f_blue_x_int;
        int32_t m_blue_x_int;

    public:
        int32_t blue_x_int();

    private:
        bool f_blue_y;
        double m_blue_y;

    public:

        /**
         * Blue Y coordinate
         */
        double blue_y();

    private:
        bool f_green_y;
        double m_green_y;

    public:

        /**
         * Green Y coordinate
         */
        double green_y();

    private:
        bool f_blue_y_int;
        int32_t m_blue_y_int;

    public:
        int32_t blue_y_int();

    private:
        uint64_t m_red_x_1_0;
        uint64_t m_red_y_1_0;
        uint64_t m_green_x_1_0;
        uint64_t m_green_y_1_0;
        uint64_t m_blue_x_1_0;
        uint64_t m_blue_y_1_0;
        uint64_t m_white_x_1_0;
        uint64_t m_white_y_1_0;
        uint8_t m_red_x_9_2;
        uint8_t m_red_y_9_2;
        uint8_t m_green_x_9_2;
        uint8_t m_green_y_9_2;
        uint8_t m_blue_x_9_2;
        uint8_t m_blue_y_9_2;
        uint8_t m_white_x_9_2;
        uint8_t m_white_y_9_2;
        edid_t* m__root;
        edid_t* m__parent;

    public:

        /**
         * Red X, bits 1..0
         */
        uint64_t red_x_1_0() const { return m_red_x_1_0; }

        /**
         * Red Y, bits 1..0
         */
        uint64_t red_y_1_0() const { return m_red_y_1_0; }

        /**
         * Green X, bits 1..0
         */
        uint64_t green_x_1_0() const { return m_green_x_1_0; }

        /**
         * Green Y, bits 1..0
         */
        uint64_t green_y_1_0() const { return m_green_y_1_0; }

        /**
         * Blue X, bits 1..0
         */
        uint64_t blue_x_1_0() const { return m_blue_x_1_0; }

        /**
         * Blue Y, bits 1..0
         */
        uint64_t blue_y_1_0() const { return m_blue_y_1_0; }

        /**
         * White X, bits 1..0
         */
        uint64_t white_x_1_0() const { return m_white_x_1_0; }

        /**
         * White Y, bits 1..0
         */
        uint64_t white_y_1_0() const { return m_white_y_1_0; }

        /**
         * Red X, bits 9..2
         */
        uint8_t red_x_9_2() const { return m_red_x_9_2; }

        /**
         * Red Y, bits 9..2
         */
        uint8_t red_y_9_2() const { return m_red_y_9_2; }

        /**
         * Green X, bits 9..2
         */
        uint8_t green_x_9_2() const { return m_green_x_9_2; }

        /**
         * Green Y, bits 9..2
         */
        uint8_t green_y_9_2() const { return m_green_y_9_2; }

        /**
         * Blue X, bits 9..2
         */
        uint8_t blue_x_9_2() const { return m_blue_x_9_2; }

        /**
         * Blue Y, bits 9..2
         */
        uint8_t blue_y_9_2() const { return m_blue_y_9_2; }

        /**
         * White X, bits 9..2
         */
        uint8_t white_x_9_2() const { return m_white_x_9_2; }

        /**
         * White Y, bits 9..2
         */
        uint8_t white_y_9_2() const { return m_white_y_9_2; }
        edid_t* _root() const { return m__root; }
        edid_t* _parent() const { return m__parent; }
    };

    class est_timings_info_t : public kaitai::kstruct {

    public:

        est_timings_info_t(kaitai::kstream* p__io, edid_t* p__parent = 0, edid_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~est_timings_info_t();

    private:
        bool m_can_720_400_70;
        bool m_can_720_400_88;
        bool m_can_640_480_60;
        bool m_can_640_480_67;
        bool m_can_640_480_72;
        bool m_can_640_480_75;
        bool m_can_800_600_56;
        bool m_can_800_600_60;
        bool m_can_800_600_72;
        bool m_can_800_600_75;
        bool m_can_832_624_75;
        bool m_can_1024_768_87_i;
        bool m_can_1024_768_60;
        bool m_can_1024_768_70;
        bool m_can_1024_768_75;
        bool m_can_1280_1024_75;
        bool m_can_1152_870_75;
        uint64_t m_reserved;
        edid_t* m__root;
        edid_t* m__parent;

    public:

        /**
         * Supports 720 x 400 @ 70Hz
         */
        bool can_720_400_70() const { return m_can_720_400_70; }

        /**
         * Supports 720 x 400 @ 88Hz
         */
        bool can_720_400_88() const { return m_can_720_400_88; }

        /**
         * Supports 640 x 480 @ 60Hz
         */
        bool can_640_480_60() const { return m_can_640_480_60; }

        /**
         * Supports 640 x 480 @ 67Hz
         */
        bool can_640_480_67() const { return m_can_640_480_67; }

        /**
         * Supports 640 x 480 @ 72Hz
         */
        bool can_640_480_72() const { return m_can_640_480_72; }

        /**
         * Supports 640 x 480 @ 75Hz
         */
        bool can_640_480_75() const { return m_can_640_480_75; }

        /**
         * Supports 800 x 600 @ 56Hz
         */
        bool can_800_600_56() const { return m_can_800_600_56; }

        /**
         * Supports 800 x 600 @ 60Hz
         */
        bool can_800_600_60() const { return m_can_800_600_60; }

        /**
         * Supports 800 x 600 @ 72Hz
         */
        bool can_800_600_72() const { return m_can_800_600_72; }

        /**
         * Supports 800 x 600 @ 75Hz
         */
        bool can_800_600_75() const { return m_can_800_600_75; }

        /**
         * Supports 832 x 624 @ 75Hz
         */
        bool can_832_624_75() const { return m_can_832_624_75; }

        /**
         * Supports 1024 x 768 @ 87Hz(I)
         */
        bool can_1024_768_87_i() const { return m_can_1024_768_87_i; }

        /**
         * Supports 1024 x 768 @ 60Hz
         */
        bool can_1024_768_60() const { return m_can_1024_768_60; }

        /**
         * Supports 1024 x 768 @ 70Hz
         */
        bool can_1024_768_70() const { return m_can_1024_768_70; }

        /**
         * Supports 1024 x 768 @ 75Hz
         */
        bool can_1024_768_75() const { return m_can_1024_768_75; }

        /**
         * Supports 1280 x 1024 @ 75Hz
         */
        bool can_1280_1024_75() const { return m_can_1280_1024_75; }

        /**
         * Supports 1152 x 870 @ 75Hz
         */
        bool can_1152_870_75() const { return m_can_1152_870_75; }
        uint64_t reserved() const { return m_reserved; }
        edid_t* _root() const { return m__root; }
        edid_t* _parent() const { return m__parent; }
    };

    class std_timing_t : public kaitai::kstruct {

    public:

        enum aspect_ratios_t {
            ASPECT_RATIOS_RATIO_16_10 = 0,
            ASPECT_RATIOS_RATIO_4_3 = 1,
            ASPECT_RATIOS_RATIO_5_4 = 2,
            ASPECT_RATIOS_RATIO_16_9 = 3
        };

        std_timing_t(kaitai::kstream* p__io, edid_t* p__parent = 0, edid_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~std_timing_t();

    private:
        bool f_bytes_lookahead;
        std::string m_bytes_lookahead;

    public:
        std::string bytes_lookahead();

    private:
        bool f_is_used;
        bool m_is_used;

    public:
        bool is_used();

    private:
        bool f_horiz_active_pixels;
        int32_t m_horiz_active_pixels;
        bool n_horiz_active_pixels;

    public:
        bool _is_null_horiz_active_pixels() { horiz_active_pixels(); return n_horiz_active_pixels; };

    private:

    public:

        /**
         * Range of horizontal active pixels.
         */
        int32_t horiz_active_pixels();

    private:
        bool f_refresh_rate;
        int32_t m_refresh_rate;
        bool n_refresh_rate;

    public:
        bool _is_null_refresh_rate() { refresh_rate(); return n_refresh_rate; };

    private:

    public:

        /**
         * Vertical refresh rate, Hz.
         */
        int32_t refresh_rate();

    private:
        uint8_t m_horiz_active_pixels_mod;
        aspect_ratios_t m_aspect_ratio;
        uint64_t m_refresh_rate_mod;
        edid_t* m__root;
        edid_t* m__parent;

    public:

        /**
         * Range of horizontal active pixels, written in modified form:
         * `(horiz_active_pixels / 8) - 31`. This yields an effective
         * range of 256..2288, with steps of 8 pixels.
         */
        uint8_t horiz_active_pixels_mod() const { return m_horiz_active_pixels_mod; }

        /**
         * Aspect ratio of the image. Can be used to calculate number
         * of vertical pixels.
         */
        aspect_ratios_t aspect_ratio() const { return m_aspect_ratio; }

        /**
         * Refresh rate in Hz, written in modified form: `refresh_rate
         * - 60`. This yields an effective range of 60..123 Hz.
         */
        uint64_t refresh_rate_mod() const { return m_refresh_rate_mod; }
        edid_t* _root() const { return m__root; }
        edid_t* _parent() const { return m__parent; }
    };

private:
    bool f_mfg_year;
    int32_t m_mfg_year;

public:
    int32_t mfg_year();

private:
    bool f_mfg_id_ch1;
    int32_t m_mfg_id_ch1;

public:
    int32_t mfg_id_ch1();

private:
    bool f_mfg_id_ch3;
    int32_t m_mfg_id_ch3;

public:
    int32_t mfg_id_ch3();

private:
    bool f_gamma;
    double m_gamma;
    bool n_gamma;

public:
    bool _is_null_gamma() { gamma(); return n_gamma; };

private:

public:
    double gamma();

private:
    bool f_mfg_id_ch2;
    int32_t m_mfg_id_ch2;

public:
    int32_t mfg_id_ch2();

private:
    std::string m_magic;
    uint16_t m_mfg_bytes;
    uint16_t m_product_code;
    uint32_t m_serial;
    uint8_t m_mfg_week;
    uint8_t m_mfg_year_mod;
    uint8_t m_edid_version_major;
    uint8_t m_edid_version_minor;
    uint8_t m_input_flags;
    uint8_t m_screen_size_h;
    uint8_t m_screen_size_v;
    uint8_t m_gamma_mod;
    uint8_t m_features_flags;
    chromacity_info_t* m_chromacity;
    est_timings_info_t* m_est_timings;
    std::vector<std_timing_t*>* m_std_timings;
    edid_t* m__root;
    kaitai::kstruct* m__parent;
    std::vector<std::string>* m__raw_std_timings;
    std::vector<kaitai::kstream*>* m__io__raw_std_timings;

public:
    std::string magic() const { return m_magic; }
    uint16_t mfg_bytes() const { return m_mfg_bytes; }

    /**
     * Manufacturer product code
     */
    uint16_t product_code() const { return m_product_code; }

    /**
     * Serial number
     */
    uint32_t serial() const { return m_serial; }

    /**
     * Week of manufacture. Week numbering is not consistent between manufacturers.
     */
    uint8_t mfg_week() const { return m_mfg_week; }

    /**
     * Year of manufacture, less 1990. (1990-2245). If week=255, it is the model year instead.
     */
    uint8_t mfg_year_mod() const { return m_mfg_year_mod; }

    /**
     * EDID version, usually 1 (for 1.3)
     */
    uint8_t edid_version_major() const { return m_edid_version_major; }

    /**
     * EDID revision, usually 3 (for 1.3)
     */
    uint8_t edid_version_minor() const { return m_edid_version_minor; }
    uint8_t input_flags() const { return m_input_flags; }

    /**
     * Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
     */
    uint8_t screen_size_h() const { return m_screen_size_h; }

    /**
     * Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
     */
    uint8_t screen_size_v() const { return m_screen_size_v; }

    /**
     * Display gamma, datavalue = (gamma*100)-100 (range 1.00-3.54)
     */
    uint8_t gamma_mod() const { return m_gamma_mod; }
    uint8_t features_flags() const { return m_features_flags; }

    /**
     * Phosphor or filter chromaticity structure, which provides info on colorimetry and white point
     * \sa Standard, section 3.7
     */
    chromacity_info_t* chromacity() const { return m_chromacity; }

    /**
     * Block of bit flags that indicates support of so called
     * "established timings", which is a commonly used subset of VESA
     * DMT (Discrete Monitor Timings) modes.
     * \sa Standard, section 3.8
     */
    est_timings_info_t* est_timings() const { return m_est_timings; }

    /**
     * Array of descriptions of so called "standard timings", which are
     * used to specify up to 8 additional timings not included in
     * "established timings".
     */
    std::vector<std_timing_t*>* std_timings() const { return m_std_timings; }
    edid_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::vector<std::string>* _raw_std_timings() const { return m__raw_std_timings; }
    std::vector<kaitai::kstream*>* _io__raw_std_timings() const { return m__io__raw_std_timings; }
};

#endif  // EDID_H_
