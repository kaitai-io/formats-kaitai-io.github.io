# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# It is a color scheme for visualising SPM scans.
class NtMdtPal < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @signature = @_io.read_bytes(26)
    raise Kaitai::Struct::ValidationNotEqualError.new([78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33].pack('C*'), signature, _io, "/seq/0") if not signature == [78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33].pack('C*')
    @count = @_io.read_u4be
    @meta = Array.new(count)
    (count).times { |i|
      @meta[i] = Meta.new(@_io, self, @_root)
    }
    @something2 = @_io.read_bytes(1)
    @tables = Array.new(count)
    (count).times { |i|
      @tables[i] = ColTable.new(@_io, self, @_root, i)
    }
    self
  end
  class Meta < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @unkn00 = @_io.read_bytes(3)
      @unkn01 = @_io.read_bytes(2)
      @unkn02 = @_io.read_bytes(1)
      @unkn03 = @_io.read_bytes(1)
      @colors_count = @_io.read_u2le
      @unkn10 = @_io.read_bytes(2)
      @unkn11 = @_io.read_bytes(1)
      @unkn12 = @_io.read_bytes(2)
      @name_size = @_io.read_u2be
      self
    end

    ##
    # usually 0s
    attr_reader :unkn00
    attr_reader :unkn01
    attr_reader :unkn02

    ##
    # usually 0s
    attr_reader :unkn03
    attr_reader :colors_count

    ##
    # usually 0s
    attr_reader :unkn10

    ##
    # usually 4
    attr_reader :unkn11

    ##
    # usually 0s
    attr_reader :unkn12
    attr_reader :name_size
  end
  class Color < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @red = @_io.read_u1
      @unkn = @_io.read_u1
      @blue = @_io.read_u1
      @green = @_io.read_u1
      self
    end
    attr_reader :red
    attr_reader :unkn
    attr_reader :blue
    attr_reader :green
  end
  class ColTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, index)
      super(_io, _parent, _root)
      @index = index
      _read
    end

    def _read
      @size1 = @_io.read_u1
      @unkn = @_io.read_u1
      @title = (@_io.read_bytes(_root.meta[index].name_size)).force_encoding("UTF-16LE")
      @unkn1 = @_io.read_u2be
      @colors = Array.new((_root.meta[index].colors_count - 1))
      ((_root.meta[index].colors_count - 1)).times { |i|
        @colors[i] = Color.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :size1
    attr_reader :unkn
    attr_reader :title
    attr_reader :unkn1
    attr_reader :colors
    attr_reader :index
  end
  attr_reader :signature
  attr_reader :count
  attr_reader :meta
  attr_reader :something2
  attr_reader :tables
end
