// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.DimeMessage = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * Direct Internet Message Encapsulation (DIME)
 * is an old Microsoft specification for sending and receiving
 * SOAP messages along with additional attachments,
 * like binary files, XML fragments, and even other
 * SOAP messages, using standard transport protocols like HTTP.
 * 
 * Sample file: `curl -LO
 * https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
 * && gunzip scanner_withoptions.dump.gz`
 * @see {@link https://datatracker.ietf.org/doc/html/draft-nielsen-dime-02|Source}
 * @see {@link https://learn.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime|Source}
 * @see {@link http://imrannazar.com/Parsing-the-DIME-Message-Format|Source}
 */

var DimeMessage = (function() {
  DimeMessage.TypeFormats = Object.freeze({
    UNCHANGED: 0,
    MEDIA_TYPE: 1,
    ABSOLUTE_URI: 2,
    UNKNOWN: 3,
    NONE: 4,

    0: "UNCHANGED",
    1: "MEDIA_TYPE",
    2: "ABSOLUTE_URI",
    3: "UNKNOWN",
    4: "NONE",
  });

  function DimeMessage(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DimeMessage.prototype._read = function() {
    this.records = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.records.push(new Record(this._io, this, this._root));
      i++;
    }
  }

  /**
   * padding to the next 4-byte boundary
   */

  var Padding = DimeMessage.Padding = (function() {
    function Padding(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Padding.prototype._read = function() {
      this.boundaryPadding = this._io.readBytes(KaitaiStream.mod(-(this._io.pos), 4));
    }

    return Padding;
  })();

  /**
   * the option field of the record
   */

  var OptionField = DimeMessage.OptionField = (function() {
    function OptionField(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OptionField.prototype._read = function() {
      this.optionElements = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.optionElements.push(new OptionElement(this._io, this, this._root));
        i++;
      }
    }

    return OptionField;
  })();

  /**
   * one element of the option field
   */

  var OptionElement = DimeMessage.OptionElement = (function() {
    function OptionElement(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OptionElement.prototype._read = function() {
      this.elementFormat = this._io.readU2be();
      this.lenElement = this._io.readU2be();
      this.elementData = this._io.readBytes(this.lenElement);
    }

    return OptionElement;
  })();

  /**
   * each individual fragment of the message
   */

  var Record = DimeMessage.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.version = this._io.readBitsIntBe(5);
      this.isFirstRecord = this._io.readBitsIntBe(1) != 0;
      this.isLastRecord = this._io.readBitsIntBe(1) != 0;
      this.isChunkRecord = this._io.readBitsIntBe(1) != 0;
      this.typeFormat = this._io.readBitsIntBe(4);
      this.reserved = this._io.readBitsIntBe(4);
      this._io.alignToByte();
      this.lenOptions = this._io.readU2be();
      this.lenId = this._io.readU2be();
      this.lenType = this._io.readU2be();
      this.lenData = this._io.readU4be();
      this._raw_options = this._io.readBytes(this.lenOptions);
      var _io__raw_options = new KaitaiStream(this._raw_options);
      this.options = new OptionField(_io__raw_options, this, this._root);
      this.optionsPadding = new Padding(this._io, this, this._root);
      this.id = KaitaiStream.bytesToStr(this._io.readBytes(this.lenId), "ASCII");
      this.idPadding = new Padding(this._io, this, this._root);
      this.type = KaitaiStream.bytesToStr(this._io.readBytes(this.lenType), "ASCII");
      this.typePadding = new Padding(this._io, this, this._root);
      this.data = this._io.readBytes(this.lenData);
      this.dataPadding = new Padding(this._io, this, this._root);
    }

    /**
     * DIME format version (always 1)
     */

    /**
     * Set if this is the first record in the message
     */

    /**
     * Set if this is the last record in the message
     */

    /**
     * Set if the file contained in this record is chunked into multiple records
     */

    /**
     * Indicates the structure and format of the value of the TYPE field
     */

    /**
     * Reserved for future use
     */

    /**
     * Length of the Options field
     */

    /**
     * Length of the ID field
     */

    /**
     * Length of the Type field
     */

    /**
     * Length of the Data field
     */

    /**
     * Unique identifier of the file (set in the first record of file)
     */

    /**
     * Specified type in the format set with type_format
     */

    /**
     * The file data
     */

    return Record;
  })();

  return DimeMessage;
})();
return DimeMessage;
}));
