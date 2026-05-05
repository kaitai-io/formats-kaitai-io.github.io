// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;


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
public class Utf16WithBom extends KaitaiStruct {
    public static Utf16WithBom fromFile(String fileName) throws IOException {
        return new Utf16WithBom(new ByteBufferKaitaiStream(fileName));
    }

    public Utf16WithBom(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Utf16WithBom(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Utf16WithBom(KaitaiStream _io, KaitaiStruct _parent, Utf16WithBom _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
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
    }

    public void _fetchInstances() {
        if (isBe()) {
        }
        if (isLe()) {
        }
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
    private byte[] bom;
    private String strBe;
    private String strLe;
    private Utf16WithBom _root;
    private KaitaiStruct _parent;

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
    public String strBe() { return strBe; }
    public String strLe() { return strLe; }
    public Utf16WithBom _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
