# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class MicrosoftCfb < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = CfbHeader.new(@_io, self, @_root)
    self
  end
  class CfbHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature = @_io.ensure_fixed_contents([208, 207, 17, 224, 161, 177, 26, 225].pack('C*'))
      @clsid = @_io.ensure_fixed_contents([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*'))
      @version_minor = @_io.read_u2le
      @version_major = @_io.read_u2le
      @byte_order = @_io.ensure_fixed_contents([254, 255].pack('C*'))
      @sector_shift = @_io.read_u2le
      @mini_sector_shift = @_io.read_u2le
      @reserved1 = @_io.read_bytes(6)
      @size_dir = @_io.read_s4le
      @size_fat = @_io.read_s4le
      @ofs_dir = @_io.read_s4le
      @transaction_seq = @_io.read_s4le
      @mini_stream_cutoff_size = @_io.read_s4le
      @ofs_mini_fat = @_io.read_s4le
      @size_mini_fat = @_io.read_s4le
      @ofs_difat = @_io.read_s4le
      @size_difat = @_io.read_s4le
      @difat = Array.new(109)
      (109).times { |i|
        @difat[i] = @_io.read_s4le
      }
      self
    end

    ##
    # Magic bytes that confirm that this is a CFB file
    attr_reader :signature

    ##
    # Reserved class ID field, must be all 0
    attr_reader :clsid
    attr_reader :version_minor
    attr_reader :version_major

    ##
    # In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
    attr_reader :byte_order

    ##
    # For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
    attr_reader :sector_shift
    attr_reader :mini_sector_shift
    attr_reader :reserved1

    ##
    # Number of directory sectors in this file. For major version 3, must be 0.
    attr_reader :size_dir

    ##
    # Number of FAT sectors in this file.
    attr_reader :size_fat

    ##
    # Starting sector number for directory stream.
    attr_reader :ofs_dir

    ##
    # A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
    attr_reader :transaction_seq
    attr_reader :mini_stream_cutoff_size

    ##
    # Starting sector number for mini FAT.
    attr_reader :ofs_mini_fat

    ##
    # Number of mini FAT sectors in this file.
    attr_reader :size_mini_fat

    ##
    # Starting sector number for DIFAT.
    attr_reader :ofs_difat

    ##
    # Number of DIFAT sectors in this file.
    attr_reader :size_difat
    attr_reader :difat
  end
  class FatEntries < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      while not @_io.eof?
        @entries << @_io.read_s4le
      end
      self
    end
    attr_reader :entries
  end
  class DirEntry < Kaitai::Struct::Struct

    OBJ_TYPE = {
      0 => :obj_type_unknown,
      1 => :obj_type_storage,
      2 => :obj_type_stream,
      5 => :obj_type_root_storage,
    }
    I__OBJ_TYPE = OBJ_TYPE.invert

    RB_COLOR = {
      0 => :rb_color_red,
      1 => :rb_color_black,
    }
    I__RB_COLOR = RB_COLOR.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (@_io.read_bytes(64)).force_encoding("UTF-16LE")
      @name_len = @_io.read_u2le
      @object_type = Kaitai::Struct::Stream::resolve_enum(OBJ_TYPE, @_io.read_u1)
      @color_flag = Kaitai::Struct::Stream::resolve_enum(RB_COLOR, @_io.read_u1)
      @left_sibling_id = @_io.read_s4le
      @right_sibling_id = @_io.read_s4le
      @child_id = @_io.read_s4le
      @clsid = @_io.read_bytes(16)
      @state = @_io.read_u4le
      @time_create = @_io.read_u8le
      @time_mod = @_io.read_u8le
      @ofs = @_io.read_s4le
      @size = @_io.read_u8le
      self
    end
    def mini_stream
      return @mini_stream unless @mini_stream.nil?
      if object_type == :obj_type_root_storage
        io = _root._io
        _pos = io.pos
        io.seek(((ofs + 1) * _root.sector_size))
        @mini_stream = io.read_bytes(size)
        io.seek(_pos)
      end
      @mini_stream
    end
    attr_reader :name
    attr_reader :name_len
    attr_reader :object_type
    attr_reader :color_flag
    attr_reader :left_sibling_id
    attr_reader :right_sibling_id
    attr_reader :child_id
    attr_reader :clsid

    ##
    # User-defined flags for storage or root storage objects
    attr_reader :state

    ##
    # Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
    attr_reader :time_create

    ##
    # Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
    attr_reader :time_mod

    ##
    # For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
    attr_reader :ofs

    ##
    # For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
    attr_reader :size
  end
  def sector_size
    return @sector_size unless @sector_size.nil?
    @sector_size = (1 << header.sector_shift)
    @sector_size
  end
  def fat
    return @fat unless @fat.nil?
    _pos = @_io.pos
    @_io.seek(sector_size)
    @_raw_fat = @_io.read_bytes((header.size_fat * sector_size))
    io = Kaitai::Struct::Stream.new(@_raw_fat)
    @fat = FatEntries.new(io, self, @_root)
    @_io.seek(_pos)
    @fat
  end
  def dir
    return @dir unless @dir.nil?
    _pos = @_io.pos
    @_io.seek(((header.ofs_dir + 1) * sector_size))
    @_raw_dir = @_io.read_bytes(128)
    io = Kaitai::Struct::Stream.new(@_raw_dir)
    @dir = DirEntry.new(io, self, @_root)
    @_io.seek(_pos)
    @dir
  end
  attr_reader :header
  attr_reader :_raw_fat
  attr_reader :_raw_dir
end
