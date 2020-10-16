// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.CpioOldLe = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var CpioOldLe = (function() {
  function CpioOldLe(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  CpioOldLe.prototype._read = function() {
    this.files = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.files.push(new File(this._io, this, this._root));
      i++;
    }
  }

  var File = CpioOldLe.File = (function() {
    function File(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    File.prototype._read = function() {
      this.header = new FileHeader(this._io, this, this._root);
      this.pathName = this._io.readBytes((this.header.pathNameSize - 1));
      this.stringTerminator = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.stringTerminator, [0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0], this.stringTerminator, this._io, "/types/file/seq/2");
      }
      if (KaitaiStream.mod(this.header.pathNameSize, 2) == 1) {
        this.pathNamePadding = this._io.readBytes(1);
        if (!((KaitaiStream.byteArrayCompare(this.pathNamePadding, [0]) == 0))) {
          throw new KaitaiStream.ValidationNotEqualError([0], this.pathNamePadding, this._io, "/types/file/seq/3");
        }
      }
      this.fileData = this._io.readBytes(this.header.fileSize.value);
      if (KaitaiStream.mod(this.header.fileSize.value, 2) == 1) {
        this.fileDataPadding = this._io.readBytes(1);
        if (!((KaitaiStream.byteArrayCompare(this.fileDataPadding, [0]) == 0))) {
          throw new KaitaiStream.ValidationNotEqualError([0], this.fileDataPadding, this._io, "/types/file/seq/5");
        }
      }
      if ( (((KaitaiStream.byteArrayCompare(this.pathName, [84, 82, 65, 73, 76, 69, 82, 33, 33, 33]) == 0)) && (this.header.fileSize.value == 0)) ) {
        this.endOfFilePadding = this._io.readBytesFull();
      }
    }

    return File;
  })();

  var FileHeader = CpioOldLe.FileHeader = (function() {
    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.magic = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [199, 113]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([199, 113], this.magic, this._io, "/types/file_header/seq/0");
      }
      this.deviceNumber = this._io.readU2le();
      this.inodeNumber = this._io.readU2le();
      this.mode = this._io.readU2le();
      this.userId = this._io.readU2le();
      this.groupId = this._io.readU2le();
      this.numberOfLinks = this._io.readU2le();
      this.rDeviceNumber = this._io.readU2le();
      this.modificationTime = new FourByteUnsignedInteger(this._io, this, this._root);
      this.pathNameSize = this._io.readU2le();
      this.fileSize = new FourByteUnsignedInteger(this._io, this, this._root);
    }

    return FileHeader;
  })();

  var FourByteUnsignedInteger = CpioOldLe.FourByteUnsignedInteger = (function() {
    function FourByteUnsignedInteger(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FourByteUnsignedInteger.prototype._read = function() {
      this.mostSignificantBits = this._io.readU2le();
      this.leastSignificantBits = this._io.readU2le();
    }
    Object.defineProperty(FourByteUnsignedInteger.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = (this.leastSignificantBits + (this.mostSignificantBits << 16));
        return this._m_value;
      }
    });

    return FourByteUnsignedInteger;
  })();

  return CpioOldLe;
})();
return CpioOldLe;
}));
