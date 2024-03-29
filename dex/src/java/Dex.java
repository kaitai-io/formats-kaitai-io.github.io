// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * Android OS applications executables are typically stored in its own
 * format, optimized for more efficient execution in Dalvik virtual
 * machine.
 * 
 * This format is loosely similar to Java .class file format and
 * generally holds the similar set of data: i.e. classes, methods,
 * fields, annotations, etc.
 * @see <a href="https://source.android.com/docs/core/runtime/dex-format">Source</a>
 */
public class Dex extends KaitaiStruct {
    public static Dex fromFile(String fileName) throws IOException {
        return new Dex(new ByteBufferKaitaiStream(fileName));
    }

    public enum ClassAccessFlags {
        PUBLIC(1),
        PRIVATE(2),
        PROTECTED(4),
        STATIC(8),
        FINAL(16),
        INTERFACE(512),
        ABSTRACT(1024),
        SYNTHETIC(4096),
        ANNOTATION(8192),
        ENUM(16384);

        private final long id;
        ClassAccessFlags(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ClassAccessFlags> byId = new HashMap<Long, ClassAccessFlags>(10);
        static {
            for (ClassAccessFlags e : ClassAccessFlags.values())
                byId.put(e.id(), e);
        }
        public static ClassAccessFlags byId(long id) { return byId.get(id); }
    }

    public Dex(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dex(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Dex(KaitaiStream _io, KaitaiStruct _parent, Dex _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new HeaderItem(this._io, this, _root);
    }
    public static class HeaderItem extends KaitaiStruct {
        public static HeaderItem fromFile(String fileName) throws IOException {
            return new HeaderItem(new ByteBufferKaitaiStream(fileName));
        }

        public enum EndianConstant {
            ENDIAN_CONSTANT(305419896),
            REVERSE_ENDIAN_CONSTANT(2018915346);

            private final long id;
            EndianConstant(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, EndianConstant> byId = new HashMap<Long, EndianConstant>(2);
            static {
                for (EndianConstant e : EndianConstant.values())
                    byId.put(e.id(), e);
            }
            public static EndianConstant byId(long id) { return byId.get(id); }
        }

        public HeaderItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderItem(KaitaiStream _io, Dex _parent) {
            this(_io, _parent, null);
        }

        public HeaderItem(KaitaiStream _io, Dex _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { 100, 101, 120, 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 100, 101, 120, 10 }, magic(), _io(), "/types/header_item/seq/0");
            }
            this.versionStr = new String(KaitaiStream.bytesTerminate(this._io.readBytes(4), (byte) 0, false), Charset.forName("ascii"));
            this.checksum = this._io.readU4le();
            this.signature = this._io.readBytes(20);
            this.fileSize = this._io.readU4le();
            this.headerSize = this._io.readU4le();
            this.endianTag = EndianConstant.byId(this._io.readU4le());
            this.linkSize = this._io.readU4le();
            this.linkOff = this._io.readU4le();
            this.mapOff = this._io.readU4le();
            this.stringIdsSize = this._io.readU4le();
            this.stringIdsOff = this._io.readU4le();
            this.typeIdsSize = this._io.readU4le();
            this.typeIdsOff = this._io.readU4le();
            this.protoIdsSize = this._io.readU4le();
            this.protoIdsOff = this._io.readU4le();
            this.fieldIdsSize = this._io.readU4le();
            this.fieldIdsOff = this._io.readU4le();
            this.methodIdsSize = this._io.readU4le();
            this.methodIdsOff = this._io.readU4le();
            this.classDefsSize = this._io.readU4le();
            this.classDefsOff = this._io.readU4le();
            this.dataSize = this._io.readU4le();
            this.dataOff = this._io.readU4le();
        }
        private byte[] magic;
        private String versionStr;
        private long checksum;
        private byte[] signature;
        private long fileSize;
        private long headerSize;
        private EndianConstant endianTag;
        private long linkSize;
        private long linkOff;
        private long mapOff;
        private long stringIdsSize;
        private long stringIdsOff;
        private long typeIdsSize;
        private long typeIdsOff;
        private long protoIdsSize;
        private long protoIdsOff;
        private long fieldIdsSize;
        private long fieldIdsOff;
        private long methodIdsSize;
        private long methodIdsOff;
        private long classDefsSize;
        private long classDefsOff;
        private long dataSize;
        private long dataOff;
        private Dex _root;
        private Dex _parent;
        public byte[] magic() { return magic; }
        public String versionStr() { return versionStr; }

        /**
         * adler32 checksum of the rest of the file (everything but magic and this field);
         * used to detect file corruption
         */
        public long checksum() { return checksum; }

        /**
         * SHA-1 signature (hash) of the rest of the file (everything but magic, checksum,
         * and this field); used to uniquely identify files
         */
        public byte[] signature() { return signature; }

        /**
         * size of the entire file (including the header), in bytes
         */
        public long fileSize() { return fileSize; }

        /**
         * size of the header (this entire section), in bytes. This allows for at
         * least a limited amount of backwards/forwards compatibility without
         * invalidating the format.
         */
        public long headerSize() { return headerSize; }
        public EndianConstant endianTag() { return endianTag; }

        /**
         * size of the link section, or 0 if this file isn't statically linked
         */
        public long linkSize() { return linkSize; }

        /**
         * offset from the start of the file to the link section, or 0 if link_size == 0.
         * The offset, if non-zero, should be to an offset into the link_data section.
         * The format of the data pointed at is left unspecified by this document;
         * this header field (and the previous) are left as hooks for use by runtime implementations.
         */
        public long linkOff() { return linkOff; }

        /**
         * offset from the start of the file to the map item.
         * The offset, which must be non-zero, should be to an offset into the data
         * section, and the data should be in the format specified by "map_list" below.
         */
        public long mapOff() { return mapOff; }

        /**
         * count of strings in the string identifiers list
         */
        public long stringIdsSize() { return stringIdsSize; }

        /**
         * offset from the start of the file to the string identifiers list,
         * or 0 if string_ids_size == 0 (admittedly a strange edge case).
         * The offset, if non-zero, should be to the start of the string_ids section.
         */
        public long stringIdsOff() { return stringIdsOff; }

        /**
         * count of elements in the type identifiers list, at most 65535
         */
        public long typeIdsSize() { return typeIdsSize; }

        /**
         * offset from the start of the file to the type identifiers list,
         * or 0 if type_ids_size == 0 (admittedly a strange edge case).
         * The offset, if non-zero, should be to the start of the type_ids section.
         */
        public long typeIdsOff() { return typeIdsOff; }

        /**
         * count of elements in the prototype identifiers list, at most 65535
         */
        public long protoIdsSize() { return protoIdsSize; }

        /**
         * offset from the start of the file to the prototype identifiers list,
         * or 0 if proto_ids_size == 0 (admittedly a strange edge case).
         * The offset, if non-zero, should be to the start of the proto_ids section.
         */
        public long protoIdsOff() { return protoIdsOff; }

        /**
         * count of elements in the field identifiers list
         */
        public long fieldIdsSize() { return fieldIdsSize; }

        /**
         * offset from the start of the file to the field identifiers list,
         * or 0 if field_ids_size == 0.
         * The offset, if non-zero, should be to the start of the field_ids section.
         */
        public long fieldIdsOff() { return fieldIdsOff; }

        /**
         * count of elements in the method identifiers list
         */
        public long methodIdsSize() { return methodIdsSize; }

        /**
         * offset from the start of the file to the method identifiers list,
         * or 0 if method_ids_size == 0.
         * The offset, if non-zero, should be to the start of the method_ids section.
         */
        public long methodIdsOff() { return methodIdsOff; }

        /**
         * count of elements in the class definitions list
         */
        public long classDefsSize() { return classDefsSize; }

        /**
         * offset from the start of the file to the class definitions list,
         * or 0 if class_defs_size == 0 (admittedly a strange edge case).
         * The offset, if non-zero, should be to the start of the class_defs section.
         */
        public long classDefsOff() { return classDefsOff; }

        /**
         * Size of data section in bytes. Must be an even multiple of sizeof(uint).
         */
        public long dataSize() { return dataSize; }

        /**
         * offset from the start of the file to the start of the data section.
         */
        public long dataOff() { return dataOff; }
        public Dex _root() { return _root; }
        public Dex _parent() { return _parent; }
    }
    public static class MapList extends KaitaiStruct {
        public static MapList fromFile(String fileName) throws IOException {
            return new MapList(new ByteBufferKaitaiStream(fileName));
        }

        public MapList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MapList(KaitaiStream _io, Dex _parent) {
            this(_io, _parent, null);
        }

        public MapList(KaitaiStream _io, Dex _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU4le();
            this.list = new ArrayList<MapItem>();
            for (int i = 0; i < size(); i++) {
                this.list.add(new MapItem(this._io, this, _root));
            }
        }
        private long size;
        private ArrayList<MapItem> list;
        private Dex _root;
        private Dex _parent;
        public long size() { return size; }
        public ArrayList<MapItem> list() { return list; }
        public Dex _root() { return _root; }
        public Dex _parent() { return _parent; }
    }
    public static class EncodedValue extends KaitaiStruct {
        public static EncodedValue fromFile(String fileName) throws IOException {
            return new EncodedValue(new ByteBufferKaitaiStream(fileName));
        }

        public enum ValueTypeEnum {
            BYTE(0),
            SHORT(2),
            CHAR(3),
            INT(4),
            LONG(6),
            FLOAT(16),
            DOUBLE(17),
            METHOD_TYPE(21),
            METHOD_HANDLE(22),
            STRING(23),
            TYPE(24),
            FIELD(25),
            METHOD(26),
            ENUM(27),
            ARRAY(28),
            ANNOTATION(29),
            NULL(30),
            BOOLEAN(31);

            private final long id;
            ValueTypeEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ValueTypeEnum> byId = new HashMap<Long, ValueTypeEnum>(18);
            static {
                for (ValueTypeEnum e : ValueTypeEnum.values())
                    byId.put(e.id(), e);
            }
            public static ValueTypeEnum byId(long id) { return byId.get(id); }
        }

        public EncodedValue(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EncodedValue(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public EncodedValue(KaitaiStream _io, KaitaiStruct _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.valueArg = this._io.readBitsIntBe(3);
            this.valueType = ValueTypeEnum.byId(this._io.readBitsIntBe(5));
            this._io.alignToByte();
            {
                ValueTypeEnum on = valueType();
                if (on != null) {
                    switch (valueType()) {
                    case INT: {
                        this.value = (Object) (this._io.readS4le());
                        break;
                    }
                    case ANNOTATION: {
                        this.value = new EncodedAnnotation(this._io, this, _root);
                        break;
                    }
                    case LONG: {
                        this.value = (Object) (this._io.readS8le());
                        break;
                    }
                    case METHOD_HANDLE: {
                        this.value = (Object) (this._io.readU4le());
                        break;
                    }
                    case BYTE: {
                        this.value = (Object) (this._io.readS1());
                        break;
                    }
                    case ARRAY: {
                        this.value = new EncodedArray(this._io, this, _root);
                        break;
                    }
                    case METHOD_TYPE: {
                        this.value = (Object) (this._io.readU4le());
                        break;
                    }
                    case SHORT: {
                        this.value = (Object) (this._io.readS2le());
                        break;
                    }
                    case METHOD: {
                        this.value = (Object) (this._io.readU4le());
                        break;
                    }
                    case DOUBLE: {
                        this.value = (Object) (this._io.readF8le());
                        break;
                    }
                    case FLOAT: {
                        this.value = (Object) (this._io.readF4le());
                        break;
                    }
                    case TYPE: {
                        this.value = (Object) (this._io.readU4le());
                        break;
                    }
                    case ENUM: {
                        this.value = (Object) (this._io.readU4le());
                        break;
                    }
                    case FIELD: {
                        this.value = (Object) (this._io.readU4le());
                        break;
                    }
                    case STRING: {
                        this.value = (Object) (this._io.readU4le());
                        break;
                    }
                    case CHAR: {
                        this.value = (Object) (this._io.readU2le());
                        break;
                    }
                    }
                }
            }
        }
        private long valueArg;
        private ValueTypeEnum valueType;
        private Object value;
        private Dex _root;
        private KaitaiStruct _parent;
        public long valueArg() { return valueArg; }
        public ValueTypeEnum valueType() { return valueType; }
        public Object value() { return value; }
        public Dex _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class CallSiteIdItem extends KaitaiStruct {
        public static CallSiteIdItem fromFile(String fileName) throws IOException {
            return new CallSiteIdItem(new ByteBufferKaitaiStream(fileName));
        }

        public CallSiteIdItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CallSiteIdItem(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public CallSiteIdItem(KaitaiStream _io, KaitaiStruct _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.callSiteOff = this._io.readU4le();
        }
        private long callSiteOff;
        private Dex _root;
        private KaitaiStruct _parent;

        /**
         * offset from the start of the file to call site definition.
         * 
         * The offset should be in the data section, and the data there should
         * be in the format specified by "call_site_item" below.
         */
        public long callSiteOff() { return callSiteOff; }
        public Dex _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class MethodIdItem extends KaitaiStruct {
        public static MethodIdItem fromFile(String fileName) throws IOException {
            return new MethodIdItem(new ByteBufferKaitaiStream(fileName));
        }

        public MethodIdItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MethodIdItem(KaitaiStream _io, Dex _parent) {
            this(_io, _parent, null);
        }

        public MethodIdItem(KaitaiStream _io, Dex _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.classIdx = this._io.readU2le();
            this.protoIdx = this._io.readU2le();
            this.nameIdx = this._io.readU4le();
        }
        private String className;

        /**
         * the definer of this method
         */
        public String className() {
            if (this.className != null)
                return this.className;
            this.className = _root().typeIds().get((int) classIdx()).typeName();
            return this.className;
        }
        private String protoDesc;

        /**
         * the short-form descriptor of the prototype of this method
         */
        public String protoDesc() {
            if (this.protoDesc != null)
                return this.protoDesc;
            this.protoDesc = _root().protoIds().get((int) protoIdx()).shortyDesc();
            return this.protoDesc;
        }
        private String methodName;

        /**
         * the name of this method
         */
        public String methodName() {
            if (this.methodName != null)
                return this.methodName;
            this.methodName = _root().stringIds().get((int) nameIdx()).value().data();
            return this.methodName;
        }
        private int classIdx;
        private int protoIdx;
        private long nameIdx;
        private Dex _root;
        private Dex _parent;

        /**
         * index into the type_ids list for the definer of this method.
         * This must be a class or array type, and not a primitive type.
         */
        public int classIdx() { return classIdx; }

        /**
         * index into the proto_ids list for the prototype of this method
         */
        public int protoIdx() { return protoIdx; }

        /**
         * index into the string_ids list for the name of this method.
         * The string must conform to the syntax for MemberName, defined above.
         */
        public long nameIdx() { return nameIdx; }
        public Dex _root() { return _root; }
        public Dex _parent() { return _parent; }
    }
    public static class TypeItem extends KaitaiStruct {
        public static TypeItem fromFile(String fileName) throws IOException {
            return new TypeItem(new ByteBufferKaitaiStream(fileName));
        }

        public TypeItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TypeItem(KaitaiStream _io, Dex.TypeList _parent) {
            this(_io, _parent, null);
        }

        public TypeItem(KaitaiStream _io, Dex.TypeList _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.typeIdx = this._io.readU2le();
        }
        private String value;
        public String value() {
            if (this.value != null)
                return this.value;
            this.value = _root().typeIds().get((int) typeIdx()).typeName();
            return this.value;
        }
        private int typeIdx;
        private Dex _root;
        private Dex.TypeList _parent;
        public int typeIdx() { return typeIdx; }
        public Dex _root() { return _root; }
        public Dex.TypeList _parent() { return _parent; }
    }
    public static class TypeIdItem extends KaitaiStruct {
        public static TypeIdItem fromFile(String fileName) throws IOException {
            return new TypeIdItem(new ByteBufferKaitaiStream(fileName));
        }

        public TypeIdItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TypeIdItem(KaitaiStream _io, Dex _parent) {
            this(_io, _parent, null);
        }

        public TypeIdItem(KaitaiStream _io, Dex _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.descriptorIdx = this._io.readU4le();
        }
        private String typeName;
        public String typeName() {
            if (this.typeName != null)
                return this.typeName;
            this.typeName = _root().stringIds().get((int) descriptorIdx()).value().data();
            return this.typeName;
        }
        private long descriptorIdx;
        private Dex _root;
        private Dex _parent;

        /**
         * index into the string_ids list for the descriptor string of this type.
         * The string must conform to the syntax for TypeDescriptor, defined above.
         */
        public long descriptorIdx() { return descriptorIdx; }
        public Dex _root() { return _root; }
        public Dex _parent() { return _parent; }
    }
    public static class AnnotationElement extends KaitaiStruct {
        public static AnnotationElement fromFile(String fileName) throws IOException {
            return new AnnotationElement(new ByteBufferKaitaiStream(fileName));
        }

        public AnnotationElement(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AnnotationElement(KaitaiStream _io, Dex.EncodedAnnotation _parent) {
            this(_io, _parent, null);
        }

        public AnnotationElement(KaitaiStream _io, Dex.EncodedAnnotation _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.nameIdx = new VlqBase128Le(this._io);
            this.value = new EncodedValue(this._io, this, _root);
        }
        private VlqBase128Le nameIdx;
        private EncodedValue value;
        private Dex _root;
        private Dex.EncodedAnnotation _parent;

        /**
         * element name, represented as an index into the string_ids section.
         * 
         * The string must conform to the syntax for MemberName, defined above.
         */
        public VlqBase128Le nameIdx() { return nameIdx; }

        /**
         * element value
         */
        public EncodedValue value() { return value; }
        public Dex _root() { return _root; }
        public Dex.EncodedAnnotation _parent() { return _parent; }
    }
    public static class EncodedField extends KaitaiStruct {
        public static EncodedField fromFile(String fileName) throws IOException {
            return new EncodedField(new ByteBufferKaitaiStream(fileName));
        }

        public EncodedField(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EncodedField(KaitaiStream _io, Dex.ClassDataItem _parent) {
            this(_io, _parent, null);
        }

        public EncodedField(KaitaiStream _io, Dex.ClassDataItem _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fieldIdxDiff = new VlqBase128Le(this._io);
            this.accessFlags = new VlqBase128Le(this._io);
        }
        private VlqBase128Le fieldIdxDiff;
        private VlqBase128Le accessFlags;
        private Dex _root;
        private Dex.ClassDataItem _parent;

        /**
         * index into the field_ids list for the identity of this field
         * (includes the name and descriptor), represented as a difference
         * from the index of previous element in the list.
         * 
         * The index of the first element in a list is represented directly.
         */
        public VlqBase128Le fieldIdxDiff() { return fieldIdxDiff; }

        /**
         * access flags for the field (public, final, etc.).
         * 
         * See "access_flags Definitions" for details.
         */
        public VlqBase128Le accessFlags() { return accessFlags; }
        public Dex _root() { return _root; }
        public Dex.ClassDataItem _parent() { return _parent; }
    }
    public static class EncodedArrayItem extends KaitaiStruct {
        public static EncodedArrayItem fromFile(String fileName) throws IOException {
            return new EncodedArrayItem(new ByteBufferKaitaiStream(fileName));
        }

        public EncodedArrayItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EncodedArrayItem(KaitaiStream _io, Dex.ClassDefItem _parent) {
            this(_io, _parent, null);
        }

        public EncodedArrayItem(KaitaiStream _io, Dex.ClassDefItem _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.value = new EncodedArray(this._io, this, _root);
        }
        private EncodedArray value;
        private Dex _root;
        private Dex.ClassDefItem _parent;
        public EncodedArray value() { return value; }
        public Dex _root() { return _root; }
        public Dex.ClassDefItem _parent() { return _parent; }
    }
    public static class ClassDataItem extends KaitaiStruct {
        public static ClassDataItem fromFile(String fileName) throws IOException {
            return new ClassDataItem(new ByteBufferKaitaiStream(fileName));
        }

        public ClassDataItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ClassDataItem(KaitaiStream _io, Dex.ClassDefItem _parent) {
            this(_io, _parent, null);
        }

        public ClassDataItem(KaitaiStream _io, Dex.ClassDefItem _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.staticFieldsSize = new VlqBase128Le(this._io);
            this.instanceFieldsSize = new VlqBase128Le(this._io);
            this.directMethodsSize = new VlqBase128Le(this._io);
            this.virtualMethodsSize = new VlqBase128Le(this._io);
            this.staticFields = new ArrayList<EncodedField>();
            for (int i = 0; i < staticFieldsSize().value(); i++) {
                this.staticFields.add(new EncodedField(this._io, this, _root));
            }
            this.instanceFields = new ArrayList<EncodedField>();
            for (int i = 0; i < instanceFieldsSize().value(); i++) {
                this.instanceFields.add(new EncodedField(this._io, this, _root));
            }
            this.directMethods = new ArrayList<EncodedMethod>();
            for (int i = 0; i < directMethodsSize().value(); i++) {
                this.directMethods.add(new EncodedMethod(this._io, this, _root));
            }
            this.virtualMethods = new ArrayList<EncodedMethod>();
            for (int i = 0; i < virtualMethodsSize().value(); i++) {
                this.virtualMethods.add(new EncodedMethod(this._io, this, _root));
            }
        }
        private VlqBase128Le staticFieldsSize;
        private VlqBase128Le instanceFieldsSize;
        private VlqBase128Le directMethodsSize;
        private VlqBase128Le virtualMethodsSize;
        private ArrayList<EncodedField> staticFields;
        private ArrayList<EncodedField> instanceFields;
        private ArrayList<EncodedMethod> directMethods;
        private ArrayList<EncodedMethod> virtualMethods;
        private Dex _root;
        private Dex.ClassDefItem _parent;

        /**
         * the number of static fields defined in this item
         */
        public VlqBase128Le staticFieldsSize() { return staticFieldsSize; }

        /**
         * the number of instance fields defined in this item
         */
        public VlqBase128Le instanceFieldsSize() { return instanceFieldsSize; }

        /**
         * the number of direct methods defined in this item
         */
        public VlqBase128Le directMethodsSize() { return directMethodsSize; }

        /**
         * the number of virtual methods defined in this item
         */
        public VlqBase128Le virtualMethodsSize() { return virtualMethodsSize; }

        /**
         * the defined static fields, represented as a sequence of encoded elements.
         * 
         * The fields must be sorted by field_idx in increasing order.
         */
        public ArrayList<EncodedField> staticFields() { return staticFields; }

        /**
         * the defined instance fields, represented as a sequence of encoded elements.
         * 
         * The fields must be sorted by field_idx in increasing order.
         */
        public ArrayList<EncodedField> instanceFields() { return instanceFields; }

        /**
         * the defined direct (any of static, private, or constructor) methods,
         * represented as a sequence of encoded elements.
         * 
         * The methods must be sorted by method_idx in increasing order.
         */
        public ArrayList<EncodedMethod> directMethods() { return directMethods; }

        /**
         * the defined virtual (none of static, private, or constructor) methods,
         * represented as a sequence of encoded elements.
         * 
         * This list should not include inherited methods unless overridden by
         * the class that this item represents.
         * 
         * The methods must be sorted by method_idx in increasing order.
         * 
         * The method_idx of a virtual method must not be the same as any direct method.
         */
        public ArrayList<EncodedMethod> virtualMethods() { return virtualMethods; }
        public Dex _root() { return _root; }
        public Dex.ClassDefItem _parent() { return _parent; }
    }
    public static class FieldIdItem extends KaitaiStruct {
        public static FieldIdItem fromFile(String fileName) throws IOException {
            return new FieldIdItem(new ByteBufferKaitaiStream(fileName));
        }

        public FieldIdItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FieldIdItem(KaitaiStream _io, Dex _parent) {
            this(_io, _parent, null);
        }

        public FieldIdItem(KaitaiStream _io, Dex _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.classIdx = this._io.readU2le();
            this.typeIdx = this._io.readU2le();
            this.nameIdx = this._io.readU4le();
        }
        private String className;

        /**
         * the definer of this field
         */
        public String className() {
            if (this.className != null)
                return this.className;
            this.className = _root().typeIds().get((int) classIdx()).typeName();
            return this.className;
        }
        private String typeName;

        /**
         * the type of this field
         */
        public String typeName() {
            if (this.typeName != null)
                return this.typeName;
            this.typeName = _root().typeIds().get((int) typeIdx()).typeName();
            return this.typeName;
        }
        private String fieldName;

        /**
         * the name of this field
         */
        public String fieldName() {
            if (this.fieldName != null)
                return this.fieldName;
            this.fieldName = _root().stringIds().get((int) nameIdx()).value().data();
            return this.fieldName;
        }
        private int classIdx;
        private int typeIdx;
        private long nameIdx;
        private Dex _root;
        private Dex _parent;

        /**
         * index into the type_ids list for the definer of this field.
         * This must be a class type, and not an array or primitive type.
         */
        public int classIdx() { return classIdx; }

        /**
         * index into the type_ids list for the type of this field
         */
        public int typeIdx() { return typeIdx; }

        /**
         * index into the string_ids list for the name of this field.
         * The string must conform to the syntax for MemberName, defined above.
         */
        public long nameIdx() { return nameIdx; }
        public Dex _root() { return _root; }
        public Dex _parent() { return _parent; }
    }
    public static class EncodedAnnotation extends KaitaiStruct {
        public static EncodedAnnotation fromFile(String fileName) throws IOException {
            return new EncodedAnnotation(new ByteBufferKaitaiStream(fileName));
        }

        public EncodedAnnotation(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EncodedAnnotation(KaitaiStream _io, Dex.EncodedValue _parent) {
            this(_io, _parent, null);
        }

        public EncodedAnnotation(KaitaiStream _io, Dex.EncodedValue _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.typeIdx = new VlqBase128Le(this._io);
            this.size = new VlqBase128Le(this._io);
            this.elements = new ArrayList<AnnotationElement>();
            for (int i = 0; i < size().value(); i++) {
                this.elements.add(new AnnotationElement(this._io, this, _root));
            }
        }
        private VlqBase128Le typeIdx;
        private VlqBase128Le size;
        private ArrayList<AnnotationElement> elements;
        private Dex _root;
        private Dex.EncodedValue _parent;

        /**
         * type of the annotation.
         * 
         * This must be a class (not array or primitive) type.
         */
        public VlqBase128Le typeIdx() { return typeIdx; }

        /**
         * number of name-value mappings in this annotation
         */
        public VlqBase128Le size() { return size; }

        /**
         * elements of the annotation, represented directly in-line (not as offsets).
         * 
         * Elements must be sorted in increasing order by string_id index.
         */
        public ArrayList<AnnotationElement> elements() { return elements; }
        public Dex _root() { return _root; }
        public Dex.EncodedValue _parent() { return _parent; }
    }
    public static class ClassDefItem extends KaitaiStruct {
        public static ClassDefItem fromFile(String fileName) throws IOException {
            return new ClassDefItem(new ByteBufferKaitaiStream(fileName));
        }

        public ClassDefItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ClassDefItem(KaitaiStream _io, Dex _parent) {
            this(_io, _parent, null);
        }

        public ClassDefItem(KaitaiStream _io, Dex _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.classIdx = this._io.readU4le();
            this.accessFlags = Dex.ClassAccessFlags.byId(this._io.readU4le());
            this.superclassIdx = this._io.readU4le();
            this.interfacesOff = this._io.readU4le();
            this.sourceFileIdx = this._io.readU4le();
            this.annotationsOff = this._io.readU4le();
            this.classDataOff = this._io.readU4le();
            this.staticValuesOff = this._io.readU4le();
        }
        private String typeName;
        public String typeName() {
            if (this.typeName != null)
                return this.typeName;
            this.typeName = _root().typeIds().get((int) classIdx()).typeName();
            return this.typeName;
        }
        private ClassDataItem classData;
        public ClassDataItem classData() {
            if (this.classData != null)
                return this.classData;
            if (classDataOff() != 0) {
                long _pos = this._io.pos();
                this._io.seek(classDataOff());
                this.classData = new ClassDataItem(this._io, this, _root);
                this._io.seek(_pos);
            }
            return this.classData;
        }
        private EncodedArrayItem staticValues;
        public EncodedArrayItem staticValues() {
            if (this.staticValues != null)
                return this.staticValues;
            if (staticValuesOff() != 0) {
                long _pos = this._io.pos();
                this._io.seek(staticValuesOff());
                this.staticValues = new EncodedArrayItem(this._io, this, _root);
                this._io.seek(_pos);
            }
            return this.staticValues;
        }
        private long classIdx;
        private ClassAccessFlags accessFlags;
        private long superclassIdx;
        private long interfacesOff;
        private long sourceFileIdx;
        private long annotationsOff;
        private long classDataOff;
        private long staticValuesOff;
        private Dex _root;
        private Dex _parent;

        /**
         * index into the type_ids list for this class.
         * 
         * This must be a class type, and not an array or primitive type.
         */
        public long classIdx() { return classIdx; }

        /**
         * access flags for the class (public, final, etc.).
         * 
         * See "access_flags Definitions" for details.
         */
        public ClassAccessFlags accessFlags() { return accessFlags; }

        /**
         * index into the type_ids list for the superclass,
         * or the constant value NO_INDEX if this class has no superclass
         * (i.e., it is a root class such as Object).
         * 
         * If present, this must be a class type, and not an array or primitive type.
         */
        public long superclassIdx() { return superclassIdx; }

        /**
         * offset from the start of the file to the list of interfaces, or 0 if there are none.
         * 
         * This offset should be in the data section, and the data there should
         * be in the format specified by "type_list" below. Each of the elements
         * of the list must be a class type (not an array or primitive type),
         * and there must not be any duplicates.
         */
        public long interfacesOff() { return interfacesOff; }

        /**
         * index into the string_ids list for the name of the file containing
         * the original source for (at least most of) this class, or the
         * special value NO_INDEX to represent a lack of this information.
         * 
         * The debug_info_item of any given method may override this source file,
         * but the expectation is that most classes will only come from one source file.
         */
        public long sourceFileIdx() { return sourceFileIdx; }

        /**
         * offset from the start of the file to the annotations structure for
         * this class, or 0 if there are no annotations on this class.
         * 
         * This offset, if non-zero, should be in the data section, and the data
         * there should be in the format specified by "annotations_directory_item"
         * below,with all items referring to this class as the definer.
         */
        public long annotationsOff() { return annotationsOff; }

        /**
         * offset from the start of the file to the associated class data for this
         * item, or 0 if there is no class data for this class.
         * 
         * (This may be the case, for example, if this class is a marker interface.)
         * 
         * The offset, if non-zero, should be in the data section, and the data
         * there should be in the format specified by "class_data_item" below,
         * with all items referring to this class as the definer.
         */
        public long classDataOff() { return classDataOff; }

        /**
         * offset from the start of the file to the list of initial values for
         * static fields, or 0 if there are none (and all static fields are to be
         * initialized with 0 or null).
         * 
         * This offset should be in the data section, and the data there should
         * be in the format specified by "encoded_array_item" below.
         * 
         * The size of the array must be no larger than the number of static fields
         * declared by this class, and the elements correspond to the static fields
         * in the same order as declared in the corresponding field_list.
         * 
         * The type of each array element must match the declared type of its
         * corresponding field.
         * 
         * If there are fewer elements in the array than there are static fields,
         * then the leftover fields are initialized with a type-appropriate 0 or null.
         */
        public long staticValuesOff() { return staticValuesOff; }
        public Dex _root() { return _root; }
        public Dex _parent() { return _parent; }
    }
    public static class TypeList extends KaitaiStruct {
        public static TypeList fromFile(String fileName) throws IOException {
            return new TypeList(new ByteBufferKaitaiStream(fileName));
        }

        public TypeList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TypeList(KaitaiStream _io, Dex.ProtoIdItem _parent) {
            this(_io, _parent, null);
        }

        public TypeList(KaitaiStream _io, Dex.ProtoIdItem _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU4le();
            this.list = new ArrayList<TypeItem>();
            for (int i = 0; i < size(); i++) {
                this.list.add(new TypeItem(this._io, this, _root));
            }
        }
        private long size;
        private ArrayList<TypeItem> list;
        private Dex _root;
        private Dex.ProtoIdItem _parent;
        public long size() { return size; }
        public ArrayList<TypeItem> list() { return list; }
        public Dex _root() { return _root; }
        public Dex.ProtoIdItem _parent() { return _parent; }
    }
    public static class StringIdItem extends KaitaiStruct {
        public static StringIdItem fromFile(String fileName) throws IOException {
            return new StringIdItem(new ByteBufferKaitaiStream(fileName));
        }

        public StringIdItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StringIdItem(KaitaiStream _io, Dex _parent) {
            this(_io, _parent, null);
        }

        public StringIdItem(KaitaiStream _io, Dex _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.stringDataOff = this._io.readU4le();
        }
        public static class StringDataItem extends KaitaiStruct {
            public static StringDataItem fromFile(String fileName) throws IOException {
                return new StringDataItem(new ByteBufferKaitaiStream(fileName));
            }

            public StringDataItem(KaitaiStream _io) {
                this(_io, null, null);
            }

            public StringDataItem(KaitaiStream _io, Dex.StringIdItem _parent) {
                this(_io, _parent, null);
            }

            public StringDataItem(KaitaiStream _io, Dex.StringIdItem _parent, Dex _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.utf16Size = new VlqBase128Le(this._io);
                this.data = new String(this._io.readBytes(utf16Size().value()), Charset.forName("ascii"));
            }
            private VlqBase128Le utf16Size;
            private String data;
            private Dex _root;
            private Dex.StringIdItem _parent;
            public VlqBase128Le utf16Size() { return utf16Size; }
            public String data() { return data; }
            public Dex _root() { return _root; }
            public Dex.StringIdItem _parent() { return _parent; }
        }
        private StringDataItem value;
        public StringDataItem value() {
            if (this.value != null)
                return this.value;
            long _pos = this._io.pos();
            this._io.seek(stringDataOff());
            this.value = new StringDataItem(this._io, this, _root);
            this._io.seek(_pos);
            return this.value;
        }
        private long stringDataOff;
        private Dex _root;
        private Dex _parent;

        /**
         * offset from the start of the file to the string data for this item.
         * The offset should be to a location in the data section, and the data
         * should be in the format specified by "string_data_item" below.
         * There is no alignment requirement for the offset.
         */
        public long stringDataOff() { return stringDataOff; }
        public Dex _root() { return _root; }
        public Dex _parent() { return _parent; }
    }
    public static class ProtoIdItem extends KaitaiStruct {
        public static ProtoIdItem fromFile(String fileName) throws IOException {
            return new ProtoIdItem(new ByteBufferKaitaiStream(fileName));
        }

        public ProtoIdItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ProtoIdItem(KaitaiStream _io, Dex _parent) {
            this(_io, _parent, null);
        }

        public ProtoIdItem(KaitaiStream _io, Dex _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.shortyIdx = this._io.readU4le();
            this.returnTypeIdx = this._io.readU4le();
            this.parametersOff = this._io.readU4le();
        }
        private String shortyDesc;

        /**
         * short-form descriptor string of this prototype, as pointed to by shorty_idx
         */
        public String shortyDesc() {
            if (this.shortyDesc != null)
                return this.shortyDesc;
            this.shortyDesc = _root().stringIds().get((int) shortyIdx()).value().data();
            return this.shortyDesc;
        }
        private TypeList paramsTypes;

        /**
         * list of parameter types for this prototype
         */
        public TypeList paramsTypes() {
            if (this.paramsTypes != null)
                return this.paramsTypes;
            if (parametersOff() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(parametersOff());
                this.paramsTypes = new TypeList(io, this, _root);
                io.seek(_pos);
            }
            return this.paramsTypes;
        }
        private String returnType;

        /**
         * return type of this prototype
         */
        public String returnType() {
            if (this.returnType != null)
                return this.returnType;
            this.returnType = _root().typeIds().get((int) returnTypeIdx()).typeName();
            return this.returnType;
        }
        private long shortyIdx;
        private long returnTypeIdx;
        private long parametersOff;
        private Dex _root;
        private Dex _parent;

        /**
         * index into the string_ids list for the short-form descriptor string of this prototype.
         * The string must conform to the syntax for ShortyDescriptor, defined above,
         * and must correspond to the return type and parameters of this item.
         */
        public long shortyIdx() { return shortyIdx; }

        /**
         * index into the type_ids list for the return type of this prototype
         */
        public long returnTypeIdx() { return returnTypeIdx; }

        /**
         * offset from the start of the file to the list of parameter types for this prototype,
         * or 0 if this prototype has no parameters.
         * This offset, if non-zero, should be in the data section, and the data
         * there should be in the format specified by "type_list" below.
         * Additionally, there should be no reference to the type void in the list.
         */
        public long parametersOff() { return parametersOff; }
        public Dex _root() { return _root; }
        public Dex _parent() { return _parent; }
    }
    public static class EncodedMethod extends KaitaiStruct {
        public static EncodedMethod fromFile(String fileName) throws IOException {
            return new EncodedMethod(new ByteBufferKaitaiStream(fileName));
        }

        public EncodedMethod(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EncodedMethod(KaitaiStream _io, Dex.ClassDataItem _parent) {
            this(_io, _parent, null);
        }

        public EncodedMethod(KaitaiStream _io, Dex.ClassDataItem _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.methodIdxDiff = new VlqBase128Le(this._io);
            this.accessFlags = new VlqBase128Le(this._io);
            this.codeOff = new VlqBase128Le(this._io);
        }
        private VlqBase128Le methodIdxDiff;
        private VlqBase128Le accessFlags;
        private VlqBase128Le codeOff;
        private Dex _root;
        private Dex.ClassDataItem _parent;

        /**
         * index into the method_ids list for the identity of this method
         * (includes the name and descriptor), represented as a difference
         * from the index of previous element in the list.
         * 
         * The index of the first element in a list is represented directly.
         */
        public VlqBase128Le methodIdxDiff() { return methodIdxDiff; }

        /**
         * access flags for the field (public, final, etc.).
         * 
         * See "access_flags Definitions" for details.
         */
        public VlqBase128Le accessFlags() { return accessFlags; }

        /**
         * offset from the start of the file to the code structure for this method,
         * or 0 if this method is either abstract or native.
         * 
         * The offset should be to a location in the data section.
         * 
         * The format of the data is specified by "code_item" below.
         */
        public VlqBase128Le codeOff() { return codeOff; }
        public Dex _root() { return _root; }
        public Dex.ClassDataItem _parent() { return _parent; }
    }
    public static class MapItem extends KaitaiStruct {
        public static MapItem fromFile(String fileName) throws IOException {
            return new MapItem(new ByteBufferKaitaiStream(fileName));
        }

        public enum MapItemType {
            HEADER_ITEM(0),
            STRING_ID_ITEM(1),
            TYPE_ID_ITEM(2),
            PROTO_ID_ITEM(3),
            FIELD_ID_ITEM(4),
            METHOD_ID_ITEM(5),
            CLASS_DEF_ITEM(6),
            CALL_SITE_ID_ITEM(7),
            METHOD_HANDLE_ITEM(8),
            MAP_LIST(4096),
            TYPE_LIST(4097),
            ANNOTATION_SET_REF_LIST(4098),
            ANNOTATION_SET_ITEM(4099),
            CLASS_DATA_ITEM(8192),
            CODE_ITEM(8193),
            STRING_DATA_ITEM(8194),
            DEBUG_INFO_ITEM(8195),
            ANNOTATION_ITEM(8196),
            ENCODED_ARRAY_ITEM(8197),
            ANNOTATIONS_DIRECTORY_ITEM(8198);

            private final long id;
            MapItemType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, MapItemType> byId = new HashMap<Long, MapItemType>(20);
            static {
                for (MapItemType e : MapItemType.values())
                    byId.put(e.id(), e);
            }
            public static MapItemType byId(long id) { return byId.get(id); }
        }

        public MapItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MapItem(KaitaiStream _io, Dex.MapList _parent) {
            this(_io, _parent, null);
        }

        public MapItem(KaitaiStream _io, Dex.MapList _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = MapItemType.byId(this._io.readU2le());
            this.unused = this._io.readU2le();
            this.size = this._io.readU4le();
            this.offset = this._io.readU4le();
        }
        private MapItemType type;
        private int unused;
        private long size;
        private long offset;
        private Dex _root;
        private Dex.MapList _parent;

        /**
         * type of the items; see table below
         */
        public MapItemType type() { return type; }

        /**
         * (unused)
         */
        public int unused() { return unused; }

        /**
         * count of the number of items to be found at the indicated offset
         */
        public long size() { return size; }

        /**
         * offset from the start of the file to the items in question
         */
        public long offset() { return offset; }
        public Dex _root() { return _root; }
        public Dex.MapList _parent() { return _parent; }
    }
    public static class EncodedArray extends KaitaiStruct {
        public static EncodedArray fromFile(String fileName) throws IOException {
            return new EncodedArray(new ByteBufferKaitaiStream(fileName));
        }

        public EncodedArray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EncodedArray(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public EncodedArray(KaitaiStream _io, KaitaiStruct _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = new VlqBase128Le(this._io);
            this.values = new ArrayList<EncodedValue>();
            for (int i = 0; i < size().value(); i++) {
                this.values.add(new EncodedValue(this._io, this, _root));
            }
        }
        private VlqBase128Le size;
        private ArrayList<EncodedValue> values;
        private Dex _root;
        private KaitaiStruct _parent;
        public VlqBase128Le size() { return size; }
        public ArrayList<EncodedValue> values() { return values; }
        public Dex _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private ArrayList<StringIdItem> stringIds;

    /**
     * string identifiers list.
     * 
     * These are identifiers for all the strings used by this file, either for
     * internal naming (e.g., type descriptors) or as constant objects referred to by code.
     * 
     * This list must be sorted by string contents, using UTF-16 code point values
     * (not in a locale-sensitive manner), and it must not contain any duplicate entries.
     */
    public ArrayList<StringIdItem> stringIds() {
        if (this.stringIds != null)
            return this.stringIds;
        long _pos = this._io.pos();
        this._io.seek(header().stringIdsOff());
        this.stringIds = new ArrayList<StringIdItem>();
        for (int i = 0; i < header().stringIdsSize(); i++) {
            this.stringIds.add(new StringIdItem(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.stringIds;
    }
    private ArrayList<MethodIdItem> methodIds;

    /**
     * method identifiers list.
     * 
     * These are identifiers for all methods referred to by this file,
     * whether defined in the file or not.
     * 
     * This list must be sorted, where the defining type (by type_id index
     * is the major order, method name (by string_id index) is the intermediate
     * order, and method prototype (by proto_id index) is the minor order.
     * 
     * The list must not contain any duplicate entries.
     */
    public ArrayList<MethodIdItem> methodIds() {
        if (this.methodIds != null)
            return this.methodIds;
        long _pos = this._io.pos();
        this._io.seek(header().methodIdsOff());
        this.methodIds = new ArrayList<MethodIdItem>();
        for (int i = 0; i < header().methodIdsSize(); i++) {
            this.methodIds.add(new MethodIdItem(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.methodIds;
    }
    private byte[] linkData;

    /**
     * data used in statically linked files.
     * 
     * The format of the data in this section is left unspecified by this document.
     * 
     * This section is empty in unlinked files, and runtime implementations may
     * use it as they see fit.
     */
    public byte[] linkData() {
        if (this.linkData != null)
            return this.linkData;
        long _pos = this._io.pos();
        this._io.seek(header().linkOff());
        this.linkData = this._io.readBytes(header().linkSize());
        this._io.seek(_pos);
        return this.linkData;
    }
    private MapList map;
    public MapList map() {
        if (this.map != null)
            return this.map;
        long _pos = this._io.pos();
        this._io.seek(header().mapOff());
        this.map = new MapList(this._io, this, _root);
        this._io.seek(_pos);
        return this.map;
    }
    private ArrayList<ClassDefItem> classDefs;

    /**
     * class definitions list.
     * 
     * The classes must be ordered such that a given class's superclass and
     * implemented interfaces appear in the list earlier than the referring class.
     * 
     * Furthermore, it is invalid for a definition for the same-named class to
     * appear more than once in the list.
     */
    public ArrayList<ClassDefItem> classDefs() {
        if (this.classDefs != null)
            return this.classDefs;
        long _pos = this._io.pos();
        this._io.seek(header().classDefsOff());
        this.classDefs = new ArrayList<ClassDefItem>();
        for (int i = 0; i < header().classDefsSize(); i++) {
            this.classDefs.add(new ClassDefItem(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.classDefs;
    }
    private byte[] data;

    /**
     * data area, containing all the support data for the tables listed above.
     * 
     * Different items have different alignment requirements, and padding bytes
     * are inserted before each item if necessary to achieve proper alignment.
     */
    public byte[] data() {
        if (this.data != null)
            return this.data;
        long _pos = this._io.pos();
        this._io.seek(header().dataOff());
        this.data = this._io.readBytes(header().dataSize());
        this._io.seek(_pos);
        return this.data;
    }
    private ArrayList<TypeIdItem> typeIds;

    /**
     * type identifiers list.
     * 
     * These are identifiers for all types (classes, arrays, or primitive types)
     * referred to by this file, whether defined in the file or not.
     * 
     * This list must be sorted by string_id index, and it must not contain any duplicate entries.
     */
    public ArrayList<TypeIdItem> typeIds() {
        if (this.typeIds != null)
            return this.typeIds;
        long _pos = this._io.pos();
        this._io.seek(header().typeIdsOff());
        this.typeIds = new ArrayList<TypeIdItem>();
        for (int i = 0; i < header().typeIdsSize(); i++) {
            this.typeIds.add(new TypeIdItem(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.typeIds;
    }
    private ArrayList<ProtoIdItem> protoIds;

    /**
     * method prototype identifiers list.
     * 
     * These are identifiers for all prototypes referred to by this file.
     * 
     * This list must be sorted in return-type (by type_id index) major order,
     * and then by argument list (lexicographic ordering, individual arguments
     * ordered by type_id index). The list must not contain any duplicate entries.
     */
    public ArrayList<ProtoIdItem> protoIds() {
        if (this.protoIds != null)
            return this.protoIds;
        long _pos = this._io.pos();
        this._io.seek(header().protoIdsOff());
        this.protoIds = new ArrayList<ProtoIdItem>();
        for (int i = 0; i < header().protoIdsSize(); i++) {
            this.protoIds.add(new ProtoIdItem(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.protoIds;
    }
    private ArrayList<FieldIdItem> fieldIds;

    /**
     * field identifiers list.
     * 
     * These are identifiers for all fields referred to by this file, whether defined in the file or not.
     * 
     * This list must be sorted, where the defining type (by type_id index)
     * is the major order, field name (by string_id index) is the intermediate
     * order, and type (by type_id index) is the minor order.
     * 
     * The list must not contain any duplicate entries.
     */
    public ArrayList<FieldIdItem> fieldIds() {
        if (this.fieldIds != null)
            return this.fieldIds;
        long _pos = this._io.pos();
        this._io.seek(header().fieldIdsOff());
        this.fieldIds = new ArrayList<FieldIdItem>();
        for (int i = 0; i < header().fieldIdsSize(); i++) {
            this.fieldIds.add(new FieldIdItem(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.fieldIds;
    }
    private HeaderItem header;
    private Dex _root;
    private KaitaiStruct _parent;
    public HeaderItem header() { return header; }
    public Dex _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
