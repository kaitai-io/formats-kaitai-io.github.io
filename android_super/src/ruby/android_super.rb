# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The metadata stored by Android at the beginning of a "super" partition, which
# is what it calls a disk partition that holds one or more Dynamic Partitions.
# Dynamic Partitions do more or less the same thing that LVM does on Linux,
# allowing Android to map ranges of non-contiguous extents to a single logical
# device. This metadata holds that mapping.
# @see https://source.android.com/devices/tech/ota/dynamic_partitions Source
# @see https://android.googlesource.com/platform/system/core/+/refs/tags/android-11.0.0_r8/fs_mgr/liblp/include/liblp/metadata_format.h Source
class AndroidSuper < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    self
  end
  class Root < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_raw_primary_geometry = @_io.read_bytes(4096)
      _io__raw_primary_geometry = Kaitai::Struct::Stream.new(@_raw_primary_geometry)
      @primary_geometry = Geometry.new(_io__raw_primary_geometry, self, @_root)
      @_raw_backup_geometry = @_io.read_bytes(4096)
      _io__raw_backup_geometry = Kaitai::Struct::Stream.new(@_raw_backup_geometry)
      @backup_geometry = Geometry.new(_io__raw_backup_geometry, self, @_root)
      @_raw_primary_metadata = Array.new(primary_geometry.metadata_slot_count)
      @primary_metadata = Array.new(primary_geometry.metadata_slot_count)
      (primary_geometry.metadata_slot_count).times { |i|
        @_raw_primary_metadata[i] = @_io.read_bytes(primary_geometry.metadata_max_size)
        _io__raw_primary_metadata = Kaitai::Struct::Stream.new(@_raw_primary_metadata[i])
        @primary_metadata[i] = Metadata.new(_io__raw_primary_metadata, self, @_root)
      }
      @_raw_backup_metadata = Array.new(primary_geometry.metadata_slot_count)
      @backup_metadata = Array.new(primary_geometry.metadata_slot_count)
      (primary_geometry.metadata_slot_count).times { |i|
        @_raw_backup_metadata[i] = @_io.read_bytes(primary_geometry.metadata_max_size)
        _io__raw_backup_metadata = Kaitai::Struct::Stream.new(@_raw_backup_metadata[i])
        @backup_metadata[i] = Metadata.new(_io__raw_backup_metadata, self, @_root)
      }
      self
    end
    attr_reader :primary_geometry
    attr_reader :backup_geometry
    attr_reader :primary_metadata
    attr_reader :backup_metadata
    attr_reader :_raw_primary_geometry
    attr_reader :_raw_backup_geometry
    attr_reader :_raw_primary_metadata
    attr_reader :_raw_backup_metadata
  end
  class Geometry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([103, 68, 108, 97].pack('C*'), magic, _io, "/types/geometry/seq/0") if not magic == [103, 68, 108, 97].pack('C*')
      @struct_size = @_io.read_u4le
      @checksum = @_io.read_bytes(32)
      @metadata_max_size = @_io.read_u4le
      @metadata_slot_count = @_io.read_u4le
      @logical_block_size = @_io.read_u4le
      self
    end
    attr_reader :magic
    attr_reader :struct_size

    ##
    # SHA-256 hash of struct_size bytes from beginning of geometry,
    # calculated as if checksum were zeroed out
    attr_reader :checksum
    attr_reader :metadata_max_size
    attr_reader :metadata_slot_count
    attr_reader :logical_block_size
  end
  class Metadata < Kaitai::Struct::Struct

    TABLE_KIND = {
      0 => :table_kind_partitions,
      1 => :table_kind_extents,
      2 => :table_kind_groups,
      3 => :table_kind_block_devices,
    }
    I__TABLE_KIND = TABLE_KIND.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([48, 80, 76, 65].pack('C*'), magic, _io, "/types/metadata/seq/0") if not magic == [48, 80, 76, 65].pack('C*')
      @major_version = @_io.read_u2le
      @minor_version = @_io.read_u2le
      @header_size = @_io.read_u4le
      @header_checksum = @_io.read_bytes(32)
      @tables_size = @_io.read_u4le
      @tables_checksum = @_io.read_bytes(32)
      @partitions = TableDescriptor.new(@_io, self, @_root, :table_kind_partitions)
      @extents = TableDescriptor.new(@_io, self, @_root, :table_kind_extents)
      @groups = TableDescriptor.new(@_io, self, @_root, :table_kind_groups)
      @block_devices = TableDescriptor.new(@_io, self, @_root, :table_kind_block_devices)
      self
    end
    class BlockDevice < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @first_logical_sector = @_io.read_u8le
        @alignment = @_io.read_u4le
        @alignment_offset = @_io.read_u4le
        @size = @_io.read_u8le
        @partition_name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(36), 0, false)).force_encoding("UTF-8")
        @flag_slot_suffixed = @_io.read_bits_int_le(1) != 0
        @flags_reserved = @_io.read_bits_int_le(31)
        self
      end
      attr_reader :first_logical_sector
      attr_reader :alignment
      attr_reader :alignment_offset
      attr_reader :size
      attr_reader :partition_name
      attr_reader :flag_slot_suffixed
      attr_reader :flags_reserved
    end
    class Extent < Kaitai::Struct::Struct

      TARGET_TYPE = {
        0 => :target_type_linear,
        1 => :target_type_zero,
      }
      I__TARGET_TYPE = TARGET_TYPE.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @num_sectors = @_io.read_u8le
        @target_type = Kaitai::Struct::Stream::resolve_enum(TARGET_TYPE, @_io.read_u4le)
        @target_data = @_io.read_u8le
        @target_source = @_io.read_u4le
        self
      end
      attr_reader :num_sectors
      attr_reader :target_type
      attr_reader :target_data
      attr_reader :target_source
    end
    class TableDescriptor < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, kind)
        super(_io, _parent, _root)
        @kind = kind
        _read
      end

      def _read
        @offset = @_io.read_u4le
        @num_entries = @_io.read_u4le
        @entry_size = @_io.read_u4le
        self
      end
      def table
        return @table unless @table.nil?
        _pos = @_io.pos
        @_io.seek((_parent.header_size + offset))
        @_raw_table = Array.new(num_entries)
        @table = Array.new(num_entries)
        (num_entries).times { |i|
          case kind
          when :table_kind_partitions
            @_raw_table[i] = @_io.read_bytes(entry_size)
            _io__raw_table = Kaitai::Struct::Stream.new(@_raw_table[i])
            @table[i] = Partition.new(_io__raw_table, self, @_root)
          when :table_kind_extents
            @_raw_table[i] = @_io.read_bytes(entry_size)
            _io__raw_table = Kaitai::Struct::Stream.new(@_raw_table[i])
            @table[i] = Extent.new(_io__raw_table, self, @_root)
          when :table_kind_groups
            @_raw_table[i] = @_io.read_bytes(entry_size)
            _io__raw_table = Kaitai::Struct::Stream.new(@_raw_table[i])
            @table[i] = Group.new(_io__raw_table, self, @_root)
          when :table_kind_block_devices
            @_raw_table[i] = @_io.read_bytes(entry_size)
            _io__raw_table = Kaitai::Struct::Stream.new(@_raw_table[i])
            @table[i] = BlockDevice.new(_io__raw_table, self, @_root)
          else
            @table[i] = @_io.read_bytes(entry_size)
          end
        }
        @_io.seek(_pos)
        @table
      end
      attr_reader :offset
      attr_reader :num_entries
      attr_reader :entry_size
      attr_reader :kind
      attr_reader :_raw_table
    end
    class Partition < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(36), 0, false)).force_encoding("UTF-8")
        @attr_readonly = @_io.read_bits_int_le(1) != 0
        @attr_slot_suffixed = @_io.read_bits_int_le(1) != 0
        @attr_updated = @_io.read_bits_int_le(1) != 0
        @attr_disabled = @_io.read_bits_int_le(1) != 0
        @attrs_reserved = @_io.read_bits_int_le(28)
        @_io.align_to_byte
        @first_extent_index = @_io.read_u4le
        @num_extents = @_io.read_u4le
        @group_index = @_io.read_u4le
        self
      end
      attr_reader :name
      attr_reader :attr_readonly
      attr_reader :attr_slot_suffixed
      attr_reader :attr_updated
      attr_reader :attr_disabled
      attr_reader :attrs_reserved
      attr_reader :first_extent_index
      attr_reader :num_extents
      attr_reader :group_index
    end
    class Group < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(36), 0, false)).force_encoding("UTF-8")
        @flag_slot_suffixed = @_io.read_bits_int_le(1) != 0
        @flags_reserved = @_io.read_bits_int_le(31)
        @_io.align_to_byte
        @maximum_size = @_io.read_u8le
        self
      end
      attr_reader :name
      attr_reader :flag_slot_suffixed
      attr_reader :flags_reserved
      attr_reader :maximum_size
    end
    attr_reader :magic
    attr_reader :major_version
    attr_reader :minor_version
    attr_reader :header_size

    ##
    # SHA-256 hash of header_size bytes from beginning of metadata,
    # calculated as if header_checksum were zeroed out
    attr_reader :header_checksum
    attr_reader :tables_size

    ##
    # SHA-256 hash of tables_size bytes from end of header
    attr_reader :tables_checksum
    attr_reader :partitions
    attr_reader :extents
    attr_reader :groups
    attr_reader :block_devices
  end
  def root
    return @root unless @root.nil?
    _pos = @_io.pos
    @_io.seek(4096)
    @root = Root.new(@_io, self, @_root)
    @_io.seek(_pos)
    @root
  end
end
