// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Dex = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link https://source.android.com/devices/tech/dalvik/dex-format|Source}
 */

var Dex = (function() {
  Dex.ClassAccessFlags = Object.freeze({
    PUBLIC: 1,
    PRIVATE: 2,
    PROTECTED: 4,
    STATIC: 8,
    FINAL: 16,
    INTERFACE: 512,
    ABSTRACT: 1024,
    SYNTHETIC: 4096,
    ANNOTATION: 8192,
    ENUM: 16384,

    1: "PUBLIC",
    2: "PRIVATE",
    4: "PROTECTED",
    8: "STATIC",
    16: "FINAL",
    512: "INTERFACE",
    1024: "ABSTRACT",
    4096: "SYNTHETIC",
    8192: "ANNOTATION",
    16384: "ENUM",
  });

  function Dex(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Dex.prototype._read = function() {
    this.header = new HeaderItem(this._io, this, this._root);
  }

  var HeaderItem = Dex.HeaderItem = (function() {
    HeaderItem.EndianConstant = Object.freeze({
      ENDIAN_CONSTANT: 305419896,
      REVERSE_ENDIAN_CONSTANT: 2018915346,

      305419896: "ENDIAN_CONSTANT",
      2018915346: "REVERSE_ENDIAN_CONSTANT",
    });

    function HeaderItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderItem.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([100, 101, 120, 10]);
      this.versionStr = KaitaiStream.bytesToStr(this._io.readBytes(3), "ascii");
      this.magic2 = this._io.ensureFixedContents([0]);
      this.checksum = this._io.readU4le();
      this.signature = this._io.readBytes(20);
      this.fileSize = this._io.readU4le();
      this.headerSize = this._io.readU4le();
      this.endianTag = this._io.readU4le();
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

    /**
     * adler32 checksum of the rest of the file (everything but magic and this field);  used to detect file corruption
     */

    /**
     * SHA-1 signature (hash) of the rest of the file (everything but magic, checksum,  and this field); used to uniquely identify files
     */

    /**
     * size of the entire file (including the header), in bytes
     */

    /**
     * size of the header (this entire section), in bytes. This allows for at  least a limited amount of backwards/forwards compatibility without  invalidating the format.
     */

    /**
     * size of the link section, or 0 if this file isn't statically linked
     */

    /**
     * offset from the start of the file to the link section, or 0 if link_size == 0.  The offset, if non-zero, should be to an offset into the link_data section. The format of the data pointed at is left unspecified by this document;  this header field (and the previous) are left as hooks for use by runtime implementations.
     */

    /**
     * offset from the start of the file to the map item. The offset, which must be non-zero, should be to an offset into the data  section, and the data should be in the format specified by "map_list" below.    
     */

    /**
     * count of strings in the string identifiers list
     */

    /**
     * offset from the start of the file to the string identifiers list, or 0 if string_ids_size == 0 (admittedly a strange edge case).  The offset, if non-zero, should be to the start of the string_ids section.
     */

    /**
     * count of elements in the type identifiers list, at most 65535
     */

    /**
     * offset from the start of the file to the type identifiers list,  or 0 if type_ids_size == 0 (admittedly a strange edge case).  The offset, if non-zero, should be to the start of the type_ids section.
     */

    /**
     * count of elements in the prototype identifiers list, at most 65535
     */

    /**
     * offset from the start of the file to the prototype identifiers list,  or 0 if proto_ids_size == 0 (admittedly a strange edge case). The offset, if non-zero, should be to the start of the proto_ids section.
     */

    /**
     * count of elements in the field identifiers list
     */

    /**
     * offset from the start of the file to the field identifiers list, or 0 if field_ids_size == 0. The offset, if non-zero, should be to the start of the field_ids section.    
     */

    /**
     * count of elements in the method identifiers list
     */

    /**
     * offset from the start of the file to the method identifiers list,  or 0 if method_ids_size == 0. The offset, if non-zero, should be to the start of the method_ids section.
     */

    /**
     * count of elements in the class definitions list
     */

    /**
     * offset from the start of the file to the class definitions list,  or 0 if class_defs_size == 0 (admittedly a strange edge case). The offset, if non-zero, should be to the start of the class_defs section.
     */

    /**
     * Size of data section in bytes. Must be an even multiple of sizeof(uint).
     */

    /**
     * offset from the start of the file to the start of the data section.
     */

    return HeaderItem;
  })();

  var MapList = Dex.MapList = (function() {
    function MapList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MapList.prototype._read = function() {
      this.size = this._io.readU4le();
      this.list = new Array(this.size);
      for (var i = 0; i < this.size; i++) {
        this.list[i] = new MapItem(this._io, this, this._root);
      }
    }

    return MapList;
  })();

  var EncodedValue = Dex.EncodedValue = (function() {
    EncodedValue.ValueTypeEnum = Object.freeze({
      BYTE: 0,
      SHORT: 2,
      CHAR: 3,
      INT: 4,
      LONG: 6,
      FLOAT: 16,
      DOUBLE: 17,
      METHOD_TYPE: 21,
      METHOD_HANDLE: 22,
      STRING: 23,
      TYPE: 24,
      FIELD: 25,
      METHOD: 26,
      ENUM: 27,
      ARRAY: 28,
      ANNOTATION: 29,
      NULL: 30,
      BOOLEAN: 31,

      0: "BYTE",
      2: "SHORT",
      3: "CHAR",
      4: "INT",
      6: "LONG",
      16: "FLOAT",
      17: "DOUBLE",
      21: "METHOD_TYPE",
      22: "METHOD_HANDLE",
      23: "STRING",
      24: "TYPE",
      25: "FIELD",
      26: "METHOD",
      27: "ENUM",
      28: "ARRAY",
      29: "ANNOTATION",
      30: "NULL",
      31: "BOOLEAN",
    });

    function EncodedValue(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EncodedValue.prototype._read = function() {
      this.valueArg = this._io.readBitsInt(3);
      this.valueType = this._io.readBitsInt(5);
      this._io.alignToByte();
      switch (this.valueType) {
      case Dex.EncodedValue.ValueTypeEnum.DOUBLE:
        this.value = this._io.readF8le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.ANNOTATION:
        this.value = new EncodedAnnotation(this._io, this, this._root);
        break;
      case Dex.EncodedValue.ValueTypeEnum.TYPE:
        this.value = this._io.readU4le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.CHAR:
        this.value = this._io.readU2le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.METHOD_HANDLE:
        this.value = this._io.readU4le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.ARRAY:
        this.value = new EncodedArray(this._io, this, this._root);
        break;
      case Dex.EncodedValue.ValueTypeEnum.BYTE:
        this.value = this._io.readS1();
        break;
      case Dex.EncodedValue.ValueTypeEnum.METHOD:
        this.value = this._io.readU4le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.METHOD_TYPE:
        this.value = this._io.readU4le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.SHORT:
        this.value = this._io.readS2le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.STRING:
        this.value = this._io.readU4le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.INT:
        this.value = this._io.readS4le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.FIELD:
        this.value = this._io.readU4le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.LONG:
        this.value = this._io.readS8le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.FLOAT:
        this.value = this._io.readF4le();
        break;
      case Dex.EncodedValue.ValueTypeEnum.ENUM:
        this.value = this._io.readU4le();
        break;
      }
    }

    return EncodedValue;
  })();

  var CallSiteIdItem = Dex.CallSiteIdItem = (function() {
    function CallSiteIdItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CallSiteIdItem.prototype._read = function() {
      this.callSiteOff = this._io.readU4le();
    }

    /**
     * offset from the start of the file to call site definition.
     * The offset should be in the data section, and the data there should be in the format specified by "call_site_item" below.
     */

    return CallSiteIdItem;
  })();

  var MethodIdItem = Dex.MethodIdItem = (function() {
    function MethodIdItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MethodIdItem.prototype._read = function() {
      this.classIdx = this._io.readU2le();
      this.protoIdx = this._io.readU2le();
      this.nameIdx = this._io.readU4le();
    }

    /**
     * index into the type_ids list for the definer of this method. This must be a class or array type, and not a primitive type.
     */

    /**
     * index into the proto_ids list for the prototype of this method
     */

    /**
     * index into the string_ids list for the name of this method. The string must conform to the syntax for MemberName, defined above.
     */

    return MethodIdItem;
  })();

  var Uleb128 = Dex.Uleb128 = (function() {
    function Uleb128(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Uleb128.prototype._read = function() {
      this.b1 = this._io.readU1();
      if ((this.b1 & 128) != 0) {
        this.b2 = this._io.readU1();
      }
      if ((this.b2 & 128) != 0) {
        this.b3 = this._io.readU1();
      }
      if ((this.b3 & 128) != 0) {
        this.b4 = this._io.readU1();
      }
      if ((this.b4 & 128) != 0) {
        this.b5 = this._io.readU1();
      }
      if ((this.b5 & 128) != 0) {
        this.b6 = this._io.readU1();
      }
      if ((this.b6 & 128) != 0) {
        this.b7 = this._io.readU1();
      }
      if ((this.b7 & 128) != 0) {
        this.b8 = this._io.readU1();
      }
      if ((this.b8 & 128) != 0) {
        this.b9 = this._io.readU1();
      }
      if ((this.b9 & 128) != 0) {
        this.b10 = this._io.readU1();
      }
    }
    Object.defineProperty(Uleb128.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = ((KaitaiStream.mod(this.b1, 128) << 0) + ((this.b1 & 128) == 0 ? 0 : ((KaitaiStream.mod(this.b2, 128) << 7) + ((this.b2 & 128) == 0 ? 0 : ((KaitaiStream.mod(this.b3, 128) << 14) + ((this.b3 & 128) == 0 ? 0 : ((KaitaiStream.mod(this.b4, 128) << 21) + ((this.b4 & 128) == 0 ? 0 : ((KaitaiStream.mod(this.b5, 128) << 28) + ((this.b5 & 128) == 0 ? 0 : ((KaitaiStream.mod(this.b6, 128) << 35) + ((this.b6 & 128) == 0 ? 0 : ((KaitaiStream.mod(this.b7, 128) << 42) + ((this.b7 & 128) == 0 ? 0 : ((KaitaiStream.mod(this.b8, 128) << 49) + ((this.b8 & 128) == 0 ? 0 : ((KaitaiStream.mod(this.b9, 128) << 56) + ((this.b8 & 128) == 0 ? 0 : (KaitaiStream.mod(this.b10, 128) << 63)))))))))))))))))));
        return this._m_value;
      }
    });

    return Uleb128;
  })();

  var TypeIdItem = Dex.TypeIdItem = (function() {
    function TypeIdItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TypeIdItem.prototype._read = function() {
      this.descriptorIdx = this._io.readU4le();
    }
    Object.defineProperty(TypeIdItem.prototype, 'typeName', {
      get: function() {
        if (this._m_typeName !== undefined)
          return this._m_typeName;
        this._m_typeName = this._root.stringIds[this.descriptorIdx].value.data;
        return this._m_typeName;
      }
    });

    /**
     * index into the string_ids list for the descriptor string of this type. The string must conform to the syntax for TypeDescriptor, defined above.
     */

    return TypeIdItem;
  })();

  var AnnotationElement = Dex.AnnotationElement = (function() {
    function AnnotationElement(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    AnnotationElement.prototype._read = function() {
      this.nameIdx = new Uleb128(this._io, this, this._root);
      this.value = new EncodedValue(this._io, this, this._root);
    }

    /**
     * element name, represented as an index into the string_ids section.
     * The string must conform to the syntax for MemberName, defined above.
     */

    /**
     * element value
     */

    return AnnotationElement;
  })();

  var EncodedField = Dex.EncodedField = (function() {
    function EncodedField(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EncodedField.prototype._read = function() {
      this.fieldIdxDiff = new Uleb128(this._io, this, this._root);
      this.accessFlags = new Uleb128(this._io, this, this._root);
    }

    /**
     * index into the field_ids list for the identity of this field (includes the name and descriptor), represented as a difference from the index of previous element in the list.
     * The index of the first element in a list is represented directly.
     */

    /**
     * access flags for the field (public, final, etc.).
     * See "access_flags Definitions" for details.
     */

    return EncodedField;
  })();

  var EncodedArrayItem = Dex.EncodedArrayItem = (function() {
    function EncodedArrayItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EncodedArrayItem.prototype._read = function() {
      this.value = new EncodedArray(this._io, this, this._root);
    }

    return EncodedArrayItem;
  })();

  var ClassDataItem = Dex.ClassDataItem = (function() {
    function ClassDataItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ClassDataItem.prototype._read = function() {
      this.staticFieldsSize = new Uleb128(this._io, this, this._root);
      this.instanceFieldsSize = new Uleb128(this._io, this, this._root);
      this.directMethodsSize = new Uleb128(this._io, this, this._root);
      this.virtualMethodsSize = new Uleb128(this._io, this, this._root);
      this.staticFields = new Array(this.staticFieldsSize.value);
      for (var i = 0; i < this.staticFieldsSize.value; i++) {
        this.staticFields[i] = new EncodedField(this._io, this, this._root);
      }
      this.instanceFields = new Array(this.instanceFieldsSize.value);
      for (var i = 0; i < this.instanceFieldsSize.value; i++) {
        this.instanceFields[i] = new EncodedField(this._io, this, this._root);
      }
      this.directMethods = new Array(this.directMethodsSize.value);
      for (var i = 0; i < this.directMethodsSize.value; i++) {
        this.directMethods[i] = new EncodedMethod(this._io, this, this._root);
      }
      this.virtualMethods = new Array(this.virtualMethodsSize.value);
      for (var i = 0; i < this.virtualMethodsSize.value; i++) {
        this.virtualMethods[i] = new EncodedMethod(this._io, this, this._root);
      }
    }

    /**
     * the number of static fields defined in this item
     */

    /**
     * the number of instance fields defined in this item
     */

    /**
     * the number of direct methods defined in this item
     */

    /**
     * the number of virtual methods defined in this item
     */

    /**
     * the defined static fields, represented as a sequence of encoded elements.
     * The fields must be sorted by field_idx in increasing order.
     */

    /**
     * the defined instance fields, represented as a sequence of encoded elements.
     * The fields must be sorted by field_idx in increasing order.        
     */

    /**
     * the defined direct (any of static, private, or constructor) methods, represented as a sequence of encoded elements.
     * The methods must be sorted by method_idx in increasing order.
     */

    /**
     * the defined virtual (none of static, private, or constructor) methods, represented as a sequence of encoded elements.
     * This list should not include inherited methods unless overridden by the class that this item represents.
     * The methods must be sorted by method_idx in increasing order.
     * The method_idx of a virtual method must not be the same as any direct method.        
     */

    return ClassDataItem;
  })();

  var FieldIdItem = Dex.FieldIdItem = (function() {
    function FieldIdItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FieldIdItem.prototype._read = function() {
      this.classIdx = this._io.readU2le();
      this.typeIdx = this._io.readU2le();
      this.nameIdx = this._io.readU4le();
    }

    /**
     * index into the type_ids list for the definer of this field. This must be a class type, and not an array or primitive type.
     */

    /**
     * index into the type_ids list for the type of this field
     */

    /**
     * index into the string_ids list for the name of this field. The string must conform to the syntax for MemberName, defined above.
     */

    return FieldIdItem;
  })();

  var EncodedAnnotation = Dex.EncodedAnnotation = (function() {
    function EncodedAnnotation(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EncodedAnnotation.prototype._read = function() {
      this.typeIdx = new Uleb128(this._io, this, this._root);
      this.size = new Uleb128(this._io, this, this._root);
      this.elements = new Array(this.size.value);
      for (var i = 0; i < this.size.value; i++) {
        this.elements[i] = new AnnotationElement(this._io, this, this._root);
      }
    }

    /**
     * type of the annotation.
     * This must be a class (not array or primitive) type.
     */

    /**
     * number of name-value mappings in this annotation
     */

    /**
     * elements of the annotation, represented directly in-line (not as offsets).
     * Elements must be sorted in increasing order by string_id index.
     */

    return EncodedAnnotation;
  })();

  var ClassDefItem = Dex.ClassDefItem = (function() {
    function ClassDefItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ClassDefItem.prototype._read = function() {
      this.classIdx = this._io.readU4le();
      this.accessFlags = this._io.readU4le();
      this.superclassIdx = this._io.readU4le();
      this.interfacesOff = this._io.readU4le();
      this.sourceFileIdx = this._io.readU4le();
      this.annotationsOff = this._io.readU4le();
      this.classDataOff = this._io.readU4le();
      this.staticValuesOff = this._io.readU4le();
    }
    Object.defineProperty(ClassDefItem.prototype, 'typeName', {
      get: function() {
        if (this._m_typeName !== undefined)
          return this._m_typeName;
        this._m_typeName = this._root.typeIds[this.classIdx].typeName;
        return this._m_typeName;
      }
    });
    Object.defineProperty(ClassDefItem.prototype, 'classData', {
      get: function() {
        if (this._m_classData !== undefined)
          return this._m_classData;
        if (this.classDataOff != 0) {
          var _pos = this._io.pos;
          this._io.seek(this.classDataOff);
          this._m_classData = new ClassDataItem(this._io, this, this._root);
          this._io.seek(_pos);
        }
        return this._m_classData;
      }
    });
    Object.defineProperty(ClassDefItem.prototype, 'staticValues', {
      get: function() {
        if (this._m_staticValues !== undefined)
          return this._m_staticValues;
        if (this.staticValuesOff != 0) {
          var _pos = this._io.pos;
          this._io.seek(this.staticValuesOff);
          this._m_staticValues = new EncodedArrayItem(this._io, this, this._root);
          this._io.seek(_pos);
        }
        return this._m_staticValues;
      }
    });

    /**
     * index into the type_ids list for this class.
     * This must be a class type, and not an array or primitive type.
     */

    /**
     * access flags for the class (public, final, etc.).
     * See "access_flags Definitions" for details.
     */

    /**
     * index into the type_ids list for the superclass,  or the constant value NO_INDEX if this class has no superclass  (i.e., it is a root class such as Object). 
     * If present, this must be a class type, and not an array or primitive type.
     */

    /**
     * offset from the start of the file to the list of interfaces, or 0 if there are none.
     * This offset should be in the data section, and the data there should  be in the format specified by "type_list" below. Each of the elements  of the list must be a class type (not an array or primitive type),  and there must not be any duplicates.        
     */

    /**
     * index into the string_ids list for the name of the file containing  the original source for (at least most of) this class, or the  special value NO_INDEX to represent a lack of this information.
     * The debug_info_item of any given method may override this source file, but the expectation is that most classes will only come from one source file.
     */

    /**
     * offset from the start of the file to the annotations structure for  this class, or 0 if there are no annotations on this class.
     * This offset, if non-zero, should be in the data section, and the data  there should be in the format specified by "annotations_directory_item" below,with all items referring to this class as the definer.        
     */

    /**
     * offset from the start of the file to the associated class data for this item, or 0 if there is no class data for this class.
     * (This may be the case, for example, if this class is a marker interface.)
     * The offset, if non-zero, should be in the data section, and the data there should be in the format specified by "class_data_item" below, with all items referring to this class as the definer.        
     */

    /**
     * offset from the start of the file to the list of initial values for  static fields, or 0 if there are none (and all static fields are to be  initialized with 0 or null).
     * This offset should be in the data section, and the data there should  be in the format specified by "encoded_array_item" below.
     * The size of the array must be no larger than the number of static fields  declared by this class, and the elements correspond to the static fields  in the same order as declared in the corresponding field_list.
     * The type of each array element must match the declared type of its corresponding field.
     * If there are fewer elements in the array than there are static fields, then the leftover fields are initialized with a type-appropriate 0 or null.
     */

    return ClassDefItem;
  })();

  var StringIdItem = Dex.StringIdItem = (function() {
    function StringIdItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StringIdItem.prototype._read = function() {
      this.stringDataOff = this._io.readU4le();
    }

    var StringDataItem = StringIdItem.StringDataItem = (function() {
      function StringDataItem(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      StringDataItem.prototype._read = function() {
        this.utf16Size = new Uleb128(this._io, this, this._root);
        this.data = KaitaiStream.bytesToStr(this._io.readBytes(this.utf16Size.value), "ascii");
      }

      return StringDataItem;
    })();
    Object.defineProperty(StringIdItem.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        var _pos = this._io.pos;
        this._io.seek(this.stringDataOff);
        this._m_value = new StringDataItem(this._io, this, this._root);
        this._io.seek(_pos);
        return this._m_value;
      }
    });

    /**
     * offset from the start of the file to the string data for this item. The offset should be to a location in the data section, and the data should be in the format specified by "string_data_item" below. There is no alignment requirement for the offset.
     */

    return StringIdItem;
  })();

  var ProtoIdItem = Dex.ProtoIdItem = (function() {
    function ProtoIdItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ProtoIdItem.prototype._read = function() {
      this.shortyIdx = this._io.readU4le();
      this.returnTypeIdx = this._io.readU4le();
      this.parametersOff = this._io.readU4le();
    }

    /**
     * index into the string_ids list for the short-form descriptor string of this prototype. The string must conform to the syntax for ShortyDescriptor, defined above,  and must correspond to the return type and parameters of this item.
     */

    /**
     * index into the type_ids list for the return type of this prototype
     */

    /**
     * offset from the start of the file to the list of parameter types for this prototype,  or 0 if this prototype has no parameters. This offset, if non-zero, should be in the data section, and the data there should be in the format specified by "type_list" below. Additionally, there should be no reference to the type void in the list.
     */

    return ProtoIdItem;
  })();

  var EncodedMethod = Dex.EncodedMethod = (function() {
    function EncodedMethod(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EncodedMethod.prototype._read = function() {
      this.methodIdxDiff = new Uleb128(this._io, this, this._root);
      this.accessFlags = new Uleb128(this._io, this, this._root);
      this.codeOff = new Uleb128(this._io, this, this._root);
    }

    /**
     * index into the method_ids list for the identity of this method (includes the name and descriptor), represented as a difference from the index of previous element in the list.
     * The index of the first element in a list is represented directly.
     */

    /**
     * access flags for the field (public, final, etc.).
     * See "access_flags Definitions" for details.
     */

    /**
     * offset from the start of the file to the code structure for this method, or 0 if this method is either abstract or native.
     * The offset should be to a location in the data section.
     * The format of the data is specified by "code_item" below.
     */

    return EncodedMethod;
  })();

  var MapItem = Dex.MapItem = (function() {
    MapItem.MapItemType = Object.freeze({
      HEADER_ITEM: 0,
      STRING_ID_ITEM: 1,
      TYPE_ID_ITEM: 2,
      PROTO_ID_ITEM: 3,
      FIELD_ID_ITEM: 4,
      METHOD_ID_ITEM: 5,
      CLASS_DEF_ITEM: 6,
      CALL_SITE_ID_ITEM: 7,
      METHOD_HANDLE_ITEM: 8,
      MAP_LIST: 4096,
      TYPE_LIST: 4097,
      ANNOTATION_SET_REF_LIST: 4098,
      ANNOTATION_SET_ITEM: 4099,
      CLASS_DATA_ITEM: 8192,
      CODE_ITEM: 8193,
      STRING_DATA_ITEM: 8194,
      DEBUG_INFO_ITEM: 8195,
      ANNOTATION_ITEM: 8196,
      ENCODED_ARRAY_ITEM: 8197,
      ANNOTATIONS_DIRECTORY_ITEM: 8198,

      0: "HEADER_ITEM",
      1: "STRING_ID_ITEM",
      2: "TYPE_ID_ITEM",
      3: "PROTO_ID_ITEM",
      4: "FIELD_ID_ITEM",
      5: "METHOD_ID_ITEM",
      6: "CLASS_DEF_ITEM",
      7: "CALL_SITE_ID_ITEM",
      8: "METHOD_HANDLE_ITEM",
      4096: "MAP_LIST",
      4097: "TYPE_LIST",
      4098: "ANNOTATION_SET_REF_LIST",
      4099: "ANNOTATION_SET_ITEM",
      8192: "CLASS_DATA_ITEM",
      8193: "CODE_ITEM",
      8194: "STRING_DATA_ITEM",
      8195: "DEBUG_INFO_ITEM",
      8196: "ANNOTATION_ITEM",
      8197: "ENCODED_ARRAY_ITEM",
      8198: "ANNOTATIONS_DIRECTORY_ITEM",
    });

    function MapItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MapItem.prototype._read = function() {
      this.type = this._io.readU2le();
      this.unused = this._io.readU2le();
      this.size = this._io.readU4le();
      this.offset = this._io.readU4le();
    }

    /**
     * type of the items; see table below
     */

    /**
     * (unused)
     */

    /**
     * count of the number of items to be found at the indicated offset
     */

    /**
     * offset from the start of the file to the items in question
     */

    return MapItem;
  })();

  var EncodedArray = Dex.EncodedArray = (function() {
    function EncodedArray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EncodedArray.prototype._read = function() {
      this.size = new Uleb128(this._io, this, this._root);
      this.values = new Array(this.size.value);
      for (var i = 0; i < this.size.value; i++) {
        this.values[i] = new EncodedValue(this._io, this, this._root);
      }
    }

    return EncodedArray;
  })();

  /**
   * string identifiers list.
   * These are identifiers for all the strings used by this file, either for  internal naming (e.g., type descriptors) or as constant objects referred to by code.
   * This list must be sorted by string contents, using UTF-16 code point values (not in a locale-sensitive manner), and it must not contain any duplicate entries.    
   */
  Object.defineProperty(Dex.prototype, 'stringIds', {
    get: function() {
      if (this._m_stringIds !== undefined)
        return this._m_stringIds;
      var _pos = this._io.pos;
      this._io.seek(this.header.stringIdsOff);
      this._m_stringIds = new Array(this.header.stringIdsSize);
      for (var i = 0; i < this.header.stringIdsSize; i++) {
        this._m_stringIds[i] = new StringIdItem(this._io, this, this._root);
      }
      this._io.seek(_pos);
      return this._m_stringIds;
    }
  });

  /**
   * method identifiers list.
   * These are identifiers for all methods referred to by this file, whether defined in the file or not.
   * This list must be sorted, where the defining type (by type_id index  is the major order, method name (by string_id index) is the intermediate order, and method prototype (by proto_id index) is the minor order.
   * The list must not contain any duplicate entries.
   */
  Object.defineProperty(Dex.prototype, 'methodIds', {
    get: function() {
      if (this._m_methodIds !== undefined)
        return this._m_methodIds;
      var _pos = this._io.pos;
      this._io.seek(this.header.methodIdsOff);
      this._m_methodIds = new Array(this.header.methodIdsSize);
      for (var i = 0; i < this.header.methodIdsSize; i++) {
        this._m_methodIds[i] = new MethodIdItem(this._io, this, this._root);
      }
      this._io.seek(_pos);
      return this._m_methodIds;
    }
  });

  /**
   * data used in statically linked files.
   * The format of the data in this section is left unspecified by this document.
   * This section is empty in unlinked files, and runtime implementations may use it as they see fit.
   */
  Object.defineProperty(Dex.prototype, 'linkData', {
    get: function() {
      if (this._m_linkData !== undefined)
        return this._m_linkData;
      var _pos = this._io.pos;
      this._io.seek(this.header.linkOff);
      this._m_linkData = this._io.readBytes(this.header.linkSize);
      this._io.seek(_pos);
      return this._m_linkData;
    }
  });
  Object.defineProperty(Dex.prototype, 'map', {
    get: function() {
      if (this._m_map !== undefined)
        return this._m_map;
      var _pos = this._io.pos;
      this._io.seek(this.header.mapOff);
      this._m_map = new MapList(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_map;
    }
  });

  /**
   * class definitions list.
   * The classes must be ordered such that a given class's superclass and implemented interfaces appear in the list earlier than the referring class.
   * Furthermore, it is invalid for a definition for the same-named class to appear more than once in the list.
   */
  Object.defineProperty(Dex.prototype, 'classDefs', {
    get: function() {
      if (this._m_classDefs !== undefined)
        return this._m_classDefs;
      var _pos = this._io.pos;
      this._io.seek(this.header.classDefsOff);
      this._m_classDefs = new Array(this.header.classDefsSize);
      for (var i = 0; i < this.header.classDefsSize; i++) {
        this._m_classDefs[i] = new ClassDefItem(this._io, this, this._root);
      }
      this._io.seek(_pos);
      return this._m_classDefs;
    }
  });

  /**
   * data area, containing all the support data for the tables listed above.
   * Different items have different alignment requirements, and padding bytes are inserted before each item if necessary to achieve proper alignment.
   */
  Object.defineProperty(Dex.prototype, 'data', {
    get: function() {
      if (this._m_data !== undefined)
        return this._m_data;
      var _pos = this._io.pos;
      this._io.seek(this.header.dataOff);
      this._m_data = this._io.readBytes(this.header.dataSize);
      this._io.seek(_pos);
      return this._m_data;
    }
  });

  /**
   * type identifiers list. 
   * These are identifiers for all types (classes, arrays, or primitive types)  referred to by this file, whether defined in the file or not.
   * This list must be sorted by string_id index, and it must not contain any duplicate entries.
   */
  Object.defineProperty(Dex.prototype, 'typeIds', {
    get: function() {
      if (this._m_typeIds !== undefined)
        return this._m_typeIds;
      var _pos = this._io.pos;
      this._io.seek(this.header.typeIdsOff);
      this._m_typeIds = new Array(this.header.typeIdsSize);
      for (var i = 0; i < this.header.typeIdsSize; i++) {
        this._m_typeIds[i] = new TypeIdItem(this._io, this, this._root);
      }
      this._io.seek(_pos);
      return this._m_typeIds;
    }
  });

  /**
   * method prototype identifiers list.
   * These are identifiers for all prototypes referred to by this file.
   * This list must be sorted in return-type (by type_id index) major order, and then by argument list (lexicographic ordering, individual arguments ordered by type_id index). The list must not contain any duplicate entries.
   */
  Object.defineProperty(Dex.prototype, 'protoIds', {
    get: function() {
      if (this._m_protoIds !== undefined)
        return this._m_protoIds;
      var _pos = this._io.pos;
      this._io.seek(this.header.protoIdsOff);
      this._m_protoIds = new Array(this.header.protoIdsSize);
      for (var i = 0; i < this.header.protoIdsSize; i++) {
        this._m_protoIds[i] = new ProtoIdItem(this._io, this, this._root);
      }
      this._io.seek(_pos);
      return this._m_protoIds;
    }
  });

  /**
   * field identifiers list.
   * These are identifiers for all fields referred to by this file, whether defined in the file or not. 
   * This list must be sorted, where the defining type (by type_id index)  is the major order, field name (by string_id index) is the intermediate  order, and type (by type_id index) is the minor order.
   * The list must not contain any duplicate entries.
   */
  Object.defineProperty(Dex.prototype, 'fieldIds', {
    get: function() {
      if (this._m_fieldIds !== undefined)
        return this._m_fieldIds;
      var _pos = this._io.pos;
      this._io.seek(this.header.fieldIdsOff);
      this._m_fieldIds = new Array(this.header.fieldIdsSize);
      for (var i = 0; i < this.header.fieldIdsSize; i++) {
        this._m_fieldIds[i] = new FieldIdItem(this._io, this, this._root);
      }
      this._io.seek(_pos);
      return this._m_fieldIds;
    }
  });

  return Dex;
})();
return Dex;
}));
