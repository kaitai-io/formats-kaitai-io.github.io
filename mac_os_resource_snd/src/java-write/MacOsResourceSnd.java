// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Arrays;


/**
 * Sound resources were introduced in Classic MacOS with the Sound Manager program.
 * They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
 * They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
 * @see <a href="https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf">Source</a>
 */
public class MacOsResourceSnd extends KaitaiStruct.ReadWrite {
    public static MacOsResourceSnd fromFile(String fileName) throws IOException {
        return new MacOsResourceSnd(new ByteBufferKaitaiStream(fileName));
    }

    public enum CmdType {
        NULL_CMD(0),
        QUIET_CMD(3),
        FLUSH_CMD(4),
        RE_INIT_CMD(5),
        WAIT_CMD(10),
        PAUSE_CMD(11),
        RESUME_CMD(12),
        CALL_BACK_CMD(13),
        SYNC_CMD(14),
        EMPTY_CMD(15),
        AVAILABLE_CMD(24),
        VERSION_CMD(25),
        TOTAL_LOAD_CMD(26),
        LOAD_CMD(27),
        FREQ_DURATION_CMD(40),
        REST_CMD(41),
        FREQ_CMD(42),
        AMP_CMD(43),
        TIMBRE_CMD(44),
        GET_AMP_CMD(45),
        VOLUME_CMD(46),
        GET_VOLUME_CMD(47),
        WAVE_TABLE_CMD(60),
        PHASE_CMD(61),
        SOUND_CMD(80),
        BUFFER_CMD(81),
        RATE_CMD(82),
        GET_RATE_CMD(85);

        private final long id;
        CmdType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CmdType> byId = new HashMap<Long, CmdType>(28);
        static {
            for (CmdType e : CmdType.values())
                byId.put(e.id(), e);
        }
        public static CmdType byId(long id) { return byId.get(id); }
    }

    public enum CompressionTypeEnum {
        VARIABLE_COMPRESSION(-2),
        FIXED_COMPRESSION(-1),
        NOT_COMPRESSED(0),
        TWO_TO_ONE(1),
        EIGHT_TO_THREE(2),
        THREE_TO_ONE(3),
        SIX_TO_ONE(4);

        private final long id;
        CompressionTypeEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionTypeEnum> byId = new HashMap<Long, CompressionTypeEnum>(7);
        static {
            for (CompressionTypeEnum e : CompressionTypeEnum.values())
                byId.put(e.id(), e);
        }
        public static CompressionTypeEnum byId(long id) { return byId.get(id); }
    }

    public enum DataType {
        SQUARE_WAVE_SYNTH(1),
        WAVE_TABLE_SYNTH(3),
        SAMPLED_SYNTH(5);

        private final long id;
        DataType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, DataType> byId = new HashMap<Long, DataType>(3);
        static {
            for (DataType e : DataType.values())
                byId.put(e.id(), e);
        }
        public static DataType byId(long id) { return byId.get(id); }
    }

    public enum InitOption {
        CHAN_LEFT(2),
        CHAN_RIGHT(3),
        NO_INTERP(4),
        NO_DROP(8),
        MONO(128),
        STEREO(192),
        MACE3(768),
        MACE6(1024);

        private final long id;
        InitOption(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, InitOption> byId = new HashMap<Long, InitOption>(8);
        static {
            for (InitOption e : InitOption.values())
                byId.put(e.id(), e);
        }
        public static InitOption byId(long id) { return byId.get(id); }
    }

    public enum SoundHeaderType {
        STANDARD(0),
        COMPRESSED(254),
        EXTENDED(255);

        private final long id;
        SoundHeaderType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SoundHeaderType> byId = new HashMap<Long, SoundHeaderType>(3);
        static {
            for (SoundHeaderType e : SoundHeaderType.values())
                byId.put(e.id(), e);
        }
        public static SoundHeaderType byId(long id) { return byId.get(id); }
    }

    public enum WaveInitOption {
        CHANNEL0(4),
        CHANNEL1(5),
        CHANNEL2(6),
        CHANNEL3(7);

        private final long id;
        WaveInitOption(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, WaveInitOption> byId = new HashMap<Long, WaveInitOption>(4);
        static {
            for (WaveInitOption e : WaveInitOption.values())
                byId.put(e.id(), e);
        }
        public static WaveInitOption byId(long id) { return byId.get(id); }
    }
    public MacOsResourceSnd() {
        this(null, null, null);
    }

    public MacOsResourceSnd(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MacOsResourceSnd(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MacOsResourceSnd(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MacOsResourceSnd _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.format = this._io.readU2be();
        if (format() == 1) {
            this.numDataFormats = this._io.readU2be();
        }
        if (format() == 1) {
            this.dataFormats = new ArrayList<DataFormat>();
            for (int i = 0; i < numDataFormats(); i++) {
                DataFormat _t_dataFormats = new DataFormat(this._io, this, _root);
                try {
                    _t_dataFormats._read();
                } finally {
                    this.dataFormats.add(_t_dataFormats);
                }
            }
        }
        if (format() == 2) {
            this.referenceCount = this._io.readU2be();
        }
        this.numSoundCommands = this._io.readU2be();
        this.soundCommands = new ArrayList<SoundCommand>();
        for (int i = 0; i < numSoundCommands(); i++) {
            SoundCommand _t_soundCommands = new SoundCommand(this._io, this, _root);
            try {
                _t_soundCommands._read();
            } finally {
                this.soundCommands.add(_t_soundCommands);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        if (format() == 1) {
        }
        if (format() == 1) {
            for (int i = 0; i < this.dataFormats.size(); i++) {
                this.dataFormats.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        if (format() == 2) {
        }
        for (int i = 0; i < this.soundCommands.size(); i++) {
            this.soundCommands.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU2be(this.format);
        if (format() == 1) {
            this._io.writeU2be(this.numDataFormats);
        }
        if (format() == 1) {
            for (int i = 0; i < this.dataFormats.size(); i++) {
                this.dataFormats.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }
        if (format() == 2) {
            this._io.writeU2be(this.referenceCount);
        }
        this._io.writeU2be(this.numSoundCommands);
        for (int i = 0; i < this.soundCommands.size(); i++) {
            this.soundCommands.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (format() == 1) {
        }
        if (format() == 1) {
            if (this.dataFormats.size() != numDataFormats())
                throw new ConsistencyError("data_formats", numDataFormats(), this.dataFormats.size());
            for (int i = 0; i < this.dataFormats.size(); i++) {
                if (!Objects.equals(this.dataFormats.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("data_formats", _root(), this.dataFormats.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.dataFormats.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("data_formats", this, this.dataFormats.get(((Number) (i)).intValue())._parent());
            }
        }
        if (format() == 2) {
        }
        if (this.soundCommands.size() != numSoundCommands())
            throw new ConsistencyError("sound_commands", numSoundCommands(), this.soundCommands.size());
        for (int i = 0; i < this.soundCommands.size(); i++) {
            if (!Objects.equals(this.soundCommands.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("sound_commands", _root(), this.soundCommands.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.soundCommands.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("sound_commands", this, this.soundCommands.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Compressed extends KaitaiStruct.ReadWrite {
        public static Compressed fromFile(String fileName) throws IOException {
            return new Compressed(new ByteBufferKaitaiStream(fileName));
        }
        public Compressed() {
            this(null, null, null);
        }

        public Compressed(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Compressed(KaitaiStream _io, MacOsResourceSnd.ExtendedOrCompressed _parent) {
            this(_io, _parent, null);
        }

        public Compressed(KaitaiStream _io, MacOsResourceSnd.ExtendedOrCompressed _parent, MacOsResourceSnd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.format = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.reserved = this._io.readBytes(4);
            this.stateVarsPtr = this._io.readU4be();
            this.leftOverSamplesPtr = this._io.readU4be();
            this.compressionId = this._io.readS2be();
            this.packetSize = this._io.readU2be();
            this.synthesizerId = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.format).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes(this.reserved);
            this._io.writeU4be(this.stateVarsPtr);
            this._io.writeU4be(this.leftOverSamplesPtr);
            this._io.writeS2be(this.compressionId);
            this._io.writeU2be(this.packetSize);
            this._io.writeU2be(this.synthesizerId);
        }

        public void _check() {
            if ((this.format).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("format", 4, (this.format).getBytes(Charset.forName("ASCII")).length);
            if (this.reserved.length != 4)
                throw new ConsistencyError("reserved", 4, this.reserved.length);
            _dirty = false;
        }
        private CompressionTypeEnum compressionType;
        public CompressionTypeEnum compressionType() {
            if (this.compressionType != null)
                return this.compressionType;
            this.compressionType = MacOsResourceSnd.CompressionTypeEnum.byId(compressionId());
            return this.compressionType;
        }
        public void _invalidateCompressionType() { this.compressionType = null; }
        private String format;
        private byte[] reserved;
        private long stateVarsPtr;
        private long leftOverSamplesPtr;
        private short compressionId;
        private int packetSize;
        private int synthesizerId;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd.ExtendedOrCompressed _parent;

        /**
         * data format type
         */
        public String format() { return format; }
        public void setFormat(String _v) { _dirty = true; format = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }

        /**
         * pointer to StateBlock
         */
        public long stateVarsPtr() { return stateVarsPtr; }
        public void setStateVarsPtr(long _v) { _dirty = true; stateVarsPtr = _v; }

        /**
         * pointer to LeftOverBlock
         */
        public long leftOverSamplesPtr() { return leftOverSamplesPtr; }
        public void setLeftOverSamplesPtr(long _v) { _dirty = true; leftOverSamplesPtr = _v; }

        /**
         * ID of compression algorithm
         */
        public short compressionId() { return compressionId; }
        public void setCompressionId(short _v) { _dirty = true; compressionId = _v; }

        /**
         * number of bits per packet
         */
        public int packetSize() { return packetSize; }
        public void setPacketSize(int _v) { _dirty = true; packetSize = _v; }

        /**
         * Latest Sound Manager documentation specifies this field as:
         * This field is unused. You should set it to 0.
         * Inside Macintosh (Volume VI, 1991) specifies it as:
         * Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
         * @see <a href="https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf">Page 22-49, absolute page number 1169 in the PDF</a>
         */
        public int synthesizerId() { return synthesizerId; }
        public void setSynthesizerId(int _v) { _dirty = true; synthesizerId = _v; }
        public MacOsResourceSnd _root() { return _root; }
        public void set_root(MacOsResourceSnd _v) { _dirty = true; _root = _v; }
        public MacOsResourceSnd.ExtendedOrCompressed _parent() { return _parent; }
        public void set_parent(MacOsResourceSnd.ExtendedOrCompressed _v) { _dirty = true; _parent = _v; }
    }
    public static class DataFormat extends KaitaiStruct.ReadWrite {
        public static DataFormat fromFile(String fileName) throws IOException {
            return new DataFormat(new ByteBufferKaitaiStream(fileName));
        }
        public DataFormat() {
            this(null, null, null);
        }

        public DataFormat(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataFormat(KaitaiStream _io, MacOsResourceSnd _parent) {
            this(_io, _parent, null);
        }

        public DataFormat(KaitaiStream _io, MacOsResourceSnd _parent, MacOsResourceSnd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.id = MacOsResourceSnd.DataType.byId(this._io.readU2be());
            this.options = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(((Number) (this.id.id())).intValue());
            this._io.writeU4be(this.options);
        }

        public void _check() {
            _dirty = false;
        }
        private InitOption compInit;
        public InitOption compInit() {
            if (this.compInit != null)
                return this.compInit;
            this.compInit = MacOsResourceSnd.InitOption.byId(options() & initCompMask());
            return this.compInit;
        }
        public void _invalidateCompInit() { this.compInit = null; }
        private Integer initCompMask;

        /**
         * mask for compression IDs
         */
        public Integer initCompMask() {
            if (this.initCompMask != null)
                return this.initCompMask;
            this.initCompMask = ((int) 65280);
            return this.initCompMask;
        }
        public void _invalidateInitCompMask() { this.initCompMask = null; }
        private Byte initPanMask;

        /**
         * mask for right/left pan values
         */
        public Byte initPanMask() {
            if (this.initPanMask != null)
                return this.initPanMask;
            this.initPanMask = ((byte) 3);
            return this.initPanMask;
        }
        public void _invalidateInitPanMask() { this.initPanMask = null; }
        private Integer initStereoMask;

        /**
         * mask for mono/stereo values
         */
        public Integer initStereoMask() {
            if (this.initStereoMask != null)
                return this.initStereoMask;
            this.initStereoMask = ((int) 192);
            return this.initStereoMask;
        }
        public void _invalidateInitStereoMask() { this.initStereoMask = null; }
        private InitOption panInit;
        public InitOption panInit() {
            if (this.panInit != null)
                return this.panInit;
            this.panInit = MacOsResourceSnd.InitOption.byId(options() & initPanMask());
            return this.panInit;
        }
        public void _invalidatePanInit() { this.panInit = null; }
        private InitOption stereoInit;
        public InitOption stereoInit() {
            if (this.stereoInit != null)
                return this.stereoInit;
            this.stereoInit = MacOsResourceSnd.InitOption.byId(options() & initStereoMask());
            return this.stereoInit;
        }
        public void _invalidateStereoInit() { this.stereoInit = null; }
        private WaveInitOption waveInit;
        public WaveInitOption waveInit() {
            if (this.waveInit != null)
                return this.waveInit;
            if (id() == MacOsResourceSnd.DataType.WAVE_TABLE_SYNTH) {
                this.waveInit = MacOsResourceSnd.WaveInitOption.byId(options() & waveInitChannelMask());
            }
            return this.waveInit;
        }
        public void _invalidateWaveInit() { this.waveInit = null; }
        private Byte waveInitChannelMask;

        /**
         * wave table only, Sound Manager 2.0 and earlier
         */
        public Byte waveInitChannelMask() {
            if (this.waveInitChannelMask != null)
                return this.waveInitChannelMask;
            this.waveInitChannelMask = ((byte) 7);
            return this.waveInitChannelMask;
        }
        public void _invalidateWaveInitChannelMask() { this.waveInitChannelMask = null; }
        private DataType id;
        private long options;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd _parent;
        public DataType id() { return id; }
        public void setId(DataType _v) { _dirty = true; id = _v; }

        /**
         * contains initialisation options for the SndNewChannel function
         */
        public long options() { return options; }
        public void setOptions(long _v) { _dirty = true; options = _v; }
        public MacOsResourceSnd _root() { return _root; }
        public void set_root(MacOsResourceSnd _v) { _dirty = true; _root = _v; }
        public MacOsResourceSnd _parent() { return _parent; }
        public void set_parent(MacOsResourceSnd _v) { _dirty = true; _parent = _v; }
    }
    public static class Extended extends KaitaiStruct.ReadWrite {
        public static Extended fromFile(String fileName) throws IOException {
            return new Extended(new ByteBufferKaitaiStream(fileName));
        }
        public Extended() {
            this(null, null, null);
        }

        public Extended(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Extended(KaitaiStream _io, MacOsResourceSnd.ExtendedOrCompressed _parent) {
            this(_io, _parent, null);
        }

        public Extended(KaitaiStream _io, MacOsResourceSnd.ExtendedOrCompressed _parent, MacOsResourceSnd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.instrumentChunkPtr = this._io.readU4be();
            this.aesRecordingPtr = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.instrumentChunkPtr);
            this._io.writeU4be(this.aesRecordingPtr);
        }

        public void _check() {
            _dirty = false;
        }
        private long instrumentChunkPtr;
        private long aesRecordingPtr;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd.ExtendedOrCompressed _parent;

        /**
         * pointer to instrument info
         */
        public long instrumentChunkPtr() { return instrumentChunkPtr; }
        public void setInstrumentChunkPtr(long _v) { _dirty = true; instrumentChunkPtr = _v; }

        /**
         * pointer to audio info
         */
        public long aesRecordingPtr() { return aesRecordingPtr; }
        public void setAesRecordingPtr(long _v) { _dirty = true; aesRecordingPtr = _v; }
        public MacOsResourceSnd _root() { return _root; }
        public void set_root(MacOsResourceSnd _v) { _dirty = true; _root = _v; }
        public MacOsResourceSnd.ExtendedOrCompressed _parent() { return _parent; }
        public void set_parent(MacOsResourceSnd.ExtendedOrCompressed _v) { _dirty = true; _parent = _v; }
    }
    public static class ExtendedOrCompressed extends KaitaiStruct.ReadWrite {
        public static ExtendedOrCompressed fromFile(String fileName) throws IOException {
            return new ExtendedOrCompressed(new ByteBufferKaitaiStream(fileName));
        }
        public ExtendedOrCompressed() {
            this(null, null, null);
        }

        public ExtendedOrCompressed(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExtendedOrCompressed(KaitaiStream _io, MacOsResourceSnd.SoundHeader _parent) {
            this(_io, _parent, null);
        }

        public ExtendedOrCompressed(KaitaiStream _io, MacOsResourceSnd.SoundHeader _parent, MacOsResourceSnd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numFrames = this._io.readU4be();
            this.aiffSampleRate = this._io.readBytes(10);
            this.markerChunk = this._io.readU4be();
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
                this.extended = new Extended(this._io, this, _root);
                this.extended._read();
            }
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED) {
                this.compressed = new Compressed(this._io, this, _root);
                this.compressed._read();
            }
            this.bitsPerSample = this._io.readU2be();
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
                this.reserved = this._io.readBytes(14);
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
                this.extended._fetchInstances();
            }
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED) {
                this.compressed._fetchInstances();
            }
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.numFrames);
            this._io.writeBytes(this.aiffSampleRate);
            this._io.writeU4be(this.markerChunk);
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
                this.extended._write_Seq(this._io);
            }
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED) {
                this.compressed._write_Seq(this._io);
            }
            this._io.writeU2be(this.bitsPerSample);
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
                this._io.writeBytes(this.reserved);
            }
        }

        public void _check() {
            if (this.aiffSampleRate.length != 10)
                throw new ConsistencyError("aiff_sample_rate", 10, this.aiffSampleRate.length);
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
                if (!Objects.equals(this.extended._root(), _root()))
                    throw new ConsistencyError("extended", _root(), this.extended._root());
                if (!Objects.equals(this.extended._parent(), this))
                    throw new ConsistencyError("extended", this, this.extended._parent());
            }
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED) {
                if (!Objects.equals(this.compressed._root(), _root()))
                    throw new ConsistencyError("compressed", _root(), this.compressed._root());
                if (!Objects.equals(this.compressed._parent(), this))
                    throw new ConsistencyError("compressed", this, this.compressed._parent());
            }
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
                if (this.reserved.length != 14)
                    throw new ConsistencyError("reserved", 14, this.reserved.length);
            }
            _dirty = false;
        }
        private long numFrames;
        private byte[] aiffSampleRate;
        private long markerChunk;
        private Extended extended;
        private Compressed compressed;
        private int bitsPerSample;
        private byte[] reserved;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd.SoundHeader _parent;
        public long numFrames() { return numFrames; }
        public void setNumFrames(long _v) { _dirty = true; numFrames = _v; }

        /**
         * rate of original sample (Extended80)
         */
        public byte[] aiffSampleRate() { return aiffSampleRate; }
        public void setAiffSampleRate(byte[] _v) { _dirty = true; aiffSampleRate = _v; }

        /**
         * reserved
         */
        public long markerChunk() { return markerChunk; }
        public void setMarkerChunk(long _v) { _dirty = true; markerChunk = _v; }
        public Extended extended() { return extended; }
        public void setExtended(Extended _v) { _dirty = true; extended = _v; }
        public Compressed compressed() { return compressed; }
        public void setCompressed(Compressed _v) { _dirty = true; compressed = _v; }

        /**
         * number of bits per sample
         */
        public int bitsPerSample() { return bitsPerSample; }
        public void setBitsPerSample(int _v) { _dirty = true; bitsPerSample = _v; }

        /**
         * reserved
         */
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public MacOsResourceSnd _root() { return _root; }
        public void set_root(MacOsResourceSnd _v) { _dirty = true; _root = _v; }
        public MacOsResourceSnd.SoundHeader _parent() { return _parent; }
        public void set_parent(MacOsResourceSnd.SoundHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class SoundCommand extends KaitaiStruct.ReadWrite {
        public static SoundCommand fromFile(String fileName) throws IOException {
            return new SoundCommand(new ByteBufferKaitaiStream(fileName));
        }
        public SoundCommand() {
            this(null, null, null);
        }

        public SoundCommand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SoundCommand(KaitaiStream _io, MacOsResourceSnd _parent) {
            this(_io, _parent, null);
        }

        public SoundCommand(KaitaiStream _io, MacOsResourceSnd _parent, MacOsResourceSnd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.isDataOffset = this._io.readBitsIntBe(1) != 0;
            this.cmd = MacOsResourceSnd.CmdType.byId(this._io.readBitsIntBe(15));
            this.param1 = this._io.readU2be();
            this.param2 = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
            soundHeader();
            if (this.soundHeader != null) {
                this.soundHeader._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteSoundHeader = _enabledSoundHeader;
            this._io.writeBitsIntBe(1, (this.isDataOffset ? 1 : 0));
            this._io.writeBitsIntBe(15, ((Number) (this.cmd.id())).longValue());
            this._io.writeU2be(this.param1);
            this._io.writeU4be(this.param2);
        }

        public void _check() {
            if (_enabledSoundHeader) {
                if ( ((isDataOffset()) && (cmd() == MacOsResourceSnd.CmdType.BUFFER_CMD)) ) {
                    if (!Objects.equals(this.soundHeader._root(), _root()))
                        throw new ConsistencyError("sound_header", _root(), this.soundHeader._root());
                    if (!Objects.equals(this.soundHeader._parent(), this))
                        throw new ConsistencyError("sound_header", this, this.soundHeader._parent());
                }
            }
            _dirty = false;
        }
        private SoundHeader soundHeader;
        private boolean _shouldWriteSoundHeader = false;
        private boolean _enabledSoundHeader = true;
        public SoundHeader soundHeader() {
            if (_shouldWriteSoundHeader)
                _writeSoundHeader();
            if (this.soundHeader != null)
                return this.soundHeader;
            if (!_enabledSoundHeader)
                return null;
            if ( ((isDataOffset()) && (cmd() == MacOsResourceSnd.CmdType.BUFFER_CMD)) ) {
                long _pos = this._io.pos();
                this._io.seek(param2());
                this.soundHeader = new SoundHeader(this._io, this, _root);
                this.soundHeader._read();
                this._io.seek(_pos);
            }
            return this.soundHeader;
        }
        public void setSoundHeader(SoundHeader _v) { _dirty = true; soundHeader = _v; }
        public void setSoundHeader_Enabled(boolean _v) { _dirty = true; _enabledSoundHeader = _v; }

        private void _writeSoundHeader() {
            _shouldWriteSoundHeader = false;
            if ( ((isDataOffset()) && (cmd() == MacOsResourceSnd.CmdType.BUFFER_CMD)) ) {
                long _pos = this._io.pos();
                this._io.seek(param2());
                this.soundHeader._write_Seq(this._io);
                this._io.seek(_pos);
            }
        }
        private boolean isDataOffset;
        private CmdType cmd;
        private int param1;
        private long param2;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd _parent;
        public boolean isDataOffset() { return isDataOffset; }
        public void setIsDataOffset(boolean _v) { _dirty = true; isDataOffset = _v; }
        public CmdType cmd() { return cmd; }
        public void setCmd(CmdType _v) { _dirty = true; cmd = _v; }
        public int param1() { return param1; }
        public void setParam1(int _v) { _dirty = true; param1 = _v; }
        public long param2() { return param2; }
        public void setParam2(long _v) { _dirty = true; param2 = _v; }
        public MacOsResourceSnd _root() { return _root; }
        public void set_root(MacOsResourceSnd _v) { _dirty = true; _root = _v; }
        public MacOsResourceSnd _parent() { return _parent; }
        public void set_parent(MacOsResourceSnd _v) { _dirty = true; _parent = _v; }
    }
    public static class SoundHeader extends KaitaiStruct.ReadWrite {
        public static SoundHeader fromFile(String fileName) throws IOException {
            return new SoundHeader(new ByteBufferKaitaiStream(fileName));
        }
        public SoundHeader() {
            this(null, null, null);
        }

        public SoundHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SoundHeader(KaitaiStream _io, MacOsResourceSnd.SoundCommand _parent) {
            this(_io, _parent, null);
        }

        public SoundHeader(KaitaiStream _io, MacOsResourceSnd.SoundCommand _parent, MacOsResourceSnd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            if (startOfs() < 0) {
                this._unnamed0 = this._io.readBytes(0);
            }
            this.samplePtr = this._io.readU4be();
            if (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.STANDARD) {
                this.numSamples = this._io.readU4be();
            }
            if ( ((soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) || (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED)) ) {
                this.numChannels = this._io.readU4be();
            }
            this.sampleRate = new UnsignedFixedPoint(this._io, this, _root);
            this.sampleRate._read();
            this.loopStart = this._io.readU4be();
            this.loopEnd = this._io.readU4be();
            this.encode = MacOsResourceSnd.SoundHeaderType.byId(this._io.readU1());
            this.midiNote = this._io.readU1();
            if ( ((soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) || (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED)) ) {
                this.extendedOrCompressed = new ExtendedOrCompressed(this._io, this, _root);
                this.extendedOrCompressed._read();
            }
            if (samplePtr() == 0) {
                this.sampleArea = this._io.readBytes((soundHeaderType() == MacOsResourceSnd.SoundHeaderType.STANDARD ? numSamples() : (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED ? ((extendedOrCompressed().numFrames() * numChannels()) * extendedOrCompressed().bitsPerSample()) / 8 : _io().size() - _io().pos())));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (startOfs() < 0) {
            }
            if (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.STANDARD) {
            }
            if ( ((soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) || (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED)) ) {
            }
            this.sampleRate._fetchInstances();
            if ( ((soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) || (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED)) ) {
                this.extendedOrCompressed._fetchInstances();
            }
            if (samplePtr() == 0) {
            }
            soundHeaderType();
            if (this.soundHeaderType != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteSoundHeaderType = _enabledSoundHeaderType;
            if (startOfs() < 0) {
                if (this._unnamed0.length != 0)
                    throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
                this._io.writeBytes(this._unnamed0);
            }
            this._io.writeU4be(this.samplePtr);
            if (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.STANDARD) {
                this._io.writeU4be(this.numSamples);
            }
            if ( ((soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) || (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED)) ) {
                this._io.writeU4be(this.numChannels);
            }
            this.sampleRate._write_Seq(this._io);
            this._io.writeU4be(this.loopStart);
            this._io.writeU4be(this.loopEnd);
            this._io.writeU1(((Number) (this.encode.id())).intValue());
            this._io.writeU1(this.midiNote);
            if ( ((soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) || (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED)) ) {
                if (!Objects.equals(this.extendedOrCompressed._root(), _root()))
                    throw new ConsistencyError("extended_or_compressed", _root(), this.extendedOrCompressed._root());
                if (!Objects.equals(this.extendedOrCompressed._parent(), this))
                    throw new ConsistencyError("extended_or_compressed", this, this.extendedOrCompressed._parent());
                this.extendedOrCompressed._write_Seq(this._io);
            }
            if (samplePtr() == 0) {
                if (this.sampleArea.length != (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.STANDARD ? numSamples() : (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED ? ((extendedOrCompressed().numFrames() * numChannels()) * extendedOrCompressed().bitsPerSample()) / 8 : _io().size() - _io().pos())))
                    throw new ConsistencyError("sample_area", (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.STANDARD ? numSamples() : (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED ? ((extendedOrCompressed().numFrames() * numChannels()) * extendedOrCompressed().bitsPerSample()) / 8 : _io().size() - _io().pos())), this.sampleArea.length);
                this._io.writeBytes(this.sampleArea);
            }
        }

        public void _check() {
            if (!Objects.equals(this.sampleRate._root(), _root()))
                throw new ConsistencyError("sample_rate", _root(), this.sampleRate._root());
            if (!Objects.equals(this.sampleRate._parent(), this))
                throw new ConsistencyError("sample_rate", this, this.sampleRate._parent());
            if (samplePtr() == 0) {
            }
            if (_enabledSoundHeaderType) {
            }
            _dirty = false;
        }
        private Double baseFreqeuncy;

        /**
         * base frequency of sample in Hz
         * Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
         * @see <a href="https://en.wikipedia.org/wiki/MIDI_tuning_standard">Source</a>
         */
        public Double baseFreqeuncy() {
            if (this.baseFreqeuncy != null)
                return this.baseFreqeuncy;
            if ( ((midiNote() >= 0) && (midiNote() < 128)) ) {
                this.baseFreqeuncy = ((Number) (_root().midiNoteToFrequency().get(((Number) (midiNote())).intValue()))).doubleValue();
            }
            return this.baseFreqeuncy;
        }
        public void _invalidateBaseFreqeuncy() { this.baseFreqeuncy = null; }
        private SoundHeaderType soundHeaderType;
        private boolean _shouldWriteSoundHeaderType = false;
        private boolean _enabledSoundHeaderType = true;
        public SoundHeaderType soundHeaderType() {
            if (_shouldWriteSoundHeaderType)
                _writeSoundHeaderType();
            if (this.soundHeaderType != null)
                return this.soundHeaderType;
            if (!_enabledSoundHeaderType)
                return null;
            long _pos = this._io.pos();
            this._io.seek(startOfs() + 20);
            this.soundHeaderType = MacOsResourceSnd.SoundHeaderType.byId(this._io.readU1());
            this._io.seek(_pos);
            return this.soundHeaderType;
        }
        public void setSoundHeaderType(SoundHeaderType _v) { _dirty = true; soundHeaderType = _v; }
        public void setSoundHeaderType_Enabled(boolean _v) { _dirty = true; _enabledSoundHeaderType = _v; }

        private void _writeSoundHeaderType() {
            _shouldWriteSoundHeaderType = false;
            long _pos = this._io.pos();
            this._io.seek(startOfs() + 20);
            this._io.writeU1(((Number) (this.soundHeaderType.id())).intValue());
            this._io.seek(_pos);
        }
        private Integer startOfs;
        public Integer startOfs() {
            if (this.startOfs != null)
                return this.startOfs;
            this.startOfs = ((Number) (_io().pos())).intValue();
            return this.startOfs;
        }
        public void _invalidateStartOfs() { this.startOfs = null; }
        private byte[] _unnamed0;
        private long samplePtr;
        private Long numSamples;
        private Long numChannels;
        private UnsignedFixedPoint sampleRate;
        private long loopStart;
        private long loopEnd;
        private SoundHeaderType encode;
        private int midiNote;
        private ExtendedOrCompressed extendedOrCompressed;
        private byte[] sampleArea;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd.SoundCommand _parent;
        public byte[] _unnamed0() { return _unnamed0; }
        public void set_unnamed0(byte[] _v) { _dirty = true; _unnamed0 = _v; }

        /**
         * pointer to samples (or 0 if samples follow data structure)
         */
        public long samplePtr() { return samplePtr; }
        public void setSamplePtr(long _v) { _dirty = true; samplePtr = _v; }

        /**
         * number of samples
         */
        public Long numSamples() { return numSamples; }
        public void setNumSamples(Long _v) { _dirty = true; numSamples = _v; }

        /**
         * number of channels in sample
         */
        public Long numChannels() { return numChannels; }
        public void setNumChannels(Long _v) { _dirty = true; numChannels = _v; }

        /**
         * The rate at which the sample was originally recorded.
         */
        public UnsignedFixedPoint sampleRate() { return sampleRate; }
        public void setSampleRate(UnsignedFixedPoint _v) { _dirty = true; sampleRate = _v; }

        /**
         * loop point beginning
         */
        public long loopStart() { return loopStart; }
        public void setLoopStart(long _v) { _dirty = true; loopStart = _v; }

        /**
         * loop point ending
         */
        public long loopEnd() { return loopEnd; }
        public void setLoopEnd(long _v) { _dirty = true; loopEnd = _v; }

        /**
         * sample's encoding option
         */
        public SoundHeaderType encode() { return encode; }
        public void setEncode(SoundHeaderType _v) { _dirty = true; encode = _v; }

        /**
         * base frequency of sample, expressed as MIDI note values, 60 is middle C
         */
        public int midiNote() { return midiNote; }
        public void setMidiNote(int _v) { _dirty = true; midiNote = _v; }
        public ExtendedOrCompressed extendedOrCompressed() { return extendedOrCompressed; }
        public void setExtendedOrCompressed(ExtendedOrCompressed _v) { _dirty = true; extendedOrCompressed = _v; }

        /**
         * sampled-sound data
         */
        public byte[] sampleArea() { return sampleArea; }
        public void setSampleArea(byte[] _v) { _dirty = true; sampleArea = _v; }
        public MacOsResourceSnd _root() { return _root; }
        public void set_root(MacOsResourceSnd _v) { _dirty = true; _root = _v; }
        public MacOsResourceSnd.SoundCommand _parent() { return _parent; }
        public void set_parent(MacOsResourceSnd.SoundCommand _v) { _dirty = true; _parent = _v; }
    }
    public static class UnsignedFixedPoint extends KaitaiStruct.ReadWrite {
        public static UnsignedFixedPoint fromFile(String fileName) throws IOException {
            return new UnsignedFixedPoint(new ByteBufferKaitaiStream(fileName));
        }
        public UnsignedFixedPoint() {
            this(null, null, null);
        }

        public UnsignedFixedPoint(KaitaiStream _io) {
            this(_io, null, null);
        }

        public UnsignedFixedPoint(KaitaiStream _io, MacOsResourceSnd.SoundHeader _parent) {
            this(_io, _parent, null);
        }

        public UnsignedFixedPoint(KaitaiStream _io, MacOsResourceSnd.SoundHeader _parent, MacOsResourceSnd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.integerPart = this._io.readU2be();
            this.fractionPart = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.integerPart);
            this._io.writeU2be(this.fractionPart);
        }

        public void _check() {
            _dirty = false;
        }
        private Double value;
        public Double value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (integerPart() + fractionPart() / 65535.0)).doubleValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private int integerPart;
        private int fractionPart;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd.SoundHeader _parent;
        public int integerPart() { return integerPart; }
        public void setIntegerPart(int _v) { _dirty = true; integerPart = _v; }
        public int fractionPart() { return fractionPart; }
        public void setFractionPart(int _v) { _dirty = true; fractionPart = _v; }
        public MacOsResourceSnd _root() { return _root; }
        public void set_root(MacOsResourceSnd _v) { _dirty = true; _root = _v; }
        public MacOsResourceSnd.SoundHeader _parent() { return _parent; }
        public void set_parent(MacOsResourceSnd.SoundHeader _v) { _dirty = true; _parent = _v; }
    }
    private List<Double> midiNoteToFrequency;

    /**
     * Lookup table to convert a MIDI note into a frequency in Hz
     * The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
     * @see <a href="https://en.wikipedia.org/wiki/MIDI_tuning_standard">Source</a>
     */
    public List<Double> midiNoteToFrequency() {
        if (this.midiNoteToFrequency != null)
            return this.midiNoteToFrequency;
        this.midiNoteToFrequency = new ArrayList<Double>(Arrays.asList(8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85));
        return this.midiNoteToFrequency;
    }
    public void _invalidateMidiNoteToFrequency() { this.midiNoteToFrequency = null; }
    private int format;
    private Integer numDataFormats;
    private List<DataFormat> dataFormats;
    private Integer referenceCount;
    private int numSoundCommands;
    private List<SoundCommand> soundCommands;
    private MacOsResourceSnd _root;
    private KaitaiStruct.ReadWrite _parent;
    public int format() { return format; }
    public void setFormat(int _v) { _dirty = true; format = _v; }
    public Integer numDataFormats() { return numDataFormats; }
    public void setNumDataFormats(Integer _v) { _dirty = true; numDataFormats = _v; }
    public List<DataFormat> dataFormats() { return dataFormats; }
    public void setDataFormats(List<DataFormat> _v) { _dirty = true; dataFormats = _v; }
    public Integer referenceCount() { return referenceCount; }
    public void setReferenceCount(Integer _v) { _dirty = true; referenceCount = _v; }
    public int numSoundCommands() { return numSoundCommands; }
    public void setNumSoundCommands(int _v) { _dirty = true; numSoundCommands = _v; }
    public List<SoundCommand> soundCommands() { return soundCommands; }
    public void setSoundCommands(List<SoundCommand> _v) { _dirty = true; soundCommands = _v; }
    public MacOsResourceSnd _root() { return _root; }
    public void set_root(MacOsResourceSnd _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
