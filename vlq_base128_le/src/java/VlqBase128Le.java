// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "least significant group first", i.e. in "little-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
 *   <https://dwarfstd.org/doc/dwarf-2.0.0.pdf> - page 139
 * * Google Protocol Buffers, where it's called "Base 128 Varints".
 *   <https://protobuf.dev/programming-guides/encoding/#varints>
 * * Apache Lucene, where it's called "VInt"
 *   <https://lucene.apache.org/core/3_5_0/fileformats.html#VInt>
 * * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
 *   top of it for signed ints
 *   <https://avro.apache.org/docs/1.12.0/specification/#primitive-types-1>
 * 
 * More information on this encoding is available at <https://en.wikipedia.org/wiki/LEB128>
 * 
 * This particular implementation supports integer values up to 64 bits (i.e. the
 * maximum unsigned value supported is `2**64 - 1`), which implies that serialized
 * values can be up to 10 bytes in length.
 * 
 * If the most significant 10th byte (`groups[9]`) is present, its `has_next`
 * must be `false` (otherwise we would have 11 or more bytes, which is not
 * supported) and its `value` can be only `0` or `1` (because a 9-byte VLQ can
 * represent `9 * 7 = 63` bits already, so the 10th byte can only add 1 bit,
 * since only integers up to 64 bits are supported). These restrictions are
 * enforced by this implementation. They were inspired by the Protoscope tool,
 * see <https://github.com/protocolbuffers/protoscope/blob/8e7a6aafa2c9958527b1e0747e66e1bfff045819/writer.go#L644-L648>.
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
                _it = new Group(this._io, this, _root, i, (i != 0 ? groups().get(((Number) (i - 1)).intValue()).intermValue() : 0), (i != 0 ? (i == 9 ? 0x8000000000000000L : groups().get(((Number) (i - 1)).intValue()).multiplier() * 128) : 1));
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

        public Group(KaitaiStream _io, int idx, long prevIntermValue, long multiplier) {
            this(_io, null, null, idx, prevIntermValue, multiplier);
        }

        public Group(KaitaiStream _io, VlqBase128Le _parent, int idx, long prevIntermValue, long multiplier) {
            this(_io, _parent, null, idx, prevIntermValue, multiplier);
        }

        public Group(KaitaiStream _io, VlqBase128Le _parent, VlqBase128Le _root, int idx, long prevIntermValue, long multiplier) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            this.prevIntermValue = prevIntermValue;
            this.multiplier = multiplier;
            _read();
        }
        private void _read() {
            this.hasNext = this._io.readBitsIntBe(1) != 0;
            if (!(this.hasNext == (idx() == 9 ? false : hasNext()))) {
                throw new KaitaiStream.ValidationNotEqualError((idx() == 9 ? false : hasNext()), this.hasNext, this._io, "/types/group/seq/0");
            }
            this.value = this._io.readBitsIntBe(7);
            if (!(this.value <= ((Number) ((idx() == 9 ? 1 : 127))).longValue())) {
                throw new KaitaiStream.ValidationGreaterThanError(((Number) ((idx() == 9 ? 1 : 127))).longValue(), this.value, this._io, "/types/group/seq/1");
            }
        }

        public void _fetchInstances() {
        }
        private Long intermValue;
        public Long intermValue() {
            if (this.intermValue != null)
                return this.intermValue;
            this.intermValue = ((Number) (((Number) (prevIntermValue() + value() * multiplier())).longValue())).longValue();
            return this.intermValue;
        }
        private boolean hasNext;
        private long value;
        private int idx;
        private long prevIntermValue;
        private long multiplier;
        private VlqBase128Le _root;
        private VlqBase128Le _parent;

        /**
         * If `true`, then we have more bytes to read.
         * 
         * Since this implementation only supports serialized values up to 10
         * bytes, this must be `false` in the 10th group (`groups[9]`).
         */
        public boolean hasNext() { return hasNext; }

        /**
         * The 7-bit (base128) numeric value chunk of this group
         * 
         * Since this implementation only supports integer values up to 64 bits,
         * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
         * (otherwise the width of the represented value would be 65 bits or
         * more, which is not supported).
         */
        public long value() { return value; }
        public int idx() { return idx; }
        public long prevIntermValue() { return prevIntermValue; }
        public long multiplier() { return multiplier; }
        public VlqBase128Le _root() { return _root; }
        public VlqBase128Le _parent() { return _parent; }
    }
    private Integer len;
    public Integer len() {
        if (this.len != null)
            return this.len;
        this.len = ((Number) (groups().size())).intValue();
        return this.len;
    }
    private Long signBit;
    public Long signBit() {
        if (this.signBit != null)
            return this.signBit;
        this.signBit = ((Number) (((Number) ((len() == 10 ? 0x8000000000000000L : groups().get(groups().size() - 1).multiplier() * 64))).longValue())).longValue();
        return this.signBit;
    }
    private Long value;

    /**
     * Resulting unsigned value as normal integer
     */
    public Long value() {
        if (this.value != null)
            return this.value;
        this.value = ((Number) (groups().get(groups().size() - 1).intermValue())).longValue();
        return this.value;
    }
    private Long valueSigned;
    public Long valueSigned() {
        if (this.valueSigned != null)
            return this.valueSigned;
        this.valueSigned = ((Number) (( ((signBit() > 0) && (value() >= signBit()))  ? -(((Number) (signBit() - (value() - signBit()))).longValue()) : ((Number) (value())).longValue()))).longValue();
        return this.valueSigned;
    }
    private List<Group> groups;
    private VlqBase128Le _root;
    private KaitaiStruct _parent;
    public List<Group> groups() { return groups; }
    public VlqBase128Le _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
