#ifndef WAV_H_
#define WAV_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * The WAVE file format is a subset of Microsoft's RIFF specification for the
 * storage of multimedia files. A RIFF file starts out with a file header
 * followed by a sequence of data chunks. A WAVE file is often just a RIFF
 * file with a single "WAVE" chunk which consists of two sub-chunks --
 * a "fmt " chunk specifying the data format and a "data" chunk containing
 * the actual sample data, although other chunks exist and are used.
 * 
 * An extension of the file format is the Broadcast Wave Format (BWF) for radio
 * broadcasts. Sample files can be found at:
 * 
 * <https://www.bbc.co.uk/rd/publications/saqas>
 * 
 * This Kaitai implementation was written by John Byrd of Gigantic Software
 * (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
 * \sa http://soundfile.sapp.org/doc/WaveFormat/ Source
 * \sa http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html Source
 * \sa https://web.archive.org/web/20101031101749/http://www.ebu.ch/fr/technical/publications/userguides/bwf_user_guide.php Source
 */

class wav_t : public kaitai::kstruct {

public:
    class sample_type_t;
    class format_chunk_type_t;
    class pmx_chunk_type_t;
    class fact_chunk_type_t;
    class guid_type_t;
    class ixml_chunk_type_t;
    class info_chunk_type_t;
    class cue_point_type_t;
    class data_chunk_type_t;
    class samples_type_t;
    class channel_mask_and_subformat_type_t;
    class cue_chunk_type_t;
    class list_chunk_type_t;
    class channel_mask_type_t;
    class afsp_chunk_type_t;
    class axml_chunk_type_t;
    class chunk_type_t;
    class bext_chunk_type_t;

    enum w_format_tag_type_t {
        W_FORMAT_TAG_TYPE_UNKNOWN = 0,
        W_FORMAT_TAG_TYPE_PCM = 1,
        W_FORMAT_TAG_TYPE_ADPCM = 2,
        W_FORMAT_TAG_TYPE_IEEE_FLOAT = 3,
        W_FORMAT_TAG_TYPE_VSELP = 4,
        W_FORMAT_TAG_TYPE_IBM_CVSD = 5,
        W_FORMAT_TAG_TYPE_ALAW = 6,
        W_FORMAT_TAG_TYPE_MULAW = 7,
        W_FORMAT_TAG_TYPE_DTS = 8,
        W_FORMAT_TAG_TYPE_DRM = 9,
        W_FORMAT_TAG_TYPE_WMAVOICE9 = 10,
        W_FORMAT_TAG_TYPE_WMAVOICE10 = 11,
        W_FORMAT_TAG_TYPE_OKI_ADPCM = 16,
        W_FORMAT_TAG_TYPE_DVI_ADPCM = 17,
        W_FORMAT_TAG_TYPE_MEDIASPACE_ADPCM = 18,
        W_FORMAT_TAG_TYPE_SIERRA_ADPCM = 19,
        W_FORMAT_TAG_TYPE_G723_ADPCM = 20,
        W_FORMAT_TAG_TYPE_DIGISTD = 21,
        W_FORMAT_TAG_TYPE_DIGIFIX = 22,
        W_FORMAT_TAG_TYPE_DIALOGIC_OKI_ADPCM = 23,
        W_FORMAT_TAG_TYPE_MEDIAVISION_ADPCM = 24,
        W_FORMAT_TAG_TYPE_CU_CODEC = 25,
        W_FORMAT_TAG_TYPE_HP_DYN_VOICE = 26,
        W_FORMAT_TAG_TYPE_YAMAHA_ADPCM = 32,
        W_FORMAT_TAG_TYPE_SONARC = 33,
        W_FORMAT_TAG_TYPE_DSPGROUP_TRUESPEECH = 34,
        W_FORMAT_TAG_TYPE_ECHOSC1 = 35,
        W_FORMAT_TAG_TYPE_AUDIOFILE_AF36 = 36,
        W_FORMAT_TAG_TYPE_APTX = 37,
        W_FORMAT_TAG_TYPE_AUDIOFILE_AF10 = 38,
        W_FORMAT_TAG_TYPE_PROSODY_1612 = 39,
        W_FORMAT_TAG_TYPE_LRC = 40,
        W_FORMAT_TAG_TYPE_DOLBY_AC2 = 48,
        W_FORMAT_TAG_TYPE_GSM610 = 49,
        W_FORMAT_TAG_TYPE_MSNAUDIO = 50,
        W_FORMAT_TAG_TYPE_ANTEX_ADPCME = 51,
        W_FORMAT_TAG_TYPE_CONTROL_RES_VQLPC = 52,
        W_FORMAT_TAG_TYPE_DIGIREAL = 53,
        W_FORMAT_TAG_TYPE_DIGIADPCM = 54,
        W_FORMAT_TAG_TYPE_CONTROL_RES_CR10 = 55,
        W_FORMAT_TAG_TYPE_NMS_VBXADPCM = 56,
        W_FORMAT_TAG_TYPE_CS_IMAADPCM = 57,
        W_FORMAT_TAG_TYPE_ECHOSC3 = 58,
        W_FORMAT_TAG_TYPE_ROCKWELL_ADPCM = 59,
        W_FORMAT_TAG_TYPE_ROCKWELL_DIGITALK = 60,
        W_FORMAT_TAG_TYPE_XEBEC = 61,
        W_FORMAT_TAG_TYPE_G721_ADPCM = 64,
        W_FORMAT_TAG_TYPE_G728_CELP = 65,
        W_FORMAT_TAG_TYPE_MSG723 = 66,
        W_FORMAT_TAG_TYPE_INTEL_G723_1 = 67,
        W_FORMAT_TAG_TYPE_INTEL_G729 = 68,
        W_FORMAT_TAG_TYPE_SHARP_G726 = 69,
        W_FORMAT_TAG_TYPE_MPEG = 80,
        W_FORMAT_TAG_TYPE_RT24 = 82,
        W_FORMAT_TAG_TYPE_PAC = 83,
        W_FORMAT_TAG_TYPE_MPEGLAYER3 = 85,
        W_FORMAT_TAG_TYPE_LUCENT_G723 = 89,
        W_FORMAT_TAG_TYPE_CIRRUS = 96,
        W_FORMAT_TAG_TYPE_ESPCM = 97,
        W_FORMAT_TAG_TYPE_VOXWARE = 98,
        W_FORMAT_TAG_TYPE_CANOPUS_ATRAC = 99,
        W_FORMAT_TAG_TYPE_G726_ADPCM = 100,
        W_FORMAT_TAG_TYPE_G722_ADPCM = 101,
        W_FORMAT_TAG_TYPE_DSAT = 102,
        W_FORMAT_TAG_TYPE_DSAT_DISPLAY = 103,
        W_FORMAT_TAG_TYPE_VOXWARE_BYTE_ALIGNED = 105,
        W_FORMAT_TAG_TYPE_VOXWARE_AC8 = 112,
        W_FORMAT_TAG_TYPE_VOXWARE_AC10 = 113,
        W_FORMAT_TAG_TYPE_VOXWARE_AC16 = 114,
        W_FORMAT_TAG_TYPE_VOXWARE_AC20 = 115,
        W_FORMAT_TAG_TYPE_VOXWARE_RT24 = 116,
        W_FORMAT_TAG_TYPE_VOXWARE_RT29 = 117,
        W_FORMAT_TAG_TYPE_VOXWARE_RT29HW = 118,
        W_FORMAT_TAG_TYPE_VOXWARE_VR12 = 119,
        W_FORMAT_TAG_TYPE_VOXWARE_VR18 = 120,
        W_FORMAT_TAG_TYPE_VOXWARE_TQ40 = 121,
        W_FORMAT_TAG_TYPE_VOXWARE_SC3 = 122,
        W_FORMAT_TAG_TYPE_VOXWARE_SC3_1 = 123,
        W_FORMAT_TAG_TYPE_SOFTSOUND = 128,
        W_FORMAT_TAG_TYPE_VOXWARE_TQ60 = 129,
        W_FORMAT_TAG_TYPE_MSRT24 = 130,
        W_FORMAT_TAG_TYPE_G729A = 131,
        W_FORMAT_TAG_TYPE_MVI_MVI2 = 132,
        W_FORMAT_TAG_TYPE_DF_G726 = 133,
        W_FORMAT_TAG_TYPE_DF_GSM610 = 134,
        W_FORMAT_TAG_TYPE_ISIAUDIO = 136,
        W_FORMAT_TAG_TYPE_ONLIVE = 137,
        W_FORMAT_TAG_TYPE_MULTITUDE_FT_SX20 = 138,
        W_FORMAT_TAG_TYPE_INFOCOM_ITS_G721_ADPCM = 139,
        W_FORMAT_TAG_TYPE_CONVEDIA_G729 = 140,
        W_FORMAT_TAG_TYPE_CONGRUENCY = 141,
        W_FORMAT_TAG_TYPE_SBC24 = 145,
        W_FORMAT_TAG_TYPE_DOLBY_AC3_SPDIF = 146,
        W_FORMAT_TAG_TYPE_MEDIASONIC_G723 = 147,
        W_FORMAT_TAG_TYPE_PROSODY_8KBPS = 148,
        W_FORMAT_TAG_TYPE_ZYXEL_ADPCM = 151,
        W_FORMAT_TAG_TYPE_PHILIPS_LPCBB = 152,
        W_FORMAT_TAG_TYPE_PACKED = 153,
        W_FORMAT_TAG_TYPE_MALDEN_PHONYTALK = 160,
        W_FORMAT_TAG_TYPE_RACAL_RECORDER_GSM = 161,
        W_FORMAT_TAG_TYPE_RACAL_RECORDER_G720_A = 162,
        W_FORMAT_TAG_TYPE_RACAL_RECORDER_G723_1 = 163,
        W_FORMAT_TAG_TYPE_RACAL_RECORDER_TETRA_ACELP = 164,
        W_FORMAT_TAG_TYPE_NEC_AAC = 176,
        W_FORMAT_TAG_TYPE_RAW_AAC1 = 255,
        W_FORMAT_TAG_TYPE_RHETOREX_ADPCM = 256,
        W_FORMAT_TAG_TYPE_IRAT = 257,
        W_FORMAT_TAG_TYPE_VIVO_G723 = 273,
        W_FORMAT_TAG_TYPE_VIVO_SIREN = 274,
        W_FORMAT_TAG_TYPE_PHILIPS_CELP = 288,
        W_FORMAT_TAG_TYPE_PHILIPS_GRUNDIG = 289,
        W_FORMAT_TAG_TYPE_DIGITAL_G723 = 291,
        W_FORMAT_TAG_TYPE_SANYO_LD_ADPCM = 293,
        W_FORMAT_TAG_TYPE_SIPROLAB_ACEPLNET = 304,
        W_FORMAT_TAG_TYPE_SIPROLAB_ACELP4800 = 305,
        W_FORMAT_TAG_TYPE_SIPROLAB_ACELP8V3 = 306,
        W_FORMAT_TAG_TYPE_SIPROLAB_G729 = 307,
        W_FORMAT_TAG_TYPE_SIPROLAB_G729A = 308,
        W_FORMAT_TAG_TYPE_SIPROLAB_KELVIN = 309,
        W_FORMAT_TAG_TYPE_VOICEAGE_AMR = 310,
        W_FORMAT_TAG_TYPE_G726ADPCM = 320,
        W_FORMAT_TAG_TYPE_DICTAPHONE_CELP68 = 321,
        W_FORMAT_TAG_TYPE_DICTAPHONE_CELP54 = 322,
        W_FORMAT_TAG_TYPE_QUALCOMM_PUREVOICE = 336,
        W_FORMAT_TAG_TYPE_QUALCOMM_HALFRATE = 337,
        W_FORMAT_TAG_TYPE_TUBGSM = 341,
        W_FORMAT_TAG_TYPE_MSAUDIO1 = 352,
        W_FORMAT_TAG_TYPE_WMAUDIO2 = 353,
        W_FORMAT_TAG_TYPE_WMAUDIO3 = 354,
        W_FORMAT_TAG_TYPE_WMAUDIO_LOSSLESS = 355,
        W_FORMAT_TAG_TYPE_WMASPDIF = 356,
        W_FORMAT_TAG_TYPE_UNISYS_NAP_ADPCM = 368,
        W_FORMAT_TAG_TYPE_UNISYS_NAP_ULAW = 369,
        W_FORMAT_TAG_TYPE_UNISYS_NAP_ALAW = 370,
        W_FORMAT_TAG_TYPE_UNISYS_NAP_16K = 371,
        W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC008 = 372,
        W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_G726L = 373,
        W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_CELP54 = 374,
        W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_CELP68 = 375,
        W_FORMAT_TAG_TYPE_KNOWLEDGE_ADVENTURE_ADPCM = 376,
        W_FORMAT_TAG_TYPE_FRAUNHOFER_IIS_MPEG2_AAC = 384,
        W_FORMAT_TAG_TYPE_DTS_DS = 400,
        W_FORMAT_TAG_TYPE_CREATIVE_ADPCM = 512,
        W_FORMAT_TAG_TYPE_CREATIVE_FASTSPEECH8 = 514,
        W_FORMAT_TAG_TYPE_CREATIVE_FASTSPEECH10 = 515,
        W_FORMAT_TAG_TYPE_UHER_ADPCM = 528,
        W_FORMAT_TAG_TYPE_ULEAD_DV_AUDIO = 533,
        W_FORMAT_TAG_TYPE_ULEAD_DV_AUDIO_1 = 534,
        W_FORMAT_TAG_TYPE_QUARTERDECK = 544,
        W_FORMAT_TAG_TYPE_ILINK_VC = 560,
        W_FORMAT_TAG_TYPE_RAW_SPORT = 576,
        W_FORMAT_TAG_TYPE_ESST_AC3 = 577,
        W_FORMAT_TAG_TYPE_GENERIC_PASSTHRU = 585,
        W_FORMAT_TAG_TYPE_IPI_HSX = 592,
        W_FORMAT_TAG_TYPE_IPI_RPELP = 593,
        W_FORMAT_TAG_TYPE_CS2 = 608,
        W_FORMAT_TAG_TYPE_SONY_SCX = 624,
        W_FORMAT_TAG_TYPE_SONY_SCY = 625,
        W_FORMAT_TAG_TYPE_SONY_ATRAC3 = 626,
        W_FORMAT_TAG_TYPE_SONY_SPC = 627,
        W_FORMAT_TAG_TYPE_TELUM_AUDIO = 640,
        W_FORMAT_TAG_TYPE_TELUM_IA_AUDIO = 641,
        W_FORMAT_TAG_TYPE_NORCOM_VOICE_SYSTEMS_ADPCM = 645,
        W_FORMAT_TAG_TYPE_FM_TOWNS_SND = 768,
        W_FORMAT_TAG_TYPE_MICRONAS = 848,
        W_FORMAT_TAG_TYPE_MICRONAS_CELP833 = 849,
        W_FORMAT_TAG_TYPE_BTV_DIGITAL = 1024,
        W_FORMAT_TAG_TYPE_INTEL_MUSIC_CODER = 1025,
        W_FORMAT_TAG_TYPE_INDEO_AUDIO = 1026,
        W_FORMAT_TAG_TYPE_QDESIGN_MUSIC = 1104,
        W_FORMAT_TAG_TYPE_ON2_VP7_AUDIO = 1280,
        W_FORMAT_TAG_TYPE_ON2_VP6_AUDIO = 1281,
        W_FORMAT_TAG_TYPE_VME_VMPCM = 1664,
        W_FORMAT_TAG_TYPE_TPC = 1665,
        W_FORMAT_TAG_TYPE_LIGHTWAVE_LOSSLESS = 2222,
        W_FORMAT_TAG_TYPE_OLIGSM = 4096,
        W_FORMAT_TAG_TYPE_OLIADPCM = 4097,
        W_FORMAT_TAG_TYPE_OLICELP = 4098,
        W_FORMAT_TAG_TYPE_OLISBC = 4099,
        W_FORMAT_TAG_TYPE_OLIOPR = 4100,
        W_FORMAT_TAG_TYPE_LH_CODEC = 4352,
        W_FORMAT_TAG_TYPE_LH_CODEC_CELP = 4353,
        W_FORMAT_TAG_TYPE_LH_CODEC_SBC8 = 4354,
        W_FORMAT_TAG_TYPE_LH_CODEC_SBC12 = 4355,
        W_FORMAT_TAG_TYPE_LH_CODEC_SBC16 = 4356,
        W_FORMAT_TAG_TYPE_NORRIS = 5120,
        W_FORMAT_TAG_TYPE_ISIAUDIO_2 = 5121,
        W_FORMAT_TAG_TYPE_SOUNDSPACE_MUSICOMPRESS = 5376,
        W_FORMAT_TAG_TYPE_MPEG_ADTS_AAC = 5632,
        W_FORMAT_TAG_TYPE_MPEG_RAW_AAC = 5633,
        W_FORMAT_TAG_TYPE_MPEG_LOAS = 5634,
        W_FORMAT_TAG_TYPE_NOKIA_MPEG_ADTS_AAC = 5640,
        W_FORMAT_TAG_TYPE_NOKIA_MPEG_RAW_AAC = 5641,
        W_FORMAT_TAG_TYPE_VODAFONE_MPEG_ADTS_AAC = 5642,
        W_FORMAT_TAG_TYPE_VODAFONE_MPEG_RAW_AAC = 5643,
        W_FORMAT_TAG_TYPE_MPEG_HEAAC = 5648,
        W_FORMAT_TAG_TYPE_VOXWARE_RT24_SPEECH = 6172,
        W_FORMAT_TAG_TYPE_SONICFOUNDRY_LOSSLESS = 6513,
        W_FORMAT_TAG_TYPE_INNINGS_TELECOM_ADPCM = 6521,
        W_FORMAT_TAG_TYPE_LUCENT_SX8300P = 7175,
        W_FORMAT_TAG_TYPE_LUCENT_SX5363S = 7180,
        W_FORMAT_TAG_TYPE_CUSEEME = 7939,
        W_FORMAT_TAG_TYPE_NTCSOFT_ALF2CM_ACM = 8132,
        W_FORMAT_TAG_TYPE_DVM = 8192,
        W_FORMAT_TAG_TYPE_DTS2 = 8193,
        W_FORMAT_TAG_TYPE_MAKEAVIS = 13075,
        W_FORMAT_TAG_TYPE_DIVIO_MPEG4_AAC = 16707,
        W_FORMAT_TAG_TYPE_NOKIA_ADAPTIVE_MULTIRATE = 16897,
        W_FORMAT_TAG_TYPE_DIVIO_G726 = 16963,
        W_FORMAT_TAG_TYPE_LEAD_SPEECH = 17228,
        W_FORMAT_TAG_TYPE_LEAD_VORBIS = 22092,
        W_FORMAT_TAG_TYPE_WAVPACK_AUDIO = 22358,
        W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_1 = 26447,
        W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_2 = 26448,
        W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_3 = 26449,
        W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_1_PLUS = 26479,
        W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_2_PLUS = 26480,
        W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_3_PLUS = 26481,
        W_FORMAT_TAG_TYPE_THREECOM_NBX = 28672,
        W_FORMAT_TAG_TYPE_FAAD_AAC = 28781,
        W_FORMAT_TAG_TYPE_AMR_NB = 29537,
        W_FORMAT_TAG_TYPE_AMR_WB = 29538,
        W_FORMAT_TAG_TYPE_AMR_WP = 29539,
        W_FORMAT_TAG_TYPE_GSM_AMR_CBR = 31265,
        W_FORMAT_TAG_TYPE_GSM_AMR_VBR_SID = 31266,
        W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_G723_1 = 41216,
        W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_AVQSBC = 41217,
        W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_SBC = 41218,
        W_FORMAT_TAG_TYPE_SYMBOL_G729_A = 41219,
        W_FORMAT_TAG_TYPE_VOICEAGE_AMR_WB = 41220,
        W_FORMAT_TAG_TYPE_INGENIENT_G726 = 41221,
        W_FORMAT_TAG_TYPE_MPEG4_AAC = 41222,
        W_FORMAT_TAG_TYPE_ENCORE_G726 = 41223,
        W_FORMAT_TAG_TYPE_ZOLL_ASAO = 41224,
        W_FORMAT_TAG_TYPE_SPEEX_VOICE = 41225,
        W_FORMAT_TAG_TYPE_VIANIX_MASC = 41226,
        W_FORMAT_TAG_TYPE_WM9_SPECTRUM_ANALYZER = 41227,
        W_FORMAT_TAG_TYPE_WMF_SPECTRUM_ANAYZER = 41228,
        W_FORMAT_TAG_TYPE_GSM_610 = 41229,
        W_FORMAT_TAG_TYPE_GSM_620 = 41230,
        W_FORMAT_TAG_TYPE_GSM_660 = 41231,
        W_FORMAT_TAG_TYPE_GSM_690 = 41232,
        W_FORMAT_TAG_TYPE_GSM_ADAPTIVE_MULTIRATE_WB = 41233,
        W_FORMAT_TAG_TYPE_POLYCOM_G722 = 41234,
        W_FORMAT_TAG_TYPE_POLYCOM_G728 = 41235,
        W_FORMAT_TAG_TYPE_POLYCOM_G729_A = 41236,
        W_FORMAT_TAG_TYPE_POLYCOM_SIREN = 41237,
        W_FORMAT_TAG_TYPE_GLOBAL_IP_ILBC = 41238,
        W_FORMAT_TAG_TYPE_RADIOTIME_TIME_SHIFT_RADIO = 41239,
        W_FORMAT_TAG_TYPE_NICE_ACA = 41240,
        W_FORMAT_TAG_TYPE_NICE_ADPCM = 41241,
        W_FORMAT_TAG_TYPE_VOCORD_G721 = 41242,
        W_FORMAT_TAG_TYPE_VOCORD_G726 = 41243,
        W_FORMAT_TAG_TYPE_VOCORD_G722_1 = 41244,
        W_FORMAT_TAG_TYPE_VOCORD_G728 = 41245,
        W_FORMAT_TAG_TYPE_VOCORD_G729 = 41246,
        W_FORMAT_TAG_TYPE_VOCORD_G729_A = 41247,
        W_FORMAT_TAG_TYPE_VOCORD_G723_1 = 41248,
        W_FORMAT_TAG_TYPE_VOCORD_LBC = 41249,
        W_FORMAT_TAG_TYPE_NICE_G728 = 41250,
        W_FORMAT_TAG_TYPE_FRANCE_TELECOM_G729 = 41251,
        W_FORMAT_TAG_TYPE_CODIAN = 41252,
        W_FORMAT_TAG_TYPE_FLAC = 61868,
        W_FORMAT_TAG_TYPE_EXTENSIBLE = 65534,
        W_FORMAT_TAG_TYPE_DEVELOPMENT = 65535
    };

    enum fourcc_t {
        FOURCC_ID3 = 540238953,
        FOURCC_CUE = 543520099,
        FOURCC_FMT = 544501094,
        FOURCC_WAVE = 1163280727,
        FOURCC_RIFF = 1179011410,
        FOURCC_PEAK = 1262568784,
        FOURCC_IXML = 1280137321,
        FOURCC_INFO = 1330007625,
        FOURCC_LIST = 1414744396,
        FOURCC_PMX = 1481461855,
        FOURCC_CHNA = 1634625635,
        FOURCC_DATA = 1635017060,
        FOURCC_UMID = 1684630901,
        FOURCC_MINF = 1718511981,
        FOURCC_AXML = 1819113569,
        FOURCC_REGN = 1852269938,
        FOURCC_AFSP = 1886611041,
        FOURCC_FACT = 1952670054,
        FOURCC_BEXT = 1954047330
    };

    wav_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, wav_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~wav_t();

    class sample_type_t : public kaitai::kstruct {

    public:

        sample_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~sample_type_t();

    private:
        uint16_t m_sample;
        wav_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint16_t sample() const { return m_sample; }
        wav_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class format_chunk_type_t : public kaitai::kstruct {

    public:

        format_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~format_chunk_type_t();

    private:
        bool f_is_extensible;
        bool m_is_extensible;

    public:
        bool is_extensible();

    private:
        bool f_is_basic_pcm;
        bool m_is_basic_pcm;

    public:
        bool is_basic_pcm();

    private:
        bool f_is_basic_float;
        bool m_is_basic_float;

    public:
        bool is_basic_float();

    private:
        bool f_is_cb_size_meaningful;
        bool m_is_cb_size_meaningful;

    public:
        bool is_cb_size_meaningful();

    private:
        w_format_tag_type_t m_w_format_tag;
        uint16_t m_n_channels;
        uint32_t m_n_samples_per_sec;
        uint32_t m_n_avg_bytes_per_sec;
        uint16_t m_n_block_align;
        uint16_t m_w_bits_per_sample;
        uint16_t m_cb_size;
        bool n_cb_size;

    public:
        bool _is_null_cb_size() { cb_size(); return n_cb_size; };

    private:
        uint16_t m_w_valid_bits_per_sample;
        bool n_w_valid_bits_per_sample;

    public:
        bool _is_null_w_valid_bits_per_sample() { w_valid_bits_per_sample(); return n_w_valid_bits_per_sample; };

    private:
        channel_mask_and_subformat_type_t* m_channel_mask_and_subformat;
        bool n_channel_mask_and_subformat;

    public:
        bool _is_null_channel_mask_and_subformat() { channel_mask_and_subformat(); return n_channel_mask_and_subformat; };

    private:
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:
        w_format_tag_type_t w_format_tag() const { return m_w_format_tag; }
        uint16_t n_channels() const { return m_n_channels; }
        uint32_t n_samples_per_sec() const { return m_n_samples_per_sec; }
        uint32_t n_avg_bytes_per_sec() const { return m_n_avg_bytes_per_sec; }
        uint16_t n_block_align() const { return m_n_block_align; }
        uint16_t w_bits_per_sample() const { return m_w_bits_per_sample; }
        uint16_t cb_size() const { return m_cb_size; }
        uint16_t w_valid_bits_per_sample() const { return m_w_valid_bits_per_sample; }
        channel_mask_and_subformat_type_t* channel_mask_and_subformat() const { return m_channel_mask_and_subformat; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

    class pmx_chunk_type_t : public kaitai::kstruct {

    public:

        pmx_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~pmx_chunk_type_t();

    private:
        std::string m_data;
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:

        /**
         * XMP data
         * \sa https://wwwimages2.adobe.com/content/dam/acom/en/devnet/xmp/pdfs/XMP%20SDK%20Release%20cc-2016-08/XMPSpecificationPart3.pdf Source
         */
        std::string data() const { return m_data; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

    /**
     * required for all non-PCM formats
     * (`w_format_tag != w_format_tag_type::pcm` or `not is_basic_pcm` in
     * `format_chunk_type` context)
     */

    class fact_chunk_type_t : public kaitai::kstruct {

    public:

        fact_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~fact_chunk_type_t();

    private:
        uint32_t m_num_samples_per_channel;
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:
        uint32_t num_samples_per_channel() const { return m_num_samples_per_channel; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

    class guid_type_t : public kaitai::kstruct {

    public:

        guid_type_t(kaitai::kstream* p__io, wav_t::channel_mask_and_subformat_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~guid_type_t();

    private:
        uint32_t m_data1;
        uint16_t m_data2;
        uint16_t m_data3;
        uint32_t m_data4;
        uint32_t m_data4a;
        wav_t* m__root;
        wav_t::channel_mask_and_subformat_type_t* m__parent;

    public:
        uint32_t data1() const { return m_data1; }
        uint16_t data2() const { return m_data2; }
        uint16_t data3() const { return m_data3; }
        uint32_t data4() const { return m_data4; }
        uint32_t data4a() const { return m_data4a; }
        wav_t* _root() const { return m__root; }
        wav_t::channel_mask_and_subformat_type_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://en.wikipedia.org/wiki/IXML Source
     */

    class ixml_chunk_type_t : public kaitai::kstruct {

    public:

        ixml_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~ixml_chunk_type_t();

    private:
        std::string m_data;
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:
        std::string data() const { return m_data; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

    class info_chunk_type_t : public kaitai::kstruct {

    public:

        info_chunk_type_t(kaitai::kstream* p__io, wav_t::list_chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~info_chunk_type_t();

    private:
        bool f_chunk_data;
        std::string m_chunk_data;

    public:
        std::string chunk_data();

    private:
        riff_t::chunk_t* m_chunk;
        wav_t* m__root;
        wav_t::list_chunk_type_t* m__parent;

    public:
        riff_t::chunk_t* chunk() const { return m_chunk; }
        wav_t* _root() const { return m__root; }
        wav_t::list_chunk_type_t* _parent() const { return m__parent; }
    };

    class cue_point_type_t : public kaitai::kstruct {

    public:

        cue_point_type_t(kaitai::kstream* p__io, wav_t::cue_chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cue_point_type_t();

    private:
        uint32_t m_dw_name;
        uint32_t m_dw_position;
        uint32_t m_fcc_chunk;
        uint32_t m_dw_chunk_start;
        uint32_t m_dw_block_start;
        uint32_t m_dw_sample_offset;
        wav_t* m__root;
        wav_t::cue_chunk_type_t* m__parent;

    public:
        uint32_t dw_name() const { return m_dw_name; }
        uint32_t dw_position() const { return m_dw_position; }
        uint32_t fcc_chunk() const { return m_fcc_chunk; }
        uint32_t dw_chunk_start() const { return m_dw_chunk_start; }
        uint32_t dw_block_start() const { return m_dw_block_start; }
        uint32_t dw_sample_offset() const { return m_dw_sample_offset; }
        wav_t* _root() const { return m__root; }
        wav_t::cue_chunk_type_t* _parent() const { return m__parent; }
    };

    class data_chunk_type_t : public kaitai::kstruct {

    public:

        data_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_chunk_type_t();

    private:
        std::string m_data;
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:
        std::string data() const { return m_data; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

    class samples_type_t : public kaitai::kstruct {

    public:

        samples_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~samples_type_t();

    private:
        uint32_t m_samples;
        wav_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t samples() const { return m_samples; }
        wav_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class channel_mask_and_subformat_type_t : public kaitai::kstruct {

    public:

        channel_mask_and_subformat_type_t(kaitai::kstream* p__io, wav_t::format_chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~channel_mask_and_subformat_type_t();

    private:
        channel_mask_type_t* m_dw_channel_mask;
        guid_type_t* m_subformat;
        wav_t* m__root;
        wav_t::format_chunk_type_t* m__parent;

    public:
        channel_mask_type_t* dw_channel_mask() const { return m_dw_channel_mask; }
        guid_type_t* subformat() const { return m_subformat; }
        wav_t* _root() const { return m__root; }
        wav_t::format_chunk_type_t* _parent() const { return m__parent; }
    };

    class cue_chunk_type_t : public kaitai::kstruct {

    public:

        cue_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~cue_chunk_type_t();

    private:
        uint32_t m_dw_cue_points;
        std::vector<cue_point_type_t*>* m_cue_points;
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:
        uint32_t dw_cue_points() const { return m_dw_cue_points; }
        std::vector<cue_point_type_t*>* cue_points() const { return m_cue_points; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

    class list_chunk_type_t : public kaitai::kstruct {

    public:

        list_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~list_chunk_type_t();

    private:
        bool f_form_type;
        fourcc_t m_form_type;

    public:
        fourcc_t form_type();

    private:
        bool f_subchunks;
        std::vector<info_chunk_type_t*>* m_subchunks;

    public:
        std::vector<info_chunk_type_t*>* subchunks();

    private:
        riff_t::parent_chunk_data_t* m_parent_chunk_data;
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:
        riff_t::parent_chunk_data_t* parent_chunk_data() const { return m_parent_chunk_data; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

    class channel_mask_type_t : public kaitai::kstruct {

    public:

        channel_mask_type_t(kaitai::kstream* p__io, wav_t::channel_mask_and_subformat_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~channel_mask_type_t();

    private:
        bool m_front_right_of_center;
        bool m_front_left_of_center;
        bool m_back_right;
        bool m_back_left;
        bool m_low_frequency;
        bool m_front_center;
        bool m_front_right;
        bool m_front_left;
        bool m_top_center;
        bool m_side_right;
        bool m_side_left;
        bool m_back_center;
        bool m_top_back_left;
        bool m_top_front_right;
        bool m_top_front_center;
        bool m_top_front_left;
        uint64_t m_unused1;
        bool m_top_back_right;
        bool m_top_back_center;
        uint64_t m_unused2;
        wav_t* m__root;
        wav_t::channel_mask_and_subformat_type_t* m__parent;

    public:
        bool front_right_of_center() const { return m_front_right_of_center; }
        bool front_left_of_center() const { return m_front_left_of_center; }
        bool back_right() const { return m_back_right; }
        bool back_left() const { return m_back_left; }
        bool low_frequency() const { return m_low_frequency; }
        bool front_center() const { return m_front_center; }
        bool front_right() const { return m_front_right; }
        bool front_left() const { return m_front_left; }
        bool top_center() const { return m_top_center; }
        bool side_right() const { return m_side_right; }
        bool side_left() const { return m_side_left; }
        bool back_center() const { return m_back_center; }
        bool top_back_left() const { return m_top_back_left; }
        bool top_front_right() const { return m_top_front_right; }
        bool top_front_center() const { return m_top_front_center; }
        bool top_front_left() const { return m_top_front_left; }
        uint64_t unused1() const { return m_unused1; }
        bool top_back_right() const { return m_top_back_right; }
        bool top_back_center() const { return m_top_back_center; }
        uint64_t unused2() const { return m_unused2; }
        wav_t* _root() const { return m__root; }
        wav_t::channel_mask_and_subformat_type_t* _parent() const { return m__parent; }
    };

    /**
     * \sa http://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/ Source
     */

    class afsp_chunk_type_t : public kaitai::kstruct {

    public:

        afsp_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~afsp_chunk_type_t();

    private:
        std::string m_magic;
        std::vector<std::string>* m_info_records;
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * An array of AFsp information records, in the `<field_name>: <value>`
         * format (e.g. "`program: CopyAudio`"). The list of existing information
         * record types are available in the `doc-ref` links.
         * \sa http://www-mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AFsetInfo.html Source
         * \sa http://www-mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AFprintInfoRecs.html Source
         */
        std::vector<std::string>* info_records() const { return m_info_records; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://tech.ebu.ch/docs/tech/tech3285s5.pdf Source
     */

    class axml_chunk_type_t : public kaitai::kstruct {

    public:

        axml_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~axml_chunk_type_t();

    private:
        std::string m_data;
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:
        std::string data() const { return m_data; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

    class chunk_type_t : public kaitai::kstruct {

    public:

        chunk_type_t(kaitai::kstream* p__io, wav_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~chunk_type_t();

    private:
        bool f_chunk_id;
        fourcc_t m_chunk_id;

    public:
        fourcc_t chunk_id();

    private:
        bool f_chunk_data;
        kaitai::kstruct* m_chunk_data;
        bool n_chunk_data;

    public:
        bool _is_null_chunk_data() { chunk_data(); return n_chunk_data; };

    private:

    public:
        kaitai::kstruct* chunk_data();

    private:
        riff_t::chunk_t* m_chunk;
        wav_t* m__root;
        wav_t* m__parent;

    public:
        riff_t::chunk_t* chunk() const { return m_chunk; }
        wav_t* _root() const { return m__root; }
        wav_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://en.wikipedia.org/wiki/Broadcast_Wave_Format Source
     */

    class bext_chunk_type_t : public kaitai::kstruct {

    public:

        bext_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent = 0, wav_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~bext_chunk_type_t();

    private:
        std::string m_description;
        std::string m_originator;
        std::string m_originator_reference;
        std::string m_origination_date;
        std::string m_origination_time;
        uint32_t m_time_reference_low;
        uint32_t m_time_reference_high;
        uint16_t m_version;
        std::string m_umid;
        uint16_t m_loudness_value;
        uint16_t m_loudness_range;
        uint16_t m_max_true_peak_level;
        uint16_t m_max_momentary_loudness;
        uint16_t m_max_short_term_loudness;
        wav_t* m__root;
        wav_t::chunk_type_t* m__parent;

    public:
        std::string description() const { return m_description; }
        std::string originator() const { return m_originator; }
        std::string originator_reference() const { return m_originator_reference; }
        std::string origination_date() const { return m_origination_date; }
        std::string origination_time() const { return m_origination_time; }
        uint32_t time_reference_low() const { return m_time_reference_low; }
        uint32_t time_reference_high() const { return m_time_reference_high; }
        uint16_t version() const { return m_version; }
        std::string umid() const { return m_umid; }
        uint16_t loudness_value() const { return m_loudness_value; }
        uint16_t loudness_range() const { return m_loudness_range; }
        uint16_t max_true_peak_level() const { return m_max_true_peak_level; }
        uint16_t max_momentary_loudness() const { return m_max_momentary_loudness; }
        uint16_t max_short_term_loudness() const { return m_max_short_term_loudness; }
        wav_t* _root() const { return m__root; }
        wav_t::chunk_type_t* _parent() const { return m__parent; }
    };

private:
    bool f_subchunks;
    std::vector<chunk_type_t*>* m_subchunks;
    bool n_subchunks;

public:
    bool _is_null_subchunks() { subchunks(); return n_subchunks; };

private:

public:
    std::vector<chunk_type_t*>* subchunks();

private:
    bool f_parent_chunk_data;
    riff_t::parent_chunk_data_t* m_parent_chunk_data;
    bool n_parent_chunk_data;

public:
    bool _is_null_parent_chunk_data() { parent_chunk_data(); return n_parent_chunk_data; };

private:

public:
    riff_t::parent_chunk_data_t* parent_chunk_data();

private:
    bool f_is_form_type_wave;
    bool m_is_form_type_wave;

public:
    bool is_form_type_wave();

private:
    bool f_is_riff_chunk;
    bool m_is_riff_chunk;

public:
    bool is_riff_chunk();

private:
    bool f_chunk_id;
    fourcc_t m_chunk_id;

public:
    fourcc_t chunk_id();

private:
    bool f_form_type;
    fourcc_t m_form_type;

public:
    fourcc_t form_type();

private:
    riff_t::chunk_t* m_chunk;
    wav_t* m__root;
    kaitai::kstruct* m__parent;

public:
    riff_t::chunk_t* chunk() const { return m_chunk; }
    wav_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // WAV_H_
