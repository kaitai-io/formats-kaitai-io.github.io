// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Luks = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * Linux Unified Key Setup (LUKS) is a format specification for storing disk
 * encryption parameters and up to 8 user keys (which can unlock the master key).
 * @see {@link https://gitlab.com/cryptsetup/cryptsetup/wikis/LUKS-standard/on-disk-format.pdf|Source}
 */

var Luks = (function() {
  function Luks(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Luks.prototype._read = function() {
    this.partitionHeader = new PartitionHeader(this._io, this, this._root);
  }

  var PartitionHeader = Luks.PartitionHeader = (function() {
    function PartitionHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PartitionHeader.prototype._read = function() {
      this.magic = this._io.readBytes(6);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [76, 85, 75, 83, 186, 190]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([76, 85, 75, 83, 186, 190], this.magic, this._io, "/types/partition_header/seq/0");
      }
      this.version = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.version, [0, 1]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 1], this.version, this._io, "/types/partition_header/seq/1");
      }
      this.cipherNameSpecification = KaitaiStream.bytesToStr(this._io.readBytes(32), "ASCII");
      this.cipherModeSpecification = KaitaiStream.bytesToStr(this._io.readBytes(32), "ASCII");
      this.hashSpecification = KaitaiStream.bytesToStr(this._io.readBytes(32), "ASCII");
      this.payloadOffset = this._io.readU4be();
      this.numberOfKeyBytes = this._io.readU4be();
      this.masterKeyChecksum = this._io.readBytes(20);
      this.masterKeySaltParameter = this._io.readBytes(32);
      this.masterKeyIterationsParameter = this._io.readU4be();
      this.uuid = KaitaiStream.bytesToStr(this._io.readBytes(40), "ASCII");
      this.keySlots = [];
      for (var i = 0; i < 8; i++) {
        this.keySlots.push(new KeySlot(this._io, this, this._root));
      }
    }

    var KeySlot = PartitionHeader.KeySlot = (function() {
      KeySlot.KeySlotStates = Object.freeze({
        DISABLED_KEY_SLOT: 57005,
        ENABLED_KEY_SLOT: 11301363,

        57005: "DISABLED_KEY_SLOT",
        11301363: "ENABLED_KEY_SLOT",
      });

      function KeySlot(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      KeySlot.prototype._read = function() {
        this.stateOfKeySlot = this._io.readU4be();
        this.iterationParameter = this._io.readU4be();
        this.saltParameter = this._io.readBytes(32);
        this.startSectorOfKeyMaterial = this._io.readU4be();
        this.numberOfAntiForensicStripes = this._io.readU4be();
      }
      Object.defineProperty(KeySlot.prototype, 'keyMaterial', {
        get: function() {
          if (this._m_keyMaterial !== undefined)
            return this._m_keyMaterial;
          var _pos = this._io.pos;
          this._io.seek((this.startSectorOfKeyMaterial * 512));
          this._m_keyMaterial = this._io.readBytes((this._parent.numberOfKeyBytes * this.numberOfAntiForensicStripes));
          this._io.seek(_pos);
          return this._m_keyMaterial;
        }
      });

      return KeySlot;
    })();

    return PartitionHeader;
  })();
  Object.defineProperty(Luks.prototype, 'payload', {
    get: function() {
      if (this._m_payload !== undefined)
        return this._m_payload;
      var _pos = this._io.pos;
      this._io.seek((this.partitionHeader.payloadOffset * 512));
      this._m_payload = this._io.readBytesFull();
      this._io.seek(_pos);
      return this._m_payload;
    }
  });

  return Luks;
})();
return Luks;
}));
