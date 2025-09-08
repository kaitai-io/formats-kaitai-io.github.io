// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * @see <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx">Source</a>
 */
public class HeapsPak extends KaitaiStruct.ReadWrite {
    public static HeapsPak fromFile(String fileName) throws IOException {
        return new HeapsPak(new ByteBufferKaitaiStream(fileName));
    }
    public HeapsPak() {
        this(null, null, null);
    }

    public HeapsPak(KaitaiStream _io) {
        this(_io, null, null);
    }

    public HeapsPak(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public HeapsPak(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, HeapsPak _root) {
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
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
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

        public Header(KaitaiStream _io, HeapsPak _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, HeapsPak _parent, HeapsPak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic1 = this._io.readBytes(3);
            if (!(Arrays.equals(this.magic1, new byte[] { 80, 65, 75 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 65, 75 }, this.magic1, this._io, "/types/header/seq/0");
            }
            this.version = this._io.readU1();
            this.lenHeader = this._io.readU4le();
            this.lenData = this._io.readU4le();
            this._raw_rootEntry = this._io.readBytes(lenHeader() - 16);
            KaitaiStream _io__raw_rootEntry = new ByteBufferKaitaiStream(this._raw_rootEntry);
            this.rootEntry = new Entry(_io__raw_rootEntry, this, _root);
            this.rootEntry._read();
            this.magic2 = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic2, new byte[] { 68, 65, 84, 65 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 68, 65, 84, 65 }, this.magic2, this._io, "/types/header/seq/5");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.rootEntry._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic1);
            this._io.writeU1(this.version);
            this._io.writeU4le(this.lenHeader);
            this._io.writeU4le(this.lenData);
            final KaitaiStream _io__raw_rootEntry = new ByteBufferKaitaiStream(lenHeader() - 16);
            this._io.addChildStream(_io__raw_rootEntry);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenHeader() - 16));
                final Header _this = this;
                _io__raw_rootEntry.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_rootEntry = _io__raw_rootEntry.toByteArray();
                        if (_this._raw_rootEntry.length != lenHeader() - 16)
                            throw new ConsistencyError("raw(root_entry)", lenHeader() - 16, _this._raw_rootEntry.length);
                        parent.writeBytes(_this._raw_rootEntry);
                    }
                });
            }
            this.rootEntry._write_Seq(_io__raw_rootEntry);
            this._io.writeBytes(this.magic2);
        }

        public void _check() {
            if (this.magic1.length != 3)
                throw new ConsistencyError("magic1", 3, this.magic1.length);
            if (!(Arrays.equals(this.magic1, new byte[] { 80, 65, 75 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 65, 75 }, this.magic1, null, "/types/header/seq/0");
            }
            if (!Objects.equals(this.rootEntry._root(), _root()))
                throw new ConsistencyError("root_entry", _root(), this.rootEntry._root());
            if (!Objects.equals(this.rootEntry._parent(), this))
                throw new ConsistencyError("root_entry", this, this.rootEntry._parent());
            if (this.magic2.length != 4)
                throw new ConsistencyError("magic2", 4, this.magic2.length);
            if (!(Arrays.equals(this.magic2, new byte[] { 68, 65, 84, 65 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 68, 65, 84, 65 }, this.magic2, null, "/types/header/seq/5");
            }
            _dirty = false;
        }
        public static class Dir extends KaitaiStruct.ReadWrite {
            public static Dir fromFile(String fileName) throws IOException {
                return new Dir(new ByteBufferKaitaiStream(fileName));
            }
            public Dir() {
                this(null, null, null);
            }

            public Dir(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Dir(KaitaiStream _io, HeapsPak.Header.Entry _parent) {
                this(_io, _parent, null);
            }

            public Dir(KaitaiStream _io, HeapsPak.Header.Entry _parent, HeapsPak _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.numEntries = this._io.readU4le();
                this.entries = new ArrayList<Entry>();
                for (int i = 0; i < numEntries(); i++) {
                    Entry _t_entries = new Entry(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
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
                this._io.writeU4le(this.numEntries);
                for (int i = 0; i < this.entries.size(); i++) {
                    this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.entries.size() != numEntries())
                    throw new ConsistencyError("entries", numEntries(), this.entries.size());
                for (int i = 0; i < this.entries.size(); i++) {
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private long numEntries;
            private List<Entry> entries;
            private HeapsPak _root;
            private HeapsPak.Header.Entry _parent;
            public long numEntries() { return numEntries; }
            public void setNumEntries(long _v) { _dirty = true; numEntries = _v; }
            public List<Entry> entries() { return entries; }
            public void setEntries(List<Entry> _v) { _dirty = true; entries = _v; }
            public HeapsPak _root() { return _root; }
            public void set_root(HeapsPak _v) { _dirty = true; _root = _v; }
            public HeapsPak.Header.Entry _parent() { return _parent; }
            public void set_parent(HeapsPak.Header.Entry _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx">Source</a>
         */
        public static class Entry extends KaitaiStruct.ReadWrite {
            public static Entry fromFile(String fileName) throws IOException {
                return new Entry(new ByteBufferKaitaiStream(fileName));
            }
            public Entry() {
                this(null, null, null);
            }

            public Entry(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Entry(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                this(_io, _parent, null);
            }

            public Entry(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, HeapsPak _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.lenName = this._io.readU1();
                this.name = new String(this._io.readBytes(lenName()), StandardCharsets.UTF_8);
                this.flags = new Flags(this._io, this, _root);
                this.flags._read();
                {
                    boolean on = flags().isDir();
                    if (on == false) {
                        this.body = new File(this._io, this, _root);
                        ((File) (this.body))._read();
                    }
                    else if (on == true) {
                        this.body = new Dir(this._io, this, _root);
                        ((Dir) (this.body))._read();
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                this.flags._fetchInstances();
                {
                    boolean on = flags().isDir();
                    if (on == false) {
                        ((File) (this.body))._fetchInstances();
                    }
                    else if (on == true) {
                        ((Dir) (this.body))._fetchInstances();
                    }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.lenName);
                this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                this.flags._write_Seq(this._io);
                {
                    boolean on = flags().isDir();
                    if (on == false) {
                        ((File) (this.body))._write_Seq(this._io);
                    }
                    else if (on == true) {
                        ((Dir) (this.body))._write_Seq(this._io);
                    }
                }
            }

            public void _check() {
                if ((this.name).getBytes(Charset.forName("UTF-8")).length != lenName())
                    throw new ConsistencyError("name", lenName(), (this.name).getBytes(Charset.forName("UTF-8")).length);
                if (!Objects.equals(this.flags._root(), _root()))
                    throw new ConsistencyError("flags", _root(), this.flags._root());
                if (!Objects.equals(this.flags._parent(), this))
                    throw new ConsistencyError("flags", this, this.flags._parent());
                {
                    boolean on = flags().isDir();
                    if (on == false) {
                        if (!Objects.equals(((HeapsPak.Header.File) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((HeapsPak.Header.File) (this.body))._root());
                        if (!Objects.equals(((HeapsPak.Header.File) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((HeapsPak.Header.File) (this.body))._parent());
                    }
                    else if (on == true) {
                        if (!Objects.equals(((HeapsPak.Header.Dir) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((HeapsPak.Header.Dir) (this.body))._root());
                        if (!Objects.equals(((HeapsPak.Header.Dir) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((HeapsPak.Header.Dir) (this.body))._parent());
                    }
                }
                _dirty = false;
            }
            public static class Flags extends KaitaiStruct.ReadWrite {
                public static Flags fromFile(String fileName) throws IOException {
                    return new Flags(new ByteBufferKaitaiStream(fileName));
                }
                public Flags() {
                    this(null, null, null);
                }

                public Flags(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Flags(KaitaiStream _io, HeapsPak.Header.Entry _parent) {
                    this(_io, _parent, null);
                }

                public Flags(KaitaiStream _io, HeapsPak.Header.Entry _parent, HeapsPak _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.unused = this._io.readBitsIntBe(7);
                    this.isDir = this._io.readBitsIntBe(1) != 0;
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBitsIntBe(7, this.unused);
                    this._io.writeBitsIntBe(1, (this.isDir ? 1 : 0));
                }

                public void _check() {
                    _dirty = false;
                }
                private long unused;
                private boolean isDir;
                private HeapsPak _root;
                private HeapsPak.Header.Entry _parent;
                public long unused() { return unused; }
                public void setUnused(long _v) { _dirty = true; unused = _v; }
                public boolean isDir() { return isDir; }
                public void setIsDir(boolean _v) { _dirty = true; isDir = _v; }
                public HeapsPak _root() { return _root; }
                public void set_root(HeapsPak _v) { _dirty = true; _root = _v; }
                public HeapsPak.Header.Entry _parent() { return _parent; }
                public void set_parent(HeapsPak.Header.Entry _v) { _dirty = true; _parent = _v; }
            }
            private int lenName;
            private String name;
            private Flags flags;
            private KaitaiStruct.ReadWrite body;
            private HeapsPak _root;
            private KaitaiStruct.ReadWrite _parent;
            public int lenName() { return lenName; }
            public void setLenName(int _v) { _dirty = true; lenName = _v; }
            public String name() { return name; }
            public void setName(String _v) { _dirty = true; name = _v; }
            public Flags flags() { return flags; }
            public void setFlags(Flags _v) { _dirty = true; flags = _v; }
            public KaitaiStruct.ReadWrite body() { return body; }
            public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
            public HeapsPak _root() { return _root; }
            public void set_root(HeapsPak _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }
        public static class File extends KaitaiStruct.ReadWrite {
            public static File fromFile(String fileName) throws IOException {
                return new File(new ByteBufferKaitaiStream(fileName));
            }
            public File() {
                this(null, null, null);
            }

            public File(KaitaiStream _io) {
                this(_io, null, null);
            }

            public File(KaitaiStream _io, HeapsPak.Header.Entry _parent) {
                this(_io, _parent, null);
            }

            public File(KaitaiStream _io, HeapsPak.Header.Entry _parent, HeapsPak _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.ofsData = this._io.readU4le();
                this.lenData = this._io.readU4le();
                this.checksum = this._io.readBytes(4);
                _dirty = false;
            }

            public void _fetchInstances() {
                data();
                if (this.data != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteData = _enabledData;
                this._io.writeU4le(this.ofsData);
                this._io.writeU4le(this.lenData);
                this._io.writeBytes(this.checksum);
            }

            public void _check() {
                if (this.checksum.length != 4)
                    throw new ConsistencyError("checksum", 4, this.checksum.length);
                if (_enabledData) {
                    if (this.data.length != lenData())
                        throw new ConsistencyError("data", lenData(), this.data.length);
                }
                _dirty = false;
            }
            private byte[] data;
            private boolean _shouldWriteData = false;
            private boolean _enabledData = true;
            public byte[] data() {
                if (_shouldWriteData)
                    _writeData();
                if (this.data != null)
                    return this.data;
                if (!_enabledData)
                    return null;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(_root().header().lenHeader() + ofsData());
                this.data = io.readBytes(lenData());
                io.seek(_pos);
                return this.data;
            }
            public void setData(byte[] _v) { _dirty = true; data = _v; }
            public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

            private void _writeData() {
                _shouldWriteData = false;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(_root().header().lenHeader() + ofsData());
                io.writeBytes(this.data);
                io.seek(_pos);
            }
            private long ofsData;
            private long lenData;
            private byte[] checksum;
            private HeapsPak _root;
            private HeapsPak.Header.Entry _parent;
            public long ofsData() { return ofsData; }
            public void setOfsData(long _v) { _dirty = true; ofsData = _v; }
            public long lenData() { return lenData; }
            public void setLenData(long _v) { _dirty = true; lenData = _v; }
            public byte[] checksum() { return checksum; }
            public void setChecksum(byte[] _v) { _dirty = true; checksum = _v; }
            public HeapsPak _root() { return _root; }
            public void set_root(HeapsPak _v) { _dirty = true; _root = _v; }
            public HeapsPak.Header.Entry _parent() { return _parent; }
            public void set_parent(HeapsPak.Header.Entry _v) { _dirty = true; _parent = _v; }
        }
        private byte[] magic1;
        private int version;
        private long lenHeader;
        private long lenData;
        private Entry rootEntry;
        private byte[] magic2;
        private HeapsPak _root;
        private HeapsPak _parent;
        private byte[] _raw_rootEntry;
        public byte[] magic1() { return magic1; }
        public void setMagic1(byte[] _v) { _dirty = true; magic1 = _v; }
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public long lenHeader() { return lenHeader; }
        public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public Entry rootEntry() { return rootEntry; }
        public void setRootEntry(Entry _v) { _dirty = true; rootEntry = _v; }
        public byte[] magic2() { return magic2; }
        public void setMagic2(byte[] _v) { _dirty = true; magic2 = _v; }
        public HeapsPak _root() { return _root; }
        public void set_root(HeapsPak _v) { _dirty = true; _root = _v; }
        public HeapsPak _parent() { return _parent; }
        public void set_parent(HeapsPak _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_rootEntry() { return _raw_rootEntry; }
        public void set_raw_RootEntry(byte[] _v) { _dirty = true; _raw_rootEntry = _v; }
    }
    private Header header;
    private HeapsPak _root;
    private KaitaiStruct.ReadWrite _parent;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public HeapsPak _root() { return _root; }
    public void set_root(HeapsPak _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
