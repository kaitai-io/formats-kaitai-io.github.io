# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html Source
# @see https://docs.oracle.com/javase/specs/jls/se6/jls3.pdf Source
# @see https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/jdk.hotspot.agent/share/classes/sun/jvm/hotspot/runtime/ClassConstants.java Source
# @see https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/java.base/share/native/include/classfile_constants.h.template Source
# @see https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/hotspot/share/classfile/classFileParser.cpp Source
class JavaClass < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([202, 254, 186, 190].pack('C*'), magic, _io, "/seq/0") if not magic == [202, 254, 186, 190].pack('C*')
    @version_minor = @_io.read_u2be
    @version_major = @_io.read_u2be
    raise Kaitai::Struct::ValidationLessThanError.new(43, version_major, _io, "/seq/2") if not version_major >= 43
    @constant_pool_count = @_io.read_u2be
    @constant_pool = []
    ((constant_pool_count - 1)).times { |i|
      @constant_pool << ConstantPoolEntry.new(@_io, self, @_root, (i != 0 ? constant_pool[(i - 1)].is_two_entries : false))
    }
    @access_flags = @_io.read_u2be
    @this_class = @_io.read_u2be
    @super_class = @_io.read_u2be
    @interfaces_count = @_io.read_u2be
    @interfaces = []
    (interfaces_count).times { |i|
      @interfaces << @_io.read_u2be
    }
    @fields_count = @_io.read_u2be
    @fields = []
    (fields_count).times { |i|
      @fields << FieldInfo.new(@_io, self, @_root)
    }
    @methods_count = @_io.read_u2be
    @methods = []
    (methods_count).times { |i|
      @methods << MethodInfo.new(@_io, self, @_root)
    }
    @attributes_count = @_io.read_u2be
    @attributes = []
    (attributes_count).times { |i|
      @attributes << AttributeInfo.new(@_io, self, @_root)
    }
    self
  end

  ##
  # `class` file format version 45.3 (appeared in the very first publicly
  # known release of Java SE AND JDK 1.0.2, released 23th January 1996) is so
  # ancient that it's taken for granted. Earlier formats seem to be
  # undocumented. Changes of `version_minor` don't change `class` format.
  # Earlier `version_major`s likely belong to Oak programming language, the
  # proprietary predecessor of Java.
  # @see '' James Gosling, Bill Joy and Guy Steele. The Java Language Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Aug. 1996, p. 825. ISBN: 0-201-63451-1.
  # @see '' Frank Yellin and Tim Lindholm. The Java Virtual Machine Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Sept. 1996, p. 475. ISBN: 0-201-63452-X.
  class VersionGuard < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, major)
      super(_io, _parent, _root)
      @major = major
      _read
    end

    def _read
      @_unnamed0 = @_io.read_bytes(0)
      _ = _unnamed0
      raise Kaitai::Struct::ValidationExprError.new(_unnamed0, _io, "/types/version_guard/seq/0") if not _root.version_major >= major
      self
    end
    attr_reader :_unnamed0
    attr_reader :major
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5 Source
  class FloatCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = @_io.read_f4be
      self
    end
    attr_reader :value
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7 Source
  class AttributeInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name_index = @_io.read_u2be
      @attribute_length = @_io.read_u4be
      case name_as_str
      when "SourceFile"
        @_raw_info = @_io.read_bytes(attribute_length)
        _io__raw_info = Kaitai::Struct::Stream.new(@_raw_info)
        @info = AttrBodySourceFile.new(_io__raw_info, self, @_root)
      when "LineNumberTable"
        @_raw_info = @_io.read_bytes(attribute_length)
        _io__raw_info = Kaitai::Struct::Stream.new(@_raw_info)
        @info = AttrBodyLineNumberTable.new(_io__raw_info, self, @_root)
      when "Exceptions"
        @_raw_info = @_io.read_bytes(attribute_length)
        _io__raw_info = Kaitai::Struct::Stream.new(@_raw_info)
        @info = AttrBodyExceptions.new(_io__raw_info, self, @_root)
      when "Code"
        @_raw_info = @_io.read_bytes(attribute_length)
        _io__raw_info = Kaitai::Struct::Stream.new(@_raw_info)
        @info = AttrBodyCode.new(_io__raw_info, self, @_root)
      else
        @info = @_io.read_bytes(attribute_length)
      end
      self
    end

    ##
    # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3 Source
    class AttrBodyCode < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @max_stack = @_io.read_u2be
        @max_locals = @_io.read_u2be
        @code_length = @_io.read_u4be
        @code = @_io.read_bytes(code_length)
        @exception_table_length = @_io.read_u2be
        @exception_table = []
        (exception_table_length).times { |i|
          @exception_table << ExceptionEntry.new(@_io, self, @_root)
        }
        @attributes_count = @_io.read_u2be
        @attributes = []
        (attributes_count).times { |i|
          @attributes << AttributeInfo.new(@_io, self, @_root)
        }
        self
      end

      ##
      # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3 Source
      class ExceptionEntry < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @start_pc = @_io.read_u2be
          @end_pc = @_io.read_u2be
          @handler_pc = @_io.read_u2be
          @catch_type = @_io.read_u2be
          self
        end
        def catch_exception
          return @catch_exception unless @catch_exception.nil?
          if catch_type != 0
            @catch_exception = _root.constant_pool[(catch_type - 1)]
          end
          @catch_exception
        end

        ##
        # Start of a code region where exception handler is being
        # active, index in code array (inclusive)
        attr_reader :start_pc

        ##
        # End of a code region where exception handler is being
        # active, index in code array (exclusive)
        attr_reader :end_pc

        ##
        # Start of exception handler code, index in code array
        attr_reader :handler_pc

        ##
        # Exception class that this handler catches, index in constant
        # pool, or 0 (catch all exceptions handler, used to implement
        # `finally`).
        attr_reader :catch_type
      end
      attr_reader :max_stack
      attr_reader :max_locals
      attr_reader :code_length
      attr_reader :code
      attr_reader :exception_table_length
      attr_reader :exception_table
      attr_reader :attributes_count
      attr_reader :attributes
    end

    ##
    # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.5 Source
    class AttrBodyExceptions < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @number_of_exceptions = @_io.read_u2be
        @exceptions = []
        (number_of_exceptions).times { |i|
          @exceptions << ExceptionTableEntry.new(@_io, self, @_root)
        }
        self
      end
      class ExceptionTableEntry < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @index = @_io.read_u2be
          self
        end
        def as_info
          return @as_info unless @as_info.nil?
          @as_info = _root.constant_pool[(index - 1)].cp_info
          @as_info
        end
        def name_as_str
          return @name_as_str unless @name_as_str.nil?
          @name_as_str = as_info.name_as_str
          @name_as_str
        end
        attr_reader :index
      end
      attr_reader :number_of_exceptions
      attr_reader :exceptions
    end

    ##
    # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.10 Source
    class AttrBodySourceFile < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @sourcefile_index = @_io.read_u2be
        self
      end
      def sourcefile_as_str
        return @sourcefile_as_str unless @sourcefile_as_str.nil?
        @sourcefile_as_str = _root.constant_pool[(sourcefile_index - 1)].cp_info.value
        @sourcefile_as_str
      end
      attr_reader :sourcefile_index
    end

    ##
    # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.12 Source
    class AttrBodyLineNumberTable < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @line_number_table_length = @_io.read_u2be
        @line_number_table = []
        (line_number_table_length).times { |i|
          @line_number_table << LineNumberTableEntry.new(@_io, self, @_root)
        }
        self
      end
      class LineNumberTableEntry < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @start_pc = @_io.read_u2be
          @line_number = @_io.read_u2be
          self
        end
        attr_reader :start_pc
        attr_reader :line_number
      end
      attr_reader :line_number_table_length
      attr_reader :line_number_table
    end
    def name_as_str
      return @name_as_str unless @name_as_str.nil?
      @name_as_str = _root.constant_pool[(name_index - 1)].cp_info.value
      @name_as_str
    end
    attr_reader :name_index
    attr_reader :attribute_length
    attr_reader :info
    attr_reader :_raw_info
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2 Source
  class MethodRefCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @class_index = @_io.read_u2be
      @name_and_type_index = @_io.read_u2be
      self
    end
    def class_as_info
      return @class_as_info unless @class_as_info.nil?
      @class_as_info = _root.constant_pool[(class_index - 1)].cp_info
      @class_as_info
    end
    def name_and_type_as_info
      return @name_and_type_as_info unless @name_and_type_as_info.nil?
      @name_and_type_as_info = _root.constant_pool[(name_and_type_index - 1)].cp_info
      @name_and_type_as_info
    end
    attr_reader :class_index
    attr_reader :name_and_type_index
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.5 Source
  class FieldInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @access_flags = @_io.read_u2be
      @name_index = @_io.read_u2be
      @descriptor_index = @_io.read_u2be
      @attributes_count = @_io.read_u2be
      @attributes = []
      (attributes_count).times { |i|
        @attributes << AttributeInfo.new(@_io, self, @_root)
      }
      self
    end
    def name_as_str
      return @name_as_str unless @name_as_str.nil?
      @name_as_str = _root.constant_pool[(name_index - 1)].cp_info.value
      @name_as_str
    end
    attr_reader :access_flags
    attr_reader :name_index
    attr_reader :descriptor_index
    attr_reader :attributes_count
    attr_reader :attributes
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6 Source
  class DoubleCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = @_io.read_f8be
      self
    end
    attr_reader :value
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.10 Source
  class DynamicCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_unnamed0 = VersionGuard.new(@_io, self, @_root, 55)
      @bootstrap_method_attr_index = @_io.read_u2be
      @name_and_type_index = @_io.read_u2be
      self
    end
    attr_reader :_unnamed0
    attr_reader :bootstrap_method_attr_index
    attr_reader :name_and_type_index
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5 Source
  class LongCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = @_io.read_u8be
      self
    end
    attr_reader :value
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.10 Source
  class InvokeDynamicCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_unnamed0 = VersionGuard.new(@_io, self, @_root, 51)
      @bootstrap_method_attr_index = @_io.read_u2be
      @name_and_type_index = @_io.read_u2be
      self
    end
    attr_reader :_unnamed0
    attr_reader :bootstrap_method_attr_index
    attr_reader :name_and_type_index
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.8 Source
  class MethodHandleCpInfo < Kaitai::Struct::Struct

    REFERENCE_KIND_ENUM = {
      1 => :reference_kind_enum_get_field,
      2 => :reference_kind_enum_get_static,
      3 => :reference_kind_enum_put_field,
      4 => :reference_kind_enum_put_static,
      5 => :reference_kind_enum_invoke_virtual,
      6 => :reference_kind_enum_invoke_static,
      7 => :reference_kind_enum_invoke_special,
      8 => :reference_kind_enum_new_invoke_special,
      9 => :reference_kind_enum_invoke_interface,
    }
    I__REFERENCE_KIND_ENUM = REFERENCE_KIND_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_unnamed0 = VersionGuard.new(@_io, self, @_root, 51)
      @reference_kind = Kaitai::Struct::Stream::resolve_enum(REFERENCE_KIND_ENUM, @_io.read_u1)
      @reference_index = @_io.read_u2be
      self
    end
    attr_reader :_unnamed0
    attr_reader :reference_kind
    attr_reader :reference_index
  end

  ##
  # Project Jigsaw modules introduced in Java 9
  # @see https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-3.html#jvms-3.16 Source
  # @see https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.11 Source
  # @see https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.12 Source
  class ModulePackageCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_unnamed0 = VersionGuard.new(@_io, self, @_root, 53)
      @name_index = @_io.read_u2be
      self
    end
    def name_as_info
      return @name_as_info unless @name_as_info.nil?
      @name_as_info = _root.constant_pool[(name_index - 1)].cp_info
      @name_as_info
    end
    def name_as_str
      return @name_as_str unless @name_as_str.nil?
      @name_as_str = name_as_info.value
      @name_as_str
    end
    attr_reader :_unnamed0
    attr_reader :name_index
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6 Source
  class NameAndTypeCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name_index = @_io.read_u2be
      @descriptor_index = @_io.read_u2be
      self
    end
    def name_as_info
      return @name_as_info unless @name_as_info.nil?
      @name_as_info = _root.constant_pool[(name_index - 1)].cp_info
      @name_as_info
    end
    def name_as_str
      return @name_as_str unless @name_as_str.nil?
      @name_as_str = name_as_info.value
      @name_as_str
    end
    def descriptor_as_info
      return @descriptor_as_info unless @descriptor_as_info.nil?
      @descriptor_as_info = _root.constant_pool[(descriptor_index - 1)].cp_info
      @descriptor_as_info
    end
    def descriptor_as_str
      return @descriptor_as_str unless @descriptor_as_str.nil?
      @descriptor_as_str = descriptor_as_info.value
      @descriptor_as_str
    end
    attr_reader :name_index
    attr_reader :descriptor_index
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.7 Source
  class Utf8CpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @str_len = @_io.read_u2be
      @value = (@_io.read_bytes(str_len)).force_encoding("UTF-8")
      self
    end
    attr_reader :str_len
    attr_reader :value
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.3 Source
  class StringCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @string_index = @_io.read_u2be
      self
    end
    attr_reader :string_index
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.9 Source
  class MethodTypeCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_unnamed0 = VersionGuard.new(@_io, self, @_root, 51)
      @descriptor_index = @_io.read_u2be
      self
    end
    attr_reader :_unnamed0
    attr_reader :descriptor_index
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2 Source
  class InterfaceMethodRefCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @class_index = @_io.read_u2be
      @name_and_type_index = @_io.read_u2be
      self
    end
    def class_as_info
      return @class_as_info unless @class_as_info.nil?
      @class_as_info = _root.constant_pool[(class_index - 1)].cp_info
      @class_as_info
    end
    def name_and_type_as_info
      return @name_and_type_as_info unless @name_and_type_as_info.nil?
      @name_and_type_as_info = _root.constant_pool[(name_and_type_index - 1)].cp_info
      @name_and_type_as_info
    end
    attr_reader :class_index
    attr_reader :name_and_type_index
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.1 Source
  class ClassCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name_index = @_io.read_u2be
      self
    end
    def name_as_info
      return @name_as_info unless @name_as_info.nil?
      @name_as_info = _root.constant_pool[(name_index - 1)].cp_info
      @name_as_info
    end
    def name_as_str
      return @name_as_str unless @name_as_str.nil?
      @name_as_str = name_as_info.value
      @name_as_str
    end
    attr_reader :name_index
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4 Source
  class ConstantPoolEntry < Kaitai::Struct::Struct

    TAG_ENUM = {
      1 => :tag_enum_utf8,
      3 => :tag_enum_integer,
      4 => :tag_enum_float,
      5 => :tag_enum_long,
      6 => :tag_enum_double,
      7 => :tag_enum_class_type,
      8 => :tag_enum_string,
      9 => :tag_enum_field_ref,
      10 => :tag_enum_method_ref,
      11 => :tag_enum_interface_method_ref,
      12 => :tag_enum_name_and_type,
      15 => :tag_enum_method_handle,
      16 => :tag_enum_method_type,
      17 => :tag_enum_dynamic,
      18 => :tag_enum_invoke_dynamic,
      19 => :tag_enum_module,
      20 => :tag_enum_package,
    }
    I__TAG_ENUM = TAG_ENUM.invert
    def initialize(_io, _parent = nil, _root = self, is_prev_two_entries)
      super(_io, _parent, _root)
      @is_prev_two_entries = is_prev_two_entries
      _read
    end

    def _read
      if !(is_prev_two_entries)
        @tag = Kaitai::Struct::Stream::resolve_enum(TAG_ENUM, @_io.read_u1)
      end
      if !(is_prev_two_entries)
        case tag
        when :tag_enum_interface_method_ref
          @cp_info = InterfaceMethodRefCpInfo.new(@_io, self, @_root)
        when :tag_enum_class_type
          @cp_info = ClassCpInfo.new(@_io, self, @_root)
        when :tag_enum_dynamic
          @cp_info = DynamicCpInfo.new(@_io, self, @_root)
        when :tag_enum_utf8
          @cp_info = Utf8CpInfo.new(@_io, self, @_root)
        when :tag_enum_method_type
          @cp_info = MethodTypeCpInfo.new(@_io, self, @_root)
        when :tag_enum_integer
          @cp_info = IntegerCpInfo.new(@_io, self, @_root)
        when :tag_enum_string
          @cp_info = StringCpInfo.new(@_io, self, @_root)
        when :tag_enum_float
          @cp_info = FloatCpInfo.new(@_io, self, @_root)
        when :tag_enum_module
          @cp_info = ModulePackageCpInfo.new(@_io, self, @_root)
        when :tag_enum_long
          @cp_info = LongCpInfo.new(@_io, self, @_root)
        when :tag_enum_method_ref
          @cp_info = MethodRefCpInfo.new(@_io, self, @_root)
        when :tag_enum_double
          @cp_info = DoubleCpInfo.new(@_io, self, @_root)
        when :tag_enum_invoke_dynamic
          @cp_info = InvokeDynamicCpInfo.new(@_io, self, @_root)
        when :tag_enum_field_ref
          @cp_info = FieldRefCpInfo.new(@_io, self, @_root)
        when :tag_enum_method_handle
          @cp_info = MethodHandleCpInfo.new(@_io, self, @_root)
        when :tag_enum_package
          @cp_info = ModulePackageCpInfo.new(@_io, self, @_root)
        when :tag_enum_name_and_type
          @cp_info = NameAndTypeCpInfo.new(@_io, self, @_root)
        end
      end
      self
    end
    def is_two_entries
      return @is_two_entries unless @is_two_entries.nil?
      @is_two_entries = (is_prev_two_entries ? false :  ((tag == :tag_enum_long) || (tag == :tag_enum_double)) )
      @is_two_entries
    end
    attr_reader :tag
    attr_reader :cp_info
    attr_reader :is_prev_two_entries
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.6 Source
  class MethodInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @access_flags = @_io.read_u2be
      @name_index = @_io.read_u2be
      @descriptor_index = @_io.read_u2be
      @attributes_count = @_io.read_u2be
      @attributes = []
      (attributes_count).times { |i|
        @attributes << AttributeInfo.new(@_io, self, @_root)
      }
      self
    end
    def name_as_str
      return @name_as_str unless @name_as_str.nil?
      @name_as_str = _root.constant_pool[(name_index - 1)].cp_info.value
      @name_as_str
    end
    attr_reader :access_flags
    attr_reader :name_index
    attr_reader :descriptor_index
    attr_reader :attributes_count
    attr_reader :attributes
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.4 Source
  class IntegerCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = @_io.read_u4be
      self
    end
    attr_reader :value
  end

  ##
  # @see https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2 Source
  class FieldRefCpInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @class_index = @_io.read_u2be
      @name_and_type_index = @_io.read_u2be
      self
    end
    def class_as_info
      return @class_as_info unless @class_as_info.nil?
      @class_as_info = _root.constant_pool[(class_index - 1)].cp_info
      @class_as_info
    end
    def name_and_type_as_info
      return @name_and_type_as_info unless @name_and_type_as_info.nil?
      @name_and_type_as_info = _root.constant_pool[(name_and_type_index - 1)].cp_info
      @name_and_type_as_info
    end
    attr_reader :class_index
    attr_reader :name_and_type_index
  end
  attr_reader :magic
  attr_reader :version_minor
  attr_reader :version_major
  attr_reader :constant_pool_count
  attr_reader :constant_pool
  attr_reader :access_flags
  attr_reader :this_class
  attr_reader :super_class
  attr_reader :interfaces_count
  attr_reader :interfaces
  attr_reader :fields_count
  attr_reader :fields
  attr_reader :methods_count
  attr_reader :methods
  attr_reader :attributes_count
  attr_reader :attributes
end
