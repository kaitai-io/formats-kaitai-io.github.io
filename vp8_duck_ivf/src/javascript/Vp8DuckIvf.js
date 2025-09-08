// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Vp8DuckIvf || (root.Vp8DuckIvf = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Vp8DuckIvf_, KaitaiStream) {
/**
 * Duck IVF is a simple container format for raw VP8 data, which is an open and
 * royalty-free video compression format, currently developed by Google.
 * 
 * Test .ivf files are available at
 * <https://chromium.googlesource.com/webm/vp8-test-vectors>
 * @see {@link https://wiki.multimedia.cx/index.php/Duck_IVF|Source}
 */

var Vp8DuckIvf = (function() {
  function Vp8DuckIvf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Vp8DuckIvf.prototype._read = function() {
    this.magic1 = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic1, new Uint8Array([68, 75, 73, 70])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([68, 75, 73, 70]), this.magic1, this._io, "/seq/0");
    }
    this.version = this._io.readU2le();
    this.lenHeader = this._io.readU2le();
    this.codec = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.codec, new Uint8Array([86, 80, 56, 48])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([86, 80, 56, 48]), this.codec, this._io, "/seq/3");
    }
    this.width = this._io.readU2le();
    this.height = this._io.readU2le();
    this.framerate = this._io.readU4le();
    this.timescale = this._io.readU4le();
    this.numFrames = this._io.readU4le();
    this.unused = this._io.readU4le();
    this.imageData = [];
    for (var i = 0; i < this.numFrames; i++) {
      this.imageData.push(new Blocks(this._io, this, this._root));
    }
  }

  var Block = Vp8DuckIvf.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

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

  var Blocks = Vp8DuckIvf.Blocks = (function() {
    function Blocks(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Blocks.prototype._read = function() {
      this.entries = new Block(this._io, this, this._root);
    }

    return Blocks;
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

  return Vp8DuckIvf;
})();
Vp8DuckIvf_.Vp8DuckIvf = Vp8DuckIvf;
});
