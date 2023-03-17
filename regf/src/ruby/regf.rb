# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# This spec allows to parse files used by Microsoft Windows family of
# operating systems to store parts of its "registry". "Registry" is a
# hierarchical database that is used to store system settings (global
# configuration, per-user, per-application configuration, etc).
# 
# Typically, registry files are stored in:
# 
# * System-wide: several files in `%SystemRoot%\System32\Config\`
# * User-wide:
#   * `%USERPROFILE%\Ntuser.dat`
#   * `%USERPROFILE%\Local Settings\Application Data\Microsoft\Windows\Usrclass.dat` (localized, Windows 2000, Server 2003 and Windows XP)
#   * `%USERPROFILE%\AppData\Local\Microsoft\Windows\Usrclass.dat` (non-localized, Windows Vista and later)
# 
# Note that one typically can't access files directly on a mounted
# filesystem with a running Windows OS.
# @see https://github.com/libyal/libregf/blob/main/documentation/Windows%20NT%20Registry%20File%20(REGF)%20format.asciidoc Source
class Regf < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = FileHeader.new(@_io, self, @_root)
    @_raw_hive_bins = []
    @hive_bins = []
    i = 0
    while not @_io.eof?
      @_raw_hive_bins << @_io.read_bytes(4096)
      _io__raw_hive_bins = Kaitai::Struct::Stream.new(@_raw_hive_bins.last)
      @hive_bins << HiveBin.new(_io__raw_hive_bins, self, @_root)
      i += 1
    end
    self
  end
  class Filetime < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = @_io.read_u8le
      self
    end
    attr_reader :value
  end
  class HiveBin < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = HiveBinHeader.new(@_io, self, @_root)
      @cells = []
      i = 0
      while not @_io.eof?
        @cells << HiveBinCell.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :header
    attr_reader :cells
  end
  class HiveBinHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([104, 98, 105, 110].pack('C*'), signature, _io, "/types/hive_bin_header/seq/0") if not signature == [104, 98, 105, 110].pack('C*')
      @offset = @_io.read_u4le
      @size = @_io.read_u4le
      @unknown1 = @_io.read_u4le
      @unknown2 = @_io.read_u4le
      @timestamp = Filetime.new(@_io, self, @_root)
      @unknown4 = @_io.read_u4le
      self
    end
    attr_reader :signature

    ##
    # The offset of the hive bin, Value in bytes and relative from
    # the start of the hive bin data
    attr_reader :offset

    ##
    # Size of the hive bin
    attr_reader :size

    ##
    # 0 most of the time, can contain remnant data
    attr_reader :unknown1

    ##
    # 0 most of the time, can contain remnant data
    attr_reader :unknown2

    ##
    # Only the root (first) hive bin seems to contain a valid FILETIME
    attr_reader :timestamp

    ##
    # Contains number of bytes
    attr_reader :unknown4
  end
  class HiveBinCell < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cell_size_raw = @_io.read_s4le
      @identifier = (@_io.read_bytes(2)).force_encoding("ascii")
      case identifier
      when "li"
        @_raw_data = @_io.read_bytes(((cell_size - 2) - 4))
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = SubKeyListLi.new(_io__raw_data, self, @_root)
      when "vk"
        @_raw_data = @_io.read_bytes(((cell_size - 2) - 4))
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = SubKeyListVk.new(_io__raw_data, self, @_root)
      when "lf"
        @_raw_data = @_io.read_bytes(((cell_size - 2) - 4))
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = SubKeyListLhLf.new(_io__raw_data, self, @_root)
      when "ri"
        @_raw_data = @_io.read_bytes(((cell_size - 2) - 4))
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = SubKeyListRi.new(_io__raw_data, self, @_root)
      when "lh"
        @_raw_data = @_io.read_bytes(((cell_size - 2) - 4))
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = SubKeyListLhLf.new(_io__raw_data, self, @_root)
      when "nk"
        @_raw_data = @_io.read_bytes(((cell_size - 2) - 4))
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = NamedKey.new(_io__raw_data, self, @_root)
      when "sk"
        @_raw_data = @_io.read_bytes(((cell_size - 2) - 4))
        _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
        @data = SubKeyListSk.new(_io__raw_data, self, @_root)
      else
        @data = @_io.read_bytes(((cell_size - 2) - 4))
      end
      self
    end
    class SubKeyListVk < Kaitai::Struct::Struct

      DATA_TYPE_ENUM = {
        0 => :data_type_enum_reg_none,
        1 => :data_type_enum_reg_sz,
        2 => :data_type_enum_reg_expand_sz,
        3 => :data_type_enum_reg_binary,
        4 => :data_type_enum_reg_dword,
        5 => :data_type_enum_reg_dword_big_endian,
        6 => :data_type_enum_reg_link,
        7 => :data_type_enum_reg_multi_sz,
        8 => :data_type_enum_reg_resource_list,
        9 => :data_type_enum_reg_full_resource_descriptor,
        10 => :data_type_enum_reg_resource_requirements_list,
        11 => :data_type_enum_reg_qword,
      }
      I__DATA_TYPE_ENUM = DATA_TYPE_ENUM.invert

      VK_FLAGS = {
        1 => :vk_flags_value_comp_name,
      }
      I__VK_FLAGS = VK_FLAGS.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @value_name_size = @_io.read_u2le
        @data_size = @_io.read_u4le
        @data_offset = @_io.read_u4le
        @data_type = Kaitai::Struct::Stream::resolve_enum(DATA_TYPE_ENUM, @_io.read_u4le)
        @flags = Kaitai::Struct::Stream::resolve_enum(VK_FLAGS, @_io.read_u2le)
        @padding = @_io.read_u2le
        if flags == :vk_flags_value_comp_name
          @value_name = (@_io.read_bytes(value_name_size)).force_encoding("ascii")
        end
        self
      end
      attr_reader :value_name_size
      attr_reader :data_size
      attr_reader :data_offset
      attr_reader :data_type
      attr_reader :flags
      attr_reader :padding
      attr_reader :value_name
    end
    class SubKeyListLhLf < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @count = @_io.read_u2le
        @items = []
        (count).times { |i|
          @items << Item.new(@_io, self, @_root)
        }
        self
      end
      class Item < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @named_key_offset = @_io.read_u4le
          @hash_value = @_io.read_u4le
          self
        end
        attr_reader :named_key_offset
        attr_reader :hash_value
      end
      attr_reader :count
      attr_reader :items
    end
    class SubKeyListSk < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @unknown1 = @_io.read_u2le
        @previous_security_key_offset = @_io.read_u4le
        @next_security_key_offset = @_io.read_u4le
        @reference_count = @_io.read_u4le
        self
      end
      attr_reader :unknown1
      attr_reader :previous_security_key_offset
      attr_reader :next_security_key_offset
      attr_reader :reference_count
    end
    class SubKeyListLi < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @count = @_io.read_u2le
        @items = []
        (count).times { |i|
          @items << Item.new(@_io, self, @_root)
        }
        self
      end
      class Item < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @named_key_offset = @_io.read_u4le
          self
        end
        attr_reader :named_key_offset
      end
      attr_reader :count
      attr_reader :items
    end
    class NamedKey < Kaitai::Struct::Struct

      NK_FLAGS = {
        1 => :nk_flags_key_is_volatile,
        2 => :nk_flags_key_hive_exit,
        4 => :nk_flags_key_hive_entry,
        8 => :nk_flags_key_no_delete,
        16 => :nk_flags_key_sym_link,
        32 => :nk_flags_key_comp_name,
        64 => :nk_flags_key_prefef_handle,
        128 => :nk_flags_key_virt_mirrored,
        256 => :nk_flags_key_virt_target,
        512 => :nk_flags_key_virtual_store,
        4096 => :nk_flags_unknown1,
        16384 => :nk_flags_unknown2,
      }
      I__NK_FLAGS = NK_FLAGS.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @flags = Kaitai::Struct::Stream::resolve_enum(NK_FLAGS, @_io.read_u2le)
        @last_key_written_date_and_time = Filetime.new(@_io, self, @_root)
        @unknown1 = @_io.read_u4le
        @parent_key_offset = @_io.read_u4le
        @number_of_sub_keys = @_io.read_u4le
        @number_of_volatile_sub_keys = @_io.read_u4le
        @sub_keys_list_offset = @_io.read_u4le
        @number_of_values = @_io.read_u4le
        @values_list_offset = @_io.read_u4le
        @security_key_offset = @_io.read_u4le
        @class_name_offset = @_io.read_u4le
        @largest_sub_key_name_size = @_io.read_u4le
        @largest_sub_key_class_name_size = @_io.read_u4le
        @largest_value_name_size = @_io.read_u4le
        @largest_value_data_size = @_io.read_u4le
        @unknown2 = @_io.read_u4le
        @key_name_size = @_io.read_u2le
        @class_name_size = @_io.read_u2le
        @unknown_string_size = @_io.read_u4le
        @unknown_string = (@_io.read_bytes(unknown_string_size)).force_encoding("ascii")
        self
      end
      attr_reader :flags
      attr_reader :last_key_written_date_and_time
      attr_reader :unknown1
      attr_reader :parent_key_offset
      attr_reader :number_of_sub_keys
      attr_reader :number_of_volatile_sub_keys
      attr_reader :sub_keys_list_offset
      attr_reader :number_of_values
      attr_reader :values_list_offset
      attr_reader :security_key_offset
      attr_reader :class_name_offset
      attr_reader :largest_sub_key_name_size
      attr_reader :largest_sub_key_class_name_size
      attr_reader :largest_value_name_size
      attr_reader :largest_value_data_size
      attr_reader :unknown2
      attr_reader :key_name_size
      attr_reader :class_name_size
      attr_reader :unknown_string_size
      attr_reader :unknown_string
    end
    class SubKeyListRi < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @count = @_io.read_u2le
        @items = []
        (count).times { |i|
          @items << Item.new(@_io, self, @_root)
        }
        self
      end
      class Item < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @sub_key_list_offset = @_io.read_u4le
          self
        end
        attr_reader :sub_key_list_offset
      end
      attr_reader :count
      attr_reader :items
    end
    def cell_size
      return @cell_size unless @cell_size.nil?
      @cell_size = ((cell_size_raw < 0 ? -1 : 1) * cell_size_raw)
      @cell_size
    end
    def is_allocated
      return @is_allocated unless @is_allocated.nil?
      @is_allocated = cell_size_raw < 0
      @is_allocated
    end
    attr_reader :cell_size_raw
    attr_reader :identifier
    attr_reader :data
    attr_reader :_raw_data
  end
  class FileHeader < Kaitai::Struct::Struct

    FILE_TYPE = {
      0 => :file_type_normal,
      1 => :file_type_transaction_log,
    }
    I__FILE_TYPE = FILE_TYPE.invert

    FILE_FORMAT = {
      1 => :file_format_direct_memory_load,
    }
    I__FILE_FORMAT = FILE_FORMAT.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([114, 101, 103, 102].pack('C*'), signature, _io, "/types/file_header/seq/0") if not signature == [114, 101, 103, 102].pack('C*')
      @primary_sequence_number = @_io.read_u4le
      @secondary_sequence_number = @_io.read_u4le
      @last_modification_date_and_time = Filetime.new(@_io, self, @_root)
      @major_version = @_io.read_u4le
      @minor_version = @_io.read_u4le
      @type = Kaitai::Struct::Stream::resolve_enum(FILE_TYPE, @_io.read_u4le)
      @format = Kaitai::Struct::Stream::resolve_enum(FILE_FORMAT, @_io.read_u4le)
      @root_key_offset = @_io.read_u4le
      @hive_bins_data_size = @_io.read_u4le
      @clustering_factor = @_io.read_u4le
      @unknown1 = @_io.read_bytes(64)
      @unknown2 = @_io.read_bytes(396)
      @checksum = @_io.read_u4le
      @reserved = @_io.read_bytes(3576)
      @boot_type = @_io.read_u4le
      @boot_recover = @_io.read_u4le
      self
    end
    attr_reader :signature
    attr_reader :primary_sequence_number
    attr_reader :secondary_sequence_number
    attr_reader :last_modification_date_and_time
    attr_reader :major_version
    attr_reader :minor_version
    attr_reader :type
    attr_reader :format
    attr_reader :root_key_offset
    attr_reader :hive_bins_data_size
    attr_reader :clustering_factor
    attr_reader :unknown1
    attr_reader :unknown2
    attr_reader :checksum
    attr_reader :reserved
    attr_reader :boot_type
    attr_reader :boot_recover
  end
  attr_reader :header
  attr_reader :hive_bins
  attr_reader :_raw_hive_bins
end
