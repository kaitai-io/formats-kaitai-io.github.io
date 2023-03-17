# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://www.nesdev.org/wiki/INES Source
class Ines < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @_raw_header = @_io.read_bytes(16)
    _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
    @header = Header.new(_io__raw_header, self, @_root)
    if header.f6.trainer
      @trainer = @_io.read_bytes(512)
    end
    @prg_rom = @_io.read_bytes((header.len_prg_rom * 16384))
    @chr_rom = @_io.read_bytes((header.len_chr_rom * 8192))
    if header.f7.playchoice10
      @playchoice10 = Playchoice10.new(@_io, self, @_root)
    end
    if !(_io.eof?)
      @title = (@_io.read_bytes_full).force_encoding("ASCII")
    end
    self
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([78, 69, 83, 26].pack('C*'), magic, _io, "/types/header/seq/0") if not magic == [78, 69, 83, 26].pack('C*')
      @len_prg_rom = @_io.read_u1
      @len_chr_rom = @_io.read_u1
      @_raw_f6 = @_io.read_bytes(1)
      _io__raw_f6 = Kaitai::Struct::Stream.new(@_raw_f6)
      @f6 = F6.new(_io__raw_f6, self, @_root)
      @_raw_f7 = @_io.read_bytes(1)
      _io__raw_f7 = Kaitai::Struct::Stream.new(@_raw_f7)
      @f7 = F7.new(_io__raw_f7, self, @_root)
      @len_prg_ram = @_io.read_u1
      @_raw_f9 = @_io.read_bytes(1)
      _io__raw_f9 = Kaitai::Struct::Stream.new(@_raw_f9)
      @f9 = F9.new(_io__raw_f9, self, @_root)
      @_raw_f10 = @_io.read_bytes(1)
      _io__raw_f10 = Kaitai::Struct::Stream.new(@_raw_f10)
      @f10 = F10.new(_io__raw_f10, self, @_root)
      @reserved = @_io.read_bytes(5)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 0, 0].pack('C*'), reserved, _io, "/types/header/seq/8") if not reserved == [0, 0, 0, 0, 0].pack('C*')
      self
    end

    ##
    # @see https://www.nesdev.org/wiki/INES#Flags_6 Source
    class F6 < Kaitai::Struct::Struct

      MIRRORING = {
        0 => :mirroring_horizontal,
        1 => :mirroring_vertical,
      }
      I__MIRRORING = MIRRORING.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @lower_mapper = @_io.read_bits_int_be(4)
        @four_screen = @_io.read_bits_int_be(1) != 0
        @trainer = @_io.read_bits_int_be(1) != 0
        @has_battery_ram = @_io.read_bits_int_be(1) != 0
        @mirroring = Kaitai::Struct::Stream::resolve_enum(MIRRORING, @_io.read_bits_int_be(1))
        self
      end

      ##
      # Lower nibble of mapper number
      attr_reader :lower_mapper

      ##
      # Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
      attr_reader :four_screen

      ##
      # 512-byte trainer at $7000-$71FF (stored before PRG data)
      attr_reader :trainer

      ##
      # If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
      attr_reader :has_battery_ram

      ##
      # if 0, horizontal arrangement. if 1, vertical arrangement
      attr_reader :mirroring
    end

    ##
    # @see https://www.nesdev.org/wiki/INES#Flags_7 Source
    class F7 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @upper_mapper = @_io.read_bits_int_be(4)
        @format = @_io.read_bits_int_be(2)
        @playchoice10 = @_io.read_bits_int_be(1) != 0
        @vs_unisystem = @_io.read_bits_int_be(1) != 0
        self
      end

      ##
      # Upper nibble of mapper number
      attr_reader :upper_mapper

      ##
      # If equal to 2, flags 8-15 are in NES 2.0 format
      attr_reader :format

      ##
      # Determines if it made for a Nintendo PlayChoice-10 or not
      attr_reader :playchoice10

      ##
      # Determines if it is made for a Nintendo VS Unisystem or not
      attr_reader :vs_unisystem
    end

    ##
    # @see https://www.nesdev.org/wiki/INES#Flags_9 Source
    class F9 < Kaitai::Struct::Struct

      TV_SYSTEM = {
        0 => :tv_system_ntsc,
        1 => :tv_system_pal,
      }
      I__TV_SYSTEM = TV_SYSTEM.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_bits_int_be(7)
        @tv_system = Kaitai::Struct::Stream::resolve_enum(TV_SYSTEM, @_io.read_bits_int_be(1))
        self
      end
      attr_reader :reserved

      ##
      # if 0, NTSC. If 1, PAL.
      attr_reader :tv_system
    end

    ##
    # @see https://www.nesdev.org/wiki/INES#Flags_10 Source
    class F10 < Kaitai::Struct::Struct

      TV_SYSTEM = {
        0 => :tv_system_ntsc,
        1 => :tv_system_dual1,
        2 => :tv_system_pal,
        3 => :tv_system_dual2,
      }
      I__TV_SYSTEM = TV_SYSTEM.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved1 = @_io.read_bits_int_be(2)
        @bus_conflict = @_io.read_bits_int_be(1) != 0
        @prg_ram = @_io.read_bits_int_be(1) != 0
        @reserved2 = @_io.read_bits_int_be(2)
        @tv_system = Kaitai::Struct::Stream::resolve_enum(TV_SYSTEM, @_io.read_bits_int_be(2))
        self
      end
      attr_reader :reserved1

      ##
      # If 0, no bus conflicts. If 1, bus conflicts.
      attr_reader :bus_conflict

      ##
      # If 0, PRG ram is present. If 1, not present.
      attr_reader :prg_ram
      attr_reader :reserved2

      ##
      # if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
      attr_reader :tv_system
    end

    ##
    # @see https://www.nesdev.org/wiki/Mapper Source
    def mapper
      return @mapper unless @mapper.nil?
      @mapper = (f6.lower_mapper | (f7.upper_mapper << 4))
      @mapper
    end
    attr_reader :magic

    ##
    # Size of PRG ROM in 16 KB units
    attr_reader :len_prg_rom

    ##
    # Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
    attr_reader :len_chr_rom
    attr_reader :f6
    attr_reader :f7

    ##
    # Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
    attr_reader :len_prg_ram
    attr_reader :f9

    ##
    # this one is unofficial
    attr_reader :f10
    attr_reader :reserved
    attr_reader :_raw_f6
    attr_reader :_raw_f7
    attr_reader :_raw_f9
    attr_reader :_raw_f10
  end

  ##
  # @see https://www.nesdev.org/wiki/PC10_ROM-Images Source
  class Playchoice10 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @inst_rom = @_io.read_bytes(8192)
      @prom = Prom.new(@_io, self, @_root)
      self
    end
    class Prom < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @data = @_io.read_bytes(16)
        @counter_out = @_io.read_bytes(16)
        self
      end
      attr_reader :data
      attr_reader :counter_out
    end
    attr_reader :inst_rom
    attr_reader :prom
  end
  attr_reader :header
  attr_reader :trainer
  attr_reader :prg_rom
  attr_reader :chr_rom
  attr_reader :playchoice10
  attr_reader :title
  attr_reader :_raw_header
end
