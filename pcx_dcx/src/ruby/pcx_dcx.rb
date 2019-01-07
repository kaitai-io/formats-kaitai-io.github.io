# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# DCX is a simple extension of PCX image format allowing to bundle
# many PCX images (typically, pages of a document) in one file. It saw
# some limited use in DOS-era fax software, but was largely
# superseeded with multi-page TIFFs and PDFs since then.
class PcxDcx < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.ensure_fixed_contents([177, 104, 222, 58].pack('C*'))
    @files = []
    i = 0
    begin
      _ = PcxOffset.new(@_io, self, @_root)
      @files << _
      i += 1
    end until _.ofs_body == 0
    self
  end
  class PcxOffset < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ofs_body = @_io.read_u4le
      self
    end
    def body
      return @body unless @body.nil?
      if ofs_body != 0
        _pos = @_io.pos
        @_io.seek(ofs_body)
        @body = Pcx.new(@_io)
        @_io.seek(_pos)
      end
      @body
    end
    attr_reader :ofs_body
  end
  attr_reader :magic
  attr_reader :files
end
