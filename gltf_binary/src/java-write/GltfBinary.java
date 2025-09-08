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
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * glTF is a format for distribution of 3D models optimized for being used in software
 * @see <a href="https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout">Source</a>
 */
public class GltfBinary extends KaitaiStruct.ReadWrite {
    public static GltfBinary fromFile(String fileName) throws IOException {
        return new GltfBinary(new ByteBufferKaitaiStream(fileName));
    }

    public enum ChunkType {
        BIN(5130562),
        JSON(1313821514);

        private final long id;
        ChunkType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ChunkType> byId = new HashMap<Long, ChunkType>(2);
        static {
            for (ChunkType e : ChunkType.values())
                byId.put(e.id(), e);
        }
        public static ChunkType byId(long id) { return byId.get(id); }
    }
    public GltfBinary() {
        this(null, null, null);
    }

    public GltfBinary(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GltfBinary(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public GltfBinary(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GltfBinary _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new Header(this._io, this, _root);
        this.header._read();
        this.chunks = new ArrayList<Chunk>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Chunk _t_chunks = new Chunk(this._io, this, _root);
                try {
                    _t_chunks._read();
                } finally {
                    this.chunks.add(_t_chunks);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        for (int i = 0; i < this.chunks.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("chunks", 0, this._io.size() - this._io.pos());
            this.chunks.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("chunks", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        for (int i = 0; i < this.chunks.size(); i++) {
            if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("chunks", _root(), this.chunks.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("chunks", this, this.chunks.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Bin extends KaitaiStruct.ReadWrite {
        public static Bin fromFile(String fileName) throws IOException {
            return new Bin(new ByteBufferKaitaiStream(fileName));
        }
        public Bin() {
            this(null, null, null);
        }

        public Bin(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bin(KaitaiStream _io, GltfBinary.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Bin(KaitaiStream _io, GltfBinary.Chunk _parent, GltfBinary _root) {
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
        private GltfBinary _root;
        private GltfBinary.Chunk _parent;
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public GltfBinary _root() { return _root; }
        public void set_root(GltfBinary _v) { _dirty = true; _root = _v; }
        public GltfBinary.Chunk _parent() { return _parent; }
        public void set_parent(GltfBinary.Chunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Chunk extends KaitaiStruct.ReadWrite {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
        }
        public Chunk() {
            this(null, null, null);
        }

        public Chunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunk(KaitaiStream _io, GltfBinary _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, GltfBinary _parent, GltfBinary _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenData = this._io.readU4le();
            this.type = GltfBinary.ChunkType.byId(this._io.readU4le());
            {
                ChunkType on = type();
                if (on != null) {
                    switch (type()) {
                    case BIN: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Bin(_io__raw_data, this, _root);
                        ((Bin) (this.data))._read();
                        break;
                    }
                    case JSON: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Json(_io__raw_data, this, _root);
                        ((Json) (this.data))._read();
                        break;
                    }
                    default: {
                        this.data = this._io.readBytes(lenData());
                        break;
                    }
                    }
                } else {
                    this.data = this._io.readBytes(lenData());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                ChunkType on = type();
                if (on != null) {
                    switch (type()) {
                    case BIN: {
                        ((Bin) (this.data))._fetchInstances();
                        break;
                    }
                    case JSON: {
                        ((Json) (this.data))._fetchInstances();
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
            this._io.writeU4le(this.lenData);
            this._io.writeU4le(((Number) (this.type.id())).longValue());
            {
                ChunkType on = type();
                if (on != null) {
                    switch (type()) {
                    case BIN: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Bin) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case JSON: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Json) (this.data))._write_Seq(_io__raw_data);
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
                ChunkType on = type();
                if (on != null) {
                    switch (type()) {
                    case BIN: {
                        if (!Objects.equals(((GltfBinary.Bin) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((GltfBinary.Bin) (this.data))._root());
                        if (!Objects.equals(((GltfBinary.Bin) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((GltfBinary.Bin) (this.data))._parent());
                        break;
                    }
                    case JSON: {
                        if (!Objects.equals(((GltfBinary.Json) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((GltfBinary.Json) (this.data))._root());
                        if (!Objects.equals(((GltfBinary.Json) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((GltfBinary.Json) (this.data))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.data)).length != lenData())
                            throw new ConsistencyError("data", lenData(), ((byte[]) (this.data)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.data)).length != lenData())
                        throw new ConsistencyError("data", lenData(), ((byte[]) (this.data)).length);
                }
            }
            _dirty = false;
        }
        private long lenData;
        private ChunkType type;
        private Object data;
        private GltfBinary _root;
        private GltfBinary _parent;
        private byte[] _raw_data;
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public ChunkType type() { return type; }
        public void setType(ChunkType _v) { _dirty = true; type = _v; }
        public Object data() { return data; }
        public void setData(Object _v) { _dirty = true; data = _v; }
        public GltfBinary _root() { return _root; }
        public void set_root(GltfBinary _v) { _dirty = true; _root = _v; }
        public GltfBinary _parent() { return _parent; }
        public void set_parent(GltfBinary _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_data() { return _raw_data; }
        public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, GltfBinary _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, GltfBinary _parent, GltfBinary _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 103, 108, 84, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 103, 108, 84, 70 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.version = this._io.readU4le();
            this.length = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.version);
            this._io.writeU4le(this.length);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 103, 108, 84, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 103, 108, 84, 70 }, this.magic, null, "/types/header/seq/0");
            }
            _dirty = false;
        }
        private byte[] magic;
        private long version;
        private long length;
        private GltfBinary _root;
        private GltfBinary _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * Indicates the version of the Binary glTF container format.
         * For this specification, should be set to 2.
         */
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }

        /**
         * Total length of the Binary glTF, including Header and all Chunks, in bytes.
         */
        public long length() { return length; }
        public void setLength(long _v) { _dirty = true; length = _v; }
        public GltfBinary _root() { return _root; }
        public void set_root(GltfBinary _v) { _dirty = true; _root = _v; }
        public GltfBinary _parent() { return _parent; }
        public void set_parent(GltfBinary _v) { _dirty = true; _parent = _v; }
    }
    public static class Json extends KaitaiStruct.ReadWrite {
        public static Json fromFile(String fileName) throws IOException {
            return new Json(new ByteBufferKaitaiStream(fileName));
        }
        public Json() {
            this(null, null, null);
        }

        public Json(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Json(KaitaiStream _io, GltfBinary.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Json(KaitaiStream _io, GltfBinary.Chunk _parent, GltfBinary _root) {
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
        private GltfBinary _root;
        private GltfBinary.Chunk _parent;

        /**
         * This is where GLB deviates from being an elegant format.
         * To parse the rest of the file, you have to parse the JSON first.
         */
        public String data() { return data; }
        public void setData(String _v) { _dirty = true; data = _v; }
        public GltfBinary _root() { return _root; }
        public void set_root(GltfBinary _v) { _dirty = true; _root = _v; }
        public GltfBinary.Chunk _parent() { return _parent; }
        public void set_parent(GltfBinary.Chunk _v) { _dirty = true; _parent = _v; }
    }
    private Header header;
    private List<Chunk> chunks;
    private GltfBinary _root;
    private KaitaiStruct.ReadWrite _parent;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public List<Chunk> chunks() { return chunks; }
    public void setChunks(List<Chunk> _v) { _dirty = true; chunks = _v; }
    public GltfBinary _root() { return _root; }
    public void set_root(GltfBinary _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
