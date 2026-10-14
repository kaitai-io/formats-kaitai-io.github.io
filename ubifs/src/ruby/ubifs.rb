# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# UBIFS is a file system for raw flash memory devices. It works on top of
# UBI (Unsorted Block Images), which works as an abstraction layer so UBIFS
# does not need to care about low level details. This specification only covers
# UBIFS, not UBI.
# 
# A UBIFS image is divided into several Logical Erase Blocks (LEB). The first
# LEB (LEB0) contains the superblock node, which includes information about LEB
# size, amongst others. The next two LEBs (LEB1 and LEB2) comprise the so called
# "master area" and both contain a copy of the master node, which includes
# information about where to find the root index node, which is then used to
# access all the files on the file system.
# 
# **Limitations of this Kaitai Struct implementation:**
# 
# 1. It only supports UBIFS images created by `mkfs.ubifs` (such as those in
#    firmware images built by OpenWrt), not file systems modified after
#    creation, e.g. by writing files to them on a running Linux system. The
#    Linux kernel appends a new copy of the master node to LEB1 and LEB2
#    whenever it mounts the file system read-write, unmounts it, or commits
#    changes (updates the index on flash to include them). When mounting, Linux
#    uses the
#    [last copy](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L84-L165),
#    whereas this implementation reads the first one (`master_1`), which still
#    describes the file system as it was created. Changes made since then are
#    therefore not visible via `index_root`.
# 2. Changes that have not been committed yet are not in the index at all, so
#    they are not visible via `index_root` either. Until they are committed,
#    UBIFS keeps them only in the journal. This only matters for file systems
#    that were not unmounted cleanly, because unmounting
#    [commits](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/super.c#L486-L493)
#    all changes.
# 3. Parsing doesn't advance the stream position. This implementation reads
#    the image only through instances, so that parsing doesn't copy the
#    whole image into memory. To find where the image ends, e.g. when
#    carving it out of a larger file, use `len_image`. For the same reason,
#    parsing doesn't fail if the image is truncated. To detect that, check
#    that the stream is at least `len_image` bytes long
#    (`_io.size >= len_image`).
# @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h Git tag "v7.2"
# @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h Git tag "v7.2"
# @see http://www.linux-mtd.infradead.org/doc/ubifs.pdf Source
class Ubifs < Kaitai::Struct::Struct

  COMPRESSION = {
    0 => :compression_no_compression,
    1 => :compression_lzo,
    2 => :compression_zlib,
    3 => :compression_zstd,
  }
  I__COMPRESSION = COMPRESSION.invert

  HASH_ALGOS = {
    0 => :hash_algos_md4,
    1 => :hash_algos_md5,
    2 => :hash_algos_sha1,
    3 => :hash_algos_ripe_md_160,
    4 => :hash_algos_sha256,
    5 => :hash_algos_sha384,
    6 => :hash_algos_sha512,
    7 => :hash_algos_sha224,
    8 => :hash_algos_ripe_md_128,
    9 => :hash_algos_ripe_md_256,
    10 => :hash_algos_ripe_md_320,
    11 => :hash_algos_wp_256,
    12 => :hash_algos_wp_384,
    13 => :hash_algos_wp_512,
    14 => :hash_algos_tgr_128,
    15 => :hash_algos_tgr_160,
    16 => :hash_algos_tgr_192,
    17 => :hash_algos_sm3_256,
    18 => :hash_algos_streebog_256,
    19 => :hash_algos_streebog_512,
    20 => :hash_algos_sha3_256,
    21 => :hash_algos_sha3_384,
    22 => :hash_algos_sha3_512,
  }
  I__HASH_ALGOS = HASH_ALGOS.invert

  HASHES = {
    0 => :hashes_r5,
    1 => :hashes_test_hash,
  }
  I__HASHES = HASHES.invert

  INODE_TYPES = {
    0 => :inode_types_regular,
    1 => :inode_types_directory,
    2 => :inode_types_link,
    3 => :inode_types_block_device,
    4 => :inode_types_character_device,
    5 => :inode_types_fifo,
    6 => :inode_types_socket,
  }
  I__INODE_TYPES = INODE_TYPES.invert

  KEY_FORMATS = {
    0 => :key_formats_simple,
  }
  I__KEY_FORMATS = KEY_FORMATS.invert

  KEY_TYPES = {
    0 => :key_types_inode,
    1 => :key_types_data,
    2 => :key_types_directory,
    3 => :key_types_extended_attribute,
  }
  I__KEY_TYPES = KEY_TYPES.invert

  NODE_GROUP_TYPES = {
    0 => :node_group_types_no_node_group,
    1 => :node_group_types_in_node_group,
    2 => :node_group_types_last_of_node_group,
  }
  I__NODE_GROUP_TYPES = NODE_GROUP_TYPES.invert

  NODE_TYPES = {
    0 => :node_types_inode,
    1 => :node_types_data,
    2 => :node_types_directory,
    3 => :node_types_extended_attribute,
    4 => :node_types_truncation,
    5 => :node_types_padding,
    6 => :node_types_superblock,
    7 => :node_types_master,
    8 => :node_types_reference,
    9 => :node_types_index,
    10 => :node_types_commit_start,
    11 => :node_types_orphan,
    12 => :node_types_authentication,
    13 => :node_types_signature,
  }
  I__NODE_TYPES = NODE_TYPES.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    self
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L774-L782 Git tag "v7.2"
  class AuthenticationHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @hmac = @_io.read_bytes(_root.superblock.node_header.len_hash)
      self
    end

    ##
    # HMAC authenticating the journal before this node, keyed with the
    # file system's authentication key (which is not stored on flash).
    # The kernel [uses](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L275-L276)
    # HMAC with the hash algorithm in `<superblock_header>.hash_algo`
    # ([checked when mounting](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L575-L580)),
    # so `hmac` is as long as its digest, e.g. 32 bytes for SHA-256.
    attr_reader :hmac
  end
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = CommonHeader.new(@_io, self, @_root)
      case header.node_type
      when :node_types_authentication
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = AuthenticationHeader.new(_io_node_header, self, @_root)
      when :node_types_commit_start
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = CommitStartHeader.new(_io_node_header, self, @_root)
      when :node_types_data
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = DataHeader.new(_io_node_header, self, @_root)
      when :node_types_directory
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = DirectoryHeader.new(_io_node_header, self, @_root)
      when :node_types_extended_attribute
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = DirectoryHeader.new(_io_node_header, self, @_root)
      when :node_types_index
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = IndexHeader.new(_io_node_header, self, @_root)
      when :node_types_inode
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = InodeHeader.new(_io_node_header, self, @_root)
      when :node_types_master
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = MasterHeader.new(_io_node_header, self, @_root)
      when :node_types_orphan
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = OrphanHeader.new(_io_node_header, self, @_root)
      when :node_types_padding
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = PaddingHeader.new(_io_node_header, self, @_root)
      when :node_types_reference
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = ReferenceHeader.new(_io_node_header, self, @_root)
      when :node_types_signature
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = SignatureHeader.new(_io_node_header, self, @_root)
      when :node_types_superblock
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = SuperblockHeader.new(_io_node_header, self, @_root)
      when :node_types_truncation
        _io_node_header = @_io.substream(header.len_full_node - 24)
        @node_header = TruncationHeader.new(_io_node_header, self, @_root)
      else
        @node_header = @_io.read_bytes(header.len_full_node - 24)
      end
      self
    end
    attr_reader :header
    attr_reader :node_header
    attr_reader :_raw_node_header
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L801-L817 Git tag "v7.2"
  class Branch < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @target_leb = @_io.read_u4le
      @ofs_target = @_io.read_u4le
      @len_target = @_io.read_u4le
      _io_key = @_io.substream(8)
      @key = Key.new(_io_key, self, @_root)
      @hash = @_io.read_bytes(_root.superblock.node_header.len_hash)
      self
    end
    def target
      return @target unless @target.nil?
      io = _root._io
      _pos = io.pos
      io.seek(_root.superblock.node_header.leb_size * target_leb + ofs_target)
      _io_target = io.substream(len_target)
      @target = Block.new(_io_target, self, @_root)
      _ = @target
      raise Kaitai::Struct::ValidationExprError.new(@target, @_io, "/types/branch/instances/target") if not  ((_.header.len_full_node == len_target) && ((_parent.level != 0 ? _.header.node_type == :node_types_index : (Ubifs::I__NODE_TYPES[_.header.node_type] || _.header.node_type) == (Ubifs::I__KEY_TYPES[key.type] || key.type)))) 
      io.seek(_pos)
      @target
    end

    ##
    # LEB number of the target node
    attr_reader :target_leb

    ##
    # offset within the LEB `target_leb`
    attr_reader :ofs_target

    ##
    # target node length
    attr_reader :len_target
    attr_reader :key

    ##
    # Hash of the target node. It is empty in a file system without
    # authentication (see `<superblock_header>.len_hash`).
    # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1642-L1654 Git tag "v7.2"
    attr_reader :hash
    attr_reader :_raw_key
    attr_reader :_raw_target
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L833-L841 Git tag "v7.2"
  class CommitStartHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @commit_number = @_io.read_u8le
      self
    end

    ##
    # commit number
    attr_reader :commit_number
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L443-L464 Git tag "v7.2"
  class CommonHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_u4le
      raise Kaitai::Struct::ValidationNotEqualError.new(101718065, @magic, @_io, "/types/common_header/seq/0") if not @magic == 101718065
      @crc = @_io.read_u4le
      @sequence_number = @_io.read_u8le
      @len_full_node = @_io.read_u4le
      @node_type = Kaitai::Struct::Stream::resolve_enum(Ubifs::NODE_TYPES, @_io.read_u1)
      @group_type = Kaitai::Struct::Stream::resolve_enum(Ubifs::NODE_GROUP_TYPES, @_io.read_u1)
      @padding = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0].pack('C*'), @padding, @_io, "/types/common_header/seq/6") if not @padding == [0, 0].pack('C*')
      self
    end

    ##
    # UBIFS node magic number (`UBIFS_NODE_MAGIC`)
    attr_reader :magic

    ##
    # CRC-32 checksum of the whole node except `magic` and `crc` (i.e.
    # starting at offset 8). It is computed with an initial register value
    # of 0xFFFFFFFF and no final XOR, so it is the bitwise NOT of a standard
    # CRC-32 (e.g.
    # [`zlib.crc32()`](https://docs.python.org/3/library/zlib.html#zlib.crc32)
    # in Python).
    attr_reader :crc

    ##
    # sequence number
    attr_reader :sequence_number

    ##
    # full node length
    attr_reader :len_full_node

    ##
    # node type
    attr_reader :node_type

    ##
    # node group type
    attr_reader :group_type

    ##
    # reserved for future, zeroes
    attr_reader :padding
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L567-L584 Git tag "v7.2"
  class DataHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      _io_key = @_io.substream(16)
      @key = Key.new(_io_key, self, @_root)
      @len_uncompressed = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(1, @len_uncompressed, @_io, "/types/data_header/seq/1") if not @len_uncompressed >= 1
      raise Kaitai::Struct::ValidationGreaterThanError.new(4096, @len_uncompressed, @_io, "/types/data_header/seq/1") if not @len_uncompressed <= 4096
      @compression = Kaitai::Struct::Stream::resolve_enum(Ubifs::COMPRESSION, @_io.read_u2le)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@compression, @_io, "/types/data_header/seq/2") if not Ubifs::I__COMPRESSION.key?(@compression)
      @len_compressed_data = @_io.read_u2le
      @data = @_io.read_bytes_full
      self
    end

    ##
    # node key
    attr_reader :key

    ##
    # uncompressed data size in bytes
    attr_reader :len_uncompressed

    ##
    # compression type (`compression::no_compression`, `compression::lzo`,
    # etc.)
    attr_reader :compression

    ##
    # compressed data size in bytes, only valid when data is encrypted
    attr_reader :len_compressed_data

    ##
    # One block (up to 4096 bytes) of the file, block number `key.value`,
    # compressed as given by `compression`. Blocks missing from the index
    # are holes (zeros). In an encrypted inode, the compressed data is
    # padded
    # and [encrypted](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/crypto.c#L38-L59),
    # and `len_compressed_data` is the length of the compressed data
    # before padding.
    attr_reader :data
    attr_reader :_raw_key
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L541-L565 Git tag "v7.2"
  class DirectoryHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      _io_key = @_io.substream(16)
      @key = Key.new(_io_key, self, @_root)
      _ = @key
      raise Kaitai::Struct::ValidationExprError.new(@key, @_io, "/types/directory_header/seq/0") if not  ((_.type == :key_types_directory) || (_.type == :key_types_extended_attribute)) 
      @inode_number = @_io.read_u8le
      raise Kaitai::Struct::ValidationGreaterThanError.new(4294967295, @inode_number, @_io, "/types/directory_header/seq/1") if not @inode_number <= 4294967295
      @padding1 = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([0].pack('C*'), @padding1, @_io, "/types/directory_header/seq/2") if not @padding1 == [0].pack('C*')
      @inode_type = Kaitai::Struct::Stream::resolve_enum(Ubifs::INODE_TYPES, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@inode_type, @_io, "/types/directory_header/seq/3") if not Ubifs::I__INODE_TYPES.key?(@inode_type)
      @len_name = @_io.read_u2le
      @cookie = @_io.read_u4le
      @name = @_io.read_bytes(len_name)
      @name_terminator = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([0].pack('C*'), @name_terminator, @_io, "/types/directory_header/seq/7") if not @name_terminator == [0].pack('C*')
      self
    end

    ##
    # node key
    attr_reader :key

    ##
    # target inode number
    attr_reader :inode_number

    ##
    # reserved for future, zeroes
    attr_reader :padding1

    ##
    # type of the target inode (`inode_types::regular`,
    # `inode_types::directory`, etc.)
    attr_reader :inode_type

    ##
    # name length
    attr_reader :len_name

    ##
    # A 32bits random number, used to construct a 64bits identifier.
    attr_reader :cookie

    ##
    # Name of the entry.
    # 
    # It is kept as bytes rather than decoded as a string: names in a
    # directory whose inode has `<inode_header>.encrypted` set are
    # ciphertext, which may contain any bytes, including zeros.
    # 
    # Unencrypted names, including all names of extended attributes, contain
    # no zero bytes, because Linux can't create such names. They aren't
    # necessarily valid UTF-8, though, as UBIFS doesn't enforce any encoding
    # of file names. A zero byte in such a name means that the image was
    # crafted, since an accidental corruption would most likely fail the
    # node's
    # [CRC check](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/io.c#L287-L293).
    attr_reader :name

    ##
    # Zero byte after `name`, [not counted in
    # `len_name`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/replay.c#L487-L489).
    attr_reader :name_terminator
    attr_reader :_raw_key
  end
  class Dummy < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
  end
  class IndexBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = CommonHeader.new(@_io, self, @_root)
      _ = @header
      raise Kaitai::Struct::ValidationExprError.new(@header, @_io, "/types/index_block/seq/0") if not _.node_type == :node_types_index
      _io_node_header = @_io.substream(header.len_full_node - 24)
      @node_header = IndexHeader.new(_io_node_header, self, @_root)
      self
    end
    attr_reader :header
    attr_reader :node_header
    attr_reader :_raw_node_header
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L819-L831 Git tag "v7.2"
  class IndexHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_branches = @_io.read_u2le
      @level = @_io.read_u2le
      @branches = []
      (num_branches).times { |i|
        @branches << Branch.new(@_io, self, @_root)
      }
      self
    end

    ##
    # number of child index nodes
    attr_reader :num_branches

    ##
    # tree level
    attr_reader :level

    ##
    # LEB number / offset / length / key branches
    # 
    # All branches have the same size, which is 20 bytes (with the simple
    # key format) plus the hash length in an authenticated file system.
    # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/misc.h#L186-L205 Git tag "v7.2"
    attr_reader :branches
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L480-L539 Git tag "v7.2"
  class InodeHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      _io_key = @_io.substream(16)
      @key = Key.new(_io_key, self, @_root)
      @creation_sequence_number = @_io.read_u8le
      @len_uncompressed = @_io.read_u8le
      @atime_sec = @_io.read_u8le
      @ctime_sec = @_io.read_u8le
      @mtime_sec = @_io.read_u8le
      @atime_nsec = @_io.read_u4le
      @ctime_nsec = @_io.read_u4le
      @mtime_nsec = @_io.read_u4le
      @num_links = @_io.read_u4le
      @uid = @_io.read_u4le
      @gid = @_io.read_u4le
      @mode = @_io.read_u4le
      @flags = @_io.read_u4le
      @len_data = @_io.read_u4le
      @num_xattrs = @_io.read_u4le
      @xattr_size = @_io.read_u4le
      @padding1 = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 0].pack('C*'), @padding1, @_io, "/types/inode_header/seq/17") if not @padding1 == [0, 0, 0, 0].pack('C*')
      @xattr_names = @_io.read_u4le
      @compression = Kaitai::Struct::Stream::resolve_enum(Ubifs::COMPRESSION, @_io.read_u2le)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@compression, @_io, "/types/inode_header/seq/19") if not Ubifs::I__COMPRESSION.key?(@compression)
      @padding2 = @_io.read_bytes(26)
      @data = @_io.read_bytes(len_data)
      self
    end

    ##
    # writes to the inode may only append data
    def append
      return @append unless @append.nil?
      @append = flags & 8 != 0
      @append
    end

    ##
    # use compression for this inode
    def compressed
      return @compressed unless @compressed.nil?
      @compressed = flags & 1 != 0
      @compressed
    end

    ##
    # I/O on this directory inode has to be synchronous
    def dirsync
      return @dirsync unless @dirsync.nil?
      @dirsync = flags & 16 != 0
      @dirsync
    end

    ##
    # use encryption for this inode
    def encrypted
      return @encrypted unless @encrypted.nil?
      @encrypted = flags & 64 != 0
      @encrypted
    end

    ##
    # inode is immutable
    def immutable
      return @immutable unless @immutable.nil?
      @immutable = flags & 4 != 0
      @immutable
    end
    def is_block_device
      return @is_block_device unless @is_block_device.nil?
      @is_block_device = mode & 61440 == 24576
      @is_block_device
    end
    def is_character_device
      return @is_character_device unless @is_character_device.nil?
      @is_character_device = mode & 61440 == 8192
      @is_character_device
    end
    def is_dir
      return @is_dir unless @is_dir.nil?
      @is_dir = mode & 61440 == 16384
      @is_dir
    end
    def is_fifo
      return @is_fifo unless @is_fifo.nil?
      @is_fifo = mode & 61440 == 4096
      @is_fifo
    end
    def is_link
      return @is_link unless @is_link.nil?
      @is_link = mode & 61440 == 40960
      @is_link
    end
    def is_regular
      return @is_regular unless @is_regular.nil?
      @is_regular = mode & 61440 == 32768
      @is_regular
    end
    def is_socket
      return @is_socket unless @is_socket.nil?
      @is_socket = mode & 61440 == 49152
      @is_socket
    end

    ##
    # I/O on this inode has to be synchronous
    def synchronous
      return @synchronous unless @synchronous.nil?
      @synchronous = flags & 2 != 0
      @synchronous
    end

    ##
    # this inode is the inode for an extended attribute value
    def xattr
      return @xattr unless @xattr.nil?
      @xattr = flags & 32 != 0
      @xattr
    end

    ##
    # node key
    attr_reader :key

    ##
    # sequence number at time of creation
    attr_reader :creation_sequence_number

    ##
    # inode size in bytes (amount of uncompressed data)
    attr_reader :len_uncompressed

    ##
    # access time seconds
    attr_reader :atime_sec

    ##
    # status change time seconds
    attr_reader :ctime_sec

    ##
    # modification time seconds
    attr_reader :mtime_sec

    ##
    # access time nanoseconds
    attr_reader :atime_nsec

    ##
    # status change time nanoseconds
    attr_reader :ctime_nsec

    ##
    # modification time nanoseconds
    attr_reader :mtime_nsec

    ##
    # number of hard links
    attr_reader :num_links

    ##
    # owner ID
    attr_reader :uid

    ##
    # group ID
    attr_reader :gid

    ##
    # file type and permissions, as in `st_mode` (see the `is_*`
    # instances for the file type)
    attr_reader :mode

    ##
    # per-inode flags (see the instances `compressed`, `synchronous`,
    # etc.)
    attr_reader :flags

    ##
    # inode data length
    attr_reader :len_data

    ##
    # count of extended attributes this inode has
    attr_reader :num_xattrs

    ##
    # summarized size of all extended attributes in bytes
    attr_reader :xattr_size
    attr_reader :padding1

    ##
    # sum of lengths of all extended attribute names belonging
    # to this inode
    attr_reader :xattr_names

    ##
    # compression type used for this inode
    attr_reader :compression

    ##
    # reserved for future, zeroes
    attr_reader :padding2

    ##
    # Target of a [symbolic link](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/dir.c#L1220-L1241),
    # (encrypted if the inode is encrypted), device number of a device node
    # ([`union ubifs_dev_desc`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L466-L478):
    # 4 bytes from Linux, 8 from `mkfs.ubifs`), or value of an
    # [extended attribute](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/xattr.c#L115-L121)
    # (in its own inode, see `xattr`). Empty otherwise.
    attr_reader :data
    attr_reader :_raw_key
  end

  ##
  # Inode nodes (`inode_header`), directory and extended attribute entry
  # nodes (`directory_header`) and data nodes (`data_header`) store keys in a
  # 16-byte field (`UBIFS_MAX_KEY_LEN`). The simple key format, the only one
  # there is (see `<superblock_header>.key_fmt`), uses only the first 8
  # bytes, and Linux (v7.2)
  # [zeroes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L432-L440)
  # the rest. Branches of index nodes (`branch`)
  # [store only these 8 bytes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L448-L455).
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L16-L22 Git tag "v7.2"
  class Key < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @inode_number = @_io.read_u4le
      @value = @_io.read_bits_int_le(29)
      @type = Kaitai::Struct::Stream::resolve_enum(Ubifs::KEY_TYPES, @_io.read_bits_int_le(3))
      raise Kaitai::Struct::ValidationNotInEnumError.new(@type, @_io, "/types/key/seq/2") if not Ubifs::I__KEY_TYPES.key?(@type)
      @_io.align_to_byte
      @unused = @_io.read_bytes_full
      self
    end

    ##
    # Number of the inode that the node belongs to: the parent directory
    # for a directory entry, the inode that the attribute belongs to for an
    # extended attribute entry.
    attr_reader :inode_number

    ##
    # Block number for a data node, hash of the name (see
    # `<superblock_header>.key_hash`) for a directory or extended
    # attribute entry, 0 for an inode node.
    attr_reader :value

    ##
    # Type of the key, which matches the type of the node.
    attr_reader :type

    ##
    # Rest of the field holding the key: 8 zero bytes in `inode_header`,
    # `directory_header` and `data_header`, empty in `branch`.
    attr_reader :unused
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L685-L756 Git tag "v7.2"
  class MasterHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @highest_inum = @_io.read_u8le
      @commit_number = @_io.read_u8le
      @flags = @_io.read_u4le
      @leb_log = @_io.read_u4le
      @leb_root = @_io.read_u4le
      @ofs_root = @_io.read_u4le
      @len_root = @_io.read_u4le
      @leb_garbage_collect = @_io.read_u4le
      @leb_index_head = @_io.read_u4le
      @ofs_index_head = @_io.read_u4le
      @len_index = @_io.read_u8le
      @total_free = @_io.read_u8le
      @total_dirty = @_io.read_u8le
      @total_used = @_io.read_u8le
      @total_dead = @_io.read_u8le
      @total_dark = @_io.read_u8le
      @leb_lpt = @_io.read_u4le
      @ofs_lpt = @_io.read_u4le
      @leb_nhead = @_io.read_u4le
      @ofs_nhead = @_io.read_u4le
      @leb_lprops_table = @_io.read_u4le
      @ofs_lprops_table = @_io.read_u4le
      @leb_save_table = @_io.read_u4le
      @ofs_save_table = @_io.read_u4le
      @leb_last_lpt_scan = @_io.read_u4le
      @num_empty_lebs = @_io.read_u4le
      @num_index_lebs = @_io.read_u4le
      @num_lebs = @_io.read_u4le
      @hash_root_index = @_io.read_bytes(64)
      @hash_lpt = @_io.read_bytes(64)
      @hmac = @_io.read_bytes(64)
      @padding = @_io.read_bytes(152)
      self
    end

    ##
    # master node is dirty
    def dirty
      return @dirty unless @dirty.nil?
      @dirty = flags & 1 != 0
      @dirty
    end

    ##
    # no orphan inodes present
    def no_orphans
      return @no_orphans unless @no_orphans.nil?
      @no_orphans = flags & 2 != 0
      @no_orphans
    end

    ##
    # written by recovery
    def recovery
      return @recovery unless @recovery.nil?
      @recovery = flags & 4 != 0
      @recovery
    end

    ##
    # highest inode number in the committed index
    attr_reader :highest_inum

    ##
    # commit number
    attr_reader :commit_number

    ##
    # various flags (see the instances `dirty`, `no_orphans` and
    # `recovery`)
    attr_reader :flags

    ##
    # start of the log
    attr_reader :leb_log

    ##
    # LEB number of the root indexing node
    attr_reader :leb_root

    ##
    # offset within the LEB `leb_root`
    attr_reader :ofs_root

    ##
    # root indexing node length
    attr_reader :len_root

    ##
    # LEB reserved for garbage collection, which must be in the main area.
    # 
    # The [comment above `struct ubifs_mst_node`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L695-L696)
    # says that -1 (`0xffff_ffff`) means the LEB was not reserved and should
    # be reserved on mount. However, Linux refuses to mount a file system
    # with -1. Linux
    # [stores](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L362)
    # the field in an
    # [`int`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1424),
    # so `0xffff_ffff` becomes -1. Then -1 is rejected by the condition
    # `c->gc_lnum < c->main_first`, because the main area
    # [starts](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L775-L777)
    # after the superblock, master, log, LPT and orphan areas.
    # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L214-L217 Git tag "v7.2"
    attr_reader :leb_garbage_collect

    ##
    # LEB number of index head
    attr_reader :leb_index_head

    ##
    # offset of index head
    attr_reader :ofs_index_head

    ##
    # size of index on flash
    attr_reader :len_index

    ##
    # total free space in bytes
    attr_reader :total_free

    ##
    # total dirty space in bytes
    attr_reader :total_dirty

    ##
    # total used space in bytes (includes only data LEBs)
    attr_reader :total_used

    ##
    # total dead space in bytes (includes only data LEBs)
    attr_reader :total_dead

    ##
    # total dark space in bytes (includes only data LEBs)
    attr_reader :total_dark

    ##
    # LEB number of LPT root nnode
    attr_reader :leb_lpt

    ##
    # offset of LPT root nnode
    attr_reader :ofs_lpt

    ##
    # LEB number of LPT head
    attr_reader :leb_nhead

    ##
    # offset of LPT head
    attr_reader :ofs_nhead

    ##
    # LEB number of LPT's own lprops table
    attr_reader :leb_lprops_table

    ##
    # offset of LPT's own lprops table
    attr_reader :ofs_lprops_table

    ##
    # LEB number of LPT's save table. Present in every master node, but
    # only meaningful if `<superblock_header>.biglpt` is set: only then
    # does Linux [check the location of the save table](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L252-L256).
    attr_reader :leb_save_table

    ##
    # offset of LPT's save table (only meaningful if
    # `<superblock_header>.biglpt` is set, see `leb_save_table`)
    attr_reader :ofs_save_table

    ##
    # LEB number of last LPT scan
    attr_reader :leb_last_lpt_scan

    ##
    # number of empty logical eraseblocks
    attr_reader :num_empty_lebs

    ##
    # number of indexing logical eraseblocks
    attr_reader :num_index_lebs

    ##
    # count of LEBs used by file-system
    attr_reader :num_lebs

    ##
    # the hash of the root index node
    attr_reader :hash_root_index

    ##
    # the hash of the LPT
    attr_reader :hash_lpt

    ##
    # HMAC to authenticate the master node
    attr_reader :hmac

    ##
    # reserved for future, zeroes
    attr_reader :padding
  end
  class MasterblockNode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = CommonHeader.new(@_io, self, @_root)
      _ = @header
      raise Kaitai::Struct::ValidationExprError.new(@header, @_io, "/types/masterblock_node/seq/0") if not _.node_type == :node_types_master
      _io_node_header = @_io.substream(header.len_full_node - 24)
      @node_header = MasterHeader.new(_io_node_header, self, @_root)
      self
    end
    attr_reader :header
    attr_reader :node_header
    attr_reader :_raw_node_header
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L843-L853 Git tag "v7.2"
  class OrphanHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @commit_number = @_io.read_u8le
      @inode_numbers = []
      i = 0
      while not @_io.eof?
        @inode_numbers << @_io.read_u8le
        i += 1
      end
      self
    end

    ##
    # commit number (also top bit is set on the last node of the commit)
    attr_reader :commit_number

    ##
    # inode numbers of orphans
    attr_reader :inode_numbers
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L606-L615 Git tag "v7.2"
  class PaddingHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_padding = @_io.read_u4le
      self
    end

    ##
    # how many bytes after this node are unused (because padded)
    attr_reader :len_padding
  end

  ##
  # logical eraseblock reference node.
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L758-L772 Git tag "v7.2"
  class ReferenceHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @leb_number = @_io.read_u4le
      @ofs_leb = @_io.read_u4le
      @journal_head_number = @_io.read_u4le
      @padding = @_io.read_bytes(28)
      self
    end

    ##
    # the referred logical eraseblock number
    attr_reader :leb_number

    ##
    # start offset in the referred LEB
    attr_reader :ofs_leb

    ##
    # journal head number
    attr_reader :journal_head_number

    ##
    # reserved for future, zeroes
    attr_reader :padding
  end

  ##
  # Signature of the superblock node of a file system signed when it was
  # created (`mkfs.ubifs` with a key). Linux
  # [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
  # as the first node after the superblock node in LEB0.
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L784-L799 Git tag "v7.2"
  class SignatureHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = @_io.read_u4le
      raise Kaitai::Struct::ValidationNotEqualError.new(1, @type, @_io, "/types/signature_header/seq/0") if not @type == 1
      @len_signature = @_io.read_u4le
      @padding = @_io.read_bytes(32)
      @signature = @_io.read_bytes(len_signature)
      self
    end

    ##
    # type of the signature
    attr_reader :type

    ##
    # length of `signature` in bytes
    attr_reader :len_signature

    ##
    # reserved for future, zeroes
    attr_reader :padding

    ##
    # [PKCS #7 signature](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L233-L236)
    # of the whole superblock node (4096 bytes, including the common
    # header)
    attr_reader :signature
  end

  ##
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L617-L683 Git tag "v7.2"
  class SuperblockHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @padding0 = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0].pack('C*'), @padding0, @_io, "/types/superblock_header/seq/0") if not @padding0 == [0, 0].pack('C*')
      @key_hash = Kaitai::Struct::Stream::resolve_enum(Ubifs::HASHES, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@key_hash, @_io, "/types/superblock_header/seq/1") if not Ubifs::I__HASHES.key?(@key_hash)
      @key_fmt = Kaitai::Struct::Stream::resolve_enum(Ubifs::KEY_FORMATS, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotEqualError.new(:key_formats_simple, @key_fmt, @_io, "/types/superblock_header/seq/2") if not @key_fmt == :key_formats_simple
      @flags = @_io.read_u4le
      @min_io_size = @_io.read_u4le
      @leb_size = @_io.read_u4le
      @num_lebs = @_io.read_u4le
      @max_num_lebs = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(num_lebs, @max_num_lebs, @_io, "/types/superblock_header/seq/7") if not @max_num_lebs >= num_lebs
      @max_bud_bytes = @_io.read_u8le
      @num_log_lebs = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(2, @num_log_lebs, @_io, "/types/superblock_header/seq/9") if not @num_log_lebs >= 2
      @num_lpt_lebs = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(2, @num_lpt_lebs, @_io, "/types/superblock_header/seq/10") if not @num_lpt_lebs >= 2
      @num_orphan_lebs = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(1, @num_orphan_lebs, @_io, "/types/superblock_header/seq/11") if not @num_orphan_lebs >= 1
      @num_journal_heads = @_io.read_u4le
      @fanout = @_io.read_u4le
      @num_save_table_entries = @_io.read_u4le
      @fmt_version = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(4, @fmt_version, @_io, "/types/superblock_header/seq/15") if not @fmt_version >= 4
      @default_compression = Kaitai::Struct::Stream::resolve_enum(Ubifs::COMPRESSION, @_io.read_u2le)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@default_compression, @_io, "/types/superblock_header/seq/16") if not Ubifs::I__COMPRESSION.key?(@default_compression)
      @padding1 = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0].pack('C*'), @padding1, @_io, "/types/superblock_header/seq/17") if not @padding1 == [0, 0].pack('C*')
      @reserve_pool_uid = @_io.read_u4le
      @reserve_pool_gid = @_io.read_u4le
      @reserve_pool_size = @_io.read_u8le
      @time_granularity = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(1, @time_granularity, @_io, "/types/superblock_header/seq/21") if not @time_granularity >= 1
      raise Kaitai::Struct::ValidationGreaterThanError.new(1000000000, @time_granularity, @_io, "/types/superblock_header/seq/21") if not @time_granularity <= 1000000000
      @uuid = @_io.read_bytes(16)
      @ro_compat_version = @_io.read_u4le
      @hmac = @_io.read_bytes(64)
      @hmac_wkm = @_io.read_bytes(64)
      if authenticated
        @hash_algo = Kaitai::Struct::Stream::resolve_enum(Ubifs::HASH_ALGOS, @_io.read_u2le)
        raise Kaitai::Struct::ValidationNotInEnumError.new(@hash_algo, @_io, "/types/superblock_header/seq/26") if not Ubifs::I__HASH_ALGOS.key?(@hash_algo)
      end
      if !(authenticated)
        @hash_algo_unused = @_io.read_u2le
      end
      @hash_mst = @_io.read_bytes(64)
      @padding2 = @_io.read_bytes(3774)
      self
    end

    ##
    # this filesystem contains hashes for authentication
    def authenticated
      return @authenticated unless @authenticated.nil?
      @authenticated = flags & 32 != 0
      @authenticated
    end

    ##
    # if "big" LPT model is used if set
    def biglpt
      return @biglpt unless @biglpt.nil?
      @biglpt = flags & 2 != 0
      @biglpt
    end

    ##
    # store a 32bit cookie in directory entry nodes to
    # support 64bit cookies for lookups by hash
    def double_hash
      return @double_hash unless @double_hash.nil?
      @double_hash = flags & 8 != 0
      @double_hash
    end

    ##
    # filesystem contains encrypted files
    def encrypted
      return @encrypted unless @encrypted.nil?
      @encrypted = flags & 16 != 0
      @encrypted
    end

    ##
    # Length in bytes of the hash of a node (`c->hash_len` in Linux), e.g.
    # in each branch of an index node. In an authenticated file system, it
    # is determined by `hash_algo`. Otherwise, it is 0.
    def len_hash
      return @len_hash unless @len_hash.nil?
      @len_hash = (!(authenticated) ? 0 : ( ((hash_algo == :hash_algos_md4) || (hash_algo == :hash_algos_md5) || (hash_algo == :hash_algos_ripe_md_128) || (hash_algo == :hash_algos_tgr_128))  ? 16 : ( ((hash_algo == :hash_algos_sha1) || (hash_algo == :hash_algos_ripe_md_160) || (hash_algo == :hash_algos_tgr_160))  ? 20 : (hash_algo == :hash_algos_tgr_192 ? 24 : (hash_algo == :hash_algos_sha224 ? 28 : ( ((hash_algo == :hash_algos_sha256) || (hash_algo == :hash_algos_ripe_md_256) || (hash_algo == :hash_algos_wp_256) || (hash_algo == :hash_algos_sm3_256) || (hash_algo == :hash_algos_streebog_256) || (hash_algo == :hash_algos_sha3_256))  ? 32 : (hash_algo == :hash_algos_ripe_md_320 ? 40 : ( ((hash_algo == :hash_algos_sha384) || (hash_algo == :hash_algos_wp_384) || (hash_algo == :hash_algos_sha3_384))  ? 48 : ( ((hash_algo == :hash_algos_sha512) || (hash_algo == :hash_algos_wp_512) || (hash_algo == :hash_algos_streebog_512) || (hash_algo == :hash_algos_sha3_512))  ? 64 : -1)))))))))
      @len_hash
    end

    ##
    # first-mount "fixup" of free space within LEBs needed
    def space_fixup
      return @space_fixup unless @space_fixup.nil?
      @space_fixup = flags & 4 != 0
      @space_fixup
    end

    ##
    # reserved for future, zeroes
    attr_reader :padding0

    ##
    # type of hash function used in keys
    attr_reader :key_hash

    ##
    # format of the key
    attr_reader :key_fmt

    ##
    # file-system flags (see the instances `biglpt`, `space_fixup`, etc.)
    attr_reader :flags

    ##
    # minimal input/output unit size
    attr_reader :min_io_size

    ##
    # logical eraseblock size in bytes
    attr_reader :leb_size

    ##
    # count of LEBs used by file-system
    attr_reader :num_lebs

    ##
    # maximum count of LEBs used by file-system
    attr_reader :max_num_lebs

    ##
    # maximum amount of data stored in buds
    attr_reader :max_bud_bytes

    ##
    # log size in logical eraseblocks
    attr_reader :num_log_lebs

    ##
    # number of LEBs used for lprops table
    attr_reader :num_lpt_lebs

    ##
    # number of LEBs used for recording orphans
    attr_reader :num_orphan_lebs

    ##
    # count of journal heads
    attr_reader :num_journal_heads

    ##
    # tree fanout (max. number of links per indexing node)
    attr_reader :fanout

    ##
    # number of LEB numbers in LPT's save table
    attr_reader :num_save_table_entries

    ##
    # UBIFS on-flash format version
    attr_reader :fmt_version

    ##
    # default compression algorithm (`compression::lzo`, etc.)
    attr_reader :default_compression

    ##
    # reserved for future, zeroes
    attr_reader :padding1

    ##
    # reserve pool UID
    attr_reader :reserve_pool_uid

    ##
    # reserve pool GID
    attr_reader :reserve_pool_gid

    ##
    # size of the reserved pool in bytes
    attr_reader :reserve_pool_size

    ##
    # time granularity in nanoseconds
    attr_reader :time_granularity

    ##
    # UUID generated when the file system image was created
    attr_reader :uuid

    ##
    # UBIFS R/O compatibility version
    attr_reader :ro_compat_version

    ##
    # HMAC to authenticate the superblock node
    attr_reader :hmac

    ##
    # HMAC of a well known message (the string "UBIFS") as a convenience
    # to the user to check if the correct key is passed
    attr_reader :hmac_wkm

    ##
    # The hash algo used for this filesystem
    # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L549-L573 Git tag "v7.2"
    attr_reader :hash_algo

    ##
    # Unused field (would only be meaningful in an authenticated file
    # system, see `hash_algo`). The kernel writes it as 0xffff, `mkfs.ubifs`
    # writes it as 0.
    # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L183-L191 Git tag "v7.2"
    attr_reader :hash_algo_unused

    ##
    # hash of the master node, only valid for signed images in which the
    # master node does not contain a hmac
    attr_reader :hash_mst

    ##
    # reserved for future, zeroes
    attr_reader :padding2
  end
  class SuperblockNode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = CommonHeader.new(@_io, self, @_root)
      _ = @header
      raise Kaitai::Struct::ValidationExprError.new(@header, @_io, "/types/superblock_node/seq/0") if not _.node_type == :node_types_superblock
      _io_node_header = @_io.substream(header.len_full_node - 24)
      @node_header = SuperblockHeader.new(_io_node_header, self, @_root)
      self
    end
    attr_reader :header
    attr_reader :node_header
    attr_reader :_raw_node_header
  end

  ##
  # This node exists only in the journal and never goes to the main area.
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L586-L604 Git tag "v7.2"
  class TruncationHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @inode_number = @_io.read_u4le
      @padding = @_io.read_bytes(12)
      @old_size = @_io.read_u8le
      raise Kaitai::Struct::ValidationLessThanError.new(1, @old_size, @_io, "/types/truncation_header/seq/2") if not @old_size >= 1
      @new_size = @_io.read_u8le
      raise Kaitai::Struct::ValidationGreaterThanError.new(old_size - 1, @new_size, @_io, "/types/truncation_header/seq/3") if not @new_size <= old_size - 1
      self
    end

    ##
    # truncated inode number
    attr_reader :inode_number

    ##
    # reserved for future, zeroes
    attr_reader :padding

    ##
    # size before truncation
    attr_reader :old_size

    ##
    # size after truncation
    attr_reader :new_size
  end

  ##
  # The LEB containing the root index node, as given by `leb_root` in
  # `master_1`.
  # 
  # This instance only provides the substream for `index_root`, which can then
  # use `ofs_root` (an offset within the LEB) as its `pos` directly.
  def index
    return @index unless @index.nil?
    _pos = @_io.pos
    @_io.seek(superblock.node_header.leb_size * master_1.node_header.leb_root)
    _io_index = @_io.substream(superblock.node_header.leb_size)
    @index = Dummy.new(_io_index, self, @_root)
    @_io.seek(_pos)
    @index
  end

  ##
  # The root index node, in the `index` LEB at the offset given by
  # `ofs_root` in `master_1`. All other index nodes, and through them all
  # the files, are reached from it by recursively following the `target` of
  # each of the `branches`.
  def index_root
    return @index_root unless @index_root.nil?
    io = index._io
    _pos = io.pos
    io.seek(master_1.node_header.ofs_root)
    @index_root = IndexBlock.new(io, self, @_root)
    _ = @index_root
    raise Kaitai::Struct::ValidationExprError.new(@index_root, @_io, "/instances/index_root") if not _.header.len_full_node == master_1.node_header.len_root
    io.seek(_pos)
    @index_root
  end

  ##
  # All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
  # at offset `n * <superblock_header>.leb_size`.
  # 
  # Accessing this instance reads the whole image into memory. To get a
  # single LEB, it's cheaper to read `<superblock_header>.leb_size` bytes
  # at the offset of that LEB.
  def lebs
    return @lebs unless @lebs.nil?
    _pos = @_io.pos
    @_io.seek(0)
    @lebs = []
    (superblock.node_header.num_lebs).times { |i|
      @lebs << @_io.read_bytes(superblock.node_header.leb_size)
    }
    @_io.seek(_pos)
    @lebs
  end

  ##
  # Length of the file system image in bytes:
  # `<superblock_header>.num_lebs` LEBs of `<superblock_header>.leb_size`
  # bytes each. Use it to find where the image ends and to detect a
  # truncated image (see the top-level `doc`).
  def len_image
    return @len_image unless @len_image.nil?
    @len_image = superblock.node_header.leb_size * superblock.node_header.num_lebs
    @len_image
  end

  ##
  # The first copy of the master node in LEB1. This Kaitai Struct
  # implementation uses it to locate `index_root`. In an image created by
  # `mkfs.ubifs`, it is the only copy in LEB1.
  # @see https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633 Git tag "v2.3.1"
  def master_1
    return @master_1 unless @master_1.nil?
    _pos = @_io.pos
    @_io.seek(superblock.node_header.leb_size)
    _io_master_1 = @_io.substream(superblock.node_header.leb_size)
    @master_1 = MasterblockNode.new(_io_master_1, self, @_root)
    @_io.seek(_pos)
    @master_1
  end

  ##
  # The first copy of the master node in LEB2. In an image created by
  # `mkfs.ubifs`, it is the same as `master_1` except for the sequence
  # number and CRC in the common header. Linux keeps the master node in both
  # LEB1 and LEB2 for redundancy, and when mounting, it checks that the
  # copies in both match.
  # @see https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633 Git tag "v2.3.1"
  # @see https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L115-L130 Git tag "v7.2"
  def master_2
    return @master_2 unless @master_2.nil?
    _pos = @_io.pos
    @_io.seek(superblock.node_header.leb_size * 2)
    _io_master_2 = @_io.substream(superblock.node_header.leb_size)
    @master_2 = MasterblockNode.new(_io_master_2, self, @_root)
    @_io.seek(_pos)
    @master_2
  end

  ##
  # The superblock node will always be at the start of
  # the first LEB.
  def superblock
    return @superblock unless @superblock.nil?
    _pos = @_io.pos
    @_io.seek(0)
    @superblock = SuperblockNode.new(@_io, self, @_root)
    @_io.seek(_pos)
    @superblock
  end
  attr_reader :_raw_index
  attr_reader :_raw_master_1
  attr_reader :_raw_master_2
end
