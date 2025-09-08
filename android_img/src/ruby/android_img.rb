# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://source.android.com/docs/core/architecture/bootloader/boot-image-header Source
class AndroidImg < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(8)
    raise Kaitai::Struct::ValidationNotEqualError.new([65, 78, 68, 82, 79, 73, 68, 33].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [65, 78, 68, 82, 79, 73, 68, 33].pack('C*')
    @kernel = Load.new(@_io, self, @_root)
    @ramdisk = Load.new(@_io, self, @_root)
    @second = Load.new(@_io, self, @_root)
    @tags_load = @_io.read_u4le
    @page_size = @_io.read_u4le
    @header_version = @_io.read_u4le
    @os_version = OsVersion.new(@_io, self, @_root)
    @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(16), 0, false)).force_encoding("ASCII").encode('UTF-8')
    @cmdline = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(512), 0, false)).force_encoding("ASCII").encode('UTF-8')
    @sha = @_io.read_bytes(32)
    @extra_cmdline = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(1024), 0, false)).force_encoding("ASCII").encode('UTF-8')
    if header_version > 0
      @recovery_dtbo = SizeOffset.new(@_io, self, @_root)
    end
    if header_version > 0
      @boot_header_size = @_io.read_u4le
    end
    if header_version > 1
      @dtb = LoadLong.new(@_io, self, @_root)
    end
    self
  end
  class Load < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4le
      @addr = @_io.read_u4le
      self
    end
    attr_reader :size
    attr_reader :addr
  end
  class LoadLong < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4le
      @addr = @_io.read_u8le
      self
    end
    attr_reader :size
    attr_reader :addr
  end
  class OsVersion < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u4le
      self
    end
    def major
      return @major unless @major.nil?
      @major = version >> 25 & 127
      @major
    end
    def minor
      return @minor unless @minor.nil?
      @minor = version >> 18 & 127
      @minor
    end
    def month
      return @month unless @month.nil?
      @month = version & 15
      @month
    end
    def patch
      return @patch unless @patch.nil?
      @patch = version >> 11 & 127
      @patch
    end
    def year
      return @year unless @year.nil?
      @year = (version >> 4 & 127) + 2000
      @year
    end
    attr_reader :version
  end
  class SizeOffset < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4le
      @offset = @_io.read_u8le
      self
    end
    attr_reader :size
    attr_reader :offset
  end

  ##
  # base loading address
  def base
    return @base unless @base.nil?
    @base = kernel.addr - 32768
    @base
  end
  def dtb_img
    return @dtb_img unless @dtb_img.nil?
    if  ((header_version > 1) && (dtb.size > 0)) 
      _pos = @_io.pos
      @_io.seek((((((((page_size + kernel.size) + ramdisk.size) + second.size) + recovery_dtbo.size) + page_size) - 1) / page_size) * page_size)
      @dtb_img = @_io.read_bytes(dtb.size)
      @_io.seek(_pos)
    end
    @dtb_img
  end

  ##
  # dtb offset from base
  def dtb_offset
    return @dtb_offset unless @dtb_offset.nil?
    if header_version > 1
      @dtb_offset = (dtb.addr > 0 ? dtb.addr - base : 0)
    end
    @dtb_offset
  end
  def kernel_img
    return @kernel_img unless @kernel_img.nil?
    _pos = @_io.pos
    @_io.seek(page_size)
    @kernel_img = @_io.read_bytes(kernel.size)
    @_io.seek(_pos)
    @kernel_img
  end

  ##
  # kernel offset from base
  def kernel_offset
    return @kernel_offset unless @kernel_offset.nil?
    @kernel_offset = kernel.addr - base
    @kernel_offset
  end
  def ramdisk_img
    return @ramdisk_img unless @ramdisk_img.nil?
    if ramdisk.size > 0
      _pos = @_io.pos
      @_io.seek(((((page_size + kernel.size) + page_size) - 1) / page_size) * page_size)
      @ramdisk_img = @_io.read_bytes(ramdisk.size)
      @_io.seek(_pos)
    end
    @ramdisk_img
  end

  ##
  # ramdisk offset from base
  def ramdisk_offset
    return @ramdisk_offset unless @ramdisk_offset.nil?
    @ramdisk_offset = (ramdisk.addr > 0 ? ramdisk.addr - base : 0)
    @ramdisk_offset
  end
  def recovery_dtbo_img
    return @recovery_dtbo_img unless @recovery_dtbo_img.nil?
    if  ((header_version > 0) && (recovery_dtbo.size > 0)) 
      _pos = @_io.pos
      @_io.seek(recovery_dtbo.offset)
      @recovery_dtbo_img = @_io.read_bytes(recovery_dtbo.size)
      @_io.seek(_pos)
    end
    @recovery_dtbo_img
  end
  def second_img
    return @second_img unless @second_img.nil?
    if second.size > 0
      _pos = @_io.pos
      @_io.seek((((((page_size + kernel.size) + ramdisk.size) + page_size) - 1) / page_size) * page_size)
      @second_img = @_io.read_bytes(second.size)
      @_io.seek(_pos)
    end
    @second_img
  end

  ##
  # 2nd bootloader offset from base
  def second_offset
    return @second_offset unless @second_offset.nil?
    @second_offset = (second.addr > 0 ? second.addr - base : 0)
    @second_offset
  end

  ##
  # tags offset from base
  def tags_offset
    return @tags_offset unless @tags_offset.nil?
    @tags_offset = tags_load - base
    @tags_offset
  end
  attr_reader :magic
  attr_reader :kernel
  attr_reader :ramdisk
  attr_reader :second
  attr_reader :tags_load
  attr_reader :page_size
  attr_reader :header_version
  attr_reader :os_version
  attr_reader :name
  attr_reader :cmdline
  attr_reader :sha
  attr_reader :extra_cmdline
  attr_reader :recovery_dtbo
  attr_reader :boot_header_size
  attr_reader :dtb
end
