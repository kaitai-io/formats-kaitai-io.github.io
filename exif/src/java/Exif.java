// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;

public class Exif extends KaitaiStruct {
    public static Exif fromFile(String fileName) throws IOException {
        return new Exif(new KaitaiStream(fileName));
    }

    public Exif(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Exif(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Exif(KaitaiStream _io, KaitaiStruct _parent, Exif _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.endianness = this._io.readU2le();
        switch (endianness()) {
        case 18761: {
            this.body = new ExifLe(this._io);
            break;
        }
        case 19789: {
            this.body = new ExifBe(this._io);
            break;
        }
        }
    }
    private int endianness;
    private KaitaiStruct body;
    private Exif _root;
    private KaitaiStruct _parent;
    public int endianness() { return endianness; }
    public KaitaiStruct body() { return body; }
    public Exif _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
