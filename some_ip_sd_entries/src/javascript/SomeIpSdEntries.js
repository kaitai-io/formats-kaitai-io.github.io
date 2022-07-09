// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.SomeIpSdEntries = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * The entries are used to synchronize the state of services instances and the
 * Publish/-Subscribe handling.
 * @see {@link https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * -|section 4.1.2.3  Entry Format}
 */

var SomeIpSdEntries = (function() {
  function SomeIpSdEntries(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SomeIpSdEntries.prototype._read = function() {
    this.entries = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.entries.push(new SdEntry(this._io, this, this._root));
      i++;
    }
  }

  var SdEntry = SomeIpSdEntries.SdEntry = (function() {
    SdEntry.EntryTypes = Object.freeze({
      FIND: 0,
      OFFER: 1,
      SUBSCRIBE: 6,
      SUBSCRIBE_ACK: 7,

      0: "FIND",
      1: "OFFER",
      6: "SUBSCRIBE",
      7: "SUBSCRIBE_ACK",
    });

    function SdEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SdEntry.prototype._read = function() {
      this.header = new SdEntryHeader(this._io, this, this._root);
      switch (this.header.type) {
      case SomeIpSdEntries.SdEntry.EntryTypes.FIND:
        this.content = new SdServiceEntry(this._io, this, this._root);
        break;
      case SomeIpSdEntries.SdEntry.EntryTypes.OFFER:
        this.content = new SdServiceEntry(this._io, this, this._root);
        break;
      case SomeIpSdEntries.SdEntry.EntryTypes.SUBSCRIBE:
        this.content = new SdEventgroupEntry(this._io, this, this._root);
        break;
      case SomeIpSdEntries.SdEntry.EntryTypes.SUBSCRIBE_ACK:
        this.content = new SdEventgroupEntry(this._io, this, this._root);
        break;
      }
    }

    var SdEntryHeader = SdEntry.SdEntryHeader = (function() {
      function SdEntryHeader(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdEntryHeader.prototype._read = function() {
        this.type = this._io.readU1();
        this.indexFirstOptions = this._io.readU1();
        this.indexSecondOptions = this._io.readU1();
        this.numberFirstOptions = this._io.readBitsIntBe(4);
        this.numberSecondOptions = this._io.readBitsIntBe(4);
        this._io.alignToByte();
        this.serviceId = this._io.readU2be();
        this.instanceId = this._io.readU2be();
        this.majorVersion = this._io.readU1();
        this.ttl = this._io.readBitsIntBe(24);
      }

      return SdEntryHeader;
    })();

    var SdServiceEntry = SdEntry.SdServiceEntry = (function() {
      function SdServiceEntry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdServiceEntry.prototype._read = function() {
        this.minorVersion = this._io.readU4be();
      }

      return SdServiceEntry;
    })();

    var SdEventgroupEntry = SdEntry.SdEventgroupEntry = (function() {
      function SdEventgroupEntry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SdEventgroupEntry.prototype._read = function() {
        this.reserved = this._io.readU1();
        this.initialDataRequested = this._io.readBitsIntBe(1) != 0;
        this.reserved2 = this._io.readBitsIntBe(3);
        this.counter = this._io.readBitsIntBe(4);
        this._io.alignToByte();
        this.eventGroupId = this._io.readU2be();
      }

      return SdEventgroupEntry;
    })();

    return SdEntry;
  })();

  return SomeIpSdEntries;
})();
return SomeIpSdEntries;
}));
