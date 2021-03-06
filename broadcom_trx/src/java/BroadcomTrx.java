// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;


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
 * @see <a href="https://github.com/openwrt/openwrt/blob/3f5619f/tools/firmware-utils/src/trx.c">Source</a>
 * @see <a href="https://web.archive.org/web/20190127154419/https://openwrt.org/docs/techref/header">Source</a>
 * @see <a href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt">Source</a>
 */
public class BroadcomTrx extends KaitaiStruct {
    public static BroadcomTrx fromFile(String fileName) throws IOException {
        return new BroadcomTrx(new ByteBufferKaitaiStream(fileName));
    }

    public BroadcomTrx(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BroadcomTrx(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public BroadcomTrx(KaitaiStream _io, KaitaiStruct _parent, BroadcomTrx _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
    }
    public static class Revision extends KaitaiStruct {
        public static Revision fromFile(String fileName) throws IOException {
            return new Revision(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.major = this._io.readU1();
            this.minor = this._io.readU1();
        }
        private int major;
        private int minor;
        private BroadcomTrx _root;
        private BroadcomTrx.Tail.HwCompInfo _parent;
        public int major() { return major; }
        public int minor() { return minor; }
        public BroadcomTrx _root() { return _root; }
        public BroadcomTrx.Tail.HwCompInfo _parent() { return _parent; }
    }
    public static class Version extends KaitaiStruct {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.major = this._io.readU1();
            this.minor = this._io.readU1();
            this.patch = this._io.readU1();
            this.tweak = this._io.readU1();
        }
        private int major;
        private int minor;
        private int patch;
        private int tweak;
        private BroadcomTrx _root;
        private BroadcomTrx.Tail _parent;
        public int major() { return major; }
        public int minor() { return minor; }
        public int patch() { return patch; }
        public int tweak() { return tweak; }
        public BroadcomTrx _root() { return _root; }
        public BroadcomTrx.Tail _parent() { return _parent; }
    }

    /**
     * A safeguard against installation of firmware to an incompatible device
     */
    public static class Tail extends KaitaiStruct {
        public static Tail fromFile(String fileName) throws IOException {
            return new Tail(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.version = new Version(this._io, this, _root);
            this.productId = new String(KaitaiStream.bytesTerminate(this._io.readBytes(12), (byte) 0, false), Charset.forName("utf-8"));
            compHw = new ArrayList<HwCompInfo>(((Number) (4)).intValue());
            for (int i = 0; i < 4; i++) {
                this.compHw.add(new HwCompInfo(this._io, this, _root));
            }
            this.reserved = this._io.readBytes(32);
        }
        public static class HwCompInfo extends KaitaiStruct {
            public static HwCompInfo fromFile(String fileName) throws IOException {
                return new HwCompInfo(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.min = new Revision(this._io, this, _root);
                this.max = new Revision(this._io, this, _root);
            }
            private Revision min;
            private Revision max;
            private BroadcomTrx _root;
            private BroadcomTrx.Tail _parent;
            public Revision min() { return min; }
            public Revision max() { return max; }
            public BroadcomTrx _root() { return _root; }
            public BroadcomTrx.Tail _parent() { return _parent; }
        }
        private Version version;
        private String productId;
        private ArrayList<HwCompInfo> compHw;
        private byte[] reserved;
        private BroadcomTrx _root;
        private BroadcomTrx _parent;

        /**
         * 1.9.2.7 by default
         */
        public Version version() { return version; }
        public String productId() { return productId; }

        /**
         * 0.02 - 2.99
         */
        public ArrayList<HwCompInfo> compHw() { return compHw; }
        public byte[] reserved() { return reserved; }
        public BroadcomTrx _root() { return _root; }
        public BroadcomTrx _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { 72, 68, 82, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 72, 68, 82, 48 }, magic(), _io(), "/types/header/seq/0");
            }
            this.len = this._io.readU4le();
            this.crc32 = this._io.readU4le();
            this.version = this._io.readU2le();
            this.flags = new Flags(this._io, this, _root);
            this.partitions = new ArrayList<Partition>();
            {
                Partition _it;
                int i = 0;
                do {
                    _it = new Partition(this._io, this, _root, i);
                    this.partitions.add(_it);
                    i++;
                } while (!( ((i >= 4) || (!(_it.isPresent()))) ));
            }
        }
        public static class Partition extends KaitaiStruct {

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
                _read();
            }
            private void _read() {
                this.ofsBody = this._io.readU4le();
            }
            private Boolean isPresent;
            public Boolean isPresent() {
                if (this.isPresent != null)
                    return this.isPresent;
                boolean _tmp = (boolean) (ofsBody() != 0);
                this.isPresent = _tmp;
                return this.isPresent;
            }
            private Boolean isLast;
            public Boolean isLast() {
                if (this.isLast != null)
                    return this.isLast;
                if (isPresent()) {
                    boolean _tmp = (boolean) ( ((idx() == (_parent().partitions().size() - 1)) || (!(_parent().partitions().get((int) (idx() + 1)).isPresent()))) );
                    this.isLast = _tmp;
                }
                return this.isLast;
            }
            private Integer lenBody;
            public Integer lenBody() {
                if (this.lenBody != null)
                    return this.lenBody;
                if (isPresent()) {
                    int _tmp = (int) ((isLast() ? (_root._io().size() - ofsBody()) : _parent().partitions().get((int) (idx() + 1)).ofsBody()));
                    this.lenBody = _tmp;
                }
                return this.lenBody;
            }
            private byte[] body;
            public byte[] body() {
                if (this.body != null)
                    return this.body;
                if (isPresent()) {
                    KaitaiStream io = _root._io();
                    long _pos = io.pos();
                    io.seek(ofsBody());
                    this.body = io.readBytes(lenBody());
                    io.seek(_pos);
                }
                return this.body;
            }
            private long ofsBody;
            private int idx;
            private BroadcomTrx _root;
            private BroadcomTrx.Header _parent;
            public long ofsBody() { return ofsBody; }
            public int idx() { return idx; }
            public BroadcomTrx _root() { return _root; }
            public BroadcomTrx.Header _parent() { return _parent; }
        }
        public static class Flags extends KaitaiStruct {
            public static Flags fromFile(String fileName) throws IOException {
                return new Flags(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                flags = new ArrayList<Boolean>(((Number) (16)).intValue());
                for (int i = 0; i < 16; i++) {
                    this.flags.add(this._io.readBitsIntLe(1) != 0);
                }
            }
            private ArrayList<Boolean> flags;
            private BroadcomTrx _root;
            private BroadcomTrx.Header _parent;
            public ArrayList<Boolean> flags() { return flags; }
            public BroadcomTrx _root() { return _root; }
            public BroadcomTrx.Header _parent() { return _parent; }
        }
        private byte[] magic;
        private long len;
        private long crc32;
        private int version;
        private Flags flags;
        private ArrayList<Partition> partitions;
        private BroadcomTrx _root;
        private BroadcomTrx _parent;
        public byte[] magic() { return magic; }

        /**
         * Length of file including header
         */
        public long len() { return len; }

        /**
         * CRC from `version` (??? todo: see the original and disambiguate) to end of file
         */
        public long crc32() { return crc32; }
        public int version() { return version; }
        public Flags flags() { return flags; }

        /**
         * Offsets of partitions from start of header
         */
        public ArrayList<Partition> partitions() { return partitions; }
        public BroadcomTrx _root() { return _root; }
        public BroadcomTrx _parent() { return _parent; }
    }
    private Header header;
    public Header header() {
        if (this.header != null)
            return this.header;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.header = new Header(this._io, this, _root);
        this._io.seek(_pos);
        return this.header;
    }
    private Tail tail;
    public Tail tail() {
        if (this.tail != null)
            return this.tail;
        long _pos = this._io.pos();
        this._io.seek((_io().size() - 64));
        this.tail = new Tail(this._io, this, _root);
        this._io.seek(_pos);
        return this.tail;
    }
    private BroadcomTrx _root;
    private KaitaiStruct _parent;
    public BroadcomTrx _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
