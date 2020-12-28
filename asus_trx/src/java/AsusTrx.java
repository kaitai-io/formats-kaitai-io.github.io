// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;


/**
 * Header and a footer for stock firmwares used on some ASUS routers. trx files not necessarily contain these headers.
 * @see <a href="https://github.com/openwrt/openwrt/blob/master/tools/firmware-utils/src/trx.c">Source</a>
 */
public class AsusTrx extends KaitaiStruct {
    public static AsusTrx fromFile(String fileName) throws IOException {
        return new AsusTrx(new ByteBufferKaitaiStream(fileName));
    }

    public AsusTrx(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AsusTrx(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AsusTrx(KaitaiStream _io, KaitaiStruct _parent, AsusTrx _root) {
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

        public Revision(KaitaiStream _io, AsusTrx.Tail.HwCompInfo _parent) {
            this(_io, _parent, null);
        }

        public Revision(KaitaiStream _io, AsusTrx.Tail.HwCompInfo _parent, AsusTrx _root) {
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
        private AsusTrx _root;
        private AsusTrx.Tail.HwCompInfo _parent;
        public int major() { return major; }
        public int minor() { return minor; }
        public AsusTrx _root() { return _root; }
        public AsusTrx.Tail.HwCompInfo _parent() { return _parent; }
    }
    public static class Version extends KaitaiStruct {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }

        public Version(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Version(KaitaiStream _io, AsusTrx.Tail _parent) {
            this(_io, _parent, null);
        }

        public Version(KaitaiStream _io, AsusTrx.Tail _parent, AsusTrx _root) {
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
        private AsusTrx _root;
        private AsusTrx.Tail _parent;
        public int major() { return major; }
        public int minor() { return minor; }
        public int patch() { return patch; }
        public int tweak() { return tweak; }
        public AsusTrx _root() { return _root; }
        public AsusTrx.Tail _parent() { return _parent; }
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

        public Tail(KaitaiStream _io, AsusTrx _parent) {
            this(_io, _parent, null);
        }

        public Tail(KaitaiStream _io, AsusTrx _parent, AsusTrx _root) {
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

            public HwCompInfo(KaitaiStream _io, AsusTrx.Tail _parent) {
                this(_io, _parent, null);
            }

            public HwCompInfo(KaitaiStream _io, AsusTrx.Tail _parent, AsusTrx _root) {
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
            private AsusTrx _root;
            private AsusTrx.Tail _parent;
            public Revision min() { return min; }
            public Revision max() { return max; }
            public AsusTrx _root() { return _root; }
            public AsusTrx.Tail _parent() { return _parent; }
        }
        private Version version;
        private String productId;
        private ArrayList<HwCompInfo> compHw;
        private byte[] reserved;
        private AsusTrx _root;
        private AsusTrx _parent;

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
        public AsusTrx _root() { return _root; }
        public AsusTrx _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, AsusTrx _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, AsusTrx _parent, AsusTrx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.signature = this._io.readBytes(4);
            if (!(Arrays.equals(signature(), new byte[] { 72, 68, 82, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 72, 68, 82, 48 }, signature(), _io(), "/types/header/seq/0");
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
                } while (!( ((i >= 4) || (!(_it.present()))) ));
            }
        }
        public static class Partition extends KaitaiStruct {

            public Partition(KaitaiStream _io, int idx) {
                this(_io, null, null, idx);
            }

            public Partition(KaitaiStream _io, AsusTrx.Header _parent, int idx) {
                this(_io, _parent, null, idx);
            }

            public Partition(KaitaiStream _io, AsusTrx.Header _parent, AsusTrx _root, int idx) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.idx = idx;
                _read();
            }
            private void _read() {
                this.offset = this._io.readU4le();
            }
            private Boolean present;
            public Boolean present() {
                if (this.present != null)
                    return this.present;
                boolean _tmp = (boolean) (offset() != 0);
                this.present = _tmp;
                return this.present;
            }
            private Boolean isLast;
            public Boolean isLast() {
                if (this.isLast != null)
                    return this.isLast;
                if (present()) {
                    boolean _tmp = (boolean) ( ((idx() == (_parent().partitions().size() - 1)) || (!(_parent().partitions().get((int) (idx() + 1)).present()))) );
                    this.isLast = _tmp;
                }
                return this.isLast;
            }
            private Integer size;
            public Integer size() {
                if (this.size != null)
                    return this.size;
                if (present()) {
                    int _tmp = (int) ((isLast() ? (_root._io().size() - offset()) : _parent().partitions().get((int) (idx() + 1)).offset()));
                    this.size = _tmp;
                }
                return this.size;
            }
            private byte[] partition;
            public byte[] partition() {
                if (this.partition != null)
                    return this.partition;
                if (present()) {
                    KaitaiStream io = _root._io();
                    long _pos = io.pos();
                    io.seek(offset());
                    this.partition = io.readBytes(size());
                    io.seek(_pos);
                }
                return this.partition;
            }
            private long offset;
            private int idx;
            private AsusTrx _root;
            private AsusTrx.Header _parent;
            public long offset() { return offset; }
            public int idx() { return idx; }
            public AsusTrx _root() { return _root; }
            public AsusTrx.Header _parent() { return _parent; }
        }
        public static class Flags extends KaitaiStruct {
            public static Flags fromFile(String fileName) throws IOException {
                return new Flags(new ByteBufferKaitaiStream(fileName));
            }

            public Flags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Flags(KaitaiStream _io, AsusTrx.Header _parent) {
                this(_io, _parent, null);
            }

            public Flags(KaitaiStream _io, AsusTrx.Header _parent, AsusTrx _root) {
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
            private AsusTrx _root;
            private AsusTrx.Header _parent;
            public ArrayList<Boolean> flags() { return flags; }
            public AsusTrx _root() { return _root; }
            public AsusTrx.Header _parent() { return _parent; }
        }
        private byte[] signature;
        private long len;
        private long crc32;
        private int version;
        private Flags flags;
        private ArrayList<Partition> partitions;
        private AsusTrx _root;
        private AsusTrx _parent;
        public byte[] signature() { return signature; }

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
        public AsusTrx _root() { return _root; }
        public AsusTrx _parent() { return _parent; }
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
    private AsusTrx _root;
    private KaitaiStruct _parent;
    public AsusTrx _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
