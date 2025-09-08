// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


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
public class Dex extends KaitaiStruct.ReadWrite {
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
    public Dex() {
        this(null, null, null);
    }

    public Dex(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dex(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Dex(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dex _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new HeaderItem(this._io, this, _root);
        this.header._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        classDefs();
        if (this.classDefs != null) {
            for (int i = 0; i < this.classDefs.size(); i++) {
                this.classDefs.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        data();
        if (this.data != null) {
        }
        fieldIds();
        if (this.fieldIds != null) {
            for (int i = 0; i < this.fieldIds.size(); i++) {
                this.fieldIds.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        linkData();
        if (this.linkData != null) {
        }
        map();
        if (this.map != null) {
            this.map._fetchInstances();
        }
        methodIds();
        if (this.methodIds != null) {
            for (int i = 0; i < this.methodIds.size(); i++) {
                this.methodIds.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        protoIds();
        if (this.protoIds != null) {
            for (int i = 0; i < this.protoIds.size(); i++) {
                this.protoIds.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        stringIds();
        if (this.stringIds != null) {
            for (int i = 0; i < this.stringIds.size(); i++) {
                this.stringIds.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        typeIds();
        if (this.typeIds != null) {
            for (int i = 0; i < this.typeIds.size(); i++) {
                this.typeIds.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteClassDefs = _enabledClassDefs;
        _shouldWriteData = _enabledData;
        _shouldWriteFieldIds = _enabledFieldIds;
        _shouldWriteLinkData = _enabledLinkData;
        _shouldWriteMap = _enabledMap;
        _shouldWriteMethodIds = _enabledMethodIds;
        _shouldWriteProtoIds = _enabledProtoIds;
        _shouldWriteStringIds = _enabledStringIds;
        _shouldWriteTypeIds = _enabledTypeIds;
        this.header._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (_enabledClassDefs) {
            if (this.classDefs.size() != header().classDefsSize())
                throw new ConsistencyError("class_defs", header().classDefsSize(), this.classDefs.size());
            for (int i = 0; i < this.classDefs.size(); i++) {
                if (!Objects.equals(this.classDefs.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("class_defs", _root(), this.classDefs.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.classDefs.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("class_defs", this, this.classDefs.get(((Number) (i)).intValue())._parent());
            }
        }
        if (_enabledData) {
            if (this.data.length != header().dataSize())
                throw new ConsistencyError("data", header().dataSize(), this.data.length);
        }
        if (_enabledFieldIds) {
            if (this.fieldIds.size() != header().fieldIdsSize())
                throw new ConsistencyError("field_ids", header().fieldIdsSize(), this.fieldIds.size());
            for (int i = 0; i < this.fieldIds.size(); i++) {
                if (!Objects.equals(this.fieldIds.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("field_ids", _root(), this.fieldIds.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.fieldIds.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("field_ids", this, this.fieldIds.get(((Number) (i)).intValue())._parent());
            }
        }
        if (_enabledLinkData) {
            if (this.linkData.length != header().linkSize())
                throw new ConsistencyError("link_data", header().linkSize(), this.linkData.length);
        }
        if (_enabledMap) {
            if (!Objects.equals(this.map._root(), _root()))
                throw new ConsistencyError("map", _root(), this.map._root());
            if (!Objects.equals(this.map._parent(), this))
                throw new ConsistencyError("map", this, this.map._parent());
        }
        if (_enabledMethodIds) {
            if (this.methodIds.size() != header().methodIdsSize())
                throw new ConsistencyError("method_ids", header().methodIdsSize(), this.methodIds.size());
            for (int i = 0; i < this.methodIds.size(); i++) {
                if (!Objects.equals(this.methodIds.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("method_ids", _root(), this.methodIds.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.methodIds.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("method_ids", this, this.methodIds.get(((Number) (i)).intValue())._parent());
            }
        }
        if (_enabledProtoIds) {
            if (this.protoIds.size() != header().protoIdsSize())
                throw new ConsistencyError("proto_ids", header().protoIdsSize(), this.protoIds.size());
            for (int i = 0; i < this.protoIds.size(); i++) {
                if (!Objects.equals(this.protoIds.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("proto_ids", _root(), this.protoIds.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.protoIds.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("proto_ids", this, this.protoIds.get(((Number) (i)).intValue())._parent());
            }
        }
        if (_enabledStringIds) {
            if (this.stringIds.size() != header().stringIdsSize())
                throw new ConsistencyError("string_ids", header().stringIdsSize(), this.stringIds.size());
            for (int i = 0; i < this.stringIds.size(); i++) {
                if (!Objects.equals(this.stringIds.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("string_ids", _root(), this.stringIds.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.stringIds.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("string_ids", this, this.stringIds.get(((Number) (i)).intValue())._parent());
            }
        }
        if (_enabledTypeIds) {
            if (this.typeIds.size() != header().typeIdsSize())
                throw new ConsistencyError("type_ids", header().typeIdsSize(), this.typeIds.size());
            for (int i = 0; i < this.typeIds.size(); i++) {
                if (!Objects.equals(this.typeIds.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("type_ids", _root(), this.typeIds.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.typeIds.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("type_ids", this, this.typeIds.get(((Number) (i)).intValue())._parent());
            }
        }
        _dirty = false;
    }
    public static class AnnotationElement extends KaitaiStruct.ReadWrite {
        public static AnnotationElement fromFile(String fileName) throws IOException {
            return new AnnotationElement(new ByteBufferKaitaiStream(fileName));
        }
        public AnnotationElement() {
            this(null, null, null);
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
        }
        public void _read() {
            this.nameIdx = new VlqBase128Le(this._io);
            this.nameIdx._read();
            this.value = new EncodedValue(this._io, this, _root);
            this.value._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.nameIdx._fetchInstances();
            this.value._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.nameIdx._write_Seq(this._io);
            this.value._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.value._root(), _root()))
                throw new ConsistencyError("value", _root(), this.value._root());
            if (!Objects.equals(this.value._parent(), this))
                throw new ConsistencyError("value", this, this.value._parent());
            _dirty = false;
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
        public void setNameIdx(VlqBase128Le _v) { _dirty = true; nameIdx = _v; }

        /**
         * element value
         */
        public EncodedValue value() { return value; }
        public void setValue(EncodedValue _v) { _dirty = true; value = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex.EncodedAnnotation _parent() { return _parent; }
        public void set_parent(Dex.EncodedAnnotation _v) { _dirty = true; _parent = _v; }
    }
    public static class CallSiteIdItem extends KaitaiStruct.ReadWrite {
        public static CallSiteIdItem fromFile(String fileName) throws IOException {
            return new CallSiteIdItem(new ByteBufferKaitaiStream(fileName));
        }
        public CallSiteIdItem() {
            this(null, null, null);
        }

        public CallSiteIdItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CallSiteIdItem(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public CallSiteIdItem(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.callSiteOff = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.callSiteOff);
        }

        public void _check() {
            _dirty = false;
        }
        private long callSiteOff;
        private Dex _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * offset from the start of the file to call site definition.
         * 
         * The offset should be in the data section, and the data there should
         * be in the format specified by "call_site_item" below.
         */
        public long callSiteOff() { return callSiteOff; }
        public void setCallSiteOff(long _v) { _dirty = true; callSiteOff = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class ClassDataItem extends KaitaiStruct.ReadWrite {
        public static ClassDataItem fromFile(String fileName) throws IOException {
            return new ClassDataItem(new ByteBufferKaitaiStream(fileName));
        }
        public ClassDataItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.staticFieldsSize = new VlqBase128Le(this._io);
            this.staticFieldsSize._read();
            this.instanceFieldsSize = new VlqBase128Le(this._io);
            this.instanceFieldsSize._read();
            this.directMethodsSize = new VlqBase128Le(this._io);
            this.directMethodsSize._read();
            this.virtualMethodsSize = new VlqBase128Le(this._io);
            this.virtualMethodsSize._read();
            this.staticFields = new ArrayList<EncodedField>();
            for (int i = 0; i < staticFieldsSize().value(); i++) {
                EncodedField _t_staticFields = new EncodedField(this._io, this, _root);
                try {
                    _t_staticFields._read();
                } finally {
                    this.staticFields.add(_t_staticFields);
                }
            }
            this.instanceFields = new ArrayList<EncodedField>();
            for (int i = 0; i < instanceFieldsSize().value(); i++) {
                EncodedField _t_instanceFields = new EncodedField(this._io, this, _root);
                try {
                    _t_instanceFields._read();
                } finally {
                    this.instanceFields.add(_t_instanceFields);
                }
            }
            this.directMethods = new ArrayList<EncodedMethod>();
            for (int i = 0; i < directMethodsSize().value(); i++) {
                EncodedMethod _t_directMethods = new EncodedMethod(this._io, this, _root);
                try {
                    _t_directMethods._read();
                } finally {
                    this.directMethods.add(_t_directMethods);
                }
            }
            this.virtualMethods = new ArrayList<EncodedMethod>();
            for (int i = 0; i < virtualMethodsSize().value(); i++) {
                EncodedMethod _t_virtualMethods = new EncodedMethod(this._io, this, _root);
                try {
                    _t_virtualMethods._read();
                } finally {
                    this.virtualMethods.add(_t_virtualMethods);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.staticFieldsSize._fetchInstances();
            this.instanceFieldsSize._fetchInstances();
            this.directMethodsSize._fetchInstances();
            this.virtualMethodsSize._fetchInstances();
            for (int i = 0; i < this.staticFields.size(); i++) {
                this.staticFields.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.instanceFields.size(); i++) {
                this.instanceFields.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.directMethods.size(); i++) {
                this.directMethods.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.virtualMethods.size(); i++) {
                this.virtualMethods.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.staticFieldsSize._write_Seq(this._io);
            this.instanceFieldsSize._write_Seq(this._io);
            this.directMethodsSize._write_Seq(this._io);
            this.virtualMethodsSize._write_Seq(this._io);
            for (int i = 0; i < this.staticFields.size(); i++) {
                this.staticFields.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            for (int i = 0; i < this.instanceFields.size(); i++) {
                this.instanceFields.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            for (int i = 0; i < this.directMethods.size(); i++) {
                this.directMethods.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            for (int i = 0; i < this.virtualMethods.size(); i++) {
                this.virtualMethods.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.staticFields.size() != staticFieldsSize().value())
                throw new ConsistencyError("static_fields", staticFieldsSize().value(), this.staticFields.size());
            for (int i = 0; i < this.staticFields.size(); i++) {
                if (!Objects.equals(this.staticFields.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("static_fields", _root(), this.staticFields.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.staticFields.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("static_fields", this, this.staticFields.get(((Number) (i)).intValue())._parent());
            }
            if (this.instanceFields.size() != instanceFieldsSize().value())
                throw new ConsistencyError("instance_fields", instanceFieldsSize().value(), this.instanceFields.size());
            for (int i = 0; i < this.instanceFields.size(); i++) {
                if (!Objects.equals(this.instanceFields.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("instance_fields", _root(), this.instanceFields.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.instanceFields.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("instance_fields", this, this.instanceFields.get(((Number) (i)).intValue())._parent());
            }
            if (this.directMethods.size() != directMethodsSize().value())
                throw new ConsistencyError("direct_methods", directMethodsSize().value(), this.directMethods.size());
            for (int i = 0; i < this.directMethods.size(); i++) {
                if (!Objects.equals(this.directMethods.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("direct_methods", _root(), this.directMethods.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.directMethods.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("direct_methods", this, this.directMethods.get(((Number) (i)).intValue())._parent());
            }
            if (this.virtualMethods.size() != virtualMethodsSize().value())
                throw new ConsistencyError("virtual_methods", virtualMethodsSize().value(), this.virtualMethods.size());
            for (int i = 0; i < this.virtualMethods.size(); i++) {
                if (!Objects.equals(this.virtualMethods.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("virtual_methods", _root(), this.virtualMethods.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.virtualMethods.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("virtual_methods", this, this.virtualMethods.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private VlqBase128Le staticFieldsSize;
        private VlqBase128Le instanceFieldsSize;
        private VlqBase128Le directMethodsSize;
        private VlqBase128Le virtualMethodsSize;
        private List<EncodedField> staticFields;
        private List<EncodedField> instanceFields;
        private List<EncodedMethod> directMethods;
        private List<EncodedMethod> virtualMethods;
        private Dex _root;
        private Dex.ClassDefItem _parent;

        /**
         * the number of static fields defined in this item
         */
        public VlqBase128Le staticFieldsSize() { return staticFieldsSize; }
        public void setStaticFieldsSize(VlqBase128Le _v) { _dirty = true; staticFieldsSize = _v; }

        /**
         * the number of instance fields defined in this item
         */
        public VlqBase128Le instanceFieldsSize() { return instanceFieldsSize; }
        public void setInstanceFieldsSize(VlqBase128Le _v) { _dirty = true; instanceFieldsSize = _v; }

        /**
         * the number of direct methods defined in this item
         */
        public VlqBase128Le directMethodsSize() { return directMethodsSize; }
        public void setDirectMethodsSize(VlqBase128Le _v) { _dirty = true; directMethodsSize = _v; }

        /**
         * the number of virtual methods defined in this item
         */
        public VlqBase128Le virtualMethodsSize() { return virtualMethodsSize; }
        public void setVirtualMethodsSize(VlqBase128Le _v) { _dirty = true; virtualMethodsSize = _v; }

        /**
         * the defined static fields, represented as a sequence of encoded elements.
         * 
         * The fields must be sorted by field_idx in increasing order.
         */
        public List<EncodedField> staticFields() { return staticFields; }
        public void setStaticFields(List<EncodedField> _v) { _dirty = true; staticFields = _v; }

        /**
         * the defined instance fields, represented as a sequence of encoded elements.
         * 
         * The fields must be sorted by field_idx in increasing order.
         */
        public List<EncodedField> instanceFields() { return instanceFields; }
        public void setInstanceFields(List<EncodedField> _v) { _dirty = true; instanceFields = _v; }

        /**
         * the defined direct (any of static, private, or constructor) methods,
         * represented as a sequence of encoded elements.
         * 
         * The methods must be sorted by method_idx in increasing order.
         */
        public List<EncodedMethod> directMethods() { return directMethods; }
        public void setDirectMethods(List<EncodedMethod> _v) { _dirty = true; directMethods = _v; }

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
        public List<EncodedMethod> virtualMethods() { return virtualMethods; }
        public void setVirtualMethods(List<EncodedMethod> _v) { _dirty = true; virtualMethods = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex.ClassDefItem _parent() { return _parent; }
        public void set_parent(Dex.ClassDefItem _v) { _dirty = true; _parent = _v; }
    }
    public static class ClassDefItem extends KaitaiStruct.ReadWrite {
        public static ClassDefItem fromFile(String fileName) throws IOException {
            return new ClassDefItem(new ByteBufferKaitaiStream(fileName));
        }
        public ClassDefItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.classIdx = this._io.readU4le();
            this.accessFlags = Dex.ClassAccessFlags.byId(this._io.readU4le());
            this.superclassIdx = this._io.readU4le();
            this.interfacesOff = this._io.readU4le();
            this.sourceFileIdx = this._io.readU4le();
            this.annotationsOff = this._io.readU4le();
            this.classDataOff = this._io.readU4le();
            this.staticValuesOff = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            classData();
            if (this.classData != null) {
                this.classData._fetchInstances();
            }
            staticValues();
            if (this.staticValues != null) {
                this.staticValues._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteClassData = _enabledClassData;
            _shouldWriteStaticValues = _enabledStaticValues;
            this._io.writeU4le(this.classIdx);
            this._io.writeU4le(((Number) (this.accessFlags.id())).longValue());
            this._io.writeU4le(this.superclassIdx);
            this._io.writeU4le(this.interfacesOff);
            this._io.writeU4le(this.sourceFileIdx);
            this._io.writeU4le(this.annotationsOff);
            this._io.writeU4le(this.classDataOff);
            this._io.writeU4le(this.staticValuesOff);
        }

        public void _check() {
            if (_enabledClassData) {
                if (classDataOff() != 0) {
                    if (!Objects.equals(this.classData._root(), _root()))
                        throw new ConsistencyError("class_data", _root(), this.classData._root());
                    if (!Objects.equals(this.classData._parent(), this))
                        throw new ConsistencyError("class_data", this, this.classData._parent());
                }
            }
            if (_enabledStaticValues) {
                if (staticValuesOff() != 0) {
                    if (!Objects.equals(this.staticValues._root(), _root()))
                        throw new ConsistencyError("static_values", _root(), this.staticValues._root());
                    if (!Objects.equals(this.staticValues._parent(), this))
                        throw new ConsistencyError("static_values", this, this.staticValues._parent());
                }
            }
            _dirty = false;
        }
        private ClassDataItem classData;
        private boolean _shouldWriteClassData = false;
        private boolean _enabledClassData = true;
        public ClassDataItem classData() {
            if (_shouldWriteClassData)
                _writeClassData();
            if (this.classData != null)
                return this.classData;
            if (!_enabledClassData)
                return null;
            if (classDataOff() != 0) {
                long _pos = this._io.pos();
                this._io.seek(classDataOff());
                this.classData = new ClassDataItem(this._io, this, _root);
                this.classData._read();
                this._io.seek(_pos);
            }
            return this.classData;
        }
        public void setClassData(ClassDataItem _v) { _dirty = true; classData = _v; }
        public void setClassData_Enabled(boolean _v) { _dirty = true; _enabledClassData = _v; }

        private void _writeClassData() {
            _shouldWriteClassData = false;
            if (classDataOff() != 0) {
                long _pos = this._io.pos();
                this._io.seek(classDataOff());
                this.classData._write_Seq(this._io);
                this._io.seek(_pos);
            }
        }
        private EncodedArrayItem staticValues;
        private boolean _shouldWriteStaticValues = false;
        private boolean _enabledStaticValues = true;
        public EncodedArrayItem staticValues() {
            if (_shouldWriteStaticValues)
                _writeStaticValues();
            if (this.staticValues != null)
                return this.staticValues;
            if (!_enabledStaticValues)
                return null;
            if (staticValuesOff() != 0) {
                long _pos = this._io.pos();
                this._io.seek(staticValuesOff());
                this.staticValues = new EncodedArrayItem(this._io, this, _root);
                this.staticValues._read();
                this._io.seek(_pos);
            }
            return this.staticValues;
        }
        public void setStaticValues(EncodedArrayItem _v) { _dirty = true; staticValues = _v; }
        public void setStaticValues_Enabled(boolean _v) { _dirty = true; _enabledStaticValues = _v; }

        private void _writeStaticValues() {
            _shouldWriteStaticValues = false;
            if (staticValuesOff() != 0) {
                long _pos = this._io.pos();
                this._io.seek(staticValuesOff());
                this.staticValues._write_Seq(this._io);
                this._io.seek(_pos);
            }
        }
        private String typeName;
        public String typeName() {
            if (this.typeName != null)
                return this.typeName;
            this.typeName = _root().typeIds().get(((Number) (classIdx())).intValue()).typeName();
            return this.typeName;
        }
        public void _invalidateTypeName() { this.typeName = null; }
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
        public void setClassIdx(long _v) { _dirty = true; classIdx = _v; }

        /**
         * access flags for the class (public, final, etc.).
         * 
         * See "access_flags Definitions" for details.
         */
        public ClassAccessFlags accessFlags() { return accessFlags; }
        public void setAccessFlags(ClassAccessFlags _v) { _dirty = true; accessFlags = _v; }

        /**
         * index into the type_ids list for the superclass,
         * or the constant value NO_INDEX if this class has no superclass
         * (i.e., it is a root class such as Object).
         * 
         * If present, this must be a class type, and not an array or primitive type.
         */
        public long superclassIdx() { return superclassIdx; }
        public void setSuperclassIdx(long _v) { _dirty = true; superclassIdx = _v; }

        /**
         * offset from the start of the file to the list of interfaces, or 0 if there are none.
         * 
         * This offset should be in the data section, and the data there should
         * be in the format specified by "type_list" below. Each of the elements
         * of the list must be a class type (not an array or primitive type),
         * and there must not be any duplicates.
         */
        public long interfacesOff() { return interfacesOff; }
        public void setInterfacesOff(long _v) { _dirty = true; interfacesOff = _v; }

        /**
         * index into the string_ids list for the name of the file containing
         * the original source for (at least most of) this class, or the
         * special value NO_INDEX to represent a lack of this information.
         * 
         * The debug_info_item of any given method may override this source file,
         * but the expectation is that most classes will only come from one source file.
         */
        public long sourceFileIdx() { return sourceFileIdx; }
        public void setSourceFileIdx(long _v) { _dirty = true; sourceFileIdx = _v; }

        /**
         * offset from the start of the file to the annotations structure for
         * this class, or 0 if there are no annotations on this class.
         * 
         * This offset, if non-zero, should be in the data section, and the data
         * there should be in the format specified by "annotations_directory_item"
         * below,with all items referring to this class as the definer.
         */
        public long annotationsOff() { return annotationsOff; }
        public void setAnnotationsOff(long _v) { _dirty = true; annotationsOff = _v; }

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
        public void setClassDataOff(long _v) { _dirty = true; classDataOff = _v; }

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
        public void setStaticValuesOff(long _v) { _dirty = true; staticValuesOff = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex _parent() { return _parent; }
        public void set_parent(Dex _v) { _dirty = true; _parent = _v; }
    }
    public static class EncodedAnnotation extends KaitaiStruct.ReadWrite {
        public static EncodedAnnotation fromFile(String fileName) throws IOException {
            return new EncodedAnnotation(new ByteBufferKaitaiStream(fileName));
        }
        public EncodedAnnotation() {
            this(null, null, null);
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
        }
        public void _read() {
            this.typeIdx = new VlqBase128Le(this._io);
            this.typeIdx._read();
            this.size = new VlqBase128Le(this._io);
            this.size._read();
            this.elements = new ArrayList<AnnotationElement>();
            for (int i = 0; i < size().value(); i++) {
                AnnotationElement _t_elements = new AnnotationElement(this._io, this, _root);
                try {
                    _t_elements._read();
                } finally {
                    this.elements.add(_t_elements);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.typeIdx._fetchInstances();
            this.size._fetchInstances();
            for (int i = 0; i < this.elements.size(); i++) {
                this.elements.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.typeIdx._write_Seq(this._io);
            this.size._write_Seq(this._io);
            for (int i = 0; i < this.elements.size(); i++) {
                this.elements.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.elements.size() != size().value())
                throw new ConsistencyError("elements", size().value(), this.elements.size());
            for (int i = 0; i < this.elements.size(); i++) {
                if (!Objects.equals(this.elements.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("elements", _root(), this.elements.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.elements.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("elements", this, this.elements.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private VlqBase128Le typeIdx;
        private VlqBase128Le size;
        private List<AnnotationElement> elements;
        private Dex _root;
        private Dex.EncodedValue _parent;

        /**
         * type of the annotation.
         * 
         * This must be a class (not array or primitive) type.
         */
        public VlqBase128Le typeIdx() { return typeIdx; }
        public void setTypeIdx(VlqBase128Le _v) { _dirty = true; typeIdx = _v; }

        /**
         * number of name-value mappings in this annotation
         */
        public VlqBase128Le size() { return size; }
        public void setSize(VlqBase128Le _v) { _dirty = true; size = _v; }

        /**
         * elements of the annotation, represented directly in-line (not as offsets).
         * 
         * Elements must be sorted in increasing order by string_id index.
         */
        public List<AnnotationElement> elements() { return elements; }
        public void setElements(List<AnnotationElement> _v) { _dirty = true; elements = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex.EncodedValue _parent() { return _parent; }
        public void set_parent(Dex.EncodedValue _v) { _dirty = true; _parent = _v; }
    }
    public static class EncodedArray extends KaitaiStruct.ReadWrite {
        public static EncodedArray fromFile(String fileName) throws IOException {
            return new EncodedArray(new ByteBufferKaitaiStream(fileName));
        }
        public EncodedArray() {
            this(null, null, null);
        }

        public EncodedArray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EncodedArray(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public EncodedArray(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.size = new VlqBase128Le(this._io);
            this.size._read();
            this.values = new ArrayList<EncodedValue>();
            for (int i = 0; i < size().value(); i++) {
                EncodedValue _t_values = new EncodedValue(this._io, this, _root);
                try {
                    _t_values._read();
                } finally {
                    this.values.add(_t_values);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.size._fetchInstances();
            for (int i = 0; i < this.values.size(); i++) {
                this.values.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.size._write_Seq(this._io);
            for (int i = 0; i < this.values.size(); i++) {
                this.values.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.values.size() != size().value())
                throw new ConsistencyError("values", size().value(), this.values.size());
            for (int i = 0; i < this.values.size(); i++) {
                if (!Objects.equals(this.values.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("values", _root(), this.values.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.values.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("values", this, this.values.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private VlqBase128Le size;
        private List<EncodedValue> values;
        private Dex _root;
        private KaitaiStruct.ReadWrite _parent;
        public VlqBase128Le size() { return size; }
        public void setSize(VlqBase128Le _v) { _dirty = true; size = _v; }
        public List<EncodedValue> values() { return values; }
        public void setValues(List<EncodedValue> _v) { _dirty = true; values = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class EncodedArrayItem extends KaitaiStruct.ReadWrite {
        public static EncodedArrayItem fromFile(String fileName) throws IOException {
            return new EncodedArrayItem(new ByteBufferKaitaiStream(fileName));
        }
        public EncodedArrayItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.value = new EncodedArray(this._io, this, _root);
            this.value._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.value._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.value._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.value._root(), _root()))
                throw new ConsistencyError("value", _root(), this.value._root());
            if (!Objects.equals(this.value._parent(), this))
                throw new ConsistencyError("value", this, this.value._parent());
            _dirty = false;
        }
        private EncodedArray value;
        private Dex _root;
        private Dex.ClassDefItem _parent;
        public EncodedArray value() { return value; }
        public void setValue(EncodedArray _v) { _dirty = true; value = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex.ClassDefItem _parent() { return _parent; }
        public void set_parent(Dex.ClassDefItem _v) { _dirty = true; _parent = _v; }
    }
    public static class EncodedField extends KaitaiStruct.ReadWrite {
        public static EncodedField fromFile(String fileName) throws IOException {
            return new EncodedField(new ByteBufferKaitaiStream(fileName));
        }
        public EncodedField() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fieldIdxDiff = new VlqBase128Le(this._io);
            this.fieldIdxDiff._read();
            this.accessFlags = new VlqBase128Le(this._io);
            this.accessFlags._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.fieldIdxDiff._fetchInstances();
            this.accessFlags._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.fieldIdxDiff._write_Seq(this._io);
            this.accessFlags._write_Seq(this._io);
        }

        public void _check() {
            _dirty = false;
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
        public void setFieldIdxDiff(VlqBase128Le _v) { _dirty = true; fieldIdxDiff = _v; }

        /**
         * access flags for the field (public, final, etc.).
         * 
         * See "access_flags Definitions" for details.
         */
        public VlqBase128Le accessFlags() { return accessFlags; }
        public void setAccessFlags(VlqBase128Le _v) { _dirty = true; accessFlags = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex.ClassDataItem _parent() { return _parent; }
        public void set_parent(Dex.ClassDataItem _v) { _dirty = true; _parent = _v; }
    }
    public static class EncodedMethod extends KaitaiStruct.ReadWrite {
        public static EncodedMethod fromFile(String fileName) throws IOException {
            return new EncodedMethod(new ByteBufferKaitaiStream(fileName));
        }
        public EncodedMethod() {
            this(null, null, null);
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
        }
        public void _read() {
            this.methodIdxDiff = new VlqBase128Le(this._io);
            this.methodIdxDiff._read();
            this.accessFlags = new VlqBase128Le(this._io);
            this.accessFlags._read();
            this.codeOff = new VlqBase128Le(this._io);
            this.codeOff._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.methodIdxDiff._fetchInstances();
            this.accessFlags._fetchInstances();
            this.codeOff._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.methodIdxDiff._write_Seq(this._io);
            this.accessFlags._write_Seq(this._io);
            this.codeOff._write_Seq(this._io);
        }

        public void _check() {
            _dirty = false;
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
        public void setMethodIdxDiff(VlqBase128Le _v) { _dirty = true; methodIdxDiff = _v; }

        /**
         * access flags for the field (public, final, etc.).
         * 
         * See "access_flags Definitions" for details.
         */
        public VlqBase128Le accessFlags() { return accessFlags; }
        public void setAccessFlags(VlqBase128Le _v) { _dirty = true; accessFlags = _v; }

        /**
         * offset from the start of the file to the code structure for this method,
         * or 0 if this method is either abstract or native.
         * 
         * The offset should be to a location in the data section.
         * 
         * The format of the data is specified by "code_item" below.
         */
        public VlqBase128Le codeOff() { return codeOff; }
        public void setCodeOff(VlqBase128Le _v) { _dirty = true; codeOff = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex.ClassDataItem _parent() { return _parent; }
        public void set_parent(Dex.ClassDataItem _v) { _dirty = true; _parent = _v; }
    }
    public static class EncodedValue extends KaitaiStruct.ReadWrite {
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
        public EncodedValue() {
            this(null, null, null);
        }

        public EncodedValue(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EncodedValue(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public EncodedValue(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.valueArg = this._io.readBitsIntBe(3);
            this.valueType = ValueTypeEnum.byId(this._io.readBitsIntBe(5));
            {
                ValueTypeEnum on = valueType();
                if (on != null) {
                    switch (valueType()) {
                    case ANNOTATION: {
                        this.value = new EncodedAnnotation(this._io, this, _root);
                        ((EncodedAnnotation) (this.value))._read();
                        break;
                    }
                    case ARRAY: {
                        this.value = new EncodedArray(this._io, this, _root);
                        ((EncodedArray) (this.value))._read();
                        break;
                    }
                    case BYTE: {
                        this.value = ((Object) (this._io.readS1()));
                        break;
                    }
                    case CHAR: {
                        this.value = ((Object) (this._io.readU2le()));
                        break;
                    }
                    case DOUBLE: {
                        this.value = ((Object) (this._io.readF8le()));
                        break;
                    }
                    case ENUM: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case FIELD: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case FLOAT: {
                        this.value = ((Object) (this._io.readF4le()));
                        break;
                    }
                    case INT: {
                        this.value = ((Object) (this._io.readS4le()));
                        break;
                    }
                    case LONG: {
                        this.value = ((Object) (this._io.readS8le()));
                        break;
                    }
                    case METHOD: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case METHOD_HANDLE: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case METHOD_TYPE: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case SHORT: {
                        this.value = ((Object) (this._io.readS2le()));
                        break;
                    }
                    case STRING: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case TYPE: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                ValueTypeEnum on = valueType();
                if (on != null) {
                    switch (valueType()) {
                    case ANNOTATION: {
                        ((EncodedAnnotation) (this.value))._fetchInstances();
                        break;
                    }
                    case ARRAY: {
                        ((EncodedArray) (this.value))._fetchInstances();
                        break;
                    }
                    case BYTE: {
                        break;
                    }
                    case CHAR: {
                        break;
                    }
                    case DOUBLE: {
                        break;
                    }
                    case ENUM: {
                        break;
                    }
                    case FIELD: {
                        break;
                    }
                    case FLOAT: {
                        break;
                    }
                    case INT: {
                        break;
                    }
                    case LONG: {
                        break;
                    }
                    case METHOD: {
                        break;
                    }
                    case METHOD_HANDLE: {
                        break;
                    }
                    case METHOD_TYPE: {
                        break;
                    }
                    case SHORT: {
                        break;
                    }
                    case STRING: {
                        break;
                    }
                    case TYPE: {
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(3, this.valueArg);
            this._io.writeBitsIntBe(5, ((Number) (this.valueType.id())).longValue());
            {
                ValueTypeEnum on = valueType();
                if (on != null) {
                    switch (valueType()) {
                    case ANNOTATION: {
                        ((EncodedAnnotation) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case ARRAY: {
                        ((EncodedArray) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case BYTE: {
                        this._io.writeS1(((Number) (this.value)).byteValue());
                        break;
                    }
                    case CHAR: {
                        this._io.writeU2le(((Number) (this.value)).intValue());
                        break;
                    }
                    case DOUBLE: {
                        this._io.writeF8le(((Number) (this.value)).doubleValue());
                        break;
                    }
                    case ENUM: {
                        this._io.writeU4le(((Number) (this.value)).longValue());
                        break;
                    }
                    case FIELD: {
                        this._io.writeU4le(((Number) (this.value)).longValue());
                        break;
                    }
                    case FLOAT: {
                        this._io.writeF4le(((Number) (this.value)).floatValue());
                        break;
                    }
                    case INT: {
                        this._io.writeS4le(((Number) (this.value)).intValue());
                        break;
                    }
                    case LONG: {
                        this._io.writeS8le(((Number) (this.value)).longValue());
                        break;
                    }
                    case METHOD: {
                        this._io.writeU4le(((Number) (this.value)).longValue());
                        break;
                    }
                    case METHOD_HANDLE: {
                        this._io.writeU4le(((Number) (this.value)).longValue());
                        break;
                    }
                    case METHOD_TYPE: {
                        this._io.writeU4le(((Number) (this.value)).longValue());
                        break;
                    }
                    case SHORT: {
                        this._io.writeS2le(((Number) (this.value)).shortValue());
                        break;
                    }
                    case STRING: {
                        this._io.writeU4le(((Number) (this.value)).longValue());
                        break;
                    }
                    case TYPE: {
                        this._io.writeU4le(((Number) (this.value)).longValue());
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            {
                ValueTypeEnum on = valueType();
                if (on != null) {
                    switch (valueType()) {
                    case ANNOTATION: {
                        if (!Objects.equals(((Dex.EncodedAnnotation) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((Dex.EncodedAnnotation) (this.value))._root());
                        if (!Objects.equals(((Dex.EncodedAnnotation) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((Dex.EncodedAnnotation) (this.value))._parent());
                        break;
                    }
                    case ARRAY: {
                        if (!Objects.equals(((Dex.EncodedArray) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((Dex.EncodedArray) (this.value))._root());
                        if (!Objects.equals(((Dex.EncodedArray) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((Dex.EncodedArray) (this.value))._parent());
                        break;
                    }
                    case BYTE: {
                        break;
                    }
                    case CHAR: {
                        break;
                    }
                    case DOUBLE: {
                        break;
                    }
                    case ENUM: {
                        break;
                    }
                    case FIELD: {
                        break;
                    }
                    case FLOAT: {
                        break;
                    }
                    case INT: {
                        break;
                    }
                    case LONG: {
                        break;
                    }
                    case METHOD: {
                        break;
                    }
                    case METHOD_HANDLE: {
                        break;
                    }
                    case METHOD_TYPE: {
                        break;
                    }
                    case SHORT: {
                        break;
                    }
                    case STRING: {
                        break;
                    }
                    case TYPE: {
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        private long valueArg;
        private ValueTypeEnum valueType;
        private Object value;
        private Dex _root;
        private KaitaiStruct.ReadWrite _parent;
        public long valueArg() { return valueArg; }
        public void setValueArg(long _v) { _dirty = true; valueArg = _v; }
        public ValueTypeEnum valueType() { return valueType; }
        public void setValueType(ValueTypeEnum _v) { _dirty = true; valueType = _v; }
        public Object value() { return value; }
        public void setValue(Object _v) { _dirty = true; value = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class FieldIdItem extends KaitaiStruct.ReadWrite {
        public static FieldIdItem fromFile(String fileName) throws IOException {
            return new FieldIdItem(new ByteBufferKaitaiStream(fileName));
        }
        public FieldIdItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.classIdx = this._io.readU2le();
            this.typeIdx = this._io.readU2le();
            this.nameIdx = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.classIdx);
            this._io.writeU2le(this.typeIdx);
            this._io.writeU4le(this.nameIdx);
        }

        public void _check() {
            _dirty = false;
        }
        private String className;

        /**
         * the definer of this field
         */
        public String className() {
            if (this.className != null)
                return this.className;
            this.className = _root().typeIds().get(((Number) (classIdx())).intValue()).typeName();
            return this.className;
        }
        public void _invalidateClassName() { this.className = null; }
        private String fieldName;

        /**
         * the name of this field
         */
        public String fieldName() {
            if (this.fieldName != null)
                return this.fieldName;
            this.fieldName = _root().stringIds().get(((Number) (nameIdx())).intValue()).value().data();
            return this.fieldName;
        }
        public void _invalidateFieldName() { this.fieldName = null; }
        private String typeName;

        /**
         * the type of this field
         */
        public String typeName() {
            if (this.typeName != null)
                return this.typeName;
            this.typeName = _root().typeIds().get(((Number) (typeIdx())).intValue()).typeName();
            return this.typeName;
        }
        public void _invalidateTypeName() { this.typeName = null; }
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
        public void setClassIdx(int _v) { _dirty = true; classIdx = _v; }

        /**
         * index into the type_ids list for the type of this field
         */
        public int typeIdx() { return typeIdx; }
        public void setTypeIdx(int _v) { _dirty = true; typeIdx = _v; }

        /**
         * index into the string_ids list for the name of this field.
         * The string must conform to the syntax for MemberName, defined above.
         */
        public long nameIdx() { return nameIdx; }
        public void setNameIdx(long _v) { _dirty = true; nameIdx = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex _parent() { return _parent; }
        public void set_parent(Dex _v) { _dirty = true; _parent = _v; }
    }
    public static class HeaderItem extends KaitaiStruct.ReadWrite {
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
        public HeaderItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 100, 101, 120, 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 100, 101, 120, 10 }, this.magic, this._io, "/types/header_item/seq/0");
            }
            this.versionStr = new String(KaitaiStream.bytesTerminate(this._io.readBytes(4), (byte) 0, false), StandardCharsets.US_ASCII);
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeBytesLimit((this.versionStr).getBytes(Charset.forName("ASCII")), 4, (byte) 0, (byte) 0);
            this._io.writeU4le(this.checksum);
            this._io.writeBytes(this.signature);
            this._io.writeU4le(this.fileSize);
            this._io.writeU4le(this.headerSize);
            this._io.writeU4le(((Number) (this.endianTag.id())).longValue());
            this._io.writeU4le(this.linkSize);
            this._io.writeU4le(this.linkOff);
            this._io.writeU4le(this.mapOff);
            this._io.writeU4le(this.stringIdsSize);
            this._io.writeU4le(this.stringIdsOff);
            this._io.writeU4le(this.typeIdsSize);
            this._io.writeU4le(this.typeIdsOff);
            this._io.writeU4le(this.protoIdsSize);
            this._io.writeU4le(this.protoIdsOff);
            this._io.writeU4le(this.fieldIdsSize);
            this._io.writeU4le(this.fieldIdsOff);
            this._io.writeU4le(this.methodIdsSize);
            this._io.writeU4le(this.methodIdsOff);
            this._io.writeU4le(this.classDefsSize);
            this._io.writeU4le(this.classDefsOff);
            this._io.writeU4le(this.dataSize);
            this._io.writeU4le(this.dataOff);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 100, 101, 120, 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 100, 101, 120, 10 }, this.magic, null, "/types/header_item/seq/0");
            }
            if ((this.versionStr).getBytes(Charset.forName("ASCII")).length > 4)
                throw new ConsistencyError("version_str", 4, (this.versionStr).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.versionStr).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("version_str", -1, KaitaiStream.byteArrayIndexOf((this.versionStr).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (this.signature.length != 20)
                throw new ConsistencyError("signature", 20, this.signature.length);
            _dirty = false;
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
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public String versionStr() { return versionStr; }
        public void setVersionStr(String _v) { _dirty = true; versionStr = _v; }

        /**
         * adler32 checksum of the rest of the file (everything but magic and this field);
         * used to detect file corruption
         */
        public long checksum() { return checksum; }
        public void setChecksum(long _v) { _dirty = true; checksum = _v; }

        /**
         * SHA-1 signature (hash) of the rest of the file (everything but magic, checksum,
         * and this field); used to uniquely identify files
         */
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }

        /**
         * size of the entire file (including the header), in bytes
         */
        public long fileSize() { return fileSize; }
        public void setFileSize(long _v) { _dirty = true; fileSize = _v; }

        /**
         * size of the header (this entire section), in bytes. This allows for at
         * least a limited amount of backwards/forwards compatibility without
         * invalidating the format.
         */
        public long headerSize() { return headerSize; }
        public void setHeaderSize(long _v) { _dirty = true; headerSize = _v; }
        public EndianConstant endianTag() { return endianTag; }
        public void setEndianTag(EndianConstant _v) { _dirty = true; endianTag = _v; }

        /**
         * size of the link section, or 0 if this file isn't statically linked
         */
        public long linkSize() { return linkSize; }
        public void setLinkSize(long _v) { _dirty = true; linkSize = _v; }

        /**
         * offset from the start of the file to the link section, or 0 if link_size == 0.
         * The offset, if non-zero, should be to an offset into the link_data section.
         * The format of the data pointed at is left unspecified by this document;
         * this header field (and the previous) are left as hooks for use by runtime implementations.
         */
        public long linkOff() { return linkOff; }
        public void setLinkOff(long _v) { _dirty = true; linkOff = _v; }

        /**
         * offset from the start of the file to the map item.
         * The offset, which must be non-zero, should be to an offset into the data
         * section, and the data should be in the format specified by "map_list" below.
         */
        public long mapOff() { return mapOff; }
        public void setMapOff(long _v) { _dirty = true; mapOff = _v; }

        /**
         * count of strings in the string identifiers list
         */
        public long stringIdsSize() { return stringIdsSize; }
        public void setStringIdsSize(long _v) { _dirty = true; stringIdsSize = _v; }

        /**
         * offset from the start of the file to the string identifiers list,
         * or 0 if string_ids_size == 0 (admittedly a strange edge case).
         * The offset, if non-zero, should be to the start of the string_ids section.
         */
        public long stringIdsOff() { return stringIdsOff; }
        public void setStringIdsOff(long _v) { _dirty = true; stringIdsOff = _v; }

        /**
         * count of elements in the type identifiers list, at most 65535
         */
        public long typeIdsSize() { return typeIdsSize; }
        public void setTypeIdsSize(long _v) { _dirty = true; typeIdsSize = _v; }

        /**
         * offset from the start of the file to the type identifiers list,
         * or 0 if type_ids_size == 0 (admittedly a strange edge case).
         * The offset, if non-zero, should be to the start of the type_ids section.
         */
        public long typeIdsOff() { return typeIdsOff; }
        public void setTypeIdsOff(long _v) { _dirty = true; typeIdsOff = _v; }

        /**
         * count of elements in the prototype identifiers list, at most 65535
         */
        public long protoIdsSize() { return protoIdsSize; }
        public void setProtoIdsSize(long _v) { _dirty = true; protoIdsSize = _v; }

        /**
         * offset from the start of the file to the prototype identifiers list,
         * or 0 if proto_ids_size == 0 (admittedly a strange edge case).
         * The offset, if non-zero, should be to the start of the proto_ids section.
         */
        public long protoIdsOff() { return protoIdsOff; }
        public void setProtoIdsOff(long _v) { _dirty = true; protoIdsOff = _v; }

        /**
         * count of elements in the field identifiers list
         */
        public long fieldIdsSize() { return fieldIdsSize; }
        public void setFieldIdsSize(long _v) { _dirty = true; fieldIdsSize = _v; }

        /**
         * offset from the start of the file to the field identifiers list,
         * or 0 if field_ids_size == 0.
         * The offset, if non-zero, should be to the start of the field_ids section.
         */
        public long fieldIdsOff() { return fieldIdsOff; }
        public void setFieldIdsOff(long _v) { _dirty = true; fieldIdsOff = _v; }

        /**
         * count of elements in the method identifiers list
         */
        public long methodIdsSize() { return methodIdsSize; }
        public void setMethodIdsSize(long _v) { _dirty = true; methodIdsSize = _v; }

        /**
         * offset from the start of the file to the method identifiers list,
         * or 0 if method_ids_size == 0.
         * The offset, if non-zero, should be to the start of the method_ids section.
         */
        public long methodIdsOff() { return methodIdsOff; }
        public void setMethodIdsOff(long _v) { _dirty = true; methodIdsOff = _v; }

        /**
         * count of elements in the class definitions list
         */
        public long classDefsSize() { return classDefsSize; }
        public void setClassDefsSize(long _v) { _dirty = true; classDefsSize = _v; }

        /**
         * offset from the start of the file to the class definitions list,
         * or 0 if class_defs_size == 0 (admittedly a strange edge case).
         * The offset, if non-zero, should be to the start of the class_defs section.
         */
        public long classDefsOff() { return classDefsOff; }
        public void setClassDefsOff(long _v) { _dirty = true; classDefsOff = _v; }

        /**
         * Size of data section in bytes. Must be an even multiple of sizeof(uint).
         */
        public long dataSize() { return dataSize; }
        public void setDataSize(long _v) { _dirty = true; dataSize = _v; }

        /**
         * offset from the start of the file to the start of the data section.
         */
        public long dataOff() { return dataOff; }
        public void setDataOff(long _v) { _dirty = true; dataOff = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex _parent() { return _parent; }
        public void set_parent(Dex _v) { _dirty = true; _parent = _v; }
    }
    public static class MapItem extends KaitaiStruct.ReadWrite {
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
        public MapItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.type = MapItemType.byId(this._io.readU2le());
            this.unused = this._io.readU2le();
            this.size = this._io.readU4le();
            this.offset = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.type.id())).intValue());
            this._io.writeU2le(this.unused);
            this._io.writeU4le(this.size);
            this._io.writeU4le(this.offset);
        }

        public void _check() {
            _dirty = false;
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
        public void setType(MapItemType _v) { _dirty = true; type = _v; }

        /**
         * (unused)
         */
        public int unused() { return unused; }
        public void setUnused(int _v) { _dirty = true; unused = _v; }

        /**
         * count of the number of items to be found at the indicated offset
         */
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }

        /**
         * offset from the start of the file to the items in question
         */
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex.MapList _parent() { return _parent; }
        public void set_parent(Dex.MapList _v) { _dirty = true; _parent = _v; }
    }
    public static class MapList extends KaitaiStruct.ReadWrite {
        public static MapList fromFile(String fileName) throws IOException {
            return new MapList(new ByteBufferKaitaiStream(fileName));
        }
        public MapList() {
            this(null, null, null);
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
        }
        public void _read() {
            this.size = this._io.readU4le();
            this.list = new ArrayList<MapItem>();
            for (int i = 0; i < size(); i++) {
                MapItem _t_list = new MapItem(this._io, this, _root);
                try {
                    _t_list._read();
                } finally {
                    this.list.add(_t_list);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.list.size(); i++) {
                this.list.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.size);
            for (int i = 0; i < this.list.size(); i++) {
                this.list.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.list.size() != size())
                throw new ConsistencyError("list", size(), this.list.size());
            for (int i = 0; i < this.list.size(); i++) {
                if (!Objects.equals(this.list.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("list", _root(), this.list.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.list.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("list", this, this.list.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long size;
        private List<MapItem> list;
        private Dex _root;
        private Dex _parent;
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public List<MapItem> list() { return list; }
        public void setList(List<MapItem> _v) { _dirty = true; list = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex _parent() { return _parent; }
        public void set_parent(Dex _v) { _dirty = true; _parent = _v; }
    }
    public static class MethodIdItem extends KaitaiStruct.ReadWrite {
        public static MethodIdItem fromFile(String fileName) throws IOException {
            return new MethodIdItem(new ByteBufferKaitaiStream(fileName));
        }
        public MethodIdItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.classIdx = this._io.readU2le();
            this.protoIdx = this._io.readU2le();
            this.nameIdx = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.classIdx);
            this._io.writeU2le(this.protoIdx);
            this._io.writeU4le(this.nameIdx);
        }

        public void _check() {
            _dirty = false;
        }
        private String className;

        /**
         * the definer of this method
         */
        public String className() {
            if (this.className != null)
                return this.className;
            this.className = _root().typeIds().get(((Number) (classIdx())).intValue()).typeName();
            return this.className;
        }
        public void _invalidateClassName() { this.className = null; }
        private String methodName;

        /**
         * the name of this method
         */
        public String methodName() {
            if (this.methodName != null)
                return this.methodName;
            this.methodName = _root().stringIds().get(((Number) (nameIdx())).intValue()).value().data();
            return this.methodName;
        }
        public void _invalidateMethodName() { this.methodName = null; }
        private String protoDesc;

        /**
         * the short-form descriptor of the prototype of this method
         */
        public String protoDesc() {
            if (this.protoDesc != null)
                return this.protoDesc;
            this.protoDesc = _root().protoIds().get(((Number) (protoIdx())).intValue()).shortyDesc();
            return this.protoDesc;
        }
        public void _invalidateProtoDesc() { this.protoDesc = null; }
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
        public void setClassIdx(int _v) { _dirty = true; classIdx = _v; }

        /**
         * index into the proto_ids list for the prototype of this method
         */
        public int protoIdx() { return protoIdx; }
        public void setProtoIdx(int _v) { _dirty = true; protoIdx = _v; }

        /**
         * index into the string_ids list for the name of this method.
         * The string must conform to the syntax for MemberName, defined above.
         */
        public long nameIdx() { return nameIdx; }
        public void setNameIdx(long _v) { _dirty = true; nameIdx = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex _parent() { return _parent; }
        public void set_parent(Dex _v) { _dirty = true; _parent = _v; }
    }
    public static class ProtoIdItem extends KaitaiStruct.ReadWrite {
        public static ProtoIdItem fromFile(String fileName) throws IOException {
            return new ProtoIdItem(new ByteBufferKaitaiStream(fileName));
        }
        public ProtoIdItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.shortyIdx = this._io.readU4le();
            this.returnTypeIdx = this._io.readU4le();
            this.parametersOff = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            paramsTypes();
            if (this.paramsTypes != null) {
                this.paramsTypes._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteParamsTypes = _enabledParamsTypes;
            this._io.writeU4le(this.shortyIdx);
            this._io.writeU4le(this.returnTypeIdx);
            this._io.writeU4le(this.parametersOff);
        }

        public void _check() {
            if (_enabledParamsTypes) {
                if (parametersOff() != 0) {
                    if (!Objects.equals(this.paramsTypes._root(), _root()))
                        throw new ConsistencyError("params_types", _root(), this.paramsTypes._root());
                    if (!Objects.equals(this.paramsTypes._parent(), this))
                        throw new ConsistencyError("params_types", this, this.paramsTypes._parent());
                }
            }
            _dirty = false;
        }
        private TypeList paramsTypes;
        private boolean _shouldWriteParamsTypes = false;
        private boolean _enabledParamsTypes = true;

        /**
         * list of parameter types for this prototype
         */
        public TypeList paramsTypes() {
            if (_shouldWriteParamsTypes)
                _writeParamsTypes();
            if (this.paramsTypes != null)
                return this.paramsTypes;
            if (!_enabledParamsTypes)
                return null;
            if (parametersOff() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(parametersOff());
                this.paramsTypes = new TypeList(io, this, _root);
                this.paramsTypes._read();
                io.seek(_pos);
            }
            return this.paramsTypes;
        }
        public void setParamsTypes(TypeList _v) { _dirty = true; paramsTypes = _v; }
        public void setParamsTypes_Enabled(boolean _v) { _dirty = true; _enabledParamsTypes = _v; }

        private void _writeParamsTypes() {
            _shouldWriteParamsTypes = false;
            if (parametersOff() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(parametersOff());
                this.paramsTypes._write_Seq(io);
                io.seek(_pos);
            }
        }
        private String returnType;

        /**
         * return type of this prototype
         */
        public String returnType() {
            if (this.returnType != null)
                return this.returnType;
            this.returnType = _root().typeIds().get(((Number) (returnTypeIdx())).intValue()).typeName();
            return this.returnType;
        }
        public void _invalidateReturnType() { this.returnType = null; }
        private String shortyDesc;

        /**
         * short-form descriptor string of this prototype, as pointed to by shorty_idx
         */
        public String shortyDesc() {
            if (this.shortyDesc != null)
                return this.shortyDesc;
            this.shortyDesc = _root().stringIds().get(((Number) (shortyIdx())).intValue()).value().data();
            return this.shortyDesc;
        }
        public void _invalidateShortyDesc() { this.shortyDesc = null; }
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
        public void setShortyIdx(long _v) { _dirty = true; shortyIdx = _v; }

        /**
         * index into the type_ids list for the return type of this prototype
         */
        public long returnTypeIdx() { return returnTypeIdx; }
        public void setReturnTypeIdx(long _v) { _dirty = true; returnTypeIdx = _v; }

        /**
         * offset from the start of the file to the list of parameter types for this prototype,
         * or 0 if this prototype has no parameters.
         * This offset, if non-zero, should be in the data section, and the data
         * there should be in the format specified by "type_list" below.
         * Additionally, there should be no reference to the type void in the list.
         */
        public long parametersOff() { return parametersOff; }
        public void setParametersOff(long _v) { _dirty = true; parametersOff = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex _parent() { return _parent; }
        public void set_parent(Dex _v) { _dirty = true; _parent = _v; }
    }
    public static class StringIdItem extends KaitaiStruct.ReadWrite {
        public static StringIdItem fromFile(String fileName) throws IOException {
            return new StringIdItem(new ByteBufferKaitaiStream(fileName));
        }
        public StringIdItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.stringDataOff = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            value();
            if (this.value != null) {
                this.value._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteValue = _enabledValue;
            this._io.writeU4le(this.stringDataOff);
        }

        public void _check() {
            if (_enabledValue) {
                if (!Objects.equals(this.value._root(), _root()))
                    throw new ConsistencyError("value", _root(), this.value._root());
                if (!Objects.equals(this.value._parent(), this))
                    throw new ConsistencyError("value", this, this.value._parent());
            }
            _dirty = false;
        }
        public static class StringDataItem extends KaitaiStruct.ReadWrite {
            public static StringDataItem fromFile(String fileName) throws IOException {
                return new StringDataItem(new ByteBufferKaitaiStream(fileName));
            }
            public StringDataItem() {
                this(null, null, null);
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
            }
            public void _read() {
                this.utf16Size = new VlqBase128Le(this._io);
                this.utf16Size._read();
                this.data = new String(this._io.readBytes(utf16Size().value()), StandardCharsets.US_ASCII);
                _dirty = false;
            }

            public void _fetchInstances() {
                this.utf16Size._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.utf16Size._write_Seq(this._io);
                this._io.writeBytes((this.data).getBytes(Charset.forName("ASCII")));
            }

            public void _check() {
                if ((this.data).getBytes(Charset.forName("ASCII")).length != utf16Size().value())
                    throw new ConsistencyError("data", utf16Size().value(), (this.data).getBytes(Charset.forName("ASCII")).length);
                _dirty = false;
            }
            private VlqBase128Le utf16Size;
            private String data;
            private Dex _root;
            private Dex.StringIdItem _parent;
            public VlqBase128Le utf16Size() { return utf16Size; }
            public void setUtf16Size(VlqBase128Le _v) { _dirty = true; utf16Size = _v; }
            public String data() { return data; }
            public void setData(String _v) { _dirty = true; data = _v; }
            public Dex _root() { return _root; }
            public void set_root(Dex _v) { _dirty = true; _root = _v; }
            public Dex.StringIdItem _parent() { return _parent; }
            public void set_parent(Dex.StringIdItem _v) { _dirty = true; _parent = _v; }
        }
        private StringDataItem value;
        private boolean _shouldWriteValue = false;
        private boolean _enabledValue = true;
        public StringDataItem value() {
            if (_shouldWriteValue)
                _writeValue();
            if (this.value != null)
                return this.value;
            if (!_enabledValue)
                return null;
            long _pos = this._io.pos();
            this._io.seek(stringDataOff());
            this.value = new StringDataItem(this._io, this, _root);
            this.value._read();
            this._io.seek(_pos);
            return this.value;
        }
        public void setValue(StringDataItem _v) { _dirty = true; value = _v; }
        public void setValue_Enabled(boolean _v) { _dirty = true; _enabledValue = _v; }

        private void _writeValue() {
            _shouldWriteValue = false;
            long _pos = this._io.pos();
            this._io.seek(stringDataOff());
            this.value._write_Seq(this._io);
            this._io.seek(_pos);
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
        public void setStringDataOff(long _v) { _dirty = true; stringDataOff = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex _parent() { return _parent; }
        public void set_parent(Dex _v) { _dirty = true; _parent = _v; }
    }
    public static class TypeIdItem extends KaitaiStruct.ReadWrite {
        public static TypeIdItem fromFile(String fileName) throws IOException {
            return new TypeIdItem(new ByteBufferKaitaiStream(fileName));
        }
        public TypeIdItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.descriptorIdx = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.descriptorIdx);
        }

        public void _check() {
            _dirty = false;
        }
        private String typeName;
        public String typeName() {
            if (this.typeName != null)
                return this.typeName;
            this.typeName = _root().stringIds().get(((Number) (descriptorIdx())).intValue()).value().data();
            return this.typeName;
        }
        public void _invalidateTypeName() { this.typeName = null; }
        private long descriptorIdx;
        private Dex _root;
        private Dex _parent;

        /**
         * index into the string_ids list for the descriptor string of this type.
         * The string must conform to the syntax for TypeDescriptor, defined above.
         */
        public long descriptorIdx() { return descriptorIdx; }
        public void setDescriptorIdx(long _v) { _dirty = true; descriptorIdx = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex _parent() { return _parent; }
        public void set_parent(Dex _v) { _dirty = true; _parent = _v; }
    }
    public static class TypeItem extends KaitaiStruct.ReadWrite {
        public static TypeItem fromFile(String fileName) throws IOException {
            return new TypeItem(new ByteBufferKaitaiStream(fileName));
        }
        public TypeItem() {
            this(null, null, null);
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
        }
        public void _read() {
            this.typeIdx = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.typeIdx);
        }

        public void _check() {
            _dirty = false;
        }
        private String value;
        public String value() {
            if (this.value != null)
                return this.value;
            this.value = _root().typeIds().get(((Number) (typeIdx())).intValue()).typeName();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private int typeIdx;
        private Dex _root;
        private Dex.TypeList _parent;
        public int typeIdx() { return typeIdx; }
        public void setTypeIdx(int _v) { _dirty = true; typeIdx = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex.TypeList _parent() { return _parent; }
        public void set_parent(Dex.TypeList _v) { _dirty = true; _parent = _v; }
    }
    public static class TypeList extends KaitaiStruct.ReadWrite {
        public static TypeList fromFile(String fileName) throws IOException {
            return new TypeList(new ByteBufferKaitaiStream(fileName));
        }
        public TypeList() {
            this(null, null, null);
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
        }
        public void _read() {
            this.size = this._io.readU4le();
            this.list = new ArrayList<TypeItem>();
            for (int i = 0; i < size(); i++) {
                TypeItem _t_list = new TypeItem(this._io, this, _root);
                try {
                    _t_list._read();
                } finally {
                    this.list.add(_t_list);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.list.size(); i++) {
                this.list.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.size);
            for (int i = 0; i < this.list.size(); i++) {
                this.list.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.list.size() != size())
                throw new ConsistencyError("list", size(), this.list.size());
            for (int i = 0; i < this.list.size(); i++) {
                if (!Objects.equals(this.list.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("list", _root(), this.list.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.list.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("list", this, this.list.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long size;
        private List<TypeItem> list;
        private Dex _root;
        private Dex.ProtoIdItem _parent;
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public List<TypeItem> list() { return list; }
        public void setList(List<TypeItem> _v) { _dirty = true; list = _v; }
        public Dex _root() { return _root; }
        public void set_root(Dex _v) { _dirty = true; _root = _v; }
        public Dex.ProtoIdItem _parent() { return _parent; }
        public void set_parent(Dex.ProtoIdItem _v) { _dirty = true; _parent = _v; }
    }
    private List<ClassDefItem> classDefs;
    private boolean _shouldWriteClassDefs = false;
    private boolean _enabledClassDefs = true;

    /**
     * class definitions list.
     * 
     * The classes must be ordered such that a given class's superclass and
     * implemented interfaces appear in the list earlier than the referring class.
     * 
     * Furthermore, it is invalid for a definition for the same-named class to
     * appear more than once in the list.
     */
    public List<ClassDefItem> classDefs() {
        if (_shouldWriteClassDefs)
            _writeClassDefs();
        if (this.classDefs != null)
            return this.classDefs;
        if (!_enabledClassDefs)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().classDefsOff());
        this.classDefs = new ArrayList<ClassDefItem>();
        for (int i = 0; i < header().classDefsSize(); i++) {
            ClassDefItem _t_classDefs = new ClassDefItem(this._io, this, _root);
            try {
                _t_classDefs._read();
            } finally {
                this.classDefs.add(_t_classDefs);
            }
        }
        this._io.seek(_pos);
        return this.classDefs;
    }
    public void setClassDefs(List<ClassDefItem> _v) { _dirty = true; classDefs = _v; }
    public void setClassDefs_Enabled(boolean _v) { _dirty = true; _enabledClassDefs = _v; }

    private void _writeClassDefs() {
        _shouldWriteClassDefs = false;
        long _pos = this._io.pos();
        this._io.seek(header().classDefsOff());
        for (int i = 0; i < this.classDefs.size(); i++) {
            this.classDefs.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private byte[] data;
    private boolean _shouldWriteData = false;
    private boolean _enabledData = true;

    /**
     * data area, containing all the support data for the tables listed above.
     * 
     * Different items have different alignment requirements, and padding bytes
     * are inserted before each item if necessary to achieve proper alignment.
     */
    public byte[] data() {
        if (_shouldWriteData)
            _writeData();
        if (this.data != null)
            return this.data;
        if (!_enabledData)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().dataOff());
        this.data = this._io.readBytes(header().dataSize());
        this._io.seek(_pos);
        return this.data;
    }
    public void setData(byte[] _v) { _dirty = true; data = _v; }
    public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

    private void _writeData() {
        _shouldWriteData = false;
        long _pos = this._io.pos();
        this._io.seek(header().dataOff());
        this._io.writeBytes(this.data);
        this._io.seek(_pos);
    }
    private List<FieldIdItem> fieldIds;
    private boolean _shouldWriteFieldIds = false;
    private boolean _enabledFieldIds = true;

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
    public List<FieldIdItem> fieldIds() {
        if (_shouldWriteFieldIds)
            _writeFieldIds();
        if (this.fieldIds != null)
            return this.fieldIds;
        if (!_enabledFieldIds)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().fieldIdsOff());
        this.fieldIds = new ArrayList<FieldIdItem>();
        for (int i = 0; i < header().fieldIdsSize(); i++) {
            FieldIdItem _t_fieldIds = new FieldIdItem(this._io, this, _root);
            try {
                _t_fieldIds._read();
            } finally {
                this.fieldIds.add(_t_fieldIds);
            }
        }
        this._io.seek(_pos);
        return this.fieldIds;
    }
    public void setFieldIds(List<FieldIdItem> _v) { _dirty = true; fieldIds = _v; }
    public void setFieldIds_Enabled(boolean _v) { _dirty = true; _enabledFieldIds = _v; }

    private void _writeFieldIds() {
        _shouldWriteFieldIds = false;
        long _pos = this._io.pos();
        this._io.seek(header().fieldIdsOff());
        for (int i = 0; i < this.fieldIds.size(); i++) {
            this.fieldIds.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private byte[] linkData;
    private boolean _shouldWriteLinkData = false;
    private boolean _enabledLinkData = true;

    /**
     * data used in statically linked files.
     * 
     * The format of the data in this section is left unspecified by this document.
     * 
     * This section is empty in unlinked files, and runtime implementations may
     * use it as they see fit.
     */
    public byte[] linkData() {
        if (_shouldWriteLinkData)
            _writeLinkData();
        if (this.linkData != null)
            return this.linkData;
        if (!_enabledLinkData)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().linkOff());
        this.linkData = this._io.readBytes(header().linkSize());
        this._io.seek(_pos);
        return this.linkData;
    }
    public void setLinkData(byte[] _v) { _dirty = true; linkData = _v; }
    public void setLinkData_Enabled(boolean _v) { _dirty = true; _enabledLinkData = _v; }

    private void _writeLinkData() {
        _shouldWriteLinkData = false;
        long _pos = this._io.pos();
        this._io.seek(header().linkOff());
        this._io.writeBytes(this.linkData);
        this._io.seek(_pos);
    }
    private MapList map;
    private boolean _shouldWriteMap = false;
    private boolean _enabledMap = true;
    public MapList map() {
        if (_shouldWriteMap)
            _writeMap();
        if (this.map != null)
            return this.map;
        if (!_enabledMap)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().mapOff());
        this.map = new MapList(this._io, this, _root);
        this.map._read();
        this._io.seek(_pos);
        return this.map;
    }
    public void setMap(MapList _v) { _dirty = true; map = _v; }
    public void setMap_Enabled(boolean _v) { _dirty = true; _enabledMap = _v; }

    private void _writeMap() {
        _shouldWriteMap = false;
        long _pos = this._io.pos();
        this._io.seek(header().mapOff());
        this.map._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private List<MethodIdItem> methodIds;
    private boolean _shouldWriteMethodIds = false;
    private boolean _enabledMethodIds = true;

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
    public List<MethodIdItem> methodIds() {
        if (_shouldWriteMethodIds)
            _writeMethodIds();
        if (this.methodIds != null)
            return this.methodIds;
        if (!_enabledMethodIds)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().methodIdsOff());
        this.methodIds = new ArrayList<MethodIdItem>();
        for (int i = 0; i < header().methodIdsSize(); i++) {
            MethodIdItem _t_methodIds = new MethodIdItem(this._io, this, _root);
            try {
                _t_methodIds._read();
            } finally {
                this.methodIds.add(_t_methodIds);
            }
        }
        this._io.seek(_pos);
        return this.methodIds;
    }
    public void setMethodIds(List<MethodIdItem> _v) { _dirty = true; methodIds = _v; }
    public void setMethodIds_Enabled(boolean _v) { _dirty = true; _enabledMethodIds = _v; }

    private void _writeMethodIds() {
        _shouldWriteMethodIds = false;
        long _pos = this._io.pos();
        this._io.seek(header().methodIdsOff());
        for (int i = 0; i < this.methodIds.size(); i++) {
            this.methodIds.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private List<ProtoIdItem> protoIds;
    private boolean _shouldWriteProtoIds = false;
    private boolean _enabledProtoIds = true;

    /**
     * method prototype identifiers list.
     * 
     * These are identifiers for all prototypes referred to by this file.
     * 
     * This list must be sorted in return-type (by type_id index) major order,
     * and then by argument list (lexicographic ordering, individual arguments
     * ordered by type_id index). The list must not contain any duplicate entries.
     */
    public List<ProtoIdItem> protoIds() {
        if (_shouldWriteProtoIds)
            _writeProtoIds();
        if (this.protoIds != null)
            return this.protoIds;
        if (!_enabledProtoIds)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().protoIdsOff());
        this.protoIds = new ArrayList<ProtoIdItem>();
        for (int i = 0; i < header().protoIdsSize(); i++) {
            ProtoIdItem _t_protoIds = new ProtoIdItem(this._io, this, _root);
            try {
                _t_protoIds._read();
            } finally {
                this.protoIds.add(_t_protoIds);
            }
        }
        this._io.seek(_pos);
        return this.protoIds;
    }
    public void setProtoIds(List<ProtoIdItem> _v) { _dirty = true; protoIds = _v; }
    public void setProtoIds_Enabled(boolean _v) { _dirty = true; _enabledProtoIds = _v; }

    private void _writeProtoIds() {
        _shouldWriteProtoIds = false;
        long _pos = this._io.pos();
        this._io.seek(header().protoIdsOff());
        for (int i = 0; i < this.protoIds.size(); i++) {
            this.protoIds.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private List<StringIdItem> stringIds;
    private boolean _shouldWriteStringIds = false;
    private boolean _enabledStringIds = true;

    /**
     * string identifiers list.
     * 
     * These are identifiers for all the strings used by this file, either for
     * internal naming (e.g., type descriptors) or as constant objects referred to by code.
     * 
     * This list must be sorted by string contents, using UTF-16 code point values
     * (not in a locale-sensitive manner), and it must not contain any duplicate entries.
     */
    public List<StringIdItem> stringIds() {
        if (_shouldWriteStringIds)
            _writeStringIds();
        if (this.stringIds != null)
            return this.stringIds;
        if (!_enabledStringIds)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().stringIdsOff());
        this.stringIds = new ArrayList<StringIdItem>();
        for (int i = 0; i < header().stringIdsSize(); i++) {
            StringIdItem _t_stringIds = new StringIdItem(this._io, this, _root);
            try {
                _t_stringIds._read();
            } finally {
                this.stringIds.add(_t_stringIds);
            }
        }
        this._io.seek(_pos);
        return this.stringIds;
    }
    public void setStringIds(List<StringIdItem> _v) { _dirty = true; stringIds = _v; }
    public void setStringIds_Enabled(boolean _v) { _dirty = true; _enabledStringIds = _v; }

    private void _writeStringIds() {
        _shouldWriteStringIds = false;
        long _pos = this._io.pos();
        this._io.seek(header().stringIdsOff());
        for (int i = 0; i < this.stringIds.size(); i++) {
            this.stringIds.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private List<TypeIdItem> typeIds;
    private boolean _shouldWriteTypeIds = false;
    private boolean _enabledTypeIds = true;

    /**
     * type identifiers list.
     * 
     * These are identifiers for all types (classes, arrays, or primitive types)
     * referred to by this file, whether defined in the file or not.
     * 
     * This list must be sorted by string_id index, and it must not contain any duplicate entries.
     */
    public List<TypeIdItem> typeIds() {
        if (_shouldWriteTypeIds)
            _writeTypeIds();
        if (this.typeIds != null)
            return this.typeIds;
        if (!_enabledTypeIds)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().typeIdsOff());
        this.typeIds = new ArrayList<TypeIdItem>();
        for (int i = 0; i < header().typeIdsSize(); i++) {
            TypeIdItem _t_typeIds = new TypeIdItem(this._io, this, _root);
            try {
                _t_typeIds._read();
            } finally {
                this.typeIds.add(_t_typeIds);
            }
        }
        this._io.seek(_pos);
        return this.typeIds;
    }
    public void setTypeIds(List<TypeIdItem> _v) { _dirty = true; typeIds = _v; }
    public void setTypeIds_Enabled(boolean _v) { _dirty = true; _enabledTypeIds = _v; }

    private void _writeTypeIds() {
        _shouldWriteTypeIds = false;
        long _pos = this._io.pos();
        this._io.seek(header().typeIdsOff());
        for (int i = 0; i < this.typeIds.size(); i++) {
            this.typeIds.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private HeaderItem header;
    private Dex _root;
    private KaitaiStruct.ReadWrite _parent;
    public HeaderItem header() { return header; }
    public void setHeader(HeaderItem _v) { _dirty = true; header = _v; }
    public Dex _root() { return _root; }
    public void set_root(Dex _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
