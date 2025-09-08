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
 * .trx file format is widely used for distribution of firmware
 * updates for Broadcom devices. The most well-known are ASUS routers.
 * 
 * Fundamentally, it includes a footer which acts as a safeguard
 * against installing a firmware package on a wrong hardware model or
 * version, and a header which list numerous partitions packaged inside
 * a single .trx file.
 * 
 * trx files not necessarily contain all these headers.
 * @see <a href="https://github.com/openwrt/firmware-utils/blob/a2c80c5/src/trx.c">Source</a>
 * @see <a href="https://web.archive.org/web/20190127154419/https://openwrt.org/docs/techref/header">Source</a>
 * @see <a href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt">Source</a>
 */
public class BroadcomTrx extends KaitaiStruct.ReadWrite {
    public static BroadcomTrx fromFile(String fileName) throws IOException {
        return new BroadcomTrx(new ByteBufferKaitaiStream(fileName));
    }
    public BroadcomTrx() {
        this(null, null, null);
    }

    public BroadcomTrx(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BroadcomTrx(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public BroadcomTrx(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, BroadcomTrx _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        _dirty = false;
    }

    public void _fetchInstances() {
        header();
        if (this.header != null) {
            this.header._fetchInstances();
        }
        tail();
        if (this.tail != null) {
            this.tail._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteHeader = _enabledHeader;
        _shouldWriteTail = _enabledTail;
    }

    public void _check() {
        if (_enabledHeader) {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
        }
        if (_enabledTail) {
            if (!Objects.equals(this.tail._root(), _root()))
                throw new ConsistencyError("tail", _root(), this.tail._root());
            if (!Objects.equals(this.tail._parent(), this))
                throw new ConsistencyError("tail", this, this.tail._parent());
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

        public Header(KaitaiStream _io, BroadcomTrx _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, BroadcomTrx _parent, BroadcomTrx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 72, 68, 82, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 72, 68, 82, 48 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.len = this._io.readU4le();
            this.crc32 = this._io.readU4le();
            this.version = this._io.readU2le();
            this.flags = new Flags(this._io, this, _root);
            this.flags._read();
            this.partitions = new ArrayList<Partition>();
            {
                Partition _it;
                int i = 0;
                do {
                    Partition _t_partitions = new Partition(this._io, this, _root, i);
                    try {
                        _t_partitions._read();
                    } finally {
                        _it = _t_partitions;
                        this.partitions.add(_it);
                    }
                    i++;
                } while (!( ((i >= 4) || (!(_it.isPresent()))) ));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            for (int i = 0; i < this.partitions.size(); i++) {
                this.partitions.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.len);
            this._io.writeU4le(this.crc32);
            this._io.writeU2le(this.version);
            this.flags._write_Seq(this._io);
            for (int i = 0; i < this.partitions.size(); i++) {
                this.partitions.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 72, 68, 82, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 72, 68, 82, 48 }, this.magic, null, "/types/header/seq/0");
            }
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (this.partitions.size() == 0)
                throw new ConsistencyError("partitions", 0, this.partitions.size());
            for (int i = 0; i < this.partitions.size(); i++) {
                if (!Objects.equals(this.partitions.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("partitions", _root(), this.partitions.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.partitions.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("partitions", this, this.partitions.get(((Number) (i)).intValue())._parent());
                if (this.partitions.get(((Number) (i)).intValue()).idx() != i)
                    throw new ConsistencyError("partitions", i, this.partitions.get(((Number) (i)).intValue()).idx());
                {
                    Partition _it = this.partitions.get(((Number) (i)).intValue());
                    if ( ((i >= 4) || (!(_it.isPresent())))  != (i == this.partitions.size() - 1))
                        throw new ConsistencyError("partitions", i == this.partitions.size() - 1,  ((i >= 4) || (!(_it.isPresent()))) );
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

            public Flags(KaitaiStream _io, BroadcomTrx.Header _parent) {
                this(_io, _parent, null);
            }

            public Flags(KaitaiStream _io, BroadcomTrx.Header _parent, BroadcomTrx _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.flags = new ArrayList<Boolean>();
                for (int i = 0; i < 16; i++) {
                    this.flags.add(this._io.readBitsIntLe(1) != 0);
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.flags.size(); i++) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                for (int i = 0; i < this.flags.size(); i++) {
                    this._io.writeBitsIntLe(1, (this.flags.get(((Number) (i)).intValue()) ? 1 : 0));
                }
            }

            public void _check() {
                if (this.flags.size() != 16)
                    throw new ConsistencyError("flags", 16, this.flags.size());
                for (int i = 0; i < this.flags.size(); i++) {
                }
                _dirty = false;
            }
            private List<Boolean> flags;
            private BroadcomTrx _root;
            private BroadcomTrx.Header _parent;
            public List<Boolean> flags() { return flags; }
            public void setFlags(List<Boolean> _v) { _dirty = true; flags = _v; }
            public BroadcomTrx _root() { return _root; }
            public void set_root(BroadcomTrx _v) { _dirty = true; _root = _v; }
            public BroadcomTrx.Header _parent() { return _parent; }
            public void set_parent(BroadcomTrx.Header _v) { _dirty = true; _parent = _v; }
        }
        public static class Partition extends KaitaiStruct.ReadWrite {
            public Partition(int idx) {
                this(null, null, null, idx);
            }

            public Partition(KaitaiStream _io, int idx) {
                this(_io, null, null, idx);
            }

            public Partition(KaitaiStream _io, BroadcomTrx.Header _parent, int idx) {
                this(_io, _parent, null, idx);
            }

            public Partition(KaitaiStream _io, BroadcomTrx.Header _parent, BroadcomTrx _root, int idx) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.idx = idx;
            }
            public void _read() {
                this.ofsBody = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
                body();
                if (this.body != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteBody = _enabledBody;
                this._io.writeU4le(this.ofsBody);
            }

            public void _check() {
                if (_enabledBody) {
                    if (isPresent()) {
                    }
                }
                _dirty = false;
            }
            private byte[] body;
            private boolean _shouldWriteBody = false;
            private boolean _enabledBody = true;
            public byte[] body() {
                if (_shouldWriteBody)
                    _writeBody();
                if (this.body != null)
                    return this.body;
                if (!_enabledBody)
                    return null;
                if (isPresent()) {
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek(ofsBody());
                    this.body = io.readBytes(lenBody());
                    io.seek(_pos);
                }
                return this.body;
            }
            public void setBody(byte[] _v) { _dirty = true; body = _v; }
            public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

            private void _writeBody() {
                _shouldWriteBody = false;
                if (isPresent()) {
                    KaitaiStream io = _root()._io();
                    long _pos = io.pos();
                    io.seek(ofsBody());
                    if (this.body.length != lenBody())
                        throw new ConsistencyError("body", lenBody(), this.body.length);
                    io.writeBytes(this.body);
                    io.seek(_pos);
                }
            }
            private Boolean isLast;
            public Boolean isLast() {
                if (this.isLast != null)
                    return this.isLast;
                if (isPresent()) {
                    this.isLast =  ((idx() == _parent().partitions().size() - 1) || (!(_parent().partitions().get(((Number) (idx() + 1)).intValue()).isPresent()))) ;
                }
                return this.isLast;
            }
            public void _invalidateIsLast() { this.isLast = null; }
            private Boolean isPresent;
            public Boolean isPresent() {
                if (this.isPresent != null)
                    return this.isPresent;
                this.isPresent = ofsBody() != 0;
                return this.isPresent;
            }
            public void _invalidateIsPresent() { this.isPresent = null; }
            private Integer lenBody;
            public Integer lenBody() {
                if (this.lenBody != null)
                    return this.lenBody;
                if (isPresent()) {
                    this.lenBody = ((Number) ((isLast() ? _root()._io().size() - ofsBody() : _parent().partitions().get(((Number) (idx() + 1)).intValue()).ofsBody()))).intValue();
                }
                return this.lenBody;
            }
            public void _invalidateLenBody() { this.lenBody = null; }
            private long ofsBody;
            private int idx;
            private BroadcomTrx _root;
            private BroadcomTrx.Header _parent;
            public long ofsBody() { return ofsBody; }
            public void setOfsBody(long _v) { _dirty = true; ofsBody = _v; }
            public int idx() { return idx; }
            public void setIdx(int _v) { _dirty = true; idx = _v; }
            public BroadcomTrx _root() { return _root; }
            public void set_root(BroadcomTrx _v) { _dirty = true; _root = _v; }
            public BroadcomTrx.Header _parent() { return _parent; }
            public void set_parent(BroadcomTrx.Header _v) { _dirty = true; _parent = _v; }
        }
        private byte[] magic;
        private long len;
        private long crc32;
        private int version;
        private Flags flags;
        private List<Partition> partitions;
        private BroadcomTrx _root;
        private BroadcomTrx _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * Length of file including header
         */
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }

        /**
         * CRC from `version` (??? todo: see the original and disambiguate) to end of file
         */
        public long crc32() { return crc32; }
        public void setCrc32(long _v) { _dirty = true; crc32 = _v; }
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public Flags flags() { return flags; }
        public void setFlags(Flags _v) { _dirty = true; flags = _v; }

        /**
         * Offsets of partitions from start of header
         */
        public List<Partition> partitions() { return partitions; }
        public void setPartitions(List<Partition> _v) { _dirty = true; partitions = _v; }
        public BroadcomTrx _root() { return _root; }
        public void set_root(BroadcomTrx _v) { _dirty = true; _root = _v; }
        public BroadcomTrx _parent() { return _parent; }
        public void set_parent(BroadcomTrx _v) { _dirty = true; _parent = _v; }
    }
    public static class Revision extends KaitaiStruct.ReadWrite {
        public static Revision fromFile(String fileName) throws IOException {
            return new Revision(new ByteBufferKaitaiStream(fileName));
        }
        public Revision() {
            this(null, null, null);
        }

        public Revision(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Revision(KaitaiStream _io, BroadcomTrx.Tail.HwCompInfo _parent) {
            this(_io, _parent, null);
        }

        public Revision(KaitaiStream _io, BroadcomTrx.Tail.HwCompInfo _parent, BroadcomTrx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.major = this._io.readU1();
            this.minor = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.major);
            this._io.writeU1(this.minor);
        }

        public void _check() {
            _dirty = false;
        }
        private int major;
        private int minor;
        private BroadcomTrx _root;
        private BroadcomTrx.Tail.HwCompInfo _parent;
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public int minor() { return minor; }
        public void setMinor(int _v) { _dirty = true; minor = _v; }
        public BroadcomTrx _root() { return _root; }
        public void set_root(BroadcomTrx _v) { _dirty = true; _root = _v; }
        public BroadcomTrx.Tail.HwCompInfo _parent() { return _parent; }
        public void set_parent(BroadcomTrx.Tail.HwCompInfo _v) { _dirty = true; _parent = _v; }
    }

    /**
     * A safeguard against installation of firmware to an incompatible device
     */
    public static class Tail extends KaitaiStruct.ReadWrite {
        public static Tail fromFile(String fileName) throws IOException {
            return new Tail(new ByteBufferKaitaiStream(fileName));
        }
        public Tail() {
            this(null, null, null);
        }

        public Tail(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Tail(KaitaiStream _io, BroadcomTrx _parent) {
            this(_io, _parent, null);
        }

        public Tail(KaitaiStream _io, BroadcomTrx _parent, BroadcomTrx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = new Version(this._io, this, _root);
            this.version._read();
            this.productId = new String(KaitaiStream.bytesTerminate(this._io.readBytes(12), (byte) 0, false), StandardCharsets.UTF_8);
            this.compHw = new ArrayList<HwCompInfo>();
            for (int i = 0; i < 4; i++) {
                HwCompInfo _t_compHw = new HwCompInfo(this._io, this, _root);
                try {
                    _t_compHw._read();
                } finally {
                    this.compHw.add(_t_compHw);
                }
            }
            this.reserved = this._io.readBytes(32);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
            for (int i = 0; i < this.compHw.size(); i++) {
                this.compHw.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.version._write_Seq(this._io);
            this._io.writeBytesLimit((this.productId).getBytes(Charset.forName("UTF-8")), 12, (byte) 0, (byte) 0);
            for (int i = 0; i < this.compHw.size(); i++) {
                this.compHw.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            if ((this.productId).getBytes(Charset.forName("UTF-8")).length > 12)
                throw new ConsistencyError("product_id", 12, (this.productId).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.byteArrayIndexOf((this.productId).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("product_id", -1, KaitaiStream.byteArrayIndexOf((this.productId).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            if (this.compHw.size() != 4)
                throw new ConsistencyError("comp_hw", 4, this.compHw.size());
            for (int i = 0; i < this.compHw.size(); i++) {
                if (!Objects.equals(this.compHw.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("comp_hw", _root(), this.compHw.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.compHw.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("comp_hw", this, this.compHw.get(((Number) (i)).intValue())._parent());
            }
            if (this.reserved.length != 32)
                throw new ConsistencyError("reserved", 32, this.reserved.length);
            _dirty = false;
        }
        public static class HwCompInfo extends KaitaiStruct.ReadWrite {
            public static HwCompInfo fromFile(String fileName) throws IOException {
                return new HwCompInfo(new ByteBufferKaitaiStream(fileName));
            }
            public HwCompInfo() {
                this(null, null, null);
            }

            public HwCompInfo(KaitaiStream _io) {
                this(_io, null, null);
            }

            public HwCompInfo(KaitaiStream _io, BroadcomTrx.Tail _parent) {
                this(_io, _parent, null);
            }

            public HwCompInfo(KaitaiStream _io, BroadcomTrx.Tail _parent, BroadcomTrx _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.min = new Revision(this._io, this, _root);
                this.min._read();
                this.max = new Revision(this._io, this, _root);
                this.max._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.min._fetchInstances();
                this.max._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.min._write_Seq(this._io);
                this.max._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.min._root(), _root()))
                    throw new ConsistencyError("min", _root(), this.min._root());
                if (!Objects.equals(this.min._parent(), this))
                    throw new ConsistencyError("min", this, this.min._parent());
                if (!Objects.equals(this.max._root(), _root()))
                    throw new ConsistencyError("max", _root(), this.max._root());
                if (!Objects.equals(this.max._parent(), this))
                    throw new ConsistencyError("max", this, this.max._parent());
                _dirty = false;
            }
            private Revision min;
            private Revision max;
            private BroadcomTrx _root;
            private BroadcomTrx.Tail _parent;
            public Revision min() { return min; }
            public void setMin(Revision _v) { _dirty = true; min = _v; }
            public Revision max() { return max; }
            public void setMax(Revision _v) { _dirty = true; max = _v; }
            public BroadcomTrx _root() { return _root; }
            public void set_root(BroadcomTrx _v) { _dirty = true; _root = _v; }
            public BroadcomTrx.Tail _parent() { return _parent; }
            public void set_parent(BroadcomTrx.Tail _v) { _dirty = true; _parent = _v; }
        }
        private Version version;
        private String productId;
        private List<HwCompInfo> compHw;
        private byte[] reserved;
        private BroadcomTrx _root;
        private BroadcomTrx _parent;

        /**
         * 1.9.2.7 by default
         */
        public Version version() { return version; }
        public void setVersion(Version _v) { _dirty = true; version = _v; }
        public String productId() { return productId; }
        public void setProductId(String _v) { _dirty = true; productId = _v; }

        /**
         * 0.02 - 2.99
         */
        public List<HwCompInfo> compHw() { return compHw; }
        public void setCompHw(List<HwCompInfo> _v) { _dirty = true; compHw = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public BroadcomTrx _root() { return _root; }
        public void set_root(BroadcomTrx _v) { _dirty = true; _root = _v; }
        public BroadcomTrx _parent() { return _parent; }
        public void set_parent(BroadcomTrx _v) { _dirty = true; _parent = _v; }
    }
    public static class Version extends KaitaiStruct.ReadWrite {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }
        public Version() {
            this(null, null, null);
        }

        public Version(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Version(KaitaiStream _io, BroadcomTrx.Tail _parent) {
            this(_io, _parent, null);
        }

        public Version(KaitaiStream _io, BroadcomTrx.Tail _parent, BroadcomTrx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.major = this._io.readU1();
            this.minor = this._io.readU1();
            this.patch = this._io.readU1();
            this.tweak = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.major);
            this._io.writeU1(this.minor);
            this._io.writeU1(this.patch);
            this._io.writeU1(this.tweak);
        }

        public void _check() {
            _dirty = false;
        }
        private int major;
        private int minor;
        private int patch;
        private int tweak;
        private BroadcomTrx _root;
        private BroadcomTrx.Tail _parent;
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public int minor() { return minor; }
        public void setMinor(int _v) { _dirty = true; minor = _v; }
        public int patch() { return patch; }
        public void setPatch(int _v) { _dirty = true; patch = _v; }
        public int tweak() { return tweak; }
        public void setTweak(int _v) { _dirty = true; tweak = _v; }
        public BroadcomTrx _root() { return _root; }
        public void set_root(BroadcomTrx _v) { _dirty = true; _root = _v; }
        public BroadcomTrx.Tail _parent() { return _parent; }
        public void set_parent(BroadcomTrx.Tail _v) { _dirty = true; _parent = _v; }
    }
    private Header header;
    private boolean _shouldWriteHeader = false;
    private boolean _enabledHeader = true;
    public Header header() {
        if (_shouldWriteHeader)
            _writeHeader();
        if (this.header != null)
            return this.header;
        if (!_enabledHeader)
            return null;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.header = new Header(this._io, this, _root);
        this.header._read();
        this._io.seek(_pos);
        return this.header;
    }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public void setHeader_Enabled(boolean _v) { _dirty = true; _enabledHeader = _v; }

    private void _writeHeader() {
        _shouldWriteHeader = false;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.header._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private Tail tail;
    private boolean _shouldWriteTail = false;
    private boolean _enabledTail = true;
    public Tail tail() {
        if (_shouldWriteTail)
            _writeTail();
        if (this.tail != null)
            return this.tail;
        if (!_enabledTail)
            return null;
        long _pos = this._io.pos();
        this._io.seek(_io().size() - 64);
        this.tail = new Tail(this._io, this, _root);
        this.tail._read();
        this._io.seek(_pos);
        return this.tail;
    }
    public void setTail(Tail _v) { _dirty = true; tail = _v; }
    public void setTail_Enabled(boolean _v) { _dirty = true; _enabledTail = _v; }

    private void _writeTail() {
        _shouldWriteTail = false;
        long _pos = this._io.pos();
        this._io.seek(_io().size() - 64);
        this.tail._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private BroadcomTrx _root;
    private KaitaiStruct.ReadWrite _parent;
    public BroadcomTrx _root() { return _root; }
    public void set_root(BroadcomTrx _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
