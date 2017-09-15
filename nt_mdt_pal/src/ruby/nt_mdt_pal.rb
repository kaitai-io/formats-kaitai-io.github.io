# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# It is a color scheme for visualising SPM scans.
class NtMdtPal < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @signature = @_io.ensure_fixed_contents([78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33].pack('C*'))
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
      @unkn0 = @_io.read_bytes(7)
      @colors_count = @_io.read_u2le
      @unkn1 = @_io.read_bytes(5)
      @name_size = @_io.read_u2be
      self
    end
    attr_reader :unkn0
    attr_reader :colors_count
    attr_reader :unkn1
    attr_reader :name_size
  end
  class Color < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = @_io.read_bytes(4)
      self
    end
    attr_reader :data
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
      @title = (@_io.read_bytes(_root.meta[index].name_size)).force_encoding("UTF-16")
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
