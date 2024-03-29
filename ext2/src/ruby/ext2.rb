# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Ext2 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    self
  end
  class SuperBlockStruct < Kaitai::Struct::Struct

    STATE_ENUM = {
      1 => :state_enum_valid_fs,
      2 => :state_enum_error_fs,
    }
    I__STATE_ENUM = STATE_ENUM.invert

    ERRORS_ENUM = {
      1 => :errors_enum_act_continue,
      2 => :errors_enum_act_ro,
      3 => :errors_enum_act_panic,
    }
    I__ERRORS_ENUM = ERRORS_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @inodes_count = @_io.read_u4le
      @blocks_count = @_io.read_u4le
      @r_blocks_count = @_io.read_u4le
      @free_blocks_count = @_io.read_u4le
      @free_inodes_count = @_io.read_u4le
      @first_data_block = @_io.read_u4le
      @log_block_size = @_io.read_u4le
      @log_frag_size = @_io.read_u4le
      @blocks_per_group = @_io.read_u4le
      @frags_per_group = @_io.read_u4le
      @inodes_per_group = @_io.read_u4le
      @mtime = @_io.read_u4le
      @wtime = @_io.read_u4le
      @mnt_count = @_io.read_u2le
      @max_mnt_count = @_io.read_u2le
      @magic = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([83, 239].pack('C*'), magic, _io, "/types/super_block_struct/seq/15") if not magic == [83, 239].pack('C*')
      @state = Kaitai::Struct::Stream::resolve_enum(STATE_ENUM, @_io.read_u2le)
      @errors = Kaitai::Struct::Stream::resolve_enum(ERRORS_ENUM, @_io.read_u2le)
      @minor_rev_level = @_io.read_u2le
      @lastcheck = @_io.read_u4le
      @checkinterval = @_io.read_u4le
      @creator_os = @_io.read_u4le
      @rev_level = @_io.read_u4le
      @def_resuid = @_io.read_u2le
      @def_resgid = @_io.read_u2le
      @first_ino = @_io.read_u4le
      @inode_size = @_io.read_u2le
      @block_group_nr = @_io.read_u2le
      @feature_compat = @_io.read_u4le
      @feature_incompat = @_io.read_u4le
      @feature_ro_compat = @_io.read_u4le
      @uuid = @_io.read_bytes(16)
      @volume_name = @_io.read_bytes(16)
      @last_mounted = @_io.read_bytes(64)
      @algo_bitmap = @_io.read_u4le
      @prealloc_blocks = @_io.read_u1
      @prealloc_dir_blocks = @_io.read_u1
      @padding1 = @_io.read_bytes(2)
      @journal_uuid = @_io.read_bytes(16)
      @journal_inum = @_io.read_u4le
      @journal_dev = @_io.read_u4le
      @last_orphan = @_io.read_u4le
      @hash_seed = []
      (4).times { |i|
        @hash_seed << @_io.read_u4le
      }
      @def_hash_version = @_io.read_u1
      self
    end
    def block_size
      return @block_size unless @block_size.nil?
      @block_size = (1024 << log_block_size)
      @block_size
    end
    def block_group_count
      return @block_group_count unless @block_group_count.nil?
      @block_group_count = (blocks_count / blocks_per_group)
      @block_group_count
    end
    attr_reader :inodes_count
    attr_reader :blocks_count
    attr_reader :r_blocks_count
    attr_reader :free_blocks_count
    attr_reader :free_inodes_count
    attr_reader :first_data_block
    attr_reader :log_block_size
    attr_reader :log_frag_size
    attr_reader :blocks_per_group
    attr_reader :frags_per_group
    attr_reader :inodes_per_group
    attr_reader :mtime
    attr_reader :wtime
    attr_reader :mnt_count
    attr_reader :max_mnt_count
    attr_reader :magic
    attr_reader :state
    attr_reader :errors
    attr_reader :minor_rev_level
    attr_reader :lastcheck
    attr_reader :checkinterval
    attr_reader :creator_os
    attr_reader :rev_level
    attr_reader :def_resuid
    attr_reader :def_resgid
    attr_reader :first_ino
    attr_reader :inode_size
    attr_reader :block_group_nr
    attr_reader :feature_compat
    attr_reader :feature_incompat
    attr_reader :feature_ro_compat
    attr_reader :uuid
    attr_reader :volume_name
    attr_reader :last_mounted
    attr_reader :algo_bitmap
    attr_reader :prealloc_blocks
    attr_reader :prealloc_dir_blocks
    attr_reader :padding1
    attr_reader :journal_uuid
    attr_reader :journal_inum
    attr_reader :journal_dev
    attr_reader :last_orphan
    attr_reader :hash_seed
    attr_reader :def_hash_version
  end
  class DirEntry < Kaitai::Struct::Struct

    FILE_TYPE_ENUM = {
      0 => :file_type_enum_unknown,
      1 => :file_type_enum_reg_file,
      2 => :file_type_enum_dir,
      3 => :file_type_enum_chrdev,
      4 => :file_type_enum_blkdev,
      5 => :file_type_enum_fifo,
      6 => :file_type_enum_sock,
      7 => :file_type_enum_symlink,
    }
    I__FILE_TYPE_ENUM = FILE_TYPE_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @inode_ptr = @_io.read_u4le
      @rec_len = @_io.read_u2le
      @name_len = @_io.read_u1
      @file_type = Kaitai::Struct::Stream::resolve_enum(FILE_TYPE_ENUM, @_io.read_u1)
      @name = (@_io.read_bytes(name_len)).force_encoding("UTF-8")
      @padding = @_io.read_bytes(((rec_len - name_len) - 8))
      self
    end
    def inode
      return @inode unless @inode.nil?
      @inode = _root.bg1.block_groups[((inode_ptr - 1) / _root.bg1.super_block.inodes_per_group)].inodes[((inode_ptr - 1) % _root.bg1.super_block.inodes_per_group)]
      @inode
    end
    attr_reader :inode_ptr
    attr_reader :rec_len
    attr_reader :name_len
    attr_reader :file_type
    attr_reader :name
    attr_reader :padding
  end
  class Inode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @mode = @_io.read_u2le
      @uid = @_io.read_u2le
      @size = @_io.read_u4le
      @atime = @_io.read_u4le
      @ctime = @_io.read_u4le
      @mtime = @_io.read_u4le
      @dtime = @_io.read_u4le
      @gid = @_io.read_u2le
      @links_count = @_io.read_u2le
      @blocks = @_io.read_u4le
      @flags = @_io.read_u4le
      @osd1 = @_io.read_u4le
      @block = []
      (15).times { |i|
        @block << BlockPtr.new(@_io, self, @_root)
      }
      @generation = @_io.read_u4le
      @file_acl = @_io.read_u4le
      @dir_acl = @_io.read_u4le
      @faddr = @_io.read_u4le
      @osd2 = @_io.read_bytes(12)
      self
    end
    def as_dir
      return @as_dir unless @as_dir.nil?
      io = block[0].body._io
      _pos = io.pos
      io.seek(0)
      @as_dir = Dir.new(io, self, @_root)
      io.seek(_pos)
      @as_dir
    end
    attr_reader :mode
    attr_reader :uid
    attr_reader :size
    attr_reader :atime
    attr_reader :ctime
    attr_reader :mtime
    attr_reader :dtime
    attr_reader :gid
    attr_reader :links_count
    attr_reader :blocks
    attr_reader :flags
    attr_reader :osd1
    attr_reader :block
    attr_reader :generation
    attr_reader :file_acl
    attr_reader :dir_acl
    attr_reader :faddr
    attr_reader :osd2
  end
  class BlockPtr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ptr = @_io.read_u4le
      self
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek((ptr * _root.bg1.super_block.block_size))
      @_raw_body = @_io.read_bytes(_root.bg1.super_block.block_size)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = RawBlock.new(_io__raw_body, self, @_root)
      @_io.seek(_pos)
      @body
    end
    attr_reader :ptr
    attr_reader :_raw_body
  end
  class Dir < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << DirEntry.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  class BlockGroup < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_raw_super_block = @_io.read_bytes(1024)
      _io__raw_super_block = Kaitai::Struct::Stream.new(@_raw_super_block)
      @super_block = SuperBlockStruct.new(_io__raw_super_block, self, @_root)
      @block_groups = []
      (super_block.block_group_count).times { |i|
        @block_groups << Bgd.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :super_block
    attr_reader :block_groups
    attr_reader :_raw_super_block
  end
  class Bgd < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @block_bitmap_block = @_io.read_u4le
      @inode_bitmap_block = @_io.read_u4le
      @inode_table_block = @_io.read_u4le
      @free_blocks_count = @_io.read_u2le
      @free_inodes_count = @_io.read_u2le
      @used_dirs_count = @_io.read_u2le
      @pad_reserved = @_io.read_bytes((2 + 12))
      self
    end
    def block_bitmap
      return @block_bitmap unless @block_bitmap.nil?
      _pos = @_io.pos
      @_io.seek((block_bitmap_block * _root.bg1.super_block.block_size))
      @block_bitmap = @_io.read_bytes(1024)
      @_io.seek(_pos)
      @block_bitmap
    end
    def inode_bitmap
      return @inode_bitmap unless @inode_bitmap.nil?
      _pos = @_io.pos
      @_io.seek((inode_bitmap_block * _root.bg1.super_block.block_size))
      @inode_bitmap = @_io.read_bytes(1024)
      @_io.seek(_pos)
      @inode_bitmap
    end
    def inodes
      return @inodes unless @inodes.nil?
      _pos = @_io.pos
      @_io.seek((inode_table_block * _root.bg1.super_block.block_size))
      @inodes = []
      (_root.bg1.super_block.inodes_per_group).times { |i|
        @inodes << Inode.new(@_io, self, @_root)
      }
      @_io.seek(_pos)
      @inodes
    end
    attr_reader :block_bitmap_block
    attr_reader :inode_bitmap_block
    attr_reader :inode_table_block
    attr_reader :free_blocks_count
    attr_reader :free_inodes_count
    attr_reader :used_dirs_count
    attr_reader :pad_reserved
  end
  class RawBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @body = @_io.read_bytes(_root.bg1.super_block.block_size)
      self
    end
    attr_reader :body
  end
  def bg1
    return @bg1 unless @bg1.nil?
    _pos = @_io.pos
    @_io.seek(1024)
    @bg1 = BlockGroup.new(@_io, self, @_root)
    @_io.seek(_pos)
    @bg1
  end
  def root_dir
    return @root_dir unless @root_dir.nil?
    @root_dir = bg1.block_groups[0].inodes[1].as_dir
    @root_dir
  end
end
