// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * A variable-length integer,
 * in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
 * See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
 * 
 * This variable-length integer format can store an integer `x` in any of the following ways:
 * 
 * * In a single byte,
 *   if `0 <= x <= 0x7f`
 *   (7-bit unsigned integer)
 * * In 2 bytes,
 *   if `-0x4000 <= x <= 0x3eff`
 *   (15-bit signed integer with the highest `0x100` values unavailable)
 * * In 5 bytes, if `-0x80000000 <= x <= 0x7fffffff`
 *   (32-bit signed integer)
 * 
 * In practice,
 * values are always stored in the smallest possible format,
 * but technically any of the larger formats could be used as well.
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/common.py">Source</a>
 */
public class DcmpVariableLengthInteger extends KaitaiStruct.ReadWrite {
    public static DcmpVariableLengthInteger fromFile(String fileName) throws IOException {
        return new DcmpVariableLengthInteger(new ByteBufferKaitaiStream(fileName));
    }
    public DcmpVariableLengthInteger() {
        this(null, null, null);
    }

    public DcmpVariableLengthInteger(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DcmpVariableLengthInteger(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public DcmpVariableLengthInteger(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, DcmpVariableLengthInteger _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.first = this._io.readU1();
        if (first() >= 128) {
            switch (first()) {
            case 255: {
                this.more = this._io.readS4be();
                break;
            }
            default: {
                this.more = ((Number) (this._io.readU1())).intValue();
                break;
            }
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        if (first() >= 128) {
            switch (first()) {
            case 255: {
                break;
            }
            default: {
                break;
            }
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU1(this.first);
        if (first() >= 128) {
            switch (first()) {
            case 255: {
                this._io.writeS4be(this.more);
                break;
            }
            default: {
                this._io.writeU1(((Number) (this.more)).intValue());
                break;
            }
            }
        }
    }

    public void _check() {
        if (first() >= 128) {
            switch (first()) {
            case 255: {
                break;
            }
            default: {
                break;
            }
            }
        }
        _dirty = false;
    }
    private Integer value;

    /**
     * The decoded value of the variable-length integer.
     */
    public Integer value() {
        if (this.value != null)
            return this.value;
        this.value = ((Number) ((first() == 255 ? more() : (first() >= 128 ? (first() << 8 | more()) - 49152 : first())))).intValue();
        return this.value;
    }
    public void _invalidateValue() { this.value = null; }
    private int first;
    private Integer more;
    private DcmpVariableLengthInteger _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * The first byte of the variable-length integer.
     * This determines which storage format is used.
     * 
     * * For the 1-byte format,
     *   this encodes the entire value of the value.
     * * For the 2-byte format,
     *   this encodes the high 7 bits of the value,
     *   minus `0xc0`.
     *   The highest bit of the value,
     *   i. e. the second-highest bit of this field,
     *   is the sign bit.
     * * For the 5-byte format,
     *   this is always `0xff`.
     */
    public int first() { return first; }
    public void setFirst(int _v) { _dirty = true; first = _v; }

    /**
     * The remaining bytes of the variable-length integer.
     * 
     * * For the 1-byte format,
     *   this is not present.
     * * For the 2-byte format,
     *   this encodes the low 8 bits of the value.
     * * For the 5-byte format,
     *   this encodes the entire value.
     */
    public Integer more() { return more; }
    public void setMore(Integer _v) { _dirty = true; more = _v; }
    public DcmpVariableLengthInteger _root() { return _root; }
    public void set_root(DcmpVariableLengthInteger _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
