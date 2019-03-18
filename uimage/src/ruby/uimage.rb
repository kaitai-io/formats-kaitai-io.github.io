# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The new uImage format allows more flexibility in handling images of various
# types (kernel, ramdisk, etc.), it also enhances integrity protection of images
# with sha1 and md5 checksums.
# @see https://github.com/EmcraftSystems/u-boot/blob/master/include/image.h Source
class Uimage < Kaitai::Struct::Struct

  UIMAGE_OS = {
    0 => :uimage_os_invalid,
    1 => :uimage_os_openbsd,
    2 => :uimage_os_netbsd,
    3 => :uimage_os_freebsd,
    4 => :uimage_os_bsd4_4,
    5 => :uimage_os_linux,
    6 => :uimage_os_svr4,
    7 => :uimage_os_esix,
    8 => :uimage_os_solaris,
    9 => :uimage_os_irix,
    10 => :uimage_os_sco,
    11 => :uimage_os_dell,
    12 => :uimage_os_ncr,
    13 => :uimage_os_lynxos,
    14 => :uimage_os_vxworks,
    15 => :uimage_os_psos,
    16 => :uimage_os_qnx,
    17 => :uimage_os_u_boot,
    18 => :uimage_os_rtems,
    19 => :uimage_os_artos,
    20 => :uimage_os_unity,
    21 => :uimage_os_integrity,
  }
  I__UIMAGE_OS = UIMAGE_OS.invert

  UIMAGE_ARCH = {
    0 => :uimage_arch_invalid,
    1 => :uimage_arch_alpha,
    2 => :uimage_arch_arm,
    3 => :uimage_arch_i386,
    4 => :uimage_arch_ia64,
    5 => :uimage_arch_mips,
    6 => :uimage_arch_mips64,
    7 => :uimage_arch_ppc,
    8 => :uimage_arch_s390,
    9 => :uimage_arch_sh,
    10 => :uimage_arch_sparc,
    11 => :uimage_arch_sparc64,
    12 => :uimage_arch_m68k,
    13 => :uimage_arch_nios,
    14 => :uimage_arch_microblaze,
    15 => :uimage_arch_nios2,
    16 => :uimage_arch_blackfin,
    17 => :uimage_arch_avr32,
    18 => :uimage_arch_st200,
  }
  I__UIMAGE_ARCH = UIMAGE_ARCH.invert

  UIMAGE_COMP = {
    0 => :uimage_comp_none,
    1 => :uimage_comp_gzip,
    2 => :uimage_comp_bzip2,
    3 => :uimage_comp_lzma,
    4 => :uimage_comp_lzo,
  }
  I__UIMAGE_COMP = UIMAGE_COMP.invert

  UIMAGE_TYPE = {
    0 => :uimage_type_invalid,
    1 => :uimage_type_standalone,
    2 => :uimage_type_kernel,
    3 => :uimage_type_ramdisk,
    4 => :uimage_type_multi,
    5 => :uimage_type_firmware,
    6 => :uimage_type_script,
    7 => :uimage_type_filesystem,
    8 => :uimage_type_flatdt,
    9 => :uimage_type_kwbimage,
    10 => :uimage_type_imximage,
  }
  I__UIMAGE_TYPE = UIMAGE_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = Uheader.new(@_io, self, @_root)
    @data = @_io.read_bytes(header.len_image)
    self
  end
  class Uheader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([39, 5, 25, 86].pack('C*'))
      @header_crc = @_io.read_u4be
      @timestamp = @_io.read_u4be
      @len_image = @_io.read_u4be
      @load_address = @_io.read_u4be
      @entry_address = @_io.read_u4be
      @data_crc = @_io.read_u4be
      @os_type = Kaitai::Struct::Stream::resolve_enum(UIMAGE_OS, @_io.read_u1)
      @architecture = Kaitai::Struct::Stream::resolve_enum(UIMAGE_ARCH, @_io.read_u1)
      @image_type = Kaitai::Struct::Stream::resolve_enum(UIMAGE_TYPE, @_io.read_u1)
      @compression_type = Kaitai::Struct::Stream::resolve_enum(UIMAGE_COMP, @_io.read_u1)
      @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(32), 0, false)).force_encoding("UTF-8")
      self
    end
    attr_reader :magic
    attr_reader :header_crc
    attr_reader :timestamp
    attr_reader :len_image
    attr_reader :load_address
    attr_reader :entry_address
    attr_reader :data_crc
    attr_reader :os_type
    attr_reader :architecture
    attr_reader :image_type
    attr_reader :compression_type
    attr_reader :name
  end
  attr_reader :header
  attr_reader :data
end
