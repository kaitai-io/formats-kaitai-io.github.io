// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;

public class Edid extends KaitaiStruct {
    public static Edid fromFile(String fileName) throws IOException {
        return new Edid(new KaitaiStream(fileName));
    }

    public Edid(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Edid(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Edid(KaitaiStream _io, KaitaiStruct _parent, Edid _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.magic = this._io.ensureFixedContents(new byte[] { 0, -1, -1, -1, -1, -1, -1, 0 });
        this.mfgBytes = this._io.readU2le();
        this.productCode = this._io.readU2le();
        this.serial = this._io.readU4le();
        this.mfgWeek = this._io.readU1();
        this.mfgYearMod = this._io.readU1();
        this.edidVersionMajor = this._io.readU1();
        this.edidVersionMinor = this._io.readU1();
        this.inputFlags = this._io.readU1();
        this.screenSizeH = this._io.readU1();
        this.screenSizeV = this._io.readU1();
        this.gammaMod = this._io.readU1();
        this.featuresFlags = this._io.readU1();
        this.chromacity = this._io.readBytes(10);
    }
    private Integer mfgYear;
    public Integer mfgYear() {
        if (this.mfgYear != null)
            return this.mfgYear;
        int _tmp = (int) ((mfgYearMod() + 1990));
        this.mfgYear = _tmp;
        return this.mfgYear;
    }
    private Integer mfgIdCh1;
    public Integer mfgIdCh1() {
        if (this.mfgIdCh1 != null)
            return this.mfgIdCh1;
        int _tmp = (int) (((mfgBytes() & 31744) >> 10));
        this.mfgIdCh1 = _tmp;
        return this.mfgIdCh1;
    }
    private Integer mfgIdCh3;
    public Integer mfgIdCh3() {
        if (this.mfgIdCh3 != null)
            return this.mfgIdCh3;
        int _tmp = (int) ((mfgBytes() & 31));
        this.mfgIdCh3 = _tmp;
        return this.mfgIdCh3;
    }
    private Double gamma;
    public Double gamma() {
        if (this.gamma != null)
            return this.gamma;
        if (gammaMod() != 255) {
            double _tmp = (double) (((gammaMod() + 100) / 100.0));
            this.gamma = _tmp;
        }
        return this.gamma;
    }
    private Integer mfgIdCh2;
    public Integer mfgIdCh2() {
        if (this.mfgIdCh2 != null)
            return this.mfgIdCh2;
        int _tmp = (int) (((mfgBytes() & 992) >> 5));
        this.mfgIdCh2 = _tmp;
        return this.mfgIdCh2;
    }
    private byte[] magic;
    private int mfgBytes;
    private int productCode;
    private long serial;
    private int mfgWeek;
    private int mfgYearMod;
    private int edidVersionMajor;
    private int edidVersionMinor;
    private int inputFlags;
    private int screenSizeH;
    private int screenSizeV;
    private int gammaMod;
    private int featuresFlags;
    private byte[] chromacity;
    private Edid _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public int mfgBytes() { return mfgBytes; }

    /**
     * Manufacturer product code
     */
    public int productCode() { return productCode; }

    /**
     * Serial number
     */
    public long serial() { return serial; }

    /**
     * Week of manufacture. Week numbering is not consistent between manufacturers.
     */
    public int mfgWeek() { return mfgWeek; }

    /**
     * Year of manufacture, less 1990. (1990–2245). If week=255, it is the model year instead.
     */
    public int mfgYearMod() { return mfgYearMod; }

    /**
     * EDID version, usually 1 (for 1.3)
     */
    public int edidVersionMajor() { return edidVersionMajor; }

    /**
     * EDID revision, usually 3 (for 1.3)
     */
    public int edidVersionMinor() { return edidVersionMinor; }
    public int inputFlags() { return inputFlags; }

    /**
     * Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
     */
    public int screenSizeH() { return screenSizeH; }

    /**
     * Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
     */
    public int screenSizeV() { return screenSizeV; }

    /**
     * Display gamma, datavalue = (gamma*100)-100 (range 1.00–3.54)
     */
    public int gammaMod() { return gammaMod; }
    public int featuresFlags() { return featuresFlags; }
    public byte[] chromacity() { return chromacity; }
    public Edid _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
