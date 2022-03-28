# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
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
# @see http://www.delorie.com/djgpp/doc/exe/ Source
class DosMz < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = ExeHeader.new(@_io, self, @_root)
    @body = @_io.read_bytes(header.len_body)
    self
  end
  class ExeHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @mz = MzHeader.new(@_io, self, @_root)
      @rest_of_header = @_io.read_bytes((mz.len_header - 28))
      self
    end
    def len_body
      return @len_body unless @len_body.nil?
      @len_body = ((mz.last_page_extra_bytes == 0 ? (mz.num_pages * 512) : (((mz.num_pages - 1) * 512) + mz.last_page_extra_bytes)) - mz.len_header)
      @len_body
    end
    attr_reader :mz
    attr_reader :rest_of_header
  end
  class MzHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = (@_io.read_bytes(2)).force_encoding("ASCII")
      raise Kaitai::Struct::ValidationNotAnyOfError.new(magic, _io, "/types/mz_header/seq/0") if not  ((magic == "MZ") || (magic == "ZM")) 
      @last_page_extra_bytes = @_io.read_u2le
      @num_pages = @_io.read_u2le
      @num_relocations = @_io.read_u2le
      @header_size = @_io.read_u2le
      @min_allocation = @_io.read_u2le
      @max_allocation = @_io.read_u2le
      @initial_ss = @_io.read_u2le
      @initial_sp = @_io.read_u2le
      @checksum = @_io.read_u2le
      @initial_ip = @_io.read_u2le
      @initial_cs = @_io.read_u2le
      @ofs_relocations = @_io.read_u2le
      @overlay_id = @_io.read_u2le
      self
    end
    def len_header
      return @len_header unless @len_header.nil?
      @len_header = (header_size * 16)
      @len_header
    end
    attr_reader :magic
    attr_reader :last_page_extra_bytes
    attr_reader :num_pages
    attr_reader :num_relocations
    attr_reader :header_size
    attr_reader :min_allocation
    attr_reader :max_allocation
    attr_reader :initial_ss
    attr_reader :initial_sp
    attr_reader :checksum
    attr_reader :initial_ip
    attr_reader :initial_cs
    attr_reader :ofs_relocations
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
      self
    end
    attr_reader :ofs
    attr_reader :seg
  end
  def relocations
    return @relocations unless @relocations.nil?
    if header.mz.ofs_relocations != 0
      io = header._io
      _pos = io.pos
      io.seek(header.mz.ofs_relocations)
      @relocations = Array.new(header.mz.num_relocations)
      (header.mz.num_relocations).times { |i|
        @relocations[i] = Relocation.new(io, self, @_root)
      }
      io.seek(_pos)
    end
    @relocations
  end
  attr_reader :header
  attr_reader :body
end
