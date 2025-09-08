// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;


/**
 * Firmware image found with MediaTek MT76xx wifi chipsets.
 */
public class AndesFirmware extends KaitaiStruct {
    public static AndesFirmware fromFile(String fileName) throws IOException {
        return new AndesFirmware(new ByteBufferKaitaiStream(fileName));
    }

    public AndesFirmware(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndesFirmware(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AndesFirmware(KaitaiStream _io, KaitaiStruct _parent, AndesFirmware _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        KaitaiStream _io_imageHeader = this._io.substream(32);
        this.imageHeader = new ImageHeader(_io_imageHeader, this, _root);
        this.ilm = this._io.readBytes(imageHeader().ilmLen());
        this.dlm = this._io.readBytes(imageHeader().dlmLen());
    }

    public void _fetchInstances() {
        this.imageHeader._fetchInstances();
    }
    public static class ImageHeader extends KaitaiStruct {
        public static ImageHeader fromFile(String fileName) throws IOException {
            return new ImageHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.ilmLen = this._io.readU4le();
            this.dlmLen = this._io.readU4le();
            this.fwVer = this._io.readU2le();
            this.buildVer = this._io.readU2le();
            this.extra = this._io.readU4le();
            this.buildTime = new String(this._io.readBytes(16), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
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
        public long dlmLen() { return dlmLen; }
        public int fwVer() { return fwVer; }
        public int buildVer() { return buildVer; }
        public long extra() { return extra; }
        public String buildTime() { return buildTime; }
        public AndesFirmware _root() { return _root; }
        public AndesFirmware _parent() { return _parent; }
    }
    private ImageHeader imageHeader;
    private byte[] ilm;
    private byte[] dlm;
    private AndesFirmware _root;
    private KaitaiStruct _parent;
    public ImageHeader imageHeader() { return imageHeader; }
    public byte[] ilm() { return ilm; }
    public byte[] dlm() { return dlm; }
    public AndesFirmware _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
