// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;


/**
 * @see <a href="https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130">Source</a>
 */
public class AndroidNanoappHeader extends KaitaiStruct.ReadWrite {
    public static AndroidNanoappHeader fromFile(String fileName) throws IOException {
        return new AndroidNanoappHeader(new ByteBufferKaitaiStream(fileName));
    }
    public AndroidNanoappHeader() {
        this(null, null, null);
    }

    public AndroidNanoappHeader(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidNanoappHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndroidNanoappHeader(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidNanoappHeader _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.headerVersion = this._io.readU4le();
        if (!(this.headerVersion == 1)) {
            throw new KaitaiStream.ValidationNotEqualError(1, this.headerVersion, this._io, "/seq/0");
        }
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 78, 65, 78, 79 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 65, 78, 79 }, this.magic, this._io, "/seq/1");
        }
        this.appId = this._io.readU8le();
        this.appVersion = this._io.readU4le();
        this.flags = this._io.readU4le();
        this.hubType = this._io.readU8le();
        this.chreApiMajorVersion = this._io.readU1();
        this.chreApiMinorVersion = this._io.readU1();
        this.reserved = this._io.readBytes(6);
        if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0 }, this.reserved, this._io, "/seq/8");
        }
        _dirty = false;
    }

    public void _fetchInstances() {
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU4le(this.headerVersion);
        this._io.writeBytes(this.magic);
        this._io.writeU8le(this.appId);
        this._io.writeU4le(this.appVersion);
        this._io.writeU4le(this.flags);
        this._io.writeU8le(this.hubType);
        this._io.writeU1(this.chreApiMajorVersion);
        this._io.writeU1(this.chreApiMinorVersion);
        this._io.writeBytes(this.reserved);
    }

    public void _check() {
        if (!(this.headerVersion == 1)) {
            throw new KaitaiStream.ValidationNotEqualError(1, this.headerVersion, null, "/seq/0");
        }
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 78, 65, 78, 79 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 65, 78, 79 }, this.magic, null, "/seq/1");
        }
        if (this.reserved.length != 6)
            throw new ConsistencyError("reserved", 6, this.reserved.length);
        if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0 }, this.reserved, null, "/seq/8");
        }
        _dirty = false;
    }
    private Boolean isEncrypted;
    public Boolean isEncrypted() {
        if (this.isEncrypted != null)
            return this.isEncrypted;
        this.isEncrypted = (flags() & 2) != 0;
        return this.isEncrypted;
    }
    public void _invalidateIsEncrypted() { this.isEncrypted = null; }
    private Boolean isSigned;
    public Boolean isSigned() {
        if (this.isSigned != null)
            return this.isSigned;
        this.isSigned = (flags() & 1) != 0;
        return this.isSigned;
    }
    public void _invalidateIsSigned() { this.isSigned = null; }
    private Boolean isTcmCapable;
    public Boolean isTcmCapable() {
        if (this.isTcmCapable != null)
            return this.isTcmCapable;
        this.isTcmCapable = (flags() & 4) != 0;
        return this.isTcmCapable;
    }
    public void _invalidateIsTcmCapable() { this.isTcmCapable = null; }
    private long headerVersion;
    private byte[] magic;
    private long appId;
    private long appVersion;
    private long flags;
    private long hubType;
    private int chreApiMajorVersion;
    private int chreApiMinorVersion;
    private byte[] reserved;
    private AndroidNanoappHeader _root;
    private KaitaiStruct.ReadWrite _parent;
    public long headerVersion() { return headerVersion; }
    public void setHeaderVersion(long _v) { _dirty = true; headerVersion = _v; }
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long appId() { return appId; }
    public void setAppId(long _v) { _dirty = true; appId = _v; }
    public long appVersion() { return appVersion; }
    public void setAppVersion(long _v) { _dirty = true; appVersion = _v; }
    public long flags() { return flags; }
    public void setFlags(long _v) { _dirty = true; flags = _v; }
    public long hubType() { return hubType; }
    public void setHubType(long _v) { _dirty = true; hubType = _v; }
    public int chreApiMajorVersion() { return chreApiMajorVersion; }
    public void setChreApiMajorVersion(int _v) { _dirty = true; chreApiMajorVersion = _v; }
    public int chreApiMinorVersion() { return chreApiMinorVersion; }
    public void setChreApiMinorVersion(int _v) { _dirty = true; chreApiMinorVersion = _v; }
    public byte[] reserved() { return reserved; }
    public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
    public AndroidNanoappHeader _root() { return _root; }
    public void set_root(AndroidNanoappHeader _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
