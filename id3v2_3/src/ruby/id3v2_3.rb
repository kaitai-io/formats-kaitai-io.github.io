# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Id3v23 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @tag = Tag.new(@_io, self, @_root)
    self
  end
  class U1beSynchsafe < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @padding = @_io.read_bits_int(1) != 0
      @value = @_io.read_bits_int(7)
      self
    end
    attr_reader :padding
    attr_reader :value
  end
  class U2beSynchsafe < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @byte0 = U1beSynchsafe.new(@_io, self, @_root)
      @byte1 = U1beSynchsafe.new(@_io, self, @_root)
      self
    end
    def value
      return @value unless @value.nil?
      @value = ((byte0.value << 7) | byte1.value)
      @value
    end
    attr_reader :byte0
    attr_reader :byte1
  end
  class Tag < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = Header.new(@_io, self, @_root)
      if header.flags.flag_headerex
        @header_ex = HeaderEx.new(@_io, self, @_root)
      end
      @frames = []
      begin
        _ = Frame.new(@_io, self, @_root)
        @frames << _
      end until  (((_io.pos + _.size) > header.size.value) || (_.is_invalid)) 
      if header.flags.flag_headerex
        @padding = @_io.read_bytes((header_ex.padding_size - _io.pos))
      end
      self
    end
    attr_reader :header
    attr_reader :header_ex
    attr_reader :frames
    attr_reader :padding
  end
  class U4beSynchsafe < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @short0 = U2beSynchsafe.new(@_io, self, @_root)
      @short1 = U2beSynchsafe.new(@_io, self, @_root)
      self
    end
    def value
      return @value unless @value.nil?
      @value = ((short0.value << 14) | short1.value)
      @value
    end
    attr_reader :short0
    attr_reader :short1
  end
  class Frame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = (@_io.read_bytes(4)).force_encoding("ASCII")
      @size = @_io.read_u4be
      @flags = Flags.new(@_io, self, @_root)
      @data = @_io.read_bytes(size)
      self
    end
    class Flags < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @flag_discard_alter_tag = @_io.read_bits_int(1) != 0
        @flag_discard_alter_file = @_io.read_bits_int(1) != 0
        @flag_read_only = @_io.read_bits_int(1) != 0
        @reserved1 = @_io.read_bits_int(5)
        @flag_compressed = @_io.read_bits_int(1) != 0
        @flag_encrypted = @_io.read_bits_int(1) != 0
        @flag_grouping = @_io.read_bits_int(1) != 0
        @reserved2 = @_io.read_bits_int(5)
        self
      end
      attr_reader :flag_discard_alter_tag
      attr_reader :flag_discard_alter_file
      attr_reader :flag_read_only
      attr_reader :reserved1
      attr_reader :flag_compressed
      attr_reader :flag_encrypted
      attr_reader :flag_grouping
      attr_reader :reserved2
    end
    def is_invalid
      return @is_invalid unless @is_invalid.nil?
      @is_invalid = id == "\000\000\000\000"
      @is_invalid
    end
    attr_reader :id
    attr_reader :size
    attr_reader :flags
    attr_reader :data
  end

  ##
  # ID3v2 extended header
  # @see '' Section 3.2. ID3v2 extended header
  class HeaderEx < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4be
      @flags_ex = FlagsEx.new(@_io, self, @_root)
      @padding_size = @_io.read_u4be
      if flags_ex.flag_crc
        @crc = @_io.read_u4be
      end
      self
    end
    class FlagsEx < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @flag_crc = @_io.read_bits_int(1) != 0
        @reserved = @_io.read_bits_int(15)
        self
      end
      attr_reader :flag_crc
      attr_reader :reserved
    end
    attr_reader :size
    attr_reader :flags_ex
    attr_reader :padding_size
    attr_reader :crc
  end

  ##
  # ID3v2 fixed header
  # @see '' Section 3.1. ID3v2 header
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([73, 68, 51].pack('C*'))
      @version_major = @_io.read_u1
      @version_revision = @_io.read_u1
      @flags = Flags.new(@_io, self, @_root)
      @size = U4beSynchsafe.new(@_io, self, @_root)
      self
    end
    class Flags < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @flag_unsynchronization = @_io.read_bits_int(1) != 0
        @flag_headerex = @_io.read_bits_int(1) != 0
        @flag_experimental = @_io.read_bits_int(1) != 0
        @reserved = @_io.read_bits_int(5)
        self
      end
      attr_reader :flag_unsynchronization
      attr_reader :flag_headerex
      attr_reader :flag_experimental
      attr_reader :reserved
    end
    attr_reader :magic
    attr_reader :version_major
    attr_reader :version_revision
    attr_reader :flags
    attr_reader :size
  end
  attr_reader :tag
end
