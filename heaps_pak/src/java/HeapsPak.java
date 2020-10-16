// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * @see <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx">Source</a>
 */
public class HeapsPak extends KaitaiStruct {
    public static HeapsPak fromFile(String fileName) throws IOException {
        return new HeapsPak(new ByteBufferKaitaiStream(fileName));
    }

    public HeapsPak(KaitaiStream _io) {
        this(_io, null, null);
    }

    public HeapsPak(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public HeapsPak(KaitaiStream _io, KaitaiStruct _parent, HeapsPak _root) {
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

        public Header(KaitaiStream _io, HeapsPak _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, HeapsPak _parent, HeapsPak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic1 = this._io.readBytes(3);
            if (!(Arrays.equals(magic1(), new byte[] { 80, 65, 75 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 65, 75 }, magic1(), _io(), "/types/header/seq/0");
            }
            this.version = this._io.readU1();
            this.lenHeader = this._io.readU4le();
            this.lenData = this._io.readU4le();
            this._raw_rootEntry = this._io.readBytes((lenHeader() - 16));
            KaitaiStream _io__raw_rootEntry = new ByteBufferKaitaiStream(_raw_rootEntry);
            this.rootEntry = new Entry(_io__raw_rootEntry, this, _root);
            this.magic2 = this._io.readBytes(4);
            if (!(Arrays.equals(magic2(), new byte[] { 68, 65, 84, 65 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 68, 65, 84, 65 }, magic2(), _io(), "/types/header/seq/5");
            }
        }

        /**
         * @see <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx">Source</a>
         */
        public static class Entry extends KaitaiStruct {
            public static Entry fromFile(String fileName) throws IOException {
                return new Entry(new ByteBufferKaitaiStream(fileName));
            }

            public Entry(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Entry(KaitaiStream _io, KaitaiStruct _parent) {
                this(_io, _parent, null);
            }

            public Entry(KaitaiStream _io, KaitaiStruct _parent, HeapsPak _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.lenName = this._io.readU1();
                this.name = new String(this._io.readBytes(lenName()), Charset.forName("UTF-8"));
                this.flags = new Flags(this._io, this, _root);
                {
                    boolean on = flags().isDir();
                    if (on == true) {
                        this.body = new Dir(this._io, this, _root);
                    }
                    else if (on == false) {
                        this.body = new File(this._io, this, _root);
                    }
                }
            }
            public static class Flags extends KaitaiStruct {
                public static Flags fromFile(String fileName) throws IOException {
                    return new Flags(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.unused = this._io.readBitsIntBe(7);
                    this.isDir = this._io.readBitsIntBe(1) != 0;
                }
                private long unused;
                private boolean isDir;
                private HeapsPak _root;
                private HeapsPak.Header.Entry _parent;
                public long unused() { return unused; }
                public boolean isDir() { return isDir; }
                public HeapsPak _root() { return _root; }
                public HeapsPak.Header.Entry _parent() { return _parent; }
            }
            private int lenName;
            private String name;
            private Flags flags;
            private KaitaiStruct body;
            private HeapsPak _root;
            private KaitaiStruct _parent;
            public int lenName() { return lenName; }
            public String name() { return name; }
            public Flags flags() { return flags; }
            public KaitaiStruct body() { return body; }
            public HeapsPak _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        public static class File extends KaitaiStruct {
            public static File fromFile(String fileName) throws IOException {
                return new File(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.ofsData = this._io.readU4le();
                this.lenData = this._io.readU4le();
                this.checksum = this._io.readBytes(4);
            }
            private byte[] data;
            public byte[] data() {
                if (this.data != null)
                    return this.data;
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek((_root.header().lenHeader() + ofsData()));
                this.data = io.readBytes(lenData());
                io.seek(_pos);
                return this.data;
            }
            private long ofsData;
            private long lenData;
            private byte[] checksum;
            private HeapsPak _root;
            private HeapsPak.Header.Entry _parent;
            public long ofsData() { return ofsData; }
            public long lenData() { return lenData; }
            public byte[] checksum() { return checksum; }
            public HeapsPak _root() { return _root; }
            public HeapsPak.Header.Entry _parent() { return _parent; }
        }
        public static class Dir extends KaitaiStruct {
            public static Dir fromFile(String fileName) throws IOException {
                return new Dir(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.numEntries = this._io.readU4le();
                entries = new ArrayList<Entry>(((Number) (numEntries())).intValue());
                for (int i = 0; i < numEntries(); i++) {
                    this.entries.add(new Entry(this._io, this, _root));
                }
            }
            private long numEntries;
            private ArrayList<Entry> entries;
            private HeapsPak _root;
            private HeapsPak.Header.Entry _parent;
            public long numEntries() { return numEntries; }
            public ArrayList<Entry> entries() { return entries; }
            public HeapsPak _root() { return _root; }
            public HeapsPak.Header.Entry _parent() { return _parent; }
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
        public int version() { return version; }
        public long lenHeader() { return lenHeader; }
        public long lenData() { return lenData; }
        public Entry rootEntry() { return rootEntry; }
        public byte[] magic2() { return magic2; }
        public HeapsPak _root() { return _root; }
        public HeapsPak _parent() { return _parent; }
        public byte[] _raw_rootEntry() { return _raw_rootEntry; }
    }
    private Header header;
    private HeapsPak _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public HeapsPak _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
