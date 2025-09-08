# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Xwd(ReadWriteKaitaiStruct):
    """xwd is a file format written by eponymous X11 screen capture
    application (xwd stands for "X Window Dump"). Typically, an average
    user transforms xwd format into something more widespread by any of
    `xwdtopnm` and `pnmto...` utilities right away.
    
    xwd format itself provides a raw uncompressed bitmap with some
    metainformation, like pixel format, width, height, bit depth,
    etc. Note that technically format includes machine-dependent fields
    and thus is probably a poor choice for true cross-platform usage.
    """

    class ByteOrder(IntEnum):
        le = 0
        be = 1

    class PixmapFormat(IntEnum):
        x_y_bitmap = 0
        x_y_pixmap = 1
        z_pixmap = 2

    class VisualClass(IntEnum):
        static_gray = 0
        gray_scale = 1
        static_color = 2
        pseudo_color = 3
        true_color = 4
        direct_color = 5
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Xwd, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.len_header = self._io.read_u4be()
        self._raw_hdr = self._io.read_bytes(self.len_header - 4)
        _io__raw_hdr = KaitaiStream(BytesIO(self._raw_hdr))
        self.hdr = Xwd.Header(_io__raw_hdr, self, self._root)
        self.hdr._read()
        self._raw_color_map = []
        self.color_map = []
        for i in range(self.hdr.color_map_entries):
            self._raw_color_map.append(self._io.read_bytes(12))
            _io__raw_color_map = KaitaiStream(BytesIO(self._raw_color_map[i]))
            _t_color_map = Xwd.ColorMapEntry(_io__raw_color_map, self, self._root)
            try:
                _t_color_map._read()
            finally:
                self.color_map.append(_t_color_map)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.hdr._fetch_instances()
        for i in range(len(self.color_map)):
            pass
            self.color_map[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Xwd, self)._write__seq(io)
        self._io.write_u4be(self.len_header)
        _io__raw_hdr = KaitaiStream(BytesIO(bytearray(self.len_header - 4)))
        self._io.add_child_stream(_io__raw_hdr)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_header - 4))
        def handler(parent, _io__raw_hdr=_io__raw_hdr):
            self._raw_hdr = _io__raw_hdr.to_byte_array()
            if len(self._raw_hdr) != self.len_header - 4:
                raise kaitaistruct.ConsistencyError(u"raw(hdr)", self.len_header - 4, len(self._raw_hdr))
            parent.write_bytes(self._raw_hdr)
        _io__raw_hdr.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.hdr._write__seq(_io__raw_hdr)
        self._raw_color_map = []
        for i in range(len(self.color_map)):
            pass
            _io__raw_color_map = KaitaiStream(BytesIO(bytearray(12)))
            self._io.add_child_stream(_io__raw_color_map)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (12))
            def handler(parent, _io__raw_color_map=_io__raw_color_map, i=i):
                self._raw_color_map.append(_io__raw_color_map.to_byte_array())
                if len(self._raw_color_map[i]) != 12:
                    raise kaitaistruct.ConsistencyError(u"raw(color_map)", 12, len(self._raw_color_map[i]))
                parent.write_bytes(self._raw_color_map[i])
            _io__raw_color_map.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.color_map[i]._write__seq(_io__raw_color_map)



    def _check(self):
        if self.hdr._root != self._root:
            raise kaitaistruct.ConsistencyError(u"hdr", self._root, self.hdr._root)
        if self.hdr._parent != self:
            raise kaitaistruct.ConsistencyError(u"hdr", self, self.hdr._parent)
        if len(self.color_map) != self.hdr.color_map_entries:
            raise kaitaistruct.ConsistencyError(u"color_map", self.hdr.color_map_entries, len(self.color_map))
        for i in range(len(self.color_map)):
            pass
            if self.color_map[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"color_map", self._root, self.color_map[i]._root)
            if self.color_map[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"color_map", self, self.color_map[i]._parent)

        self._dirty = False

    class ColorMapEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Xwd.ColorMapEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entry_number = self._io.read_u4be()
            self.red = self._io.read_u2be()
            self.green = self._io.read_u2be()
            self.blue = self._io.read_u2be()
            self.flags = self._io.read_u1()
            self.padding = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Xwd.ColorMapEntry, self)._write__seq(io)
            self._io.write_u4be(self.entry_number)
            self._io.write_u2be(self.red)
            self._io.write_u2be(self.green)
            self._io.write_u2be(self.blue)
            self._io.write_u1(self.flags)
            self._io.write_u1(self.padding)


        def _check(self):
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Xwd.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_version = self._io.read_u4be()
            self.pixmap_format = KaitaiStream.resolve_enum(Xwd.PixmapFormat, self._io.read_u4be())
            self.pixmap_depth = self._io.read_u4be()
            self.pixmap_width = self._io.read_u4be()
            self.pixmap_height = self._io.read_u4be()
            self.x_offset = self._io.read_u4be()
            self.byte_order = KaitaiStream.resolve_enum(Xwd.ByteOrder, self._io.read_u4be())
            self.bitmap_unit = self._io.read_u4be()
            self.bitmap_bit_order = self._io.read_u4be()
            self.bitmap_pad = self._io.read_u4be()
            self.bits_per_pixel = self._io.read_u4be()
            self.bytes_per_line = self._io.read_u4be()
            self.visual_class = KaitaiStream.resolve_enum(Xwd.VisualClass, self._io.read_u4be())
            self.red_mask = self._io.read_u4be()
            self.green_mask = self._io.read_u4be()
            self.blue_mask = self._io.read_u4be()
            self.bits_per_rgb = self._io.read_u4be()
            self.number_of_colors = self._io.read_u4be()
            self.color_map_entries = self._io.read_u4be()
            self.window_width = self._io.read_u4be()
            self.window_height = self._io.read_u4be()
            self.window_x = self._io.read_s4be()
            self.window_y = self._io.read_s4be()
            self.window_border_width = self._io.read_u4be()
            self.creator = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Xwd.Header, self)._write__seq(io)
            self._io.write_u4be(self.file_version)
            self._io.write_u4be(int(self.pixmap_format))
            self._io.write_u4be(self.pixmap_depth)
            self._io.write_u4be(self.pixmap_width)
            self._io.write_u4be(self.pixmap_height)
            self._io.write_u4be(self.x_offset)
            self._io.write_u4be(int(self.byte_order))
            self._io.write_u4be(self.bitmap_unit)
            self._io.write_u4be(self.bitmap_bit_order)
            self._io.write_u4be(self.bitmap_pad)
            self._io.write_u4be(self.bits_per_pixel)
            self._io.write_u4be(self.bytes_per_line)
            self._io.write_u4be(int(self.visual_class))
            self._io.write_u4be(self.red_mask)
            self._io.write_u4be(self.green_mask)
            self._io.write_u4be(self.blue_mask)
            self._io.write_u4be(self.bits_per_rgb)
            self._io.write_u4be(self.number_of_colors)
            self._io.write_u4be(self.color_map_entries)
            self._io.write_u4be(self.window_width)
            self._io.write_u4be(self.window_height)
            self._io.write_s4be(self.window_x)
            self._io.write_s4be(self.window_y)
            self._io.write_u4be(self.window_border_width)
            self._io.write_bytes((self.creator).encode(u"UTF-8"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.creator).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"creator", -1, KaitaiStream.byte_array_index_of((self.creator).encode(u"UTF-8"), 0))
            self._dirty = False



