# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# LHA (LHarc, LZH) is a file format used by a popular freeware
# eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
# years, many ports and implementations were developed, sporting many
# extensions to original 1988 LZH.
# 
# File format is pretty simple and essentially consists of a stream of
# records.
class Lzh < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @entries = []
    i = 0
    while not @_io.eof?
      @entries << Record.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header_len = @_io.read_u1
      if header_len > 0
        @file_record = FileRecord.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :header_len
    attr_reader :file_record
  end
  class FileRecord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_raw_header = @_io.read_bytes((_parent.header_len - 1))
      _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
      @header = Header.new(_io__raw_header, self, @_root)
      if header.header1.lha_level == 0
        @file_uncompr_crc16 = @_io.read_u2le
      end
      @body = @_io.read_bytes(header.header1.file_size_compr)
      self
    end
    attr_reader :header
    attr_reader :file_uncompr_crc16
    attr_reader :body
    attr_reader :_raw_header
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header1 = Header1.new(@_io, self, @_root)
      if header1.lha_level == 0
        @filename_len = @_io.read_u1
      end
      if header1.lha_level == 0
        @filename = (@_io.read_bytes(filename_len)).force_encoding("ASCII")
      end
      if header1.lha_level == 2
        @file_uncompr_crc16 = @_io.read_u2le
      end
      if header1.lha_level == 2
        @os = @_io.read_u1
      end
      if header1.lha_level == 2
        @ext_header_size = @_io.read_u2le
      end
      self
    end

    ##
    # Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.
    attr_reader :header1
    attr_reader :filename_len
    attr_reader :filename
    attr_reader :file_uncompr_crc16
    attr_reader :os
    attr_reader :ext_header_size
  end
  class Header1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header_checksum = @_io.read_u1
      @method_id = (@_io.read_bytes(5)).force_encoding("ASCII")
      @file_size_compr = @_io.read_u4le
      @file_size_uncompr = @_io.read_u4le
      @file_timestamp = @_io.read_u4le
      @attr = @_io.read_u1
      @lha_level = @_io.read_u1
      self
    end
    attr_reader :header_checksum
    attr_reader :method_id

    ##
    # Compressed file size
    attr_reader :file_size_compr

    ##
    # Uncompressed file size
    attr_reader :file_size_uncompr

    ##
    # Original file date/time
    attr_reader :file_timestamp

    ##
    # File or directory attribute
    attr_reader :attr
    attr_reader :lha_level
  end
  attr_reader :entries
end
