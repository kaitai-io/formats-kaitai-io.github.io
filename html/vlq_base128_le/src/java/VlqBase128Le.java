// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;


/**
 * A variable-length unsigned integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "least significant group first", i.e. in "little-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
 *   http://dwarfstd.org/doc/dwarf-2.0.0.pdf - page 139
 * * Google Protocol Buffers, where it's called "Base 128 Varints".
 *   https://developers.google.com/protocol-buffers/docs/encoding?csw=1#varints
 * * Apache Lucene, where it's called "VInt"
 *   http://lucene.apache.org/core/3_5_0/fileformats.html#VInt
 * * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
 *   top of it for signed ints
 *   http://avro.apache.org/docs/current/spec.html#binary_encode_primitive
 * 
 * More information on this encoding is available at https://en.wikipedia.org/wiki/LEB128
 * 
 * This particular implementation supports serialized values to up 8 bytes long.
 */
public class VlqBase128Le extends KaitaiStruct {
    public static VlqBase128Le fromFile(String fileName) throws IOException {
        return new VlqBase128Le(new ByteBufferKaitaiStream(fileName));
    }

    public VlqBase128Le(KaitaiStream _io) {
        this(_io, null, null);
    }

    public VlqBase128Le(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public VlqBase128Le(KaitaiStream _io, KaitaiStruct _parent, VlqBase128Le _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.groups = new ArrayList<Group>();
        {
            Group _it;
            int i = 0;
            do {
                _it = new Group(this._io, this, _root);
                this.groups.add(_it);
                i++;
            } while (!(!(_it.hasNext())));
        }
    }

    /**
     * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
     */
    public static class Group extends KaitaiStruct {
        public static Group fromFile(String fileName) throws IOException {
            return new Group(new ByteBufferKaitaiStream(fileName));
        }

        public Group(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Group(KaitaiStream _io, VlqBase128Le _parent) {
            this(_io, _parent, null);
        }

        public Group(KaitaiStream _io, VlqBase128Le _parent, VlqBase128Le _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.b = this._io.readU1();
        }
        private Boolean hasNext;

        /**
         * If true, then we have more bytes to read
         */
        public Boolean hasNext() {
            if (this.hasNext != null)
                return this.hasNext;
            boolean _tmp = (boolean) ((b() & 128) != 0);
            this.hasNext = _tmp;
            return this.hasNext;
        }
        private Integer value;

        /**
         * The 7-bit (base128) numeric value chunk of this group
         */
        public Integer value() {
            if (this.value != null)
                return this.value;
            int _tmp = (int) ((b() & 127));
            this.value = _tmp;
            return this.value;
        }
        private int b;
        private VlqBase128Le _root;
        private VlqBase128Le _parent;
        public int b() { return b; }
        public VlqBase128Le _root() { return _root; }
        public VlqBase128Le _parent() { return _parent; }
    }
    private Integer len;
    public Integer len() {
        if (this.len != null)
            return this.len;
        int _tmp = (int) (groups().size());
        this.len = _tmp;
        return this.len;
    }
    private Integer value;

    /**
     * Resulting value as normal integer
     */
    public Integer value() {
        if (this.value != null)
            return this.value;
        int _tmp = (int) ((((((((groups().get((int) 0).value() + (len() >= 2 ? (groups().get((int) 1).value() << 7) : 0)) + (len() >= 3 ? (groups().get((int) 2).value() << 14) : 0)) + (len() >= 4 ? (groups().get((int) 3).value() << 21) : 0)) + (len() >= 5 ? (groups().get((int) 4).value() << 28) : 0)) + (len() >= 6 ? (groups().get((int) 5).value() << 35) : 0)) + (len() >= 7 ? (groups().get((int) 6).value() << 42) : 0)) + (len() >= 8 ? (groups().get((int) 7).value() << 49) : 0)));
        this.value = _tmp;
        return this.value;
    }
    private ArrayList<Group> groups;
    private VlqBase128Le _root;
    private KaitaiStruct _parent;
    public ArrayList<Group> groups() { return groups; }
    public VlqBase128Le _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
