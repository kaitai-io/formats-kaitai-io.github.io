// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Hccap = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Native format of Hashcat password "recovery" utility
 * A sample of file for testing can be downloaded from https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap
 * @see {@link https://hashcat.net/wiki/doku.php?id=hccap|Source}
 */

var Hccap = (function() {
  function Hccap(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Hccap.prototype._read = function() {
    this.records = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.records.push(new Hccap(this._io, this, this._root));
      i++;
    }
  }

  var Hccap = Hccap.Hccap = (function() {
    function Hccap(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Hccap.prototype._read = function() {
      this.essid = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(36), 0, false), "utf-8");
      this.apMac = this._io.readBytes(6);
      this.stantionMac = this._io.readBytes(6);
      this.stantionNonce = this._io.readBytes(32);
      this.apNonce = this._io.readBytes(32);
      this._raw_eapol = this._io.readBytes(256);
      var _io__raw_eapol = new KaitaiStream(this._raw_eapol);
      this.eapol = new EapolFrame(_io__raw_eapol, this, this._root);
      this.eapolSize = this._io.readU4le();
      this.keyver = this._io.readU4le();
      this.keymic = this._io.readBytes(16);
    }

    /**
     * the bssid(MAC) of the access point
     */

    /**
     * the MAC address of a client connecting to the access point
     */

    /**
     * size of eapol
     */

    /**
     * the flag used to distinguish WPA from WPA2 ciphers. Value of 1 means WPA, other - WPA2
     */

    /**
     * the final hash value. MD5 for WPA and SHA-1 for WPA2 (truncated to 128 bit)
     */

    return Hccap;
  })();

  var EapolFrame = Hccap.EapolFrame = (function() {
    function EapolFrame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EapolFrame.prototype._read = function() {
    }
    Object.defineProperty(EapolFrame.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_body = this._io.readBytes(this._parent.eapolSize);
        this._io.seek(_pos);
        return this._m_body;
      }
    });

    return EapolFrame;
  })();

  return Hccap;
})();
return Hccap;
}));
