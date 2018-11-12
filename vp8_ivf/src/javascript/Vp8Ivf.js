// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Vp8Ivf = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link https://wiki.multimedia.cx/index.php/IVF|Source}
 */

var Vp8Ivf = (function() {
  function Vp8Ivf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Vp8Ivf.prototype._read = function() {
    this.magic1 = this._io.ensureFixedContents([68, 75, 73, 70]);
    this.version = this._io.readU2le();
    this.lenHeader = this._io.readU2le();
    this.codec = this._io.ensureFixedContents([86, 80, 56, 48]);
    this.width = this._io.readU2le();
    this.height = this._io.readU2le();
    this.framerate = this._io.readU4le();
    this.timescale = this._io.readU4le();
    this.numFrames = this._io.readU4le();
    this.unused = this._io.readU4le();
    this.imageData = new Array(this.numFrames);
    for (var i = 0; i < this.numFrames; i++) {
      this.imageData[i] = new Blocks(this._io, this, this._root);
    }
  }

  var Blocks = Vp8Ivf.Blocks = (function() {
    function Blocks(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Blocks.prototype._read = function() {
      this.entries = new Block(this._io, this, this._root);
    }

    return Blocks;
  })();

  var Block = Vp8Ivf.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Block.prototype._read = function() {
      this.lenFrame = this._io.readU4le();
      this.timestamp = this._io.readU8le();
      this.framedata = this._io.readBytes(this.lenFrame);
    }

    /**
     * size of the frame data
     */

    return Block;
  })();

  /**
   * Magic Number of IVF Files
   */

  /**
   * This should be 0
   */

  /**
   * Normally the header length is 32 byte
   */

  /**
   * Name of the codec e.g. 'VP80' for VP8
   */

  /**
   * The (initial) width of the video, every keyframe may change the resolution
   */

  /**
   * The (initial) height of the video, every keyframe may change the resolution
   */

  /**
   * the (framerate * timescale) e.g. for 30 fps -> 30000
   */

  /**
   * the timescale is a divider of the seconds (VPX is integer math only) mostly 1000
   */

  /**
   * the number of frames (if not a camera stream)
   */

  return Vp8Ivf;
})();
return Vp8Ivf;
}));
