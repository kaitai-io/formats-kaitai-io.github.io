// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;


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
public class Tsm extends KaitaiStruct {
    public static Tsm fromFile(String fileName) throws IOException {
        return new Tsm(new ByteBufferKaitaiStream(fileName));
    }

    public Tsm(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Tsm(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Tsm(KaitaiStream _io, KaitaiStruct _parent, Tsm _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { 22, -47, 22, -47 });
            this.version = this._io.readU1();
        }
        private byte[] magic;
        private int version;
        private Tsm _root;
        private Tsm _parent;
        public byte[] magic() { return magic; }
        public int version() { return version; }
        public Tsm _root() { return _root; }
        public Tsm _parent() { return _parent; }
    }
    public static class Index extends KaitaiStruct {
        public static Index fromFile(String fileName) throws IOException {
            return new Index(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.offset = this._io.readU8be();
        }
        public static class IndexHeader extends KaitaiStruct {
            public static IndexHeader fromFile(String fileName) throws IOException {
                return new IndexHeader(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.keyLen = this._io.readU2be();
                this.key = new String(this._io.readBytes(keyLen()), Charset.forName("UTF-8"));
                this.type = this._io.readU1();
                this.entryCount = this._io.readU2be();
                indexEntries = new ArrayList<IndexEntry>((int) (entryCount()));
                for (int i = 0; i < entryCount(); i++) {
                    this.indexEntries.add(new IndexEntry(this._io, this, _root));
                }
            }
            public static class IndexEntry extends KaitaiStruct {
                public static IndexEntry fromFile(String fileName) throws IOException {
                    return new IndexEntry(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.minTime = this._io.readU8be();
                    this.maxTime = this._io.readU8be();
                    this.blockOffset = this._io.readU8be();
                    this.blockSize = this._io.readU4be();
                }
                public static class BlockEntry extends KaitaiStruct {
                    public static BlockEntry fromFile(String fileName) throws IOException {
                        return new BlockEntry(new ByteBufferKaitaiStream(fileName));
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
                        _read();
                    }
                    private void _read() {
                        this.crc32 = this._io.readU4be();
                        this.data = this._io.readBytes((_parent().blockSize() - 4));
                    }
                    private long crc32;
                    private byte[] data;
                    private Tsm _root;
                    private Tsm.Index.IndexHeader.IndexEntry _parent;
                    public long crc32() { return crc32; }
                    public byte[] data() { return data; }
                    public Tsm _root() { return _root; }
                    public Tsm.Index.IndexHeader.IndexEntry _parent() { return _parent; }
                }
                private BlockEntry block;
                public BlockEntry block() {
                    if (this.block != null)
                        return this.block;
                    KaitaiStream io = _root._io();
                    long _pos = io.pos();
                    io.seek(blockOffset());
                    this.block = new BlockEntry(io, this, _root);
                    io.seek(_pos);
                    return this.block;
                }
                private long minTime;
                private long maxTime;
                private long blockOffset;
                private long blockSize;
                private Tsm _root;
                private Tsm.Index.IndexHeader _parent;
                public long minTime() { return minTime; }
                public long maxTime() { return maxTime; }
                public long blockOffset() { return blockOffset; }
                public long blockSize() { return blockSize; }
                public Tsm _root() { return _root; }
                public Tsm.Index.IndexHeader _parent() { return _parent; }
            }
            private int keyLen;
            private String key;
            private int type;
            private int entryCount;
            private ArrayList<IndexEntry> indexEntries;
            private Tsm _root;
            private Tsm.Index _parent;
            public int keyLen() { return keyLen; }
            public String key() { return key; }
            public int type() { return type; }
            public int entryCount() { return entryCount; }
            public ArrayList<IndexEntry> indexEntries() { return indexEntries; }
            public Tsm _root() { return _root; }
            public Tsm.Index _parent() { return _parent; }
        }
        private ArrayList<IndexHeader> entries;
        public ArrayList<IndexHeader> entries() {
            if (this.entries != null)
                return this.entries;
            long _pos = this._io.pos();
            this._io.seek(offset());
            this.entries = new ArrayList<IndexHeader>();
            {
                IndexHeader _it;
                int i = 0;
                do {
                    _it = new IndexHeader(this._io, this, _root);
                    this.entries.add(_it);
                    i++;
                } while (!(_io().pos() == (_io().size() - 8)));
            }
            this._io.seek(_pos);
            return this.entries;
        }
        private long offset;
        private Tsm _root;
        private Tsm _parent;
        public long offset() { return offset; }
        public Tsm _root() { return _root; }
        public Tsm _parent() { return _parent; }
    }
    private Index index;
    public Index index() {
        if (this.index != null)
            return this.index;
        long _pos = this._io.pos();
        this._io.seek((_io().size() - 8));
        this.index = new Index(this._io, this, _root);
        this._io.seek(_pos);
        return this.index;
    }
    private Header header;
    private Tsm _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public Tsm _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
