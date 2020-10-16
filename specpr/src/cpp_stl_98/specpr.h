#ifndef SPECPR_H_
#define SPECPR_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * Specpr records are fixed format, 1536 bytes/record. Record number
 * counting starts at 0. Binary data are in IEEE format real numbers
 * and non-byte swapped integers (compatiible with all Sun
 * Microsystems, and Hewlett Packard workstations (Intel and some DEC
 * machines are byte swapped relative to Suns and HPs). Each record may
 * contain different information according to the following scheme.
 * 
 * You can get some library of spectra from
 * ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
 */

class specpr_t : public kaitai::kstruct {

public:
    class data_initial_t;
    class coarse_timestamp_t;
    class icflag_t;
    class data_continuation_t;
    class identifiers_t;
    class illum_angle_t;
    class text_initial_t;
    class record_t;
    class text_continuation_t;

    enum record_type_t {
        RECORD_TYPE_DATA_INITIAL = 0,
        RECORD_TYPE_TEXT_INITIAL = 1,
        RECORD_TYPE_DATA_CONTINUATION = 2,
        RECORD_TYPE_TEXT_CONTINUATION = 3
    };

    specpr_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, specpr_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~specpr_t();

    class data_initial_t : public kaitai::kstruct {

    public:

        data_initial_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent = 0, specpr_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_initial_t();

    private:
        bool f_phase_angle_arcsec;
        double m_phase_angle_arcsec;

    public:

        /**
         * The phase angle between iangl and eangl in seconds
         */
        double phase_angle_arcsec();

    private:
        identifiers_t* m_ids;
        coarse_timestamp_t* m_iscta;
        coarse_timestamp_t* m_isctb;
        int32_t m_jdatea;
        int32_t m_jdateb;
        coarse_timestamp_t* m_istb;
        int32_t m_isra;
        int32_t m_isdec;
        int32_t m_itchan;
        int32_t m_irmas;
        int32_t m_revs;
        std::vector<int32_t>* m_iband;
        int32_t m_irwav;
        int32_t m_irespt;
        int32_t m_irecno;
        int32_t m_itpntr;
        std::string m_ihist;
        std::vector<std::string>* m_mhist;
        int32_t m_nruns;
        illum_angle_t* m_siangl;
        illum_angle_t* m_seangl;
        int32_t m_sphase;
        int32_t m_iwtrns;
        int32_t m_itimch;
        float m_xnrm;
        float m_scatim;
        float m_timint;
        float m_tempd;
        std::vector<float>* m_data;
        specpr_t* m__root;
        specpr_t::record_t* m__parent;

    public:
        identifiers_t* ids() const { return m_ids; }

        /**
         * Civil or Universal time when data was last processed
         */
        coarse_timestamp_t* iscta() const { return m_iscta; }

        /**
         * Civil or Universal time at the start of the spectral run
         */
        coarse_timestamp_t* isctb() const { return m_isctb; }

        /**
         * Date when data was last processed. Stored as integer*4 Julian Day number *10
         */
        int32_t jdatea() const { return m_jdatea; }

        /**
         * Date when the spectral run began. Stored as integer*4 Julian Day number *10
         */
        int32_t jdateb() const { return m_jdateb; }

        /**
         * Siderial time when the spectral run started. See flag #05.
         */
        coarse_timestamp_t* istb() const { return m_istb; }

        /**
         * Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
         */
        int32_t isra() const { return m_isra; }

        /**
         * Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
         */
        int32_t isdec() const { return m_isdec; }

        /**
         * Total number of channels in the spectrum (integer*4 value from 1 to 4852)
         */
        int32_t itchan() const { return m_itchan; }

        /**
         * The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
         */
        int32_t irmas() const { return m_irmas; }

        /**
         * The number of independent spectral scans which were added to make the spectrum (integer*4 number).
         */
        int32_t revs() const { return m_revs; }

        /**
         * The channel numbers which define the band normalization (scaling to unity). (integers*4).
         */
        std::vector<int32_t>* iband() const { return m_iband; }

        /**
         * The record number within the file where the wavelengths are found (integer*4).
         */
        int32_t irwav() const { return m_irwav; }

        /**
         * The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
         */
        int32_t irespt() const { return m_irespt; }

        /**
         * The record number within the file where the data is located (integer*4 number).
         */
        int32_t irecno() const { return m_irecno; }

        /**
         * Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer)
         */
        int32_t itpntr() const { return m_itpntr; }

        /**
         * The program automatic 60 character history.
         */
        std::string ihist() const { return m_ihist; }

        /**
         * Manual history. Program automatic for large history requirements.
         */
        std::vector<std::string>* mhist() const { return m_mhist; }

        /**
         * The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
         */
        int32_t nruns() const { return m_nruns; }

        /**
         * The angle of incidence of illuminating radiation
         *       integrating sphere = 2000000000
         *       Geometric albedo   = 2000000001
         */
        illum_angle_t* siangl() const { return m_siangl; }

        /**
         * The angle of emission of illuminating radiation
         *       integrating sphere = 2000000000
         *       Geometric albedo   = 2000000001
         */
        illum_angle_t* seangl() const { return m_seangl; }

        /**
         * The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg <= phase <= 180 deg)
         *       integrating sphere = 2000000000
         */
        int32_t sphase() const { return m_sphase; }

        /**
         * Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
         */
        int32_t iwtrns() const { return m_iwtrns; }

        /**
         * The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4)
         */
        int32_t itimch() const { return m_itimch; }

        /**
         * The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
         */
        float xnrm() const { return m_xnrm; }

        /**
         * The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
         */
        float scatim() const { return m_scatim; }

        /**
         * Total integration time (usually=scatime * nruns) (32 bit real number).
         */
        float timint() const { return m_timint; }

        /**
         * Temperature in degrees Kelvin (32 bit real number).
         */
        float tempd() const { return m_tempd; }

        /**
         * The spectral data (256 channels of 32 bit real data numbers).
         */
        std::vector<float>* data() const { return m_data; }
        specpr_t* _root() const { return m__root; }
        specpr_t::record_t* _parent() const { return m__parent; }
    };

    class coarse_timestamp_t : public kaitai::kstruct {

    public:

        coarse_timestamp_t(kaitai::kstream* p__io, specpr_t::data_initial_t* p__parent = 0, specpr_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~coarse_timestamp_t();

    private:
        bool f_seconds;
        double m_seconds;

    public:
        double seconds();

    private:
        int32_t m_scaled_seconds;
        specpr_t* m__root;
        specpr_t::data_initial_t* m__parent;

    public:
        int32_t scaled_seconds() const { return m_scaled_seconds; }
        specpr_t* _root() const { return m__root; }
        specpr_t::data_initial_t* _parent() const { return m__parent; }
    };

    /**
     * it is big endian
     */

    class icflag_t : public kaitai::kstruct {

    public:

        icflag_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent = 0, specpr_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~icflag_t();

    private:
        bool f_type;
        record_type_t m_type;

    public:
        record_type_t type();

    private:
        uint64_t m_reserved;
        bool m_isctb_type;
        bool m_iscta_type;
        bool m_coordinate_mode;
        bool m_errors;
        bool m_text;
        bool m_continuation;
        specpr_t* m__root;
        specpr_t::record_t* m__parent;

    public:
        uint64_t reserved() const { return m_reserved; }

        /**
         * =0 ctb is civil time
         * =1 ctb is universal time
         */
        bool isctb_type() const { return m_isctb_type; }

        /**
         * =0 cta is civil time
         * =1 cta is universal time
         */
        bool iscta_type() const { return m_iscta_type; }

        /**
         * RA, Dec / Long., Lat flag
         * =0 the array "ira" and "idec" corresponds to the right ascension and declination of an astronomical object.
         * =1 the array "ira" and "idec" correspond to the longitude and latitude of a spot on a planetary surface.
         */
        bool coordinate_mode() const { return m_coordinate_mode; }

        /**
         * flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.
         */
        bool errors() const { return m_errors; }

        /**
         * =0 the data in the array "data" is data
         * =1 the data in the array "data" is ascii text as is most of the header info.
         */
        bool text() const { return m_text; }

        /**
         * =0 first record of a spectrum consists of: header then 256 data channels
         * =1 continuation data record consisting of:
         *   # bit flags followed by 1532 bytes of
         *   # real data (bit 1=0) (383 channels)
         *   # or 1532 bytes of text (bit 1=1).
         *   # A maximum of 12 continuation records
         *   # are allowed for a total of 4852
         *   # channels (limited by arrays of 4864)
         *   # or 19860 characters of text (bit 1=1).
         */
        bool continuation() const { return m_continuation; }
        specpr_t* _root() const { return m__root; }
        specpr_t::record_t* _parent() const { return m__parent; }
    };

    class data_continuation_t : public kaitai::kstruct {

    public:

        data_continuation_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent = 0, specpr_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_continuation_t();

    private:
        std::vector<float>* m_cdata;
        specpr_t* m__root;
        specpr_t::record_t* m__parent;

    public:

        /**
         * The continuation of the data values (383 channels of 32 bit real numbers).
         */
        std::vector<float>* cdata() const { return m_cdata; }
        specpr_t* _root() const { return m__root; }
        specpr_t::record_t* _parent() const { return m__parent; }
    };

    class identifiers_t : public kaitai::kstruct {

    public:

        identifiers_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, specpr_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~identifiers_t();

    private:
        std::string m_ititle;
        std::string m_usernm;
        specpr_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * Title which describes the data
         */
        std::string ititle() const { return m_ititle; }

        /**
         * The name of the user who created the data record
         */
        std::string usernm() const { return m_usernm; }
        specpr_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class illum_angle_t : public kaitai::kstruct {

    public:

        illum_angle_t(kaitai::kstream* p__io, specpr_t::data_initial_t* p__parent = 0, specpr_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~illum_angle_t();

    private:
        bool f_seconds_total;
        int32_t m_seconds_total;

    public:
        int32_t seconds_total();

    private:
        bool f_minutes_total;
        int32_t m_minutes_total;

    public:
        int32_t minutes_total();

    private:
        bool f_degrees_total;
        int32_t m_degrees_total;

    public:
        int32_t degrees_total();

    private:
        int32_t m_angl;
        specpr_t* m__root;
        specpr_t::data_initial_t* m__parent;

    public:

        /**
         * (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg <= angle <= 90 deg)
         */
        int32_t angl() const { return m_angl; }
        specpr_t* _root() const { return m__root; }
        specpr_t::data_initial_t* _parent() const { return m__parent; }
    };

    class text_initial_t : public kaitai::kstruct {

    public:

        text_initial_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent = 0, specpr_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~text_initial_t();

    private:
        identifiers_t* m_ids;
        uint32_t m_itxtpt;
        int32_t m_itxtch;
        std::string m_itext;
        specpr_t* m__root;
        specpr_t::record_t* m__parent;

    public:
        identifiers_t* ids() const { return m_ids; }

        /**
         * Text data record pointer. This pointer points  to a data record where additional text may be may be found.
         */
        uint32_t itxtpt() const { return m_itxtpt; }

        /**
         * The number of text characters (maximum= 19860).
         */
        int32_t itxtch() const { return m_itxtch; }

        /**
         * 1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.
         */
        std::string itext() const { return m_itext; }
        specpr_t* _root() const { return m__root; }
        specpr_t::record_t* _parent() const { return m__parent; }
    };

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, specpr_t* p__parent = 0, specpr_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        icflag_t* m_icflag;
        kaitai::kstruct* m_content;
        bool n_content;

    public:
        bool _is_null_content() { content(); return n_content; };

    private:
        specpr_t* m__root;
        specpr_t* m__parent;
        std::string m__raw_content;
        kaitai::kstream* m__io__raw_content;

    public:

        /**
         * Total number of bytes comprising the document.
         */
        icflag_t* icflag() const { return m_icflag; }
        kaitai::kstruct* content() const { return m_content; }
        specpr_t* _root() const { return m__root; }
        specpr_t* _parent() const { return m__parent; }
        std::string _raw_content() const { return m__raw_content; }
        kaitai::kstream* _io__raw_content() const { return m__io__raw_content; }
    };

    class text_continuation_t : public kaitai::kstruct {

    public:

        text_continuation_t(kaitai::kstream* p__io, specpr_t::record_t* p__parent = 0, specpr_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~text_continuation_t();

    private:
        std::string m_tdata;
        specpr_t* m__root;
        specpr_t::record_t* m__parent;

    public:

        /**
         * 1532 characters of text.
         */
        std::string tdata() const { return m_tdata; }
        specpr_t* _root() const { return m__root; }
        specpr_t::record_t* _parent() const { return m__parent; }
    };

private:
    std::vector<record_t*>* m_records;
    specpr_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<record_t*>* records() const { return m_records; }
    specpr_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // SPECPR_H_
