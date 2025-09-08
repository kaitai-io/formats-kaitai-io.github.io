// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * @see <a href="https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html">Source</a>
 * @see <a href="https://docs.oracle.com/javase/specs/jls/se6/jls3.pdf">Source</a>
 * @see <a href="https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/jdk.hotspot.agent/share/classes/sun/jvm/hotspot/runtime/ClassConstants.java">Source</a>
 * @see <a href="https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/java.base/share/native/include/classfile_constants.h.template">Source</a>
 * @see <a href="https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/hotspot/share/classfile/classFileParser.cpp">Source</a>
 */
public class JavaClass extends KaitaiStruct.ReadWrite {
    public static JavaClass fromFile(String fileName) throws IOException {
        return new JavaClass(new ByteBufferKaitaiStream(fileName));
    }
    public JavaClass() {
        this(null, null, null);
    }

    public JavaClass(KaitaiStream _io) {
        this(_io, null, null);
    }

    public JavaClass(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public JavaClass(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, JavaClass _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { -54, -2, -70, -66 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -54, -2, -70, -66 }, this.magic, this._io, "/seq/0");
        }
        this.versionMinor = this._io.readU2be();
        this.versionMajor = this._io.readU2be();
        if (!(this.versionMajor >= 43)) {
            throw new KaitaiStream.ValidationLessThanError(43, this.versionMajor, this._io, "/seq/2");
        }
        this.constantPoolCount = this._io.readU2be();
        this.constantPool = new ArrayList<ConstantPoolEntry>();
        for (int i = 0; i < constantPoolCount() - 1; i++) {
            ConstantPoolEntry _t_constantPool = new ConstantPoolEntry(this._io, this, _root, (i != 0 ? constantPool().get(((Number) (i - 1)).intValue()).isTwoEntries() : false));
            try {
                _t_constantPool._read();
            } finally {
                this.constantPool.add(_t_constantPool);
            }
        }
        this.accessFlags = this._io.readU2be();
        this.thisClass = this._io.readU2be();
        this.superClass = this._io.readU2be();
        this.interfacesCount = this._io.readU2be();
        this.interfaces = new ArrayList<Integer>();
        for (int i = 0; i < interfacesCount(); i++) {
            this.interfaces.add(this._io.readU2be());
        }
        this.fieldsCount = this._io.readU2be();
        this.fields = new ArrayList<FieldInfo>();
        for (int i = 0; i < fieldsCount(); i++) {
            FieldInfo _t_fields = new FieldInfo(this._io, this, _root);
            try {
                _t_fields._read();
            } finally {
                this.fields.add(_t_fields);
            }
        }
        this.methodsCount = this._io.readU2be();
        this.methods = new ArrayList<MethodInfo>();
        for (int i = 0; i < methodsCount(); i++) {
            MethodInfo _t_methods = new MethodInfo(this._io, this, _root);
            try {
                _t_methods._read();
            } finally {
                this.methods.add(_t_methods);
            }
        }
        this.attributesCount = this._io.readU2be();
        this.attributes = new ArrayList<AttributeInfo>();
        for (int i = 0; i < attributesCount(); i++) {
            AttributeInfo _t_attributes = new AttributeInfo(this._io, this, _root);
            try {
                _t_attributes._read();
            } finally {
                this.attributes.add(_t_attributes);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.constantPool.size(); i++) {
            this.constantPool.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.interfaces.size(); i++) {
        }
        for (int i = 0; i < this.fields.size(); i++) {
            this.fields.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.methods.size(); i++) {
            this.methods.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.attributes.size(); i++) {
            this.attributes.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU2be(this.versionMinor);
        this._io.writeU2be(this.versionMajor);
        this._io.writeU2be(this.constantPoolCount);
        for (int i = 0; i < this.constantPool.size(); i++) {
            this.constantPool.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.writeU2be(this.accessFlags);
        this._io.writeU2be(this.thisClass);
        this._io.writeU2be(this.superClass);
        this._io.writeU2be(this.interfacesCount);
        for (int i = 0; i < this.interfaces.size(); i++) {
            this._io.writeU2be(this.interfaces.get(((Number) (i)).intValue()));
        }
        this._io.writeU2be(this.fieldsCount);
        for (int i = 0; i < this.fields.size(); i++) {
            this.fields.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.writeU2be(this.methodsCount);
        for (int i = 0; i < this.methods.size(); i++) {
            this.methods.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.writeU2be(this.attributesCount);
        for (int i = 0; i < this.attributes.size(); i++) {
            this.attributes.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { -54, -2, -70, -66 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -54, -2, -70, -66 }, this.magic, null, "/seq/0");
        }
        if (!(this.versionMajor >= 43)) {
            throw new KaitaiStream.ValidationLessThanError(43, this.versionMajor, null, "/seq/2");
        }
        if (this.constantPool.size() != constantPoolCount() - 1)
            throw new ConsistencyError("constant_pool", constantPoolCount() - 1, this.constantPool.size());
        for (int i = 0; i < this.constantPool.size(); i++) {
            if (!Objects.equals(this.constantPool.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("constant_pool", _root(), this.constantPool.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.constantPool.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("constant_pool", this, this.constantPool.get(((Number) (i)).intValue())._parent());
            if (this.constantPool.get(((Number) (i)).intValue()).isPrevTwoEntries() != (i != 0 ? constantPool().get(((Number) (i - 1)).intValue()).isTwoEntries() : false))
                throw new ConsistencyError("constant_pool", (i != 0 ? constantPool().get(((Number) (i - 1)).intValue()).isTwoEntries() : false), this.constantPool.get(((Number) (i)).intValue()).isPrevTwoEntries());
        }
        if (this.interfaces.size() != interfacesCount())
            throw new ConsistencyError("interfaces", interfacesCount(), this.interfaces.size());
        for (int i = 0; i < this.interfaces.size(); i++) {
        }
        if (this.fields.size() != fieldsCount())
            throw new ConsistencyError("fields", fieldsCount(), this.fields.size());
        for (int i = 0; i < this.fields.size(); i++) {
            if (!Objects.equals(this.fields.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("fields", _root(), this.fields.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.fields.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("fields", this, this.fields.get(((Number) (i)).intValue())._parent());
        }
        if (this.methods.size() != methodsCount())
            throw new ConsistencyError("methods", methodsCount(), this.methods.size());
        for (int i = 0; i < this.methods.size(); i++) {
            if (!Objects.equals(this.methods.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("methods", _root(), this.methods.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.methods.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("methods", this, this.methods.get(((Number) (i)).intValue())._parent());
        }
        if (this.attributes.size() != attributesCount())
            throw new ConsistencyError("attributes", attributesCount(), this.attributes.size());
        for (int i = 0; i < this.attributes.size(); i++) {
            if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("attributes", _root(), this.attributes.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("attributes", this, this.attributes.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7">Source</a>
     */
    public static class AttributeInfo extends KaitaiStruct.ReadWrite {
        public static AttributeInfo fromFile(String fileName) throws IOException {
            return new AttributeInfo(new ByteBufferKaitaiStream(fileName));
        }
        public AttributeInfo() {
            this(null, null, null);
        }

        public AttributeInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AttributeInfo(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public AttributeInfo(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.nameIndex = this._io.readU2be();
            this.attributeLength = this._io.readU4be();
            switch (nameAsStr()) {
            case "Code": {
                this._raw_info = this._io.readBytes(attributeLength());
                KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(this._raw_info);
                this.info = new AttrBodyCode(_io__raw_info, this, _root);
                ((AttrBodyCode) (this.info))._read();
                break;
            }
            case "Exceptions": {
                this._raw_info = this._io.readBytes(attributeLength());
                KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(this._raw_info);
                this.info = new AttrBodyExceptions(_io__raw_info, this, _root);
                ((AttrBodyExceptions) (this.info))._read();
                break;
            }
            case "LineNumberTable": {
                this._raw_info = this._io.readBytes(attributeLength());
                KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(this._raw_info);
                this.info = new AttrBodyLineNumberTable(_io__raw_info, this, _root);
                ((AttrBodyLineNumberTable) (this.info))._read();
                break;
            }
            case "SourceFile": {
                this._raw_info = this._io.readBytes(attributeLength());
                KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(this._raw_info);
                this.info = new AttrBodySourceFile(_io__raw_info, this, _root);
                ((AttrBodySourceFile) (this.info))._read();
                break;
            }
            default: {
                this.info = this._io.readBytes(attributeLength());
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (nameAsStr()) {
            case "Code": {
                ((AttrBodyCode) (this.info))._fetchInstances();
                break;
            }
            case "Exceptions": {
                ((AttrBodyExceptions) (this.info))._fetchInstances();
                break;
            }
            case "LineNumberTable": {
                ((AttrBodyLineNumberTable) (this.info))._fetchInstances();
                break;
            }
            case "SourceFile": {
                ((AttrBodySourceFile) (this.info))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.nameIndex);
            this._io.writeU4be(this.attributeLength);
            switch (nameAsStr()) {
            case "Code": {
                final KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(attributeLength());
                this._io.addChildStream(_io__raw_info);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (attributeLength()));
                    final AttributeInfo _this = this;
                    _io__raw_info.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_info = _io__raw_info.toByteArray();
                            if (((byte[]) (_this._raw_info)).length != attributeLength())
                                throw new ConsistencyError("raw(info)", attributeLength(), ((byte[]) (_this._raw_info)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_info)))));
                        }
                    });
                }
                ((AttrBodyCode) (this.info))._write_Seq(_io__raw_info);
                break;
            }
            case "Exceptions": {
                final KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(attributeLength());
                this._io.addChildStream(_io__raw_info);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (attributeLength()));
                    final AttributeInfo _this = this;
                    _io__raw_info.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_info = _io__raw_info.toByteArray();
                            if (((byte[]) (_this._raw_info)).length != attributeLength())
                                throw new ConsistencyError("raw(info)", attributeLength(), ((byte[]) (_this._raw_info)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_info)))));
                        }
                    });
                }
                ((AttrBodyExceptions) (this.info))._write_Seq(_io__raw_info);
                break;
            }
            case "LineNumberTable": {
                final KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(attributeLength());
                this._io.addChildStream(_io__raw_info);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (attributeLength()));
                    final AttributeInfo _this = this;
                    _io__raw_info.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_info = _io__raw_info.toByteArray();
                            if (((byte[]) (_this._raw_info)).length != attributeLength())
                                throw new ConsistencyError("raw(info)", attributeLength(), ((byte[]) (_this._raw_info)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_info)))));
                        }
                    });
                }
                ((AttrBodyLineNumberTable) (this.info))._write_Seq(_io__raw_info);
                break;
            }
            case "SourceFile": {
                final KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(attributeLength());
                this._io.addChildStream(_io__raw_info);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (attributeLength()));
                    final AttributeInfo _this = this;
                    _io__raw_info.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_info = _io__raw_info.toByteArray();
                            if (((byte[]) (_this._raw_info)).length != attributeLength())
                                throw new ConsistencyError("raw(info)", attributeLength(), ((byte[]) (_this._raw_info)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_info)))));
                        }
                    });
                }
                ((AttrBodySourceFile) (this.info))._write_Seq(_io__raw_info);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.info)))));
                break;
            }
            }
        }

        public void _check() {
            switch (nameAsStr()) {
            case "Code": {
                if (!Objects.equals(((JavaClass.AttributeInfo.AttrBodyCode) (this.info))._root(), _root()))
                    throw new ConsistencyError("info", _root(), ((JavaClass.AttributeInfo.AttrBodyCode) (this.info))._root());
                if (!Objects.equals(((JavaClass.AttributeInfo.AttrBodyCode) (this.info))._parent(), this))
                    throw new ConsistencyError("info", this, ((JavaClass.AttributeInfo.AttrBodyCode) (this.info))._parent());
                break;
            }
            case "Exceptions": {
                if (!Objects.equals(((JavaClass.AttributeInfo.AttrBodyExceptions) (this.info))._root(), _root()))
                    throw new ConsistencyError("info", _root(), ((JavaClass.AttributeInfo.AttrBodyExceptions) (this.info))._root());
                if (!Objects.equals(((JavaClass.AttributeInfo.AttrBodyExceptions) (this.info))._parent(), this))
                    throw new ConsistencyError("info", this, ((JavaClass.AttributeInfo.AttrBodyExceptions) (this.info))._parent());
                break;
            }
            case "LineNumberTable": {
                if (!Objects.equals(((JavaClass.AttributeInfo.AttrBodyLineNumberTable) (this.info))._root(), _root()))
                    throw new ConsistencyError("info", _root(), ((JavaClass.AttributeInfo.AttrBodyLineNumberTable) (this.info))._root());
                if (!Objects.equals(((JavaClass.AttributeInfo.AttrBodyLineNumberTable) (this.info))._parent(), this))
                    throw new ConsistencyError("info", this, ((JavaClass.AttributeInfo.AttrBodyLineNumberTable) (this.info))._parent());
                break;
            }
            case "SourceFile": {
                if (!Objects.equals(((JavaClass.AttributeInfo.AttrBodySourceFile) (this.info))._root(), _root()))
                    throw new ConsistencyError("info", _root(), ((JavaClass.AttributeInfo.AttrBodySourceFile) (this.info))._root());
                if (!Objects.equals(((JavaClass.AttributeInfo.AttrBodySourceFile) (this.info))._parent(), this))
                    throw new ConsistencyError("info", this, ((JavaClass.AttributeInfo.AttrBodySourceFile) (this.info))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.info)).length != attributeLength())
                    throw new ConsistencyError("info", attributeLength(), ((byte[]) (this.info)).length);
                break;
            }
            }
            _dirty = false;
        }

        /**
         * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3">Source</a>
         */
        public static class AttrBodyCode extends KaitaiStruct.ReadWrite {
            public static AttrBodyCode fromFile(String fileName) throws IOException {
                return new AttrBodyCode(new ByteBufferKaitaiStream(fileName));
            }
            public AttrBodyCode() {
                this(null, null, null);
            }

            public AttrBodyCode(KaitaiStream _io) {
                this(_io, null, null);
            }

            public AttrBodyCode(KaitaiStream _io, JavaClass.AttributeInfo _parent) {
                this(_io, _parent, null);
            }

            public AttrBodyCode(KaitaiStream _io, JavaClass.AttributeInfo _parent, JavaClass _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.maxStack = this._io.readU2be();
                this.maxLocals = this._io.readU2be();
                this.codeLength = this._io.readU4be();
                this.code = this._io.readBytes(codeLength());
                this.exceptionTableLength = this._io.readU2be();
                this.exceptionTable = new ArrayList<ExceptionEntry>();
                for (int i = 0; i < exceptionTableLength(); i++) {
                    ExceptionEntry _t_exceptionTable = new ExceptionEntry(this._io, this, _root);
                    try {
                        _t_exceptionTable._read();
                    } finally {
                        this.exceptionTable.add(_t_exceptionTable);
                    }
                }
                this.attributesCount = this._io.readU2be();
                this.attributes = new ArrayList<AttributeInfo>();
                for (int i = 0; i < attributesCount(); i++) {
                    AttributeInfo _t_attributes = new AttributeInfo(this._io, this, _root);
                    try {
                        _t_attributes._read();
                    } finally {
                        this.attributes.add(_t_attributes);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.exceptionTable.size(); i++) {
                    this.exceptionTable.get(((Number) (i)).intValue())._fetchInstances();
                }
                for (int i = 0; i < this.attributes.size(); i++) {
                    this.attributes.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.maxStack);
                this._io.writeU2be(this.maxLocals);
                this._io.writeU4be(this.codeLength);
                this._io.writeBytes(this.code);
                this._io.writeU2be(this.exceptionTableLength);
                for (int i = 0; i < this.exceptionTable.size(); i++) {
                    this.exceptionTable.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.writeU2be(this.attributesCount);
                for (int i = 0; i < this.attributes.size(); i++) {
                    this.attributes.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.code.length != codeLength())
                    throw new ConsistencyError("code", codeLength(), this.code.length);
                if (this.exceptionTable.size() != exceptionTableLength())
                    throw new ConsistencyError("exception_table", exceptionTableLength(), this.exceptionTable.size());
                for (int i = 0; i < this.exceptionTable.size(); i++) {
                    if (!Objects.equals(this.exceptionTable.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("exception_table", _root(), this.exceptionTable.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.exceptionTable.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("exception_table", this, this.exceptionTable.get(((Number) (i)).intValue())._parent());
                }
                if (this.attributes.size() != attributesCount())
                    throw new ConsistencyError("attributes", attributesCount(), this.attributes.size());
                for (int i = 0; i < this.attributes.size(); i++) {
                    if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("attributes", _root(), this.attributes.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("attributes", this, this.attributes.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }

            /**
             * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3">Source</a>
             */
            public static class ExceptionEntry extends KaitaiStruct.ReadWrite {
                public static ExceptionEntry fromFile(String fileName) throws IOException {
                    return new ExceptionEntry(new ByteBufferKaitaiStream(fileName));
                }
                public ExceptionEntry() {
                    this(null, null, null);
                }

                public ExceptionEntry(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ExceptionEntry(KaitaiStream _io, JavaClass.AttributeInfo.AttrBodyCode _parent) {
                    this(_io, _parent, null);
                }

                public ExceptionEntry(KaitaiStream _io, JavaClass.AttributeInfo.AttrBodyCode _parent, JavaClass _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.startPc = this._io.readU2be();
                    this.endPc = this._io.readU2be();
                    this.handlerPc = this._io.readU2be();
                    this.catchType = this._io.readU2be();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2be(this.startPc);
                    this._io.writeU2be(this.endPc);
                    this._io.writeU2be(this.handlerPc);
                    this._io.writeU2be(this.catchType);
                }

                public void _check() {
                    _dirty = false;
                }
                private ConstantPoolEntry catchException;
                public ConstantPoolEntry catchException() {
                    if (this.catchException != null)
                        return this.catchException;
                    if (catchType() != 0) {
                        this.catchException = _root().constantPool().get(((Number) (catchType() - 1)).intValue());
                    }
                    return this.catchException;
                }
                public void _invalidateCatchException() { this.catchException = null; }
                private int startPc;
                private int endPc;
                private int handlerPc;
                private int catchType;
                private JavaClass _root;
                private JavaClass.AttributeInfo.AttrBodyCode _parent;

                /**
                 * Start of a code region where exception handler is being
                 * active, index in code array (inclusive)
                 */
                public int startPc() { return startPc; }
                public void setStartPc(int _v) { _dirty = true; startPc = _v; }

                /**
                 * End of a code region where exception handler is being
                 * active, index in code array (exclusive)
                 */
                public int endPc() { return endPc; }
                public void setEndPc(int _v) { _dirty = true; endPc = _v; }

                /**
                 * Start of exception handler code, index in code array
                 */
                public int handlerPc() { return handlerPc; }
                public void setHandlerPc(int _v) { _dirty = true; handlerPc = _v; }

                /**
                 * Exception class that this handler catches, index in constant
                 * pool, or 0 (catch all exceptions handler, used to implement
                 * `finally`).
                 */
                public int catchType() { return catchType; }
                public void setCatchType(int _v) { _dirty = true; catchType = _v; }
                public JavaClass _root() { return _root; }
                public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
                public JavaClass.AttributeInfo.AttrBodyCode _parent() { return _parent; }
                public void set_parent(JavaClass.AttributeInfo.AttrBodyCode _v) { _dirty = true; _parent = _v; }
            }
            private int maxStack;
            private int maxLocals;
            private long codeLength;
            private byte[] code;
            private int exceptionTableLength;
            private List<ExceptionEntry> exceptionTable;
            private int attributesCount;
            private List<AttributeInfo> attributes;
            private JavaClass _root;
            private JavaClass.AttributeInfo _parent;
            public int maxStack() { return maxStack; }
            public void setMaxStack(int _v) { _dirty = true; maxStack = _v; }
            public int maxLocals() { return maxLocals; }
            public void setMaxLocals(int _v) { _dirty = true; maxLocals = _v; }
            public long codeLength() { return codeLength; }
            public void setCodeLength(long _v) { _dirty = true; codeLength = _v; }
            public byte[] code() { return code; }
            public void setCode(byte[] _v) { _dirty = true; code = _v; }
            public int exceptionTableLength() { return exceptionTableLength; }
            public void setExceptionTableLength(int _v) { _dirty = true; exceptionTableLength = _v; }
            public List<ExceptionEntry> exceptionTable() { return exceptionTable; }
            public void setExceptionTable(List<ExceptionEntry> _v) { _dirty = true; exceptionTable = _v; }
            public int attributesCount() { return attributesCount; }
            public void setAttributesCount(int _v) { _dirty = true; attributesCount = _v; }
            public List<AttributeInfo> attributes() { return attributes; }
            public void setAttributes(List<AttributeInfo> _v) { _dirty = true; attributes = _v; }
            public JavaClass _root() { return _root; }
            public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
            public JavaClass.AttributeInfo _parent() { return _parent; }
            public void set_parent(JavaClass.AttributeInfo _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.5">Source</a>
         */
        public static class AttrBodyExceptions extends KaitaiStruct.ReadWrite {
            public static AttrBodyExceptions fromFile(String fileName) throws IOException {
                return new AttrBodyExceptions(new ByteBufferKaitaiStream(fileName));
            }
            public AttrBodyExceptions() {
                this(null, null, null);
            }

            public AttrBodyExceptions(KaitaiStream _io) {
                this(_io, null, null);
            }

            public AttrBodyExceptions(KaitaiStream _io, JavaClass.AttributeInfo _parent) {
                this(_io, _parent, null);
            }

            public AttrBodyExceptions(KaitaiStream _io, JavaClass.AttributeInfo _parent, JavaClass _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.numberOfExceptions = this._io.readU2be();
                this.exceptions = new ArrayList<ExceptionTableEntry>();
                for (int i = 0; i < numberOfExceptions(); i++) {
                    ExceptionTableEntry _t_exceptions = new ExceptionTableEntry(this._io, this, _root);
                    try {
                        _t_exceptions._read();
                    } finally {
                        this.exceptions.add(_t_exceptions);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.exceptions.size(); i++) {
                    this.exceptions.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.numberOfExceptions);
                for (int i = 0; i < this.exceptions.size(); i++) {
                    this.exceptions.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.exceptions.size() != numberOfExceptions())
                    throw new ConsistencyError("exceptions", numberOfExceptions(), this.exceptions.size());
                for (int i = 0; i < this.exceptions.size(); i++) {
                    if (!Objects.equals(this.exceptions.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("exceptions", _root(), this.exceptions.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.exceptions.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("exceptions", this, this.exceptions.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class ExceptionTableEntry extends KaitaiStruct.ReadWrite {
                public static ExceptionTableEntry fromFile(String fileName) throws IOException {
                    return new ExceptionTableEntry(new ByteBufferKaitaiStream(fileName));
                }
                public ExceptionTableEntry() {
                    this(null, null, null);
                }

                public ExceptionTableEntry(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ExceptionTableEntry(KaitaiStream _io, JavaClass.AttributeInfo.AttrBodyExceptions _parent) {
                    this(_io, _parent, null);
                }

                public ExceptionTableEntry(KaitaiStream _io, JavaClass.AttributeInfo.AttrBodyExceptions _parent, JavaClass _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.index = this._io.readU2be();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2be(this.index);
                }

                public void _check() {
                    _dirty = false;
                }
                private JavaClass.ClassCpInfo asInfo;
                public JavaClass.ClassCpInfo asInfo() {
                    if (this.asInfo != null)
                        return this.asInfo;
                    this.asInfo = ((JavaClass.ClassCpInfo) (_root().constantPool().get(((Number) (index() - 1)).intValue()).cpInfo()));
                    return this.asInfo;
                }
                public void _invalidateAsInfo() { this.asInfo = null; }
                private String nameAsStr;
                public String nameAsStr() {
                    if (this.nameAsStr != null)
                        return this.nameAsStr;
                    this.nameAsStr = asInfo().nameAsStr();
                    return this.nameAsStr;
                }
                public void _invalidateNameAsStr() { this.nameAsStr = null; }
                private int index;
                private JavaClass _root;
                private JavaClass.AttributeInfo.AttrBodyExceptions _parent;
                public int index() { return index; }
                public void setIndex(int _v) { _dirty = true; index = _v; }
                public JavaClass _root() { return _root; }
                public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
                public JavaClass.AttributeInfo.AttrBodyExceptions _parent() { return _parent; }
                public void set_parent(JavaClass.AttributeInfo.AttrBodyExceptions _v) { _dirty = true; _parent = _v; }
            }
            private int numberOfExceptions;
            private List<ExceptionTableEntry> exceptions;
            private JavaClass _root;
            private JavaClass.AttributeInfo _parent;
            public int numberOfExceptions() { return numberOfExceptions; }
            public void setNumberOfExceptions(int _v) { _dirty = true; numberOfExceptions = _v; }
            public List<ExceptionTableEntry> exceptions() { return exceptions; }
            public void setExceptions(List<ExceptionTableEntry> _v) { _dirty = true; exceptions = _v; }
            public JavaClass _root() { return _root; }
            public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
            public JavaClass.AttributeInfo _parent() { return _parent; }
            public void set_parent(JavaClass.AttributeInfo _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.12">Source</a>
         */
        public static class AttrBodyLineNumberTable extends KaitaiStruct.ReadWrite {
            public static AttrBodyLineNumberTable fromFile(String fileName) throws IOException {
                return new AttrBodyLineNumberTable(new ByteBufferKaitaiStream(fileName));
            }
            public AttrBodyLineNumberTable() {
                this(null, null, null);
            }

            public AttrBodyLineNumberTable(KaitaiStream _io) {
                this(_io, null, null);
            }

            public AttrBodyLineNumberTable(KaitaiStream _io, JavaClass.AttributeInfo _parent) {
                this(_io, _parent, null);
            }

            public AttrBodyLineNumberTable(KaitaiStream _io, JavaClass.AttributeInfo _parent, JavaClass _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.lineNumberTableLength = this._io.readU2be();
                this.lineNumberTable = new ArrayList<LineNumberTableEntry>();
                for (int i = 0; i < lineNumberTableLength(); i++) {
                    LineNumberTableEntry _t_lineNumberTable = new LineNumberTableEntry(this._io, this, _root);
                    try {
                        _t_lineNumberTable._read();
                    } finally {
                        this.lineNumberTable.add(_t_lineNumberTable);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.lineNumberTable.size(); i++) {
                    this.lineNumberTable.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.lineNumberTableLength);
                for (int i = 0; i < this.lineNumberTable.size(); i++) {
                    this.lineNumberTable.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.lineNumberTable.size() != lineNumberTableLength())
                    throw new ConsistencyError("line_number_table", lineNumberTableLength(), this.lineNumberTable.size());
                for (int i = 0; i < this.lineNumberTable.size(); i++) {
                    if (!Objects.equals(this.lineNumberTable.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("line_number_table", _root(), this.lineNumberTable.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.lineNumberTable.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("line_number_table", this, this.lineNumberTable.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class LineNumberTableEntry extends KaitaiStruct.ReadWrite {
                public static LineNumberTableEntry fromFile(String fileName) throws IOException {
                    return new LineNumberTableEntry(new ByteBufferKaitaiStream(fileName));
                }
                public LineNumberTableEntry() {
                    this(null, null, null);
                }

                public LineNumberTableEntry(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public LineNumberTableEntry(KaitaiStream _io, JavaClass.AttributeInfo.AttrBodyLineNumberTable _parent) {
                    this(_io, _parent, null);
                }

                public LineNumberTableEntry(KaitaiStream _io, JavaClass.AttributeInfo.AttrBodyLineNumberTable _parent, JavaClass _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.startPc = this._io.readU2be();
                    this.lineNumber = this._io.readU2be();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU2be(this.startPc);
                    this._io.writeU2be(this.lineNumber);
                }

                public void _check() {
                    _dirty = false;
                }
                private int startPc;
                private int lineNumber;
                private JavaClass _root;
                private JavaClass.AttributeInfo.AttrBodyLineNumberTable _parent;
                public int startPc() { return startPc; }
                public void setStartPc(int _v) { _dirty = true; startPc = _v; }
                public int lineNumber() { return lineNumber; }
                public void setLineNumber(int _v) { _dirty = true; lineNumber = _v; }
                public JavaClass _root() { return _root; }
                public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
                public JavaClass.AttributeInfo.AttrBodyLineNumberTable _parent() { return _parent; }
                public void set_parent(JavaClass.AttributeInfo.AttrBodyLineNumberTable _v) { _dirty = true; _parent = _v; }
            }
            private int lineNumberTableLength;
            private List<LineNumberTableEntry> lineNumberTable;
            private JavaClass _root;
            private JavaClass.AttributeInfo _parent;
            public int lineNumberTableLength() { return lineNumberTableLength; }
            public void setLineNumberTableLength(int _v) { _dirty = true; lineNumberTableLength = _v; }
            public List<LineNumberTableEntry> lineNumberTable() { return lineNumberTable; }
            public void setLineNumberTable(List<LineNumberTableEntry> _v) { _dirty = true; lineNumberTable = _v; }
            public JavaClass _root() { return _root; }
            public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
            public JavaClass.AttributeInfo _parent() { return _parent; }
            public void set_parent(JavaClass.AttributeInfo _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.10">Source</a>
         */
        public static class AttrBodySourceFile extends KaitaiStruct.ReadWrite {
            public static AttrBodySourceFile fromFile(String fileName) throws IOException {
                return new AttrBodySourceFile(new ByteBufferKaitaiStream(fileName));
            }
            public AttrBodySourceFile() {
                this(null, null, null);
            }

            public AttrBodySourceFile(KaitaiStream _io) {
                this(_io, null, null);
            }

            public AttrBodySourceFile(KaitaiStream _io, JavaClass.AttributeInfo _parent) {
                this(_io, _parent, null);
            }

            public AttrBodySourceFile(KaitaiStream _io, JavaClass.AttributeInfo _parent, JavaClass _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.sourcefileIndex = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.sourcefileIndex);
            }

            public void _check() {
                _dirty = false;
            }
            private String sourcefileAsStr;
            public String sourcefileAsStr() {
                if (this.sourcefileAsStr != null)
                    return this.sourcefileAsStr;
                this.sourcefileAsStr = ((JavaClass.Utf8CpInfo) (_root().constantPool().get(((Number) (sourcefileIndex() - 1)).intValue()).cpInfo())).value();
                return this.sourcefileAsStr;
            }
            public void _invalidateSourcefileAsStr() { this.sourcefileAsStr = null; }
            private int sourcefileIndex;
            private JavaClass _root;
            private JavaClass.AttributeInfo _parent;
            public int sourcefileIndex() { return sourcefileIndex; }
            public void setSourcefileIndex(int _v) { _dirty = true; sourcefileIndex = _v; }
            public JavaClass _root() { return _root; }
            public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
            public JavaClass.AttributeInfo _parent() { return _parent; }
            public void set_parent(JavaClass.AttributeInfo _v) { _dirty = true; _parent = _v; }
        }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = ((JavaClass.Utf8CpInfo) (_root().constantPool().get(((Number) (nameIndex() - 1)).intValue()).cpInfo())).value();
            return this.nameAsStr;
        }
        public void _invalidateNameAsStr() { this.nameAsStr = null; }
        private int nameIndex;
        private long attributeLength;
        private Object info;
        private JavaClass _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_info;
        public int nameIndex() { return nameIndex; }
        public void setNameIndex(int _v) { _dirty = true; nameIndex = _v; }
        public long attributeLength() { return attributeLength; }
        public void setAttributeLength(long _v) { _dirty = true; attributeLength = _v; }
        public Object info() { return info; }
        public void setInfo(Object _v) { _dirty = true; info = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_info() { return _raw_info; }
        public void set_raw_Info(byte[] _v) { _dirty = true; _raw_info = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.1">Source</a>
     */
    public static class ClassCpInfo extends KaitaiStruct.ReadWrite {
        public static ClassCpInfo fromFile(String fileName) throws IOException {
            return new ClassCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public ClassCpInfo() {
            this(null, null, null);
        }

        public ClassCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ClassCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public ClassCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.nameIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.nameIndex);
        }

        public void _check() {
            _dirty = false;
        }
        private JavaClass.Utf8CpInfo nameAsInfo;
        public JavaClass.Utf8CpInfo nameAsInfo() {
            if (this.nameAsInfo != null)
                return this.nameAsInfo;
            this.nameAsInfo = ((JavaClass.Utf8CpInfo) (_root().constantPool().get(((Number) (nameIndex() - 1)).intValue()).cpInfo()));
            return this.nameAsInfo;
        }
        public void _invalidateNameAsInfo() { this.nameAsInfo = null; }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = nameAsInfo().value();
            return this.nameAsStr;
        }
        public void _invalidateNameAsStr() { this.nameAsStr = null; }
        private int nameIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int nameIndex() { return nameIndex; }
        public void setNameIndex(int _v) { _dirty = true; nameIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4">Source</a>
     */
    public static class ConstantPoolEntry extends KaitaiStruct.ReadWrite {

        public enum TagEnum {
            UTF8(1),
            INTEGER(3),
            FLOAT(4),
            LONG(5),
            DOUBLE(6),
            CLASS_TYPE(7),
            STRING(8),
            FIELD_REF(9),
            METHOD_REF(10),
            INTERFACE_METHOD_REF(11),
            NAME_AND_TYPE(12),
            METHOD_HANDLE(15),
            METHOD_TYPE(16),
            DYNAMIC(17),
            INVOKE_DYNAMIC(18),
            MODULE(19),
            PACKAGE(20);

            private final long id;
            TagEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, TagEnum> byId = new HashMap<Long, TagEnum>(17);
            static {
                for (TagEnum e : TagEnum.values())
                    byId.put(e.id(), e);
            }
            public static TagEnum byId(long id) { return byId.get(id); }
        }
        public ConstantPoolEntry(boolean isPrevTwoEntries) {
            this(null, null, null, isPrevTwoEntries);
        }

        public ConstantPoolEntry(KaitaiStream _io, boolean isPrevTwoEntries) {
            this(_io, null, null, isPrevTwoEntries);
        }

        public ConstantPoolEntry(KaitaiStream _io, JavaClass _parent, boolean isPrevTwoEntries) {
            this(_io, _parent, null, isPrevTwoEntries);
        }

        public ConstantPoolEntry(KaitaiStream _io, JavaClass _parent, JavaClass _root, boolean isPrevTwoEntries) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.isPrevTwoEntries = isPrevTwoEntries;
        }
        public void _read() {
            if (!(isPrevTwoEntries())) {
                this.tag = TagEnum.byId(this._io.readU1());
            }
            if (!(isPrevTwoEntries())) {
                {
                    TagEnum on = tag();
                    if (on != null) {
                        switch (tag()) {
                        case CLASS_TYPE: {
                            this.cpInfo = new ClassCpInfo(this._io, this, _root);
                            ((ClassCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case DOUBLE: {
                            this.cpInfo = new DoubleCpInfo(this._io, this, _root);
                            ((DoubleCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case DYNAMIC: {
                            this.cpInfo = new DynamicCpInfo(this._io, this, _root);
                            ((DynamicCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case FIELD_REF: {
                            this.cpInfo = new FieldRefCpInfo(this._io, this, _root);
                            ((FieldRefCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case FLOAT: {
                            this.cpInfo = new FloatCpInfo(this._io, this, _root);
                            ((FloatCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case INTEGER: {
                            this.cpInfo = new IntegerCpInfo(this._io, this, _root);
                            ((IntegerCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case INTERFACE_METHOD_REF: {
                            this.cpInfo = new InterfaceMethodRefCpInfo(this._io, this, _root);
                            ((InterfaceMethodRefCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case INVOKE_DYNAMIC: {
                            this.cpInfo = new InvokeDynamicCpInfo(this._io, this, _root);
                            ((InvokeDynamicCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case LONG: {
                            this.cpInfo = new LongCpInfo(this._io, this, _root);
                            ((LongCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case METHOD_HANDLE: {
                            this.cpInfo = new MethodHandleCpInfo(this._io, this, _root);
                            ((MethodHandleCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case METHOD_REF: {
                            this.cpInfo = new MethodRefCpInfo(this._io, this, _root);
                            ((MethodRefCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case METHOD_TYPE: {
                            this.cpInfo = new MethodTypeCpInfo(this._io, this, _root);
                            ((MethodTypeCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case MODULE: {
                            this.cpInfo = new ModulePackageCpInfo(this._io, this, _root);
                            ((ModulePackageCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case NAME_AND_TYPE: {
                            this.cpInfo = new NameAndTypeCpInfo(this._io, this, _root);
                            ((NameAndTypeCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case PACKAGE: {
                            this.cpInfo = new ModulePackageCpInfo(this._io, this, _root);
                            ((ModulePackageCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case STRING: {
                            this.cpInfo = new StringCpInfo(this._io, this, _root);
                            ((StringCpInfo) (this.cpInfo))._read();
                            break;
                        }
                        case UTF8: {
                            this.cpInfo = new Utf8CpInfo(this._io, this, _root);
                            ((Utf8CpInfo) (this.cpInfo))._read();
                            break;
                        }
                        }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (!(isPrevTwoEntries())) {
            }
            if (!(isPrevTwoEntries())) {
                {
                    TagEnum on = tag();
                    if (on != null) {
                        switch (tag()) {
                        case CLASS_TYPE: {
                            ((ClassCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case DOUBLE: {
                            ((DoubleCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case DYNAMIC: {
                            ((DynamicCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case FIELD_REF: {
                            ((FieldRefCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case FLOAT: {
                            ((FloatCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case INTEGER: {
                            ((IntegerCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case INTERFACE_METHOD_REF: {
                            ((InterfaceMethodRefCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case INVOKE_DYNAMIC: {
                            ((InvokeDynamicCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case LONG: {
                            ((LongCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case METHOD_HANDLE: {
                            ((MethodHandleCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case METHOD_REF: {
                            ((MethodRefCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case METHOD_TYPE: {
                            ((MethodTypeCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case MODULE: {
                            ((ModulePackageCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case NAME_AND_TYPE: {
                            ((NameAndTypeCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case PACKAGE: {
                            ((ModulePackageCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case STRING: {
                            ((StringCpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        case UTF8: {
                            ((Utf8CpInfo) (this.cpInfo))._fetchInstances();
                            break;
                        }
                        }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (!(isPrevTwoEntries())) {
                this._io.writeU1(((Number) (this.tag.id())).intValue());
            }
            if (!(isPrevTwoEntries())) {
                {
                    TagEnum on = tag();
                    if (on != null) {
                        switch (tag()) {
                        case CLASS_TYPE: {
                            ((ClassCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case DOUBLE: {
                            ((DoubleCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case DYNAMIC: {
                            ((DynamicCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case FIELD_REF: {
                            ((FieldRefCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case FLOAT: {
                            ((FloatCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case INTEGER: {
                            ((IntegerCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case INTERFACE_METHOD_REF: {
                            ((InterfaceMethodRefCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case INVOKE_DYNAMIC: {
                            ((InvokeDynamicCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case LONG: {
                            ((LongCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case METHOD_HANDLE: {
                            ((MethodHandleCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case METHOD_REF: {
                            ((MethodRefCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case METHOD_TYPE: {
                            ((MethodTypeCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case MODULE: {
                            ((ModulePackageCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case NAME_AND_TYPE: {
                            ((NameAndTypeCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case PACKAGE: {
                            ((ModulePackageCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case STRING: {
                            ((StringCpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        case UTF8: {
                            ((Utf8CpInfo) (this.cpInfo))._write_Seq(this._io);
                            break;
                        }
                        }
                    }
                }
            }
        }

        public void _check() {
            if (!(isPrevTwoEntries())) {
            }
            if (!(isPrevTwoEntries())) {
                {
                    TagEnum on = tag();
                    if (on != null) {
                        switch (tag()) {
                        case CLASS_TYPE: {
                            if (!Objects.equals(((JavaClass.ClassCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.ClassCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.ClassCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.ClassCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case DOUBLE: {
                            if (!Objects.equals(((JavaClass.DoubleCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.DoubleCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.DoubleCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.DoubleCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case DYNAMIC: {
                            if (!Objects.equals(((JavaClass.DynamicCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.DynamicCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.DynamicCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.DynamicCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case FIELD_REF: {
                            if (!Objects.equals(((JavaClass.FieldRefCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.FieldRefCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.FieldRefCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.FieldRefCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case FLOAT: {
                            if (!Objects.equals(((JavaClass.FloatCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.FloatCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.FloatCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.FloatCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case INTEGER: {
                            if (!Objects.equals(((JavaClass.IntegerCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.IntegerCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.IntegerCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.IntegerCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case INTERFACE_METHOD_REF: {
                            if (!Objects.equals(((JavaClass.InterfaceMethodRefCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.InterfaceMethodRefCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.InterfaceMethodRefCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.InterfaceMethodRefCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case INVOKE_DYNAMIC: {
                            if (!Objects.equals(((JavaClass.InvokeDynamicCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.InvokeDynamicCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.InvokeDynamicCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.InvokeDynamicCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case LONG: {
                            if (!Objects.equals(((JavaClass.LongCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.LongCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.LongCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.LongCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case METHOD_HANDLE: {
                            if (!Objects.equals(((JavaClass.MethodHandleCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.MethodHandleCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.MethodHandleCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.MethodHandleCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case METHOD_REF: {
                            if (!Objects.equals(((JavaClass.MethodRefCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.MethodRefCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.MethodRefCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.MethodRefCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case METHOD_TYPE: {
                            if (!Objects.equals(((JavaClass.MethodTypeCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.MethodTypeCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.MethodTypeCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.MethodTypeCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case MODULE: {
                            if (!Objects.equals(((JavaClass.ModulePackageCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.ModulePackageCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.ModulePackageCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.ModulePackageCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case NAME_AND_TYPE: {
                            if (!Objects.equals(((JavaClass.NameAndTypeCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.NameAndTypeCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.NameAndTypeCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.NameAndTypeCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case PACKAGE: {
                            if (!Objects.equals(((JavaClass.ModulePackageCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.ModulePackageCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.ModulePackageCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.ModulePackageCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case STRING: {
                            if (!Objects.equals(((JavaClass.StringCpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.StringCpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.StringCpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.StringCpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        case UTF8: {
                            if (!Objects.equals(((JavaClass.Utf8CpInfo) (this.cpInfo))._root(), _root()))
                                throw new ConsistencyError("cp_info", _root(), ((JavaClass.Utf8CpInfo) (this.cpInfo))._root());
                            if (!Objects.equals(((JavaClass.Utf8CpInfo) (this.cpInfo))._parent(), this))
                                throw new ConsistencyError("cp_info", this, ((JavaClass.Utf8CpInfo) (this.cpInfo))._parent());
                            break;
                        }
                        }
                    }
                }
            }
            _dirty = false;
        }
        private Boolean isTwoEntries;
        public Boolean isTwoEntries() {
            if (this.isTwoEntries != null)
                return this.isTwoEntries;
            this.isTwoEntries = (isPrevTwoEntries() ? false :  ((tag() == TagEnum.LONG) || (tag() == TagEnum.DOUBLE)) );
            return this.isTwoEntries;
        }
        public void _invalidateIsTwoEntries() { this.isTwoEntries = null; }
        private TagEnum tag;
        private KaitaiStruct.ReadWrite cpInfo;
        private boolean isPrevTwoEntries;
        private JavaClass _root;
        private JavaClass _parent;
        public TagEnum tag() { return tag; }
        public void setTag(TagEnum _v) { _dirty = true; tag = _v; }
        public KaitaiStruct.ReadWrite cpInfo() { return cpInfo; }
        public void setCpInfo(KaitaiStruct.ReadWrite _v) { _dirty = true; cpInfo = _v; }
        public boolean isPrevTwoEntries() { return isPrevTwoEntries; }
        public void setIsPrevTwoEntries(boolean _v) { _dirty = true; isPrevTwoEntries = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass _parent() { return _parent; }
        public void set_parent(JavaClass _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6">Source</a>
     */
    public static class DoubleCpInfo extends KaitaiStruct.ReadWrite {
        public static DoubleCpInfo fromFile(String fileName) throws IOException {
            return new DoubleCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public DoubleCpInfo() {
            this(null, null, null);
        }

        public DoubleCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DoubleCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public DoubleCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.value = this._io.readF8be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF8be(this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private double value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public double value() { return value; }
        public void setValue(double _v) { _dirty = true; value = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.10">Source</a>
     */
    public static class DynamicCpInfo extends KaitaiStruct.ReadWrite {
        public static DynamicCpInfo fromFile(String fileName) throws IOException {
            return new DynamicCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public DynamicCpInfo() {
            this(null, null, null);
        }

        public DynamicCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DynamicCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public DynamicCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._unnamed0 = new VersionGuard(this._io, this, _root, 55);
            this._unnamed0._read();
            this.bootstrapMethodAttrIndex = this._io.readU2be();
            this.nameAndTypeIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this._unnamed0._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._unnamed0._write_Seq(this._io);
            this._io.writeU2be(this.bootstrapMethodAttrIndex);
            this._io.writeU2be(this.nameAndTypeIndex);
        }

        public void _check() {
            if (!Objects.equals(this._unnamed0._root(), _root()))
                throw new ConsistencyError("_unnamed0", _root(), this._unnamed0._root());
            if (!Objects.equals(this._unnamed0._parent(), this))
                throw new ConsistencyError("_unnamed0", this, this._unnamed0._parent());
            if (this._unnamed0.major() != 55)
                throw new ConsistencyError("_unnamed0", 55, this._unnamed0.major());
            _dirty = false;
        }
        private VersionGuard _unnamed0;
        private int bootstrapMethodAttrIndex;
        private int nameAndTypeIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public VersionGuard _unnamed0() { return _unnamed0; }
        public void set_unnamed0(VersionGuard _v) { _dirty = true; _unnamed0 = _v; }
        public int bootstrapMethodAttrIndex() { return bootstrapMethodAttrIndex; }
        public void setBootstrapMethodAttrIndex(int _v) { _dirty = true; bootstrapMethodAttrIndex = _v; }
        public int nameAndTypeIndex() { return nameAndTypeIndex; }
        public void setNameAndTypeIndex(int _v) { _dirty = true; nameAndTypeIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.5">Source</a>
     */
    public static class FieldInfo extends KaitaiStruct.ReadWrite {
        public static FieldInfo fromFile(String fileName) throws IOException {
            return new FieldInfo(new ByteBufferKaitaiStream(fileName));
        }
        public FieldInfo() {
            this(null, null, null);
        }

        public FieldInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FieldInfo(KaitaiStream _io, JavaClass _parent) {
            this(_io, _parent, null);
        }

        public FieldInfo(KaitaiStream _io, JavaClass _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.accessFlags = this._io.readU2be();
            this.nameIndex = this._io.readU2be();
            this.descriptorIndex = this._io.readU2be();
            this.attributesCount = this._io.readU2be();
            this.attributes = new ArrayList<AttributeInfo>();
            for (int i = 0; i < attributesCount(); i++) {
                AttributeInfo _t_attributes = new AttributeInfo(this._io, this, _root);
                try {
                    _t_attributes._read();
                } finally {
                    this.attributes.add(_t_attributes);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.attributes.size(); i++) {
                this.attributes.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.accessFlags);
            this._io.writeU2be(this.nameIndex);
            this._io.writeU2be(this.descriptorIndex);
            this._io.writeU2be(this.attributesCount);
            for (int i = 0; i < this.attributes.size(); i++) {
                this.attributes.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.attributes.size() != attributesCount())
                throw new ConsistencyError("attributes", attributesCount(), this.attributes.size());
            for (int i = 0; i < this.attributes.size(); i++) {
                if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("attributes", _root(), this.attributes.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("attributes", this, this.attributes.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = ((JavaClass.Utf8CpInfo) (_root().constantPool().get(((Number) (nameIndex() - 1)).intValue()).cpInfo())).value();
            return this.nameAsStr;
        }
        public void _invalidateNameAsStr() { this.nameAsStr = null; }
        private int accessFlags;
        private int nameIndex;
        private int descriptorIndex;
        private int attributesCount;
        private List<AttributeInfo> attributes;
        private JavaClass _root;
        private JavaClass _parent;
        public int accessFlags() { return accessFlags; }
        public void setAccessFlags(int _v) { _dirty = true; accessFlags = _v; }
        public int nameIndex() { return nameIndex; }
        public void setNameIndex(int _v) { _dirty = true; nameIndex = _v; }
        public int descriptorIndex() { return descriptorIndex; }
        public void setDescriptorIndex(int _v) { _dirty = true; descriptorIndex = _v; }
        public int attributesCount() { return attributesCount; }
        public void setAttributesCount(int _v) { _dirty = true; attributesCount = _v; }
        public List<AttributeInfo> attributes() { return attributes; }
        public void setAttributes(List<AttributeInfo> _v) { _dirty = true; attributes = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass _parent() { return _parent; }
        public void set_parent(JavaClass _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2">Source</a>
     */
    public static class FieldRefCpInfo extends KaitaiStruct.ReadWrite {
        public static FieldRefCpInfo fromFile(String fileName) throws IOException {
            return new FieldRefCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public FieldRefCpInfo() {
            this(null, null, null);
        }

        public FieldRefCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FieldRefCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public FieldRefCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.classIndex = this._io.readU2be();
            this.nameAndTypeIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.classIndex);
            this._io.writeU2be(this.nameAndTypeIndex);
        }

        public void _check() {
            _dirty = false;
        }
        private JavaClass.ClassCpInfo classAsInfo;
        public JavaClass.ClassCpInfo classAsInfo() {
            if (this.classAsInfo != null)
                return this.classAsInfo;
            this.classAsInfo = ((JavaClass.ClassCpInfo) (_root().constantPool().get(((Number) (classIndex() - 1)).intValue()).cpInfo()));
            return this.classAsInfo;
        }
        public void _invalidateClassAsInfo() { this.classAsInfo = null; }
        private JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo;
        public JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo() {
            if (this.nameAndTypeAsInfo != null)
                return this.nameAndTypeAsInfo;
            this.nameAndTypeAsInfo = ((JavaClass.NameAndTypeCpInfo) (_root().constantPool().get(((Number) (nameAndTypeIndex() - 1)).intValue()).cpInfo()));
            return this.nameAndTypeAsInfo;
        }
        public void _invalidateNameAndTypeAsInfo() { this.nameAndTypeAsInfo = null; }
        private int classIndex;
        private int nameAndTypeIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int classIndex() { return classIndex; }
        public void setClassIndex(int _v) { _dirty = true; classIndex = _v; }
        public int nameAndTypeIndex() { return nameAndTypeIndex; }
        public void setNameAndTypeIndex(int _v) { _dirty = true; nameAndTypeIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5">Source</a>
     */
    public static class FloatCpInfo extends KaitaiStruct.ReadWrite {
        public static FloatCpInfo fromFile(String fileName) throws IOException {
            return new FloatCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public FloatCpInfo() {
            this(null, null, null);
        }

        public FloatCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FloatCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public FloatCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.value = this._io.readF4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeF4be(this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private float value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public float value() { return value; }
        public void setValue(float _v) { _dirty = true; value = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.4">Source</a>
     */
    public static class IntegerCpInfo extends KaitaiStruct.ReadWrite {
        public static IntegerCpInfo fromFile(String fileName) throws IOException {
            return new IntegerCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public IntegerCpInfo() {
            this(null, null, null);
        }

        public IntegerCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IntegerCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public IntegerCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.value = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private long value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2">Source</a>
     */
    public static class InterfaceMethodRefCpInfo extends KaitaiStruct.ReadWrite {
        public static InterfaceMethodRefCpInfo fromFile(String fileName) throws IOException {
            return new InterfaceMethodRefCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public InterfaceMethodRefCpInfo() {
            this(null, null, null);
        }

        public InterfaceMethodRefCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InterfaceMethodRefCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public InterfaceMethodRefCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.classIndex = this._io.readU2be();
            this.nameAndTypeIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.classIndex);
            this._io.writeU2be(this.nameAndTypeIndex);
        }

        public void _check() {
            _dirty = false;
        }
        private JavaClass.ClassCpInfo classAsInfo;
        public JavaClass.ClassCpInfo classAsInfo() {
            if (this.classAsInfo != null)
                return this.classAsInfo;
            this.classAsInfo = ((JavaClass.ClassCpInfo) (_root().constantPool().get(((Number) (classIndex() - 1)).intValue()).cpInfo()));
            return this.classAsInfo;
        }
        public void _invalidateClassAsInfo() { this.classAsInfo = null; }
        private JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo;
        public JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo() {
            if (this.nameAndTypeAsInfo != null)
                return this.nameAndTypeAsInfo;
            this.nameAndTypeAsInfo = ((JavaClass.NameAndTypeCpInfo) (_root().constantPool().get(((Number) (nameAndTypeIndex() - 1)).intValue()).cpInfo()));
            return this.nameAndTypeAsInfo;
        }
        public void _invalidateNameAndTypeAsInfo() { this.nameAndTypeAsInfo = null; }
        private int classIndex;
        private int nameAndTypeIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int classIndex() { return classIndex; }
        public void setClassIndex(int _v) { _dirty = true; classIndex = _v; }
        public int nameAndTypeIndex() { return nameAndTypeIndex; }
        public void setNameAndTypeIndex(int _v) { _dirty = true; nameAndTypeIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.10">Source</a>
     */
    public static class InvokeDynamicCpInfo extends KaitaiStruct.ReadWrite {
        public static InvokeDynamicCpInfo fromFile(String fileName) throws IOException {
            return new InvokeDynamicCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public InvokeDynamicCpInfo() {
            this(null, null, null);
        }

        public InvokeDynamicCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InvokeDynamicCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public InvokeDynamicCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._unnamed0 = new VersionGuard(this._io, this, _root, 51);
            this._unnamed0._read();
            this.bootstrapMethodAttrIndex = this._io.readU2be();
            this.nameAndTypeIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this._unnamed0._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._unnamed0._write_Seq(this._io);
            this._io.writeU2be(this.bootstrapMethodAttrIndex);
            this._io.writeU2be(this.nameAndTypeIndex);
        }

        public void _check() {
            if (!Objects.equals(this._unnamed0._root(), _root()))
                throw new ConsistencyError("_unnamed0", _root(), this._unnamed0._root());
            if (!Objects.equals(this._unnamed0._parent(), this))
                throw new ConsistencyError("_unnamed0", this, this._unnamed0._parent());
            if (this._unnamed0.major() != 51)
                throw new ConsistencyError("_unnamed0", 51, this._unnamed0.major());
            _dirty = false;
        }
        private VersionGuard _unnamed0;
        private int bootstrapMethodAttrIndex;
        private int nameAndTypeIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public VersionGuard _unnamed0() { return _unnamed0; }
        public void set_unnamed0(VersionGuard _v) { _dirty = true; _unnamed0 = _v; }
        public int bootstrapMethodAttrIndex() { return bootstrapMethodAttrIndex; }
        public void setBootstrapMethodAttrIndex(int _v) { _dirty = true; bootstrapMethodAttrIndex = _v; }
        public int nameAndTypeIndex() { return nameAndTypeIndex; }
        public void setNameAndTypeIndex(int _v) { _dirty = true; nameAndTypeIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5">Source</a>
     */
    public static class LongCpInfo extends KaitaiStruct.ReadWrite {
        public static LongCpInfo fromFile(String fileName) throws IOException {
            return new LongCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public LongCpInfo() {
            this(null, null, null);
        }

        public LongCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LongCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public LongCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.value = this._io.readU8be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8be(this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private long value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.8">Source</a>
     */
    public static class MethodHandleCpInfo extends KaitaiStruct.ReadWrite {
        public static MethodHandleCpInfo fromFile(String fileName) throws IOException {
            return new MethodHandleCpInfo(new ByteBufferKaitaiStream(fileName));
        }

        public enum ReferenceKindEnum {
            GET_FIELD(1),
            GET_STATIC(2),
            PUT_FIELD(3),
            PUT_STATIC(4),
            INVOKE_VIRTUAL(5),
            INVOKE_STATIC(6),
            INVOKE_SPECIAL(7),
            NEW_INVOKE_SPECIAL(8),
            INVOKE_INTERFACE(9);

            private final long id;
            ReferenceKindEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ReferenceKindEnum> byId = new HashMap<Long, ReferenceKindEnum>(9);
            static {
                for (ReferenceKindEnum e : ReferenceKindEnum.values())
                    byId.put(e.id(), e);
            }
            public static ReferenceKindEnum byId(long id) { return byId.get(id); }
        }
        public MethodHandleCpInfo() {
            this(null, null, null);
        }

        public MethodHandleCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MethodHandleCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public MethodHandleCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._unnamed0 = new VersionGuard(this._io, this, _root, 51);
            this._unnamed0._read();
            this.referenceKind = ReferenceKindEnum.byId(this._io.readU1());
            this.referenceIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this._unnamed0._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._unnamed0._write_Seq(this._io);
            this._io.writeU1(((Number) (this.referenceKind.id())).intValue());
            this._io.writeU2be(this.referenceIndex);
        }

        public void _check() {
            if (!Objects.equals(this._unnamed0._root(), _root()))
                throw new ConsistencyError("_unnamed0", _root(), this._unnamed0._root());
            if (!Objects.equals(this._unnamed0._parent(), this))
                throw new ConsistencyError("_unnamed0", this, this._unnamed0._parent());
            if (this._unnamed0.major() != 51)
                throw new ConsistencyError("_unnamed0", 51, this._unnamed0.major());
            _dirty = false;
        }
        private VersionGuard _unnamed0;
        private ReferenceKindEnum referenceKind;
        private int referenceIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public VersionGuard _unnamed0() { return _unnamed0; }
        public void set_unnamed0(VersionGuard _v) { _dirty = true; _unnamed0 = _v; }
        public ReferenceKindEnum referenceKind() { return referenceKind; }
        public void setReferenceKind(ReferenceKindEnum _v) { _dirty = true; referenceKind = _v; }
        public int referenceIndex() { return referenceIndex; }
        public void setReferenceIndex(int _v) { _dirty = true; referenceIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.6">Source</a>
     */
    public static class MethodInfo extends KaitaiStruct.ReadWrite {
        public static MethodInfo fromFile(String fileName) throws IOException {
            return new MethodInfo(new ByteBufferKaitaiStream(fileName));
        }
        public MethodInfo() {
            this(null, null, null);
        }

        public MethodInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MethodInfo(KaitaiStream _io, JavaClass _parent) {
            this(_io, _parent, null);
        }

        public MethodInfo(KaitaiStream _io, JavaClass _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.accessFlags = this._io.readU2be();
            this.nameIndex = this._io.readU2be();
            this.descriptorIndex = this._io.readU2be();
            this.attributesCount = this._io.readU2be();
            this.attributes = new ArrayList<AttributeInfo>();
            for (int i = 0; i < attributesCount(); i++) {
                AttributeInfo _t_attributes = new AttributeInfo(this._io, this, _root);
                try {
                    _t_attributes._read();
                } finally {
                    this.attributes.add(_t_attributes);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.attributes.size(); i++) {
                this.attributes.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.accessFlags);
            this._io.writeU2be(this.nameIndex);
            this._io.writeU2be(this.descriptorIndex);
            this._io.writeU2be(this.attributesCount);
            for (int i = 0; i < this.attributes.size(); i++) {
                this.attributes.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.attributes.size() != attributesCount())
                throw new ConsistencyError("attributes", attributesCount(), this.attributes.size());
            for (int i = 0; i < this.attributes.size(); i++) {
                if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("attributes", _root(), this.attributes.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.attributes.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("attributes", this, this.attributes.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = ((JavaClass.Utf8CpInfo) (_root().constantPool().get(((Number) (nameIndex() - 1)).intValue()).cpInfo())).value();
            return this.nameAsStr;
        }
        public void _invalidateNameAsStr() { this.nameAsStr = null; }
        private int accessFlags;
        private int nameIndex;
        private int descriptorIndex;
        private int attributesCount;
        private List<AttributeInfo> attributes;
        private JavaClass _root;
        private JavaClass _parent;
        public int accessFlags() { return accessFlags; }
        public void setAccessFlags(int _v) { _dirty = true; accessFlags = _v; }
        public int nameIndex() { return nameIndex; }
        public void setNameIndex(int _v) { _dirty = true; nameIndex = _v; }
        public int descriptorIndex() { return descriptorIndex; }
        public void setDescriptorIndex(int _v) { _dirty = true; descriptorIndex = _v; }
        public int attributesCount() { return attributesCount; }
        public void setAttributesCount(int _v) { _dirty = true; attributesCount = _v; }
        public List<AttributeInfo> attributes() { return attributes; }
        public void setAttributes(List<AttributeInfo> _v) { _dirty = true; attributes = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass _parent() { return _parent; }
        public void set_parent(JavaClass _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2">Source</a>
     */
    public static class MethodRefCpInfo extends KaitaiStruct.ReadWrite {
        public static MethodRefCpInfo fromFile(String fileName) throws IOException {
            return new MethodRefCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public MethodRefCpInfo() {
            this(null, null, null);
        }

        public MethodRefCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MethodRefCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public MethodRefCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.classIndex = this._io.readU2be();
            this.nameAndTypeIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.classIndex);
            this._io.writeU2be(this.nameAndTypeIndex);
        }

        public void _check() {
            _dirty = false;
        }
        private JavaClass.ClassCpInfo classAsInfo;
        public JavaClass.ClassCpInfo classAsInfo() {
            if (this.classAsInfo != null)
                return this.classAsInfo;
            this.classAsInfo = ((JavaClass.ClassCpInfo) (_root().constantPool().get(((Number) (classIndex() - 1)).intValue()).cpInfo()));
            return this.classAsInfo;
        }
        public void _invalidateClassAsInfo() { this.classAsInfo = null; }
        private JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo;
        public JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo() {
            if (this.nameAndTypeAsInfo != null)
                return this.nameAndTypeAsInfo;
            this.nameAndTypeAsInfo = ((JavaClass.NameAndTypeCpInfo) (_root().constantPool().get(((Number) (nameAndTypeIndex() - 1)).intValue()).cpInfo()));
            return this.nameAndTypeAsInfo;
        }
        public void _invalidateNameAndTypeAsInfo() { this.nameAndTypeAsInfo = null; }
        private int classIndex;
        private int nameAndTypeIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int classIndex() { return classIndex; }
        public void setClassIndex(int _v) { _dirty = true; classIndex = _v; }
        public int nameAndTypeIndex() { return nameAndTypeIndex; }
        public void setNameAndTypeIndex(int _v) { _dirty = true; nameAndTypeIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.9">Source</a>
     */
    public static class MethodTypeCpInfo extends KaitaiStruct.ReadWrite {
        public static MethodTypeCpInfo fromFile(String fileName) throws IOException {
            return new MethodTypeCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public MethodTypeCpInfo() {
            this(null, null, null);
        }

        public MethodTypeCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MethodTypeCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public MethodTypeCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._unnamed0 = new VersionGuard(this._io, this, _root, 51);
            this._unnamed0._read();
            this.descriptorIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this._unnamed0._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._unnamed0._write_Seq(this._io);
            this._io.writeU2be(this.descriptorIndex);
        }

        public void _check() {
            if (!Objects.equals(this._unnamed0._root(), _root()))
                throw new ConsistencyError("_unnamed0", _root(), this._unnamed0._root());
            if (!Objects.equals(this._unnamed0._parent(), this))
                throw new ConsistencyError("_unnamed0", this, this._unnamed0._parent());
            if (this._unnamed0.major() != 51)
                throw new ConsistencyError("_unnamed0", 51, this._unnamed0.major());
            _dirty = false;
        }
        private VersionGuard _unnamed0;
        private int descriptorIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public VersionGuard _unnamed0() { return _unnamed0; }
        public void set_unnamed0(VersionGuard _v) { _dirty = true; _unnamed0 = _v; }
        public int descriptorIndex() { return descriptorIndex; }
        public void setDescriptorIndex(int _v) { _dirty = true; descriptorIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Project Jigsaw modules introduced in Java 9
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-3.html#jvms-3.16">Source</a>
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.11">Source</a>
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.12">Source</a>
     */
    public static class ModulePackageCpInfo extends KaitaiStruct.ReadWrite {
        public static ModulePackageCpInfo fromFile(String fileName) throws IOException {
            return new ModulePackageCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public ModulePackageCpInfo() {
            this(null, null, null);
        }

        public ModulePackageCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ModulePackageCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public ModulePackageCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._unnamed0 = new VersionGuard(this._io, this, _root, 53);
            this._unnamed0._read();
            this.nameIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this._unnamed0._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._unnamed0._write_Seq(this._io);
            this._io.writeU2be(this.nameIndex);
        }

        public void _check() {
            if (!Objects.equals(this._unnamed0._root(), _root()))
                throw new ConsistencyError("_unnamed0", _root(), this._unnamed0._root());
            if (!Objects.equals(this._unnamed0._parent(), this))
                throw new ConsistencyError("_unnamed0", this, this._unnamed0._parent());
            if (this._unnamed0.major() != 53)
                throw new ConsistencyError("_unnamed0", 53, this._unnamed0.major());
            _dirty = false;
        }
        private JavaClass.Utf8CpInfo nameAsInfo;
        public JavaClass.Utf8CpInfo nameAsInfo() {
            if (this.nameAsInfo != null)
                return this.nameAsInfo;
            this.nameAsInfo = ((JavaClass.Utf8CpInfo) (_root().constantPool().get(((Number) (nameIndex() - 1)).intValue()).cpInfo()));
            return this.nameAsInfo;
        }
        public void _invalidateNameAsInfo() { this.nameAsInfo = null; }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = nameAsInfo().value();
            return this.nameAsStr;
        }
        public void _invalidateNameAsStr() { this.nameAsStr = null; }
        private VersionGuard _unnamed0;
        private int nameIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public VersionGuard _unnamed0() { return _unnamed0; }
        public void set_unnamed0(VersionGuard _v) { _dirty = true; _unnamed0 = _v; }
        public int nameIndex() { return nameIndex; }
        public void setNameIndex(int _v) { _dirty = true; nameIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6">Source</a>
     */
    public static class NameAndTypeCpInfo extends KaitaiStruct.ReadWrite {
        public static NameAndTypeCpInfo fromFile(String fileName) throws IOException {
            return new NameAndTypeCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public NameAndTypeCpInfo() {
            this(null, null, null);
        }

        public NameAndTypeCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NameAndTypeCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public NameAndTypeCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.nameIndex = this._io.readU2be();
            this.descriptorIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.nameIndex);
            this._io.writeU2be(this.descriptorIndex);
        }

        public void _check() {
            _dirty = false;
        }
        private JavaClass.Utf8CpInfo descriptorAsInfo;
        public JavaClass.Utf8CpInfo descriptorAsInfo() {
            if (this.descriptorAsInfo != null)
                return this.descriptorAsInfo;
            this.descriptorAsInfo = ((JavaClass.Utf8CpInfo) (_root().constantPool().get(((Number) (descriptorIndex() - 1)).intValue()).cpInfo()));
            return this.descriptorAsInfo;
        }
        public void _invalidateDescriptorAsInfo() { this.descriptorAsInfo = null; }
        private String descriptorAsStr;
        public String descriptorAsStr() {
            if (this.descriptorAsStr != null)
                return this.descriptorAsStr;
            this.descriptorAsStr = descriptorAsInfo().value();
            return this.descriptorAsStr;
        }
        public void _invalidateDescriptorAsStr() { this.descriptorAsStr = null; }
        private JavaClass.Utf8CpInfo nameAsInfo;
        public JavaClass.Utf8CpInfo nameAsInfo() {
            if (this.nameAsInfo != null)
                return this.nameAsInfo;
            this.nameAsInfo = ((JavaClass.Utf8CpInfo) (_root().constantPool().get(((Number) (nameIndex() - 1)).intValue()).cpInfo()));
            return this.nameAsInfo;
        }
        public void _invalidateNameAsInfo() { this.nameAsInfo = null; }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = nameAsInfo().value();
            return this.nameAsStr;
        }
        public void _invalidateNameAsStr() { this.nameAsStr = null; }
        private int nameIndex;
        private int descriptorIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int nameIndex() { return nameIndex; }
        public void setNameIndex(int _v) { _dirty = true; nameIndex = _v; }
        public int descriptorIndex() { return descriptorIndex; }
        public void setDescriptorIndex(int _v) { _dirty = true; descriptorIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.3">Source</a>
     */
    public static class StringCpInfo extends KaitaiStruct.ReadWrite {
        public static StringCpInfo fromFile(String fileName) throws IOException {
            return new StringCpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public StringCpInfo() {
            this(null, null, null);
        }

        public StringCpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StringCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public StringCpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.stringIndex = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.stringIndex);
        }

        public void _check() {
            _dirty = false;
        }
        private int stringIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int stringIndex() { return stringIndex; }
        public void setStringIndex(int _v) { _dirty = true; stringIndex = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.7">Source</a>
     */
    public static class Utf8CpInfo extends KaitaiStruct.ReadWrite {
        public static Utf8CpInfo fromFile(String fileName) throws IOException {
            return new Utf8CpInfo(new ByteBufferKaitaiStream(fileName));
        }
        public Utf8CpInfo() {
            this(null, null, null);
        }

        public Utf8CpInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Utf8CpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent) {
            this(_io, _parent, null);
        }

        public Utf8CpInfo(KaitaiStream _io, JavaClass.ConstantPoolEntry _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.strLen = this._io.readU2be();
            this.value = new String(this._io.readBytes(strLen()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.strLen);
            this._io.writeBytes((this.value).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.value).getBytes(Charset.forName("UTF-8")).length != strLen())
                throw new ConsistencyError("value", strLen(), (this.value).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private int strLen;
        private String value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int strLen() { return strLen; }
        public void setStrLen(int _v) { _dirty = true; strLen = _v; }
        public String value() { return value; }
        public void setValue(String _v) { _dirty = true; value = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
        public void set_parent(JavaClass.ConstantPoolEntry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * `class` file format version 45.3 (appeared in the very first publicly
     * known release of Java SE AND JDK 1.0.2, released 23th January 1996) is so
     * ancient that it's taken for granted. Earlier formats seem to be
     * undocumented. Changes of `version_minor` don't change `class` format.
     * Earlier `version_major`s likely belong to Oak programming language, the
     * proprietary predecessor of Java.
     * @see "James Gosling, Bill Joy and Guy Steele. The Java Language Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Aug. 1996, p. 825. ISBN: 0-201-63451-1."
     * @see "Frank Yellin and Tim Lindholm. The Java Virtual Machine Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Sept. 1996, p. 475. ISBN: 0-201-63452-X."
     */
    public static class VersionGuard extends KaitaiStruct.ReadWrite {
        public VersionGuard(int major) {
            this(null, null, null, major);
        }

        public VersionGuard(KaitaiStream _io, int major) {
            this(_io, null, null, major);
        }

        public VersionGuard(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, int major) {
            this(_io, _parent, null, major);
        }

        public VersionGuard(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, JavaClass _root, int major) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.major = major;
        }
        public void _read() {
            this._unnamed0 = this._io.readBytes(0);
            {
                byte[] _it = this._unnamed0;
                if (!(_root().versionMajor() >= major())) {
                    throw new KaitaiStream.ValidationExprError(this._unnamed0, this._io, "/types/version_guard/seq/0");
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this._unnamed0);
        }

        public void _check() {
            if (this._unnamed0.length != 0)
                throw new ConsistencyError("_unnamed0", 0, this._unnamed0.length);
            {
                byte[] _it = this._unnamed0;
                if (!(_root().versionMajor() >= major())) {
                    throw new KaitaiStream.ValidationExprError(this._unnamed0, null, "/types/version_guard/seq/0");
                }
            }
            _dirty = false;
        }
        private byte[] _unnamed0;
        private int major;
        private JavaClass _root;
        private KaitaiStruct.ReadWrite _parent;
        public byte[] _unnamed0() { return _unnamed0; }
        public void set_unnamed0(byte[] _v) { _dirty = true; _unnamed0 = _v; }
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public JavaClass _root() { return _root; }
        public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private int versionMinor;
    private int versionMajor;
    private int constantPoolCount;
    private List<ConstantPoolEntry> constantPool;
    private int accessFlags;
    private int thisClass;
    private int superClass;
    private int interfacesCount;
    private List<Integer> interfaces;
    private int fieldsCount;
    private List<FieldInfo> fields;
    private int methodsCount;
    private List<MethodInfo> methods;
    private int attributesCount;
    private List<AttributeInfo> attributes;
    private JavaClass _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public int versionMinor() { return versionMinor; }
    public void setVersionMinor(int _v) { _dirty = true; versionMinor = _v; }
    public int versionMajor() { return versionMajor; }
    public void setVersionMajor(int _v) { _dirty = true; versionMajor = _v; }
    public int constantPoolCount() { return constantPoolCount; }
    public void setConstantPoolCount(int _v) { _dirty = true; constantPoolCount = _v; }
    public List<ConstantPoolEntry> constantPool() { return constantPool; }
    public void setConstantPool(List<ConstantPoolEntry> _v) { _dirty = true; constantPool = _v; }
    public int accessFlags() { return accessFlags; }
    public void setAccessFlags(int _v) { _dirty = true; accessFlags = _v; }
    public int thisClass() { return thisClass; }
    public void setThisClass(int _v) { _dirty = true; thisClass = _v; }
    public int superClass() { return superClass; }
    public void setSuperClass(int _v) { _dirty = true; superClass = _v; }
    public int interfacesCount() { return interfacesCount; }
    public void setInterfacesCount(int _v) { _dirty = true; interfacesCount = _v; }
    public List<Integer> interfaces() { return interfaces; }
    public void setInterfaces(List<Integer> _v) { _dirty = true; interfaces = _v; }
    public int fieldsCount() { return fieldsCount; }
    public void setFieldsCount(int _v) { _dirty = true; fieldsCount = _v; }
    public List<FieldInfo> fields() { return fields; }
    public void setFields(List<FieldInfo> _v) { _dirty = true; fields = _v; }
    public int methodsCount() { return methodsCount; }
    public void setMethodsCount(int _v) { _dirty = true; methodsCount = _v; }
    public List<MethodInfo> methods() { return methods; }
    public void setMethods(List<MethodInfo> _v) { _dirty = true; methods = _v; }
    public int attributesCount() { return attributesCount; }
    public void setAttributesCount(int _v) { _dirty = true; attributesCount = _v; }
    public List<AttributeInfo> attributes() { return attributes; }
    public void setAttributes(List<AttributeInfo> _v) { _dirty = true; attributes = _v; }
    public JavaClass _root() { return _root; }
    public void set_root(JavaClass _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
