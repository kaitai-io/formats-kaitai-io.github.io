# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=HEAD Source
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
    1879048194 => :sh_type_arm_preemptmap,
    1879048195 => :sh_type_arm_attributes,
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
    243 => :machine_riscv,
    247 => :machine_bpf,
  }
  I__MACHINE = MACHINE.invert

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
    1879048193 => :ph_type_arm_exidx,
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
  class PhdrTypeFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, value)
      super(_io, _parent, _root)
      @value = value
      _read
    end

    def _read
      self
    end
    def read
      return @read unless @read.nil?
      @read = (value & 4) != 0
      @read
    end
    def write
      return @write unless @write.nil?
      @write = (value & 2) != 0
      @write
    end
    def execute
      return @execute unless @execute.nil?
      @execute = (value & 1) != 0
      @execute
    end
    def mask_proc
      return @mask_proc unless @mask_proc.nil?
      @mask_proc = (value & 4026531840) != 0
      @mask_proc
    end
    attr_reader :value
  end
  class SectionHeaderFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, value)
      super(_io, _parent, _root)
      @value = value
      _read
    end

    def _read
      self
    end

    ##
    # might be merged
    def merge
      return @merge unless @merge.nil?
      @merge = (value & 16) != 0
      @merge
    end

    ##
    # OS-specific
    def mask_os
      return @mask_os unless @mask_os.nil?
      @mask_os = (value & 267386880) != 0
      @mask_os
    end

    ##
    # section is excluded unless referenced or allocated (Solaris)
    def exclude
      return @exclude unless @exclude.nil?
      @exclude = (value & 134217728) != 0
      @exclude
    end

    ##
    # Processor-specific
    def mask_proc
      return @mask_proc unless @mask_proc.nil?
      @mask_proc = (value & 4026531840) != 0
      @mask_proc
    end

    ##
    # contains nul-terminated strings
    def strings
      return @strings unless @strings.nil?
      @strings = (value & 32) != 0
      @strings
    end

    ##
    # non-standard OS specific handling required
    def os_non_conforming
      return @os_non_conforming unless @os_non_conforming.nil?
      @os_non_conforming = (value & 256) != 0
      @os_non_conforming
    end

    ##
    # occupies memory during execution
    def alloc
      return @alloc unless @alloc.nil?
      @alloc = (value & 2) != 0
      @alloc
    end

    ##
    # executable
    def exec_instr
      return @exec_instr unless @exec_instr.nil?
      @exec_instr = (value & 4) != 0
      @exec_instr
    end

    ##
    # 'sh_info' contains SHT index
    def info_link
      return @info_link unless @info_link.nil?
      @info_link = (value & 64) != 0
      @info_link
    end

    ##
    # writable
    def write
      return @write unless @write.nil?
      @write = (value & 1) != 0
      @write
    end

    ##
    # preserve order after combining
    def link_order
      return @link_order unless @link_order.nil?
      @link_order = (value & 128) != 0
      @link_order
    end

    ##
    # special ordering requirement (Solaris)
    def ordered
      return @ordered unless @ordered.nil?
      @ordered = (value & 67108864) != 0
      @ordered
    end

    ##
    # section hold thread-local data
    def tls
      return @tls unless @tls.nil?
      @tls = (value & 1024) != 0
      @tls
    end

    ##
    # section is member of a group
    def group
      return @group unless @group.nil?
      @group = (value & 512) != 0
      @group
    end
    attr_reader :value
  end
  class DtFlag1Values < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, value)
      super(_io, _parent, _root)
      @value = value
      _read
    end

    def _read
      self
    end

    ##
    # Singleton symbols are used.
    def singleton
      return @singleton unless @singleton.nil?
      @singleton = (value & 33554432) != 0
      @singleton
    end
    def ignmuldef
      return @ignmuldef unless @ignmuldef.nil?
      @ignmuldef = (value & 262144) != 0
      @ignmuldef
    end

    ##
    # Trigger filtee loading at runtime.
    def loadfltr
      return @loadfltr unless @loadfltr.nil?
      @loadfltr = (value & 16) != 0
      @loadfltr
    end

    ##
    # Set RTLD_INITFIRST for this object
    def initfirst
      return @initfirst unless @initfirst.nil?
      @initfirst = (value & 32) != 0
      @initfirst
    end

    ##
    # Object has individual interposers.
    def symintpose
      return @symintpose unless @symintpose.nil?
      @symintpose = (value & 8388608) != 0
      @symintpose
    end
    def noreloc
      return @noreloc unless @noreloc.nil?
      @noreloc = (value & 4194304) != 0
      @noreloc
    end

    ##
    # Configuration alternative created.
    def confalt
      return @confalt unless @confalt.nil?
      @confalt = (value & 8192) != 0
      @confalt
    end

    ##
    # Disp reloc applied at build time.
    def dispreldne
      return @dispreldne unless @dispreldne.nil?
      @dispreldne = (value & 32768) != 0
      @dispreldne
    end

    ##
    # Set RTLD_GLOBAL for this object.
    def rtld_global
      return @rtld_global unless @rtld_global.nil?
      @rtld_global = (value & 2) != 0
      @rtld_global
    end

    ##
    # Set RTLD_NODELETE for this object.
    def nodelete
      return @nodelete unless @nodelete.nil?
      @nodelete = (value & 8) != 0
      @nodelete
    end
    def trans
      return @trans unless @trans.nil?
      @trans = (value & 512) != 0
      @trans
    end

    ##
    # $ORIGIN must be handled.
    def origin
      return @origin unless @origin.nil?
      @origin = (value & 128) != 0
      @origin
    end

    ##
    # Set RTLD_NOW for this object.
    def now
      return @now unless @now.nil?
      @now = (value & 1) != 0
      @now
    end
    def nohdr
      return @nohdr unless @nohdr.nil?
      @nohdr = (value & 1048576) != 0
      @nohdr
    end

    ##
    # Filtee terminates filters search.
    def endfiltee
      return @endfiltee unless @endfiltee.nil?
      @endfiltee = (value & 16384) != 0
      @endfiltee
    end

    ##
    # Object has no-direct binding.
    def nodirect
      return @nodirect unless @nodirect.nil?
      @nodirect = (value & 131072) != 0
      @nodirect
    end

    ##
    # Global auditing required.
    def globaudit
      return @globaudit unless @globaudit.nil?
      @globaudit = (value & 16777216) != 0
      @globaudit
    end
    def noksyms
      return @noksyms unless @noksyms.nil?
      @noksyms = (value & 524288) != 0
      @noksyms
    end

    ##
    # Object is used to interpose.
    def interpose
      return @interpose unless @interpose.nil?
      @interpose = (value & 1024) != 0
      @interpose
    end

    ##
    # Object can't be dldump'ed.
    def nodump
      return @nodump unless @nodump.nil?
      @nodump = (value & 4096) != 0
      @nodump
    end

    ##
    # Disp reloc applied at run-time.
    def disprelpnd
      return @disprelpnd unless @disprelpnd.nil?
      @disprelpnd = (value & 65536) != 0
      @disprelpnd
    end

    ##
    # Set RTLD_NOOPEN for this object.
    def noopen
      return @noopen unless @noopen.nil?
      @noopen = (value & 64) != 0
      @noopen
    end
    def stub
      return @stub unless @stub.nil?
      @stub = (value & 67108864) != 0
      @stub
    end

    ##
    # Direct binding enabled.
    def direct
      return @direct unless @direct.nil?
      @direct = (value & 256) != 0
      @direct
    end

    ##
    # Object is modified after built.
    def edited
      return @edited unless @edited.nil?
      @edited = (value & 2097152) != 0
      @edited
    end

    ##
    # Set RTLD_GROUP for this object.
    def group
      return @group unless @group.nil?
      @group = (value & 4) != 0
      @group
    end
    def pie
      return @pie unless @pie.nil?
      @pie = (value & 134217728) != 0
      @pie
    end

    ##
    # Ignore default lib search path.
    def nodeflib
      return @nodeflib unless @nodeflib.nil?
      @nodeflib = (value & 2048) != 0
      @nodeflib
    end
    attr_reader :value
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
    class DynsymSectionEntry64 < Kaitai::Struct::Struct
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
        @info = @_io.read_u1
        @other = @_io.read_u1
        @shndx = @_io.read_u2le
        @value = @_io.read_u8le
        @size = @_io.read_u8le
        self
      end

      def _read_be
        @name_offset = @_io.read_u4be
        @info = @_io.read_u1
        @other = @_io.read_u1
        @shndx = @_io.read_u2be
        @value = @_io.read_u8be
        @size = @_io.read_u8be
        self
      end
      attr_reader :name_offset
      attr_reader :info
      attr_reader :other
      attr_reader :shndx
      attr_reader :value
      attr_reader :size
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
          @flags64 = @_io.read_u4le
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
          @flags64 = @_io.read_u4be
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
      def flags_obj
        return @flags_obj unless @flags_obj.nil?
        if @_is_le
          @flags_obj = PhdrTypeFlags.new(@_io, self, @_root, (flags64 | flags32))
        else
          @flags_obj = PhdrTypeFlags.new(@_io, self, @_root, (flags64 | flags32))
        end
        @flags_obj
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
      def flag_1_values
        return @flag_1_values unless @flag_1_values.nil?
        if tag_enum == :dynamic_array_tags_flags_1
          if @_is_le
            @flag_1_values = DtFlag1Values.new(@_io, self, @_root, value_or_ptr)
          else
            @flag_1_values = DtFlag1Values.new(@_io, self, @_root, value_or_ptr)
          end
        end
        @flag_1_values
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
        @ofs_name = @_io.read_u4le
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
          @ofs_body = @_io.read_u4le
        when :bits_b64
          @ofs_body = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @len_body = @_io.read_u4le
        when :bits_b64
          @len_body = @_io.read_u8le
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
        @ofs_name = @_io.read_u4be
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
          @ofs_body = @_io.read_u4be
        when :bits_b64
          @ofs_body = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @len_body = @_io.read_u4be
        when :bits_b64
          @len_body = @_io.read_u8be
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
      def body
        return @body unless @body.nil?
        io = _root._io
        _pos = io.pos
        io.seek(ofs_body)
        if @_is_le
          case type
          when :sh_type_dynamic
            @_raw_body = io.read_bytes(len_body)
            io = Kaitai::Struct::Stream.new(@_raw_body)
            @body = DynamicSection.new(io, self, @_root, @_is_le)
          when :sh_type_strtab
            @_raw_body = io.read_bytes(len_body)
            io = Kaitai::Struct::Stream.new(@_raw_body)
            @body = StringsStruct.new(io, self, @_root, @_is_le)
          when :sh_type_dynstr
            @_raw_body = io.read_bytes(len_body)
            io = Kaitai::Struct::Stream.new(@_raw_body)
            @body = StringsStruct.new(io, self, @_root, @_is_le)
          when :sh_type_dynsym
            @_raw_body = io.read_bytes(len_body)
            io = Kaitai::Struct::Stream.new(@_raw_body)
            @body = DynsymSection.new(io, self, @_root, @_is_le)
          else
            @body = io.read_bytes(len_body)
          end
        else
          case type
          when :sh_type_dynamic
            @_raw_body = io.read_bytes(len_body)
            io = Kaitai::Struct::Stream.new(@_raw_body)
            @body = DynamicSection.new(io, self, @_root, @_is_le)
          when :sh_type_strtab
            @_raw_body = io.read_bytes(len_body)
            io = Kaitai::Struct::Stream.new(@_raw_body)
            @body = StringsStruct.new(io, self, @_root, @_is_le)
          when :sh_type_dynstr
            @_raw_body = io.read_bytes(len_body)
            io = Kaitai::Struct::Stream.new(@_raw_body)
            @body = StringsStruct.new(io, self, @_root, @_is_le)
          when :sh_type_dynsym
            @_raw_body = io.read_bytes(len_body)
            io = Kaitai::Struct::Stream.new(@_raw_body)
            @body = DynsymSection.new(io, self, @_root, @_is_le)
          else
            @body = io.read_bytes(len_body)
          end
        end
        io.seek(_pos)
        @body
      end
      def name
        return @name unless @name.nil?
        io = _root.header.strings._io
        _pos = io.pos
        io.seek(ofs_name)
        if @_is_le
          @name = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
        else
          @name = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
        end
        io.seek(_pos)
        @name
      end
      def flags_obj
        return @flags_obj unless @flags_obj.nil?
        if @_is_le
          @flags_obj = SectionHeaderFlags.new(@_io, self, @_root, flags)
        else
          @flags_obj = SectionHeaderFlags.new(@_io, self, @_root, flags)
        end
        @flags_obj
      end
      attr_reader :ofs_name
      attr_reader :type
      attr_reader :flags
      attr_reader :addr
      attr_reader :ofs_body
      attr_reader :len_body
      attr_reader :linked_section_idx
      attr_reader :info
      attr_reader :align
      attr_reader :entry_size
      attr_reader :_raw_body
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
    class DynsymSection < Kaitai::Struct::Struct
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
          case _root.bits
          when :bits_b32
            @entries << DynsymSectionEntry32.new(@_io, self, @_root, @_is_le)
          when :bits_b64
            @entries << DynsymSectionEntry64.new(@_io, self, @_root, @_is_le)
          end
          i += 1
        end
        self
      end

      def _read_be
        @entries = []
        i = 0
        while not @_io.eof?
          case _root.bits
          when :bits_b32
            @entries << DynsymSectionEntry32.new(@_io, self, @_root, @_is_le)
          when :bits_b64
            @entries << DynsymSectionEntry64.new(@_io, self, @_root, @_is_le)
          end
          i += 1
        end
        self
      end
      attr_reader :entries
    end
    class DynsymSectionEntry32 < Kaitai::Struct::Struct
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
        @value = @_io.read_u4le
        @size = @_io.read_u4le
        @info = @_io.read_u1
        @other = @_io.read_u1
        @shndx = @_io.read_u2le
        self
      end

      def _read_be
        @name_offset = @_io.read_u4be
        @value = @_io.read_u4be
        @size = @_io.read_u4be
        @info = @_io.read_u1
        @other = @_io.read_u1
        @shndx = @_io.read_u2be
        self
      end
      attr_reader :name_offset
      attr_reader :value
      attr_reader :size
      attr_reader :info
      attr_reader :other
      attr_reader :shndx
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
      @_io.seek(section_headers[section_names_idx].ofs_body)
      if @_is_le
        @_raw_strings = @_io.read_bytes(section_headers[section_names_idx].len_body)
        io = Kaitai::Struct::Stream.new(@_raw_strings)
        @strings = StringsStruct.new(io, self, @_root, @_is_le)
      else
        @_raw_strings = @_io.read_bytes(section_headers[section_names_idx].len_body)
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
