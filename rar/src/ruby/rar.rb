# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# RAR is a archive format used by popular proprietary RAR archiver,
# created by Eugene Roshal. There are two major versions of format
# (v1.5-4.0 and RAR v5+).
# 
# File format essentially consists of a linear sequence of
# blocks. Each block has fixed header and custom body (that depends on
# block type), so it's possible to skip block even if one doesn't know
# how to process a certain block type.
class Rar < Kaitai::Struct::Struct

  BLOCK_TYPES = {
    114 => :block_types_marker,
    115 => :block_types_archive_header,
    116 => :block_types_file_header,
    117 => :block_types_old_style_comment_header,
    118 => :block_types_old_style_authenticity_info_76,
    119 => :block_types_old_style_subblock,
    120 => :block_types_old_style_recovery_record,
    121 => :block_types_old_style_authenticity_info_79,
    122 => :block_types_subblock,
    123 => :block_types_terminator,
  }
  I__BLOCK_TYPES = BLOCK_TYPES.invert

  OSES = {
    0 => :oses_ms_dos,
    1 => :oses_os_2,
    2 => :oses_windows,
    3 => :oses_unix,
    4 => :oses_mac_os,
    5 => :oses_beos,
  }
  I__OSES = OSES.invert

  METHODS = {
    48 => :methods_store,
    49 => :methods_fastest,
    50 => :methods_fast,
    51 => :methods_normal,
    52 => :methods_good,
    53 => :methods_best,
  }
  I__METHODS = METHODS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = MagicSignature.new(@_io, self, @_root)
    @blocks = []
    while not @_io.eof?
      case magic.version
      when 0
        @blocks << Block.new(@_io, self, @_root)
      when 1
        @blocks << BlockV5.new(@_io, self, @_root)
      end
    end
    self
  end
  class BlockV5 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
  end

  ##
  # Basic block that RAR files consist of. There are several block
  # types (see `block_type`), which have different `body` and
  # `add_body`.
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @crc16 = @_io.read_u2le
      @block_type = Kaitai::Struct::Stream::resolve_enum(BLOCK_TYPES, @_io.read_u1)
      @flags = @_io.read_u2le
      @block_size = @_io.read_u2le
      if has_add
        @add_size = @_io.read_u4le
      end
      case block_type
      when :block_types_file_header
        @_raw_body = @_io.read_bytes(body_size)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = BlockFileHeader.new(io, self, @_root)
      else
        @body = @_io.read_bytes(body_size)
      end
      if has_add
        @add_body = @_io.read_bytes(add_size)
      end
      self
    end

    ##
    # True if block has additional content attached to it
    def has_add
      return @has_add unless @has_add.nil?
      @has_add = (flags & 32768) != 0
      @has_add
    end
    def header_size
      return @header_size unless @header_size.nil?
      @header_size = (has_add ? 11 : 7)
      @header_size
    end
    def body_size
      return @body_size unless @body_size.nil?
      @body_size = (block_size - header_size)
      @body_size
    end

    ##
    # CRC16 of whole block or some part of it (depends on block type)
    attr_reader :crc16
    attr_reader :block_type
    attr_reader :flags

    ##
    # Size of block (header + body, but without additional content)
    attr_reader :block_size

    ##
    # Size of additional content in this block
    attr_reader :add_size
    attr_reader :body

    ##
    # Additional content in this block
    attr_reader :add_body
    attr_reader :_raw_body
  end
  class BlockFileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @low_unp_size = @_io.read_u4le
      @host_os = Kaitai::Struct::Stream::resolve_enum(OSES, @_io.read_u1)
      @file_crc32 = @_io.read_u4le
      @file_time = DosTime.new(@_io, self, @_root)
      @rar_version = @_io.read_u1
      @method = Kaitai::Struct::Stream::resolve_enum(METHODS, @_io.read_u1)
      @name_size = @_io.read_u2le
      @attr = @_io.read_u4le
      if (_parent.flags & 256) != 0
        @high_pack_size = @_io.read_u4le
      end
      @file_name = @_io.read_bytes(name_size)
      if (_parent.flags & 1024) != 0
        @salt = @_io.read_u8le
      end
      self
    end

    ##
    # Uncompressed file size (lower 32 bits, if 64-bit header flag is present)
    attr_reader :low_unp_size

    ##
    # Operating system used for archiving
    attr_reader :host_os
    attr_reader :file_crc32

    ##
    # Date and time in standard MS DOS format
    attr_reader :file_time

    ##
    # RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.)
    attr_reader :rar_version

    ##
    # Compression method
    attr_reader :method

    ##
    # File name size
    attr_reader :name_size

    ##
    # File attributes
    attr_reader :attr

    ##
    # Compressed file size, high 32 bits, only if 64-bit header flag is present
    attr_reader :high_pack_size
    attr_reader :file_name
    attr_reader :salt
  end

  ##
  # RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
  # 8-byte magic (and pretty different block format) for v5+. This
  # type would parse and validate both versions of signature. Note
  # that actually this signature is a valid RAR "block": in theory,
  # one can omit signature reading at all, and read this normally,
  # as a block, if exact RAR version is known (and thus it's
  # possible to choose correct block format).
  class MagicSignature < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic1 = @_io.ensure_fixed_contents([82, 97, 114, 33, 26, 7].pack('C*'))
      @version = @_io.read_u1
      if version == 1
        @magic3 = @_io.ensure_fixed_contents([0].pack('C*'))
      end
      self
    end

    ##
    # Fixed part of file's magic signature that doesn't change with RAR version
    attr_reader :magic1

    ##
    # Variable part of magic signature: 0 means old (RAR 1.5-4.0)
    # format, 1 means new (RAR 5+) format
    attr_reader :version

    ##
    # New format (RAR 5+) magic contains extra byte
    attr_reader :magic3
  end
  class DosTime < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @time = @_io.read_u2le
      @date = @_io.read_u2le
      self
    end
    def month
      return @month unless @month.nil?
      @month = ((date & 480) >> 5)
      @month
    end
    def seconds
      return @seconds unless @seconds.nil?
      @seconds = ((time & 31) * 2)
      @seconds
    end
    def year
      return @year unless @year.nil?
      @year = (((date & 65024) >> 9) + 1980)
      @year
    end
    def minutes
      return @minutes unless @minutes.nil?
      @minutes = ((time & 2016) >> 5)
      @minutes
    end
    def day
      return @day unless @day.nil?
      @day = (date & 31)
      @day
    end
    def hours
      return @hours unless @hours.nil?
      @hours = ((time & 63488) >> 11)
      @hours
    end
    attr_reader :time
    attr_reader :date
  end

  ##
  # File format signature to validate that it is indeed a RAR archive
  attr_reader :magic

  ##
  # Sequence of blocks that constitute the RAR file
  attr_reader :blocks
end
