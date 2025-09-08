// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;


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
        if (!(Arrays.equals(this.magic, new byte[] { 65, 78, 68, 82, 79, 73, 68, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 78, 68, 82, 79, 73, 68, 33 }, this.magic, this._io, "/seq/0");
        }
        this.kernel = new Load(this._io, this, _root);
        this.ramdisk = new Load(this._io, this, _root);
        this.second = new Load(this._io, this, _root);
        this.tagsLoad = this._io.readU4le();
        this.pageSize = this._io.readU4le();
        this.headerVersion = this._io.readU4le();
        this.osVersion = new OsVersion(this._io, this, _root);
        this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), StandardCharsets.US_ASCII);
        this.cmdline = new String(KaitaiStream.bytesTerminate(this._io.readBytes(512), (byte) 0, false), StandardCharsets.US_ASCII);
        this.sha = this._io.readBytes(32);
        this.extraCmdline = new String(KaitaiStream.bytesTerminate(this._io.readBytes(1024), (byte) 0, false), StandardCharsets.US_ASCII);
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

    public void _fetchInstances() {
        this.kernel._fetchInstances();
        this.ramdisk._fetchInstances();
        this.second._fetchInstances();
        this.osVersion._fetchInstances();
        if (headerVersion() > 0) {
            this.recoveryDtbo._fetchInstances();
        }
        if (headerVersion() > 0) {
        }
        if (headerVersion() > 1) {
            this.dtb._fetchInstances();
        }
        dtbImg();
        if (this.dtbImg != null) {
        }
        kernelImg();
        if (this.kernelImg != null) {
        }
        ramdiskImg();
        if (this.ramdiskImg != null) {
        }
        recoveryDtboImg();
        if (this.recoveryDtboImg != null) {
        }
        secondImg();
        if (this.secondImg != null) {
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

        public void _fetchInstances() {
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

        public void _fetchInstances() {
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

        public void _fetchInstances() {
        }
        private Integer major;
        public Integer major() {
            if (this.major != null)
                return this.major;
            this.major = ((Number) (version() >> 25 & 127)).intValue();
            return this.major;
        }
        private Integer minor;
        public Integer minor() {
            if (this.minor != null)
                return this.minor;
            this.minor = ((Number) (version() >> 18 & 127)).intValue();
            return this.minor;
        }
        private Integer month;
        public Integer month() {
            if (this.month != null)
                return this.month;
            this.month = ((Number) (version() & 15)).intValue();
            return this.month;
        }
        private Integer patch;
        public Integer patch() {
            if (this.patch != null)
                return this.patch;
            this.patch = ((Number) (version() >> 11 & 127)).intValue();
            return this.patch;
        }
        private Integer year;
        public Integer year() {
            if (this.year != null)
                return this.year;
            this.year = ((Number) ((version() >> 4 & 127) + 2000)).intValue();
            return this.year;
        }
        private long version;
        private AndroidImg _root;
        private AndroidImg _parent;
        public long version() { return version; }
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

        public void _fetchInstances() {
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
    private Integer base;

    /**
     * base loading address
     */
    public Integer base() {
        if (this.base != null)
            return this.base;
        this.base = ((Number) (kernel().addr() - 32768)).intValue();
        return this.base;
    }
    private byte[] dtbImg;
    public byte[] dtbImg() {
        if (this.dtbImg != null)
            return this.dtbImg;
        if ( ((headerVersion() > 1) && (dtb().size() > 0)) ) {
            long _pos = this._io.pos();
            this._io.seek((((((((pageSize() + kernel().size()) + ramdisk().size()) + second().size()) + recoveryDtbo().size()) + pageSize()) - 1) / pageSize()) * pageSize());
            this.dtbImg = this._io.readBytes(dtb().size());
            this._io.seek(_pos);
        }
        return this.dtbImg;
    }
    private Integer dtbOffset;

    /**
     * dtb offset from base
     */
    public Integer dtbOffset() {
        if (this.dtbOffset != null)
            return this.dtbOffset;
        if (headerVersion() > 1) {
            this.dtbOffset = ((Number) ((dtb().addr() > 0 ? dtb().addr() - base() : 0))).intValue();
        }
        return this.dtbOffset;
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
    private Integer kernelOffset;

    /**
     * kernel offset from base
     */
    public Integer kernelOffset() {
        if (this.kernelOffset != null)
            return this.kernelOffset;
        this.kernelOffset = ((Number) (kernel().addr() - base())).intValue();
        return this.kernelOffset;
    }
    private byte[] ramdiskImg;
    public byte[] ramdiskImg() {
        if (this.ramdiskImg != null)
            return this.ramdiskImg;
        if (ramdisk().size() > 0) {
            long _pos = this._io.pos();
            this._io.seek(((((pageSize() + kernel().size()) + pageSize()) - 1) / pageSize()) * pageSize());
            this.ramdiskImg = this._io.readBytes(ramdisk().size());
            this._io.seek(_pos);
        }
        return this.ramdiskImg;
    }
    private Integer ramdiskOffset;

    /**
     * ramdisk offset from base
     */
    public Integer ramdiskOffset() {
        if (this.ramdiskOffset != null)
            return this.ramdiskOffset;
        this.ramdiskOffset = ((Number) ((ramdisk().addr() > 0 ? ramdisk().addr() - base() : 0))).intValue();
        return this.ramdiskOffset;
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
            this._io.seek((((((pageSize() + kernel().size()) + ramdisk().size()) + pageSize()) - 1) / pageSize()) * pageSize());
            this.secondImg = this._io.readBytes(second().size());
            this._io.seek(_pos);
        }
        return this.secondImg;
    }
    private Integer secondOffset;

    /**
     * 2nd bootloader offset from base
     */
    public Integer secondOffset() {
        if (this.secondOffset != null)
            return this.secondOffset;
        this.secondOffset = ((Number) ((second().addr() > 0 ? second().addr() - base() : 0))).intValue();
        return this.secondOffset;
    }
    private Integer tagsOffset;

    /**
     * tags offset from base
     */
    public Integer tagsOffset() {
        if (this.tagsOffset != null)
            return this.tagsOffset;
        this.tagsOffset = ((Number) (tagsLoad() - base())).intValue();
        return this.tagsOffset;
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
