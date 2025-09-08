// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="https://learn.microsoft.com/en-us/previous-versions/ms779636(v=vs.85)">Source</a>
 */
public class Avi extends KaitaiStruct.ReadWrite {
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
    public Avi() {
        this(null, null, null);
    }

    public Avi(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Avi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Avi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Avi _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic1 = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic1, new byte[] { 82, 73, 70, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 73, 70, 70 }, this.magic1, this._io, "/seq/0");
        }
        this.fileSize = this._io.readU4le();
        this.magic2 = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic2, new byte[] { 65, 86, 73, 32 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 86, 73, 32 }, this.magic2, this._io, "/seq/2");
        }
        this._raw_data = this._io.readBytes(fileSize() - 4);
        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
        this.data = new Blocks(_io__raw_data, this, _root);
        this.data._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.data._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic1);
        this._io.writeU4le(this.fileSize);
        this._io.writeBytes(this.magic2);
        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(fileSize() - 4);
        this._io.addChildStream(_io__raw_data);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (fileSize() - 4));
            final Avi _this = this;
            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_data = _io__raw_data.toByteArray();
                    if (_this._raw_data.length != fileSize() - 4)
                        throw new ConsistencyError("raw(data)", fileSize() - 4, _this._raw_data.length);
                    parent.writeBytes(_this._raw_data);
                }
            });
        }
        this.data._write_Seq(_io__raw_data);
    }

    public void _check() {
        if (this.magic1.length != 4)
            throw new ConsistencyError("magic1", 4, this.magic1.length);
        if (!(Arrays.equals(this.magic1, new byte[] { 82, 73, 70, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 73, 70, 70 }, this.magic1, null, "/seq/0");
        }
        if (this.magic2.length != 4)
            throw new ConsistencyError("magic2", 4, this.magic2.length);
        if (!(Arrays.equals(this.magic2, new byte[] { 65, 86, 73, 32 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 86, 73, 32 }, this.magic2, null, "/seq/2");
        }
        if (!Objects.equals(this.data._root(), _root()))
            throw new ConsistencyError("data", _root(), this.data._root());
        if (!Objects.equals(this.data._parent(), this))
            throw new ConsistencyError("data", this, this.data._parent());
        _dirty = false;
    }

    /**
     * Main header of an AVI file, defined as AVIMAINHEADER structure
     * @see <a href="https://learn.microsoft.com/en-us/previous-versions/ms779632(v=vs.85)">Source</a>
     */
    public static class AvihBody extends KaitaiStruct.ReadWrite {
        public static AvihBody fromFile(String fileName) throws IOException {
            return new AvihBody(new ByteBufferKaitaiStream(fileName));
        }
        public AvihBody() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.microSecPerFrame);
            this._io.writeU4le(this.maxBytesPerSec);
            this._io.writeU4le(this.paddingGranularity);
            this._io.writeU4le(this.flags);
            this._io.writeU4le(this.totalFrames);
            this._io.writeU4le(this.initialFrames);
            this._io.writeU4le(this.streams);
            this._io.writeU4le(this.suggestedBufferSize);
            this._io.writeU4le(this.width);
            this._io.writeU4le(this.height);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (this.reserved.length != 16)
                throw new ConsistencyError("reserved", 16, this.reserved.length);
            _dirty = false;
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
        public void setMicroSecPerFrame(long _v) { _dirty = true; microSecPerFrame = _v; }
        public long maxBytesPerSec() { return maxBytesPerSec; }
        public void setMaxBytesPerSec(long _v) { _dirty = true; maxBytesPerSec = _v; }
        public long paddingGranularity() { return paddingGranularity; }
        public void setPaddingGranularity(long _v) { _dirty = true; paddingGranularity = _v; }
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public long totalFrames() { return totalFrames; }
        public void setTotalFrames(long _v) { _dirty = true; totalFrames = _v; }
        public long initialFrames() { return initialFrames; }
        public void setInitialFrames(long _v) { _dirty = true; initialFrames = _v; }
        public long streams() { return streams; }
        public void setStreams(long _v) { _dirty = true; streams = _v; }
        public long suggestedBufferSize() { return suggestedBufferSize; }
        public void setSuggestedBufferSize(long _v) { _dirty = true; suggestedBufferSize = _v; }
        public long width() { return width; }
        public void setWidth(long _v) { _dirty = true; width = _v; }
        public long height() { return height; }
        public void setHeight(long _v) { _dirty = true; height = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public Avi _root() { return _root; }
        public void set_root(Avi _v) { _dirty = true; _root = _v; }
        public Avi.Block _parent() { return _parent; }
        public void set_parent(Avi.Block _v) { _dirty = true; _parent = _v; }
    }
    public static class Block extends KaitaiStruct.ReadWrite {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
        }
        public Block() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fourCc = Avi.ChunkType.byId(this._io.readU4le());
            this.blockSize = this._io.readU4le();
            {
                ChunkType on = fourCc();
                if (on != null) {
                    switch (fourCc()) {
                    case AVIH: {
                        this._raw_data = this._io.readBytes(blockSize());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new AvihBody(_io__raw_data, this, _root);
                        ((AvihBody) (this.data))._read();
                        break;
                    }
                    case LIST: {
                        this._raw_data = this._io.readBytes(blockSize());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new ListBody(_io__raw_data, this, _root);
                        ((ListBody) (this.data))._read();
                        break;
                    }
                    case STRH: {
                        this._raw_data = this._io.readBytes(blockSize());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new StrhBody(_io__raw_data, this, _root);
                        ((StrhBody) (this.data))._read();
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
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                ChunkType on = fourCc();
                if (on != null) {
                    switch (fourCc()) {
                    case AVIH: {
                        ((AvihBody) (this.data))._fetchInstances();
                        break;
                    }
                    case LIST: {
                        ((ListBody) (this.data))._fetchInstances();
                        break;
                    }
                    case STRH: {
                        ((StrhBody) (this.data))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(((Number) (this.fourCc.id())).longValue());
            this._io.writeU4le(this.blockSize);
            {
                ChunkType on = fourCc();
                if (on != null) {
                    switch (fourCc()) {
                    case AVIH: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(blockSize());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (blockSize()));
                            final Block _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != blockSize())
                                        throw new ConsistencyError("raw(data)", blockSize(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((AvihBody) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case LIST: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(blockSize());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (blockSize()));
                            final Block _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != blockSize())
                                        throw new ConsistencyError("raw(data)", blockSize(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((ListBody) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case STRH: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(blockSize());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (blockSize()));
                            final Block _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != blockSize())
                                        throw new ConsistencyError("raw(data)", blockSize(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((StrhBody) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                }
            }
        }

        public void _check() {
            {
                ChunkType on = fourCc();
                if (on != null) {
                    switch (fourCc()) {
                    case AVIH: {
                        if (!Objects.equals(((Avi.AvihBody) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Avi.AvihBody) (this.data))._root());
                        if (!Objects.equals(((Avi.AvihBody) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Avi.AvihBody) (this.data))._parent());
                        break;
                    }
                    case LIST: {
                        if (!Objects.equals(((Avi.ListBody) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Avi.ListBody) (this.data))._root());
                        if (!Objects.equals(((Avi.ListBody) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Avi.ListBody) (this.data))._parent());
                        break;
                    }
                    case STRH: {
                        if (!Objects.equals(((Avi.StrhBody) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Avi.StrhBody) (this.data))._root());
                        if (!Objects.equals(((Avi.StrhBody) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Avi.StrhBody) (this.data))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.data)).length != blockSize())
                            throw new ConsistencyError("data", blockSize(), ((byte[]) (this.data)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.data)).length != blockSize())
                        throw new ConsistencyError("data", blockSize(), ((byte[]) (this.data)).length);
                }
            }
            _dirty = false;
        }
        private ChunkType fourCc;
        private long blockSize;
        private Object data;
        private Avi _root;
        private Avi.Blocks _parent;
        private byte[] _raw_data;
        public ChunkType fourCc() { return fourCc; }
        public void setFourCc(ChunkType _v) { _dirty = true; fourCc = _v; }
        public long blockSize() { return blockSize; }
        public void setBlockSize(long _v) { _dirty = true; blockSize = _v; }
        public Object data() { return data; }
        public void setData(Object _v) { _dirty = true; data = _v; }
        public Avi _root() { return _root; }
        public void set_root(Avi _v) { _dirty = true; _root = _v; }
        public Avi.Blocks _parent() { return _parent; }
        public void set_parent(Avi.Blocks _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_data() { return _raw_data; }
        public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
    }
    public static class Blocks extends KaitaiStruct.ReadWrite {
        public static Blocks fromFile(String fileName) throws IOException {
            return new Blocks(new ByteBufferKaitaiStream(fileName));
        }
        public Blocks() {
            this(null, null, null);
        }

        public Blocks(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Blocks(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Blocks(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Avi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Block>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Block _t_entries = new Block(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Block> entries;
        private Avi _root;
        private KaitaiStruct.ReadWrite _parent;
        public List<Block> entries() { return entries; }
        public void setEntries(List<Block> _v) { _dirty = true; entries = _v; }
        public Avi _root() { return _root; }
        public void set_root(Avi _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class ListBody extends KaitaiStruct.ReadWrite {
        public static ListBody fromFile(String fileName) throws IOException {
            return new ListBody(new ByteBufferKaitaiStream(fileName));
        }
        public ListBody() {
            this(null, null, null);
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
        }
        public void _read() {
            this.listType = Avi.ChunkType.byId(this._io.readU4le());
            this.data = new Blocks(this._io, this, _root);
            this.data._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.data._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(((Number) (this.listType.id())).longValue());
            this.data._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.data._root(), _root()))
                throw new ConsistencyError("data", _root(), this.data._root());
            if (!Objects.equals(this.data._parent(), this))
                throw new ConsistencyError("data", this, this.data._parent());
            _dirty = false;
        }
        private ChunkType listType;
        private Blocks data;
        private Avi _root;
        private Avi.Block _parent;
        public ChunkType listType() { return listType; }
        public void setListType(ChunkType _v) { _dirty = true; listType = _v; }
        public Blocks data() { return data; }
        public void setData(Blocks _v) { _dirty = true; data = _v; }
        public Avi _root() { return _root; }
        public void set_root(Avi _v) { _dirty = true; _root = _v; }
        public Avi.Block _parent() { return _parent; }
        public void set_parent(Avi.Block _v) { _dirty = true; _parent = _v; }
    }
    public static class Rect extends KaitaiStruct.ReadWrite {
        public static Rect fromFile(String fileName) throws IOException {
            return new Rect(new ByteBufferKaitaiStream(fileName));
        }
        public Rect() {
            this(null, null, null);
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
        }
        public void _read() {
            this.left = this._io.readS2le();
            this.top = this._io.readS2le();
            this.right = this._io.readS2le();
            this.bottom = this._io.readS2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2le(this.left);
            this._io.writeS2le(this.top);
            this._io.writeS2le(this.right);
            this._io.writeS2le(this.bottom);
        }

        public void _check() {
            _dirty = false;
        }
        private short left;
        private short top;
        private short right;
        private short bottom;
        private Avi _root;
        private Avi.StrhBody _parent;
        public short left() { return left; }
        public void setLeft(short _v) { _dirty = true; left = _v; }
        public short top() { return top; }
        public void setTop(short _v) { _dirty = true; top = _v; }
        public short right() { return right; }
        public void setRight(short _v) { _dirty = true; right = _v; }
        public short bottom() { return bottom; }
        public void setBottom(short _v) { _dirty = true; bottom = _v; }
        public Avi _root() { return _root; }
        public void set_root(Avi _v) { _dirty = true; _root = _v; }
        public Avi.StrhBody _parent() { return _parent; }
        public void set_parent(Avi.StrhBody _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Stream format description
     */
    public static class StrfBody extends KaitaiStruct.ReadWrite {
        public static StrfBody fromFile(String fileName) throws IOException {
            return new StrfBody(new ByteBufferKaitaiStream(fileName));
        }
        public StrfBody() {
            this(null, null, null);
        }

        public StrfBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StrfBody(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public StrfBody(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Avi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
        }

        public void _check() {
            _dirty = false;
        }
        private Avi _root;
        private KaitaiStruct.ReadWrite _parent;
        public Avi _root() { return _root; }
        public void set_root(Avi _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Stream header (one header per stream), defined as AVISTREAMHEADER structure
     * @see <a href="https://learn.microsoft.com/en-us/previous-versions/ms779638(v=vs.85)">Source</a>
     */
    public static class StrhBody extends KaitaiStruct.ReadWrite {
        public static StrhBody fromFile(String fileName) throws IOException {
            return new StrhBody(new ByteBufferKaitaiStream(fileName));
        }
        public StrhBody() {
            this(null, null, null);
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
        }
        public void _read() {
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
            this.frame._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.frame._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(((Number) (this.fccType.id())).longValue());
            this._io.writeU4le(((Number) (this.fccHandler.id())).longValue());
            this._io.writeU4le(this.flags);
            this._io.writeU2le(this.priority);
            this._io.writeU2le(this.language);
            this._io.writeU4le(this.initialFrames);
            this._io.writeU4le(this.scale);
            this._io.writeU4le(this.rate);
            this._io.writeU4le(this.start);
            this._io.writeU4le(this.length);
            this._io.writeU4le(this.suggestedBufferSize);
            this._io.writeU4le(this.quality);
            this._io.writeU4le(this.sampleSize);
            this.frame._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.frame._root(), _root()))
                throw new ConsistencyError("frame", _root(), this.frame._root());
            if (!Objects.equals(this.frame._parent(), this))
                throw new ConsistencyError("frame", this, this.frame._parent());
            _dirty = false;
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
        public void setFccType(StreamType _v) { _dirty = true; fccType = _v; }

        /**
         * Type of preferred data handler for the stream (specifies codec for audio / video streams)
         */
        public HandlerType fccHandler() { return fccHandler; }
        public void setFccHandler(HandlerType _v) { _dirty = true; fccHandler = _v; }
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public int priority() { return priority; }
        public void setPriority(int _v) { _dirty = true; priority = _v; }
        public int language() { return language; }
        public void setLanguage(int _v) { _dirty = true; language = _v; }
        public long initialFrames() { return initialFrames; }
        public void setInitialFrames(long _v) { _dirty = true; initialFrames = _v; }
        public long scale() { return scale; }
        public void setScale(long _v) { _dirty = true; scale = _v; }
        public long rate() { return rate; }
        public void setRate(long _v) { _dirty = true; rate = _v; }
        public long start() { return start; }
        public void setStart(long _v) { _dirty = true; start = _v; }
        public long length() { return length; }
        public void setLength(long _v) { _dirty = true; length = _v; }
        public long suggestedBufferSize() { return suggestedBufferSize; }
        public void setSuggestedBufferSize(long _v) { _dirty = true; suggestedBufferSize = _v; }
        public long quality() { return quality; }
        public void setQuality(long _v) { _dirty = true; quality = _v; }
        public long sampleSize() { return sampleSize; }
        public void setSampleSize(long _v) { _dirty = true; sampleSize = _v; }
        public Rect frame() { return frame; }
        public void setFrame(Rect _v) { _dirty = true; frame = _v; }
        public Avi _root() { return _root; }
        public void set_root(Avi _v) { _dirty = true; _root = _v; }
        public Avi.Block _parent() { return _parent; }
        public void set_parent(Avi.Block _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic1;
    private long fileSize;
    private byte[] magic2;
    private Blocks data;
    private Avi _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_data;
    public byte[] magic1() { return magic1; }
    public void setMagic1(byte[] _v) { _dirty = true; magic1 = _v; }
    public long fileSize() { return fileSize; }
    public void setFileSize(long _v) { _dirty = true; fileSize = _v; }
    public byte[] magic2() { return magic2; }
    public void setMagic2(byte[] _v) { _dirty = true; magic2 = _v; }
    public Blocks data() { return data; }
    public void setData(Blocks _v) { _dirty = true; data = _v; }
    public Avi _root() { return _root; }
    public void set_root(Avi _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_data() { return _raw_data; }
    public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
}
