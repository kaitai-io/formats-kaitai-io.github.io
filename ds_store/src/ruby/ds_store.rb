# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Apple macOS '.DS_Store' file format.
# @see https://en.wikipedia.org/wiki/.DS_Store
#   https://metacpan.org/pod/distribution/Mac-Finder-DSStore/DSStoreFormat.pod
#   https://0day.work/parsing-the-ds_store-file-format
#    Source
class DsStore < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @alignment_header = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 1].pack('C*'), alignment_header, _io, "/seq/0") if not alignment_header == [0, 0, 0, 1].pack('C*')
    @buddy_allocator_header = BuddyAllocatorHeader.new(@_io, self, @_root)
    self
  end
  class BuddyAllocatorHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([66, 117, 100, 49].pack('C*'), magic, _io, "/types/buddy_allocator_header/seq/0") if not magic == [66, 117, 100, 49].pack('C*')
      @ofs_bookkeeping_info_block = @_io.read_u4be
      @len_bookkeeping_info_block = @_io.read_u4be
      @copy_ofs_bookkeeping_info_block = @_io.read_u4be
      @_unnamed4 = @_io.read_bytes(16)
      self
    end

    ##
    # Magic number 'Bud1'.
    attr_reader :magic
    attr_reader :ofs_bookkeeping_info_block
    attr_reader :len_bookkeeping_info_block

    ##
    # Needs to match 'offset_bookkeeping_info_block'.
    attr_reader :copy_ofs_bookkeeping_info_block

    ##
    # Unused field which might simply be the unused space at the end of the block,
    # since the minimum allocation size is 32 bytes.
    attr_reader :_unnamed4
  end
  class BuddyAllocatorBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_blocks = @_io.read_u4be
      @_unnamed1 = @_io.read_bytes(4)
      @block_addresses = Array.new(num_block_addresses)
      (num_block_addresses).times { |i|
        @block_addresses[i] = BlockDescriptor.new(@_io, self, @_root)
      }
      @num_directories = @_io.read_u4be
      @directory_entries = Array.new(num_directories)
      (num_directories).times { |i|
        @directory_entries[i] = DirectoryEntry.new(@_io, self, @_root)
      }
      @free_lists = Array.new(num_free_lists)
      (num_free_lists).times { |i|
        @free_lists[i] = FreeList.new(@_io, self, @_root)
      }
      self
    end
    class BlockDescriptor < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @address_raw = @_io.read_u4be
        self
      end
      def offset
        return @offset unless @offset.nil?
        @offset = ((address_raw & ~(_root.block_address_mask)) + 4)
        @offset
      end
      def size
        return @size unless @size.nil?
        @size = ((1 << address_raw) & _root.block_address_mask)
        @size
      end
      attr_reader :address_raw
    end
    class DirectoryEntry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @len_name = @_io.read_u1
        @name = (@_io.read_bytes(len_name)).force_encoding("UTF-8")
        @block_id = @_io.read_u4be
        self
      end
      attr_reader :len_name
      attr_reader :name
      attr_reader :block_id
    end
    class FreeList < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @counter = @_io.read_u4be
        @offsets = Array.new(counter)
        (counter).times { |i|
          @offsets[i] = @_io.read_u4be
        }
        self
      end
      attr_reader :counter
      attr_reader :offsets
    end
    def num_block_addresses
      return @num_block_addresses unless @num_block_addresses.nil?
      @num_block_addresses = 256
      @num_block_addresses
    end
    def num_free_lists
      return @num_free_lists unless @num_free_lists.nil?
      @num_free_lists = 32
      @num_free_lists
    end

    ##
    # Master blocks of the different B-trees.
    def directories
      return @directories unless @directories.nil?
      io = _root._io
      @directories = Array.new(num_directories)
      (num_directories).times { |i|
        @directories[i] = MasterBlockRef.new(io, self, @_root, i)
      }
      @directories
    end

    ##
    # Number of blocks in the allocated-blocks list.
    attr_reader :num_blocks

    ##
    # Unknown field which appears to always be 0.
    attr_reader :_unnamed1

    ##
    # Addresses of the different blocks.
    attr_reader :block_addresses

    ##
    # Indicates the number of directory entries.
    attr_reader :num_directories

    ##
    # Each directory is an independent B-tree.
    attr_reader :directory_entries
    attr_reader :free_lists
  end
  class MasterBlockRef < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, idx)
      super(_io, _parent, _root)
      @idx = idx
      _read
    end

    def _read
      self
    end
    class MasterBlock < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @block_id = @_io.read_u4be
        @num_internal_nodes = @_io.read_u4be
        @num_records = @_io.read_u4be
        @num_nodes = @_io.read_u4be
        @_unnamed4 = @_io.read_u4be
        self
      end
      def root_block
        return @root_block unless @root_block.nil?
        io = _root._io
        _pos = io.pos
        io.seek(_root.buddy_allocator_body.block_addresses[block_id].offset)
        @root_block = Block.new(io, self, @_root)
        io.seek(_pos)
        @root_block
      end

      ##
      # Block number of the B-tree's root node.
      attr_reader :block_id

      ##
      # Number of internal node levels.
      attr_reader :num_internal_nodes

      ##
      # Number of records in the tree.
      attr_reader :num_records

      ##
      # Number of nodes in the tree.
      attr_reader :num_nodes

      ##
      # Always 0x1000, probably the B-tree node page size.
      attr_reader :_unnamed4
    end
    def master_block
      return @master_block unless @master_block.nil?
      _pos = @_io.pos
      @_io.seek(_parent.block_addresses[_parent.directory_entries[idx].block_id].offset)
      @_raw_master_block = @_io.read_bytes(_parent.block_addresses[_parent.directory_entries[idx].block_id].size)
      _io__raw_master_block = Kaitai::Struct::Stream.new(@_raw_master_block)
      @master_block = MasterBlock.new(_io__raw_master_block, self, @_root)
      @_io.seek(_pos)
      @master_block
    end
    attr_reader :idx
    attr_reader :_raw_master_block
  end
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @mode = @_io.read_u4be
      @counter = @_io.read_u4be
      @data = Array.new(counter)
      (counter).times { |i|
        @data[i] = BlockData.new(@_io, self, @_root, mode)
      }
      self
    end
    class BlockData < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, mode)
        super(_io, _parent, _root)
        @mode = mode
        _read
      end

      def _read
        if mode > 0
          @block_id = @_io.read_u4be
        end
        @record = Record.new(@_io, self, @_root)
        self
      end
      class Record < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @filename = Ustr.new(@_io, self, @_root)
          @structure_type = FourCharCode.new(@_io, self, @_root)
          @data_type = (@_io.read_bytes(4)).force_encoding("UTF-8")
          case data_type
          when "long"
            @value = @_io.read_u4be
          when "shor"
            @value = @_io.read_u4be
          when "comp"
            @value = @_io.read_u8be
          when "bool"
            @value = @_io.read_u1
          when "ustr"
            @value = Ustr.new(@_io, self, @_root)
          when "dutc"
            @value = @_io.read_u8be
          when "type"
            @value = FourCharCode.new(@_io, self, @_root)
          when "blob"
            @value = RecordBlob.new(@_io, self, @_root)
          end
          self
        end
        class RecordBlob < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @length = @_io.read_u4be
            @value = @_io.read_bytes(length)
            self
          end
          attr_reader :length
          attr_reader :value
        end
        class Ustr < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @length = @_io.read_u4be
            @value = (@_io.read_bytes((2 * length))).force_encoding("UTF-16BE")
            self
          end
          attr_reader :length
          attr_reader :value
        end
        class FourCharCode < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @value = (@_io.read_bytes(4)).force_encoding("UTF-8")
            self
          end
          attr_reader :value
        end
        attr_reader :filename

        ##
        # Description of the entry's property.
        attr_reader :structure_type

        ##
        # Data type of the value.
        attr_reader :data_type
        attr_reader :value
      end
      def block
        return @block unless @block.nil?
        if mode > 0
          io = _root._io
          _pos = io.pos
          io.seek(_root.buddy_allocator_body.block_addresses[block_id].offset)
          @block = Block.new(io, self, @_root)
          io.seek(_pos)
        end
        @block
      end
      attr_reader :block_id
      attr_reader :record
      attr_reader :mode
    end

    ##
    # Rightmost child block pointer.
    def rightmost_block
      return @rightmost_block unless @rightmost_block.nil?
      if mode > 0
        io = _root._io
        _pos = io.pos
        io.seek(_root.buddy_allocator_body.block_addresses[mode].offset)
        @rightmost_block = Block.new(io, self, @_root)
        io.seek(_pos)
      end
      @rightmost_block
    end

    ##
    # If mode is 0, this is a leaf node, otherwise it is an internal node.
    attr_reader :mode

    ##
    # Number of records or number of block id + record pairs.
    attr_reader :counter
    attr_reader :data
  end
  def buddy_allocator_body
    return @buddy_allocator_body unless @buddy_allocator_body.nil?
    _pos = @_io.pos
    @_io.seek((buddy_allocator_header.ofs_bookkeeping_info_block + 4))
    @_raw_buddy_allocator_body = @_io.read_bytes(buddy_allocator_header.len_bookkeeping_info_block)
    _io__raw_buddy_allocator_body = Kaitai::Struct::Stream.new(@_raw_buddy_allocator_body)
    @buddy_allocator_body = BuddyAllocatorBody.new(_io__raw_buddy_allocator_body, self, @_root)
    @_io.seek(_pos)
    @buddy_allocator_body
  end

  ##
  # Bitmask used to calculate the position and the size of each block
  # of the B-tree from the block addresses.
  def block_address_mask
    return @block_address_mask unless @block_address_mask.nil?
    @block_address_mask = 31
    @block_address_mask
  end
  attr_reader :alignment_header
  attr_reader :buddy_allocator_header
  attr_reader :_raw_buddy_allocator_body
end
