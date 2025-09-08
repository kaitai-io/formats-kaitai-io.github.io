# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Resource file found in CPB firmware archives, mostly used on older CoolPad
# phones and/or tablets. The only observed files are called "ResPack.cfg".
class Respack < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    @json = (@_io.read_bytes(header.len_json)).force_encoding("UTF-8")
    self
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([82, 83].pack('C*'), @magic, @_io, "/types/header/seq/0") if not @magic == [82, 83].pack('C*')
      @unknown = @_io.read_bytes(8)
      @len_json = @_io.read_u4le
      @md5 = (@_io.read_bytes(32)).force_encoding("UTF-8")
      self
    end
    attr_reader :magic
    attr_reader :unknown
    attr_reader :len_json

    ##
    # MD5 of data that follows the header
    attr_reader :md5
  end
  attr_reader :header
  attr_reader :json
end
