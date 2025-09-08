// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.util.List;


/**
 * glTF is a format for distribution of 3D models optimized for being used in software
 * @see <a href="https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout">Source</a>
 */
public class GltfBinary extends KaitaiStruct {
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

    public GltfBinary(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GltfBinary(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GltfBinary(KaitaiStream _io, KaitaiStruct _parent, GltfBinary _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
        this.chunks = new ArrayList<Chunk>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.chunks.add(new Chunk(this._io, this, _root));
                i++;
            }
        }
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class Bin extends KaitaiStruct {
        public static Bin fromFile(String fileName) throws IOException {
            return new Bin(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.data = this._io.readBytesFull();
        }

        public void _fetchInstances() {
        }
        private byte[] data;
        private GltfBinary _root;
        private GltfBinary.Chunk _parent;
        public byte[] data() { return data; }
        public GltfBinary _root() { return _root; }
        public GltfBinary.Chunk _parent() { return _parent; }
    }
    public static class Chunk extends KaitaiStruct {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenData = this._io.readU4le();
            this.type = GltfBinary.ChunkType.byId(this._io.readU4le());
            {
                ChunkType on = type();
                if (on != null) {
                    switch (type()) {
                    case BIN: {
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Bin(_io_data, this, _root);
                        break;
                    }
                    case JSON: {
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Json(_io_data, this, _root);
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
        private long lenData;
        private ChunkType type;
        private Object data;
        private GltfBinary _root;
        private GltfBinary _parent;
        public long lenData() { return lenData; }
        public ChunkType type() { return type; }
        public Object data() { return data; }
        public GltfBinary _root() { return _root; }
        public GltfBinary _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 103, 108, 84, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 103, 108, 84, 70 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.version = this._io.readU4le();
            this.length = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private byte[] magic;
        private long version;
        private long length;
        private GltfBinary _root;
        private GltfBinary _parent;
        public byte[] magic() { return magic; }

        /**
         * Indicates the version of the Binary glTF container format.
         * For this specification, should be set to 2.
         */
        public long version() { return version; }

        /**
         * Total length of the Binary glTF, including Header and all Chunks, in bytes.
         */
        public long length() { return length; }
        public GltfBinary _root() { return _root; }
        public GltfBinary _parent() { return _parent; }
    }
    public static class Json extends KaitaiStruct {
        public static Json fromFile(String fileName) throws IOException {
            return new Json(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.data = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String data;
        private GltfBinary _root;
        private GltfBinary.Chunk _parent;

        /**
         * This is where GLB deviates from being an elegant format.
         * To parse the rest of the file, you have to parse the JSON first.
         */
        public String data() { return data; }
        public GltfBinary _root() { return _root; }
        public GltfBinary.Chunk _parent() { return _parent; }
    }
    private Header header;
    private List<Chunk> chunks;
    private GltfBinary _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public List<Chunk> chunks() { return chunks; }
    public GltfBinary _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
