# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Bmp(ReadWriteKaitaiStruct):
    """The **BMP file format**, also known as **bitmap image file** or **device independent
    bitmap (DIB) file format** or simply a **bitmap**, is a raster graphics image file
    format used to store bitmap digital images, independently of the display
    device (such as a graphics adapter), especially on Microsoft Windows
    and OS/2 operating systems.
    
    ## Samples
    
    Great collection of various BMP sample files:
    [**BMP Suite Image List**](
      http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html
    ) (by Jason Summers)
    
    If only there was such a comprehensive sample suite for every file format! It's like
    a dream for every developer of any binary file format parser. It contains a lot of
    different types and variations of BMP files, even the tricky ones, where it's not clear
    from the specification how to deal with them (marked there as "**q**uestionable").
    
    If you make a program which will be able to read all the "**g**ood" and "**q**uestionable"
    BMP files and won't crash on the "**b**ad" ones, it will definitely have one of the most
    extensive support of BMP files in the universe!
    
    ## BITMAPV2INFOHEADER and BITMAPV3INFOHEADER
    
    A beneficial discussion on Adobe forum (archived):
    [**Invalid BMP Format with Alpha channel**](
      https://web.archive.org/web/20150127132443/https://forums.adobe.com/message/3272950
    )
    
    In 2010, someone noticed that Photoshop generated BMP with an odd type of header. There wasn't
    any documentation available for this header at the time (and still isn't).
    However, Chris Cox (former Adobe employee) claimed that they hadn't invented any type
    of proprietary header and everything they were writing was taken directly
    from the Microsoft documentation.
    
    It showed up that the unknown header was called BITMAPV3INFOHEADER.
    Although Microsoft has apparently requested and verified the use of the header,
    the documentation on MSDN has probably got lost and they have probably
    forgotten about this type of header.
    
    This is the only source I could find about these structures, so we could't rely
    on it so much, but I think supporting them as a read-only format won't harm anything.
    Due to the fact that it isn't documented anywhere else, most applications don't support it.
    
    All Windows headers at once (including mentioned BITMAPV2INFOHEADER and BITMAPV3INFOHEADER):
    
    ![Bitmap headers overview](
      https://web.archive.org/web/20190527043845/https://forums.adobe.com/servlet/JiveServlet/showImage/2-3273299-47801/BMP_Headers.png
    )
    
    ## Specs
     * [Bitmap Storage (Windows Dev Center)](
         https://learn.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
       )
        * BITMAPFILEHEADER
        * BITMAPINFOHEADER
        * BITMAPV4HEADER
        * BITMAPV5HEADER
     * [OS/2 Bitmap File Format](
          https://www.fileformat.info/format/os2bmp/egff.htm
       )
        * BITMAPFILEHEADER (OS2BMPFILEHEADER)
        * BITMAPCOREHEADER (OS21XBITMAPHEADER)
        * OS22XBITMAPHEADER
     * [Microsoft Windows Bitmap](
          http://netghost.narod.ru/gff/graphics/summary/micbmp.htm
       )
        * BITMAPFILEHEADER (WINBMPFILEHEADER)
        * BITMAPCOREHEADER (WIN2XBITMAPHEADER)
        * BITMAPINFOHEADER (WINNTBITMAPHEADER)
        * BITMAPV4HEADER (WIN4XBITMAPHEADER)
    """

    class ColorSpace(IntEnum):
        calibrated_rgb = 0
        profile_linked = 1279872587
        profile_embedded = 1296188740
        windows = 1466527264
        s_rgb = 1934772034

    class Compressions(IntEnum):
        rgb = 0
        rle8 = 1
        rle4 = 2
        bitfields = 3
        jpeg = 4
        png = 5
        alpha_bitfields = 6

    class HeaderType(IntEnum):
        bitmap_core_header = 12
        bitmap_info_header = 40
        bitmap_v2_info_header = 52
        bitmap_v3_info_header = 56
        os2_2x_bitmap_header = 64
        bitmap_v4_header = 108
        bitmap_v5_header = 124

    class Intent(IntEnum):
        business = 1
        graphics = 2
        images = 4
        abs_colorimetric = 8

    class Os2Compressions(IntEnum):
        rgb = 0
        rle8 = 1
        rle4 = 2
        huffman_1d = 3
        rle24 = 4

    class Os2Rendering(IntEnum):
        no_halftoning = 0
        error_diffusion = 1
        panda = 2
        super_circle = 3
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Bmp, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.file_hdr = Bmp.FileHeader(self._io, self, self._root)
        self.file_hdr._read()
        self._raw_dib_info = self._io.read_bytes(self.file_hdr.ofs_bitmap - 14)
        _io__raw_dib_info = KaitaiStream(BytesIO(self._raw_dib_info))
        self.dib_info = Bmp.BitmapInfo(_io__raw_dib_info, self, self._root)
        self.dib_info._read()
        self._raw_bitmap = self._io.read_bytes_full()
        _io__raw_bitmap = KaitaiStream(BytesIO(self._raw_bitmap))
        self.bitmap = Bmp.Bitmap(_io__raw_bitmap, self, self._root)
        self.bitmap._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.file_hdr._fetch_instances()
        self.dib_info._fetch_instances()
        self.bitmap._fetch_instances()


    def _write__seq(self, io=None):
        super(Bmp, self)._write__seq(io)
        self.file_hdr._write__seq(self._io)
        _io__raw_dib_info = KaitaiStream(BytesIO(bytearray(self.file_hdr.ofs_bitmap - 14)))
        self._io.add_child_stream(_io__raw_dib_info)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.file_hdr.ofs_bitmap - 14))
        def handler(parent, _io__raw_dib_info=_io__raw_dib_info):
            self._raw_dib_info = _io__raw_dib_info.to_byte_array()
            if len(self._raw_dib_info) != self.file_hdr.ofs_bitmap - 14:
                raise kaitaistruct.ConsistencyError(u"raw(dib_info)", self.file_hdr.ofs_bitmap - 14, len(self._raw_dib_info))
            parent.write_bytes(self._raw_dib_info)
        _io__raw_dib_info.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.dib_info._write__seq(_io__raw_dib_info)
        _io__raw_bitmap = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
        self._io.add_child_stream(_io__raw_bitmap)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
        def handler(parent, _io__raw_bitmap=_io__raw_bitmap):
            self._raw_bitmap = _io__raw_bitmap.to_byte_array()
            parent.write_bytes(self._raw_bitmap)
            if not parent.is_eof():
                raise kaitaistruct.ConsistencyError(u"raw(bitmap)", 0, parent.size() - parent.pos())
        _io__raw_bitmap.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.bitmap._write__seq(_io__raw_bitmap)


    def _check(self):
        if self.file_hdr._root != self._root:
            raise kaitaistruct.ConsistencyError(u"file_hdr", self._root, self.file_hdr._root)
        if self.file_hdr._parent != self:
            raise kaitaistruct.ConsistencyError(u"file_hdr", self, self.file_hdr._parent)
        if self.dib_info._root != self._root:
            raise kaitaistruct.ConsistencyError(u"dib_info", self._root, self.dib_info._root)
        if self.dib_info._parent != self:
            raise kaitaistruct.ConsistencyError(u"dib_info", self, self.dib_info._parent)
        if self.bitmap._root != self._root:
            raise kaitaistruct.ConsistencyError(u"bitmap", self._root, self.bitmap._root)
        if self.bitmap._parent != self:
            raise kaitaistruct.ConsistencyError(u"bitmap", self, self.bitmap._parent)
        self._dirty = False

    class Bitmap(ReadWriteKaitaiStruct):
        """Replace with an opaque type if you care about the pixels. You can look at
        an example of a JavaScript implementation:
        <https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js>
        
        There is a proposal for adding bitmap data type to Kaitai Struct:
        <https://github.com/kaitai-io/kaitai_struct/issues/188>
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.Bitmap, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bmp.Bitmap, self)._write__seq(io)


        def _check(self):
            self._dirty = False


    class BitmapHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader
        
        
        .. seealso::
           Source - https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.1
        """
        def __init__(self, len_header, _io=None, _parent=None, _root=None):
            super(Bmp.BitmapHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.len_header = len_header

        def _read(self):
            _on = self.is_core_header
            if _on == False:
                pass
                self.image_width = self._io.read_u4le()
            elif _on == True:
                pass
                self.image_width = self._io.read_u2le()
            _on = self.is_core_header
            if _on == False:
                pass
                self.image_height_raw = self._io.read_s4le()
            elif _on == True:
                pass
                self.image_height_raw = self._io.read_s2le()
            self.num_planes = self._io.read_u2le()
            self.bits_per_pixel = self._io.read_u2le()
            if self.extends_bitmap_info:
                pass
                self.bitmap_info_ext = Bmp.BitmapInfoExtension(self._io, self, self._root)
                self.bitmap_info_ext._read()

            if self.is_color_mask_here:
                pass
                self.color_mask = Bmp.ColorMask(self.len_header != int(Bmp.HeaderType.bitmap_v2_info_header), self._io, self, self._root)
                self.color_mask._read()

            if self.extends_os2_2x_bitmap:
                pass
                self.os2_2x_bitmap_ext = Bmp.Os22xBitmapExtension(self._io, self, self._root)
                self.os2_2x_bitmap_ext._read()

            if self.extends_bitmap_v4:
                pass
                self.bitmap_v4_ext = Bmp.BitmapV4Extension(self._io, self, self._root)
                self.bitmap_v4_ext._read()

            if self.extends_bitmap_v5:
                pass
                self.bitmap_v5_ext = Bmp.BitmapV5Extension(self._io, self, self._root)
                self.bitmap_v5_ext._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.is_core_header
            if _on == False:
                pass
            elif _on == True:
                pass
            _on = self.is_core_header
            if _on == False:
                pass
            elif _on == True:
                pass
            if self.extends_bitmap_info:
                pass
                self.bitmap_info_ext._fetch_instances()

            if self.is_color_mask_here:
                pass
                self.color_mask._fetch_instances()

            if self.extends_os2_2x_bitmap:
                pass
                self.os2_2x_bitmap_ext._fetch_instances()

            if self.extends_bitmap_v4:
                pass
                self.bitmap_v4_ext._fetch_instances()

            if self.extends_bitmap_v5:
                pass
                self.bitmap_v5_ext._fetch_instances()



        def _write__seq(self, io=None):
            super(Bmp.BitmapHeader, self)._write__seq(io)
            _on = self.is_core_header
            if _on == False:
                pass
                self._io.write_u4le(self.image_width)
            elif _on == True:
                pass
                self._io.write_u2le(self.image_width)
            _on = self.is_core_header
            if _on == False:
                pass
                self._io.write_s4le(self.image_height_raw)
            elif _on == True:
                pass
                self._io.write_s2le(self.image_height_raw)
            self._io.write_u2le(self.num_planes)
            self._io.write_u2le(self.bits_per_pixel)
            if self.extends_bitmap_info:
                pass
                self.bitmap_info_ext._write__seq(self._io)

            if self.is_color_mask_here:
                pass
                self.color_mask._write__seq(self._io)

            if self.extends_os2_2x_bitmap:
                pass
                self.os2_2x_bitmap_ext._write__seq(self._io)

            if self.extends_bitmap_v4:
                pass
                self.bitmap_v4_ext._write__seq(self._io)

            if self.extends_bitmap_v5:
                pass
                self.bitmap_v5_ext._write__seq(self._io)



        def _check(self):
            _on = self.is_core_header
            if _on == False:
                pass
            elif _on == True:
                pass
            _on = self.is_core_header
            if _on == False:
                pass
            elif _on == True:
                pass
            if self.extends_bitmap_info:
                pass
                if self.bitmap_info_ext._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bitmap_info_ext", self._root, self.bitmap_info_ext._root)
                if self.bitmap_info_ext._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bitmap_info_ext", self, self.bitmap_info_ext._parent)

            if self.is_color_mask_here:
                pass
                if self.color_mask._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"color_mask", self._root, self.color_mask._root)
                if self.color_mask._parent != self:
                    raise kaitaistruct.ConsistencyError(u"color_mask", self, self.color_mask._parent)
                if self.color_mask.has_alpha_mask != (self.len_header != int(Bmp.HeaderType.bitmap_v2_info_header)):
                    raise kaitaistruct.ConsistencyError(u"color_mask", self.len_header != int(Bmp.HeaderType.bitmap_v2_info_header), self.color_mask.has_alpha_mask)

            if self.extends_os2_2x_bitmap:
                pass
                if self.os2_2x_bitmap_ext._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"os2_2x_bitmap_ext", self._root, self.os2_2x_bitmap_ext._root)
                if self.os2_2x_bitmap_ext._parent != self:
                    raise kaitaistruct.ConsistencyError(u"os2_2x_bitmap_ext", self, self.os2_2x_bitmap_ext._parent)

            if self.extends_bitmap_v4:
                pass
                if self.bitmap_v4_ext._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bitmap_v4_ext", self._root, self.bitmap_v4_ext._root)
                if self.bitmap_v4_ext._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bitmap_v4_ext", self, self.bitmap_v4_ext._parent)

            if self.extends_bitmap_v5:
                pass
                if self.bitmap_v5_ext._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bitmap_v5_ext", self._root, self.bitmap_v5_ext._root)
                if self.bitmap_v5_ext._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bitmap_v5_ext", self, self.bitmap_v5_ext._parent)

            self._dirty = False

        @property
        def bottom_up(self):
            if hasattr(self, '_m_bottom_up'):
                return self._m_bottom_up

            self._m_bottom_up = self.image_height_raw > 0
            return getattr(self, '_m_bottom_up', None)

        def _invalidate_bottom_up(self):
            del self._m_bottom_up
        @property
        def extends_bitmap_info(self):
            if hasattr(self, '_m_extends_bitmap_info'):
                return self._m_extends_bitmap_info

            self._m_extends_bitmap_info = self.len_header >= int(Bmp.HeaderType.bitmap_info_header)
            return getattr(self, '_m_extends_bitmap_info', None)

        def _invalidate_extends_bitmap_info(self):
            del self._m_extends_bitmap_info
        @property
        def extends_bitmap_v4(self):
            if hasattr(self, '_m_extends_bitmap_v4'):
                return self._m_extends_bitmap_v4

            self._m_extends_bitmap_v4 = self.len_header >= int(Bmp.HeaderType.bitmap_v4_header)
            return getattr(self, '_m_extends_bitmap_v4', None)

        def _invalidate_extends_bitmap_v4(self):
            del self._m_extends_bitmap_v4
        @property
        def extends_bitmap_v5(self):
            if hasattr(self, '_m_extends_bitmap_v5'):
                return self._m_extends_bitmap_v5

            self._m_extends_bitmap_v5 = self.len_header >= int(Bmp.HeaderType.bitmap_v5_header)
            return getattr(self, '_m_extends_bitmap_v5', None)

        def _invalidate_extends_bitmap_v5(self):
            del self._m_extends_bitmap_v5
        @property
        def extends_os2_2x_bitmap(self):
            if hasattr(self, '_m_extends_os2_2x_bitmap'):
                return self._m_extends_os2_2x_bitmap

            self._m_extends_os2_2x_bitmap = self.len_header == int(Bmp.HeaderType.os2_2x_bitmap_header)
            return getattr(self, '_m_extends_os2_2x_bitmap', None)

        def _invalidate_extends_os2_2x_bitmap(self):
            del self._m_extends_os2_2x_bitmap
        @property
        def image_height(self):
            if hasattr(self, '_m_image_height'):
                return self._m_image_height

            self._m_image_height = (-(self.image_height_raw) if self.image_height_raw < 0 else self.image_height_raw)
            return getattr(self, '_m_image_height', None)

        def _invalidate_image_height(self):
            del self._m_image_height
        @property
        def is_color_mask_here(self):
            if hasattr(self, '_m_is_color_mask_here'):
                return self._m_is_color_mask_here

            self._m_is_color_mask_here =  ((self.len_header == int(Bmp.HeaderType.bitmap_v2_info_header)) or (self.len_header == int(Bmp.HeaderType.bitmap_v3_info_header)) or (self.extends_bitmap_v4)) 
            return getattr(self, '_m_is_color_mask_here', None)

        def _invalidate_is_color_mask_here(self):
            del self._m_is_color_mask_here
        @property
        def is_core_header(self):
            if hasattr(self, '_m_is_core_header'):
                return self._m_is_core_header

            self._m_is_core_header = self.len_header == int(Bmp.HeaderType.bitmap_core_header)
            return getattr(self, '_m_is_core_header', None)

        def _invalidate_is_core_header(self):
            del self._m_is_core_header
        @property
        def uses_fixed_palette(self):
            if hasattr(self, '_m_uses_fixed_palette'):
                return self._m_uses_fixed_palette

            self._m_uses_fixed_palette =  (((not ( ((self.bits_per_pixel == 16) or (self.bits_per_pixel == 24) or (self.bits_per_pixel == 32)) ))) and ((not ( ((self.extends_bitmap_info) and ((not (self.extends_os2_2x_bitmap))) and ( ((self.bitmap_info_ext.compression == Bmp.Compressions.jpeg) or (self.bitmap_info_ext.compression == Bmp.Compressions.png)) )) )))) 
            return getattr(self, '_m_uses_fixed_palette', None)

        def _invalidate_uses_fixed_palette(self):
            del self._m_uses_fixed_palette

    class BitmapInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfo
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.BitmapInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_header = self._io.read_u4le()
            self._raw_header = self._io.read_bytes(self.len_header - 4)
            _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
            self.header = Bmp.BitmapHeader(self.len_header, _io__raw_header, self, self._root)
            self.header._read()
            if self.is_color_mask_here:
                pass
                self.color_mask = Bmp.ColorMask(self.header.bitmap_info_ext.compression == Bmp.Compressions.alpha_bitfields, self._io, self, self._root)
                self.color_mask._read()

            if (not (self._io.is_eof())):
                pass
                self._raw_color_table = self._io.read_bytes_full()
                _io__raw_color_table = KaitaiStream(BytesIO(self._raw_color_table))
                self.color_table = Bmp.ColorTable((not (self.header.is_core_header)), (self.header.bitmap_info_ext.num_colors_used if self.header.extends_bitmap_info else 0), _io__raw_color_table, self, self._root)
                self.color_table._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            if self.is_color_mask_here:
                pass
                self.color_mask._fetch_instances()

            if (not (self._io.is_eof())):
                pass
                self.color_table._fetch_instances()



        def _write__seq(self, io=None):
            super(Bmp.BitmapInfo, self)._write__seq(io)
            self._io.write_u4le(self.len_header)
            _io__raw_header = KaitaiStream(BytesIO(bytearray(self.len_header - 4)))
            self._io.add_child_stream(_io__raw_header)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_header - 4))
            def handler(parent, _io__raw_header=_io__raw_header):
                self._raw_header = _io__raw_header.to_byte_array()
                if len(self._raw_header) != self.len_header - 4:
                    raise kaitaistruct.ConsistencyError(u"raw(header)", self.len_header - 4, len(self._raw_header))
                parent.write_bytes(self._raw_header)
            _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.header._write__seq(_io__raw_header)
            if self.is_color_mask_here:
                pass
                if self.color_mask._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"color_mask", self._root, self.color_mask._root)
                if self.color_mask._parent != self:
                    raise kaitaistruct.ConsistencyError(u"color_mask", self, self.color_mask._parent)
                if self.color_mask.has_alpha_mask != (self.header.bitmap_info_ext.compression == Bmp.Compressions.alpha_bitfields):
                    raise kaitaistruct.ConsistencyError(u"color_mask", self.header.bitmap_info_ext.compression == Bmp.Compressions.alpha_bitfields, self.color_mask.has_alpha_mask)
                self.color_mask._write__seq(self._io)

            if (not (self._io.is_eof())):
                pass
                if self.color_table._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"color_table", self._root, self.color_table._root)
                if self.color_table._parent != self:
                    raise kaitaistruct.ConsistencyError(u"color_table", self, self.color_table._parent)
                if self.color_table.has_reserved_field != (not (self.header.is_core_header)):
                    raise kaitaistruct.ConsistencyError(u"color_table", (not (self.header.is_core_header)), self.color_table.has_reserved_field)
                if self.color_table.num_colors != (self.header.bitmap_info_ext.num_colors_used if self.header.extends_bitmap_info else 0):
                    raise kaitaistruct.ConsistencyError(u"color_table", (self.header.bitmap_info_ext.num_colors_used if self.header.extends_bitmap_info else 0), self.color_table.num_colors)
                _io__raw_color_table = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
                self._io.add_child_stream(_io__raw_color_table)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
                def handler(parent, _io__raw_color_table=_io__raw_color_table):
                    self._raw_color_table = _io__raw_color_table.to_byte_array()
                    parent.write_bytes(self._raw_color_table)
                    if not parent.is_eof():
                        raise kaitaistruct.ConsistencyError(u"raw(color_table)", 0, parent.size() - parent.pos())
                _io__raw_color_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.color_table._write__seq(_io__raw_color_table)



        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            if self.header.len_header != self.len_header:
                raise kaitaistruct.ConsistencyError(u"header", self.len_header, self.header.len_header)
            self._dirty = False

        @property
        def color_mask_alpha(self):
            if hasattr(self, '_m_color_mask_alpha'):
                return self._m_color_mask_alpha

            self._m_color_mask_alpha = (self.color_mask_given.alpha_mask if  ((self.is_color_mask_given) and (self.color_mask_given.has_alpha_mask))  else 0)
            return getattr(self, '_m_color_mask_alpha', None)

        def _invalidate_color_mask_alpha(self):
            del self._m_color_mask_alpha
        @property
        def color_mask_blue(self):
            if hasattr(self, '_m_color_mask_blue'):
                return self._m_color_mask_blue

            self._m_color_mask_blue = (self.color_mask_given.blue_mask if self.is_color_mask_given else (31 if self.header.bits_per_pixel == 16 else (255 if  ((self.header.bits_per_pixel == 24) or (self.header.bits_per_pixel == 32))  else 0)))
            return getattr(self, '_m_color_mask_blue', None)

        def _invalidate_color_mask_blue(self):
            del self._m_color_mask_blue
        @property
        def color_mask_given(self):
            if hasattr(self, '_m_color_mask_given'):
                return self._m_color_mask_given

            if self.is_color_mask_given:
                pass
                self._m_color_mask_given = (self.color_mask if self.is_color_mask_here else self.header.color_mask)

            return getattr(self, '_m_color_mask_given', None)

        def _invalidate_color_mask_given(self):
            del self._m_color_mask_given
        @property
        def color_mask_green(self):
            if hasattr(self, '_m_color_mask_green'):
                return self._m_color_mask_green

            self._m_color_mask_green = (self.color_mask_given.green_mask if self.is_color_mask_given else (992 if self.header.bits_per_pixel == 16 else (65280 if  ((self.header.bits_per_pixel == 24) or (self.header.bits_per_pixel == 32))  else 0)))
            return getattr(self, '_m_color_mask_green', None)

        def _invalidate_color_mask_green(self):
            del self._m_color_mask_green
        @property
        def color_mask_red(self):
            if hasattr(self, '_m_color_mask_red'):
                return self._m_color_mask_red

            self._m_color_mask_red = (self.color_mask_given.red_mask if self.is_color_mask_given else (31744 if self.header.bits_per_pixel == 16 else (16711680 if  ((self.header.bits_per_pixel == 24) or (self.header.bits_per_pixel == 32))  else 0)))
            return getattr(self, '_m_color_mask_red', None)

        def _invalidate_color_mask_red(self):
            del self._m_color_mask_red
        @property
        def is_color_mask_given(self):
            if hasattr(self, '_m_is_color_mask_given'):
                return self._m_is_color_mask_given

            self._m_is_color_mask_given =  ((self.header.extends_bitmap_info) and ( ((self.header.bitmap_info_ext.compression == Bmp.Compressions.bitfields) or (self.header.bitmap_info_ext.compression == Bmp.Compressions.alpha_bitfields)) ) and ( ((self.is_color_mask_here) or (self.header.is_color_mask_here)) )) 
            return getattr(self, '_m_is_color_mask_given', None)

        def _invalidate_is_color_mask_given(self):
            del self._m_is_color_mask_given
        @property
        def is_color_mask_here(self):
            if hasattr(self, '_m_is_color_mask_here'):
                return self._m_is_color_mask_here

            self._m_is_color_mask_here =  (((not (self._io.is_eof()))) and (self.header.len_header == int(Bmp.HeaderType.bitmap_info_header)) and ( ((self.header.bitmap_info_ext.compression == Bmp.Compressions.bitfields) or (self.header.bitmap_info_ext.compression == Bmp.Compressions.alpha_bitfields)) )) 
            return getattr(self, '_m_is_color_mask_here', None)

        def _invalidate_is_color_mask_here(self):
            del self._m_is_color_mask_here

    class BitmapInfoExtension(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/previous-versions/dd183376(v=vs.85)
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.BitmapInfoExtension, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            if (not (self._parent.extends_os2_2x_bitmap)):
                pass
                self.compression = KaitaiStream.resolve_enum(Bmp.Compressions, self._io.read_u4le())

            if self._parent.extends_os2_2x_bitmap:
                pass
                self.os2_compression = KaitaiStream.resolve_enum(Bmp.Os2Compressions, self._io.read_u4le())

            self.len_image = self._io.read_u4le()
            self.x_resolution = self._io.read_u4le()
            self.y_resolution = self._io.read_u4le()
            self.num_colors_used = self._io.read_u4le()
            self.num_colors_important = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            if (not (self._parent.extends_os2_2x_bitmap)):
                pass

            if self._parent.extends_os2_2x_bitmap:
                pass



        def _write__seq(self, io=None):
            super(Bmp.BitmapInfoExtension, self)._write__seq(io)
            if (not (self._parent.extends_os2_2x_bitmap)):
                pass
                self._io.write_u4le(int(self.compression))

            if self._parent.extends_os2_2x_bitmap:
                pass
                self._io.write_u4le(int(self.os2_compression))

            self._io.write_u4le(self.len_image)
            self._io.write_u4le(self.x_resolution)
            self._io.write_u4le(self.y_resolution)
            self._io.write_u4le(self.num_colors_used)
            self._io.write_u4le(self.num_colors_important)


        def _check(self):
            if (not (self._parent.extends_os2_2x_bitmap)):
                pass

            if self._parent.extends_os2_2x_bitmap:
                pass

            self._dirty = False


    class BitmapV4Extension(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv4header
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.BitmapV4Extension, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.color_space_type = KaitaiStream.resolve_enum(Bmp.ColorSpace, self._io.read_u4le())
            self.endpoint_red = Bmp.CieXyz(self._io, self, self._root)
            self.endpoint_red._read()
            self.endpoint_green = Bmp.CieXyz(self._io, self, self._root)
            self.endpoint_green._read()
            self.endpoint_blue = Bmp.CieXyz(self._io, self, self._root)
            self.endpoint_blue._read()
            self.gamma_red = Bmp.FixedPoint16Dot16(self._io, self, self._root)
            self.gamma_red._read()
            self.gamma_blue = Bmp.FixedPoint16Dot16(self._io, self, self._root)
            self.gamma_blue._read()
            self.gamma_green = Bmp.FixedPoint16Dot16(self._io, self, self._root)
            self.gamma_green._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.endpoint_red._fetch_instances()
            self.endpoint_green._fetch_instances()
            self.endpoint_blue._fetch_instances()
            self.gamma_red._fetch_instances()
            self.gamma_blue._fetch_instances()
            self.gamma_green._fetch_instances()


        def _write__seq(self, io=None):
            super(Bmp.BitmapV4Extension, self)._write__seq(io)
            self._io.write_u4le(int(self.color_space_type))
            self.endpoint_red._write__seq(self._io)
            self.endpoint_green._write__seq(self._io)
            self.endpoint_blue._write__seq(self._io)
            self.gamma_red._write__seq(self._io)
            self.gamma_blue._write__seq(self._io)
            self.gamma_green._write__seq(self._io)


        def _check(self):
            if self.endpoint_red._root != self._root:
                raise kaitaistruct.ConsistencyError(u"endpoint_red", self._root, self.endpoint_red._root)
            if self.endpoint_red._parent != self:
                raise kaitaistruct.ConsistencyError(u"endpoint_red", self, self.endpoint_red._parent)
            if self.endpoint_green._root != self._root:
                raise kaitaistruct.ConsistencyError(u"endpoint_green", self._root, self.endpoint_green._root)
            if self.endpoint_green._parent != self:
                raise kaitaistruct.ConsistencyError(u"endpoint_green", self, self.endpoint_green._parent)
            if self.endpoint_blue._root != self._root:
                raise kaitaistruct.ConsistencyError(u"endpoint_blue", self._root, self.endpoint_blue._root)
            if self.endpoint_blue._parent != self:
                raise kaitaistruct.ConsistencyError(u"endpoint_blue", self, self.endpoint_blue._parent)
            if self.gamma_red._root != self._root:
                raise kaitaistruct.ConsistencyError(u"gamma_red", self._root, self.gamma_red._root)
            if self.gamma_red._parent != self:
                raise kaitaistruct.ConsistencyError(u"gamma_red", self, self.gamma_red._parent)
            if self.gamma_blue._root != self._root:
                raise kaitaistruct.ConsistencyError(u"gamma_blue", self._root, self.gamma_blue._root)
            if self.gamma_blue._parent != self:
                raise kaitaistruct.ConsistencyError(u"gamma_blue", self, self.gamma_blue._parent)
            if self.gamma_green._root != self._root:
                raise kaitaistruct.ConsistencyError(u"gamma_green", self._root, self.gamma_green._root)
            if self.gamma_green._parent != self:
                raise kaitaistruct.ConsistencyError(u"gamma_green", self, self.gamma_green._parent)
            self._dirty = False


    class BitmapV5Extension(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv5header
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.BitmapV5Extension, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_profile_data = False
            self.profile_data__enabled = True

        def _read(self):
            self.intent = KaitaiStream.resolve_enum(Bmp.Intent, self._io.read_u4le())
            self.ofs_profile = self._io.read_u4le()
            self.len_profile = self._io.read_u4le()
            self.reserved = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.profile_data
            if hasattr(self, '_m_profile_data'):
                pass
                _on = self._parent.bitmap_v4_ext.color_space_type == Bmp.ColorSpace.profile_linked
                if _on == True:
                    pass
                else:
                    pass



        def _write__seq(self, io=None):
            super(Bmp.BitmapV5Extension, self)._write__seq(io)
            self._should_write_profile_data = self.profile_data__enabled
            self._io.write_u4le(int(self.intent))
            self._io.write_u4le(self.ofs_profile)
            self._io.write_u4le(self.len_profile)
            self._io.write_u4le(self.reserved)


        def _check(self):
            if self.profile_data__enabled:
                pass
                if self.has_profile:
                    pass
                    _on = self._parent.bitmap_v4_ext.color_space_type == Bmp.ColorSpace.profile_linked
                    if _on == True:
                        pass
                        if len((self._m_profile_data).encode(u"windows-1252")) > self.len_profile:
                            raise kaitaistruct.ConsistencyError(u"profile_data", self.len_profile, len((self._m_profile_data).encode(u"windows-1252")))
                        if KaitaiStream.byte_array_index_of((self._m_profile_data).encode(u"windows-1252"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"profile_data", -1, KaitaiStream.byte_array_index_of((self._m_profile_data).encode(u"windows-1252"), 0))
                    else:
                        pass
                        if len(self._m_profile_data) != self.len_profile:
                            raise kaitaistruct.ConsistencyError(u"profile_data", self.len_profile, len(self._m_profile_data))


            self._dirty = False

        @property
        def has_profile(self):
            if hasattr(self, '_m_has_profile'):
                return self._m_has_profile

            self._m_has_profile =  ((self._parent.bitmap_v4_ext.color_space_type == Bmp.ColorSpace.profile_linked) or (self._parent.bitmap_v4_ext.color_space_type == Bmp.ColorSpace.profile_embedded)) 
            return getattr(self, '_m_has_profile', None)

        def _invalidate_has_profile(self):
            del self._m_has_profile
        @property
        def profile_data(self):
            """
            .. seealso::
               "If the profile is embedded, profile data is the actual profile, and if it is linked, the profile data is the null-terminated file name of the profile. This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252)." - https://learn.microsoft.com/en-us/windows/win32/wcs/using-structures-in-wcs-1-0
            """
            if self._should_write_profile_data:
                self._write_profile_data()
            if hasattr(self, '_m_profile_data'):
                return self._m_profile_data

            if not self.profile_data__enabled:
                return None

            if self.has_profile:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(14 + self.ofs_profile)
                _on = self._parent.bitmap_v4_ext.color_space_type == Bmp.ColorSpace.profile_linked
                if _on == True:
                    pass
                    self._m_profile_data = (KaitaiStream.bytes_terminate(io.read_bytes(self.len_profile), 0, False)).decode(u"windows-1252")
                else:
                    pass
                    self._m_profile_data = io.read_bytes(self.len_profile)
                io.seek(_pos)

            return getattr(self, '_m_profile_data', None)

        @profile_data.setter
        def profile_data(self, v):
            self._dirty = True
            self._m_profile_data = v

        def _write_profile_data(self):
            self._should_write_profile_data = False
            if self.has_profile:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(14 + self.ofs_profile)
                _on = self._parent.bitmap_v4_ext.color_space_type == Bmp.ColorSpace.profile_linked
                if _on == True:
                    pass
                    io.write_bytes_limit((self._m_profile_data).encode(u"windows-1252"), self.len_profile, 0, 0)
                else:
                    pass
                    io.write_bytes(self._m_profile_data)
                io.seek(_pos)



    class CieXyz(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-ciexyz
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.CieXyz, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = Bmp.FixedPoint2Dot30(self._io, self, self._root)
            self.x._read()
            self.y = Bmp.FixedPoint2Dot30(self._io, self, self._root)
            self.y._read()
            self.z = Bmp.FixedPoint2Dot30(self._io, self, self._root)
            self.z._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.x._fetch_instances()
            self.y._fetch_instances()
            self.z._fetch_instances()


        def _write__seq(self, io=None):
            super(Bmp.CieXyz, self)._write__seq(io)
            self.x._write__seq(self._io)
            self.y._write__seq(self._io)
            self.z._write__seq(self._io)


        def _check(self):
            if self.x._root != self._root:
                raise kaitaistruct.ConsistencyError(u"x", self._root, self.x._root)
            if self.x._parent != self:
                raise kaitaistruct.ConsistencyError(u"x", self, self.x._parent)
            if self.y._root != self._root:
                raise kaitaistruct.ConsistencyError(u"y", self._root, self.y._root)
            if self.y._parent != self:
                raise kaitaistruct.ConsistencyError(u"y", self, self.y._parent)
            if self.z._root != self._root:
                raise kaitaistruct.ConsistencyError(u"z", self._root, self.z._root)
            if self.z._parent != self:
                raise kaitaistruct.ConsistencyError(u"z", self, self.z._parent)
            self._dirty = False


    class ColorMask(ReadWriteKaitaiStruct):
        def __init__(self, has_alpha_mask, _io=None, _parent=None, _root=None):
            super(Bmp.ColorMask, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.has_alpha_mask = has_alpha_mask

        def _read(self):
            self.red_mask = self._io.read_u4le()
            self.green_mask = self._io.read_u4le()
            self.blue_mask = self._io.read_u4le()
            if self.has_alpha_mask:
                pass
                self.alpha_mask = self._io.read_u4le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_alpha_mask:
                pass



        def _write__seq(self, io=None):
            super(Bmp.ColorMask, self)._write__seq(io)
            self._io.write_u4le(self.red_mask)
            self._io.write_u4le(self.green_mask)
            self._io.write_u4le(self.blue_mask)
            if self.has_alpha_mask:
                pass
                self._io.write_u4le(self.alpha_mask)



        def _check(self):
            if self.has_alpha_mask:
                pass

            self._dirty = False


    class ColorTable(ReadWriteKaitaiStruct):
        def __init__(self, has_reserved_field, num_colors, _io=None, _parent=None, _root=None):
            super(Bmp.ColorTable, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.has_reserved_field = has_reserved_field
            self.num_colors = num_colors

        def _read(self):
            self.colors = []
            for i in range((self.num_colors if  ((self.num_colors > 0) and (self.num_colors < self.num_colors_present))  else self.num_colors_present)):
                _t_colors = Bmp.RgbRecord(self.has_reserved_field, self._io, self, self._root)
                try:
                    _t_colors._read()
                finally:
                    self.colors.append(_t_colors)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.colors)):
                pass
                self.colors[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Bmp.ColorTable, self)._write__seq(io)
            if len(self.colors) != (self.num_colors if  ((self.num_colors > 0) and (self.num_colors < self.num_colors_present))  else self.num_colors_present):
                raise kaitaistruct.ConsistencyError(u"colors", (self.num_colors if  ((self.num_colors > 0) and (self.num_colors < self.num_colors_present))  else self.num_colors_present), len(self.colors))
            for i in range(len(self.colors)):
                pass
                self.colors[i]._write__seq(self._io)



        def _check(self):
            for i in range(len(self.colors)):
                pass
                if self.colors[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"colors", self._root, self.colors[i]._root)
                if self.colors[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"colors", self, self.colors[i]._parent)
                if self.colors[i].has_reserved_field != self.has_reserved_field:
                    raise kaitaistruct.ConsistencyError(u"colors", self.has_reserved_field, self.colors[i].has_reserved_field)

            self._dirty = False

        @property
        def num_colors_present(self):
            if hasattr(self, '_m_num_colors_present'):
                return self._m_num_colors_present

            self._m_num_colors_present = self._io.size() // (4 if self.has_reserved_field else 3)
            return getattr(self, '_m_num_colors_present', None)

        def _invalidate_num_colors_present(self):
            del self._m_num_colors_present

    class FileHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_type = self._io.read_bytes(2)
            if not self.file_type == b"\x42\x4D":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x4D", self.file_type, self._io, u"/types/file_header/seq/0")
            self.len_file = self._io.read_u4le()
            self.reserved1 = self._io.read_u2le()
            self.reserved2 = self._io.read_u2le()
            self.ofs_bitmap = self._io.read_s4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bmp.FileHeader, self)._write__seq(io)
            self._io.write_bytes(self.file_type)
            self._io.write_u4le(self.len_file)
            self._io.write_u2le(self.reserved1)
            self._io.write_u2le(self.reserved2)
            self._io.write_s4le(self.ofs_bitmap)


        def _check(self):
            if len(self.file_type) != 2:
                raise kaitaistruct.ConsistencyError(u"file_type", 2, len(self.file_type))
            if not self.file_type == b"\x42\x4D":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x4D", self.file_type, None, u"/types/file_header/seq/0")
            self._dirty = False


    class FixedPoint16Dot16(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.FixedPoint16Dot16, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.raw = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bmp.FixedPoint16Dot16, self)._write__seq(io)
            self._io.write_u4le(self.raw)


        def _check(self):
            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = (self.raw + 0.0) / (1 << 16)
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class FixedPoint2Dot30(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.FixedPoint2Dot30, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.raw = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bmp.FixedPoint2Dot30, self)._write__seq(io)
            self._io.write_u4le(self.raw)


        def _check(self):
            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = (self.raw + 0.0) / (1 << 30)
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class Os22xBitmapExtension(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.2
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Bmp.Os22xBitmapExtension, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.units = self._io.read_u2le()
            self.reserved = self._io.read_u2le()
            self.recording = self._io.read_u2le()
            self.rendering = KaitaiStream.resolve_enum(Bmp.Os2Rendering, self._io.read_u2le())
            self.size1 = self._io.read_u4le()
            self.size2 = self._io.read_u4le()
            self.color_encoding = self._io.read_u4le()
            self.identifier = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Bmp.Os22xBitmapExtension, self)._write__seq(io)
            self._io.write_u2le(self.units)
            self._io.write_u2le(self.reserved)
            self._io.write_u2le(self.recording)
            self._io.write_u2le(int(self.rendering))
            self._io.write_u4le(self.size1)
            self._io.write_u4le(self.size2)
            self._io.write_u4le(self.color_encoding)
            self._io.write_u4le(self.identifier)


        def _check(self):
            self._dirty = False


    class RgbRecord(ReadWriteKaitaiStruct):
        def __init__(self, has_reserved_field, _io=None, _parent=None, _root=None):
            super(Bmp.RgbRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.has_reserved_field = has_reserved_field

        def _read(self):
            self.blue = self._io.read_u1()
            self.green = self._io.read_u1()
            self.red = self._io.read_u1()
            if self.has_reserved_field:
                pass
                self.reserved = self._io.read_u1()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_reserved_field:
                pass



        def _write__seq(self, io=None):
            super(Bmp.RgbRecord, self)._write__seq(io)
            self._io.write_u1(self.blue)
            self._io.write_u1(self.green)
            self._io.write_u1(self.red)
            if self.has_reserved_field:
                pass
                self._io.write_u1(self.reserved)



        def _check(self):
            if self.has_reserved_field:
                pass

            self._dirty = False



