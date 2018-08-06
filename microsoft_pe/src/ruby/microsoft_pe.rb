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
    @mz = MzPlaceholder.new(@_io, self, @_root)
    self
  end

  ##
  # @see https://docs.microsoft.com/en-us/windows/desktop/debug/pe-format#the-attribute-certificate-table-image-only Source
  class CertificateEntry < Kaitai::Struct::Struct

    CERTIFICATE_REVISION = {
      256 => :certificate_revision_revision_1_0,
      512 => :certificate_revision_revision_2_0,
    }
    I__CERTIFICATE_REVISION = CERTIFICATE_REVISION.invert

    CERTIFICATE_TYPE = {
      1 => :certificate_type_x509,
      2 => :certificate_type_pkcs_signed_data,
      3 => :certificate_type_reserved_1,
      4 => :certificate_type_ts_stack_signed,
    }
    I__CERTIFICATE_TYPE = CERTIFICATE_TYPE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length = @_io.read_u4le
      @revision = Kaitai::Struct::Stream::resolve_enum(CERTIFICATE_REVISION, @_io.read_u2le)
      @certificate_type = Kaitai::Struct::Stream::resolve_enum(CERTIFICATE_TYPE, @_io.read_u2le)
      @certificate_bytes = @_io.read_bytes((length - 8))
      self
    end

    ##
    # Specifies the length of the attribute certificate entry.
    attr_reader :length

    ##
    # Contains the certificate version number.
    attr_reader :revision

    ##
    # Specifies the type of content in bCertificate
    attr_reader :certificate_type

    ##
    # Contains a certificate, such as an Authenticode signature.
    attr_reader :certificate_bytes
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
      16 => :subsystem_enum_windows_boot_application,
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
      self
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
      self
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
      self
    end
    attr_reader :virtual_address
    attr_reader :size
  end
  class CoffSymbol < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_raw_name_annoying = @_io.read_bytes(8)
      io = Kaitai::Struct::Stream.new(@_raw_name_annoying)
      @name_annoying = Annoyingstring.new(io, self, @_root)
      @value = @_io.read_u4le
      @section_number = @_io.read_u2le
      @type = @_io.read_u2le
      @storage_class = @_io.read_u1
      @number_of_aux_symbols = @_io.read_u1
      self
    end
    def section
      return @section unless @section.nil?
      @section = _root.pe.sections[(section_number - 1)]
      @section
    end
    def data
      return @data unless @data.nil?
      _pos = @_io.pos
      @_io.seek((section.pointer_to_raw_data + value))
      @data = @_io.read_bytes(1)
      @_io.seek(_pos)
      @data
    end
    attr_reader :name_annoying
    attr_reader :value
    attr_reader :section_number
    attr_reader :type
    attr_reader :storage_class
    attr_reader :number_of_aux_symbols
    attr_reader :_raw_name_annoying
  end
  class PeHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @pe_signature = @_io.ensure_fixed_contents([80, 69, 0, 0].pack('C*'))
      @coff_hdr = CoffHeader.new(@_io, self, @_root)
      @_raw_optional_hdr = @_io.read_bytes(coff_hdr.size_of_optional_header)
      io = Kaitai::Struct::Stream.new(@_raw_optional_hdr)
      @optional_hdr = OptionalHeader.new(io, self, @_root)
      @sections = Array.new(coff_hdr.number_of_sections)
      (coff_hdr.number_of_sections).times { |i|
        @sections[i] = Section.new(@_io, self, @_root)
      }
      self
    end
    def certificate_table
      return @certificate_table unless @certificate_table.nil?
      if optional_hdr.data_dirs.certificate_table.virtual_address != 0
        _pos = @_io.pos
        @_io.seek(optional_hdr.data_dirs.certificate_table.virtual_address)
        @_raw_certificate_table = @_io.read_bytes(optional_hdr.data_dirs.certificate_table.size)
        io = Kaitai::Struct::Stream.new(@_raw_certificate_table)
        @certificate_table = CertificateTable.new(io, self, @_root)
        @_io.seek(_pos)
      end
      @certificate_table
    end
    attr_reader :pe_signature
    attr_reader :coff_hdr
    attr_reader :optional_hdr
    attr_reader :sections
    attr_reader :_raw_optional_hdr
    attr_reader :_raw_certificate_table
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
      self
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
      self
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
  class CertificateTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @items = []
      i = 0
      while not @_io.eof?
        @items << CertificateEntry.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :items
  end
  class MzPlaceholder < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([77, 90].pack('C*'))
      @data1 = @_io.read_bytes(58)
      @ofs_pe = @_io.read_u4le
      self
    end
    attr_reader :magic
    attr_reader :data1

    ##
    # In PE file, an offset to PE header
    attr_reader :ofs_pe
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
      self
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
      self
    end
    def symbol_table_size
      return @symbol_table_size unless @symbol_table_size.nil?
      @symbol_table_size = (number_of_symbols * 18)
      @symbol_table_size
    end
    def symbol_name_table_offset
      return @symbol_name_table_offset unless @symbol_name_table_offset.nil?
      @symbol_name_table_offset = (pointer_to_symbol_table + symbol_table_size)
      @symbol_name_table_offset
    end
    def symbol_name_table_size
      return @symbol_name_table_size unless @symbol_name_table_size.nil?
      _pos = @_io.pos
      @_io.seek(symbol_name_table_offset)
      @symbol_name_table_size = @_io.read_u4le
      @_io.seek(_pos)
      @symbol_name_table_size
    end
    def symbol_table
      return @symbol_table unless @symbol_table.nil?
      _pos = @_io.pos
      @_io.seek(pointer_to_symbol_table)
      @symbol_table = Array.new(number_of_symbols)
      (number_of_symbols).times { |i|
        @symbol_table[i] = CoffSymbol.new(@_io, self, @_root)
      }
      @_io.seek(_pos)
      @symbol_table
    end
    attr_reader :machine
    attr_reader :number_of_sections
    attr_reader :time_date_stamp
    attr_reader :pointer_to_symbol_table
    attr_reader :number_of_symbols
    attr_reader :size_of_optional_header
    attr_reader :characteristics
  end
  class Annoyingstring < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
    def name_from_offset
      return @name_from_offset unless @name_from_offset.nil?
      io = _root._io
      _pos = io.pos
      io.seek((name_zeroes == 0 ? (_parent._parent.symbol_name_table_offset + name_offset) : 0))
      @name_from_offset = (io.read_bytes_term(0, false, true, false)).force_encoding("ascii")
      io.seek(_pos)
      @name_from_offset
    end
    def name_offset
      return @name_offset unless @name_offset.nil?
      _pos = @_io.pos
      @_io.seek(4)
      @name_offset = @_io.read_u4le
      @_io.seek(_pos)
      @name_offset
    end
    def name
      return @name unless @name.nil?
      @name = (name_zeroes == 0 ? name_from_offset : name_from_short)
      @name
    end
    def name_zeroes
      return @name_zeroes unless @name_zeroes.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @name_zeroes = @_io.read_u4le
      @_io.seek(_pos)
      @name_zeroes
    end
    def name_from_short
      return @name_from_short unless @name_from_short.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @name_from_short = (@_io.read_bytes_term(0, false, true, false)).force_encoding("ascii")
      @_io.seek(_pos)
      @name_from_short
    end
  end
  def pe
    return @pe unless @pe.nil?
    _pos = @_io.pos
    @_io.seek(mz.ofs_pe)
    @pe = PeHeader.new(@_io, self, @_root)
    @_io.seek(_pos)
    @pe
  end
  attr_reader :mz
end
