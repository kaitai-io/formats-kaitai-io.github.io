// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="http://id3.org/id3v2.4.0-structure">Source</a>
 * @see <a href="http://id3.org/id3v2.4.0-frames">Source</a>
 */
public class Id3v24 extends KaitaiStruct.ReadWrite {
    public static Id3v24 fromFile(String fileName) throws IOException {
        return new Id3v24(new ByteBufferKaitaiStream(fileName));
    }
    public Id3v24() {
        this(null, null, null);
    }

    public Id3v24(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Id3v24(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Id3v24(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Id3v24 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.tag = new Tag(this._io, this, _root);
        this.tag._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.tag._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.tag._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.tag._root(), _root()))
            throw new ConsistencyError("tag", _root(), this.tag._root());
        if (!Objects.equals(this.tag._parent(), this))
            throw new ConsistencyError("tag", this, this.tag._parent());
        _dirty = false;
    }
    public static class Footer extends KaitaiStruct.ReadWrite {
        public static Footer fromFile(String fileName) throws IOException {
            return new Footer(new ByteBufferKaitaiStream(fileName));
        }
        public Footer() {
            this(null, null, null);
        }

        public Footer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Footer(KaitaiStream _io, Id3v24.Tag _parent) {
            this(_io, _parent, null);
        }

        public Footer(KaitaiStream _io, Id3v24.Tag _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(3);
            if (!(Arrays.equals(this.magic, new byte[] { 51, 68, 73 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 51, 68, 73 }, this.magic, this._io, "/types/footer/seq/0");
            }
            this.versionMajor = this._io.readU1();
            this.versionRevision = this._io.readU1();
            this.flags = new Flags(this._io, this, _root);
            this.flags._read();
            this.size = new U4beSynchsafe(this._io, this, _root);
            this.size._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            this.size._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU1(this.versionMajor);
            this._io.writeU1(this.versionRevision);
            this.flags._write_Seq(this._io);
            this.size._write_Seq(this._io);
        }

        public void _check() {
            if (this.magic.length != 3)
                throw new ConsistencyError("magic", 3, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 51, 68, 73 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 51, 68, 73 }, this.magic, null, "/types/footer/seq/0");
            }
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (!Objects.equals(this.size._root(), _root()))
                throw new ConsistencyError("size", _root(), this.size._root());
            if (!Objects.equals(this.size._parent(), this))
                throw new ConsistencyError("size", this, this.size._parent());
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

            public Flags(KaitaiStream _io, Id3v24.Footer _parent) {
                this(_io, _parent, null);
            }

            public Flags(KaitaiStream _io, Id3v24.Footer _parent, Id3v24 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.flagUnsynchronization = this._io.readBitsIntBe(1) != 0;
                this.flagHeaderex = this._io.readBitsIntBe(1) != 0;
                this.flagExperimental = this._io.readBitsIntBe(1) != 0;
                this.flagFooter = this._io.readBitsIntBe(1) != 0;
                this.reserved = this._io.readBitsIntBe(4);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.flagUnsynchronization ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagHeaderex ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagExperimental ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagFooter ? 1 : 0));
                this._io.writeBitsIntBe(4, this.reserved);
            }

            public void _check() {
                _dirty = false;
            }
            private boolean flagUnsynchronization;
            private boolean flagHeaderex;
            private boolean flagExperimental;
            private boolean flagFooter;
            private long reserved;
            private Id3v24 _root;
            private Id3v24.Footer _parent;
            public boolean flagUnsynchronization() { return flagUnsynchronization; }
            public void setFlagUnsynchronization(boolean _v) { _dirty = true; flagUnsynchronization = _v; }
            public boolean flagHeaderex() { return flagHeaderex; }
            public void setFlagHeaderex(boolean _v) { _dirty = true; flagHeaderex = _v; }
            public boolean flagExperimental() { return flagExperimental; }
            public void setFlagExperimental(boolean _v) { _dirty = true; flagExperimental = _v; }
            public boolean flagFooter() { return flagFooter; }
            public void setFlagFooter(boolean _v) { _dirty = true; flagFooter = _v; }
            public long reserved() { return reserved; }
            public void setReserved(long _v) { _dirty = true; reserved = _v; }
            public Id3v24 _root() { return _root; }
            public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
            public Id3v24.Footer _parent() { return _parent; }
            public void set_parent(Id3v24.Footer _v) { _dirty = true; _parent = _v; }
        }
        private byte[] magic;
        private int versionMajor;
        private int versionRevision;
        private Flags flags;
        private U4beSynchsafe size;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public int versionMajor() { return versionMajor; }
        public void setVersionMajor(int _v) { _dirty = true; versionMajor = _v; }
        public int versionRevision() { return versionRevision; }
        public void setVersionRevision(int _v) { _dirty = true; versionRevision = _v; }
        public Flags flags() { return flags; }
        public void setFlags(Flags _v) { _dirty = true; flags = _v; }
        public U4beSynchsafe size() { return size; }
        public void setSize(U4beSynchsafe _v) { _dirty = true; size = _v; }
        public Id3v24 _root() { return _root; }
        public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
        public Id3v24.Tag _parent() { return _parent; }
        public void set_parent(Id3v24.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class Frame extends KaitaiStruct.ReadWrite {
        public static Frame fromFile(String fileName) throws IOException {
            return new Frame(new ByteBufferKaitaiStream(fileName));
        }
        public Frame() {
            this(null, null, null);
        }

        public Frame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Frame(KaitaiStream _io, Id3v24.Tag _parent) {
            this(_io, _parent, null);
        }

        public Frame(KaitaiStream _io, Id3v24.Tag _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.id = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.size = new U4beSynchsafe(this._io, this, _root);
            this.size._read();
            this.flagsStatus = new FlagsStatus(this._io, this, _root);
            this.flagsStatus._read();
            this.flagsFormat = new FlagsFormat(this._io, this, _root);
            this.flagsFormat._read();
            this.data = this._io.readBytes(size().value());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.size._fetchInstances();
            this.flagsStatus._fetchInstances();
            this.flagsFormat._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.id).getBytes(Charset.forName("ASCII")));
            this.size._write_Seq(this._io);
            this.flagsStatus._write_Seq(this._io);
            this.flagsFormat._write_Seq(this._io);
            this._io.writeBytes(this.data);
        }

        public void _check() {
            if ((this.id).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("id", 4, (this.id).getBytes(Charset.forName("ASCII")).length);
            if (!Objects.equals(this.size._root(), _root()))
                throw new ConsistencyError("size", _root(), this.size._root());
            if (!Objects.equals(this.size._parent(), this))
                throw new ConsistencyError("size", this, this.size._parent());
            if (!Objects.equals(this.flagsStatus._root(), _root()))
                throw new ConsistencyError("flags_status", _root(), this.flagsStatus._root());
            if (!Objects.equals(this.flagsStatus._parent(), this))
                throw new ConsistencyError("flags_status", this, this.flagsStatus._parent());
            if (!Objects.equals(this.flagsFormat._root(), _root()))
                throw new ConsistencyError("flags_format", _root(), this.flagsFormat._root());
            if (!Objects.equals(this.flagsFormat._parent(), this))
                throw new ConsistencyError("flags_format", this, this.flagsFormat._parent());
            if (this.data.length != size().value())
                throw new ConsistencyError("data", size().value(), this.data.length);
            _dirty = false;
        }
        public static class FlagsFormat extends KaitaiStruct.ReadWrite {
            public static FlagsFormat fromFile(String fileName) throws IOException {
                return new FlagsFormat(new ByteBufferKaitaiStream(fileName));
            }
            public FlagsFormat() {
                this(null, null, null);
            }

            public FlagsFormat(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FlagsFormat(KaitaiStream _io, Id3v24.Frame _parent) {
                this(_io, _parent, null);
            }

            public FlagsFormat(KaitaiStream _io, Id3v24.Frame _parent, Id3v24 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved1 = this._io.readBitsIntBe(1) != 0;
                this.flagGrouping = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(2);
                this.flagCompressed = this._io.readBitsIntBe(1) != 0;
                this.flagEncrypted = this._io.readBitsIntBe(1) != 0;
                this.flagUnsynchronisated = this._io.readBitsIntBe(1) != 0;
                this.flagIndicator = this._io.readBitsIntBe(1) != 0;
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.reserved1 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagGrouping ? 1 : 0));
                this._io.writeBitsIntBe(2, this.reserved2);
                this._io.writeBitsIntBe(1, (this.flagCompressed ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagEncrypted ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagUnsynchronisated ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagIndicator ? 1 : 0));
            }

            public void _check() {
                _dirty = false;
            }
            private boolean reserved1;
            private boolean flagGrouping;
            private long reserved2;
            private boolean flagCompressed;
            private boolean flagEncrypted;
            private boolean flagUnsynchronisated;
            private boolean flagIndicator;
            private Id3v24 _root;
            private Id3v24.Frame _parent;
            public boolean reserved1() { return reserved1; }
            public void setReserved1(boolean _v) { _dirty = true; reserved1 = _v; }
            public boolean flagGrouping() { return flagGrouping; }
            public void setFlagGrouping(boolean _v) { _dirty = true; flagGrouping = _v; }
            public long reserved2() { return reserved2; }
            public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }
            public boolean flagCompressed() { return flagCompressed; }
            public void setFlagCompressed(boolean _v) { _dirty = true; flagCompressed = _v; }
            public boolean flagEncrypted() { return flagEncrypted; }
            public void setFlagEncrypted(boolean _v) { _dirty = true; flagEncrypted = _v; }
            public boolean flagUnsynchronisated() { return flagUnsynchronisated; }
            public void setFlagUnsynchronisated(boolean _v) { _dirty = true; flagUnsynchronisated = _v; }
            public boolean flagIndicator() { return flagIndicator; }
            public void setFlagIndicator(boolean _v) { _dirty = true; flagIndicator = _v; }
            public Id3v24 _root() { return _root; }
            public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
            public Id3v24.Frame _parent() { return _parent; }
            public void set_parent(Id3v24.Frame _v) { _dirty = true; _parent = _v; }
        }
        public static class FlagsStatus extends KaitaiStruct.ReadWrite {
            public static FlagsStatus fromFile(String fileName) throws IOException {
                return new FlagsStatus(new ByteBufferKaitaiStream(fileName));
            }
            public FlagsStatus() {
                this(null, null, null);
            }

            public FlagsStatus(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FlagsStatus(KaitaiStream _io, Id3v24.Frame _parent) {
                this(_io, _parent, null);
            }

            public FlagsStatus(KaitaiStream _io, Id3v24.Frame _parent, Id3v24 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved1 = this._io.readBitsIntBe(1) != 0;
                this.flagDiscardAlterTag = this._io.readBitsIntBe(1) != 0;
                this.flagDiscardAlterFile = this._io.readBitsIntBe(1) != 0;
                this.flagReadOnly = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(4);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.reserved1 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagDiscardAlterTag ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagDiscardAlterFile ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagReadOnly ? 1 : 0));
                this._io.writeBitsIntBe(4, this.reserved2);
            }

            public void _check() {
                _dirty = false;
            }
            private boolean reserved1;
            private boolean flagDiscardAlterTag;
            private boolean flagDiscardAlterFile;
            private boolean flagReadOnly;
            private long reserved2;
            private Id3v24 _root;
            private Id3v24.Frame _parent;
            public boolean reserved1() { return reserved1; }
            public void setReserved1(boolean _v) { _dirty = true; reserved1 = _v; }
            public boolean flagDiscardAlterTag() { return flagDiscardAlterTag; }
            public void setFlagDiscardAlterTag(boolean _v) { _dirty = true; flagDiscardAlterTag = _v; }
            public boolean flagDiscardAlterFile() { return flagDiscardAlterFile; }
            public void setFlagDiscardAlterFile(boolean _v) { _dirty = true; flagDiscardAlterFile = _v; }
            public boolean flagReadOnly() { return flagReadOnly; }
            public void setFlagReadOnly(boolean _v) { _dirty = true; flagReadOnly = _v; }
            public long reserved2() { return reserved2; }
            public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }
            public Id3v24 _root() { return _root; }
            public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
            public Id3v24.Frame _parent() { return _parent; }
            public void set_parent(Id3v24.Frame _v) { _dirty = true; _parent = _v; }
        }
        private Boolean isInvalid;
        public Boolean isInvalid() {
            if (this.isInvalid != null)
                return this.isInvalid;
            this.isInvalid = id().equals("\000\000\000\000");
            return this.isInvalid;
        }
        public void _invalidateIsInvalid() { this.isInvalid = null; }
        private String id;
        private U4beSynchsafe size;
        private FlagsStatus flagsStatus;
        private FlagsFormat flagsFormat;
        private byte[] data;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public String id() { return id; }
        public void setId(String _v) { _dirty = true; id = _v; }
        public U4beSynchsafe size() { return size; }
        public void setSize(U4beSynchsafe _v) { _dirty = true; size = _v; }
        public FlagsStatus flagsStatus() { return flagsStatus; }
        public void setFlagsStatus(FlagsStatus _v) { _dirty = true; flagsStatus = _v; }
        public FlagsFormat flagsFormat() { return flagsFormat; }
        public void setFlagsFormat(FlagsFormat _v) { _dirty = true; flagsFormat = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Id3v24 _root() { return _root; }
        public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
        public Id3v24.Tag _parent() { return _parent; }
        public void set_parent(Id3v24.Tag _v) { _dirty = true; _parent = _v; }
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

        public Header(KaitaiStream _io, Id3v24.Tag _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Id3v24.Tag _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(3);
            if (!(Arrays.equals(this.magic, new byte[] { 73, 68, 51 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 51 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.versionMajor = this._io.readU1();
            this.versionRevision = this._io.readU1();
            this.flags = new Flags(this._io, this, _root);
            this.flags._read();
            this.size = new U4beSynchsafe(this._io, this, _root);
            this.size._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            this.size._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU1(this.versionMajor);
            this._io.writeU1(this.versionRevision);
            this.flags._write_Seq(this._io);
            this.size._write_Seq(this._io);
        }

        public void _check() {
            if (this.magic.length != 3)
                throw new ConsistencyError("magic", 3, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 73, 68, 51 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 51 }, this.magic, null, "/types/header/seq/0");
            }
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (!Objects.equals(this.size._root(), _root()))
                throw new ConsistencyError("size", _root(), this.size._root());
            if (!Objects.equals(this.size._parent(), this))
                throw new ConsistencyError("size", this, this.size._parent());
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

            public Flags(KaitaiStream _io, Id3v24.Header _parent) {
                this(_io, _parent, null);
            }

            public Flags(KaitaiStream _io, Id3v24.Header _parent, Id3v24 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.flagUnsynchronization = this._io.readBitsIntBe(1) != 0;
                this.flagHeaderex = this._io.readBitsIntBe(1) != 0;
                this.flagExperimental = this._io.readBitsIntBe(1) != 0;
                this.flagFooter = this._io.readBitsIntBe(1) != 0;
                this.reserved = this._io.readBitsIntBe(4);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.flagUnsynchronization ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagHeaderex ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagExperimental ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagFooter ? 1 : 0));
                this._io.writeBitsIntBe(4, this.reserved);
            }

            public void _check() {
                _dirty = false;
            }
            private boolean flagUnsynchronization;
            private boolean flagHeaderex;
            private boolean flagExperimental;
            private boolean flagFooter;
            private long reserved;
            private Id3v24 _root;
            private Id3v24.Header _parent;
            public boolean flagUnsynchronization() { return flagUnsynchronization; }
            public void setFlagUnsynchronization(boolean _v) { _dirty = true; flagUnsynchronization = _v; }
            public boolean flagHeaderex() { return flagHeaderex; }
            public void setFlagHeaderex(boolean _v) { _dirty = true; flagHeaderex = _v; }
            public boolean flagExperimental() { return flagExperimental; }
            public void setFlagExperimental(boolean _v) { _dirty = true; flagExperimental = _v; }
            public boolean flagFooter() { return flagFooter; }
            public void setFlagFooter(boolean _v) { _dirty = true; flagFooter = _v; }
            public long reserved() { return reserved; }
            public void setReserved(long _v) { _dirty = true; reserved = _v; }
            public Id3v24 _root() { return _root; }
            public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
            public Id3v24.Header _parent() { return _parent; }
            public void set_parent(Id3v24.Header _v) { _dirty = true; _parent = _v; }
        }
        private byte[] magic;
        private int versionMajor;
        private int versionRevision;
        private Flags flags;
        private U4beSynchsafe size;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public int versionMajor() { return versionMajor; }
        public void setVersionMajor(int _v) { _dirty = true; versionMajor = _v; }
        public int versionRevision() { return versionRevision; }
        public void setVersionRevision(int _v) { _dirty = true; versionRevision = _v; }
        public Flags flags() { return flags; }
        public void setFlags(Flags _v) { _dirty = true; flags = _v; }
        public U4beSynchsafe size() { return size; }
        public void setSize(U4beSynchsafe _v) { _dirty = true; size = _v; }
        public Id3v24 _root() { return _root; }
        public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
        public Id3v24.Tag _parent() { return _parent; }
        public void set_parent(Id3v24.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class HeaderEx extends KaitaiStruct.ReadWrite {
        public static HeaderEx fromFile(String fileName) throws IOException {
            return new HeaderEx(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderEx() {
            this(null, null, null);
        }

        public HeaderEx(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderEx(KaitaiStream _io, Id3v24.Tag _parent) {
            this(_io, _parent, null);
        }

        public HeaderEx(KaitaiStream _io, Id3v24.Tag _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.size = new U4beSynchsafe(this._io, this, _root);
            this.size._read();
            this.flagsEx = new FlagsEx(this._io, this, _root);
            this.flagsEx._read();
            this.data = this._io.readBytes(size().value() - 5);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.size._fetchInstances();
            this.flagsEx._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.size._write_Seq(this._io);
            this.flagsEx._write_Seq(this._io);
            this._io.writeBytes(this.data);
        }

        public void _check() {
            if (!Objects.equals(this.size._root(), _root()))
                throw new ConsistencyError("size", _root(), this.size._root());
            if (!Objects.equals(this.size._parent(), this))
                throw new ConsistencyError("size", this, this.size._parent());
            if (!Objects.equals(this.flagsEx._root(), _root()))
                throw new ConsistencyError("flags_ex", _root(), this.flagsEx._root());
            if (!Objects.equals(this.flagsEx._parent(), this))
                throw new ConsistencyError("flags_ex", this, this.flagsEx._parent());
            if (this.data.length != size().value() - 5)
                throw new ConsistencyError("data", size().value() - 5, this.data.length);
            _dirty = false;
        }
        public static class FlagsEx extends KaitaiStruct.ReadWrite {
            public static FlagsEx fromFile(String fileName) throws IOException {
                return new FlagsEx(new ByteBufferKaitaiStream(fileName));
            }
            public FlagsEx() {
                this(null, null, null);
            }

            public FlagsEx(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FlagsEx(KaitaiStream _io, Id3v24.HeaderEx _parent) {
                this(_io, _parent, null);
            }

            public FlagsEx(KaitaiStream _io, Id3v24.HeaderEx _parent, Id3v24 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.reserved1 = this._io.readBitsIntBe(1) != 0;
                this.flagUpdate = this._io.readBitsIntBe(1) != 0;
                this.flagCrc = this._io.readBitsIntBe(1) != 0;
                this.flagRestrictions = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(4);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.reserved1 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagUpdate ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagCrc ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.flagRestrictions ? 1 : 0));
                this._io.writeBitsIntBe(4, this.reserved2);
            }

            public void _check() {
                _dirty = false;
            }
            private boolean reserved1;
            private boolean flagUpdate;
            private boolean flagCrc;
            private boolean flagRestrictions;
            private long reserved2;
            private Id3v24 _root;
            private Id3v24.HeaderEx _parent;
            public boolean reserved1() { return reserved1; }
            public void setReserved1(boolean _v) { _dirty = true; reserved1 = _v; }
            public boolean flagUpdate() { return flagUpdate; }
            public void setFlagUpdate(boolean _v) { _dirty = true; flagUpdate = _v; }
            public boolean flagCrc() { return flagCrc; }
            public void setFlagCrc(boolean _v) { _dirty = true; flagCrc = _v; }
            public boolean flagRestrictions() { return flagRestrictions; }
            public void setFlagRestrictions(boolean _v) { _dirty = true; flagRestrictions = _v; }
            public long reserved2() { return reserved2; }
            public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }
            public Id3v24 _root() { return _root; }
            public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
            public Id3v24.HeaderEx _parent() { return _parent; }
            public void set_parent(Id3v24.HeaderEx _v) { _dirty = true; _parent = _v; }
        }
        private U4beSynchsafe size;
        private FlagsEx flagsEx;
        private byte[] data;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public U4beSynchsafe size() { return size; }
        public void setSize(U4beSynchsafe _v) { _dirty = true; size = _v; }
        public FlagsEx flagsEx() { return flagsEx; }
        public void setFlagsEx(FlagsEx _v) { _dirty = true; flagsEx = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Id3v24 _root() { return _root; }
        public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
        public Id3v24.Tag _parent() { return _parent; }
        public void set_parent(Id3v24.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class Padding extends KaitaiStruct.ReadWrite {
        public static Padding fromFile(String fileName) throws IOException {
            return new Padding(new ByteBufferKaitaiStream(fileName));
        }
        public Padding() {
            this(null, null, null);
        }

        public Padding(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Padding(KaitaiStream _io, Id3v24.Tag _parent) {
            this(_io, _parent, null);
        }

        public Padding(KaitaiStream _io, Id3v24.Tag _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.padding = this._io.readBytes(_root().tag().header().size().value() - _io().pos());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (this.padding.length != _root().tag().header().size().value() - _io().pos())
                throw new ConsistencyError("padding", _root().tag().header().size().value() - _io().pos(), this.padding.length);
            this._io.writeBytes(this.padding);
        }

        public void _check() {
            _dirty = false;
        }
        private byte[] padding;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public Id3v24 _root() { return _root; }
        public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
        public Id3v24.Tag _parent() { return _parent; }
        public void set_parent(Id3v24.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class Tag extends KaitaiStruct.ReadWrite {
        public static Tag fromFile(String fileName) throws IOException {
            return new Tag(new ByteBufferKaitaiStream(fileName));
        }
        public Tag() {
            this(null, null, null);
        }

        public Tag(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Tag(KaitaiStream _io, Id3v24 _parent) {
            this(_io, _parent, null);
        }

        public Tag(KaitaiStream _io, Id3v24 _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new Header(this._io, this, _root);
            this.header._read();
            if (header().flags().flagHeaderex()) {
                this.headerEx = new HeaderEx(this._io, this, _root);
                this.headerEx._read();
            }
            this.frames = new ArrayList<Frame>();
            {
                Frame _it;
                int i = 0;
                do {
                    Frame _t_frames = new Frame(this._io, this, _root);
                    try {
                        _t_frames._read();
                    } finally {
                        _it = _t_frames;
                        this.frames.add(_it);
                    }
                    i++;
                } while (!( ((_io().pos() + _it.size().value() > header().size().value()) || (_it.isInvalid())) ));
            }
            if (!(header().flags().flagFooter())) {
                this.padding = new Padding(this._io, this, _root);
                this.padding._read();
            }
            if (header().flags().flagFooter()) {
                this.footer = new Footer(this._io, this, _root);
                this.footer._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            if (header().flags().flagHeaderex()) {
                this.headerEx._fetchInstances();
            }
            for (int i = 0; i < this.frames.size(); i++) {
                this.frames.get(((Number) (i)).intValue())._fetchInstances();
            }
            if (!(header().flags().flagFooter())) {
                this.padding._fetchInstances();
            }
            if (header().flags().flagFooter()) {
                this.footer._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            if (header().flags().flagHeaderex()) {
                this.headerEx._write_Seq(this._io);
            }
            for (int i = 0; i < this.frames.size(); i++) {
                this.frames.get(((Number) (i)).intValue())._write_Seq(this._io);
                {
                    Frame _it = this.frames.get(((Number) (i)).intValue());
                    if ( ((_io().pos() + _it.size().value() > header().size().value()) || (_it.isInvalid()))  != (i == this.frames.size() - 1))
                        throw new ConsistencyError("frames", i == this.frames.size() - 1,  ((_io().pos() + _it.size().value() > header().size().value()) || (_it.isInvalid())) );
                }
            }
            if (!(header().flags().flagFooter())) {
                this.padding._write_Seq(this._io);
            }
            if (header().flags().flagFooter()) {
                this.footer._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (header().flags().flagHeaderex()) {
                if (!Objects.equals(this.headerEx._root(), _root()))
                    throw new ConsistencyError("header_ex", _root(), this.headerEx._root());
                if (!Objects.equals(this.headerEx._parent(), this))
                    throw new ConsistencyError("header_ex", this, this.headerEx._parent());
            }
            if (this.frames.size() == 0)
                throw new ConsistencyError("frames", 0, this.frames.size());
            for (int i = 0; i < this.frames.size(); i++) {
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("frames", _root(), this.frames.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.frames.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("frames", this, this.frames.get(((Number) (i)).intValue())._parent());
            }
            if (!(header().flags().flagFooter())) {
                if (!Objects.equals(this.padding._root(), _root()))
                    throw new ConsistencyError("padding", _root(), this.padding._root());
                if (!Objects.equals(this.padding._parent(), this))
                    throw new ConsistencyError("padding", this, this.padding._parent());
            }
            if (header().flags().flagFooter()) {
                if (!Objects.equals(this.footer._root(), _root()))
                    throw new ConsistencyError("footer", _root(), this.footer._root());
                if (!Objects.equals(this.footer._parent(), this))
                    throw new ConsistencyError("footer", this, this.footer._parent());
            }
            _dirty = false;
        }
        private Header header;
        private HeaderEx headerEx;
        private List<Frame> frames;
        private Padding padding;
        private Footer footer;
        private Id3v24 _root;
        private Id3v24 _parent;
        public Header header() { return header; }
        public void setHeader(Header _v) { _dirty = true; header = _v; }
        public HeaderEx headerEx() { return headerEx; }
        public void setHeaderEx(HeaderEx _v) { _dirty = true; headerEx = _v; }
        public List<Frame> frames() { return frames; }
        public void setFrames(List<Frame> _v) { _dirty = true; frames = _v; }
        public Padding padding() { return padding; }
        public void setPadding(Padding _v) { _dirty = true; padding = _v; }
        public Footer footer() { return footer; }
        public void setFooter(Footer _v) { _dirty = true; footer = _v; }
        public Id3v24 _root() { return _root; }
        public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
        public Id3v24 _parent() { return _parent; }
        public void set_parent(Id3v24 _v) { _dirty = true; _parent = _v; }
    }
    public static class U1beSynchsafe extends KaitaiStruct.ReadWrite {
        public static U1beSynchsafe fromFile(String fileName) throws IOException {
            return new U1beSynchsafe(new ByteBufferKaitaiStream(fileName));
        }
        public U1beSynchsafe() {
            this(null, null, null);
        }

        public U1beSynchsafe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U1beSynchsafe(KaitaiStream _io, Id3v24.U2beSynchsafe _parent) {
            this(_io, _parent, null);
        }

        public U1beSynchsafe(KaitaiStream _io, Id3v24.U2beSynchsafe _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.padding = this._io.readBitsIntBe(1) != 0;
            this.value = this._io.readBitsIntBe(7);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.padding ? 1 : 0));
            this._io.writeBitsIntBe(7, this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private boolean padding;
        private long value;
        private Id3v24 _root;
        private Id3v24.U2beSynchsafe _parent;
        public boolean padding() { return padding; }
        public void setPadding(boolean _v) { _dirty = true; padding = _v; }
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public Id3v24 _root() { return _root; }
        public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
        public Id3v24.U2beSynchsafe _parent() { return _parent; }
        public void set_parent(Id3v24.U2beSynchsafe _v) { _dirty = true; _parent = _v; }
    }
    public static class U2beSynchsafe extends KaitaiStruct.ReadWrite {
        public static U2beSynchsafe fromFile(String fileName) throws IOException {
            return new U2beSynchsafe(new ByteBufferKaitaiStream(fileName));
        }
        public U2beSynchsafe() {
            this(null, null, null);
        }

        public U2beSynchsafe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U2beSynchsafe(KaitaiStream _io, Id3v24.U4beSynchsafe _parent) {
            this(_io, _parent, null);
        }

        public U2beSynchsafe(KaitaiStream _io, Id3v24.U4beSynchsafe _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.byte0 = new U1beSynchsafe(this._io, this, _root);
            this.byte0._read();
            this.byte1 = new U1beSynchsafe(this._io, this, _root);
            this.byte1._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.byte0._fetchInstances();
            this.byte1._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.byte0._write_Seq(this._io);
            this.byte1._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.byte0._root(), _root()))
                throw new ConsistencyError("byte0", _root(), this.byte0._root());
            if (!Objects.equals(this.byte0._parent(), this))
                throw new ConsistencyError("byte0", this, this.byte0._parent());
            if (!Objects.equals(this.byte1._root(), _root()))
                throw new ConsistencyError("byte1", _root(), this.byte1._root());
            if (!Objects.equals(this.byte1._parent(), this))
                throw new ConsistencyError("byte1", this, this.byte1._parent());
            _dirty = false;
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (byte0().value() << 7 | byte1().value())).intValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private U1beSynchsafe byte0;
        private U1beSynchsafe byte1;
        private Id3v24 _root;
        private Id3v24.U4beSynchsafe _parent;
        public U1beSynchsafe byte0() { return byte0; }
        public void setByte0(U1beSynchsafe _v) { _dirty = true; byte0 = _v; }
        public U1beSynchsafe byte1() { return byte1; }
        public void setByte1(U1beSynchsafe _v) { _dirty = true; byte1 = _v; }
        public Id3v24 _root() { return _root; }
        public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
        public Id3v24.U4beSynchsafe _parent() { return _parent; }
        public void set_parent(Id3v24.U4beSynchsafe _v) { _dirty = true; _parent = _v; }
    }
    public static class U4beSynchsafe extends KaitaiStruct.ReadWrite {
        public static U4beSynchsafe fromFile(String fileName) throws IOException {
            return new U4beSynchsafe(new ByteBufferKaitaiStream(fileName));
        }
        public U4beSynchsafe() {
            this(null, null, null);
        }

        public U4beSynchsafe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U4beSynchsafe(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public U4beSynchsafe(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.short0 = new U2beSynchsafe(this._io, this, _root);
            this.short0._read();
            this.short1 = new U2beSynchsafe(this._io, this, _root);
            this.short1._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.short0._fetchInstances();
            this.short1._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.short0._write_Seq(this._io);
            this.short1._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.short0._root(), _root()))
                throw new ConsistencyError("short0", _root(), this.short0._root());
            if (!Objects.equals(this.short0._parent(), this))
                throw new ConsistencyError("short0", this, this.short0._parent());
            if (!Objects.equals(this.short1._root(), _root()))
                throw new ConsistencyError("short1", _root(), this.short1._root());
            if (!Objects.equals(this.short1._parent(), this))
                throw new ConsistencyError("short1", this, this.short1._parent());
            _dirty = false;
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (short0().value() << 14 | short1().value())).intValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private U2beSynchsafe short0;
        private U2beSynchsafe short1;
        private Id3v24 _root;
        private KaitaiStruct.ReadWrite _parent;
        public U2beSynchsafe short0() { return short0; }
        public void setShort0(U2beSynchsafe _v) { _dirty = true; short0 = _v; }
        public U2beSynchsafe short1() { return short1; }
        public void setShort1(U2beSynchsafe _v) { _dirty = true; short1 = _v; }
        public Id3v24 _root() { return _root; }
        public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private Tag tag;
    private Id3v24 _root;
    private KaitaiStruct.ReadWrite _parent;
    public Tag tag() { return tag; }
    public void setTag(Tag _v) { _dirty = true; tag = _v; }
    public Id3v24 _root() { return _root; }
    public void set_root(Id3v24 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
