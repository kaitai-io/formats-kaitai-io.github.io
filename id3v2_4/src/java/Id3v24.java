// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="http://id3.org/id3v2.4.0-structure">Source</a>
 * @see <a href="http://id3.org/id3v2.4.0-frames">Source</a>
 */
public class Id3v24 extends KaitaiStruct {
    public static Id3v24 fromFile(String fileName) throws IOException {
        return new Id3v24(new ByteBufferKaitaiStream(fileName));
    }

    public Id3v24(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Id3v24(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Id3v24(KaitaiStream _io, KaitaiStruct _parent, Id3v24 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.tag = new Tag(this._io, this, _root);
    }

    public void _fetchInstances() {
        this.tag._fetchInstances();
    }
    public static class Footer extends KaitaiStruct {
        public static Footer fromFile(String fileName) throws IOException {
            return new Footer(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(3);
            if (!(Arrays.equals(this.magic, new byte[] { 51, 68, 73 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 51, 68, 73 }, this.magic, this._io, "/types/footer/seq/0");
            }
            this.versionMajor = this._io.readU1();
            this.versionRevision = this._io.readU1();
            this.flags = new Flags(this._io, this, _root);
            this.size = new U4beSynchsafe(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            this.size._fetchInstances();
        }
        public static class Flags extends KaitaiStruct {
            public static Flags fromFile(String fileName) throws IOException {
                return new Flags(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.flagUnsynchronization = this._io.readBitsIntBe(1) != 0;
                this.flagHeaderex = this._io.readBitsIntBe(1) != 0;
                this.flagExperimental = this._io.readBitsIntBe(1) != 0;
                this.flagFooter = this._io.readBitsIntBe(1) != 0;
                this.reserved = this._io.readBitsIntBe(4);
            }

            public void _fetchInstances() {
            }
            private boolean flagUnsynchronization;
            private boolean flagHeaderex;
            private boolean flagExperimental;
            private boolean flagFooter;
            private long reserved;
            private Id3v24 _root;
            private Id3v24.Footer _parent;
            public boolean flagUnsynchronization() { return flagUnsynchronization; }
            public boolean flagHeaderex() { return flagHeaderex; }
            public boolean flagExperimental() { return flagExperimental; }
            public boolean flagFooter() { return flagFooter; }
            public long reserved() { return reserved; }
            public Id3v24 _root() { return _root; }
            public Id3v24.Footer _parent() { return _parent; }
        }
        private byte[] magic;
        private int versionMajor;
        private int versionRevision;
        private Flags flags;
        private U4beSynchsafe size;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public byte[] magic() { return magic; }
        public int versionMajor() { return versionMajor; }
        public int versionRevision() { return versionRevision; }
        public Flags flags() { return flags; }
        public U4beSynchsafe size() { return size; }
        public Id3v24 _root() { return _root; }
        public Id3v24.Tag _parent() { return _parent; }
    }
    public static class Frame extends KaitaiStruct {
        public static Frame fromFile(String fileName) throws IOException {
            return new Frame(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.id = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.size = new U4beSynchsafe(this._io, this, _root);
            this.flagsStatus = new FlagsStatus(this._io, this, _root);
            this.flagsFormat = new FlagsFormat(this._io, this, _root);
            this.data = this._io.readBytes(size().value());
        }

        public void _fetchInstances() {
            this.size._fetchInstances();
            this.flagsStatus._fetchInstances();
            this.flagsFormat._fetchInstances();
        }
        public static class FlagsFormat extends KaitaiStruct {
            public static FlagsFormat fromFile(String fileName) throws IOException {
                return new FlagsFormat(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved1 = this._io.readBitsIntBe(1) != 0;
                this.flagGrouping = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(2);
                this.flagCompressed = this._io.readBitsIntBe(1) != 0;
                this.flagEncrypted = this._io.readBitsIntBe(1) != 0;
                this.flagUnsynchronisated = this._io.readBitsIntBe(1) != 0;
                this.flagIndicator = this._io.readBitsIntBe(1) != 0;
            }

            public void _fetchInstances() {
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
            public boolean flagGrouping() { return flagGrouping; }
            public long reserved2() { return reserved2; }
            public boolean flagCompressed() { return flagCompressed; }
            public boolean flagEncrypted() { return flagEncrypted; }
            public boolean flagUnsynchronisated() { return flagUnsynchronisated; }
            public boolean flagIndicator() { return flagIndicator; }
            public Id3v24 _root() { return _root; }
            public Id3v24.Frame _parent() { return _parent; }
        }
        public static class FlagsStatus extends KaitaiStruct {
            public static FlagsStatus fromFile(String fileName) throws IOException {
                return new FlagsStatus(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved1 = this._io.readBitsIntBe(1) != 0;
                this.flagDiscardAlterTag = this._io.readBitsIntBe(1) != 0;
                this.flagDiscardAlterFile = this._io.readBitsIntBe(1) != 0;
                this.flagReadOnly = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(4);
            }

            public void _fetchInstances() {
            }
            private boolean reserved1;
            private boolean flagDiscardAlterTag;
            private boolean flagDiscardAlterFile;
            private boolean flagReadOnly;
            private long reserved2;
            private Id3v24 _root;
            private Id3v24.Frame _parent;
            public boolean reserved1() { return reserved1; }
            public boolean flagDiscardAlterTag() { return flagDiscardAlterTag; }
            public boolean flagDiscardAlterFile() { return flagDiscardAlterFile; }
            public boolean flagReadOnly() { return flagReadOnly; }
            public long reserved2() { return reserved2; }
            public Id3v24 _root() { return _root; }
            public Id3v24.Frame _parent() { return _parent; }
        }
        private Boolean isInvalid;
        public Boolean isInvalid() {
            if (this.isInvalid != null)
                return this.isInvalid;
            this.isInvalid = id().equals("\000\000\000\000");
            return this.isInvalid;
        }
        private String id;
        private U4beSynchsafe size;
        private FlagsStatus flagsStatus;
        private FlagsFormat flagsFormat;
        private byte[] data;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public String id() { return id; }
        public U4beSynchsafe size() { return size; }
        public FlagsStatus flagsStatus() { return flagsStatus; }
        public FlagsFormat flagsFormat() { return flagsFormat; }
        public byte[] data() { return data; }
        public Id3v24 _root() { return _root; }
        public Id3v24.Tag _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(3);
            if (!(Arrays.equals(this.magic, new byte[] { 73, 68, 51 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 68, 51 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.versionMajor = this._io.readU1();
            this.versionRevision = this._io.readU1();
            this.flags = new Flags(this._io, this, _root);
            this.size = new U4beSynchsafe(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            this.size._fetchInstances();
        }
        public static class Flags extends KaitaiStruct {
            public static Flags fromFile(String fileName) throws IOException {
                return new Flags(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.flagUnsynchronization = this._io.readBitsIntBe(1) != 0;
                this.flagHeaderex = this._io.readBitsIntBe(1) != 0;
                this.flagExperimental = this._io.readBitsIntBe(1) != 0;
                this.flagFooter = this._io.readBitsIntBe(1) != 0;
                this.reserved = this._io.readBitsIntBe(4);
            }

            public void _fetchInstances() {
            }
            private boolean flagUnsynchronization;
            private boolean flagHeaderex;
            private boolean flagExperimental;
            private boolean flagFooter;
            private long reserved;
            private Id3v24 _root;
            private Id3v24.Header _parent;
            public boolean flagUnsynchronization() { return flagUnsynchronization; }
            public boolean flagHeaderex() { return flagHeaderex; }
            public boolean flagExperimental() { return flagExperimental; }
            public boolean flagFooter() { return flagFooter; }
            public long reserved() { return reserved; }
            public Id3v24 _root() { return _root; }
            public Id3v24.Header _parent() { return _parent; }
        }
        private byte[] magic;
        private int versionMajor;
        private int versionRevision;
        private Flags flags;
        private U4beSynchsafe size;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public byte[] magic() { return magic; }
        public int versionMajor() { return versionMajor; }
        public int versionRevision() { return versionRevision; }
        public Flags flags() { return flags; }
        public U4beSynchsafe size() { return size; }
        public Id3v24 _root() { return _root; }
        public Id3v24.Tag _parent() { return _parent; }
    }
    public static class HeaderEx extends KaitaiStruct {
        public static HeaderEx fromFile(String fileName) throws IOException {
            return new HeaderEx(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.size = new U4beSynchsafe(this._io, this, _root);
            this.flagsEx = new FlagsEx(this._io, this, _root);
            this.data = this._io.readBytes(size().value() - 5);
        }

        public void _fetchInstances() {
            this.size._fetchInstances();
            this.flagsEx._fetchInstances();
        }
        public static class FlagsEx extends KaitaiStruct {
            public static FlagsEx fromFile(String fileName) throws IOException {
                return new FlagsEx(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.reserved1 = this._io.readBitsIntBe(1) != 0;
                this.flagUpdate = this._io.readBitsIntBe(1) != 0;
                this.flagCrc = this._io.readBitsIntBe(1) != 0;
                this.flagRestrictions = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(4);
            }

            public void _fetchInstances() {
            }
            private boolean reserved1;
            private boolean flagUpdate;
            private boolean flagCrc;
            private boolean flagRestrictions;
            private long reserved2;
            private Id3v24 _root;
            private Id3v24.HeaderEx _parent;
            public boolean reserved1() { return reserved1; }
            public boolean flagUpdate() { return flagUpdate; }
            public boolean flagCrc() { return flagCrc; }
            public boolean flagRestrictions() { return flagRestrictions; }
            public long reserved2() { return reserved2; }
            public Id3v24 _root() { return _root; }
            public Id3v24.HeaderEx _parent() { return _parent; }
        }
        private U4beSynchsafe size;
        private FlagsEx flagsEx;
        private byte[] data;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public U4beSynchsafe size() { return size; }
        public FlagsEx flagsEx() { return flagsEx; }
        public byte[] data() { return data; }
        public Id3v24 _root() { return _root; }
        public Id3v24.Tag _parent() { return _parent; }
    }
    public static class Padding extends KaitaiStruct {
        public static Padding fromFile(String fileName) throws IOException {
            return new Padding(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.padding = this._io.readBytes(_root().tag().header().size().value() - _io().pos());
        }

        public void _fetchInstances() {
        }
        private byte[] padding;
        private Id3v24 _root;
        private Id3v24.Tag _parent;
        public byte[] padding() { return padding; }
        public Id3v24 _root() { return _root; }
        public Id3v24.Tag _parent() { return _parent; }
    }
    public static class Tag extends KaitaiStruct {
        public static Tag fromFile(String fileName) throws IOException {
            return new Tag(new ByteBufferKaitaiStream(fileName));
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
                } while (!( ((_io().pos() + _it.size().value() > header().size().value()) || (_it.isInvalid())) ));
            }
            if (!(header().flags().flagFooter())) {
                this.padding = new Padding(this._io, this, _root);
            }
            if (header().flags().flagFooter()) {
                this.footer = new Footer(this._io, this, _root);
            }
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
        private Header header;
        private HeaderEx headerEx;
        private List<Frame> frames;
        private Padding padding;
        private Footer footer;
        private Id3v24 _root;
        private Id3v24 _parent;
        public Header header() { return header; }
        public HeaderEx headerEx() { return headerEx; }
        public List<Frame> frames() { return frames; }
        public Padding padding() { return padding; }
        public Footer footer() { return footer; }
        public Id3v24 _root() { return _root; }
        public Id3v24 _parent() { return _parent; }
    }
    public static class U1beSynchsafe extends KaitaiStruct {
        public static U1beSynchsafe fromFile(String fileName) throws IOException {
            return new U1beSynchsafe(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.padding = this._io.readBitsIntBe(1) != 0;
            this.value = this._io.readBitsIntBe(7);
        }

        public void _fetchInstances() {
        }
        private boolean padding;
        private long value;
        private Id3v24 _root;
        private Id3v24.U2beSynchsafe _parent;
        public boolean padding() { return padding; }
        public long value() { return value; }
        public Id3v24 _root() { return _root; }
        public Id3v24.U2beSynchsafe _parent() { return _parent; }
    }
    public static class U2beSynchsafe extends KaitaiStruct {
        public static U2beSynchsafe fromFile(String fileName) throws IOException {
            return new U2beSynchsafe(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.byte0 = new U1beSynchsafe(this._io, this, _root);
            this.byte1 = new U1beSynchsafe(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.byte0._fetchInstances();
            this.byte1._fetchInstances();
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (byte0().value() << 7 | byte1().value())).intValue();
            return this.value;
        }
        private U1beSynchsafe byte0;
        private U1beSynchsafe byte1;
        private Id3v24 _root;
        private Id3v24.U4beSynchsafe _parent;
        public U1beSynchsafe byte0() { return byte0; }
        public U1beSynchsafe byte1() { return byte1; }
        public Id3v24 _root() { return _root; }
        public Id3v24.U4beSynchsafe _parent() { return _parent; }
    }
    public static class U4beSynchsafe extends KaitaiStruct {
        public static U4beSynchsafe fromFile(String fileName) throws IOException {
            return new U4beSynchsafe(new ByteBufferKaitaiStream(fileName));
        }

        public U4beSynchsafe(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U4beSynchsafe(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public U4beSynchsafe(KaitaiStream _io, KaitaiStruct _parent, Id3v24 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.short0 = new U2beSynchsafe(this._io, this, _root);
            this.short1 = new U2beSynchsafe(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.short0._fetchInstances();
            this.short1._fetchInstances();
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (short0().value() << 14 | short1().value())).intValue();
            return this.value;
        }
        private U2beSynchsafe short0;
        private U2beSynchsafe short1;
        private Id3v24 _root;
        private KaitaiStruct _parent;
        public U2beSynchsafe short0() { return short0; }
        public U2beSynchsafe short1() { return short1; }
        public Id3v24 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private Tag tag;
    private Id3v24 _root;
    private KaitaiStruct _parent;
    public Tag tag() { return tag; }
    public Id3v24 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
