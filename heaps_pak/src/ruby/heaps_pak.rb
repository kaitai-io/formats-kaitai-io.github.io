# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx Source
class HeapsPak < Kaitai::Struct::Struct
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
      @magic1 = @_io.ensure_fixed_contents([80, 65, 75].pack('C*'))
      @version = @_io.read_u1
      @len_header = @_io.read_u4le
      @len_data = @_io.read_u4le
      @_raw_root_entry = @_io.read_bytes((len_header - 16))
      _io__raw_root_entry = Kaitai::Struct::Stream.new(@_raw_root_entry)
      @root_entry = Entry.new(_io__raw_root_entry, self, @_root)
      @magic2 = @_io.ensure_fixed_contents([68, 65, 84, 65].pack('C*'))
      self
    end

    ##
    # @see https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx Source
    class Entry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @len_name = @_io.read_u1
        @name = (@_io.read_bytes(len_name)).force_encoding("UTF-8")
        @flags = Flags.new(@_io, self, @_root)
        case flags.is_dir
        when true
          @body = Dir.new(@_io, self, @_root)
        when false
          @body = File.new(@_io, self, @_root)
        end
        self
      end
      class Flags < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @unused = @_io.read_bits_int(7)
          @is_dir = @_io.read_bits_int(1) != 0
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
      def initialize(_io, _parent = nil, _root = self)
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
        io.seek((_root.header.len_header + ofs_data))
        @data = io.read_bytes(len_data)
        io.seek(_pos)
        @data
      end
      attr_reader :ofs_data
      attr_reader :len_data
      attr_reader :checksum
    end
    class Dir < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @num_entries = @_io.read_u4le
        @entries = Array.new(num_entries)
        (num_entries).times { |i|
          @entries[i] = Entry.new(@_io, self, @_root)
        }
        self
      end
      attr_reader :num_entries
      attr_reader :entries
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
