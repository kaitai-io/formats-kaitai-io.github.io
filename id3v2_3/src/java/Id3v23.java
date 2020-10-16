// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.Arrays;

public class Id3v23 extends KaitaiStruct {
    public static Id3v23 fromFile(String fileName) throws IOException {
        return new Id3v23(new ByteBufferKaitaiStream(fileName));
    }

    public Id3v23(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Id3v23(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Id3v23(KaitaiStream _io, KaitaiStruct _parent, Id3v23 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.tag = new Tag(this._io, this, _root);
    }
    public static class U1beSynchsafe extends KaitaiStruct {
        public static U1beSynchsafe fromFile(String fileName) throws IOException {
            return new U1beSynchsafe(new ByteBufferKaitaiStream(fileName));
        }

        public U1beSynchsafe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U1beSynchsafe(KaitaiStream _io, Id3v23.U2beSynchsafe _parent) {
            this(_io, _parent, null);
        }

        public U1beSynchsafe(KaitaiStream _io, Id3v23.U2beSynchsafe _parent, Id3v23 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.padding = this._io.readBitsIntBe(1) != 0;
            this.value = this._io.readBitsIntBe(7);
        }
        private boolean padding;
        private long value;
        private Id3v23 _root;
        private Id3v23.U2beSynchsafe _parent;
        public boolean padding() { return padding; }
        public long value() { return value; }
        public Id3v23 _root() { return _root; }
        public Id3v23.U2beSynchsafe _parent() { return _parent; }
    }
    public static class U2beSynchsafe extends KaitaiStruct {
        public static U2beSynchsafe fromFile(String fileName) throws IOException {
            return new U2beSynchsafe(new ByteBufferKaitaiStream(fileName));
        }

        public U2beSynchsafe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U2beSynchsafe(KaitaiStream _io, Id3v23.U4beSynchsafe _parent) {
            this(_io, _parent, null);
        }

        public U2beSynchsafe(KaitaiStream _io, Id3v23.U4beSynchsafe _parent, Id3v23 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.byte0 = new U1beSynchsafe(this._io, this, _root);
            this.byte1 = new U1beSynchsafe(this._io, this, _root);
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            int _tmp = (int) (((byte0().value() << 7) | byte1().value()));
            this.value = _tmp;
            return this.value;
        }
        private U1beSynchsafe byte0;
        private U1beSynchsafe byte1;
        private Id3v23 _root;
        private Id3v23.U4beSynchsafe _parent;
        public U1beSynchsafe byte0() { return byte0; }
        public U1beSynchsafe byte1() { return byte1; }
        public Id3v23 _root() { return _root; }
        public Id3v23.U4beSynchsafe _parent() { return _parent; }
    }
    public static class Tag extends KaitaiStruct {
        public static Tag fromFile(String fileName) throws IOException {
            return new Tag(new ByteBufferKaitaiStream(fileName));
        }

        public Tag(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Tag(KaitaiStream _io, Id3v23 _parent) {
            this(_io, _parent, null);
        }

        public Tag(KaitaiStream _io, Id3v23 _parent, Id3v23 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.header = new Header(this._io, this, _root);
            if (header().flags().flagHeaderex()) {
                this.headerEx = new HeaderEx(this._io, this, _root);
            }
            this.frames = new ArrayList<Frame>();
            {
                Frame _it;
                int i = 0;
                do {
                    _it = new Frame(this._io, this, _root);
                    this.frames.add(_it);
                    i++;
                } while (!( (((_io().pos() + _it.size()) > header().size().value()) || (_it.isInvalid())) ));
            }
            if (header().flags().flagHeaderex()) {
                this.padding = this._io.readBytes((headerEx().paddingSize() - _io().pos()));
            }
        }
        private Header header;
        private HeaderEx headerEx;
        private ArrayList<Frame> frames;
        private byte[] padding;
        private Id3v23 _root;
        private Id3v23 _parent;
        public Header header() { return header; }
        public HeaderEx headerEx() { return headerEx; }
        public ArrayList<Frame> frames() { return frames; }
        public byte[] padding() { return padding; }
        public Id3v23 _root() { return _root; }
        public Id3v23 _parent() { return _parent; }
    }
    public static class U4beSynchsafe extends KaitaiStruct {
        public static U4beSynchsafe fromFile(String fileName) throws IOException {
            return new U4beSynchsafe(new ByteBufferKaitaiStream(fileName));
        }

        public U4beSynchsafe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U4beSynchsafe(KaitaiStream _io, Id3v23.Header _parent) {
            this(_io, _parent, null);
        }

        public U4beSynchsafe(KaitaiStream _io, Id3v23.Header _parent, Id3v23 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.short0 = new U2beSynchsafe(this._io, this, _root);
            this.short1 = new U2beSynchsafe(this._io, this, _root);
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            int _tmp = (int) (((short0().value() << 14) | short1().value()));
            this.value = _tmp;
            return this.value;
        }
        private U2beSynchsafe short0;
        private U2beSynchsafe short1;
        private Id3v23 _root;
        private Id3v23.Header _parent;
        public U2beSynchsafe short0() { return short0; }
        public U2beSynchsafe short1() { return short1; }
        public Id3v23 _root() { return _root; }
        public Id3v23.Header _parent() { return _parent; }
    }
    public static class Frame extends KaitaiStruct {
        public static Frame fromFile(String fileName) throws IOException {
            return new Frame(new ByteBufferKaitaiStream(fileName));
        }

        public Frame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Frame(KaitaiStream _io, Id3v23.Tag _parent) {
            this(_io, _parent, null);
        }

        public Frame(KaitaiStream _io, Id3v23.Tag _parent, Id3v23 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.id = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this.size = this._io.readU4be();
            this.flags = new Flags(this._io, this, _root);
            this.data = this._io.readBytes(size());
        }
        public static class Flags extends KaitaiStruct {
            public static Flags fromFile(String fileName) throws IOException {
                return new Flags(new ByteBufferKaitaiStream(fileName));
            }

            public Flags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Flags(KaitaiStream _io, Id3v23.Frame _parent) {
                this(_io, _parent, null);
            }

            public Flags(KaitaiStream _io, Id3v23.Frame _parent, Id3v23 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.flagDiscardAlterTag = this._io.readBitsIntBe(1) != 0;
                this.flagDiscardAlterFile = this._io.readBitsIntBe(1) != 0;
                this.flagReadOnly = this._io.readBitsIntBe(1) != 0;
                this.reserved1 = this._io.readBitsIntBe(5);
                this.flagCompressed = this._io.readBitsIntBe(1) != 0;
                this.flagEncrypted = this._io.readBitsIntBe(1) != 0;
                this.flagGrouping = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(5);
            }
            private boolean flagDiscardAlterTag;
            private boolean flagDiscardAlterFile;
            private boolean flagReadOnly;
            private long reserved1;
            private boolean flagCompressed;
            private boolean flagEncrypted;
            private boolean flagGrouping;
            private long reserved2;
            private Id3v23 _root;
            private Id3v23.Frame _parent;
            public boolean flagDiscardAlterTag() { return flagDiscardAlterTag; }
            public boolean flagDiscardAlterFile() { return flagDiscardAlterFile; }
            public boolean flagReadOnly() { return flagReadOnly; }
            public long reserved1() { return reserved1; }
            public boolean flagCompressed() { return flagCompressed; }
            public boolean flagEncrypted() { return flagEncrypted; }
            public boolean flagGrouping() { return flagGrouping; }
            public long reserved2() { return reserved2; }
            public Id3v23 _root() { return _root; }
            public Id3v23.Frame _parent() { return _parent; }
        }
        private Boolean isInvalid;
        public Boolean isInvalid() {
            if (this.isInvalid != null)
                return this.isInvalid;
            boolean _tmp = (boolean) (id().equals("\000\000\000\000"));
            this.isInvalid = _tmp;
            return this.isInvalid;
        }
        private String id;
        private long size;
        private Flags flags;
        private byte[] data;
        private Id3v23 _root;
        private Id3v23.Tag _parent;
        public String id() { return id; }
        public long size() { return size; }
        public Flags flags() { return flags; }
        public byte[] data() { return data; }
        public Id3v23 _root() { return _root; }
        public Id3v23.Tag _parent() { return _parent; }
    }

    /**
     * ID3v2 extended header
     * @see "Section 3.2. ID3v2 extended header"
     */
    public static class HeaderEx extends KaitaiStruct {
        public static HeaderEx fromFile(String fileName) throws IOException {
            return new HeaderEx(new ByteBufferKaitaiStream(fileName));
        }

        public HeaderEx(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderEx(KaitaiStream _io, Id3v23.Tag _parent) {
            this(_io, _parent, null);
        }

        public HeaderEx(KaitaiStream _io, Id3v23.Tag _parent, Id3v23 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU4be();
            this.flagsEx = new FlagsEx(this._io, this, _root);
            this.paddingSize = this._io.readU4be();
            if (flagsEx().flagCrc()) {
                this.crc = this._io.readU4be();
            }
        }
        public static class FlagsEx extends KaitaiStruct {
            public static FlagsEx fromFile(String fileName) throws IOException {
                return new FlagsEx(new ByteBufferKaitaiStream(fileName));
            }

            public FlagsEx(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FlagsEx(KaitaiStream _io, Id3v23.HeaderEx _parent) {
                this(_io, _parent, null);
            }

            public FlagsEx(KaitaiStream _io, Id3v23.HeaderEx _parent, Id3v23 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.flagCrc = this._io.readBitsIntBe(1) != 0;
                this.reserved = this._io.readBitsIntBe(15);
            }
            private boolean flagCrc;
            private long reserved;
            private Id3v23 _root;
            private Id3v23.HeaderEx _parent;
            public boolean flagCrc() { return flagCrc; }
            public long reserved() { return reserved; }
            public Id3v23 _root() { return _root; }
            public Id3v23.HeaderEx _parent() { return _parent; }
        }
        private long size;
        private FlagsEx flagsEx;
        private long paddingSize;
        private Long crc;
        private Id3v23 _root;
        private Id3v23.Tag _parent;
        public long size() { return size; }
        public FlagsEx flagsEx() { return flagsEx; }
        public long paddingSize() { return paddingSize; }
        public Long crc() { return crc; }
        public Id3v23 _root() { return _root; }
        public Id3v23.Tag _parent() { return _parent; }
    }

    /**
     * ID3v2 fixed header
     * @see "Section 3.1. ID3v2 header"
     */
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Id3v23.Tag _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Id3v23.Tag _parent, Id3v23 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(3);
            if (!(Arrays.equals(magic(), new byte[] { 73, 68, 51 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 51 }, magic(), _io(), "/types/header/seq/0");
            }
            this.versionMajor = this._io.readU1();
            this.versionRevision = this._io.readU1();
            this.flags = new Flags(this._io, this, _root);
            this.size = new U4beSynchsafe(this._io, this, _root);
        }
        public static class Flags extends KaitaiStruct {
            public static Flags fromFile(String fileName) throws IOException {
                return new Flags(new ByteBufferKaitaiStream(fileName));
            }

            public Flags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Flags(KaitaiStream _io, Id3v23.Header _parent) {
                this(_io, _parent, null);
            }

            public Flags(KaitaiStream _io, Id3v23.Header _parent, Id3v23 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.flagUnsynchronization = this._io.readBitsIntBe(1) != 0;
                this.flagHeaderex = this._io.readBitsIntBe(1) != 0;
                this.flagExperimental = this._io.readBitsIntBe(1) != 0;
                this.reserved = this._io.readBitsIntBe(5);
            }
            private boolean flagUnsynchronization;
            private boolean flagHeaderex;
            private boolean flagExperimental;
            private long reserved;
            private Id3v23 _root;
            private Id3v23.Header _parent;
            public boolean flagUnsynchronization() { return flagUnsynchronization; }
            public boolean flagHeaderex() { return flagHeaderex; }
            public boolean flagExperimental() { return flagExperimental; }
            public long reserved() { return reserved; }
            public Id3v23 _root() { return _root; }
            public Id3v23.Header _parent() { return _parent; }
        }
        private byte[] magic;
        private int versionMajor;
        private int versionRevision;
        private Flags flags;
        private U4beSynchsafe size;
        private Id3v23 _root;
        private Id3v23.Tag _parent;
        public byte[] magic() { return magic; }
        public int versionMajor() { return versionMajor; }
        public int versionRevision() { return versionRevision; }
        public Flags flags() { return flags; }
        public U4beSynchsafe size() { return size; }
        public Id3v23 _root() { return _root; }
        public Id3v23.Tag _parent() { return _parent; }
    }
    private Tag tag;
    private Id3v23 _root;
    private KaitaiStruct _parent;
    public Tag tag() { return tag; }
    public Id3v23 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
