# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GimpBrush(ReadWriteKaitaiStruct):
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
       Source - https://github.com/GNOME/gimp/blob/441631322b/devel-docs/gbr.txt
    """

    class ColorDepth(IntEnum):
        grayscale = 1
        rgba = 4
    def __init__(self, _io=None, _parent=None, _root=None):
        super(GimpBrush, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_body = False
        self.body__enabled = True

    def _read(self):
        self.len_header = self._io.read_u4be()
        self._raw_header = self._io.read_bytes(self.len_header - 4)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = GimpBrush.Header(_io__raw_header, self, self._root)
        self.header._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _ = self.body
        if hasattr(self, '_m_body'):
            pass



    def _write__seq(self, io=None):
        super(GimpBrush, self)._write__seq(io)
        self._should_write_body = self.body__enabled
        self._io.write_u4be(self.len_header)
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


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.body__enabled:
            pass
            if len(self._m_body) != self.len_body:
                raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self._m_body))

        self._dirty = False

    class Bitmap(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GimpBrush.Bitmap, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.rows = []
            for i in range(self._root.header.height):
                _t_rows = GimpBrush.Row(self._io, self, self._root)
                try:
                    _t_rows._read()
                finally:
                    self.rows.append(_t_rows)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.rows)):
                pass
                self.rows[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(GimpBrush.Bitmap, self)._write__seq(io)
            for i in range(len(self.rows)):
                pass
                self.rows[i]._write__seq(self._io)



        def _check(self):
            if len(self.rows) != self._root.header.height:
                raise kaitaistruct.ConsistencyError(u"rows", self._root.header.height, len(self.rows))
            for i in range(len(self.rows)):
                pass
                if self.rows[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"rows", self._root, self.rows[i]._root)
                if self.rows[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"rows", self, self.rows[i]._parent)

            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GimpBrush.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(GimpBrush.Header, self)._write__seq(io)
            self._io.write_u4be(self.version)
            self._io.write_u4be(self.width)
            self._io.write_u4be(self.height)
            self._io.write_u4be(int(self.bytes_per_pixel))
            self._io.write_bytes(self.magic)
            self._io.write_u4be(self.spacing)
            self._io.write_bytes_limit((self.brush_name).encode(u"UTF-8"), self._io.size() - self._io.pos(), 0, 0)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"brush_name", 0, self._io.size() - self._io.pos())


        def _check(self):
            if not self.version == 2:
                raise kaitaistruct.ValidationNotEqualError(2, self.version, None, u"/types/header/seq/0")
            if not self.width >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.width, None, u"/types/header/seq/1")
            if not self.width <= 10000:
                raise kaitaistruct.ValidationGreaterThanError(10000, self.width, None, u"/types/header/seq/1")
            if not self.height >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.height, None, u"/types/header/seq/2")
            if not self.height <= 10000:
                raise kaitaistruct.ValidationGreaterThanError(10000, self.height, None, u"/types/header/seq/2")
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x47\x49\x4D\x50":
                raise kaitaistruct.ValidationNotEqualError(b"\x47\x49\x4D\x50", self.magic, None, u"/types/header/seq/4")
            self._dirty = False


    class Row(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GimpBrush.Row, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.pixels = []
            for i in range(self._root.header.width):
                _on = self._root.header.bytes_per_pixel
                if _on == GimpBrush.ColorDepth.grayscale:
                    pass
                    _t_pixels = GimpBrush.Row.PixelGray(self._io, self, self._root)
                    try:
                        _t_pixels._read()
                    finally:
                        self.pixels.append(_t_pixels)
                elif _on == GimpBrush.ColorDepth.rgba:
                    pass
                    _t_pixels = GimpBrush.Row.PixelRgba(self._io, self, self._root)
                    try:
                        _t_pixels._read()
                    finally:
                        self.pixels.append(_t_pixels)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.pixels)):
                pass
                _on = self._root.header.bytes_per_pixel
                if _on == GimpBrush.ColorDepth.grayscale:
                    pass
                    self.pixels[i]._fetch_instances()
                elif _on == GimpBrush.ColorDepth.rgba:
                    pass
                    self.pixels[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(GimpBrush.Row, self)._write__seq(io)
            for i in range(len(self.pixels)):
                pass
                _on = self._root.header.bytes_per_pixel
                if _on == GimpBrush.ColorDepth.grayscale:
                    pass
                    self.pixels[i]._write__seq(self._io)
                elif _on == GimpBrush.ColorDepth.rgba:
                    pass
                    self.pixels[i]._write__seq(self._io)



        def _check(self):
            if len(self.pixels) != self._root.header.width:
                raise kaitaistruct.ConsistencyError(u"pixels", self._root.header.width, len(self.pixels))
            for i in range(len(self.pixels)):
                pass
                _on = self._root.header.bytes_per_pixel
                if _on == GimpBrush.ColorDepth.grayscale:
                    pass
                    if self.pixels[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"pixels", self._root, self.pixels[i]._root)
                    if self.pixels[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"pixels", self, self.pixels[i]._parent)
                elif _on == GimpBrush.ColorDepth.rgba:
                    pass
                    if self.pixels[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"pixels", self._root, self.pixels[i]._root)
                    if self.pixels[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"pixels", self, self.pixels[i]._parent)

            self._dirty = False

        class PixelGray(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(GimpBrush.Row.PixelGray, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.gray = self._io.read_u1()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(GimpBrush.Row.PixelGray, self)._write__seq(io)
                self._io.write_u1(self.gray)


            def _check(self):
                self._dirty = False

            @property
            def alpha(self):
                if hasattr(self, '_m_alpha'):
                    return self._m_alpha

                self._m_alpha = self.gray
                return getattr(self, '_m_alpha', None)

            def _invalidate_alpha(self):
                del self._m_alpha
            @property
            def blue(self):
                if hasattr(self, '_m_blue'):
                    return self._m_blue

                self._m_blue = 0
                return getattr(self, '_m_blue', None)

            def _invalidate_blue(self):
                del self._m_blue
            @property
            def green(self):
                if hasattr(self, '_m_green'):
                    return self._m_green

                self._m_green = 0
                return getattr(self, '_m_green', None)

            def _invalidate_green(self):
                del self._m_green
            @property
            def red(self):
                if hasattr(self, '_m_red'):
                    return self._m_red

                self._m_red = 0
                return getattr(self, '_m_red', None)

            def _invalidate_red(self):
                del self._m_red

        class PixelRgba(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(GimpBrush.Row.PixelRgba, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.red = self._io.read_u1()
                self.green = self._io.read_u1()
                self.blue = self._io.read_u1()
                self.alpha = self._io.read_u1()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(GimpBrush.Row.PixelRgba, self)._write__seq(io)
                self._io.write_u1(self.red)
                self._io.write_u1(self.green)
                self._io.write_u1(self.blue)
                self._io.write_u1(self.alpha)


            def _check(self):
                self._dirty = False



    @property
    def body(self):
        if self._should_write_body:
            self._write_body()
        if hasattr(self, '_m_body'):
            return self._m_body

        if not self.body__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.len_header)
        self._m_body = self._io.read_bytes(self.len_body)
        self._io.seek(_pos)
        return getattr(self, '_m_body', None)

    @body.setter
    def body(self, v):
        self._dirty = True
        self._m_body = v

    def _write_body(self):
        self._should_write_body = False
        _pos = self._io.pos()
        self._io.seek(self.len_header)
        self._io.write_bytes(self._m_body)
        self._io.seek(_pos)

    @property
    def len_body(self):
        if hasattr(self, '_m_len_body'):
            return self._m_len_body

        self._m_len_body = (self.header.width * self.header.height) * int(self.header.bytes_per_pixel)
        return getattr(self, '_m_len_body', None)

    def _invalidate_len_body(self):
        del self._m_len_body

