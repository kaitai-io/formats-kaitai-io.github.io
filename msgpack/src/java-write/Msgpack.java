// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.nio.charset.Charset;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * MessagePack (msgpack) is a system to serialize arbitrary structured
 * data into a compact binary stream.
 * @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md">Source</a>
 */
public class Msgpack extends KaitaiStruct.ReadWrite {
    public static Msgpack fromFile(String fileName) throws IOException {
        return new Msgpack(new ByteBufferKaitaiStream(fileName));
    }
    public Msgpack() {
        this(null, null, null);
    }

    public Msgpack(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Msgpack(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Msgpack(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Msgpack _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
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
                Msgpack _t_arrayElements = new Msgpack(this._io, this, _root);
                try {
                    _t_arrayElements._read();
                } finally {
                    this.arrayElements.add(_t_arrayElements);
                }
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
                MapTuple _t_mapElements = new MapTuple(this._io, this, _root);
                try {
                    _t_mapElements._read();
                } finally {
                    this.mapElements.add(_t_mapElements);
                }
            }
        }
        _dirty = false;
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

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU1(this.b1);
        switch (b1()) {
        case 204: {
            this._io.writeU1(((Number) (this.intExtra)).intValue());
            break;
        }
        case 205: {
            this._io.writeU2be(((Number) (this.intExtra)).intValue());
            break;
        }
        case 206: {
            this._io.writeU4be(((Number) (this.intExtra)).longValue());
            break;
        }
        case 207: {
            this._io.writeU8be(((Number) (this.intExtra)).longValue());
            break;
        }
        case 208: {
            this._io.writeS1(((Number) (this.intExtra)).byteValue());
            break;
        }
        case 209: {
            this._io.writeS2be(((Number) (this.intExtra)).shortValue());
            break;
        }
        case 210: {
            this._io.writeS4be(((Number) (this.intExtra)).intValue());
            break;
        }
        case 211: {
            this._io.writeS8be(((Number) (this.intExtra)).longValue());
            break;
        }
        }
        if (isFloat32()) {
            this._io.writeF4be(this.float32Value);
        }
        if (isFloat64()) {
            this._io.writeF8be(this.float64Value);
        }
        if (isStr8()) {
            this._io.writeU1(this.strLen8);
        }
        if (isStr16()) {
            this._io.writeU2be(this.strLen16);
        }
        if (isStr32()) {
            this._io.writeU4be(this.strLen32);
        }
        if (isStr()) {
            this._io.writeBytes((this.strValue).getBytes(Charset.forName("UTF-8")));
        }
        if (isArray16()) {
            this._io.writeU2be(this.numArrayElements16);
        }
        if (isArray32()) {
            this._io.writeU4be(this.numArrayElements32);
        }
        if (isArray()) {
            for (int i = 0; i < this.arrayElements.size(); i++) {
                this.arrayElements.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }
        if (isMap16()) {
            this._io.writeU2be(this.numMapElements16);
        }
        if (isMap32()) {
            this._io.writeU4be(this.numMapElements32);
        }
        if (isMap()) {
            for (int i = 0; i < this.mapElements.size(); i++) {
                this.mapElements.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }
    }

    public void _check() {
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
            if ((this.strValue).getBytes(Charset.forName("UTF-8")).length != strLen())
                throw new ConsistencyError("str_value", strLen(), (this.strValue).getBytes(Charset.forName("UTF-8")).length);
        }
        if (isArray16()) {
        }
        if (isArray32()) {
        }
        if (isArray()) {
            if (this.arrayElements.size() != numArrayElements())
                throw new ConsistencyError("array_elements", numArrayElements(), this.arrayElements.size());
            for (int i = 0; i < this.arrayElements.size(); i++) {
                if (!Objects.equals(this.arrayElements.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("array_elements", _root(), this.arrayElements.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.arrayElements.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("array_elements", this, this.arrayElements.get(((Number) (i)).intValue())._parent());
            }
        }
        if (isMap16()) {
        }
        if (isMap32()) {
        }
        if (isMap()) {
            if (this.mapElements.size() != numMapElements())
                throw new ConsistencyError("map_elements", numMapElements(), this.mapElements.size());
            for (int i = 0; i < this.mapElements.size(); i++) {
                if (!Objects.equals(this.mapElements.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("map_elements", _root(), this.mapElements.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.mapElements.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("map_elements", this, this.mapElements.get(((Number) (i)).intValue())._parent());
            }
        }
        _dirty = false;
    }
    public static class MapTuple extends KaitaiStruct.ReadWrite {
        public static MapTuple fromFile(String fileName) throws IOException {
            return new MapTuple(new ByteBufferKaitaiStream(fileName));
        }
        public MapTuple() {
            this(null, null, null);
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
        }
        public void _read() {
            this.key = new Msgpack(this._io, this, _root);
            this.key._read();
            this.value = new Msgpack(this._io, this, _root);
            this.value._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
            this.value._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.key._write_Seq(this._io);
            this.value._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.key._root(), _root()))
                throw new ConsistencyError("key", _root(), this.key._root());
            if (!Objects.equals(this.key._parent(), this))
                throw new ConsistencyError("key", this, this.key._parent());
            if (!Objects.equals(this.value._root(), _root()))
                throw new ConsistencyError("value", _root(), this.value._root());
            if (!Objects.equals(this.value._parent(), this))
                throw new ConsistencyError("value", this, this.value._parent());
            _dirty = false;
        }
        private Msgpack key;
        private Msgpack value;
        private Msgpack _root;
        private Msgpack _parent;
        public Msgpack key() { return key; }
        public void setKey(Msgpack _v) { _dirty = true; key = _v; }
        public Msgpack value() { return value; }
        public void setValue(Msgpack _v) { _dirty = true; value = _v; }
        public Msgpack _root() { return _root; }
        public void set_root(Msgpack _v) { _dirty = true; _root = _v; }
        public Msgpack _parent() { return _parent; }
        public void set_parent(Msgpack _v) { _dirty = true; _parent = _v; }
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
    public void _invalidateBoolValue() { this.boolValue = null; }
    private Double floatValue;
    public Double floatValue() {
        if (this.floatValue != null)
            return this.floatValue;
        if (isFloat()) {
            this.floatValue = ((Number) ((isFloat32() ? float32Value() : float64Value()))).doubleValue();
        }
        return this.floatValue;
    }
    public void _invalidateFloatValue() { this.floatValue = null; }
    private Integer intValue;
    public Integer intValue() {
        if (this.intValue != null)
            return this.intValue;
        if (isInt()) {
            this.intValue = ((Number) ((isPosInt7() ? posInt7Value() : (isNegInt5() ? negInt5Value() : 4919)))).intValue();
        }
        return this.intValue;
    }
    public void _invalidateIntValue() { this.intValue = null; }
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
    public void _invalidateIsArray() { this.isArray = null; }
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
    public void _invalidateIsArray16() { this.isArray16 = null; }
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
    public void _invalidateIsArray32() { this.isArray32 = null; }
    private Boolean isBool;
    public Boolean isBool() {
        if (this.isBool != null)
            return this.isBool;
        this.isBool =  ((b1() == 194) || (b1() == 195)) ;
        return this.isBool;
    }
    public void _invalidateIsBool() { this.isBool = null; }
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
    public void _invalidateIsFixArray() { this.isFixArray = null; }
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
    public void _invalidateIsFixMap() { this.isFixMap = null; }
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
    public void _invalidateIsFixStr() { this.isFixStr = null; }
    private Boolean isFloat;
    public Boolean isFloat() {
        if (this.isFloat != null)
            return this.isFloat;
        this.isFloat =  ((isFloat32()) || (isFloat64())) ;
        return this.isFloat;
    }
    public void _invalidateIsFloat() { this.isFloat = null; }
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
    public void _invalidateIsFloat32() { this.isFloat32 = null; }
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
    public void _invalidateIsFloat64() { this.isFloat64 = null; }
    private Boolean isInt;
    public Boolean isInt() {
        if (this.isInt != null)
            return this.isInt;
        this.isInt =  ((isPosInt7()) || (isNegInt5())) ;
        return this.isInt;
    }
    public void _invalidateIsInt() { this.isInt = null; }
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
    public void _invalidateIsMap() { this.isMap = null; }
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
    public void _invalidateIsMap16() { this.isMap16 = null; }
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
    public void _invalidateIsMap32() { this.isMap32 = null; }
    private Boolean isNegInt5;
    public Boolean isNegInt5() {
        if (this.isNegInt5 != null)
            return this.isNegInt5;
        this.isNegInt5 = (b1() & 224) == 224;
        return this.isNegInt5;
    }
    public void _invalidateIsNegInt5() { this.isNegInt5 = null; }
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
    public void _invalidateIsNil() { this.isNil = null; }
    private Boolean isPosInt7;
    public Boolean isPosInt7() {
        if (this.isPosInt7 != null)
            return this.isPosInt7;
        this.isPosInt7 = (b1() & 128) == 0;
        return this.isPosInt7;
    }
    public void _invalidateIsPosInt7() { this.isPosInt7 = null; }
    private Boolean isStr;
    public Boolean isStr() {
        if (this.isStr != null)
            return this.isStr;
        this.isStr =  ((isFixStr()) || (isStr8()) || (isStr16()) || (isStr32())) ;
        return this.isStr;
    }
    public void _invalidateIsStr() { this.isStr = null; }
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
    public void _invalidateIsStr16() { this.isStr16 = null; }
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
    public void _invalidateIsStr32() { this.isStr32 = null; }
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
    public void _invalidateIsStr8() { this.isStr8 = null; }
    private Integer negInt5Value;
    public Integer negInt5Value() {
        if (this.negInt5Value != null)
            return this.negInt5Value;
        if (isNegInt5()) {
            this.negInt5Value = ((Number) (-(b1() & 31))).intValue();
        }
        return this.negInt5Value;
    }
    public void _invalidateNegInt5Value() { this.negInt5Value = null; }
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
    public void _invalidateNumArrayElements() { this.numArrayElements = null; }
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
    public void _invalidateNumMapElements() { this.numMapElements = null; }
    private Integer posInt7Value;
    public Integer posInt7Value() {
        if (this.posInt7Value != null)
            return this.posInt7Value;
        if (isPosInt7()) {
            this.posInt7Value = ((Number) (b1())).intValue();
        }
        return this.posInt7Value;
    }
    public void _invalidatePosInt7Value() { this.posInt7Value = null; }
    private Integer strLen;
    public Integer strLen() {
        if (this.strLen != null)
            return this.strLen;
        if (isStr()) {
            this.strLen = ((Number) ((isFixStr() ? b1() & 31 : (isStr8() ? strLen8() : (isStr16() ? strLen16() : strLen32()))))).intValue();
        }
        return this.strLen;
    }
    public void _invalidateStrLen() { this.strLen = null; }
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
    private KaitaiStruct.ReadWrite _parent;

    /**
     * First byte is msgpack message is either a piece of data by
     * itself or determines types of further, more complex data
     * structures.
     */
    public int b1() { return b1; }
    public void setB1(int _v) { _dirty = true; b1 = _v; }
    public Integer intExtra() { return intExtra; }
    public void setIntExtra(Integer _v) { _dirty = true; intExtra = _v; }
    public Float float32Value() { return float32Value; }
    public void setFloat32Value(Float _v) { _dirty = true; float32Value = _v; }
    public Double float64Value() { return float64Value; }
    public void setFloat64Value(Double _v) { _dirty = true; float64Value = _v; }
    public Integer strLen8() { return strLen8; }
    public void setStrLen8(Integer _v) { _dirty = true; strLen8 = _v; }
    public Integer strLen16() { return strLen16; }
    public void setStrLen16(Integer _v) { _dirty = true; strLen16 = _v; }
    public Long strLen32() { return strLen32; }
    public void setStrLen32(Long _v) { _dirty = true; strLen32 = _v; }
    public String strValue() { return strValue; }
    public void setStrValue(String _v) { _dirty = true; strValue = _v; }
    public Integer numArrayElements16() { return numArrayElements16; }
    public void setNumArrayElements16(Integer _v) { _dirty = true; numArrayElements16 = _v; }
    public Long numArrayElements32() { return numArrayElements32; }
    public void setNumArrayElements32(Long _v) { _dirty = true; numArrayElements32 = _v; }
    public List<Msgpack> arrayElements() { return arrayElements; }
    public void setArrayElements(List<Msgpack> _v) { _dirty = true; arrayElements = _v; }
    public Integer numMapElements16() { return numMapElements16; }
    public void setNumMapElements16(Integer _v) { _dirty = true; numMapElements16 = _v; }
    public Long numMapElements32() { return numMapElements32; }
    public void setNumMapElements32(Long _v) { _dirty = true; numMapElements32 = _v; }
    public List<MapTuple> mapElements() { return mapElements; }
    public void setMapElements(List<MapTuple> _v) { _dirty = true; mapElements = _v; }
    public Msgpack _root() { return _root; }
    public void set_root(Msgpack _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
