// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Nitf || (root.Nitf = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Nitf_, KaitaiStream) {
/**
 * The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
 * storing imagery, e.g. from satellites.
 * 
 * According to the [foreword of the specification](https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
 * > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
 * > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
 * > defined by the Executive Order 12333, and other United States Government departments and agencies."
 * 
 * This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
 * It was implemented by [River Loop Security](https://www.riverloopsecurity.com/).
 * @see {@link https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf|Source}
 */

var Nitf = (function() {
  function Nitf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Nitf.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
    this.imageSegments = [];
    for (var i = 0; i < Number.parseInt(this.header.numImageSegments, 10); i++) {
      this.imageSegments.push(new ImageSegment(this._io, this, this._root, i));
    }
    this.graphicsSegments = [];
    for (var i = 0; i < Number.parseInt(this.header.numGraphicsSegments, 10); i++) {
      this.graphicsSegments.push(new GraphicsSegment(this._io, this, this._root, i));
    }
    this.textSegments = [];
    for (var i = 0; i < Number.parseInt(this.header.numTextFiles, 10); i++) {
      this.textSegments.push(new TextSegment(this._io, this, this._root, i));
    }
    this.dataExtensionSegments = [];
    for (var i = 0; i < Number.parseInt(this.header.numDataExtension, 10); i++) {
      this.dataExtensionSegments.push(new DataExtensionSegment(this._io, this, this._root, i));
    }
    this.reservedExtensionSegments = [];
    for (var i = 0; i < Number.parseInt(this.header.numReservedExtension, 10); i++) {
      this.reservedExtensionSegments.push(new ReservedExtensionSegment(this._io, this, this._root, i));
    }
  }

  var BandInfo = Nitf.BandInfo = (function() {
    function BandInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    BandInfo.prototype._read = function() {
      this.representation = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.subcategory = KaitaiStream.bytesToStr(this._io.readBytes(6), "UTF-8");
      this.imgFilterCondition = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.imgFilterCondition, new Uint8Array([78])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([78]), this.imgFilterCondition, this._io, "/types/band_info/seq/2");
      }
      this.imgFilterCode = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.numLuts = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      if (Number.parseInt(this.numLuts, 10) != 0) {
        this.numLutEntries = KaitaiStream.bytesToStr(this._io.readBytes(5), "UTF-8");
      }
      this.luts = [];
      for (var i = 0; i < Number.parseInt(this.numLuts, 10); i++) {
        this.luts.push(this._io.readBytes(Number.parseInt(this.numLutEntries, 10)));
      }
    }

    /**
     * Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
     */

    /**
     * Reserved
     */

    /**
     * Number of entries in each of the LUTs for the nth image band
     */

    return BandInfo;
  })();

  var Clasnfo = Nitf.Clasnfo = (function() {
    function Clasnfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Clasnfo.prototype._read = function() {
      this.securityClass = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.securitySystem = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.codewords = KaitaiStream.bytesToStr(this._io.readBytes(11), "UTF-8");
      this.controlAndHandling = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.releaseability = KaitaiStream.bytesToStr(this._io.readBytes(20), "UTF-8");
      this.declassType = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.declassDate = KaitaiStream.bytesToStr(this._io.readBytes(8), "UTF-8");
      this.declassExemption = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.downgrade = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.downgradeDate = KaitaiStream.bytesToStr(this._io.readBytes(8), "UTF-8");
      this.classText = KaitaiStream.bytesToStr(this._io.readBytes(43), "UTF-8");
      this.classAuthorityType = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.classAuthority = KaitaiStream.bytesToStr(this._io.readBytes(40), "UTF-8");
      this.classReason = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.sourceDate = KaitaiStream.bytesToStr(this._io.readBytes(8), "UTF-8");
      this.controlNumber = KaitaiStream.bytesToStr(this._io.readBytes(15), "UTF-8");
    }

    return Clasnfo;
  })();

  var DataExtensionSegment = Nitf.DataExtensionSegment = (function() {
    function DataExtensionSegment(_io, _parent, _root, idx) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.idx = idx;

      this._read();
    }
    DataExtensionSegment.prototype._read = function() {
      this._raw_dataSubHeader = this._io.readBytes(Number.parseInt(this._parent.header.ldnfo[this.idx].lengthDataExtensionSubheader, 10));
      var _io__raw_dataSubHeader = new KaitaiStream(this._raw_dataSubHeader);
      this.dataSubHeader = new DataSubHeader(_io__raw_dataSubHeader, this, this._root);
      this.dataDataField = this._io.readBytes(Number.parseInt(this._parent.header.ldnfo[this.idx].lengthDataExtensionSegment, 10));
    }

    return DataExtensionSegment;
  })();

  var DataSubHeader = Nitf.DataSubHeader = (function() {
    function DataSubHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DataSubHeader.prototype._read = function() {
      this.desBase = new DataSubHeaderBase(this._io, this, this._root);
      if (this.treOfl) {
        this.overflowedHeaderType = KaitaiStream.bytesToStr(this._io.readBytes(6), "UTF-8");
      }
      if (this.treOfl) {
        this.dataItemOverflowed = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      }
      this.desDefinedSubheaderFieldsLen = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.desshf = KaitaiStream.bytesToStr(this._io.readBytes(Number.parseInt(this.desDefinedSubheaderFieldsLen, 10)), "UTF-8");
      this.desDefinedDataField = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }
    Object.defineProperty(DataSubHeader.prototype, 'treOfl', {
      get: function() {
        if (this._m_treOfl !== undefined)
          return this._m_treOfl;
        this._m_treOfl = this.desBase.desid == "TRE_OVERFLOW";
        return this._m_treOfl;
      }
    });

    return DataSubHeader;
  })();

  var DataSubHeaderBase = Nitf.DataSubHeaderBase = (function() {
    function DataSubHeaderBase(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DataSubHeaderBase.prototype._read = function() {
      this.filePartTypeDe = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.filePartTypeDe, new Uint8Array([68, 69])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([68, 69]), this.filePartTypeDe, this._io, "/types/data_sub_header_base/seq/0");
      }
      this.desid = KaitaiStream.bytesToStr(this._io.readBytes(25), "UTF-8");
      this.dataDefinitionVersion = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.declasnfo = new Clasnfo(this._io, this, this._root);
    }

    /**
     * File Part Type desigantor for Data Extension
     */

    return DataSubHeaderBase;
  })();

  /**
   * Streaming file Header Data Extension Segment Subheader
   */

  var DataSubHeaderStreaming = Nitf.DataSubHeaderStreaming = (function() {
    function DataSubHeaderStreaming(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DataSubHeaderStreaming.prototype._read = function() {
      this.desBase = new DataSubHeaderBase(this._io, this, this._root);
      this.desDefinedSubheaderFieldsLen = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.sfhL1 = KaitaiStream.bytesToStr(this._io.readBytes(7), "UTF-8");
      this.sfhDelim1 = this._io.readU4be();
      this.sfhDr = [];
      for (var i = 0; i < Number.parseInt(this.sfhL1, 10); i++) {
        this.sfhDr.push(this._io.readU1());
      }
      this.sfhDelim2 = this._io.readU4be();
      this.sfhL2 = KaitaiStream.bytesToStr(this._io.readBytes(7), "UTF-8");
    }

    /**
     * SFH Length 1: number of bytes in sfh_dr field
     */

    /**
     * Shall contain the value 0x0A6E1D97.
     */

    /**
     * Shall contain the value 0x0ECA14BF.
     */

    /**
     * A repeat of sfh_l1.
     */

    return DataSubHeaderStreaming;
  })();

  var DataSubHeaderTre = Nitf.DataSubHeaderTre = (function() {
    function DataSubHeaderTre(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DataSubHeaderTre.prototype._read = function() {
      this.desBase = new DataSubHeaderBase(this._io, this, this._root);
      if (this.desBase.desid == "TRE_OVERFLOW") {
        this.overflowedHeaderType = KaitaiStream.bytesToStr(this._io.readBytes(6), "UTF-8");
      }
      if (this.desBase.desid == "TRE_OVERFLOW") {
        this.dataItemOverflowed = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      }
      this.desDefinedSubheaderFieldsLen = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.desDefinedDataField = KaitaiStream.bytesToStr(this._io.readBytes(Number.parseInt(this.desDefinedSubheaderFieldsLen, 10)), "UTF-8");
    }

    return DataSubHeaderTre;
  })();

  var DateTime = Nitf.DateTime = (function() {
    function DateTime(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DateTime.prototype._read = function() {
      this._unnamed0 = KaitaiStream.bytesToStr(this._io.readBytes(14), "UTF-8");
    }

    /**
     * UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
     */

    return DateTime;
  })();

  var Encrypt = Nitf.Encrypt = (function() {
    function Encrypt(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Encrypt.prototype._read = function() {
      this._unnamed0 = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
    }

    return Encrypt;
  })();

  var GraphicSubHeader = Nitf.GraphicSubHeader = (function() {
    function GraphicSubHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    GraphicSubHeader.prototype._read = function() {
      this.filePartTypeSy = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.filePartTypeSy, new Uint8Array([83, 89])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([83, 89]), this.filePartTypeSy, this._io, "/types/graphic_sub_header/seq/0");
      }
      this.graphicId = KaitaiStream.bytesToStr(this._io.readBytes(10), "UTF-8");
      this.graphicName = KaitaiStream.bytesToStr(this._io.readBytes(20), "UTF-8");
      this.graphicClassification = new Clasnfo(this._io, this, this._root);
      this.encryption = new Encrypt(this._io, this, this._root);
      this.graphicType = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.graphicType, new Uint8Array([67])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([67]), this.graphicType, this._io, "/types/graphic_sub_header/seq/5");
      }
      this.reserved1 = KaitaiStream.bytesToStr(this._io.readBytes(13), "UTF-8");
      this.graphicDisplayLevel = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.graphicAttachmentLevel = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.graphicLocation = KaitaiStream.bytesToStr(this._io.readBytes(10), "UTF-8");
      this.firstGraphicBoundLoc = KaitaiStream.bytesToStr(this._io.readBytes(10), "UTF-8");
      this.graphicColor = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.secondGraphicBoundLoc = KaitaiStream.bytesToStr(this._io.readBytes(10), "UTF-8");
      this.reserved2 = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.graphicsExtendedSubHeader = new TreHeader(this._io, this, this._root);
    }

    /**
     * Reserved
     */

    /**
     * Reserved
     */

    return GraphicSubHeader;
  })();

  var GraphicsSegment = Nitf.GraphicsSegment = (function() {
    function GraphicsSegment(_io, _parent, _root, idx) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.idx = idx;

      this._read();
    }
    GraphicsSegment.prototype._read = function() {
      this.graphicSubHeader = new GraphicSubHeader(this._io, this, this._root);
      this.graphicDataField = this._io.readBytes(Number.parseInt(this._parent.header.lnnfo[this.idx].lengthGraphicSegment, 10));
    }

    return GraphicsSegment;
  })();

  var Header = Nitf.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Header.prototype._read = function() {
      this.fileProfileName = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.fileProfileName, new Uint8Array([78, 73, 84, 70])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([78, 73, 84, 70]), this.fileProfileName, this._io, "/types/header/seq/0");
      }
      this.fileVersion = this._io.readBytes(5);
      if (!((KaitaiStream.byteArrayCompare(this.fileVersion, new Uint8Array([48, 50, 46, 49, 48])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([48, 50, 46, 49, 48]), this.fileVersion, this._io, "/types/header/seq/1");
      }
      this.complexityLevel = this._io.readBytes(2);
      this.standardType = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.standardType, new Uint8Array([66, 70, 48, 49])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([66, 70, 48, 49]), this.standardType, this._io, "/types/header/seq/3");
      }
      this.originatingStationId = KaitaiStream.bytesToStr(this._io.readBytes(10), "UTF-8");
      this.fileDateTime = new DateTime(this._io, this, this._root);
      this.fileTitle = KaitaiStream.bytesToStr(this._io.readBytes(80), "UTF-8");
      this.fileSecurity = new Clasnfo(this._io, this, this._root);
      this.fileCopyNumber = KaitaiStream.bytesToStr(this._io.readBytes(5), "UTF-8");
      this.fileNumOfCopys = KaitaiStream.bytesToStr(this._io.readBytes(5), "UTF-8");
      this.encryption = new Encrypt(this._io, this, this._root);
      this.fileBgColor = this._io.readBytes(3);
      this.originatorName = KaitaiStream.bytesToStr(this._io.readBytes(24), "UTF-8");
      this.originatorPhone = KaitaiStream.bytesToStr(this._io.readBytes(18), "UTF-8");
      this.fileLength = KaitaiStream.bytesToStr(this._io.readBytes(12), "UTF-8");
      this.fileHeaderLength = KaitaiStream.bytesToStr(this._io.readBytes(6), "UTF-8");
      this.numImageSegments = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.linfo = [];
      for (var i = 0; i < Number.parseInt(this.numImageSegments, 10); i++) {
        this.linfo.push(new LengthImageInfo(this._io, this, this._root));
      }
      this.numGraphicsSegments = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.lnnfo = [];
      for (var i = 0; i < Number.parseInt(this.numGraphicsSegments, 10); i++) {
        this.lnnfo.push(new LengthGraphicInfo(this._io, this, this._root));
      }
      this.reservedNumx = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.numTextFiles = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.ltnfo = [];
      for (var i = 0; i < Number.parseInt(this.numTextFiles, 10); i++) {
        this.ltnfo.push(new LengthTextInfo(this._io, this, this._root));
      }
      this.numDataExtension = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.ldnfo = [];
      for (var i = 0; i < Number.parseInt(this.numDataExtension, 10); i++) {
        this.ldnfo.push(new LengthDataInfo(this._io, this, this._root));
      }
      this.numReservedExtension = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.lrnfo = [];
      for (var i = 0; i < Number.parseInt(this.numReservedExtension, 10); i++) {
        this.lrnfo.push(new LengthReservedInfo(this._io, this, this._root));
      }
      this.userDefinedHeader = new TreHeader(this._io, this, this._root);
      this.extendedHeader = new TreHeader(this._io, this, this._root);
    }

    /**
     * Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
     */

    return Header;
  })();

  var ImageComment = Nitf.ImageComment = (function() {
    function ImageComment(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ImageComment.prototype._read = function() {
      this._unnamed0 = KaitaiStream.bytesToStr(this._io.readBytes(80), "UTF-8");
    }

    return ImageComment;
  })();

  var ImageDataMask = Nitf.ImageDataMask = (function() {
    function ImageDataMask(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ImageDataMask.prototype._read = function() {
      this.blockedImgDataOffset = this._io.readU4be();
      this.bmrlnth = this._io.readU2be();
      this.tmrlnth = this._io.readU2be();
      this.tpxcdlnth = this._io.readU2be();
      this.tpxcd = this._io.readBytes(this.tpxcdSize);
      if (this.hasBmr) {
        this.bmrbnd = [];
        for (var i = 0; i < this.bmrtmrCount; i++) {
          this.bmrbnd.push(this._io.readU4be());
        }
      }
      if (this.hasTmr) {
        this.tmrbnd = [];
        for (var i = 0; i < this.bmrtmrCount; i++) {
          this.tmrbnd.push(this._io.readU4be());
        }
      }
    }
    Object.defineProperty(ImageDataMask.prototype, 'bmrbndSize', {
      get: function() {
        if (this._m_bmrbndSize !== undefined)
          return this._m_bmrbndSize;
        this._m_bmrbndSize = (this.hasBmr ? this.bmrtmrCount * 4 : 0);
        return this._m_bmrbndSize;
      }
    });
    Object.defineProperty(ImageDataMask.prototype, 'bmrtmrCount', {
      get: function() {
        if (this._m_bmrtmrCount !== undefined)
          return this._m_bmrtmrCount;
        this._m_bmrtmrCount = (Number.parseInt(this._parent.imageSubHeader.numBlocksPerRow, 10) * Number.parseInt(this._parent.imageSubHeader.numBlocksPerCol, 10)) * (this._parent.imageSubHeader.imgMode != "S" ? 1 : (Number.parseInt(this._parent.imageSubHeader.numBands, 10) != 0 ? Number.parseInt(this._parent.imageSubHeader.numBands, 10) : Number.parseInt(this._parent.imageSubHeader.numMultispectralBands, 10)));
        return this._m_bmrtmrCount;
      }
    });
    Object.defineProperty(ImageDataMask.prototype, 'hasBmr', {
      get: function() {
        if (this._m_hasBmr !== undefined)
          return this._m_hasBmr;
        this._m_hasBmr = this.bmrlnth != 0;
        return this._m_hasBmr;
      }
    });
    Object.defineProperty(ImageDataMask.prototype, 'hasTmr', {
      get: function() {
        if (this._m_hasTmr !== undefined)
          return this._m_hasTmr;
        this._m_hasTmr = this.tmrlnth != 0;
        return this._m_hasTmr;
      }
    });
    Object.defineProperty(ImageDataMask.prototype, 'tmrbndSize', {
      get: function() {
        if (this._m_tmrbndSize !== undefined)
          return this._m_tmrbndSize;
        this._m_tmrbndSize = (this.hasTmr ? this.bmrtmrCount * 4 : 0);
        return this._m_tmrbndSize;
      }
    });
    Object.defineProperty(ImageDataMask.prototype, 'totalSize', {
      get: function() {
        if (this._m_totalSize !== undefined)
          return this._m_totalSize;
        this._m_totalSize = (((((4 + 2) + 2) + 2) + this.tpxcdSize) + this.bmrbndSize) + this.tmrbndSize;
        return this._m_totalSize;
      }
    });
    Object.defineProperty(ImageDataMask.prototype, 'tpxcdSize', {
      get: function() {
        if (this._m_tpxcdSize !== undefined)
          return this._m_tpxcdSize;
        this._m_tpxcdSize = Math.floor((KaitaiStream.mod(this.tpxcdlnth, 8) == 0 ? this.tpxcdlnth : this.tpxcdlnth + (8 - KaitaiStream.mod(this.tpxcdlnth, 8))) / 8);
        return this._m_tpxcdSize;
      }
    });

    /**
     * Block Mask Record Length
     */

    /**
     * Pad Pixel Mask Record Length
     */

    /**
     * Pad Output Pixel Code Length
     */

    /**
     * Pad Output Pixel Code
     */

    /**
     * Block n, Band m Offset
     */

    /**
     * Pad Pixel n, Band m
     */

    return ImageDataMask;
  })();

  var ImageSegment = Nitf.ImageSegment = (function() {
    function ImageSegment(_io, _parent, _root, idx) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.idx = idx;

      this._read();
    }
    ImageSegment.prototype._read = function() {
      this.imageSubHeader = new ImageSubHeader(this._io, this, this._root);
      if (this.hasMask) {
        this.imageDataMask = new ImageDataMask(this._io, this, this._root);
      }
      if (this.hasMask) {
        this.imageDataField = this._io.readBytes(Number.parseInt(this._parent.header.linfo[this.idx].lengthImageSegment, 10) - this.imageDataMask.totalSize);
      }
    }
    Object.defineProperty(ImageSegment.prototype, 'hasMask', {
      get: function() {
        if (this._m_hasMask !== undefined)
          return this._m_hasMask;
        this._m_hasMask = this.imageSubHeader.imgCompression.substring(0, 2) == "MM";
        return this._m_hasMask;
      }
    });

    return ImageSegment;
  })();

  var ImageSubHeader = Nitf.ImageSubHeader = (function() {
    function ImageSubHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ImageSubHeader.prototype._read = function() {
      this.filePartType = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.filePartType, new Uint8Array([73, 77])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([73, 77]), this.filePartType, this._io, "/types/image_sub_header/seq/0");
      }
      this.imageId1 = KaitaiStream.bytesToStr(this._io.readBytes(10), "UTF-8");
      this.imageDateTime = new DateTime(this._io, this, this._root);
      this.targetId = KaitaiStream.bytesToStr(this._io.readBytes(17), "UTF-8");
      this.imageId2 = KaitaiStream.bytesToStr(this._io.readBytes(80), "UTF-8");
      this.imageSecurityClassification = new Clasnfo(this._io, this, this._root);
      this.encryption = new Encrypt(this._io, this, this._root);
      this.imageSource = KaitaiStream.bytesToStr(this._io.readBytes(42), "UTF-8");
      this.numSigRows = KaitaiStream.bytesToStr(this._io.readBytes(8), "UTF-8");
      this.numSigCols = KaitaiStream.bytesToStr(this._io.readBytes(8), "UTF-8");
      this.pixelValueType = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.imageRepresentation = KaitaiStream.bytesToStr(this._io.readBytes(8), "UTF-8");
      this.imageCategory = KaitaiStream.bytesToStr(this._io.readBytes(8), "UTF-8");
      this.actualBitsPerPixelPerBand = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.pixelJustification = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.imageCoordinateRep = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.imageGeoLoc = KaitaiStream.bytesToStr(this._io.readBytes(60), "UTF-8");
      this.numImgComments = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.imgComments = [];
      for (var i = 0; i < Number.parseInt(this.numImgComments, 10); i++) {
        this.imgComments.push(new ImageComment(this._io, this, this._root));
      }
      this.imgCompression = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.compressionRateCode = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.numBands = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      if (Number.parseInt(this.numBands, 10) == 0) {
        this.numMultispectralBands = KaitaiStream.bytesToStr(this._io.readBytes(5), "UTF-8");
      }
      this.bands = [];
      for (var i = 0; i < (Number.parseInt(this.numBands, 10) != 0 ? Number.parseInt(this.numBands, 10) : Number.parseInt(this.numMultispectralBands, 10)); i++) {
        this.bands.push(new BandInfo(this._io, this, this._root));
      }
      this.imgSyncCode = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.imgMode = KaitaiStream.bytesToStr(this._io.readBytes(1), "UTF-8");
      this.numBlocksPerRow = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.numBlocksPerCol = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.numPixelsPerBlockHorz = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.numPixelsPerBlockVert = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.numPixelsPerBand = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.imgDisplayLevel = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.attachmentLevel = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.imgLocation = KaitaiStream.bytesToStr(this._io.readBytes(10), "UTF-8");
      this.imgMagnification = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.userDefImgDataLen = KaitaiStream.bytesToStr(this._io.readBytes(5), "UTF-8");
      if (Number.parseInt(this.userDefImgDataLen, 10) != 0) {
        this.userDefOverflow = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      }
      if (Number.parseInt(this.userDefImgDataLen, 10) > 2) {
        this.userDefImgData = [];
        for (var i = 0; i < Number.parseInt(this.userDefImgDataLen, 10) - 3; i++) {
          this.userDefImgData.push(this._io.readU1());
        }
      }
      this.imageExtendedSubHeader = new TreHeader(this._io, this, this._root);
    }

    /**
     * Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
     */

    /**
     * MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
     */

    /**
     * VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
     */

    /**
     * Reserved for future use.
     */

    /**
     * B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
     */

    return ImageSubHeader;
  })();

  var LengthDataInfo = Nitf.LengthDataInfo = (function() {
    function LengthDataInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    LengthDataInfo.prototype._read = function() {
      this.lengthDataExtensionSubheader = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.lengthDataExtensionSegment = KaitaiStream.bytesToStr(this._io.readBytes(9), "UTF-8");
    }

    return LengthDataInfo;
  })();

  var LengthGraphicInfo = Nitf.LengthGraphicInfo = (function() {
    function LengthGraphicInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    LengthGraphicInfo.prototype._read = function() {
      this.lengthGraphicSubheader = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.lengthGraphicSegment = KaitaiStream.bytesToStr(this._io.readBytes(6), "UTF-8");
    }

    return LengthGraphicInfo;
  })();

  var LengthImageInfo = Nitf.LengthImageInfo = (function() {
    function LengthImageInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    LengthImageInfo.prototype._read = function() {
      this.lengthImageSubheader = KaitaiStream.bytesToStr(this._io.readBytes(6), "UTF-8");
      this.lengthImageSegment = KaitaiStream.bytesToStr(this._io.readBytes(10), "UTF-8");
    }

    return LengthImageInfo;
  })();

  var LengthReservedInfo = Nitf.LengthReservedInfo = (function() {
    function LengthReservedInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    LengthReservedInfo.prototype._read = function() {
      this.lengthReservedExtensionSubheader = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.lengthReservedExtensionSegment = KaitaiStream.bytesToStr(this._io.readBytes(7), "UTF-8");
    }

    return LengthReservedInfo;
  })();

  var LengthTextInfo = Nitf.LengthTextInfo = (function() {
    function LengthTextInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    LengthTextInfo.prototype._read = function() {
      this.lengthTextSubheader = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.lengthTextSegment = KaitaiStream.bytesToStr(this._io.readBytes(5), "UTF-8");
    }

    return LengthTextInfo;
  })();

  var ReservedExtensionSegment = Nitf.ReservedExtensionSegment = (function() {
    function ReservedExtensionSegment(_io, _parent, _root, idx) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.idx = idx;

      this._read();
    }
    ReservedExtensionSegment.prototype._read = function() {
      this._raw_reservedSubHeader = this._io.readBytes(Number.parseInt(this._parent.header.lrnfo[this.idx].lengthReservedExtensionSubheader, 10));
      var _io__raw_reservedSubHeader = new KaitaiStream(this._raw_reservedSubHeader);
      this.reservedSubHeader = new ReservedSubHeader(_io__raw_reservedSubHeader, this, this._root);
      this.reservedDataField = this._io.readBytes(Number.parseInt(this._parent.header.lrnfo[this.idx].lengthReservedExtensionSegment, 10));
    }

    return ReservedExtensionSegment;
  })();

  var ReservedSubHeader = Nitf.ReservedSubHeader = (function() {
    function ReservedSubHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ReservedSubHeader.prototype._read = function() {
      this.filePartTypeRe = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.filePartTypeRe, new Uint8Array([82, 69])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([82, 69]), this.filePartTypeRe, this._io, "/types/reserved_sub_header/seq/0");
      }
      this.resTypeId = KaitaiStream.bytesToStr(this._io.readBytes(25), "UTF-8");
      this.resVersion = KaitaiStream.bytesToStr(this._io.readBytes(2), "UTF-8");
      this.reclasnfo = new Clasnfo(this._io, this, this._root);
      this.resUserDefinedSubheaderLength = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.resUserDefinedSubheaderFields = KaitaiStream.bytesToStr(this._io.readBytes(Number.parseInt(this.resUserDefinedSubheaderLength, 10)), "UTF-8");
      this.resUserDefinedData = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    return ReservedSubHeader;
  })();

  var TextSegment = Nitf.TextSegment = (function() {
    function TextSegment(_io, _parent, _root, idx) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;
      this.idx = idx;

      this._read();
    }
    TextSegment.prototype._read = function() {
      this.textSubHeader = this._io.readBytes(1);
      this.textDataField = this._io.readBytes(Number.parseInt(this._parent.header.ltnfo[this.idx].lengthTextSegment, 10));
    }

    return TextSegment;
  })();

  var TextSubHeader = Nitf.TextSubHeader = (function() {
    function TextSubHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TextSubHeader.prototype._read = function() {
      this.textDateTime = KaitaiStream.bytesToStr(this._io.readBytes(14), "UTF-8");
      this.textTitle = KaitaiStream.bytesToStr(this._io.readBytes(80), "UTF-8");
      this.textSecurityClass = new Clasnfo(this._io, this, this._root);
      this.encryp = new Encrypt(this._io, this, this._root);
      this.textFormat = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      this.textExtendedSubHeader = new TreHeader(this._io, this, this._root);
    }

    /**
     * MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
     */

    return TextSubHeader;
  })();

  var Tre = Nitf.Tre = (function() {
    function Tre(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Tre.prototype._read = function() {
      this.extensionTypeId = KaitaiStream.bytesToStr(this._io.readBytes(6), "UTF-8");
      this.edataLength = KaitaiStream.bytesToStr(this._io.readBytes(5), "UTF-8");
      this.edata = KaitaiStream.bytesToStr(this._io.readBytes(Number.parseInt(this.edataLength, 10)), "UTF-8");
    }

    /**
     * RETAG or CETAG
     */

    /**
     * REL or CEL
     */

    /**
     * REDATA or CEDATA
     */

    return Tre;
  })();

  var TreHeader = Nitf.TreHeader = (function() {
    function TreHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TreHeader.prototype._read = function() {
      this.headerDataLength = KaitaiStream.bytesToStr(this._io.readBytes(5), "UTF-8");
      if (Number.parseInt(this.headerDataLength, 10) != 0) {
        this.headerOverflow = KaitaiStream.bytesToStr(this._io.readBytes(3), "UTF-8");
      }
      if (Number.parseInt(this.headerDataLength, 10) > 2) {
        this.headerData = [];
        for (var i = 0; i < Number.parseInt(this.headerDataLength, 10) - 3; i++) {
          this.headerData.push(this._io.readU1());
        }
      }
    }

    return TreHeader;
  })();

  return Nitf;
})();
Nitf_.Nitf = Nitf;
});
