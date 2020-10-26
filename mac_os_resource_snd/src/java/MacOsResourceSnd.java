// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.Arrays;


/**
 * Sound resources were introduced in Classic MacOS with the Sound Manager program.
 * They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
 * They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
 * @see <a href="https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf">Source</a>
 */
public class MacOsResourceSnd extends KaitaiStruct {
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

    public MacOsResourceSnd(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MacOsResourceSnd(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public MacOsResourceSnd(KaitaiStream _io, KaitaiStruct _parent, MacOsResourceSnd _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.format = this._io.readU2be();
        if (format() == 1) {
            this.numDataFormats = this._io.readU2be();
        }
        if (format() == 1) {
            dataFormats = new ArrayList<DataFormat>(((Number) (numDataFormats())).intValue());
            for (int i = 0; i < numDataFormats(); i++) {
                this.dataFormats.add(new DataFormat(this._io, this, _root));
            }
        }
        if (format() == 2) {
            this.referenceCount = this._io.readU2be();
        }
        this.numSoundCommands = this._io.readU2be();
        soundCommands = new ArrayList<SoundCommand>(((Number) (numSoundCommands())).intValue());
        for (int i = 0; i < numSoundCommands(); i++) {
            this.soundCommands.add(new SoundCommand(this._io, this, _root));
        }
    }
    public static class Extended extends KaitaiStruct {
        public static Extended fromFile(String fileName) throws IOException {
            return new Extended(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.instrumentChunkPtr = this._io.readU4be();
            this.aesRecordingPtr = this._io.readU4be();
        }
        private long instrumentChunkPtr;
        private long aesRecordingPtr;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd.ExtendedOrCompressed _parent;

        /**
         * pointer to instrument info
         */
        public long instrumentChunkPtr() { return instrumentChunkPtr; }

        /**
         * pointer to audio info
         */
        public long aesRecordingPtr() { return aesRecordingPtr; }
        public MacOsResourceSnd _root() { return _root; }
        public MacOsResourceSnd.ExtendedOrCompressed _parent() { return _parent; }
    }
    public static class SoundHeader extends KaitaiStruct {
        public static SoundHeader fromFile(String fileName) throws IOException {
            return new SoundHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
            this.loopStart = this._io.readU4be();
            this.loopEnd = this._io.readU4be();
            this.encode = MacOsResourceSnd.SoundHeaderType.byId(this._io.readU1());
            this.midiNote = this._io.readU1();
            if ( ((soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) || (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED)) ) {
                this.extendedOrCompressed = new ExtendedOrCompressed(this._io, this, _root);
            }
            if (samplePtr() == 0) {
                this.sampleArea = this._io.readBytes((soundHeaderType() == MacOsResourceSnd.SoundHeaderType.STANDARD ? numSamples() : (soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED ? (((extendedOrCompressed().numFrames() * numChannels()) * extendedOrCompressed().bitsPerSample()) / 8) : (_io().size() - _io().pos()))));
            }
        }
        private Integer startOfs;
        public Integer startOfs() {
            if (this.startOfs != null)
                return this.startOfs;
            int _tmp = (int) (_io().pos());
            this.startOfs = _tmp;
            return this.startOfs;
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
                double _tmp = (double) (_root.midiNoteToFrequency().get((int) midiNote()));
                this.baseFreqeuncy = _tmp;
            }
            return this.baseFreqeuncy;
        }
        private SoundHeaderType soundHeaderType;
        public SoundHeaderType soundHeaderType() {
            if (this.soundHeaderType != null)
                return this.soundHeaderType;
            long _pos = this._io.pos();
            this._io.seek((startOfs() + 20));
            this.soundHeaderType = MacOsResourceSnd.SoundHeaderType.byId(this._io.readU1());
            this._io.seek(_pos);
            return this.soundHeaderType;
        }
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

        /**
         * pointer to samples (or 0 if samples follow data structure)
         */
        public long samplePtr() { return samplePtr; }

        /**
         * number of samples
         */
        public Long numSamples() { return numSamples; }

        /**
         * number of channels in sample
         */
        public Long numChannels() { return numChannels; }

        /**
         * The rate at which the sample was originally recorded.
         */
        public UnsignedFixedPoint sampleRate() { return sampleRate; }

        /**
         * loop point beginning
         */
        public long loopStart() { return loopStart; }

        /**
         * loop point ending
         */
        public long loopEnd() { return loopEnd; }

        /**
         * sample's encoding option
         */
        public SoundHeaderType encode() { return encode; }

        /**
         * base frequency of sample, expressed as MIDI note values, 60 is middle C
         */
        public int midiNote() { return midiNote; }
        public ExtendedOrCompressed extendedOrCompressed() { return extendedOrCompressed; }

        /**
         * sampled-sound data
         */
        public byte[] sampleArea() { return sampleArea; }
        public MacOsResourceSnd _root() { return _root; }
        public MacOsResourceSnd.SoundCommand _parent() { return _parent; }
    }
    public static class UnsignedFixedPoint extends KaitaiStruct {
        public static UnsignedFixedPoint fromFile(String fileName) throws IOException {
            return new UnsignedFixedPoint(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.integerPart = this._io.readU2be();
            this.fractionPart = this._io.readU2be();
        }
        private Double value;
        public Double value() {
            if (this.value != null)
                return this.value;
            double _tmp = (double) ((integerPart() + (fractionPart() / 65535.0)));
            this.value = _tmp;
            return this.value;
        }
        private int integerPart;
        private int fractionPart;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd.SoundHeader _parent;
        public int integerPart() { return integerPart; }
        public int fractionPart() { return fractionPart; }
        public MacOsResourceSnd _root() { return _root; }
        public MacOsResourceSnd.SoundHeader _parent() { return _parent; }
    }
    public static class SoundCommand extends KaitaiStruct {
        public static SoundCommand fromFile(String fileName) throws IOException {
            return new SoundCommand(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.isDataOffset = this._io.readBitsIntBe(1) != 0;
            this.cmd = MacOsResourceSnd.CmdType.byId(this._io.readBitsIntBe(15));
            this._io.alignToByte();
            this.param1 = this._io.readU2be();
            this.param2 = this._io.readU4be();
        }
        private SoundHeader soundHeader;
        public SoundHeader soundHeader() {
            if (this.soundHeader != null)
                return this.soundHeader;
            if ( ((isDataOffset()) && (cmd() == MacOsResourceSnd.CmdType.BUFFER_CMD)) ) {
                long _pos = this._io.pos();
                this._io.seek(param2());
                this.soundHeader = new SoundHeader(this._io, this, _root);
                this._io.seek(_pos);
            }
            return this.soundHeader;
        }
        private boolean isDataOffset;
        private CmdType cmd;
        private int param1;
        private long param2;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd _parent;
        public boolean isDataOffset() { return isDataOffset; }
        public CmdType cmd() { return cmd; }
        public int param1() { return param1; }
        public long param2() { return param2; }
        public MacOsResourceSnd _root() { return _root; }
        public MacOsResourceSnd _parent() { return _parent; }
    }
    public static class Compressed extends KaitaiStruct {
        public static Compressed fromFile(String fileName) throws IOException {
            return new Compressed(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.format = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this.reserved = this._io.readBytes(4);
            this.stateVarsPtr = this._io.readU4be();
            this.leftOverSamplesPtr = this._io.readU4be();
            this.compressionId = this._io.readS2be();
            this.packetSize = this._io.readU2be();
            this.synthesizerId = this._io.readU2be();
        }
        private CompressionTypeEnum compressionType;
        public CompressionTypeEnum compressionType() {
            if (this.compressionType != null)
                return this.compressionType;
            this.compressionType = MacOsResourceSnd.CompressionTypeEnum.byId(compressionId());
            return this.compressionType;
        }
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
        public byte[] reserved() { return reserved; }

        /**
         * pointer to StateBlock
         */
        public long stateVarsPtr() { return stateVarsPtr; }

        /**
         * pointer to LeftOverBlock
         */
        public long leftOverSamplesPtr() { return leftOverSamplesPtr; }

        /**
         * ID of compression algorithm
         */
        public short compressionId() { return compressionId; }

        /**
         * number of bits per packet
         */
        public int packetSize() { return packetSize; }

        /**
         * Latest Sound Manager documentation specifies this field as:
         * This field is unused. You should set it to 0.
         * Inside Macintosh (Volume VI, 1991) specifies it as:
         * Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
         * @see <a href="https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf">Page 22-49, absolute page number 1169 in the PDF</a>
         */
        public int synthesizerId() { return synthesizerId; }
        public MacOsResourceSnd _root() { return _root; }
        public MacOsResourceSnd.ExtendedOrCompressed _parent() { return _parent; }
    }
    public static class ExtendedOrCompressed extends KaitaiStruct {
        public static ExtendedOrCompressed fromFile(String fileName) throws IOException {
            return new ExtendedOrCompressed(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.numFrames = this._io.readU4be();
            this.aiffSampleRate = this._io.readBytes(10);
            this.markerChunk = this._io.readU4be();
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
                this.extended = new Extended(this._io, this, _root);
            }
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.COMPRESSED) {
                this.compressed = new Compressed(this._io, this, _root);
            }
            this.bitsPerSample = this._io.readU2be();
            if (_parent().soundHeaderType() == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
                this.reserved = this._io.readBytes(14);
            }
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

        /**
         * rate of original sample (Extended80)
         */
        public byte[] aiffSampleRate() { return aiffSampleRate; }

        /**
         * reserved
         */
        public long markerChunk() { return markerChunk; }
        public Extended extended() { return extended; }
        public Compressed compressed() { return compressed; }

        /**
         * number of bits per sample
         */
        public int bitsPerSample() { return bitsPerSample; }

        /**
         * reserved
         */
        public byte[] reserved() { return reserved; }
        public MacOsResourceSnd _root() { return _root; }
        public MacOsResourceSnd.SoundHeader _parent() { return _parent; }
    }
    public static class DataFormat extends KaitaiStruct {
        public static DataFormat fromFile(String fileName) throws IOException {
            return new DataFormat(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.id = MacOsResourceSnd.DataType.byId(this._io.readU2be());
            this.options = this._io.readU4be();
        }
        private Byte initPanMask;

        /**
         * mask for right/left pan values
         */
        public Byte initPanMask() {
            if (this.initPanMask != null)
                return this.initPanMask;
            byte _tmp = (byte) (3);
            this.initPanMask = _tmp;
            return this.initPanMask;
        }
        private Byte waveInitChannelMask;

        /**
         * wave table only, Sound Manager 2.0 and earlier
         */
        public Byte waveInitChannelMask() {
            if (this.waveInitChannelMask != null)
                return this.waveInitChannelMask;
            byte _tmp = (byte) (7);
            this.waveInitChannelMask = _tmp;
            return this.waveInitChannelMask;
        }
        private Integer initStereoMask;

        /**
         * mask for mono/stereo values
         */
        public Integer initStereoMask() {
            if (this.initStereoMask != null)
                return this.initStereoMask;
            int _tmp = (int) (192);
            this.initStereoMask = _tmp;
            return this.initStereoMask;
        }
        private WaveInitOption waveInit;
        public WaveInitOption waveInit() {
            if (this.waveInit != null)
                return this.waveInit;
            if (id() == MacOsResourceSnd.DataType.WAVE_TABLE_SYNTH) {
                this.waveInit = MacOsResourceSnd.WaveInitOption.byId((options() & waveInitChannelMask()));
            }
            return this.waveInit;
        }
        private InitOption panInit;
        public InitOption panInit() {
            if (this.panInit != null)
                return this.panInit;
            this.panInit = MacOsResourceSnd.InitOption.byId((options() & initPanMask()));
            return this.panInit;
        }
        private Integer initCompMask;

        /**
         * mask for compression IDs
         */
        public Integer initCompMask() {
            if (this.initCompMask != null)
                return this.initCompMask;
            int _tmp = (int) (65280);
            this.initCompMask = _tmp;
            return this.initCompMask;
        }
        private InitOption stereoInit;
        public InitOption stereoInit() {
            if (this.stereoInit != null)
                return this.stereoInit;
            this.stereoInit = MacOsResourceSnd.InitOption.byId((options() & initStereoMask()));
            return this.stereoInit;
        }
        private InitOption compInit;
        public InitOption compInit() {
            if (this.compInit != null)
                return this.compInit;
            this.compInit = MacOsResourceSnd.InitOption.byId((options() & initCompMask()));
            return this.compInit;
        }
        private DataType id;
        private long options;
        private MacOsResourceSnd _root;
        private MacOsResourceSnd _parent;
        public DataType id() { return id; }

        /**
         * contains initialisation options for the SndNewChannel function
         */
        public long options() { return options; }
        public MacOsResourceSnd _root() { return _root; }
        public MacOsResourceSnd _parent() { return _parent; }
    }
    private ArrayList<Double> midiNoteToFrequency;

    /**
     * Lookup table to convert a MIDI note into a frequency in Hz
     * The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
     * @see <a href="https://en.wikipedia.org/wiki/MIDI_tuning_standard">Source</a>
     */
    public ArrayList<Double> midiNoteToFrequency() {
        if (this.midiNoteToFrequency != null)
            return this.midiNoteToFrequency;
        this.midiNoteToFrequency = new ArrayList<Double>(Arrays.asList(8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85));
        return this.midiNoteToFrequency;
    }
    private int format;
    private Integer numDataFormats;
    private ArrayList<DataFormat> dataFormats;
    private Integer referenceCount;
    private int numSoundCommands;
    private ArrayList<SoundCommand> soundCommands;
    private MacOsResourceSnd _root;
    private KaitaiStruct _parent;
    public int format() { return format; }
    public Integer numDataFormats() { return numDataFormats; }
    public ArrayList<DataFormat> dataFormats() { return dataFormats; }
    public Integer referenceCount() { return referenceCount; }
    public int numSoundCommands() { return numSoundCommands; }
    public ArrayList<SoundCommand> soundCommands() { return soundCommands; }
    public MacOsResourceSnd _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
