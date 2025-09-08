// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.AndroidBootldrHuawei || (root.AndroidBootldrHuawei = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (AndroidBootldrHuawei_, KaitaiStream) {
/**
 * Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:
 * 
 * * Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
 *   [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)
 * 
 * [sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
 * [others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
 * 
 * All image versions can be found in factory images at
 * <https://developers.google.com/android/images> for the specific device. To
 * avoid having to download an entire ZIP archive when you only need one file
 * from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
 * use its [command line
 * tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
 * members in the archive and then to download only the file you want.
 * @see {@link https://android.googlesource.com/device/huawei/angler/+/673cfb9/releasetools.py|Source}
 * @see {@link https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_format.h?h=LA.UM.6.1.1&id=a68d284aee85|Source}
 * @see {@link https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85|Source}
 */

var AndroidBootldrHuawei = (function() {
  function AndroidBootldrHuawei(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AndroidBootldrHuawei.prototype._read = function() {
    this.metaHeader = new MetaHdr(this._io, this, this._root);
    this.headerExt = this._io.readBytes(this.metaHeader.lenMetaHeader - 76);
    this._raw_imageHeader = this._io.readBytes(this.metaHeader.lenImageHeader);
    var _io__raw_imageHeader = new KaitaiStream(this._raw_imageHeader);
    this.imageHeader = new ImageHdr(_io__raw_imageHeader, this, this._root);
  }

  var ImageHdr = AndroidBootldrHuawei.ImageHdr = (function() {
    function ImageHdr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ImageHdr.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new ImageHdrEntry(this._io, this, this._root));
        i++;
      }
    }

    /**
     * The C generator program defines `img_header` as a [fixed size
     * array](https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n42)
     * of `img_header_entry_t` structs with length `MAX_IMAGES` (which is
     * defined as `16`).
     * 
     * This means that technically there will always be 16 `image_hdr`
     * entries, the first *n* entries being used (filled with real values)
     * and the rest left unused with all bytes zero.
     * 
     * To check if an entry is used, use the `is_used` attribute.
     */

    return ImageHdr;
  })();

  var ImageHdrEntry = AndroidBootldrHuawei.ImageHdrEntry = (function() {
    function ImageHdrEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ImageHdrEntry.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(72), 0, false), "ASCII");
      this.ofsBody = this._io.readU4le();
      this.lenBody = this._io.readU4le();
    }
    Object.defineProperty(ImageHdrEntry.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        if (this.isUsed) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsBody);
          this._m_body = io.readBytes(this.lenBody);
          io.seek(_pos);
        }
        return this._m_body;
      }
    });

    /**
     * @see {@link https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n119|Source}
     */
    Object.defineProperty(ImageHdrEntry.prototype, 'isUsed', {
      get: function() {
        if (this._m_isUsed !== undefined)
          return this._m_isUsed;
        this._m_isUsed =  ((this.ofsBody != 0) && (this.lenBody != 0)) ;
        return this._m_isUsed;
      }
    });

    /**
     * partition name
     */

    return ImageHdrEntry;
  })();

  var MetaHdr = AndroidBootldrHuawei.MetaHdr = (function() {
    function MetaHdr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MetaHdr.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([60, 214, 26, 206])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([60, 214, 26, 206]), this.magic, this._io, "/types/meta_hdr/seq/0");
      }
      this.version = new Version(this._io, this, this._root);
      this.imageVersion = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(64), 0, false), "ASCII");
      this.lenMetaHeader = this._io.readU2le();
      this.lenImageHeader = this._io.readU2le();
    }

    return MetaHdr;
  })();

  var Version = AndroidBootldrHuawei.Version = (function() {
    function Version(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Version.prototype._read = function() {
      this.major = this._io.readU2le();
      this.minor = this._io.readU2le();
    }

    return Version;
  })();

  return AndroidBootldrHuawei;
})();
AndroidBootldrHuawei_.AndroidBootldrHuawei = AndroidBootldrHuawei;
});
