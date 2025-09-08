# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130 Source
class AndroidNanoappHeader < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @header_version = @_io.read_u4le
    raise Kaitai::Struct::ValidationNotEqualError.new(1, @header_version, @_io, "/seq/0") if not @header_version == 1
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([78, 65, 78, 79].pack('C*'), @magic, @_io, "/seq/1") if not @magic == [78, 65, 78, 79].pack('C*')
    @app_id = @_io.read_u8le
    @app_version = @_io.read_u4le
    @flags = @_io.read_u4le
    @hub_type = @_io.read_u8le
    @chre_api_major_version = @_io.read_u1
    @chre_api_minor_version = @_io.read_u1
    @reserved = @_io.read_bytes(6)
    raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 0, 0, 0].pack('C*'), @reserved, @_io, "/seq/8") if not @reserved == [0, 0, 0, 0, 0, 0].pack('C*')
    self
  end
  def is_encrypted
    return @is_encrypted unless @is_encrypted.nil?
    @is_encrypted = flags & 2 != 0
    @is_encrypted
  end
  def is_signed
    return @is_signed unless @is_signed.nil?
    @is_signed = flags & 1 != 0
    @is_signed
  end
  def is_tcm_capable
    return @is_tcm_capable unless @is_tcm_capable.nil?
    @is_tcm_capable = flags & 4 != 0
    @is_tcm_capable
  end
  attr_reader :header_version
  attr_reader :magic
  attr_reader :app_id
  attr_reader :app_version
  attr_reader :flags
  attr_reader :hub_type
  attr_reader :chre_api_major_version
  attr_reader :chre_api_minor_version
  attr_reader :reserved
end
