# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The WAVE file format is a subset of Microsoft's RIFF specification for the
# storage of multimedia files. A RIFF file starts out with a file header
# followed by a sequence of data chunks. A WAVE file is often just a RIFF
# file with a single "WAVE" chunk which consists of two sub-chunks --
# a "fmt " chunk specifying the data format and a "data" chunk containing
# the actual sample data.
# 
# This Kaitai implementation was written by John Byrd of Gigantic Software
# (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
# @see https://www.loc.gov/preservation/digital/formats/fdd/fdd000001.shtml Source
class Wav < Kaitai::Struct::Struct

  W_FORMAT_TAG_TYPE = {
    0 => :w_format_tag_type_unknown,
    1 => :w_format_tag_type_pcm,
    2 => :w_format_tag_type_adpcm,
    3 => :w_format_tag_type_ieee_float,
    4 => :w_format_tag_type_vselp,
    5 => :w_format_tag_type_ibm_cvsd,
    6 => :w_format_tag_type_alaw,
    7 => :w_format_tag_type_mulaw,
    8 => :w_format_tag_type_dts,
    9 => :w_format_tag_type_drm,
    10 => :w_format_tag_type_wmavoice9,
    11 => :w_format_tag_type_wmavoice10,
    16 => :w_format_tag_type_oki_adpcm,
    17 => :w_format_tag_type_dvi_adpcm,
    18 => :w_format_tag_type_mediaspace_adpcm,
    19 => :w_format_tag_type_sierra_adpcm,
    20 => :w_format_tag_type_g723_adpcm,
    21 => :w_format_tag_type_digistd,
    22 => :w_format_tag_type_digifix,
    23 => :w_format_tag_type_dialogic_oki_adpcm,
    24 => :w_format_tag_type_mediavision_adpcm,
    25 => :w_format_tag_type_cu_codec,
    26 => :w_format_tag_type_hp_dyn_voice,
    32 => :w_format_tag_type_yamaha_adpcm,
    33 => :w_format_tag_type_sonarc,
    34 => :w_format_tag_type_dspgroup_truespeech,
    35 => :w_format_tag_type_echosc1,
    36 => :w_format_tag_type_audiofile_af36,
    37 => :w_format_tag_type_aptx,
    38 => :w_format_tag_type_audiofile_af10,
    39 => :w_format_tag_type_prosody_1612,
    40 => :w_format_tag_type_lrc,
    48 => :w_format_tag_type_dolby_ac2,
    49 => :w_format_tag_type_gsm610,
    50 => :w_format_tag_type_msnaudio,
    51 => :w_format_tag_type_antex_adpcme,
    52 => :w_format_tag_type_control_res_vqlpc,
    53 => :w_format_tag_type_digireal,
    54 => :w_format_tag_type_digiadpcm,
    55 => :w_format_tag_type_control_res_cr10,
    56 => :w_format_tag_type_nms_vbxadpcm,
    57 => :w_format_tag_type_cs_imaadpcm,
    58 => :w_format_tag_type_echosc3,
    59 => :w_format_tag_type_rockwell_adpcm,
    60 => :w_format_tag_type_rockwell_digitalk,
    61 => :w_format_tag_type_xebec,
    64 => :w_format_tag_type_g721_adpcm,
    65 => :w_format_tag_type_g728_celp,
    66 => :w_format_tag_type_msg723,
    67 => :w_format_tag_type_intel_g723_1,
    68 => :w_format_tag_type_intel_g729,
    69 => :w_format_tag_type_sharp_g726,
    80 => :w_format_tag_type_mpeg,
    82 => :w_format_tag_type_rt24,
    83 => :w_format_tag_type_pac,
    85 => :w_format_tag_type_mpeglayer3,
    89 => :w_format_tag_type_lucent_g723,
    96 => :w_format_tag_type_cirrus,
    97 => :w_format_tag_type_espcm,
    98 => :w_format_tag_type_voxware,
    99 => :w_format_tag_type_canopus_atrac,
    100 => :w_format_tag_type_g726_adpcm,
    101 => :w_format_tag_type_g722_adpcm,
    102 => :w_format_tag_type_dsat,
    103 => :w_format_tag_type_dsat_display,
    105 => :w_format_tag_type_voxware_byte_aligned,
    112 => :w_format_tag_type_voxware_ac8,
    113 => :w_format_tag_type_voxware_ac10,
    114 => :w_format_tag_type_voxware_ac16,
    115 => :w_format_tag_type_voxware_ac20,
    116 => :w_format_tag_type_voxware_rt24,
    117 => :w_format_tag_type_voxware_rt29,
    118 => :w_format_tag_type_voxware_rt29hw,
    119 => :w_format_tag_type_voxware_vr12,
    120 => :w_format_tag_type_voxware_vr18,
    121 => :w_format_tag_type_voxware_tq40,
    122 => :w_format_tag_type_voxware_sc3,
    123 => :w_format_tag_type_voxware_sc3_1,
    128 => :w_format_tag_type_softsound,
    129 => :w_format_tag_type_voxware_tq60,
    130 => :w_format_tag_type_msrt24,
    131 => :w_format_tag_type_g729a,
    132 => :w_format_tag_type_mvi_mvi2,
    133 => :w_format_tag_type_df_g726,
    134 => :w_format_tag_type_df_gsm610,
    136 => :w_format_tag_type_isiaudio,
    137 => :w_format_tag_type_onlive,
    138 => :w_format_tag_type_multitude_ft_sx20,
    139 => :w_format_tag_type_infocom_its_g721_adpcm,
    140 => :w_format_tag_type_convedia_g729,
    141 => :w_format_tag_type_congruency,
    145 => :w_format_tag_type_sbc24,
    146 => :w_format_tag_type_dolby_ac3_spdif,
    147 => :w_format_tag_type_mediasonic_g723,
    148 => :w_format_tag_type_prosody_8kbps,
    151 => :w_format_tag_type_zyxel_adpcm,
    152 => :w_format_tag_type_philips_lpcbb,
    153 => :w_format_tag_type_packed,
    160 => :w_format_tag_type_malden_phonytalk,
    161 => :w_format_tag_type_racal_recorder_gsm,
    162 => :w_format_tag_type_racal_recorder_g720_a,
    163 => :w_format_tag_type_racal_recorder_g723_1,
    164 => :w_format_tag_type_racal_recorder_tetra_acelp,
    176 => :w_format_tag_type_nec_aac,
    255 => :w_format_tag_type_raw_aac1,
    256 => :w_format_tag_type_rhetorex_adpcm,
    257 => :w_format_tag_type_irat,
    273 => :w_format_tag_type_vivo_g723,
    274 => :w_format_tag_type_vivo_siren,
    288 => :w_format_tag_type_philips_celp,
    289 => :w_format_tag_type_philips_grundig,
    291 => :w_format_tag_type_digital_g723,
    293 => :w_format_tag_type_sanyo_ld_adpcm,
    304 => :w_format_tag_type_siprolab_aceplnet,
    305 => :w_format_tag_type_siprolab_acelp4800,
    306 => :w_format_tag_type_siprolab_acelp8v3,
    307 => :w_format_tag_type_siprolab_g729,
    308 => :w_format_tag_type_siprolab_g729a,
    309 => :w_format_tag_type_siprolab_kelvin,
    310 => :w_format_tag_type_voiceage_amr,
    320 => :w_format_tag_type_g726adpcm,
    321 => :w_format_tag_type_dictaphone_celp68,
    322 => :w_format_tag_type_dictaphone_celp54,
    336 => :w_format_tag_type_qualcomm_purevoice,
    337 => :w_format_tag_type_qualcomm_halfrate,
    341 => :w_format_tag_type_tubgsm,
    352 => :w_format_tag_type_msaudio1,
    353 => :w_format_tag_type_wmaudio2,
    354 => :w_format_tag_type_wmaudio3,
    355 => :w_format_tag_type_wmaudio_lossless,
    356 => :w_format_tag_type_wmaspdif,
    368 => :w_format_tag_type_unisys_nap_adpcm,
    369 => :w_format_tag_type_unisys_nap_ulaw,
    370 => :w_format_tag_type_unisys_nap_alaw,
    371 => :w_format_tag_type_unisys_nap_16k,
    372 => :w_format_tag_type_sycom_acm_syc008,
    373 => :w_format_tag_type_sycom_acm_syc701_g726l,
    374 => :w_format_tag_type_sycom_acm_syc701_celp54,
    375 => :w_format_tag_type_sycom_acm_syc701_celp68,
    376 => :w_format_tag_type_knowledge_adventure_adpcm,
    384 => :w_format_tag_type_fraunhofer_iis_mpeg2_aac,
    400 => :w_format_tag_type_dts_ds,
    512 => :w_format_tag_type_creative_adpcm,
    514 => :w_format_tag_type_creative_fastspeech8,
    515 => :w_format_tag_type_creative_fastspeech10,
    528 => :w_format_tag_type_uher_adpcm,
    533 => :w_format_tag_type_ulead_dv_audio,
    534 => :w_format_tag_type_ulead_dv_audio_1,
    544 => :w_format_tag_type_quarterdeck,
    560 => :w_format_tag_type_ilink_vc,
    576 => :w_format_tag_type_raw_sport,
    577 => :w_format_tag_type_esst_ac3,
    585 => :w_format_tag_type_generic_passthru,
    592 => :w_format_tag_type_ipi_hsx,
    593 => :w_format_tag_type_ipi_rpelp,
    608 => :w_format_tag_type_cs2,
    624 => :w_format_tag_type_sony_scx,
    625 => :w_format_tag_type_sony_scy,
    626 => :w_format_tag_type_sony_atrac3,
    627 => :w_format_tag_type_sony_spc,
    640 => :w_format_tag_type_telum_audio,
    641 => :w_format_tag_type_telum_ia_audio,
    645 => :w_format_tag_type_norcom_voice_systems_adpcm,
    768 => :w_format_tag_type_fm_towns_snd,
    848 => :w_format_tag_type_micronas,
    849 => :w_format_tag_type_micronas_celp833,
    1024 => :w_format_tag_type_btv_digital,
    1025 => :w_format_tag_type_intel_music_coder,
    1026 => :w_format_tag_type_indeo_audio,
    1104 => :w_format_tag_type_qdesign_music,
    1280 => :w_format_tag_type_on2_vp7_audio,
    1281 => :w_format_tag_type_on2_vp6_audio,
    1664 => :w_format_tag_type_vme_vmpcm,
    1665 => :w_format_tag_type_tpc,
    2222 => :w_format_tag_type_lightwave_lossless,
    4096 => :w_format_tag_type_oligsm,
    4097 => :w_format_tag_type_oliadpcm,
    4098 => :w_format_tag_type_olicelp,
    4099 => :w_format_tag_type_olisbc,
    4100 => :w_format_tag_type_oliopr,
    4352 => :w_format_tag_type_lh_codec,
    4353 => :w_format_tag_type_lh_codec_celp,
    4354 => :w_format_tag_type_lh_codec_sbc8,
    4355 => :w_format_tag_type_lh_codec_sbc12,
    4356 => :w_format_tag_type_lh_codec_sbc16,
    5120 => :w_format_tag_type_norris,
    5121 => :w_format_tag_type_isiaudio_2,
    5376 => :w_format_tag_type_soundspace_musicompress,
    5632 => :w_format_tag_type_mpeg_adts_aac,
    5633 => :w_format_tag_type_mpeg_raw_aac,
    5634 => :w_format_tag_type_mpeg_loas,
    5640 => :w_format_tag_type_nokia_mpeg_adts_aac,
    5641 => :w_format_tag_type_nokia_mpeg_raw_aac,
    5642 => :w_format_tag_type_vodafone_mpeg_adts_aac,
    5643 => :w_format_tag_type_vodafone_mpeg_raw_aac,
    5648 => :w_format_tag_type_mpeg_heaac,
    6172 => :w_format_tag_type_voxware_rt24_speech,
    6513 => :w_format_tag_type_sonicfoundry_lossless,
    6521 => :w_format_tag_type_innings_telecom_adpcm,
    7175 => :w_format_tag_type_lucent_sx8300p,
    7180 => :w_format_tag_type_lucent_sx5363s,
    7939 => :w_format_tag_type_cuseeme,
    8132 => :w_format_tag_type_ntcsoft_alf2cm_acm,
    8192 => :w_format_tag_type_dvm,
    8193 => :w_format_tag_type_dts2,
    13075 => :w_format_tag_type_makeavis,
    16707 => :w_format_tag_type_divio_mpeg4_aac,
    16897 => :w_format_tag_type_nokia_adaptive_multirate,
    16963 => :w_format_tag_type_divio_g726,
    17228 => :w_format_tag_type_lead_speech,
    22092 => :w_format_tag_type_lead_vorbis,
    22358 => :w_format_tag_type_wavpack_audio,
    26447 => :w_format_tag_type_ogg_vorbis_mode_1,
    26448 => :w_format_tag_type_ogg_vorbis_mode_2,
    26449 => :w_format_tag_type_ogg_vorbis_mode_3,
    26479 => :w_format_tag_type_ogg_vorbis_mode_1_plus,
    26480 => :w_format_tag_type_ogg_vorbis_mode_2_plus,
    26481 => :w_format_tag_type_ogg_vorbis_mode_3_plus,
    28672 => :w_format_tag_type_threecom_nbx,
    28781 => :w_format_tag_type_faad_aac,
    29537 => :w_format_tag_type_amr_nb,
    29538 => :w_format_tag_type_amr_wb,
    29539 => :w_format_tag_type_amr_wp,
    31265 => :w_format_tag_type_gsm_amr_cbr,
    31266 => :w_format_tag_type_gsm_amr_vbr_sid,
    41216 => :w_format_tag_type_comverse_infosys_g723_1,
    41217 => :w_format_tag_type_comverse_infosys_avqsbc,
    41218 => :w_format_tag_type_comverse_infosys_sbc,
    41219 => :w_format_tag_type_symbol_g729_a,
    41220 => :w_format_tag_type_voiceage_amr_wb,
    41221 => :w_format_tag_type_ingenient_g726,
    41222 => :w_format_tag_type_mpeg4_aac,
    41223 => :w_format_tag_type_encore_g726,
    41224 => :w_format_tag_type_zoll_asao,
    41225 => :w_format_tag_type_speex_voice,
    41226 => :w_format_tag_type_vianix_masc,
    41227 => :w_format_tag_type_wm9_spectrum_analyzer,
    41228 => :w_format_tag_type_wmf_spectrum_anayzer,
    41229 => :w_format_tag_type_gsm_610,
    41230 => :w_format_tag_type_gsm_620,
    41231 => :w_format_tag_type_gsm_660,
    41232 => :w_format_tag_type_gsm_690,
    41233 => :w_format_tag_type_gsm_adaptive_multirate_wb,
    41234 => :w_format_tag_type_polycom_g722,
    41235 => :w_format_tag_type_polycom_g728,
    41236 => :w_format_tag_type_polycom_g729_a,
    41237 => :w_format_tag_type_polycom_siren,
    41238 => :w_format_tag_type_global_ip_ilbc,
    41239 => :w_format_tag_type_radiotime_time_shift_radio,
    41240 => :w_format_tag_type_nice_aca,
    41241 => :w_format_tag_type_nice_adpcm,
    41242 => :w_format_tag_type_vocord_g721,
    41243 => :w_format_tag_type_vocord_g726,
    41244 => :w_format_tag_type_vocord_g722_1,
    41245 => :w_format_tag_type_vocord_g728,
    41246 => :w_format_tag_type_vocord_g729,
    41247 => :w_format_tag_type_vocord_g729_a,
    41248 => :w_format_tag_type_vocord_g723_1,
    41249 => :w_format_tag_type_vocord_lbc,
    41250 => :w_format_tag_type_nice_g728,
    41251 => :w_format_tag_type_frace_telecom_g729,
    41252 => :w_format_tag_type_codian,
    61868 => :w_format_tag_type_flac,
    65534 => :w_format_tag_type_extensible,
    65535 => :w_format_tag_type_development,
  }
  I__W_FORMAT_TAG_TYPE = W_FORMAT_TAG_TYPE.invert

  CHUNK_TYPE = {
    544501094 => :chunk_type_fmt,
    1650817140 => :chunk_type_bext,
    1668637984 => :chunk_type_cue,
    1684108385 => :chunk_type_data,
    1835626086 => :chunk_type_minf,
    1919248238 => :chunk_type_regn,
    1970104676 => :chunk_type_umid,
  }
  I__CHUNK_TYPE = CHUNK_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @riff_id = @_io.ensure_fixed_contents([82, 73, 70, 70].pack('C*'))
    @file_size = @_io.read_u4le
    @wave_id = @_io.ensure_fixed_contents([87, 65, 86, 69].pack('C*'))
    @_raw_chunks = @_io.read_bytes((file_size - 4))
    io = Kaitai::Struct::Stream.new(@_raw_chunks)
    @chunks = ChunksType.new(io, self, @_root)
    @pad_byte = @_io.read_bytes((file_size % 2))
    self
  end
  class SampleType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sample = @_io.read_u2le
      self
    end
    attr_reader :sample
  end
  class FormatChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @w_format_tag = Kaitai::Struct::Stream::resolve_enum(W_FORMAT_TAG_TYPE, @_io.read_u2le)
      @n_channels = @_io.read_u2le
      @n_samples_per_sec = @_io.read_u4le
      @n_avg_bytes_per_sec = @_io.read_u4le
      @n_block_align = @_io.read_u2le
      @w_bits_per_sample = @_io.read_u2le
      if !(is_basic_pcm)
        @cb_size = @_io.read_u2le
      end
      if is_cb_size_meaningful
        @w_valid_bits_per_sample = @_io.read_u2le
      end
      if is_extensible
        @channel_mask_and_subformat = ChannelMaskAndSubformatType.new(@_io, self, @_root)
      end
      self
    end
    def is_extensible
      return @is_extensible unless @is_extensible.nil?
      @is_extensible = w_format_tag == :w_format_tag_type_extensible
      @is_extensible
    end
    def is_basic_pcm
      return @is_basic_pcm unless @is_basic_pcm.nil?
      @is_basic_pcm = w_format_tag == :w_format_tag_type_pcm
      @is_basic_pcm
    end
    def is_basic_float
      return @is_basic_float unless @is_basic_float.nil?
      @is_basic_float = w_format_tag == :w_format_tag_type_ieee_float
      @is_basic_float
    end
    def is_cb_size_meaningful
      return @is_cb_size_meaningful unless @is_cb_size_meaningful.nil?
      @is_cb_size_meaningful =  ((!(is_basic_pcm)) && (cb_size != 0)) 
      @is_cb_size_meaningful
    end
    attr_reader :w_format_tag
    attr_reader :n_channels
    attr_reader :n_samples_per_sec
    attr_reader :n_avg_bytes_per_sec
    attr_reader :n_block_align
    attr_reader :w_bits_per_sample
    attr_reader :cb_size
    attr_reader :w_valid_bits_per_sample
    attr_reader :channel_mask_and_subformat
  end
  class GuidType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data1 = @_io.read_u4le
      @data2 = @_io.read_u2le
      @data3 = @_io.read_u2le
      @data4 = @_io.read_u4be
      @data4a = @_io.read_u4be
      self
    end
    attr_reader :data1
    attr_reader :data2
    attr_reader :data3
    attr_reader :data4
    attr_reader :data4a
  end
  class CuePointType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dw_name = @_io.read_u4le
      @dw_position = @_io.read_u4le
      @fcc_chunk = @_io.read_u4le
      @dw_chunk_start = @_io.read_u4le
      @dw_block_start = @_io.read_u4le
      @dw_sample_offset = @_io.read_u4le
      self
    end
    attr_reader :dw_name
    attr_reader :dw_position
    attr_reader :fcc_chunk
    attr_reader :dw_chunk_start
    attr_reader :dw_block_start
    attr_reader :dw_sample_offset
  end
  class DataChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = @_io.read_bytes_full
      self
    end
    attr_reader :data
  end
  class SamplesType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @samples = @_io.read_u4le
      self
    end
    attr_reader :samples
  end
  class ChannelMaskAndSubformatType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dw_channel_mask = ChannelMaskType.new(@_io, self, @_root)
      @subformat = GuidType.new(@_io, self, @_root)
      self
    end
    attr_reader :dw_channel_mask
    attr_reader :subformat
  end
  class ChunksType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chunk = []
      i = 0
      while not @_io.eof?
        @chunk << ChunkType.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :chunk
  end
  class CueChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dw_cue_points = @_io.read_u4le
      if dw_cue_points != 0
        @cue_points = Array.new(dw_cue_points)
        (dw_cue_points).times { |i|
          @cue_points[i] = CuePointType.new(@_io, self, @_root)
        }
      end
      self
    end
    attr_reader :dw_cue_points
    attr_reader :cue_points
  end
  class ChannelMaskType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @front_right_of_center = @_io.read_bits_int(1) != 0
      @front_left_of_center = @_io.read_bits_int(1) != 0
      @back_right = @_io.read_bits_int(1) != 0
      @back_left = @_io.read_bits_int(1) != 0
      @low_frequency = @_io.read_bits_int(1) != 0
      @front_center = @_io.read_bits_int(1) != 0
      @front_right = @_io.read_bits_int(1) != 0
      @front_left = @_io.read_bits_int(1) != 0
      @top_center = @_io.read_bits_int(1) != 0
      @side_right = @_io.read_bits_int(1) != 0
      @side_left = @_io.read_bits_int(1) != 0
      @back_center = @_io.read_bits_int(1) != 0
      @top_back_left = @_io.read_bits_int(1) != 0
      @top_front_right = @_io.read_bits_int(1) != 0
      @top_front_center = @_io.read_bits_int(1) != 0
      @top_front_left = @_io.read_bits_int(1) != 0
      @unused1 = @_io.read_bits_int(6)
      @top_back_right = @_io.read_bits_int(1) != 0
      @top_back_center = @_io.read_bits_int(1) != 0
      @unused2 = @_io.read_bits_int(8)
      self
    end
    attr_reader :front_right_of_center
    attr_reader :front_left_of_center
    attr_reader :back_right
    attr_reader :back_left
    attr_reader :low_frequency
    attr_reader :front_center
    attr_reader :front_right
    attr_reader :front_left
    attr_reader :top_center
    attr_reader :side_right
    attr_reader :side_left
    attr_reader :back_center
    attr_reader :top_back_left
    attr_reader :top_front_right
    attr_reader :top_front_center
    attr_reader :top_front_left
    attr_reader :unused1
    attr_reader :top_back_right
    attr_reader :top_back_center
    attr_reader :unused2
  end
  class ChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chunk_id = @_io.read_u4be
      @len = @_io.read_u4le
      case chunk_id
      when 1684108385
        @_raw_data = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = DataChunkType.new(io, self, @_root)
      when 1668637984
        @_raw_data = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = CueChunkType.new(io, self, @_root)
      when 1650817140
        @_raw_data = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = BextChunkType.new(io, self, @_root)
      when 1718449184
        @_raw_data = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = FormatChunkType.new(io, self, @_root)
      else
        @data = @_io.read_bytes(len)
      end
      @pad_byte = @_io.read_bytes((len % 2))
      self
    end
    attr_reader :chunk_id
    attr_reader :len
    attr_reader :data
    attr_reader :pad_byte
    attr_reader :_raw_data
  end
  class BextChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @description = (@_io.read_bytes(256)).force_encoding("ASCII")
      @originator = (@_io.read_bytes(32)).force_encoding("ASCII")
      @originator_reference = (@_io.read_bytes(32)).force_encoding("ASCII")
      @origination_date = (@_io.read_bytes(10)).force_encoding("ASCII")
      @origination_time = (@_io.read_bytes(8)).force_encoding("ASCII")
      @time_reference_low = @_io.read_u4le
      @time_reference_high = @_io.read_u4le
      @version = @_io.read_u2le
      @umid = @_io.read_bytes(64)
      @loudness_value = @_io.read_u2le
      @loudness_range = @_io.read_u2le
      @max_true_peak_level = @_io.read_u2le
      @max_momentary_loudness = @_io.read_u2le
      @max_short_term_loudness = @_io.read_u2le
      self
    end
    attr_reader :description
    attr_reader :originator
    attr_reader :originator_reference
    attr_reader :origination_date
    attr_reader :origination_time
    attr_reader :time_reference_low
    attr_reader :time_reference_high
    attr_reader :version
    attr_reader :umid
    attr_reader :loudness_value
    attr_reader :loudness_range
    attr_reader :max_true_peak_level
    attr_reader :max_momentary_loudness
    attr_reader :max_short_term_loudness
  end
  def format_chunk
    return @format_chunk unless @format_chunk.nil?
    @format_chunk = chunks.chunk[0].data
    @format_chunk
  end
  attr_reader :riff_id
  attr_reader :file_size
  attr_reader :wave_id
  attr_reader :chunks
  attr_reader :pad_byte
  attr_reader :_raw_chunks
end
