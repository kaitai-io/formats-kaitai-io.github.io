# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Cramfs < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @super_block = SuperBlockStruct.new(@_io, self, @_root)
    self
  end
  class ChunkedDataInode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @block_end_index = []
      (((_parent.size + _root.page_size) - 1) / _root.page_size).times { |i|
        @block_end_index << @_io.read_u4le
      }
      @raw_blocks = @_io.read_bytes_full
      self
    end
    attr_reader :block_end_index
    attr_reader :raw_blocks
  end
  class DirInode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if _io.size > 0
        @children = []
        i = 0
        while not @_io.eof?
          @children << Inode.new(@_io, self, @_root)
          i += 1
        end
      end
      self
    end
    attr_reader :children
  end
  class Info < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @crc = @_io.read_u4le
      @edition = @_io.read_u4le
      @blocks = @_io.read_u4le
      @files = @_io.read_u4le
      self
    end
    attr_reader :crc
    attr_reader :edition
    attr_reader :blocks
    attr_reader :files
  end
  class Inode < Kaitai::Struct::Struct

    FILE_TYPE = {
      1 => :file_type_fifo,
      2 => :file_type_chrdev,
      4 => :file_type_dir,
      6 => :file_type_blkdev,
      8 => :file_type_reg_file,
      10 => :file_type_symlink,
      12 => :file_type_socket,
    }
    I__FILE_TYPE = FILE_TYPE.invert
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @mode = @_io.read_u2le
      @uid = @_io.read_u2le
      @size_gid = @_io.read_u4le
      @namelen_offset = @_io.read_u4le
      @name = (@_io.read_bytes(namelen)).force_encoding("UTF-8")
      self
    end
    def as_dir
      return @as_dir unless @as_dir.nil?
      io = _root._io
      _pos = io.pos
      io.seek(offset)
      _io_as_dir = io.substream(size)
      @as_dir = DirInode.new(_io_as_dir, self, @_root)
      io.seek(_pos)
      @as_dir
    end
    def as_reg_file
      return @as_reg_file unless @as_reg_file.nil?
      io = _root._io
      _pos = io.pos
      io.seek(offset)
      @as_reg_file = ChunkedDataInode.new(io, self, @_root)
      io.seek(_pos)
      @as_reg_file
    end
    def as_symlink
      return @as_symlink unless @as_symlink.nil?
      io = _root._io
      _pos = io.pos
      io.seek(offset)
      @as_symlink = ChunkedDataInode.new(io, self, @_root)
      io.seek(_pos)
      @as_symlink
    end
    def attr
      return @attr unless @attr.nil?
      @attr = mode >> 9 & 7
      @attr
    end
    def gid
      return @gid unless @gid.nil?
      @gid = size_gid >> 24
      @gid
    end
    def namelen
      return @namelen unless @namelen.nil?
      @namelen = (namelen_offset & 63) << 2
      @namelen
    end
    def offset
      return @offset unless @offset.nil?
      @offset = (namelen_offset >> 6 & 67108863) << 2
      @offset
    end
    def perm_g
      return @perm_g unless @perm_g.nil?
      @perm_g = mode >> 3 & 7
      @perm_g
    end
    def perm_o
      return @perm_o unless @perm_o.nil?
      @perm_o = mode & 7
      @perm_o
    end
    def perm_u
      return @perm_u unless @perm_u.nil?
      @perm_u = mode >> 6 & 7
      @perm_u
    end
    def size
      return @size unless @size.nil?
      @size = size_gid & 16777215
      @size
    end
    def type
      return @type unless @type.nil?
      @type = Kaitai::Struct::Stream::resolve_enum(FILE_TYPE, mode >> 12 & 15)
      @type
    end
    attr_reader :mode
    attr_reader :uid
    attr_reader :size_gid
    attr_reader :namelen_offset
    attr_reader :name
    attr_reader :_raw_as_dir
  end
  class SuperBlockStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([69, 61, 205, 40].pack('C*'), @magic, @_io, "/types/super_block_struct/seq/0") if not @magic == [69, 61, 205, 40].pack('C*')
      @size = @_io.read_u4le
      @flags = @_io.read_u4le
      @future = @_io.read_u4le
      @signature = @_io.read_bytes(16)
      raise Kaitai::Struct::ValidationNotEqualError.new([67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83].pack('C*'), @signature, @_io, "/types/super_block_struct/seq/4") if not @signature == [67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83].pack('C*')
      @fsid = Info.new(@_io, self, @_root)
      @name = (@_io.read_bytes(16)).force_encoding("ASCII").encode('UTF-8')
      @root = Inode.new(@_io, self, @_root)
      self
    end
    def flag_fsid_v2
      return @flag_fsid_v2 unless @flag_fsid_v2.nil?
      @flag_fsid_v2 = flags >> 0 & 1
      @flag_fsid_v2
    end
    def flag_holes
      return @flag_holes unless @flag_holes.nil?
      @flag_holes = flags >> 8 & 1
      @flag_holes
    end
    def flag_shifted_root_offset
      return @flag_shifted_root_offset unless @flag_shifted_root_offset.nil?
      @flag_shifted_root_offset = flags >> 10 & 1
      @flag_shifted_root_offset
    end
    def flag_sorted_dirs
      return @flag_sorted_dirs unless @flag_sorted_dirs.nil?
      @flag_sorted_dirs = flags >> 1 & 1
      @flag_sorted_dirs
    end
    def flag_wrong_signature
      return @flag_wrong_signature unless @flag_wrong_signature.nil?
      @flag_wrong_signature = flags >> 9 & 1
      @flag_wrong_signature
    end
    attr_reader :magic
    attr_reader :size
    attr_reader :flags
    attr_reader :future
    attr_reader :signature
    attr_reader :fsid
    attr_reader :name
    attr_reader :root
  end
  def page_size
    return @page_size unless @page_size.nil?
    @page_size = 4096
    @page_size
  end
  attr_reader :super_block
end
