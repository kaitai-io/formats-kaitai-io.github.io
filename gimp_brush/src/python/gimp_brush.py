# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class GimpBrush(KaitaiStruct):
    """GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
    It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
    for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
    the tool. The Spacing parameter sets the distance between the brush marks as a percentage
    of brush width. Its default value can be set in the brush file.
    
    You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
    into GIMP for use in the paint tools by copying them into one of the Brush Folders -
    select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
    and choose **Brushes** to see the recognized Brush Folders or to add new ones.
    
    .. seealso::
       Source - https://gitlab.gnome.org/GNOME/gimp/-/raw/4416313/devel-docs/gbr.txt
    """

    class ColorDepth(Enum):
        grayscale = 1
        rgba = 4
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.len_header = self._io.read_u4be()
        self._raw_header = self._io.read_bytes((self.len_header - 4))
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = GimpBrush.Header(_io__raw_header, self, self._root)

    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version = self._io.read_u4be()
            if not self.version == 2:
                raise kaitaistruct.ValidationNotEqualError(2, self.version, self._io, u"/types/header/seq/0")
            self.width = self._io.read_u4be()
            if not self.width >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.width, self._io, u"/types/header/seq/1")
            if not self.width <= 10000:
                raise kaitaistruct.ValidationGreaterThanError(10000, self.width, self._io, u"/types/header/seq/1")
            self.height = self._io.read_u4be()
            if not self.height >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.height, self._io, u"/types/header/seq/2")
            if not self.height <= 10000:
                raise kaitaistruct.ValidationGreaterThanError(10000, self.height, self._io, u"/types/header/seq/2")
            self.bytes_per_pixel = KaitaiStream.resolve_enum(GimpBrush.ColorDepth, self._io.read_u4be())
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x47\x49\x4D\x50":
                raise kaitaistruct.ValidationNotEqualError(b"\x47\x49\x4D\x50", self.magic, self._io, u"/types/header/seq/4")
            self.spacing = self._io.read_u4be()
            self.brush_name = (KaitaiStream.bytes_terminate(self._io.read_bytes_full(), 0, False)).decode(u"UTF-8")


    class Bitmap(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.rows = []
            for i in range(self._root.header.height):
                self.rows.append(GimpBrush.Row(self._io, self, self._root))



    class Row(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.pixels = []
            for i in range(self._root.header.width):
                _on = self._root.header.bytes_per_pixel
                if _on == GimpBrush.ColorDepth.grayscale:
                    self.pixels.append(GimpBrush.Row.PixelGray(self._io, self, self._root))
                elif _on == GimpBrush.ColorDepth.rgba:
                    self.pixels.append(GimpBrush.Row.PixelRgba(self._io, self, self._root))


        class PixelGray(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.gray = self._io.read_u1()

            @property
            def red(self):
                if hasattr(self, '_m_red'):
                    return self._m_red

                self._m_red = 0
                return getattr(self, '_m_red', None)

            @property
            def green(self):
                if hasattr(self, '_m_green'):
                    return self._m_green

                self._m_green = 0
                return getattr(self, '_m_green', None)

            @property
            def blue(self):
                if hasattr(self, '_m_blue'):
                    return self._m_blue

                self._m_blue = 0
                return getattr(self, '_m_blue', None)

            @property
            def alpha(self):
                if hasattr(self, '_m_alpha'):
                    return self._m_alpha

                self._m_alpha = self.gray
                return getattr(self, '_m_alpha', None)


        class PixelRgba(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.red = self._io.read_u1()
                self.green = self._io.read_u1()
                self.blue = self._io.read_u1()
                self.alpha = self._io.read_u1()



    @property
    def len_body(self):
        if hasattr(self, '_m_len_body'):
            return self._m_len_body

        self._m_len_body = ((self.header.width * self.header.height) * self.header.bytes_per_pixel.value)
        return getattr(self, '_m_len_body', None)

    @property
    def body(self):
        if hasattr(self, '_m_body'):
            return self._m_body

        _pos = self._io.pos()
        self._io.seek(self.len_header)
        self._m_body = self._io.read_bytes(self.len_body)
        self._io.seek(_pos)
        return getattr(self, '_m_body', None)


