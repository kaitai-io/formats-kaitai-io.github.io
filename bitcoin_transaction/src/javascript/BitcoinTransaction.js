// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.BitcoinTransaction = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link https://bitcoin.org/en/developer-guide#transactions
 * https://en.bitcoin.it/wiki/Transaction
 * |Source}
 */

var BitcoinTransaction = (function() {
  BitcoinTransaction.SighashType = Object.freeze({
    SIGHASH_ALL: 1,
    SIGHASH_NONE: 2,
    SIGHASH_SINGLE: 3,
    SIGHASH_ANYONECANPAY: 80,

    1: "SIGHASH_ALL",
    2: "SIGHASH_NONE",
    3: "SIGHASH_SINGLE",
    80: "SIGHASH_ANYONECANPAY",
  });

  function BitcoinTransaction(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  BitcoinTransaction.prototype._read = function() {
    this.version = this._io.readU4le();
    this.numVins = this._io.readU1();
    this.vins = new Array(this.numVins);
    for (var i = 0; i < this.numVins; i++) {
      this.vins[i] = new Vin(this._io, this, this._root);
    }
    this.numVouts = this._io.readU1();
    this.vouts = new Array(this.numVouts);
    for (var i = 0; i < this.numVouts; i++) {
      this.vouts[i] = new Vout(this._io, this, this._root);
    }
    this.locktime = this._io.readU4le();
  }

  var Vout = BitcoinTransaction.Vout = (function() {
    function Vout(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Vout.prototype._read = function() {
      this.amount = this._io.readU8le();
      this.scriptLen = this._io.readU1();
      this.scriptPubKey = this._io.readBytes(this.scriptLen);
    }

    /**
     * Number of Satoshis to be transfered.
     */

    /**
     * ScriptPubKey's length.
     */

    /**
     * ScriptPubKey.
     * @see {@link https://en.bitcoin.it/wiki/Transaction#Output
     * https://en.bitcoin.it/wiki/Script
     * |Source}
     */

    return Vout;
  })();

  var PublicKey = BitcoinTransaction.PublicKey = (function() {
    function PublicKey(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PublicKey.prototype._read = function() {
      this.type = this._io.readU1();
      this.x = this._io.readBytes(32);
      this.y = this._io.readBytes(32);
    }

    /**
     * 'x' coordinate of the public key on the elliptic curve.
     */

    /**
     * 'y' coordinate of the public key on the elliptic curve.
     */

    return PublicKey;
  })();

  var Vin = BitcoinTransaction.Vin = (function() {
    function Vin(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Vin.prototype._read = function() {
      this.txid = this._io.readBytes(32);
      this.outputId = this._io.readU4le();
      this.scriptLen = this._io.readU1();
      this._raw_scriptSig = this._io.readBytes(this.scriptLen);
      var _io__raw_scriptSig = new KaitaiStream(this._raw_scriptSig);
      this.scriptSig = new ScriptSignature(_io__raw_scriptSig, this, this._root);
      this.endOfVin = this._io.ensureFixedContents([255, 255, 255, 255]);
    }

    /**
     * Previous transaction hash.
     */

    /**
     * ID indexing an ouput of the transaction refered by txid.
     * This output will be used as an input in the present transaction.
     */

    /**
     * ScriptSig's length.
     */

    /**
     * ScriptSig.
     * @see {@link https://en.bitcoin.it/wiki/Transaction#Input
     * https://en.bitcoin.it/wiki/Script
     * |Source}
     */

    /**
     * Magic number indicating the end of the current input.
     */

    return Vin;
  })();

  var ScriptSignature = BitcoinTransaction.ScriptSignature = (function() {
    function ScriptSignature(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ScriptSignature.prototype._read = function() {
      this.sigStackLen = this._io.readU1();
      this.derSig = new DerSignature(this._io, this, this._root);
      this.sigType = this._io.readU1();
      this.pubkeyStackLen = this._io.readU1();
      this.pubkey = new PublicKey(this._io, this, this._root);
    }

    /**
     * DER-encoded ECDSA signature.
     * @see {@link https://en.wikipedia.org/wiki/X.690#DER_encoding
     * https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
     * |Source}
     */

    /**
     * Type of signature.
     */

    /**
     * Public key (bitcoin address of the recipient).
     */

    return ScriptSignature;
  })();

  var DerSignature = BitcoinTransaction.DerSignature = (function() {
    function DerSignature(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DerSignature.prototype._read = function() {
      this.sequence = this._io.ensureFixedContents([48]);
      this.sigLen = this._io.readU1();
      this.sep1 = this._io.ensureFixedContents([2]);
      this.sigRLen = this._io.readU1();
      this.sigR = this._io.readBytes(this.sigRLen);
      this.sep2 = this._io.ensureFixedContents([2]);
      this.sigSLen = this._io.readU1();
      this.sigS = this._io.readBytes(this.sigSLen);
    }

    /**
     * 'r' value's length.
     */

    /**
     * 'r' value of the ECDSA signature.
     * @see {@link https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm|Source}
     */

    /**
     * 's' value's length.
     */

    /**
     * 's' value of the ECDSA signature.
     * @see {@link https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm|Source}
     */

    return DerSignature;
  })();

  /**
   * Version number.
   */

  /**
   * Number of input transactions.
   */

  /**
   * Input transactions.
   * An input refers to an output from a previous transaction.
   */

  /**
   * Number of output transactions.
   */

  /**
   * Output transactions.
   */

  return BitcoinTransaction;
})();
return BitcoinTransaction;
}));
