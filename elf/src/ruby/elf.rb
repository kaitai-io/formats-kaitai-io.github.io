# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://github.com/lattera/glibc/blob/master/elf/elf.h Source
class Elf < Kaitai::Struct::Struct

  ENDIAN = {
    1 => :endian_le,
    2 => :endian_be,
  }
  I__ENDIAN = ENDIAN.invert

  SH_TYPE = {
    0 => :sh_type_null_type,
    1 => :sh_type_progbits,
    2 => :sh_type_symtab,
    3 => :sh_type_strtab,
    4 => :sh_type_rela,
    5 => :sh_type_hash,
    6 => :sh_type_dynamic,
    7 => :sh_type_note,
    8 => :sh_type_nobits,
    9 => :sh_type_rel,
    10 => :sh_type_shlib,
    11 => :sh_type_dynsym,
    14 => :sh_type_init_array,
    15 => :sh_type_fini_array,
    16 => :sh_type_preinit_array,
    17 => :sh_type_group,
    18 => :sh_type_symtab_shndx,
    1879048175 => :sh_type_sunw_capchain,
    1879048176 => :sh_type_sunw_capinfo,
    1879048177 => :sh_type_sunw_symsort,
    1879048178 => :sh_type_sunw_tlssort,
    1879048179 => :sh_type_sunw_ldynsym,
    1879048180 => :sh_type_sunw_dof,
    1879048181 => :sh_type_sunw_cap,
    1879048182 => :sh_type_sunw_signature,
    1879048183 => :sh_type_sunw_annotate,
    1879048184 => :sh_type_sunw_debugstr,
    1879048185 => :sh_type_sunw_debug,
    1879048186 => :sh_type_sunw_move,
    1879048187 => :sh_type_sunw_comdat,
    1879048188 => :sh_type_sunw_syminfo,
    1879048189 => :sh_type_sunw_verdef,
    1879048190 => :sh_type_sunw_verneed,
    1879048191 => :sh_type_sunw_versym,
    1879048192 => :sh_type_sparc_gotdata,
    1879048193 => :sh_type_amd64_unwind,
  }
  I__SH_TYPE = SH_TYPE.invert

  OS_ABI = {
    0 => :os_abi_system_v,
    1 => :os_abi_hp_ux,
    2 => :os_abi_netbsd,
    3 => :os_abi_gnu,
    6 => :os_abi_solaris,
    7 => :os_abi_aix,
    8 => :os_abi_irix,
    9 => :os_abi_freebsd,
    10 => :os_abi_tru64,
    11 => :os_abi_modesto,
    12 => :os_abi_openbsd,
    13 => :os_abi_openvms,
    14 => :os_abi_nsk,
    15 => :os_abi_aros,
    16 => :os_abi_fenixos,
    17 => :os_abi_cloudabi,
    18 => :os_abi_openvos,
  }
  I__OS_ABI = OS_ABI.invert

  MACHINE = {
    0 => :machine_not_set,
    2 => :machine_sparc,
    3 => :machine_x86,
    8 => :machine_mips,
    20 => :machine_powerpc,
    40 => :machine_arm,
    42 => :machine_superh,
    50 => :machine_ia_64,
    62 => :machine_x86_64,
    183 => :machine_aarch64,
  }
  I__MACHINE = MACHINE.invert

  PHDR_TYPE = {
    1 => :phdr_type_read,
    2 => :phdr_type_write,
    4 => :phdr_type_execute,
    4026531840 => :phdr_type_mask_proc,
  }
  I__PHDR_TYPE = PHDR_TYPE.invert

  SECTION_HEADER_FLAGS = {
    1 => :section_header_flags_write,
    2 => :section_header_flags_alloc,
    4 => :section_header_flags_exec_instr,
    16 => :section_header_flags_merge,
    32 => :section_header_flags_strings,
    64 => :section_header_flags_info_link,
    128 => :section_header_flags_link_order,
    256 => :section_header_flags_os_non_conforming,
    512 => :section_header_flags_group,
    1024 => :section_header_flags_tls,
    67108864 => :section_header_flags_ordered,
    134217728 => :section_header_flags_exclude,
    4026531840 => :section_header_flags_mask_proc,
  }
  I__SECTION_HEADER_FLAGS = SECTION_HEADER_FLAGS.invert

  DYNAMIC_ARRAY_TAGS = {
    0 => :dynamic_array_tags_null,
    1 => :dynamic_array_tags_needed,
    2 => :dynamic_array_tags_pltrelsz,
    3 => :dynamic_array_tags_pltgot,
    4 => :dynamic_array_tags_hash,
    5 => :dynamic_array_tags_strtab,
    6 => :dynamic_array_tags_symtab,
    7 => :dynamic_array_tags_rela,
    8 => :dynamic_array_tags_relasz,
    9 => :dynamic_array_tags_relaent,
    10 => :dynamic_array_tags_strsz,
    11 => :dynamic_array_tags_syment,
    12 => :dynamic_array_tags_init,
    13 => :dynamic_array_tags_fini,
    14 => :dynamic_array_tags_soname,
    15 => :dynamic_array_tags_rpath,
    16 => :dynamic_array_tags_symbolic,
    17 => :dynamic_array_tags_rel,
    18 => :dynamic_array_tags_relsz,
    19 => :dynamic_array_tags_relent,
    20 => :dynamic_array_tags_pltrel,
    21 => :dynamic_array_tags_debug,
    22 => :dynamic_array_tags_textrel,
    23 => :dynamic_array_tags_jmprel,
    24 => :dynamic_array_tags_bind_now,
    25 => :dynamic_array_tags_init_array,
    26 => :dynamic_array_tags_fini_array,
    27 => :dynamic_array_tags_init_arraysz,
    28 => :dynamic_array_tags_fini_arraysz,
    29 => :dynamic_array_tags_runpath,
    30 => :dynamic_array_tags_flags,
    32 => :dynamic_array_tags_preinit_array,
    33 => :dynamic_array_tags_preinit_arraysz,
    34 => :dynamic_array_tags_maxpostags,
    1610612749 => :dynamic_array_tags_sunw_auxiliary,
    1610612750 => :dynamic_array_tags_sunw_filter,
    1610612752 => :dynamic_array_tags_sunw_cap,
    1610612753 => :dynamic_array_tags_sunw_symtab,
    1610612754 => :dynamic_array_tags_sunw_symsz,
    1610612755 => :dynamic_array_tags_sunw_sortent,
    1610612756 => :dynamic_array_tags_sunw_symsort,
    1610612757 => :dynamic_array_tags_sunw_symsortsz,
    1610612758 => :dynamic_array_tags_sunw_tlssort,
    1610612759 => :dynamic_array_tags_sunw_tlssortsz,
    1610612760 => :dynamic_array_tags_sunw_capinfo,
    1610612761 => :dynamic_array_tags_sunw_strpad,
    1610612762 => :dynamic_array_tags_sunw_capchain,
    1610612763 => :dynamic_array_tags_sunw_ldmach,
    1610612765 => :dynamic_array_tags_sunw_capchainent,
    1610612767 => :dynamic_array_tags_sunw_capchainsz,
    1879044096 => :dynamic_array_tags_hios,
    1879047424 => :dynamic_array_tags_valrnglo,
    1879047669 => :dynamic_array_tags_gnu_prelinked,
    1879047670 => :dynamic_array_tags_gnu_conflictsz,
    1879047671 => :dynamic_array_tags_gnu_liblistsz,
    1879047672 => :dynamic_array_tags_checksum,
    1879047673 => :dynamic_array_tags_pltpadsz,
    1879047674 => :dynamic_array_tags_moveent,
    1879047675 => :dynamic_array_tags_movesz,
    1879047676 => :dynamic_array_tags_feature_1,
    1879047677 => :dynamic_array_tags_posflag_1,
    1879047678 => :dynamic_array_tags_syminsz,
    1879047679 => :dynamic_array_tags_valrnghi,
    1879047680 => :dynamic_array_tags_addrrnglo,
    1879047925 => :dynamic_array_tags_gnu_hash,
    1879047926 => :dynamic_array_tags_tlsdesc_plt,
    1879047927 => :dynamic_array_tags_tlsdesc_got,
    1879047928 => :dynamic_array_tags_gnu_conflict,
    1879047929 => :dynamic_array_tags_gnu_liblist,
    1879047930 => :dynamic_array_tags_config,
    1879047931 => :dynamic_array_tags_depaudit,
    1879047932 => :dynamic_array_tags_audit,
    1879047933 => :dynamic_array_tags_pltpad,
    1879047934 => :dynamic_array_tags_movetab,
    1879047935 => :dynamic_array_tags_addrrnghi,
    1879048176 => :dynamic_array_tags_versym,
    1879048185 => :dynamic_array_tags_relacount,
    1879048186 => :dynamic_array_tags_relcount,
    1879048187 => :dynamic_array_tags_flags_1,
    1879048188 => :dynamic_array_tags_verdef,
    1879048189 => :dynamic_array_tags_verdefnum,
    1879048190 => :dynamic_array_tags_verneed,
    1879048191 => :dynamic_array_tags_verneednum,
    1879048192 => :dynamic_array_tags_loproc,
    1879048193 => :dynamic_array_tags_sparc_register,
    2147483645 => :dynamic_array_tags_auxiliary,
    2147483646 => :dynamic_array_tags_used,
    2147483647 => :dynamic_array_tags_hiproc,
  }
  I__DYNAMIC_ARRAY_TAGS = DYNAMIC_ARRAY_TAGS.invert

  BITS = {
    1 => :bits_b32,
    2 => :bits_b64,
  }
  I__BITS = BITS.invert

  PH_TYPE = {
    0 => :ph_type_null_type,
    1 => :ph_type_load,
    2 => :ph_type_dynamic,
    3 => :ph_type_interp,
    4 => :ph_type_note,
    5 => :ph_type_shlib,
    6 => :ph_type_phdr,
    7 => :ph_type_tls,
    1685382480 => :ph_type_gnu_eh_frame,
    1685382481 => :ph_type_gnu_stack,
    1685382482 => :ph_type_gnu_relro,
    1694766464 => :ph_type_pax_flags,
    1879048191 => :ph_type_hios,
  }
  I__PH_TYPE = PH_TYPE.invert

  OBJ_TYPE = {
    1 => :obj_type_relocatable,
    2 => :obj_type_executable,
    3 => :obj_type_shared,
    4 => :obj_type_core,
  }
  I__OBJ_TYPE = OBJ_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.ensure_fixed_contents([127, 69, 76, 70].pack('C*'))
    @bits = Kaitai::Struct::Stream::resolve_enum(BITS, @_io.read_u1)
    @endian = Kaitai::Struct::Stream::resolve_enum(ENDIAN, @_io.read_u1)
    @ei_version = @_io.read_u1
    @abi = Kaitai::Struct::Stream::resolve_enum(OS_ABI, @_io.read_u1)
    @abi_version = @_io.read_u1
    @pad = @_io.read_bytes(7)
    @header = EndianElf.new(@_io, self, @_root)
    self
  end
  class EndianElf < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      case _root.endian
      when :endian_le
        @_is_le = true
      when :endian_be
        @_is_le = false
      end

      if @_is_le == true
        _read_le
      elsif @_is_le == false
        _read_be
      else
        raise Kaitai::Struct::Stream::UndecidedEndiannessError
      end
      self
    end

    def _read_le
      @e_type = Kaitai::Struct::Stream::resolve_enum(OBJ_TYPE, @_io.read_u2le)
      @machine = Kaitai::Struct::Stream::resolve_enum(MACHINE, @_io.read_u2le)
      @e_version = @_io.read_u4le
      case _root.bits
      when :bits_b32
        @entry_point = @_io.read_u4le
      when :bits_b64
        @entry_point = @_io.read_u8le
      end
      case _root.bits
      when :bits_b32
        @program_header_offset = @_io.read_u4le
      when :bits_b64
        @program_header_offset = @_io.read_u8le
      end
      case _root.bits
      when :bits_b32
        @section_header_offset = @_io.read_u4le
      when :bits_b64
        @section_header_offset = @_io.read_u8le
      end
      @flags = @_io.read_bytes(4)
      @e_ehsize = @_io.read_u2le
      @program_header_entry_size = @_io.read_u2le
      @qty_program_header = @_io.read_u2le
      @section_header_entry_size = @_io.read_u2le
      @qty_section_header = @_io.read_u2le
      @section_names_idx = @_io.read_u2le
      self
    end

    def _read_be
      @e_type = Kaitai::Struct::Stream::resolve_enum(OBJ_TYPE, @_io.read_u2be)
      @machine = Kaitai::Struct::Stream::resolve_enum(MACHINE, @_io.read_u2be)
      @e_version = @_io.read_u4be
      case _root.bits
      when :bits_b32
        @entry_point = @_io.read_u4be
      when :bits_b64
        @entry_point = @_io.read_u8be
      end
      case _root.bits
      when :bits_b32
        @program_header_offset = @_io.read_u4be
      when :bits_b64
        @program_header_offset = @_io.read_u8be
      end
      case _root.bits
      when :bits_b32
        @section_header_offset = @_io.read_u4be
      when :bits_b64
        @section_header_offset = @_io.read_u8be
      end
      @flags = @_io.read_bytes(4)
      @e_ehsize = @_io.read_u2be
      @program_header_entry_size = @_io.read_u2be
      @qty_program_header = @_io.read_u2be
      @section_header_entry_size = @_io.read_u2be
      @qty_section_header = @_io.read_u2be
      @section_names_idx = @_io.read_u2be
      self
    end
    class ProgramHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::Stream::UndecidedEndiannessError
        end
        self
      end

      def _read_le
        @type = Kaitai::Struct::Stream::resolve_enum(PH_TYPE, @_io.read_u4le)
        if _root.bits == :bits_b64
          @flags64 = Kaitai::Struct::Stream::resolve_enum(PHDR_TYPE, @_io.read_u4le)
        end
        case _root.bits
        when :bits_b32
          @offset = @_io.read_u4le
        when :bits_b64
          @offset = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @vaddr = @_io.read_u4le
        when :bits_b64
          @vaddr = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @paddr = @_io.read_u4le
        when :bits_b64
          @paddr = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @filesz = @_io.read_u4le
        when :bits_b64
          @filesz = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @memsz = @_io.read_u4le
        when :bits_b64
          @memsz = @_io.read_u8le
        end
        if _root.bits == :bits_b32
          @flags32 = @_io.read_u4le
        end
        case _root.bits
        when :bits_b32
          @align = @_io.read_u4le
        when :bits_b64
          @align = @_io.read_u8le
        end
        self
      end

      def _read_be
        @type = Kaitai::Struct::Stream::resolve_enum(PH_TYPE, @_io.read_u4be)
        if _root.bits == :bits_b64
          @flags64 = Kaitai::Struct::Stream::resolve_enum(PHDR_TYPE, @_io.read_u4be)
        end
        case _root.bits
        when :bits_b32
          @offset = @_io.read_u4be
        when :bits_b64
          @offset = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @vaddr = @_io.read_u4be
        when :bits_b64
          @vaddr = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @paddr = @_io.read_u4be
        when :bits_b64
          @paddr = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @filesz = @_io.read_u4be
        when :bits_b64
          @filesz = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @memsz = @_io.read_u4be
        when :bits_b64
          @memsz = @_io.read_u8be
        end
        if _root.bits == :bits_b32
          @flags32 = @_io.read_u4be
        end
        case _root.bits
        when :bits_b32
          @align = @_io.read_u4be
        when :bits_b64
          @align = @_io.read_u8be
        end
        self
      end
      def dynamic
        return @dynamic unless @dynamic.nil?
        if type == :ph_type_dynamic
          io = _root._io
          _pos = io.pos
          io.seek(offset)
          if @_is_le
            @_raw_dynamic = io.read_bytes(filesz)
            io = Kaitai::Struct::Stream.new(@_raw_dynamic)
            @dynamic = DynamicSection.new(io, self, @_root, @_is_le)
          else
            @_raw_dynamic = io.read_bytes(filesz)
            io = Kaitai::Struct::Stream.new(@_raw_dynamic)
            @dynamic = DynamicSection.new(io, self, @_root, @_is_le)
          end
          io.seek(_pos)
        end
        @dynamic
      end
      attr_reader :type
      attr_reader :flags64
      attr_reader :offset
      attr_reader :vaddr
      attr_reader :paddr
      attr_reader :filesz
      attr_reader :memsz
      attr_reader :flags32
      attr_reader :align
      attr_reader :_raw_dynamic
    end
    class DynamicSectionEntry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::Stream::UndecidedEndiannessError
        end
        self
      end

      def _read_le
        case _root.bits
        when :bits_b32
          @tag = @_io.read_u4le
        when :bits_b64
          @tag = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @value_or_ptr = @_io.read_u4le
        when :bits_b64
          @value_or_ptr = @_io.read_u8le
        end
        self
      end

      def _read_be
        case _root.bits
        when :bits_b32
          @tag = @_io.read_u4be
        when :bits_b64
          @tag = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @value_or_ptr = @_io.read_u4be
        when :bits_b64
          @value_or_ptr = @_io.read_u8be
        end
        self
      end
      def tag_enum
        return @tag_enum unless @tag_enum.nil?
        @tag_enum = Kaitai::Struct::Stream::resolve_enum(DYNAMIC_ARRAY_TAGS, tag)
        @tag_enum
      end
      attr_reader :tag
      attr_reader :value_or_ptr
    end
    class SectionHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::Stream::UndecidedEndiannessError
        end
        self
      end

      def _read_le
        @name_offset = @_io.read_u4le
        @type = Kaitai::Struct::Stream::resolve_enum(SH_TYPE, @_io.read_u4le)
        case _root.bits
        when :bits_b32
          @flags = @_io.read_u4le
        when :bits_b64
          @flags = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @addr = @_io.read_u4le
        when :bits_b64
          @addr = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @offset = @_io.read_u4le
        when :bits_b64
          @offset = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @size = @_io.read_u4le
        when :bits_b64
          @size = @_io.read_u8le
        end
        @linked_section_idx = @_io.read_u4le
        @info = @_io.read_bytes(4)
        case _root.bits
        when :bits_b32
          @align = @_io.read_u4le
        when :bits_b64
          @align = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @entry_size = @_io.read_u4le
        when :bits_b64
          @entry_size = @_io.read_u8le
        end
        self
      end

      def _read_be
        @name_offset = @_io.read_u4be
        @type = Kaitai::Struct::Stream::resolve_enum(SH_TYPE, @_io.read_u4be)
        case _root.bits
        when :bits_b32
          @flags = @_io.read_u4be
        when :bits_b64
          @flags = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @addr = @_io.read_u4be
        when :bits_b64
          @addr = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @offset = @_io.read_u4be
        when :bits_b64
          @offset = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @size = @_io.read_u4be
        when :bits_b64
          @size = @_io.read_u8be
        end
        @linked_section_idx = @_io.read_u4be
        @info = @_io.read_bytes(4)
        case _root.bits
        when :bits_b32
          @align = @_io.read_u4be
        when :bits_b64
          @align = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @entry_size = @_io.read_u4be
        when :bits_b64
          @entry_size = @_io.read_u8be
        end
        self
      end
      def flags_enum
        return @flags_enum unless @flags_enum.nil?
        @flags_enum = Kaitai::Struct::Stream::resolve_enum(SECTION_HEADER_FLAGS, flags)
        @flags_enum
      end
      def body
        return @body unless @body.nil?
        io = _root._io
        _pos = io.pos
        io.seek(offset)
        if @_is_le
          @body = io.read_bytes(size)
        else
          @body = io.read_bytes(size)
        end
        io.seek(_pos)
        @body
      end
      def strtab
        return @strtab unless @strtab.nil?
        if type == :sh_type_strtab
          io = _root._io
          _pos = io.pos
          io.seek(offset)
          if @_is_le
            @_raw_strtab = io.read_bytes(size)
            io = Kaitai::Struct::Stream.new(@_raw_strtab)
            @strtab = StringsStruct.new(io, self, @_root, @_is_le)
          else
            @_raw_strtab = io.read_bytes(size)
            io = Kaitai::Struct::Stream.new(@_raw_strtab)
            @strtab = StringsStruct.new(io, self, @_root, @_is_le)
          end
          io.seek(_pos)
        end
        @strtab
      end
      def name
        return @name unless @name.nil?
        io = _root.header.strings._io
        _pos = io.pos
        io.seek(name_offset)
        if @_is_le
          @name = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
        else
          @name = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
        end
        io.seek(_pos)
        @name
      end
      def dynamic
        return @dynamic unless @dynamic.nil?
        if type == :sh_type_dynamic
          io = _root._io
          _pos = io.pos
          io.seek(offset)
          if @_is_le
            @_raw_dynamic = io.read_bytes(size)
            io = Kaitai::Struct::Stream.new(@_raw_dynamic)
            @dynamic = DynamicSection.new(io, self, @_root, @_is_le)
          else
            @_raw_dynamic = io.read_bytes(size)
            io = Kaitai::Struct::Stream.new(@_raw_dynamic)
            @dynamic = DynamicSection.new(io, self, @_root, @_is_le)
          end
          io.seek(_pos)
        end
        @dynamic
      end
      attr_reader :name_offset
      attr_reader :type
      attr_reader :flags
      attr_reader :addr
      attr_reader :offset
      attr_reader :size
      attr_reader :linked_section_idx
      attr_reader :info
      attr_reader :align
      attr_reader :entry_size
      attr_reader :_raw_strtab
      attr_reader :_raw_dynamic
    end
    class DynamicSection < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::Stream::UndecidedEndiannessError
        end
        self
      end

      def _read_le
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << DynamicSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end

      def _read_be
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << DynamicSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end
      attr_reader :entries
    end
    class StringsStruct < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::Stream::UndecidedEndiannessError
        end
        self
      end

      def _read_le
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
          i += 1
        end
        self
      end

      def _read_be
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
          i += 1
        end
        self
      end
      attr_reader :entries
    end
    def program_headers
      return @program_headers unless @program_headers.nil?
      _pos = @_io.pos
      @_io.seek(program_header_offset)
      if @_is_le
        @_raw_program_headers = Array.new(qty_program_header)
        @program_headers = Array.new(qty_program_header)
        (qty_program_header).times { |i|
          @_raw_program_headers[i] = @_io.read_bytes(program_header_entry_size)
          io = Kaitai::Struct::Stream.new(@_raw_program_headers[i])
          @program_headers[i] = ProgramHeader.new(io, self, @_root, @_is_le)
        }
      else
        @_raw_program_headers = Array.new(qty_program_header)
        @program_headers = Array.new(qty_program_header)
        (qty_program_header).times { |i|
          @_raw_program_headers[i] = @_io.read_bytes(program_header_entry_size)
          io = Kaitai::Struct::Stream.new(@_raw_program_headers[i])
          @program_headers[i] = ProgramHeader.new(io, self, @_root, @_is_le)
        }
      end
      @_io.seek(_pos)
      @program_headers
    end
    def section_headers
      return @section_headers unless @section_headers.nil?
      _pos = @_io.pos
      @_io.seek(section_header_offset)
      if @_is_le
        @_raw_section_headers = Array.new(qty_section_header)
        @section_headers = Array.new(qty_section_header)
        (qty_section_header).times { |i|
          @_raw_section_headers[i] = @_io.read_bytes(section_header_entry_size)
          io = Kaitai::Struct::Stream.new(@_raw_section_headers[i])
          @section_headers[i] = SectionHeader.new(io, self, @_root, @_is_le)
        }
      else
        @_raw_section_headers = Array.new(qty_section_header)
        @section_headers = Array.new(qty_section_header)
        (qty_section_header).times { |i|
          @_raw_section_headers[i] = @_io.read_bytes(section_header_entry_size)
          io = Kaitai::Struct::Stream.new(@_raw_section_headers[i])
          @section_headers[i] = SectionHeader.new(io, self, @_root, @_is_le)
        }
      end
      @_io.seek(_pos)
      @section_headers
    end
    def strings
      return @strings unless @strings.nil?
      _pos = @_io.pos
      @_io.seek(section_headers[section_names_idx].offset)
      if @_is_le
        @_raw_strings = @_io.read_bytes(section_headers[section_names_idx].size)
        io = Kaitai::Struct::Stream.new(@_raw_strings)
        @strings = StringsStruct.new(io, self, @_root, @_is_le)
      else
        @_raw_strings = @_io.read_bytes(section_headers[section_names_idx].size)
        io = Kaitai::Struct::Stream.new(@_raw_strings)
        @strings = StringsStruct.new(io, self, @_root, @_is_le)
      end
      @_io.seek(_pos)
      @strings
    end
    attr_reader :e_type
    attr_reader :machine
    attr_reader :e_version
    attr_reader :entry_point
    attr_reader :program_header_offset
    attr_reader :section_header_offset
    attr_reader :flags
    attr_reader :e_ehsize
    attr_reader :program_header_entry_size
    attr_reader :qty_program_header
    attr_reader :section_header_entry_size
    attr_reader :qty_section_header
    attr_reader :section_names_idx
    attr_reader :_raw_program_headers
    attr_reader :_raw_section_headers
    attr_reader :_raw_strings
  end

  ##
  # File identification, must be 0x7f + "ELF".
  attr_reader :magic

  ##
  # File class: designates target machine word size (32 or 64
  # bits). The size of many integer fields in this format will
  # depend on this setting.
  attr_reader :bits

  ##
  # Endianness used for all integers.
  attr_reader :endian

  ##
  # ELF header version.
  attr_reader :ei_version

  ##
  # Specifies which OS- and ABI-related extensions will be used
  # in this ELF file.
  attr_reader :abi

  ##
  # Version of ABI targeted by this ELF file. Interpretation
  # depends on `abi` attribute.
  attr_reader :abi_version
  attr_reader :pad
  attr_reader :header
end
