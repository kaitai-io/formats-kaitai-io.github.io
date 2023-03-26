// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Bmp = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * The **BMP file format**, also known as **bitmap image file** or **device independent
 * bitmap (DIB) file format** or simply a **bitmap**, is a raster graphics image file
 * format used to store bitmap digital images, independently of the display
 * device (such as a graphics adapter), especially on Microsoft Windows
 * and OS/2 operating systems.
 * 
 * ## Samples
 * 
 * Great collection of various BMP sample files:
 * [**BMP Suite Image List**](
 *   http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html
 * ) (by Jason Summers)
 * 
 * If only there was such a comprehensive sample suite for every file format! It's like
 * a dream for every developer of any binary file format parser. It contains a lot of
 * different types and variations of BMP files, even the tricky ones, where it's not clear
 * from the specification how to deal with them (marked there as "**q**uestionable").
 * 
 * If you make a program which will be able to read all the "**g**ood" and "**q**uestionable"
 * BMP files and won't crash on the "**b**ad" ones, it will definitely have one of the most
 * extensive support of BMP files in the universe!
 * 
 * ## BITMAPV2INFOHEADER and BITMAPV3INFOHEADER
 * 
 * A beneficial discussion on Adobe forum (archived):
 * [**Invalid BMP Format with Alpha channel**](
 *   https://web.archive.org/web/20150127132443/https://forums.adobe.com/message/3272950
 * )
 * 
 * In 2010, someone noticed that Photoshop generated BMP with an odd type of header. There wasn't
 * any documentation available for this header at the time (and still isn't).
 * However, Chris Cox (former Adobe employee) claimed that they hadn't invented any type
 * of proprietary header and everything they were writing was taken directly
 * from the Microsoft documentation.
 * 
 * It showed up that the unknown header was called BITMAPV3INFOHEADER.
 * Although Microsoft has apparently requested and verified the use of the header,
 * the documentation on MSDN has probably got lost and they have probably
 * forgotten about this type of header.
 * 
 * This is the only source I could find about these structures, so we could't rely
 * on it so much, but I think supporting them as a read-only format won't harm anything.
 * Due to the fact that it isn't documented anywhere else, most applications don't support it.
 * 
 * All Windows headers at once (including mentioned BITMAPV2INFOHEADER and BITMAPV3INFOHEADER):
 * 
 * ![Bitmap headers overview](
 *   https://web.archive.org/web/20190527043845/https://forums.adobe.com/servlet/JiveServlet/showImage/2-3273299-47801/BMP_Headers.png
 * )
 * 
 * ## Specs
 *  * [Bitmap Storage (Windows Dev Center)](
 *      https://learn.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
 *    )
 *     * BITMAPFILEHEADER
 *     * BITMAPINFOHEADER
 *     * BITMAPV4HEADER
 *     * BITMAPV5HEADER
 *  * [OS/2 Bitmap File Format](
 *       https://www.fileformat.info/format/os2bmp/egff.htm
 *    )
 *     * BITMAPFILEHEADER (OS2BMPFILEHEADER)
 *     * BITMAPCOREHEADER (OS21XBITMAPHEADER)
 *     * OS22XBITMAPHEADER
 *  * [Microsoft Windows Bitmap](
 *       http://netghost.narod.ru/gff/graphics/summary/micbmp.htm
 *    )
 *     * BITMAPFILEHEADER (WINBMPFILEHEADER)
 *     * BITMAPCOREHEADER (WIN2XBITMAPHEADER)
 *     * BITMAPINFOHEADER (WINNTBITMAPHEADER)
 *     * BITMAPV4HEADER (WIN4XBITMAPHEADER)
 */

var Bmp = (function() {
  Bmp.Intent = Object.freeze({
    BUSINESS: 1,
    GRAPHICS: 2,
    IMAGES: 4,
    ABS_COLORIMETRIC: 8,

    1: "BUSINESS",
    2: "GRAPHICS",
    4: "IMAGES",
    8: "ABS_COLORIMETRIC",
  });

  Bmp.ColorSpace = Object.freeze({
    CALIBRATED_RGB: 0,
    PROFILE_LINKED: 1279872587,
    PROFILE_EMBEDDED: 1296188740,
    WINDOWS: 1466527264,
    S_RGB: 1934772034,

    0: "CALIBRATED_RGB",
    1279872587: "PROFILE_LINKED",
    1296188740: "PROFILE_EMBEDDED",
    1466527264: "WINDOWS",
    1934772034: "S_RGB",
  });

  Bmp.Os2Rendering = Object.freeze({
    NO_HALFTONING: 0,
    ERROR_DIFFUSION: 1,
    PANDA: 2,
    SUPER_CIRCLE: 3,

    0: "NO_HALFTONING",
    1: "ERROR_DIFFUSION",
    2: "PANDA",
    3: "SUPER_CIRCLE",
  });

  Bmp.HeaderType = Object.freeze({
    BITMAP_CORE_HEADER: 12,
    BITMAP_INFO_HEADER: 40,
    BITMAP_V2_INFO_HEADER: 52,
    BITMAP_V3_INFO_HEADER: 56,
    OS2_2X_BITMAP_HEADER: 64,
    BITMAP_V4_HEADER: 108,
    BITMAP_V5_HEADER: 124,

    12: "BITMAP_CORE_HEADER",
    40: "BITMAP_INFO_HEADER",
    52: "BITMAP_V2_INFO_HEADER",
    56: "BITMAP_V3_INFO_HEADER",
    64: "OS2_2X_BITMAP_HEADER",
    108: "BITMAP_V4_HEADER",
    124: "BITMAP_V5_HEADER",
  });

  Bmp.Compressions = Object.freeze({
    RGB: 0,
    RLE8: 1,
    RLE4: 2,
    BITFIELDS: 3,
    JPEG: 4,
    PNG: 5,
    ALPHA_BITFIELDS: 6,

    0: "RGB",
    1: "RLE8",
    2: "RLE4",
    3: "BITFIELDS",
    4: "JPEG",
    5: "PNG",
    6: "ALPHA_BITFIELDS",
  });

  Bmp.Os2Compressions = Object.freeze({
    RGB: 0,
    RLE8: 1,
    RLE4: 2,
    HUFFMAN_1D: 3,
    RLE24: 4,

    0: "RGB",
    1: "RLE8",
    2: "RLE4",
    3: "HUFFMAN_1D",
    4: "RLE24",
  });

  function Bmp(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Bmp.prototype._read = function() {
    this.fileHdr = new FileHeader(this._io, this, this._root);
    this._raw_dibInfo = this._io.readBytes((this.fileHdr.ofsBitmap - 14));
    var _io__raw_dibInfo = new KaitaiStream(this._raw_dibInfo);
    this.dibInfo = new BitmapInfo(_io__raw_dibInfo, this, this._root);
    this._raw_bitmap = this._io.readBytesFull();
    var _io__raw_bitmap = new KaitaiStream(this._raw_bitmap);
    this.bitmap = new Bitmap(_io__raw_bitmap, this, this._root);
  }

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-ciexyz|Source}
   */

  var CieXyz = Bmp.CieXyz = (function() {
    function CieXyz(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CieXyz.prototype._read = function() {
      this.x = new FixedPoint2Dot30(this._io, this, this._root);
      this.y = new FixedPoint2Dot30(this._io, this, this._root);
      this.z = new FixedPoint2Dot30(this._io, this, this._root);
    }

    return CieXyz;
  })();

  var RgbRecord = Bmp.RgbRecord = (function() {
    function RgbRecord(_io, _parent, _root, hasReservedField) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.hasReservedField = hasReservedField;

      this._read();
    }
    RgbRecord.prototype._read = function() {
      this.blue = this._io.readU1();
      this.green = this._io.readU1();
      this.red = this._io.readU1();
      if (this.hasReservedField) {
        this.reserved = this._io.readU1();
      }
    }

    return RgbRecord;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv5header|Source}
   */

  var BitmapV5Extension = Bmp.BitmapV5Extension = (function() {
    function BitmapV5Extension(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BitmapV5Extension.prototype._read = function() {
      this.intent = this._io.readU4le();
      this.ofsProfile = this._io.readU4le();
      this.lenProfile = this._io.readU4le();
      this.reserved = this._io.readU4le();
    }
    Object.defineProperty(BitmapV5Extension.prototype, 'hasProfile', {
      get: function() {
        if (this._m_hasProfile !== undefined)
          return this._m_hasProfile;
        this._m_hasProfile =  ((this._parent.bitmapV4Ext.colorSpaceType == Bmp.ColorSpace.PROFILE_LINKED) || (this._parent.bitmapV4Ext.colorSpaceType == Bmp.ColorSpace.PROFILE_EMBEDDED)) ;
        return this._m_hasProfile;
      }
    });

    /**
     * @see {@link https://learn.microsoft.com/en-us/windows/win32/wcs/using-structures-in-wcs-1-0|"If the profile is embedded, profile data is the actual profile, and if it is linked, the profile data is the null-terminated file name of the profile. This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252)."}
     */
    Object.defineProperty(BitmapV5Extension.prototype, 'profileData', {
      get: function() {
        if (this._m_profileData !== undefined)
          return this._m_profileData;
        if (this.hasProfile) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek((14 + this.ofsProfile));
          switch (this._parent.bitmapV4Ext.colorSpaceType == Bmp.ColorSpace.PROFILE_LINKED) {
          case true:
            this._m_profileData = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(io.readBytes(this.lenProfile), 0, false), "windows-1252");
            break;
          default:
            this._m_profileData = io.readBytes(this.lenProfile);
            break;
          }
          io.seek(_pos);
        }
        return this._m_profileData;
      }
    });

    /**
     * The offset, in bytes, from the beginning of the BITMAPV5HEADER structure to the start of the profile data.
     */

    return BitmapV5Extension;
  })();

  var ColorMask = Bmp.ColorMask = (function() {
    function ColorMask(_io, _parent, _root, hasAlphaMask) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.hasAlphaMask = hasAlphaMask;

      this._read();
    }
    ColorMask.prototype._read = function() {
      this.redMask = this._io.readU4le();
      this.greenMask = this._io.readU4le();
      this.blueMask = this._io.readU4le();
      if (this.hasAlphaMask) {
        this.alphaMask = this._io.readU4le();
      }
    }

    return ColorMask;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv4header|Source}
   */

  var BitmapV4Extension = Bmp.BitmapV4Extension = (function() {
    function BitmapV4Extension(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BitmapV4Extension.prototype._read = function() {
      this.colorSpaceType = this._io.readU4le();
      this.endpointRed = new CieXyz(this._io, this, this._root);
      this.endpointGreen = new CieXyz(this._io, this, this._root);
      this.endpointBlue = new CieXyz(this._io, this, this._root);
      this.gammaRed = new FixedPoint16Dot16(this._io, this, this._root);
      this.gammaBlue = new FixedPoint16Dot16(this._io, this, this._root);
      this.gammaGreen = new FixedPoint16Dot16(this._io, this, this._root);
    }

    return BitmapV4Extension;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/previous-versions/dd183376(v=vs.85)|Source}
   */

  var BitmapInfoExtension = Bmp.BitmapInfoExtension = (function() {
    function BitmapInfoExtension(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BitmapInfoExtension.prototype._read = function() {
      if (!(this._parent.extendsOs22xBitmap)) {
        this.compression = this._io.readU4le();
      }
      if (this._parent.extendsOs22xBitmap) {
        this.os2Compression = this._io.readU4le();
      }
      this.lenImage = this._io.readU4le();
      this.xResolution = this._io.readU4le();
      this.yResolution = this._io.readU4le();
      this.numColorsUsed = this._io.readU4le();
      this.numColorsImportant = this._io.readU4le();
    }

    /**
     * If biCompression is BI_JPEG or BI_PNG, indicates the size of the JPEG or PNG image buffer.
     * This may be set to zero for BI_RGB bitmaps.
     */

    return BitmapInfoExtension;
  })();

  var FixedPoint2Dot30 = Bmp.FixedPoint2Dot30 = (function() {
    function FixedPoint2Dot30(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FixedPoint2Dot30.prototype._read = function() {
      this.raw = this._io.readU4le();
    }
    Object.defineProperty(FixedPoint2Dot30.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = ((this.raw + 0.0) / (1 << 30));
        return this._m_value;
      }
    });

    return FixedPoint2Dot30;
  })();

  /**
   * Replace with an opaque type if you care about the pixels. You can look at
   * an example of a JavaScript implementation:
   * <https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js>
   * 
   * There is a proposal for adding bitmap data type to Kaitai Struct:
   * <https://github.com/kaitai-io/kaitai_struct/issues/188>
   */

  var Bitmap = Bmp.Bitmap = (function() {
    function Bitmap(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Bitmap.prototype._read = function() {
    }

    return Bitmap;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader|Source}
   * @see {@link https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.1|Source}
   */

  var BitmapHeader = Bmp.BitmapHeader = (function() {
    function BitmapHeader(_io, _parent, _root, lenHeader) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.lenHeader = lenHeader;

      this._read();
    }
    BitmapHeader.prototype._read = function() {
      switch (this.isCoreHeader) {
      case true:
        this.imageWidth = this._io.readU2le();
        break;
      case false:
        this.imageWidth = this._io.readU4le();
        break;
      }
      switch (this.isCoreHeader) {
      case true:
        this.imageHeightRaw = this._io.readS2le();
        break;
      case false:
        this.imageHeightRaw = this._io.readS4le();
        break;
      }
      this.numPlanes = this._io.readU2le();
      this.bitsPerPixel = this._io.readU2le();
      if (this.extendsBitmapInfo) {
        this.bitmapInfoExt = new BitmapInfoExtension(this._io, this, this._root);
      }
      if (this.isColorMaskHere) {
        this.colorMask = new ColorMask(this._io, this, this._root, this.lenHeader != Bmp.HeaderType.BITMAP_V2_INFO_HEADER);
      }
      if (this.extendsOs22xBitmap) {
        this.os22xBitmapExt = new Os22xBitmapExtension(this._io, this, this._root);
      }
      if (this.extendsBitmapV4) {
        this.bitmapV4Ext = new BitmapV4Extension(this._io, this, this._root);
      }
      if (this.extendsBitmapV5) {
        this.bitmapV5Ext = new BitmapV5Extension(this._io, this, this._root);
      }
    }
    Object.defineProperty(BitmapHeader.prototype, 'extendsBitmapV4', {
      get: function() {
        if (this._m_extendsBitmapV4 !== undefined)
          return this._m_extendsBitmapV4;
        this._m_extendsBitmapV4 = this.lenHeader >= Bmp.HeaderType.BITMAP_V4_HEADER;
        return this._m_extendsBitmapV4;
      }
    });
    Object.defineProperty(BitmapHeader.prototype, 'extendsOs22xBitmap', {
      get: function() {
        if (this._m_extendsOs22xBitmap !== undefined)
          return this._m_extendsOs22xBitmap;
        this._m_extendsOs22xBitmap = this.lenHeader == Bmp.HeaderType.OS2_2X_BITMAP_HEADER;
        return this._m_extendsOs22xBitmap;
      }
    });
    Object.defineProperty(BitmapHeader.prototype, 'usesFixedPalette', {
      get: function() {
        if (this._m_usesFixedPalette !== undefined)
          return this._m_usesFixedPalette;
        this._m_usesFixedPalette =  ((!( ((this.bitsPerPixel == 16) || (this.bitsPerPixel == 24) || (this.bitsPerPixel == 32)) )) && (!( ((this.extendsBitmapInfo) && (!(this.extendsOs22xBitmap)) && ( ((this.bitmapInfoExt.compression == Bmp.Compressions.JPEG) || (this.bitmapInfoExt.compression == Bmp.Compressions.PNG)) )) ))) ;
        return this._m_usesFixedPalette;
      }
    });
    Object.defineProperty(BitmapHeader.prototype, 'extendsBitmapInfo', {
      get: function() {
        if (this._m_extendsBitmapInfo !== undefined)
          return this._m_extendsBitmapInfo;
        this._m_extendsBitmapInfo = this.lenHeader >= Bmp.HeaderType.BITMAP_INFO_HEADER;
        return this._m_extendsBitmapInfo;
      }
    });
    Object.defineProperty(BitmapHeader.prototype, 'imageHeight', {
      get: function() {
        if (this._m_imageHeight !== undefined)
          return this._m_imageHeight;
        this._m_imageHeight = (this.imageHeightRaw < 0 ? -(this.imageHeightRaw) : this.imageHeightRaw);
        return this._m_imageHeight;
      }
    });
    Object.defineProperty(BitmapHeader.prototype, 'isCoreHeader', {
      get: function() {
        if (this._m_isCoreHeader !== undefined)
          return this._m_isCoreHeader;
        this._m_isCoreHeader = this.lenHeader == Bmp.HeaderType.BITMAP_CORE_HEADER;
        return this._m_isCoreHeader;
      }
    });
    Object.defineProperty(BitmapHeader.prototype, 'extendsBitmapV5', {
      get: function() {
        if (this._m_extendsBitmapV5 !== undefined)
          return this._m_extendsBitmapV5;
        this._m_extendsBitmapV5 = this.lenHeader >= Bmp.HeaderType.BITMAP_V5_HEADER;
        return this._m_extendsBitmapV5;
      }
    });
    Object.defineProperty(BitmapHeader.prototype, 'isColorMaskHere', {
      get: function() {
        if (this._m_isColorMaskHere !== undefined)
          return this._m_isColorMaskHere;
        this._m_isColorMaskHere =  ((this.lenHeader == Bmp.HeaderType.BITMAP_V2_INFO_HEADER) || (this.lenHeader == Bmp.HeaderType.BITMAP_V3_INFO_HEADER) || (this.extendsBitmapV4)) ;
        return this._m_isColorMaskHere;
      }
    });
    Object.defineProperty(BitmapHeader.prototype, 'bottomUp', {
      get: function() {
        if (this._m_bottomUp !== undefined)
          return this._m_bottomUp;
        this._m_bottomUp = this.imageHeightRaw > 0;
        return this._m_bottomUp;
      }
    });

    /**
     * Image width, px
     */

    /**
     * Image height, px (positive => bottom-up image, negative => top-down image)
     */

    /**
     * Number of planes for target device, must be 1
     */

    /**
     * Number of bits per pixel that image buffer uses (1, 4, 8, 16, 24 or 32)
     */

    return BitmapHeader;
  })();

  /**
   * @see {@link https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.2|Source}
   */

  var Os22xBitmapExtension = Bmp.Os22xBitmapExtension = (function() {
    function Os22xBitmapExtension(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Os22xBitmapExtension.prototype._read = function() {
      this.units = this._io.readU2le();
      this.reserved = this._io.readU2le();
      this.recording = this._io.readU2le();
      this.rendering = this._io.readU2le();
      this.size1 = this._io.readU4le();
      this.size2 = this._io.readU4le();
      this.colorEncoding = this._io.readU4le();
      this.identifier = this._io.readU4le();
    }

    /**
     * Specifies how the bitmap scan lines are stored.
     * The only valid value for this field is 0, indicating that the bitmap is
     * stored from left to right and from the bottom up.
     */

    /**
     * Specifies the halftoning algorithm used on the bitmap data.
     */

    /**
     * rendering == os2_rendering::error_diffusion
     *   => error damping as a percentage in the range 0 through 100
     * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
     *   => X dimension of the pattern used in pixels
     */

    /**
     * rendering == os2_rendering::error_diffusion
     *   => not used
     * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
     *   => Y dimension of the pattern used in pixels
     */

    /**
     * Specifies the color model used to describe the bitmap data.
     * The only valid value is 0, indicating the RGB encoding scheme.
     */

    /**
     * Application-specific value
     */

    return Os22xBitmapExtension;
  })();

  var FixedPoint16Dot16 = Bmp.FixedPoint16Dot16 = (function() {
    function FixedPoint16Dot16(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FixedPoint16Dot16.prototype._read = function() {
      this.raw = this._io.readU4le();
    }
    Object.defineProperty(FixedPoint16Dot16.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = ((this.raw + 0.0) / (1 << 16));
        return this._m_value;
      }
    });

    return FixedPoint16Dot16;
  })();

  var ColorTable = Bmp.ColorTable = (function() {
    function ColorTable(_io, _parent, _root, hasReservedField, numColors) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.hasReservedField = hasReservedField;
      this.numColors = numColors;

      this._read();
    }
    ColorTable.prototype._read = function() {
      this.colors = [];
      for (var i = 0; i < ( ((this.numColors > 0) && (this.numColors < this.numColorsPresent))  ? this.numColors : this.numColorsPresent); i++) {
        this.colors.push(new RgbRecord(this._io, this, this._root, this.hasReservedField));
      }
    }
    Object.defineProperty(ColorTable.prototype, 'numColorsPresent', {
      get: function() {
        if (this._m_numColorsPresent !== undefined)
          return this._m_numColorsPresent;
        this._m_numColorsPresent = Math.floor(this._io.size / (this.hasReservedField ? 4 : 3));
        return this._m_numColorsPresent;
      }
    });

    /**
     * If equal to 0, the pallete should contain as many colors as can fit into the pixel value
     * according to the `bits_per_pixel` field (if `bits_per_pixel` = 8, then the pixel can
     * represent 2 ** 8 = 256 values, so exactly 256 colors should be present). For more flexibility,
     * it reads as many colors as it can until EOS is reached (and the image data begin).
     */

    return ColorTable;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader|Source}
   */

  var FileHeader = Bmp.FileHeader = (function() {
    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.fileType = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.fileType, [66, 77]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([66, 77], this.fileType, this._io, "/types/file_header/seq/0");
      }
      this.lenFile = this._io.readU4le();
      this.reserved1 = this._io.readU2le();
      this.reserved2 = this._io.readU2le();
      this.ofsBitmap = this._io.readS4le();
    }

    /**
     * not reliable, mostly ignored by BMP decoders
     */

    /**
     * Offset to actual raw pixel data of the image
     */

    return FileHeader;
  })();

  /**
   * @see {@link https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfo|Source}
   */

  var BitmapInfo = Bmp.BitmapInfo = (function() {
    function BitmapInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BitmapInfo.prototype._read = function() {
      this.lenHeader = this._io.readU4le();
      this._raw_header = this._io.readBytes((this.lenHeader - 4));
      var _io__raw_header = new KaitaiStream(this._raw_header);
      this.header = new BitmapHeader(_io__raw_header, this, this._root, this.lenHeader);
      if (this.isColorMaskHere) {
        this.colorMask = new ColorMask(this._io, this, this._root, this.header.bitmapInfoExt.compression == Bmp.Compressions.ALPHA_BITFIELDS);
      }
      if (!(this._io.isEof())) {
        this._raw_colorTable = this._io.readBytesFull();
        var _io__raw_colorTable = new KaitaiStream(this._raw_colorTable);
        this.colorTable = new ColorTable(_io__raw_colorTable, this, this._root, !(this.header.isCoreHeader), (this.header.extendsBitmapInfo ? this.header.bitmapInfoExt.numColorsUsed : 0));
      }
    }
    Object.defineProperty(BitmapInfo.prototype, 'isColorMaskGiven', {
      get: function() {
        if (this._m_isColorMaskGiven !== undefined)
          return this._m_isColorMaskGiven;
        this._m_isColorMaskGiven =  ((this.header.extendsBitmapInfo) && ( ((this.header.bitmapInfoExt.compression == Bmp.Compressions.BITFIELDS) || (this.header.bitmapInfoExt.compression == Bmp.Compressions.ALPHA_BITFIELDS)) ) && ( ((this.isColorMaskHere) || (this.header.isColorMaskHere)) )) ;
        return this._m_isColorMaskGiven;
      }
    });
    Object.defineProperty(BitmapInfo.prototype, 'colorMaskGiven', {
      get: function() {
        if (this._m_colorMaskGiven !== undefined)
          return this._m_colorMaskGiven;
        if (this.isColorMaskGiven) {
          this._m_colorMaskGiven = (this.isColorMaskHere ? this.colorMask : this.header.colorMask);
        }
        return this._m_colorMaskGiven;
      }
    });
    Object.defineProperty(BitmapInfo.prototype, 'colorMaskBlue', {
      get: function() {
        if (this._m_colorMaskBlue !== undefined)
          return this._m_colorMaskBlue;
        this._m_colorMaskBlue = (this.isColorMaskGiven ? this.colorMaskGiven.blueMask : (this.header.bitsPerPixel == 16 ? 31 : ( ((this.header.bitsPerPixel == 24) || (this.header.bitsPerPixel == 32))  ? 255 : 0)));
        return this._m_colorMaskBlue;
      }
    });
    Object.defineProperty(BitmapInfo.prototype, 'colorMaskAlpha', {
      get: function() {
        if (this._m_colorMaskAlpha !== undefined)
          return this._m_colorMaskAlpha;
        this._m_colorMaskAlpha = ( ((this.isColorMaskGiven) && (this.colorMaskGiven.hasAlphaMask))  ? this.colorMaskGiven.alphaMask : 0);
        return this._m_colorMaskAlpha;
      }
    });
    Object.defineProperty(BitmapInfo.prototype, 'colorMaskGreen', {
      get: function() {
        if (this._m_colorMaskGreen !== undefined)
          return this._m_colorMaskGreen;
        this._m_colorMaskGreen = (this.isColorMaskGiven ? this.colorMaskGiven.greenMask : (this.header.bitsPerPixel == 16 ? 992 : ( ((this.header.bitsPerPixel == 24) || (this.header.bitsPerPixel == 32))  ? 65280 : 0)));
        return this._m_colorMaskGreen;
      }
    });
    Object.defineProperty(BitmapInfo.prototype, 'isColorMaskHere', {
      get: function() {
        if (this._m_isColorMaskHere !== undefined)
          return this._m_isColorMaskHere;
        this._m_isColorMaskHere =  ((!(this._io.isEof())) && (this.header.lenHeader == Bmp.HeaderType.BITMAP_INFO_HEADER) && ( ((this.header.bitmapInfoExt.compression == Bmp.Compressions.BITFIELDS) || (this.header.bitmapInfoExt.compression == Bmp.Compressions.ALPHA_BITFIELDS)) )) ;
        return this._m_isColorMaskHere;
      }
    });
    Object.defineProperty(BitmapInfo.prototype, 'colorMaskRed', {
      get: function() {
        if (this._m_colorMaskRed !== undefined)
          return this._m_colorMaskRed;
        this._m_colorMaskRed = (this.isColorMaskGiven ? this.colorMaskGiven.redMask : (this.header.bitsPerPixel == 16 ? 31744 : ( ((this.header.bitsPerPixel == 24) || (this.header.bitsPerPixel == 32))  ? 16711680 : 0)));
        return this._m_colorMaskRed;
      }
    });

    /**
     * Valid only for BITMAPINFOHEADER, in all headers extending it the masks are contained in the header itself.
     */

    return BitmapInfo;
  })();

  return Bmp;
})();
return Bmp;
}));
