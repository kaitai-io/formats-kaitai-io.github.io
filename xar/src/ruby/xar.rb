# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require 'zlib'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
# 
# "XAR (short for eXtensible ARchive format) is an open source file archiver
# and the archiver’s file format. It was created within the OpenDarwin project
# and is used in macOS X 10.5 and up for software installation routines, as
# well as browser extensions in Safari 5.0 and up."
# @see https://github.com/mackyle/xar/wiki/xarformat Source
class Xar < Kaitai::Struct::Struct

  CHECKSUM_ALGORITHMS_APPLE = {
    0 => :checksum_algorithms_apple_none,
    1 => :checksum_algorithms_apple_sha1,
    2 => :checksum_algorithms_apple_md5,
    3 => :checksum_algorithms_apple_sha256,
    4 => :checksum_algorithms_apple_sha512,
  }
  I__CHECKSUM_ALGORITHMS_APPLE = CHECKSUM_ALGORITHMS_APPLE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header_prefix = FileHeaderPrefix.new(@_io, self, @_root)
    @_raw_header = @_io.read_bytes((header_prefix.len_header - 6))
    _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
    @header = FileHeader.new(_io__raw_header, self, @_root)
    @_raw__raw_toc = @_io.read_bytes(header.len_toc_compressed)
    @_raw_toc = Zlib::Inflate.inflate(@_raw__raw_toc)
    _io__raw_toc = Kaitai::Struct::Stream.new(@_raw_toc)
    @toc = TocType.new(_io__raw_toc, self, @_root)
    self
  end
  class FileHeaderPrefix < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([120, 97, 114, 33].pack('C*'), magic, _io, "/types/file_header_prefix/seq/0") if not magic == [120, 97, 114, 33].pack('C*')
      @len_header = @_io.read_u2be
      self
    end
    attr_reader :magic

    ##
    # internal; access `_root.header.len_header` instead
    attr_reader :len_header
  end
  class FileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u2be
      raise Kaitai::Struct::ValidationNotEqualError.new(1, version, _io, "/types/file_header/seq/0") if not version == 1
      @len_toc_compressed = @_io.read_u8be
      @toc_length_uncompressed = @_io.read_u8be
      @checksum_algorithm_int = @_io.read_u4be
      if has_checksum_alg_name
        @checksum_alg_name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes_full, 0, false)).force_encoding("UTF-8")
        _ = checksum_alg_name
        raise Kaitai::Struct::ValidationExprError.new(checksum_alg_name, _io, "/types/file_header/seq/4") if not  ((_ != "") && (_ != "none")) 
      end
      self
    end

    ##
    # If it is not
    # 
    # * `""` (empty string), indicating an unknown integer value (access
    #   `checksum_algorithm_int` for debugging purposes to find out
    #   what that value is), or
    # * `"none"`, indicating that the TOC checksum is not provided (in that
    #   case, the `<checksum>` property or its `style` attribute should be
    #   missing, or the `style` attribute must be set to `"none"`),
    # 
    # it must exactly match the `style` attribute value of the
    # `<checksum>` property in the root node `<toc>`. See
    # <https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371>
    # for reference.
    # 
    # The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
    # `EVP_get_digestbyname`](
    #   https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
    # ) to verify this value (if it's not `""` or `"none"`, of course).
    # So it's reasonable to assume that this can only have one of the values
    # that OpenSSL recognizes.
    def checksum_algorithm_name
      return @checksum_algorithm_name unless @checksum_algorithm_name.nil?
      @checksum_algorithm_name = (has_checksum_alg_name ? checksum_alg_name : (checksum_algorithm_int == Xar::I__CHECKSUM_ALGORITHMS_APPLE[:checksum_algorithms_apple_none] ? "none" : (checksum_algorithm_int == Xar::I__CHECKSUM_ALGORITHMS_APPLE[:checksum_algorithms_apple_sha1] ? "sha1" : (checksum_algorithm_int == Xar::I__CHECKSUM_ALGORITHMS_APPLE[:checksum_algorithms_apple_md5] ? "md5" : (checksum_algorithm_int == Xar::I__CHECKSUM_ALGORITHMS_APPLE[:checksum_algorithms_apple_sha256] ? "sha256" : (checksum_algorithm_int == Xar::I__CHECKSUM_ALGORITHMS_APPLE[:checksum_algorithms_apple_sha512] ? "sha512" : ""))))))
      @checksum_algorithm_name
    end
    def has_checksum_alg_name
      return @has_checksum_alg_name unless @has_checksum_alg_name.nil?
      @has_checksum_alg_name =  ((checksum_algorithm_int == _root.checksum_algorithm_other) && (len_header >= 32) && ((len_header % 4) == 0)) 
      @has_checksum_alg_name
    end
    def len_header
      return @len_header unless @len_header.nil?
      @len_header = _root.header_prefix.len_header
      @len_header
    end
    attr_reader :version
    attr_reader :len_toc_compressed
    attr_reader :toc_length_uncompressed

    ##
    # internal; access `checksum_algorithm_name` instead
    attr_reader :checksum_algorithm_int

    ##
    # internal; access `checksum_algorithm_name` instead
    attr_reader :checksum_alg_name
  end
  class TocType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @xml_string = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    attr_reader :xml_string
  end

  ##
  # @see https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85 Source
  def checksum_algorithm_other
    return @checksum_algorithm_other unless @checksum_algorithm_other.nil?
    @checksum_algorithm_other = 3
    @checksum_algorithm_other
  end

  ##
  # internal; access `_root.header` instead
  attr_reader :header_prefix
  attr_reader :header

  ##
  # zlib compressed XML further describing the content of the archive
  attr_reader :toc
  attr_reader :_raw_header
  attr_reader :_raw_toc
  attr_reader :_raw__raw_toc
end
