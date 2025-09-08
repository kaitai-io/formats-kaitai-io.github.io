// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


/**
 * MessagePack (msgpack) is a system to serialize arbitrary structured
 * data into a compact binary stream.
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md">Source</a>
 */
public class Msgpack extends KaitaiStruct {
    public static Msgpack fromFile(String fileName) throws IOException {
        return new Msgpack(new ByteBufferKaitaiStream(fileName));
    }

    public Msgpack(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Msgpack(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Msgpack(KaitaiStream _io, KaitaiStruct _parent, Msgpack _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.b1 = this._io.readU1();
        switch (b1()) {
        case 204: {
            this.intExtra = ((Number) (this._io.readU1())).intValue();
            break;
        }
        case 205: {
            this.intExtra = ((Number) (this._io.readU2be())).intValue();
            break;
        }
        case 206: {
            this.intExtra = ((Number) (this._io.readU4be())).intValue();
            break;
        }
        case 207: {
            this.intExtra = ((Number) (this._io.readU8be())).intValue();
            break;
        }
        case 208: {
            this.intExtra = ((Number) (this._io.readS1())).intValue();
            break;
        }
        case 209: {
            this.intExtra = ((Number) (this._io.readS2be())).intValue();
            break;
        }
        case 210: {
            this.intExtra = ((Number) (this._io.readS4be())).intValue();
            break;
        }
        case 211: {
            this.intExtra = ((Number) (this._io.readS8be())).intValue();
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
            this.strValue = new String(this._io.readBytes(strLen()), StandardCharsets.UTF_8);
        }
        if (isArray16()) {
            this.numArrayElements16 = this._io.readU2be();
        }
        if (isArray32()) {
            this.numArrayElements32 = this._io.readU4be();
        }
        if (isArray()) {
            this.arrayElements = new ArrayList<Msgpack>();
            for (int i = 0; i < numArrayElements(); i++) {
                this.arrayElements.add(new Msgpack(this._io, this, _root));
            }
        }
        if (isMap16()) {
            this.numMapElements16 = this._io.readU2be();
        }
        if (isMap32()) {
            this.numMapElements32 = this._io.readU4be();
        }
        if (isMap()) {
            this.mapElements = new ArrayList<MapTuple>();
            for (int i = 0; i < numMapElements(); i++) {
                this.mapElements.add(new MapTuple(this._io, this, _root));
            }
        }
    }

    public void _fetchInstances() {
        switch (b1()) {
        case 204: {
            break;
        }
        case 205: {
            break;
        }
        case 206: {
            break;
        }
        case 207: {
            break;
        }
        case 208: {
            break;
        }
        case 209: {
            break;
        }
        case 210: {
            break;
        }
        case 211: {
            break;
        }
        }
        if (isFloat32()) {
        }
        if (isFloat64()) {
        }
        if (isStr8()) {
        }
        if (isStr16()) {
        }
        if (isStr32()) {
        }
        if (isStr()) {
        }
        if (isArray16()) {
        }
        if (isArray32()) {
        }
        if (isArray()) {
            for (int i = 0; i < this.arrayElements.size(); i++) {
                this.arrayElements.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        if (isMap16()) {
        }
        if (isMap32()) {
        }
        if (isMap()) {
            for (int i = 0; i < this.mapElements.size(); i++) {
                this.mapElements.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }
    public static class MapTuple extends KaitaiStruct {
        public static MapTuple fromFile(String fileName) throws IOException {
            return new MapTuple(new ByteBufferKaitaiStream(fileName));
        }

        public MapTuple(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MapTuple(KaitaiStream _io, Msgpack _parent) {
            this(_io, _parent, null);
        }

        public MapTuple(KaitaiStream _io, Msgpack _parent, Msgpack _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.key = new Msgpack(this._io, this, _root);
            this.value = new Msgpack(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
            this.value._fetchInstances();
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
    private Boolean boolValue;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool">Source</a>
     */
    public Boolean boolValue() {
        if (this.boolValue != null)
            return this.boolValue;
        if (isBool()) {
            this.boolValue = b1() == 195;
        }
        return this.boolValue;
    }
    private Double floatValue;
    public Double floatValue() {
        if (this.floatValue != null)
            return this.floatValue;
        if (isFloat()) {
            this.floatValue = ((Number) ((isFloat32() ? float32Value() : float64Value()))).doubleValue();
        }
        return this.floatValue;
    }
    private Integer intValue;
    public Integer intValue() {
        if (this.intValue != null)
            return this.intValue;
        if (isInt()) {
            this.intValue = ((Number) ((isPosInt7() ? posInt7Value() : (isNegInt5() ? negInt5Value() : 4919)))).intValue();
        }
        return this.intValue;
    }
    private Boolean isArray;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Boolean isArray() {
        if (this.isArray != null)
            return this.isArray;
        this.isArray =  ((isFixArray()) || (isArray16()) || (isArray32())) ;
        return this.isArray;
    }
    private Boolean isArray16;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Boolean isArray16() {
        if (this.isArray16 != null)
            return this.isArray16;
        this.isArray16 = b1() == 220;
        return this.isArray16;
    }
    private Boolean isArray32;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Boolean isArray32() {
        if (this.isArray32 != null)
            return this.isArray32;
        this.isArray32 = b1() == 221;
        return this.isArray32;
    }
    private Boolean isBool;
    public Boolean isBool() {
        if (this.isBool != null)
            return this.isBool;
        this.isBool =  ((b1() == 194) || (b1() == 195)) ;
        return this.isBool;
    }
    private Boolean isFixArray;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Boolean isFixArray() {
        if (this.isFixArray != null)
            return this.isFixArray;
        this.isFixArray = (b1() & 240) == 144;
        return this.isFixArray;
    }
    private Boolean isFixMap;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Boolean isFixMap() {
        if (this.isFixMap != null)
            return this.isFixMap;
        this.isFixMap = (b1() & 240) == 128;
        return this.isFixMap;
    }
    private Boolean isFixStr;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
     */
    public Boolean isFixStr() {
        if (this.isFixStr != null)
            return this.isFixStr;
        this.isFixStr = (b1() & 224) == 160;
        return this.isFixStr;
    }
    private Boolean isFloat;
    public Boolean isFloat() {
        if (this.isFloat != null)
            return this.isFloat;
        this.isFloat =  ((isFloat32()) || (isFloat64())) ;
        return this.isFloat;
    }
    private Boolean isFloat32;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
     */
    public Boolean isFloat32() {
        if (this.isFloat32 != null)
            return this.isFloat32;
        this.isFloat32 = b1() == 202;
        return this.isFloat32;
    }
    private Boolean isFloat64;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
     */
    public Boolean isFloat64() {
        if (this.isFloat64 != null)
            return this.isFloat64;
        this.isFloat64 = b1() == 203;
        return this.isFloat64;
    }
    private Boolean isInt;
    public Boolean isInt() {
        if (this.isInt != null)
            return this.isInt;
        this.isInt =  ((isPosInt7()) || (isNegInt5())) ;
        return this.isInt;
    }
    private Boolean isMap;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Boolean isMap() {
        if (this.isMap != null)
            return this.isMap;
        this.isMap =  ((isFixMap()) || (isMap16()) || (isMap32())) ;
        return this.isMap;
    }
    private Boolean isMap16;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Boolean isMap16() {
        if (this.isMap16 != null)
            return this.isMap16;
        this.isMap16 = b1() == 222;
        return this.isMap16;
    }
    private Boolean isMap32;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Boolean isMap32() {
        if (this.isMap32 != null)
            return this.isMap32;
        this.isMap32 = b1() == 223;
        return this.isMap32;
    }
    private Boolean isNegInt5;
    public Boolean isNegInt5() {
        if (this.isNegInt5 != null)
            return this.isNegInt5;
        this.isNegInt5 = (b1() & 224) == 224;
        return this.isNegInt5;
    }
    private Boolean isNil;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil">Source</a>
     */
    public Boolean isNil() {
        if (this.isNil != null)
            return this.isNil;
        this.isNil = b1() == 192;
        return this.isNil;
    }
    private Boolean isPosInt7;
    public Boolean isPosInt7() {
        if (this.isPosInt7 != null)
            return this.isPosInt7;
        this.isPosInt7 = (b1() & 128) == 0;
        return this.isPosInt7;
    }
    private Boolean isStr;
    public Boolean isStr() {
        if (this.isStr != null)
            return this.isStr;
        this.isStr =  ((isFixStr()) || (isStr8()) || (isStr16()) || (isStr32())) ;
        return this.isStr;
    }
    private Boolean isStr16;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
     */
    public Boolean isStr16() {
        if (this.isStr16 != null)
            return this.isStr16;
        this.isStr16 = b1() == 218;
        return this.isStr16;
    }
    private Boolean isStr32;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
     */
    public Boolean isStr32() {
        if (this.isStr32 != null)
            return this.isStr32;
        this.isStr32 = b1() == 219;
        return this.isStr32;
    }
    private Boolean isStr8;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
     */
    public Boolean isStr8() {
        if (this.isStr8 != null)
            return this.isStr8;
        this.isStr8 = b1() == 217;
        return this.isStr8;
    }
    private Integer negInt5Value;
    public Integer negInt5Value() {
        if (this.negInt5Value != null)
            return this.negInt5Value;
        if (isNegInt5()) {
            this.negInt5Value = ((Number) (-(b1() & 31))).intValue();
        }
        return this.negInt5Value;
    }
    private Integer numArrayElements;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
     */
    public Integer numArrayElements() {
        if (this.numArrayElements != null)
            return this.numArrayElements;
        if (isArray()) {
            this.numArrayElements = ((Number) ((isFixArray() ? b1() & 15 : (isArray16() ? numArrayElements16() : numArrayElements32())))).intValue();
        }
        return this.numArrayElements;
    }
    private Integer numMapElements;

    /**
     * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
     */
    public Integer numMapElements() {
        if (this.numMapElements != null)
            return this.numMapElements;
        if (isMap()) {
            this.numMapElements = ((Number) ((isFixMap() ? b1() & 15 : (isMap16() ? numMapElements16() : numMapElements32())))).intValue();
        }
        return this.numMapElements;
    }
    private Integer posInt7Value;
    public Integer posInt7Value() {
        if (this.posInt7Value != null)
            return this.posInt7Value;
        if (isPosInt7()) {
            this.posInt7Value = ((Number) (b1())).intValue();
        }
        return this.posInt7Value;
    }
    private Integer strLen;
    public Integer strLen() {
        if (this.strLen != null)
            return this.strLen;
        if (isStr()) {
            this.strLen = ((Number) ((isFixStr() ? b1() & 31 : (isStr8() ? strLen8() : (isStr16() ? strLen16() : strLen32()))))).intValue();
        }
        return this.strLen;
    }
    private int b1;
    private Integer intExtra;
    private Float float32Value;
    private Double float64Value;
    private Integer strLen8;
    private Integer strLen16;
    private Long strLen32;
    private String strValue;
    private Integer numArrayElements16;
    private Long numArrayElements32;
    private List<Msgpack> arrayElements;
    private Integer numMapElements16;
    private Long numMapElements32;
    private List<MapTuple> mapElements;
    private Msgpack _root;
    private KaitaiStruct _parent;

    /**
     * First byte is msgpack message is either a piece of data by
     * itself or determines types of further, more complex data
     * structures.
     */
    public int b1() { return b1; }
    public Integer intExtra() { return intExtra; }
    public Float float32Value() { return float32Value; }
    public Double float64Value() { return float64Value; }
    public Integer strLen8() { return strLen8; }
    public Integer strLen16() { return strLen16; }
    public Long strLen32() { return strLen32; }
    public String strValue() { return strValue; }
    public Integer numArrayElements16() { return numArrayElements16; }
    public Long numArrayElements32() { return numArrayElements32; }
    public List<Msgpack> arrayElements() { return arrayElements; }
    public Integer numMapElements16() { return numMapElements16; }
    public Long numMapElements32() { return numMapElements32; }
    public List<MapTuple> mapElements() { return mapElements; }
    public Msgpack _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
