// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.nio.charset.Charset;
import io.kaitai.struct.ConsistencyError;
import java.util.List;


/**
 * @see <a href="https://hashcat.net/wiki/doku.php?id=restore">Source</a>
 */
public class HashcatRestore extends KaitaiStruct.ReadWrite {
    public static HashcatRestore fromFile(String fileName) throws IOException {
        return new HashcatRestore(new ByteBufferKaitaiStream(fileName));
    }
    public HashcatRestore() {
        this(null, null, null);
    }

    public HashcatRestore(KaitaiStream _io) {
        this(_io, null, null);
    }

    public HashcatRestore(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public HashcatRestore(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, HashcatRestore _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
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
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.argv.size(); i++) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU4le(this.version);
        this._io.writeBytesLimit((this.cwd).getBytes(Charset.forName("UTF-8")), 256, (byte) 0, (byte) 0);
        this._io.writeU4le(this.dictsPos);
        this._io.writeU4le(this.masksPos);
        this._io.writeBytes(this.padding);
        this._io.writeU8le(this.currentRestorePoint);
        this._io.writeU4le(this.argc);
        this._io.writeBytes(this.padding2);
        for (int i = 0; i < this.argv.size(); i++) {
            this._io.writeBytes((this.argv.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(10);
        }
    }

    public void _check() {
        if ((this.cwd).getBytes(Charset.forName("UTF-8")).length > 256)
            throw new ConsistencyError("cwd", 256, (this.cwd).getBytes(Charset.forName("UTF-8")).length);
        if (KaitaiStream.byteArrayIndexOf((this.cwd).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
            throw new ConsistencyError("cwd", -1, KaitaiStream.byteArrayIndexOf((this.cwd).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
        if (this.padding.length != 4)
            throw new ConsistencyError("padding", 4, this.padding.length);
        if (this.padding2.length != 12)
            throw new ConsistencyError("padding2", 12, this.padding2.length);
        if (this.argv.size() != argc())
            throw new ConsistencyError("argv", argc(), this.argv.size());
        for (int i = 0; i < this.argv.size(); i++) {
            if (KaitaiStream.byteArrayIndexOf((this.argv.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 10)) != -1)
                throw new ConsistencyError("argv", -1, KaitaiStream.byteArrayIndexOf((this.argv.get(((Number) (i)).intValue())).getBytes(Charset.forName("UTF-8")), ((byte) 10)));
        }
        _dirty = false;
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
    private KaitaiStruct.ReadWrite _parent;
    public long version() { return version; }
    public void setVersion(long _v) { _dirty = true; version = _v; }
    public String cwd() { return cwd; }
    public void setCwd(String _v) { _dirty = true; cwd = _v; }
    public long dictsPos() { return dictsPos; }
    public void setDictsPos(long _v) { _dirty = true; dictsPos = _v; }
    public long masksPos() { return masksPos; }
    public void setMasksPos(long _v) { _dirty = true; masksPos = _v; }
    public byte[] padding() { return padding; }
    public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
    public long currentRestorePoint() { return currentRestorePoint; }
    public void setCurrentRestorePoint(long _v) { _dirty = true; currentRestorePoint = _v; }
    public long argc() { return argc; }
    public void setArgc(long _v) { _dirty = true; argc = _v; }
    public byte[] padding2() { return padding2; }
    public void setPadding2(byte[] _v) { _dirty = true; padding2 = _v; }
    public List<String> argv() { return argv; }
    public void setArgv(List<String> _v) { _dirty = true; argv = _v; }
    public HashcatRestore _root() { return _root; }
    public void set_root(HashcatRestore _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
