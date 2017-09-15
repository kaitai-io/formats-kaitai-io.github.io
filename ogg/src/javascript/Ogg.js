// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Ogg is a popular media container format, which provides basic
 * streaming / buffering mechanisms and is content-agnostic. Most
 * popular codecs that are used within Ogg streams are Vorbis (thus
 * making Ogg/Vorbis streams) and Theora (Ogg/Theora).
 * 
 * Ogg stream is a sequence Ogg pages. They can be read sequentially,
 * or one can jump into arbitrary stream location and scan for "OggS"
 * sync code to find the beginning of a new Ogg page and continue
 * decoding the stream contents from that one.
 */

var Ogg = (function() {
  function Ogg(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ogg.prototype._read = function() {
    this.pages = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.pages.push(new Page(this._io, this, this._root));
      i++;
    }
  }

  /**
   * Ogg page is a basic unit of data in an Ogg bitstream, usually
   * it's around 4-8 KB, with a maximum size of 65307 bytes.
   */

  var Page = Ogg.Page = (function() {
    function Page(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Page.prototype._read = function() {
      this.syncCode = this._io.ensureFixedContents([79, 103, 103, 83]);
      this.version = this._io.ensureFixedContents([0]);
      this.reserved1 = this._io.readBitsInt(5);
      this.isEndOfStream = this._io.readBitsInt(1) != 0;
      this.isBeginningOfStream = this._io.readBitsInt(1) != 0;
      this.isContinuation = this._io.readBitsInt(1) != 0;
      this._io.alignToByte();
      this.granulePos = this._io.readU8le();
      this.bitstreamSerial = this._io.readU4le();
      this.pageSeqNum = this._io.readU4le();
      this.crc32 = this._io.readU4le();
      this.numSegments = this._io.readU1();
      this.lenSegments = new Array(this.numSegments);
      for (var i = 0; i < this.numSegments; i++) {
        this.lenSegments[i] = this._io.readU1();
      }
      this.segments = new Array(this.numSegments);
      for (var i = 0; i < this.numSegments; i++) {
        this.segments[i] = this._io.readBytes(this.lenSegments[i]);
      }
    }

    /**
     * Version of the Ogg bitstream format. Currently must be 0.
     */

    /**
     * EOS (End Of Stream) mark. This page is the last page in the
     * logical bitstream. The EOS flag must be set on the final page of
     * every logical bitstream, and must not be set on any other page.
     */

    /**
     * BOS (Beginning Of Stream) mark. This page is the first page in
     * the logical bitstream. The BOS flag must be set on the first
     * page of every logical bitstream, and must not be set on any
     * other page.    
     */

    /**
     * The first packet on this page is a continuation of the previous
     * packet in the logical bitstream.
     */

    /**
     * "Granule position" is the time marker in Ogg files. It is an
     * abstract value, whose meaning is determined by the codec. It
     * may, for example, be a count of the number of samples, the
     * number of frames or a more complex scheme.
     */

    /**
     * Serial number that identifies a page as belonging to a
     * particular logical bitstream. Each logical bitstream in a file
     * has a unique value, and this field allows implementations to
     * deliver the pages to the appropriate decoder. In a typical
     * Vorbis and Theora file, one stream is the audio (Vorbis), and
     * the other is the video (Theora).
     */

    /**
     * Sequential number of page, guaranteed to be monotonically
     * increasing for each logical bitstream. The first page is 0, the
     * second 1, etc. This allows implementations to detect when data
     * has been lost.
     */

    /**
     * This field provides a CRC32 checksum of the data in the entire
     * page (including the page header, calculated with the checksum
     * field set to 0). This allows verification that the data has not
     * been corrupted since it was created. Pages that fail the
     * checksum should be discarded. The checksum is generated using a
     * polynomial value of 0x04C11DB7.
     */

    /**
     * The number of segments that exist in this page. There can be a
     * maximum of 255 segments in any one page.
     */

    /**
     * Table of lengths of segments.
     */

    /**
     * Segment content bytes make up the rest of the Ogg page.
     */

    return Page;
  })();

  return Ogg;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Ogg', [], function() {
    return Ogg;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Ogg;
}
