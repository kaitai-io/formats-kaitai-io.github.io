# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum
import struct


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Wmf(KaitaiStruct):

    class Func(Enum):
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
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.special_hdr = self._root.SpecialHeader(self._io, self, self._root)
        self.header = self._root.WmfHeader(self._io, self, self._root)
        self.records = []
        while True:
            _ = self._root.Record(self._io, self, self._root)
            self.records.append(_)
            if _.function == self._root.Func.eof:
                break

    class SpecialHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(struct.pack('4b', -41, -51, -58, -102))
            self.handle = self._io.ensure_fixed_contents(struct.pack('2b', 0, 0))
            self.left = self._io.read_s2le()
            self.top = self._io.read_s2le()
            self.right = self._io.read_s2le()
            self.bottom = self._io.read_s2le()
            self.inch = self._io.read_u2le()
            self.reserved = self._io.ensure_fixed_contents(struct.pack('4b', 0, 0, 0, 0))
            self.checksum = self._io.read_u2le()


    class WmfHeader(KaitaiStruct):

        class MetafileType(Enum):
            memory_metafile = 1
            disk_metafile = 2
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.type = self._root.WmfHeader.MetafileType(self._io.read_u2le())
            self.header_size = self._io.read_u2le()
            self.version = self._io.read_u2le()
            self.size = self._io.read_u4le()
            self.number_of_objects = self._io.read_u2le()
            self.max_record = self._io.read_u4le()
            self.number_of_members = self._io.read_u2le()


    class Record(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._io.read_u4le()
            self.function = self._root.Func(self._io.read_u2le())
            self.params = self._io.read_bytes(((self.size - 3) * 2))



