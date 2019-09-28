// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;


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
        digits = new ArrayList<Integer>(((Number) (numDigits())).intValue());
        for (int i = 0; i < numDigits(); i++) {
            switch (bitsPerDigit()) {
            case 4: {
                this.digits.add((int) (this._io.readBitsInt(4)));
                break;
            }
            case 8: {
                this.digits.add((int) (this._io.readU1()));
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
        int _tmp = (int) ((isLe() ? asIntLe() : asIntBe()));
        this.asInt = _tmp;
        return this.asInt;
    }
    private Integer asIntLe;

    /**
     * Value of this BCD number as integer (treating digit order as little-endian).
     */
    public Integer asIntLe() {
        if (this.asIntLe != null)
            return this.asIntLe;
        int _tmp = (int) ((digits().get((int) 0) + (numDigits() < 2 ? 0 : ((digits().get((int) 1) * 10) + (numDigits() < 3 ? 0 : ((digits().get((int) 2) * 100) + (numDigits() < 4 ? 0 : ((digits().get((int) 3) * 1000) + (numDigits() < 5 ? 0 : ((digits().get((int) 4) * 10000) + (numDigits() < 6 ? 0 : ((digits().get((int) 5) * 100000) + (numDigits() < 7 ? 0 : ((digits().get((int) 6) * 1000000) + (numDigits() < 8 ? 0 : (digits().get((int) 7) * 10000000))))))))))))))));
        this.asIntLe = _tmp;
        return this.asIntLe;
    }
    private Integer lastIdx;

    /**
     * Index of last digit (0-based).
     */
    public Integer lastIdx() {
        if (this.lastIdx != null)
            return this.lastIdx;
        int _tmp = (int) ((numDigits() - 1));
        this.lastIdx = _tmp;
        return this.lastIdx;
    }
    private Integer asIntBe;

    /**
     * Value of this BCD number as integer (treating digit order as big-endian).
     */
    public Integer asIntBe() {
        if (this.asIntBe != null)
            return this.asIntBe;
        int _tmp = (int) ((digits().get((int) lastIdx()) + (numDigits() < 2 ? 0 : ((digits().get((int) (lastIdx() - 1)) * 10) + (numDigits() < 3 ? 0 : ((digits().get((int) (lastIdx() - 2)) * 100) + (numDigits() < 4 ? 0 : ((digits().get((int) (lastIdx() - 3)) * 1000) + (numDigits() < 5 ? 0 : ((digits().get((int) (lastIdx() - 4)) * 10000) + (numDigits() < 6 ? 0 : ((digits().get((int) (lastIdx() - 5)) * 100000) + (numDigits() < 7 ? 0 : ((digits().get((int) (lastIdx() - 6)) * 1000000) + (numDigits() < 8 ? 0 : (digits().get((int) (lastIdx() - 7)) * 10000000))))))))))))))));
        this.asIntBe = _tmp;
        return this.asIntBe;
    }
    private ArrayList<Integer> digits;
    private int numDigits;
    private int bitsPerDigit;
    private boolean isLe;
    private Bcd _root;
    private KaitaiStruct _parent;
    public ArrayList<Integer> digits() { return digits; }

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
