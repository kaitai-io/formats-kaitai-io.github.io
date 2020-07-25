// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
 */
public class BytesWithIo extends KaitaiStruct {
    public static BytesWithIo fromFile(String fileName) throws IOException {
        return new BytesWithIo(new ByteBufferKaitaiStream(fileName));
    }

    public BytesWithIo(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BytesWithIo(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public BytesWithIo(KaitaiStream _io, KaitaiStruct _parent, BytesWithIo _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.data = this._io.readBytesFull();
    }
    private byte[] data;
    private BytesWithIo _root;
    private KaitaiStruct _parent;

    /**
     * The actual data.
     */
    public byte[] data() { return data; }
    public BytesWithIo _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
