// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.List;


/**
 * InfluxDB is a scalable database optimized for storage of time
 * series, real-time application metrics, operations monitoring events,
 * etc, written in Go.
 * 
 * Data is stored in .tsm files, which are kept pretty simple
 * conceptually. Each .tsm file contains a header and footer, which
 * stores offset to an index. Index is used to find a data block for a
 * requested time boundary.
 */
public class Tsm extends KaitaiStruct.ReadWrite {
    public static Tsm fromFile(String fileName) throws IOException {
        return new Tsm(new ByteBufferKaitaiStream(fileName));
    }
    public Tsm() {
        this(null, null, null);
    }

    public Tsm(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Tsm(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Tsm(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Tsm _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new Header(this._io, this, _root);
        this.header._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        index();
        if (this.index != null) {
            this.index._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteIndex = _enabledIndex;
        this.header._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (_enabledIndex) {
            if (!Objects.equals(this.index._root(), _root()))
                throw new ConsistencyError("index", _root(), this.index._root());
            if (!Objects.equals(this.index._parent(), this))
                throw new ConsistencyError("index", this, this.index._parent());
        }
        _dirty = false;
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

        public Header(KaitaiStream _io, Tsm _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Tsm _parent, Tsm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 22, -47, 22, -47 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 22, -47, 22, -47 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.version = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU1(this.version);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 22, -47, 22, -47 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 22, -47, 22, -47 }, this.magic, null, "/types/header/seq/0");
            }
            _dirty = false;
        }
        private byte[] magic;
        private int version;
        private Tsm _root;
        private Tsm _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public Tsm _root() { return _root; }
        public void set_root(Tsm _v) { _dirty = true; _root = _v; }
        public Tsm _parent() { return _parent; }
        public void set_parent(Tsm _v) { _dirty = true; _parent = _v; }
    }
    public static class Index extends KaitaiStruct.ReadWrite {
        public static Index fromFile(String fileName) throws IOException {
            return new Index(new ByteBufferKaitaiStream(fileName));
        }
        public Index() {
            this(null, null, null);
        }

        public Index(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Index(KaitaiStream _io, Tsm _parent) {
            this(_io, _parent, null);
        }

        public Index(KaitaiStream _io, Tsm _parent, Tsm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.offset = this._io.readU8be();
            _dirty = false;
        }

        public void _fetchInstances() {
            entries();
            if (this.entries != null) {
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteEntries = _enabledEntries;
            this._io.writeU8be(this.offset);
        }

        public void _check() {
            if (_enabledEntries) {
                if (this.entries.size() == 0)
                    throw new ConsistencyError("entries", 0, this.entries.size());
                for (int i = 0; i < this.entries.size(); i++) {
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                }
            }
            _dirty = false;
        }
        public static class IndexHeader extends KaitaiStruct.ReadWrite {
            public static IndexHeader fromFile(String fileName) throws IOException {
                return new IndexHeader(new ByteBufferKaitaiStream(fileName));
            }
            public IndexHeader() {
                this(null, null, null);
            }

            public IndexHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public IndexHeader(KaitaiStream _io, Tsm.Index _parent) {
                this(_io, _parent, null);
            }

            public IndexHeader(KaitaiStream _io, Tsm.Index _parent, Tsm _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.keyLen = this._io.readU2be();
                this.key = new String(this._io.readBytes(keyLen()), StandardCharsets.UTF_8);
                this.type = this._io.readU1();
                this.entryCount = this._io.readU2be();
                this.indexEntries = new ArrayList<IndexEntry>();
                for (int i = 0; i < entryCount(); i++) {
                    IndexEntry _t_indexEntries = new IndexEntry(this._io, this, _root);
                    try {
                        _t_indexEntries._read();
                    } finally {
                        this.indexEntries.add(_t_indexEntries);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.indexEntries.size(); i++) {
                    this.indexEntries.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.keyLen);
                this._io.writeBytes((this.key).getBytes(Charset.forName("UTF-8")));
                this._io.writeU1(this.type);
                this._io.writeU2be(this.entryCount);
                for (int i = 0; i < this.indexEntries.size(); i++) {
                    this.indexEntries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if ((this.key).getBytes(Charset.forName("UTF-8")).length != keyLen())
                    throw new ConsistencyError("key", keyLen(), (this.key).getBytes(Charset.forName("UTF-8")).length);
                if (this.indexEntries.size() != entryCount())
                    throw new ConsistencyError("index_entries", entryCount(), this.indexEntries.size());
                for (int i = 0; i < this.indexEntries.size(); i++) {
                    if (!Objects.equals(this.indexEntries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("index_entries", _root(), this.indexEntries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.indexEntries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("index_entries", this, this.indexEntries.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class IndexEntry extends KaitaiStruct.ReadWrite {
                public static IndexEntry fromFile(String fileName) throws IOException {
                    return new IndexEntry(new ByteBufferKaitaiStream(fileName));
                }
                public IndexEntry() {
                    this(null, null, null);
                }

                public IndexEntry(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public IndexEntry(KaitaiStream _io, Tsm.Index.IndexHeader _parent) {
                    this(_io, _parent, null);
                }

                public IndexEntry(KaitaiStream _io, Tsm.Index.IndexHeader _parent, Tsm _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.minTime = this._io.readU8be();
                    this.maxTime = this._io.readU8be();
                    this.blockOffset = this._io.readU8be();
                    this.blockSize = this._io.readU4be();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    block();
                    if (this.block != null) {
                        this.block._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    _shouldWriteBlock = _enabledBlock;
                    this._io.writeU8be(this.minTime);
                    this._io.writeU8be(this.maxTime);
                    this._io.writeU8be(this.blockOffset);
                    this._io.writeU4be(this.blockSize);
                }

                public void _check() {
                    if (_enabledBlock) {
                        if (!Objects.equals(this.block._root(), _root()))
                            throw new ConsistencyError("block", _root(), this.block._root());
                        if (!Objects.equals(this.block._parent(), this))
                            throw new ConsistencyError("block", this, this.block._parent());
                    }
                    _dirty = false;
                }
                public static class BlockEntry extends KaitaiStruct.ReadWrite {
                    public static BlockEntry fromFile(String fileName) throws IOException {
                        return new BlockEntry(new ByteBufferKaitaiStream(fileName));
                    }
                    public BlockEntry() {
                        this(null, null, null);
                    }

                    public BlockEntry(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public BlockEntry(KaitaiStream _io, Tsm.Index.IndexHeader.IndexEntry _parent) {
                        this(_io, _parent, null);
                    }

                    public BlockEntry(KaitaiStream _io, Tsm.Index.IndexHeader.IndexEntry _parent, Tsm _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.crc32 = this._io.readU4be();
                        this.data = this._io.readBytes(_parent().blockSize() - 4);
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeU4be(this.crc32);
                        this._io.writeBytes(this.data);
                    }

                    public void _check() {
                        if (this.data.length != _parent().blockSize() - 4)
                            throw new ConsistencyError("data", _parent().blockSize() - 4, this.data.length);
                        _dirty = false;
                    }
                    private long crc32;
                    private byte[] data;
                    private Tsm _root;
                    private Tsm.Index.IndexHeader.IndexEntry _parent;
                    public long crc32() { return crc32; }
                    public void setCrc32(long _v) { _dirty = true; crc32 = _v; }
                    public byte[] data() { return data; }
                    public void setData(byte[] _v) { _dirty = true; data = _v; }
                    public Tsm _root() { return _root; }
                    public void set_root(Tsm _v) { _dirty = true; _root = _v; }
                    public Tsm.Index.IndexHeader.IndexEntry _parent() { return _parent; }
                    public void set_parent(Tsm.Index.IndexHeader.IndexEntry _v) { _dirty = true; _parent = _v; }
                }
                private BlockEntry block;
                private boolean _shouldWriteBlock = false;
                private boolean _enabledBlock = true;
                public BlockEntry block() {
                    if (_shouldWriteBlock)
                        _writeBlock();
                    if (this.block != null)
                        return this.block;
                    if (!_enabledBlock)
                        return null;
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek(blockOffset());
                    this.block = new BlockEntry(io, this, _root);
                    this.block._read();
                    io.seek(_pos);
                    return this.block;
                }
                public void setBlock(BlockEntry _v) { _dirty = true; block = _v; }
                public void setBlock_Enabled(boolean _v) { _dirty = true; _enabledBlock = _v; }

                private void _writeBlock() {
                    _shouldWriteBlock = false;
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek(blockOffset());
                    this.block._write_Seq(io);
                    io.seek(_pos);
                }
                private long minTime;
                private long maxTime;
                private long blockOffset;
                private long blockSize;
                private Tsm _root;
                private Tsm.Index.IndexHeader _parent;
                public long minTime() { return minTime; }
                public void setMinTime(long _v) { _dirty = true; minTime = _v; }
                public long maxTime() { return maxTime; }
                public void setMaxTime(long _v) { _dirty = true; maxTime = _v; }
                public long blockOffset() { return blockOffset; }
                public void setBlockOffset(long _v) { _dirty = true; blockOffset = _v; }
                public long blockSize() { return blockSize; }
                public void setBlockSize(long _v) { _dirty = true; blockSize = _v; }
                public Tsm _root() { return _root; }
                public void set_root(Tsm _v) { _dirty = true; _root = _v; }
                public Tsm.Index.IndexHeader _parent() { return _parent; }
                public void set_parent(Tsm.Index.IndexHeader _v) { _dirty = true; _parent = _v; }
            }
            private int keyLen;
            private String key;
            private int type;
            private int entryCount;
            private List<IndexEntry> indexEntries;
            private Tsm _root;
            private Tsm.Index _parent;
            public int keyLen() { return keyLen; }
            public void setKeyLen(int _v) { _dirty = true; keyLen = _v; }
            public String key() { return key; }
            public void setKey(String _v) { _dirty = true; key = _v; }
            public int type() { return type; }
            public void setType(int _v) { _dirty = true; type = _v; }
            public int entryCount() { return entryCount; }
            public void setEntryCount(int _v) { _dirty = true; entryCount = _v; }
            public List<IndexEntry> indexEntries() { return indexEntries; }
            public void setIndexEntries(List<IndexEntry> _v) { _dirty = true; indexEntries = _v; }
            public Tsm _root() { return _root; }
            public void set_root(Tsm _v) { _dirty = true; _root = _v; }
            public Tsm.Index _parent() { return _parent; }
            public void set_parent(Tsm.Index _v) { _dirty = true; _parent = _v; }
        }
        private List<IndexHeader> entries;
        private boolean _shouldWriteEntries = false;
        private boolean _enabledEntries = true;
        public List<IndexHeader> entries() {
            if (_shouldWriteEntries)
                _writeEntries();
            if (this.entries != null)
                return this.entries;
            if (!_enabledEntries)
                return null;
            long _pos = this._io.pos();
            this._io.seek(offset());
            this.entries = new ArrayList<IndexHeader>();
            {
                IndexHeader _it;
                int i = 0;
                do {
                    IndexHeader _t_entries = new IndexHeader(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        _it = _t_entries;
                        this.entries.add(_it);
                    }
                    i++;
                } while (!(_io().pos() == _io().size() - 8));
            }
            this._io.seek(_pos);
            return this.entries;
        }
        public void setEntries(List<IndexHeader> _v) { _dirty = true; entries = _v; }
        public void setEntries_Enabled(boolean _v) { _dirty = true; _enabledEntries = _v; }

        private void _writeEntries() {
            _shouldWriteEntries = false;
            long _pos = this._io.pos();
            this._io.seek(offset());
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                {
                    IndexHeader _it = this.entries.get(((Number) (i)).intValue());
                    if ((_io().pos() == _io().size() - 8) != (i == this.entries.size() - 1))
                        throw new ConsistencyError("entries", i == this.entries.size() - 1, _io().pos() == _io().size() - 8);
                }
            }
            this._io.seek(_pos);
        }
        private long offset;
        private Tsm _root;
        private Tsm _parent;
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }
        public Tsm _root() { return _root; }
        public void set_root(Tsm _v) { _dirty = true; _root = _v; }
        public Tsm _parent() { return _parent; }
        public void set_parent(Tsm _v) { _dirty = true; _parent = _v; }
    }
    private Index index;
    private boolean _shouldWriteIndex = false;
    private boolean _enabledIndex = true;
    public Index index() {
        if (_shouldWriteIndex)
            _writeIndex();
        if (this.index != null)
            return this.index;
        if (!_enabledIndex)
            return null;
        long _pos = this._io.pos();
        this._io.seek(_io().size() - 8);
        this.index = new Index(this._io, this, _root);
        this.index._read();
        this._io.seek(_pos);
        return this.index;
    }
    public void setIndex(Index _v) { _dirty = true; index = _v; }
    public void setIndex_Enabled(boolean _v) { _dirty = true; _enabledIndex = _v; }

    private void _writeIndex() {
        _shouldWriteIndex = false;
        long _pos = this._io.pos();
        this._io.seek(_io().size() - 8);
        this.index._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private Header header;
    private Tsm _root;
    private KaitaiStruct.ReadWrite _parent;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public Tsm _root() { return _root; }
    public void set_root(Tsm _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
