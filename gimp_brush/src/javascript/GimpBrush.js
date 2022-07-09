// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.GimpBrush = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
 * It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
 * for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
 * the tool. The Spacing parameter sets the distance between the brush marks as a percentage
 * of brush width. Its default value can be set in the brush file.
 * 
 * You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
 * into GIMP for use in the paint tools by copying them into one of the Brush Folders -
 * select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
 * and choose **Brushes** to see the recognized Brush Folders or to add new ones.
 * @see {@link https://gitlab.gnome.org/GNOME/gimp/-/raw/4416313/devel-docs/gbr.txt|Source}
 */

var GimpBrush = (function() {
  GimpBrush.ColorDepth = Object.freeze({
    GRAYSCALE: 1,
    RGBA: 4,

    1: "GRAYSCALE",
    4: "RGBA",
  });

  function GimpBrush(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  GimpBrush.prototype._read = function() {
    this.lenHeader = this._io.readU4be();
    this._raw_header = this._io.readBytes((this.lenHeader - 4));
    var _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = new Header(_io__raw_header, this, this._root);
  }

  var Header = GimpBrush.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.version = this._io.readU4be();
      if (!(this.version == 2)) {
        throw new KaitaiStream.ValidationNotEqualError(2, this.version, this._io, "/types/header/seq/0");
      }
      this.width = this._io.readU4be();
      if (!(this.width >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.width, this._io, "/types/header/seq/1");
      }
      if (!(this.width <= 10000)) {
        throw new KaitaiStream.ValidationGreaterThanError(10000, this.width, this._io, "/types/header/seq/1");
      }
      this.height = this._io.readU4be();
      if (!(this.height >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.height, this._io, "/types/header/seq/2");
      }
      if (!(this.height <= 10000)) {
        throw new KaitaiStream.ValidationGreaterThanError(10000, this.height, this._io, "/types/header/seq/2");
      }
      this.bytesPerPixel = this._io.readU4be();
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [71, 73, 77, 80]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([71, 73, 77, 80], this.magic, this._io, "/types/header/seq/4");
      }
      this.spacing = this._io.readU4be();
      this.brushName = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytesFull(), 0, false), "UTF-8");
    }

    /**
     * @see {@link https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-load.c#L170|Source}
     * @see {@link https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-header.h#L24|Source}
     */

    /**
     * @see {@link https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-load.c#L177|Source}
     * @see {@link https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-header.h#L24|Source}
     */

    /**
     * Default spacing to be used for brush. Percentage of brush width.
     */

    return Header;
  })();

  var Bitmap = GimpBrush.Bitmap = (function() {
    function Bitmap(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Bitmap.prototype._read = function() {
      this.rows = [];
      for (var i = 0; i < this._root.header.height; i++) {
        this.rows.push(new Row(this._io, this, this._root));
      }
    }

    return Bitmap;
  })();

  var Row = GimpBrush.Row = (function() {
    function Row(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Row.prototype._read = function() {
      this.pixels = [];
      for (var i = 0; i < this._root.header.width; i++) {
        switch (this._root.header.bytesPerPixel) {
        case GimpBrush.ColorDepth.GRAYSCALE:
          this.pixels.push(new PixelGray(this._io, this, this._root));
          break;
        case GimpBrush.ColorDepth.RGBA:
          this.pixels.push(new PixelRgba(this._io, this, this._root));
          break;
        }
      }
    }

    var PixelGray = Row.PixelGray = (function() {
      function PixelGray(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      PixelGray.prototype._read = function() {
        this.gray = this._io.readU1();
      }
      Object.defineProperty(PixelGray.prototype, 'red', {
        get: function() {
          if (this._m_red !== undefined)
            return this._m_red;
          this._m_red = 0;
          return this._m_red;
        }
      });
      Object.defineProperty(PixelGray.prototype, 'green', {
        get: function() {
          if (this._m_green !== undefined)
            return this._m_green;
          this._m_green = 0;
          return this._m_green;
        }
      });
      Object.defineProperty(PixelGray.prototype, 'blue', {
        get: function() {
          if (this._m_blue !== undefined)
            return this._m_blue;
          this._m_blue = 0;
          return this._m_blue;
        }
      });
      Object.defineProperty(PixelGray.prototype, 'alpha', {
        get: function() {
          if (this._m_alpha !== undefined)
            return this._m_alpha;
          this._m_alpha = this.gray;
          return this._m_alpha;
        }
      });

      return PixelGray;
    })();

    var PixelRgba = Row.PixelRgba = (function() {
      function PixelRgba(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      PixelRgba.prototype._read = function() {
        this.red = this._io.readU1();
        this.green = this._io.readU1();
        this.blue = this._io.readU1();
        this.alpha = this._io.readU1();
      }

      return PixelRgba;
    })();

    return Row;
  })();
  Object.defineProperty(GimpBrush.prototype, 'lenBody', {
    get: function() {
      if (this._m_lenBody !== undefined)
        return this._m_lenBody;
      this._m_lenBody = ((this.header.width * this.header.height) * this.header.bytesPerPixel);
      return this._m_lenBody;
    }
  });
  Object.defineProperty(GimpBrush.prototype, 'body', {
    get: function() {
      if (this._m_body !== undefined)
        return this._m_body;
      var _pos = this._io.pos;
      this._io.seek(this.lenHeader);
      this._m_body = this._io.readBytes(this.lenBody);
      this._io.seek(_pos);
      return this._m_body;
    }
  });

  return GimpBrush;
})();
return GimpBrush;
}));
