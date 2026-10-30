// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;


/**
 * GGUF is the file format of the [ggml](https://github.com/ggml-org/ggml)
 * tensor library for storing machine learning models, used for example by
 * [llama.cpp](https://github.com/ggml-org/llama.cpp) for inference. It
 * replaced the older GGML, GGMF and GGJT formats.
 * 
 * A GGUF file consists of a header with metadata as key-value pairs (model
 * architecture, hyperparameters, tokenizer, etc.), a description of each
 * tensor (name, dimensions, type and offset), and finally the tensor data.
 * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md">Git tag "v0.27.0"</a>
 */
public class Gguf extends KaitaiStruct {
    public static Gguf fromFile(String fileName) throws IOException {
        return new Gguf(new ByteBufferKaitaiStream(fileName));
    }

    public enum GgmlType {
        F32(0),
        F16(1),
        Q4_0(2),
        Q4_1(3),
        Q4_2(4),
        Q4_3(5),
        Q5_0(6),
        Q5_1(7),
        Q8_0(8),
        Q8_1(9),
        Q2_K(10),
        Q3_K(11),
        Q4_K(12),
        Q5_K(13),
        Q6_K(14),
        Q8_K(15),
        IQ2_XXS(16),
        IQ2_XS(17),
        IQ3_XXS(18),
        IQ1_S(19),
        IQ4_NL(20),
        IQ3_S(21),
        IQ2_S(22),
        IQ4_XS(23),
        I8(24),
        I16(25),
        I32(26),
        I64(27),
        F64(28),
        IQ1_M(29),
        BF16(30),
        Q4_0_4_4(31),
        Q4_0_4_8(32),
        Q4_0_8_8(33),
        TQ1_0(34),
        TQ2_0(35),
        IQ4_NL_4_4(36),
        IQ4_NL_4_8(37),
        IQ4_NL_8_8(38),
        MXFP4(39),
        NVFP4(40),
        Q1_0(41),
        Q2_0(42);

        private final long id;
        GgmlType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, GgmlType> byId = new HashMap<Long, GgmlType>(43);
        static {
            for (GgmlType e : GgmlType.values())
                byId.put(e.id(), e);
        }
        public static GgmlType byId(long id) { return byId.get(id); }
    }

    public enum GgufType {
        UINT8(0),
        INT8(1),
        UINT16(2),
        INT16(3),
        UINT32(4),
        INT32(5),
        FLOAT32(6),
        BOOL(7),
        STRING(8),
        ARRAY(9),
        UINT64(10),
        INT64(11),
        FLOAT64(12);

        private final long id;
        GgufType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, GgufType> byId = new HashMap<Long, GgufType>(13);
        static {
            for (GgufType e : GgufType.values())
                byId.put(e.id(), e);
        }
        public static GgufType byId(long id) { return byId.get(id); }
    }

    public Gguf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gguf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Gguf(KaitaiStream _io, KaitaiStruct _parent, Gguf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 71, 71, 85, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 71, 85, 70 }, this.magic, this._io, "/seq/0");
        }
        this.body = new GgufBody(this._io, this, _root);
    }

    public void _fetchInstances() {
        this.body._fetchInstances();
        versionLe();
        if (this.versionLe != null) {
        }
    }
    public static class GgufBody extends KaitaiStruct {
        public static GgufBody fromFile(String fileName) throws IOException {
            return new GgufBody(new ByteBufferKaitaiStream(fileName));
        }
        private Boolean _is_le;

        public GgufBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GgufBody(KaitaiStream _io, Gguf _parent) {
            this(_io, _parent, null);
        }

        public GgufBody(KaitaiStream _io, Gguf _parent, Gguf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            {
                boolean on = _root().isBigEndian();
                if (on == true) {
                    this._is_le = false;
                }
                else if (on == false) {
                    this._is_le = true;
                }
            }

            if (_is_le == null) {
                throw new KaitaiStream.UndecidedEndiannessError();
            } else if (_is_le) {
                _readLE();
            } else {
                _readBE();
            }
        }
        private void _readLE() {
            this.version = this._io.readU4le();
            if (!(this.version >= 2)) {
                throw new KaitaiStream.ValidationLessThanError(2, this.version, this._io, "/types/gguf_body/seq/0");
            }
            if (!(this.version <= 3)) {
                throw new KaitaiStream.ValidationGreaterThanError(3, this.version, this._io, "/types/gguf_body/seq/0");
            }
            this.numTensorInfos = this._io.readU8le();
            this.numKvPairs = this._io.readU8le();
            this.kvPairs = new ArrayList<GgufKv>();
            for (int i = 0; i < numKvPairs(); i++) {
                this.kvPairs.add(new GgufKv(this._io, this, _root, _is_le, (i != 0 ? kvPairs().get(((Number) (i - 1)).intValue()).alignment() : 32)));
            }
            this.tensorInfos = new ArrayList<GgufTensorInfo>();
            for (int i = 0; i < numTensorInfos(); i++) {
                this.tensorInfos.add(new GgufTensorInfo(this._io, this, _root, _is_le, (i != 0 ? tensorInfos().get(((Number) (i - 1)).intValue()).expectedNextOffset() : 0)));
            }
            if (numTensorInfos() != 0) {
                this.padding = this._io.readBytes(KaitaiStream.mod(alignment() - KaitaiStream.mod(_io().pos(), alignment()), alignment()));
            }
            if (ofsTensorData() < 0) {
                this._unnamed6 = this._io.readBytes(0);
            }
        }
        private void _readBE() {
            this.version = this._io.readU4be();
            if (!(this.version >= 2)) {
                throw new KaitaiStream.ValidationLessThanError(2, this.version, this._io, "/types/gguf_body/seq/0");
            }
            if (!(this.version <= 3)) {
                throw new KaitaiStream.ValidationGreaterThanError(3, this.version, this._io, "/types/gguf_body/seq/0");
            }
            this.numTensorInfos = this._io.readU8be();
            this.numKvPairs = this._io.readU8be();
            this.kvPairs = new ArrayList<GgufKv>();
            for (int i = 0; i < numKvPairs(); i++) {
                this.kvPairs.add(new GgufKv(this._io, this, _root, _is_le, (i != 0 ? kvPairs().get(((Number) (i - 1)).intValue()).alignment() : 32)));
            }
            this.tensorInfos = new ArrayList<GgufTensorInfo>();
            for (int i = 0; i < numTensorInfos(); i++) {
                this.tensorInfos.add(new GgufTensorInfo(this._io, this, _root, _is_le, (i != 0 ? tensorInfos().get(((Number) (i - 1)).intValue()).expectedNextOffset() : 0)));
            }
            if (numTensorInfos() != 0) {
                this.padding = this._io.readBytes(KaitaiStream.mod(alignment() - KaitaiStream.mod(_io().pos(), alignment()), alignment()));
            }
            if (ofsTensorData() < 0) {
                this._unnamed6 = this._io.readBytes(0);
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.kvPairs.size(); i++) {
                this.kvPairs.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.tensorInfos.size(); i++) {
                this.tensorInfos.get(((Number) (i)).intValue())._fetchInstances();
            }
            if (numTensorInfos() != 0) {
            }
            if (ofsTensorData() < 0) {
            }
        }

        /**
         * Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
         * they are explicitly allowed by `gguf.md` - see
         * <https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221>.
         */
        public static class GgufArray extends KaitaiStruct {
            private Boolean _is_le;

            public GgufArray(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.type = Gguf.GgufType.byId(this._io.readU4le());
                if (this.type == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_array/seq/0");
                }
                this.numElems = this._io.readU8le();
                this.elems = new ArrayList<GgufValue>();
                for (int i = 0; i < numElems(); i++) {
                    this.elems.add(new GgufValue(this._io, this, _root, _is_le, type()));
                }
            }
            private void _readBE() {
                this.type = Gguf.GgufType.byId(this._io.readU4be());
                if (this.type == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_array/seq/0");
                }
                this.numElems = this._io.readU8be();
                this.elems = new ArrayList<GgufValue>();
                for (int i = 0; i < numElems(); i++) {
                    this.elems.add(new GgufValue(this._io, this, _root, _is_le, type()));
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.elems.size(); i++) {
                    this.elems.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private GgufType type;
            private long numElems;
            private List<GgufValue> elems;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public GgufType type() { return type; }
            public long numElems() { return numElems; }
            public List<GgufValue> elems() { return elems; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufBool extends KaitaiStruct {
            private Boolean _is_le;

            public GgufBool(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.valueRaw = this._io.readU1();
                if (!(this.valueRaw <= 1)) {
                    throw new KaitaiStream.ValidationGreaterThanError(1, this.valueRaw, this._io, "/types/gguf_body/types/gguf_bool/seq/0");
                }
            }
            private void _readBE() {
                this.valueRaw = this._io.readU1();
                if (!(this.valueRaw <= 1)) {
                    throw new KaitaiStream.ValidationGreaterThanError(1, this.valueRaw, this._io, "/types/gguf_body/types/gguf_bool/seq/0");
                }
            }

            public void _fetchInstances() {
            }
            private Boolean value;

            /**
             * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L321">Git tag "v0.27.0"</a>
             */
            public Boolean value() {
                if (this.value != null)
                    return this.value;
                this.value = valueRaw() != 0;
                return this.value;
            }
            private int valueRaw;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public int valueRaw() { return valueRaw; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufFloat32 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufFloat32(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readF4le();
            }
            private void _readBE() {
                this.value = this._io.readF4be();
            }

            public void _fetchInstances() {
            }
            private float value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public float value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufFloat64 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufFloat64(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readF8le();
            }
            private void _readBE() {
                this.value = this._io.readF8be();
            }

            public void _fetchInstances() {
            }
            private double value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public double value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufInt16 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufInt16(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readS2le();
            }
            private void _readBE() {
                this.value = this._io.readS2be();
            }

            public void _fetchInstances() {
            }
            private short value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public short value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufInt32 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufInt32(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readS4le();
            }
            private void _readBE() {
                this.value = this._io.readS4be();
            }

            public void _fetchInstances() {
            }
            private int value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public int value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufInt64 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufInt64(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readS8le();
            }
            private void _readBE() {
                this.value = this._io.readS8be();
            }

            public void _fetchInstances() {
            }
            private long value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public long value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufInt8 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufInt8(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readS1();
            }
            private void _readBE() {
                this.value = this._io.readS1();
            }

            public void _fetchInstances() {
            }
            private byte value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public byte value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L262-L275">Git tag "v0.27.0"</a>
         */
        public static class GgufKv extends KaitaiStruct {
            private Boolean _is_le;

            public GgufKv(KaitaiStream _io, Gguf.GgufBody _parent, Gguf _root, boolean _is_le, long prevAlignment) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.prevAlignment = prevAlignment;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.key = new GgufStr(this._io, this, _root, _is_le);
                {
                    GgufStr _it = this.key;
                    if (!(_it.lenValue() != 0)) {
                        throw new KaitaiStream.ValidationExprError(this.key, this._io, "/types/gguf_body/types/gguf_kv/seq/0");
                    }
                }
                this.type = Gguf.GgufType.byId(this._io.readU4le());
                if (this.type == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_kv/seq/1");
                }
                this.value = new GgufValue(this._io, this, _root, _is_le, type());
                {
                    GgufValue _it = this.value;
                    if (!((key().value().equals("general.alignment") ?  ((type() == Gguf.GgufType.UINT32) && (((Gguf.GgufBody.GgufUint32) (_it.value())).value() != 0) && ((((Gguf.GgufBody.GgufUint32) (_it.value())).value() & ((Gguf.GgufBody.GgufUint32) (_it.value())).value() - 1) == 0))  : true))) {
                        throw new KaitaiStream.ValidationExprError(this.value, this._io, "/types/gguf_body/types/gguf_kv/seq/2");
                    }
                }
            }
            private void _readBE() {
                this.key = new GgufStr(this._io, this, _root, _is_le);
                {
                    GgufStr _it = this.key;
                    if (!(_it.lenValue() != 0)) {
                        throw new KaitaiStream.ValidationExprError(this.key, this._io, "/types/gguf_body/types/gguf_kv/seq/0");
                    }
                }
                this.type = Gguf.GgufType.byId(this._io.readU4be());
                if (this.type == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_kv/seq/1");
                }
                this.value = new GgufValue(this._io, this, _root, _is_le, type());
                {
                    GgufValue _it = this.value;
                    if (!((key().value().equals("general.alignment") ?  ((type() == Gguf.GgufType.UINT32) && (((Gguf.GgufBody.GgufUint32) (_it.value())).value() != 0) && ((((Gguf.GgufBody.GgufUint32) (_it.value())).value() & ((Gguf.GgufBody.GgufUint32) (_it.value())).value() - 1) == 0))  : true))) {
                        throw new KaitaiStream.ValidationExprError(this.value, this._io, "/types/gguf_body/types/gguf_kv/seq/2");
                    }
                }
            }

            public void _fetchInstances() {
                this.key._fetchInstances();
                this.value._fetchInstances();
            }
            private Long alignment;
            public Long alignment() {
                if (this.alignment != null)
                    return this.alignment;
                this.alignment = ((Number) ((key().value().equals("general.alignment") ? ((Gguf.GgufBody.GgufUint32) (value().value())).value() : prevAlignment()))).longValue();
                return this.alignment;
            }
            private GgufStr key;
            private GgufType type;
            private GgufValue value;
            private long prevAlignment;
            private Gguf _root;
            private Gguf.GgufBody _parent;
            public GgufStr key() { return key; }
            public GgufType type() { return type; }
            public GgufValue value() { return value; }
            public long prevAlignment() { return prevAlignment; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody _parent() { return _parent; }
        }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L232-L237">Git tag "v0.27.0"</a>
         */
        public static class GgufStr extends KaitaiStruct {
            private Boolean _is_le;

            public GgufStr(KaitaiStream _io, KaitaiStruct _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.lenValue = this._io.readU8le();
                this.value = new String(this._io.readBytes(lenValue()), StandardCharsets.UTF_8);
            }
            private void _readBE() {
                this.lenValue = this._io.readU8be();
                this.value = new String(this._io.readBytes(lenValue()), StandardCharsets.UTF_8);
            }

            public void _fetchInstances() {
            }
            private long lenValue;
            private String value;
            private Gguf _root;
            private KaitaiStruct _parent;
            public long lenValue() { return lenValue; }
            public String value() { return value; }
            public Gguf _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L305-L325">Git tag "v0.27.0"</a>
         */
        public static class GgufTensorInfo extends KaitaiStruct {
            private Boolean _is_le;

            public GgufTensorInfo(KaitaiStream _io, Gguf.GgufBody _parent, Gguf _root, boolean _is_le, long expectedOffset) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.expectedOffset = expectedOffset;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.name = new GgufStr(this._io, this, _root, _is_le);
                {
                    GgufStr _it = this.name;
                    if (!(_it.lenValue() < 64)) {
                        throw new KaitaiStream.ValidationExprError(this.name, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/0");
                    }
                }
                this.numDims = this._io.readU4le();
                if (!(this.numDims <= 4)) {
                    throw new KaitaiStream.ValidationGreaterThanError(4, this.numDims, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/1");
                }
                this.dims = new ArrayList<Long>();
                for (int i = 0; i < numDims(); i++) {
                    this.dims.add(this._io.readS8le());
                    if (!(this.dims.get(((Number) (i)).intValue()) >= 0)) {
                        throw new KaitaiStream.ValidationLessThanError(0, this.dims.get(((Number) (i)).intValue()), this._io, "/types/gguf_body/types/gguf_tensor_info/seq/2");
                    }
                }
                this.type = Gguf.GgmlType.byId(this._io.readU4le());
                {
                    GgmlType _it = this.type;
                    if (!( ((_it.id() < 43) && (numElementsPerBlock() != 0) && (KaitaiStream.mod((numDims() > 0 ? dims().get(((int) 0)) : 1), numElementsPerBlock()) == 0)) )) {
                        throw new KaitaiStream.ValidationExprError(this.type, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/3");
                    }
                }
                this.offset = this._io.readU8le();
                if (!(this.offset == expectedOffset())) {
                    throw new KaitaiStream.ValidationNotEqualError(expectedOffset(), this.offset, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/4");
                }
            }
            private void _readBE() {
                this.name = new GgufStr(this._io, this, _root, _is_le);
                {
                    GgufStr _it = this.name;
                    if (!(_it.lenValue() < 64)) {
                        throw new KaitaiStream.ValidationExprError(this.name, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/0");
                    }
                }
                this.numDims = this._io.readU4be();
                if (!(this.numDims <= 4)) {
                    throw new KaitaiStream.ValidationGreaterThanError(4, this.numDims, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/1");
                }
                this.dims = new ArrayList<Long>();
                for (int i = 0; i < numDims(); i++) {
                    this.dims.add(this._io.readS8be());
                    if (!(this.dims.get(((Number) (i)).intValue()) >= 0)) {
                        throw new KaitaiStream.ValidationLessThanError(0, this.dims.get(((Number) (i)).intValue()), this._io, "/types/gguf_body/types/gguf_tensor_info/seq/2");
                    }
                }
                this.type = Gguf.GgmlType.byId(this._io.readU4be());
                {
                    GgmlType _it = this.type;
                    if (!( ((_it.id() < 43) && (numElementsPerBlock() != 0) && (KaitaiStream.mod((numDims() > 0 ? dims().get(((int) 0)) : 1), numElementsPerBlock()) == 0)) )) {
                        throw new KaitaiStream.ValidationExprError(this.type, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/3");
                    }
                }
                this.offset = this._io.readU8be();
                if (!(this.offset == expectedOffset())) {
                    throw new KaitaiStream.ValidationNotEqualError(expectedOffset(), this.offset, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/4");
                }
            }

            public void _fetchInstances() {
                this.name._fetchInstances();
                for (int i = 0; i < this.dims.size(); i++) {
                }
                data();
                if (this.data != null) {
                }
                padding();
                if (this.padding != null) {
                }
            }
            private byte[] data;
            public byte[] data() {
                if (this.data != null)
                    return this.data;
                long _pos = this._io.pos();
                this._io.seek(_parent().ofsTensorData() + offset());
                if (_is_le) {
                    this.data = this._io.readBytes(lenData());
                } else {
                    this.data = this._io.readBytes(lenData());
                }
                this._io.seek(_pos);
                return this.data;
            }
            private String dumpDims;

            /**
             * `dims` joined with the string `" x "`. This is necessary for
             * `-webide-representation`, which cannot format `dims` directly -
             * see <https://github.com/kaitai-io/kaitai_struct_webide/issues/160>.
             */
            public String dumpDims() {
                if (this.dumpDims != null)
                    return this.dumpDims;
                this.dumpDims = (((numDims() > 0 ? Long.toString(dims().get(((int) 0))) : "") + (numDims() > 1 ? " x " + Long.toString(dims().get(((int) 1))) : "")) + (numDims() > 2 ? " x " + Long.toString(dims().get(((int) 2))) : "")) + (numDims() > 3 ? " x " + Long.toString(dims().get(((int) 3))) : "");
                return this.dumpDims;
            }
            private Long expectedNextOffset;

            /**
             * `offset` that the next tensor must have
             */
            public Long expectedNextOffset() {
                if (this.expectedNextOffset != null)
                    return this.expectedNextOffset;
                this.expectedNextOffset = ((Number) (((Number) ((offset() + lenData()) + lenPadding())).longValue())).longValue();
                return this.expectedNextOffset;
            }
            private Integer lenBlock;

            /**
             * Size of a block in bytes
             */
            public Integer lenBlock() {
                if (this.lenBlock != null)
                    return this.lenBlock;
                this.lenBlock = ((Number) (new ArrayList<Integer>(Arrays.asList(4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18)).get(((Number) (type().id())).intValue()))).intValue();
                return this.lenBlock;
            }
            private Long lenData;
            public Long lenData() {
                if (this.lenData != null)
                    return this.lenData;
                this.lenData = ((Number) (((Number) (lenBlock() * numBlocks())).longValue())).longValue();
                return this.lenData;
            }
            private Integer lenPadding;

            /**
             * Number of padding bytes after the data
             */
            public Integer lenPadding() {
                if (this.lenPadding != null)
                    return this.lenPadding;
                this.lenPadding = ((Number) (KaitaiStream.mod(_parent().alignment() - KaitaiStream.mod(lenData(), _parent().alignment()), _parent().alignment()))).intValue();
                return this.lenPadding;
            }
            private Long numBlocks;
            public Long numBlocks() {
                if (this.numBlocks != null)
                    return this.numBlocks;
                this.numBlocks = ((Number) (((Number) (numElements() / numElementsPerBlock())).longValue())).longValue();
                return this.numBlocks;
            }
            private Long numElements;
            public Long numElements() {
                if (this.numElements != null)
                    return this.numElements;
                this.numElements = ((Number) (((Number) ((((numDims() > 0 ? dims().get(((int) 0)) : 1) * (numDims() > 1 ? dims().get(((int) 1)) : 1)) * (numDims() > 2 ? dims().get(((int) 2)) : 1)) * (numDims() > 3 ? dims().get(((int) 3)) : 1))).longValue())).longValue();
                return this.numElements;
            }
            private Integer numElementsPerBlock;

            /**
             * Number of elements in a block
             */
            public Integer numElementsPerBlock() {
                if (this.numElementsPerBlock != null)
                    return this.numElementsPerBlock;
                this.numElementsPerBlock = ((Number) (new ArrayList<Integer>(Arrays.asList(1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64)).get(((Number) (type().id())).intValue()))).intValue();
                return this.numElementsPerBlock;
            }
            private byte[] padding;

            /**
             * Padding after the data. ggml requires it even after the last tensor
             * when reading the tensor data.
             * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L884-L893">Git tag "v0.27.0"</a>
             */
            public byte[] padding() {
                if (this.padding != null)
                    return this.padding;
                long _pos = this._io.pos();
                this._io.seek((_parent().ofsTensorData() + offset()) + lenData());
                if (_is_le) {
                    this.padding = this._io.readBytes(lenPadding());
                } else {
                    this.padding = this._io.readBytes(lenPadding());
                }
                this._io.seek(_pos);
                return this.padding;
            }
            private GgufStr name;
            private long numDims;
            private List<Long> dims;
            private GgmlType type;
            private long offset;
            private long expectedOffset;
            private Gguf _root;
            private Gguf.GgufBody _parent;
            public GgufStr name() { return name; }
            public long numDims() { return numDims; }
            public List<Long> dims() { return dims; }
            public GgmlType type() { return type; }

            /**
             * Offset of the tensor's data, relative to `_parent.ofs_tensor_data`
             */
            public long offset() { return offset; }
            public long expectedOffset() { return expectedOffset; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody _parent() { return _parent; }
        }
        public static class GgufUint16 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufUint16(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readU2le();
            }
            private void _readBE() {
                this.value = this._io.readU2be();
            }

            public void _fetchInstances() {
            }
            private int value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public int value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufUint32 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufUint32(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readU4le();
            }
            private void _readBE() {
                this.value = this._io.readU4be();
            }

            public void _fetchInstances() {
            }
            private long value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public long value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufUint64 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufUint64(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readU8le();
            }
            private void _readBE() {
                this.value = this._io.readU8be();
            }

            public void _fetchInstances() {
            }
            private long value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public long value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }
        public static class GgufUint8 extends KaitaiStruct {
            private Boolean _is_le;

            public GgufUint8(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.value = this._io.readU1();
            }
            private void _readBE() {
                this.value = this._io.readU1();
            }

            public void _fetchInstances() {
            }
            private int value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public int value() { return value; }
            public Gguf _root() { return _root; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
        }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L239-L260">Git tag "v0.27.0"</a>
         */
        public static class GgufValue extends KaitaiStruct {
            private Boolean _is_le;

            public GgufValue(KaitaiStream _io, KaitaiStruct _parent, Gguf _root, boolean _is_le, GgufType type) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.type = type;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                {
                    GgufType on = type();
                    if (on != null) {
                        switch (type()) {
                        case ARRAY: {
                            this.value = new GgufArray(this._io, this, _root, _is_le);
                            break;
                        }
                        case BOOL: {
                            this.value = new GgufBool(this._io, this, _root, _is_le);
                            break;
                        }
                        case FLOAT32: {
                            this.value = new GgufFloat32(this._io, this, _root, _is_le);
                            break;
                        }
                        case FLOAT64: {
                            this.value = new GgufFloat64(this._io, this, _root, _is_le);
                            break;
                        }
                        case INT16: {
                            this.value = new GgufInt16(this._io, this, _root, _is_le);
                            break;
                        }
                        case INT32: {
                            this.value = new GgufInt32(this._io, this, _root, _is_le);
                            break;
                        }
                        case INT64: {
                            this.value = new GgufInt64(this._io, this, _root, _is_le);
                            break;
                        }
                        case INT8: {
                            this.value = new GgufInt8(this._io, this, _root, _is_le);
                            break;
                        }
                        case STRING: {
                            this.value = new GgufStr(this._io, this, _root, _is_le);
                            break;
                        }
                        case UINT16: {
                            this.value = new GgufUint16(this._io, this, _root, _is_le);
                            break;
                        }
                        case UINT32: {
                            this.value = new GgufUint32(this._io, this, _root, _is_le);
                            break;
                        }
                        case UINT64: {
                            this.value = new GgufUint64(this._io, this, _root, _is_le);
                            break;
                        }
                        case UINT8: {
                            this.value = new GgufUint8(this._io, this, _root, _is_le);
                            break;
                        }
                        }
                    }
                }
            }
            private void _readBE() {
                {
                    GgufType on = type();
                    if (on != null) {
                        switch (type()) {
                        case ARRAY: {
                            this.value = new GgufArray(this._io, this, _root, _is_le);
                            break;
                        }
                        case BOOL: {
                            this.value = new GgufBool(this._io, this, _root, _is_le);
                            break;
                        }
                        case FLOAT32: {
                            this.value = new GgufFloat32(this._io, this, _root, _is_le);
                            break;
                        }
                        case FLOAT64: {
                            this.value = new GgufFloat64(this._io, this, _root, _is_le);
                            break;
                        }
                        case INT16: {
                            this.value = new GgufInt16(this._io, this, _root, _is_le);
                            break;
                        }
                        case INT32: {
                            this.value = new GgufInt32(this._io, this, _root, _is_le);
                            break;
                        }
                        case INT64: {
                            this.value = new GgufInt64(this._io, this, _root, _is_le);
                            break;
                        }
                        case INT8: {
                            this.value = new GgufInt8(this._io, this, _root, _is_le);
                            break;
                        }
                        case STRING: {
                            this.value = new GgufStr(this._io, this, _root, _is_le);
                            break;
                        }
                        case UINT16: {
                            this.value = new GgufUint16(this._io, this, _root, _is_le);
                            break;
                        }
                        case UINT32: {
                            this.value = new GgufUint32(this._io, this, _root, _is_le);
                            break;
                        }
                        case UINT64: {
                            this.value = new GgufUint64(this._io, this, _root, _is_le);
                            break;
                        }
                        case UINT8: {
                            this.value = new GgufUint8(this._io, this, _root, _is_le);
                            break;
                        }
                        }
                    }
                }
            }

            public void _fetchInstances() {
                {
                    GgufType on = type();
                    if (on != null) {
                        switch (type()) {
                        case ARRAY: {
                            ((GgufArray) (this.value))._fetchInstances();
                            break;
                        }
                        case BOOL: {
                            ((GgufBool) (this.value))._fetchInstances();
                            break;
                        }
                        case FLOAT32: {
                            ((GgufFloat32) (this.value))._fetchInstances();
                            break;
                        }
                        case FLOAT64: {
                            ((GgufFloat64) (this.value))._fetchInstances();
                            break;
                        }
                        case INT16: {
                            ((GgufInt16) (this.value))._fetchInstances();
                            break;
                        }
                        case INT32: {
                            ((GgufInt32) (this.value))._fetchInstances();
                            break;
                        }
                        case INT64: {
                            ((GgufInt64) (this.value))._fetchInstances();
                            break;
                        }
                        case INT8: {
                            ((GgufInt8) (this.value))._fetchInstances();
                            break;
                        }
                        case STRING: {
                            ((GgufStr) (this.value))._fetchInstances();
                            break;
                        }
                        case UINT16: {
                            ((GgufUint16) (this.value))._fetchInstances();
                            break;
                        }
                        case UINT32: {
                            ((GgufUint32) (this.value))._fetchInstances();
                            break;
                        }
                        case UINT64: {
                            ((GgufUint64) (this.value))._fetchInstances();
                            break;
                        }
                        case UINT8: {
                            ((GgufUint8) (this.value))._fetchInstances();
                            break;
                        }
                        }
                    }
                }
            }
            private KaitaiStruct value;
            private GgufType type;
            private Gguf _root;
            private KaitaiStruct _parent;
            public KaitaiStruct value() { return value; }
            public GgufType type() { return type; }
            public Gguf _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        private Long alignment;

        /**
         * Global alignment - from the `general.alignment` key, or 32 if there's no
         * such key.
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L622-L630">Git tag "v0.27.0"</a>
         */
        public Long alignment() {
            if (this.alignment != null)
                return this.alignment;
            this.alignment = ((Number) ((kvPairs().size() != 0 ? kvPairs().get(kvPairs().size() - 1).alignment() : 32))).longValue();
            return this.alignment;
        }
        private Long ofsTensorData;

        /**
         * Offset of the tensor data. Each tensor's `offset` is relative to this
         * position.
         */
        public Long ofsTensorData() {
            if (this.ofsTensorData != null)
                return this.ofsTensorData;
            this.ofsTensorData = ((Number) (((Number) (_io().pos())).longValue())).longValue();
            return this.ofsTensorData;
        }
        private long version;
        private long numTensorInfos;
        private long numKvPairs;
        private List<GgufKv> kvPairs;
        private List<GgufTensorInfo> tensorInfos;
        private byte[] padding;
        private byte[] _unnamed6;
        private Gguf _root;
        private Gguf _parent;

        /**
         * File format version. Version 1 used 32-bit counts and lengths, which
         * this Kaitai Struct implementation doesn't support, and neither does
         * ggml.
         */
        public long version() { return version; }

        /**
         * The number of tensors in the file
         */
        public long numTensorInfos() { return numTensorInfos; }

        /**
         * The number of key-value pairs in the file header
         */
        public long numKvPairs() { return numKvPairs; }

        /**
         * Key-value pairs. ggml (v0.27.0)
         * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L575-L578)
         * duplicate keys, but this Kaitai Struct implementation can't detect
         * them. If there are multiple `general.alignment` keys, the last one is
         * used for the `alignment` value instance.
         */
        public List<GgufKv> kvPairs() { return kvPairs; }

        /**
         * Tensor metadata. ggml (v0.27.0)
         * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L664-L669)
         * duplicate tensor names, but this Kaitai Struct implementation can't
         * detect them.
         */
        public List<GgufTensorInfo> tensorInfos() { return tensorInfos; }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L780-L785">Git tag "v0.27.0"</a>
         */
        public byte[] padding() { return padding; }
        public byte[] _unnamed6() { return _unnamed6; }
        public Gguf _root() { return _root; }
        public Gguf _parent() { return _parent; }
    }
    private Boolean isBigEndian;
    public Boolean isBigEndian() {
        if (this.isBigEndian != null)
            return this.isBigEndian;
        this.isBigEndian = (versionLe() & 65535) == 0;
        return this.isBigEndian;
    }
    private Long lenFile;

    /**
     * Length of the file (computed from the header), including the padding after
     * the last tensor's data.
     * 
     * This Kaitai Struct implementation stops parsing where the tensor data
     * starts (which is read lazily, i.e. only on demand). Without reading the
     * tensor data, you can use this expected file size to check whether the file
     * has been truncated, to carve the file out of a larger one, etc.
     */
    public Long lenFile() {
        if (this.lenFile != null)
            return this.lenFile;
        this.lenFile = ((Number) (((Number) (body().ofsTensorData() + (body().numTensorInfos() != 0 ? body().tensorInfos().get(body().tensorInfos().size() - 1).expectedNextOffset() : 0))).longValue())).longValue();
        return this.lenFile;
    }
    private Long versionLe;
    public Long versionLe() {
        if (this.versionLe != null)
            return this.versionLe;
        long _pos = this._io.pos();
        this._io.seek(4);
        this.versionLe = this._io.readU4le();
        this._io.seek(_pos);
        return this.versionLe;
    }
    private byte[] magic;
    private GgufBody body;
    private Gguf _root;
    private KaitaiStruct _parent;

    /**
     * GGUF file magic
     */
    public byte[] magic() { return magic; }
    public GgufBody body() { return body; }
    public Gguf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
