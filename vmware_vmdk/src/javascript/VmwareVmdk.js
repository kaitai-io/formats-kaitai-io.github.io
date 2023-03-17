// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.VmwareVmdk = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * @see {@link https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header|Source}
 */

var VmwareVmdk = (function() {
  VmwareVmdk.CompressionMethods = Object.freeze({
    NONE: 0,
    DEFLATE: 1,

    0: "NONE",
    1: "DEFLATE",
  });

  function VmwareVmdk(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  VmwareVmdk.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [75, 68, 77, 86]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([75, 68, 77, 86], this.magic, this._io, "/seq/0");
    }
    this.version = this._io.readS4le();
    this.flags = new HeaderFlags(this._io, this, this._root);
    this.sizeMax = this._io.readS8le();
    this.sizeGrain = this._io.readS8le();
    this.startDescriptor = this._io.readS8le();
    this.sizeDescriptor = this._io.readS8le();
    this.numGrainTableEntries = this._io.readS4le();
    this.startSecondaryGrain = this._io.readS8le();
    this.startPrimaryGrain = this._io.readS8le();
    this.sizeMetadata = this._io.readS8le();
    this.isDirty = this._io.readU1();
    this.stuff = this._io.readBytes(4);
    this.compressionMethod = this._io.readU2le();
  }

  /**
   * @see {@link https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags|Source}
   */

  var HeaderFlags = VmwareVmdk.HeaderFlags = (function() {
    function HeaderFlags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderFlags.prototype._read = function() {
      this.reserved1 = this._io.readBitsIntBe(5);
      this.zeroedGrainTableEntry = this._io.readBitsIntBe(1) != 0;
      this.useSecondaryGrainDir = this._io.readBitsIntBe(1) != 0;
      this.validNewLineDetectionTest = this._io.readBitsIntBe(1) != 0;
      this._io.alignToByte();
      this.reserved2 = this._io.readU1();
      this.reserved3 = this._io.readBitsIntBe(6);
      this.hasMetadata = this._io.readBitsIntBe(1) != 0;
      this.hasCompressedGrain = this._io.readBitsIntBe(1) != 0;
      this._io.alignToByte();
      this.reserved4 = this._io.readU1();
    }

    return HeaderFlags;
  })();
  Object.defineProperty(VmwareVmdk.prototype, 'lenSector', {
    get: function() {
      if (this._m_lenSector !== undefined)
        return this._m_lenSector;
      this._m_lenSector = 512;
      return this._m_lenSector;
    }
  });
  Object.defineProperty(VmwareVmdk.prototype, 'descriptor', {
    get: function() {
      if (this._m_descriptor !== undefined)
        return this._m_descriptor;
      var _pos = this._io.pos;
      this._io.seek((this.startDescriptor * this._root.lenSector));
      this._m_descriptor = this._io.readBytes((this.sizeDescriptor * this._root.lenSector));
      this._io.seek(_pos);
      return this._m_descriptor;
    }
  });
  Object.defineProperty(VmwareVmdk.prototype, 'grainPrimary', {
    get: function() {
      if (this._m_grainPrimary !== undefined)
        return this._m_grainPrimary;
      var _pos = this._io.pos;
      this._io.seek((this.startPrimaryGrain * this._root.lenSector));
      this._m_grainPrimary = this._io.readBytes((this.sizeGrain * this._root.lenSector));
      this._io.seek(_pos);
      return this._m_grainPrimary;
    }
  });
  Object.defineProperty(VmwareVmdk.prototype, 'grainSecondary', {
    get: function() {
      if (this._m_grainSecondary !== undefined)
        return this._m_grainSecondary;
      var _pos = this._io.pos;
      this._io.seek((this.startSecondaryGrain * this._root.lenSector));
      this._m_grainSecondary = this._io.readBytes((this.sizeGrain * this._root.lenSector));
      this._io.seek(_pos);
      return this._m_grainSecondary;
    }
  });

  /**
   * Maximum number of sectors in a given image file (capacity)
   */

  /**
   * Embedded descriptor file start sector number (0 if not available)
   */

  /**
   * Number of sectors that embedded descriptor file occupies
   */

  /**
   * Number of grains table entries
   */

  /**
   * Secondary (backup) grain directory start sector number
   */

  /**
   * Primary grain directory start sector number
   */

  return VmwareVmdk;
})();
return VmwareVmdk;
}));
