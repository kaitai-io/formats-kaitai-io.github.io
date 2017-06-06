# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Zip < Kaitai::Struct::Struct

  COMPRESSION = {
    0 => :compression_none,
    1 => :compression_shrunk,
    2 => :compression_reduced_1,
    3 => :compression_reduced_2,
    4 => :compression_reduced_3,
    5 => :compression_reduced_4,
    6 => :compression_imploded,
    8 => :compression_deflated,
    9 => :compression_enhanced_deflated,
    10 => :compression_pkware_dcl_imploded,
    12 => :compression_bzip2,
    14 => :compression_lzma,
    18 => :compression_ibm_terse,
    19 => :compression_ibm_lz77_z,
    98 => :compression_ppmd,
  }
  I__COMPRESSION = COMPRESSION.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @sections = []
    while not @_io.eof?
      @sections << PkSection.new(@_io, self, @_root)
    end
  end
  class LocalFile < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @header = LocalFileHeader.new(@_io, self, @_root)
      @body = @_io.read_bytes(header.compressed_size)
    end
    attr_reader :header
    attr_reader :body
  end
  class CentralDirEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @version_made_by = @_io.read_u2le
      @version_needed_to_extract = @_io.read_u2le
      @flags = @_io.read_u2le
      @compression_method = @_io.read_u2le
      @last_mod_file_time = @_io.read_u2le
      @last_mod_file_date = @_io.read_u2le
      @crc32 = @_io.read_u4le
      @compressed_size = @_io.read_u4le
      @uncompressed_size = @_io.read_u4le
      @file_name_len = @_io.read_u2le
      @extra_len = @_io.read_u2le
      @comment_len = @_io.read_u2le
      @disk_number_start = @_io.read_u2le
      @int_file_attr = @_io.read_u2le
      @ext_file_attr = @_io.read_u4le
      @local_header_offset = @_io.read_s4le
      @file_name = (@_io.read_bytes(file_name_len)).force_encoding("UTF-8")
      @extra = @_io.read_bytes(extra_len)
      @comment = (@_io.read_bytes(comment_len)).force_encoding("UTF-8")
    end
    attr_reader :version_made_by
    attr_reader :version_needed_to_extract
    attr_reader :flags
    attr_reader :compression_method
    attr_reader :last_mod_file_time
    attr_reader :last_mod_file_date
    attr_reader :crc32
    attr_reader :compressed_size
    attr_reader :uncompressed_size
    attr_reader :file_name_len
    attr_reader :extra_len
    attr_reader :comment_len
    attr_reader :disk_number_start
    attr_reader :int_file_attr
    attr_reader :ext_file_attr
    attr_reader :local_header_offset
    attr_reader :file_name
    attr_reader :extra
    attr_reader :comment
  end
  class PkSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @magic = @_io.ensure_fixed_contents([80, 75].pack('C*'))
      @section_type = @_io.read_u2le
      case section_type
      when 513
        @body = CentralDirEntry.new(@_io, self, @_root)
      when 1027
        @body = LocalFile.new(@_io, self, @_root)
      when 1541
        @body = EndOfCentralDir.new(@_io, self, @_root)
      end
    end
    attr_reader :magic
    attr_reader :section_type
    attr_reader :body
  end
  class LocalFileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @version = @_io.read_u2le
      @flags = @_io.read_u2le
      @compression = Kaitai::Struct::Stream::resolve_enum(COMPRESSION, @_io.read_u2le)
      @file_mod_time = @_io.read_u2le
      @file_mod_date = @_io.read_u2le
      @crc32 = @_io.read_u4le
      @compressed_size = @_io.read_u4le
      @uncompressed_size = @_io.read_u4le
      @file_name_len = @_io.read_u2le
      @extra_len = @_io.read_u2le
      @file_name = (@_io.read_bytes(file_name_len)).force_encoding("UTF-8")
      @extra = @_io.read_bytes(extra_len)
    end
    attr_reader :version
    attr_reader :flags
    attr_reader :compression
    attr_reader :file_mod_time
    attr_reader :file_mod_date
    attr_reader :crc32
    attr_reader :compressed_size
    attr_reader :uncompressed_size
    attr_reader :file_name_len
    attr_reader :extra_len
    attr_reader :file_name
    attr_reader :extra
  end
  class EndOfCentralDir < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @disk_of_end_of_central_dir = @_io.read_u2le
      @disk_of_central_dir = @_io.read_u2le
      @qty_central_dir_entries_on_disk = @_io.read_u2le
      @qty_central_dir_entries_total = @_io.read_u2le
      @central_dir_size = @_io.read_u4le
      @central_dir_offset = @_io.read_u4le
      @comment_len = @_io.read_u2le
      @comment = (@_io.read_bytes(comment_len)).force_encoding("UTF-8")
    end
    attr_reader :disk_of_end_of_central_dir
    attr_reader :disk_of_central_dir
    attr_reader :qty_central_dir_entries_on_disk
    attr_reader :qty_central_dir_entries_total
    attr_reader :central_dir_size
    attr_reader :central_dir_offset
    attr_reader :comment_len
    attr_reader :comment
  end
  attr_reader :sections
end
