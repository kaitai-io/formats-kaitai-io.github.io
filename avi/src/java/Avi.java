// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;


/**
 * @see <a href="https://learn.microsoft.com/en-us/previous-versions/ms779636(v=vs.85)">Source</a>
 */
public class Avi extends KaitaiStruct {
    public static Avi fromFile(String fileName) throws IOException {
        return new Avi(new ByteBufferKaitaiStream(fileName));
    }

    public enum ChunkType {
        IDX1(829973609),
        JUNK(1263424842),
        INFO(1330007625),
        ISFT(1413894985),
        LIST(1414744396),
        STRF(1718776947),
        AVIH(1751742049),
        STRH(1752331379),
        MOVI(1769369453),
        HDRL(1819436136),
        STRL(1819440243);

        private final long id;
        ChunkType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ChunkType> byId = new HashMap<Long, ChunkType>(11);
        static {
            for (ChunkType e : ChunkType.values())
                byId.put(e.id(), e);
        }
        public static ChunkType byId(long id) { return byId.get(id); }
    }

    public enum StreamType {
        MIDS(1935960429),
        VIDS(1935960438),
        AUDS(1935963489),
        TXTS(1937012852);

        private final long id;
        StreamType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, StreamType> byId = new HashMap<Long, StreamType>(4);
        static {
            for (StreamType e : StreamType.values())
                byId.put(e.id(), e);
        }
        public static StreamType byId(long id) { return byId.get(id); }
    }

    public enum HandlerType {
        MP3(85),
        AC3(8192),
        DTS(8193),
        CVID(1684633187),
        XVID(1684633208);

        private final long id;
        HandlerType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, HandlerType> byId = new HashMap<Long, HandlerType>(5);
        static {
            for (HandlerType e : HandlerType.values())
                byId.put(e.id(), e);
        }
        public static HandlerType byId(long id) { return byId.get(id); }
    }

    public Avi(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Avi(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Avi(KaitaiStream _io, KaitaiStruct _parent, Avi _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic1 = this._io.readBytes(4);
        if (!(Arrays.equals(magic1(), new byte[] { 82, 73, 70, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 73, 70, 70 }, magic1(), _io(), "/seq/0");
        }
        this.fileSize = this._io.readU4le();
        this.magic2 = this._io.readBytes(4);
        if (!(Arrays.equals(magic2(), new byte[] { 65, 86, 73, 32 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 86, 73, 32 }, magic2(), _io(), "/seq/2");
        }
        this._raw_data = this._io.readBytes((fileSize() - 4));
        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
        this.data = new Blocks(_io__raw_data, this, _root);
    }
    public static class ListBody extends KaitaiStruct {
        public static ListBody fromFile(String fileName) throws IOException {
            return new ListBody(new ByteBufferKaitaiStream(fileName));
        }

        public ListBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ListBody(KaitaiStream _io, Avi.Block _parent) {
            this(_io, _parent, null);
        }

        public ListBody(KaitaiStream _io, Avi.Block _parent, Avi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.listType = Avi.ChunkType.byId(this._io.readU4le());
            this.data = new Blocks(this._io, this, _root);
        }
        private ChunkType listType;
        private Blocks data;
        private Avi _root;
        private Avi.Block _parent;
        public ChunkType listType() { return listType; }
        public Blocks data() { return data; }
        public Avi _root() { return _root; }
        public Avi.Block _parent() { return _parent; }
    }
    public static class Rect extends KaitaiStruct {
        public static Rect fromFile(String fileName) throws IOException {
            return new Rect(new ByteBufferKaitaiStream(fileName));
        }

        public Rect(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Rect(KaitaiStream _io, Avi.StrhBody _parent) {
            this(_io, _parent, null);
        }

        public Rect(KaitaiStream _io, Avi.StrhBody _parent, Avi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.left = this._io.readS2le();
            this.top = this._io.readS2le();
            this.right = this._io.readS2le();
            this.bottom = this._io.readS2le();
        }
        private short left;
        private short top;
        private short right;
        private short bottom;
        private Avi _root;
        private Avi.StrhBody _parent;
        public short left() { return left; }
        public short top() { return top; }
        public short right() { return right; }
        public short bottom() { return bottom; }
        public Avi _root() { return _root; }
        public Avi.StrhBody _parent() { return _parent; }
    }
    public static class Blocks extends KaitaiStruct {
        public static Blocks fromFile(String fileName) throws IOException {
            return new Blocks(new ByteBufferKaitaiStream(fileName));
        }

        public Blocks(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Blocks(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Blocks(KaitaiStream _io, KaitaiStruct _parent, Avi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Block>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Block(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Block> entries;
        private Avi _root;
        private KaitaiStruct _parent;
        public ArrayList<Block> entries() { return entries; }
        public Avi _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * Main header of an AVI file, defined as AVIMAINHEADER structure
     * @see <a href="https://learn.microsoft.com/en-us/previous-versions/ms779632(v=vs.85)">Source</a>
     */
    public static class AvihBody extends KaitaiStruct {
        public static AvihBody fromFile(String fileName) throws IOException {
            return new AvihBody(new ByteBufferKaitaiStream(fileName));
        }

        public AvihBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AvihBody(KaitaiStream _io, Avi.Block _parent) {
            this(_io, _parent, null);
        }

        public AvihBody(KaitaiStream _io, Avi.Block _parent, Avi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.microSecPerFrame = this._io.readU4le();
            this.maxBytesPerSec = this._io.readU4le();
            this.paddingGranularity = this._io.readU4le();
            this.flags = this._io.readU4le();
            this.totalFrames = this._io.readU4le();
            this.initialFrames = this._io.readU4le();
            this.streams = this._io.readU4le();
            this.suggestedBufferSize = this._io.readU4le();
            this.width = this._io.readU4le();
            this.height = this._io.readU4le();
            this.reserved = this._io.readBytes(16);
        }
        private long microSecPerFrame;
        private long maxBytesPerSec;
        private long paddingGranularity;
        private long flags;
        private long totalFrames;
        private long initialFrames;
        private long streams;
        private long suggestedBufferSize;
        private long width;
        private long height;
        private byte[] reserved;
        private Avi _root;
        private Avi.Block _parent;
        public long microSecPerFrame() { return microSecPerFrame; }
        public long maxBytesPerSec() { return maxBytesPerSec; }
        public long paddingGranularity() { return paddingGranularity; }
        public long flags() { return flags; }
        public long totalFrames() { return totalFrames; }
        public long initialFrames() { return initialFrames; }
        public long streams() { return streams; }
        public long suggestedBufferSize() { return suggestedBufferSize; }
        public long width() { return width; }
        public long height() { return height; }
        public byte[] reserved() { return reserved; }
        public Avi _root() { return _root; }
        public Avi.Block _parent() { return _parent; }
    }
    public static class Block extends KaitaiStruct {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
        }

        public Block(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Block(KaitaiStream _io, Avi.Blocks _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, Avi.Blocks _parent, Avi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fourCc = Avi.ChunkType.byId(this._io.readU4le());
            this.blockSize = this._io.readU4le();
            {
                ChunkType on = fourCc();
                if (on != null) {
                    switch (fourCc()) {
                    case LIST: {
                        this._raw_data = this._io.readBytes(blockSize());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                        this.data = new ListBody(_io__raw_data, this, _root);
                        break;
                    }
                    case AVIH: {
                        this._raw_data = this._io.readBytes(blockSize());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                        this.data = new AvihBody(_io__raw_data, this, _root);
                        break;
                    }
                    case STRH: {
                        this._raw_data = this._io.readBytes(blockSize());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                        this.data = new StrhBody(_io__raw_data, this, _root);
                        break;
                    }
                    default: {
                        this.data = this._io.readBytes(blockSize());
                        break;
                    }
                    }
                } else {
                    this.data = this._io.readBytes(blockSize());
                }
            }
        }
        private ChunkType fourCc;
        private long blockSize;
        private Object data;
        private Avi _root;
        private Avi.Blocks _parent;
        private byte[] _raw_data;
        public ChunkType fourCc() { return fourCc; }
        public long blockSize() { return blockSize; }
        public Object data() { return data; }
        public Avi _root() { return _root; }
        public Avi.Blocks _parent() { return _parent; }
        public byte[] _raw_data() { return _raw_data; }
    }

    /**
     * Stream header (one header per stream), defined as AVISTREAMHEADER structure
     * @see <a href="https://learn.microsoft.com/en-us/previous-versions/ms779638(v=vs.85)">Source</a>
     */
    public static class StrhBody extends KaitaiStruct {
        public static StrhBody fromFile(String fileName) throws IOException {
            return new StrhBody(new ByteBufferKaitaiStream(fileName));
        }

        public StrhBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StrhBody(KaitaiStream _io, Avi.Block _parent) {
            this(_io, _parent, null);
        }

        public StrhBody(KaitaiStream _io, Avi.Block _parent, Avi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fccType = Avi.StreamType.byId(this._io.readU4le());
            this.fccHandler = Avi.HandlerType.byId(this._io.readU4le());
            this.flags = this._io.readU4le();
            this.priority = this._io.readU2le();
            this.language = this._io.readU2le();
            this.initialFrames = this._io.readU4le();
            this.scale = this._io.readU4le();
            this.rate = this._io.readU4le();
            this.start = this._io.readU4le();
            this.length = this._io.readU4le();
            this.suggestedBufferSize = this._io.readU4le();
            this.quality = this._io.readU4le();
            this.sampleSize = this._io.readU4le();
            this.frame = new Rect(this._io, this, _root);
        }
        private StreamType fccType;
        private HandlerType fccHandler;
        private long flags;
        private int priority;
        private int language;
        private long initialFrames;
        private long scale;
        private long rate;
        private long start;
        private long length;
        private long suggestedBufferSize;
        private long quality;
        private long sampleSize;
        private Rect frame;
        private Avi _root;
        private Avi.Block _parent;

        /**
         * Type of the data contained in the stream
         */
        public StreamType fccType() { return fccType; }

        /**
         * Type of preferred data handler for the stream (specifies codec for audio / video streams)
         */
        public HandlerType fccHandler() { return fccHandler; }
        public long flags() { return flags; }
        public int priority() { return priority; }
        public int language() { return language; }
        public long initialFrames() { return initialFrames; }
        public long scale() { return scale; }
        public long rate() { return rate; }
        public long start() { return start; }
        public long length() { return length; }
        public long suggestedBufferSize() { return suggestedBufferSize; }
        public long quality() { return quality; }
        public long sampleSize() { return sampleSize; }
        public Rect frame() { return frame; }
        public Avi _root() { return _root; }
        public Avi.Block _parent() { return _parent; }
    }

    /**
     * Stream format description
     */
    public static class StrfBody extends KaitaiStruct {
        public static StrfBody fromFile(String fileName) throws IOException {
            return new StrfBody(new ByteBufferKaitaiStream(fileName));
        }

        public StrfBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StrfBody(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public StrfBody(KaitaiStream _io, KaitaiStruct _parent, Avi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
        }
        private Avi _root;
        private KaitaiStruct _parent;
        public Avi _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private byte[] magic1;
    private long fileSize;
    private byte[] magic2;
    private Blocks data;
    private Avi _root;
    private KaitaiStruct _parent;
    private byte[] _raw_data;
    public byte[] magic1() { return magic1; }
    public long fileSize() { return fileSize; }
    public byte[] magic2() { return magic2; }
    public Blocks data() { return data; }
    public Avi _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_data() { return _raw_data; }
}
