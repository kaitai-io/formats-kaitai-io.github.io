# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Firmware image found with MediaTek MT76xx wifi chipsets.
class AndesFirmware < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @_raw_image_header = @_io.read_bytes(32)
    io = Kaitai::Struct::Stream.new(@_raw_image_header)
    @image_header = ImageHeader.new(io, self, @_root)
    @ilm = @_io.read_bytes(image_header.ilm_len)
    @dlm = @_io.read_bytes(image_header.dlm_len)
    self
  end
  class ImageHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ilm_len = @_io.read_u4le
      @dlm_len = @_io.read_u4le
      @fw_ver = @_io.read_u2le
      @build_ver = @_io.read_u2le
      @extra = @_io.read_u4le
      @build_time = (@_io.read_bytes(16)).force_encoding("UTF-8")
      self
    end
    attr_reader :ilm_len
    attr_reader :dlm_len
    attr_reader :fw_ver
    attr_reader :build_ver
    attr_reader :extra
    attr_reader :build_time
  end
  attr_reader :image_header
  attr_reader :ilm
  attr_reader :dlm
  attr_reader :_raw_image_header
end
