// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * MessagePack (msgpack) is a system to serialize arbitrary structured data into a compact binary stream.
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md">Source</a>
 */
public class Msgpack extends KaitaiStruct {
    public static Msgpack fromFile(String fileName) throws IOException {
        return new Msgpack(new KaitaiStream(fileName));
    }

    public Msgpack(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Msgpack(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Msgpack(KaitaiStream _io, KaitaiStruct _parent, Msgpack _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.b1 = this._io.readU1();
        switch (b1()) {
        case 211: {
            this.intExtra = this._io.readS8be();
            break;
        }
        case 209: {
            this.intExtra = this._io.readS2be();
            break;
        }
        case 210: {
            this.intExtra = this._io.readS4be();
            break;
        }
        case 208: {
            this.intExtra = this._io.readS1();
            break;
        }
        case 205: {
            this.intExtra = this._io.readU2be();
            break;
        }
        case 207: {
            this.intExtra = this._io.readU8be();
            break;
        }
        case 204: {
            this.intExtra = this._io.readU1();
            break;
        }
        case 206: {
            this.intExtra = this._io.readU4be();
            break;
        }
        }
        if (isFloat32()) {
            this.float32Value = this._io.readF4be();
        }
        if (isFloat64()) {
            this.float64Value = this._io.readF8be();
        }
        if (isStr8()) {
            this.strLen8 = this._io.readU1();
        }
        if (isStr16()) {
            this.strLen16 = this._io.readU2be();
        }
        if (isStr32()) {
            this.strLen32 = this._io.readU4be();
        }
        if (isStr()) {
            this.strValue = new String(this._io.readBytes(strLen()), Charset.forName("UTF-8"));
        }
        if (isArray16()) {
            this.numArrayElements16 = this._io.readU2be();
        }
        if (isArray32()) {
            this.numArrayElements32 = this._io.readU4be();
        }
        if (isArray()) {
            arrayElements = new ArrayList<Msgpack>((int) (numArrayElements()));
            for (int i = 0; i < numArrayElements(); i++) {
                this.arrayElements.add(new Msgpack(this._io));
            }
        }
        if (isMap16()) {
            this.numMapElements16 = this._io.readU2be();
        }
        if (isMap32()) {
            this.numMapElements32 = this._io.readU4be();
        }
        if (isMap()) {
            mapElements = new ArrayList<MapTuple>((int) (numMapElements()));
            for (int i = 0; i < numMapElements(); i++) {
                this.mapElements.add(new MapTuple(this._io, this, _root));
            }
        }
    }
    public static class MapTuple extends KaitaiStruct {
        public static MapTuple fromFile(String fileName) throws IOException {
            return new MapTuple(new KaitaiStream(fileName));
        }

        public MapTuple(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public MapTuple(KaitaiStream _io, Msgpack _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public MapTuple(KaitaiStream _io, Msgpack _parent, Msgpack _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.key = new Msgpack(this._io);
            this.value = new Msgpack(this._io);
        }
        private Msgpack key;
        private Msgpack value;
        private Msgpack _root;
        private Msgpack _parent;
        public Msgpack key() { return key; }
        public Msgpack value() { return value; }
        public Msgpack _root() { return _root; }
        public Msgpack _parent() { return _parent; }
    }
    private Boolean isArray32;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Boolean isArray32() {
        if (this.isArray32 != null)
            return this.isArray32;
        boolean _tmp = (boolean) (b1() == 221);
        this.isArray32 = _tmp;
        return this.isArray32;
    }
    private Integer intValue;
    public Integer intValue() {
        if (this.intValue != null)
            return this.intValue;
        if (isInt()) {
            int _tmp = (int) ((isPosInt7() ? posInt7Value() : (isNegInt5() ? negInt5Value() : 4919)));
            this.intValue = _tmp;
        }
        return this.intValue;
    }
    private Integer strLen;
    public Integer strLen() {
        if (this.strLen != null)
            return this.strLen;
        if (isStr()) {
            int _tmp = (int) ((isFixStr() ? (b1() & 31) : (isStr8() ? strLen8() : (isStr16() ? strLen16() : strLen32()))));
            this.strLen = _tmp;
        }
        return this.strLen;
    }
    private Boolean isFixArray;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Boolean isFixArray() {
        if (this.isFixArray != null)
            return this.isFixArray;
        boolean _tmp = (boolean) ((b1() & 240) == 144);
        this.isFixArray = _tmp;
        return this.isFixArray;
    }
    private Boolean isMap;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Boolean isMap() {
        if (this.isMap != null)
            return this.isMap;
        boolean _tmp = (boolean) ( ((isFixMap()) || (isMap16()) || (isMap32())) );
        this.isMap = _tmp;
        return this.isMap;
    }
    private Boolean isArray;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Boolean isArray() {
        if (this.isArray != null)
            return this.isArray;
        boolean _tmp = (boolean) ( ((isFixArray()) || (isArray16()) || (isArray32())) );
        this.isArray = _tmp;
        return this.isArray;
    }
    private Boolean isFloat;
    public Boolean isFloat() {
        if (this.isFloat != null)
            return this.isFloat;
        boolean _tmp = (boolean) ( ((isFloat32()) || (isFloat64())) );
        this.isFloat = _tmp;
        return this.isFloat;
    }
    private Boolean isStr8;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
     */
    public Boolean isStr8() {
        if (this.isStr8 != null)
            return this.isStr8;
        boolean _tmp = (boolean) (b1() == 217);
        this.isStr8 = _tmp;
        return this.isStr8;
    }
    private Boolean isFixMap;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Boolean isFixMap() {
        if (this.isFixMap != null)
            return this.isFixMap;
        boolean _tmp = (boolean) ((b1() & 240) == 128);
        this.isFixMap = _tmp;
        return this.isFixMap;
    }
    private Boolean isInt;
    public Boolean isInt() {
        if (this.isInt != null)
            return this.isInt;
        boolean _tmp = (boolean) ( ((isPosInt7()) || (isNegInt5())) );
        this.isInt = _tmp;
        return this.isInt;
    }
    private Boolean isBool;
    public Boolean isBool() {
        if (this.isBool != null)
            return this.isBool;
        boolean _tmp = (boolean) ( ((b1() == 194) || (b1() == 195)) );
        this.isBool = _tmp;
        return this.isBool;
    }
    private Boolean isStr16;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
     */
    public Boolean isStr16() {
        if (this.isStr16 != null)
            return this.isStr16;
        boolean _tmp = (boolean) (b1() == 218);
        this.isStr16 = _tmp;
        return this.isStr16;
    }
    private Boolean isFloat64;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
     */
    public Boolean isFloat64() {
        if (this.isFloat64 != null)
            return this.isFloat64;
        boolean _tmp = (boolean) (b1() == 203);
        this.isFloat64 = _tmp;
        return this.isFloat64;
    }
    private Boolean isMap16;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Boolean isMap16() {
        if (this.isMap16 != null)
            return this.isMap16;
        boolean _tmp = (boolean) (b1() == 222);
        this.isMap16 = _tmp;
        return this.isMap16;
    }
    private Boolean isNegInt5;
    public Boolean isNegInt5() {
        if (this.isNegInt5 != null)
            return this.isNegInt5;
        boolean _tmp = (boolean) ((b1() & 224) == 224);
        this.isNegInt5 = _tmp;
        return this.isNegInt5;
    }
    private Integer posInt7Value;
    public Integer posInt7Value() {
        if (this.posInt7Value != null)
            return this.posInt7Value;
        if (isPosInt7()) {
            int _tmp = (int) (b1());
            this.posInt7Value = _tmp;
        }
        return this.posInt7Value;
    }
    private Boolean isNil;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil">Source</a>
     */
    public Boolean isNil() {
        if (this.isNil != null)
            return this.isNil;
        boolean _tmp = (boolean) (b1() == 192);
        this.isNil = _tmp;
        return this.isNil;
    }
    private Double floatValue;
    public Double floatValue() {
        if (this.floatValue != null)
            return this.floatValue;
        if (isFloat()) {
            double _tmp = (double) ((isFloat32() ? float32Value() : float64Value()));
            this.floatValue = _tmp;
        }
        return this.floatValue;
    }
    private Integer numArrayElements;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Integer numArrayElements() {
        if (this.numArrayElements != null)
            return this.numArrayElements;
        if (isArray()) {
            int _tmp = (int) ((isFixArray() ? (b1() & 15) : (isArray16() ? numArrayElements16() : numArrayElements32())));
            this.numArrayElements = _tmp;
        }
        return this.numArrayElements;
    }
    private Integer negInt5Value;
    public Integer negInt5Value() {
        if (this.negInt5Value != null)
            return this.negInt5Value;
        if (isNegInt5()) {
            int _tmp = (int) (-((b1() & 31)));
            this.negInt5Value = _tmp;
        }
        return this.negInt5Value;
    }
    private Boolean boolValue;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool">Source</a>
     */
    public Boolean boolValue() {
        if (this.boolValue != null)
            return this.boolValue;
        if (isBool()) {
            boolean _tmp = (boolean) (b1() == 194);
            this.boolValue = _tmp;
        }
        return this.boolValue;
    }
    private Boolean isPosInt7;
    public Boolean isPosInt7() {
        if (this.isPosInt7 != null)
            return this.isPosInt7;
        boolean _tmp = (boolean) ((b1() & 128) == 0);
        this.isPosInt7 = _tmp;
        return this.isPosInt7;
    }
    private Boolean isArray16;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Boolean isArray16() {
        if (this.isArray16 != null)
            return this.isArray16;
        boolean _tmp = (boolean) (b1() == 220);
        this.isArray16 = _tmp;
        return this.isArray16;
    }
    private Boolean isStr;
    public Boolean isStr() {
        if (this.isStr != null)
            return this.isStr;
        boolean _tmp = (boolean) ( ((isFixStr()) || (isStr8()) || (isStr16()) || (isStr32())) );
        this.isStr = _tmp;
        return this.isStr;
    }
    private Boolean isFixStr;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
     */
    public Boolean isFixStr() {
        if (this.isFixStr != null)
            return this.isFixStr;
        boolean _tmp = (boolean) ((b1() & 224) == 160);
        this.isFixStr = _tmp;
        return this.isFixStr;
    }
    private Boolean isStr32;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
     */
    public Boolean isStr32() {
        if (this.isStr32 != null)
            return this.isStr32;
        boolean _tmp = (boolean) (b1() == 219);
        this.isStr32 = _tmp;
        return this.isStr32;
    }
    private Integer numMapElements;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Integer numMapElements() {
        if (this.numMapElements != null)
            return this.numMapElements;
        if (isMap()) {
            int _tmp = (int) ((isFixMap() ? (b1() & 15) : (isMap16() ? numMapElements16() : numMapElements32())));
            this.numMapElements = _tmp;
        }
        return this.numMapElements;
    }
    private Boolean isFloat32;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
     */
    public Boolean isFloat32() {
        if (this.isFloat32 != null)
            return this.isFloat32;
        boolean _tmp = (boolean) (b1() == 202);
        this.isFloat32 = _tmp;
        return this.isFloat32;
    }
    private Boolean isMap32;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Boolean isMap32() {
        if (this.isMap32 != null)
            return this.isMap32;
        boolean _tmp = (boolean) (b1() == 223);
        this.isMap32 = _tmp;
        return this.isMap32;
    }
    private int b1;
    private int intExtra;
    private Float float32Value;
    private Double float64Value;
    private Integer strLen8;
    private Integer strLen16;
    private Long strLen32;
    private String strValue;
    private Integer numArrayElements16;
    private Long numArrayElements32;
    private ArrayList<Msgpack> arrayElements;
    private Integer numMapElements16;
    private Long numMapElements32;
    private ArrayList<MapTuple> mapElements;
    private Msgpack _root;
    private KaitaiStruct _parent;

    /**
     * First byte is msgpack message is either a piece of data by
     * itself or determines types of further, more complex data
     * structures.
     */
    public int b1() { return b1; }
    public int intExtra() { return intExtra; }
    public Float float32Value() { return float32Value; }
    public Double float64Value() { return float64Value; }
    public Integer strLen8() { return strLen8; }
    public Integer strLen16() { return strLen16; }
    public Long strLen32() { return strLen32; }
    public String strValue() { return strValue; }
    public Integer numArrayElements16() { return numArrayElements16; }
    public Long numArrayElements32() { return numArrayElements32; }
    public ArrayList<Msgpack> arrayElements() { return arrayElements; }
    public Integer numMapElements16() { return numMapElements16; }
    public Long numMapElements32() { return numMapElements32; }
    public ArrayList<MapTuple> mapElements() { return mapElements; }
    public Msgpack _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
