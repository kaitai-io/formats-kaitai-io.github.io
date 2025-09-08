// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.BtrfsStream || (root.BtrfsStream = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (BtrfsStream_, KaitaiStream) {
/**
 * Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
 * administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
 * integral multi-device spanning in Linux file systems.
 * Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
 * using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
 * different Btrfs file system. The `btrfs send` command creates a set of data modifications required
 * for converting one subvolume into another.
 * This spec can be used to disassemble the binary diff created by the `btrfs send` command.
 * If you want a text representation you may want to checkout `btrfs receive --dump` instead.
 * @see {@link https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive.html|Source}
 */

var BtrfsStream = (function() {
  BtrfsStream.Attribute = Object.freeze({
    UNSPEC: 0,
    UUID: 1,
    CTRANSID: 2,
    INO: 3,
    SIZE: 4,
    MODE: 5,
    UID: 6,
    GID: 7,
    RDEV: 8,
    CTIME: 9,
    MTIME: 10,
    ATIME: 11,
    OTIME: 12,
    XATTR_NAME: 13,
    XATTR_DATA: 14,
    PATH: 15,
    PATH_TO: 16,
    PATH_LINK: 17,
    FILE_OFFSET: 18,
    DATA: 19,
    CLONE_UUID: 20,
    CLONE_CTRANSID: 21,
    CLONE_PATH: 22,
    CLONE_OFFSET: 23,
    CLONE_LEN: 24,

    0: "UNSPEC",
    1: "UUID",
    2: "CTRANSID",
    3: "INO",
    4: "SIZE",
    5: "MODE",
    6: "UID",
    7: "GID",
    8: "RDEV",
    9: "CTIME",
    10: "MTIME",
    11: "ATIME",
    12: "OTIME",
    13: "XATTR_NAME",
    14: "XATTR_DATA",
    15: "PATH",
    16: "PATH_TO",
    17: "PATH_LINK",
    18: "FILE_OFFSET",
    19: "DATA",
    20: "CLONE_UUID",
    21: "CLONE_CTRANSID",
    22: "CLONE_PATH",
    23: "CLONE_OFFSET",
    24: "CLONE_LEN",
  });

  BtrfsStream.Command = Object.freeze({
    UNSPEC: 0,
    SUBVOL: 1,
    SNAPSHOT: 2,
    MKFILE: 3,
    MKDIR: 4,
    MKNOD: 5,
    MKFIFO: 6,
    MKSOCK: 7,
    SYMLINK: 8,
    RENAME: 9,
    LINK: 10,
    UNLINK: 11,
    RMDIR: 12,
    SET_XATTR: 13,
    REMOVE_XATTR: 14,
    WRITE: 15,
    CLONE: 16,
    TRUNCATE: 17,
    CHMOD: 18,
    CHOWN: 19,
    UTIMES: 20,
    END: 21,
    UPDATE_EXTENT: 22,

    0: "UNSPEC",
    1: "SUBVOL",
    2: "SNAPSHOT",
    3: "MKFILE",
    4: "MKDIR",
    5: "MKNOD",
    6: "MKFIFO",
    7: "MKSOCK",
    8: "SYMLINK",
    9: "RENAME",
    10: "LINK",
    11: "UNLINK",
    12: "RMDIR",
    13: "SET_XATTR",
    14: "REMOVE_XATTR",
    15: "WRITE",
    16: "CLONE",
    17: "TRUNCATE",
    18: "CHMOD",
    19: "CHOWN",
    20: "UTIMES",
    21: "END",
    22: "UPDATE_EXTENT",
  });

  function BtrfsStream(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  BtrfsStream.prototype._read = function() {
    this.header = new SendStreamHeader(this._io, this, this._root);
    this.commands = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.commands.push(new SendCommand(this._io, this, this._root));
      i++;
    }
  }

  var SendCommand = BtrfsStream.SendCommand = (function() {
    function SendCommand(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SendCommand.prototype._read = function() {
      this.lenData = this._io.readU4le();
      this.type = this._io.readU2le();
      this.checksum = this._io.readBytes(4);
      this._raw_data = this._io.readBytes(this.lenData);
      var _io__raw_data = new KaitaiStream(this._raw_data);
      this.data = new Tlvs(_io__raw_data, this, this._root);
    }

    var String = SendCommand.String = (function() {
      function String(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      String.prototype._read = function() {
        this.string = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
      }

      return String;
    })();

    var Timespec = SendCommand.Timespec = (function() {
      function Timespec(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Timespec.prototype._read = function() {
        this.tsSec = this._io.readS8le();
        this.tsNsec = this._io.readS4le();
      }

      return Timespec;
    })();

    var Tlv = SendCommand.Tlv = (function() {
      function Tlv(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Tlv.prototype._read = function() {
        this.type = this._io.readU2le();
        this.length = this._io.readU2le();
        switch (this.type) {
        case BtrfsStream.Attribute.ATIME:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new Timespec(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.CLONE_CTRANSID:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.CLONE_LEN:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.CLONE_OFFSET:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.CLONE_PATH:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new String(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.CLONE_UUID:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new Uuid(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.CTIME:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new Timespec(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.CTRANSID:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.FILE_OFFSET:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.GID:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.MODE:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.MTIME:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new Timespec(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.OTIME:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new Timespec(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.PATH:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new String(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.PATH_LINK:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new String(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.PATH_TO:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new String(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.RDEV:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.SIZE:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.UID:
          this.value = this._io.readU8le();
          break;
        case BtrfsStream.Attribute.UUID:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new Uuid(_io__raw_value, this, this._root);
          break;
        case BtrfsStream.Attribute.XATTR_NAME:
          this._raw_value = this._io.readBytes(this.length);
          var _io__raw_value = new KaitaiStream(this._raw_value);
          this.value = new String(_io__raw_value, this, this._root);
          break;
        default:
          this.value = this._io.readBytes(this.length);
          break;
        }
      }

      return Tlv;
    })();

    var Tlvs = SendCommand.Tlvs = (function() {
      function Tlvs(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Tlvs.prototype._read = function() {
        this.tlv = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.tlv.push(new Tlv(this._io, this, this._root));
          i++;
        }
      }

      return Tlvs;
    })();

    var Uuid = SendCommand.Uuid = (function() {
      function Uuid(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Uuid.prototype._read = function() {
        this.uuid = this._io.readBytes(16);
      }

      return Uuid;
    })();

    /**
     * CRC32 checksum of a whole send command, including the header, with this attribute set to 0.
     */

    return SendCommand;
  })();

  var SendStreamHeader = BtrfsStream.SendStreamHeader = (function() {
    function SendStreamHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SendStreamHeader.prototype._read = function() {
      this.magic = this._io.readBytes(13);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0]), this.magic, this._io, "/types/send_stream_header/seq/0");
      }
      this.version = this._io.readU4le();
    }

    return SendStreamHeader;
  })();

  return BtrfsStream;
})();
BtrfsStream_.BtrfsStream = BtrfsStream;
});
