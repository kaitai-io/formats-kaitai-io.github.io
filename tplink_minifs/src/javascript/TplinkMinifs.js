// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.TplinkMinifs || (root.TplinkMinifs = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (TplinkMinifs_, KaitaiStream) {
/**
 * MINIFS is a file system found in certain firmware files from TP-Link
 * (including its Mercusys brand) and Mercury. Such firmware contains an RTOS
 * kernel, e.g. VxWorks in
 * [`RE450(V4)_210531.zip`](https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip)
 * ([archived](https://web.archive.org/web/20261105175157/https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip))
 * or TPOS, TP-Link's RTOS, in
 * [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
 * ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
 * 
 * According to a TP-Link manager quoted in a
 * [2021 article](https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)
 * ([archived](https://web.archive.org/web/20230513175833/https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)),
 * Mercusys has been sold in China as Mercury since 2001. All Mercury images
 * examined contain a certificate with `O=tplink` in its issuer and subject.
 * 
 * All versions share the same header, and its `version` field determines the
 * layout of the rest of the image.
 * 
 * In version 3, the header is followed by a table of directory paths and file
 * names, followed by meta information for each file, meta information about
 * the LZMA compressed blobs including length, offset and uncompressed length,
 * and then a number of LZMA compressed blobs.
 * 
 * The LZMA blobs can contain the concatenated contents of multiple files.
 * The meta information of a file contains the offsets of its directory path
 * and file name, the LZMA blob (numbering starts at 0), the offset of the file
 * in the uncompressed data and the size of the uncompressed file.
 * 
 * Some version 3 images have no uncompressed length in the meta information
 * about the blobs (see `has_8_byte_lzma_metas` in `body_v3`).
 * 
 * In version 2, the header is followed by the length of the files area and a
 * meta information record for each file, each followed directly by the file's
 * data. Unlike versions 1 and 3, version 2 stores no paths or file names at
 * all, only the MD5 hash of each file's path.
 * 
 * In version 1, the header is followed by a record with the path, the compressed
 * length and the offset of each file, and then one LZMA blob per file.
 * 
 * This Kaitai Struct implementation was written independently of the paper
 * [Reverse Engineered MiniFS File System](https://arxiv.org/abs/2407.05064v1).
 * It was started in the firmware analysis project
 * [BANG](https://github.com/armijnhemel/binaryanalysis-ng) (Binary Analysis
 * Next Generation) in
 * [2021](https://github.com/armijnhemel/binaryanalysis-ng/commit/531203a076e3761116320b77b2b9c64a9dca6186)
 * and submitted to the Kaitai Struct format gallery in
 * [September 2023](https://github.com/kaitai-io/kaitai_struct_formats/pull/682),
 * whereas the paper was published in July 2024.
 * @see {@link https://arxiv.org/html/2407.05064v1#S4|The paper, section 4 (version 3)}
 * @see {@link https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py|tp_research's `Minifs.py` (version 2)}
 * @see {@link https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py|unblob's MiniFS handler (version 3)}
 */

var TplinkMinifs = (function() {
  TplinkMinifs.CompressionType = Object.freeze({
    LZMA: 0,
    RAW: 2,
    LZMA_2014: 4,

    0: "LZMA",
    2: "RAW",
    4: "LZMA_2014",
  });

  function TplinkMinifs(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  TplinkMinifs.prototype._read = function() {
    this.header = new MinifsHeader(this._io, this, this._root);
    switch (this.header.version) {
    case 1:
      this.body = new BodyV1(this._io, this, this._root);
      break;
    case 2:
      this.body = new BodyV2(this._io, this, this._root);
      break;
    case 3:
      this.body = new BodyV3(this._io, this, this._root);
      break;
    }
  }

  /**
   * @see {@link https://arxiv.org/html/2407.05064v1#S2.SS2|Source}
   */

  var BodyV1 = TplinkMinifs.BodyV1 = (function() {
    function BodyV1(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    BodyV1.prototype._read = function() {
      this.inodes = [];
      for (var i = 0; i < this._root.header.numFiles; i++) {
        this.inodes.push(new InodeV1(this._io, this, this._root, (i != 0 ? this.inodes[i - 1].ofsEnd : 0)));
      }
      this._raw_blobsArea = this._io.readBytes(this.inodes[this.inodes.length - 1].ofsEnd);
      var _io__raw_blobsArea = new KaitaiStream(this._raw_blobsArea);
      this.blobsArea = new Dummy(_io__raw_blobsArea, this, this._root);
    }

    return BodyV1;
  })();

  var BodyV2 = TplinkMinifs.BodyV2 = (function() {
    function BodyV2(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    BodyV2.prototype._read = function() {
      this.lenFilesArea = this._io.readU4be();
      this._raw_filesArea = this._io.readBytes(this.lenFilesArea);
      var _io__raw_filesArea = new KaitaiStream(this._raw_filesArea);
      this.filesArea = new FilesAreaV2(_io__raw_filesArea, this, this._root);
    }

    return BodyV2;
  })();

  var BodyV3 = TplinkMinifs.BodyV3 = (function() {
    function BodyV3(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    BodyV3.prototype._read = function() {
      this.lenNameTable = this._io.readU4be();
      this._raw_nameTable = this._io.readBytes(this.lenNameTable);
      var _io__raw_nameTable = new KaitaiStream(this._raw_nameTable);
      this.nameTable = new NameTable(_io__raw_nameTable, this, this._root);
      this.inodes = [];
      for (var i = 0; i < this._root.header.numFiles; i++) {
        this.inodes.push(new Inode(this._io, this, this._root, (i != 0 ? this.inodes[i - 1].curMaxLzmaBlob : 0)));
      }
      if (this.ofsLzmaMetas < 0) {
        this._unnamed3 = this._io.readBytes(0);
      }
      this.lzmaMetas = [];
      for (var i = 0; i < this.numLzmaBlobs; i++) {
        this.lzmaMetas.push(new LzmaMeta(this._io, this, this._root, (i != 0 ? this.lzmaMetas[i - 1].ofsEnd : 0)));
      }
      this._raw_lzmaBlobsArea = this._io.readBytes(this.lzmaMetas[this.lzmaMetas.length - 1].ofsEnd);
      var _io__raw_lzmaBlobsArea = new KaitaiStream(this._raw_lzmaBlobsArea);
      this.lzmaBlobsArea = new Dummy(_io__raw_lzmaBlobsArea, this, this._root);
    }

    /**
     * Whether each record in `lzma_metas` lacks `len_blob_uncompressed` and
     * is therefore 8 bytes in size instead of 12.
     * 
     * The MINIFS header doesn't say which size is used (both use version 3),
     * so this Kaitai Struct implementation infers it using a heuristic based
     * on the `.lzma` header of the first blob. Bytes 5 to 12 of that header
     * are the uncompressed size, which was unknown (all bits set) for all
     * blobs in all version 3 images examined. So with 8-byte records,
     * `len_first_blob_uncompressed_if_8_byte_metas` has all bits set. With
     * 12-byte records, the same 8 bytes aren't the uncompressed size. With 3
     * or more blobs, they include a whole offset or length in `lzma_metas`,
     * which would have to be 4 GiB. With 1 or 2 blobs, they include the
     * first blob's dictionary size, which is 8 MiB in all images examined.
     * 
     * An image with 8-byte records and a known uncompressed size would be
     * rejected, or misparsed if it has a single blob and other data follows it.
     * 
     * In the images examined, 8-byte records occur in firmware files with
     * modification times from 2018 to 2022 (as stored in their ZIPs), e.g. in
     * [`MW301R(EU)_V2_180821.zip`](https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)
     * ([archived](https://web.archive.org/web/20261105093950/https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)),
     * listed on <https://www.mercusys.com/en/download/mw301r/v2/>
     * ([archived](https://web.archive.org/web/20261105142659/https://www.mercusys.com/en/download/mw301r/v2/)).
     * 
     * As far as we know, this implementation is the first description of
     * 8-byte records. The other descriptions and tools found either assume
     * 12 bytes or don't read `lzma_metas` at all. So there is no reference
     * to compare it with, and the evidence comes from the images. In all 49
     * distinct images examined with 8-byte records, the bytes at each
     * record's offset and length are exactly one complete LZMA stream. Each
     * such stream decompresses to exactly the length that the files packed
     * into it need. The file that ends last in it ends exactly where the
     * decompressed data ends. In addition:
     * 
     * * 2614 of the 7230 files in these 49 images have the same path and
     *   contents as a file in an image with 12-byte records. For example,
     *   49 files are the same in the image with 8-byte records in
     *   [`TL-WA850RE(EU)_V7_201029.zip`](https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip)
     *   ([archived](https://web.archive.org/web/20220326032207/https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip))
     *   and the image with 12-byte records in
     *   [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
     *   ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
     * * The repository
     *   [NurMohammadDuari/mw325r-hack-lab](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45)
     *   has the [files](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45/extracted-minifs)
     *   of the image with 8-byte records in
     *   [`MW325R(EU)_V2_20111620201211065426.zip`](https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)
     *   ([archived](https://web.archive.org/web/20261105093427/https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)).
     *   They match the files parsed by this implementation in all 92 files
     *   that can be compared. Its
     *   [extractor](https://github.com/NurMohammadDuari/mw325r-hack-lab/blob/024da680dbf4f9ca287d562622f02d7d8875bd45/analysis/minifs_extract.py)
     *   finds the blobs by searching for LZMA headers instead of reading
     *   `lzma_metas`.
     */
    Object.defineProperty(BodyV3.prototype, 'has8ByteLzmaMetas', {
      get: function() {
        if (this._m_has8ByteLzmaMetas !== undefined)
          return this._m_has8ByteLzmaMetas;
        this._m_has8ByteLzmaMetas = this.lenFirstBlobUncompressedIf8ByteMetas == 18446744073709551615;
        return this._m_has8ByteLzmaMetas;
      }
    });

    /**
     * The uncompressed size in the `.lzma` header of the first blob, if
     * `lzma_metas` have 8-byte records. It follows the properties byte and the
     * 4-byte dictionary size.
     */
    Object.defineProperty(BodyV3.prototype, 'lenFirstBlobUncompressedIf8ByteMetas', {
      get: function() {
        if (this._m_lenFirstBlobUncompressedIf8ByteMetas !== undefined)
          return this._m_lenFirstBlobUncompressedIf8ByteMetas;
        var _pos = this._io.pos;
        this._io.seek((this.ofsLzmaMetas + 8 * this.numLzmaBlobs) + 5);
        this._m_lenFirstBlobUncompressedIf8ByteMetas = this._io.readU8le();
        this._io.seek(_pos);
        return this._m_lenFirstBlobUncompressedIf8ByteMetas;
      }
    });

    /**
     * The size of each record in `lzma_metas` (8 or 12 bytes).
     */
    Object.defineProperty(BodyV3.prototype, 'lenLzmaMeta', {
      get: function() {
        if (this._m_lenLzmaMeta !== undefined)
          return this._m_lenLzmaMeta;
        this._m_lenLzmaMeta = (this.has8ByteLzmaMetas ? 8 : 12);
        return this._m_lenLzmaMeta;
      }
    });

    /**
     * Count starts at 0, so there is one more blob than the highest blob number
     * @see {@link https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L129-L130|Source}
     */
    Object.defineProperty(BodyV3.prototype, 'numLzmaBlobs', {
      get: function() {
        if (this._m_numLzmaBlobs !== undefined)
          return this._m_numLzmaBlobs;
        this._m_numLzmaBlobs = this.inodes[this.inodes.length - 1].curMaxLzmaBlob + 1;
        return this._m_numLzmaBlobs;
      }
    });
    Object.defineProperty(BodyV3.prototype, 'ofsLzmaMetas', {
      get: function() {
        if (this._m_ofsLzmaMetas !== undefined)
          return this._m_ofsLzmaMetas;
        this._m_ofsLzmaMetas = this._io.pos;
        return this._m_ofsLzmaMetas;
      }
    });

    return BodyV3;
  })();

  var Dummy = TplinkMinifs.Dummy = (function() {
    function Dummy(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Dummy.prototype._read = function() {
    }

    return Dummy;
  })();

  /**
   * @see {@link https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L41-L52|Source}
   */

  var FileV2 = TplinkMinifs.FileV2 = (function() {
    function FileV2(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FileV2.prototype._read = function() {
      this.pathMd5 = this._io.readBytes(16);
      this.lenData = this._io.readU4be();
      this.ofsData = this._io.readU4be();
      if (!(this.ofsData == this._io.pos + 8)) {
        throw new KaitaiStream.ValidationNotEqualError(this._io.pos + 8, this.ofsData, this._io, "/types/file_v2/seq/2");
      }
      this.lenDataUncompressed = this._io.readU4be();
      this.compression = this._io.readU4be();
      this.data = this._io.readBytes(this.lenData);
    }

    /**
     * The MD5 hash of the absolute path of the file, e.g. of
     * `/conf/priv-key.pem`.
     * 
     * Version 2 images store only these hashes, not the paths, so a path can
     * only be found by hashing candidate paths and comparing.
     * [`Minifs.py`](https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L181-L209)
     * takes the candidates from path-like strings in the files' contents.
     */

    /**
     * Offset of `data` relative to the start of `<body_v2>.files_area`.
     */

    /**
     * With `compression_type::lzma`, an LZMA stream in the `.lzma` format
     * (also known as LZMA_Alone). Decompress it in the same way as
     * `<lzma_meta>.blob`.
     * 
     * In all images examined, the `.lzma` header specifies the properties
     * lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
     * bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
     * stream, and there is no end-of-payload marker.
     */

    return FileV2;
  })();

  var FilesAreaV2 = TplinkMinifs.FilesAreaV2 = (function() {
    function FilesAreaV2(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FilesAreaV2.prototype._read = function() {
      this.files = [];
      for (var i = 0; i < this._root.header.numFiles; i++) {
        this.files.push(new FileV2(this._io, this, this._root));
      }
    }

    return FilesAreaV2;
  })();

  /**
   * @see {@link https://arxiv.org/html/2407.05064v1#S4.SS3|Source}
   * @see {@link https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L36-L42|Source}
   */

  var Inode = TplinkMinifs.Inode = (function() {
    function Inode(_io, _parent, _root, prevMaxLzmaBlob) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.prevMaxLzmaBlob = prevMaxLzmaBlob;

      this._read();
    }
    Inode.prototype._read = function() {
      this.ofsDirectoryPath = this._io.readU4be();
      this.ofsFileName = this._io.readU4be();
      this.lzmaBlob = this._io.readU4be();
      this.ofsFile = this._io.readU4be();
      this.lenFile = this._io.readU4be();
    }
    Object.defineProperty(Inode.prototype, 'curMaxLzmaBlob', {
      get: function() {
        if (this._m_curMaxLzmaBlob !== undefined)
          return this._m_curMaxLzmaBlob;
        this._m_curMaxLzmaBlob = (this.lzmaBlob > this.prevMaxLzmaBlob ? this.lzmaBlob : this.prevMaxLzmaBlob);
        return this._m_curMaxLzmaBlob;
      }
    });
    Object.defineProperty(Inode.prototype, 'directoryPath', {
      get: function() {
        if (this._m_directoryPath !== undefined)
          return this._m_directoryPath;
        var io = this._parent.nameTable._io;
        var _pos = io.pos;
        io.seek(this.ofsDirectoryPath);
        this._m_directoryPath = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "ASCII");
        io.seek(_pos);
        return this._m_directoryPath;
      }
    });
    Object.defineProperty(Inode.prototype, 'fileName', {
      get: function() {
        if (this._m_fileName !== undefined)
          return this._m_fileName;
        var io = this._parent.nameTable._io;
        var _pos = io.pos;
        io.seek(this.ofsFileName);
        this._m_fileName = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "ASCII");
        io.seek(_pos);
        return this._m_fileName;
      }
    });

    return Inode;
  })();

  var InodeV1 = TplinkMinifs.InodeV1 = (function() {
    function InodeV1(_io, _parent, _root, prevOfsEnd) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.prevOfsEnd = prevOfsEnd;

      this._read();
    }
    InodeV1.prototype._read = function() {
      this.path = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(80), 0, false), "ASCII");
      this.lenBlob = this._io.readU4be();
      this.ofsBlob = this._io.readU4be();
      if (!(this.ofsBlob == this.prevOfsEnd)) {
        throw new KaitaiStream.ValidationNotEqualError(this.prevOfsEnd, this.ofsBlob, this._io, "/types/inode_v1/seq/2");
      }
    }

    /**
     * An LZMA stream in the `.lzma` format (also known as LZMA_Alone) with
     * the contents of the file. Decompress it in the same way as
     * `<lzma_meta>.blob`.
     * 
     * In all images examined, the `.lzma` header specifies the properties
     * lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
     * bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
     * stream, and there is no end-of-payload marker.
     */
    Object.defineProperty(InodeV1.prototype, 'blob', {
      get: function() {
        if (this._m_blob !== undefined)
          return this._m_blob;
        var io = this._parent.blobsArea._io;
        var _pos = io.pos;
        io.seek(this.ofsBlob);
        this._m_blob = io.readBytes(this.lenBlob);
        io.seek(_pos);
        return this._m_blob;
      }
    });
    Object.defineProperty(InodeV1.prototype, 'ofsEnd', {
      get: function() {
        if (this._m_ofsEnd !== undefined)
          return this._m_ofsEnd;
        this._m_ofsEnd = this.ofsBlob + this.lenBlob;
        return this._m_ofsEnd;
      }
    });

    /**
     * Relative to the start of `<body_v1>.blobs_area`.
     */

    return InodeV1;
  })();

  /**
   * @see {@link https://arxiv.org/html/2407.05064v1#S4.SS4|Source}
   * @see {@link https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L44-L48|Source}
   */

  var LzmaMeta = TplinkMinifs.LzmaMeta = (function() {
    function LzmaMeta(_io, _parent, _root, prevOfsEnd) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.prevOfsEnd = prevOfsEnd;

      this._read();
    }
    LzmaMeta.prototype._read = function() {
      this.ofsBlob = this._io.readU4be();
      if (!(this.ofsBlob == this.prevOfsEnd)) {
        throw new KaitaiStream.ValidationNotEqualError(this.prevOfsEnd, this.ofsBlob, this._io, "/types/lzma_meta/seq/0");
      }
      this.lenBlob = this._io.readU4be();
      if (!(this._parent.has8ByteLzmaMetas)) {
        this.lenBlobUncompressed = this._io.readU4be();
      }
    }

    /**
     * An LZMA stream in the `.lzma` format (also known as LZMA_Alone):
     * a 13-byte header followed by the compressed data. Decompress it
     * with a ready-made LZMA decoder that reads this header, e.g. in
     * Python with `lzma.decompress(blob, format=lzma.FORMAT_ALONE)`. The
     * size of the decompressed data is `len_blob_uncompressed`, if present.
     * 
     * In all images examined with `header.version` = 3, the `.lzma` header
     * specifies the properties lc = 3, lp = 0, pb = 2 and an 8 MiB
     * dictionary, so it starts with the bytes `5D 00 00 80 00`. The
     * uncompressed size in the header is unknown (`0xFFFF_FFFF_FFFF_FFFF`),
     * so the stream ends with an end-of-payload marker.
     * @see {@link https://arxiv.org/html/2407.05064v1#S4.SS5|Source}
     * @see {@link https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L175-L187|Source}
     */
    Object.defineProperty(LzmaMeta.prototype, 'blob', {
      get: function() {
        if (this._m_blob !== undefined)
          return this._m_blob;
        var io = this._parent.lzmaBlobsArea._io;
        var _pos = io.pos;
        io.seek(this.ofsBlob);
        this._m_blob = io.readBytes(this.lenBlob);
        io.seek(_pos);
        return this._m_blob;
      }
    });
    Object.defineProperty(LzmaMeta.prototype, 'ofsEnd', {
      get: function() {
        if (this._m_ofsEnd !== undefined)
          return this._m_ofsEnd;
        this._m_ofsEnd = this.ofsBlob + this.lenBlob;
        return this._m_ofsEnd;
      }
    });

    return LzmaMeta;
  })();

  /**
   * @see {@link https://arxiv.org/html/2407.05064v1#S4.SS1|Source}
   * @see {@link https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L27-L34|Source}
   */

  var MinifsHeader = TplinkMinifs.MinifsHeader = (function() {
    function MinifsHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MinifsHeader.prototype._read = function() {
      this.magic = this._io.readBytes(16);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]), this.magic, this._io, "/types/minifs_header/seq/0");
      }
      this.version = this._io.readU4be();
      if (!( ((this.version == 1) || (this.version == 2) || (this.version == 3)) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.version, this._io, "/types/minifs_header/seq/1");
      }
      this.numFiles = this._io.readU4be();
      this.lenLargestFile = this._io.readU4be();
    }

    /**
     * The uncompressed size of the largest file. In all images examined with
     * version 3, the inodes are sorted by size in descending order, so it is
     * also the size of the first file. In all images examined with versions
     * 1 and 2, the value is rounded up to a multiple of 4.
     */

    return MinifsHeader;
  })();

  /**
   * Table of null-terminated directory paths and file names, referenced by
   * `<inode>.ofs_directory_path` and `<inode>.ofs_file_name`. In all images
   * examined, each non-empty string occurs only once, which saves space in
   * flash memory, as many files share a directory or a name.
   * 
   * In all images examined, the table is padded with null bytes to a multiple
   * of 4 bytes, so `names` can end with up to 3 empty strings (one for each
   * padding byte).
   * @see {@link https://arxiv.org/html/2407.05064v1#S4.SS2|Source}
   */

  var NameTable = TplinkMinifs.NameTable = (function() {
    function NameTable(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    NameTable.prototype._read = function() {
      this.names = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.names.push(KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII"));
        i++;
      }
    }

    return NameTable;
  })();

  return TplinkMinifs;
})();
TplinkMinifs_.TplinkMinifs = TplinkMinifs;
});
