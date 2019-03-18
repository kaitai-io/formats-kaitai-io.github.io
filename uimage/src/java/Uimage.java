// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;


/**
 * The new uImage format allows more flexibility in handling images of various
 * types (kernel, ramdisk, etc.), it also enhances integrity protection of images
 * with sha1 and md5 checksums.
 * @see <a href="https://github.com/EmcraftSystems/u-boot/blob/master/include/image.h">Source</a>
 */
public class Uimage extends KaitaiStruct {
    public static Uimage fromFile(String fileName) throws IOException {
        return new Uimage(new ByteBufferKaitaiStream(fileName));
    }

    public enum UimageOs {
        INVALID(0),
        OPENBSD(1),
        NETBSD(2),
        FREEBSD(3),
        BSD4_4(4),
        LINUX(5),
        SVR4(6),
        ESIX(7),
        SOLARIS(8),
        IRIX(9),
        SCO(10),
        DELL(11),
        NCR(12),
        LYNXOS(13),
        VXWORKS(14),
        PSOS(15),
        QNX(16),
        U_BOOT(17),
        RTEMS(18),
        ARTOS(19),
        UNITY(20),
        INTEGRITY(21);

        private final long id;
        UimageOs(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, UimageOs> byId = new HashMap<Long, UimageOs>(22);
        static {
            for (UimageOs e : UimageOs.values())
                byId.put(e.id(), e);
        }
        public static UimageOs byId(long id) { return byId.get(id); }
    }

    public enum UimageArch {
        INVALID(0),
        ALPHA(1),
        ARM(2),
        I386(3),
        IA64(4),
        MIPS(5),
        MIPS64(6),
        PPC(7),
        S390(8),
        SH(9),
        SPARC(10),
        SPARC64(11),
        M68K(12),
        NIOS(13),
        MICROBLAZE(14),
        NIOS2(15),
        BLACKFIN(16),
        AVR32(17),
        ST200(18);

        private final long id;
        UimageArch(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, UimageArch> byId = new HashMap<Long, UimageArch>(19);
        static {
            for (UimageArch e : UimageArch.values())
                byId.put(e.id(), e);
        }
        public static UimageArch byId(long id) { return byId.get(id); }
    }

    public enum UimageComp {
        NONE(0),
        GZIP(1),
        BZIP2(2),
        LZMA(3),
        LZO(4);

        private final long id;
        UimageComp(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, UimageComp> byId = new HashMap<Long, UimageComp>(5);
        static {
            for (UimageComp e : UimageComp.values())
                byId.put(e.id(), e);
        }
        public static UimageComp byId(long id) { return byId.get(id); }
    }

    public enum UimageType {
        INVALID(0),
        STANDALONE(1),
        KERNEL(2),
        RAMDISK(3),
        MULTI(4),
        FIRMWARE(5),
        SCRIPT(6),
        FILESYSTEM(7),
        FLATDT(8),
        KWBIMAGE(9),
        IMXIMAGE(10);

        private final long id;
        UimageType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, UimageType> byId = new HashMap<Long, UimageType>(11);
        static {
            for (UimageType e : UimageType.values())
                byId.put(e.id(), e);
        }
        public static UimageType byId(long id) { return byId.get(id); }
    }

    public Uimage(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Uimage(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Uimage(KaitaiStream _io, KaitaiStruct _parent, Uimage _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Uheader(this._io, this, _root);
        this.data = this._io.readBytes(header().lenImage());
    }
    public static class Uheader extends KaitaiStruct {
        public static Uheader fromFile(String fileName) throws IOException {
            return new Uheader(new ByteBufferKaitaiStream(fileName));
        }

        public Uheader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Uheader(KaitaiStream _io, Uimage _parent) {
            this(_io, _parent, null);
        }

        public Uheader(KaitaiStream _io, Uimage _parent, Uimage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { 39, 5, 25, 86 });
            this.headerCrc = this._io.readU4be();
            this.timestamp = this._io.readU4be();
            this.lenImage = this._io.readU4be();
            this.loadAddress = this._io.readU4be();
            this.entryAddress = this._io.readU4be();
            this.dataCrc = this._io.readU4be();
            this.osType = Uimage.UimageOs.byId(this._io.readU1());
            this.architecture = Uimage.UimageArch.byId(this._io.readU1());
            this.imageType = Uimage.UimageType.byId(this._io.readU1());
            this.compressionType = Uimage.UimageComp.byId(this._io.readU1());
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), Charset.forName("UTF-8"));
        }
        private byte[] magic;
        private long headerCrc;
        private long timestamp;
        private long lenImage;
        private long loadAddress;
        private long entryAddress;
        private long dataCrc;
        private UimageOs osType;
        private UimageArch architecture;
        private UimageType imageType;
        private UimageComp compressionType;
        private String name;
        private Uimage _root;
        private Uimage _parent;
        public byte[] magic() { return magic; }
        public long headerCrc() { return headerCrc; }
        public long timestamp() { return timestamp; }
        public long lenImage() { return lenImage; }
        public long loadAddress() { return loadAddress; }
        public long entryAddress() { return entryAddress; }
        public long dataCrc() { return dataCrc; }
        public UimageOs osType() { return osType; }
        public UimageArch architecture() { return architecture; }
        public UimageType imageType() { return imageType; }
        public UimageComp compressionType() { return compressionType; }
        public String name() { return name; }
        public Uimage _root() { return _root; }
        public Uimage _parent() { return _parent; }
    }
    private Uheader header;
    private byte[] data;
    private Uimage _root;
    private KaitaiStruct _parent;
    public Uheader header() { return header; }
    public byte[] data() { return data; }
    public Uimage _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
