// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;


/**
 * @see <a href="https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130">Source</a>
 */
public class AndroidNanoappHeader extends KaitaiStruct {
    public static AndroidNanoappHeader fromFile(String fileName) throws IOException {
        return new AndroidNanoappHeader(new ByteBufferKaitaiStream(fileName));
    }

    public AndroidNanoappHeader(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidNanoappHeader(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AndroidNanoappHeader(KaitaiStream _io, KaitaiStruct _parent, AndroidNanoappHeader _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
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
    }

    public void _fetchInstances() {
    }
    private Boolean isEncrypted;
    public Boolean isEncrypted() {
        if (this.isEncrypted != null)
            return this.isEncrypted;
        this.isEncrypted = (flags() & 2) != 0;
        return this.isEncrypted;
    }
    private Boolean isSigned;
    public Boolean isSigned() {
        if (this.isSigned != null)
            return this.isSigned;
        this.isSigned = (flags() & 1) != 0;
        return this.isSigned;
    }
    private Boolean isTcmCapable;
    public Boolean isTcmCapable() {
        if (this.isTcmCapable != null)
            return this.isTcmCapable;
        this.isTcmCapable = (flags() & 4) != 0;
        return this.isTcmCapable;
    }
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
    private KaitaiStruct _parent;
    public long headerVersion() { return headerVersion; }
    public byte[] magic() { return magic; }
    public long appId() { return appId; }
    public long appVersion() { return appVersion; }
    public long flags() { return flags; }
    public long hubType() { return hubType; }
    public int chreApiMajorVersion() { return chreApiMajorVersion; }
    public int chreApiMinorVersion() { return chreApiMinorVersion; }
    public byte[] reserved() { return reserved; }
    public AndroidNanoappHeader _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
