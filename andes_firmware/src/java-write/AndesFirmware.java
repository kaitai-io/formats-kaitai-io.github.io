// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * Firmware image found with MediaTek MT76xx wifi chipsets.
 */
public class AndesFirmware extends KaitaiStruct.ReadWrite {
    public static AndesFirmware fromFile(String fileName) throws IOException {
        return new AndesFirmware(new ByteBufferKaitaiStream(fileName));
    }
    public AndesFirmware() {
        this(null, null, null);
    }

    public AndesFirmware(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndesFirmware(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndesFirmware(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndesFirmware _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this._raw_imageHeader = this._io.readBytes(32);
        KaitaiStream _io__raw_imageHeader = new ByteBufferKaitaiStream(this._raw_imageHeader);
        this.imageHeader = new ImageHeader(_io__raw_imageHeader, this, _root);
        this.imageHeader._read();
        this.ilm = this._io.readBytes(imageHeader().ilmLen());
        this.dlm = this._io.readBytes(imageHeader().dlmLen());
        _dirty = false;
    }

    public void _fetchInstances() {
        this.imageHeader._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        final KaitaiStream _io__raw_imageHeader = new ByteBufferKaitaiStream(32);
        this._io.addChildStream(_io__raw_imageHeader);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (32));
            final AndesFirmware _this = this;
            _io__raw_imageHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_imageHeader = _io__raw_imageHeader.toByteArray();
                    if (_this._raw_imageHeader.length != 32)
                        throw new ConsistencyError("raw(image_header)", 32, _this._raw_imageHeader.length);
                    parent.writeBytes(_this._raw_imageHeader);
                }
            });
        }
        this.imageHeader._write_Seq(_io__raw_imageHeader);
        this._io.writeBytes(this.ilm);
        this._io.writeBytes(this.dlm);
    }

    public void _check() {
        if (!Objects.equals(this.imageHeader._root(), _root()))
            throw new ConsistencyError("image_header", _root(), this.imageHeader._root());
        if (!Objects.equals(this.imageHeader._parent(), this))
            throw new ConsistencyError("image_header", this, this.imageHeader._parent());
        if (this.ilm.length != imageHeader().ilmLen())
            throw new ConsistencyError("ilm", imageHeader().ilmLen(), this.ilm.length);
        if (this.dlm.length != imageHeader().dlmLen())
            throw new ConsistencyError("dlm", imageHeader().dlmLen(), this.dlm.length);
        _dirty = false;
    }
    public static class ImageHeader extends KaitaiStruct.ReadWrite {
        public static ImageHeader fromFile(String fileName) throws IOException {
            return new ImageHeader(new ByteBufferKaitaiStream(fileName));
        }
        public ImageHeader() {
            this(null, null, null);
        }

        public ImageHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageHeader(KaitaiStream _io, AndesFirmware _parent) {
            this(_io, _parent, null);
        }

        public ImageHeader(KaitaiStream _io, AndesFirmware _parent, AndesFirmware _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ilmLen = this._io.readU4le();
            this.dlmLen = this._io.readU4le();
            this.fwVer = this._io.readU2le();
            this.buildVer = this._io.readU2le();
            this.extra = this._io.readU4le();
            this.buildTime = new String(this._io.readBytes(16), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.ilmLen);
            this._io.writeU4le(this.dlmLen);
            this._io.writeU2le(this.fwVer);
            this._io.writeU2le(this.buildVer);
            this._io.writeU4le(this.extra);
            this._io.writeBytes((this.buildTime).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.buildTime).getBytes(Charset.forName("UTF-8")).length != 16)
                throw new ConsistencyError("build_time", 16, (this.buildTime).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private long ilmLen;
        private long dlmLen;
        private int fwVer;
        private int buildVer;
        private long extra;
        private String buildTime;
        private AndesFirmware _root;
        private AndesFirmware _parent;
        public long ilmLen() { return ilmLen; }
        public void setIlmLen(long _v) { _dirty = true; ilmLen = _v; }
        public long dlmLen() { return dlmLen; }
        public void setDlmLen(long _v) { _dirty = true; dlmLen = _v; }
        public int fwVer() { return fwVer; }
        public void setFwVer(int _v) { _dirty = true; fwVer = _v; }
        public int buildVer() { return buildVer; }
        public void setBuildVer(int _v) { _dirty = true; buildVer = _v; }
        public long extra() { return extra; }
        public void setExtra(long _v) { _dirty = true; extra = _v; }
        public String buildTime() { return buildTime; }
        public void setBuildTime(String _v) { _dirty = true; buildTime = _v; }
        public AndesFirmware _root() { return _root; }
        public void set_root(AndesFirmware _v) { _dirty = true; _root = _v; }
        public AndesFirmware _parent() { return _parent; }
        public void set_parent(AndesFirmware _v) { _dirty = true; _parent = _v; }
    }
    private ImageHeader imageHeader;
    private byte[] ilm;
    private byte[] dlm;
    private AndesFirmware _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_imageHeader;
    public ImageHeader imageHeader() { return imageHeader; }
    public void setImageHeader(ImageHeader _v) { _dirty = true; imageHeader = _v; }
    public byte[] ilm() { return ilm; }
    public void setIlm(byte[] _v) { _dirty = true; ilm = _v; }
    public byte[] dlm() { return dlm; }
    public void setDlm(byte[] _v) { _dirty = true; dlm = _v; }
    public AndesFirmware _root() { return _root; }
    public void set_root(AndesFirmware _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_imageHeader() { return _raw_imageHeader; }
    public void set_raw_ImageHeader(byte[] _v) { _dirty = true; _raw_imageHeader = _v; }
}
