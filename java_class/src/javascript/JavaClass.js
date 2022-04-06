// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.JavaClass = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.1|Source}
 */

var JavaClass = (function() {
  function JavaClass(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  JavaClass.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [202, 254, 186, 190]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([202, 254, 186, 190], this.magic, this._io, "/seq/0");
    }
    this.versionMinor = this._io.readU2be();
    this.versionMajor = this._io.readU2be();
    this.constantPoolCount = this._io.readU2be();
    this.constantPool = new Array((this.constantPoolCount - 1));
    for (var i = 0; i < (this.constantPoolCount - 1); i++) {
      this.constantPool[i] = new ConstantPoolEntry(this._io, this, this._root, (i != 0 ? this.constantPool[(i - 1)].isTwoEntries : false));
    }
    this.accessFlags = this._io.readU2be();
    this.thisClass = this._io.readU2be();
    this.superClass = this._io.readU2be();
    this.interfacesCount = this._io.readU2be();
    this.interfaces = new Array(this.interfacesCount);
    for (var i = 0; i < this.interfacesCount; i++) {
      this.interfaces[i] = this._io.readU2be();
    }
    this.fieldsCount = this._io.readU2be();
    this.fields = new Array(this.fieldsCount);
    for (var i = 0; i < this.fieldsCount; i++) {
      this.fields[i] = new FieldInfo(this._io, this, this._root);
    }
    this.methodsCount = this._io.readU2be();
    this.methods = new Array(this.methodsCount);
    for (var i = 0; i < this.methodsCount; i++) {
      this.methods[i] = new MethodInfo(this._io, this, this._root);
    }
    this.attributesCount = this._io.readU2be();
    this.attributes = new Array(this.attributesCount);
    for (var i = 0; i < this.attributesCount; i++) {
      this.attributes[i] = new AttributeInfo(this._io, this, this._root);
    }
  }

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5|Source}
   */

  var FloatCpInfo = JavaClass.FloatCpInfo = (function() {
    function FloatCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FloatCpInfo.prototype._read = function() {
      this.value = this._io.readF4be();
    }

    return FloatCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7|Source}
   */

  var AttributeInfo = JavaClass.AttributeInfo = (function() {
    function AttributeInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    AttributeInfo.prototype._read = function() {
      this.nameIndex = this._io.readU2be();
      this.attributeLength = this._io.readU4be();
      switch (this.nameAsStr) {
      case "SourceFile":
        this._raw_info = this._io.readBytes(this.attributeLength);
        var _io__raw_info = new KaitaiStream(this._raw_info);
        this.info = new AttrBodySourceFile(_io__raw_info, this, this._root);
        break;
      case "LineNumberTable":
        this._raw_info = this._io.readBytes(this.attributeLength);
        var _io__raw_info = new KaitaiStream(this._raw_info);
        this.info = new AttrBodyLineNumberTable(_io__raw_info, this, this._root);
        break;
      case "Exceptions":
        this._raw_info = this._io.readBytes(this.attributeLength);
        var _io__raw_info = new KaitaiStream(this._raw_info);
        this.info = new AttrBodyExceptions(_io__raw_info, this, this._root);
        break;
      case "Code":
        this._raw_info = this._io.readBytes(this.attributeLength);
        var _io__raw_info = new KaitaiStream(this._raw_info);
        this.info = new AttrBodyCode(_io__raw_info, this, this._root);
        break;
      default:
        this.info = this._io.readBytes(this.attributeLength);
        break;
      }
    }

    /**
     * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3|Source}
     */

    var AttrBodyCode = AttributeInfo.AttrBodyCode = (function() {
      function AttrBodyCode(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      AttrBodyCode.prototype._read = function() {
        this.maxStack = this._io.readU2be();
        this.maxLocals = this._io.readU2be();
        this.codeLength = this._io.readU4be();
        this.code = this._io.readBytes(this.codeLength);
        this.exceptionTableLength = this._io.readU2be();
        this.exceptionTable = new Array(this.exceptionTableLength);
        for (var i = 0; i < this.exceptionTableLength; i++) {
          this.exceptionTable[i] = new ExceptionEntry(this._io, this, this._root);
        }
        this.attributesCount = this._io.readU2be();
        this.attributes = new Array(this.attributesCount);
        for (var i = 0; i < this.attributesCount; i++) {
          this.attributes[i] = new AttributeInfo(this._io, this, this._root);
        }
      }

      /**
       * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3|Source}
       */

      var ExceptionEntry = AttrBodyCode.ExceptionEntry = (function() {
        function ExceptionEntry(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        ExceptionEntry.prototype._read = function() {
          this.startPc = this._io.readU2be();
          this.endPc = this._io.readU2be();
          this.handlerPc = this._io.readU2be();
          this.catchType = this._io.readU2be();
        }
        Object.defineProperty(ExceptionEntry.prototype, 'catchException', {
          get: function() {
            if (this._m_catchException !== undefined)
              return this._m_catchException;
            if (this.catchType != 0) {
              this._m_catchException = this._root.constantPool[(this.catchType - 1)];
            }
            return this._m_catchException;
          }
        });

        /**
         * Start of a code region where exception handler is being
         * active, index in code array (inclusive)
         */

        /**
         * End of a code region where exception handler is being
         * active, index in code array (exclusive)
         */

        /**
         * Start of exception handler code, index in code array
         */

        /**
         * Exception class that this handler catches, index in constant
         * pool, or 0 (catch all exceptions handler, used to implement
         * `finally`).
         */

        return ExceptionEntry;
      })();

      return AttrBodyCode;
    })();

    /**
     * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.5|Source}
     */

    var AttrBodyExceptions = AttributeInfo.AttrBodyExceptions = (function() {
      function AttrBodyExceptions(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      AttrBodyExceptions.prototype._read = function() {
        this.numberOfExceptions = this._io.readU2be();
        this.exceptions = new Array(this.numberOfExceptions);
        for (var i = 0; i < this.numberOfExceptions; i++) {
          this.exceptions[i] = new ExceptionTableEntry(this._io, this, this._root);
        }
      }

      var ExceptionTableEntry = AttrBodyExceptions.ExceptionTableEntry = (function() {
        function ExceptionTableEntry(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        ExceptionTableEntry.prototype._read = function() {
          this.index = this._io.readU2be();
        }
        Object.defineProperty(ExceptionTableEntry.prototype, 'asInfo', {
          get: function() {
            if (this._m_asInfo !== undefined)
              return this._m_asInfo;
            this._m_asInfo = this._root.constantPool[(this.index - 1)].cpInfo;
            return this._m_asInfo;
          }
        });
        Object.defineProperty(ExceptionTableEntry.prototype, 'nameAsStr', {
          get: function() {
            if (this._m_nameAsStr !== undefined)
              return this._m_nameAsStr;
            this._m_nameAsStr = this.asInfo.nameAsStr;
            return this._m_nameAsStr;
          }
        });

        return ExceptionTableEntry;
      })();

      return AttrBodyExceptions;
    })();

    /**
     * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.10|Source}
     */

    var AttrBodySourceFile = AttributeInfo.AttrBodySourceFile = (function() {
      function AttrBodySourceFile(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      AttrBodySourceFile.prototype._read = function() {
        this.sourcefileIndex = this._io.readU2be();
      }
      Object.defineProperty(AttrBodySourceFile.prototype, 'sourcefileAsStr', {
        get: function() {
          if (this._m_sourcefileAsStr !== undefined)
            return this._m_sourcefileAsStr;
          this._m_sourcefileAsStr = this._root.constantPool[(this.sourcefileIndex - 1)].cpInfo.value;
          return this._m_sourcefileAsStr;
        }
      });

      return AttrBodySourceFile;
    })();

    /**
     * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.12|Source}
     */

    var AttrBodyLineNumberTable = AttributeInfo.AttrBodyLineNumberTable = (function() {
      function AttrBodyLineNumberTable(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      AttrBodyLineNumberTable.prototype._read = function() {
        this.lineNumberTableLength = this._io.readU2be();
        this.lineNumberTable = new Array(this.lineNumberTableLength);
        for (var i = 0; i < this.lineNumberTableLength; i++) {
          this.lineNumberTable[i] = new LineNumberTableEntry(this._io, this, this._root);
        }
      }

      var LineNumberTableEntry = AttrBodyLineNumberTable.LineNumberTableEntry = (function() {
        function LineNumberTableEntry(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        LineNumberTableEntry.prototype._read = function() {
          this.startPc = this._io.readU2be();
          this.lineNumber = this._io.readU2be();
        }

        return LineNumberTableEntry;
      })();

      return AttrBodyLineNumberTable;
    })();
    Object.defineProperty(AttributeInfo.prototype, 'nameAsStr', {
      get: function() {
        if (this._m_nameAsStr !== undefined)
          return this._m_nameAsStr;
        this._m_nameAsStr = this._root.constantPool[(this.nameIndex - 1)].cpInfo.value;
        return this._m_nameAsStr;
      }
    });

    return AttributeInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2|Source}
   */

  var MethodRefCpInfo = JavaClass.MethodRefCpInfo = (function() {
    function MethodRefCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MethodRefCpInfo.prototype._read = function() {
      this.classIndex = this._io.readU2be();
      this.nameAndTypeIndex = this._io.readU2be();
    }
    Object.defineProperty(MethodRefCpInfo.prototype, 'classAsInfo', {
      get: function() {
        if (this._m_classAsInfo !== undefined)
          return this._m_classAsInfo;
        this._m_classAsInfo = this._root.constantPool[(this.classIndex - 1)].cpInfo;
        return this._m_classAsInfo;
      }
    });
    Object.defineProperty(MethodRefCpInfo.prototype, 'nameAndTypeAsInfo', {
      get: function() {
        if (this._m_nameAndTypeAsInfo !== undefined)
          return this._m_nameAndTypeAsInfo;
        this._m_nameAndTypeAsInfo = this._root.constantPool[(this.nameAndTypeIndex - 1)].cpInfo;
        return this._m_nameAndTypeAsInfo;
      }
    });

    return MethodRefCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.5|Source}
   */

  var FieldInfo = JavaClass.FieldInfo = (function() {
    function FieldInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FieldInfo.prototype._read = function() {
      this.accessFlags = this._io.readU2be();
      this.nameIndex = this._io.readU2be();
      this.descriptorIndex = this._io.readU2be();
      this.attributesCount = this._io.readU2be();
      this.attributes = new Array(this.attributesCount);
      for (var i = 0; i < this.attributesCount; i++) {
        this.attributes[i] = new AttributeInfo(this._io, this, this._root);
      }
    }
    Object.defineProperty(FieldInfo.prototype, 'nameAsStr', {
      get: function() {
        if (this._m_nameAsStr !== undefined)
          return this._m_nameAsStr;
        this._m_nameAsStr = this._root.constantPool[(this.nameIndex - 1)].cpInfo.value;
        return this._m_nameAsStr;
      }
    });

    return FieldInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6|Source}
   */

  var DoubleCpInfo = JavaClass.DoubleCpInfo = (function() {
    function DoubleCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DoubleCpInfo.prototype._read = function() {
      this.value = this._io.readF8be();
    }

    return DoubleCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5|Source}
   */

  var LongCpInfo = JavaClass.LongCpInfo = (function() {
    function LongCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LongCpInfo.prototype._read = function() {
      this.value = this._io.readU8be();
    }

    return LongCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.10|Source}
   */

  var InvokeDynamicCpInfo = JavaClass.InvokeDynamicCpInfo = (function() {
    function InvokeDynamicCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    InvokeDynamicCpInfo.prototype._read = function() {
      this.bootstrapMethodAttrIndex = this._io.readU2be();
      this.nameAndTypeIndex = this._io.readU2be();
    }

    return InvokeDynamicCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.8|Source}
   */

  var MethodHandleCpInfo = JavaClass.MethodHandleCpInfo = (function() {
    MethodHandleCpInfo.ReferenceKindEnum = Object.freeze({
      GET_FIELD: 1,
      GET_STATIC: 2,
      PUT_FIELD: 3,
      PUT_STATIC: 4,
      INVOKE_VIRTUAL: 5,
      INVOKE_STATIC: 6,
      INVOKE_SPECIAL: 7,
      NEW_INVOKE_SPECIAL: 8,
      INVOKE_INTERFACE: 9,

      1: "GET_FIELD",
      2: "GET_STATIC",
      3: "PUT_FIELD",
      4: "PUT_STATIC",
      5: "INVOKE_VIRTUAL",
      6: "INVOKE_STATIC",
      7: "INVOKE_SPECIAL",
      8: "NEW_INVOKE_SPECIAL",
      9: "INVOKE_INTERFACE",
    });

    function MethodHandleCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MethodHandleCpInfo.prototype._read = function() {
      this.referenceKind = this._io.readU1();
      this.referenceIndex = this._io.readU2be();
    }

    return MethodHandleCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6|Source}
   */

  var NameAndTypeCpInfo = JavaClass.NameAndTypeCpInfo = (function() {
    function NameAndTypeCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    NameAndTypeCpInfo.prototype._read = function() {
      this.nameIndex = this._io.readU2be();
      this.descriptorIndex = this._io.readU2be();
    }
    Object.defineProperty(NameAndTypeCpInfo.prototype, 'nameAsInfo', {
      get: function() {
        if (this._m_nameAsInfo !== undefined)
          return this._m_nameAsInfo;
        this._m_nameAsInfo = this._root.constantPool[(this.nameIndex - 1)].cpInfo;
        return this._m_nameAsInfo;
      }
    });
    Object.defineProperty(NameAndTypeCpInfo.prototype, 'nameAsStr', {
      get: function() {
        if (this._m_nameAsStr !== undefined)
          return this._m_nameAsStr;
        this._m_nameAsStr = this.nameAsInfo.value;
        return this._m_nameAsStr;
      }
    });
    Object.defineProperty(NameAndTypeCpInfo.prototype, 'descriptorAsInfo', {
      get: function() {
        if (this._m_descriptorAsInfo !== undefined)
          return this._m_descriptorAsInfo;
        this._m_descriptorAsInfo = this._root.constantPool[(this.descriptorIndex - 1)].cpInfo;
        return this._m_descriptorAsInfo;
      }
    });
    Object.defineProperty(NameAndTypeCpInfo.prototype, 'descriptorAsStr', {
      get: function() {
        if (this._m_descriptorAsStr !== undefined)
          return this._m_descriptorAsStr;
        this._m_descriptorAsStr = this.descriptorAsInfo.value;
        return this._m_descriptorAsStr;
      }
    });

    return NameAndTypeCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.7|Source}
   */

  var Utf8CpInfo = JavaClass.Utf8CpInfo = (function() {
    function Utf8CpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Utf8CpInfo.prototype._read = function() {
      this.strLen = this._io.readU2be();
      this.value = KaitaiStream.bytesToStr(this._io.readBytes(this.strLen), "UTF-8");
    }

    return Utf8CpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.3|Source}
   */

  var StringCpInfo = JavaClass.StringCpInfo = (function() {
    function StringCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StringCpInfo.prototype._read = function() {
      this.stringIndex = this._io.readU2be();
    }

    return StringCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.9|Source}
   */

  var MethodTypeCpInfo = JavaClass.MethodTypeCpInfo = (function() {
    function MethodTypeCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MethodTypeCpInfo.prototype._read = function() {
      this.descriptorIndex = this._io.readU2be();
    }

    return MethodTypeCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2|Source}
   */

  var InterfaceMethodRefCpInfo = JavaClass.InterfaceMethodRefCpInfo = (function() {
    function InterfaceMethodRefCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    InterfaceMethodRefCpInfo.prototype._read = function() {
      this.classIndex = this._io.readU2be();
      this.nameAndTypeIndex = this._io.readU2be();
    }
    Object.defineProperty(InterfaceMethodRefCpInfo.prototype, 'classAsInfo', {
      get: function() {
        if (this._m_classAsInfo !== undefined)
          return this._m_classAsInfo;
        this._m_classAsInfo = this._root.constantPool[(this.classIndex - 1)].cpInfo;
        return this._m_classAsInfo;
      }
    });
    Object.defineProperty(InterfaceMethodRefCpInfo.prototype, 'nameAndTypeAsInfo', {
      get: function() {
        if (this._m_nameAndTypeAsInfo !== undefined)
          return this._m_nameAndTypeAsInfo;
        this._m_nameAndTypeAsInfo = this._root.constantPool[(this.nameAndTypeIndex - 1)].cpInfo;
        return this._m_nameAndTypeAsInfo;
      }
    });

    return InterfaceMethodRefCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.1|Source}
   */

  var ClassCpInfo = JavaClass.ClassCpInfo = (function() {
    function ClassCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ClassCpInfo.prototype._read = function() {
      this.nameIndex = this._io.readU2be();
    }
    Object.defineProperty(ClassCpInfo.prototype, 'nameAsInfo', {
      get: function() {
        if (this._m_nameAsInfo !== undefined)
          return this._m_nameAsInfo;
        this._m_nameAsInfo = this._root.constantPool[(this.nameIndex - 1)].cpInfo;
        return this._m_nameAsInfo;
      }
    });
    Object.defineProperty(ClassCpInfo.prototype, 'nameAsStr', {
      get: function() {
        if (this._m_nameAsStr !== undefined)
          return this._m_nameAsStr;
        this._m_nameAsStr = this.nameAsInfo.value;
        return this._m_nameAsStr;
      }
    });

    return ClassCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4|Source}
   */

  var ConstantPoolEntry = JavaClass.ConstantPoolEntry = (function() {
    ConstantPoolEntry.TagEnum = Object.freeze({
      UTF8: 1,
      INTEGER: 3,
      FLOAT: 4,
      LONG: 5,
      DOUBLE: 6,
      CLASS_TYPE: 7,
      STRING: 8,
      FIELD_REF: 9,
      METHOD_REF: 10,
      INTERFACE_METHOD_REF: 11,
      NAME_AND_TYPE: 12,
      METHOD_HANDLE: 15,
      METHOD_TYPE: 16,
      INVOKE_DYNAMIC: 18,

      1: "UTF8",
      3: "INTEGER",
      4: "FLOAT",
      5: "LONG",
      6: "DOUBLE",
      7: "CLASS_TYPE",
      8: "STRING",
      9: "FIELD_REF",
      10: "METHOD_REF",
      11: "INTERFACE_METHOD_REF",
      12: "NAME_AND_TYPE",
      15: "METHOD_HANDLE",
      16: "METHOD_TYPE",
      18: "INVOKE_DYNAMIC",
    });

    function ConstantPoolEntry(_io, _parent, _root, isPrevTwoEntries) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.isPrevTwoEntries = isPrevTwoEntries;

      this._read();
    }
    ConstantPoolEntry.prototype._read = function() {
      if (!(this.isPrevTwoEntries)) {
        this.tag = this._io.readU1();
      }
      if (!(this.isPrevTwoEntries)) {
        switch (this.tag) {
        case JavaClass.ConstantPoolEntry.TagEnum.INTERFACE_METHOD_REF:
          this.cpInfo = new InterfaceMethodRefCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.CLASS_TYPE:
          this.cpInfo = new ClassCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.UTF8:
          this.cpInfo = new Utf8CpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.METHOD_TYPE:
          this.cpInfo = new MethodTypeCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.INTEGER:
          this.cpInfo = new IntegerCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.STRING:
          this.cpInfo = new StringCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.FLOAT:
          this.cpInfo = new FloatCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.LONG:
          this.cpInfo = new LongCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.METHOD_REF:
          this.cpInfo = new MethodRefCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.DOUBLE:
          this.cpInfo = new DoubleCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.INVOKE_DYNAMIC:
          this.cpInfo = new InvokeDynamicCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.FIELD_REF:
          this.cpInfo = new FieldRefCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.METHOD_HANDLE:
          this.cpInfo = new MethodHandleCpInfo(this._io, this, this._root);
          break;
        case JavaClass.ConstantPoolEntry.TagEnum.NAME_AND_TYPE:
          this.cpInfo = new NameAndTypeCpInfo(this._io, this, this._root);
          break;
        }
      }
    }
    Object.defineProperty(ConstantPoolEntry.prototype, 'isTwoEntries', {
      get: function() {
        if (this._m_isTwoEntries !== undefined)
          return this._m_isTwoEntries;
        this._m_isTwoEntries = (this.isPrevTwoEntries ? false :  ((this.tag == JavaClass.ConstantPoolEntry.TagEnum.LONG) || (this.tag == JavaClass.ConstantPoolEntry.TagEnum.DOUBLE)) );
        return this._m_isTwoEntries;
      }
    });

    return ConstantPoolEntry;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.6|Source}
   */

  var MethodInfo = JavaClass.MethodInfo = (function() {
    function MethodInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MethodInfo.prototype._read = function() {
      this.accessFlags = this._io.readU2be();
      this.nameIndex = this._io.readU2be();
      this.descriptorIndex = this._io.readU2be();
      this.attributesCount = this._io.readU2be();
      this.attributes = new Array(this.attributesCount);
      for (var i = 0; i < this.attributesCount; i++) {
        this.attributes[i] = new AttributeInfo(this._io, this, this._root);
      }
    }
    Object.defineProperty(MethodInfo.prototype, 'nameAsStr', {
      get: function() {
        if (this._m_nameAsStr !== undefined)
          return this._m_nameAsStr;
        this._m_nameAsStr = this._root.constantPool[(this.nameIndex - 1)].cpInfo.value;
        return this._m_nameAsStr;
      }
    });

    return MethodInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.4|Source}
   */

  var IntegerCpInfo = JavaClass.IntegerCpInfo = (function() {
    function IntegerCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    IntegerCpInfo.prototype._read = function() {
      this.value = this._io.readU4be();
    }

    return IntegerCpInfo;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2|Source}
   */

  var FieldRefCpInfo = JavaClass.FieldRefCpInfo = (function() {
    function FieldRefCpInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FieldRefCpInfo.prototype._read = function() {
      this.classIndex = this._io.readU2be();
      this.nameAndTypeIndex = this._io.readU2be();
    }
    Object.defineProperty(FieldRefCpInfo.prototype, 'classAsInfo', {
      get: function() {
        if (this._m_classAsInfo !== undefined)
          return this._m_classAsInfo;
        this._m_classAsInfo = this._root.constantPool[(this.classIndex - 1)].cpInfo;
        return this._m_classAsInfo;
      }
    });
    Object.defineProperty(FieldRefCpInfo.prototype, 'nameAndTypeAsInfo', {
      get: function() {
        if (this._m_nameAndTypeAsInfo !== undefined)
          return this._m_nameAndTypeAsInfo;
        this._m_nameAndTypeAsInfo = this._root.constantPool[(this.nameAndTypeIndex - 1)].cpInfo;
        return this._m_nameAndTypeAsInfo;
      }
    });

    return FieldRefCpInfo;
  })();

  return JavaClass;
})();
return JavaClass;
}));
