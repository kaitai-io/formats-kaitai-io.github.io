# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see http://www.microsoft.com/whdc/system/platform/firmware/PECOFF.mspx Source
class MicrosoftPe < Kaitai::Struct::Struct

  PE_FORMAT = {
    263 => :pe_format_rom_image,
    267 => :pe_format_pe32,
    523 => :pe_format_pe32_plus,
  }
  I__PE_FORMAT = PE_FORMAT.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @mz1 = MzPlaceholder.new(@_io, self, @_root)
    @mz2 = @_io.read_bytes((mz1.header_size - 64))
    @pe_signature = @_io.ensure_fixed_contents([80, 69, 0, 0].pack('C*'))
    @coff_hdr = CoffHeader.new(@_io, self, @_root)
    @_raw_optional_hdr = @_io.read_bytes(coff_hdr.size_of_optional_header)
    io = Kaitai::Struct::Stream.new(@_raw_optional_hdr)
    @optional_hdr = OptionalHeader.new(io, self, @_root)
    @sections = Array.new(coff_hdr.number_of_sections)
    (coff_hdr.number_of_sections).times { |i|
      @sections[i] = Section.new(@_io, self, @_root)
    }
  end
  class OptionalHeaderWindows < Kaitai::Struct::Struct

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
    }
    I__SUBSYSTEM_ENUM = SUBSYSTEM_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      if _parent.std.format == :pe_format_pe32
        @image_base_32 = @_io.read_u4le
      end
      if _parent.std.format == :pe_format_pe32_plus
        @image_base_64 = @_io.read_u8le
      end
      @section_alignment = @_io.read_u4le
      @file_alignment = @_io.read_u4le
      @major_operating_system_version = @_io.read_u2le
      @minor_operating_system_version = @_io.read_u2le
      @major_image_version = @_io.read_u2le
      @minor_image_version = @_io.read_u2le
      @major_subsystem_version = @_io.read_u2le
      @minor_subsystem_version = @_io.read_u2le
      @win32_version_value = @_io.read_u4le
      @size_of_image = @_io.read_u4le
      @size_of_headers = @_io.read_u4le
      @check_sum = @_io.read_u4le
      @subsystem = Kaitai::Struct::Stream::resolve_enum(SUBSYSTEM_ENUM, @_io.read_u2le)
      @dll_characteristics = @_io.read_u2le
      if _parent.std.format == :pe_format_pe32
        @size_of_stack_reserve_32 = @_io.read_u4le
      end
      if _parent.std.format == :pe_format_pe32_plus
        @size_of_stack_reserve_64 = @_io.read_u8le
      end
      if _parent.std.format == :pe_format_pe32
        @size_of_stack_commit_32 = @_io.read_u4le
      end
      if _parent.std.format == :pe_format_pe32_plus
        @size_of_stack_commit_64 = @_io.read_u8le
      end
      if _parent.std.format == :pe_format_pe32
        @size_of_heap_reserve_32 = @_io.read_u4le
      end
      if _parent.std.format == :pe_format_pe32_plus
        @size_of_heap_reserve_64 = @_io.read_u8le
      end
      if _parent.std.format == :pe_format_pe32
        @size_of_heap_commit_32 = @_io.read_u4le
      end
      if _parent.std.format == :pe_format_pe32_plus
        @size_of_heap_commit_64 = @_io.read_u8le
      end
      @loader_flags = @_io.read_u4le
      @number_of_rva_and_sizes = @_io.read_u4le
    end
    attr_reader :image_base_32
    attr_reader :image_base_64
    attr_reader :section_alignment
    attr_reader :file_alignment
    attr_reader :major_operating_system_version
    attr_reader :minor_operating_system_version
    attr_reader :major_image_version
    attr_reader :minor_image_version
    attr_reader :major_subsystem_version
    attr_reader :minor_subsystem_version
    attr_reader :win32_version_value
    attr_reader :size_of_image
    attr_reader :size_of_headers
    attr_reader :check_sum
    attr_reader :subsystem
    attr_reader :dll_characteristics
    attr_reader :size_of_stack_reserve_32
    attr_reader :size_of_stack_reserve_64
    attr_reader :size_of_stack_commit_32
    attr_reader :size_of_stack_commit_64
    attr_reader :size_of_heap_reserve_32
    attr_reader :size_of_heap_reserve_64
    attr_reader :size_of_heap_commit_32
    attr_reader :size_of_heap_commit_64
    attr_reader :loader_flags
    attr_reader :number_of_rva_and_sizes
  end
  class OptionalHeaderDataDirs < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @export_table = DataDir.new(@_io, self, @_root)
      @import_table = DataDir.new(@_io, self, @_root)
      @resource_table = DataDir.new(@_io, self, @_root)
      @exception_table = DataDir.new(@_io, self, @_root)
      @certificate_table = DataDir.new(@_io, self, @_root)
      @base_relocation_table = DataDir.new(@_io, self, @_root)
      @debug = DataDir.new(@_io, self, @_root)
      @architecture = DataDir.new(@_io, self, @_root)
      @global_ptr = DataDir.new(@_io, self, @_root)
      @tls_table = DataDir.new(@_io, self, @_root)
      @load_config_table = DataDir.new(@_io, self, @_root)
      @bound_import = DataDir.new(@_io, self, @_root)
      @iat = DataDir.new(@_io, self, @_root)
      @delay_import_descriptor = DataDir.new(@_io, self, @_root)
      @clr_runtime_header = DataDir.new(@_io, self, @_root)
    end
    attr_reader :export_table
    attr_reader :import_table
    attr_reader :resource_table
    attr_reader :exception_table
    attr_reader :certificate_table
    attr_reader :base_relocation_table
    attr_reader :debug
    attr_reader :architecture
    attr_reader :global_ptr
    attr_reader :tls_table
    attr_reader :load_config_table
    attr_reader :bound_import
    attr_reader :iat
    attr_reader :delay_import_descriptor
    attr_reader :clr_runtime_header
  end
  class DataDir < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @virtual_address = @_io.read_u4le
      @size = @_io.read_u4le
    end
    attr_reader :virtual_address
    attr_reader :size
  end
  class OptionalHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @std = OptionalHeaderStd.new(@_io, self, @_root)
      @windows = OptionalHeaderWindows.new(@_io, self, @_root)
      @data_dirs = OptionalHeaderDataDirs.new(@_io, self, @_root)
    end
    attr_reader :std
    attr_reader :windows
    attr_reader :data_dirs
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
      @number_of_relocations = @_io.read_u2le
      @number_of_linenumbers = @_io.read_u2le
      @characteristics = @_io.read_u4le
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek(pointer_to_raw_data)
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
    attr_reader :number_of_relocations
    attr_reader :number_of_linenumbers
    attr_reader :characteristics
  end
  class MzPlaceholder < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @magic = @_io.ensure_fixed_contents([77, 90].pack('C*'))
      @data1 = @_io.read_bytes(58)
      @header_size = @_io.read_u4le
    end
    attr_reader :magic
    attr_reader :data1
    attr_reader :header_size
  end
  class OptionalHeaderStd < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @format = Kaitai::Struct::Stream::resolve_enum(PE_FORMAT, @_io.read_u2le)
      @major_linker_version = @_io.read_u1
      @minor_linker_version = @_io.read_u1
      @size_of_code = @_io.read_u4le
      @size_of_initialized_data = @_io.read_u4le
      @size_of_uninitialized_data = @_io.read_u4le
      @address_of_entry_point = @_io.read_u4le
      @base_of_code = @_io.read_u4le
      if format == :pe_format_pe32
        @base_of_data = @_io.read_u4le
      end
    end
    attr_reader :format
    attr_reader :major_linker_version
    attr_reader :minor_linker_version
    attr_reader :size_of_code
    attr_reader :size_of_initialized_data
    attr_reader :size_of_uninitialized_data
    attr_reader :address_of_entry_point
    attr_reader :base_of_code
    attr_reader :base_of_data
  end

  ##
  # @see '' 3.3. COFF File Header (Object and Image)
  class CoffHeader < Kaitai::Struct::Struct

    MACHINE_TYPE = {
      0 => :machine_type_unknown,
      332 => :machine_type_i386,
      358 => :machine_type_r4000,
      361 => :machine_type_wcemipsv2,
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
    }
    I__MACHINE_TYPE = MACHINE_TYPE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @machine = Kaitai::Struct::Stream::resolve_enum(MACHINE_TYPE, @_io.read_u2le)
      @number_of_sections = @_io.read_u2le
      @time_date_stamp = @_io.read_u4le
      @pointer_to_symbol_table = @_io.read_u4le
      @number_of_symbols = @_io.read_u4le
      @size_of_optional_header = @_io.read_u2le
      @characteristics = @_io.read_u2le
    end
    attr_reader :machine
    attr_reader :number_of_sections
    attr_reader :time_date_stamp
    attr_reader :pointer_to_symbol_table
    attr_reader :number_of_symbols
    attr_reader :size_of_optional_header
    attr_reader :characteristics
  end
  attr_reader :mz1
  attr_reader :mz2
  attr_reader :pe_signature
  attr_reader :coff_hdr
  attr_reader :optional_hdr
  attr_reader :sections
  attr_reader :_raw_optional_hdr
end
