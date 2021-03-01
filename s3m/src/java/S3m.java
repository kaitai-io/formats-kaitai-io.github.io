// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;


/**
 * Scream Tracker 3 module is a tracker music file format that, as all
 * tracker music, bundles both sound samples and instructions on which
 * notes to play. It originates from a Scream Tracker 3 music editor
 * (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
 * module format.
 * 
 * Instrument descriptions in S3M format allow to use either digital
 * samples or setup and control AdLib (OPL2) synth.
 * 
 * Music is organized in so called `patterns`. "Pattern" is a generally
 * a 64-row long table, which instructs which notes to play on which
 * time measure. "Patterns" are played one-by-one in a sequence
 * determined by `orders`, which is essentially an array of pattern IDs
 * - this way it's possible to reuse certain patterns more than once
 * for repetitive musical phrases.
 * @see <a href="http://hackipedia.org/browse.cgi/File%20formats/Music%20tracker/S3M%2c%20ScreamTracker%203/Scream%20Tracker%203.20%20by%20Future%20Crew.txt">Source</a>
 */
public class S3m extends KaitaiStruct {
    public static S3m fromFile(String fileName) throws IOException {
        return new S3m(new ByteBufferKaitaiStream(fileName));
    }

    public S3m(KaitaiStream _io) {
        this(_io, null, null);
    }

    public S3m(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public S3m(KaitaiStream _io, KaitaiStruct _parent, S3m _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.songName = KaitaiStream.bytesTerminate(this._io.readBytes(28), (byte) 0, false);
        this.magic1 = this._io.readBytes(1);
        if (!(Arrays.equals(magic1(), new byte[] { 26 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 26 }, magic1(), _io(), "/seq/1");
        }
        this.fileType = this._io.readU1();
        this.reserved1 = this._io.readBytes(2);
        this.numOrders = this._io.readU2le();
        this.numInstruments = this._io.readU2le();
        this.numPatterns = this._io.readU2le();
        this.flags = this._io.readU2le();
        this.version = this._io.readU2le();
        this.samplesFormat = this._io.readU2le();
        this.magic2 = this._io.readBytes(4);
        if (!(Arrays.equals(magic2(), new byte[] { 83, 67, 82, 77 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 67, 82, 77 }, magic2(), _io(), "/seq/10");
        }
        this.globalVolume = this._io.readU1();
        this.initialSpeed = this._io.readU1();
        this.initialTempo = this._io.readU1();
        this.isStereo = this._io.readBitsIntBe(1) != 0;
        this.masterVolume = this._io.readBitsIntBe(7);
        this._io.alignToByte();
        this.ultraClickRemoval = this._io.readU1();
        this.hasCustomPan = this._io.readU1();
        this.reserved2 = this._io.readBytes(8);
        this.ofsSpecial = this._io.readU2le();
        channels = new ArrayList<Channel>(((Number) (32)).intValue());
        for (int i = 0; i < 32; i++) {
            this.channels.add(new Channel(this._io, this, _root));
        }
        this.orders = this._io.readBytes(numOrders());
        instruments = new ArrayList<InstrumentPtr>(((Number) (numInstruments())).intValue());
        for (int i = 0; i < numInstruments(); i++) {
            this.instruments.add(new InstrumentPtr(this._io, this, _root));
        }
        patterns = new ArrayList<PatternPtr>(((Number) (numPatterns())).intValue());
        for (int i = 0; i < numPatterns(); i++) {
            this.patterns.add(new PatternPtr(this._io, this, _root));
        }
        if (hasCustomPan() == 252) {
            channelPans = new ArrayList<ChannelPan>(((Number) (32)).intValue());
            for (int i = 0; i < 32; i++) {
                this.channelPans.add(new ChannelPan(this._io, this, _root));
            }
        }
    }
    public static class ChannelPan extends KaitaiStruct {
        public static ChannelPan fromFile(String fileName) throws IOException {
            return new ChannelPan(new ByteBufferKaitaiStream(fileName));
        }

        public ChannelPan(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChannelPan(KaitaiStream _io, S3m _parent) {
            this(_io, _parent, null);
        }

        public ChannelPan(KaitaiStream _io, S3m _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.reserved1 = this._io.readBitsIntBe(2);
            this.hasCustomPan = this._io.readBitsIntBe(1) != 0;
            this.reserved2 = this._io.readBitsIntBe(1) != 0;
            this.pan = this._io.readBitsIntBe(4);
        }
        private long reserved1;
        private boolean hasCustomPan;
        private boolean reserved2;
        private long pan;
        private S3m _root;
        private S3m _parent;
        public long reserved1() { return reserved1; }

        /**
         * If true, then use a custom pan setting provided in the `pan`
         * field. If false, the channel would use the default setting
         * (0x7 for mono, 0x3 or 0xc for stereo).
         */
        public boolean hasCustomPan() { return hasCustomPan; }
        public boolean reserved2() { return reserved2; }
        public long pan() { return pan; }
        public S3m _root() { return _root; }
        public S3m _parent() { return _parent; }
    }
    public static class PatternCell extends KaitaiStruct {
        public static PatternCell fromFile(String fileName) throws IOException {
            return new PatternCell(new ByteBufferKaitaiStream(fileName));
        }

        public PatternCell(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PatternCell(KaitaiStream _io, S3m.PatternCells _parent) {
            this(_io, _parent, null);
        }

        public PatternCell(KaitaiStream _io, S3m.PatternCells _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.hasFx = this._io.readBitsIntBe(1) != 0;
            this.hasVolume = this._io.readBitsIntBe(1) != 0;
            this.hasNoteAndInstrument = this._io.readBitsIntBe(1) != 0;
            this.channelNum = this._io.readBitsIntBe(5);
            this._io.alignToByte();
            if (hasNoteAndInstrument()) {
                this.note = this._io.readU1();
            }
            if (hasNoteAndInstrument()) {
                this.instrument = this._io.readU1();
            }
            if (hasVolume()) {
                this.volume = this._io.readU1();
            }
            if (hasFx()) {
                this.fxType = this._io.readU1();
            }
            if (hasFx()) {
                this.fxValue = this._io.readU1();
            }
        }
        private boolean hasFx;
        private boolean hasVolume;
        private boolean hasNoteAndInstrument;
        private long channelNum;
        private Integer note;
        private Integer instrument;
        private Integer volume;
        private Integer fxType;
        private Integer fxValue;
        private S3m _root;
        private S3m.PatternCells _parent;
        public boolean hasFx() { return hasFx; }
        public boolean hasVolume() { return hasVolume; }
        public boolean hasNoteAndInstrument() { return hasNoteAndInstrument; }
        public long channelNum() { return channelNum; }
        public Integer note() { return note; }
        public Integer instrument() { return instrument; }
        public Integer volume() { return volume; }
        public Integer fxType() { return fxType; }
        public Integer fxValue() { return fxValue; }
        public S3m _root() { return _root; }
        public S3m.PatternCells _parent() { return _parent; }
    }
    public static class PatternCells extends KaitaiStruct {
        public static PatternCells fromFile(String fileName) throws IOException {
            return new PatternCells(new ByteBufferKaitaiStream(fileName));
        }

        public PatternCells(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PatternCells(KaitaiStream _io, S3m.Pattern _parent) {
            this(_io, _parent, null);
        }

        public PatternCells(KaitaiStream _io, S3m.Pattern _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.cells = new ArrayList<PatternCell>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.cells.add(new PatternCell(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<PatternCell> cells;
        private S3m _root;
        private S3m.Pattern _parent;
        public ArrayList<PatternCell> cells() { return cells; }
        public S3m _root() { return _root; }
        public S3m.Pattern _parent() { return _parent; }
    }
    public static class Channel extends KaitaiStruct {
        public static Channel fromFile(String fileName) throws IOException {
            return new Channel(new ByteBufferKaitaiStream(fileName));
        }

        public Channel(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Channel(KaitaiStream _io, S3m _parent) {
            this(_io, _parent, null);
        }

        public Channel(KaitaiStream _io, S3m _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.isDisabled = this._io.readBitsIntBe(1) != 0;
            this.chType = this._io.readBitsIntBe(7);
        }
        private boolean isDisabled;
        private long chType;
        private S3m _root;
        private S3m _parent;
        public boolean isDisabled() { return isDisabled; }

        /**
         * Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels)
         */
        public long chType() { return chType; }
        public S3m _root() { return _root; }
        public S3m _parent() { return _parent; }
    }

    /**
     * Custom 3-byte integer, stored in mixed endian manner.
     */
    public static class SwappedU3 extends KaitaiStruct {
        public static SwappedU3 fromFile(String fileName) throws IOException {
            return new SwappedU3(new ByteBufferKaitaiStream(fileName));
        }

        public SwappedU3(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SwappedU3(KaitaiStream _io, S3m.Instrument.Sampled _parent) {
            this(_io, _parent, null);
        }

        public SwappedU3(KaitaiStream _io, S3m.Instrument.Sampled _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.hi = this._io.readU1();
            this.lo = this._io.readU2le();
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            int _tmp = (int) ((lo() | (hi() << 16)));
            this.value = _tmp;
            return this.value;
        }
        private int hi;
        private int lo;
        private S3m _root;
        private S3m.Instrument.Sampled _parent;
        public int hi() { return hi; }
        public int lo() { return lo; }
        public S3m _root() { return _root; }
        public S3m.Instrument.Sampled _parent() { return _parent; }
    }
    public static class Pattern extends KaitaiStruct {
        public static Pattern fromFile(String fileName) throws IOException {
            return new Pattern(new ByteBufferKaitaiStream(fileName));
        }

        public Pattern(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pattern(KaitaiStream _io, S3m.PatternPtr _parent) {
            this(_io, _parent, null);
        }

        public Pattern(KaitaiStream _io, S3m.PatternPtr _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU2le();
            this._raw_body = this._io.readBytes((size() - 2));
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
            this.body = new PatternCells(_io__raw_body, this, _root);
        }
        private int size;
        private PatternCells body;
        private S3m _root;
        private S3m.PatternPtr _parent;
        private byte[] _raw_body;
        public int size() { return size; }
        public PatternCells body() { return body; }
        public S3m _root() { return _root; }
        public S3m.PatternPtr _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }
    public static class PatternPtr extends KaitaiStruct {
        public static PatternPtr fromFile(String fileName) throws IOException {
            return new PatternPtr(new ByteBufferKaitaiStream(fileName));
        }

        public PatternPtr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PatternPtr(KaitaiStream _io, S3m _parent) {
            this(_io, _parent, null);
        }

        public PatternPtr(KaitaiStream _io, S3m _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.paraptr = this._io.readU2le();
        }
        private Pattern body;
        public Pattern body() {
            if (this.body != null)
                return this.body;
            long _pos = this._io.pos();
            this._io.seek((paraptr() * 16));
            this.body = new Pattern(this._io, this, _root);
            this._io.seek(_pos);
            return this.body;
        }
        private int paraptr;
        private S3m _root;
        private S3m _parent;
        public int paraptr() { return paraptr; }
        public S3m _root() { return _root; }
        public S3m _parent() { return _parent; }
    }
    public static class InstrumentPtr extends KaitaiStruct {
        public static InstrumentPtr fromFile(String fileName) throws IOException {
            return new InstrumentPtr(new ByteBufferKaitaiStream(fileName));
        }

        public InstrumentPtr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InstrumentPtr(KaitaiStream _io, S3m _parent) {
            this(_io, _parent, null);
        }

        public InstrumentPtr(KaitaiStream _io, S3m _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.paraptr = this._io.readU2le();
        }
        private Instrument body;
        public Instrument body() {
            if (this.body != null)
                return this.body;
            long _pos = this._io.pos();
            this._io.seek((paraptr() * 16));
            this.body = new Instrument(this._io, this, _root);
            this._io.seek(_pos);
            return this.body;
        }
        private int paraptr;
        private S3m _root;
        private S3m _parent;
        public int paraptr() { return paraptr; }
        public S3m _root() { return _root; }
        public S3m _parent() { return _parent; }
    }
    public static class Instrument extends KaitaiStruct {
        public static Instrument fromFile(String fileName) throws IOException {
            return new Instrument(new ByteBufferKaitaiStream(fileName));
        }

        public enum InstTypes {
            SAMPLE(1),
            MELODIC(2),
            BASS_DRUM(3),
            SNARE_DRUM(4),
            TOM(5),
            CYMBAL(6),
            HIHAT(7);

            private final long id;
            InstTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, InstTypes> byId = new HashMap<Long, InstTypes>(7);
            static {
                for (InstTypes e : InstTypes.values())
                    byId.put(e.id(), e);
            }
            public static InstTypes byId(long id) { return byId.get(id); }
        }

        public Instrument(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Instrument(KaitaiStream _io, S3m.InstrumentPtr _parent) {
            this(_io, _parent, null);
        }

        public Instrument(KaitaiStream _io, S3m.InstrumentPtr _parent, S3m _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = InstTypes.byId(this._io.readU1());
            this.filename = KaitaiStream.bytesTerminate(this._io.readBytes(12), (byte) 0, false);
            {
                InstTypes on = type();
                if (on != null) {
                    switch (type()) {
                    case SAMPLE: {
                        this.body = new Sampled(this._io, this, _root);
                        break;
                    }
                    default: {
                        this.body = new Adlib(this._io, this, _root);
                        break;
                    }
                    }
                } else {
                    this.body = new Adlib(this._io, this, _root);
                }
            }
            this.tuningHz = this._io.readU4le();
            this.reserved2 = this._io.readBytes(12);
            this.sampleName = KaitaiStream.bytesTerminate(this._io.readBytes(28), (byte) 0, false);
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { 83, 67, 82, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 67, 82, 83 }, magic(), _io(), "/types/instrument/seq/6");
            }
        }
        public static class Sampled extends KaitaiStruct {
            public static Sampled fromFile(String fileName) throws IOException {
                return new Sampled(new ByteBufferKaitaiStream(fileName));
            }

            public Sampled(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Sampled(KaitaiStream _io, S3m.Instrument _parent) {
                this(_io, _parent, null);
            }

            public Sampled(KaitaiStream _io, S3m.Instrument _parent, S3m _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.paraptrSample = new SwappedU3(this._io, this, _root);
                this.lenSample = this._io.readU4le();
                this.loopBegin = this._io.readU4le();
                this.loopEnd = this._io.readU4le();
                this.defaultVolume = this._io.readU1();
                this.reserved1 = this._io.readU1();
                this.isPacked = this._io.readU1();
                this.flags = this._io.readU1();
            }
            private byte[] sample;
            public byte[] sample() {
                if (this.sample != null)
                    return this.sample;
                long _pos = this._io.pos();
                this._io.seek((paraptrSample().value() * 16));
                this.sample = this._io.readBytes(lenSample());
                this._io.seek(_pos);
                return this.sample;
            }
            private SwappedU3 paraptrSample;
            private long lenSample;
            private long loopBegin;
            private long loopEnd;
            private int defaultVolume;
            private int reserved1;
            private int isPacked;
            private int flags;
            private S3m _root;
            private S3m.Instrument _parent;
            public SwappedU3 paraptrSample() { return paraptrSample; }
            public long lenSample() { return lenSample; }
            public long loopBegin() { return loopBegin; }
            public long loopEnd() { return loopEnd; }

            /**
             * Default volume
             */
            public int defaultVolume() { return defaultVolume; }
            public int reserved1() { return reserved1; }

            /**
             * 0 = unpacked, 1 = DP30ADPCM packing
             */
            public int isPacked() { return isPacked; }
            public int flags() { return flags; }
            public S3m _root() { return _root; }
            public S3m.Instrument _parent() { return _parent; }
        }
        public static class Adlib extends KaitaiStruct {
            public static Adlib fromFile(String fileName) throws IOException {
                return new Adlib(new ByteBufferKaitaiStream(fileName));
            }

            public Adlib(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Adlib(KaitaiStream _io, S3m.Instrument _parent) {
                this(_io, _parent, null);
            }

            public Adlib(KaitaiStream _io, S3m.Instrument _parent, S3m _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.reserved1 = this._io.readBytes(3);
                if (!(Arrays.equals(reserved1(), new byte[] { 0, 0, 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0 }, reserved1(), _io(), "/types/instrument/types/adlib/seq/0");
                }
                this._unnamed1 = this._io.readBytes(16);
            }
            private byte[] reserved1;
            private byte[] _unnamed1;
            private S3m _root;
            private S3m.Instrument _parent;
            public byte[] reserved1() { return reserved1; }
            public byte[] _unnamed1() { return _unnamed1; }
            public S3m _root() { return _root; }
            public S3m.Instrument _parent() { return _parent; }
        }
        private InstTypes type;
        private byte[] filename;
        private KaitaiStruct body;
        private long tuningHz;
        private byte[] reserved2;
        private byte[] sampleName;
        private byte[] magic;
        private S3m _root;
        private S3m.InstrumentPtr _parent;
        public InstTypes type() { return type; }
        public byte[] filename() { return filename; }
        public KaitaiStruct body() { return body; }
        public long tuningHz() { return tuningHz; }
        public byte[] reserved2() { return reserved2; }
        public byte[] sampleName() { return sampleName; }
        public byte[] magic() { return magic; }
        public S3m _root() { return _root; }
        public S3m.InstrumentPtr _parent() { return _parent; }
    }
    private byte[] songName;
    private byte[] magic1;
    private int fileType;
    private byte[] reserved1;
    private int numOrders;
    private int numInstruments;
    private int numPatterns;
    private int flags;
    private int version;
    private int samplesFormat;
    private byte[] magic2;
    private int globalVolume;
    private int initialSpeed;
    private int initialTempo;
    private boolean isStereo;
    private long masterVolume;
    private int ultraClickRemoval;
    private int hasCustomPan;
    private byte[] reserved2;
    private int ofsSpecial;
    private ArrayList<Channel> channels;
    private byte[] orders;
    private ArrayList<InstrumentPtr> instruments;
    private ArrayList<PatternPtr> patterns;
    private ArrayList<ChannelPan> channelPans;
    private S3m _root;
    private KaitaiStruct _parent;
    public byte[] songName() { return songName; }
    public byte[] magic1() { return magic1; }
    public int fileType() { return fileType; }
    public byte[] reserved1() { return reserved1; }

    /**
     * Number of orders in a song
     */
    public int numOrders() { return numOrders; }

    /**
     * Number of instruments in a song
     */
    public int numInstruments() { return numInstruments; }

    /**
     * Number of patterns in a song
     */
    public int numPatterns() { return numPatterns; }
    public int flags() { return flags; }

    /**
     * Scream Tracker version that was used to save this file
     */
    public int version() { return version; }

    /**
     * 1 = signed samples, 2 = unsigned samples
     */
    public int samplesFormat() { return samplesFormat; }
    public byte[] magic2() { return magic2; }
    public int globalVolume() { return globalVolume; }
    public int initialSpeed() { return initialSpeed; }
    public int initialTempo() { return initialTempo; }
    public boolean isStereo() { return isStereo; }
    public long masterVolume() { return masterVolume; }
    public int ultraClickRemoval() { return ultraClickRemoval; }
    public int hasCustomPan() { return hasCustomPan; }
    public byte[] reserved2() { return reserved2; }

    /**
     * Offset of special data, not used by Scream Tracker directly.
     */
    public int ofsSpecial() { return ofsSpecial; }
    public ArrayList<Channel> channels() { return channels; }
    public byte[] orders() { return orders; }
    public ArrayList<InstrumentPtr> instruments() { return instruments; }
    public ArrayList<PatternPtr> patterns() { return patterns; }
    public ArrayList<ChannelPan> channelPans() { return channelPans; }
    public S3m _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
