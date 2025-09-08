# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx Source
class HeapsPak < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    self
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic1 = @_io.read_bytes(3)
      raise Kaitai::Struct::ValidationNotEqualError.new([80, 65, 75].pack('C*'), @magic1, @_io, "/types/header/seq/0") if not @magic1 == [80, 65, 75].pack('C*')
      @version = @_io.read_u1
      @len_header = @_io.read_u4le
      @len_data = @_io.read_u4le
      _io_root_entry = @_io.substream(len_header - 16)
      @root_entry = Entry.new(_io_root_entry, self, @_root)
      @magic2 = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([68, 65, 84, 65].pack('C*'), @magic2, @_io, "/types/header/seq/5") if not @magic2 == [68, 65, 84, 65].pack('C*')
      self
    end
    class Dir < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @num_entries = @_io.read_u4le
        @entries = []
        (num_entries).times { |i|
          @entries << Entry.new(@_io, self, @_root)
        }
        self
      end
      attr_reader :num_entries
      attr_reader :entries
    end

    ##
    # @see https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx Source
    class Entry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @len_name = @_io.read_u1
        @name = (@_io.read_bytes(len_name)).force_encoding("UTF-8")
        @flags = Flags.new(@_io, self, @_root)
        case flags.is_dir
        when false
          @body = File.new(@_io, self, @_root)
        when true
          @body = Dir.new(@_io, self, @_root)
        end
        self
      end
      class Flags < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = nil)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @unused = @_io.read_bits_int_be(7)
          @is_dir = @_io.read_bits_int_be(1) != 0
          self
        end
        attr_reader :unused
        attr_reader :is_dir
      end
      attr_reader :len_name
      attr_reader :name
      attr_reader :flags
      attr_reader :body
    end
    class File < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @ofs_data = @_io.read_u4le
        @len_data = @_io.read_u4le
        @checksum = @_io.read_bytes(4)
        self
      end
      def data
        return @data unless @data.nil?
        io = _root._io
        _pos = io.pos
        io.seek(_root.header.len_header + ofs_data)
        @data = io.read_bytes(len_data)
        io.seek(_pos)
        @data
      end
      attr_reader :ofs_data
      attr_reader :len_data
      attr_reader :checksum
    end
    attr_reader :magic1
    attr_reader :version
    attr_reader :len_header
    attr_reader :len_data
    attr_reader :root_entry
    attr_reader :magic2
    attr_reader :_raw_root_entry
  end
  attr_reader :header
end
