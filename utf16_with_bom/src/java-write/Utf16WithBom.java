// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import io.kaitai.struct.ConsistencyError;


/**
 * A simple wrapper which allows to read a UTF-16 encoded string that starts
 * with a byte order mark (BOM). The BOM indicates the endianness of the UTF-16
 * encoding, which can be either big-endian (BE) or little-endian (LE).
 * 
 * Use:
 * 
 * * `value` to get the string value with BOM stripped, regardless of endianness.
 * * `is_be` and `is_le` to check the endianness indicated by the BOM.
 * * `bom` to check the raw byte order mark.
 * @see "- https://en.wikipedia.org/wiki/Byte_order_mark
 * "
 */
public class Utf16WithBom extends KaitaiStruct.ReadWrite {
    public static Utf16WithBom fromFile(String fileName) throws IOException {
        return new Utf16WithBom(new ByteBufferKaitaiStream(fileName));
    }
    public Utf16WithBom() {
        this(null, null, null);
    }

    public Utf16WithBom(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Utf16WithBom(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Utf16WithBom(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Utf16WithBom _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.bom = this._io.readBytes(2);
        if (!( ((Arrays.equals(this.bom, new byte[] { -2, -1 })) || (Arrays.equals(this.bom, new byte[] { -1, -2 }))) )) {
            throw new KaitaiStream.ValidationNotAnyOfError(this.bom, this._io, "/seq/0");
        }
        if (isBe()) {
            this.strBe = new String(this._io.readBytesFull(), StandardCharsets.UTF_16BE);
        }
        if (isLe()) {
            this.strLe = new String(this._io.readBytesFull(), StandardCharsets.UTF_16LE);
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        if (isBe()) {
        }
        if (isLe()) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.bom);
        if (isBe()) {
            this._io.writeBytes((this.strBe).getBytes(Charset.forName("UTF-16BE")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("str_be", 0, this._io.size() - this._io.pos());
        }
        if (isLe()) {
            this._io.writeBytes((this.strLe).getBytes(Charset.forName("UTF-16LE")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("str_le", 0, this._io.size() - this._io.pos());
        }
    }

    public void _check() {
        if (this.bom.length != 2)
            throw new ConsistencyError("bom", 2, this.bom.length);
        if (!( ((Arrays.equals(this.bom, new byte[] { -2, -1 })) || (Arrays.equals(this.bom, new byte[] { -1, -2 }))) )) {
            throw new KaitaiStream.ValidationNotAnyOfError(this.bom, null, "/seq/0");
        }
        if (isBe()) {
        }
        if (isLe()) {
        }
        _dirty = false;
    }
    private Boolean isBe;

    /**
     * True if the byte order mark indicates big-endian UTF-16 encoding.
     */
    public Boolean isBe() {
        if (this.isBe != null)
            return this.isBe;
        this.isBe = Arrays.equals(bom(), new byte[] { -2, -1 });
        return this.isBe;
    }
    public void _invalidateIsBe() { this.isBe = null; }
    private Boolean isLe;

    /**
     * True if the byte order mark indicates little-endian UTF-16 encoding.
     */
    public Boolean isLe() {
        if (this.isLe != null)
            return this.isLe;
        this.isLe = Arrays.equals(bom(), new byte[] { -1, -2 });
        return this.isLe;
    }
    public void _invalidateIsLe() { this.isLe = null; }
    private String value;

    /**
     * The string value with BOM stripped, regardless of endianness.
     */
    public String value() {
        if (this.value != null)
            return this.value;
        this.value = (isBe() ? strBe() : strLe());
        return this.value;
    }
    public void _invalidateValue() { this.value = null; }
    private byte[] bom;
    private String strBe;
    private String strLe;
    private Utf16WithBom _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * The byte order mark (BOM) is a special marker at the beginning of the
     * string that indicates the endianness of the UTF-16 encoding. The
     * character U+FEFF is used as the BOM, and its byte representation differs
     * based on endianness:
     * 
     * * For big-endian (BE) UTF-16, it's `[0xFE, 0xFF]`
     * * For little-endian (LE) UTF-16, it's `[0xFF, 0xFE]`
     * 
     * This implementation checks for the presence of a valid BOM and strips it
     * from the resulting string value.
     */
    public byte[] bom() { return bom; }
    public void setBom(byte[] _v) { _dirty = true; bom = _v; }
    public String strBe() { return strBe; }
    public void setStrBe(String _v) { _dirty = true; strBe = _v; }
    public String strLe() { return strLe; }
    public void setStrLe(String _v) { _dirty = true; strLe = _v; }
    public Utf16WithBom _root() { return _root; }
    public void set_root(Utf16WithBom _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
