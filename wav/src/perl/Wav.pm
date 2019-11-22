# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Wav;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $W_FORMAT_TAG_TYPE_UNKNOWN = 0;
our $W_FORMAT_TAG_TYPE_PCM = 1;
our $W_FORMAT_TAG_TYPE_ADPCM = 2;
our $W_FORMAT_TAG_TYPE_IEEE_FLOAT = 3;
our $W_FORMAT_TAG_TYPE_VSELP = 4;
our $W_FORMAT_TAG_TYPE_IBM_CVSD = 5;
our $W_FORMAT_TAG_TYPE_ALAW = 6;
our $W_FORMAT_TAG_TYPE_MULAW = 7;
our $W_FORMAT_TAG_TYPE_DTS = 8;
our $W_FORMAT_TAG_TYPE_DRM = 9;
our $W_FORMAT_TAG_TYPE_WMAVOICE9 = 10;
our $W_FORMAT_TAG_TYPE_WMAVOICE10 = 11;
our $W_FORMAT_TAG_TYPE_OKI_ADPCM = 16;
our $W_FORMAT_TAG_TYPE_DVI_ADPCM = 17;
our $W_FORMAT_TAG_TYPE_MEDIASPACE_ADPCM = 18;
our $W_FORMAT_TAG_TYPE_SIERRA_ADPCM = 19;
our $W_FORMAT_TAG_TYPE_G723_ADPCM = 20;
our $W_FORMAT_TAG_TYPE_DIGISTD = 21;
our $W_FORMAT_TAG_TYPE_DIGIFIX = 22;
our $W_FORMAT_TAG_TYPE_DIALOGIC_OKI_ADPCM = 23;
our $W_FORMAT_TAG_TYPE_MEDIAVISION_ADPCM = 24;
our $W_FORMAT_TAG_TYPE_CU_CODEC = 25;
our $W_FORMAT_TAG_TYPE_HP_DYN_VOICE = 26;
our $W_FORMAT_TAG_TYPE_YAMAHA_ADPCM = 32;
our $W_FORMAT_TAG_TYPE_SONARC = 33;
our $W_FORMAT_TAG_TYPE_DSPGROUP_TRUESPEECH = 34;
our $W_FORMAT_TAG_TYPE_ECHOSC1 = 35;
our $W_FORMAT_TAG_TYPE_AUDIOFILE_AF36 = 36;
our $W_FORMAT_TAG_TYPE_APTX = 37;
our $W_FORMAT_TAG_TYPE_AUDIOFILE_AF10 = 38;
our $W_FORMAT_TAG_TYPE_PROSODY_1612 = 39;
our $W_FORMAT_TAG_TYPE_LRC = 40;
our $W_FORMAT_TAG_TYPE_DOLBY_AC2 = 48;
our $W_FORMAT_TAG_TYPE_GSM610 = 49;
our $W_FORMAT_TAG_TYPE_MSNAUDIO = 50;
our $W_FORMAT_TAG_TYPE_ANTEX_ADPCME = 51;
our $W_FORMAT_TAG_TYPE_CONTROL_RES_VQLPC = 52;
our $W_FORMAT_TAG_TYPE_DIGIREAL = 53;
our $W_FORMAT_TAG_TYPE_DIGIADPCM = 54;
our $W_FORMAT_TAG_TYPE_CONTROL_RES_CR10 = 55;
our $W_FORMAT_TAG_TYPE_NMS_VBXADPCM = 56;
our $W_FORMAT_TAG_TYPE_CS_IMAADPCM = 57;
our $W_FORMAT_TAG_TYPE_ECHOSC3 = 58;
our $W_FORMAT_TAG_TYPE_ROCKWELL_ADPCM = 59;
our $W_FORMAT_TAG_TYPE_ROCKWELL_DIGITALK = 60;
our $W_FORMAT_TAG_TYPE_XEBEC = 61;
our $W_FORMAT_TAG_TYPE_G721_ADPCM = 64;
our $W_FORMAT_TAG_TYPE_G728_CELP = 65;
our $W_FORMAT_TAG_TYPE_MSG723 = 66;
our $W_FORMAT_TAG_TYPE_INTEL_G723_1 = 67;
our $W_FORMAT_TAG_TYPE_INTEL_G729 = 68;
our $W_FORMAT_TAG_TYPE_SHARP_G726 = 69;
our $W_FORMAT_TAG_TYPE_MPEG = 80;
our $W_FORMAT_TAG_TYPE_RT24 = 82;
our $W_FORMAT_TAG_TYPE_PAC = 83;
our $W_FORMAT_TAG_TYPE_MPEGLAYER3 = 85;
our $W_FORMAT_TAG_TYPE_LUCENT_G723 = 89;
our $W_FORMAT_TAG_TYPE_CIRRUS = 96;
our $W_FORMAT_TAG_TYPE_ESPCM = 97;
our $W_FORMAT_TAG_TYPE_VOXWARE = 98;
our $W_FORMAT_TAG_TYPE_CANOPUS_ATRAC = 99;
our $W_FORMAT_TAG_TYPE_G726_ADPCM = 100;
our $W_FORMAT_TAG_TYPE_G722_ADPCM = 101;
our $W_FORMAT_TAG_TYPE_DSAT = 102;
our $W_FORMAT_TAG_TYPE_DSAT_DISPLAY = 103;
our $W_FORMAT_TAG_TYPE_VOXWARE_BYTE_ALIGNED = 105;
our $W_FORMAT_TAG_TYPE_VOXWARE_AC8 = 112;
our $W_FORMAT_TAG_TYPE_VOXWARE_AC10 = 113;
our $W_FORMAT_TAG_TYPE_VOXWARE_AC16 = 114;
our $W_FORMAT_TAG_TYPE_VOXWARE_AC20 = 115;
our $W_FORMAT_TAG_TYPE_VOXWARE_RT24 = 116;
our $W_FORMAT_TAG_TYPE_VOXWARE_RT29 = 117;
our $W_FORMAT_TAG_TYPE_VOXWARE_RT29HW = 118;
our $W_FORMAT_TAG_TYPE_VOXWARE_VR12 = 119;
our $W_FORMAT_TAG_TYPE_VOXWARE_VR18 = 120;
our $W_FORMAT_TAG_TYPE_VOXWARE_TQ40 = 121;
our $W_FORMAT_TAG_TYPE_VOXWARE_SC3 = 122;
our $W_FORMAT_TAG_TYPE_VOXWARE_SC3_1 = 123;
our $W_FORMAT_TAG_TYPE_SOFTSOUND = 128;
our $W_FORMAT_TAG_TYPE_VOXWARE_TQ60 = 129;
our $W_FORMAT_TAG_TYPE_MSRT24 = 130;
our $W_FORMAT_TAG_TYPE_G729A = 131;
our $W_FORMAT_TAG_TYPE_MVI_MVI2 = 132;
our $W_FORMAT_TAG_TYPE_DF_G726 = 133;
our $W_FORMAT_TAG_TYPE_DF_GSM610 = 134;
our $W_FORMAT_TAG_TYPE_ISIAUDIO = 136;
our $W_FORMAT_TAG_TYPE_ONLIVE = 137;
our $W_FORMAT_TAG_TYPE_MULTITUDE_FT_SX20 = 138;
our $W_FORMAT_TAG_TYPE_INFOCOM_ITS_G721_ADPCM = 139;
our $W_FORMAT_TAG_TYPE_CONVEDIA_G729 = 140;
our $W_FORMAT_TAG_TYPE_CONGRUENCY = 141;
our $W_FORMAT_TAG_TYPE_SBC24 = 145;
our $W_FORMAT_TAG_TYPE_DOLBY_AC3_SPDIF = 146;
our $W_FORMAT_TAG_TYPE_MEDIASONIC_G723 = 147;
our $W_FORMAT_TAG_TYPE_PROSODY_8KBPS = 148;
our $W_FORMAT_TAG_TYPE_ZYXEL_ADPCM = 151;
our $W_FORMAT_TAG_TYPE_PHILIPS_LPCBB = 152;
our $W_FORMAT_TAG_TYPE_PACKED = 153;
our $W_FORMAT_TAG_TYPE_MALDEN_PHONYTALK = 160;
our $W_FORMAT_TAG_TYPE_RACAL_RECORDER_GSM = 161;
our $W_FORMAT_TAG_TYPE_RACAL_RECORDER_G720_A = 162;
our $W_FORMAT_TAG_TYPE_RACAL_RECORDER_G723_1 = 163;
our $W_FORMAT_TAG_TYPE_RACAL_RECORDER_TETRA_ACELP = 164;
our $W_FORMAT_TAG_TYPE_NEC_AAC = 176;
our $W_FORMAT_TAG_TYPE_RAW_AAC1 = 255;
our $W_FORMAT_TAG_TYPE_RHETOREX_ADPCM = 256;
our $W_FORMAT_TAG_TYPE_IRAT = 257;
our $W_FORMAT_TAG_TYPE_VIVO_G723 = 273;
our $W_FORMAT_TAG_TYPE_VIVO_SIREN = 274;
our $W_FORMAT_TAG_TYPE_PHILIPS_CELP = 288;
our $W_FORMAT_TAG_TYPE_PHILIPS_GRUNDIG = 289;
our $W_FORMAT_TAG_TYPE_DIGITAL_G723 = 291;
our $W_FORMAT_TAG_TYPE_SANYO_LD_ADPCM = 293;
our $W_FORMAT_TAG_TYPE_SIPROLAB_ACEPLNET = 304;
our $W_FORMAT_TAG_TYPE_SIPROLAB_ACELP4800 = 305;
our $W_FORMAT_TAG_TYPE_SIPROLAB_ACELP8V3 = 306;
our $W_FORMAT_TAG_TYPE_SIPROLAB_G729 = 307;
our $W_FORMAT_TAG_TYPE_SIPROLAB_G729A = 308;
our $W_FORMAT_TAG_TYPE_SIPROLAB_KELVIN = 309;
our $W_FORMAT_TAG_TYPE_VOICEAGE_AMR = 310;
our $W_FORMAT_TAG_TYPE_G726ADPCM = 320;
our $W_FORMAT_TAG_TYPE_DICTAPHONE_CELP68 = 321;
our $W_FORMAT_TAG_TYPE_DICTAPHONE_CELP54 = 322;
our $W_FORMAT_TAG_TYPE_QUALCOMM_PUREVOICE = 336;
our $W_FORMAT_TAG_TYPE_QUALCOMM_HALFRATE = 337;
our $W_FORMAT_TAG_TYPE_TUBGSM = 341;
our $W_FORMAT_TAG_TYPE_MSAUDIO1 = 352;
our $W_FORMAT_TAG_TYPE_WMAUDIO2 = 353;
our $W_FORMAT_TAG_TYPE_WMAUDIO3 = 354;
our $W_FORMAT_TAG_TYPE_WMAUDIO_LOSSLESS = 355;
our $W_FORMAT_TAG_TYPE_WMASPDIF = 356;
our $W_FORMAT_TAG_TYPE_UNISYS_NAP_ADPCM = 368;
our $W_FORMAT_TAG_TYPE_UNISYS_NAP_ULAW = 369;
our $W_FORMAT_TAG_TYPE_UNISYS_NAP_ALAW = 370;
our $W_FORMAT_TAG_TYPE_UNISYS_NAP_16K = 371;
our $W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC008 = 372;
our $W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_G726L = 373;
our $W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_CELP54 = 374;
our $W_FORMAT_TAG_TYPE_SYCOM_ACM_SYC701_CELP68 = 375;
our $W_FORMAT_TAG_TYPE_KNOWLEDGE_ADVENTURE_ADPCM = 376;
our $W_FORMAT_TAG_TYPE_FRAUNHOFER_IIS_MPEG2_AAC = 384;
our $W_FORMAT_TAG_TYPE_DTS_DS = 400;
our $W_FORMAT_TAG_TYPE_CREATIVE_ADPCM = 512;
our $W_FORMAT_TAG_TYPE_CREATIVE_FASTSPEECH8 = 514;
our $W_FORMAT_TAG_TYPE_CREATIVE_FASTSPEECH10 = 515;
our $W_FORMAT_TAG_TYPE_UHER_ADPCM = 528;
our $W_FORMAT_TAG_TYPE_ULEAD_DV_AUDIO = 533;
our $W_FORMAT_TAG_TYPE_ULEAD_DV_AUDIO_1 = 534;
our $W_FORMAT_TAG_TYPE_QUARTERDECK = 544;
our $W_FORMAT_TAG_TYPE_ILINK_VC = 560;
our $W_FORMAT_TAG_TYPE_RAW_SPORT = 576;
our $W_FORMAT_TAG_TYPE_ESST_AC3 = 577;
our $W_FORMAT_TAG_TYPE_GENERIC_PASSTHRU = 585;
our $W_FORMAT_TAG_TYPE_IPI_HSX = 592;
our $W_FORMAT_TAG_TYPE_IPI_RPELP = 593;
our $W_FORMAT_TAG_TYPE_CS2 = 608;
our $W_FORMAT_TAG_TYPE_SONY_SCX = 624;
our $W_FORMAT_TAG_TYPE_SONY_SCY = 625;
our $W_FORMAT_TAG_TYPE_SONY_ATRAC3 = 626;
our $W_FORMAT_TAG_TYPE_SONY_SPC = 627;
our $W_FORMAT_TAG_TYPE_TELUM_AUDIO = 640;
our $W_FORMAT_TAG_TYPE_TELUM_IA_AUDIO = 641;
our $W_FORMAT_TAG_TYPE_NORCOM_VOICE_SYSTEMS_ADPCM = 645;
our $W_FORMAT_TAG_TYPE_FM_TOWNS_SND = 768;
our $W_FORMAT_TAG_TYPE_MICRONAS = 848;
our $W_FORMAT_TAG_TYPE_MICRONAS_CELP833 = 849;
our $W_FORMAT_TAG_TYPE_BTV_DIGITAL = 1024;
our $W_FORMAT_TAG_TYPE_INTEL_MUSIC_CODER = 1025;
our $W_FORMAT_TAG_TYPE_INDEO_AUDIO = 1026;
our $W_FORMAT_TAG_TYPE_QDESIGN_MUSIC = 1104;
our $W_FORMAT_TAG_TYPE_ON2_VP7_AUDIO = 1280;
our $W_FORMAT_TAG_TYPE_ON2_VP6_AUDIO = 1281;
our $W_FORMAT_TAG_TYPE_VME_VMPCM = 1664;
our $W_FORMAT_TAG_TYPE_TPC = 1665;
our $W_FORMAT_TAG_TYPE_LIGHTWAVE_LOSSLESS = 2222;
our $W_FORMAT_TAG_TYPE_OLIGSM = 4096;
our $W_FORMAT_TAG_TYPE_OLIADPCM = 4097;
our $W_FORMAT_TAG_TYPE_OLICELP = 4098;
our $W_FORMAT_TAG_TYPE_OLISBC = 4099;
our $W_FORMAT_TAG_TYPE_OLIOPR = 4100;
our $W_FORMAT_TAG_TYPE_LH_CODEC = 4352;
our $W_FORMAT_TAG_TYPE_LH_CODEC_CELP = 4353;
our $W_FORMAT_TAG_TYPE_LH_CODEC_SBC8 = 4354;
our $W_FORMAT_TAG_TYPE_LH_CODEC_SBC12 = 4355;
our $W_FORMAT_TAG_TYPE_LH_CODEC_SBC16 = 4356;
our $W_FORMAT_TAG_TYPE_NORRIS = 5120;
our $W_FORMAT_TAG_TYPE_ISIAUDIO_2 = 5121;
our $W_FORMAT_TAG_TYPE_SOUNDSPACE_MUSICOMPRESS = 5376;
our $W_FORMAT_TAG_TYPE_MPEG_ADTS_AAC = 5632;
our $W_FORMAT_TAG_TYPE_MPEG_RAW_AAC = 5633;
our $W_FORMAT_TAG_TYPE_MPEG_LOAS = 5634;
our $W_FORMAT_TAG_TYPE_NOKIA_MPEG_ADTS_AAC = 5640;
our $W_FORMAT_TAG_TYPE_NOKIA_MPEG_RAW_AAC = 5641;
our $W_FORMAT_TAG_TYPE_VODAFONE_MPEG_ADTS_AAC = 5642;
our $W_FORMAT_TAG_TYPE_VODAFONE_MPEG_RAW_AAC = 5643;
our $W_FORMAT_TAG_TYPE_MPEG_HEAAC = 5648;
our $W_FORMAT_TAG_TYPE_VOXWARE_RT24_SPEECH = 6172;
our $W_FORMAT_TAG_TYPE_SONICFOUNDRY_LOSSLESS = 6513;
our $W_FORMAT_TAG_TYPE_INNINGS_TELECOM_ADPCM = 6521;
our $W_FORMAT_TAG_TYPE_LUCENT_SX8300P = 7175;
our $W_FORMAT_TAG_TYPE_LUCENT_SX5363S = 7180;
our $W_FORMAT_TAG_TYPE_CUSEEME = 7939;
our $W_FORMAT_TAG_TYPE_NTCSOFT_ALF2CM_ACM = 8132;
our $W_FORMAT_TAG_TYPE_DVM = 8192;
our $W_FORMAT_TAG_TYPE_DTS2 = 8193;
our $W_FORMAT_TAG_TYPE_MAKEAVIS = 13075;
our $W_FORMAT_TAG_TYPE_DIVIO_MPEG4_AAC = 16707;
our $W_FORMAT_TAG_TYPE_NOKIA_ADAPTIVE_MULTIRATE = 16897;
our $W_FORMAT_TAG_TYPE_DIVIO_G726 = 16963;
our $W_FORMAT_TAG_TYPE_LEAD_SPEECH = 17228;
our $W_FORMAT_TAG_TYPE_LEAD_VORBIS = 22092;
our $W_FORMAT_TAG_TYPE_WAVPACK_AUDIO = 22358;
our $W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_1 = 26447;
our $W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_2 = 26448;
our $W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_3 = 26449;
our $W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_1_PLUS = 26479;
our $W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_2_PLUS = 26480;
our $W_FORMAT_TAG_TYPE_OGG_VORBIS_MODE_3_PLUS = 26481;
our $W_FORMAT_TAG_TYPE_THREECOM_NBX = 28672;
our $W_FORMAT_TAG_TYPE_FAAD_AAC = 28781;
our $W_FORMAT_TAG_TYPE_AMR_NB = 29537;
our $W_FORMAT_TAG_TYPE_AMR_WB = 29538;
our $W_FORMAT_TAG_TYPE_AMR_WP = 29539;
our $W_FORMAT_TAG_TYPE_GSM_AMR_CBR = 31265;
our $W_FORMAT_TAG_TYPE_GSM_AMR_VBR_SID = 31266;
our $W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_G723_1 = 41216;
our $W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_AVQSBC = 41217;
our $W_FORMAT_TAG_TYPE_COMVERSE_INFOSYS_SBC = 41218;
our $W_FORMAT_TAG_TYPE_SYMBOL_G729_A = 41219;
our $W_FORMAT_TAG_TYPE_VOICEAGE_AMR_WB = 41220;
our $W_FORMAT_TAG_TYPE_INGENIENT_G726 = 41221;
our $W_FORMAT_TAG_TYPE_MPEG4_AAC = 41222;
our $W_FORMAT_TAG_TYPE_ENCORE_G726 = 41223;
our $W_FORMAT_TAG_TYPE_ZOLL_ASAO = 41224;
our $W_FORMAT_TAG_TYPE_SPEEX_VOICE = 41225;
our $W_FORMAT_TAG_TYPE_VIANIX_MASC = 41226;
our $W_FORMAT_TAG_TYPE_WM9_SPECTRUM_ANALYZER = 41227;
our $W_FORMAT_TAG_TYPE_WMF_SPECTRUM_ANAYZER = 41228;
our $W_FORMAT_TAG_TYPE_GSM_610 = 41229;
our $W_FORMAT_TAG_TYPE_GSM_620 = 41230;
our $W_FORMAT_TAG_TYPE_GSM_660 = 41231;
our $W_FORMAT_TAG_TYPE_GSM_690 = 41232;
our $W_FORMAT_TAG_TYPE_GSM_ADAPTIVE_MULTIRATE_WB = 41233;
our $W_FORMAT_TAG_TYPE_POLYCOM_G722 = 41234;
our $W_FORMAT_TAG_TYPE_POLYCOM_G728 = 41235;
our $W_FORMAT_TAG_TYPE_POLYCOM_G729_A = 41236;
our $W_FORMAT_TAG_TYPE_POLYCOM_SIREN = 41237;
our $W_FORMAT_TAG_TYPE_GLOBAL_IP_ILBC = 41238;
our $W_FORMAT_TAG_TYPE_RADIOTIME_TIME_SHIFT_RADIO = 41239;
our $W_FORMAT_TAG_TYPE_NICE_ACA = 41240;
our $W_FORMAT_TAG_TYPE_NICE_ADPCM = 41241;
our $W_FORMAT_TAG_TYPE_VOCORD_G721 = 41242;
our $W_FORMAT_TAG_TYPE_VOCORD_G726 = 41243;
our $W_FORMAT_TAG_TYPE_VOCORD_G722_1 = 41244;
our $W_FORMAT_TAG_TYPE_VOCORD_G728 = 41245;
our $W_FORMAT_TAG_TYPE_VOCORD_G729 = 41246;
our $W_FORMAT_TAG_TYPE_VOCORD_G729_A = 41247;
our $W_FORMAT_TAG_TYPE_VOCORD_G723_1 = 41248;
our $W_FORMAT_TAG_TYPE_VOCORD_LBC = 41249;
our $W_FORMAT_TAG_TYPE_NICE_G728 = 41250;
our $W_FORMAT_TAG_TYPE_FRACE_TELECOM_G729 = 41251;
our $W_FORMAT_TAG_TYPE_CODIAN = 41252;
our $W_FORMAT_TAG_TYPE_FLAC = 61868;
our $W_FORMAT_TAG_TYPE_EXTENSIBLE = 65534;
our $W_FORMAT_TAG_TYPE_DEVELOPMENT = 65535;

our $CHUNK_TYPE_FMT = 544501094;
our $CHUNK_TYPE_BEXT = 1650817140;
our $CHUNK_TYPE_CUE = 1668637984;
our $CHUNK_TYPE_DATA = 1684108385;
our $CHUNK_TYPE_MINF = 1835626086;
our $CHUNK_TYPE_REGN = 1919248238;
our $CHUNK_TYPE_UMID = 1970104676;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{riff_id} = $self->{_io}->ensure_fixed_contents(pack('C*', (82, 73, 70, 70)));
    $self->{file_size} = $self->{_io}->read_u4le();
    $self->{wave_id} = $self->{_io}->ensure_fixed_contents(pack('C*', (87, 65, 86, 69)));
    $self->{_raw_chunks} = $self->{_io}->read_bytes(($self->file_size() - 5));
    my $io__raw_chunks = IO::KaitaiStruct::Stream->new($self->{_raw_chunks});
    $self->{chunks} = Wav::ChunksType->new($io__raw_chunks, $self, $self->{_root});
}

sub format_chunk {
    my ($self) = @_;
    return $self->{format_chunk} if ($self->{format_chunk});
    $self->{format_chunk} = @{$self->chunks()->chunk()}[0]->data();
    return $self->{format_chunk};
}

sub riff_id {
    my ($self) = @_;
    return $self->{riff_id};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub wave_id {
    my ($self) = @_;
    return $self->{wave_id};
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks};
}

sub _raw_chunks {
    my ($self) = @_;
    return $self->{_raw_chunks};
}

########################################################################
package Wav::SampleType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{sample} = $self->{_io}->read_u2le();
}

sub sample {
    my ($self) = @_;
    return $self->{sample};
}

########################################################################
package Wav::FormatChunkType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{w_format_tag} = $self->{_io}->read_u2le();
    $self->{n_channels} = $self->{_io}->read_u2le();
    $self->{n_samples_per_sec} = $self->{_io}->read_u4le();
    $self->{n_avg_bytes_per_sec} = $self->{_io}->read_u4le();
    $self->{n_block_align} = $self->{_io}->read_u2le();
    $self->{w_bits_per_sample} = $self->{_io}->read_u2le();
    if (!($self->is_basic_pcm())) {
        $self->{cb_size} = $self->{_io}->read_u2le();
    }
    if ($self->is_cb_size_meaningful()) {
        $self->{w_valid_bits_per_sample} = $self->{_io}->read_u2le();
    }
    if ($self->is_extensible()) {
        $self->{channel_mask_and_subformat} = Wav::ChannelMaskAndSubformatType->new($self->{_io}, $self, $self->{_root});
    }
}

sub is_extensible {
    my ($self) = @_;
    return $self->{is_extensible} if ($self->{is_extensible});
    $self->{is_extensible} = $self->w_format_tag() == $W_FORMAT_TAG_TYPE_EXTENSIBLE;
    return $self->{is_extensible};
}

sub is_basic_pcm {
    my ($self) = @_;
    return $self->{is_basic_pcm} if ($self->{is_basic_pcm});
    $self->{is_basic_pcm} = $self->w_format_tag() == $W_FORMAT_TAG_TYPE_PCM;
    return $self->{is_basic_pcm};
}

sub is_basic_float {
    my ($self) = @_;
    return $self->{is_basic_float} if ($self->{is_basic_float});
    $self->{is_basic_float} = $self->w_format_tag() == $W_FORMAT_TAG_TYPE_IEEE_FLOAT;
    return $self->{is_basic_float};
}

sub is_cb_size_meaningful {
    my ($self) = @_;
    return $self->{is_cb_size_meaningful} if ($self->{is_cb_size_meaningful});
    $self->{is_cb_size_meaningful} =  ((!($self->is_basic_pcm())) && ($self->cb_size() != 0)) ;
    return $self->{is_cb_size_meaningful};
}

sub w_format_tag {
    my ($self) = @_;
    return $self->{w_format_tag};
}

sub n_channels {
    my ($self) = @_;
    return $self->{n_channels};
}

sub n_samples_per_sec {
    my ($self) = @_;
    return $self->{n_samples_per_sec};
}

sub n_avg_bytes_per_sec {
    my ($self) = @_;
    return $self->{n_avg_bytes_per_sec};
}

sub n_block_align {
    my ($self) = @_;
    return $self->{n_block_align};
}

sub w_bits_per_sample {
    my ($self) = @_;
    return $self->{w_bits_per_sample};
}

sub cb_size {
    my ($self) = @_;
    return $self->{cb_size};
}

sub w_valid_bits_per_sample {
    my ($self) = @_;
    return $self->{w_valid_bits_per_sample};
}

sub channel_mask_and_subformat {
    my ($self) = @_;
    return $self->{channel_mask_and_subformat};
}

########################################################################
package Wav::GuidType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{data1} = $self->{_io}->read_u4le();
    $self->{data2} = $self->{_io}->read_u2le();
    $self->{data3} = $self->{_io}->read_u2le();
    $self->{data4} = $self->{_io}->read_u4be();
    $self->{data4a} = $self->{_io}->read_u4be();
}

sub data1 {
    my ($self) = @_;
    return $self->{data1};
}

sub data2 {
    my ($self) = @_;
    return $self->{data2};
}

sub data3 {
    my ($self) = @_;
    return $self->{data3};
}

sub data4 {
    my ($self) = @_;
    return $self->{data4};
}

sub data4a {
    my ($self) = @_;
    return $self->{data4a};
}

########################################################################
package Wav::CuePointType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{dw_name} = $self->{_io}->read_u4le();
    $self->{dw_position} = $self->{_io}->read_u4le();
    $self->{fcc_chunk} = $self->{_io}->read_u4le();
    $self->{dw_chunk_start} = $self->{_io}->read_u4le();
    $self->{dw_block_start} = $self->{_io}->read_u4le();
    $self->{dw_sample_offset} = $self->{_io}->read_u4le();
}

sub dw_name {
    my ($self) = @_;
    return $self->{dw_name};
}

sub dw_position {
    my ($self) = @_;
    return $self->{dw_position};
}

sub fcc_chunk {
    my ($self) = @_;
    return $self->{fcc_chunk};
}

sub dw_chunk_start {
    my ($self) = @_;
    return $self->{dw_chunk_start};
}

sub dw_block_start {
    my ($self) = @_;
    return $self->{dw_block_start};
}

sub dw_sample_offset {
    my ($self) = @_;
    return $self->{dw_sample_offset};
}

########################################################################
package Wav::DataChunkType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{data} = $self->{_io}->read_bytes_full();
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Wav::SamplesType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{samples} = $self->{_io}->read_u4le();
}

sub samples {
    my ($self) = @_;
    return $self->{samples};
}

########################################################################
package Wav::ChannelMaskAndSubformatType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{dw_channel_mask} = Wav::ChannelMaskType->new($self->{_io}, $self, $self->{_root});
    $self->{subformat} = Wav::GuidType->new($self->{_io}, $self, $self->{_root});
}

sub dw_channel_mask {
    my ($self) = @_;
    return $self->{dw_channel_mask};
}

sub subformat {
    my ($self) = @_;
    return $self->{subformat};
}

########################################################################
package Wav::ChunksType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{chunk} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{chunk}}, Wav::ChunkType->new($self->{_io}, $self, $self->{_root});
    }
}

sub chunk {
    my ($self) = @_;
    return $self->{chunk};
}

########################################################################
package Wav::CueChunkType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{dw_cue_points} = $self->{_io}->read_u4le();
    if ($self->dw_cue_points() != 0) {
        $self->{cue_points} = ();
        my $n_cue_points = $self->dw_cue_points();
        for (my $i = 0; $i < $n_cue_points; $i++) {
            $self->{cue_points}[$i] = Wav::CuePointType->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub dw_cue_points {
    my ($self) = @_;
    return $self->{dw_cue_points};
}

sub cue_points {
    my ($self) = @_;
    return $self->{cue_points};
}

########################################################################
package Wav::ChannelMaskType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{front_right_of_center} = $self->{_io}->read_bits_int(1);
    $self->{front_left_of_center} = $self->{_io}->read_bits_int(1);
    $self->{back_right} = $self->{_io}->read_bits_int(1);
    $self->{back_left} = $self->{_io}->read_bits_int(1);
    $self->{low_frequency} = $self->{_io}->read_bits_int(1);
    $self->{front_center} = $self->{_io}->read_bits_int(1);
    $self->{front_right} = $self->{_io}->read_bits_int(1);
    $self->{front_left} = $self->{_io}->read_bits_int(1);
    $self->{top_center} = $self->{_io}->read_bits_int(1);
    $self->{side_right} = $self->{_io}->read_bits_int(1);
    $self->{side_left} = $self->{_io}->read_bits_int(1);
    $self->{back_center} = $self->{_io}->read_bits_int(1);
    $self->{top_back_left} = $self->{_io}->read_bits_int(1);
    $self->{top_front_right} = $self->{_io}->read_bits_int(1);
    $self->{top_front_center} = $self->{_io}->read_bits_int(1);
    $self->{top_front_left} = $self->{_io}->read_bits_int(1);
    $self->{unused1} = $self->{_io}->read_bits_int(6);
    $self->{top_back_right} = $self->{_io}->read_bits_int(1);
    $self->{top_back_center} = $self->{_io}->read_bits_int(1);
    $self->{unused2} = $self->{_io}->read_bits_int(8);
}

sub front_right_of_center {
    my ($self) = @_;
    return $self->{front_right_of_center};
}

sub front_left_of_center {
    my ($self) = @_;
    return $self->{front_left_of_center};
}

sub back_right {
    my ($self) = @_;
    return $self->{back_right};
}

sub back_left {
    my ($self) = @_;
    return $self->{back_left};
}

sub low_frequency {
    my ($self) = @_;
    return $self->{low_frequency};
}

sub front_center {
    my ($self) = @_;
    return $self->{front_center};
}

sub front_right {
    my ($self) = @_;
    return $self->{front_right};
}

sub front_left {
    my ($self) = @_;
    return $self->{front_left};
}

sub top_center {
    my ($self) = @_;
    return $self->{top_center};
}

sub side_right {
    my ($self) = @_;
    return $self->{side_right};
}

sub side_left {
    my ($self) = @_;
    return $self->{side_left};
}

sub back_center {
    my ($self) = @_;
    return $self->{back_center};
}

sub top_back_left {
    my ($self) = @_;
    return $self->{top_back_left};
}

sub top_front_right {
    my ($self) = @_;
    return $self->{top_front_right};
}

sub top_front_center {
    my ($self) = @_;
    return $self->{top_front_center};
}

sub top_front_left {
    my ($self) = @_;
    return $self->{top_front_left};
}

sub unused1 {
    my ($self) = @_;
    return $self->{unused1};
}

sub top_back_right {
    my ($self) = @_;
    return $self->{top_back_right};
}

sub top_back_center {
    my ($self) = @_;
    return $self->{top_back_center};
}

sub unused2 {
    my ($self) = @_;
    return $self->{unused2};
}

########################################################################
package Wav::ChunkType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{chunk_id} = $self->{_io}->read_u4be();
    $self->{len} = $self->{_io}->read_u4le();
    my $_on = $self->chunk_id();
    if ($_on == 1684108385) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Wav::DataChunkType->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == 1668637984) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Wav::CueChunkType->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == 1650817140) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Wav::BextChunkType->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == 1718449184) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Wav::FormatChunkType->new($io__raw_data, $self, $self->{_root});
    }
    else {
        $self->{data} = $self->{_io}->read_bytes($self->len());
    }
}

sub chunk_id {
    my ($self) = @_;
    return $self->{chunk_id};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package Wav::BextChunkType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{description} = Encode::decode("ASCII", $self->{_io}->read_bytes(256));
    $self->{originator} = Encode::decode("ASCII", $self->{_io}->read_bytes(32));
    $self->{originator_reference} = Encode::decode("ASCII", $self->{_io}->read_bytes(32));
    $self->{origination_date} = Encode::decode("ASCII", $self->{_io}->read_bytes(10));
    $self->{origination_time} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
    $self->{time_reference_low} = $self->{_io}->read_u4le();
    $self->{time_reference_high} = $self->{_io}->read_u4le();
    $self->{version} = $self->{_io}->read_u2le();
    $self->{umid} = $self->{_io}->read_bytes(64);
    $self->{loudness_value} = $self->{_io}->read_u2le();
    $self->{loudness_range} = $self->{_io}->read_u2le();
    $self->{max_true_peak_level} = $self->{_io}->read_u2le();
    $self->{max_momentary_loudness} = $self->{_io}->read_u2le();
    $self->{max_short_term_loudness} = $self->{_io}->read_u2le();
}

sub description {
    my ($self) = @_;
    return $self->{description};
}

sub originator {
    my ($self) = @_;
    return $self->{originator};
}

sub originator_reference {
    my ($self) = @_;
    return $self->{originator_reference};
}

sub origination_date {
    my ($self) = @_;
    return $self->{origination_date};
}

sub origination_time {
    my ($self) = @_;
    return $self->{origination_time};
}

sub time_reference_low {
    my ($self) = @_;
    return $self->{time_reference_low};
}

sub time_reference_high {
    my ($self) = @_;
    return $self->{time_reference_high};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub umid {
    my ($self) = @_;
    return $self->{umid};
}

sub loudness_value {
    my ($self) = @_;
    return $self->{loudness_value};
}

sub loudness_range {
    my ($self) = @_;
    return $self->{loudness_range};
}

sub max_true_peak_level {
    my ($self) = @_;
    return $self->{max_true_peak_level};
}

sub max_momentary_loudness {
    my ($self) = @_;
    return $self->{max_momentary_loudness};
}

sub max_short_term_loudness {
    my ($self) = @_;
    return $self->{max_short_term_loudness};
}

1;
