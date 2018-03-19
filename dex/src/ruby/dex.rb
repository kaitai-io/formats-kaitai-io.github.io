# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://source.android.com/devices/tech/dalvik/dex-format Source
class Dex < Kaitai::Struct::Struct

  CLASS_ACCESS_FLAGS = {
    1 => :class_access_flags_public,
    2 => :class_access_flags_private,
    4 => :class_access_flags_protected,
    8 => :class_access_flags_static,
    16 => :class_access_flags_final,
    512 => :class_access_flags_interface,
    1024 => :class_access_flags_abstract,
    4096 => :class_access_flags_synthetic,
    8192 => :class_access_flags_annotation,
    16384 => :class_access_flags_enum,
  }
  I__CLASS_ACCESS_FLAGS = CLASS_ACCESS_FLAGS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = HeaderItem.new(@_io, self, @_root)
    self
  end
  class HeaderItem < Kaitai::Struct::Struct

    ENDIAN_CONSTANT = {
      305419896 => :endian_constant_endian_constant,
      2018915346 => :endian_constant_reverse_endian_constant,
    }
    I__ENDIAN_CONSTANT = ENDIAN_CONSTANT.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([100, 101, 120, 10].pack('C*'))
      @version_str = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(4), 0, false)).force_encoding("ascii")
      @checksum = @_io.read_u4le
      @signature = @_io.read_bytes(20)
      @file_size = @_io.read_u4le
      @header_size = @_io.read_u4le
      @endian_tag = Kaitai::Struct::Stream::resolve_enum(ENDIAN_CONSTANT, @_io.read_u4le)
      @link_size = @_io.read_u4le
      @link_off = @_io.read_u4le
      @map_off = @_io.read_u4le
      @string_ids_size = @_io.read_u4le
      @string_ids_off = @_io.read_u4le
      @type_ids_size = @_io.read_u4le
      @type_ids_off = @_io.read_u4le
      @proto_ids_size = @_io.read_u4le
      @proto_ids_off = @_io.read_u4le
      @field_ids_size = @_io.read_u4le
      @field_ids_off = @_io.read_u4le
      @method_ids_size = @_io.read_u4le
      @method_ids_off = @_io.read_u4le
      @class_defs_size = @_io.read_u4le
      @class_defs_off = @_io.read_u4le
      @data_size = @_io.read_u4le
      @data_off = @_io.read_u4le
      self
    end
    attr_reader :magic
    attr_reader :version_str

    ##
    # adler32 checksum of the rest of the file (everything but magic and this field);  used to detect file corruption
    attr_reader :checksum

    ##
    # SHA-1 signature (hash) of the rest of the file (everything but magic, checksum,  and this field); used to uniquely identify files
    attr_reader :signature

    ##
    # size of the entire file (including the header), in bytes
    attr_reader :file_size

    ##
    # size of the header (this entire section), in bytes. This allows for at  least a limited amount of backwards/forwards compatibility without  invalidating the format.
    attr_reader :header_size
    attr_reader :endian_tag

    ##
    # size of the link section, or 0 if this file isn't statically linked
    attr_reader :link_size

    ##
    # offset from the start of the file to the link section, or 0 if link_size == 0.  The offset, if non-zero, should be to an offset into the link_data section. The format of the data pointed at is left unspecified by this document;  this header field (and the previous) are left as hooks for use by runtime implementations.
    attr_reader :link_off

    ##
    # offset from the start of the file to the map item. The offset, which must be non-zero, should be to an offset into the data  section, and the data should be in the format specified by "map_list" below.    
    attr_reader :map_off

    ##
    # count of strings in the string identifiers list
    attr_reader :string_ids_size

    ##
    # offset from the start of the file to the string identifiers list, or 0 if string_ids_size == 0 (admittedly a strange edge case).  The offset, if non-zero, should be to the start of the string_ids section.
    attr_reader :string_ids_off

    ##
    # count of elements in the type identifiers list, at most 65535
    attr_reader :type_ids_size

    ##
    # offset from the start of the file to the type identifiers list,  or 0 if type_ids_size == 0 (admittedly a strange edge case).  The offset, if non-zero, should be to the start of the type_ids section.
    attr_reader :type_ids_off

    ##
    # count of elements in the prototype identifiers list, at most 65535
    attr_reader :proto_ids_size

    ##
    # offset from the start of the file to the prototype identifiers list,  or 0 if proto_ids_size == 0 (admittedly a strange edge case). The offset, if non-zero, should be to the start of the proto_ids section.
    attr_reader :proto_ids_off

    ##
    # count of elements in the field identifiers list
    attr_reader :field_ids_size

    ##
    # offset from the start of the file to the field identifiers list, or 0 if field_ids_size == 0. The offset, if non-zero, should be to the start of the field_ids section.    
    attr_reader :field_ids_off

    ##
    # count of elements in the method identifiers list
    attr_reader :method_ids_size

    ##
    # offset from the start of the file to the method identifiers list,  or 0 if method_ids_size == 0. The offset, if non-zero, should be to the start of the method_ids section.
    attr_reader :method_ids_off

    ##
    # count of elements in the class definitions list
    attr_reader :class_defs_size

    ##
    # offset from the start of the file to the class definitions list,  or 0 if class_defs_size == 0 (admittedly a strange edge case). The offset, if non-zero, should be to the start of the class_defs section.
    attr_reader :class_defs_off

    ##
    # Size of data section in bytes. Must be an even multiple of sizeof(uint).
    attr_reader :data_size

    ##
    # offset from the start of the file to the start of the data section.
    attr_reader :data_off
  end
  class MapList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4le
      @list = Array.new(size)
      (size).times { |i|
        @list[i] = MapItem.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :size
    attr_reader :list
  end
  class EncodedValue < Kaitai::Struct::Struct

    VALUE_TYPE_ENUM = {
      0 => :value_type_enum_byte,
      2 => :value_type_enum_short,
      3 => :value_type_enum_char,
      4 => :value_type_enum_int,
      6 => :value_type_enum_long,
      16 => :value_type_enum_float,
      17 => :value_type_enum_double,
      21 => :value_type_enum_method_type,
      22 => :value_type_enum_method_handle,
      23 => :value_type_enum_string,
      24 => :value_type_enum_type,
      25 => :value_type_enum_field,
      26 => :value_type_enum_method,
      27 => :value_type_enum_enum,
      28 => :value_type_enum_array,
      29 => :value_type_enum_annotation,
      30 => :value_type_enum_null,
      31 => :value_type_enum_boolean,
    }
    I__VALUE_TYPE_ENUM = VALUE_TYPE_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value_arg = @_io.read_bits_int(3)
      @value_type = Kaitai::Struct::Stream::resolve_enum(VALUE_TYPE_ENUM, @_io.read_bits_int(5))
      @_io.align_to_byte
      case value_type
      when :value_type_enum_double
        @value = @_io.read_f8le
      when :value_type_enum_annotation
        @value = EncodedAnnotation.new(@_io, self, @_root)
      when :value_type_enum_type
        @value = @_io.read_u4le
      when :value_type_enum_char
        @value = @_io.read_u2le
      when :value_type_enum_method_handle
        @value = @_io.read_u4le
      when :value_type_enum_array
        @value = EncodedArray.new(@_io, self, @_root)
      when :value_type_enum_byte
        @value = @_io.read_s1
      when :value_type_enum_method
        @value = @_io.read_u4le
      when :value_type_enum_method_type
        @value = @_io.read_u4le
      when :value_type_enum_short
        @value = @_io.read_s2le
      when :value_type_enum_string
        @value = @_io.read_u4le
      when :value_type_enum_int
        @value = @_io.read_s4le
      when :value_type_enum_field
        @value = @_io.read_u4le
      when :value_type_enum_long
        @value = @_io.read_s8le
      when :value_type_enum_float
        @value = @_io.read_f4le
      when :value_type_enum_enum
        @value = @_io.read_u4le
      end
      self
    end
    attr_reader :value_arg
    attr_reader :value_type
    attr_reader :value
  end
  class CallSiteIdItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @call_site_off = @_io.read_u4le
      self
    end

    ##
    # offset from the start of the file to call site definition.
    # The offset should be in the data section, and the data there should be in the format specified by "call_site_item" below.
    attr_reader :call_site_off
  end
  class MethodIdItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @class_idx = @_io.read_u2le
      @proto_idx = @_io.read_u2le
      @name_idx = @_io.read_u4le
      self
    end

    ##
    # the definer of this method
    def class_name
      return @class_name unless @class_name.nil?
      @class_name = _root.type_ids[class_idx].type_name
      @class_name
    end

    ##
    # the short-form descriptor of the prototype of this method
    def proto_desc
      return @proto_desc unless @proto_desc.nil?
      @proto_desc = _root.proto_ids[proto_idx].shorty_desc
      @proto_desc
    end

    ##
    # the name of this method
    def method_name
      return @method_name unless @method_name.nil?
      @method_name = _root.string_ids[name_idx].value.data
      @method_name
    end

    ##
    # index into the type_ids list for the definer of this method. This must be a class or array type, and not a primitive type.
    attr_reader :class_idx

    ##
    # index into the proto_ids list for the prototype of this method
    attr_reader :proto_idx

    ##
    # index into the string_ids list for the name of this method. The string must conform to the syntax for MemberName, defined above.
    attr_reader :name_idx
  end
  class TypeItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type_idx = @_io.read_u2le
      self
    end
    def value
      return @value unless @value.nil?
      @value = _root.type_ids[type_idx].type_name
      @value
    end
    attr_reader :type_idx
  end
  class TypeIdItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @descriptor_idx = @_io.read_u4le
      self
    end
    def type_name
      return @type_name unless @type_name.nil?
      @type_name = _root.string_ids[descriptor_idx].value.data
      @type_name
    end

    ##
    # index into the string_ids list for the descriptor string of this type. The string must conform to the syntax for TypeDescriptor, defined above.
    attr_reader :descriptor_idx
  end
  class AnnotationElement < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name_idx = VlqBase128Le.new(@_io)
      @value = EncodedValue.new(@_io, self, @_root)
      self
    end

    ##
    # element name, represented as an index into the string_ids section.
    # The string must conform to the syntax for MemberName, defined above.
    attr_reader :name_idx

    ##
    # element value
    attr_reader :value
  end
  class EncodedField < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @field_idx_diff = VlqBase128Le.new(@_io)
      @access_flags = VlqBase128Le.new(@_io)
      self
    end

    ##
    # index into the field_ids list for the identity of this field (includes the name and descriptor), represented as a difference from the index of previous element in the list.
    # The index of the first element in a list is represented directly.
    attr_reader :field_idx_diff

    ##
    # access flags for the field (public, final, etc.).
    # See "access_flags Definitions" for details.
    attr_reader :access_flags
  end
  class EncodedArrayItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = EncodedArray.new(@_io, self, @_root)
      self
    end
    attr_reader :value
  end
  class ClassDataItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @static_fields_size = VlqBase128Le.new(@_io)
      @instance_fields_size = VlqBase128Le.new(@_io)
      @direct_methods_size = VlqBase128Le.new(@_io)
      @virtual_methods_size = VlqBase128Le.new(@_io)
      @static_fields = Array.new(static_fields_size.value)
      (static_fields_size.value).times { |i|
        @static_fields[i] = EncodedField.new(@_io, self, @_root)
      }
      @instance_fields = Array.new(instance_fields_size.value)
      (instance_fields_size.value).times { |i|
        @instance_fields[i] = EncodedField.new(@_io, self, @_root)
      }
      @direct_methods = Array.new(direct_methods_size.value)
      (direct_methods_size.value).times { |i|
        @direct_methods[i] = EncodedMethod.new(@_io, self, @_root)
      }
      @virtual_methods = Array.new(virtual_methods_size.value)
      (virtual_methods_size.value).times { |i|
        @virtual_methods[i] = EncodedMethod.new(@_io, self, @_root)
      }
      self
    end

    ##
    # the number of static fields defined in this item
    attr_reader :static_fields_size

    ##
    # the number of instance fields defined in this item
    attr_reader :instance_fields_size

    ##
    # the number of direct methods defined in this item
    attr_reader :direct_methods_size

    ##
    # the number of virtual methods defined in this item
    attr_reader :virtual_methods_size

    ##
    # the defined static fields, represented as a sequence of encoded elements.
    # The fields must be sorted by field_idx in increasing order.
    attr_reader :static_fields

    ##
    # the defined instance fields, represented as a sequence of encoded elements.
    # The fields must be sorted by field_idx in increasing order.        
    attr_reader :instance_fields

    ##
    # the defined direct (any of static, private, or constructor) methods, represented as a sequence of encoded elements.
    # The methods must be sorted by method_idx in increasing order.
    attr_reader :direct_methods

    ##
    # the defined virtual (none of static, private, or constructor) methods, represented as a sequence of encoded elements.
    # This list should not include inherited methods unless overridden by the class that this item represents.
    # The methods must be sorted by method_idx in increasing order.
    # The method_idx of a virtual method must not be the same as any direct method.        
    attr_reader :virtual_methods
  end
  class FieldIdItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @class_idx = @_io.read_u2le
      @type_idx = @_io.read_u2le
      @name_idx = @_io.read_u4le
      self
    end

    ##
    # the definer of this field
    def class_name
      return @class_name unless @class_name.nil?
      @class_name = _root.type_ids[class_idx].type_name
      @class_name
    end

    ##
    # the type of this field
    def type_name
      return @type_name unless @type_name.nil?
      @type_name = _root.type_ids[type_idx].type_name
      @type_name
    end

    ##
    # the name of this field
    def field_name
      return @field_name unless @field_name.nil?
      @field_name = _root.string_ids[name_idx].value.data
      @field_name
    end

    ##
    # index into the type_ids list for the definer of this field. This must be a class type, and not an array or primitive type.
    attr_reader :class_idx

    ##
    # index into the type_ids list for the type of this field
    attr_reader :type_idx

    ##
    # index into the string_ids list for the name of this field. The string must conform to the syntax for MemberName, defined above.
    attr_reader :name_idx
  end
  class EncodedAnnotation < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type_idx = VlqBase128Le.new(@_io)
      @size = VlqBase128Le.new(@_io)
      @elements = Array.new(size.value)
      (size.value).times { |i|
        @elements[i] = AnnotationElement.new(@_io, self, @_root)
      }
      self
    end

    ##
    # type of the annotation.
    # This must be a class (not array or primitive) type.
    attr_reader :type_idx

    ##
    # number of name-value mappings in this annotation
    attr_reader :size

    ##
    # elements of the annotation, represented directly in-line (not as offsets).
    # Elements must be sorted in increasing order by string_id index.
    attr_reader :elements
  end
  class ClassDefItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @class_idx = @_io.read_u4le
      @access_flags = Kaitai::Struct::Stream::resolve_enum(CLASS_ACCESS_FLAGS, @_io.read_u4le)
      @superclass_idx = @_io.read_u4le
      @interfaces_off = @_io.read_u4le
      @source_file_idx = @_io.read_u4le
      @annotations_off = @_io.read_u4le
      @class_data_off = @_io.read_u4le
      @static_values_off = @_io.read_u4le
      self
    end
    def type_name
      return @type_name unless @type_name.nil?
      @type_name = _root.type_ids[class_idx].type_name
      @type_name
    end
    def class_data
      return @class_data unless @class_data.nil?
      if class_data_off != 0
        _pos = @_io.pos
        @_io.seek(class_data_off)
        @class_data = ClassDataItem.new(@_io, self, @_root)
        @_io.seek(_pos)
      end
      @class_data
    end
    def static_values
      return @static_values unless @static_values.nil?
      if static_values_off != 0
        _pos = @_io.pos
        @_io.seek(static_values_off)
        @static_values = EncodedArrayItem.new(@_io, self, @_root)
        @_io.seek(_pos)
      end
      @static_values
    end

    ##
    # index into the type_ids list for this class.
    # This must be a class type, and not an array or primitive type.
    attr_reader :class_idx

    ##
    # access flags for the class (public, final, etc.).
    # See "access_flags Definitions" for details.
    attr_reader :access_flags

    ##
    # index into the type_ids list for the superclass,  or the constant value NO_INDEX if this class has no superclass  (i.e., it is a root class such as Object). 
    # If present, this must be a class type, and not an array or primitive type.
    attr_reader :superclass_idx

    ##
    # offset from the start of the file to the list of interfaces, or 0 if there are none.
    # This offset should be in the data section, and the data there should  be in the format specified by "type_list" below. Each of the elements  of the list must be a class type (not an array or primitive type),  and there must not be any duplicates.        
    attr_reader :interfaces_off

    ##
    # index into the string_ids list for the name of the file containing  the original source for (at least most of) this class, or the  special value NO_INDEX to represent a lack of this information.
    # The debug_info_item of any given method may override this source file, but the expectation is that most classes will only come from one source file.
    attr_reader :source_file_idx

    ##
    # offset from the start of the file to the annotations structure for  this class, or 0 if there are no annotations on this class.
    # This offset, if non-zero, should be in the data section, and the data  there should be in the format specified by "annotations_directory_item" below,with all items referring to this class as the definer.        
    attr_reader :annotations_off

    ##
    # offset from the start of the file to the associated class data for this item, or 0 if there is no class data for this class.
    # (This may be the case, for example, if this class is a marker interface.)
    # The offset, if non-zero, should be in the data section, and the data there should be in the format specified by "class_data_item" below, with all items referring to this class as the definer.        
    attr_reader :class_data_off

    ##
    # offset from the start of the file to the list of initial values for  static fields, or 0 if there are none (and all static fields are to be  initialized with 0 or null).
    # This offset should be in the data section, and the data there should  be in the format specified by "encoded_array_item" below.
    # The size of the array must be no larger than the number of static fields  declared by this class, and the elements correspond to the static fields  in the same order as declared in the corresponding field_list.
    # The type of each array element must match the declared type of its corresponding field.
    # If there are fewer elements in the array than there are static fields, then the leftover fields are initialized with a type-appropriate 0 or null.
    attr_reader :static_values_off
  end
  class TypeList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4le
      @list = Array.new(size)
      (size).times { |i|
        @list[i] = TypeItem.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :size
    attr_reader :list
  end
  class StringIdItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @string_data_off = @_io.read_u4le
      self
    end
    class StringDataItem < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @utf16_size = VlqBase128Le.new(@_io)
        @data = (@_io.read_bytes(utf16_size.value)).force_encoding("ascii")
        self
      end
      attr_reader :utf16_size
      attr_reader :data
    end
    def value
      return @value unless @value.nil?
      _pos = @_io.pos
      @_io.seek(string_data_off)
      @value = StringDataItem.new(@_io, self, @_root)
      @_io.seek(_pos)
      @value
    end

    ##
    # offset from the start of the file to the string data for this item. The offset should be to a location in the data section, and the data should be in the format specified by "string_data_item" below. There is no alignment requirement for the offset.
    attr_reader :string_data_off
  end
  class ProtoIdItem < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @shorty_idx = @_io.read_u4le
      @return_type_idx = @_io.read_u4le
      @parameters_off = @_io.read_u4le
      self
    end

    ##
    # short-form descriptor string of this prototype, as pointed to by shorty_idx
    def shorty_desc
      return @shorty_desc unless @shorty_desc.nil?
      @shorty_desc = _root.string_ids[shorty_idx].value.data
      @shorty_desc
    end

    ##
    # list of parameter types for this prototype
    def params_types
      return @params_types unless @params_types.nil?
      if parameters_off != 0
        io = _root._io
        _pos = io.pos
        io.seek(parameters_off)
        @params_types = TypeList.new(io, self, @_root)
        io.seek(_pos)
      end
      @params_types
    end

    ##
    # return type of this prototype
    def return_type
      return @return_type unless @return_type.nil?
      @return_type = _root.type_ids[return_type_idx].type_name
      @return_type
    end

    ##
    # index into the string_ids list for the short-form descriptor string of this prototype. The string must conform to the syntax for ShortyDescriptor, defined above,  and must correspond to the return type and parameters of this item.
    attr_reader :shorty_idx

    ##
    # index into the type_ids list for the return type of this prototype
    attr_reader :return_type_idx

    ##
    # offset from the start of the file to the list of parameter types for this prototype,  or 0 if this prototype has no parameters. This offset, if non-zero, should be in the data section, and the data there should be in the format specified by "type_list" below. Additionally, there should be no reference to the type void in the list.
    attr_reader :parameters_off
  end
  class EncodedMethod < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @method_idx_diff = VlqBase128Le.new(@_io)
      @access_flags = VlqBase128Le.new(@_io)
      @code_off = VlqBase128Le.new(@_io)
      self
    end

    ##
    # index into the method_ids list for the identity of this method (includes the name and descriptor), represented as a difference from the index of previous element in the list.
    # The index of the first element in a list is represented directly.
    attr_reader :method_idx_diff

    ##
    # access flags for the field (public, final, etc.).
    # See "access_flags Definitions" for details.
    attr_reader :access_flags

    ##
    # offset from the start of the file to the code structure for this method, or 0 if this method is either abstract or native.
    # The offset should be to a location in the data section.
    # The format of the data is specified by "code_item" below.
    attr_reader :code_off
  end
  class MapItem < Kaitai::Struct::Struct

    MAP_ITEM_TYPE = {
      0 => :map_item_type_header_item,
      1 => :map_item_type_string_id_item,
      2 => :map_item_type_type_id_item,
      3 => :map_item_type_proto_id_item,
      4 => :map_item_type_field_id_item,
      5 => :map_item_type_method_id_item,
      6 => :map_item_type_class_def_item,
      7 => :map_item_type_call_site_id_item,
      8 => :map_item_type_method_handle_item,
      4096 => :map_item_type_map_list,
      4097 => :map_item_type_type_list,
      4098 => :map_item_type_annotation_set_ref_list,
      4099 => :map_item_type_annotation_set_item,
      8192 => :map_item_type_class_data_item,
      8193 => :map_item_type_code_item,
      8194 => :map_item_type_string_data_item,
      8195 => :map_item_type_debug_info_item,
      8196 => :map_item_type_annotation_item,
      8197 => :map_item_type_encoded_array_item,
      8198 => :map_item_type_annotations_directory_item,
    }
    I__MAP_ITEM_TYPE = MAP_ITEM_TYPE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(MAP_ITEM_TYPE, @_io.read_u2le)
      @unused = @_io.read_u2le
      @size = @_io.read_u4le
      @offset = @_io.read_u4le
      self
    end

    ##
    # type of the items; see table below
    attr_reader :type

    ##
    # (unused)
    attr_reader :unused

    ##
    # count of the number of items to be found at the indicated offset
    attr_reader :size

    ##
    # offset from the start of the file to the items in question
    attr_reader :offset
  end
  class EncodedArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = VlqBase128Le.new(@_io)
      @values = Array.new(size.value)
      (size.value).times { |i|
        @values[i] = EncodedValue.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :size
    attr_reader :values
  end

  ##
  # string identifiers list.
  # These are identifiers for all the strings used by this file, either for  internal naming (e.g., type descriptors) or as constant objects referred to by code.
  # This list must be sorted by string contents, using UTF-16 code point values (not in a locale-sensitive manner), and it must not contain any duplicate entries.    
  def string_ids
    return @string_ids unless @string_ids.nil?
    _pos = @_io.pos
    @_io.seek(header.string_ids_off)
    @string_ids = Array.new(header.string_ids_size)
    (header.string_ids_size).times { |i|
      @string_ids[i] = StringIdItem.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @string_ids
  end

  ##
  # method identifiers list.
  # These are identifiers for all methods referred to by this file, whether defined in the file or not.
  # This list must be sorted, where the defining type (by type_id index  is the major order, method name (by string_id index) is the intermediate order, and method prototype (by proto_id index) is the minor order.
  # The list must not contain any duplicate entries.
  def method_ids
    return @method_ids unless @method_ids.nil?
    _pos = @_io.pos
    @_io.seek(header.method_ids_off)
    @method_ids = Array.new(header.method_ids_size)
    (header.method_ids_size).times { |i|
      @method_ids[i] = MethodIdItem.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @method_ids
  end

  ##
  # data used in statically linked files.
  # The format of the data in this section is left unspecified by this document.
  # This section is empty in unlinked files, and runtime implementations may use it as they see fit.
  def link_data
    return @link_data unless @link_data.nil?
    _pos = @_io.pos
    @_io.seek(header.link_off)
    @link_data = @_io.read_bytes(header.link_size)
    @_io.seek(_pos)
    @link_data
  end
  def map
    return @map unless @map.nil?
    _pos = @_io.pos
    @_io.seek(header.map_off)
    @map = MapList.new(@_io, self, @_root)
    @_io.seek(_pos)
    @map
  end

  ##
  # class definitions list.
  # The classes must be ordered such that a given class's superclass and implemented interfaces appear in the list earlier than the referring class.
  # Furthermore, it is invalid for a definition for the same-named class to appear more than once in the list.
  def class_defs
    return @class_defs unless @class_defs.nil?
    _pos = @_io.pos
    @_io.seek(header.class_defs_off)
    @class_defs = Array.new(header.class_defs_size)
    (header.class_defs_size).times { |i|
      @class_defs[i] = ClassDefItem.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @class_defs
  end

  ##
  # data area, containing all the support data for the tables listed above.
  # Different items have different alignment requirements, and padding bytes are inserted before each item if necessary to achieve proper alignment.
  def data
    return @data unless @data.nil?
    _pos = @_io.pos
    @_io.seek(header.data_off)
    @data = @_io.read_bytes(header.data_size)
    @_io.seek(_pos)
    @data
  end

  ##
  # type identifiers list. 
  # These are identifiers for all types (classes, arrays, or primitive types)  referred to by this file, whether defined in the file or not.
  # This list must be sorted by string_id index, and it must not contain any duplicate entries.
  def type_ids
    return @type_ids unless @type_ids.nil?
    _pos = @_io.pos
    @_io.seek(header.type_ids_off)
    @type_ids = Array.new(header.type_ids_size)
    (header.type_ids_size).times { |i|
      @type_ids[i] = TypeIdItem.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @type_ids
  end

  ##
  # method prototype identifiers list.
  # These are identifiers for all prototypes referred to by this file.
  # This list must be sorted in return-type (by type_id index) major order, and then by argument list (lexicographic ordering, individual arguments ordered by type_id index). The list must not contain any duplicate entries.
  def proto_ids
    return @proto_ids unless @proto_ids.nil?
    _pos = @_io.pos
    @_io.seek(header.proto_ids_off)
    @proto_ids = Array.new(header.proto_ids_size)
    (header.proto_ids_size).times { |i|
      @proto_ids[i] = ProtoIdItem.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @proto_ids
  end

  ##
  # field identifiers list.
  # These are identifiers for all fields referred to by this file, whether defined in the file or not. 
  # This list must be sorted, where the defining type (by type_id index)  is the major order, field name (by string_id index) is the intermediate  order, and type (by type_id index) is the minor order.
  # The list must not contain any duplicate entries.
  def field_ids
    return @field_ids unless @field_ids.nil?
    _pos = @_io.pos
    @_io.seek(header.field_ids_off)
    @field_ids = Array.new(header.field_ids_size)
    (header.field_ids_size).times { |i|
      @field_ids[i] = FieldIdItem.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @field_ids
  end
  attr_reader :header
end
