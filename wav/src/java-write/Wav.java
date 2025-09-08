// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Objects;


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
 * @see <a href="http://soundfile.sapp.org/doc/WaveFormat/">Source</a>
 * @see <a href="https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html">Source</a>
 * @see <a href="https://web.archive.org/web/20101031101749/http://www.ebu.ch/fr/technical/publications/userguides/bwf_user_guide.php">Source</a>
 */
public class Wav extends KaitaiStruct.ReadWrite {
    public static Wav fromFile(String fileName) throws IOException {
        return new Wav(new ByteBufferKaitaiStream(fileName));
    }

    public enum Fourcc {
        ID3(540238953),
        CUE(543520099),
        FMT(544501094),
        WAVE(1163280727),
        RIFF(1179011410),
        PEAK(1262568784),
        IXML(1280137321),
        INFO(1330007625),
        LIST(1414744396),
        PMX(1481461855),
        CHNA(1634625635),
        DATA(1635017060),
        UMID(1684630901),
        MINF(1718511981),
        AXML(1819113569),
        REGN(1852269938),
        AFSP(1886611041),
        FACT(1952670054),
        BEXT(1954047330);

        private final long id;
        Fourcc(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Fourcc> byId = new HashMap<Long, Fourcc>(19);
        static {
            for (Fourcc e : Fourcc.values())
                byId.put(e.id(), e);
        }
        public static Fourcc byId(long id) { return byId.get(id); }
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
        FRANCE_TELECOM_G729(41251),
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
    public Wav() {
        this(null, null, null);
    }

    public Wav(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Wav(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Wav(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Wav _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.chunk = new Riff.Chunk(this._io);
        this.chunk._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.chunk._fetchInstances();
        parentChunkData();
        if (this.parentChunkData != null) {
            this.parentChunkData._fetchInstances();
        }
        subchunks();
        if (this.subchunks != null) {
            for (int i = 0; i < this.subchunks.size(); i++) {
                this.subchunks.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteParentChunkData = _enabledParentChunkData;
        _shouldWriteSubchunks = _enabledSubchunks;
        this.chunk._write_Seq(this._io);
    }

    public void _check() {
        if (_enabledParentChunkData) {
            if (isRiffChunk()) {
            }
        }
        if (_enabledSubchunks) {
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://www.mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/">Source</a>
     */
    public static class AfspChunkType extends KaitaiStruct.ReadWrite {
        public static AfspChunkType fromFile(String fileName) throws IOException {
            return new AfspChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public AfspChunkType() {
            this(null, null, null);
        }

        public AfspChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AfspChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public AfspChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 65, 70, 115, 112 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 70, 115, 112 }, this.magic, this._io, "/types/afsp_chunk_type/seq/0");
            }
            this.infoRecords = new ArrayList<String>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.infoRecords.add(new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII));
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.infoRecords.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            for (int i = 0; i < this.infoRecords.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("info_records", 0, this._io.size() - this._io.pos());
                this._io.writeBytes((this.infoRecords.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")));
                this._io.writeU1(0);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("info_records", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 65, 70, 115, 112 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 70, 115, 112 }, this.magic, null, "/types/afsp_chunk_type/seq/0");
            }
            for (int i = 0; i < this.infoRecords.size(); i++) {
                if (KaitaiStream.byteArrayIndexOf((this.infoRecords.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("info_records", -1, KaitaiStream.byteArrayIndexOf((this.infoRecords.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            }
            _dirty = false;
        }
        private byte[] magic;
        private List<String> infoRecords;
        private Wav _root;
        private Wav.ChunkType _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * An array of AFsp information records, in the `<field_name>: <value>`
         * format (e.g. "`program: CopyAudio`"). The list of existing information
         * record types are available in the `doc-ref` links.
         * @see <a href="https://www.mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AF/AFsetInfo.html">Source</a>
         * @see <a href="https://www.mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/libtsp/AF/AFprintInfoRecs.html">Source</a>
         */
        public List<String> infoRecords() { return infoRecords; }
        public void setInfoRecords(List<String> _v) { _dirty = true; infoRecords = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://tech.ebu.ch/docs/tech/tech3285s5.pdf">Source</a>
     */
    public static class AxmlChunkType extends KaitaiStruct.ReadWrite {
        public static AxmlChunkType fromFile(String fileName) throws IOException {
            return new AxmlChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public AxmlChunkType() {
            this(null, null, null);
        }

        public AxmlChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AxmlChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public AxmlChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.data = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.data).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String data;
        private Wav _root;
        private Wav.ChunkType _parent;
        public String data() { return data; }
        public void setData(String _v) { _dirty = true; data = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://en.wikipedia.org/wiki/Broadcast_Wave_Format">Source</a>
     */
    public static class BextChunkType extends KaitaiStruct.ReadWrite {
        public static BextChunkType fromFile(String fileName) throws IOException {
            return new BextChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public BextChunkType() {
            this(null, null, null);
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
        }
        public void _read() {
            this.description = new String(KaitaiStream.bytesTerminate(this._io.readBytes(256), (byte) 0, false), StandardCharsets.US_ASCII);
            this.originator = new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), StandardCharsets.US_ASCII);
            this.originatorReference = new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), StandardCharsets.US_ASCII);
            this.originationDate = new String(this._io.readBytes(10), StandardCharsets.US_ASCII);
            this.originationTime = new String(this._io.readBytes(8), StandardCharsets.US_ASCII);
            this.timeReferenceLow = this._io.readU4le();
            this.timeReferenceHigh = this._io.readU4le();
            this.version = this._io.readU2le();
            this.umid = this._io.readBytes(64);
            this.loudnessValue = this._io.readU2le();
            this.loudnessRange = this._io.readU2le();
            this.maxTruePeakLevel = this._io.readU2le();
            this.maxMomentaryLoudness = this._io.readU2le();
            this.maxShortTermLoudness = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytesLimit((this.description).getBytes(Charset.forName("ASCII")), 256, (byte) 0, (byte) 0);
            this._io.writeBytesLimit((this.originator).getBytes(Charset.forName("ASCII")), 32, (byte) 0, (byte) 0);
            this._io.writeBytesLimit((this.originatorReference).getBytes(Charset.forName("ASCII")), 32, (byte) 0, (byte) 0);
            this._io.writeBytes((this.originationDate).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.originationTime).getBytes(Charset.forName("ASCII")));
            this._io.writeU4le(this.timeReferenceLow);
            this._io.writeU4le(this.timeReferenceHigh);
            this._io.writeU2le(this.version);
            this._io.writeBytes(this.umid);
            this._io.writeU2le(this.loudnessValue);
            this._io.writeU2le(this.loudnessRange);
            this._io.writeU2le(this.maxTruePeakLevel);
            this._io.writeU2le(this.maxMomentaryLoudness);
            this._io.writeU2le(this.maxShortTermLoudness);
        }

        public void _check() {
            if ((this.description).getBytes(Charset.forName("ASCII")).length > 256)
                throw new ConsistencyError("description", 256, (this.description).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.description).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("description", -1, KaitaiStream.byteArrayIndexOf((this.description).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if ((this.originator).getBytes(Charset.forName("ASCII")).length > 32)
                throw new ConsistencyError("originator", 32, (this.originator).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.originator).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("originator", -1, KaitaiStream.byteArrayIndexOf((this.originator).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if ((this.originatorReference).getBytes(Charset.forName("ASCII")).length > 32)
                throw new ConsistencyError("originator_reference", 32, (this.originatorReference).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.originatorReference).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("originator_reference", -1, KaitaiStream.byteArrayIndexOf((this.originatorReference).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if ((this.originationDate).getBytes(Charset.forName("ASCII")).length != 10)
                throw new ConsistencyError("origination_date", 10, (this.originationDate).getBytes(Charset.forName("ASCII")).length);
            if ((this.originationTime).getBytes(Charset.forName("ASCII")).length != 8)
                throw new ConsistencyError("origination_time", 8, (this.originationTime).getBytes(Charset.forName("ASCII")).length);
            if (this.umid.length != 64)
                throw new ConsistencyError("umid", 64, this.umid.length);
            _dirty = false;
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
        public void setDescription(String _v) { _dirty = true; description = _v; }
        public String originator() { return originator; }
        public void setOriginator(String _v) { _dirty = true; originator = _v; }
        public String originatorReference() { return originatorReference; }
        public void setOriginatorReference(String _v) { _dirty = true; originatorReference = _v; }
        public String originationDate() { return originationDate; }
        public void setOriginationDate(String _v) { _dirty = true; originationDate = _v; }
        public String originationTime() { return originationTime; }
        public void setOriginationTime(String _v) { _dirty = true; originationTime = _v; }
        public long timeReferenceLow() { return timeReferenceLow; }
        public void setTimeReferenceLow(long _v) { _dirty = true; timeReferenceLow = _v; }
        public long timeReferenceHigh() { return timeReferenceHigh; }
        public void setTimeReferenceHigh(long _v) { _dirty = true; timeReferenceHigh = _v; }
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public byte[] umid() { return umid; }
        public void setUmid(byte[] _v) { _dirty = true; umid = _v; }
        public int loudnessValue() { return loudnessValue; }
        public void setLoudnessValue(int _v) { _dirty = true; loudnessValue = _v; }
        public int loudnessRange() { return loudnessRange; }
        public void setLoudnessRange(int _v) { _dirty = true; loudnessRange = _v; }
        public int maxTruePeakLevel() { return maxTruePeakLevel; }
        public void setMaxTruePeakLevel(int _v) { _dirty = true; maxTruePeakLevel = _v; }
        public int maxMomentaryLoudness() { return maxMomentaryLoudness; }
        public void setMaxMomentaryLoudness(int _v) { _dirty = true; maxMomentaryLoudness = _v; }
        public int maxShortTermLoudness() { return maxShortTermLoudness; }
        public void setMaxShortTermLoudness(int _v) { _dirty = true; maxShortTermLoudness = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class ChannelMaskAndSubformatType extends KaitaiStruct.ReadWrite {
        public static ChannelMaskAndSubformatType fromFile(String fileName) throws IOException {
            return new ChannelMaskAndSubformatType(new ByteBufferKaitaiStream(fileName));
        }
        public ChannelMaskAndSubformatType() {
            this(null, null, null);
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
        }
        public void _read() {
            this.dwChannelMask = new ChannelMaskType(this._io, this, _root);
            this.dwChannelMask._read();
            this.subformat = new GuidType(this._io, this, _root);
            this.subformat._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.dwChannelMask._fetchInstances();
            this.subformat._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.dwChannelMask._write_Seq(this._io);
            this.subformat._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.dwChannelMask._root(), _root()))
                throw new ConsistencyError("dw_channel_mask", _root(), this.dwChannelMask._root());
            if (!Objects.equals(this.dwChannelMask._parent(), this))
                throw new ConsistencyError("dw_channel_mask", this, this.dwChannelMask._parent());
            if (!Objects.equals(this.subformat._root(), _root()))
                throw new ConsistencyError("subformat", _root(), this.subformat._root());
            if (!Objects.equals(this.subformat._parent(), this))
                throw new ConsistencyError("subformat", this, this.subformat._parent());
            _dirty = false;
        }
        private ChannelMaskType dwChannelMask;
        private GuidType subformat;
        private Wav _root;
        private Wav.FormatChunkType _parent;
        public ChannelMaskType dwChannelMask() { return dwChannelMask; }
        public void setDwChannelMask(ChannelMaskType _v) { _dirty = true; dwChannelMask = _v; }
        public GuidType subformat() { return subformat; }
        public void setSubformat(GuidType _v) { _dirty = true; subformat = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.FormatChunkType _parent() { return _parent; }
        public void set_parent(Wav.FormatChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class ChannelMaskType extends KaitaiStruct.ReadWrite {
        public static ChannelMaskType fromFile(String fileName) throws IOException {
            return new ChannelMaskType(new ByteBufferKaitaiStream(fileName));
        }
        public ChannelMaskType() {
            this(null, null, null);
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
        }
        public void _read() {
            this.frontRightOfCenter = this._io.readBitsIntBe(1) != 0;
            this.frontLeftOfCenter = this._io.readBitsIntBe(1) != 0;
            this.backRight = this._io.readBitsIntBe(1) != 0;
            this.backLeft = this._io.readBitsIntBe(1) != 0;
            this.lowFrequency = this._io.readBitsIntBe(1) != 0;
            this.frontCenter = this._io.readBitsIntBe(1) != 0;
            this.frontRight = this._io.readBitsIntBe(1) != 0;
            this.frontLeft = this._io.readBitsIntBe(1) != 0;
            this.topCenter = this._io.readBitsIntBe(1) != 0;
            this.sideRight = this._io.readBitsIntBe(1) != 0;
            this.sideLeft = this._io.readBitsIntBe(1) != 0;
            this.backCenter = this._io.readBitsIntBe(1) != 0;
            this.topBackLeft = this._io.readBitsIntBe(1) != 0;
            this.topFrontRight = this._io.readBitsIntBe(1) != 0;
            this.topFrontCenter = this._io.readBitsIntBe(1) != 0;
            this.topFrontLeft = this._io.readBitsIntBe(1) != 0;
            this.unused1 = this._io.readBitsIntBe(6);
            this.topBackRight = this._io.readBitsIntBe(1) != 0;
            this.topBackCenter = this._io.readBitsIntBe(1) != 0;
            this.unused2 = this._io.readBitsIntBe(8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.frontRightOfCenter ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.frontLeftOfCenter ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.backRight ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.backLeft ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.lowFrequency ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.frontCenter ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.frontRight ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.frontLeft ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.topCenter ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.sideRight ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.sideLeft ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.backCenter ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.topBackLeft ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.topFrontRight ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.topFrontCenter ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.topFrontLeft ? 1 : 0));
            this._io.writeBitsIntBe(6, this.unused1);
            this._io.writeBitsIntBe(1, (this.topBackRight ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.topBackCenter ? 1 : 0));
            this._io.writeBitsIntBe(8, this.unused2);
        }

        public void _check() {
            _dirty = false;
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
        public void setFrontRightOfCenter(boolean _v) { _dirty = true; frontRightOfCenter = _v; }
        public boolean frontLeftOfCenter() { return frontLeftOfCenter; }
        public void setFrontLeftOfCenter(boolean _v) { _dirty = true; frontLeftOfCenter = _v; }
        public boolean backRight() { return backRight; }
        public void setBackRight(boolean _v) { _dirty = true; backRight = _v; }
        public boolean backLeft() { return backLeft; }
        public void setBackLeft(boolean _v) { _dirty = true; backLeft = _v; }
        public boolean lowFrequency() { return lowFrequency; }
        public void setLowFrequency(boolean _v) { _dirty = true; lowFrequency = _v; }
        public boolean frontCenter() { return frontCenter; }
        public void setFrontCenter(boolean _v) { _dirty = true; frontCenter = _v; }
        public boolean frontRight() { return frontRight; }
        public void setFrontRight(boolean _v) { _dirty = true; frontRight = _v; }
        public boolean frontLeft() { return frontLeft; }
        public void setFrontLeft(boolean _v) { _dirty = true; frontLeft = _v; }
        public boolean topCenter() { return topCenter; }
        public void setTopCenter(boolean _v) { _dirty = true; topCenter = _v; }
        public boolean sideRight() { return sideRight; }
        public void setSideRight(boolean _v) { _dirty = true; sideRight = _v; }
        public boolean sideLeft() { return sideLeft; }
        public void setSideLeft(boolean _v) { _dirty = true; sideLeft = _v; }
        public boolean backCenter() { return backCenter; }
        public void setBackCenter(boolean _v) { _dirty = true; backCenter = _v; }
        public boolean topBackLeft() { return topBackLeft; }
        public void setTopBackLeft(boolean _v) { _dirty = true; topBackLeft = _v; }
        public boolean topFrontRight() { return topFrontRight; }
        public void setTopFrontRight(boolean _v) { _dirty = true; topFrontRight = _v; }
        public boolean topFrontCenter() { return topFrontCenter; }
        public void setTopFrontCenter(boolean _v) { _dirty = true; topFrontCenter = _v; }
        public boolean topFrontLeft() { return topFrontLeft; }
        public void setTopFrontLeft(boolean _v) { _dirty = true; topFrontLeft = _v; }
        public long unused1() { return unused1; }
        public void setUnused1(long _v) { _dirty = true; unused1 = _v; }
        public boolean topBackRight() { return topBackRight; }
        public void setTopBackRight(boolean _v) { _dirty = true; topBackRight = _v; }
        public boolean topBackCenter() { return topBackCenter; }
        public void setTopBackCenter(boolean _v) { _dirty = true; topBackCenter = _v; }
        public long unused2() { return unused2; }
        public void setUnused2(long _v) { _dirty = true; unused2 = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChannelMaskAndSubformatType _parent() { return _parent; }
        public void set_parent(Wav.ChannelMaskAndSubformatType _v) { _dirty = true; _parent = _v; }
    }
    public static class ChunkType extends KaitaiStruct.ReadWrite {
        public static ChunkType fromFile(String fileName) throws IOException {
            return new ChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public ChunkType() {
            this(null, null, null);
        }

        public ChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChunkType(KaitaiStream _io, Wav _parent) {
            this(_io, _parent, null);
        }

        public ChunkType(KaitaiStream _io, Wav _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.chunk = new Riff.Chunk(this._io);
            this.chunk._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.chunk._fetchInstances();
            chunkData();
            if (this.chunkData != null) {
                {
                    Fourcc on = chunkId();
                    if (on != null) {
                        switch (chunkId()) {
                        case AFSP: {
                            ((AfspChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        case AXML: {
                            ((AxmlChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        case BEXT: {
                            ((BextChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        case CUE: {
                            ((CueChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        case DATA: {
                            ((DataChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        case FACT: {
                            ((FactChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        case FMT: {
                            ((FormatChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        case IXML: {
                            ((IxmlChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        case LIST: {
                            ((ListChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        case PMX: {
                            ((PmxChunkType) (this.chunkData))._fetchInstances();
                            break;
                        }
                        }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteChunkData = _enabledChunkData;
            this.chunk._write_Seq(this._io);
        }

        public void _check() {
            if (_enabledChunkData) {
                {
                    Fourcc on = chunkId();
                    if (on != null) {
                        switch (chunkId()) {
                        case AFSP: {
                            if (!Objects.equals(((Wav.AfspChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.AfspChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.AfspChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.AfspChunkType) (this.chunkData))._parent());
                            break;
                        }
                        case AXML: {
                            if (!Objects.equals(((Wav.AxmlChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.AxmlChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.AxmlChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.AxmlChunkType) (this.chunkData))._parent());
                            break;
                        }
                        case BEXT: {
                            if (!Objects.equals(((Wav.BextChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.BextChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.BextChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.BextChunkType) (this.chunkData))._parent());
                            break;
                        }
                        case CUE: {
                            if (!Objects.equals(((Wav.CueChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.CueChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.CueChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.CueChunkType) (this.chunkData))._parent());
                            break;
                        }
                        case DATA: {
                            if (!Objects.equals(((Wav.DataChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.DataChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.DataChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.DataChunkType) (this.chunkData))._parent());
                            break;
                        }
                        case FACT: {
                            if (!Objects.equals(((Wav.FactChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.FactChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.FactChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.FactChunkType) (this.chunkData))._parent());
                            break;
                        }
                        case FMT: {
                            if (!Objects.equals(((Wav.FormatChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.FormatChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.FormatChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.FormatChunkType) (this.chunkData))._parent());
                            break;
                        }
                        case IXML: {
                            if (!Objects.equals(((Wav.IxmlChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.IxmlChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.IxmlChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.IxmlChunkType) (this.chunkData))._parent());
                            break;
                        }
                        case LIST: {
                            if (!Objects.equals(((Wav.ListChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.ListChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.ListChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.ListChunkType) (this.chunkData))._parent());
                            break;
                        }
                        case PMX: {
                            if (!Objects.equals(((Wav.PmxChunkType) (this.chunkData))._root(), _root()))
                                throw new ConsistencyError("chunk_data", _root(), ((Wav.PmxChunkType) (this.chunkData))._root());
                            if (!Objects.equals(((Wav.PmxChunkType) (this.chunkData))._parent(), this))
                                throw new ConsistencyError("chunk_data", this, ((Wav.PmxChunkType) (this.chunkData))._parent());
                            break;
                        }
                        }
                    }
                }
            }
            _dirty = false;
        }
        private KaitaiStruct.ReadWrite chunkData;
        private boolean _shouldWriteChunkData = false;
        private boolean _enabledChunkData = true;
        public KaitaiStruct.ReadWrite chunkData() {
            if (_shouldWriteChunkData)
                _writeChunkData();
            if (this.chunkData != null)
                return this.chunkData;
            if (!_enabledChunkData)
                return null;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            {
                Fourcc on = chunkId();
                if (on != null) {
                    switch (chunkId()) {
                    case AFSP: {
                        this.chunkData = new AfspChunkType(io, this, _root);
                        ((AfspChunkType) (this.chunkData))._read();
                        break;
                    }
                    case AXML: {
                        this.chunkData = new AxmlChunkType(io, this, _root);
                        ((AxmlChunkType) (this.chunkData))._read();
                        break;
                    }
                    case BEXT: {
                        this.chunkData = new BextChunkType(io, this, _root);
                        ((BextChunkType) (this.chunkData))._read();
                        break;
                    }
                    case CUE: {
                        this.chunkData = new CueChunkType(io, this, _root);
                        ((CueChunkType) (this.chunkData))._read();
                        break;
                    }
                    case DATA: {
                        this.chunkData = new DataChunkType(io, this, _root);
                        ((DataChunkType) (this.chunkData))._read();
                        break;
                    }
                    case FACT: {
                        this.chunkData = new FactChunkType(io, this, _root);
                        ((FactChunkType) (this.chunkData))._read();
                        break;
                    }
                    case FMT: {
                        this.chunkData = new FormatChunkType(io, this, _root);
                        ((FormatChunkType) (this.chunkData))._read();
                        break;
                    }
                    case IXML: {
                        this.chunkData = new IxmlChunkType(io, this, _root);
                        ((IxmlChunkType) (this.chunkData))._read();
                        break;
                    }
                    case LIST: {
                        this.chunkData = new ListChunkType(io, this, _root);
                        ((ListChunkType) (this.chunkData))._read();
                        break;
                    }
                    case PMX: {
                        this.chunkData = new PmxChunkType(io, this, _root);
                        ((PmxChunkType) (this.chunkData))._read();
                        break;
                    }
                    }
                }
            }
            io.seek(_pos);
            return this.chunkData;
        }
        public void setChunkData(KaitaiStruct.ReadWrite _v) { _dirty = true; chunkData = _v; }
        public void setChunkData_Enabled(boolean _v) { _dirty = true; _enabledChunkData = _v; }

        private void _writeChunkData() {
            _shouldWriteChunkData = false;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            {
                Fourcc on = chunkId();
                if (on != null) {
                    switch (chunkId()) {
                    case AFSP: {
                        ((AfspChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    case AXML: {
                        ((AxmlChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    case BEXT: {
                        ((BextChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    case CUE: {
                        ((CueChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    case DATA: {
                        ((DataChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    case FACT: {
                        ((FactChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    case FMT: {
                        ((FormatChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    case IXML: {
                        ((IxmlChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    case LIST: {
                        ((ListChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    case PMX: {
                        ((PmxChunkType) (this.chunkData))._write_Seq(io);
                        break;
                    }
                    }
                }
            }
            io.seek(_pos);
        }
        private Fourcc chunkId;
        public Fourcc chunkId() {
            if (this.chunkId != null)
                return this.chunkId;
            this.chunkId = Wav.Fourcc.byId(chunk().id());
            return this.chunkId;
        }
        public void _invalidateChunkId() { this.chunkId = null; }
        private Riff.Chunk chunk;
        private Wav _root;
        private Wav _parent;
        public Riff.Chunk chunk() { return chunk; }
        public void setChunk(Riff.Chunk _v) { _dirty = true; chunk = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav _parent() { return _parent; }
        public void set_parent(Wav _v) { _dirty = true; _parent = _v; }
    }
    public static class CueChunkType extends KaitaiStruct.ReadWrite {
        public static CueChunkType fromFile(String fileName) throws IOException {
            return new CueChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public CueChunkType() {
            this(null, null, null);
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
        }
        public void _read() {
            this.dwCuePoints = this._io.readU4le();
            this.cuePoints = new ArrayList<CuePointType>();
            for (int i = 0; i < dwCuePoints(); i++) {
                CuePointType _t_cuePoints = new CuePointType(this._io, this, _root);
                try {
                    _t_cuePoints._read();
                } finally {
                    this.cuePoints.add(_t_cuePoints);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.cuePoints.size(); i++) {
                this.cuePoints.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.dwCuePoints);
            for (int i = 0; i < this.cuePoints.size(); i++) {
                this.cuePoints.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.cuePoints.size() != dwCuePoints())
                throw new ConsistencyError("cue_points", dwCuePoints(), this.cuePoints.size());
            for (int i = 0; i < this.cuePoints.size(); i++) {
                if (!Objects.equals(this.cuePoints.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("cue_points", _root(), this.cuePoints.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.cuePoints.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("cue_points", this, this.cuePoints.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long dwCuePoints;
        private List<CuePointType> cuePoints;
        private Wav _root;
        private Wav.ChunkType _parent;
        public long dwCuePoints() { return dwCuePoints; }
        public void setDwCuePoints(long _v) { _dirty = true; dwCuePoints = _v; }
        public List<CuePointType> cuePoints() { return cuePoints; }
        public void setCuePoints(List<CuePointType> _v) { _dirty = true; cuePoints = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class CuePointType extends KaitaiStruct.ReadWrite {
        public static CuePointType fromFile(String fileName) throws IOException {
            return new CuePointType(new ByteBufferKaitaiStream(fileName));
        }
        public CuePointType() {
            this(null, null, null);
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
        }
        public void _read() {
            this.dwName = this._io.readU4le();
            this.dwPosition = this._io.readU4le();
            this.fccChunk = this._io.readU4le();
            this.dwChunkStart = this._io.readU4le();
            this.dwBlockStart = this._io.readU4le();
            this.dwSampleOffset = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.dwName);
            this._io.writeU4le(this.dwPosition);
            this._io.writeU4le(this.fccChunk);
            this._io.writeU4le(this.dwChunkStart);
            this._io.writeU4le(this.dwBlockStart);
            this._io.writeU4le(this.dwSampleOffset);
        }

        public void _check() {
            _dirty = false;
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
        public void setDwName(long _v) { _dirty = true; dwName = _v; }
        public long dwPosition() { return dwPosition; }
        public void setDwPosition(long _v) { _dirty = true; dwPosition = _v; }
        public long fccChunk() { return fccChunk; }
        public void setFccChunk(long _v) { _dirty = true; fccChunk = _v; }
        public long dwChunkStart() { return dwChunkStart; }
        public void setDwChunkStart(long _v) { _dirty = true; dwChunkStart = _v; }
        public long dwBlockStart() { return dwBlockStart; }
        public void setDwBlockStart(long _v) { _dirty = true; dwBlockStart = _v; }
        public long dwSampleOffset() { return dwSampleOffset; }
        public void setDwSampleOffset(long _v) { _dirty = true; dwSampleOffset = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.CueChunkType _parent() { return _parent; }
        public void set_parent(Wav.CueChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class DataChunkType extends KaitaiStruct.ReadWrite {
        public static DataChunkType fromFile(String fileName) throws IOException {
            return new DataChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public DataChunkType() {
            this(null, null, null);
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
        }
        public void _read() {
            this.data = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.data);
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private byte[] data;
        private Wav _root;
        private Wav.ChunkType _parent;
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }

    /**
     * required for all non-PCM formats
     * (`w_format_tag != w_format_tag_type::pcm` or `not is_basic_pcm` in
     * `format_chunk_type` context)
     */
    public static class FactChunkType extends KaitaiStruct.ReadWrite {
        public static FactChunkType fromFile(String fileName) throws IOException {
            return new FactChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public FactChunkType() {
            this(null, null, null);
        }

        public FactChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FactChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public FactChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numSamplesPerChannel = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numSamplesPerChannel);
        }

        public void _check() {
            _dirty = false;
        }
        private long numSamplesPerChannel;
        private Wav _root;
        private Wav.ChunkType _parent;
        public long numSamplesPerChannel() { return numSamplesPerChannel; }
        public void setNumSamplesPerChannel(long _v) { _dirty = true; numSamplesPerChannel = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class FormatChunkType extends KaitaiStruct.ReadWrite {
        public static FormatChunkType fromFile(String fileName) throws IOException {
            return new FormatChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public FormatChunkType() {
            this(null, null, null);
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
        }
        public void _read() {
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
                this.channelMaskAndSubformat._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (!(isBasicPcm())) {
            }
            if (isCbSizeMeaningful()) {
            }
            if (isExtensible()) {
                this.channelMaskAndSubformat._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.wFormatTag.id())).intValue());
            this._io.writeU2le(this.nChannels);
            this._io.writeU4le(this.nSamplesPerSec);
            this._io.writeU4le(this.nAvgBytesPerSec);
            this._io.writeU2le(this.nBlockAlign);
            this._io.writeU2le(this.wBitsPerSample);
            if (!(isBasicPcm())) {
                this._io.writeU2le(this.cbSize);
            }
            if (isCbSizeMeaningful()) {
                this._io.writeU2le(this.wValidBitsPerSample);
            }
            if (isExtensible()) {
                this.channelMaskAndSubformat._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!(isBasicPcm())) {
            }
            if (isCbSizeMeaningful()) {
            }
            if (isExtensible()) {
                if (!Objects.equals(this.channelMaskAndSubformat._root(), _root()))
                    throw new ConsistencyError("channel_mask_and_subformat", _root(), this.channelMaskAndSubformat._root());
                if (!Objects.equals(this.channelMaskAndSubformat._parent(), this))
                    throw new ConsistencyError("channel_mask_and_subformat", this, this.channelMaskAndSubformat._parent());
            }
            _dirty = false;
        }
        private Boolean isBasicFloat;
        public Boolean isBasicFloat() {
            if (this.isBasicFloat != null)
                return this.isBasicFloat;
            this.isBasicFloat = wFormatTag() == Wav.WFormatTagType.IEEE_FLOAT;
            return this.isBasicFloat;
        }
        public void _invalidateIsBasicFloat() { this.isBasicFloat = null; }
        private Boolean isBasicPcm;
        public Boolean isBasicPcm() {
            if (this.isBasicPcm != null)
                return this.isBasicPcm;
            this.isBasicPcm = wFormatTag() == Wav.WFormatTagType.PCM;
            return this.isBasicPcm;
        }
        public void _invalidateIsBasicPcm() { this.isBasicPcm = null; }
        private Boolean isCbSizeMeaningful;
        public Boolean isCbSizeMeaningful() {
            if (this.isCbSizeMeaningful != null)
                return this.isCbSizeMeaningful;
            this.isCbSizeMeaningful =  ((!(isBasicPcm())) && (cbSize() != 0)) ;
            return this.isCbSizeMeaningful;
        }
        public void _invalidateIsCbSizeMeaningful() { this.isCbSizeMeaningful = null; }
        private Boolean isExtensible;
        public Boolean isExtensible() {
            if (this.isExtensible != null)
                return this.isExtensible;
            this.isExtensible = wFormatTag() == Wav.WFormatTagType.EXTENSIBLE;
            return this.isExtensible;
        }
        public void _invalidateIsExtensible() { this.isExtensible = null; }
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
        public void setWFormatTag(WFormatTagType _v) { _dirty = true; wFormatTag = _v; }
        public int nChannels() { return nChannels; }
        public void setNChannels(int _v) { _dirty = true; nChannels = _v; }
        public long nSamplesPerSec() { return nSamplesPerSec; }
        public void setNSamplesPerSec(long _v) { _dirty = true; nSamplesPerSec = _v; }
        public long nAvgBytesPerSec() { return nAvgBytesPerSec; }
        public void setNAvgBytesPerSec(long _v) { _dirty = true; nAvgBytesPerSec = _v; }
        public int nBlockAlign() { return nBlockAlign; }
        public void setNBlockAlign(int _v) { _dirty = true; nBlockAlign = _v; }
        public int wBitsPerSample() { return wBitsPerSample; }
        public void setWBitsPerSample(int _v) { _dirty = true; wBitsPerSample = _v; }
        public Integer cbSize() { return cbSize; }
        public void setCbSize(Integer _v) { _dirty = true; cbSize = _v; }
        public Integer wValidBitsPerSample() { return wValidBitsPerSample; }
        public void setWValidBitsPerSample(Integer _v) { _dirty = true; wValidBitsPerSample = _v; }
        public ChannelMaskAndSubformatType channelMaskAndSubformat() { return channelMaskAndSubformat; }
        public void setChannelMaskAndSubformat(ChannelMaskAndSubformatType _v) { _dirty = true; channelMaskAndSubformat = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class GuidType extends KaitaiStruct.ReadWrite {
        public static GuidType fromFile(String fileName) throws IOException {
            return new GuidType(new ByteBufferKaitaiStream(fileName));
        }
        public GuidType() {
            this(null, null, null);
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
        }
        public void _read() {
            this.data1 = this._io.readU4le();
            this.data2 = this._io.readU2le();
            this.data3 = this._io.readU2le();
            this.data4 = this._io.readU4be();
            this.data4a = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.data1);
            this._io.writeU2le(this.data2);
            this._io.writeU2le(this.data3);
            this._io.writeU4be(this.data4);
            this._io.writeU4be(this.data4a);
        }

        public void _check() {
            _dirty = false;
        }
        private long data1;
        private int data2;
        private int data3;
        private long data4;
        private long data4a;
        private Wav _root;
        private Wav.ChannelMaskAndSubformatType _parent;
        public long data1() { return data1; }
        public void setData1(long _v) { _dirty = true; data1 = _v; }
        public int data2() { return data2; }
        public void setData2(int _v) { _dirty = true; data2 = _v; }
        public int data3() { return data3; }
        public void setData3(int _v) { _dirty = true; data3 = _v; }
        public long data4() { return data4; }
        public void setData4(long _v) { _dirty = true; data4 = _v; }
        public long data4a() { return data4a; }
        public void setData4a(long _v) { _dirty = true; data4a = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChannelMaskAndSubformatType _parent() { return _parent; }
        public void set_parent(Wav.ChannelMaskAndSubformatType _v) { _dirty = true; _parent = _v; }
    }
    public static class InfoChunkType extends KaitaiStruct.ReadWrite {
        public static InfoChunkType fromFile(String fileName) throws IOException {
            return new InfoChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public InfoChunkType() {
            this(null, null, null);
        }

        public InfoChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InfoChunkType(KaitaiStream _io, Wav.ListChunkType _parent) {
            this(_io, _parent, null);
        }

        public InfoChunkType(KaitaiStream _io, Wav.ListChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.chunk = new Riff.Chunk(this._io);
            this.chunk._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.chunk._fetchInstances();
            chunkData();
            if (this.chunkData != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteChunkData = _enabledChunkData;
            this.chunk._write_Seq(this._io);
        }

        public void _check() {
            if (_enabledChunkData) {
                if (KaitaiStream.byteArrayIndexOf((this.chunkData).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("chunk_data", -1, KaitaiStream.byteArrayIndexOf((this.chunkData).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            }
            _dirty = false;
        }
        private String chunkData;
        private boolean _shouldWriteChunkData = false;
        private boolean _enabledChunkData = true;
        public String chunkData() {
            if (_shouldWriteChunkData)
                _writeChunkData();
            if (this.chunkData != null)
                return this.chunkData;
            if (!_enabledChunkData)
                return null;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.chunkData = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            io.seek(_pos);
            return this.chunkData;
        }
        public void setChunkData(String _v) { _dirty = true; chunkData = _v; }
        public void setChunkData_Enabled(boolean _v) { _dirty = true; _enabledChunkData = _v; }

        private void _writeChunkData() {
            _shouldWriteChunkData = false;
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            io.writeBytes((this.chunkData).getBytes(Charset.forName("ASCII")));
            io.writeU1(0);
            io.seek(_pos);
        }
        private Riff.Chunk chunk;
        private Wav _root;
        private Wav.ListChunkType _parent;
        public Riff.Chunk chunk() { return chunk; }
        public void setChunk(Riff.Chunk _v) { _dirty = true; chunk = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ListChunkType _parent() { return _parent; }
        public void set_parent(Wav.ListChunkType _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://en.wikipedia.org/wiki/IXML">Source</a>
     */
    public static class IxmlChunkType extends KaitaiStruct.ReadWrite {
        public static IxmlChunkType fromFile(String fileName) throws IOException {
            return new IxmlChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public IxmlChunkType() {
            this(null, null, null);
        }

        public IxmlChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IxmlChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public IxmlChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.data = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.data).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String data;
        private Wav _root;
        private Wav.ChunkType _parent;
        public String data() { return data; }
        public void setData(String _v) { _dirty = true; data = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class ListChunkType extends KaitaiStruct.ReadWrite {
        public static ListChunkType fromFile(String fileName) throws IOException {
            return new ListChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public ListChunkType() {
            this(null, null, null);
        }

        public ListChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ListChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public ListChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.parentChunkData = new Riff.ParentChunkData(this._io);
            this.parentChunkData._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.parentChunkData._fetchInstances();
            subchunks();
            if (this.subchunks != null) {
                for (int i = 0; i < this.subchunks.size(); i++) {
                    {
                        Fourcc on = formType();
                        if (on != null) {
                            switch (formType()) {
                            case INFO: {
                                this.subchunks.get(((Number) (i)).intValue())._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteSubchunks = _enabledSubchunks;
            this.parentChunkData._write_Seq(this._io);
        }

        public void _check() {
            if (_enabledSubchunks) {
                for (int i = 0; i < this.subchunks.size(); i++) {
                    {
                        Fourcc on = formType();
                        if (on != null) {
                            switch (formType()) {
                            case INFO: {
                                if (!Objects.equals(this.subchunks.get(((Number) (i)).intValue())._root(), _root()))
                                    throw new ConsistencyError("subchunks", _root(), this.subchunks.get(((Number) (i)).intValue())._root());
                                if (!Objects.equals(this.subchunks.get(((Number) (i)).intValue())._parent(), this))
                                    throw new ConsistencyError("subchunks", this, this.subchunks.get(((Number) (i)).intValue())._parent());
                                break;
                            }
                            }
                        }
                    }
                }
            }
            _dirty = false;
        }
        private Fourcc formType;
        public Fourcc formType() {
            if (this.formType != null)
                return this.formType;
            this.formType = Wav.Fourcc.byId(parentChunkData().formType());
            return this.formType;
        }
        public void _invalidateFormType() { this.formType = null; }
        private List<InfoChunkType> subchunks;
        private boolean _shouldWriteSubchunks = false;
        private boolean _enabledSubchunks = true;
        public List<InfoChunkType> subchunks() {
            if (_shouldWriteSubchunks)
                _writeSubchunks();
            if (this.subchunks != null)
                return this.subchunks;
            if (!_enabledSubchunks)
                return null;
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.subchunks = new ArrayList<InfoChunkType>();
            {
                int i = 0;
                while (!io.isEof()) {
                    {
                        Fourcc on = formType();
                        if (on != null) {
                            switch (formType()) {
                            case INFO: {
                                InfoChunkType _t_subchunks = new InfoChunkType(io, this, _root);
                                try {
                                    _t_subchunks._read();
                                } finally {
                                    this.subchunks.add(_t_subchunks);
                                }
                                break;
                            }
                            }
                        }
                    }
                    i++;
                }
            }
            io.seek(_pos);
            return this.subchunks;
        }
        public void setSubchunks(List<InfoChunkType> _v) { _dirty = true; subchunks = _v; }
        public void setSubchunks_Enabled(boolean _v) { _dirty = true; _enabledSubchunks = _v; }

        private void _writeSubchunks() {
            _shouldWriteSubchunks = false;
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            for (int i = 0; i < this.subchunks.size(); i++) {
                if (io.isEof())
                    throw new ConsistencyError("subchunks", 0, io.size() - io.pos());
                {
                    Fourcc on = formType();
                    if (on != null) {
                        switch (formType()) {
                        case INFO: {
                            this.subchunks.get(((Number) (i)).intValue())._write_Seq(io);
                            break;
                        }
                        }
                    }
                }
            }
            if (!(io.isEof()))
                throw new ConsistencyError("subchunks", 0, io.size() - io.pos());
            io.seek(_pos);
        }
        private Riff.ParentChunkData parentChunkData;
        private Wav _root;
        private Wav.ChunkType _parent;
        public Riff.ParentChunkData parentChunkData() { return parentChunkData; }
        public void setParentChunkData(Riff.ParentChunkData _v) { _dirty = true; parentChunkData = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class PmxChunkType extends KaitaiStruct.ReadWrite {
        public static PmxChunkType fromFile(String fileName) throws IOException {
            return new PmxChunkType(new ByteBufferKaitaiStream(fileName));
        }
        public PmxChunkType() {
            this(null, null, null);
        }

        public PmxChunkType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PmxChunkType(KaitaiStream _io, Wav.ChunkType _parent) {
            this(_io, _parent, null);
        }

        public PmxChunkType(KaitaiStream _io, Wav.ChunkType _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.data = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.data).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String data;
        private Wav _root;
        private Wav.ChunkType _parent;

        /**
         * XMP data
         * @see <a href="https://github.com/adobe/XMP-Toolkit-SDK/blob/v2022.06/docs/XMPSpecificationPart3.pdf">Source</a>
         */
        public String data() { return data; }
        public void setData(String _v) { _dirty = true; data = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public Wav.ChunkType _parent() { return _parent; }
        public void set_parent(Wav.ChunkType _v) { _dirty = true; _parent = _v; }
    }
    public static class SampleType extends KaitaiStruct.ReadWrite {
        public static SampleType fromFile(String fileName) throws IOException {
            return new SampleType(new ByteBufferKaitaiStream(fileName));
        }
        public SampleType() {
            this(null, null, null);
        }

        public SampleType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SampleType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public SampleType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.sample = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.sample);
        }

        public void _check() {
            _dirty = false;
        }
        private int sample;
        private Wav _root;
        private KaitaiStruct.ReadWrite _parent;
        public int sample() { return sample; }
        public void setSample(int _v) { _dirty = true; sample = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class SamplesType extends KaitaiStruct.ReadWrite {
        public static SamplesType fromFile(String fileName) throws IOException {
            return new SamplesType(new ByteBufferKaitaiStream(fileName));
        }
        public SamplesType() {
            this(null, null, null);
        }

        public SamplesType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SamplesType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public SamplesType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Wav _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.samples = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.samples);
        }

        public void _check() {
            _dirty = false;
        }
        private long samples;
        private Wav _root;
        private KaitaiStruct.ReadWrite _parent;
        public long samples() { return samples; }
        public void setSamples(long _v) { _dirty = true; samples = _v; }
        public Wav _root() { return _root; }
        public void set_root(Wav _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private Fourcc chunkId;
    public Fourcc chunkId() {
        if (this.chunkId != null)
            return this.chunkId;
        this.chunkId = Fourcc.byId(chunk().id());
        return this.chunkId;
    }
    public void _invalidateChunkId() { this.chunkId = null; }
    private Fourcc formType;
    public Fourcc formType() {
        if (this.formType != null)
            return this.formType;
        this.formType = Fourcc.byId(parentChunkData().formType());
        return this.formType;
    }
    public void _invalidateFormType() { this.formType = null; }
    private Boolean isFormTypeWave;
    public Boolean isFormTypeWave() {
        if (this.isFormTypeWave != null)
            return this.isFormTypeWave;
        this.isFormTypeWave =  ((isRiffChunk()) && (formType() == Fourcc.WAVE)) ;
        return this.isFormTypeWave;
    }
    public void _invalidateIsFormTypeWave() { this.isFormTypeWave = null; }
    private Boolean isRiffChunk;
    public Boolean isRiffChunk() {
        if (this.isRiffChunk != null)
            return this.isRiffChunk;
        this.isRiffChunk = chunkId() == Fourcc.RIFF;
        return this.isRiffChunk;
    }
    public void _invalidateIsRiffChunk() { this.isRiffChunk = null; }
    private Riff.ParentChunkData parentChunkData;
    private boolean _shouldWriteParentChunkData = false;
    private boolean _enabledParentChunkData = true;
    public Riff.ParentChunkData parentChunkData() {
        if (_shouldWriteParentChunkData)
            _writeParentChunkData();
        if (this.parentChunkData != null)
            return this.parentChunkData;
        if (!_enabledParentChunkData)
            return null;
        if (isRiffChunk()) {
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.parentChunkData = new Riff.ParentChunkData(io);
            this.parentChunkData._read();
            io.seek(_pos);
        }
        return this.parentChunkData;
    }
    public void setParentChunkData(Riff.ParentChunkData _v) { _dirty = true; parentChunkData = _v; }
    public void setParentChunkData_Enabled(boolean _v) { _dirty = true; _enabledParentChunkData = _v; }

    private void _writeParentChunkData() {
        _shouldWriteParentChunkData = false;
        if (isRiffChunk()) {
            KaitaiStream io = chunk().dataSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.parentChunkData._write_Seq(io);
            io.seek(_pos);
        }
    }
    private List<ChunkType> subchunks;
    private boolean _shouldWriteSubchunks = false;
    private boolean _enabledSubchunks = true;
    public List<ChunkType> subchunks() {
        if (_shouldWriteSubchunks)
            _writeSubchunks();
        if (this.subchunks != null)
            return this.subchunks;
        if (!_enabledSubchunks)
            return null;
        if (isFormTypeWave()) {
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            this.subchunks = new ArrayList<ChunkType>();
            {
                int i = 0;
                while (!io.isEof()) {
                    ChunkType _t_subchunks = new ChunkType(io, this, _root);
                    try {
                        _t_subchunks._read();
                    } finally {
                        this.subchunks.add(_t_subchunks);
                    }
                    i++;
                }
            }
            io.seek(_pos);
        }
        return this.subchunks;
    }
    public void setSubchunks(List<ChunkType> _v) { _dirty = true; subchunks = _v; }
    public void setSubchunks_Enabled(boolean _v) { _dirty = true; _enabledSubchunks = _v; }

    private void _writeSubchunks() {
        _shouldWriteSubchunks = false;
        if (isFormTypeWave()) {
            KaitaiStream io = parentChunkData().subchunksSlot()._io();
            long _pos = io.pos();
            io.seek(0);
            for (int i = 0; i < this.subchunks.size(); i++) {
                if (io.isEof())
                    throw new ConsistencyError("subchunks", 0, io.size() - io.pos());
                if (!Objects.equals(this.subchunks.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("subchunks", _root(), this.subchunks.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.subchunks.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("subchunks", this, this.subchunks.get(((Number) (i)).intValue())._parent());
                this.subchunks.get(((Number) (i)).intValue())._write_Seq(io);
            }
            if (!(io.isEof()))
                throw new ConsistencyError("subchunks", 0, io.size() - io.pos());
            io.seek(_pos);
        }
    }
    private Riff.Chunk chunk;
    private Wav _root;
    private KaitaiStruct.ReadWrite _parent;
    public Riff.Chunk chunk() { return chunk; }
    public void setChunk(Riff.Chunk _v) { _dirty = true; chunk = _v; }
    public Wav _root() { return _root; }
    public void set_root(Wav _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
