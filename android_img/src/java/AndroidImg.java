// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.Charset;


/**
 * @see <a href="https://source.android.com/docs/core/architecture/bootloader/boot-image-header">Source</a>
 */
public class AndroidImg extends KaitaiStruct {
    public static AndroidImg fromFile(String fileName) throws IOException {
        return new AndroidImg(new ByteBufferKaitaiStream(fileName));
    }

    public AndroidImg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidImg(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AndroidImg(KaitaiStream _io, KaitaiStruct _parent, AndroidImg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(magic(), new byte[] { 65, 78, 68, 82, 79, 73, 68, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 78, 68, 82, 79, 73, 68, 33 }, magic(), _io(), "/seq/0");
        }
        this.kernel = new Load(this._io, this, _root);
        this.ramdisk = new Load(this._io, this, _root);
        this.second = new Load(this._io, this, _root);
        this.tagsLoad = this._io.readU4le();
        this.pageSize = this._io.readU4le();
        this.headerVersion = this._io.readU4le();
        this.osVersion = new OsVersion(this._io, this, _root);
        this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), Charset.forName("ASCII"));
        this.cmdline = new String(KaitaiStream.bytesTerminate(this._io.readBytes(512), (byte) 0, false), Charset.forName("ASCII"));
        this.sha = this._io.readBytes(32);
        this.extraCmdline = new String(KaitaiStream.bytesTerminate(this._io.readBytes(1024), (byte) 0, false), Charset.forName("ASCII"));
        if (headerVersion() > 0) {
            this.recoveryDtbo = new SizeOffset(this._io, this, _root);
        }
        if (headerVersion() > 0) {
            this.bootHeaderSize = this._io.readU4le();
        }
        if (headerVersion() > 1) {
            this.dtb = new LoadLong(this._io, this, _root);
        }
    }
    public static class Load extends KaitaiStruct {
        public static Load fromFile(String fileName) throws IOException {
            return new Load(new ByteBufferKaitaiStream(fileName));
        }

        public Load(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Load(KaitaiStream _io, AndroidImg _parent) {
            this(_io, _parent, null);
        }

        public Load(KaitaiStream _io, AndroidImg _parent, AndroidImg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU4le();
            this.addr = this._io.readU4le();
        }
        private long size;
        private long addr;
        private AndroidImg _root;
        private AndroidImg _parent;
        public long size() { return size; }
        public long addr() { return addr; }
        public AndroidImg _root() { return _root; }
        public AndroidImg _parent() { return _parent; }
    }
    public static class LoadLong extends KaitaiStruct {
        public static LoadLong fromFile(String fileName) throws IOException {
            return new LoadLong(new ByteBufferKaitaiStream(fileName));
        }

        public LoadLong(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LoadLong(KaitaiStream _io, AndroidImg _parent) {
            this(_io, _parent, null);
        }

        public LoadLong(KaitaiStream _io, AndroidImg _parent, AndroidImg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU4le();
            this.addr = this._io.readU8le();
        }
        private long size;
        private long addr;
        private AndroidImg _root;
        private AndroidImg _parent;
        public long size() { return size; }
        public long addr() { return addr; }
        public AndroidImg _root() { return _root; }
        public AndroidImg _parent() { return _parent; }
    }
    public static class SizeOffset extends KaitaiStruct {
        public static SizeOffset fromFile(String fileName) throws IOException {
            return new SizeOffset(new ByteBufferKaitaiStream(fileName));
        }

        public SizeOffset(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SizeOffset(KaitaiStream _io, AndroidImg _parent) {
            this(_io, _parent, null);
        }

        public SizeOffset(KaitaiStream _io, AndroidImg _parent, AndroidImg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU4le();
            this.offset = this._io.readU8le();
        }
        private long size;
        private long offset;
        private AndroidImg _root;
        private AndroidImg _parent;
        public long size() { return size; }
        public long offset() { return offset; }
        public AndroidImg _root() { return _root; }
        public AndroidImg _parent() { return _parent; }
    }
    public static class OsVersion extends KaitaiStruct {
        public static OsVersion fromFile(String fileName) throws IOException {
            return new OsVersion(new ByteBufferKaitaiStream(fileName));
        }

        public OsVersion(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OsVersion(KaitaiStream _io, AndroidImg _parent) {
            this(_io, _parent, null);
        }

        public OsVersion(KaitaiStream _io, AndroidImg _parent, AndroidImg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU4le();
        }
        private Integer month;
        public Integer month() {
            if (this.month != null)
                return this.month;
            int _tmp = (int) ((version() & 15));
            this.month = _tmp;
            return this.month;
        }
        private Integer patch;
        public Integer patch() {
            if (this.patch != null)
                return this.patch;
            int _tmp = (int) (((version() >> 11) & 127));
            this.patch = _tmp;
            return this.patch;
        }
        private Integer year;
        public Integer year() {
            if (this.year != null)
                return this.year;
            int _tmp = (int) ((((version() >> 4) & 127) + 2000));
            this.year = _tmp;
            return this.year;
        }
        private Integer major;
        public Integer major() {
            if (this.major != null)
                return this.major;
            int _tmp = (int) (((version() >> 25) & 127));
            this.major = _tmp;
            return this.major;
        }
        private Integer minor;
        public Integer minor() {
            if (this.minor != null)
                return this.minor;
            int _tmp = (int) (((version() >> 18) & 127));
            this.minor = _tmp;
            return this.minor;
        }
        private long version;
        private AndroidImg _root;
        private AndroidImg _parent;
        public long version() { return version; }
        public AndroidImg _root() { return _root; }
        public AndroidImg _parent() { return _parent; }
    }
    private byte[] kernelImg;
    public byte[] kernelImg() {
        if (this.kernelImg != null)
            return this.kernelImg;
        long _pos = this._io.pos();
        this._io.seek(pageSize());
        this.kernelImg = this._io.readBytes(kernel().size());
        this._io.seek(_pos);
        return this.kernelImg;
    }
    private Integer tagsOffset;

    /**
     * tags offset from base
     */
    public Integer tagsOffset() {
        if (this.tagsOffset != null)
            return this.tagsOffset;
        int _tmp = (int) ((tagsLoad() - base()));
        this.tagsOffset = _tmp;
        return this.tagsOffset;
    }
    private Integer ramdiskOffset;

    /**
     * ramdisk offset from base
     */
    public Integer ramdiskOffset() {
        if (this.ramdiskOffset != null)
            return this.ramdiskOffset;
        int _tmp = (int) ((ramdisk().addr() > 0 ? (ramdisk().addr() - base()) : 0));
        this.ramdiskOffset = _tmp;
        return this.ramdiskOffset;
    }
    private Integer secondOffset;

    /**
     * 2nd bootloader offset from base
     */
    public Integer secondOffset() {
        if (this.secondOffset != null)
            return this.secondOffset;
        int _tmp = (int) ((second().addr() > 0 ? (second().addr() - base()) : 0));
        this.secondOffset = _tmp;
        return this.secondOffset;
    }
    private Integer kernelOffset;

    /**
     * kernel offset from base
     */
    public Integer kernelOffset() {
        if (this.kernelOffset != null)
            return this.kernelOffset;
        int _tmp = (int) ((kernel().addr() - base()));
        this.kernelOffset = _tmp;
        return this.kernelOffset;
    }
    private Integer dtbOffset;

    /**
     * dtb offset from base
     */
    public Integer dtbOffset() {
        if (this.dtbOffset != null)
            return this.dtbOffset;
        if (headerVersion() > 1) {
            int _tmp = (int) ((dtb().addr() > 0 ? (dtb().addr() - base()) : 0));
            this.dtbOffset = _tmp;
        }
        return this.dtbOffset;
    }
    private byte[] dtbImg;
    public byte[] dtbImg() {
        if (this.dtbImg != null)
            return this.dtbImg;
        if ( ((headerVersion() > 1) && (dtb().size() > 0)) ) {
            long _pos = this._io.pos();
            this._io.seek(((((((((pageSize() + kernel().size()) + ramdisk().size()) + second().size()) + recoveryDtbo().size()) + pageSize()) - 1) / pageSize()) * pageSize()));
            this.dtbImg = this._io.readBytes(dtb().size());
            this._io.seek(_pos);
        }
        return this.dtbImg;
    }
    private byte[] ramdiskImg;
    public byte[] ramdiskImg() {
        if (this.ramdiskImg != null)
            return this.ramdiskImg;
        if (ramdisk().size() > 0) {
            long _pos = this._io.pos();
            this._io.seek((((((pageSize() + kernel().size()) + pageSize()) - 1) / pageSize()) * pageSize()));
            this.ramdiskImg = this._io.readBytes(ramdisk().size());
            this._io.seek(_pos);
        }
        return this.ramdiskImg;
    }
    private byte[] recoveryDtboImg;
    public byte[] recoveryDtboImg() {
        if (this.recoveryDtboImg != null)
            return this.recoveryDtboImg;
        if ( ((headerVersion() > 0) && (recoveryDtbo().size() > 0)) ) {
            long _pos = this._io.pos();
            this._io.seek(recoveryDtbo().offset());
            this.recoveryDtboImg = this._io.readBytes(recoveryDtbo().size());
            this._io.seek(_pos);
        }
        return this.recoveryDtboImg;
    }
    private byte[] secondImg;
    public byte[] secondImg() {
        if (this.secondImg != null)
            return this.secondImg;
        if (second().size() > 0) {
            long _pos = this._io.pos();
            this._io.seek(((((((pageSize() + kernel().size()) + ramdisk().size()) + pageSize()) - 1) / pageSize()) * pageSize()));
            this.secondImg = this._io.readBytes(second().size());
            this._io.seek(_pos);
        }
        return this.secondImg;
    }
    private Integer base;

    /**
     * base loading address
     */
    public Integer base() {
        if (this.base != null)
            return this.base;
        int _tmp = (int) ((kernel().addr() - 32768));
        this.base = _tmp;
        return this.base;
    }
    private byte[] magic;
    private Load kernel;
    private Load ramdisk;
    private Load second;
    private long tagsLoad;
    private long pageSize;
    private long headerVersion;
    private OsVersion osVersion;
    private String name;
    private String cmdline;
    private byte[] sha;
    private String extraCmdline;
    private SizeOffset recoveryDtbo;
    private Long bootHeaderSize;
    private LoadLong dtb;
    private AndroidImg _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public Load kernel() { return kernel; }
    public Load ramdisk() { return ramdisk; }
    public Load second() { return second; }
    public long tagsLoad() { return tagsLoad; }
    public long pageSize() { return pageSize; }
    public long headerVersion() { return headerVersion; }
    public OsVersion osVersion() { return osVersion; }
    public String name() { return name; }
    public String cmdline() { return cmdline; }
    public byte[] sha() { return sha; }
    public String extraCmdline() { return extraCmdline; }
    public SizeOffset recoveryDtbo() { return recoveryDtbo; }
    public Long bootHeaderSize() { return bootHeaderSize; }
    public LoadLong dtb() { return dtb; }
    public AndroidImg _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
