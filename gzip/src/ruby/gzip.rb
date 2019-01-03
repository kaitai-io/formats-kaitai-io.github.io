# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Gzip is a popular and standard single-file archiving format. It
# essentially provides a container that stores original file name,
# timestamp and a few other things (like optional comment), basic
# CRCs, etc, and a file compressed by a chosen compression algorithm.
# 
# As of 2019, there is actually only one working solution for
# compression algorithms, so it's typically raw DEFLATE stream
# (without zlib header) in all gzipped files.
# @see https://tools.ietf.org/html/rfc1952 Source
class Gzip < Kaitai::Struct::Struct

  COMPRESSION_METHODS = {
    8 => :compression_methods_deflate,
  }
  I__COMPRESSION_METHODS = COMPRESSION_METHODS.invert

  OSES = {
    0 => :oses_fat,
    1 => :oses_amiga,
    2 => :oses_vms,
    3 => :oses_unix,
    4 => :oses_vm_cms,
    5 => :oses_atari_tos,
    6 => :oses_hpfs,
    7 => :oses_macintosh,
    8 => :oses_z_system,
    9 => :oses_cp_m,
    10 => :oses_tops_20,
    11 => :oses_ntfs,
    12 => :oses_qdos,
    13 => :oses_acorn_riscos,
    255 => :oses_unknown,
  }
  I__OSES = OSES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.ensure_fixed_contents([31, 139].pack('C*'))
    @compression_method = Kaitai::Struct::Stream::resolve_enum(COMPRESSION_METHODS, @_io.read_u1)
    @flags = Flags.new(@_io, self, @_root)
    @mod_time = @_io.read_u4le
    case compression_method
    when :compression_methods_deflate
      @extra_flags = ExtraFlagsDeflate.new(@_io, self, @_root)
    end
    @os = Kaitai::Struct::Stream::resolve_enum(OSES, @_io.read_u1)
    if flags.has_extra
      @extras = Extras.new(@_io, self, @_root)
    end
    if flags.has_name
      @name = @_io.read_bytes_term(0, false, true, true)
    end
    if flags.has_comment
      @comment = @_io.read_bytes_term(0, false, true, true)
    end
    if flags.has_header_crc
      @header_crc16 = @_io.read_u2le
    end
    @body = @_io.read_bytes(((_io.size - _io.pos) - 8))
    @body_crc32 = @_io.read_u4le
    @len_uncompressed = @_io.read_u4le
    self
  end
  class Flags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved1 = @_io.read_bits_int(3)
      @has_comment = @_io.read_bits_int(1) != 0
      @has_name = @_io.read_bits_int(1) != 0
      @has_extra = @_io.read_bits_int(1) != 0
      @has_header_crc = @_io.read_bits_int(1) != 0
      @is_text = @_io.read_bits_int(1) != 0
      self
    end
    attr_reader :reserved1
    attr_reader :has_comment
    attr_reader :has_name

    ##
    # If true, optional extra fields are present in the archive.
    attr_reader :has_extra

    ##
    # If true, this archive includes a CRC16 checksum for the header.
    attr_reader :has_header_crc

    ##
    # If true, file inside this archive is a text file from
    # compressor's point of view.
    attr_reader :is_text
  end
  class ExtraFlagsDeflate < Kaitai::Struct::Struct

    COMPRESSION_STRENGTHS = {
      2 => :compression_strengths_best,
      4 => :compression_strengths_fast,
    }
    I__COMPRESSION_STRENGTHS = COMPRESSION_STRENGTHS.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @compression_strength = Kaitai::Struct::Stream::resolve_enum(COMPRESSION_STRENGTHS, @_io.read_u1)
      self
    end
    attr_reader :compression_strength
  end

  ##
  # Container for many subfields, constrained by size of stream.
  class Subfields < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Subfield.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end

  ##
  # Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
  # 
  # * `id` serves role of "T"ype
  # * `len_data` serves role of "L"ength
  # * `data` serves role of "V"alue
  # 
  # This way it's possible to for arbitrary parser to skip over
  # subfields it does not support.
  class Subfield < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_u2le
      @len_data = @_io.read_u2le
      @data = @_io.read_bytes(len_data)
      self
    end

    ##
    # Subfield ID, typically two ASCII letters.
    attr_reader :id
    attr_reader :len_data
    attr_reader :data
  end
  class Extras < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_subfields = @_io.read_u2le
      @_raw_subfields = @_io.read_bytes(len_subfields)
      io = Kaitai::Struct::Stream.new(@_raw_subfields)
      @subfields = Subfields.new(io, self, @_root)
      self
    end
    attr_reader :len_subfields
    attr_reader :subfields
    attr_reader :_raw_subfields
  end
  attr_reader :magic

  ##
  # Compression method used to compress file body. In practice, only
  # one method is widely used: 8 = deflate.
  attr_reader :compression_method
  attr_reader :flags

  ##
  # Last modification time of a file archived in UNIX timestamp format.
  attr_reader :mod_time

  ##
  # Extra flags, specific to compression method chosen.
  attr_reader :extra_flags

  ##
  # OS used to compress this file.
  attr_reader :os
  attr_reader :extras
  attr_reader :name
  attr_reader :comment
  attr_reader :header_crc16

  ##
  # Compressed body of a file archived. Note that we don't make an
  # attempt to decompress it here.
  attr_reader :body

  ##
  # CRC32 checksum of an uncompressed file body
  attr_reader :body_crc32

  ##
  # Size of original uncompressed data in bytes (truncated to 32
  # bits).
  attr_reader :len_uncompressed
end
