# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# MiniFS is a file system found in certain firmware files from TP-Link
# (including its Mercusys brand) and Mercury. Such firmware contains an RTOS
# kernel, e.g. VxWorks in
# [`RE450(V4)_210531.zip`](https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip)
# ([archived](https://web.archive.org/web/20261105175157/https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip))
# or TPOS, TP-Link's RTOS, in
# [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
# ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
# 
# According to a TP-Link manager quoted in a
# [2021 article](https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)
# ([archived](https://web.archive.org/web/20230513175833/https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)),
# Mercusys has been sold in China as Mercury since 2001. All Mercury images
# examined contain a certificate with `O=tplink` in its issuer and subject.
# 
# All versions share the same header, and its `version` field determines the
# layout of the rest of the image.
# 
# In version 3, the header is followed by a table of directory paths and file
# names, followed by meta information for each file, meta information about
# the LZMA compressed blobs including length, offset and uncompressed length,
# and then a number of LZMA compressed blobs.
# 
# The LZMA blobs can contain the concatenated contents of multiple files.
# The meta information of a file contains the offsets of its directory path
# and file name, the LZMA blob (numbering starts at 0), the offset of the file
# in the uncompressed data and the size of the uncompressed file.
# 
# Some version 3 images have no uncompressed length in the meta information
# about the blobs (see `has_8_byte_lzma_metas` in `body_v3`).
# 
# In version 2, the header is followed by the length of the files area and a
# meta information record for each file, each followed directly by the file's
# data. Unlike versions 1 and 3, version 2 stores no paths or file names at
# all, only the MD5 hash of each file's path.
# 
# In version 1, the header is followed by a record with the path, the compressed
# length and the offset of each file, and then one LZMA blob per file.
# 
# This Kaitai Struct implementation was written independently of the paper
# [Reverse Engineered MiniFS File System](https://arxiv.org/abs/2407.05064v1).
# It was started in the firmware analysis project
# [BANG](https://github.com/armijnhemel/binaryanalysis-ng) (Binary Analysis
# Next Generation) in
# [2021](https://github.com/armijnhemel/binaryanalysis-ng/commit/531203a076e3761116320b77b2b9c64a9dca6186)
# and submitted to the Kaitai Struct format gallery in
# [September 2023](https://github.com/kaitai-io/kaitai_struct_formats/pull/682),
# whereas the paper was published in July 2024.
# @see https://arxiv.org/html/2407.05064v1#S4 The paper, section 4 (version 3)
# @see https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py tp_research's `Minifs.py` (version 2)
# @see https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py unblob's MiniFS handler (version 3)
class TplinkMinifs < Kaitai::Struct::Struct

  COMPRESSION_TYPE = {
    0 => :compression_type_lzma,
    2 => :compression_type_raw,
    4 => :compression_type_lzma_2014,
  }
  I__COMPRESSION_TYPE = COMPRESSION_TYPE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @header = MinifsHeader.new(@_io, self, @_root)
    case header.version
    when 1
      @body = BodyV1.new(@_io, self, @_root)
    when 2
      @body = BodyV2.new(@_io, self, @_root)
    when 3
      @body = BodyV3.new(@_io, self, @_root)
    end
    self
  end

  ##
  # @see https://arxiv.org/html/2407.05064v1#S2.SS2 Source
  class BodyV1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @inodes = []
      (_root.header.num_files).times { |i|
        @inodes << InodeV1.new(@_io, self, @_root, (i != 0 ? inodes[i - 1].ofs_end : 0))
      }
      _io_blobs_area = @_io.substream(inodes.last.ofs_end)
      @blobs_area = Dummy.new(_io_blobs_area, self, @_root)
      self
    end
    attr_reader :inodes
    attr_reader :blobs_area
    attr_reader :_raw_blobs_area
  end
  class BodyV2 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_files_area = @_io.read_u4be
      _io_files_area = @_io.substream(len_files_area)
      @files_area = FilesAreaV2.new(_io_files_area, self, @_root)
      self
    end
    attr_reader :len_files_area
    attr_reader :files_area
    attr_reader :_raw_files_area
  end
  class BodyV3 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_name_table = @_io.read_u4be
      _io_name_table = @_io.substream(len_name_table)
      @name_table = NameTable.new(_io_name_table, self, @_root)
      @inodes = []
      (_root.header.num_files).times { |i|
        @inodes << Inode.new(@_io, self, @_root, (i != 0 ? inodes[i - 1].cur_max_lzma_blob : 0))
      }
      if ofs_lzma_metas < 0
        @_unnamed3 = @_io.read_bytes(0)
      end
      @lzma_metas = []
      (num_lzma_blobs).times { |i|
        @lzma_metas << LzmaMeta.new(@_io, self, @_root, (i != 0 ? lzma_metas[i - 1].ofs_end : 0))
      }
      _io_lzma_blobs_area = @_io.substream(lzma_metas.last.ofs_end)
      @lzma_blobs_area = Dummy.new(_io_lzma_blobs_area, self, @_root)
      self
    end

    ##
    # Whether each record in `lzma_metas` lacks `len_blob_uncompressed` and
    # is therefore 8 bytes in size instead of 12.
    # 
    # The MiniFS header doesn't say which size is used (both use version 3),
    # so this Kaitai Struct implementation infers it using a heuristic based
    # on the `.lzma` header of the first blob. Bytes 5 to 12 of that header
    # are the uncompressed size, which was unknown (all bits set) for all
    # blobs in all version 3 images examined. So with 8-byte records,
    # `len_first_blob_uncompressed_if_8_byte_metas` has all bits set. With
    # 12-byte records, the same 8 bytes aren't the uncompressed size. With 3
    # or more blobs, they include a whole offset or length in `lzma_metas`,
    # which would have to be 4 GiB. With 1 or 2 blobs, they include the
    # first blob's dictionary size, which is 8 MiB in all images examined.
    # 
    # An image with 8-byte records and a known uncompressed size would be
    # rejected, or misparsed if it has a single blob and other data follows it.
    # 
    # In the images examined, 8-byte records occur in firmware files with
    # modification times from 2018 to 2022 (as stored in their ZIPs), e.g. in
    # [`MW301R(EU)_V2_180821.zip`](https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)
    # ([archived](https://web.archive.org/web/20261105093950/https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)),
    # listed on <https://www.mercusys.com/en/download/mw301r/v2/>
    # ([archived](https://web.archive.org/web/20261105142659/https://www.mercusys.com/en/download/mw301r/v2/)).
    # 
    # As far as we know, this implementation is the first description of
    # 8-byte records. The other descriptions and tools found either assume
    # 12 bytes or don't read `lzma_metas` at all. So there is no reference
    # to compare it with, and the evidence comes from the images. In all 49
    # distinct images examined with 8-byte records, the bytes at each
    # record's offset and length are exactly one complete LZMA stream. Each
    # such stream decompresses to exactly the length that the files packed
    # into it need. The file that ends last in it ends exactly where the
    # decompressed data ends. In addition:
    # 
    # * 2614 of the 7230 files in these 49 images have the same path and
    #   contents as a file in an image with 12-byte records. For example,
    #   49 files are the same in the image with 8-byte records in
    #   [`TL-WA850RE(EU)_V7_201029.zip`](https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip)
    #   ([archived](https://web.archive.org/web/20220326032207/https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip))
    #   and the image with 12-byte records in
    #   [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
    #   ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
    # * The repository
    #   [NurMohammadDuari/mw325r-hack-lab](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45)
    #   has the [files](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45/extracted-minifs)
    #   of the image with 8-byte records in
    #   [`MW325R(EU)_V2_20111620201211065426.zip`](https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)
    #   ([archived](https://web.archive.org/web/20261105093427/https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)).
    #   They match the files parsed by this implementation in all 92 files
    #   that can be compared. Its
    #   [extractor](https://github.com/NurMohammadDuari/mw325r-hack-lab/blob/024da680dbf4f9ca287d562622f02d7d8875bd45/analysis/minifs_extract.py)
    #   finds the blobs by searching for LZMA headers instead of reading
    #   `lzma_metas`.
    def has_8_byte_lzma_metas
      return @has_8_byte_lzma_metas unless @has_8_byte_lzma_metas.nil?
      @has_8_byte_lzma_metas = len_first_blob_uncompressed_if_8_byte_metas == 18446744073709551615
      @has_8_byte_lzma_metas
    end

    ##
    # The uncompressed size in the `.lzma` header of the first blob, if
    # `lzma_metas` have 8-byte records. It follows the properties byte and the
    # 4-byte dictionary size.
    def len_first_blob_uncompressed_if_8_byte_metas
      return @len_first_blob_uncompressed_if_8_byte_metas unless @len_first_blob_uncompressed_if_8_byte_metas.nil?
      _pos = @_io.pos
      @_io.seek((ofs_lzma_metas + 8 * num_lzma_blobs) + 5)
      @len_first_blob_uncompressed_if_8_byte_metas = @_io.read_u8le
      @_io.seek(_pos)
      @len_first_blob_uncompressed_if_8_byte_metas
    end

    ##
    # The size of each record in `lzma_metas` (8 or 12 bytes).
    def len_lzma_meta
      return @len_lzma_meta unless @len_lzma_meta.nil?
      @len_lzma_meta = (has_8_byte_lzma_metas ? 8 : 12)
      @len_lzma_meta
    end

    ##
    # Count starts at 0, so there is one more blob than the highest blob number
    # @see https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L129-L130 Source
    def num_lzma_blobs
      return @num_lzma_blobs unless @num_lzma_blobs.nil?
      @num_lzma_blobs = inodes.last.cur_max_lzma_blob + 1
      @num_lzma_blobs
    end
    def ofs_lzma_metas
      return @ofs_lzma_metas unless @ofs_lzma_metas.nil?
      @ofs_lzma_metas = _io.pos
      @ofs_lzma_metas
    end
    attr_reader :len_name_table
    attr_reader :name_table
    attr_reader :inodes
    attr_reader :_unnamed3
    attr_reader :lzma_metas
    attr_reader :lzma_blobs_area
    attr_reader :_raw_name_table
    attr_reader :_raw_lzma_blobs_area
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

  ##
  # @see https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L41-L52 Source
  class FileV2 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @path_md5 = @_io.read_bytes(16)
      @len_data = @_io.read_u4be
      @ofs_data = @_io.read_u4be
      raise Kaitai::Struct::ValidationNotEqualError.new(_io.pos + 8, @ofs_data, @_io, "/types/file_v2/seq/2") if not @ofs_data == _io.pos + 8
      @len_data_uncompressed = @_io.read_u4be
      @compression = Kaitai::Struct::Stream::resolve_enum(TplinkMinifs::COMPRESSION_TYPE, @_io.read_u4be)
      @data = @_io.read_bytes(len_data)
      self
    end

    ##
    # The MD5 hash of the absolute path of the file, e.g. of
    # `/conf/priv-key.pem`.
    # 
    # Version 2 images store only these hashes, not the paths, so a path can
    # only be found by hashing candidate paths and comparing.
    # [`Minifs.py`](https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L181-L209)
    # takes the candidates from path-like strings in the files' contents.
    attr_reader :path_md5
    attr_reader :len_data

    ##
    # Offset of `data` relative to the start of `<body_v2>.files_area`.
    attr_reader :ofs_data
    attr_reader :len_data_uncompressed
    attr_reader :compression

    ##
    # With `compression_type::lzma`, an LZMA stream in the `.lzma` format
    # (also known as LZMA_Alone). Decompress it in the same way as
    # `<lzma_meta>.blob`.
    # 
    # In all images examined, the `.lzma` header specifies the properties
    # lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
    # bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
    # stream, and there is no end-of-payload marker.
    attr_reader :data
  end
  class FilesAreaV2 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @files = []
      (_root.header.num_files).times { |i|
        @files << FileV2.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :files
  end

  ##
  # @see https://arxiv.org/html/2407.05064v1#S4.SS3 Source
  # @see https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L36-L42 Source
  class Inode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, prev_max_lzma_blob)
      super(_io, _parent, _root)
      @prev_max_lzma_blob = prev_max_lzma_blob
      _read
    end

    def _read
      @ofs_directory_path = @_io.read_u4be
      @ofs_file_name = @_io.read_u4be
      @lzma_blob = @_io.read_u4be
      @ofs_file = @_io.read_u4be
      @len_file = @_io.read_u4be
      self
    end
    def cur_max_lzma_blob
      return @cur_max_lzma_blob unless @cur_max_lzma_blob.nil?
      @cur_max_lzma_blob = (lzma_blob > prev_max_lzma_blob ? lzma_blob : prev_max_lzma_blob)
      @cur_max_lzma_blob
    end
    def directory_path
      return @directory_path unless @directory_path.nil?
      io = _parent.name_table._io
      _pos = io.pos
      io.seek(ofs_directory_path)
      @directory_path = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      io.seek(_pos)
      @directory_path
    end
    def file_name
      return @file_name unless @file_name.nil?
      io = _parent.name_table._io
      _pos = io.pos
      io.seek(ofs_file_name)
      @file_name = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      io.seek(_pos)
      @file_name
    end
    attr_reader :ofs_directory_path
    attr_reader :ofs_file_name
    attr_reader :lzma_blob
    attr_reader :ofs_file
    attr_reader :len_file
    attr_reader :prev_max_lzma_blob
  end
  class InodeV1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, prev_ofs_end)
      super(_io, _parent, _root)
      @prev_ofs_end = prev_ofs_end
      _read
    end

    def _read
      @path = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(80), 0, false)).force_encoding("ASCII").encode('UTF-8')
      @len_blob = @_io.read_u4be
      @ofs_blob = @_io.read_u4be
      raise Kaitai::Struct::ValidationNotEqualError.new(prev_ofs_end, @ofs_blob, @_io, "/types/inode_v1/seq/2") if not @ofs_blob == prev_ofs_end
      self
    end

    ##
    # An LZMA stream in the `.lzma` format (also known as LZMA_Alone) with
    # the contents of the file. Decompress it in the same way as
    # `<lzma_meta>.blob`.
    # 
    # In all images examined, the `.lzma` header specifies the properties
    # lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
    # bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
    # stream, and there is no end-of-payload marker.
    def blob
      return @blob unless @blob.nil?
      io = _parent.blobs_area._io
      _pos = io.pos
      io.seek(ofs_blob)
      @blob = io.read_bytes(len_blob)
      io.seek(_pos)
      @blob
    end
    def ofs_end
      return @ofs_end unless @ofs_end.nil?
      @ofs_end = ofs_blob + len_blob
      @ofs_end
    end
    attr_reader :path
    attr_reader :len_blob

    ##
    # Relative to the start of `<body_v1>.blobs_area`.
    attr_reader :ofs_blob
    attr_reader :prev_ofs_end
  end

  ##
  # @see https://arxiv.org/html/2407.05064v1#S4.SS4 Source
  # @see https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L44-L48 Source
  class LzmaMeta < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, prev_ofs_end)
      super(_io, _parent, _root)
      @prev_ofs_end = prev_ofs_end
      _read
    end

    def _read
      @ofs_blob = @_io.read_u4be
      raise Kaitai::Struct::ValidationNotEqualError.new(prev_ofs_end, @ofs_blob, @_io, "/types/lzma_meta/seq/0") if not @ofs_blob == prev_ofs_end
      @len_blob = @_io.read_u4be
      if !(_parent.has_8_byte_lzma_metas)
        @len_blob_uncompressed = @_io.read_u4be
      end
      self
    end

    ##
    # An LZMA stream in the `.lzma` format (also known as LZMA_Alone):
    # a 13-byte header followed by the compressed data. Decompress it
    # with a ready-made LZMA decoder that reads this header, e.g. in
    # Python with `lzma.decompress(blob, format=lzma.FORMAT_ALONE)`. The
    # size of the decompressed data is `len_blob_uncompressed`, if present.
    # 
    # In all images examined with `header.version` = 3, the `.lzma` header
    # specifies the properties lc = 3, lp = 0, pb = 2 and an 8 MiB
    # dictionary, so it starts with the bytes `5D 00 00 80 00`. The
    # uncompressed size in the header is unknown (`0xFFFF_FFFF_FFFF_FFFF`),
    # so the stream ends with an end-of-payload marker.
    # @see https://arxiv.org/html/2407.05064v1#S4.SS5 Source
    # @see https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L175-L187 Source
    def blob
      return @blob unless @blob.nil?
      io = _parent.lzma_blobs_area._io
      _pos = io.pos
      io.seek(ofs_blob)
      @blob = io.read_bytes(len_blob)
      io.seek(_pos)
      @blob
    end
    def ofs_end
      return @ofs_end unless @ofs_end.nil?
      @ofs_end = ofs_blob + len_blob
      @ofs_end
    end
    attr_reader :ofs_blob
    attr_reader :len_blob
    attr_reader :len_blob_uncompressed
    attr_reader :prev_ofs_end
  end

  ##
  # @see https://arxiv.org/html/2407.05064v1#S4.SS1 Source
  # @see https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L27-L34 Source
  class MinifsHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(16)
      raise Kaitai::Struct::ValidationNotEqualError.new([77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*'), @magic, @_io, "/types/minifs_header/seq/0") if not @magic == [77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*')
      @version = @_io.read_u4be
      raise Kaitai::Struct::ValidationNotAnyOfError.new(@version, @_io, "/types/minifs_header/seq/1") if not  ((@version == 1) || (@version == 2) || (@version == 3)) 
      @num_files = @_io.read_u4be
      @len_largest_file = @_io.read_u4be
      self
    end
    attr_reader :magic
    attr_reader :version
    attr_reader :num_files

    ##
    # The uncompressed size of the largest file. In all images examined with
    # version 3, the inodes are sorted by size in descending order, so it is
    # also the size of the first file. In all images examined with versions
    # 1 and 2, the value is rounded up to a multiple of 4.
    attr_reader :len_largest_file
  end

  ##
  # Table of null-terminated directory paths and file names, referenced by
  # `<inode>.ofs_directory_path` and `<inode>.ofs_file_name`. In all images
  # examined, each non-empty string occurs only once, which saves space in
  # flash memory, as many files share a directory or a name.
  # 
  # In all images examined, the table is padded with null bytes to a multiple
  # of 4 bytes, so `names` can end with up to 3 empty strings (one for each
  # padding byte).
  # @see https://arxiv.org/html/2407.05064v1#S4.SS2 Source
  class NameTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @names = []
      i = 0
      while not @_io.eof?
        @names << (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII").encode('UTF-8')
        i += 1
      end
      self
    end
    attr_reader :names
  end
  attr_reader :header
  attr_reader :body
end
