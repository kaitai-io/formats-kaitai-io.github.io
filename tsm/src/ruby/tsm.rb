# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# InfluxDB is a scalable database optimized for storage of time
# series, real-time application metrics, operations monitoring events,
# etc, written in Go.
# 
# Data is stored in .tsm files, which are kept pretty simple
# conceptually. Each .tsm file contains a header and footer, which
# stores offset to an index. Index is used to find a data block for a
# requested time boundary.
class Tsm < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    self
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([22, 209, 22, 209].pack('C*'))
      @version = @_io.read_u1
      self
    end
    attr_reader :magic
    attr_reader :version
  end
  class Index < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @offset = @_io.read_u8be
      self
    end
    class IndexHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @key_len = @_io.read_u2be
        @key = (@_io.read_bytes(key_len)).force_encoding("UTF-8")
        @type = @_io.read_u1
        @entry_count = @_io.read_u2be
        @index_entries = Array.new(entry_count)
        (entry_count).times { |i|
          @index_entries[i] = IndexEntry.new(@_io, self, @_root)
        }
        self
      end
      class IndexEntry < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @min_time = @_io.read_u8be
          @max_time = @_io.read_u8be
          @block_offset = @_io.read_u8be
          @block_size = @_io.read_u4be
          self
        end
        class BlockEntry < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @crc32 = @_io.read_u4be
            @data = @_io.read_bytes((_parent.block_size - 4))
            self
          end
          attr_reader :crc32
          attr_reader :data
        end
        def block
          return @block unless @block.nil?
          io = _root._io
          _pos = io.pos
          io.seek(block_offset)
          @block = BlockEntry.new(io, self, @_root)
          io.seek(_pos)
          @block
        end
        attr_reader :min_time
        attr_reader :max_time
        attr_reader :block_offset
        attr_reader :block_size
      end
      attr_reader :key_len
      attr_reader :key
      attr_reader :type
      attr_reader :entry_count
      attr_reader :index_entries
    end
    def entries
      return @entries unless @entries.nil?
      _pos = @_io.pos
      @_io.seek(offset)
      @entries = []
      begin
        _ = IndexHeader.new(@_io, self, @_root)
        @entries << _
      end until _io.pos == (_io.size - 8)
      @_io.seek(_pos)
      @entries
    end
    attr_reader :offset
  end
  def index
    return @index unless @index.nil?
    _pos = @_io.pos
    @_io.seek((_io.size - 8))
    @index = Index.new(@_io, self, @_root)
    @_io.seek(_pos)
    @index
  end
  attr_reader :header
end
