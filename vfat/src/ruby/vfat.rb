# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Vfat < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @boot_sector = BootSector.new(@_io, self, @_root)
    self
  end

  ##
  # Extended BIOS Parameter Block for FAT32
  class ExtBiosParamBlockFat32 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ls_per_fat = @_io.read_u4le
      @has_active_fat = @_io.read_bits_int_be(1) != 0
      @reserved1 = @_io.read_bits_int_be(3)
      @active_fat_id = @_io.read_bits_int_be(4)
      @_io.align_to_byte
      @reserved2 = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([0].pack('C*'), reserved2, _io, "/types/ext_bios_param_block_fat32/seq/4") if not reserved2 == [0].pack('C*')
      @fat_version = @_io.read_u2le
      @root_dir_start_clus = @_io.read_u4le
      @ls_fs_info = @_io.read_u2le
      @boot_sectors_copy_start_ls = @_io.read_u2le
      @reserved3 = @_io.read_bytes(12)
      @phys_drive_num = @_io.read_u1
      @reserved4 = @_io.read_u1
      @ext_boot_sign = @_io.read_u1
      @volume_id = @_io.read_bytes(4)
      @partition_volume_label = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(11), 32)).force_encoding("ASCII")
      @fs_type_str = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(8), 32)).force_encoding("ASCII")
      self
    end

    ##
    # Logical sectors per file allocation table (corresponds with
    # the old entry `ls_per_fat` in the DOS 2.0 BPB).
    attr_reader :ls_per_fat

    ##
    # If true, then there is "active" FAT, which is designated in
    # `active_fat` attribute. If false, all FATs are mirrored as
    # usual.
    attr_reader :has_active_fat
    attr_reader :reserved1

    ##
    # Zero-based number of active FAT, if `has_active_fat`
    # attribute is true.
    attr_reader :active_fat_id
    attr_reader :reserved2
    attr_reader :fat_version

    ##
    # Cluster number of root directory start, typically 2 if it
    # contains no bad sector. (Microsoft's FAT32 implementation
    # imposes an artificial limit of 65,535 entries per directory,
    # whilst many third-party implementations do not.)
    attr_reader :root_dir_start_clus

    ##
    # Logical sector number of FS Information Sector, typically 1,
    # i.e., the second of the three FAT32 boot sectors. Values
    # like 0 and 0xFFFF are used by some FAT32 implementations to
    # designate abscence of FS Information Sector.
    attr_reader :ls_fs_info

    ##
    # First logical sector number of a copy of the three FAT32
    # boot sectors, typically 6.
    attr_reader :boot_sectors_copy_start_ls
    attr_reader :reserved3

    ##
    # Physical drive number (0x00 for (first) removable media,
    # 0x80 for (first) fixed disk as per INT 13h).
    attr_reader :phys_drive_num
    attr_reader :reserved4

    ##
    # Should be 0x29 to indicate that an EBPB with the following 3
    # entries exists.
    attr_reader :ext_boot_sign

    ##
    # Volume ID (serial number).
    # 
    # Typically the serial number "xxxx-xxxx" is created by a
    # 16-bit addition of both DX values returned by INT 21h/AH=2Ah
    # (get system date) and INT 21h/AH=2Ch (get system time) for
    # the high word and another 16-bit addition of both CX values
    # for the low word of the serial number. Alternatively, some
    # DR-DOS disk utilities provide a /# option to generate a
    # human-readable time stamp "mmdd-hhmm" build from BCD-encoded
    # 8-bit values for the month, day, hour and minute instead of
    # a serial number.
    attr_reader :volume_id
    attr_reader :partition_volume_label
    attr_reader :fs_type_str
  end
  class BootSector < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @jmp_instruction = @_io.read_bytes(3)
      @oem_name = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(8), 32)).force_encoding("ASCII")
      @bpb = BiosParamBlock.new(@_io, self, @_root)
      if !(is_fat32)
        @ebpb_fat16 = ExtBiosParamBlockFat16.new(@_io, self, @_root)
      end
      if is_fat32
        @ebpb_fat32 = ExtBiosParamBlockFat32.new(@_io, self, @_root)
      end
      self
    end

    ##
    # Offset of FATs in bytes from start of filesystem
    def pos_fats
      return @pos_fats unless @pos_fats.nil?
      @pos_fats = (bpb.bytes_per_ls * bpb.num_reserved_ls)
      @pos_fats
    end
    def ls_per_fat
      return @ls_per_fat unless @ls_per_fat.nil?
      @ls_per_fat = (is_fat32 ? ebpb_fat32.ls_per_fat : bpb.ls_per_fat)
      @ls_per_fat
    end

    ##
    # Size of root directory in logical sectors
    # @see '' FAT: General Overview of On-Disk Format, section "FAT Data Structure"
    def ls_per_root_dir
      return @ls_per_root_dir unless @ls_per_root_dir.nil?
      @ls_per_root_dir = ((((bpb.max_root_dir_rec * 32) + bpb.bytes_per_ls) - 1) / bpb.bytes_per_ls)
      @ls_per_root_dir
    end

    ##
    # Determines if filesystem is FAT32 (true) or FAT12/16 (false)
    # by analyzing some preliminary conditions in BPB. Used to
    # determine whether we should parse post-BPB data as
    # `ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.
    def is_fat32
      return @is_fat32 unless @is_fat32.nil?
      @is_fat32 = bpb.max_root_dir_rec == 0
      @is_fat32
    end

    ##
    # Size of one FAT in bytes
    def size_fat
      return @size_fat unless @size_fat.nil?
      @size_fat = (bpb.bytes_per_ls * ls_per_fat)
      @size_fat
    end

    ##
    # Offset of root directory in bytes from start of filesystem
    def pos_root_dir
      return @pos_root_dir unless @pos_root_dir.nil?
      @pos_root_dir = (bpb.bytes_per_ls * (bpb.num_reserved_ls + (ls_per_fat * bpb.num_fats)))
      @pos_root_dir
    end

    ##
    # Size of root directory in bytes
    def size_root_dir
      return @size_root_dir unless @size_root_dir.nil?
      @size_root_dir = (ls_per_root_dir * bpb.bytes_per_ls)
      @size_root_dir
    end
    attr_reader :jmp_instruction
    attr_reader :oem_name

    ##
    # Basic BIOS parameter block, present in all versions of FAT
    attr_reader :bpb

    ##
    # FAT12/16-specific extended BIOS parameter block
    attr_reader :ebpb_fat16

    ##
    # FAT32-specific extended BIOS parameter block
    attr_reader :ebpb_fat32
  end
  class BiosParamBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bytes_per_ls = @_io.read_u2le
      @ls_per_clus = @_io.read_u1
      @num_reserved_ls = @_io.read_u2le
      @num_fats = @_io.read_u1
      @max_root_dir_rec = @_io.read_u2le
      @total_ls_2 = @_io.read_u2le
      @media_code = @_io.read_u1
      @ls_per_fat = @_io.read_u2le
      @ps_per_track = @_io.read_u2le
      @num_heads = @_io.read_u2le
      @num_hidden_sectors = @_io.read_u4le
      @total_ls_4 = @_io.read_u4le
      self
    end

    ##
    # Bytes per logical sector
    attr_reader :bytes_per_ls

    ##
    # Logical sectors per cluster
    attr_reader :ls_per_clus

    ##
    # Count of reserved logical sectors. The number of logical
    # sectors before the first FAT in the file system image.
    attr_reader :num_reserved_ls

    ##
    # Number of File Allocation Tables
    attr_reader :num_fats

    ##
    # Maximum number of FAT12 or FAT16 root directory entries. 0
    # for FAT32, where the root directory is stored in ordinary
    # data clusters.
    attr_reader :max_root_dir_rec

    ##
    # Total logical sectors (if zero, use total_ls_4)
    attr_reader :total_ls_2

    ##
    # Media descriptor
    attr_reader :media_code

    ##
    # Logical sectors per File Allocation Table for
    # FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
    # at offset 0x024 instead.
    attr_reader :ls_per_fat

    ##
    # Physical sectors per track for disks with INT 13h CHS
    # geometry, e.g., 15 for a “1.20 MB” (1200 KB) floppy. A zero
    # entry indicates that this entry is reserved, but not used.
    attr_reader :ps_per_track

    ##
    # Number of heads for disks with INT 13h CHS geometry,[9]
    # e.g., 2 for a double sided floppy.
    attr_reader :num_heads

    ##
    # Number of hidden sectors preceding the partition that
    # contains this FAT volume. This field should always be zero
    # on media that are not partitioned. This DOS 3.0 entry is
    # incompatible with a similar entry at offset 0x01C in BPBs
    # since DOS 3.31.  It must not be used if the logical sectors
    # entry at offset 0x013 is zero.
    attr_reader :num_hidden_sectors

    ##
    # Total logical sectors including hidden sectors. This DOS 3.2
    # entry is incompatible with a similar entry at offset 0x020
    # in BPBs since DOS 3.31. It must not be used if the logical
    # sectors entry at offset 0x013 is zero.
    attr_reader :total_ls_4
  end
  class RootDirectoryRec < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_name = @_io.read_bytes(11)
      @attribute = @_io.read_u1
      @reserved = @_io.read_bytes(10)
      @time = @_io.read_u2le
      @date = @_io.read_u2le
      @start_clus = @_io.read_u2le
      @file_size = @_io.read_u4le
      self
    end
    attr_reader :file_name
    attr_reader :attribute
    attr_reader :reserved
    attr_reader :time
    attr_reader :date
    attr_reader :start_clus
    attr_reader :file_size
  end
  class RootDirectory < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @records = Array.new(_root.boot_sector.bpb.max_root_dir_rec)
      (_root.boot_sector.bpb.max_root_dir_rec).times { |i|
        @records[i] = RootDirectoryRec.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :records
  end

  ##
  # Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
  # for FAT12 and FAT16.
  class ExtBiosParamBlockFat16 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @phys_drive_num = @_io.read_u1
      @reserved1 = @_io.read_u1
      @ext_boot_sign = @_io.read_u1
      @volume_id = @_io.read_bytes(4)
      @partition_volume_label = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(11), 32)).force_encoding("ASCII")
      @fs_type_str = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(8), 32)).force_encoding("ASCII")
      self
    end

    ##
    # Physical drive number (0x00 for (first) removable media,
    # 0x80 for (first) fixed disk as per INT 13h).
    attr_reader :phys_drive_num
    attr_reader :reserved1

    ##
    # Should be 0x29 to indicate that an EBPB with the following 3
    # entries exists.
    attr_reader :ext_boot_sign

    ##
    # Volume ID (serial number).
    # 
    # Typically the serial number "xxxx-xxxx" is created by a
    # 16-bit addition of both DX values returned by INT 21h/AH=2Ah
    # (get system date) and INT 21h/AH=2Ch (get system time) for
    # the high word and another 16-bit addition of both CX values
    # for the low word of the serial number. Alternatively, some
    # DR-DOS disk utilities provide a /# option to generate a
    # human-readable time stamp "mmdd-hhmm" build from BCD-encoded
    # 8-bit values for the month, day, hour and minute instead of
    # a serial number.
    attr_reader :volume_id
    attr_reader :partition_volume_label
    attr_reader :fs_type_str
  end
  def fats
    return @fats unless @fats.nil?
    _pos = @_io.pos
    @_io.seek(boot_sector.pos_fats)
    @fats = Array.new(boot_sector.bpb.num_fats)
    (boot_sector.bpb.num_fats).times { |i|
      @fats[i] = @_io.read_bytes(boot_sector.size_fat)
    }
    @_io.seek(_pos)
    @fats
  end
  def root_dir
    return @root_dir unless @root_dir.nil?
    _pos = @_io.pos
    @_io.seek(boot_sector.pos_root_dir)
    @_raw_root_dir = @_io.read_bytes(boot_sector.size_root_dir)
    _io__raw_root_dir = Kaitai::Struct::Stream.new(@_raw_root_dir)
    @root_dir = RootDirectory.new(_io__raw_root_dir, self, @_root)
    @_io.seek(_pos)
    @root_dir
  end
  attr_reader :boot_sector
  attr_reader :_raw_root_dir
end
