// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "wav.h"
#include "kaitai/exceptions.h"
const std::set<wav_t::fourcc_t> wav_t::_values_fourcc_t{
    wav_t::FOURCC_ID3,
    wav_t::FOURCC_CUE,
    wav_t::FOURCC_FMT,
    wav_t::FOURCC_WAVE,
    wav_t::FOURCC_RIFF,
    wav_t::FOURCC_PEAK,
    wav_t::FOURCC_IXML,
    wav_t::FOURCC_INFO,
    wav_t::FOURCC_LIST,
    wav_t::FOURCC_PMX,
    wav_t::FOURCC_CHNA,
    wav_t::FOURCC_DATA,
    wav_t::FOURCC_UMID,
    wav_t::FOURCC_MINF,
    wav_t::FOURCC_AXML,
    wav_t::FOURCC_REGN,
    wav_t::FOURCC_AFSP,
    wav_t::FOURCC_FACT,
    wav_t::FOURCC_BEXT,
};
bool wav_t::_is_defined_fourcc_t(wav_t::fourcc_t v) {
    return wav_t::_values_fourcc_t.find(v) != wav_t::_values_fourcc_t.end();
}
const std::set<wav_t::w_format_tag_type_t> wav_t::_values_w_format_tag_type_t{
    wav_t::W_FORMAT_TAG_TYPE_UNKNOWN,
    wav_t::W_FORMAT_TAG_TYPE_PCM,
    wav_t::W_FORMAT_TAG_TYPE_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_IEEE_FLOAT,
    wav_t::W_FORMAT_TAG_TYPE_VSELP,
    wav_t::W_FORMAT_TAG_TYPE_IBM_CVSD,
    wav_t::W_FORMAT_TAG_TYPE_ALAW,
    wav_t::W_FORMAT_TAG_TYPE_MULAW,
    wav_t::W_FORMAT_TAG_TYPE_DTS,
    wav_t::W_FORMAT_TAG_TYPE_DRM,
    wav_t::W_FORMAT_TAG_TYPE_WMAVOICE9,
    wav_t::W_FORMAT_TAG_TYPE_WMAVOICE10,
    wav_t::W_FORMAT_TAG_TYPE_OKI_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_DVI_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_MEDIASPACE_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_SIERRA_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_G723_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_DIGISTD,
    wav_t::W_FORMAT_TAG_TYPE_DIGIFIX,
    wav_t::W_FORMAT_TAG_TYPE_DIALOGIC_OKI_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_MEDIAVISION_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_CU_CODEC,
    wav_t::W_FORMAT_TAG_TYPE_HP_DYN_VOICE,
    wav_t::W_FORMAT_TAG_TYPE_YAMAHA_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_SONARC,
    wav_t::W_FORMAT_TAG_TYPE_DSPGROUP_TRUESPEECH,
    wav_t::W_FORMAT_TAG_TYPE_ECHOSC1,
    wav_t::W_FORMAT_TAG_TYPE_AUDIOFILE_AF36,
    wav_t::W_FORMAT_TAG_TYPE_APTX,
    wav_t::W_FORMAT_TAG_TYPE_AUDIOFILE_AF10,
    wav_t::W_FORMAT_TAG_TYPE_PROSODY_1612,
    wav_t::W_FORMAT_TAG_TYPE_LRC,
    wav_t::W_FORMAT_TAG_TYPE_DOLBY_AC2,
    wav_t::W_FORMAT_TAG_TYPE_GSM610,
    wav_t::W_FORMAT_TAG_TYPE_MSNAUDIO,
    wav_t::W_FORMAT_TAG_TYPE_ANTEX_ADPCME,
    wav_t::W_FORMAT_TAG_TYPE_CONTROL_RES_VQLPC,
    wav_t::W_FORMAT_TAG_TYPE_DIGIREAL,
    wav_t::W_FORMAT_TAG_TYPE_DIGIADPCM,
    wav_t::W_FORMAT_TAG_TYPE_CONTROL_RES_CR10,
    wav_t::W_FORMAT_TAG_TYPE_NMS_VBXADPCM,
    wav_t::W_FORMAT_TAG_TYPE_CS_IMAADPCM,
    wav_t::W_FORMAT_TAG_TYPE_ECHOSC3,
    wav_t::W_FORMAT_TAG_TYPE_ROCKWELL_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_ROCKWELL_DIGITALK,
    wav_t::W_FORMAT_TAG_TYPE_XEBEC,
    wav_t::W_FORMAT_TAG_TYPE_G721_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_G728_CELP,
    wav_t::W_FORMAT_TAG_TYPE_MSG723,
    wav_t::W_FORMAT_TAG_TYPE_INTEL_G723_1,
    wav_t::W_FORMAT_TAG_TYPE_INTEL_G729,
    wav_t::W_FORMAT_TAG_TYPE_SHARP_G726,
    wav_t::W_FORMAT_TAG_TYPE_MPEG,
    wav_t::W_FORMAT_TAG_TYPE_RT24,
    wav_t::W_FORMAT_TAG_TYPE_PAC,
    wav_t::W_FORMAT_TAG_TYPE_MPEGLAYER3,
    wav_t::W_FORMAT_TAG_TYPE_LUCENT_G723,
    wav_t::W_FORMAT_TAG_TYPE_CIRRUS,
    wav_t::W_FORMAT_TAG_TYPE_ESPCM,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE,
    wav_t::W_FORMAT_TAG_TYPE_CANOPUS_ATRAC,
    wav_t::W_FORMAT_TAG_TYPE_G726_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_G722_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_DSAT,
    wav_t::W_FORMAT_TAG_TYPE_DSAT_DISPLAY,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_BYTE_ALIGNED,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_AC8,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_AC10,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_AC16,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_AC20,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_RT24,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_RT29,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_RT29HW,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_VR12,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_VR18,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_TQ40,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_SC3,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_SC3_1,
    wav_t::W_FORMAT_TAG_TYPE_SOFTSOUND,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_TQ60,
    wav_t::W_FORMAT_TAG_TYPE_MSRT24,
    wav_t::W_FORMAT_TAG_TYPE_G729A,
    wav_t::W_FORMAT_TAG_TYPE_MVI_MVI2,
    wav_t::W_FORMAT_TAG_TYPE_DF_G726,
    wav_t::W_FORMAT_TAG_TYPE_DF_GSM610,
    wav_t::W_FORMAT_TAG_TYPE_ISIAUDIO,
    wav_t::W_FORMAT_TAG_TYPE_ONLIVE,
    wav_t::W_FORMAT_TAG_TYPE_MULTITUDE_FT_SX20,
    wav_t::W_FORMAT_TAG_TYPE_INFOCOM_ITS_G721_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_CONVEDIA_G729,
    wav_t::W_FORMAT_TAG_TYPE_CONGRUENCY,
    wav_t::W_FORMAT_TAG_TYPE_SBC24,
    wav_t::W_FORMAT_TAG_TYPE_DOLBY_AC3_SPDIF,
    wav_t::W_FORMAT_TAG_TYPE_MEDIASONIC_G723,
    wav_t::W_FORMAT_TAG_TYPE_PROSODY_8KBPS,
    wav_t::W_FORMAT_TAG_TYPE_ZYXEL_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_PHILIPS_LPCBB,
    wav_t::W_FORMAT_TAG_TYPE_PACKED,
    wav_t::W_FORMAT_TAG_TYPE_MALDEN_PHONYTALK,
    wav_t::W_FORMAT_TAG_TYPE_RACAL_RECORDER_GSM,
    wav_t::W_FORMAT_TAG_TYPE_RACAL_RECORDER_G720_A,
    wav_t::W_FORMAT_TAG_TYPE_RACAL_RECORDER_G723_1,
    wav_t::W_FORMAT_TAG_TYPE_RACAL_RECORDER_TETRA_ACELP,
    wav_t::W_FORMAT_TAG_TYPE_NEC_AAC,
    wav_t::W_FORMAT_TAG_TYPE_RAW_AAC1,
    wav_t::W_FORMAT_TAG_TYPE_RHETOREX_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_IRAT,
    wav_t::W_FORMAT_TAG_TYPE_VIVO_G723,
    wav_t::W_FORMAT_TAG_TYPE_VIVO_SIREN,
    wav_t::W_FORMAT_TAG_TYPE_PHILIPS_CELP,
    wav_t::W_FORMAT_TAG_TYPE_PHILIPS_GRUNDIG,
    wav_t::W_FORMAT_TAG_TYPE_DIGITAL_G723,
    wav_t::W_FORMAT_TAG_TYPE_SANYO_LD_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_ACEPLNET,
    wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_ACELP4800,
    wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_ACELP8V3,
    wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_G729,
    wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_G729A,
    wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_KELVIN,
    wav_t::W_FORMAT_TAG_TYPE_VOICEAGE_AMR,
    wav_t::W_FORMAT_TAG_TYPE_G726ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_DICTAPHONE_CELP68,
    wav_t::W_FORMAT_TAG_TYPE_DICTAPHONE_CELP54,
    wav_t::W_FORMAT_TAG_TYPE_QUALCOMM_PUREVOICE,
    wav_t::W_FORMAT_TAG_TYPE_QUALCOMM_HALFRATE,
    wav_t::W_FORMAT_TAG_TYPE_TUBGSM,
    wav_t::W_FORMAT_TAG_TYPE_MSAUDIO1,
    wav_t::W_FORMAT_TAG_TYPE_WMAUDIO2,
    wav_t::W_FORMAT_TAG_TYPE_WMAUDIO3,
    wav_t::W_FORMAT_TAG_TYPE_WMAUDIO_LOSSLESS,
    wav_t::W_FORMAT_TAG_TYPE_WMASPDIF,
    wav_t::W_FORMAT_TAG_TYPE_UNISYS_NAP_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_UNISYS_NAP_ULAW,
    wav_t::W_FORMAT_TAG_TYPE_UNISYS_NAP_ALAW,
    wav_t::W_FORMAT_TAG_TYPE_UNISYS_NAP_16K,
    wav_t::W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC008,
    wav_t::W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_G726L,
    wav_t::W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_CELP54,
    wav_t::W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_CELP68,
    wav_t::W_FORMAT_TAG_TYPE_KNOWLEDGE_ADVENTURE_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_FRAUNHOFER_IIS_MPEG2_AAC,
    wav_t::W_FORMAT_TAG_TYPE_DTS_DS,
    wav_t::W_FORMAT_TAG_TYPE_CREATIVE_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_CREATIVE_FASTSPEECH8,
    wav_t::W_FORMAT_TAG_TYPE_CREATIVE_FASTSPEECH10,
    wav_t::W_FORMAT_TAG_TYPE_UHER_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_ULEAD_DV_AUDIO,
    wav_t::W_FORMAT_TAG_TYPE_ULEAD_DV_AUDIO_1,
    wav_t::W_FORMAT_TAG_TYPE_QUARTERDECK,
    wav_t::W_FORMAT_TAG_TYPE_ILINK_VC,
    wav_t::W_FORMAT_TAG_TYPE_RAW_SPORT,
    wav_t::W_FORMAT_TAG_TYPE_ESST_AC3,
    wav_t::W_FORMAT_TAG_TYPE_GENERIC_PASSTHRU,
    wav_t::W_FORMAT_TAG_TYPE_IPI_HSX,
    wav_t::W_FORMAT_TAG_TYPE_IPI_RPELP,
    wav_t::W_FORMAT_TAG_TYPE_CS2,
    wav_t::W_FORMAT_TAG_TYPE_SONY_SCX,
    wav_t::W_FORMAT_TAG_TYPE_SONY_SCY,
    wav_t::W_FORMAT_TAG_TYPE_SONY_ATRAC3,
    wav_t::W_FORMAT_TAG_TYPE_SONY_SPC,
    wav_t::W_FORMAT_TAG_TYPE_TELUM_AUDIO,
    wav_t::W_FORMAT_TAG_TYPE_TELUM_IA_AUDIO,
    wav_t::W_FORMAT_TAG_TYPE_NORCOM_VOICE_SYSTEMS_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_FM_TOWNS_SND,
    wav_t::W_FORMAT_TAG_TYPE_MICRONAS,
    wav_t::W_FORMAT_TAG_TYPE_MICRONAS_CELP833,
    wav_t::W_FORMAT_TAG_TYPE_BTV_DIGITAL,
    wav_t::W_FORMAT_TAG_TYPE_INTEL_MUSIC_CODER,
    wav_t::W_FORMAT_TAG_TYPE_INDEO_AUDIO,
    wav_t::W_FORMAT_TAG_TYPE_QDESIGN_MUSIC,
    wav_t::W_FORMAT_TAG_TYPE_ON2_VP7_AUDIO,
    wav_t::W_FORMAT_TAG_TYPE_ON2_VP6_AUDIO,
    wav_t::W_FORMAT_TAG_TYPE_VME_VMPCM,
    wav_t::W_FORMAT_TAG_TYPE_TPC,
    wav_t::W_FORMAT_TAG_TYPE_LIGHTWAVE_LOSSLESS,
    wav_t::W_FORMAT_TAG_TYPE_OLIGSM,
    wav_t::W_FORMAT_TAG_TYPE_OLIADPCM,
    wav_t::W_FORMAT_TAG_TYPE_OLICELP,
    wav_t::W_FORMAT_TAG_TYPE_OLISBC,
    wav_t::W_FORMAT_TAG_TYPE_OLIOPR,
    wav_t::W_FORMAT_TAG_TYPE_LH_CODEC,
    wav_t::W_FORMAT_TAG_TYPE_LH_CODEC_CELP,
    wav_t::W_FORMAT_TAG_TYPE_LH_CODEC_SBC8,
    wav_t::W_FORMAT_TAG_TYPE_LH_CODEC_SBC12,
    wav_t::W_FORMAT_TAG_TYPE_LH_CODEC_SBC16,
    wav_t::W_FORMAT_TAG_TYPE_NORRIS,
    wav_t::W_FORMAT_TAG_TYPE_ISIAUDIO_2,
    wav_t::W_FORMAT_TAG_TYPE_SOUNDSPACE_MUSICOMPRESS,
    wav_t::W_FORMAT_TAG_TYPE_MPEG_ADTS_AAC,
    wav_t::W_FORMAT_TAG_TYPE_MPEG_RAW_AAC,
    wav_t::W_FORMAT_TAG_TYPE_MPEG_LOAS,
    wav_t::W_FORMAT_TAG_TYPE_NOKIA_MPEG_ADTS_AAC,
    wav_t::W_FORMAT_TAG_TYPE_NOKIA_MPEG_RAW_AAC,
    wav_t::W_FORMAT_TAG_TYPE_VODAFONE_MPEG_ADTS_AAC,
    wav_t::W_FORMAT_TAG_TYPE_VODAFONE_MPEG_RAW_AAC,
    wav_t::W_FORMAT_TAG_TYPE_MPEG_HEAAC,
    wav_t::W_FORMAT_TAG_TYPE_VOXWARE_RT24_SPEECH,
    wav_t::W_FORMAT_TAG_TYPE_SONICFOUNDRY_LOSSLESS,
    wav_t::W_FORMAT_TAG_TYPE_INNINGS_TELECOM_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_LUCENT_SX8300P,
    wav_t::W_FORMAT_TAG_TYPE_LUCENT_SX5363S,
    wav_t::W_FORMAT_TAG_TYPE_CUSEEME,
    wav_t::W_FORMAT_TAG_TYPE_NTCSOFT_ALF2CM_ACM,
    wav_t::W_FORMAT_TAG_TYPE_DVM,
    wav_t::W_FORMAT_TAG_TYPE_DTS2,
    wav_t::W_FORMAT_TAG_TYPE_MAKEAVIS,
    wav_t::W_FORMAT_TAG_TYPE_DIVIO_MPEG4_AAC,
    wav_t::W_FORMAT_TAG_TYPE_NOKIA_ADAPTIVE_MULTIRATE,
    wav_t::W_FORMAT_TAG_TYPE_DIVIO_G726,
    wav_t::W_FORMAT_TAG_TYPE_LEAD_SPEECH,
    wav_t::W_FORMAT_TAG_TYPE_LEAD_VORBIS,
    wav_t::W_FORMAT_TAG_TYPE_WAVPACK_AUDIO,
    wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_1,
    wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_2,
    wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_3,
    wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_1_PLUS,
    wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_2_PLUS,
    wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_3_PLUS,
    wav_t::W_FORMAT_TAG_TYPE_THREECOM_NBX,
    wav_t::W_FORMAT_TAG_TYPE_FAAD_AAC,
    wav_t::W_FORMAT_TAG_TYPE_AMR_NB,
    wav_t::W_FORMAT_TAG_TYPE_AMR_WB,
    wav_t::W_FORMAT_TAG_TYPE_AMR_WP,
    wav_t::W_FORMAT_TAG_TYPE_GSM_AMR_CBR,
    wav_t::W_FORMAT_TAG_TYPE_GSM_AMR_VBR_SID,
    wav_t::W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_G723_1,
    wav_t::W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_AVQSBC,
    wav_t::W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_SBC,
    wav_t::W_FORMAT_TAG_TYPE_SYMBOL_G729_A,
    wav_t::W_FORMAT_TAG_TYPE_VOICEAGE_AMR_WB,
    wav_t::W_FORMAT_TAG_TYPE_INGENIENT_G726,
    wav_t::W_FORMAT_TAG_TYPE_MPEG4_AAC,
    wav_t::W_FORMAT_TAG_TYPE_ENCORE_G726,
    wav_t::W_FORMAT_TAG_TYPE_ZOLL_ASAO,
    wav_t::W_FORMAT_TAG_TYPE_SPEEX_VOICE,
    wav_t::W_FORMAT_TAG_TYPE_VIANIX_MASC,
    wav_t::W_FORMAT_TAG_TYPE_WM9_SPECTRUM_ANALYZER,
    wav_t::W_FORMAT_TAG_TYPE_WMF_SPECTRUM_ANAYZER,
    wav_t::W_FORMAT_TAG_TYPE_GSM_610,
    wav_t::W_FORMAT_TAG_TYPE_GSM_620,
    wav_t::W_FORMAT_TAG_TYPE_GSM_660,
    wav_t::W_FORMAT_TAG_TYPE_GSM_690,
    wav_t::W_FORMAT_TAG_TYPE_GSM_ADAPTIVE_MULTIRATE_WB,
    wav_t::W_FORMAT_TAG_TYPE_POLYCOM_G722,
    wav_t::W_FORMAT_TAG_TYPE_POLYCOM_G728,
    wav_t::W_FORMAT_TAG_TYPE_POLYCOM_G729_A,
    wav_t::W_FORMAT_TAG_TYPE_POLYCOM_SIREN,
    wav_t::W_FORMAT_TAG_TYPE_GLOBAL_IP_ILBC,
    wav_t::W_FORMAT_TAG_TYPE_RADIOTIME_TIME_SHIFT_RADIO,
    wav_t::W_FORMAT_TAG_TYPE_NICE_ACA,
    wav_t::W_FORMAT_TAG_TYPE_NICE_ADPCM,
    wav_t::W_FORMAT_TAG_TYPE_VOCORD_G721,
    wav_t::W_FORMAT_TAG_TYPE_VOCORD_G726,
    wav_t::W_FORMAT_TAG_TYPE_VOCORD_G722_1,
    wav_t::W_FORMAT_TAG_TYPE_VOCORD_G728,
    wav_t::W_FORMAT_TAG_TYPE_VOCORD_G729,
    wav_t::W_FORMAT_TAG_TYPE_VOCORD_G729_A,
    wav_t::W_FORMAT_TAG_TYPE_VOCORD_G723_1,
    wav_t::W_FORMAT_TAG_TYPE_VOCORD_LBC,
    wav_t::W_FORMAT_TAG_TYPE_NICE_G728,
    wav_t::W_FORMAT_TAG_TYPE_FRANCE_TELECOM_G729,
    wav_t::W_FORMAT_TAG_TYPE_CODIAN,
    wav_t::W_FORMAT_TAG_TYPE_FLAC,
    wav_t::W_FORMAT_TAG_TYPE_EXTENSIBLE,
    wav_t::W_FORMAT_TAG_TYPE_DEVELOPMENT,
};
bool wav_t::_is_defined_w_format_tag_type_t(wav_t::w_format_tag_type_t v) {
    return wav_t::_values_w_format_tag_type_t.find(v) != wav_t::_values_w_format_tag_type_t.end();
}

wav_t::wav_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_chunk = nullptr;
    m_parent_chunk_data = nullptr;
    m_subchunks = nullptr;
    f_chunk_id = false;
    f_form_type = false;
    f_is_form_type_wave = false;
    f_is_riff_chunk = false;
    f_parent_chunk_data = false;
    f_subchunks = false;
    _read();
}

void wav_t::_read() {
    m_chunk = std::unique_ptr<riff_t::chunk_t>(new riff_t::chunk_t(m__io));
}

wav_t::~wav_t() {
    _clean_up();
}

void wav_t::_clean_up() {
    if (f_parent_chunk_data && !n_parent_chunk_data) {
    }
    if (f_subchunks && !n_subchunks) {
    }
}

wav_t::afsp_chunk_type_t::afsp_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_info_records = nullptr;
    _read();
}

void wav_t::afsp_chunk_type_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x41\x46\x73\x70", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x41\x46\x73\x70", 4), m_magic, m__io, std::string("/types/afsp_chunk_type/seq/0"));
    }
    m_info_records = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_info_records->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII")));
            i++;
        }
    }
}

wav_t::afsp_chunk_type_t::~afsp_chunk_type_t() {
    _clean_up();
}

void wav_t::afsp_chunk_type_t::_clean_up() {
}

wav_t::axml_chunk_type_t::axml_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::axml_chunk_type_t::_read() {
    m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

wav_t::axml_chunk_type_t::~axml_chunk_type_t() {
    _clean_up();
}

void wav_t::axml_chunk_type_t::_clean_up() {
}

wav_t::bext_chunk_type_t::bext_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::bext_chunk_type_t::_read() {
    m_description = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(256), 0, false), "ASCII");
    m_originator = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(32), 0, false), "ASCII");
    m_originator_reference = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(32), 0, false), "ASCII");
    m_origination_date = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), "ASCII");
    m_origination_time = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), "ASCII");
    m_time_reference_low = m__io->read_u4le();
    m_time_reference_high = m__io->read_u4le();
    m_version = m__io->read_u2le();
    m_umid = m__io->read_bytes(64);
    m_loudness_value = m__io->read_u2le();
    m_loudness_range = m__io->read_u2le();
    m_max_true_peak_level = m__io->read_u2le();
    m_max_momentary_loudness = m__io->read_u2le();
    m_max_short_term_loudness = m__io->read_u2le();
}

wav_t::bext_chunk_type_t::~bext_chunk_type_t() {
    _clean_up();
}

void wav_t::bext_chunk_type_t::_clean_up() {
}

wav_t::channel_mask_and_subformat_type_t::channel_mask_and_subformat_type_t(kaitai::kstream* p__io, wav_t::format_chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_dw_channel_mask = nullptr;
    m_subformat = nullptr;
    _read();
}

void wav_t::channel_mask_and_subformat_type_t::_read() {
    m_dw_channel_mask = std::unique_ptr<channel_mask_type_t>(new channel_mask_type_t(m__io, this, m__root));
    m_subformat = std::unique_ptr<guid_type_t>(new guid_type_t(m__io, this, m__root));
}

wav_t::channel_mask_and_subformat_type_t::~channel_mask_and_subformat_type_t() {
    _clean_up();
}

void wav_t::channel_mask_and_subformat_type_t::_clean_up() {
}

wav_t::channel_mask_type_t::channel_mask_type_t(kaitai::kstream* p__io, wav_t::channel_mask_and_subformat_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::channel_mask_type_t::_read() {
    m_front_right_of_center = m__io->read_bits_int_be(1);
    m_front_left_of_center = m__io->read_bits_int_be(1);
    m_back_right = m__io->read_bits_int_be(1);
    m_back_left = m__io->read_bits_int_be(1);
    m_low_frequency = m__io->read_bits_int_be(1);
    m_front_center = m__io->read_bits_int_be(1);
    m_front_right = m__io->read_bits_int_be(1);
    m_front_left = m__io->read_bits_int_be(1);
    m_top_center = m__io->read_bits_int_be(1);
    m_side_right = m__io->read_bits_int_be(1);
    m_side_left = m__io->read_bits_int_be(1);
    m_back_center = m__io->read_bits_int_be(1);
    m_top_back_left = m__io->read_bits_int_be(1);
    m_top_front_right = m__io->read_bits_int_be(1);
    m_top_front_center = m__io->read_bits_int_be(1);
    m_top_front_left = m__io->read_bits_int_be(1);
    m_unused1 = m__io->read_bits_int_be(6);
    m_top_back_right = m__io->read_bits_int_be(1);
    m_top_back_center = m__io->read_bits_int_be(1);
    m_unused2 = m__io->read_bits_int_be(8);
}

wav_t::channel_mask_type_t::~channel_mask_type_t() {
    _clean_up();
}

void wav_t::channel_mask_type_t::_clean_up() {
}

wav_t::chunk_type_t::chunk_type_t(kaitai::kstream* p__io, wav_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chunk = nullptr;
    f_chunk_data = false;
    f_chunk_id = false;
    _read();
}

void wav_t::chunk_type_t::_read() {
    m_chunk = std::unique_ptr<riff_t::chunk_t>(new riff_t::chunk_t(m__io));
}

wav_t::chunk_type_t::~chunk_type_t() {
    _clean_up();
}

void wav_t::chunk_type_t::_clean_up() {
    if (f_chunk_data && !n_chunk_data) {
    }
}

kaitai::kstruct* wav_t::chunk_type_t::chunk_data() {
    if (f_chunk_data)
        return m_chunk_data.get();
    f_chunk_data = true;
    kaitai::kstream *io = chunk()->data_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    n_chunk_data = true;
    switch (chunk_id()) {
    case wav_t::FOURCC_AFSP: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<afsp_chunk_type_t>(new afsp_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_AXML: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<axml_chunk_type_t>(new axml_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_BEXT: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<bext_chunk_type_t>(new bext_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_CUE: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<cue_chunk_type_t>(new cue_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_DATA: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<data_chunk_type_t>(new data_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_FACT: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<fact_chunk_type_t>(new fact_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_FMT: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<format_chunk_type_t>(new format_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_IXML: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<ixml_chunk_type_t>(new ixml_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_LIST: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<list_chunk_type_t>(new list_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_PMX: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<pmx_chunk_type_t>(new pmx_chunk_type_t(io, this, m__root));
        break;
    }
    }
    io->seek(_pos);
    return m_chunk_data.get();
}

wav_t::fourcc_t wav_t::chunk_type_t::chunk_id() {
    if (f_chunk_id)
        return m_chunk_id;
    f_chunk_id = true;
    m_chunk_id = static_cast<wav_t::fourcc_t>(chunk()->id());
    return m_chunk_id;
}

wav_t::cue_chunk_type_t::cue_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_cue_points = nullptr;
    _read();
}

void wav_t::cue_chunk_type_t::_read() {
    m_dw_cue_points = m__io->read_u4le();
    m_cue_points = std::unique_ptr<std::vector<std::unique_ptr<cue_point_type_t>>>(new std::vector<std::unique_ptr<cue_point_type_t>>());
    const int l_cue_points = dw_cue_points();
    for (int i = 0; i < l_cue_points; i++) {
        m_cue_points->push_back(std::move(std::unique_ptr<cue_point_type_t>(new cue_point_type_t(m__io, this, m__root))));
    }
}

wav_t::cue_chunk_type_t::~cue_chunk_type_t() {
    _clean_up();
}

void wav_t::cue_chunk_type_t::_clean_up() {
}

wav_t::cue_point_type_t::cue_point_type_t(kaitai::kstream* p__io, wav_t::cue_chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::cue_point_type_t::_read() {
    m_dw_name = m__io->read_u4le();
    m_dw_position = m__io->read_u4le();
    m_fcc_chunk = m__io->read_u4le();
    m_dw_chunk_start = m__io->read_u4le();
    m_dw_block_start = m__io->read_u4le();
    m_dw_sample_offset = m__io->read_u4le();
}

wav_t::cue_point_type_t::~cue_point_type_t() {
    _clean_up();
}

void wav_t::cue_point_type_t::_clean_up() {
}

wav_t::data_chunk_type_t::data_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::data_chunk_type_t::_read() {
    m_data = m__io->read_bytes_full();
}

wav_t::data_chunk_type_t::~data_chunk_type_t() {
    _clean_up();
}

void wav_t::data_chunk_type_t::_clean_up() {
}

wav_t::fact_chunk_type_t::fact_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::fact_chunk_type_t::_read() {
    m_num_samples_per_channel = m__io->read_u4le();
}

wav_t::fact_chunk_type_t::~fact_chunk_type_t() {
    _clean_up();
}

void wav_t::fact_chunk_type_t::_clean_up() {
}

wav_t::format_chunk_type_t::format_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_channel_mask_and_subformat = nullptr;
    f_is_basic_float = false;
    f_is_basic_pcm = false;
    f_is_cb_size_meaningful = false;
    f_is_extensible = false;
    _read();
}

void wav_t::format_chunk_type_t::_read() {
    m_w_format_tag = static_cast<wav_t::w_format_tag_type_t>(m__io->read_u2le());
    m_n_channels = m__io->read_u2le();
    m_n_samples_per_sec = m__io->read_u4le();
    m_n_avg_bytes_per_sec = m__io->read_u4le();
    m_n_block_align = m__io->read_u2le();
    m_w_bits_per_sample = m__io->read_u2le();
    n_cb_size = true;
    if (!(is_basic_pcm())) {
        n_cb_size = false;
        m_cb_size = m__io->read_u2le();
    }
    n_w_valid_bits_per_sample = true;
    if (is_cb_size_meaningful()) {
        n_w_valid_bits_per_sample = false;
        m_w_valid_bits_per_sample = m__io->read_u2le();
    }
    n_channel_mask_and_subformat = true;
    if (is_extensible()) {
        n_channel_mask_and_subformat = false;
        m_channel_mask_and_subformat = std::unique_ptr<channel_mask_and_subformat_type_t>(new channel_mask_and_subformat_type_t(m__io, this, m__root));
    }
}

wav_t::format_chunk_type_t::~format_chunk_type_t() {
    _clean_up();
}

void wav_t::format_chunk_type_t::_clean_up() {
    if (!n_cb_size) {
    }
    if (!n_w_valid_bits_per_sample) {
    }
    if (!n_channel_mask_and_subformat) {
    }
}

bool wav_t::format_chunk_type_t::is_basic_float() {
    if (f_is_basic_float)
        return m_is_basic_float;
    f_is_basic_float = true;
    m_is_basic_float = w_format_tag() == wav_t::W_FORMAT_TAG_TYPE_IEEE_FLOAT;
    return m_is_basic_float;
}

bool wav_t::format_chunk_type_t::is_basic_pcm() {
    if (f_is_basic_pcm)
        return m_is_basic_pcm;
    f_is_basic_pcm = true;
    m_is_basic_pcm = w_format_tag() == wav_t::W_FORMAT_TAG_TYPE_PCM;
    return m_is_basic_pcm;
}

bool wav_t::format_chunk_type_t::is_cb_size_meaningful() {
    if (f_is_cb_size_meaningful)
        return m_is_cb_size_meaningful;
    f_is_cb_size_meaningful = true;
    m_is_cb_size_meaningful =  ((!(is_basic_pcm())) && (cb_size() != 0)) ;
    return m_is_cb_size_meaningful;
}

bool wav_t::format_chunk_type_t::is_extensible() {
    if (f_is_extensible)
        return m_is_extensible;
    f_is_extensible = true;
    m_is_extensible = w_format_tag() == wav_t::W_FORMAT_TAG_TYPE_EXTENSIBLE;
    return m_is_extensible;
}

wav_t::guid_type_t::guid_type_t(kaitai::kstream* p__io, wav_t::channel_mask_and_subformat_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::guid_type_t::_read() {
    m_data1 = m__io->read_u4le();
    m_data2 = m__io->read_u2le();
    m_data3 = m__io->read_u2le();
    m_data4 = m__io->read_u4be();
    m_data4a = m__io->read_u4be();
}

wav_t::guid_type_t::~guid_type_t() {
    _clean_up();
}

void wav_t::guid_type_t::_clean_up() {
}

wav_t::info_chunk_type_t::info_chunk_type_t(kaitai::kstream* p__io, wav_t::list_chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chunk = nullptr;
    f_chunk_data = false;
    _read();
}

void wav_t::info_chunk_type_t::_read() {
    m_chunk = std::unique_ptr<riff_t::chunk_t>(new riff_t::chunk_t(m__io));
}

wav_t::info_chunk_type_t::~info_chunk_type_t() {
    _clean_up();
}

void wav_t::info_chunk_type_t::_clean_up() {
    if (f_chunk_data) {
    }
}

std::string wav_t::info_chunk_type_t::chunk_data() {
    if (f_chunk_data)
        return m_chunk_data;
    f_chunk_data = true;
    kaitai::kstream *io = chunk()->data_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_chunk_data = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "ASCII");
    io->seek(_pos);
    return m_chunk_data;
}

wav_t::ixml_chunk_type_t::ixml_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::ixml_chunk_type_t::_read() {
    m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

wav_t::ixml_chunk_type_t::~ixml_chunk_type_t() {
    _clean_up();
}

void wav_t::ixml_chunk_type_t::_clean_up() {
}

wav_t::list_chunk_type_t::list_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_parent_chunk_data = nullptr;
    m_subchunks = nullptr;
    f_form_type = false;
    f_subchunks = false;
    _read();
}

void wav_t::list_chunk_type_t::_read() {
    m_parent_chunk_data = std::unique_ptr<riff_t::parent_chunk_data_t>(new riff_t::parent_chunk_data_t(m__io));
}

wav_t::list_chunk_type_t::~list_chunk_type_t() {
    _clean_up();
}

void wav_t::list_chunk_type_t::_clean_up() {
    if (f_subchunks) {
    }
}

wav_t::fourcc_t wav_t::list_chunk_type_t::form_type() {
    if (f_form_type)
        return m_form_type;
    f_form_type = true;
    m_form_type = static_cast<wav_t::fourcc_t>(parent_chunk_data()->form_type());
    return m_form_type;
}

std::vector<std::unique_ptr<wav_t::info_chunk_type_t>>* wav_t::list_chunk_type_t::subchunks() {
    if (f_subchunks)
        return m_subchunks.get();
    f_subchunks = true;
    kaitai::kstream *io = parent_chunk_data()->subchunks_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_subchunks = std::unique_ptr<std::vector<std::unique_ptr<info_chunk_type_t>>>(new std::vector<std::unique_ptr<info_chunk_type_t>>());
    {
        int i = 0;
        while (!io->is_eof()) {
            switch (form_type()) {
            case wav_t::FOURCC_INFO: {
                m_subchunks->push_back(std::move(std::unique_ptr<info_chunk_type_t>(new info_chunk_type_t(io, this, m__root))));
                break;
            }
            }
            i++;
        }
    }
    io->seek(_pos);
    return m_subchunks.get();
}

wav_t::pmx_chunk_type_t::pmx_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::pmx_chunk_type_t::_read() {
    m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

wav_t::pmx_chunk_type_t::~pmx_chunk_type_t() {
    _clean_up();
}

void wav_t::pmx_chunk_type_t::_clean_up() {
}

wav_t::sample_type_t::sample_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::sample_type_t::_read() {
    m_sample = m__io->read_u2le();
}

wav_t::sample_type_t::~sample_type_t() {
    _clean_up();
}

void wav_t::sample_type_t::_clean_up() {
}

wav_t::samples_type_t::samples_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::samples_type_t::_read() {
    m_samples = m__io->read_u4le();
}

wav_t::samples_type_t::~samples_type_t() {
    _clean_up();
}

void wav_t::samples_type_t::_clean_up() {
}

wav_t::fourcc_t wav_t::chunk_id() {
    if (f_chunk_id)
        return m_chunk_id;
    f_chunk_id = true;
    m_chunk_id = static_cast<wav_t::fourcc_t>(chunk()->id());
    return m_chunk_id;
}

wav_t::fourcc_t wav_t::form_type() {
    if (f_form_type)
        return m_form_type;
    f_form_type = true;
    m_form_type = static_cast<wav_t::fourcc_t>(parent_chunk_data()->form_type());
    return m_form_type;
}

bool wav_t::is_form_type_wave() {
    if (f_is_form_type_wave)
        return m_is_form_type_wave;
    f_is_form_type_wave = true;
    m_is_form_type_wave =  ((is_riff_chunk()) && (form_type() == wav_t::FOURCC_WAVE)) ;
    return m_is_form_type_wave;
}

bool wav_t::is_riff_chunk() {
    if (f_is_riff_chunk)
        return m_is_riff_chunk;
    f_is_riff_chunk = true;
    m_is_riff_chunk = chunk_id() == wav_t::FOURCC_RIFF;
    return m_is_riff_chunk;
}

riff_t::parent_chunk_data_t* wav_t::parent_chunk_data() {
    if (f_parent_chunk_data)
        return m_parent_chunk_data.get();
    f_parent_chunk_data = true;
    n_parent_chunk_data = true;
    if (is_riff_chunk()) {
        n_parent_chunk_data = false;
        kaitai::kstream *io = chunk()->data_slot()->_io();
        std::streampos _pos = io->pos();
        io->seek(0);
        m_parent_chunk_data = std::unique_ptr<riff_t::parent_chunk_data_t>(new riff_t::parent_chunk_data_t(io));
        io->seek(_pos);
    }
    return m_parent_chunk_data.get();
}

std::vector<std::unique_ptr<wav_t::chunk_type_t>>* wav_t::subchunks() {
    if (f_subchunks)
        return m_subchunks.get();
    f_subchunks = true;
    n_subchunks = true;
    if (is_form_type_wave()) {
        n_subchunks = false;
        kaitai::kstream *io = parent_chunk_data()->subchunks_slot()->_io();
        std::streampos _pos = io->pos();
        io->seek(0);
        m_subchunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_type_t>>>(new std::vector<std::unique_ptr<chunk_type_t>>());
        {
            int i = 0;
            while (!io->is_eof()) {
                m_subchunks->push_back(std::move(std::unique_ptr<chunk_type_t>(new chunk_type_t(io, this, m__root))));
                i++;
            }
        }
        io->seek(_pos);
    }
    return m_subchunks.get();
}
