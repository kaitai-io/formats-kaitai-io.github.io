// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var TlsClientHello = (function() {
  function TlsClientHello(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  TlsClientHello.prototype._read = function() {
    this.version = new Version(this._io, this, this._root);
    this.random = new Random(this._io, this, this._root);
    this.sessionId = new SessionId(this._io, this, this._root);
    this.cipherSuites = new CipherSuites(this._io, this, this._root);
    this.compressionMethods = new CompressionMethods(this._io, this, this._root);
    if (this._io.isEof() == false) {
      this.extensions = new Extensions(this._io, this, this._root);
    }
  }

  var ServerName = TlsClientHello.ServerName = (function() {
    function ServerName(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ServerName.prototype._read = function() {
      this.nameType = this._io.readU1();
      this.length = this._io.readU2be();
      this.hostName = this._io.readBytes(this.length);
    }

    return ServerName;
  })();

  var Random = TlsClientHello.Random = (function() {
    function Random(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Random.prototype._read = function() {
      this.gmtUnixTime = this._io.readU4be();
      this.random = this._io.readBytes(28);
    }

    return Random;
  })();

  var SessionId = TlsClientHello.SessionId = (function() {
    function SessionId(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SessionId.prototype._read = function() {
      this.len = this._io.readU1();
      this.sid = this._io.readBytes(this.len);
    }

    return SessionId;
  })();

  var Sni = TlsClientHello.Sni = (function() {
    function Sni(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Sni.prototype._read = function() {
      this.listLength = this._io.readU2be();
      this.serverNames = [];
      while (!this._io.isEof()) {
        this.serverNames.push(new ServerName(this._io, this, this._root));
      }
    }

    return Sni;
  })();

  var CipherSuites = TlsClientHello.CipherSuites = (function() {
    function CipherSuites(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CipherSuites.prototype._read = function() {
      this.len = this._io.readU2be();
      this.cipherSuites = new Array(Math.floor(this.len / 2));
      for (var i = 0; i < Math.floor(this.len / 2); i++) {
        this.cipherSuites[i] = new CipherSuite(this._io, this, this._root);
      }
    }

    return CipherSuites;
  })();

  var CompressionMethods = TlsClientHello.CompressionMethods = (function() {
    function CompressionMethods(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CompressionMethods.prototype._read = function() {
      this.len = this._io.readU1();
      this.compressionMethods = this._io.readBytes(this.len);
    }

    return CompressionMethods;
  })();

  var Alpn = TlsClientHello.Alpn = (function() {
    function Alpn(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Alpn.prototype._read = function() {
      this.extLen = this._io.readU2be();
      this.alpnProtocols = [];
      while (!this._io.isEof()) {
        this.alpnProtocols.push(new Protocol(this._io, this, this._root));
      }
    }

    return Alpn;
  })();

  var Extensions = TlsClientHello.Extensions = (function() {
    function Extensions(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Extensions.prototype._read = function() {
      this.len = this._io.readU2be();
      this.extensions = [];
      while (!this._io.isEof()) {
        this.extensions.push(new Extension(this._io, this, this._root));
      }
    }

    return Extensions;
  })();

  var Version = TlsClientHello.Version = (function() {
    function Version(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Version.prototype._read = function() {
      this.major = this._io.readU1();
      this.minor = this._io.readU1();
    }

    return Version;
  })();

  var CipherSuite = TlsClientHello.CipherSuite = (function() {
    function CipherSuite(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CipherSuite.prototype._read = function() {
      this.cipherSuite = this._io.readU2be();
    }

    return CipherSuite;
  })();

  var Protocol = TlsClientHello.Protocol = (function() {
    function Protocol(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Protocol.prototype._read = function() {
      this.strlen = this._io.readU1();
      this.name = this._io.readBytes(this.strlen);
    }

    return Protocol;
  })();

  var Extension = TlsClientHello.Extension = (function() {
    function Extension(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Extension.prototype._read = function() {
      this.type = this._io.readU2be();
      this.len = this._io.readU2be();
      switch (this.type) {
      case 0:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Sni(_io__raw_body, this, this._root);
        break;
      case 16:
        this._raw_body = this._io.readBytes(this.len);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Alpn(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.len);
        break;
      }
    }

    return Extension;
  })();

  return TlsClientHello;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('TlsClientHello', [], function() {
    return TlsClientHello;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = TlsClientHello;
}
