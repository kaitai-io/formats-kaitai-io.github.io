// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * BCD (Binary Coded Decimals) is a common way to encode integer
 * numbers in a way that makes human-readable output somewhat
 * simpler. In this encoding scheme, every decimal digit is encoded as
 * either a single byte (8 bits), or a nibble (half of a byte, 4
 * bits). This obviously wastes a lot of bits, but it makes translation
 * into human-readable string much easier than traditional
 * binary-to-decimal conversion process, which includes lots of
 * divisions by 10.
 * 
 * For example, encoding integer 31337 in 8-digit, 8 bits per digit,
 * big endian order of digits BCD format yields
 * 
 * ```
 * 00 00 00 03 01 03 03 07
 * ```
 * 
 * Encoding the same integer as 8-digit, 4 bits per digit, little
 * endian order BCD format would yield:
 * 
 * ```
 * 73 31 30 00
 * ```
 * 
 * Using this type of encoding in Kaitai Struct is pretty
 * straightforward: one calls for this type, specifying desired
 * encoding parameters, and gets result using either `as_int` or
 * `as_str` attributes.
 */
public class Bcd extends KaitaiStruct {

    public Bcd(KaitaiStream _io, int numDigits, int bitsPerDigit, boolean isLe) {
        this(_io, null, null, numDigits, bitsPerDigit, isLe);
    }

    public Bcd(KaitaiStream _io, KaitaiStruct _parent, int numDigits, int bitsPerDigit, boolean isLe) {
        this(_io, _parent, null, numDigits, bitsPerDigit, isLe);
    }

    public Bcd(KaitaiStream _io, KaitaiStruct _parent, Bcd _root, int numDigits, int bitsPerDigit, boolean isLe) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        this.numDigits = numDigits;
        this.bitsPerDigit = bitsPerDigit;
        this.isLe = isLe;
        _read();
    }
    private void _read() {
        this.digits = new ArrayList<Integer>();
        for (int i = 0; i < numDigits(); i++) {
            switch (bitsPerDigit()) {
            case 4: {
                this.digits.add(((Number) (this._io.readBitsIntBe(4))).intValue());
                break;
            }
            case 8: {
                this.digits.add(((Number) (this._io.readU1())).intValue());
                break;
            }
            }
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.digits.size(); i++) {
            switch (bitsPerDigit()) {
            case 4: {
                break;
            }
            case 8: {
                break;
            }
            }
        }
    }
    private Integer asInt;

    /**
     * Value of this BCD number as integer. Endianness would be selected based on `is_le` parameter given.
     */
    public Integer asInt() {
        if (this.asInt != null)
            return this.asInt;
        this.asInt = ((Number) ((isLe() ? asIntLe() : asIntBe()))).intValue();
        return this.asInt;
    }
    private Integer asIntBe;

    /**
     * Value of this BCD number as integer (treating digit order as big-endian).
     */
    public Integer asIntBe() {
        if (this.asIntBe != null)
            return this.asIntBe;
        this.asIntBe = ((Number) (digits().get(((Number) (lastIdx())).intValue()) + (numDigits() < 2 ? 0 : digits().get(((Number) (lastIdx() - 1)).intValue()) * 10 + (numDigits() < 3 ? 0 : digits().get(((Number) (lastIdx() - 2)).intValue()) * 100 + (numDigits() < 4 ? 0 : digits().get(((Number) (lastIdx() - 3)).intValue()) * 1000 + (numDigits() < 5 ? 0 : digits().get(((Number) (lastIdx() - 4)).intValue()) * 10000 + (numDigits() < 6 ? 0 : digits().get(((Number) (lastIdx() - 5)).intValue()) * 100000 + (numDigits() < 7 ? 0 : digits().get(((Number) (lastIdx() - 6)).intValue()) * 1000000 + (numDigits() < 8 ? 0 : digits().get(((Number) (lastIdx() - 7)).intValue()) * 10000000))))))))).intValue();
        return this.asIntBe;
    }
    private Integer asIntLe;

    /**
     * Value of this BCD number as integer (treating digit order as little-endian).
     */
    public Integer asIntLe() {
        if (this.asIntLe != null)
            return this.asIntLe;
        this.asIntLe = ((Number) (digits().get(((int) 0)) + (numDigits() < 2 ? 0 : digits().get(((int) 1)) * 10 + (numDigits() < 3 ? 0 : digits().get(((int) 2)) * 100 + (numDigits() < 4 ? 0 : digits().get(((int) 3)) * 1000 + (numDigits() < 5 ? 0 : digits().get(((int) 4)) * 10000 + (numDigits() < 6 ? 0 : digits().get(((int) 5)) * 100000 + (numDigits() < 7 ? 0 : digits().get(((int) 6)) * 1000000 + (numDigits() < 8 ? 0 : digits().get(((int) 7)) * 10000000))))))))).intValue();
        return this.asIntLe;
    }
    private Integer lastIdx;

    /**
     * Index of last digit (0-based).
     */
    public Integer lastIdx() {
        if (this.lastIdx != null)
            return this.lastIdx;
        this.lastIdx = ((Number) (numDigits() - 1)).intValue();
        return this.lastIdx;
    }
    private List<Integer> digits;
    private int numDigits;
    private int bitsPerDigit;
    private boolean isLe;
    private Bcd _root;
    private KaitaiStruct _parent;
    public List<Integer> digits() { return digits; }

    /**
     * Number of digits in this BCD representation. Only values from 1 to 8 inclusive are supported.
     */
    public int numDigits() { return numDigits; }

    /**
     * Number of bits per digit. Only values of 4 and 8 are supported.
     */
    public int bitsPerDigit() { return bitsPerDigit; }

    /**
     * Endianness used by this BCD representation. True means little-endian, false is for big-endian.
     */
    public boolean isLe() { return isLe; }
    public Bcd _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
