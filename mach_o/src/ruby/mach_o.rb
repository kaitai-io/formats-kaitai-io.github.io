# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://www.stonedcoder.org/~kd/lib/MachORuntime.pdf Source
# @see https://opensource.apple.com/source/python_modules/python_modules-43/Modules/macholib-1.5.1/macholib-1.5.1.tar.gz Source
# @see https://github.com/comex/cs/blob/07a88f9/macho_cs.py Source
# @see https://opensource.apple.com/source/Security/Security-55471/libsecurity_codesigning/requirements.grammar.auto.html Source
# @see https://github.com/apple/darwin-xnu/blob/xnu-2782.40.9/bsd/sys/codesign.h Source
# @see https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachO.cpp.auto.html Source
# @see https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachOCompressed.cpp.auto.html Source
class MachO < Kaitai::Struct::Struct

  MAGIC_TYPE = {
    3472551422 => :magic_type_macho_le_x86,
    3489328638 => :magic_type_macho_le_x64,
    4277009102 => :magic_type_macho_be_x86,
    4277009103 => :magic_type_macho_be_x64,
  }
  I__MAGIC_TYPE = MAGIC_TYPE.invert

  CPU_TYPE = {
    1 => :cpu_type_vax,
    2 => :cpu_type_romp,
    4 => :cpu_type_ns32032,
    5 => :cpu_type_ns32332,
    7 => :cpu_type_i386,
    8 => :cpu_type_mips,
    9 => :cpu_type_ns32532,
    11 => :cpu_type_hppa,
    12 => :cpu_type_arm,
    13 => :cpu_type_mc88000,
    14 => :cpu_type_sparc,
    15 => :cpu_type_i860,
    16 => :cpu_type_i860_little,
    17 => :cpu_type_rs6000,
    18 => :cpu_type_powerpc,
    16777216 => :cpu_type_abi64,
    16777223 => :cpu_type_x86_64,
    16777228 => :cpu_type_arm64,
    16777234 => :cpu_type_powerpc64,
    4294967295 => :cpu_type_any,
  }
  I__CPU_TYPE = CPU_TYPE.invert

  FILE_TYPE = {
    1 => :file_type_object,
    2 => :file_type_execute,
    3 => :file_type_fvmlib,
    4 => :file_type_core,
    5 => :file_type_preload,
    6 => :file_type_dylib,
    7 => :file_type_dylinker,
    8 => :file_type_bundle,
    9 => :file_type_dylib_stub,
    10 => :file_type_dsym,
    11 => :file_type_kext_bundle,
  }
  I__FILE_TYPE = FILE_TYPE.invert

  LOAD_COMMAND_TYPE = {
    1 => :load_command_type_segment,
    2 => :load_command_type_symtab,
    3 => :load_command_type_symseg,
    4 => :load_command_type_thread,
    5 => :load_command_type_unix_thread,
    6 => :load_command_type_load_fvm_lib,
    7 => :load_command_type_id_fvm_lib,
    8 => :load_command_type_ident,
    9 => :load_command_type_fvm_file,
    10 => :load_command_type_prepage,
    11 => :load_command_type_dysymtab,
    12 => :load_command_type_load_dylib,
    13 => :load_command_type_id_dylib,
    14 => :load_command_type_load_dylinker,
    15 => :load_command_type_id_dylinker,
    16 => :load_command_type_prebound_dylib,
    17 => :load_command_type_routines,
    18 => :load_command_type_sub_framework,
    19 => :load_command_type_sub_umbrella,
    20 => :load_command_type_sub_client,
    21 => :load_command_type_sub_library,
    22 => :load_command_type_twolevel_hints,
    23 => :load_command_type_prebind_cksum,
    25 => :load_command_type_segment_64,
    26 => :load_command_type_routines_64,
    27 => :load_command_type_uuid,
    29 => :load_command_type_code_signature,
    30 => :load_command_type_segment_split_info,
    32 => :load_command_type_lazy_load_dylib,
    33 => :load_command_type_encryption_info,
    34 => :load_command_type_dyld_info,
    36 => :load_command_type_version_min_macosx,
    37 => :load_command_type_version_min_iphoneos,
    38 => :load_command_type_function_starts,
    39 => :load_command_type_dyld_environment,
    41 => :load_command_type_data_in_code,
    42 => :load_command_type_source_version,
    43 => :load_command_type_dylib_code_sign_drs,
    44 => :load_command_type_encryption_info_64,
    45 => :load_command_type_linker_option,
    46 => :load_command_type_linker_optimization_hint,
    47 => :load_command_type_version_min_tvos,
    48 => :load_command_type_version_min_watchos,
    50 => :load_command_type_build_version,
    2147483648 => :load_command_type_req_dyld,
    2147483672 => :load_command_type_load_weak_dylib,
    2147483676 => :load_command_type_rpath,
    2147483679 => :load_command_type_reexport_dylib,
    2147483682 => :load_command_type_dyld_info_only,
    2147483683 => :load_command_type_load_upward_dylib,
    2147483688 => :load_command_type_main,
  }
  I__LOAD_COMMAND_TYPE = LOAD_COMMAND_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = Kaitai::Struct::Stream::resolve_enum(MAGIC_TYPE, @_io.read_u4be)
    @header = MachHeader.new(@_io, self, @_root)
    @load_commands = []
    (header.ncmds).times { |i|
      @load_commands << LoadCommand.new(@_io, self, @_root)
    }
    self
  end
  class RpathCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @path_offset = @_io.read_u4le
      @path = (@_io.read_bytes_term(0, false, true, true)).force_encoding("utf-8")
      self
    end
    attr_reader :path_offset
    attr_reader :path
  end
  class Uleb128 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @b1 = @_io.read_u1
      if (b1 & 128) != 0
        @b2 = @_io.read_u1
      end
      if (b2 & 128) != 0
        @b3 = @_io.read_u1
      end
      if (b3 & 128) != 0
        @b4 = @_io.read_u1
      end
      if (b4 & 128) != 0
        @b5 = @_io.read_u1
      end
      if (b5 & 128) != 0
        @b6 = @_io.read_u1
      end
      if (b6 & 128) != 0
        @b7 = @_io.read_u1
      end
      if (b7 & 128) != 0
        @b8 = @_io.read_u1
      end
      if (b8 & 128) != 0
        @b9 = @_io.read_u1
      end
      if (b9 & 128) != 0
        @b10 = @_io.read_u1
      end
      self
    end
    def value
      return @value unless @value.nil?
      @value = (((b1 % 128) << 0) + ((b1 & 128) == 0 ? 0 : (((b2 % 128) << 7) + ((b2 & 128) == 0 ? 0 : (((b3 % 128) << 14) + ((b3 & 128) == 0 ? 0 : (((b4 % 128) << 21) + ((b4 & 128) == 0 ? 0 : (((b5 % 128) << 28) + ((b5 & 128) == 0 ? 0 : (((b6 % 128) << 35) + ((b6 & 128) == 0 ? 0 : (((b7 % 128) << 42) + ((b7 & 128) == 0 ? 0 : (((b8 % 128) << 49) + ((b8 & 128) == 0 ? 0 : (((b9 % 128) << 56) + ((b8 & 128) == 0 ? 0 : ((b10 % 128) << 63)))))))))))))))))))
      @value
    end
    attr_reader :b1
    attr_reader :b2
    attr_reader :b3
    attr_reader :b4
    attr_reader :b5
    attr_reader :b6
    attr_reader :b7
    attr_reader :b8
    attr_reader :b9
    attr_reader :b10
  end
  class SourceVersionCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u8le
      self
    end
    attr_reader :version
  end
  class CsBlob < Kaitai::Struct::Struct

    CS_MAGIC = {
      4208855809 => :cs_magic_blob_wrapper,
      4208856064 => :cs_magic_requirement,
      4208856065 => :cs_magic_requirements,
      4208856066 => :cs_magic_code_directory,
      4208856256 => :cs_magic_embedded_signature,
      4208856257 => :cs_magic_detached_signature,
      4208882033 => :cs_magic_entitlements,
      4208882034 => :cs_magic_der_entitlements,
    }
    I__CS_MAGIC = CS_MAGIC.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = Kaitai::Struct::Stream::resolve_enum(CS_MAGIC, @_io.read_u4be)
      @length = @_io.read_u4be
      case magic
      when :cs_magic_requirement
        @_raw_body = @_io.read_bytes((length - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Requirement.new(_io__raw_body, self, @_root)
      when :cs_magic_code_directory
        @_raw_body = @_io.read_bytes((length - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = CodeDirectory.new(_io__raw_body, self, @_root)
      when :cs_magic_requirements
        @_raw_body = @_io.read_bytes((length - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Requirements.new(_io__raw_body, self, @_root)
      when :cs_magic_blob_wrapper
        @_raw_body = @_io.read_bytes((length - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = BlobWrapper.new(_io__raw_body, self, @_root)
      when :cs_magic_embedded_signature
        @_raw_body = @_io.read_bytes((length - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SuperBlob.new(_io__raw_body, self, @_root)
      when :cs_magic_entitlements
        @_raw_body = @_io.read_bytes((length - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Entitlements.new(_io__raw_body, self, @_root)
      when :cs_magic_detached_signature
        @_raw_body = @_io.read_bytes((length - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SuperBlob.new(_io__raw_body, self, @_root)
      when :cs_magic_der_entitlements
        @_raw_body = @_io.read_bytes((length - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Asn1Der.new(_io__raw_body)
      else
        @body = @_io.read_bytes((length - 8))
      end
      self
    end
    class CodeDirectory < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @version = @_io.read_u4be
        @flags = @_io.read_u4be
        @hash_offset = @_io.read_u4be
        @ident_offset = @_io.read_u4be
        @n_special_slots = @_io.read_u4be
        @n_code_slots = @_io.read_u4be
        @code_limit = @_io.read_u4be
        @hash_size = @_io.read_u1
        @hash_type = @_io.read_u1
        @spare1 = @_io.read_u1
        @page_size = @_io.read_u1
        @spare2 = @_io.read_u4be
        if version >= 131328
          @scatter_offset = @_io.read_u4be
        end
        if version >= 131584
          @team_id_offset = @_io.read_u4be
        end
        self
      end
      def ident
        return @ident unless @ident.nil?
        _pos = @_io.pos
        @_io.seek((ident_offset - 8))
        @ident = (@_io.read_bytes_term(0, false, true, true)).force_encoding("utf-8")
        @_io.seek(_pos)
        @ident
      end
      def team_id
        return @team_id unless @team_id.nil?
        _pos = @_io.pos
        @_io.seek((team_id_offset - 8))
        @team_id = (@_io.read_bytes_term(0, false, true, true)).force_encoding("utf-8")
        @_io.seek(_pos)
        @team_id
      end
      def hashes
        return @hashes unless @hashes.nil?
        _pos = @_io.pos
        @_io.seek(((hash_offset - 8) - (hash_size * n_special_slots)))
        @hashes = []
        ((n_special_slots + n_code_slots)).times { |i|
          @hashes << @_io.read_bytes(hash_size)
        }
        @_io.seek(_pos)
        @hashes
      end
      attr_reader :version
      attr_reader :flags
      attr_reader :hash_offset
      attr_reader :ident_offset
      attr_reader :n_special_slots
      attr_reader :n_code_slots
      attr_reader :code_limit
      attr_reader :hash_size
      attr_reader :hash_type
      attr_reader :spare1
      attr_reader :page_size
      attr_reader :spare2
      attr_reader :scatter_offset
      attr_reader :team_id_offset
    end
    class Data < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @length = @_io.read_u4be
        @value = @_io.read_bytes(length)
        @padding = @_io.read_bytes((-(length) % 4))
        self
      end
      attr_reader :length
      attr_reader :value
      attr_reader :padding
    end
    class SuperBlob < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @count = @_io.read_u4be
        @blobs = []
        (count).times { |i|
          @blobs << BlobIndex.new(@_io, self, @_root)
        }
        self
      end
      attr_reader :count
      attr_reader :blobs
    end
    class Expr < Kaitai::Struct::Struct

      OP_ENUM = {
        0 => :op_enum_false,
        1 => :op_enum_true,
        2 => :op_enum_ident,
        3 => :op_enum_apple_anchor,
        4 => :op_enum_anchor_hash,
        5 => :op_enum_info_key_value,
        6 => :op_enum_and_op,
        7 => :op_enum_or_op,
        8 => :op_enum_cd_hash,
        9 => :op_enum_not_op,
        10 => :op_enum_info_key_field,
        11 => :op_enum_cert_field,
        12 => :op_enum_trusted_cert,
        13 => :op_enum_trusted_certs,
        14 => :op_enum_cert_generic,
        15 => :op_enum_apple_generic_anchor,
        16 => :op_enum_entitlement_field,
      }
      I__OP_ENUM = OP_ENUM.invert

      CERT_SLOT = {
        0 => :cert_slot_left_cert,
        4294967295 => :cert_slot_anchor_cert,
      }
      I__CERT_SLOT = CERT_SLOT.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @op = Kaitai::Struct::Stream::resolve_enum(OP_ENUM, @_io.read_u4be)
        case op
        when :op_enum_ident
          @data = IdentExpr.new(@_io, self, @_root)
        when :op_enum_or_op
          @data = OrExpr.new(@_io, self, @_root)
        when :op_enum_info_key_value
          @data = Data.new(@_io, self, @_root)
        when :op_enum_anchor_hash
          @data = AnchorHashExpr.new(@_io, self, @_root)
        when :op_enum_info_key_field
          @data = InfoKeyFieldExpr.new(@_io, self, @_root)
        when :op_enum_not_op
          @data = Expr.new(@_io, self, @_root)
        when :op_enum_entitlement_field
          @data = EntitlementFieldExpr.new(@_io, self, @_root)
        when :op_enum_trusted_cert
          @data = CertSlotExpr.new(@_io, self, @_root)
        when :op_enum_and_op
          @data = AndExpr.new(@_io, self, @_root)
        when :op_enum_cert_generic
          @data = CertGenericExpr.new(@_io, self, @_root)
        when :op_enum_cert_field
          @data = CertFieldExpr.new(@_io, self, @_root)
        when :op_enum_cd_hash
          @data = Data.new(@_io, self, @_root)
        when :op_enum_apple_generic_anchor
          @data = AppleGenericAnchorExpr.new(@_io, self, @_root)
        end
        self
      end
      class InfoKeyFieldExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @data = Data.new(@_io, self, @_root)
          @match = Match.new(@_io, self, @_root)
          self
        end
        attr_reader :data
        attr_reader :match
      end
      class CertSlotExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @value = Kaitai::Struct::Stream::resolve_enum(MachO::CsBlob::Expr::CERT_SLOT, @_io.read_u4be)
          self
        end
        attr_reader :value
      end
      class CertGenericExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @cert_slot = Kaitai::Struct::Stream::resolve_enum(MachO::CsBlob::Expr::CERT_SLOT, @_io.read_u4be)
          @data = Data.new(@_io, self, @_root)
          @match = Match.new(@_io, self, @_root)
          self
        end
        attr_reader :cert_slot
        attr_reader :data
        attr_reader :match
      end
      class IdentExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @identifier = Data.new(@_io, self, @_root)
          self
        end
        attr_reader :identifier
      end
      class CertFieldExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @cert_slot = Kaitai::Struct::Stream::resolve_enum(MachO::CsBlob::Expr::CERT_SLOT, @_io.read_u4be)
          @data = Data.new(@_io, self, @_root)
          @match = Match.new(@_io, self, @_root)
          self
        end
        attr_reader :cert_slot
        attr_reader :data
        attr_reader :match
      end
      class AnchorHashExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @cert_slot = Kaitai::Struct::Stream::resolve_enum(MachO::CsBlob::Expr::CERT_SLOT, @_io.read_u4be)
          @data = Data.new(@_io, self, @_root)
          self
        end
        attr_reader :cert_slot
        attr_reader :data
      end
      class AppleGenericAnchorExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          self
        end
        def value
          return @value unless @value.nil?
          @value = "anchor apple generic"
          @value
        end
      end
      class EntitlementFieldExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @data = Data.new(@_io, self, @_root)
          @match = Match.new(@_io, self, @_root)
          self
        end
        attr_reader :data
        attr_reader :match
      end
      class AndExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @left = Expr.new(@_io, self, @_root)
          @right = Expr.new(@_io, self, @_root)
          self
        end
        attr_reader :left
        attr_reader :right
      end
      class OrExpr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @left = Expr.new(@_io, self, @_root)
          @right = Expr.new(@_io, self, @_root)
          self
        end
        attr_reader :left
        attr_reader :right
      end
      attr_reader :op
      attr_reader :data
    end
    class BlobIndex < Kaitai::Struct::Struct

      CSSLOT_TYPE = {
        0 => :csslot_type_code_directory,
        1 => :csslot_type_info_slot,
        2 => :csslot_type_requirements,
        3 => :csslot_type_resource_dir,
        4 => :csslot_type_application,
        5 => :csslot_type_entitlements,
        7 => :csslot_type_der_entitlements,
        4096 => :csslot_type_alternate_code_directories,
        65536 => :csslot_type_signature_slot,
      }
      I__CSSLOT_TYPE = CSSLOT_TYPE.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @type = Kaitai::Struct::Stream::resolve_enum(CSSLOT_TYPE, @_io.read_u4be)
        @offset = @_io.read_u4be
        self
      end
      def blob
        return @blob unless @blob.nil?
        io = _parent._io
        _pos = io.pos
        io.seek((offset - 8))
        @_raw_blob = io.read_bytes_full
        _io__raw_blob = Kaitai::Struct::Stream.new(@_raw_blob)
        @blob = CsBlob.new(_io__raw_blob, self, @_root)
        io.seek(_pos)
        @blob
      end
      attr_reader :type
      attr_reader :offset
      attr_reader :_raw_blob
    end
    class Match < Kaitai::Struct::Struct

      OP = {
        0 => :op_exists,
        1 => :op_equal,
        2 => :op_contains,
        3 => :op_begins_with,
        4 => :op_ends_with,
        5 => :op_less_than,
        6 => :op_greater_than,
        7 => :op_less_equal,
        8 => :op_greater_equal,
      }
      I__OP = OP.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @match_op = Kaitai::Struct::Stream::resolve_enum(OP, @_io.read_u4be)
        if match_op != :op_exists
          @data = Data.new(@_io, self, @_root)
        end
        self
      end
      attr_reader :match_op
      attr_reader :data
    end
    class Requirement < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @kind = @_io.read_u4be
        @expr = Expr.new(@_io, self, @_root)
        self
      end
      attr_reader :kind
      attr_reader :expr
    end
    class Requirements < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @count = @_io.read_u4be
        @items = []
        (count).times { |i|
          @items << RequirementsBlobIndex.new(@_io, self, @_root)
        }
        self
      end
      attr_reader :count
      attr_reader :items
    end
    class BlobWrapper < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @data = @_io.read_bytes_full
        self
      end
      attr_reader :data
    end
    class Entitlements < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @data = @_io.read_bytes_full
        self
      end
      attr_reader :data
    end
    class RequirementsBlobIndex < Kaitai::Struct::Struct

      REQUIREMENT_TYPE = {
        1 => :requirement_type_host,
        2 => :requirement_type_guest,
        3 => :requirement_type_designated,
        4 => :requirement_type_library,
      }
      I__REQUIREMENT_TYPE = REQUIREMENT_TYPE.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @type = Kaitai::Struct::Stream::resolve_enum(REQUIREMENT_TYPE, @_io.read_u4be)
        @offset = @_io.read_u4be
        self
      end
      def value
        return @value unless @value.nil?
        _pos = @_io.pos
        @_io.seek((offset - 8))
        @value = CsBlob.new(@_io, self, @_root)
        @_io.seek(_pos)
        @value
      end
      attr_reader :type
      attr_reader :offset
    end
    attr_reader :magic
    attr_reader :length
    attr_reader :body
    attr_reader :_raw_body
  end
  class BuildVersionCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @platform = @_io.read_u4le
      @minos = @_io.read_u4le
      @sdk = @_io.read_u4le
      @ntools = @_io.read_u4le
      @tools = []
      (ntools).times { |i|
        @tools << BuildToolVersion.new(@_io, self, @_root)
      }
      self
    end
    class BuildToolVersion < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @tool = @_io.read_u4le
        @version = @_io.read_u4le
        self
      end
      attr_reader :tool
      attr_reader :version
    end
    attr_reader :platform
    attr_reader :minos
    attr_reader :sdk
    attr_reader :ntools
    attr_reader :tools
  end
  class RoutinesCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @init_address = @_io.read_u4le
      @init_module = @_io.read_u4le
      @reserved = @_io.read_bytes(24)
      self
    end
    attr_reader :init_address
    attr_reader :init_module
    attr_reader :reserved
  end
  class MachoFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, value)
      super(_io, _parent, _root)
      @value = value
      _read
    end

    def _read
      self
    end

    ##
    # safe to divide up the sections into sub-sections via symbols for dead code stripping
    def subsections_via_symbols
      return @subsections_via_symbols unless @subsections_via_symbols.nil?
      @subsections_via_symbols = (value & 8192) != 0
      @subsections_via_symbols
    end
    def dead_strippable_dylib
      return @dead_strippable_dylib unless @dead_strippable_dylib.nil?
      @dead_strippable_dylib = (value & 4194304) != 0
      @dead_strippable_dylib
    end

    ##
    # the final linked image contains external weak symbols
    def weak_defines
      return @weak_defines unless @weak_defines.nil?
      @weak_defines = (value & 32768) != 0
      @weak_defines
    end

    ##
    # the file has its dynamic undefined references prebound.
    def prebound
      return @prebound unless @prebound.nil?
      @prebound = (value & 16) != 0
      @prebound
    end

    ##
    # indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set.
    def all_mods_bound
      return @all_mods_bound unless @all_mods_bound.nil?
      @all_mods_bound = (value & 4096) != 0
      @all_mods_bound
    end
    def has_tlv_descriptors
      return @has_tlv_descriptors unless @has_tlv_descriptors.nil?
      @has_tlv_descriptors = (value & 8388608) != 0
      @has_tlv_descriptors
    end

    ##
    # the executable is forcing all images to use flat name space bindings
    def force_flat
      return @force_flat unless @force_flat.nil?
      @force_flat = (value & 256) != 0
      @force_flat
    end

    ##
    # When this bit is set, the binary declares it is safe for use in processes with uid zero
    def root_safe
      return @root_safe unless @root_safe.nil?
      @root_safe = (value & 262144) != 0
      @root_safe
    end

    ##
    # the object file has no undefined references
    def no_undefs
      return @no_undefs unless @no_undefs.nil?
      @no_undefs = (value & 1) != 0
      @no_undefs
    end

    ##
    # When this bit is set, the binary declares it is safe for use in processes when issetugid() is true
    def setuid_safe
      return @setuid_safe unless @setuid_safe.nil?
      @setuid_safe = (value & 524288) != 0
      @setuid_safe
    end
    def no_heap_execution
      return @no_heap_execution unless @no_heap_execution.nil?
      @no_heap_execution = (value & 16777216) != 0
      @no_heap_execution
    end

    ##
    # When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported
    def no_reexported_dylibs
      return @no_reexported_dylibs unless @no_reexported_dylibs.nil?
      @no_reexported_dylibs = (value & 1048576) != 0
      @no_reexported_dylibs
    end

    ##
    # this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used.
    def no_multi_defs
      return @no_multi_defs unless @no_multi_defs.nil?
      @no_multi_defs = (value & 512) != 0
      @no_multi_defs
    end
    def app_extension_safe
      return @app_extension_safe unless @app_extension_safe.nil?
      @app_extension_safe = (value & 33554432) != 0
      @app_extension_safe
    end

    ##
    # the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set.
    def prebindable
      return @prebindable unless @prebindable.nil?
      @prebindable = (value & 2048) != 0
      @prebindable
    end

    ##
    # the object file is the output of an incremental link against a base file and can't be link edited again
    def incr_link
      return @incr_link unless @incr_link.nil?
      @incr_link = (value & 2) != 0
      @incr_link
    end

    ##
    # the object file's undefined references are bound by the dynamic linker when loaded.
    def bind_at_load
      return @bind_at_load unless @bind_at_load.nil?
      @bind_at_load = (value & 8) != 0
      @bind_at_load
    end

    ##
    # the binary has been canonicalized via the unprebind operation
    def canonical
      return @canonical unless @canonical.nil?
      @canonical = (value & 16384) != 0
      @canonical
    end

    ##
    # the image is using two-level name space bindings
    def two_level
      return @two_level unless @two_level.nil?
      @two_level = (value & 128) != 0
      @two_level
    end

    ##
    # the file has its read-only and read-write segments split
    def split_segs
      return @split_segs unless @split_segs.nil?
      @split_segs = (value & 32) != 0
      @split_segs
    end

    ##
    # the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete)
    def lazy_init
      return @lazy_init unless @lazy_init.nil?
      @lazy_init = (value & 64) != 0
      @lazy_init
    end

    ##
    # When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes.
    def allow_stack_execution
      return @allow_stack_execution unless @allow_stack_execution.nil?
      @allow_stack_execution = (value & 131072) != 0
      @allow_stack_execution
    end

    ##
    # the final linked image uses weak symbols
    def binds_to_weak
      return @binds_to_weak unless @binds_to_weak.nil?
      @binds_to_weak = (value & 65536) != 0
      @binds_to_weak
    end

    ##
    # do not have dyld notify the prebinding agent about this executable
    def no_fix_prebinding
      return @no_fix_prebinding unless @no_fix_prebinding.nil?
      @no_fix_prebinding = (value & 1024) != 0
      @no_fix_prebinding
    end

    ##
    # the object file is input for the dynamic linker and can't be staticly link edited again
    def dyld_link
      return @dyld_link unless @dyld_link.nil?
      @dyld_link = (value & 4) != 0
      @dyld_link
    end

    ##
    # When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes.
    def pie
      return @pie unless @pie.nil?
      @pie = (value & 2097152) != 0
      @pie
    end
    attr_reader :value
  end
  class RoutinesCommand64 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @init_address = @_io.read_u8le
      @init_module = @_io.read_u8le
      @reserved = @_io.read_bytes(48)
      self
    end
    attr_reader :init_address
    attr_reader :init_module
    attr_reader :reserved
  end
  class LinkerOptionCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_strings = @_io.read_u4le
      @strings = []
      (num_strings).times { |i|
        @strings << (@_io.read_bytes_term(0, false, true, true)).force_encoding("utf-8")
      }
      self
    end
    attr_reader :num_strings
    attr_reader :strings
  end
  class SegmentCommand64 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @segname = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(16), 0)).force_encoding("ascii")
      @vmaddr = @_io.read_u8le
      @vmsize = @_io.read_u8le
      @fileoff = @_io.read_u8le
      @filesize = @_io.read_u8le
      @maxprot = VmProt.new(@_io, self, @_root)
      @initprot = VmProt.new(@_io, self, @_root)
      @nsects = @_io.read_u4le
      @flags = @_io.read_u4le
      @sections = []
      (nsects).times { |i|
        @sections << Section64.new(@_io, self, @_root)
      }
      self
    end
    class Section64 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @sect_name = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(16), 0)).force_encoding("ascii")
        @seg_name = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(16), 0)).force_encoding("ascii")
        @addr = @_io.read_u8le
        @size = @_io.read_u8le
        @offset = @_io.read_u4le
        @align = @_io.read_u4le
        @reloff = @_io.read_u4le
        @nreloc = @_io.read_u4le
        @flags = @_io.read_u4le
        @reserved1 = @_io.read_u4le
        @reserved2 = @_io.read_u4le
        @reserved3 = @_io.read_u4le
        self
      end
      class CfStringList < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @items = []
          i = 0
          while not @_io.eof?
            @items << CfString.new(@_io, self, @_root)
            i += 1
          end
          self
        end
        attr_reader :items
      end
      class CfString < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @isa = @_io.read_u8le
          @info = @_io.read_u8le
          @data = @_io.read_u8le
          @length = @_io.read_u8le
          self
        end
        attr_reader :isa
        attr_reader :info
        attr_reader :data
        attr_reader :length
      end
      class EhFrameItem < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @length = @_io.read_u4le
          if length == 4294967295
            @length64 = @_io.read_u8le
          end
          @id = @_io.read_u4le
          if length > 0
            case id
            when 0
              @_raw_body = @_io.read_bytes((length - 4))
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = Cie.new(_io__raw_body, self, @_root)
            else
              @body = @_io.read_bytes((length - 4))
            end
          end
          self
        end
        class CharChain < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @chr = @_io.read_u1
            if chr != 0
              @next = CharChain.new(@_io, self, @_root)
            end
            self
          end
          attr_reader :chr
          attr_reader :next
        end
        class Cie < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @version = @_io.read_u1
            @aug_str = CharChain.new(@_io, self, @_root)
            @code_alignment_factor = Uleb128.new(@_io, self, @_root)
            @data_alignment_factor = Uleb128.new(@_io, self, @_root)
            @return_address_register = @_io.read_u1
            if aug_str.chr == 122
              @augmentation = AugmentationEntry.new(@_io, self, @_root)
            end
            self
          end
          attr_reader :version
          attr_reader :aug_str
          attr_reader :code_alignment_factor
          attr_reader :data_alignment_factor
          attr_reader :return_address_register
          attr_reader :augmentation
        end
        class AugmentationEntry < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @length = Uleb128.new(@_io, self, @_root)
            if _parent.aug_str.next.chr == 82
              @fde_pointer_encoding = @_io.read_u1
            end
            self
          end
          attr_reader :length
          attr_reader :fde_pointer_encoding
        end
        attr_reader :length
        attr_reader :length64
        attr_reader :id
        attr_reader :body
        attr_reader :_raw_body
      end
      class EhFrame < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @items = []
          i = 0
          while not @_io.eof?
            @items << EhFrameItem.new(@_io, self, @_root)
            i += 1
          end
          self
        end
        attr_reader :items
      end
      class PointerList < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @items = []
          i = 0
          while not @_io.eof?
            @items << @_io.read_u8le
            i += 1
          end
          self
        end
        attr_reader :items
      end
      class StringList < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @strings = []
          i = 0
          while not @_io.eof?
            @strings << (@_io.read_bytes_term(0, false, true, true)).force_encoding("ascii")
            i += 1
          end
          self
        end
        attr_reader :strings
      end
      def data
        return @data unless @data.nil?
        io = _root._io
        _pos = io.pos
        io.seek(offset)
        case sect_name
        when "__objc_nlclslist"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__objc_methname"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = StringList.new(_io__raw_data, self, @_root)
        when "__nl_symbol_ptr"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__la_symbol_ptr"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__objc_selrefs"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__cstring"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = StringList.new(_io__raw_data, self, @_root)
        when "__objc_classlist"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__objc_protolist"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__objc_imageinfo"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__objc_methtype"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = StringList.new(_io__raw_data, self, @_root)
        when "__cfstring"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = CfStringList.new(_io__raw_data, self, @_root)
        when "__objc_classrefs"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__objc_protorefs"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__objc_classname"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = StringList.new(_io__raw_data, self, @_root)
        when "__got"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        when "__eh_frame"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = EhFrame.new(_io__raw_data, self, @_root)
        when "__objc_superrefs"
          @_raw_data = io.read_bytes(size)
          _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
          @data = PointerList.new(_io__raw_data, self, @_root)
        else
          @data = io.read_bytes(size)
        end
        io.seek(_pos)
        @data
      end
      attr_reader :sect_name
      attr_reader :seg_name
      attr_reader :addr
      attr_reader :size
      attr_reader :offset
      attr_reader :align
      attr_reader :reloff
      attr_reader :nreloc
      attr_reader :flags
      attr_reader :reserved1
      attr_reader :reserved2
      attr_reader :reserved3
      attr_reader :_raw_data
    end
    attr_reader :segname
    attr_reader :vmaddr
    attr_reader :vmsize
    attr_reader :fileoff
    attr_reader :filesize
    attr_reader :maxprot
    attr_reader :initprot
    attr_reader :nsects
    attr_reader :flags
    attr_reader :sections
  end
  class VmProt < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @strip_read = @_io.read_bits_int_be(1) != 0
      @is_mask = @_io.read_bits_int_be(1) != 0
      @reserved0 = @_io.read_bits_int_be(1) != 0
      @copy = @_io.read_bits_int_be(1) != 0
      @no_change = @_io.read_bits_int_be(1) != 0
      @execute = @_io.read_bits_int_be(1) != 0
      @write = @_io.read_bits_int_be(1) != 0
      @read = @_io.read_bits_int_be(1) != 0
      @reserved1 = @_io.read_bits_int_be(24)
      self
    end

    ##
    # Special marker to support execute-only protection.
    attr_reader :strip_read

    ##
    # Indicates to use value as a mask against the actual protection bits.
    attr_reader :is_mask

    ##
    # Reserved (unused) bit.
    attr_reader :reserved0

    ##
    # Used when write permission can not be obtained, to mark the entry as COW.
    attr_reader :copy

    ##
    # Used only by memory_object_lock_request to indicate no change to page locks.
    attr_reader :no_change

    ##
    # Execute permission.
    attr_reader :execute

    ##
    # Write permission.
    attr_reader :write

    ##
    # Read permission.
    attr_reader :read

    ##
    # Reserved (unused) bits.
    attr_reader :reserved1
  end
  class DysymtabCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @i_local_sym = @_io.read_u4le
      @n_local_sym = @_io.read_u4le
      @i_ext_def_sym = @_io.read_u4le
      @n_ext_def_sym = @_io.read_u4le
      @i_undef_sym = @_io.read_u4le
      @n_undef_sym = @_io.read_u4le
      @toc_off = @_io.read_u4le
      @n_toc = @_io.read_u4le
      @mod_tab_off = @_io.read_u4le
      @n_mod_tab = @_io.read_u4le
      @ext_ref_sym_off = @_io.read_u4le
      @n_ext_ref_syms = @_io.read_u4le
      @indirect_sym_off = @_io.read_u4le
      @n_indirect_syms = @_io.read_u4le
      @ext_rel_off = @_io.read_u4le
      @n_ext_rel = @_io.read_u4le
      @loc_rel_off = @_io.read_u4le
      @n_loc_rel = @_io.read_u4le
      self
    end
    def indirect_symbols
      return @indirect_symbols unless @indirect_symbols.nil?
      io = _root._io
      _pos = io.pos
      io.seek(indirect_sym_off)
      @indirect_symbols = []
      (n_indirect_syms).times { |i|
        @indirect_symbols << io.read_u4le
      }
      io.seek(_pos)
      @indirect_symbols
    end
    attr_reader :i_local_sym
    attr_reader :n_local_sym
    attr_reader :i_ext_def_sym
    attr_reader :n_ext_def_sym
    attr_reader :i_undef_sym
    attr_reader :n_undef_sym
    attr_reader :toc_off
    attr_reader :n_toc
    attr_reader :mod_tab_off
    attr_reader :n_mod_tab
    attr_reader :ext_ref_sym_off
    attr_reader :n_ext_ref_syms
    attr_reader :indirect_sym_off
    attr_reader :n_indirect_syms
    attr_reader :ext_rel_off
    attr_reader :n_ext_rel
    attr_reader :loc_rel_off
    attr_reader :n_loc_rel
  end
  class MachHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cputype = Kaitai::Struct::Stream::resolve_enum(MachO::CPU_TYPE, @_io.read_u4le)
      @cpusubtype = @_io.read_u4le
      @filetype = Kaitai::Struct::Stream::resolve_enum(MachO::FILE_TYPE, @_io.read_u4le)
      @ncmds = @_io.read_u4le
      @sizeofcmds = @_io.read_u4le
      @flags = @_io.read_u4le
      if  ((_root.magic == :magic_type_macho_be_x64) || (_root.magic == :magic_type_macho_le_x64)) 
        @reserved = @_io.read_u4le
      end
      self
    end
    def flags_obj
      return @flags_obj unless @flags_obj.nil?
      @flags_obj = MachoFlags.new(@_io, self, @_root, flags)
      @flags_obj
    end
    attr_reader :cputype
    attr_reader :cpusubtype
    attr_reader :filetype
    attr_reader :ncmds
    attr_reader :sizeofcmds
    attr_reader :flags
    attr_reader :reserved
  end
  class LinkeditDataCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data_off = @_io.read_u4le
      @data_size = @_io.read_u4le
      self
    end
    attr_reader :data_off
    attr_reader :data_size
  end
  class SubCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = LcStr.new(@_io, self, @_root)
      self
    end
    attr_reader :name
  end
  class TwolevelHintsCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @offset = @_io.read_u4le
      @num_hints = @_io.read_u4le
      self
    end
    attr_reader :offset
    attr_reader :num_hints
  end
  class Version < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @p1 = @_io.read_u1
      @minor = @_io.read_u1
      @major = @_io.read_u1
      @release = @_io.read_u1
      self
    end
    attr_reader :p1
    attr_reader :minor
    attr_reader :major
    attr_reader :release
  end
  class EncryptionInfoCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cryptoff = @_io.read_u4le
      @cryptsize = @_io.read_u4le
      @cryptid = @_io.read_u4le
      if  ((_root.magic == :magic_type_macho_be_x64) || (_root.magic == :magic_type_macho_le_x64)) 
        @pad = @_io.read_u4le
      end
      self
    end
    attr_reader :cryptoff
    attr_reader :cryptsize
    attr_reader :cryptid
    attr_reader :pad
  end
  class CodeSignatureCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data_off = @_io.read_u4le
      @data_size = @_io.read_u4le
      self
    end
    def code_signature
      return @code_signature unless @code_signature.nil?
      io = _root._io
      _pos = io.pos
      io.seek(data_off)
      @_raw_code_signature = io.read_bytes(data_size)
      _io__raw_code_signature = Kaitai::Struct::Stream.new(@_raw_code_signature)
      @code_signature = CsBlob.new(_io__raw_code_signature, self, @_root)
      io.seek(_pos)
      @code_signature
    end
    attr_reader :data_off
    attr_reader :data_size
    attr_reader :_raw_code_signature
  end
  class DyldInfoCommand < Kaitai::Struct::Struct

    BIND_OPCODE = {
      0 => :bind_opcode_done,
      16 => :bind_opcode_set_dylib_ordinal_immediate,
      32 => :bind_opcode_set_dylib_ordinal_uleb,
      48 => :bind_opcode_set_dylib_special_immediate,
      64 => :bind_opcode_set_symbol_trailing_flags_immediate,
      80 => :bind_opcode_set_type_immediate,
      96 => :bind_opcode_set_append_sleb,
      112 => :bind_opcode_set_segment_and_offset_uleb,
      128 => :bind_opcode_add_address_uleb,
      144 => :bind_opcode_do_bind,
      160 => :bind_opcode_do_bind_add_address_uleb,
      176 => :bind_opcode_do_bind_add_address_immediate_scaled,
      192 => :bind_opcode_do_bind_uleb_times_skipping_uleb,
    }
    I__BIND_OPCODE = BIND_OPCODE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @rebase_off = @_io.read_u4le
      @rebase_size = @_io.read_u4le
      @bind_off = @_io.read_u4le
      @bind_size = @_io.read_u4le
      @weak_bind_off = @_io.read_u4le
      @weak_bind_size = @_io.read_u4le
      @lazy_bind_off = @_io.read_u4le
      @lazy_bind_size = @_io.read_u4le
      @export_off = @_io.read_u4le
      @export_size = @_io.read_u4le
      self
    end
    class RebaseData < Kaitai::Struct::Struct

      OPCODE = {
        0 => :opcode_done,
        16 => :opcode_set_type_immediate,
        32 => :opcode_set_segment_and_offset_uleb,
        48 => :opcode_add_address_uleb,
        64 => :opcode_add_address_immediate_scaled,
        80 => :opcode_do_rebase_immediate_times,
        96 => :opcode_do_rebase_uleb_times,
        112 => :opcode_do_rebase_add_address_uleb,
        128 => :opcode_do_rebase_uleb_times_skipping_uleb,
      }
      I__OPCODE = OPCODE.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @items = []
        i = 0
        begin
          _ = RebaseItem.new(@_io, self, @_root)
          @items << _
          i += 1
        end until _.opcode == :opcode_done
        self
      end
      class RebaseItem < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @opcode_and_immediate = @_io.read_u1
          if  ((opcode == :opcode_set_segment_and_offset_uleb) || (opcode == :opcode_add_address_uleb) || (opcode == :opcode_do_rebase_uleb_times) || (opcode == :opcode_do_rebase_add_address_uleb) || (opcode == :opcode_do_rebase_uleb_times_skipping_uleb)) 
            @uleb = Uleb128.new(@_io, self, @_root)
          end
          if opcode == :opcode_do_rebase_uleb_times_skipping_uleb
            @skip = Uleb128.new(@_io, self, @_root)
          end
          self
        end
        def opcode
          return @opcode unless @opcode.nil?
          @opcode = Kaitai::Struct::Stream::resolve_enum(MachO::DyldInfoCommand::RebaseData::OPCODE, (opcode_and_immediate & 240))
          @opcode
        end
        def immediate
          return @immediate unless @immediate.nil?
          @immediate = (opcode_and_immediate & 15)
          @immediate
        end
        attr_reader :opcode_and_immediate
        attr_reader :uleb
        attr_reader :skip
      end
      attr_reader :items
    end
    class BindItem < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @opcode_and_immediate = @_io.read_u1
        if  ((opcode == :bind_opcode_set_dylib_ordinal_uleb) || (opcode == :bind_opcode_set_append_sleb) || (opcode == :bind_opcode_set_segment_and_offset_uleb) || (opcode == :bind_opcode_add_address_uleb) || (opcode == :bind_opcode_do_bind_add_address_uleb) || (opcode == :bind_opcode_do_bind_uleb_times_skipping_uleb)) 
          @uleb = Uleb128.new(@_io, self, @_root)
        end
        if opcode == :bind_opcode_do_bind_uleb_times_skipping_uleb
          @skip = Uleb128.new(@_io, self, @_root)
        end
        if opcode == :bind_opcode_set_symbol_trailing_flags_immediate
          @symbol = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ascii")
        end
        self
      end
      def opcode
        return @opcode unless @opcode.nil?
        @opcode = Kaitai::Struct::Stream::resolve_enum(MachO::DyldInfoCommand::BIND_OPCODE, (opcode_and_immediate & 240))
        @opcode
      end
      def immediate
        return @immediate unless @immediate.nil?
        @immediate = (opcode_and_immediate & 15)
        @immediate
      end
      attr_reader :opcode_and_immediate
      attr_reader :uleb
      attr_reader :skip
      attr_reader :symbol
    end
    class BindData < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @items = []
        i = 0
        while not @_io.eof?
          @items << BindItem.new(@_io, self, @_root)
          i += 1
        end
        self
      end
      attr_reader :items
    end
    class ExportNode < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @terminal_size = Uleb128.new(@_io, self, @_root)
        @children_count = @_io.read_u1
        @children = []
        (children_count).times { |i|
          @children << Child.new(@_io, self, @_root)
        }
        @terminal = @_io.read_bytes(terminal_size.value)
        self
      end
      class Child < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ascii")
          @node_offset = Uleb128.new(@_io, self, @_root)
          self
        end
        def value
          return @value unless @value.nil?
          _pos = @_io.pos
          @_io.seek(node_offset.value)
          @value = ExportNode.new(@_io, self, @_root)
          @_io.seek(_pos)
          @value
        end
        attr_reader :name
        attr_reader :node_offset
      end
      attr_reader :terminal_size
      attr_reader :children_count
      attr_reader :children
      attr_reader :terminal
    end
    def bind
      return @bind unless @bind.nil?
      if bind_size != 0
        io = _root._io
        _pos = io.pos
        io.seek(bind_off)
        @_raw_bind = io.read_bytes(bind_size)
        _io__raw_bind = Kaitai::Struct::Stream.new(@_raw_bind)
        @bind = BindData.new(_io__raw_bind, self, @_root)
        io.seek(_pos)
      end
      @bind
    end
    def exports
      return @exports unless @exports.nil?
      if export_size != 0
        io = _root._io
        _pos = io.pos
        io.seek(export_off)
        @_raw_exports = io.read_bytes(export_size)
        _io__raw_exports = Kaitai::Struct::Stream.new(@_raw_exports)
        @exports = ExportNode.new(_io__raw_exports, self, @_root)
        io.seek(_pos)
      end
      @exports
    end
    def weak_bind
      return @weak_bind unless @weak_bind.nil?
      if weak_bind_size != 0
        io = _root._io
        _pos = io.pos
        io.seek(weak_bind_off)
        @_raw_weak_bind = io.read_bytes(weak_bind_size)
        _io__raw_weak_bind = Kaitai::Struct::Stream.new(@_raw_weak_bind)
        @weak_bind = BindData.new(_io__raw_weak_bind, self, @_root)
        io.seek(_pos)
      end
      @weak_bind
    end
    def rebase
      return @rebase unless @rebase.nil?
      if rebase_size != 0
        io = _root._io
        _pos = io.pos
        io.seek(rebase_off)
        @_raw_rebase = io.read_bytes(rebase_size)
        _io__raw_rebase = Kaitai::Struct::Stream.new(@_raw_rebase)
        @rebase = RebaseData.new(_io__raw_rebase, self, @_root)
        io.seek(_pos)
      end
      @rebase
    end
    def lazy_bind
      return @lazy_bind unless @lazy_bind.nil?
      if lazy_bind_size != 0
        io = _root._io
        _pos = io.pos
        io.seek(lazy_bind_off)
        @_raw_lazy_bind = io.read_bytes(lazy_bind_size)
        _io__raw_lazy_bind = Kaitai::Struct::Stream.new(@_raw_lazy_bind)
        @lazy_bind = BindData.new(_io__raw_lazy_bind, self, @_root)
        io.seek(_pos)
      end
      @lazy_bind
    end
    attr_reader :rebase_off
    attr_reader :rebase_size
    attr_reader :bind_off
    attr_reader :bind_size
    attr_reader :weak_bind_off
    attr_reader :weak_bind_size
    attr_reader :lazy_bind_off
    attr_reader :lazy_bind_size
    attr_reader :export_off
    attr_reader :export_size
    attr_reader :_raw_bind
    attr_reader :_raw_exports
    attr_reader :_raw_weak_bind
    attr_reader :_raw_rebase
    attr_reader :_raw_lazy_bind
  end
  class DylinkerCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = LcStr.new(@_io, self, @_root)
      self
    end
    attr_reader :name
  end
  class DylibCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name_offset = @_io.read_u4le
      @timestamp = @_io.read_u4le
      @current_version = @_io.read_u4le
      @compatibility_version = @_io.read_u4le
      @name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("utf-8")
      self
    end
    attr_reader :name_offset
    attr_reader :timestamp
    attr_reader :current_version
    attr_reader :compatibility_version
    attr_reader :name
  end
  class SegmentCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @segname = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(16), 0)).force_encoding("ascii")
      @vmaddr = @_io.read_u4le
      @vmsize = @_io.read_u4le
      @fileoff = @_io.read_u4le
      @filesize = @_io.read_u4le
      @maxprot = VmProt.new(@_io, self, @_root)
      @initprot = VmProt.new(@_io, self, @_root)
      @nsects = @_io.read_u4le
      @flags = @_io.read_u4le
      @sections = []
      (nsects).times { |i|
        @sections << Section.new(@_io, self, @_root)
      }
      self
    end
    class Section < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @sect_name = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(16), 0)).force_encoding("ascii")
        @seg_name = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(16), 0)).force_encoding("ascii")
        @addr = @_io.read_u4le
        @size = @_io.read_u4le
        @offset = @_io.read_u4le
        @align = @_io.read_u4le
        @reloff = @_io.read_u4le
        @nreloc = @_io.read_u4le
        @flags = @_io.read_u4le
        @reserved1 = @_io.read_u4le
        @reserved2 = @_io.read_u4le
        self
      end
      def data
        return @data unless @data.nil?
        io = _root._io
        _pos = io.pos
        io.seek(offset)
        @data = io.read_bytes(size)
        io.seek(_pos)
        @data
      end
      attr_reader :sect_name
      attr_reader :seg_name
      attr_reader :addr
      attr_reader :size
      attr_reader :offset
      attr_reader :align
      attr_reader :reloff
      attr_reader :nreloc
      attr_reader :flags
      attr_reader :reserved1
      attr_reader :reserved2
    end
    attr_reader :segname
    attr_reader :vmaddr
    attr_reader :vmsize
    attr_reader :fileoff
    attr_reader :filesize
    attr_reader :maxprot
    attr_reader :initprot
    attr_reader :nsects
    attr_reader :flags
    attr_reader :sections
  end
  class LcStr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length = @_io.read_u4le
      @value = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      self
    end
    attr_reader :length
    attr_reader :value
  end
  class LoadCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(MachO::LOAD_COMMAND_TYPE, @_io.read_u4le)
      @size = @_io.read_u4le
      case type
      when :load_command_type_id_dylinker
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DylinkerCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_reexport_dylib
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DylibCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_build_version
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = BuildVersionCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_source_version
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SourceVersionCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_function_starts
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = LinkeditDataCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_rpath
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = RpathCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_sub_framework
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SubCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_routines
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = RoutinesCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_sub_library
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SubCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_dyld_info_only
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DyldInfoCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_dyld_environment
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DylinkerCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_load_dylinker
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DylinkerCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_segment_split_info
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = LinkeditDataCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_main
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = EntryPointCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_load_dylib
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DylibCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_encryption_info
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = EncryptionInfoCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_dysymtab
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DysymtabCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_twolevel_hints
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = TwolevelHintsCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_encryption_info_64
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = EncryptionInfoCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_linker_option
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = LinkerOptionCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_dyld_info
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DyldInfoCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_version_min_tvos
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = VersionMinCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_load_upward_dylib
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DylibCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_segment_64
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SegmentCommand64.new(_io__raw_body, self, @_root)
      when :load_command_type_segment
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SegmentCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_sub_umbrella
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SubCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_version_min_watchos
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = VersionMinCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_routines_64
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = RoutinesCommand64.new(_io__raw_body, self, @_root)
      when :load_command_type_id_dylib
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DylibCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_sub_client
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SubCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_dylib_code_sign_drs
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = LinkeditDataCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_symtab
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SymtabCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_linker_optimization_hint
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = LinkeditDataCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_data_in_code
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = LinkeditDataCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_code_signature
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = CodeSignatureCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_version_min_iphoneos
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = VersionMinCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_load_weak_dylib
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DylibCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_lazy_load_dylib
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DylibCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_uuid
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = UuidCommand.new(_io__raw_body, self, @_root)
      when :load_command_type_version_min_macosx
        @_raw_body = @_io.read_bytes((size - 8))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = VersionMinCommand.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes((size - 8))
      end
      self
    end
    attr_reader :type
    attr_reader :size
    attr_reader :body
    attr_reader :_raw_body
  end
  class UuidCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @uuid = @_io.read_bytes(16)
      self
    end
    attr_reader :uuid
  end
  class SymtabCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sym_off = @_io.read_u4le
      @n_syms = @_io.read_u4le
      @str_off = @_io.read_u4le
      @str_size = @_io.read_u4le
      self
    end
    class StrTable < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @unknown = @_io.read_u4le
        @items = []
        i = 0
        begin
          _ = (@_io.read_bytes_term(0, false, true, false)).force_encoding("utf-8")
          @items << _
          i += 1
        end until _ == ""
        self
      end
      attr_reader :unknown
      attr_reader :items
    end
    class Nlist64 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @un = @_io.read_u4le
        @type = @_io.read_u1
        @sect = @_io.read_u1
        @desc = @_io.read_u2le
        @value = @_io.read_u8le
        self
      end
      def name
        return @name unless @name.nil?
        if un != 0
          _pos = @_io.pos
          @_io.seek((_parent.str_off + un))
          @name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("utf-8")
          @_io.seek(_pos)
        end
        @name
      end
      attr_reader :un
      attr_reader :type
      attr_reader :sect
      attr_reader :desc
      attr_reader :value
    end
    class Nlist < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @un = @_io.read_u4le
        @type = @_io.read_u1
        @sect = @_io.read_u1
        @desc = @_io.read_u2le
        @value = @_io.read_u4le
        self
      end
      def name
        return @name unless @name.nil?
        if un != 0
          _pos = @_io.pos
          @_io.seek((_parent.str_off + un))
          @name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("utf-8")
          @_io.seek(_pos)
        end
        @name
      end
      attr_reader :un
      attr_reader :type
      attr_reader :sect
      attr_reader :desc
      attr_reader :value
    end
    def symbols
      return @symbols unless @symbols.nil?
      io = _root._io
      _pos = io.pos
      io.seek(sym_off)
      @symbols = []
      (n_syms).times { |i|
        case _root.magic
        when :magic_type_macho_le_x64
          @symbols << Nlist64.new(io, self, @_root)
        when :magic_type_macho_be_x64
          @symbols << Nlist64.new(io, self, @_root)
        when :magic_type_macho_le_x86
          @symbols << Nlist.new(io, self, @_root)
        when :magic_type_macho_be_x86
          @symbols << Nlist.new(io, self, @_root)
        end
      }
      io.seek(_pos)
      @symbols
    end
    def strs
      return @strs unless @strs.nil?
      io = _root._io
      _pos = io.pos
      io.seek(str_off)
      @_raw_strs = io.read_bytes(str_size)
      _io__raw_strs = Kaitai::Struct::Stream.new(@_raw_strs)
      @strs = StrTable.new(_io__raw_strs, self, @_root)
      io.seek(_pos)
      @strs
    end
    attr_reader :sym_off
    attr_reader :n_syms
    attr_reader :str_off
    attr_reader :str_size
    attr_reader :_raw_strs
  end
  class VersionMinCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = Version.new(@_io, self, @_root)
      @sdk = Version.new(@_io, self, @_root)
      self
    end
    attr_reader :version
    attr_reader :sdk
  end
  class EntryPointCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entry_off = @_io.read_u8le
      @stack_size = @_io.read_u8le
      self
    end
    attr_reader :entry_off
    attr_reader :stack_size
  end
  attr_reader :magic
  attr_reader :header
  attr_reader :load_commands
end
