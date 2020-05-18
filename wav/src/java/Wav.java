// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * The WAVE file format is a subset of Microsoft's RIFF specification for the
 * storage of multimedia files. A RIFF file starts out with a file header
 * followed by a sequence of data chunks. A WAVE file is often just a RIFF
 * file with a single "WAVE" chunk which consists of two sub-chunks --
 * a "fmt " chunk specifying the data format and a "data" chunk containing
 * the actual sample data.
 * 
 * This Kaitai implementation was written by John Byrd of Gigantic Software
 * (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
 * @see <a href="https://www.loc.gov/preservation/digital/formats/fdd/fdd000001.shtml">Source</a>
 */
public class Wav extends KaitaiStruct {
    public static Wav fromFile(String fileName) throws IOException {
        return new Wav(new ByteBufferKaitaiStream(fileName));
    }

    public enum WFormatTagType {
        UNKNOWN(0),
        PCM(1),
        ADPCM(2),
        IEEE_FLOAT(3),
        VSELP(4),
        IBM_CVSD(5),
        ALAW(6),
        MULAW(7),
        DTS(8),
        DRM(9),
        WMAVOICE9(10),
        WMAVOICE10(11),
        OKI_ADPCM(16),
        DVI_ADPCM(17),
        MEDIASPACE_ADPCM(18),
        SIERRA_ADPCM(19),
        G723_ADPCM(20),
        DIGISTD(21),
        DIGIFIX(22),
        DIALOGIC_OKI_ADPCM(23),
        MEDIAVISION_ADPCM(24),
        CU_CODEC(25),
        HP_DYN_VOICE(26),
        YAMAHA_ADPCM(32),
        SONARC(33),
        DSPGROUP_TRUESPEECH(34),
        ECHOSC1(35),
        AUDIOFILE_AF36(36),
        APTX(37),
        AUDIOFILE_AF10(38),
        PROSODY_1612(39),
        LRC(40),
        DOLBY_AC2(48),
        GSM610(49),
        MSNAUDIO(50),
        ANTEX_ADPCME(51),
        CONTROL_RES_VQLPC(52),
        DIGIREAL(53),
        DIGIADPCM(54),
        CONTROL_RES_CR10(55),
        NMS_VBXADPCM(56),
        CS_IMAADPCM(57),
        ECHOSC3(58),
        ROCKWELL_ADPCM(59),
        ROCKWELL_DIGITALK(60),
        XEBEC(61),
        G721_ADPCM(64),
        G728_CELP(65),
        MSG723(66),
        INTEL_G723_1(67),
        INTEL_G729(68),
        SHARP_G726(69),
        MPEG(80),
        RT24(82),
        PAC(83),
        MPEGLAYER3(85),
        LUCENT_G723(89),
        CIRRUS(96),
        ESPCM(97),
        VOXWARE(98),
        CANOPUS_ATRAC(99),
        G726_ADPCM(100),
        G722_ADPCM(101),
        DSAT(102),
        DSAT_DISPLAY(103),
        VOXWARE_BYTE_ALIGNED(105),
        VOXWARE_AC8(112),
        VOXWARE_AC10(113),
        VOXWARE_AC16(114),
        VOXWARE_AC20(115),
        VOXWARE_RT24(116),
        VOXWARE_RT29(117),
        VOXWARE_RT29HW(118),
        VOXWARE_VR12(119),
        VOXWARE_VR18(120),
        VOXWARE_TQ40(121),
        VOXWARE_SC3(122),
        VOXWARE_SC3_1(123),
        SOFTSOUND(128),
        VOXWARE_TQ60(129),
        MSRT24(130),
        G729A(131),
        MVI_MVI2(132),
        DF_G726(133),
        DF_GSM610(134),
        ISIAUDIO(136),
        ONLIVE(137),
        MULTITUDE_FT_SX20(138),
        INFOCOM_ITS_G721_ADPCM(139),
        CONVEDIA_G729(140),
        CONGRUENCY(141),
        SBC24(145),
        DOLBY_AC3_SPDIF(146),
        MEDIASONIC_G723(147),
        PROSODY_8KBPS(148),
        ZYXEL_ADPCM(151),
        PHILIPS_LPCBB(152),
        PACKED(153),
        MALDEN_PHONYTALK(160),
        RACAL_RECORDER_GSM(161),
        RACAL_RECORDER_G720_A(162),
        RACAL_RECORDER_G723_1(163),
        RACAL_RECORDER_TETRA_ACELP(164),
        NEC_AAC(176),
        RAW_AAC1(255),
        RHETOREX_ADPCM(256),
        IRAT(257),
        VIVO_G723(273),
        VIVO_SIREN(274),
        PHILIPS_CELP(288),
        PHILIPS_GRUNDIG(289),
        DIGITAL_G723(291),
        SANYO_LD_ADPCM(293),
        SIPROLAB_ACEPLNET(304),
        SIPROLAB_ACELP4800(305),
        SIPROLAB_ACELP8V3(306),
        SIPROLAB_G729(307),
        SIPROLAB_G729A(308),
        SIPROLAB_KELVIN(309),
        VOICEAGE_AMR(310),
        G726ADPCM(320),
        DICTAPHONE_CELP68(321),
        DICTAPHONE_CELP54(322),
        QUALCOMM_PUREVOICE(336),
        QUALCOMM_HALFRATE(337),
        TUBGSM(341),
        MSAUDIO1(352),
        WMAUDIO2(353),
        WMAUDIO3(354),
        WMAUDIO_LOSSLESS(355),
        WMASPDIF(356),
        UNISYS_NAP_ADPCM(368),
        UNISYS_NAP_ULAW(369),
        UNISYS_NAP_ALAW(370),
        UNISYS_NAP_16K(371),
        SYCOM_ACM_SYC008(372),
        SYCOM_ACM_SYC701_G726L(373),
        SYCOM_ACM_SYC701_CELP54(374),
        SYCOM_ACM_SYC701_CELP68(375),
        KNOWLEDGE_ADVENTURE_ADPCM(376),
        FRAUNHOFER_IIS_MPEG2_AAC(384),
        DTS_DS(400),
        CREATIVE_ADPCM(512),
        CREATIVE_FASTSPEECH8(514),
        CREATIVE_FASTSPEECH10(515),
        UHER_ADPCM(528),
        ULEAD_DV_AUDIO(533),
        ULEAD_DV_AUDIO_1(534),
        QUARTERDECK(544),
        ILINK_VC(560),
        RAW_SPORT(576),
        ESST_AC3(577),
        GENERIC_PASSTHRU(585),
        IPI_HSX(592),
        IPI_RPELP(593),
        CS2(608),
        SONY_SCX(624),
        SONY_SCY(625),
        SONY_ATRAC3(626),
        SONY_SPC(627),
        TELUM_AUDIO(640),
        TELUM_IA_AUDIO(641),
        NORCOM_VOICE_SYSTEMS_ADPCM(645),
        FM_TOWNS_SND(768),
        MICRONAS(848),
        MICRONAS_CELP833(849),
        BTV_DIGITAL(1024),
        INTEL_MUSIC_CODER(1025),
        INDEO_AUDIO(1026),
        QDESIGN_MUSIC(1104),
        ON2_VP7_AUDIO(1280),
        ON2_VP6_AUDIO(1281),
        VME_VMPCM(1664),
        TPC(1665),
        LIGHTWAVE_LOSSLESS(2222),
        OLIGSM(4096),
        OLIADPCM(4097),
        OLICELP(4098),
        OLISBC(4099),
        OLIOPR(4100),
        LH_CODEC(4352),
        LH_CODEC_CELP(4353),
        LH_CODEC_SBC8(4354),
        LH_CODEC_SBC12(4355),
        LH_CODEC_SBC16(4356),
        NORRIS(5120),
        ISIAUDIO_2(5121),
        SOUNDSPACE_MUSICOMPRESS(5376),
        MPEG_ADTS_AAC(5632),
        MPEG_RAW_AAC(5633),
        MPEG_LOAS(5634),
        NOKIA_MPEG_ADTS_AAC(5640),
        NOKIA_MPEG_RAW_AAC(5641),
        VODAFONE_MPEG_ADTS_AAC(5642),
        VODAFONE_MPEG_RAW_AAC(5643),
        MPEG_HEAAC(5648),
        VOXWARE_RT24_SPEECH(6172),
        SONICFOUNDRY_LOSSLESS(6513),
        INNINGS_TELECOM_ADPCM(6521),
        LUCENT_SX8300P(7175),
        LUCENT_SX5363S(7180),
        CUSEEME(7939),
        NTCSOFT_ALF2CM_ACM(8132),
        DVM(8192),
        DTS2(8193),
        MAKEAVIS(13075),
        DIVIO_MPEG4_AAC(16707),
        NOKIA_ADAPTIVE_MULTIRATE(16897),
        DIVIO_G726(16963),
        LEAD_SPEECH(17228),
        LEAD_VORBIS(22092),
        WAVPACK_AUDIO(22358),
        OGG_VORBIS_MODE_1(26447),
        OGG_VORBIS_MODE_2(26448),
        OGG_VORBIS_MODE_3(26449),
        OGG_VORBIS_MODE_1_PLUS(26479),
        OGG_VORBIS_MODE_2_PLUS(26480),
        OGG_VORBIS_MODE_3_PLUS(26481),
        THREECOM_NBX(28672),
        FAAD_AAC(28781),
        AMR_NB(29537),
        AMR_WB(29538),
        AMR_WP(29539),
        GSM_AMR_CBR(31265),
        GSM_AMR_VBR_SID(31266),
        COMVERSE_INFOSYS_G723_1(41216),
        COMVERSE_INFOSYS_AVQSBC(41217),
        COMVERSE_INFOSYS_SBC(41218),
        SYMBOL_G729_A(41219),
        VOICEAGE_AMR_WB(41220),
        INGENIENT_G726(41221),
        MPEG4_AAC(41222),
        ENCORE_G726(41223),
        ZOLL_ASAO(41224),
        SPEEX_VOICE(41225),
        VIANIX_MASC(41226),
        WM9_SPECTRUM_ANALYZER(41227),
        WMF_SPECTRUM_ANAYZER(41228),
        GSM_610(41229),
        GSM_620(41230),
        GSM_660(41231),
        GSM_690(41232),
        GSM_ADAPTIVE_MULTIRATE_WB(41233),
        POLYCOM_G722(41234),
        POLYCOM_G728(41235),
        POLYCOM_G729_A(41236),
        POLYCOM_SIREN(41237),
        GLOBAL_IP_ILBC(41238),
        RADIOTIME_TIME_SHIFT_RADIO(41239),
        NICE_ACA(41240),
        NICE_ADPCM(41241),
        VOCORD_G721(41242),
        VOCORD_G726(41243),
        VOCORD_G722_1(41244),
        VOCORD_G728(41245),
        VOCORD_G729(41246),
        VOCORD_G729_A(41247),
        VOCORD_G723_1(41248),
        VOCORD_LBC(41249),
        NICE_G728(41250),
        FRACE_TELECOM_G729(41251),
        CODIAN(41252),
        FLAC(61868),
        EXTENSIBLE(65534),
        DEVELOPMENT(65535);

        private final long id;
        WFormatTagType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, WFormatTagType> byId = new HashMap<Long, WFormatTagType>(265);
        static {
            for (WFormatTagType e : WFormatTagType.values())
                byId.put(e.id(), e);
        }
        public static WFormatTagType byId(long id) { return byId.get(id); }
    }

    public enum ChunkType {
        FMT(544501094),
        BEXT(1650817140),
        CUE(1668637984),
        DATA(1684108385),
        MINF(1835626086),
        REGN(1919248238),
        UMID(1970104676);

        private final long id;
        ChunkType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ChunkType> byId = new HashMap<Long, ChunkType>(7);
        static {
            for (ChunkType e : ChunkType.values())
                byId.put(e.id(), e);
        }
        public static ChunkType byId(long id) { return byId.get(id); }
    }

    public Wav(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Wav(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Wav(KaitaiStream _io, KaitaiStruct _parent, Wav _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.riffId = this._io.ensureFixedContents(new byte[] { 82, 73, 70, 70 });
        this.fileSize = this._io.readU4le();
        this.waveId = this._io.ensureFixedContents(new byte[] { 87, 65, 86, 69 });
        this._raw_chunks = this._io.readBytes((fileSize() - 4));
        KaitaiStream _io__raw_chunks = new ByteBufferKaitaiStream(_raw_chunks);
        this.chunks = new ChunksType(_io__raw_chunks, this, _root);
        this.padByte = this._io.readBytes(KaitaiStream.mod(fileSize(), 2));
    }
    public static class SampleType extends KaitaiStruct {
        public static SampleType fromFile(String fileName) throws IOException {
            return new SampleType(new ByteBufferKaitaiStream(fileName));
        }

        public SampleType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SampleType(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public SampleType(KaitaiStream _io, KaitaiStruct _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sample = this._io.readU2le();
        }
        private int sample;
        private Wav _root;
        private KaitaiStruct _parent;
        public int sample() { return sample; }
        public Wav _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class FormatChunkType extends KaitaiStruct {
        public static FormatChunkType fromFile(String fileName) throws IOException {
            return new FormatChunkType(new ByteBufferKaitaiStream(fileName));
        }

        public FormatChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FormatChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public FormatChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.wFormatTag = Wav.WFormatTagType.byId(this._io.readU2le());
            this.nChannels = this._io.readU2le();
            this.nSamplesPerSec = this._io.readU4le();
            this.nAvgBytesPerSec = this._io.readU4le();
            this.nBlockAlign = this._io.readU2le();
            this.wBitsPerSample = this._io.readU2le();
            if (!(isBasicPcm())) {
                this.cbSize = this._io.readU2le();
            }
            if (isCbSizeMeaningful()) {
                this.wValidBitsPerSample = this._io.readU2le();
            }
            if (isExtensible()) {
                this.channelMaskAndSubformat = new ChannelMaskAndSubformatType(this._io, this, _root);
            }
        }
        private Boolean isExtensible;
        public Boolean isExtensible() {
            if (this.isExtensible != null)
                return this.isExtensible;
            boolean _tmp = (boolean) (wFormatTag() == Wav.WFormatTagType.EXTENSIBLE);
            this.isExtensible = _tmp;
            return this.isExtensible;
        }
        private Boolean isBasicPcm;
        public Boolean isBasicPcm() {
            if (this.isBasicPcm != null)
                return this.isBasicPcm;
            boolean _tmp = (boolean) (wFormatTag() == Wav.WFormatTagType.PCM);
            this.isBasicPcm = _tmp;
            return this.isBasicPcm;
        }
        private Boolean isBasicFloat;
        public Boolean isBasicFloat() {
            if (this.isBasicFloat != null)
                return this.isBasicFloat;
            boolean _tmp = (boolean) (wFormatTag() == Wav.WFormatTagType.IEEE_FLOAT);
            this.isBasicFloat = _tmp;
            return this.isBasicFloat;
        }
        private Boolean isCbSizeMeaningful;
        public Boolean isCbSizeMeaningful() {
            if (this.isCbSizeMeaningful != null)
                return this.isCbSizeMeaningful;
            boolean _tmp = (boolean) ( ((!(isBasicPcm())) && (cbSize() != 0)) );
            this.isCbSizeMeaningful = _tmp;
            return this.isCbSizeMeaningful;
        }
        private WFormatTagType wFormatTag;
        private int nChannels;
        private long nSamplesPerSec;
        private long nAvgBytesPerSec;
        private int nBlockAlign;
        private int wBitsPerSample;
        private Integer cbSize;
        private Integer wValidBitsPerSample;
        private ChannelMaskAndSubformatType channelMaskAndSubformat;
        private Wav _root;
        private Wav.ChunkType _parent;
        public WFormatTagType wFormatTag() { return wFormatTag; }
        public int nChannels() { return nChannels; }
        public long nSamplesPerSec() { return nSamplesPerSec; }
        public long nAvgBytesPerSec() { return nAvgBytesPerSec; }
        public int nBlockAlign() { return nBlockAlign; }
        public int wBitsPerSample() { return wBitsPerSample; }
        public Integer cbSize() { return cbSize; }
        public Integer wValidBitsPerSample() { return wValidBitsPerSample; }
        public ChannelMaskAndSubformatType channelMaskAndSubformat() { return channelMaskAndSubformat; }
        public Wav _root() { return _root; }
        public Wav.ChunkType _parent() { return _parent; }
    }
    public static class GuidType extends KaitaiStruct {
        public static GuidType fromFile(String fileName) throws IOException {
            return new GuidType(new ByteBufferKaitaiStream(fileName));
        }

        public GuidType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GuidType(KaitaiStream _io, Wav.ChannelMaskAndSubformatType _parent) {
            this(_io, _parent, null);
        }

        public GuidType(KaitaiStream _io, Wav.ChannelMaskAndSubformatType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.data1 = this._io.readU4le();
            this.data2 = this._io.readU2le();
            this.data3 = this._io.readU2le();
            this.data4 = this._io.readU4be();
            this.data4a = this._io.readU4be();
        }
        private long data1;
        private int data2;
        private int data3;
        private long data4;
        private long data4a;
        private Wav _root;
        private Wav.ChannelMaskAndSubformatType _parent;
        public long data1() { return data1; }
        public int data2() { return data2; }
        public int data3() { return data3; }
        public long data4() { return data4; }
        public long data4a() { return data4a; }
        public Wav _root() { return _root; }
        public Wav.ChannelMaskAndSubformatType _parent() { return _parent; }
    }
    public static class CuePointType extends KaitaiStruct {
        public static CuePointType fromFile(String fileName) throws IOException {
            return new CuePointType(new ByteBufferKaitaiStream(fileName));
        }

        public CuePointType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CuePointType(KaitaiStream _io, Wav.CueChunkType _parent) {
            this(_io, _parent, null);
        }

        public CuePointType(KaitaiStream _io, Wav.CueChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.dwName = this._io.readU4le();
            this.dwPosition = this._io.readU4le();
            this.fccChunk = this._io.readU4le();
            this.dwChunkStart = this._io.readU4le();
            this.dwBlockStart = this._io.readU4le();
            this.dwSampleOffset = this._io.readU4le();
        }
        private long dwName;
        private long dwPosition;
        private long fccChunk;
        private long dwChunkStart;
        private long dwBlockStart;
        private long dwSampleOffset;
        private Wav _root;
        private Wav.CueChunkType _parent;
        public long dwName() { return dwName; }
        public long dwPosition() { return dwPosition; }
        public long fccChunk() { return fccChunk; }
        public long dwChunkStart() { return dwChunkStart; }
        public long dwBlockStart() { return dwBlockStart; }
        public long dwSampleOffset() { return dwSampleOffset; }
        public Wav _root() { return _root; }
        public Wav.CueChunkType _parent() { return _parent; }
    }
    public static class DataChunkType extends KaitaiStruct {
        public static DataChunkType fromFile(String fileName) throws IOException {
            return new DataChunkType(new ByteBufferKaitaiStream(fileName));
        }

        public DataChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public DataChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.data = this._io.readBytesFull();
        }
        private byte[] data;
        private Wav _root;
        private Wav.ChunkType _parent;
        public byte[] data() { return data; }
        public Wav _root() { return _root; }
        public Wav.ChunkType _parent() { return _parent; }
    }
    public static class SamplesType extends KaitaiStruct {
        public static SamplesType fromFile(String fileName) throws IOException {
            return new SamplesType(new ByteBufferKaitaiStream(fileName));
        }

        public SamplesType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SamplesType(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public SamplesType(KaitaiStream _io, KaitaiStruct _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.samples = this._io.readU4le();
        }
        private long samples;
        private Wav _root;
        private KaitaiStruct _parent;
        public long samples() { return samples; }
        public Wav _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class ChannelMaskAndSubformatType extends KaitaiStruct {
        public static ChannelMaskAndSubformatType fromFile(String fileName) throws IOException {
            return new ChannelMaskAndSubformatType(new ByteBufferKaitaiStream(fileName));
        }

        public ChannelMaskAndSubformatType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChannelMaskAndSubformatType(KaitaiStream _io, Wav.FormatChunkType _parent) {
            this(_io, _parent, null);
        }

        public ChannelMaskAndSubformatType(KaitaiStream _io, Wav.FormatChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.dwChannelMask = new ChannelMaskType(this._io, this, _root);
            this.subformat = new GuidType(this._io, this, _root);
        }
        private ChannelMaskType dwChannelMask;
        private GuidType subformat;
        private Wav _root;
        private Wav.FormatChunkType _parent;
        public ChannelMaskType dwChannelMask() { return dwChannelMask; }
        public GuidType subformat() { return subformat; }
        public Wav _root() { return _root; }
        public Wav.FormatChunkType _parent() { return _parent; }
    }
    public static class ChunksType extends KaitaiStruct {
        public static ChunksType fromFile(String fileName) throws IOException {
            return new ChunksType(new ByteBufferKaitaiStream(fileName));
        }

        public ChunksType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChunksType(KaitaiStream _io, Wav _parent) {
            this(_io, _parent, null);
        }

        public ChunksType(KaitaiStream _io, Wav _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.chunk = new ArrayList<ChunkType>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.chunk.add(new ChunkType(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<ChunkType> chunk;
        private Wav _root;
        private Wav _parent;
        public ArrayList<ChunkType> chunk() { return chunk; }
        public Wav _root() { return _root; }
        public Wav _parent() { return _parent; }
    }
    public static class CueChunkType extends KaitaiStruct {
        public static CueChunkType fromFile(String fileName) throws IOException {
            return new CueChunkType(new ByteBufferKaitaiStream(fileName));
        }

        public CueChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CueChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public CueChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.dwCuePoints = this._io.readU4le();
            if (dwCuePoints() != 0) {
                cuePoints = new ArrayList<CuePointType>((int) (dwCuePoints()));
                for (int i = 0; i < dwCuePoints(); i++) {
                    this.cuePoints.add(new CuePointType(this._io, this, _root));
                }
            }
        }
        private long dwCuePoints;
        private ArrayList<CuePointType> cuePoints;
        private Wav _root;
        private Wav.ChunkType _parent;
        public long dwCuePoints() { return dwCuePoints; }
        public ArrayList<CuePointType> cuePoints() { return cuePoints; }
        public Wav _root() { return _root; }
        public Wav.ChunkType _parent() { return _parent; }
    }
    public static class ChannelMaskType extends KaitaiStruct {
        public static ChannelMaskType fromFile(String fileName) throws IOException {
            return new ChannelMaskType(new ByteBufferKaitaiStream(fileName));
        }

        public ChannelMaskType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChannelMaskType(KaitaiStream _io, Wav.ChannelMaskAndSubformatType _parent) {
            this(_io, _parent, null);
        }

        public ChannelMaskType(KaitaiStream _io, Wav.ChannelMaskAndSubformatType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.frontRightOfCenter = this._io.readBitsInt(1) != 0;
            this.frontLeftOfCenter = this._io.readBitsInt(1) != 0;
            this.backRight = this._io.readBitsInt(1) != 0;
            this.backLeft = this._io.readBitsInt(1) != 0;
            this.lowFrequency = this._io.readBitsInt(1) != 0;
            this.frontCenter = this._io.readBitsInt(1) != 0;
            this.frontRight = this._io.readBitsInt(1) != 0;
            this.frontLeft = this._io.readBitsInt(1) != 0;
            this.topCenter = this._io.readBitsInt(1) != 0;
            this.sideRight = this._io.readBitsInt(1) != 0;
            this.sideLeft = this._io.readBitsInt(1) != 0;
            this.backCenter = this._io.readBitsInt(1) != 0;
            this.topBackLeft = this._io.readBitsInt(1) != 0;
            this.topFrontRight = this._io.readBitsInt(1) != 0;
            this.topFrontCenter = this._io.readBitsInt(1) != 0;
            this.topFrontLeft = this._io.readBitsInt(1) != 0;
            this.unused1 = this._io.readBitsInt(6);
            this.topBackRight = this._io.readBitsInt(1) != 0;
            this.topBackCenter = this._io.readBitsInt(1) != 0;
            this.unused2 = this._io.readBitsInt(8);
        }
        private boolean frontRightOfCenter;
        private boolean frontLeftOfCenter;
        private boolean backRight;
        private boolean backLeft;
        private boolean lowFrequency;
        private boolean frontCenter;
        private boolean frontRight;
        private boolean frontLeft;
        private boolean topCenter;
        private boolean sideRight;
        private boolean sideLeft;
        private boolean backCenter;
        private boolean topBackLeft;
        private boolean topFrontRight;
        private boolean topFrontCenter;
        private boolean topFrontLeft;
        private long unused1;
        private boolean topBackRight;
        private boolean topBackCenter;
        private long unused2;
        private Wav _root;
        private Wav.ChannelMaskAndSubformatType _parent;
        public boolean frontRightOfCenter() { return frontRightOfCenter; }
        public boolean frontLeftOfCenter() { return frontLeftOfCenter; }
        public boolean backRight() { return backRight; }
        public boolean backLeft() { return backLeft; }
        public boolean lowFrequency() { return lowFrequency; }
        public boolean frontCenter() { return frontCenter; }
        public boolean frontRight() { return frontRight; }
        public boolean frontLeft() { return frontLeft; }
        public boolean topCenter() { return topCenter; }
        public boolean sideRight() { return sideRight; }
        public boolean sideLeft() { return sideLeft; }
        public boolean backCenter() { return backCenter; }
        public boolean topBackLeft() { return topBackLeft; }
        public boolean topFrontRight() { return topFrontRight; }
        public boolean topFrontCenter() { return topFrontCenter; }
        public boolean topFrontLeft() { return topFrontLeft; }
        public long unused1() { return unused1; }
        public boolean topBackRight() { return topBackRight; }
        public boolean topBackCenter() { return topBackCenter; }
        public long unused2() { return unused2; }
        public Wav _root() { return _root; }
        public Wav.ChannelMaskAndSubformatType _parent() { return _parent; }
    }
    public static class ChunkType extends KaitaiStruct {
        public static ChunkType fromFile(String fileName) throws IOException {
            return new ChunkType(new ByteBufferKaitaiStream(fileName));
        }

        public ChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChunkType(KaitaiStream _io, Wav.ChunksType _parent) {
            this(_io, _parent, null);
        }

        public ChunkType(KaitaiStream _io, Wav.ChunksType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.chunkId = this._io.readU4be();
            this.len = this._io.readU4le();
            switch (chunkId()) {
            case 1684108385: {
                this._raw_data = this._io.readBytes(len());
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new DataChunkType(_io__raw_data, this, _root);
                break;
            }
            case 1668637984: {
                this._raw_data = this._io.readBytes(len());
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new CueChunkType(_io__raw_data, this, _root);
                break;
            }
            case 1650817140: {
                this._raw_data = this._io.readBytes(len());
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new BextChunkType(_io__raw_data, this, _root);
                break;
            }
            case 1718449184: {
                this._raw_data = this._io.readBytes(len());
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new FormatChunkType(_io__raw_data, this, _root);
                break;
            }
            default: {
                this.data = this._io.readBytes(len());
                break;
            }
            }
            this.padByte = this._io.readBytes(KaitaiStream.mod(len(), 2));
        }
        private long chunkId;
        private long len;
        private Object data;
        private byte[] padByte;
        private Wav _root;
        private Wav.ChunksType _parent;
        private byte[] _raw_data;
        public long chunkId() { return chunkId; }
        public long len() { return len; }
        public Object data() { return data; }
        public byte[] padByte() { return padByte; }
        public Wav _root() { return _root; }
        public Wav.ChunksType _parent() { return _parent; }
        public byte[] _raw_data() { return _raw_data; }
    }
    public static class BextChunkType extends KaitaiStruct {
        public static BextChunkType fromFile(String fileName) throws IOException {
            return new BextChunkType(new ByteBufferKaitaiStream(fileName));
        }

        public BextChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BextChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public BextChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.description = new String(this._io.readBytes(256), Charset.forName("ASCII"));
            this.originator = new String(this._io.readBytes(32), Charset.forName("ASCII"));
            this.originatorReference = new String(this._io.readBytes(32), Charset.forName("ASCII"));
            this.originationDate = new String(this._io.readBytes(10), Charset.forName("ASCII"));
            this.originationTime = new String(this._io.readBytes(8), Charset.forName("ASCII"));
            this.timeReferenceLow = this._io.readU4le();
            this.timeReferenceHigh = this._io.readU4le();
            this.version = this._io.readU2le();
            this.umid = this._io.readBytes(64);
            this.loudnessValue = this._io.readU2le();
            this.loudnessRange = this._io.readU2le();
            this.maxTruePeakLevel = this._io.readU2le();
            this.maxMomentaryLoudness = this._io.readU2le();
            this.maxShortTermLoudness = this._io.readU2le();
        }
        private String description;
        private String originator;
        private String originatorReference;
        private String originationDate;
        private String originationTime;
        private long timeReferenceLow;
        private long timeReferenceHigh;
        private int version;
        private byte[] umid;
        private int loudnessValue;
        private int loudnessRange;
        private int maxTruePeakLevel;
        private int maxMomentaryLoudness;
        private int maxShortTermLoudness;
        private Wav _root;
        private Wav.ChunkType _parent;
        public String description() { return description; }
        public String originator() { return originator; }
        public String originatorReference() { return originatorReference; }
        public String originationDate() { return originationDate; }
        public String originationTime() { return originationTime; }
        public long timeReferenceLow() { return timeReferenceLow; }
        public long timeReferenceHigh() { return timeReferenceHigh; }
        public int version() { return version; }
        public byte[] umid() { return umid; }
        public int loudnessValue() { return loudnessValue; }
        public int loudnessRange() { return loudnessRange; }
        public int maxTruePeakLevel() { return maxTruePeakLevel; }
        public int maxMomentaryLoudness() { return maxMomentaryLoudness; }
        public int maxShortTermLoudness() { return maxShortTermLoudness; }
        public Wav _root() { return _root; }
        public Wav.ChunkType _parent() { return _parent; }
    }
    private Object formatChunk;
    public Object formatChunk() {
        if (this.formatChunk != null)
            return this.formatChunk;
        this.formatChunk = chunks().chunk().get((int) 0).data();
        return this.formatChunk;
    }
    private byte[] riffId;
    private long fileSize;
    private byte[] waveId;
    private ChunksType chunks;
    private byte[] padByte;
    private Wav _root;
    private KaitaiStruct _parent;
    private byte[] _raw_chunks;
    public byte[] riffId() { return riffId; }
    public long fileSize() { return fileSize; }
    public byte[] waveId() { return waveId; }
    public ChunksType chunks() { return chunks; }
    public byte[] padByte() { return padByte; }
    public Wav _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_chunks() { return _raw_chunks; }
}
