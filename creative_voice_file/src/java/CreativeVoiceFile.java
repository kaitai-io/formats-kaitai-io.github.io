// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * Creative Voice File is a container file format for digital audio
 * wave data. Initial revisions were able to support only unsigned
 * 8-bit PCM and ADPCM data, later versions were revised to add support
 * for 16-bit PCM and a-law / u-law formats.
 * 
 * This format was actively used in 1990s, around the advent of
 * Creative's sound cards (Sound Blaster family). It was a popular
 * choice for a digital sound container in lots of games and multimedia
 * software due to simplicity and availability of Creative's recording
 * / editing tools.
 * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice">Source</a>
 */
public class CreativeVoiceFile extends KaitaiStruct {
    public static CreativeVoiceFile fromFile(String fileName) throws IOException {
        return new CreativeVoiceFile(new ByteBufferKaitaiStream(fileName));
    }

    public enum BlockTypes {
        TERMINATOR(0),
        SOUND_DATA(1),
        SOUND_DATA_CONT(2),
        SILENCE(3),
        MARKER(4),
        TEXT(5),
        REPEAT_START(6),
        REPEAT_END(7),
        EXTRA_INFO(8),
        SOUND_DATA_NEW(9);

        private final long id;
        BlockTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BlockTypes> byId = new HashMap<Long, BlockTypes>(10);
        static {
            for (BlockTypes e : BlockTypes.values())
                byId.put(e.id(), e);
        }
        public static BlockTypes byId(long id) { return byId.get(id); }
    }

    public enum Codecs {
        PCM_8BIT_UNSIGNED(0),
        ADPCM_4BIT(1),
        ADPCM_2_6BIT(2),
        ADPCM_2_BIT(3),
        PCM_16BIT_SIGNED(4),
        ALAW(6),
        ULAW(7),
        ADPCM_4_TO_16BIT(512);

        private final long id;
        Codecs(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Codecs> byId = new HashMap<Long, Codecs>(8);
        static {
            for (Codecs e : Codecs.values())
                byId.put(e.id(), e);
        }
        public static Codecs byId(long id) { return byId.get(id); }
    }

    public CreativeVoiceFile(KaitaiStream _io) {
        this(_io, null, null);
    }

    public CreativeVoiceFile(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public CreativeVoiceFile(KaitaiStream _io, KaitaiStruct _parent, CreativeVoiceFile _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.ensureFixedContents(new byte[] { 67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26 });
        this.headerSize = this._io.readU2le();
        this.version = this._io.readU2le();
        this.checksum = this._io.readU2le();
        this.blocks = new ArrayList<Block>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.blocks.add(new Block(this._io, this, _root));
                i++;
            }
        }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker">Source</a>
     */
    public static class BlockMarker extends KaitaiStruct {
        public static BlockMarker fromFile(String fileName) throws IOException {
            return new BlockMarker(new ByteBufferKaitaiStream(fileName));
        }

        public BlockMarker(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockMarker(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockMarker(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.markerId = this._io.readU2le();
        }
        private int markerId;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Marker ID
         */
        public int markerId() { return markerId; }
        public CreativeVoiceFile _root() { return _root; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence">Source</a>
     */
    public static class BlockSilence extends KaitaiStruct {
        public static BlockSilence fromFile(String fileName) throws IOException {
            return new BlockSilence(new ByteBufferKaitaiStream(fileName));
        }

        public BlockSilence(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockSilence(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockSilence(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.durationSamples = this._io.readU2le();
            this.freqDiv = this._io.readU1();
        }
        private Double sampleRate;
        public Double sampleRate() {
            if (this.sampleRate != null)
                return this.sampleRate;
            double _tmp = (double) ((1000000.0 / (256 - freqDiv())));
            this.sampleRate = _tmp;
            return this.sampleRate;
        }
        private Double durationSec;

        /**
         * Duration of silence, in seconds
         */
        public Double durationSec() {
            if (this.durationSec != null)
                return this.durationSec;
            double _tmp = (double) ((durationSamples() / sampleRate()));
            this.durationSec = _tmp;
            return this.durationSec;
        }
        private int durationSamples;
        private int freqDiv;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Duration of silence, in samples
         */
        public int durationSamples() { return durationSamples; }

        /**
         * Frequency divisor, used to determine sample rate
         */
        public int freqDiv() { return freqDiv; }
        public CreativeVoiceFile _root() { return _root; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29">Source</a>
     */
    public static class BlockSoundDataNew extends KaitaiStruct {
        public static BlockSoundDataNew fromFile(String fileName) throws IOException {
            return new BlockSoundDataNew(new ByteBufferKaitaiStream(fileName));
        }

        public BlockSoundDataNew(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockSoundDataNew(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockSoundDataNew(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sampleRate = this._io.readU4le();
            this.bitsPerSample = this._io.readU1();
            this.numChannels = this._io.readU1();
            this.codec = CreativeVoiceFile.Codecs.byId(this._io.readU2le());
            this.reserved = this._io.readBytes(4);
            this.wave = this._io.readBytesFull();
        }
        private long sampleRate;
        private int bitsPerSample;
        private int numChannels;
        private Codecs codec;
        private byte[] reserved;
        private byte[] wave;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;
        public long sampleRate() { return sampleRate; }
        public int bitsPerSample() { return bitsPerSample; }
        public int numChannels() { return numChannels; }
        public Codecs codec() { return codec; }
        public byte[] reserved() { return reserved; }
        public byte[] wave() { return wave; }
        public CreativeVoiceFile _root() { return _root; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
    }
    public static class Block extends KaitaiStruct {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
        }

        public Block(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Block(KaitaiStream _io, CreativeVoiceFile _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, CreativeVoiceFile _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.blockType = CreativeVoiceFile.BlockTypes.byId(this._io.readU1());
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                this.bodySize1 = this._io.readU2le();
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                this.bodySize2 = this._io.readU1();
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                switch (blockType()) {
                case SILENCE: {
                    this._raw_body = this._io.readBytes(bodySize());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new BlockSilence(_io__raw_body, this, _root);
                    break;
                }
                case SOUND_DATA: {
                    this._raw_body = this._io.readBytes(bodySize());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new BlockSoundData(_io__raw_body, this, _root);
                    break;
                }
                case MARKER: {
                    this._raw_body = this._io.readBytes(bodySize());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new BlockMarker(_io__raw_body, this, _root);
                    break;
                }
                case SOUND_DATA_NEW: {
                    this._raw_body = this._io.readBytes(bodySize());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new BlockSoundDataNew(_io__raw_body, this, _root);
                    break;
                }
                case REPEAT_START: {
                    this._raw_body = this._io.readBytes(bodySize());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new BlockRepeatStart(_io__raw_body, this, _root);
                    break;
                }
                case EXTRA_INFO: {
                    this._raw_body = this._io.readBytes(bodySize());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new BlockExtraInfo(_io__raw_body, this, _root);
                    break;
                }
                default: {
                    this.body = this._io.readBytes(bodySize());
                    break;
                }
                }
            }
        }
        private Integer bodySize;

        /**
         * body_size is a 24-bit little-endian integer, so we're
         * emulating that by adding two standard-sized integers
         * (body_size1 and body_size2).
         */
        public Integer bodySize() {
            if (this.bodySize != null)
                return this.bodySize;
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                int _tmp = (int) ((bodySize1() + (bodySize2() << 16)));
                this.bodySize = _tmp;
            }
            return this.bodySize;
        }
        private BlockTypes blockType;
        private Integer bodySize1;
        private Integer bodySize2;
        private Object body;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile _parent;
        private byte[] _raw_body;

        /**
         * Byte that determines type of block content
         */
        public BlockTypes blockType() { return blockType; }
        public Integer bodySize1() { return bodySize1; }
        public Integer bodySize2() { return bodySize2; }

        /**
         * Block body, type depends on block type byte
         */
        public Object body() { return body; }
        public CreativeVoiceFile _root() { return _root; }
        public CreativeVoiceFile _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start">Source</a>
     */
    public static class BlockRepeatStart extends KaitaiStruct {
        public static BlockRepeatStart fromFile(String fileName) throws IOException {
            return new BlockRepeatStart(new ByteBufferKaitaiStream(fileName));
        }

        public BlockRepeatStart(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockRepeatStart(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockRepeatStart(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.repeatCount1 = this._io.readU2le();
        }
        private int repeatCount1;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Number of repetitions minus 1; 0xffff means infinite repetitions
         */
        public int repeatCount1() { return repeatCount1; }
        public CreativeVoiceFile _root() { return _root; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data">Source</a>
     */
    public static class BlockSoundData extends KaitaiStruct {
        public static BlockSoundData fromFile(String fileName) throws IOException {
            return new BlockSoundData(new ByteBufferKaitaiStream(fileName));
        }

        public BlockSoundData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockSoundData(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockSoundData(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.freqDiv = this._io.readU1();
            this.codec = CreativeVoiceFile.Codecs.byId(this._io.readU1());
            this.wave = this._io.readBytesFull();
        }
        private Double sampleRate;
        public Double sampleRate() {
            if (this.sampleRate != null)
                return this.sampleRate;
            double _tmp = (double) ((1000000.0 / (256 - freqDiv())));
            this.sampleRate = _tmp;
            return this.sampleRate;
        }
        private int freqDiv;
        private Codecs codec;
        private byte[] wave;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Frequency divisor, used to determine sample rate
         */
        public int freqDiv() { return freqDiv; }
        public Codecs codec() { return codec; }
        public byte[] wave() { return wave; }
        public CreativeVoiceFile _root() { return _root; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info">Source</a>
     */
    public static class BlockExtraInfo extends KaitaiStruct {
        public static BlockExtraInfo fromFile(String fileName) throws IOException {
            return new BlockExtraInfo(new ByteBufferKaitaiStream(fileName));
        }

        public BlockExtraInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockExtraInfo(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockExtraInfo(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.freqDiv = this._io.readU2le();
            this.codec = CreativeVoiceFile.Codecs.byId(this._io.readU1());
            this.numChannels1 = this._io.readU1();
        }
        private Integer numChannels;

        /**
         * Number of channels (1 = mono, 2 = stereo)
         */
        public Integer numChannels() {
            if (this.numChannels != null)
                return this.numChannels;
            int _tmp = (int) ((numChannels1() + 1));
            this.numChannels = _tmp;
            return this.numChannels;
        }
        private Double sampleRate;
        public Double sampleRate() {
            if (this.sampleRate != null)
                return this.sampleRate;
            double _tmp = (double) ((256000000.0 / (numChannels() * (65536 - freqDiv()))));
            this.sampleRate = _tmp;
            return this.sampleRate;
        }
        private int freqDiv;
        private Codecs codec;
        private int numChannels1;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Frequency divisor
         */
        public int freqDiv() { return freqDiv; }
        public Codecs codec() { return codec; }

        /**
         * Number of channels minus 1 (0 = mono, 1 = stereo)
         */
        public int numChannels1() { return numChannels1; }
        public CreativeVoiceFile _root() { return _root; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
    }
    private byte[] magic;
    private int headerSize;
    private int version;
    private int checksum;
    private ArrayList<Block> blocks;
    private CreativeVoiceFile _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }

    /**
     * Total size of this main header (usually 0x001A)
     */
    public int headerSize() { return headerSize; }
    public int version() { return version; }

    /**
     * Checksum: this must be equal to ~version + 0x1234
     */
    public int checksum() { return checksum; }

    /**
     * Series of blocks that contain the actual audio data
     */
    public ArrayList<Block> blocks() { return blocks; }
    public CreativeVoiceFile _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
