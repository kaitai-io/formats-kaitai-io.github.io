// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './SomeIpSdOptions', './SomeIpSdEntries'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./SomeIpSdOptions'), require('./SomeIpSdEntries'));
  } else {
    factory(root.SomeIpSd || (root.SomeIpSd = {}), root.KaitaiStream, root.SomeIpSdOptions || (root.SomeIpSdOptions = {}), root.SomeIpSdEntries || (root.SomeIpSdEntries = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (SomeIpSd_, KaitaiStream, SomeIpSdOptions_, SomeIpSdEntries_) {
/**
 * The main tasks of the Service Discovery Protocol are communicating the
 * availability of functional entities called services in the in-vehicle
 * communication as well as controlling the send behavior of event messages.
 * This allows sending only event messages to receivers requiring them (Publish/Subscribe).
 * The solution described here is also known as SOME/IP-SD
 * (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
 * @see {@link https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf|Source}
 */

var SomeIpSd = (function() {
  function SomeIpSd(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SomeIpSd.prototype._read = function() {
    this.flags = new SdFlags(this._io, this, this._root);
    this.reserved = this._io.readBytes(3);
    this.lenEntries = this._io.readU4be();
    this._raw_entries = this._io.readBytes(this.lenEntries);
    var _io__raw_entries = new KaitaiStream(this._raw_entries);
    this.entries = new SomeIpSdEntries_.SomeIpSdEntries(_io__raw_entries, null, null);
    this.lenOptions = this._io.readU4be();
    this._raw_options = this._io.readBytes(this.lenOptions);
    var _io__raw_options = new KaitaiStream(this._raw_options);
    this.options = new SomeIpSdOptions_.SomeIpSdOptions(_io__raw_options, null, null);
  }

  /**
   * @see AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3
   */

  var SdFlags = SomeIpSd.SdFlags = (function() {
    function SdFlags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SdFlags.prototype._read = function() {
      this.reboot = this._io.readBitsIntBe(1) != 0;
      this.unicast = this._io.readBitsIntBe(1) != 0;
      this.initialData = this._io.readBitsIntBe(1) != 0;
      this.reserved = this._io.readBitsIntBe(5);
    }

    return SdFlags;
  })();

  /**
   * The SOME/IP-SD Header shall start with an 8 Bit field called flags.
   */

  return SomeIpSd;
})();
SomeIpSd_.SomeIpSd = SomeIpSd;
});
