// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;


/**
 * @see <a href="https://source.android.com/docs/core/architecture/bootloader/boot-image-header">Source</a>
 */
public class AndroidImg extends KaitaiStruct.ReadWrite {
    public static AndroidImg fromFile(String fileName) throws IOException {
        return new AndroidImg(new ByteBufferKaitaiStream(fileName));
    }
    public AndroidImg() {
        this(null, null, null);
    }

    public AndroidImg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidImg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndroidImg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidImg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(this.magic, new byte[] { 65, 78, 68, 82, 79, 73, 68, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 78, 68, 82, 79, 73, 68, 33 }, this.magic, this._io, "/seq/0");
        }
        this.kernel = new Load(this._io, this, _root);
        this.kernel._read();
        this.ramdisk = new Load(this._io, this, _root);
        this.ramdisk._read();
        this.second = new Load(this._io, this, _root);
        this.second._read();
        this.tagsLoad = this._io.readU4le();
        this.pageSize = this._io.readU4le();
        this.headerVersion = this._io.readU4le();
        this.osVersion = new OsVersion(this._io, this, _root);
        this.osVersion._read();
        this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), StandardCharsets.US_ASCII);
        this.cmdline = new String(KaitaiStream.bytesTerminate(this._io.readBytes(512), (byte) 0, false), StandardCharsets.US_ASCII);
        this.sha = this._io.readBytes(32);
        this.extraCmdline = new String(KaitaiStream.bytesTerminate(this._io.readBytes(1024), (byte) 0, false), StandardCharsets.US_ASCII);
        if (headerVersion() > 0) {
            this.recoveryDtbo = new SizeOffset(this._io, this, _root);
            this.recoveryDtbo._read();
        }
        if (headerVersion() > 0) {
            this.bootHeaderSize = this._io.readU4le();
        }
        if (headerVersion() > 1) {
            this.dtb = new LoadLong(this._io, this, _root);
            this.dtb._read();
        }
        _dirty = false;
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

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteDtbImg = _enabledDtbImg;
        _shouldWriteKernelImg = _enabledKernelImg;
        _shouldWriteRamdiskImg = _enabledRamdiskImg;
        _shouldWriteRecoveryDtboImg = _enabledRecoveryDtboImg;
        _shouldWriteSecondImg = _enabledSecondImg;
        this._io.writeBytes(this.magic);
        this.kernel._write_Seq(this._io);
        this.ramdisk._write_Seq(this._io);
        this.second._write_Seq(this._io);
        this._io.writeU4le(this.tagsLoad);
        this._io.writeU4le(this.pageSize);
        this._io.writeU4le(this.headerVersion);
        this.osVersion._write_Seq(this._io);
        this._io.writeBytesLimit((this.name).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
        this._io.writeBytesLimit((this.cmdline).getBytes(Charset.forName("ASCII")), 512, (byte) 0, (byte) 0);
        this._io.writeBytes(this.sha);
        this._io.writeBytesLimit((this.extraCmdline).getBytes(Charset.forName("ASCII")), 1024, (byte) 0, (byte) 0);
        if (headerVersion() > 0) {
            this.recoveryDtbo._write_Seq(this._io);
        }
        if (headerVersion() > 0) {
            this._io.writeU4le(this.bootHeaderSize);
        }
        if (headerVersion() > 1) {
            this.dtb._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 8)
            throw new ConsistencyError("magic", 8, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 65, 78, 68, 82, 79, 73, 68, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 78, 68, 82, 79, 73, 68, 33 }, this.magic, null, "/seq/0");
        }
        if (!Objects.equals(this.kernel._root(), _root()))
            throw new ConsistencyError("kernel", _root(), this.kernel._root());
        if (!Objects.equals(this.kernel._parent(), this))
            throw new ConsistencyError("kernel", this, this.kernel._parent());
        if (!Objects.equals(this.ramdisk._root(), _root()))
            throw new ConsistencyError("ramdisk", _root(), this.ramdisk._root());
        if (!Objects.equals(this.ramdisk._parent(), this))
            throw new ConsistencyError("ramdisk", this, this.ramdisk._parent());
        if (!Objects.equals(this.second._root(), _root()))
            throw new ConsistencyError("second", _root(), this.second._root());
        if (!Objects.equals(this.second._parent(), this))
            throw new ConsistencyError("second", this, this.second._parent());
        if (!Objects.equals(this.osVersion._root(), _root()))
            throw new ConsistencyError("os_version", _root(), this.osVersion._root());
        if (!Objects.equals(this.osVersion._parent(), this))
            throw new ConsistencyError("os_version", this, this.osVersion._parent());
        if ((this.name).getBytes(Charset.forName("ASCII")).length > 16)
            throw new ConsistencyError("name", 16, (this.name).getBytes(Charset.forName("ASCII")).length);
        if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
            throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
        if ((this.cmdline).getBytes(Charset.forName("ASCII")).length > 512)
            throw new ConsistencyError("cmdline", 512, (this.cmdline).getBytes(Charset.forName("ASCII")).length);
        if (KaitaiStream.byteArrayIndexOf((this.cmdline).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
            throw new ConsistencyError("cmdline", -1, KaitaiStream.byteArrayIndexOf((this.cmdline).getBytes(Charset.forName("ASCII")), ((byte) 0)));
        if (this.sha.length != 32)
            throw new ConsistencyError("sha", 32, this.sha.length);
        if ((this.extraCmdline).getBytes(Charset.forName("ASCII")).length > 1024)
            throw new ConsistencyError("extra_cmdline", 1024, (this.extraCmdline).getBytes(Charset.forName("ASCII")).length);
        if (KaitaiStream.byteArrayIndexOf((this.extraCmdline).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
            throw new ConsistencyError("extra_cmdline", -1, KaitaiStream.byteArrayIndexOf((this.extraCmdline).getBytes(Charset.forName("ASCII")), ((byte) 0)));
        if (headerVersion() > 0) {
            if (!Objects.equals(this.recoveryDtbo._root(), _root()))
                throw new ConsistencyError("recovery_dtbo", _root(), this.recoveryDtbo._root());
            if (!Objects.equals(this.recoveryDtbo._parent(), this))
                throw new ConsistencyError("recovery_dtbo", this, this.recoveryDtbo._parent());
        }
        if (headerVersion() > 0) {
        }
        if (headerVersion() > 1) {
            if (!Objects.equals(this.dtb._root(), _root()))
                throw new ConsistencyError("dtb", _root(), this.dtb._root());
            if (!Objects.equals(this.dtb._parent(), this))
                throw new ConsistencyError("dtb", this, this.dtb._parent());
        }
        if (_enabledDtbImg) {
            if ( ((headerVersion() > 1) && (dtb().size() > 0)) ) {
                if (this.dtbImg.length != dtb().size())
                    throw new ConsistencyError("dtb_img", dtb().size(), this.dtbImg.length);
            }
        }
        if (_enabledKernelImg) {
            if (this.kernelImg.length != kernel().size())
                throw new ConsistencyError("kernel_img", kernel().size(), this.kernelImg.length);
        }
        if (_enabledRamdiskImg) {
            if (ramdisk().size() > 0) {
                if (this.ramdiskImg.length != ramdisk().size())
                    throw new ConsistencyError("ramdisk_img", ramdisk().size(), this.ramdiskImg.length);
            }
        }
        if (_enabledRecoveryDtboImg) {
            if ( ((headerVersion() > 0) && (recoveryDtbo().size() > 0)) ) {
                if (this.recoveryDtboImg.length != recoveryDtbo().size())
                    throw new ConsistencyError("recovery_dtbo_img", recoveryDtbo().size(), this.recoveryDtboImg.length);
            }
        }
        if (_enabledSecondImg) {
            if (second().size() > 0) {
                if (this.secondImg.length != second().size())
                    throw new ConsistencyError("second_img", second().size(), this.secondImg.length);
            }
        }
        _dirty = false;
    }
    public static class Load extends KaitaiStruct.ReadWrite {
        public static Load fromFile(String fileName) throws IOException {
            return new Load(new ByteBufferKaitaiStream(fileName));
        }
        public Load() {
            this(null, null, null);
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
        }
        public void _read() {
            this.size = this._io.readU4le();
            this.addr = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.size);
            this._io.writeU4le(this.addr);
        }

        public void _check() {
            _dirty = false;
        }
        private long size;
        private long addr;
        private AndroidImg _root;
        private AndroidImg _parent;
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public long addr() { return addr; }
        public void setAddr(long _v) { _dirty = true; addr = _v; }
        public AndroidImg _root() { return _root; }
        public void set_root(AndroidImg _v) { _dirty = true; _root = _v; }
        public AndroidImg _parent() { return _parent; }
        public void set_parent(AndroidImg _v) { _dirty = true; _parent = _v; }
    }
    public static class LoadLong extends KaitaiStruct.ReadWrite {
        public static LoadLong fromFile(String fileName) throws IOException {
            return new LoadLong(new ByteBufferKaitaiStream(fileName));
        }
        public LoadLong() {
            this(null, null, null);
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
        }
        public void _read() {
            this.size = this._io.readU4le();
            this.addr = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.size);
            this._io.writeU8le(this.addr);
        }

        public void _check() {
            _dirty = false;
        }
        private long size;
        private long addr;
        private AndroidImg _root;
        private AndroidImg _parent;
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public long addr() { return addr; }
        public void setAddr(long _v) { _dirty = true; addr = _v; }
        public AndroidImg _root() { return _root; }
        public void set_root(AndroidImg _v) { _dirty = true; _root = _v; }
        public AndroidImg _parent() { return _parent; }
        public void set_parent(AndroidImg _v) { _dirty = true; _parent = _v; }
    }
    public static class OsVersion extends KaitaiStruct.ReadWrite {
        public static OsVersion fromFile(String fileName) throws IOException {
            return new OsVersion(new ByteBufferKaitaiStream(fileName));
        }
        public OsVersion() {
            this(null, null, null);
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
        }
        public void _read() {
            this.version = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.version);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer major;
        public Integer major() {
            if (this.major != null)
                return this.major;
            this.major = ((Number) (version() >> 25 & 127)).intValue();
            return this.major;
        }
        public void _invalidateMajor() { this.major = null; }
        private Integer minor;
        public Integer minor() {
            if (this.minor != null)
                return this.minor;
            this.minor = ((Number) (version() >> 18 & 127)).intValue();
            return this.minor;
        }
        public void _invalidateMinor() { this.minor = null; }
        private Integer month;
        public Integer month() {
            if (this.month != null)
                return this.month;
            this.month = ((Number) (version() & 15)).intValue();
            return this.month;
        }
        public void _invalidateMonth() { this.month = null; }
        private Integer patch;
        public Integer patch() {
            if (this.patch != null)
                return this.patch;
            this.patch = ((Number) (version() >> 11 & 127)).intValue();
            return this.patch;
        }
        public void _invalidatePatch() { this.patch = null; }
        private Integer year;
        public Integer year() {
            if (this.year != null)
                return this.year;
            this.year = ((Number) ((version() >> 4 & 127) + 2000)).intValue();
            return this.year;
        }
        public void _invalidateYear() { this.year = null; }
        private long version;
        private AndroidImg _root;
        private AndroidImg _parent;
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }
        public AndroidImg _root() { return _root; }
        public void set_root(AndroidImg _v) { _dirty = true; _root = _v; }
        public AndroidImg _parent() { return _parent; }
        public void set_parent(AndroidImg _v) { _dirty = true; _parent = _v; }
    }
    public static class SizeOffset extends KaitaiStruct.ReadWrite {
        public static SizeOffset fromFile(String fileName) throws IOException {
            return new SizeOffset(new ByteBufferKaitaiStream(fileName));
        }
        public SizeOffset() {
            this(null, null, null);
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
        }
        public void _read() {
            this.size = this._io.readU4le();
            this.offset = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.size);
            this._io.writeU8le(this.offset);
        }

        public void _check() {
            _dirty = false;
        }
        private long size;
        private long offset;
        private AndroidImg _root;
        private AndroidImg _parent;
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }
        public AndroidImg _root() { return _root; }
        public void set_root(AndroidImg _v) { _dirty = true; _root = _v; }
        public AndroidImg _parent() { return _parent; }
        public void set_parent(AndroidImg _v) { _dirty = true; _parent = _v; }
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
    public void _invalidateBase() { this.base = null; }
    private byte[] dtbImg;
    private boolean _shouldWriteDtbImg = false;
    private boolean _enabledDtbImg = true;
    public byte[] dtbImg() {
        if (_shouldWriteDtbImg)
            _writeDtbImg();
        if (this.dtbImg != null)
            return this.dtbImg;
        if (!_enabledDtbImg)
            return null;
        if ( ((headerVersion() > 1) && (dtb().size() > 0)) ) {
            long _pos = this._io.pos();
            this._io.seek((((((((pageSize() + kernel().size()) + ramdisk().size()) + second().size()) + recoveryDtbo().size()) + pageSize()) - 1) / pageSize()) * pageSize());
            this.dtbImg = this._io.readBytes(dtb().size());
            this._io.seek(_pos);
        }
        return this.dtbImg;
    }
    public void setDtbImg(byte[] _v) { _dirty = true; dtbImg = _v; }
    public void setDtbImg_Enabled(boolean _v) { _dirty = true; _enabledDtbImg = _v; }

    private void _writeDtbImg() {
        _shouldWriteDtbImg = false;
        if ( ((headerVersion() > 1) && (dtb().size() > 0)) ) {
            long _pos = this._io.pos();
            this._io.seek((((((((pageSize() + kernel().size()) + ramdisk().size()) + second().size()) + recoveryDtbo().size()) + pageSize()) - 1) / pageSize()) * pageSize());
            this._io.writeBytes(this.dtbImg);
            this._io.seek(_pos);
        }
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
    public void _invalidateDtbOffset() { this.dtbOffset = null; }
    private byte[] kernelImg;
    private boolean _shouldWriteKernelImg = false;
    private boolean _enabledKernelImg = true;
    public byte[] kernelImg() {
        if (_shouldWriteKernelImg)
            _writeKernelImg();
        if (this.kernelImg != null)
            return this.kernelImg;
        if (!_enabledKernelImg)
            return null;
        long _pos = this._io.pos();
        this._io.seek(pageSize());
        this.kernelImg = this._io.readBytes(kernel().size());
        this._io.seek(_pos);
        return this.kernelImg;
    }
    public void setKernelImg(byte[] _v) { _dirty = true; kernelImg = _v; }
    public void setKernelImg_Enabled(boolean _v) { _dirty = true; _enabledKernelImg = _v; }

    private void _writeKernelImg() {
        _shouldWriteKernelImg = false;
        long _pos = this._io.pos();
        this._io.seek(pageSize());
        this._io.writeBytes(this.kernelImg);
        this._io.seek(_pos);
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
    public void _invalidateKernelOffset() { this.kernelOffset = null; }
    private byte[] ramdiskImg;
    private boolean _shouldWriteRamdiskImg = false;
    private boolean _enabledRamdiskImg = true;
    public byte[] ramdiskImg() {
        if (_shouldWriteRamdiskImg)
            _writeRamdiskImg();
        if (this.ramdiskImg != null)
            return this.ramdiskImg;
        if (!_enabledRamdiskImg)
            return null;
        if (ramdisk().size() > 0) {
            long _pos = this._io.pos();
            this._io.seek(((((pageSize() + kernel().size()) + pageSize()) - 1) / pageSize()) * pageSize());
            this.ramdiskImg = this._io.readBytes(ramdisk().size());
            this._io.seek(_pos);
        }
        return this.ramdiskImg;
    }
    public void setRamdiskImg(byte[] _v) { _dirty = true; ramdiskImg = _v; }
    public void setRamdiskImg_Enabled(boolean _v) { _dirty = true; _enabledRamdiskImg = _v; }

    private void _writeRamdiskImg() {
        _shouldWriteRamdiskImg = false;
        if (ramdisk().size() > 0) {
            long _pos = this._io.pos();
            this._io.seek(((((pageSize() + kernel().size()) + pageSize()) - 1) / pageSize()) * pageSize());
            this._io.writeBytes(this.ramdiskImg);
            this._io.seek(_pos);
        }
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
    public void _invalidateRamdiskOffset() { this.ramdiskOffset = null; }
    private byte[] recoveryDtboImg;
    private boolean _shouldWriteRecoveryDtboImg = false;
    private boolean _enabledRecoveryDtboImg = true;
    public byte[] recoveryDtboImg() {
        if (_shouldWriteRecoveryDtboImg)
            _writeRecoveryDtboImg();
        if (this.recoveryDtboImg != null)
            return this.recoveryDtboImg;
        if (!_enabledRecoveryDtboImg)
            return null;
        if ( ((headerVersion() > 0) && (recoveryDtbo().size() > 0)) ) {
            long _pos = this._io.pos();
            this._io.seek(recoveryDtbo().offset());
            this.recoveryDtboImg = this._io.readBytes(recoveryDtbo().size());
            this._io.seek(_pos);
        }
        return this.recoveryDtboImg;
    }
    public void setRecoveryDtboImg(byte[] _v) { _dirty = true; recoveryDtboImg = _v; }
    public void setRecoveryDtboImg_Enabled(boolean _v) { _dirty = true; _enabledRecoveryDtboImg = _v; }

    private void _writeRecoveryDtboImg() {
        _shouldWriteRecoveryDtboImg = false;
        if ( ((headerVersion() > 0) && (recoveryDtbo().size() > 0)) ) {
            long _pos = this._io.pos();
            this._io.seek(recoveryDtbo().offset());
            this._io.writeBytes(this.recoveryDtboImg);
            this._io.seek(_pos);
        }
    }
    private byte[] secondImg;
    private boolean _shouldWriteSecondImg = false;
    private boolean _enabledSecondImg = true;
    public byte[] secondImg() {
        if (_shouldWriteSecondImg)
            _writeSecondImg();
        if (this.secondImg != null)
            return this.secondImg;
        if (!_enabledSecondImg)
            return null;
        if (second().size() > 0) {
            long _pos = this._io.pos();
            this._io.seek((((((pageSize() + kernel().size()) + ramdisk().size()) + pageSize()) - 1) / pageSize()) * pageSize());
            this.secondImg = this._io.readBytes(second().size());
            this._io.seek(_pos);
        }
        return this.secondImg;
    }
    public void setSecondImg(byte[] _v) { _dirty = true; secondImg = _v; }
    public void setSecondImg_Enabled(boolean _v) { _dirty = true; _enabledSecondImg = _v; }

    private void _writeSecondImg() {
        _shouldWriteSecondImg = false;
        if (second().size() > 0) {
            long _pos = this._io.pos();
            this._io.seek((((((pageSize() + kernel().size()) + ramdisk().size()) + pageSize()) - 1) / pageSize()) * pageSize());
            this._io.writeBytes(this.secondImg);
            this._io.seek(_pos);
        }
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
    public void _invalidateSecondOffset() { this.secondOffset = null; }
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
    public void _invalidateTagsOffset() { this.tagsOffset = null; }
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
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public Load kernel() { return kernel; }
    public void setKernel(Load _v) { _dirty = true; kernel = _v; }
    public Load ramdisk() { return ramdisk; }
    public void setRamdisk(Load _v) { _dirty = true; ramdisk = _v; }
    public Load second() { return second; }
    public void setSecond(Load _v) { _dirty = true; second = _v; }
    public long tagsLoad() { return tagsLoad; }
    public void setTagsLoad(long _v) { _dirty = true; tagsLoad = _v; }
    public long pageSize() { return pageSize; }
    public void setPageSize(long _v) { _dirty = true; pageSize = _v; }
    public long headerVersion() { return headerVersion; }
    public void setHeaderVersion(long _v) { _dirty = true; headerVersion = _v; }
    public OsVersion osVersion() { return osVersion; }
    public void setOsVersion(OsVersion _v) { _dirty = true; osVersion = _v; }
    public String name() { return name; }
    public void setName(String _v) { _dirty = true; name = _v; }
    public String cmdline() { return cmdline; }
    public void setCmdline(String _v) { _dirty = true; cmdline = _v; }
    public byte[] sha() { return sha; }
    public void setSha(byte[] _v) { _dirty = true; sha = _v; }
    public String extraCmdline() { return extraCmdline; }
    public void setExtraCmdline(String _v) { _dirty = true; extraCmdline = _v; }
    public SizeOffset recoveryDtbo() { return recoveryDtbo; }
    public void setRecoveryDtbo(SizeOffset _v) { _dirty = true; recoveryDtbo = _v; }
    public Long bootHeaderSize() { return bootHeaderSize; }
    public void setBootHeaderSize(Long _v) { _dirty = true; bootHeaderSize = _v; }
    public LoadLong dtb() { return dtb; }
    public void setDtb(LoadLong _v) { _dirty = true; dtb = _v; }
    public AndroidImg _root() { return _root; }
    public void set_root(AndroidImg _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
