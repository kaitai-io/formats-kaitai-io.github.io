# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
# Test files can be found on Mozilla's FTP site, for example:
# 
# <http://ftp.mozilla.org/pub/firefox/nightly/partials/>
# @see https://wiki.mozilla.org/Software_Update:MAR Source
class MozillaMar < Kaitai::Struct::Struct

  BLOCK_IDENTIFIERS = {
    1 => :block_identifiers_product_information,
  }
  I__BLOCK_IDENTIFIERS = BLOCK_IDENTIFIERS.invert

  SIGNATURE_ALGORITHMS = {
    1 => :signature_algorithms_rsa_pkcs1_sha1,
    2 => :signature_algorithms_rsa_pkcs1_sha384,
  }
  I__SIGNATURE_ALGORITHMS = SIGNATURE_ALGORITHMS.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([77, 65, 82, 49].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [77, 65, 82, 49].pack('C*')
    @ofs_index = @_io.read_u4be
    @file_size = @_io.read_u8be
    @len_signatures = @_io.read_u4be
    @signatures = []
    (len_signatures).times { |i|
      @signatures << Signature.new(@_io, self, @_root)
    }
    @len_additional_sections = @_io.read_u4be
    @additional_sections = []
    (len_additional_sections).times { |i|
      @additional_sections << AdditionalSection.new(@_io, self, @_root)
    }
    self
  end
  class AdditionalSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_block = @_io.read_u4be
      @block_identifier = Kaitai::Struct::Stream::resolve_enum(MozillaMar::BLOCK_IDENTIFIERS, @_io.read_u4be)
      case block_identifier
      when :block_identifiers_product_information
        _io_bytes = @_io.substream((len_block - 4) - 4)
        @bytes = ProductInformationBlock.new(_io_bytes, self, @_root)
      else
        @bytes = @_io.read_bytes((len_block - 4) - 4)
      end
      self
    end
    attr_reader :len_block
    attr_reader :block_identifier
    attr_reader :bytes
    attr_reader :_raw_bytes
  end
  class IndexEntries < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @index_entry = []
      i = 0
      while not @_io.eof?
        @index_entry << IndexEntry.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :index_entry
  end
  class IndexEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ofs_content = @_io.read_u4be
      @len_content = @_io.read_u4be
      @flags = @_io.read_u4be
      @file_name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      self
    end
    def body
      return @body unless @body.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs_content)
      @body = io.read_bytes(len_content)
      io.seek(_pos)
      @body
    end
    attr_reader :ofs_content
    attr_reader :len_content

    ##
    # File permission bits (in standard unix-style format).
    attr_reader :flags
    attr_reader :file_name
  end
  class MarIndex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_index = @_io.read_u4be
      _io_index_entries = @_io.substream(len_index)
      @index_entries = IndexEntries.new(_io_index_entries, self, @_root)
      self
    end
    attr_reader :len_index
    attr_reader :index_entries
    attr_reader :_raw_index_entries
  end
  class ProductInformationBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @mar_channel_name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(64), 0, false)).force_encoding("UTF-8")
      @product_version = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(32), 0, false)).force_encoding("UTF-8")
      self
    end
    attr_reader :mar_channel_name
    attr_reader :product_version
  end
  class Signature < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @algorithm = Kaitai::Struct::Stream::resolve_enum(MozillaMar::SIGNATURE_ALGORITHMS, @_io.read_u4be)
      @len_signature = @_io.read_u4be
      @signature = @_io.read_bytes(len_signature)
      self
    end
    attr_reader :algorithm
    attr_reader :len_signature
    attr_reader :signature
  end
  def index
    return @index unless @index.nil?
    _pos = @_io.pos
    @_io.seek(ofs_index)
    @index = MarIndex.new(@_io, self, @_root)
    @_io.seek(_pos)
    @index
  end
  attr_reader :magic
  attr_reader :ofs_index
  attr_reader :file_size
  attr_reader :len_signatures
  attr_reader :signatures
  attr_reader :len_additional_sections
  attr_reader :additional_sections
end
