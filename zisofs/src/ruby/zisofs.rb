# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# zisofs is a compression format for files on ISO9660 file system. It has
# limited support across operating systems, mainly Linux kernel. Typically a
# directory tree is first preprocessed by mkzftree (from the zisofs-tools
# package before being turned into an ISO9660 image by mkisofs, genisoimage
# or similar tool. The data is zlib compressed.
# 
# The specification here describes the structure of a file that has been
# preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
# decompressed, as blocks with length 0 have a special meaning. Decompression
# and deconstruction of this data should be done outside of Kaitai Struct.
# @see https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs Source
class Zisofs < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    _io_header = @_io.substream(16)
    @header = Header.new(_io_header, self, @_root)
    @block_pointers = []
    (header.num_blocks + 1).times { |i|
      @block_pointers << @_io.read_u4le
    }
    self
  end
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, ofs_start, ofs_end)
      super(_io, _parent, _root)
      @ofs_start = ofs_start
      @ofs_end = ofs_end
      _read
    end

    def _read
      self
    end
    def data
      return @data unless @data.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_start)
      @data = io.read_bytes(len_data)
      io.seek(_pos)
      @data
    end
    def len_data
      return @len_data unless @len_data.nil?
      @len_data = ofs_end - ofs_start
      @len_data
    end
    attr_reader :ofs_start
    attr_reader :ofs_end
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(8)
      raise Kaitai::Struct::ValidationNotEqualError.new([55, 228, 83, 150, 201, 219, 214, 7].pack('C*'), @magic, @_io, "/types/header/seq/0") if not @magic == [55, 228, 83, 150, 201, 219, 214, 7].pack('C*')
      @uncompressed_size = @_io.read_u4le
      @len_header = @_io.read_u1
      raise Kaitai::Struct::ValidationNotEqualError.new(4, @len_header, @_io, "/types/header/seq/2") if not @len_header == 4
      @block_size_log2 = @_io.read_u1
      raise Kaitai::Struct::ValidationNotAnyOfError.new(@block_size_log2, @_io, "/types/header/seq/3") if not  ((@block_size_log2 == 15) || (@block_size_log2 == 16) || (@block_size_log2 == 17)) 
      @reserved = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0].pack('C*'), @reserved, @_io, "/types/header/seq/4") if not @reserved == [0, 0].pack('C*')
      self
    end
    def block_size
      return @block_size unless @block_size.nil?
      @block_size = 1 << block_size_log2
      @block_size
    end

    ##
    # ceil(uncompressed_size / block_size)
    def num_blocks
      return @num_blocks unless @num_blocks.nil?
      @num_blocks = uncompressed_size / block_size + (uncompressed_size % block_size != 0 ? 1 : 0)
      @num_blocks
    end
    attr_reader :magic

    ##
    # Size of the original uncompressed file
    attr_reader :uncompressed_size

    ##
    # header_size >> 2 (currently 4)
    attr_reader :len_header
    attr_reader :block_size_log2
    attr_reader :reserved
  end
  def blocks
    return @blocks unless @blocks.nil?
    @blocks = []
    (header.num_blocks).times { |i|
      @blocks << Block.new(@_io, self, @_root, block_pointers[i], block_pointers[i + 1])
    }
    @blocks
  end
  attr_reader :header

  ##
  # The final pointer (`block_pointers[header.num_blocks]`) indicates the end
  # of the last block. Typically this is also the end of the file data.
  attr_reader :block_pointers
  attr_reader :_raw_header
end
