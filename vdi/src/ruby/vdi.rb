# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A native VirtualBox file format
# Images for testing can be downloaded from
#  * https://www.osboxes.org/virtualbox-images/
#  * https://virtualboxes.org/images/
# or you can convert images of other formats.
# @see https://github.com/qemu/qemu/blob/master/block/vdi.c Source
class Vdi < Kaitai::Struct::Struct

  IMAGE_TYPE = {
    1 => :image_type_dynamic,
    2 => :image_type_static,
    3 => :image_type_undo,
    4 => :image_type_diff,
  }
  I__IMAGE_TYPE = IMAGE_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    self
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @text = (@_io.read_bytes(64)).force_encoding("utf-8")
      @signature = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([127, 16, 218, 190].pack('C*'), signature, _io, "/types/header/seq/1") if not signature == [127, 16, 218, 190].pack('C*')
      @version = Version.new(@_io, self, @_root)
      if subheader_size_is_dynamic
        @header_size_optional = @_io.read_u4le
      end
      @_raw_header_main = @_io.read_bytes(header_size)
      _io__raw_header_main = Kaitai::Struct::Stream.new(@_raw_header_main)
      @header_main = HeaderMain.new(_io__raw_header_main, self, @_root)
      self
    end
    class Uuid < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @uuid = @_io.read_bytes(16)
        self
      end
      attr_reader :uuid
    end
    class Version < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @major = @_io.read_u2le
        @minor = @_io.read_u2le
        self
      end
      attr_reader :major
      attr_reader :minor
    end
    class HeaderMain < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @image_type = Kaitai::Struct::Stream::resolve_enum(Vdi::IMAGE_TYPE, @_io.read_u4le)
        @image_flags = Flags.new(@_io, self, @_root)
        @description = (@_io.read_bytes(256)).force_encoding("utf-8")
        if _parent.version.major >= 1
          @blocks_map_offset = @_io.read_u4le
        end
        if _parent.version.major >= 1
          @offset_data = @_io.read_u4le
        end
        @geometry = Geometry.new(@_io, self, @_root)
        if _parent.version.major >= 1
          @reserved1 = @_io.read_u4le
        end
        @disk_size = @_io.read_u8le
        @block_data_size = @_io.read_u4le
        if _parent.version.major >= 1
          @block_metadata_size = @_io.read_u4le
        end
        @blocks_in_image = @_io.read_u4le
        @blocks_allocated = @_io.read_u4le
        @uuid_image = Uuid.new(@_io, self, @_root)
        @uuid_last_snap = Uuid.new(@_io, self, @_root)
        @uuid_link = Uuid.new(@_io, self, @_root)
        if _parent.version.major >= 1
          @uuid_parent = Uuid.new(@_io, self, @_root)
        end
        if  ((_parent.version.major >= 1) && ((_io.pos + 16) <= _io.size)) 
          @lchc_geometry = Geometry.new(@_io, self, @_root)
        end
        self
      end
      class Geometry < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @cylinders = @_io.read_u4le
          @heads = @_io.read_u4le
          @sectors = @_io.read_u4le
          @sector_size = @_io.read_u4le
          self
        end
        attr_reader :cylinders
        attr_reader :heads
        attr_reader :sectors
        attr_reader :sector_size
      end
      class Flags < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved0 = @_io.read_bits_int_be(15)
          @zero_expand = @_io.read_bits_int_be(1) != 0
          @reserved1 = @_io.read_bits_int_be(6)
          @diff = @_io.read_bits_int_be(1) != 0
          @fixed = @_io.read_bits_int_be(1) != 0
          @reserved2 = @_io.read_bits_int_be(8)
          self
        end
        attr_reader :reserved0
        attr_reader :zero_expand
        attr_reader :reserved1
        attr_reader :diff
        attr_reader :fixed
        attr_reader :reserved2
      end
      attr_reader :image_type
      attr_reader :image_flags
      attr_reader :description
      attr_reader :blocks_map_offset
      attr_reader :offset_data
      attr_reader :geometry
      attr_reader :reserved1
      attr_reader :disk_size

      ##
      # Size of block (bytes).
      attr_reader :block_data_size
      attr_reader :block_metadata_size
      attr_reader :blocks_in_image
      attr_reader :blocks_allocated
      attr_reader :uuid_image
      attr_reader :uuid_last_snap
      attr_reader :uuid_link
      attr_reader :uuid_parent
      attr_reader :lchc_geometry
    end
    def header_size
      return @header_size unless @header_size.nil?
      @header_size = (subheader_size_is_dynamic ? header_size_optional : 336)
      @header_size
    end
    def blocks_map_offset
      return @blocks_map_offset unless @blocks_map_offset.nil?
      @blocks_map_offset = header_main.blocks_map_offset
      @blocks_map_offset
    end
    def subheader_size_is_dynamic
      return @subheader_size_is_dynamic unless @subheader_size_is_dynamic.nil?
      @subheader_size_is_dynamic = version.major >= 1
      @subheader_size_is_dynamic
    end
    def blocks_offset
      return @blocks_offset unless @blocks_offset.nil?
      @blocks_offset = header_main.offset_data
      @blocks_offset
    end
    def block_size
      return @block_size unless @block_size.nil?
      @block_size = (header_main.block_metadata_size + header_main.block_data_size)
      @block_size
    end
    def blocks_map_size
      return @blocks_map_size unless @blocks_map_size.nil?
      @blocks_map_size = (((((header_main.blocks_in_image * 4) + header_main.geometry.sector_size) - 1) / header_main.geometry.sector_size) * header_main.geometry.sector_size)
      @blocks_map_size
    end
    attr_reader :text
    attr_reader :signature
    attr_reader :version
    attr_reader :header_size_optional
    attr_reader :header_main
    attr_reader :_raw_header_main
  end
  class BlocksMap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @index = []
      (_root.header.header_main.blocks_in_image).times { |i|
        @index << BlockIndex.new(@_io, self, @_root)
      }
      self
    end
    class BlockIndex < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @index = @_io.read_u4le
        self
      end
      def is_allocated
        return @is_allocated unless @is_allocated.nil?
        @is_allocated = index < _root.block_discarded
        @is_allocated
      end
      def block
        return @block unless @block.nil?
        if is_allocated
          @block = _root.disk.blocks[index]
        end
        @block
      end
      attr_reader :index
    end
    attr_reader :index
  end
  class Disk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @blocks = []
      (_root.header.header_main.blocks_in_image).times { |i|
        @blocks << Block.new(@_io, self, @_root)
      }
      self
    end
    class Block < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @metadata = @_io.read_bytes(_root.header.header_main.block_metadata_size)
        @_raw_data = []
        @data = []
        i = 0
        while not @_io.eof?
          @_raw_data << @_io.read_bytes(_root.header.header_main.block_data_size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data.last)
          @data << Sector.new(_io__raw_data, self, @_root)
          i += 1
        end
        self
      end
      class Sector < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @data = @_io.read_bytes(_root.header.header_main.geometry.sector_size)
          self
        end
        attr_reader :data
      end
      attr_reader :metadata
      attr_reader :data
      attr_reader :_raw_data
    end
    attr_reader :blocks
  end
  def block_discarded
    return @block_discarded unless @block_discarded.nil?
    @block_discarded = 4294967294
    @block_discarded
  end
  def block_unallocated
    return @block_unallocated unless @block_unallocated.nil?
    @block_unallocated = 4294967295
    @block_unallocated
  end

  ##
  # block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
  # The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
  def blocks_map
    return @blocks_map unless @blocks_map.nil?
    _pos = @_io.pos
    @_io.seek(header.blocks_map_offset)
    @_raw_blocks_map = @_io.read_bytes(header.blocks_map_size)
    _io__raw_blocks_map = Kaitai::Struct::Stream.new(@_raw_blocks_map)
    @blocks_map = BlocksMap.new(_io__raw_blocks_map, self, @_root)
    @_io.seek(_pos)
    @blocks_map
  end
  def disk
    return @disk unless @disk.nil?
    _pos = @_io.pos
    @_io.seek(header.blocks_offset)
    @disk = Disk.new(@_io, self, @_root)
    @_io.seek(_pos)
    @disk
  end
  attr_reader :header
  attr_reader :_raw_blocks_map
end
