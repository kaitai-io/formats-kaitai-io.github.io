// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;

public class HeroesOfMightAndMagicBmp extends KaitaiStruct.ReadWrite {
    public static HeroesOfMightAndMagicBmp fromFile(String fileName) throws IOException {
        return new HeroesOfMightAndMagicBmp(new ByteBufferKaitaiStream(fileName));
    }
    public HeroesOfMightAndMagicBmp() {
        this(null, null, null);
    }

    public HeroesOfMightAndMagicBmp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public HeroesOfMightAndMagicBmp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public HeroesOfMightAndMagicBmp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, HeroesOfMightAndMagicBmp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readU2le();
        this.width = this._io.readU2le();
        this.height = this._io.readU2le();
        this.data = this._io.readBytes(width() * height());
        _dirty = false;
    }

    public void _fetchInstances() {
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU2le(this.magic);
        this._io.writeU2le(this.width);
        this._io.writeU2le(this.height);
        this._io.writeBytes(this.data);
    }

    public void _check() {
        if (this.data.length != width() * height())
            throw new ConsistencyError("data", width() * height(), this.data.length);
        _dirty = false;
    }
    private int magic;
    private int width;
    private int height;
    private byte[] data;
    private HeroesOfMightAndMagicBmp _root;
    private KaitaiStruct.ReadWrite _parent;
    public int magic() { return magic; }
    public void setMagic(int _v) { _dirty = true; magic = _v; }
    public int width() { return width; }
    public void setWidth(int _v) { _dirty = true; width = _v; }
    public int height() { return height; }
    public void setHeight(int _v) { _dirty = true; height = _v; }
    public byte[] data() { return data; }
    public void setData(byte[] _v) { _dirty = true; data = _v; }
    public HeroesOfMightAndMagicBmp _root() { return _root; }
    public void set_root(HeroesOfMightAndMagicBmp _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
