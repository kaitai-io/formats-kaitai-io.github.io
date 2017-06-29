# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Ines < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    @rom = @_io.read_bytes_full
    self
  end
  class F7 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @upper_nibble = @_io.read_bits_int(4)
      @format = @_io.read_bits_int(2)
      @arcade_2 = @_io.read_bits_int(1) != 0
      @arcade_1 = @_io.read_bits_int(1) != 0
      self
    end

    ##
    # Upper nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
    attr_reader :upper_nibble

    ##
    # If equal to 2, flags 8-15 are in NES 2.0 format
    attr_reader :format

    ##
    # Determines if it made for a Nintendo PlayChoice-10 or not
    attr_reader :arcade_2

    ##
    # Determines if it is made for a Nintendo VS Unisystem or not
    attr_reader :arcade_1
  end
  class F6 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @lower_nibble = @_io.read_bits_int(4)
      @ignore_mirror = @_io.read_bits_int(1) != 0
      @trainer = @_io.read_bits_int(1) != 0
      @has_battery_ram = @_io.read_bits_int(1) != 0
      @mirror = @_io.read_bits_int(1) != 0
      self
    end

    ##
    # Lower nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
    attr_reader :lower_nibble

    ##
    # Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
    attr_reader :ignore_mirror

    ##
    # 512-byte trainer at $7000-$71FF (stored before PRG data)
    attr_reader :trainer

    ##
    # If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
    attr_reader :has_battery_ram

    ##
    # if 0, horizontal arrangement. if 1, vertical arrangement
    attr_reader :mirror
  end
  class F10 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @nothing1 = @_io.read_bits_int(2)
      @bus_conflict = @_io.read_bits_int(1) != 0
      @prg_ram = @_io.read_bits_int(1) != 0
      @nothing2 = @_io.read_bits_int(2)
      @tv_system = @_io.read_bits_int(2)
      self
    end
    attr_reader :nothing1

    ##
    # If 0, no bus conflicts. If 1, bus conflicts.
    attr_reader :bus_conflict

    ##
    # If 0, PRG ram is present. If 1, not present.
    attr_reader :prg_ram
    attr_reader :nothing2

    ##
    # if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
    attr_reader :tv_system
  end
  class F9 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved = @_io.read_bits_int(7)
      @tv_system = @_io.read_bits_int(1) != 0
      self
    end
    attr_reader :reserved

    ##
    # if 0, NTSC. If 1, PAL.
    attr_reader :tv_system
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([78, 69, 83, 26].pack('C*'))
      @prg_rom_size = @_io.read_u1
      @chr_rom_size = @_io.read_u1
      @f6 = F6.new(@_io, self, @_root)
      @f7 = F7.new(@_io, self, @_root)
      @prg_ram_size = @_io.read_u1
      @f9 = F9.new(@_io, self, @_root)
      @f10 = F10.new(@_io, self, @_root)
      @zero_fill = @_io.read_bytes(4)
      self
    end
    attr_reader :magic

    ##
    # Size of PRG ROM in 16 KB units
    attr_reader :prg_rom_size

    ##
    # Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
    attr_reader :chr_rom_size
    attr_reader :f6
    attr_reader :f7

    ##
    # Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
    attr_reader :prg_ram_size
    attr_reader :f9

    ##
    # this one is unofficial
    attr_reader :f10
    attr_reader :zero_fill
  end
  def mapper
    return @mapper unless @mapper.nil?
    @mapper = (_root.header.f6.lower_nibble | (_root.header.f7.upper_nibble << 4))
    @mapper
  end
  attr_reader :header
  attr_reader :rom
end
