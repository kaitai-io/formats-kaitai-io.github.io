# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://hashcat.net/wiki/doku.php?id=restore Source
class HashcatRestore < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @version = @_io.read_u4le
    @cwd = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(256), 0, false)).force_encoding("UTF-8")
    @dicts_pos = @_io.read_u4le
    @masks_pos = @_io.read_u4le
    @padding = @_io.read_bytes(4)
    @current_restore_point = @_io.read_u8le
    @argc = @_io.read_u4le
    @padding2 = @_io.read_bytes(12)
    @argv = []
    (argc).times { |i|
      @argv << (@_io.read_bytes_term(10, false, true, true)).force_encoding("UTF-8")
    }
    self
  end
  attr_reader :version
  attr_reader :cwd
  attr_reader :dicts_pos
  attr_reader :masks_pos
  attr_reader :padding
  attr_reader :current_restore_point
  attr_reader :argc
  attr_reader :padding2
  attr_reader :argv
end
