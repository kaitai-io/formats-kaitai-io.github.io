// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="https://hashcat.net/wiki/doku.php?id=restore">Source</a>
 */
public class HashcatRestore extends KaitaiStruct {
    public static HashcatRestore fromFile(String fileName) throws IOException {
        return new HashcatRestore(new ByteBufferKaitaiStream(fileName));
    }

    public HashcatRestore(KaitaiStream _io) {
        this(_io, null, null);
    }

    public HashcatRestore(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public HashcatRestore(KaitaiStream _io, KaitaiStruct _parent, HashcatRestore _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.version = this._io.readU4le();
        this.cwd = new String(KaitaiStream.bytesTerminate(this._io.readBytes(256), (byte) 0, false), StandardCharsets.UTF_8);
        this.dictsPos = this._io.readU4le();
        this.masksPos = this._io.readU4le();
        this.padding = this._io.readBytes(4);
        this.currentRestorePoint = this._io.readU8le();
        this.argc = this._io.readU4le();
        this.padding2 = this._io.readBytes(12);
        this.argv = new ArrayList<String>();
        for (int i = 0; i < argc(); i++) {
            this.argv.add(new String(this._io.readBytesTerm((byte) 10, false, true, true), StandardCharsets.UTF_8));
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.argv.size(); i++) {
        }
    }
    private long version;
    private String cwd;
    private long dictsPos;
    private long masksPos;
    private byte[] padding;
    private long currentRestorePoint;
    private long argc;
    private byte[] padding2;
    private List<String> argv;
    private HashcatRestore _root;
    private KaitaiStruct _parent;
    public long version() { return version; }
    public String cwd() { return cwd; }
    public long dictsPos() { return dictsPos; }
    public long masksPos() { return masksPos; }
    public byte[] padding() { return padding; }
    public long currentRestorePoint() { return currentRestorePoint; }
    public long argc() { return argc; }
    public byte[] padding2() { return padding2; }
    public List<String> argv() { return argv; }
    public HashcatRestore _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
