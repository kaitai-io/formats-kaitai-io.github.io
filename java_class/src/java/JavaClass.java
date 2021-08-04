// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;


/**
 * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.1">Source</a>
 */
public class JavaClass extends KaitaiStruct {
    public static JavaClass fromFile(String fileName) throws IOException {
        return new JavaClass(new ByteBufferKaitaiStream(fileName));
    }

    public JavaClass(KaitaiStream _io) {
        this(_io, null, null);
    }

    public JavaClass(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public JavaClass(KaitaiStream _io, KaitaiStruct _parent, JavaClass _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(magic(), new byte[] { -54, -2, -70, -66 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -54, -2, -70, -66 }, magic(), _io(), "/seq/0");
        }
        this.versionMinor = this._io.readU2be();
        this.versionMajor = this._io.readU2be();
        this.constantPoolCount = this._io.readU2be();
        constantPool = new ArrayList<ConstantPoolEntry>(((Number) ((constantPoolCount() - 1))).intValue());
        for (int i = 0; i < (constantPoolCount() - 1); i++) {
            this.constantPool.add(new ConstantPoolEntry(this._io, this, _root, (i != 0 ? constantPool().get((int) (i - 1)).isTwoEntries() : false)));
        }
        this.accessFlags = this._io.readU2be();
        this.thisClass = this._io.readU2be();
        this.superClass = this._io.readU2be();
        this.interfacesCount = this._io.readU2be();
        interfaces = new ArrayList<Integer>(((Number) (interfacesCount())).intValue());
        for (int i = 0; i < interfacesCount(); i++) {
            this.interfaces.add(this._io.readU2be());
        }
        this.fieldsCount = this._io.readU2be();
        fields = new ArrayList<FieldInfo>(((Number) (fieldsCount())).intValue());
        for (int i = 0; i < fieldsCount(); i++) {
            this.fields.add(new FieldInfo(this._io, this, _root));
        }
        this.methodsCount = this._io.readU2be();
        methods = new ArrayList<MethodInfo>(((Number) (methodsCount())).intValue());
        for (int i = 0; i < methodsCount(); i++) {
            this.methods.add(new MethodInfo(this._io, this, _root));
        }
        this.attributesCount = this._io.readU2be();
        attributes = new ArrayList<AttributeInfo>(((Number) (attributesCount())).intValue());
        for (int i = 0; i < attributesCount(); i++) {
            this.attributes.add(new AttributeInfo(this._io, this, _root));
        }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5">Source</a>
     */
    public static class FloatCpInfo extends KaitaiStruct {
        public static FloatCpInfo fromFile(String fileName) throws IOException {
            return new FloatCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.value = this._io.readF4be();
        }
        private float value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public float value() { return value; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7">Source</a>
     */
    public static class AttributeInfo extends KaitaiStruct {
        public static AttributeInfo fromFile(String fileName) throws IOException {
            return new AttributeInfo(new ByteBufferKaitaiStream(fileName));
        }

        public AttributeInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AttributeInfo(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public AttributeInfo(KaitaiStream _io, KaitaiStruct _parent, JavaClass _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.nameIndex = this._io.readU2be();
            this.attributeLength = this._io.readU4be();
            switch (nameAsStr()) {
            case "SourceFile": {
                this._raw_info = this._io.readBytes(attributeLength());
                KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(_raw_info);
                this.info = new AttrBodySourceFile(_io__raw_info, this, _root);
                break;
            }
            case "LineNumberTable": {
                this._raw_info = this._io.readBytes(attributeLength());
                KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(_raw_info);
                this.info = new AttrBodyLineNumberTable(_io__raw_info, this, _root);
                break;
            }
            case "Exceptions": {
                this._raw_info = this._io.readBytes(attributeLength());
                KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(_raw_info);
                this.info = new AttrBodyExceptions(_io__raw_info, this, _root);
                break;
            }
            case "Code": {
                this._raw_info = this._io.readBytes(attributeLength());
                KaitaiStream _io__raw_info = new ByteBufferKaitaiStream(_raw_info);
                this.info = new AttrBodyCode(_io__raw_info, this, _root);
                break;
            }
            default: {
                this.info = this._io.readBytes(attributeLength());
                break;
            }
            }
        }

        /**
         * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3">Source</a>
         */
        public static class AttrBodyCode extends KaitaiStruct {
            public static AttrBodyCode fromFile(String fileName) throws IOException {
                return new AttrBodyCode(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.maxStack = this._io.readU2be();
                this.maxLocals = this._io.readU2be();
                this.codeLength = this._io.readU4be();
                this.code = this._io.readBytes(codeLength());
                this.exceptionTableLength = this._io.readU2be();
                exceptionTable = new ArrayList<ExceptionEntry>(((Number) (exceptionTableLength())).intValue());
                for (int i = 0; i < exceptionTableLength(); i++) {
                    this.exceptionTable.add(new ExceptionEntry(this._io, this, _root));
                }
                this.attributesCount = this._io.readU2be();
                attributes = new ArrayList<AttributeInfo>(((Number) (attributesCount())).intValue());
                for (int i = 0; i < attributesCount(); i++) {
                    this.attributes.add(new AttributeInfo(this._io, this, _root));
                }
            }

            /**
             * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3">Source</a>
             */
            public static class ExceptionEntry extends KaitaiStruct {
                public static ExceptionEntry fromFile(String fileName) throws IOException {
                    return new ExceptionEntry(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.startPc = this._io.readU2be();
                    this.endPc = this._io.readU2be();
                    this.handlerPc = this._io.readU2be();
                    this.catchType = this._io.readU2be();
                }
                private ConstantPoolEntry catchException;
                public ConstantPoolEntry catchException() {
                    if (this.catchException != null)
                        return this.catchException;
                    if (catchType() != 0) {
                        this.catchException = _root.constantPool().get((int) (catchType() - 1));
                    }
                    return this.catchException;
                }
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

                /**
                 * End of a code region where exception handler is being
                 * active, index in code array (exclusive)
                 */
                public int endPc() { return endPc; }

                /**
                 * Start of exception handler code, index in code array
                 */
                public int handlerPc() { return handlerPc; }

                /**
                 * Exception class that this handler catches, index in constant
                 * pool, or 0 (catch all exceptions handler, used to implement
                 * `finally`).
                 */
                public int catchType() { return catchType; }
                public JavaClass _root() { return _root; }
                public JavaClass.AttributeInfo.AttrBodyCode _parent() { return _parent; }
            }
            private int maxStack;
            private int maxLocals;
            private long codeLength;
            private byte[] code;
            private int exceptionTableLength;
            private ArrayList<ExceptionEntry> exceptionTable;
            private int attributesCount;
            private ArrayList<AttributeInfo> attributes;
            private JavaClass _root;
            private JavaClass.AttributeInfo _parent;
            public int maxStack() { return maxStack; }
            public int maxLocals() { return maxLocals; }
            public long codeLength() { return codeLength; }
            public byte[] code() { return code; }
            public int exceptionTableLength() { return exceptionTableLength; }
            public ArrayList<ExceptionEntry> exceptionTable() { return exceptionTable; }
            public int attributesCount() { return attributesCount; }
            public ArrayList<AttributeInfo> attributes() { return attributes; }
            public JavaClass _root() { return _root; }
            public JavaClass.AttributeInfo _parent() { return _parent; }
        }

        /**
         * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.5">Source</a>
         */
        public static class AttrBodyExceptions extends KaitaiStruct {
            public static AttrBodyExceptions fromFile(String fileName) throws IOException {
                return new AttrBodyExceptions(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.numberOfExceptions = this._io.readU2be();
                exceptions = new ArrayList<ExceptionTableEntry>(((Number) (numberOfExceptions())).intValue());
                for (int i = 0; i < numberOfExceptions(); i++) {
                    this.exceptions.add(new ExceptionTableEntry(this._io, this, _root));
                }
            }
            public static class ExceptionTableEntry extends KaitaiStruct {
                public static ExceptionTableEntry fromFile(String fileName) throws IOException {
                    return new ExceptionTableEntry(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.index = this._io.readU2be();
                }
                private JavaClass.ClassCpInfo asInfo;
                public JavaClass.ClassCpInfo asInfo() {
                    if (this.asInfo != null)
                        return this.asInfo;
                    this.asInfo = ((JavaClass.ClassCpInfo) (_root.constantPool().get((int) (index() - 1)).cpInfo()));
                    return this.asInfo;
                }
                private String nameAsStr;
                public String nameAsStr() {
                    if (this.nameAsStr != null)
                        return this.nameAsStr;
                    this.nameAsStr = asInfo().nameAsStr();
                    return this.nameAsStr;
                }
                private int index;
                private JavaClass _root;
                private JavaClass.AttributeInfo.AttrBodyExceptions _parent;
                public int index() { return index; }
                public JavaClass _root() { return _root; }
                public JavaClass.AttributeInfo.AttrBodyExceptions _parent() { return _parent; }
            }
            private int numberOfExceptions;
            private ArrayList<ExceptionTableEntry> exceptions;
            private JavaClass _root;
            private JavaClass.AttributeInfo _parent;
            public int numberOfExceptions() { return numberOfExceptions; }
            public ArrayList<ExceptionTableEntry> exceptions() { return exceptions; }
            public JavaClass _root() { return _root; }
            public JavaClass.AttributeInfo _parent() { return _parent; }
        }

        /**
         * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.10">Source</a>
         */
        public static class AttrBodySourceFile extends KaitaiStruct {
            public static AttrBodySourceFile fromFile(String fileName) throws IOException {
                return new AttrBodySourceFile(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.sourcefileIndex = this._io.readU2be();
            }
            private String sourcefileAsStr;
            public String sourcefileAsStr() {
                if (this.sourcefileAsStr != null)
                    return this.sourcefileAsStr;
                this.sourcefileAsStr = ((JavaClass.Utf8CpInfo) (_root.constantPool().get((int) (sourcefileIndex() - 1)).cpInfo())).value();
                return this.sourcefileAsStr;
            }
            private int sourcefileIndex;
            private JavaClass _root;
            private JavaClass.AttributeInfo _parent;
            public int sourcefileIndex() { return sourcefileIndex; }
            public JavaClass _root() { return _root; }
            public JavaClass.AttributeInfo _parent() { return _parent; }
        }

        /**
         * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.12">Source</a>
         */
        public static class AttrBodyLineNumberTable extends KaitaiStruct {
            public static AttrBodyLineNumberTable fromFile(String fileName) throws IOException {
                return new AttrBodyLineNumberTable(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.lineNumberTableLength = this._io.readU2be();
                lineNumberTable = new ArrayList<LineNumberTableEntry>(((Number) (lineNumberTableLength())).intValue());
                for (int i = 0; i < lineNumberTableLength(); i++) {
                    this.lineNumberTable.add(new LineNumberTableEntry(this._io, this, _root));
                }
            }
            public static class LineNumberTableEntry extends KaitaiStruct {
                public static LineNumberTableEntry fromFile(String fileName) throws IOException {
                    return new LineNumberTableEntry(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.startPc = this._io.readU2be();
                    this.lineNumber = this._io.readU2be();
                }
                private int startPc;
                private int lineNumber;
                private JavaClass _root;
                private JavaClass.AttributeInfo.AttrBodyLineNumberTable _parent;
                public int startPc() { return startPc; }
                public int lineNumber() { return lineNumber; }
                public JavaClass _root() { return _root; }
                public JavaClass.AttributeInfo.AttrBodyLineNumberTable _parent() { return _parent; }
            }
            private int lineNumberTableLength;
            private ArrayList<LineNumberTableEntry> lineNumberTable;
            private JavaClass _root;
            private JavaClass.AttributeInfo _parent;
            public int lineNumberTableLength() { return lineNumberTableLength; }
            public ArrayList<LineNumberTableEntry> lineNumberTable() { return lineNumberTable; }
            public JavaClass _root() { return _root; }
            public JavaClass.AttributeInfo _parent() { return _parent; }
        }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = ((JavaClass.Utf8CpInfo) (_root.constantPool().get((int) (nameIndex() - 1)).cpInfo())).value();
            return this.nameAsStr;
        }
        private int nameIndex;
        private long attributeLength;
        private Object info;
        private JavaClass _root;
        private KaitaiStruct _parent;
        private byte[] _raw_info;
        public int nameIndex() { return nameIndex; }
        public long attributeLength() { return attributeLength; }
        public Object info() { return info; }
        public JavaClass _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
        public byte[] _raw_info() { return _raw_info; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2">Source</a>
     */
    public static class MethodRefCpInfo extends KaitaiStruct {
        public static MethodRefCpInfo fromFile(String fileName) throws IOException {
            return new MethodRefCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.classIndex = this._io.readU2be();
            this.nameAndTypeIndex = this._io.readU2be();
        }
        private JavaClass.ClassCpInfo classAsInfo;
        public JavaClass.ClassCpInfo classAsInfo() {
            if (this.classAsInfo != null)
                return this.classAsInfo;
            this.classAsInfo = ((JavaClass.ClassCpInfo) (_root.constantPool().get((int) (classIndex() - 1)).cpInfo()));
            return this.classAsInfo;
        }
        private JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo;
        public JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo() {
            if (this.nameAndTypeAsInfo != null)
                return this.nameAndTypeAsInfo;
            this.nameAndTypeAsInfo = ((JavaClass.NameAndTypeCpInfo) (_root.constantPool().get((int) (nameAndTypeIndex() - 1)).cpInfo()));
            return this.nameAndTypeAsInfo;
        }
        private int classIndex;
        private int nameAndTypeIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int classIndex() { return classIndex; }
        public int nameAndTypeIndex() { return nameAndTypeIndex; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.5">Source</a>
     */
    public static class FieldInfo extends KaitaiStruct {
        public static FieldInfo fromFile(String fileName) throws IOException {
            return new FieldInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.accessFlags = this._io.readU2be();
            this.nameIndex = this._io.readU2be();
            this.descriptorIndex = this._io.readU2be();
            this.attributesCount = this._io.readU2be();
            attributes = new ArrayList<AttributeInfo>(((Number) (attributesCount())).intValue());
            for (int i = 0; i < attributesCount(); i++) {
                this.attributes.add(new AttributeInfo(this._io, this, _root));
            }
        }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = ((JavaClass.Utf8CpInfo) (_root.constantPool().get((int) (nameIndex() - 1)).cpInfo())).value();
            return this.nameAsStr;
        }
        private int accessFlags;
        private int nameIndex;
        private int descriptorIndex;
        private int attributesCount;
        private ArrayList<AttributeInfo> attributes;
        private JavaClass _root;
        private JavaClass _parent;
        public int accessFlags() { return accessFlags; }
        public int nameIndex() { return nameIndex; }
        public int descriptorIndex() { return descriptorIndex; }
        public int attributesCount() { return attributesCount; }
        public ArrayList<AttributeInfo> attributes() { return attributes; }
        public JavaClass _root() { return _root; }
        public JavaClass _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6">Source</a>
     */
    public static class DoubleCpInfo extends KaitaiStruct {
        public static DoubleCpInfo fromFile(String fileName) throws IOException {
            return new DoubleCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.value = this._io.readF8be();
        }
        private double value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public double value() { return value; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5">Source</a>
     */
    public static class LongCpInfo extends KaitaiStruct {
        public static LongCpInfo fromFile(String fileName) throws IOException {
            return new LongCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.value = this._io.readU8be();
        }
        private long value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public long value() { return value; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.10">Source</a>
     */
    public static class InvokeDynamicCpInfo extends KaitaiStruct {
        public static InvokeDynamicCpInfo fromFile(String fileName) throws IOException {
            return new InvokeDynamicCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.bootstrapMethodAttrIndex = this._io.readU2be();
            this.nameAndTypeIndex = this._io.readU2be();
        }
        private int bootstrapMethodAttrIndex;
        private int nameAndTypeIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int bootstrapMethodAttrIndex() { return bootstrapMethodAttrIndex; }
        public int nameAndTypeIndex() { return nameAndTypeIndex; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.8">Source</a>
     */
    public static class MethodHandleCpInfo extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.referenceKind = ReferenceKindEnum.byId(this._io.readU1());
            this.referenceIndex = this._io.readU2be();
        }
        private ReferenceKindEnum referenceKind;
        private int referenceIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public ReferenceKindEnum referenceKind() { return referenceKind; }
        public int referenceIndex() { return referenceIndex; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6">Source</a>
     */
    public static class NameAndTypeCpInfo extends KaitaiStruct {
        public static NameAndTypeCpInfo fromFile(String fileName) throws IOException {
            return new NameAndTypeCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.nameIndex = this._io.readU2be();
            this.descriptorIndex = this._io.readU2be();
        }
        private JavaClass.Utf8CpInfo nameAsInfo;
        public JavaClass.Utf8CpInfo nameAsInfo() {
            if (this.nameAsInfo != null)
                return this.nameAsInfo;
            this.nameAsInfo = ((JavaClass.Utf8CpInfo) (_root.constantPool().get((int) (nameIndex() - 1)).cpInfo()));
            return this.nameAsInfo;
        }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = nameAsInfo().value();
            return this.nameAsStr;
        }
        private JavaClass.Utf8CpInfo descriptorAsInfo;
        public JavaClass.Utf8CpInfo descriptorAsInfo() {
            if (this.descriptorAsInfo != null)
                return this.descriptorAsInfo;
            this.descriptorAsInfo = ((JavaClass.Utf8CpInfo) (_root.constantPool().get((int) (descriptorIndex() - 1)).cpInfo()));
            return this.descriptorAsInfo;
        }
        private String descriptorAsStr;
        public String descriptorAsStr() {
            if (this.descriptorAsStr != null)
                return this.descriptorAsStr;
            this.descriptorAsStr = descriptorAsInfo().value();
            return this.descriptorAsStr;
        }
        private int nameIndex;
        private int descriptorIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int nameIndex() { return nameIndex; }
        public int descriptorIndex() { return descriptorIndex; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.7">Source</a>
     */
    public static class Utf8CpInfo extends KaitaiStruct {
        public static Utf8CpInfo fromFile(String fileName) throws IOException {
            return new Utf8CpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.strLen = this._io.readU2be();
            this.value = new String(this._io.readBytes(strLen()), Charset.forName("UTF-8"));
        }
        private int strLen;
        private String value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int strLen() { return strLen; }
        public String value() { return value; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.3">Source</a>
     */
    public static class StringCpInfo extends KaitaiStruct {
        public static StringCpInfo fromFile(String fileName) throws IOException {
            return new StringCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.stringIndex = this._io.readU2be();
        }
        private int stringIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int stringIndex() { return stringIndex; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.9">Source</a>
     */
    public static class MethodTypeCpInfo extends KaitaiStruct {
        public static MethodTypeCpInfo fromFile(String fileName) throws IOException {
            return new MethodTypeCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.descriptorIndex = this._io.readU2be();
        }
        private int descriptorIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int descriptorIndex() { return descriptorIndex; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2">Source</a>
     */
    public static class InterfaceMethodRefCpInfo extends KaitaiStruct {
        public static InterfaceMethodRefCpInfo fromFile(String fileName) throws IOException {
            return new InterfaceMethodRefCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.classIndex = this._io.readU2be();
            this.nameAndTypeIndex = this._io.readU2be();
        }
        private JavaClass.ClassCpInfo classAsInfo;
        public JavaClass.ClassCpInfo classAsInfo() {
            if (this.classAsInfo != null)
                return this.classAsInfo;
            this.classAsInfo = ((JavaClass.ClassCpInfo) (_root.constantPool().get((int) (classIndex() - 1)).cpInfo()));
            return this.classAsInfo;
        }
        private JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo;
        public JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo() {
            if (this.nameAndTypeAsInfo != null)
                return this.nameAndTypeAsInfo;
            this.nameAndTypeAsInfo = ((JavaClass.NameAndTypeCpInfo) (_root.constantPool().get((int) (nameAndTypeIndex() - 1)).cpInfo()));
            return this.nameAndTypeAsInfo;
        }
        private int classIndex;
        private int nameAndTypeIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int classIndex() { return classIndex; }
        public int nameAndTypeIndex() { return nameAndTypeIndex; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.1">Source</a>
     */
    public static class ClassCpInfo extends KaitaiStruct {
        public static ClassCpInfo fromFile(String fileName) throws IOException {
            return new ClassCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.nameIndex = this._io.readU2be();
        }
        private JavaClass.Utf8CpInfo nameAsInfo;
        public JavaClass.Utf8CpInfo nameAsInfo() {
            if (this.nameAsInfo != null)
                return this.nameAsInfo;
            this.nameAsInfo = ((JavaClass.Utf8CpInfo) (_root.constantPool().get((int) (nameIndex() - 1)).cpInfo()));
            return this.nameAsInfo;
        }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = nameAsInfo().value();
            return this.nameAsStr;
        }
        private int nameIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int nameIndex() { return nameIndex; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4">Source</a>
     */
    public static class ConstantPoolEntry extends KaitaiStruct {

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
            INVOKE_DYNAMIC(18);

            private final long id;
            TagEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, TagEnum> byId = new HashMap<Long, TagEnum>(14);
            static {
                for (TagEnum e : TagEnum.values())
                    byId.put(e.id(), e);
            }
            public static TagEnum byId(long id) { return byId.get(id); }
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
            _read();
        }
        private void _read() {
            if (!(isPrevTwoEntries())) {
                this.tag = TagEnum.byId(this._io.readU1());
            }
            if (!(isPrevTwoEntries())) {
                {
                    TagEnum on = tag();
                    if (on != null) {
                        switch (tag()) {
                        case INTERFACE_METHOD_REF: {
                            this.cpInfo = new InterfaceMethodRefCpInfo(this._io, this, _root);
                            break;
                        }
                        case CLASS_TYPE: {
                            this.cpInfo = new ClassCpInfo(this._io, this, _root);
                            break;
                        }
                        case UTF8: {
                            this.cpInfo = new Utf8CpInfo(this._io, this, _root);
                            break;
                        }
                        case METHOD_TYPE: {
                            this.cpInfo = new MethodTypeCpInfo(this._io, this, _root);
                            break;
                        }
                        case INTEGER: {
                            this.cpInfo = new IntegerCpInfo(this._io, this, _root);
                            break;
                        }
                        case STRING: {
                            this.cpInfo = new StringCpInfo(this._io, this, _root);
                            break;
                        }
                        case FLOAT: {
                            this.cpInfo = new FloatCpInfo(this._io, this, _root);
                            break;
                        }
                        case LONG: {
                            this.cpInfo = new LongCpInfo(this._io, this, _root);
                            break;
                        }
                        case METHOD_REF: {
                            this.cpInfo = new MethodRefCpInfo(this._io, this, _root);
                            break;
                        }
                        case DOUBLE: {
                            this.cpInfo = new DoubleCpInfo(this._io, this, _root);
                            break;
                        }
                        case INVOKE_DYNAMIC: {
                            this.cpInfo = new InvokeDynamicCpInfo(this._io, this, _root);
                            break;
                        }
                        case FIELD_REF: {
                            this.cpInfo = new FieldRefCpInfo(this._io, this, _root);
                            break;
                        }
                        case METHOD_HANDLE: {
                            this.cpInfo = new MethodHandleCpInfo(this._io, this, _root);
                            break;
                        }
                        case NAME_AND_TYPE: {
                            this.cpInfo = new NameAndTypeCpInfo(this._io, this, _root);
                            break;
                        }
                        }
                    }
                }
            }
        }
        private Boolean isTwoEntries;
        public Boolean isTwoEntries() {
            if (this.isTwoEntries != null)
                return this.isTwoEntries;
            boolean _tmp = (boolean) ( ((tag() == TagEnum.LONG) || (tag() == TagEnum.DOUBLE)) );
            this.isTwoEntries = _tmp;
            return this.isTwoEntries;
        }
        private TagEnum tag;
        private KaitaiStruct cpInfo;
        private boolean isPrevTwoEntries;
        private JavaClass _root;
        private JavaClass _parent;
        public TagEnum tag() { return tag; }
        public KaitaiStruct cpInfo() { return cpInfo; }
        public boolean isPrevTwoEntries() { return isPrevTwoEntries; }
        public JavaClass _root() { return _root; }
        public JavaClass _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.6">Source</a>
     */
    public static class MethodInfo extends KaitaiStruct {
        public static MethodInfo fromFile(String fileName) throws IOException {
            return new MethodInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.accessFlags = this._io.readU2be();
            this.nameIndex = this._io.readU2be();
            this.descriptorIndex = this._io.readU2be();
            this.attributesCount = this._io.readU2be();
            attributes = new ArrayList<AttributeInfo>(((Number) (attributesCount())).intValue());
            for (int i = 0; i < attributesCount(); i++) {
                this.attributes.add(new AttributeInfo(this._io, this, _root));
            }
        }
        private String nameAsStr;
        public String nameAsStr() {
            if (this.nameAsStr != null)
                return this.nameAsStr;
            this.nameAsStr = ((JavaClass.Utf8CpInfo) (_root.constantPool().get((int) (nameIndex() - 1)).cpInfo())).value();
            return this.nameAsStr;
        }
        private int accessFlags;
        private int nameIndex;
        private int descriptorIndex;
        private int attributesCount;
        private ArrayList<AttributeInfo> attributes;
        private JavaClass _root;
        private JavaClass _parent;
        public int accessFlags() { return accessFlags; }
        public int nameIndex() { return nameIndex; }
        public int descriptorIndex() { return descriptorIndex; }
        public int attributesCount() { return attributesCount; }
        public ArrayList<AttributeInfo> attributes() { return attributes; }
        public JavaClass _root() { return _root; }
        public JavaClass _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.4">Source</a>
     */
    public static class IntegerCpInfo extends KaitaiStruct {
        public static IntegerCpInfo fromFile(String fileName) throws IOException {
            return new IntegerCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.value = this._io.readU4be();
        }
        private long value;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public long value() { return value; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2">Source</a>
     */
    public static class FieldRefCpInfo extends KaitaiStruct {
        public static FieldRefCpInfo fromFile(String fileName) throws IOException {
            return new FieldRefCpInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.classIndex = this._io.readU2be();
            this.nameAndTypeIndex = this._io.readU2be();
        }
        private JavaClass.ClassCpInfo classAsInfo;
        public JavaClass.ClassCpInfo classAsInfo() {
            if (this.classAsInfo != null)
                return this.classAsInfo;
            this.classAsInfo = ((JavaClass.ClassCpInfo) (_root.constantPool().get((int) (classIndex() - 1)).cpInfo()));
            return this.classAsInfo;
        }
        private JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo;
        public JavaClass.NameAndTypeCpInfo nameAndTypeAsInfo() {
            if (this.nameAndTypeAsInfo != null)
                return this.nameAndTypeAsInfo;
            this.nameAndTypeAsInfo = ((JavaClass.NameAndTypeCpInfo) (_root.constantPool().get((int) (nameAndTypeIndex() - 1)).cpInfo()));
            return this.nameAndTypeAsInfo;
        }
        private int classIndex;
        private int nameAndTypeIndex;
        private JavaClass _root;
        private JavaClass.ConstantPoolEntry _parent;
        public int classIndex() { return classIndex; }
        public int nameAndTypeIndex() { return nameAndTypeIndex; }
        public JavaClass _root() { return _root; }
        public JavaClass.ConstantPoolEntry _parent() { return _parent; }
    }
    private byte[] magic;
    private int versionMinor;
    private int versionMajor;
    private int constantPoolCount;
    private ArrayList<ConstantPoolEntry> constantPool;
    private int accessFlags;
    private int thisClass;
    private int superClass;
    private int interfacesCount;
    private ArrayList<Integer> interfaces;
    private int fieldsCount;
    private ArrayList<FieldInfo> fields;
    private int methodsCount;
    private ArrayList<MethodInfo> methods;
    private int attributesCount;
    private ArrayList<AttributeInfo> attributes;
    private JavaClass _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public int versionMinor() { return versionMinor; }
    public int versionMajor() { return versionMajor; }
    public int constantPoolCount() { return constantPoolCount; }
    public ArrayList<ConstantPoolEntry> constantPool() { return constantPool; }
    public int accessFlags() { return accessFlags; }
    public int thisClass() { return thisClass; }
    public int superClass() { return superClass; }
    public int interfacesCount() { return interfacesCount; }
    public ArrayList<Integer> interfaces() { return interfaces; }
    public int fieldsCount() { return fieldsCount; }
    public ArrayList<FieldInfo> fields() { return fields; }
    public int methodsCount() { return methodsCount; }
    public ArrayList<MethodInfo> methods() { return methods; }
    public int attributesCount() { return attributesCount; }
    public ArrayList<AttributeInfo> attributes() { return attributes; }
    public JavaClass _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
