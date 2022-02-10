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
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6ee003b094bf4fc570832f90190260d795b/src/rsrcfork/compress/common.py">Source</a>
 */
public class DcmpVariableLengthInteger extends KaitaiStruct {
    public static DcmpVariableLengthInteger fromFile(String fileName) throws IOException {
        return new DcmpVariableLengthInteger(new ByteBufferKaitaiStream(fileName));
    }

    public DcmpVariableLengthInteger(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DcmpVariableLengthInteger(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public DcmpVariableLengthInteger(KaitaiStream _io, KaitaiStruct _parent, DcmpVariableLengthInteger _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.first = this._io.readU1();
        if (first() >= 128) {
            switch (first()) {
            case 255: {
                this.more = this._io.readS4be();
                break;
            }
            default: {
                this.more = (int) (this._io.readU1());
                break;
            }
            }
        }
    }
    private Integer value;

    /**
     * The decoded value of the variable-length integer.
     */
    public Integer value() {
        if (this.value != null)
            return this.value;
        int _tmp = (int) ((first() == 255 ? more() : (first() >= 128 ? (((first() << 8) | more()) - 49152) : first())));
        this.value = _tmp;
        return this.value;
    }
    private int first;
    private Integer more;
    private DcmpVariableLengthInteger _root;
    private KaitaiStruct _parent;

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
    public DcmpVariableLengthInteger _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
