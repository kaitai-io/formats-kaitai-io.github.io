// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.MozillaMar = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
 * Test files can be found on Mozilla's FTP site, for example:
 * 
 * <http://ftp.mozilla.org/pub/firefox/nightly/partials/>
 * @see {@link https://wiki.mozilla.org/Software_Update:MAR|Source}
 */

var MozillaMar = (function() {
  MozillaMar.SignatureAlgorithms = Object.freeze({
    RSA_PKCS1_SHA1: 1,
    RSA_PKCS1_SHA384: 2,

    1: "RSA_PKCS1_SHA1",
    2: "RSA_PKCS1_SHA384",
  });

  MozillaMar.BlockIdentifiers = Object.freeze({
    PRODUCT_INFORMATION: 1,

    1: "PRODUCT_INFORMATION",
  });

  function MozillaMar(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MozillaMar.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [77, 65, 82, 49]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([77, 65, 82, 49], this.magic, this._io, "/seq/0");
    }
    this.ofsIndex = this._io.readU4be();
    this.fileSize = this._io.readU8be();
    this.lenSignatures = this._io.readU4be();
    this.signatures = [];
    for (var i = 0; i < this.lenSignatures; i++) {
      this.signatures.push(new Signature(this._io, this, this._root));
    }
    this.lenAdditionalSections = this._io.readU4be();
    this.additionalSections = [];
    for (var i = 0; i < this.lenAdditionalSections; i++) {
      this.additionalSections.push(new AdditionalSection(this._io, this, this._root));
    }
  }

  var MarIndex = MozillaMar.MarIndex = (function() {
    function MarIndex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MarIndex.prototype._read = function() {
      this.lenIndex = this._io.readU4be();
      this._raw_indexEntries = this._io.readBytes(this.lenIndex);
      var _io__raw_indexEntries = new KaitaiStream(this._raw_indexEntries);
      this.indexEntries = new IndexEntries(_io__raw_indexEntries, this, this._root);
    }

    return MarIndex;
  })();

  var IndexEntries = MozillaMar.IndexEntries = (function() {
    function IndexEntries(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    IndexEntries.prototype._read = function() {
      this.indexEntry = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.indexEntry.push(new IndexEntry(this._io, this, this._root));
        i++;
      }
    }

    return IndexEntries;
  })();

  var Signature = MozillaMar.Signature = (function() {
    function Signature(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Signature.prototype._read = function() {
      this.algorithm = this._io.readU4be();
      this.lenSignature = this._io.readU4be();
      this.signature = this._io.readBytes(this.lenSignature);
    }

    return Signature;
  })();

  var ProductInformationBlock = MozillaMar.ProductInformationBlock = (function() {
    function ProductInformationBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ProductInformationBlock.prototype._read = function() {
      this.marChannelName = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(64), 0, false), "UTF-8");
      this.productVersion = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(32), 0, false), "UTF-8");
    }

    return ProductInformationBlock;
  })();

  var IndexEntry = MozillaMar.IndexEntry = (function() {
    function IndexEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    IndexEntry.prototype._read = function() {
      this.ofsContent = this._io.readU4be();
      this.lenContent = this._io.readU4be();
      this.flags = this._io.readU4be();
      this.fileName = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
    }
    Object.defineProperty(IndexEntry.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsContent);
        this._m_body = io.readBytes(this.lenContent);
        io.seek(_pos);
        return this._m_body;
      }
    });

    /**
     * File permission bits (in standard unix-style format).
     */

    return IndexEntry;
  })();

  var AdditionalSection = MozillaMar.AdditionalSection = (function() {
    function AdditionalSection(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    AdditionalSection.prototype._read = function() {
      this.lenBlock = this._io.readU4be();
      this.blockIdentifier = this._io.readU4be();
      switch (this.blockIdentifier) {
      case MozillaMar.BlockIdentifiers.PRODUCT_INFORMATION:
        this._raw_bytes = this._io.readBytes(((this.lenBlock - 4) - 4));
        var _io__raw_bytes = new KaitaiStream(this._raw_bytes);
        this.bytes = new ProductInformationBlock(_io__raw_bytes, this, this._root);
        break;
      default:
        this.bytes = this._io.readBytes(((this.lenBlock - 4) - 4));
        break;
      }
    }

    return AdditionalSection;
  })();
  Object.defineProperty(MozillaMar.prototype, 'index', {
    get: function() {
      if (this._m_index !== undefined)
        return this._m_index;
      var _pos = this._io.pos;
      this._io.seek(this.ofsIndex);
      this._m_index = new MarIndex(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_index;
    }
  });

  return MozillaMar;
})();
return MozillaMar;
}));
