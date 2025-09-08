// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SomeIpContainer extends KaitaiStruct {
    public static SomeIpContainer fromFile(String fileName) throws IOException {
        return new SomeIpContainer(new ByteBufferKaitaiStream(fileName));
    }

    public SomeIpContainer(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIpContainer(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SomeIpContainer(KaitaiStream _io, KaitaiStruct _parent, SomeIpContainer _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.someIpPackages = new ArrayList<SomeIp>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.someIpPackages.add(new SomeIp(this._io));
                i++;
            }
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.someIpPackages.size(); i++) {
            this.someIpPackages.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    private List<SomeIp> someIpPackages;
    private SomeIpContainer _root;
    private KaitaiStruct _parent;
    public List<SomeIp> someIpPackages() { return someIpPackages; }
    public SomeIpContainer _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
