// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.List;

public class SomeIpContainer extends KaitaiStruct.ReadWrite {
    public static SomeIpContainer fromFile(String fileName) throws IOException {
        return new SomeIpContainer(new ByteBufferKaitaiStream(fileName));
    }
    public SomeIpContainer() {
        this(null, null, null);
    }

    public SomeIpContainer(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIpContainer(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public SomeIpContainer(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SomeIpContainer _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.someIpPackages = new ArrayList<SomeIp>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                SomeIp _t_someIpPackages = new SomeIp(this._io);
                try {
                    _t_someIpPackages._read();
                } finally {
                    this.someIpPackages.add(_t_someIpPackages);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.someIpPackages.size(); i++) {
            this.someIpPackages.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.someIpPackages.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("some_ip_packages", 0, this._io.size() - this._io.pos());
            this.someIpPackages.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("some_ip_packages", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.someIpPackages.size(); i++) {
        }
        _dirty = false;
    }
    private List<SomeIp> someIpPackages;
    private SomeIpContainer _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<SomeIp> someIpPackages() { return someIpPackages; }
    public void setSomeIpPackages(List<SomeIp> _v) { _dirty = true; someIpPackages = _v; }
    public SomeIpContainer _root() { return _root; }
    public void set_root(SomeIpContainer _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
