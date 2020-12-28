# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Header and a footer for stock firmwares used on some ASUS routers. trx files not necessarily contain these headers.
# @see https://github.com/openwrt/openwrt/blob/master/tools/firmware-utils/src/trx.c Source
class AsusTrx < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    self
  end
  class Revision < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major = @_io.read_u1
      @minor = @_io.read_u1
      self
    end
    attr_reader :major
    attr_reader :minor
  end
  class Version < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major = @_io.read_u1
      @minor = @_io.read_u1
      @patch = @_io.read_u1
      @tweak = @_io.read_u1
      self
    end
    attr_reader :major
    attr_reader :minor
    attr_reader :patch
    attr_reader :tweak
  end

  ##
  # A safeguard against installation of firmware to an incompatible device
  class Tail < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = Version.new(@_io, self, @_root)
      @product_id = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(12), 0, false)).force_encoding("utf-8")
      @comp_hw = Array.new(4)
      (4).times { |i|
        @comp_hw[i] = HwCompInfo.new(@_io, self, @_root)
      }
      @reserved = @_io.read_bytes(32)
      self
    end
    class HwCompInfo < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @min = Revision.new(@_io, self, @_root)
        @max = Revision.new(@_io, self, @_root)
        self
      end
      attr_reader :min
      attr_reader :max
    end

    ##
    # 1.9.2.7 by default
    attr_reader :version
    attr_reader :product_id

    ##
    # 0.02 - 2.99
    attr_reader :comp_hw
    attr_reader :reserved
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([72, 68, 82, 48].pack('C*'), signature, _io, "/types/header/seq/0") if not signature == [72, 68, 82, 48].pack('C*')
      @len = @_io.read_u4le
      @crc32 = @_io.read_u4le
      @version = @_io.read_u2le
      @flags = Flags.new(@_io, self, @_root)
      @partitions = []
      i = 0
      begin
        _ = Partition.new(@_io, self, @_root, i)
        @partitions << _
        i += 1
      end until  ((i >= 4) || (!(_.present))) 
      self
    end
    class Partition < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, idx)
        super(_io, _parent, _root)
        @idx = idx
        _read
      end

      def _read
        @offset = @_io.read_u4le
        self
      end
      def present
        return @present unless @present.nil?
        @present = offset != 0
        @present
      end
      def is_last
        return @is_last unless @is_last.nil?
        if present
          @is_last =  ((idx == (_parent.partitions.length - 1)) || (!(_parent.partitions[(idx + 1)].present))) 
        end
        @is_last
      end
      def size
        return @size unless @size.nil?
        if present
          @size = (is_last ? (_root._io.size - offset) : _parent.partitions[(idx + 1)].offset)
        end
        @size
      end
      def partition
        return @partition unless @partition.nil?
        if present
          io = _root._io
          _pos = io.pos
          io.seek(offset)
          @partition = io.read_bytes(size)
          io.seek(_pos)
        end
        @partition
      end
      attr_reader :offset
      attr_reader :idx
    end
    class Flags < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @flags = Array.new(16)
        (16).times { |i|
          @flags[i] = @_io.read_bits_int_le(1) != 0
        }
        self
      end
      attr_reader :flags
    end
    attr_reader :signature

    ##
    # Length of file including header
    attr_reader :len

    ##
    # CRC from `version` (??? todo: see the original and disambiguate) to end of file
    attr_reader :crc32
    attr_reader :version
    attr_reader :flags

    ##
    # Offsets of partitions from start of header
    attr_reader :partitions
  end
  def header
    return @header unless @header.nil?
    _pos = @_io.pos
    @_io.seek(0)
    @header = Header.new(@_io, self, @_root)
    @_io.seek(_pos)
    @header
  end
  def tail
    return @tail unless @tail.nil?
    _pos = @_io.pos
    @_io.seek((_io.size - 64))
    @tail = Tail.new(@_io, self, @_root)
    @_io.seek(_pos)
    @tail
  end
end
