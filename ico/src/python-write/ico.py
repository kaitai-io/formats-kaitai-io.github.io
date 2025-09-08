# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Ico(ReadWriteKaitaiStruct):
    """Microsoft Windows uses specific file format to store applications
    icons - ICO. This is a container that contains one or more image
    files (effectively, DIB parts of BMP files or full PNG files are
    contained inside).
    
    .. seealso::
       Source - https://learn.microsoft.com/en-us/previous-versions/ms997538(v=msdn.10)
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Ico, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x00\x00\x01\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x01\x00", self.magic, self._io, u"/seq/0")
        self.num_images = self._io.read_u2le()
        self.images = []
        for i in range(self.num_images):
            _t_images = Ico.IconDirEntry(self._io, self, self._root)
            try:
                _t_images._read()
            finally:
                self.images.append(_t_images)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.images)):
            pass
            self.images[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Ico, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u2le(self.num_images)
        for i in range(len(self.images)):
            pass
            self.images[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x00\x00\x01\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x01\x00", self.magic, None, u"/seq/0")
        if len(self.images) != self.num_images:
            raise kaitaistruct.ConsistencyError(u"images", self.num_images, len(self.images))
        for i in range(len(self.images)):
            pass
            if self.images[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"images", self._root, self.images[i]._root)
            if self.images[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"images", self, self.images[i]._parent)

        self._dirty = False

    class IconDirEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ico.IconDirEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_img = False
            self.img__enabled = True
            self._should_write_png_header = False
            self.png_header__enabled = True

        def _read(self):
            self.width = self._io.read_u1()
            self.height = self._io.read_u1()
            self.num_colors = self._io.read_u1()
            self.reserved = self._io.read_bytes(1)
            if not self.reserved == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.reserved, self._io, u"/types/icon_dir_entry/seq/3")
            self.num_planes = self._io.read_u2le()
            self.bpp = self._io.read_u2le()
            self.len_img = self._io.read_u4le()
            self.ofs_img = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.img
            if hasattr(self, '_m_img'):
                pass

            _ = self.png_header
            if hasattr(self, '_m_png_header'):
                pass



        def _write__seq(self, io=None):
            super(Ico.IconDirEntry, self)._write__seq(io)
            self._should_write_img = self.img__enabled
            self._should_write_png_header = self.png_header__enabled
            self._io.write_u1(self.width)
            self._io.write_u1(self.height)
            self._io.write_u1(self.num_colors)
            self._io.write_bytes(self.reserved)
            self._io.write_u2le(self.num_planes)
            self._io.write_u2le(self.bpp)
            self._io.write_u4le(self.len_img)
            self._io.write_u4le(self.ofs_img)


        def _check(self):
            if len(self.reserved) != 1:
                raise kaitaistruct.ConsistencyError(u"reserved", 1, len(self.reserved))
            if not self.reserved == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.reserved, None, u"/types/icon_dir_entry/seq/3")
            if self.img__enabled:
                pass
                if len(self._m_img) != self.len_img:
                    raise kaitaistruct.ConsistencyError(u"img", self.len_img, len(self._m_img))

            if self.png_header__enabled:
                pass
                if len(self._m_png_header) != 8:
                    raise kaitaistruct.ConsistencyError(u"png_header", 8, len(self._m_png_header))

            self._dirty = False

        @property
        def img(self):
            """Raw image data. Use `is_png` to determine whether this is an
            embedded PNG file (true) or a DIB bitmap (false) and call a
            relevant parser, if needed to parse image data further.
            """
            if self._should_write_img:
                self._write_img()
            if hasattr(self, '_m_img'):
                return self._m_img

            if not self.img__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_img)
            self._m_img = self._io.read_bytes(self.len_img)
            self._io.seek(_pos)
            return getattr(self, '_m_img', None)

        @img.setter
        def img(self, v):
            self._dirty = True
            self._m_img = v

        def _write_img(self):
            self._should_write_img = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_img)
            self._io.write_bytes(self._m_img)
            self._io.seek(_pos)

        @property
        def is_png(self):
            """True if this image is in PNG format."""
            if hasattr(self, '_m_is_png'):
                return self._m_is_png

            self._m_is_png = self.png_header == b"\x89\x50\x4E\x47\x0D\x0A\x1A\x0A"
            return getattr(self, '_m_is_png', None)

        def _invalidate_is_png(self):
            del self._m_is_png
        @property
        def png_header(self):
            """Pre-reads first 8 bytes of the image to determine if it's an
            embedded PNG file.
            """
            if self._should_write_png_header:
                self._write_png_header()
            if hasattr(self, '_m_png_header'):
                return self._m_png_header

            if not self.png_header__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_img)
            self._m_png_header = self._io.read_bytes(8)
            self._io.seek(_pos)
            return getattr(self, '_m_png_header', None)

        @png_header.setter
        def png_header(self, v):
            self._dirty = True
            self._m_png_header = v

        def _write_png_header(self):
            self._should_write_png_header = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_img)
            self._io.write_bytes(self._m_png_header)
            self._io.seek(_pos)



