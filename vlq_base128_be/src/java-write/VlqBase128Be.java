// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
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
public class VlqBase128Be extends KaitaiStruct.ReadWrite {
    public static VlqBase128Be fromFile(String fileName) throws IOException {
        return new VlqBase128Be(new ByteBufferKaitaiStream(fileName));
    }
    public VlqBase128Be() {
        this(null, null, null);
    }

    public VlqBase128Be(KaitaiStream _io) {
        this(_io, null, null);
    }

    public VlqBase128Be(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public VlqBase128Be(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, VlqBase128Be _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.groups = new ArrayList<Group>();
        {
            Group _it;
            int i = 0;
            do {
                Group _t_groups = new Group(this._io, this, _root);
                try {
                    _t_groups._read();
                } finally {
                    _it = _t_groups;
                    this.groups.add(_it);
                }
                i++;
            } while (!(!(_it.hasNext())));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.groups.size(); i++) {
            this.groups.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.groups.size(); i++) {
            this.groups.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.groups.size() == 0)
            throw new ConsistencyError("groups", 0, this.groups.size());
        for (int i = 0; i < this.groups.size(); i++) {
            if (!Objects.equals(this.groups.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("groups", _root(), this.groups.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.groups.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("groups", this, this.groups.get(((Number) (i)).intValue())._parent());
            {
                Group _it = this.groups.get(((Number) (i)).intValue());
                if (!(_it.hasNext()) != (i == this.groups.size() - 1))
                    throw new ConsistencyError("groups", i == this.groups.size() - 1, !(_it.hasNext()));
            }
        }
        _dirty = false;
    }

    /**
     * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
     */
    public static class Group extends KaitaiStruct.ReadWrite {
        public static Group fromFile(String fileName) throws IOException {
            return new Group(new ByteBufferKaitaiStream(fileName));
        }
        public Group() {
            this(null, null, null);
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
        }
        public void _read() {
            this.hasNext = this._io.readBitsIntBe(1) != 0;
            this.value = this._io.readBitsIntBe(7);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.hasNext ? 1 : 0));
            this._io.writeBitsIntBe(7, this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private boolean hasNext;
        private long value;
        private VlqBase128Be _root;
        private VlqBase128Be _parent;

        /**
         * If true, then we have more bytes to read
         */
        public boolean hasNext() { return hasNext; }
        public void setHasNext(boolean _v) { _dirty = true; hasNext = _v; }

        /**
         * The 7-bit (base128) numeric value chunk of this group
         */
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public VlqBase128Be _root() { return _root; }
        public void set_root(VlqBase128Be _v) { _dirty = true; _root = _v; }
        public VlqBase128Be _parent() { return _parent; }
        public void set_parent(VlqBase128Be _v) { _dirty = true; _parent = _v; }
    }
    private Integer last;
    public Integer last() {
        if (this.last != null)
            return this.last;
        this.last = ((Number) (groups().size() - 1)).intValue();
        return this.last;
    }
    public void _invalidateLast() { this.last = null; }
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
    public void _invalidateValue() { this.value = null; }
    private List<Group> groups;
    private VlqBase128Be _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Group> groups() { return groups; }
    public void setGroups(List<Group> _v) { _dirty = true; groups = _v; }
    public VlqBase128Be _root() { return _root; }
    public void set_root(VlqBase128Be _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
