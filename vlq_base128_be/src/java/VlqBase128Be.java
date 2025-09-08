// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * A variable-length unsigned integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "most significant group first", i.e. in "big-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * Standard MIDI file format
 * * ASN.1 BER encoding
 * * RAR 5.0 file format
 * 
 * More information on this encoding is available at
 * <https://en.wikipedia.org/wiki/Variable-length_quantity>
 * 
 * This particular implementation supports serialized values to up 8 bytes long.
 */
public class VlqBase128Be extends KaitaiStruct {
    public static VlqBase128Be fromFile(String fileName) throws IOException {
        return new VlqBase128Be(new ByteBufferKaitaiStream(fileName));
    }

    public VlqBase128Be(KaitaiStream _io) {
        this(_io, null, null);
    }

    public VlqBase128Be(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public VlqBase128Be(KaitaiStream _io, KaitaiStruct _parent, VlqBase128Be _root) {
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

    public void _fetchInstances() {
        for (int i = 0; i < this.groups.size(); i++) {
            this.groups.get(((Number) (i)).intValue())._fetchInstances();
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

        public Group(KaitaiStream _io, VlqBase128Be _parent) {
            this(_io, _parent, null);
        }

        public Group(KaitaiStream _io, VlqBase128Be _parent, VlqBase128Be _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.hasNext = this._io.readBitsIntBe(1) != 0;
            this.value = this._io.readBitsIntBe(7);
        }

        public void _fetchInstances() {
        }
        private boolean hasNext;
        private long value;
        private VlqBase128Be _root;
        private VlqBase128Be _parent;

        /**
         * If true, then we have more bytes to read
         */
        public boolean hasNext() { return hasNext; }

        /**
         * The 7-bit (base128) numeric value chunk of this group
         */
        public long value() { return value; }
        public VlqBase128Be _root() { return _root; }
        public VlqBase128Be _parent() { return _parent; }
    }
    private Integer last;
    public Integer last() {
        if (this.last != null)
            return this.last;
        this.last = ((Number) (groups().size() - 1)).intValue();
        return this.last;
    }
    private Long value;

    /**
     * Resulting value as normal integer
     */
    public Long value() {
        if (this.value != null)
            return this.value;
        this.value = ((Number) (((Number) (((((((groups().get(((Number) (last())).intValue()).value() + (last() >= 1 ? groups().get(((Number) (last() - 1)).intValue()).value() << 7 : 0)) + (last() >= 2 ? groups().get(((Number) (last() - 2)).intValue()).value() << 14 : 0)) + (last() >= 3 ? groups().get(((Number) (last() - 3)).intValue()).value() << 21 : 0)) + (last() >= 4 ? groups().get(((Number) (last() - 4)).intValue()).value() << 28 : 0)) + (last() >= 5 ? groups().get(((Number) (last() - 5)).intValue()).value() << 35 : 0)) + (last() >= 6 ? groups().get(((Number) (last() - 6)).intValue()).value() << 42 : 0)) + (last() >= 7 ? groups().get(((Number) (last() - 7)).intValue()).value() << 49 : 0))).longValue())).longValue();
        return this.value;
    }
    private List<Group> groups;
    private VlqBase128Be _root;
    private KaitaiStruct _parent;
    public List<Group> groups() { return groups; }
    public VlqBase128Be _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
