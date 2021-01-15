# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# This type of executables could be found inside the UEFI firmware. The UEFI
# firmware is stored in SPI flash memory, which is a chip soldered on a
# system's motherboard. UEFI firmware is very modular: it usually contains
# dozens, if not hundreds, of executables. To store all these separates files,
# the firmware is laid out in volumes using the Firmware File System (FFS), a
# file system specifically designed to store firmware images. The volumes
# contain files that are identified by GUIDs and each of these files contain
# one or more sections holding the data. One of these sections contains the
# actual executable image. Most of the executable images follow the PE format.
# However, some of them follow the TE format.
# 
# The Terse Executable (TE) image format was created as a mechanism to reduce
# the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a
# corresponding reduction of image sizes for executables running in the PI
# (Platform Initialization) Architecture environment. Reducing image size
# provides an opportunity for use of a smaller system flash part.
# 
# So the TE format is basically a stripped version of PE.
# @see https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf Source
class UefiTe < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @_raw_te_hdr = @_io.read_bytes(40)
    _io__raw_te_hdr = Kaitai::Struct::Stream.new(@_raw_te_hdr)
    @te_hdr = TeHeader.new(_io__raw_te_hdr, self, @_root)
    @sections = Array.new(te_hdr.num_sections)
    (te_hdr.num_sections).times { |i|
      @sections[i] = Section.new(@_io, self, @_root)
    }
    self
  end
  class TeHeader < Kaitai::Struct::Struct

    MACHINE_TYPE = {
      0 => :machine_type_unknown,
      332 => :machine_type_i386,
      358 => :machine_type_r4000,
      361 => :machine_type_wcemipsv2,
      388 => :machine_type_alpha,
      418 => :machine_type_sh3,
      419 => :machine_type_sh3dsp,
      422 => :machine_type_sh4,
      424 => :machine_type_sh5,
      448 => :machine_type_arm,
      450 => :machine_type_thumb,
      452 => :machine_type_armnt,
      467 => :machine_type_am33,
      496 => :machine_type_powerpc,
      497 => :machine_type_powerpcfp,
      512 => :machine_type_ia64,
      614 => :machine_type_mips16,
      870 => :machine_type_mipsfpu,
      1126 => :machine_type_mipsfpu16,
      3772 => :machine_type_ebc,
      20530 => :machine_type_riscv32,
      20580 => :machine_type_riscv64,
      20776 => :machine_type_riscv128,
      34404 => :machine_type_amd64,
      36929 => :machine_type_m32r,
      43620 => :machine_type_arm64,
    }
    I__MACHINE_TYPE = MACHINE_TYPE.invert

    SUBSYSTEM_ENUM = {
      0 => :subsystem_enum_unknown,
      1 => :subsystem_enum_native,
      2 => :subsystem_enum_windows_gui,
      3 => :subsystem_enum_windows_cui,
      7 => :subsystem_enum_posix_cui,
      9 => :subsystem_enum_windows_ce_gui,
      10 => :subsystem_enum_efi_application,
      11 => :subsystem_enum_efi_boot_service_driver,
      12 => :subsystem_enum_efi_runtime_driver,
      13 => :subsystem_enum_efi_rom,
      14 => :subsystem_enum_xbox,
      16 => :subsystem_enum_windows_boot_application,
    }
    I__SUBSYSTEM_ENUM = SUBSYSTEM_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([86, 90].pack('C*'), magic, _io, "/types/te_header/seq/0") if not magic == [86, 90].pack('C*')
      @machine = Kaitai::Struct::Stream::resolve_enum(MACHINE_TYPE, @_io.read_u2le)
      @num_sections = @_io.read_u1
      @subsystem = Kaitai::Struct::Stream::resolve_enum(SUBSYSTEM_ENUM, @_io.read_u1)
      @stripped_size = @_io.read_u2le
      @entry_point_addr = @_io.read_u4le
      @base_of_code = @_io.read_u4le
      @image_base = @_io.read_u8le
      @data_dirs = HeaderDataDirs.new(@_io, self, @_root)
      self
    end
    attr_reader :magic
    attr_reader :machine
    attr_reader :num_sections
    attr_reader :subsystem
    attr_reader :stripped_size
    attr_reader :entry_point_addr
    attr_reader :base_of_code
    attr_reader :image_base
    attr_reader :data_dirs
  end
  class HeaderDataDirs < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @base_relocation_table = DataDir.new(@_io, self, @_root)
      @debug = DataDir.new(@_io, self, @_root)
      self
    end
    attr_reader :base_relocation_table
    attr_reader :debug
  end
  class DataDir < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @virtual_address = @_io.read_u4le
      @size = @_io.read_u4le
      self
    end
    attr_reader :virtual_address
    attr_reader :size
  end
  class Section < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(8), 0)).force_encoding("UTF-8")
      @virtual_size = @_io.read_u4le
      @virtual_address = @_io.read_u4le
      @size_of_raw_data = @_io.read_u4le
      @pointer_to_raw_data = @_io.read_u4le
      @pointer_to_relocations = @_io.read_u4le
      @pointer_to_linenumbers = @_io.read_u4le
      @num_relocations = @_io.read_u2le
      @num_linenumbers = @_io.read_u2le
      @characteristics = @_io.read_u4le
      self
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek(((pointer_to_raw_data - _root.te_hdr.stripped_size) + _root.te_hdr._io.size))
      @body = @_io.read_bytes(size_of_raw_data)
      @_io.seek(_pos)
      @body
    end
    attr_reader :name
    attr_reader :virtual_size
    attr_reader :virtual_address
    attr_reader :size_of_raw_data
    attr_reader :pointer_to_raw_data
    attr_reader :pointer_to_relocations
    attr_reader :pointer_to_linenumbers
    attr_reader :num_relocations
    attr_reader :num_linenumbers
    attr_reader :characteristics
  end
  attr_reader :te_hdr
  attr_reader :sections
  attr_reader :_raw_te_hdr
end
