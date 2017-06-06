# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# DOS MZ file format is a traditional format for executables in MS-DOS
# environment. Many modern formats (i.e. Windows PE) still maintain
# compatibility stub with this format.
# 
# As opposed to .com file format (which basically sports one 64K code
# segment of raw CPU instructions), DOS MZ .exe file format allowed
# more flexible memory management, loading of larger programs and
# added support for relocations.
class DosMz < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @hdr = MzHeader.new(@_io, self, @_root)
    @mz_header2 = @_io.read_bytes((hdr.relocations_ofs - 28))
    @relocations = Array.new(hdr.qty_relocations)
    (hdr.qty_relocations).times { |i|
      @relocations[i] = Relocation.new(@_io, self, @_root)
    }
    @body = @_io.read_bytes_full
  end
  class MzHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @magic = @_io.read_bytes(2)
      @last_page_extra_bytes = @_io.read_u2le
      @qty_pages = @_io.read_u2le
      @qty_relocations = @_io.read_u2le
      @header_size = @_io.read_u2le
      @min_allocation = @_io.read_u2le
      @max_allocation = @_io.read_u2le
      @initial_ss = @_io.read_u2le
      @initial_sp = @_io.read_u2le
      @checksum = @_io.read_u2le
      @initial_ip = @_io.read_u2le
      @initial_cs = @_io.read_u2le
      @relocations_ofs = @_io.read_u2le
      @overlay_id = @_io.read_u2le
    end
    attr_reader :magic
    attr_reader :last_page_extra_bytes
    attr_reader :qty_pages
    attr_reader :qty_relocations
    attr_reader :header_size
    attr_reader :min_allocation
    attr_reader :max_allocation
    attr_reader :initial_ss
    attr_reader :initial_sp
    attr_reader :checksum
    attr_reader :initial_ip
    attr_reader :initial_cs
    attr_reader :relocations_ofs
    attr_reader :overlay_id
  end
  class Relocation < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @ofs = @_io.read_u2le
      @seg = @_io.read_u2le
    end
    attr_reader :ofs
    attr_reader :seg
  end
  attr_reader :hdr
  attr_reader :mz_header2
  attr_reader :relocations
  attr_reader :body
end
