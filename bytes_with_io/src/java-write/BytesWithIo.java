// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;


/**
 * Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
 */
public class BytesWithIo extends KaitaiStruct.ReadWrite {
    public static BytesWithIo fromFile(String fileName) throws IOException {
        return new BytesWithIo(new ByteBufferKaitaiStream(fileName));
    }
    public BytesWithIo() {
        this(null, null, null);
    }

    public BytesWithIo(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BytesWithIo(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public BytesWithIo(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, BytesWithIo _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.data = this._io.readBytesFull();
        _dirty = false;
    }

    public void _fetchInstances() {
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.data);
        if (!(this._io.isEof()))
            throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        _dirty = false;
    }
    private byte[] data;
    private BytesWithIo _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * The actual data.
     */
    public byte[] data() { return data; }
    public void setData(byte[] _v) { _dirty = true; data = _v; }
    public BytesWithIo _root() { return _root; }
    public void set_root(BytesWithIo _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
