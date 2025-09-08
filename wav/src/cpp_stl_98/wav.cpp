// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "wav.h"
#include "kaitai/exceptions.h"
std::set<wav_t::fourcc_t> wav_t::_build_values_fourcc_t() {
    std::set<wav_t::fourcc_t> _t;
    _t.insert(wav_t::FOURCC_ID3);
    _t.insert(wav_t::FOURCC_CUE);
    _t.insert(wav_t::FOURCC_FMT);
    _t.insert(wav_t::FOURCC_WAVE);
    _t.insert(wav_t::FOURCC_RIFF);
    _t.insert(wav_t::FOURCC_PEAK);
    _t.insert(wav_t::FOURCC_IXML);
    _t.insert(wav_t::FOURCC_INFO);
    _t.insert(wav_t::FOURCC_LIST);
    _t.insert(wav_t::FOURCC_PMX);
    _t.insert(wav_t::FOURCC_CHNA);
    _t.insert(wav_t::FOURCC_DATA);
    _t.insert(wav_t::FOURCC_UMID);
    _t.insert(wav_t::FOURCC_MINF);
    _t.insert(wav_t::FOURCC_AXML);
    _t.insert(wav_t::FOURCC_REGN);
    _t.insert(wav_t::FOURCC_AFSP);
    _t.insert(wav_t::FOURCC_FACT);
    _t.insert(wav_t::FOURCC_BEXT);
    return _t;
}
const std::set<wav_t::fourcc_t> wav_t::_values_fourcc_t = wav_t::_build_values_fourcc_t();
bool wav_t::_is_defined_fourcc_t(wav_t::fourcc_t v) {
    return wav_t::_values_fourcc_t.find(v) != wav_t::_values_fourcc_t.end();
}
std::set<wav_t::w_format_tag_type_t> wav_t::_build_values_w_format_tag_type_t() {
    std::set<wav_t::w_format_tag_type_t> _t;
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_UNKNOWN);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_PCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_IEEE_FLOAT);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VSELP);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_IBM_CVSD);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ALAW);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MULAW);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DTS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DRM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_WMAVOICE9);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_WMAVOICE10);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OKI_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DVI_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MEDIASPACE_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SIERRA_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_G723_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DIGISTD);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DIGIFIX);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DIALOGIC_OKI_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MEDIAVISION_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CU_CODEC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_HP_DYN_VOICE);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_YAMAHA_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SONARC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DSPGROUP_TRUESPEECH);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ECHOSC1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_AUDIOFILE_AF36);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_APTX);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_AUDIOFILE_AF10);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_PROSODY_1612);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LRC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DOLBY_AC2);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GSM610);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MSNAUDIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ANTEX_ADPCME);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CONTROL_RES_VQLPC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DIGIREAL);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DIGIADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CONTROL_RES_CR10);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NMS_VBXADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CS_IMAADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ECHOSC3);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ROCKWELL_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ROCKWELL_DIGITALK);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_XEBEC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_G721_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_G728_CELP);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MSG723);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_INTEL_G723_1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_INTEL_G729);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SHARP_G726);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MPEG);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_RT24);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_PAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MPEGLAYER3);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LUCENT_G723);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CIRRUS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ESPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CANOPUS_ATRAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_G726_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_G722_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DSAT);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DSAT_DISPLAY);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_BYTE_ALIGNED);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_AC8);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_AC10);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_AC16);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_AC20);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_RT24);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_RT29);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_RT29HW);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_VR12);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_VR18);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_TQ40);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_SC3);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_SC3_1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SOFTSOUND);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_TQ60);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MSRT24);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_G729A);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MVI_MVI2);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DF_G726);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DF_GSM610);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ISIAUDIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ONLIVE);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MULTITUDE_FT_SX20);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_INFOCOM_ITS_G721_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CONVEDIA_G729);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CONGRUENCY);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SBC24);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DOLBY_AC3_SPDIF);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MEDIASONIC_G723);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_PROSODY_8KBPS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ZYXEL_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_PHILIPS_LPCBB);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_PACKED);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MALDEN_PHONYTALK);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_RACAL_RECORDER_GSM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_RACAL_RECORDER_G720_A);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_RACAL_RECORDER_G723_1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_RACAL_RECORDER_TETRA_ACELP);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NEC_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_RAW_AAC1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_RHETOREX_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_IRAT);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VIVO_G723);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VIVO_SIREN);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_PHILIPS_CELP);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_PHILIPS_GRUNDIG);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DIGITAL_G723);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SANYO_LD_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_ACEPLNET);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_ACELP4800);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_ACELP8V3);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_G729);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_G729A);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SIPROLAB_KELVIN);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOICEAGE_AMR);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_G726ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DICTAPHONE_CELP68);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DICTAPHONE_CELP54);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_QUALCOMM_PUREVOICE);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_QUALCOMM_HALFRATE);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_TUBGSM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MSAUDIO1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_WMAUDIO2);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_WMAUDIO3);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_WMAUDIO_LOSSLESS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_WMASPDIF);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_UNISYS_NAP_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_UNISYS_NAP_ULAW);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_UNISYS_NAP_ALAW);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_UNISYS_NAP_16K);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC008);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_G726L);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_CELP54);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_CELP68);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_KNOWLEDGE_ADVENTURE_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_FRAUNHOFER_IIS_MPEG2_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DTS_DS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CREATIVE_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CREATIVE_FASTSPEECH8);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CREATIVE_FASTSPEECH10);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_UHER_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ULEAD_DV_AUDIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ULEAD_DV_AUDIO_1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_QUARTERDECK);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ILINK_VC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_RAW_SPORT);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ESST_AC3);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GENERIC_PASSTHRU);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_IPI_HSX);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_IPI_RPELP);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CS2);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SONY_SCX);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SONY_SCY);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SONY_ATRAC3);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SONY_SPC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_TELUM_AUDIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_TELUM_IA_AUDIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NORCOM_VOICE_SYSTEMS_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_FM_TOWNS_SND);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MICRONAS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MICRONAS_CELP833);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_BTV_DIGITAL);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_INTEL_MUSIC_CODER);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_INDEO_AUDIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_QDESIGN_MUSIC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ON2_VP7_AUDIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ON2_VP6_AUDIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VME_VMPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_TPC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LIGHTWAVE_LOSSLESS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OLIGSM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OLIADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OLICELP);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OLISBC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OLIOPR);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LH_CODEC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LH_CODEC_CELP);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LH_CODEC_SBC8);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LH_CODEC_SBC12);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LH_CODEC_SBC16);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NORRIS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ISIAUDIO_2);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SOUNDSPACE_MUSICOMPRESS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MPEG_ADTS_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MPEG_RAW_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MPEG_LOAS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NOKIA_MPEG_ADTS_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NOKIA_MPEG_RAW_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VODAFONE_MPEG_ADTS_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VODAFONE_MPEG_RAW_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MPEG_HEAAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOXWARE_RT24_SPEECH);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SONICFOUNDRY_LOSSLESS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_INNINGS_TELECOM_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LUCENT_SX8300P);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LUCENT_SX5363S);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CUSEEME);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NTCSOFT_ALF2CM_ACM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DVM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DTS2);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MAKEAVIS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DIVIO_MPEG4_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NOKIA_ADAPTIVE_MULTIRATE);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DIVIO_G726);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LEAD_SPEECH);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_LEAD_VORBIS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_WAVPACK_AUDIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_2);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_3);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_1_PLUS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_2_PLUS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_3_PLUS);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_THREECOM_NBX);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_FAAD_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_AMR_NB);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_AMR_WB);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_AMR_WP);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GSM_AMR_CBR);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GSM_AMR_VBR_SID);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_G723_1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_AVQSBC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_SBC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SYMBOL_G729_A);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOICEAGE_AMR_WB);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_INGENIENT_G726);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_MPEG4_AAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ENCORE_G726);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_ZOLL_ASAO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_SPEEX_VOICE);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VIANIX_MASC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_WM9_SPECTRUM_ANALYZER);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_WMF_SPECTRUM_ANAYZER);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GSM_610);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GSM_620);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GSM_660);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GSM_690);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GSM_ADAPTIVE_MULTIRATE_WB);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_POLYCOM_G722);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_POLYCOM_G728);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_POLYCOM_G729_A);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_POLYCOM_SIREN);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_GLOBAL_IP_ILBC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_RADIOTIME_TIME_SHIFT_RADIO);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NICE_ACA);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NICE_ADPCM);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOCORD_G721);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOCORD_G726);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOCORD_G722_1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOCORD_G728);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOCORD_G729);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOCORD_G729_A);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOCORD_G723_1);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_VOCORD_LBC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_NICE_G728);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_FRANCE_TELECOM_G729);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_CODIAN);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_FLAC);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_EXTENSIBLE);
    _t.insert(wav_t::W_FORMAT_TAG_TYPE_DEVELOPMENT);
    return _t;
}
const std::set<wav_t::w_format_tag_type_t> wav_t::_values_w_format_tag_type_t = wav_t::_build_values_w_format_tag_type_t();
bool wav_t::_is_defined_w_format_tag_type_t(wav_t::w_format_tag_type_t v) {
    return wav_t::_values_w_format_tag_type_t.find(v) != wav_t::_values_w_format_tag_type_t.end();
}

wav_t::wav_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_chunk = 0;
    m_parent_chunk_data = 0;
    m_subchunks = 0;
    f_chunk_id = false;
    f_form_type = false;
    f_is_form_type_wave = false;
    f_is_riff_chunk = false;
    f_parent_chunk_data = false;
    f_subchunks = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wav_t::_read() {
    m_chunk = new riff_t::chunk_t(m__io);
}

wav_t::~wav_t() {
    _clean_up();
}

void wav_t::_clean_up() {
    if (m_chunk) {
        delete m_chunk; m_chunk = 0;
    }
    if (f_parent_chunk_data && !n_parent_chunk_data) {
        if (m_parent_chunk_data) {
            delete m_parent_chunk_data; m_parent_chunk_data = 0;
        }
    }
    if (f_subchunks && !n_subchunks) {
        if (m_subchunks) {
            for (std::vector<chunk_type_t*>::iterator it = m_subchunks->begin(); it != m_subchunks->end(); ++it) {
                delete *it;
            }
            delete m_subchunks; m_subchunks = 0;
        }
    }
}

wav_t::afsp_chunk_type_t::afsp_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_info_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wav_t::afsp_chunk_type_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x41\x46\x73\x70", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x41\x46\x73\x70", 4), m_magic, m__io, std::string("/types/afsp_chunk_type/seq/0"));
    }
    m_info_records = new std::vector<std::string>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_info_records->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII"));
            i++;
        }
    }
}

wav_t::afsp_chunk_type_t::~afsp_chunk_type_t() {
    _clean_up();
}

void wav_t::afsp_chunk_type_t::_clean_up() {
    if (m_info_records) {
        delete m_info_records; m_info_records = 0;
    }
}

wav_t::axml_chunk_type_t::axml_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_dw_channel_mask = 0;
    m_subformat = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wav_t::channel_mask_and_subformat_type_t::_read() {
    m_dw_channel_mask = new channel_mask_type_t(m__io, this, m__root);
    m_subformat = new guid_type_t(m__io, this, m__root);
}

wav_t::channel_mask_and_subformat_type_t::~channel_mask_and_subformat_type_t() {
    _clean_up();
}

void wav_t::channel_mask_and_subformat_type_t::_clean_up() {
    if (m_dw_channel_mask) {
        delete m_dw_channel_mask; m_dw_channel_mask = 0;
    }
    if (m_subformat) {
        delete m_subformat; m_subformat = 0;
    }
}

wav_t::channel_mask_type_t::channel_mask_type_t(kaitai::kstream* p__io, wav_t::channel_mask_and_subformat_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_chunk = 0;
    f_chunk_data = false;
    f_chunk_id = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wav_t::chunk_type_t::_read() {
    m_chunk = new riff_t::chunk_t(m__io);
}

wav_t::chunk_type_t::~chunk_type_t() {
    _clean_up();
}

void wav_t::chunk_type_t::_clean_up() {
    if (m_chunk) {
        delete m_chunk; m_chunk = 0;
    }
    if (f_chunk_data && !n_chunk_data) {
        if (m_chunk_data) {
            delete m_chunk_data; m_chunk_data = 0;
        }
    }
}

kaitai::kstruct* wav_t::chunk_type_t::chunk_data() {
    if (f_chunk_data)
        return m_chunk_data;
    f_chunk_data = true;
    kaitai::kstream *io = chunk()->data_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    n_chunk_data = true;
    switch (chunk_id()) {
    case wav_t::FOURCC_AFSP: {
        n_chunk_data = false;
        m_chunk_data = new afsp_chunk_type_t(io, this, m__root);
        break;
    }
    case wav_t::FOURCC_AXML: {
        n_chunk_data = false;
        m_chunk_data = new axml_chunk_type_t(io, this, m__root);
        break;
    }
    case wav_t::FOURCC_BEXT: {
        n_chunk_data = false;
        m_chunk_data = new bext_chunk_type_t(io, this, m__root);
        break;
    }
    case wav_t::FOURCC_CUE: {
        n_chunk_data = false;
        m_chunk_data = new cue_chunk_type_t(io, this, m__root);
        break;
    }
    case wav_t::FOURCC_DATA: {
        n_chunk_data = false;
        m_chunk_data = new data_chunk_type_t(io, this, m__root);
        break;
    }
    case wav_t::FOURCC_FACT: {
        n_chunk_data = false;
        m_chunk_data = new fact_chunk_type_t(io, this, m__root);
        break;
    }
    case wav_t::FOURCC_FMT: {
        n_chunk_data = false;
        m_chunk_data = new format_chunk_type_t(io, this, m__root);
        break;
    }
    case wav_t::FOURCC_IXML: {
        n_chunk_data = false;
        m_chunk_data = new ixml_chunk_type_t(io, this, m__root);
        break;
    }
    case wav_t::FOURCC_LIST: {
        n_chunk_data = false;
        m_chunk_data = new list_chunk_type_t(io, this, m__root);
        break;
    }
    case wav_t::FOURCC_PMX: {
        n_chunk_data = false;
        m_chunk_data = new pmx_chunk_type_t(io, this, m__root);
        break;
    }
    }
    io->seek(_pos);
    return m_chunk_data;
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
    m_cue_points = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wav_t::cue_chunk_type_t::_read() {
    m_dw_cue_points = m__io->read_u4le();
    m_cue_points = new std::vector<cue_point_type_t*>();
    const int l_cue_points = dw_cue_points();
    for (int i = 0; i < l_cue_points; i++) {
        m_cue_points->push_back(new cue_point_type_t(m__io, this, m__root));
    }
}

wav_t::cue_chunk_type_t::~cue_chunk_type_t() {
    _clean_up();
}

void wav_t::cue_chunk_type_t::_clean_up() {
    if (m_cue_points) {
        for (std::vector<cue_point_type_t*>::iterator it = m_cue_points->begin(); it != m_cue_points->end(); ++it) {
            delete *it;
        }
        delete m_cue_points; m_cue_points = 0;
    }
}

wav_t::cue_point_type_t::cue_point_type_t(kaitai::kstream* p__io, wav_t::cue_chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_channel_mask_and_subformat = 0;
    f_is_basic_float = false;
    f_is_basic_pcm = false;
    f_is_cb_size_meaningful = false;
    f_is_extensible = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        m_channel_mask_and_subformat = new channel_mask_and_subformat_type_t(m__io, this, m__root);
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
        if (m_channel_mask_and_subformat) {
            delete m_channel_mask_and_subformat; m_channel_mask_and_subformat = 0;
        }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_chunk = 0;
    f_chunk_data = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wav_t::info_chunk_type_t::_read() {
    m_chunk = new riff_t::chunk_t(m__io);
}

wav_t::info_chunk_type_t::~info_chunk_type_t() {
    _clean_up();
}

void wav_t::info_chunk_type_t::_clean_up() {
    if (m_chunk) {
        delete m_chunk; m_chunk = 0;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_parent_chunk_data = 0;
    m_subchunks = 0;
    f_form_type = false;
    f_subchunks = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wav_t::list_chunk_type_t::_read() {
    m_parent_chunk_data = new riff_t::parent_chunk_data_t(m__io);
}

wav_t::list_chunk_type_t::~list_chunk_type_t() {
    _clean_up();
}

void wav_t::list_chunk_type_t::_clean_up() {
    if (m_parent_chunk_data) {
        delete m_parent_chunk_data; m_parent_chunk_data = 0;
    }
    if (f_subchunks) {
        if (m_subchunks) {
            for (std::vector<info_chunk_type_t*>::iterator it = m_subchunks->begin(); it != m_subchunks->end(); ++it) {
                delete *it;
            }
            delete m_subchunks; m_subchunks = 0;
        }
    }
}

wav_t::fourcc_t wav_t::list_chunk_type_t::form_type() {
    if (f_form_type)
        return m_form_type;
    f_form_type = true;
    m_form_type = static_cast<wav_t::fourcc_t>(parent_chunk_data()->form_type());
    return m_form_type;
}

std::vector<wav_t::info_chunk_type_t*>* wav_t::list_chunk_type_t::subchunks() {
    if (f_subchunks)
        return m_subchunks;
    f_subchunks = true;
    kaitai::kstream *io = parent_chunk_data()->subchunks_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_subchunks = new std::vector<info_chunk_type_t*>();
    {
        int i = 0;
        while (!io->is_eof()) {
            switch (form_type()) {
            case wav_t::FOURCC_INFO: {
                m_subchunks->push_back(new info_chunk_type_t(io, this, m__root));
                break;
            }
            }
            i++;
        }
    }
    io->seek(_pos);
    return m_subchunks;
}

wav_t::pmx_chunk_type_t::pmx_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        return m_parent_chunk_data;
    f_parent_chunk_data = true;
    n_parent_chunk_data = true;
    if (is_riff_chunk()) {
        n_parent_chunk_data = false;
        kaitai::kstream *io = chunk()->data_slot()->_io();
        std::streampos _pos = io->pos();
        io->seek(0);
        m_parent_chunk_data = new riff_t::parent_chunk_data_t(io);
        io->seek(_pos);
    }
    return m_parent_chunk_data;
}

std::vector<wav_t::chunk_type_t*>* wav_t::subchunks() {
    if (f_subchunks)
        return m_subchunks;
    f_subchunks = true;
    n_subchunks = true;
    if (is_form_type_wave()) {
        n_subchunks = false;
        kaitai::kstream *io = parent_chunk_data()->subchunks_slot()->_io();
        std::streampos _pos = io->pos();
        io->seek(0);
        m_subchunks = new std::vector<chunk_type_t*>();
        {
            int i = 0;
            while (!io->is_eof()) {
                m_subchunks->push_back(new chunk_type_t(io, this, m__root));
                i++;
            }
        }
        io->seek(_pos);
    }
    return m_subchunks;
}
