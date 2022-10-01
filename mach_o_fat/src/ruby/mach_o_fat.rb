# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# This is a simple container format that encapsulates multiple Mach-O files,
# each generally for a different architecture. XNU can execute these files just
# like single-arch Mach-Os and will pick the appropriate entry.
# @see https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html Source
class MachOFat < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([202, 254, 186, 190].pack('C*'), magic, _io, "/seq/0") if not magic == [202, 254, 186, 190].pack('C*')
    @num_fat_arch = @_io.read_u4be
    @fat_archs = []
    (num_fat_arch).times { |i|
      @fat_archs << FatArch.new(@_io, self, @_root)
    }
    self
  end
  class FatArch < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cpu_type = Kaitai::Struct::Stream::resolve_enum(MachO::CPU_TYPE, @_io.read_u4be)
      @cpu_subtype = @_io.read_u4be
      @ofs_object = @_io.read_u4be
      @len_object = @_io.read_u4be
      @align = @_io.read_u4be
      self
    end
    def object
      return @object unless @object.nil?
      _pos = @_io.pos
      @_io.seek(ofs_object)
      @_raw_object = @_io.read_bytes(len_object)
      _io__raw_object = Kaitai::Struct::Stream.new(@_raw_object)
      @object = MachO.new(_io__raw_object)
      @_io.seek(_pos)
      @object
    end
    attr_reader :cpu_type
    attr_reader :cpu_subtype
    attr_reader :ofs_object
    attr_reader :len_object
    attr_reader :align
    attr_reader :_raw_object
  end
  attr_reader :magic
  attr_reader :num_fat_arch
  attr_reader :fat_archs
end
