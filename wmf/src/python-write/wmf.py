# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Wmf(ReadWriteKaitaiStruct):
    """WMF (Windows Metafile) is a relatively early vector image format
    introduced for Microsoft Windows in 1990.
    
    Inside, it provides a serialized list of Windows GDI (Graphics
    Device Interface) function calls, which, if played back, result in
    an image being drawn on a given surface (display, off-screen buffer,
    printer, etc).
    
    .. seealso::
       Source - https://www.loc.gov/preservation/digital/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf
    """

    class BinRasterOp(IntEnum):
        black = 1
        notmergepen = 2
        masknotpen = 3
        notcopypen = 4
        maskpennot = 5
        not = 6
        xorpen = 7
        notmaskpen = 8
        maskpen = 9
        notxorpen = 10
        nop = 11
        mergenotpen = 12
        copypen = 13
        mergepennot = 14
        mergepen = 15
        white = 16

    class Func(IntEnum):
        eof = 0
        savedc = 30
        realizepalette = 53
        setpalentries = 55
        createpalette = 247
        setbkmode = 258
        setmapmode = 259
        setrop2 = 260
        setrelabs = 261
        setpolyfillmode = 262
        setstretchbltmode = 263
        settextcharextra = 264
        restoredc = 295
        invertregion = 298
        paintregion = 299
        selectclipregion = 300
        selectobject = 301
        settextalign = 302
        resizepalette = 313
        dibcreatepatternbrush = 322
        setlayout = 329
        deleteobject = 496
        createpatternbrush = 505
        setbkcolor = 513
        settextcolor = 521
        settextjustification = 522
        setwindoworg = 523
        setwindowext = 524
        setviewportorg = 525
        setviewportext = 526
        offsetwindoworg = 527
        offsetviewportorg = 529
        lineto = 531
        moveto = 532
        offsetcliprgn = 544
        fillregion = 552
        setmapperflags = 561
        selectpalette = 564
        createpenindirect = 762
        createfontindirect = 763
        createbrushindirect = 764
        polygon = 804
        polyline = 805
        scalewindowext = 1040
        scaleviewportext = 1042
        excludecliprect = 1045
        intersectcliprect = 1046
        ellipse = 1048
        floodfill = 1049
        rectangle = 1051
        setpixel = 1055
        frameregion = 1065
        animatepalette = 1078
        textout = 1313
        polypolygon = 1336
        extfloodfill = 1352
        roundrect = 1564
        patblt = 1565
        escape = 1574
        createregion = 1791
        arc = 2071
        pie = 2074
        chord = 2096
        bitblt = 2338
        dibbitblt = 2368
        exttextout = 2610
        stretchblt = 2851
        dibstretchblt = 2881
        setdibtodev = 3379
        stretchdib = 3907

    class MixMode(IntEnum):
        transparent = 1
        opaque = 2

    class PolyFillMode(IntEnum):
        alternate = 1
        winding = 2
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Wmf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.special_header = Wmf.SpecialHeader(self._io, self, self._root)
        self.special_header._read()
        self.header = Wmf.Header(self._io, self, self._root)
        self.header._read()
        self.records = []
        i = 0
        while True:
            _t_records = Wmf.Record(self._io, self, self._root)
            try:
                _t_records._read()
            finally:
                _ = _t_records
                self.records.append(_)
            if _.function == Wmf.Func.eof:
                break
            i += 1
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.special_header._fetch_instances()
        self.header._fetch_instances()
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Wmf, self)._write__seq(io)
        self.special_header._write__seq(self._io)
        self.header._write__seq(self._io)
        for i in range(len(self.records)):
            pass
            self.records[i]._write__seq(self._io)



    def _check(self):
        if self.special_header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"special_header", self._root, self.special_header._root)
        if self.special_header._parent != self:
            raise kaitaistruct.ConsistencyError(u"special_header", self, self.special_header._parent)
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.records) == 0:
            raise kaitaistruct.ConsistencyError(u"records", 0, len(self.records))
        for i in range(len(self.records)):
            pass
            if self.records[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
            if self.records[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)
            _ = self.records[i]
            if (_.function == Wmf.Func.eof) != (i == len(self.records) - 1):
                raise kaitaistruct.ConsistencyError(u"records", i == len(self.records) - 1, _.function == Wmf.Func.eof)

        self._dirty = False

    class ColorRef(ReadWriteKaitaiStruct):
        """
        .. seealso::
           section 2.2.1.7
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.ColorRef, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.red = self._io.read_u1()
            self.green = self._io.read_u1()
            self.blue = self._io.read_u1()
            self.reserved = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Wmf.ColorRef, self)._write__seq(io)
            self._io.write_u1(self.red)
            self._io.write_u1(self.green)
            self._io.write_u1(self.blue)
            self._io.write_u1(self.reserved)


        def _check(self):
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):

        class MetafileType(IntEnum):
            memory_metafile = 1
            disk_metafile = 2
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.metafile_type = KaitaiStream.resolve_enum(Wmf.Header.MetafileType, self._io.read_u2le())
            self.header_size = self._io.read_u2le()
            self.version = self._io.read_u2le()
            self.size = self._io.read_u4le()
            self.number_of_objects = self._io.read_u2le()
            self.max_record = self._io.read_u4le()
            self.number_of_members = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Wmf.Header, self)._write__seq(io)
            self._io.write_u2le(int(self.metafile_type))
            self._io.write_u2le(self.header_size)
            self._io.write_u2le(self.version)
            self._io.write_u4le(self.size)
            self._io.write_u2le(self.number_of_objects)
            self._io.write_u4le(self.max_record)
            self._io.write_u2le(self.number_of_members)


        def _check(self):
            self._dirty = False


    class ParamsPolygon(ReadWriteKaitaiStruct):
        """
        .. seealso::
           section 2.3.3.15 = params_polyline
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.ParamsPolygon, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_points = self._io.read_s2le()
            self.points = []
            for i in range(self.num_points):
                _t_points = Wmf.PointS(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Wmf.ParamsPolygon, self)._write__seq(io)
            self._io.write_s2le(self.num_points)
            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)



        def _check(self):
            if len(self.points) != self.num_points:
                raise kaitaistruct.ConsistencyError(u"points", self.num_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            self._dirty = False


    class ParamsPolyline(ReadWriteKaitaiStruct):
        """
        .. seealso::
           section 2.3.3.14
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.ParamsPolyline, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_points = self._io.read_s2le()
            self.points = []
            for i in range(self.num_points):
                _t_points = Wmf.PointS(self._io, self, self._root)
                try:
                    _t_points._read()
                finally:
                    self.points.append(_t_points)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.points)):
                pass
                self.points[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Wmf.ParamsPolyline, self)._write__seq(io)
            self._io.write_s2le(self.num_points)
            for i in range(len(self.points)):
                pass
                self.points[i]._write__seq(self._io)



        def _check(self):
            if len(self.points) != self.num_points:
                raise kaitaistruct.ConsistencyError(u"points", self.num_points, len(self.points))
            for i in range(len(self.points)):
                pass
                if self.points[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"points", self._root, self.points[i]._root)
                if self.points[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"points", self, self.points[i]._parent)

            self._dirty = False


    class ParamsSetbkmode(ReadWriteKaitaiStruct):
        """
        .. seealso::
           section 2.3.5.15
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.ParamsSetbkmode, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bk_mode = KaitaiStream.resolve_enum(Wmf.MixMode, self._io.read_u2le())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Wmf.ParamsSetbkmode, self)._write__seq(io)
            self._io.write_u2le(int(self.bk_mode))


        def _check(self):
            self._dirty = False


    class ParamsSetpolyfillmode(ReadWriteKaitaiStruct):
        """
        .. seealso::
           section 2.3.5.20
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.ParamsSetpolyfillmode, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.poly_fill_mode = KaitaiStream.resolve_enum(Wmf.PolyFillMode, self._io.read_u2le())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Wmf.ParamsSetpolyfillmode, self)._write__seq(io)
            self._io.write_u2le(int(self.poly_fill_mode))


        def _check(self):
            self._dirty = False


    class ParamsSetrop2(ReadWriteKaitaiStruct):
        """
        .. seealso::
           section 2.3.5.22
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.ParamsSetrop2, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.draw_mode = KaitaiStream.resolve_enum(Wmf.BinRasterOp, self._io.read_u2le())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Wmf.ParamsSetrop2, self)._write__seq(io)
            self._io.write_u2le(int(self.draw_mode))


        def _check(self):
            self._dirty = False


    class ParamsSetwindowext(ReadWriteKaitaiStruct):
        """
        .. seealso::
           section 2.3.5.30
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.ParamsSetwindowext, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.y = self._io.read_s2le()
            self.x = self._io.read_s2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Wmf.ParamsSetwindowext, self)._write__seq(io)
            self._io.write_s2le(self.y)
            self._io.write_s2le(self.x)


        def _check(self):
            self._dirty = False


    class ParamsSetwindoworg(ReadWriteKaitaiStruct):
        """
        .. seealso::
           section 2.3.5.31
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.ParamsSetwindoworg, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.y = self._io.read_s2le()
            self.x = self._io.read_s2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Wmf.ParamsSetwindoworg, self)._write__seq(io)
            self._io.write_s2le(self.y)
            self._io.write_s2le(self.x)


        def _check(self):
            self._dirty = False


    class PointS(ReadWriteKaitaiStruct):
        """
        .. seealso::
           section 2.2.1.12
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.PointS, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_s2le()
            self.y = self._io.read_s2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Wmf.PointS, self)._write__seq(io)
            self._io.write_s2le(self.x)
            self._io.write_s2le(self.y)


        def _check(self):
            self._dirty = False


    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4le()
            self.function = KaitaiStream.resolve_enum(Wmf.Func, self._io.read_u2le())
            _on = self.function
            if _on == Wmf.Func.polygon:
                pass
                self._raw_params = self._io.read_bytes((self.size - 3) * 2)
                _io__raw_params = KaitaiStream(BytesIO(self._raw_params))
                self.params = Wmf.ParamsPolygon(_io__raw_params, self, self._root)
                self.params._read()
            elif _on == Wmf.Func.polyline:
                pass
                self._raw_params = self._io.read_bytes((self.size - 3) * 2)
                _io__raw_params = KaitaiStream(BytesIO(self._raw_params))
                self.params = Wmf.ParamsPolyline(_io__raw_params, self, self._root)
                self.params._read()
            elif _on == Wmf.Func.setbkcolor:
                pass
                self._raw_params = self._io.read_bytes((self.size - 3) * 2)
                _io__raw_params = KaitaiStream(BytesIO(self._raw_params))
                self.params = Wmf.ColorRef(_io__raw_params, self, self._root)
                self.params._read()
            elif _on == Wmf.Func.setbkmode:
                pass
                self._raw_params = self._io.read_bytes((self.size - 3) * 2)
                _io__raw_params = KaitaiStream(BytesIO(self._raw_params))
                self.params = Wmf.ParamsSetbkmode(_io__raw_params, self, self._root)
                self.params._read()
            elif _on == Wmf.Func.setpolyfillmode:
                pass
                self._raw_params = self._io.read_bytes((self.size - 3) * 2)
                _io__raw_params = KaitaiStream(BytesIO(self._raw_params))
                self.params = Wmf.ParamsSetpolyfillmode(_io__raw_params, self, self._root)
                self.params._read()
            elif _on == Wmf.Func.setrop2:
                pass
                self._raw_params = self._io.read_bytes((self.size - 3) * 2)
                _io__raw_params = KaitaiStream(BytesIO(self._raw_params))
                self.params = Wmf.ParamsSetrop2(_io__raw_params, self, self._root)
                self.params._read()
            elif _on == Wmf.Func.setwindowext:
                pass
                self._raw_params = self._io.read_bytes((self.size - 3) * 2)
                _io__raw_params = KaitaiStream(BytesIO(self._raw_params))
                self.params = Wmf.ParamsSetwindowext(_io__raw_params, self, self._root)
                self.params._read()
            elif _on == Wmf.Func.setwindoworg:
                pass
                self._raw_params = self._io.read_bytes((self.size - 3) * 2)
                _io__raw_params = KaitaiStream(BytesIO(self._raw_params))
                self.params = Wmf.ParamsSetwindoworg(_io__raw_params, self, self._root)
                self.params._read()
            else:
                pass
                self.params = self._io.read_bytes((self.size - 3) * 2)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.function
            if _on == Wmf.Func.polygon:
                pass
                self.params._fetch_instances()
            elif _on == Wmf.Func.polyline:
                pass
                self.params._fetch_instances()
            elif _on == Wmf.Func.setbkcolor:
                pass
                self.params._fetch_instances()
            elif _on == Wmf.Func.setbkmode:
                pass
                self.params._fetch_instances()
            elif _on == Wmf.Func.setpolyfillmode:
                pass
                self.params._fetch_instances()
            elif _on == Wmf.Func.setrop2:
                pass
                self.params._fetch_instances()
            elif _on == Wmf.Func.setwindowext:
                pass
                self.params._fetch_instances()
            elif _on == Wmf.Func.setwindoworg:
                pass
                self.params._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Wmf.Record, self)._write__seq(io)
            self._io.write_u4le(self.size)
            self._io.write_u2le(int(self.function))
            _on = self.function
            if _on == Wmf.Func.polygon:
                pass
                _io__raw_params = KaitaiStream(BytesIO(bytearray((self.size - 3) * 2)))
                self._io.add_child_stream(_io__raw_params)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.size - 3) * 2))
                def handler(parent, _io__raw_params=_io__raw_params):
                    self._raw_params = _io__raw_params.to_byte_array()
                    if len(self._raw_params) != (self.size - 3) * 2:
                        raise kaitaistruct.ConsistencyError(u"raw(params)", (self.size - 3) * 2, len(self._raw_params))
                    parent.write_bytes(self._raw_params)
                _io__raw_params.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.params._write__seq(_io__raw_params)
            elif _on == Wmf.Func.polyline:
                pass
                _io__raw_params = KaitaiStream(BytesIO(bytearray((self.size - 3) * 2)))
                self._io.add_child_stream(_io__raw_params)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.size - 3) * 2))
                def handler(parent, _io__raw_params=_io__raw_params):
                    self._raw_params = _io__raw_params.to_byte_array()
                    if len(self._raw_params) != (self.size - 3) * 2:
                        raise kaitaistruct.ConsistencyError(u"raw(params)", (self.size - 3) * 2, len(self._raw_params))
                    parent.write_bytes(self._raw_params)
                _io__raw_params.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.params._write__seq(_io__raw_params)
            elif _on == Wmf.Func.setbkcolor:
                pass
                _io__raw_params = KaitaiStream(BytesIO(bytearray((self.size - 3) * 2)))
                self._io.add_child_stream(_io__raw_params)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.size - 3) * 2))
                def handler(parent, _io__raw_params=_io__raw_params):
                    self._raw_params = _io__raw_params.to_byte_array()
                    if len(self._raw_params) != (self.size - 3) * 2:
                        raise kaitaistruct.ConsistencyError(u"raw(params)", (self.size - 3) * 2, len(self._raw_params))
                    parent.write_bytes(self._raw_params)
                _io__raw_params.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.params._write__seq(_io__raw_params)
            elif _on == Wmf.Func.setbkmode:
                pass
                _io__raw_params = KaitaiStream(BytesIO(bytearray((self.size - 3) * 2)))
                self._io.add_child_stream(_io__raw_params)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.size - 3) * 2))
                def handler(parent, _io__raw_params=_io__raw_params):
                    self._raw_params = _io__raw_params.to_byte_array()
                    if len(self._raw_params) != (self.size - 3) * 2:
                        raise kaitaistruct.ConsistencyError(u"raw(params)", (self.size - 3) * 2, len(self._raw_params))
                    parent.write_bytes(self._raw_params)
                _io__raw_params.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.params._write__seq(_io__raw_params)
            elif _on == Wmf.Func.setpolyfillmode:
                pass
                _io__raw_params = KaitaiStream(BytesIO(bytearray((self.size - 3) * 2)))
                self._io.add_child_stream(_io__raw_params)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.size - 3) * 2))
                def handler(parent, _io__raw_params=_io__raw_params):
                    self._raw_params = _io__raw_params.to_byte_array()
                    if len(self._raw_params) != (self.size - 3) * 2:
                        raise kaitaistruct.ConsistencyError(u"raw(params)", (self.size - 3) * 2, len(self._raw_params))
                    parent.write_bytes(self._raw_params)
                _io__raw_params.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.params._write__seq(_io__raw_params)
            elif _on == Wmf.Func.setrop2:
                pass
                _io__raw_params = KaitaiStream(BytesIO(bytearray((self.size - 3) * 2)))
                self._io.add_child_stream(_io__raw_params)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.size - 3) * 2))
                def handler(parent, _io__raw_params=_io__raw_params):
                    self._raw_params = _io__raw_params.to_byte_array()
                    if len(self._raw_params) != (self.size - 3) * 2:
                        raise kaitaistruct.ConsistencyError(u"raw(params)", (self.size - 3) * 2, len(self._raw_params))
                    parent.write_bytes(self._raw_params)
                _io__raw_params.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.params._write__seq(_io__raw_params)
            elif _on == Wmf.Func.setwindowext:
                pass
                _io__raw_params = KaitaiStream(BytesIO(bytearray((self.size - 3) * 2)))
                self._io.add_child_stream(_io__raw_params)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.size - 3) * 2))
                def handler(parent, _io__raw_params=_io__raw_params):
                    self._raw_params = _io__raw_params.to_byte_array()
                    if len(self._raw_params) != (self.size - 3) * 2:
                        raise kaitaistruct.ConsistencyError(u"raw(params)", (self.size - 3) * 2, len(self._raw_params))
                    parent.write_bytes(self._raw_params)
                _io__raw_params.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.params._write__seq(_io__raw_params)
            elif _on == Wmf.Func.setwindoworg:
                pass
                _io__raw_params = KaitaiStream(BytesIO(bytearray((self.size - 3) * 2)))
                self._io.add_child_stream(_io__raw_params)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.size - 3) * 2))
                def handler(parent, _io__raw_params=_io__raw_params):
                    self._raw_params = _io__raw_params.to_byte_array()
                    if len(self._raw_params) != (self.size - 3) * 2:
                        raise kaitaistruct.ConsistencyError(u"raw(params)", (self.size - 3) * 2, len(self._raw_params))
                    parent.write_bytes(self._raw_params)
                _io__raw_params.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.params._write__seq(_io__raw_params)
            else:
                pass
                self._io.write_bytes(self.params)


        def _check(self):
            _on = self.function
            if _on == Wmf.Func.polygon:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == Wmf.Func.polyline:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == Wmf.Func.setbkcolor:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == Wmf.Func.setbkmode:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == Wmf.Func.setpolyfillmode:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == Wmf.Func.setrop2:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == Wmf.Func.setwindowext:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == Wmf.Func.setwindoworg:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            else:
                pass
                if len(self.params) != (self.size - 3) * 2:
                    raise kaitaistruct.ConsistencyError(u"params", (self.size - 3) * 2, len(self.params))
            self._dirty = False


    class SpecialHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Wmf.SpecialHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\xD7\xCD\xC6\x9A":
                raise kaitaistruct.ValidationNotEqualError(b"\xD7\xCD\xC6\x9A", self.magic, self._io, u"/types/special_header/seq/0")
            self.handle = self._io.read_bytes(2)
            if not self.handle == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.handle, self._io, u"/types/special_header/seq/1")
            self.left = self._io.read_s2le()
            self.top = self._io.read_s2le()
            self.right = self._io.read_s2le()
            self.bottom = self._io.read_s2le()
            self.inch = self._io.read_u2le()
            self.reserved = self._io.read_bytes(4)
            if not self.reserved == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/special_header/seq/7")
            self.checksum = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Wmf.SpecialHeader, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_bytes(self.handle)
            self._io.write_s2le(self.left)
            self._io.write_s2le(self.top)
            self._io.write_s2le(self.right)
            self._io.write_s2le(self.bottom)
            self._io.write_u2le(self.inch)
            self._io.write_bytes(self.reserved)
            self._io.write_u2le(self.checksum)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\xD7\xCD\xC6\x9A":
                raise kaitaistruct.ValidationNotEqualError(b"\xD7\xCD\xC6\x9A", self.magic, None, u"/types/special_header/seq/0")
            if len(self.handle) != 2:
                raise kaitaistruct.ConsistencyError(u"handle", 2, len(self.handle))
            if not self.handle == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.handle, None, u"/types/special_header/seq/1")
            if len(self.reserved) != 4:
                raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
            if not self.reserved == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/special_header/seq/7")
            self._dirty = False



