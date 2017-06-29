// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;

public class HeroesOfMightAndMagicBmp extends KaitaiStruct {
    public static HeroesOfMightAndMagicBmp fromFile(String fileName) throws IOException {
        return new HeroesOfMightAndMagicBmp(new KaitaiStream(fileName));
    }

    public HeroesOfMightAndMagicBmp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public HeroesOfMightAndMagicBmp(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public HeroesOfMightAndMagicBmp(KaitaiStream _io, KaitaiStruct _parent, HeroesOfMightAndMagicBmp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readU2le();
        this.width = this._io.readU2le();
        this.height = this._io.readU2le();
        this.data = this._io.readBytes((width() * height()));
    }
    private int magic;
    private int width;
    private int height;
    private byte[] data;
    private HeroesOfMightAndMagicBmp _root;
    private KaitaiStruct _parent;
    public int magic() { return magic; }
    public int width() { return width; }
    public int height() { return height; }
    public byte[] data() { return data; }
    public HeroesOfMightAndMagicBmp _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
