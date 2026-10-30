// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


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
public class Gguf extends KaitaiStruct.ReadWrite {
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
    public Gguf() {
        this(null, null, null);
    }

    public Gguf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gguf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Gguf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Gguf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 71, 71, 85, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 71, 85, 70 }, this.magic, this._io, "/seq/0");
        }
        this.body = new GgufBody(this._io, this, _root);
        this.body._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.body._fetchInstances();
        versionLe();
        if (this.versionLe != null) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteVersionLe = _enabledVersionLe;
        this._io.writeBytes(this.magic);
        this.body._write_Seq(this._io);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 71, 71, 85, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 71, 85, 70 }, this.magic, null, "/seq/0");
        }
        if (!Objects.equals(this.body._root(), _root()))
            throw new ConsistencyError("body", _root(), this.body._root());
        if (!Objects.equals(this.body._parent(), this))
            throw new ConsistencyError("body", this, this.body._parent());
        if (_enabledVersionLe) {
        }
        _dirty = false;
    }
    public static class GgufBody extends KaitaiStruct.ReadWrite {
        public static GgufBody fromFile(String fileName) throws IOException {
            return new GgufBody(new ByteBufferKaitaiStream(fileName));
        }
        private Boolean _is_le;
        public GgufBody() {
            this(null, null, null);
        }

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
        }
        public void _read() {
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
            _dirty = false;
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
                GgufKv _t_kvPairs = new GgufKv(this._io, this, _root, _is_le, (i != 0 ? kvPairs().get(((Number) (i - 1)).intValue()).alignment() : 32));
                try {
                    _t_kvPairs._read();
                } finally {
                    this.kvPairs.add(_t_kvPairs);
                }
            }
            this.tensorInfos = new ArrayList<GgufTensorInfo>();
            for (int i = 0; i < numTensorInfos(); i++) {
                GgufTensorInfo _t_tensorInfos = new GgufTensorInfo(this._io, this, _root, _is_le, (i != 0 ? tensorInfos().get(((Number) (i - 1)).intValue()).expectedNextOffset() : 0));
                try {
                    _t_tensorInfos._read();
                } finally {
                    this.tensorInfos.add(_t_tensorInfos);
                }
            }
            if (numTensorInfos() != 0) {
                this.padding = this._io.readBytes(KaitaiStream.mod(alignment() - KaitaiStream.mod(_io().pos(), alignment()), alignment()));
            }
            if (ofsTensorData() < 0) {
                this._unnamed6 = this._io.readBytes(0);
            }
            _dirty = false;
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
                GgufKv _t_kvPairs = new GgufKv(this._io, this, _root, _is_le, (i != 0 ? kvPairs().get(((Number) (i - 1)).intValue()).alignment() : 32));
                try {
                    _t_kvPairs._read();
                } finally {
                    this.kvPairs.add(_t_kvPairs);
                }
            }
            this.tensorInfos = new ArrayList<GgufTensorInfo>();
            for (int i = 0; i < numTensorInfos(); i++) {
                GgufTensorInfo _t_tensorInfos = new GgufTensorInfo(this._io, this, _root, _is_le, (i != 0 ? tensorInfos().get(((Number) (i - 1)).intValue()).expectedNextOffset() : 0));
                try {
                    _t_tensorInfos._read();
                } finally {
                    this.tensorInfos.add(_t_tensorInfos);
                }
            }
            if (numTensorInfos() != 0) {
                this.padding = this._io.readBytes(KaitaiStream.mod(alignment() - KaitaiStream.mod(_io().pos(), alignment()), alignment()));
            }
            if (ofsTensorData() < 0) {
                this._unnamed6 = this._io.readBytes(0);
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();

            if (_is_le == null) {
                throw new KaitaiStream.UndecidedEndiannessError();
            } else if (_is_le) {
                _write_SeqLE();
            } else {
                _write_SeqBE();
            }
        }

        private void _write_SeqLE() {
            this._io.writeU4le(this.version);
            this._io.writeU8le(this.numTensorInfos);
            this._io.writeU8le(this.numKvPairs);
            for (int i = 0; i < this.kvPairs.size(); i++) {
                this.kvPairs.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            for (int i = 0; i < this.tensorInfos.size(); i++) {
                this.tensorInfos.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (numTensorInfos() != 0) {
                if (this.padding.length != KaitaiStream.mod(alignment() - KaitaiStream.mod(_io().pos(), alignment()), alignment()))
                    throw new ConsistencyError("padding", KaitaiStream.mod(alignment() - KaitaiStream.mod(_io().pos(), alignment()), alignment()), this.padding.length);
                this._io.writeBytes(this.padding);
            }
            if (ofsTensorData() < 0) {
                if (this._unnamed6.length != 0)
                    throw new ConsistencyError("_unnamed6", 0, this._unnamed6.length);
                this._io.writeBytes(this._unnamed6);
            }
        }

        private void _write_SeqBE() {
            this._io.writeU4be(this.version);
            this._io.writeU8be(this.numTensorInfos);
            this._io.writeU8be(this.numKvPairs);
            for (int i = 0; i < this.kvPairs.size(); i++) {
                this.kvPairs.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            for (int i = 0; i < this.tensorInfos.size(); i++) {
                this.tensorInfos.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (numTensorInfos() != 0) {
                if (this.padding.length != KaitaiStream.mod(alignment() - KaitaiStream.mod(_io().pos(), alignment()), alignment()))
                    throw new ConsistencyError("padding", KaitaiStream.mod(alignment() - KaitaiStream.mod(_io().pos(), alignment()), alignment()), this.padding.length);
                this._io.writeBytes(this.padding);
            }
            if (ofsTensorData() < 0) {
                if (this._unnamed6.length != 0)
                    throw new ConsistencyError("_unnamed6", 0, this._unnamed6.length);
                this._io.writeBytes(this._unnamed6);
            }
        }

        public void _check() {
            if (!(this.version >= 2)) {
                throw new KaitaiStream.ValidationLessThanError(2, this.version, null, "/types/gguf_body/seq/0");
            }
            if (!(this.version <= 3)) {
                throw new KaitaiStream.ValidationGreaterThanError(3, this.version, null, "/types/gguf_body/seq/0");
            }
            if (this.kvPairs.size() != numKvPairs())
                throw new ConsistencyError("kv_pairs", numKvPairs(), this.kvPairs.size());
            for (int i = 0; i < this.kvPairs.size(); i++) {
                if (!Objects.equals(this.kvPairs.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("kv_pairs", _root(), this.kvPairs.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.kvPairs.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("kv_pairs", this, this.kvPairs.get(((Number) (i)).intValue())._parent());
                if (this.kvPairs.get(((Number) (i)).intValue()).prevAlignment() != (i != 0 ? kvPairs().get(((Number) (i - 1)).intValue()).alignment() : 32))
                    throw new ConsistencyError("kv_pairs", (i != 0 ? kvPairs().get(((Number) (i - 1)).intValue()).alignment() : 32), this.kvPairs.get(((Number) (i)).intValue()).prevAlignment());
            }
            if (this.tensorInfos.size() != numTensorInfos())
                throw new ConsistencyError("tensor_infos", numTensorInfos(), this.tensorInfos.size());
            for (int i = 0; i < this.tensorInfos.size(); i++) {
                if (!Objects.equals(this.tensorInfos.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("tensor_infos", _root(), this.tensorInfos.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.tensorInfos.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("tensor_infos", this, this.tensorInfos.get(((Number) (i)).intValue())._parent());
                if (this.tensorInfos.get(((Number) (i)).intValue()).expectedOffset() != (i != 0 ? tensorInfos().get(((Number) (i - 1)).intValue()).expectedNextOffset() : 0))
                    throw new ConsistencyError("tensor_infos", (i != 0 ? tensorInfos().get(((Number) (i - 1)).intValue()).expectedNextOffset() : 0), this.tensorInfos.get(((Number) (i)).intValue()).expectedOffset());
            }
            if (numTensorInfos() != 0) {
            }
            _dirty = false;
        }

        /**
         * Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
         * they are explicitly allowed by `gguf.md` - see
         * <https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221>.
         */
        public static class GgufArray extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufArray(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.type = Gguf.GgufType.byId(this._io.readU4le());
                if (this.type == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_array/seq/0");
                }
                this.numElems = this._io.readU8le();
                this.elems = new ArrayList<GgufValue>();
                for (int i = 0; i < numElems(); i++) {
                    GgufValue _t_elems = new GgufValue(this._io, this, _root, _is_le, type());
                    try {
                        _t_elems._read();
                    } finally {
                        this.elems.add(_t_elems);
                    }
                }
                _dirty = false;
            }
            private void _readBE() {
                this.type = Gguf.GgufType.byId(this._io.readU4be());
                if (this.type == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_array/seq/0");
                }
                this.numElems = this._io.readU8be();
                this.elems = new ArrayList<GgufValue>();
                for (int i = 0; i < numElems(); i++) {
                    GgufValue _t_elems = new GgufValue(this._io, this, _root, _is_le, type());
                    try {
                        _t_elems._read();
                    } finally {
                        this.elems.add(_t_elems);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.elems.size(); i++) {
                    this.elems.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU4le(((Number) (this.type.id())).longValue());
                this._io.writeU8le(this.numElems);
                for (int i = 0; i < this.elems.size(); i++) {
                    this.elems.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            private void _write_SeqBE() {
                this._io.writeU4be(((Number) (this.type.id())).longValue());
                this._io.writeU8be(this.numElems);
                for (int i = 0; i < this.elems.size(); i++) {
                    this.elems.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.type == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.type, null, "/types/gguf_body/types/gguf_array/seq/0");
                }
                if (this.elems.size() != numElems())
                    throw new ConsistencyError("elems", numElems(), this.elems.size());
                for (int i = 0; i < this.elems.size(); i++) {
                    if (!Objects.equals(this.elems.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("elems", _root(), this.elems.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.elems.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("elems", this, this.elems.get(((Number) (i)).intValue())._parent());
                    if (this.elems.get(((Number) (i)).intValue()).type() != type())
                        throw new ConsistencyError("elems", type(), this.elems.get(((Number) (i)).intValue()).type());
                }
                _dirty = false;
            }
            private GgufType type;
            private long numElems;
            private List<GgufValue> elems;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public GgufType type() { return type; }
            public void setType(GgufType _v) { _dirty = true; type = _v; }
            public long numElems() { return numElems; }
            public void setNumElems(long _v) { _dirty = true; numElems = _v; }
            public List<GgufValue> elems() { return elems; }
            public void setElems(List<GgufValue> _v) { _dirty = true; elems = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufBool extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufBool(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.valueRaw = this._io.readU1();
                if (!(this.valueRaw <= 1)) {
                    throw new KaitaiStream.ValidationGreaterThanError(1, this.valueRaw, this._io, "/types/gguf_body/types/gguf_bool/seq/0");
                }
                _dirty = false;
            }
            private void _readBE() {
                this.valueRaw = this._io.readU1();
                if (!(this.valueRaw <= 1)) {
                    throw new KaitaiStream.ValidationGreaterThanError(1, this.valueRaw, this._io, "/types/gguf_body/types/gguf_bool/seq/0");
                }
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU1(this.valueRaw);
            }

            private void _write_SeqBE() {
                this._io.writeU1(this.valueRaw);
            }

            public void _check() {
                if (!(this.valueRaw <= 1)) {
                    throw new KaitaiStream.ValidationGreaterThanError(1, this.valueRaw, null, "/types/gguf_body/types/gguf_bool/seq/0");
                }
                _dirty = false;
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
            public void _invalidateValue() { this.value = null; }
            private int valueRaw;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public int valueRaw() { return valueRaw; }
            public void setValueRaw(int _v) { _dirty = true; valueRaw = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufFloat32 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufFloat32(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readF4le();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readF4be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeF4le(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeF4be(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private float value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public float value() { return value; }
            public void setValue(float _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufFloat64 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufFloat64(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readF8le();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readF8be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeF8le(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeF8be(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private double value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public double value() { return value; }
            public void setValue(double _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufInt16 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufInt16(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readS2le();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readS2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeS2le(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeS2be(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private short value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public short value() { return value; }
            public void setValue(short _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufInt32 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufInt32(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readS4le();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readS4be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeS4le(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeS4be(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private int value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public int value() { return value; }
            public void setValue(int _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufInt64 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufInt64(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readS8le();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readS8be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeS8le(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeS8be(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private long value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public long value() { return value; }
            public void setValue(long _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufInt8 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufInt8(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readS1();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readS1();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeS1(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeS1(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private byte value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public byte value() { return value; }
            public void setValue(byte _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L262-L275">Git tag "v0.27.0"</a>
         */
        public static class GgufKv extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufKv(KaitaiStream _io, Gguf.GgufBody _parent, Gguf _root, boolean _is_le, long prevAlignment) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.prevAlignment = prevAlignment;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.key = new GgufStr(this._io, this, _root, _is_le);
                this.key._read();
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
                this.value._read();
                {
                    GgufValue _it = this.value;
                    if (!((key().value().equals("general.alignment") ?  ((type() == Gguf.GgufType.UINT32) && (((Gguf.GgufBody.GgufUint32) (_it.value())).value() != 0) && ((((Gguf.GgufBody.GgufUint32) (_it.value())).value() & ((Gguf.GgufBody.GgufUint32) (_it.value())).value() - 1) == 0))  : true))) {
                        throw new KaitaiStream.ValidationExprError(this.value, this._io, "/types/gguf_body/types/gguf_kv/seq/2");
                    }
                }
                _dirty = false;
            }
            private void _readBE() {
                this.key = new GgufStr(this._io, this, _root, _is_le);
                this.key._read();
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
                this.value._read();
                {
                    GgufValue _it = this.value;
                    if (!((key().value().equals("general.alignment") ?  ((type() == Gguf.GgufType.UINT32) && (((Gguf.GgufBody.GgufUint32) (_it.value())).value() != 0) && ((((Gguf.GgufBody.GgufUint32) (_it.value())).value() & ((Gguf.GgufBody.GgufUint32) (_it.value())).value() - 1) == 0))  : true))) {
                        throw new KaitaiStream.ValidationExprError(this.value, this._io, "/types/gguf_body/types/gguf_kv/seq/2");
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                this.key._fetchInstances();
                this.value._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this.key._write_Seq(this._io);
                this._io.writeU4le(((Number) (this.type.id())).longValue());
                this.value._write_Seq(this._io);
            }

            private void _write_SeqBE() {
                this.key._write_Seq(this._io);
                this._io.writeU4be(((Number) (this.type.id())).longValue());
                this.value._write_Seq(this._io);
            }

            public void _check() {
                if (!Objects.equals(this.key._root(), _root()))
                    throw new ConsistencyError("key", _root(), this.key._root());
                if (!Objects.equals(this.key._parent(), this))
                    throw new ConsistencyError("key", this, this.key._parent());
                {
                    GgufStr _it = this.key;
                    if (!(_it.lenValue() != 0)) {
                        throw new KaitaiStream.ValidationExprError(this.key, null, "/types/gguf_body/types/gguf_kv/seq/0");
                    }
                }
                if (this.type == null) {
                    throw new KaitaiStream.ValidationNotInEnumError(this.type, null, "/types/gguf_body/types/gguf_kv/seq/1");
                }
                if (!Objects.equals(this.value._root(), _root()))
                    throw new ConsistencyError("value", _root(), this.value._root());
                if (!Objects.equals(this.value._parent(), this))
                    throw new ConsistencyError("value", this, this.value._parent());
                if (this.value.type() != type())
                    throw new ConsistencyError("value", type(), this.value.type());
                {
                    GgufValue _it = this.value;
                    if (!((key().value().equals("general.alignment") ?  ((type() == Gguf.GgufType.UINT32) && (((Gguf.GgufBody.GgufUint32) (_it.value())).value() != 0) && ((((Gguf.GgufBody.GgufUint32) (_it.value())).value() & ((Gguf.GgufBody.GgufUint32) (_it.value())).value() - 1) == 0))  : true))) {
                        throw new KaitaiStream.ValidationExprError(this.value, null, "/types/gguf_body/types/gguf_kv/seq/2");
                    }
                }
                _dirty = false;
            }
            private Long alignment;
            public Long alignment() {
                if (this.alignment != null)
                    return this.alignment;
                this.alignment = ((Number) ((key().value().equals("general.alignment") ? ((Gguf.GgufBody.GgufUint32) (value().value())).value() : prevAlignment()))).longValue();
                return this.alignment;
            }
            public void _invalidateAlignment() { this.alignment = null; }
            private GgufStr key;
            private GgufType type;
            private GgufValue value;
            private long prevAlignment;
            private Gguf _root;
            private Gguf.GgufBody _parent;
            public GgufStr key() { return key; }
            public void setKey(GgufStr _v) { _dirty = true; key = _v; }
            public GgufType type() { return type; }
            public void setType(GgufType _v) { _dirty = true; type = _v; }
            public GgufValue value() { return value; }
            public void setValue(GgufValue _v) { _dirty = true; value = _v; }
            public long prevAlignment() { return prevAlignment; }
            public void setPrevAlignment(long _v) { _dirty = true; prevAlignment = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L232-L237">Git tag "v0.27.0"</a>
         */
        public static class GgufStr extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufStr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.lenValue = this._io.readU8le();
                this.value = new String(this._io.readBytes(lenValue()), StandardCharsets.UTF_8);
                _dirty = false;
            }
            private void _readBE() {
                this.lenValue = this._io.readU8be();
                this.value = new String(this._io.readBytes(lenValue()), StandardCharsets.UTF_8);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU8le(this.lenValue);
                this._io.writeBytes((this.value).getBytes(Charset.forName("UTF-8")));
            }

            private void _write_SeqBE() {
                this._io.writeU8be(this.lenValue);
                this._io.writeBytes((this.value).getBytes(Charset.forName("UTF-8")));
            }

            public void _check() {
                if ((this.value).getBytes(Charset.forName("UTF-8")).length != lenValue())
                    throw new ConsistencyError("value", lenValue(), (this.value).getBytes(Charset.forName("UTF-8")).length);
                _dirty = false;
            }
            private long lenValue;
            private String value;
            private Gguf _root;
            private KaitaiStruct.ReadWrite _parent;
            public long lenValue() { return lenValue; }
            public void setLenValue(long _v) { _dirty = true; lenValue = _v; }
            public String value() { return value; }
            public void setValue(String _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L305-L325">Git tag "v0.27.0"</a>
         */
        public static class GgufTensorInfo extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufTensorInfo(KaitaiStream _io, Gguf.GgufBody _parent, Gguf _root, boolean _is_le, long expectedOffset) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.expectedOffset = expectedOffset;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.name = new GgufStr(this._io, this, _root, _is_le);
                this.name._read();
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
                _dirty = false;
            }
            private void _readBE() {
                this.name = new GgufStr(this._io, this, _root, _is_le);
                this.name._read();
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
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                _shouldWriteData = _enabledData;
                _shouldWritePadding = _enabledPadding;
                this.name._write_Seq(this._io);
                this._io.writeU4le(this.numDims);
                for (int i = 0; i < this.dims.size(); i++) {
                    this._io.writeS8le(this.dims.get(((Number) (i)).intValue()));
                }
                this._io.writeU4le(((Number) (this.type.id())).longValue());
                this._io.writeU8le(this.offset);
            }

            private void _write_SeqBE() {
                _shouldWriteData = _enabledData;
                _shouldWritePadding = _enabledPadding;
                this.name._write_Seq(this._io);
                this._io.writeU4be(this.numDims);
                for (int i = 0; i < this.dims.size(); i++) {
                    this._io.writeS8be(this.dims.get(((Number) (i)).intValue()));
                }
                this._io.writeU4be(((Number) (this.type.id())).longValue());
                this._io.writeU8be(this.offset);
            }

            public void _check() {
                if (!Objects.equals(this.name._root(), _root()))
                    throw new ConsistencyError("name", _root(), this.name._root());
                if (!Objects.equals(this.name._parent(), this))
                    throw new ConsistencyError("name", this, this.name._parent());
                {
                    GgufStr _it = this.name;
                    if (!(_it.lenValue() < 64)) {
                        throw new KaitaiStream.ValidationExprError(this.name, null, "/types/gguf_body/types/gguf_tensor_info/seq/0");
                    }
                }
                if (!(this.numDims <= 4)) {
                    throw new KaitaiStream.ValidationGreaterThanError(4, this.numDims, null, "/types/gguf_body/types/gguf_tensor_info/seq/1");
                }
                if (this.dims.size() != numDims())
                    throw new ConsistencyError("dims", numDims(), this.dims.size());
                for (int i = 0; i < this.dims.size(); i++) {
                    if (!(this.dims.get(((Number) (i)).intValue()) >= 0)) {
                        throw new KaitaiStream.ValidationLessThanError(0, this.dims.get(((Number) (i)).intValue()), null, "/types/gguf_body/types/gguf_tensor_info/seq/2");
                    }
                }
                {
                    GgmlType _it = this.type;
                    if (!( ((_it.id() < 43) && (numElementsPerBlock() != 0) && (KaitaiStream.mod((numDims() > 0 ? dims().get(((int) 0)) : 1), numElementsPerBlock()) == 0)) )) {
                        throw new KaitaiStream.ValidationExprError(this.type, null, "/types/gguf_body/types/gguf_tensor_info/seq/3");
                    }
                }
                if (!(this.offset == expectedOffset())) {
                    throw new KaitaiStream.ValidationNotEqualError(expectedOffset(), this.offset, null, "/types/gguf_body/types/gguf_tensor_info/seq/4");
                }
                if (_enabledData) {
                    if (this.data.length != lenData())
                        throw new ConsistencyError("data", lenData(), this.data.length);
                }
                if (_enabledPadding) {
                    if (this.padding.length != lenPadding())
                        throw new ConsistencyError("padding", lenPadding(), this.padding.length);
                }
                _dirty = false;
            }
            private byte[] data;
            private boolean _shouldWriteData = false;
            private boolean _enabledData = true;
            public byte[] data() {
                if (_shouldWriteData)
                    _writeData();
                if (this.data != null)
                    return this.data;
                if (!_enabledData)
                    return null;
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
            public void setData(byte[] _v) { _dirty = true; data = _v; }
            public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

            private void _writeData() {
                _shouldWriteData = false;
                long _pos = this._io.pos();
                this._io.seek(_parent().ofsTensorData() + offset());
                if (_is_le) {
                    this._io.writeBytes(this.data);
                } else {
                    this._io.writeBytes(this.data);
                }
                this._io.seek(_pos);
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
            public void _invalidateDumpDims() { this.dumpDims = null; }
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
            public void _invalidateExpectedNextOffset() { this.expectedNextOffset = null; }
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
            public void _invalidateLenBlock() { this.lenBlock = null; }
            private Long lenData;
            public Long lenData() {
                if (this.lenData != null)
                    return this.lenData;
                this.lenData = ((Number) (((Number) (lenBlock() * numBlocks())).longValue())).longValue();
                return this.lenData;
            }
            public void _invalidateLenData() { this.lenData = null; }
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
            public void _invalidateLenPadding() { this.lenPadding = null; }
            private Long numBlocks;
            public Long numBlocks() {
                if (this.numBlocks != null)
                    return this.numBlocks;
                this.numBlocks = ((Number) (((Number) (numElements() / numElementsPerBlock())).longValue())).longValue();
                return this.numBlocks;
            }
            public void _invalidateNumBlocks() { this.numBlocks = null; }
            private Long numElements;
            public Long numElements() {
                if (this.numElements != null)
                    return this.numElements;
                this.numElements = ((Number) (((Number) ((((numDims() > 0 ? dims().get(((int) 0)) : 1) * (numDims() > 1 ? dims().get(((int) 1)) : 1)) * (numDims() > 2 ? dims().get(((int) 2)) : 1)) * (numDims() > 3 ? dims().get(((int) 3)) : 1))).longValue())).longValue();
                return this.numElements;
            }
            public void _invalidateNumElements() { this.numElements = null; }
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
            public void _invalidateNumElementsPerBlock() { this.numElementsPerBlock = null; }
            private byte[] padding;
            private boolean _shouldWritePadding = false;
            private boolean _enabledPadding = true;

            /**
             * Padding after the data. ggml requires it even after the last tensor
             * when reading the tensor data.
             * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L884-L893">Git tag "v0.27.0"</a>
             */
            public byte[] padding() {
                if (_shouldWritePadding)
                    _writePadding();
                if (this.padding != null)
                    return this.padding;
                if (!_enabledPadding)
                    return null;
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
            public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
            public void setPadding_Enabled(boolean _v) { _dirty = true; _enabledPadding = _v; }

            private void _writePadding() {
                _shouldWritePadding = false;
                long _pos = this._io.pos();
                this._io.seek((_parent().ofsTensorData() + offset()) + lenData());
                if (_is_le) {
                    this._io.writeBytes(this.padding);
                } else {
                    this._io.writeBytes(this.padding);
                }
                this._io.seek(_pos);
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
            public void setName(GgufStr _v) { _dirty = true; name = _v; }
            public long numDims() { return numDims; }
            public void setNumDims(long _v) { _dirty = true; numDims = _v; }
            public List<Long> dims() { return dims; }
            public void setDims(List<Long> _v) { _dirty = true; dims = _v; }
            public GgmlType type() { return type; }
            public void setType(GgmlType _v) { _dirty = true; type = _v; }

            /**
             * Offset of the tensor's data, relative to `_parent.ofs_tensor_data`
             */
            public long offset() { return offset; }
            public void setOffset(long _v) { _dirty = true; offset = _v; }
            public long expectedOffset() { return expectedOffset; }
            public void setExpectedOffset(long _v) { _dirty = true; expectedOffset = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufUint16 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufUint16(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readU2le();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU2le(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeU2be(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private int value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public int value() { return value; }
            public void setValue(int _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufUint32 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufUint32(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readU4le();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU4le(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeU4be(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private long value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public long value() { return value; }
            public void setValue(long _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufUint64 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufUint64(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readU8le();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readU8be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU8le(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeU8be(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private long value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public long value() { return value; }
            public void setValue(long _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }
        public static class GgufUint8 extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufUint8(KaitaiStream _io, Gguf.GgufBody.GgufValue _parent, Gguf _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                this.value = this._io.readU1();
                _dirty = false;
            }
            private void _readBE() {
                this.value = this._io.readU1();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                this._io.writeU1(this.value);
            }

            private void _write_SeqBE() {
                this._io.writeU1(this.value);
            }

            public void _check() {
                _dirty = false;
            }
            private int value;
            private Gguf _root;
            private Gguf.GgufBody.GgufValue _parent;
            public int value() { return value; }
            public void setValue(int _v) { _dirty = true; value = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public Gguf.GgufBody.GgufValue _parent() { return _parent; }
            public void set_parent(Gguf.GgufBody.GgufValue _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L239-L260">Git tag "v0.27.0"</a>
         */
        public static class GgufValue extends KaitaiStruct.ReadWrite {
            private Boolean _is_le;

            public GgufValue(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Gguf _root, boolean _is_le, GgufType type) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                this.type = type;
            }
            public void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
                _dirty = false;
            }
            private void _readLE() {
                {
                    GgufType on = type();
                    if (on != null) {
                        switch (type()) {
                        case ARRAY: {
                            this.value = new GgufArray(this._io, this, _root, _is_le);
                            ((GgufArray) (this.value))._read();
                            break;
                        }
                        case BOOL: {
                            this.value = new GgufBool(this._io, this, _root, _is_le);
                            ((GgufBool) (this.value))._read();
                            break;
                        }
                        case FLOAT32: {
                            this.value = new GgufFloat32(this._io, this, _root, _is_le);
                            ((GgufFloat32) (this.value))._read();
                            break;
                        }
                        case FLOAT64: {
                            this.value = new GgufFloat64(this._io, this, _root, _is_le);
                            ((GgufFloat64) (this.value))._read();
                            break;
                        }
                        case INT16: {
                            this.value = new GgufInt16(this._io, this, _root, _is_le);
                            ((GgufInt16) (this.value))._read();
                            break;
                        }
                        case INT32: {
                            this.value = new GgufInt32(this._io, this, _root, _is_le);
                            ((GgufInt32) (this.value))._read();
                            break;
                        }
                        case INT64: {
                            this.value = new GgufInt64(this._io, this, _root, _is_le);
                            ((GgufInt64) (this.value))._read();
                            break;
                        }
                        case INT8: {
                            this.value = new GgufInt8(this._io, this, _root, _is_le);
                            ((GgufInt8) (this.value))._read();
                            break;
                        }
                        case STRING: {
                            this.value = new GgufStr(this._io, this, _root, _is_le);
                            ((GgufStr) (this.value))._read();
                            break;
                        }
                        case UINT16: {
                            this.value = new GgufUint16(this._io, this, _root, _is_le);
                            ((GgufUint16) (this.value))._read();
                            break;
                        }
                        case UINT32: {
                            this.value = new GgufUint32(this._io, this, _root, _is_le);
                            ((GgufUint32) (this.value))._read();
                            break;
                        }
                        case UINT64: {
                            this.value = new GgufUint64(this._io, this, _root, _is_le);
                            ((GgufUint64) (this.value))._read();
                            break;
                        }
                        case UINT8: {
                            this.value = new GgufUint8(this._io, this, _root, _is_le);
                            ((GgufUint8) (this.value))._read();
                            break;
                        }
                        }
                    }
                }
                _dirty = false;
            }
            private void _readBE() {
                {
                    GgufType on = type();
                    if (on != null) {
                        switch (type()) {
                        case ARRAY: {
                            this.value = new GgufArray(this._io, this, _root, _is_le);
                            ((GgufArray) (this.value))._read();
                            break;
                        }
                        case BOOL: {
                            this.value = new GgufBool(this._io, this, _root, _is_le);
                            ((GgufBool) (this.value))._read();
                            break;
                        }
                        case FLOAT32: {
                            this.value = new GgufFloat32(this._io, this, _root, _is_le);
                            ((GgufFloat32) (this.value))._read();
                            break;
                        }
                        case FLOAT64: {
                            this.value = new GgufFloat64(this._io, this, _root, _is_le);
                            ((GgufFloat64) (this.value))._read();
                            break;
                        }
                        case INT16: {
                            this.value = new GgufInt16(this._io, this, _root, _is_le);
                            ((GgufInt16) (this.value))._read();
                            break;
                        }
                        case INT32: {
                            this.value = new GgufInt32(this._io, this, _root, _is_le);
                            ((GgufInt32) (this.value))._read();
                            break;
                        }
                        case INT64: {
                            this.value = new GgufInt64(this._io, this, _root, _is_le);
                            ((GgufInt64) (this.value))._read();
                            break;
                        }
                        case INT8: {
                            this.value = new GgufInt8(this._io, this, _root, _is_le);
                            ((GgufInt8) (this.value))._read();
                            break;
                        }
                        case STRING: {
                            this.value = new GgufStr(this._io, this, _root, _is_le);
                            ((GgufStr) (this.value))._read();
                            break;
                        }
                        case UINT16: {
                            this.value = new GgufUint16(this._io, this, _root, _is_le);
                            ((GgufUint16) (this.value))._read();
                            break;
                        }
                        case UINT32: {
                            this.value = new GgufUint32(this._io, this, _root, _is_le);
                            ((GgufUint32) (this.value))._read();
                            break;
                        }
                        case UINT64: {
                            this.value = new GgufUint64(this._io, this, _root, _is_le);
                            ((GgufUint64) (this.value))._read();
                            break;
                        }
                        case UINT8: {
                            this.value = new GgufUint8(this._io, this, _root, _is_le);
                            ((GgufUint8) (this.value))._read();
                            break;
                        }
                        }
                    }
                }
                _dirty = false;
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

            public void _write_Seq() {
                _assertNotDirty();

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _write_SeqLE();
                } else {
                    _write_SeqBE();
                }
            }

            private void _write_SeqLE() {
                {
                    GgufType on = type();
                    if (on != null) {
                        switch (type()) {
                        case ARRAY: {
                            ((GgufArray) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case BOOL: {
                            ((GgufBool) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case FLOAT32: {
                            ((GgufFloat32) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case FLOAT64: {
                            ((GgufFloat64) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case INT16: {
                            ((GgufInt16) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case INT32: {
                            ((GgufInt32) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case INT64: {
                            ((GgufInt64) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case INT8: {
                            ((GgufInt8) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case STRING: {
                            ((GgufStr) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case UINT16: {
                            ((GgufUint16) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case UINT32: {
                            ((GgufUint32) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case UINT64: {
                            ((GgufUint64) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case UINT8: {
                            ((GgufUint8) (this.value))._write_Seq(this._io);
                            break;
                        }
                        }
                    }
                }
            }

            private void _write_SeqBE() {
                {
                    GgufType on = type();
                    if (on != null) {
                        switch (type()) {
                        case ARRAY: {
                            ((GgufArray) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case BOOL: {
                            ((GgufBool) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case FLOAT32: {
                            ((GgufFloat32) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case FLOAT64: {
                            ((GgufFloat64) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case INT16: {
                            ((GgufInt16) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case INT32: {
                            ((GgufInt32) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case INT64: {
                            ((GgufInt64) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case INT8: {
                            ((GgufInt8) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case STRING: {
                            ((GgufStr) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case UINT16: {
                            ((GgufUint16) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case UINT32: {
                            ((GgufUint32) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case UINT64: {
                            ((GgufUint64) (this.value))._write_Seq(this._io);
                            break;
                        }
                        case UINT8: {
                            ((GgufUint8) (this.value))._write_Seq(this._io);
                            break;
                        }
                        }
                    }
                }
            }

            public void _check() {
                {
                    GgufType on = type();
                    if (on != null) {
                        switch (type()) {
                        case ARRAY: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufArray) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufArray) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufArray) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufArray) (this.value))._parent());
                            break;
                        }
                        case BOOL: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufBool) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufBool) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufBool) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufBool) (this.value))._parent());
                            break;
                        }
                        case FLOAT32: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufFloat32) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufFloat32) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufFloat32) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufFloat32) (this.value))._parent());
                            break;
                        }
                        case FLOAT64: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufFloat64) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufFloat64) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufFloat64) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufFloat64) (this.value))._parent());
                            break;
                        }
                        case INT16: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufInt16) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufInt16) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufInt16) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufInt16) (this.value))._parent());
                            break;
                        }
                        case INT32: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufInt32) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufInt32) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufInt32) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufInt32) (this.value))._parent());
                            break;
                        }
                        case INT64: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufInt64) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufInt64) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufInt64) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufInt64) (this.value))._parent());
                            break;
                        }
                        case INT8: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufInt8) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufInt8) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufInt8) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufInt8) (this.value))._parent());
                            break;
                        }
                        case STRING: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufStr) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufStr) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufStr) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufStr) (this.value))._parent());
                            break;
                        }
                        case UINT16: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufUint16) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufUint16) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufUint16) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufUint16) (this.value))._parent());
                            break;
                        }
                        case UINT32: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufUint32) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufUint32) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufUint32) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufUint32) (this.value))._parent());
                            break;
                        }
                        case UINT64: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufUint64) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufUint64) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufUint64) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufUint64) (this.value))._parent());
                            break;
                        }
                        case UINT8: {
                            if (!Objects.equals(((Gguf.GgufBody.GgufUint8) (this.value))._root(), _root()))
                                throw new ConsistencyError("value", _root(), ((Gguf.GgufBody.GgufUint8) (this.value))._root());
                            if (!Objects.equals(((Gguf.GgufBody.GgufUint8) (this.value))._parent(), this))
                                throw new ConsistencyError("value", this, ((Gguf.GgufBody.GgufUint8) (this.value))._parent());
                            break;
                        }
                        }
                    }
                }
                _dirty = false;
            }
            private KaitaiStruct.ReadWrite value;
            private GgufType type;
            private Gguf _root;
            private KaitaiStruct.ReadWrite _parent;
            public KaitaiStruct.ReadWrite value() { return value; }
            public void setValue(KaitaiStruct.ReadWrite _v) { _dirty = true; value = _v; }
            public GgufType type() { return type; }
            public void setType(GgufType _v) { _dirty = true; type = _v; }
            public Gguf _root() { return _root; }
            public void set_root(Gguf _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
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
        public void _invalidateAlignment() { this.alignment = null; }
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
        public void _invalidateOfsTensorData() { this.ofsTensorData = null; }
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
        public void setVersion(long _v) { _dirty = true; version = _v; }

        /**
         * The number of tensors in the file
         */
        public long numTensorInfos() { return numTensorInfos; }
        public void setNumTensorInfos(long _v) { _dirty = true; numTensorInfos = _v; }

        /**
         * The number of key-value pairs in the file header
         */
        public long numKvPairs() { return numKvPairs; }
        public void setNumKvPairs(long _v) { _dirty = true; numKvPairs = _v; }

        /**
         * Key-value pairs. ggml (v0.27.0)
         * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L575-L578)
         * duplicate keys, but this Kaitai Struct implementation can't detect
         * them. If there are multiple `general.alignment` keys, the last one is
         * used for the `alignment` value instance.
         */
        public List<GgufKv> kvPairs() { return kvPairs; }
        public void setKvPairs(List<GgufKv> _v) { _dirty = true; kvPairs = _v; }

        /**
         * Tensor metadata. ggml (v0.27.0)
         * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L664-L669)
         * duplicate tensor names, but this Kaitai Struct implementation can't
         * detect them.
         */
        public List<GgufTensorInfo> tensorInfos() { return tensorInfos; }
        public void setTensorInfos(List<GgufTensorInfo> _v) { _dirty = true; tensorInfos = _v; }

        /**
         * @see <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L780-L785">Git tag "v0.27.0"</a>
         */
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public byte[] _unnamed6() { return _unnamed6; }
        public void set_unnamed6(byte[] _v) { _dirty = true; _unnamed6 = _v; }
        public Gguf _root() { return _root; }
        public void set_root(Gguf _v) { _dirty = true; _root = _v; }
        public Gguf _parent() { return _parent; }
        public void set_parent(Gguf _v) { _dirty = true; _parent = _v; }
    }
    private Boolean isBigEndian;
    public Boolean isBigEndian() {
        if (this.isBigEndian != null)
            return this.isBigEndian;
        this.isBigEndian = (versionLe() & 65535) == 0;
        return this.isBigEndian;
    }
    public void _invalidateIsBigEndian() { this.isBigEndian = null; }
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
    public void _invalidateLenFile() { this.lenFile = null; }
    private Long versionLe;
    private boolean _shouldWriteVersionLe = false;
    private boolean _enabledVersionLe = true;
    public Long versionLe() {
        if (_shouldWriteVersionLe)
            _writeVersionLe();
        if (this.versionLe != null)
            return this.versionLe;
        if (!_enabledVersionLe)
            return null;
        long _pos = this._io.pos();
        this._io.seek(4);
        this.versionLe = this._io.readU4le();
        this._io.seek(_pos);
        return this.versionLe;
    }
    public void setVersionLe(long _v) { _dirty = true; versionLe = _v; }
    public void setVersionLe_Enabled(boolean _v) { _dirty = true; _enabledVersionLe = _v; }

    private void _writeVersionLe() {
        _shouldWriteVersionLe = false;
        long _pos = this._io.pos();
        this._io.seek(4);
        this._io.writeU4le(this.versionLe);
        this._io.seek(_pos);
    }
    private byte[] magic;
    private GgufBody body;
    private Gguf _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * GGUF file magic
     */
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public GgufBody body() { return body; }
    public void setBody(GgufBody _v) { _dirty = true; body = _v; }
    public Gguf _root() { return _root; }
    public void set_root(Gguf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
