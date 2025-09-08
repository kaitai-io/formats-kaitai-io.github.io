# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Nitf(ReadWriteKaitaiStruct):
    """The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
    storing imagery, e.g. from satellites.
    
    According to the [foreword of the specification](https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
    > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
    > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
    > defined by the Executive Order 12333, and other United States Government departments and agencies."
    
    This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
    It was implemented by [River Loop Security](https://www.riverloopsecurity.com/).
    
    .. seealso::
       Source - https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Nitf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = Nitf.Header(self._io, self, self._root)
        self.header._read()
        self.image_segments = []
        for i in range(int(self.header.num_image_segments)):
            _t_image_segments = Nitf.ImageSegment(i, self._io, self, self._root)
            try:
                _t_image_segments._read()
            finally:
                self.image_segments.append(_t_image_segments)

        self.graphics_segments = []
        for i in range(int(self.header.num_graphics_segments)):
            _t_graphics_segments = Nitf.GraphicsSegment(i, self._io, self, self._root)
            try:
                _t_graphics_segments._read()
            finally:
                self.graphics_segments.append(_t_graphics_segments)

        self.text_segments = []
        for i in range(int(self.header.num_text_files)):
            _t_text_segments = Nitf.TextSegment(i, self._io, self, self._root)
            try:
                _t_text_segments._read()
            finally:
                self.text_segments.append(_t_text_segments)

        self.data_extension_segments = []
        for i in range(int(self.header.num_data_extension)):
            _t_data_extension_segments = Nitf.DataExtensionSegment(i, self._io, self, self._root)
            try:
                _t_data_extension_segments._read()
            finally:
                self.data_extension_segments.append(_t_data_extension_segments)

        self.reserved_extension_segments = []
        for i in range(int(self.header.num_reserved_extension)):
            _t_reserved_extension_segments = Nitf.ReservedExtensionSegment(i, self._io, self, self._root)
            try:
                _t_reserved_extension_segments._read()
            finally:
                self.reserved_extension_segments.append(_t_reserved_extension_segments)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.image_segments)):
            pass
            self.image_segments[i]._fetch_instances()

        for i in range(len(self.graphics_segments)):
            pass
            self.graphics_segments[i]._fetch_instances()

        for i in range(len(self.text_segments)):
            pass
            self.text_segments[i]._fetch_instances()

        for i in range(len(self.data_extension_segments)):
            pass
            self.data_extension_segments[i]._fetch_instances()

        for i in range(len(self.reserved_extension_segments)):
            pass
            self.reserved_extension_segments[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Nitf, self)._write__seq(io)
        self.header._write__seq(self._io)
        for i in range(len(self.image_segments)):
            pass
            self.image_segments[i]._write__seq(self._io)

        for i in range(len(self.graphics_segments)):
            pass
            self.graphics_segments[i]._write__seq(self._io)

        for i in range(len(self.text_segments)):
            pass
            self.text_segments[i]._write__seq(self._io)

        for i in range(len(self.data_extension_segments)):
            pass
            self.data_extension_segments[i]._write__seq(self._io)

        for i in range(len(self.reserved_extension_segments)):
            pass
            self.reserved_extension_segments[i]._write__seq(self._io)



    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.image_segments) != int(self.header.num_image_segments):
            raise kaitaistruct.ConsistencyError(u"image_segments", int(self.header.num_image_segments), len(self.image_segments))
        for i in range(len(self.image_segments)):
            pass
            if self.image_segments[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"image_segments", self._root, self.image_segments[i]._root)
            if self.image_segments[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"image_segments", self, self.image_segments[i]._parent)
            if self.image_segments[i].idx != i:
                raise kaitaistruct.ConsistencyError(u"image_segments", i, self.image_segments[i].idx)

        if len(self.graphics_segments) != int(self.header.num_graphics_segments):
            raise kaitaistruct.ConsistencyError(u"graphics_segments", int(self.header.num_graphics_segments), len(self.graphics_segments))
        for i in range(len(self.graphics_segments)):
            pass
            if self.graphics_segments[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"graphics_segments", self._root, self.graphics_segments[i]._root)
            if self.graphics_segments[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"graphics_segments", self, self.graphics_segments[i]._parent)
            if self.graphics_segments[i].idx != i:
                raise kaitaistruct.ConsistencyError(u"graphics_segments", i, self.graphics_segments[i].idx)

        if len(self.text_segments) != int(self.header.num_text_files):
            raise kaitaistruct.ConsistencyError(u"text_segments", int(self.header.num_text_files), len(self.text_segments))
        for i in range(len(self.text_segments)):
            pass
            if self.text_segments[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"text_segments", self._root, self.text_segments[i]._root)
            if self.text_segments[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"text_segments", self, self.text_segments[i]._parent)
            if self.text_segments[i].idx != i:
                raise kaitaistruct.ConsistencyError(u"text_segments", i, self.text_segments[i].idx)

        if len(self.data_extension_segments) != int(self.header.num_data_extension):
            raise kaitaistruct.ConsistencyError(u"data_extension_segments", int(self.header.num_data_extension), len(self.data_extension_segments))
        for i in range(len(self.data_extension_segments)):
            pass
            if self.data_extension_segments[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"data_extension_segments", self._root, self.data_extension_segments[i]._root)
            if self.data_extension_segments[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"data_extension_segments", self, self.data_extension_segments[i]._parent)
            if self.data_extension_segments[i].idx != i:
                raise kaitaistruct.ConsistencyError(u"data_extension_segments", i, self.data_extension_segments[i].idx)

        if len(self.reserved_extension_segments) != int(self.header.num_reserved_extension):
            raise kaitaistruct.ConsistencyError(u"reserved_extension_segments", int(self.header.num_reserved_extension), len(self.reserved_extension_segments))
        for i in range(len(self.reserved_extension_segments)):
            pass
            if self.reserved_extension_segments[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"reserved_extension_segments", self._root, self.reserved_extension_segments[i]._root)
            if self.reserved_extension_segments[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"reserved_extension_segments", self, self.reserved_extension_segments[i]._parent)
            if self.reserved_extension_segments[i].idx != i:
                raise kaitaistruct.ConsistencyError(u"reserved_extension_segments", i, self.reserved_extension_segments[i].idx)

        self._dirty = False

    class BandInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.BandInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.representation = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.subcategory = (self._io.read_bytes(6)).decode(u"UTF-8")
            self.img_filter_condition = self._io.read_bytes(1)
            if not self.img_filter_condition == b"\x4E":
                raise kaitaistruct.ValidationNotEqualError(b"\x4E", self.img_filter_condition, self._io, u"/types/band_info/seq/2")
            self.img_filter_code = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.num_luts = (self._io.read_bytes(1)).decode(u"UTF-8")
            if int(self.num_luts) != 0:
                pass
                self.num_lut_entries = (self._io.read_bytes(5)).decode(u"UTF-8")

            self.luts = []
            for i in range(int(self.num_luts)):
                self.luts.append(self._io.read_bytes(int(self.num_lut_entries)))

            self._dirty = False


        def _fetch_instances(self):
            pass
            if int(self.num_luts) != 0:
                pass

            for i in range(len(self.luts)):
                pass



        def _write__seq(self, io=None):
            super(Nitf.BandInfo, self)._write__seq(io)
            self._io.write_bytes((self.representation).encode(u"UTF-8"))
            self._io.write_bytes((self.subcategory).encode(u"UTF-8"))
            self._io.write_bytes(self.img_filter_condition)
            self._io.write_bytes((self.img_filter_code).encode(u"UTF-8"))
            self._io.write_bytes((self.num_luts).encode(u"UTF-8"))
            if int(self.num_luts) != 0:
                pass
                self._io.write_bytes((self.num_lut_entries).encode(u"UTF-8"))

            for i in range(len(self.luts)):
                pass
                self._io.write_bytes(self.luts[i])



        def _check(self):
            if len((self.representation).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"representation", 2, len((self.representation).encode(u"UTF-8")))
            if len((self.subcategory).encode(u"UTF-8")) != 6:
                raise kaitaistruct.ConsistencyError(u"subcategory", 6, len((self.subcategory).encode(u"UTF-8")))
            if len(self.img_filter_condition) != 1:
                raise kaitaistruct.ConsistencyError(u"img_filter_condition", 1, len(self.img_filter_condition))
            if not self.img_filter_condition == b"\x4E":
                raise kaitaistruct.ValidationNotEqualError(b"\x4E", self.img_filter_condition, None, u"/types/band_info/seq/2")
            if len((self.img_filter_code).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"img_filter_code", 3, len((self.img_filter_code).encode(u"UTF-8")))
            if len((self.num_luts).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"num_luts", 1, len((self.num_luts).encode(u"UTF-8")))
            if int(self.num_luts) != 0:
                pass
                if len((self.num_lut_entries).encode(u"UTF-8")) != 5:
                    raise kaitaistruct.ConsistencyError(u"num_lut_entries", 5, len((self.num_lut_entries).encode(u"UTF-8")))

            if len(self.luts) != int(self.num_luts):
                raise kaitaistruct.ConsistencyError(u"luts", int(self.num_luts), len(self.luts))
            for i in range(len(self.luts)):
                pass
                if len(self.luts[i]) != int(self.num_lut_entries):
                    raise kaitaistruct.ConsistencyError(u"luts", int(self.num_lut_entries), len(self.luts[i]))

            self._dirty = False


    class Clasnfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.Clasnfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.security_class = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.security_system = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.codewords = (self._io.read_bytes(11)).decode(u"UTF-8")
            self.control_and_handling = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.releaseability = (self._io.read_bytes(20)).decode(u"UTF-8")
            self.declass_type = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.declass_date = (self._io.read_bytes(8)).decode(u"UTF-8")
            self.declass_exemption = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.downgrade = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.downgrade_date = (self._io.read_bytes(8)).decode(u"UTF-8")
            self.class_text = (self._io.read_bytes(43)).decode(u"UTF-8")
            self.class_authority_type = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.class_authority = (self._io.read_bytes(40)).decode(u"UTF-8")
            self.class_reason = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.source_date = (self._io.read_bytes(8)).decode(u"UTF-8")
            self.control_number = (self._io.read_bytes(15)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.Clasnfo, self)._write__seq(io)
            self._io.write_bytes((self.security_class).encode(u"UTF-8"))
            self._io.write_bytes((self.security_system).encode(u"UTF-8"))
            self._io.write_bytes((self.codewords).encode(u"UTF-8"))
            self._io.write_bytes((self.control_and_handling).encode(u"UTF-8"))
            self._io.write_bytes((self.releaseability).encode(u"UTF-8"))
            self._io.write_bytes((self.declass_type).encode(u"UTF-8"))
            self._io.write_bytes((self.declass_date).encode(u"UTF-8"))
            self._io.write_bytes((self.declass_exemption).encode(u"UTF-8"))
            self._io.write_bytes((self.downgrade).encode(u"UTF-8"))
            self._io.write_bytes((self.downgrade_date).encode(u"UTF-8"))
            self._io.write_bytes((self.class_text).encode(u"UTF-8"))
            self._io.write_bytes((self.class_authority_type).encode(u"UTF-8"))
            self._io.write_bytes((self.class_authority).encode(u"UTF-8"))
            self._io.write_bytes((self.class_reason).encode(u"UTF-8"))
            self._io.write_bytes((self.source_date).encode(u"UTF-8"))
            self._io.write_bytes((self.control_number).encode(u"UTF-8"))


        def _check(self):
            if len((self.security_class).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"security_class", 1, len((self.security_class).encode(u"UTF-8")))
            if len((self.security_system).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"security_system", 2, len((self.security_system).encode(u"UTF-8")))
            if len((self.codewords).encode(u"UTF-8")) != 11:
                raise kaitaistruct.ConsistencyError(u"codewords", 11, len((self.codewords).encode(u"UTF-8")))
            if len((self.control_and_handling).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"control_and_handling", 2, len((self.control_and_handling).encode(u"UTF-8")))
            if len((self.releaseability).encode(u"UTF-8")) != 20:
                raise kaitaistruct.ConsistencyError(u"releaseability", 20, len((self.releaseability).encode(u"UTF-8")))
            if len((self.declass_type).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"declass_type", 2, len((self.declass_type).encode(u"UTF-8")))
            if len((self.declass_date).encode(u"UTF-8")) != 8:
                raise kaitaistruct.ConsistencyError(u"declass_date", 8, len((self.declass_date).encode(u"UTF-8")))
            if len((self.declass_exemption).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"declass_exemption", 4, len((self.declass_exemption).encode(u"UTF-8")))
            if len((self.downgrade).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"downgrade", 1, len((self.downgrade).encode(u"UTF-8")))
            if len((self.downgrade_date).encode(u"UTF-8")) != 8:
                raise kaitaistruct.ConsistencyError(u"downgrade_date", 8, len((self.downgrade_date).encode(u"UTF-8")))
            if len((self.class_text).encode(u"UTF-8")) != 43:
                raise kaitaistruct.ConsistencyError(u"class_text", 43, len((self.class_text).encode(u"UTF-8")))
            if len((self.class_authority_type).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"class_authority_type", 1, len((self.class_authority_type).encode(u"UTF-8")))
            if len((self.class_authority).encode(u"UTF-8")) != 40:
                raise kaitaistruct.ConsistencyError(u"class_authority", 40, len((self.class_authority).encode(u"UTF-8")))
            if len((self.class_reason).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"class_reason", 1, len((self.class_reason).encode(u"UTF-8")))
            if len((self.source_date).encode(u"UTF-8")) != 8:
                raise kaitaistruct.ConsistencyError(u"source_date", 8, len((self.source_date).encode(u"UTF-8")))
            if len((self.control_number).encode(u"UTF-8")) != 15:
                raise kaitaistruct.ConsistencyError(u"control_number", 15, len((self.control_number).encode(u"UTF-8")))
            self._dirty = False


    class DataExtensionSegment(ReadWriteKaitaiStruct):
        def __init__(self, idx, _io=None, _parent=None, _root=None):
            super(Nitf.DataExtensionSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx

        def _read(self):
            self._raw_data_sub_header = self._io.read_bytes(int(self._parent.header.ldnfo[self.idx].length_data_extension_subheader))
            _io__raw_data_sub_header = KaitaiStream(BytesIO(self._raw_data_sub_header))
            self.data_sub_header = Nitf.DataSubHeader(_io__raw_data_sub_header, self, self._root)
            self.data_sub_header._read()
            self.data_data_field = self._io.read_bytes(int(self._parent.header.ldnfo[self.idx].length_data_extension_segment))
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.data_sub_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Nitf.DataExtensionSegment, self)._write__seq(io)
            _io__raw_data_sub_header = KaitaiStream(BytesIO(bytearray(int(self._parent.header.ldnfo[self.idx].length_data_extension_subheader))))
            self._io.add_child_stream(_io__raw_data_sub_header)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (int(self._parent.header.ldnfo[self.idx].length_data_extension_subheader)))
            def handler(parent, _io__raw_data_sub_header=_io__raw_data_sub_header):
                self._raw_data_sub_header = _io__raw_data_sub_header.to_byte_array()
                if len(self._raw_data_sub_header) != int(self._parent.header.ldnfo[self.idx].length_data_extension_subheader):
                    raise kaitaistruct.ConsistencyError(u"raw(data_sub_header)", int(self._parent.header.ldnfo[self.idx].length_data_extension_subheader), len(self._raw_data_sub_header))
                parent.write_bytes(self._raw_data_sub_header)
            _io__raw_data_sub_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.data_sub_header._write__seq(_io__raw_data_sub_header)
            self._io.write_bytes(self.data_data_field)


        def _check(self):
            if self.data_sub_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"data_sub_header", self._root, self.data_sub_header._root)
            if self.data_sub_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"data_sub_header", self, self.data_sub_header._parent)
            if len(self.data_data_field) != int(self._parent.header.ldnfo[self.idx].length_data_extension_segment):
                raise kaitaistruct.ConsistencyError(u"data_data_field", int(self._parent.header.ldnfo[self.idx].length_data_extension_segment), len(self.data_data_field))
            self._dirty = False


    class DataSubHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.DataSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.des_base = Nitf.DataSubHeaderBase(self._io, self, self._root)
            self.des_base._read()
            if self.tre_ofl:
                pass
                self.overflowed_header_type = (self._io.read_bytes(6)).decode(u"UTF-8")

            if self.tre_ofl:
                pass
                self.data_item_overflowed = (self._io.read_bytes(3)).decode(u"UTF-8")

            self.des_defined_subheader_fields_len = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.desshf = (self._io.read_bytes(int(self.des_defined_subheader_fields_len))).decode(u"UTF-8")
            self.des_defined_data_field = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.des_base._fetch_instances()
            if self.tre_ofl:
                pass

            if self.tre_ofl:
                pass



        def _write__seq(self, io=None):
            super(Nitf.DataSubHeader, self)._write__seq(io)
            self.des_base._write__seq(self._io)
            if self.tre_ofl:
                pass
                self._io.write_bytes((self.overflowed_header_type).encode(u"UTF-8"))

            if self.tre_ofl:
                pass
                self._io.write_bytes((self.data_item_overflowed).encode(u"UTF-8"))

            self._io.write_bytes((self.des_defined_subheader_fields_len).encode(u"UTF-8"))
            self._io.write_bytes((self.desshf).encode(u"UTF-8"))
            self._io.write_bytes((self.des_defined_data_field).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"des_defined_data_field", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.des_base._root != self._root:
                raise kaitaistruct.ConsistencyError(u"des_base", self._root, self.des_base._root)
            if self.des_base._parent != self:
                raise kaitaistruct.ConsistencyError(u"des_base", self, self.des_base._parent)
            if self.tre_ofl:
                pass
                if len((self.overflowed_header_type).encode(u"UTF-8")) != 6:
                    raise kaitaistruct.ConsistencyError(u"overflowed_header_type", 6, len((self.overflowed_header_type).encode(u"UTF-8")))

            if self.tre_ofl:
                pass
                if len((self.data_item_overflowed).encode(u"UTF-8")) != 3:
                    raise kaitaistruct.ConsistencyError(u"data_item_overflowed", 3, len((self.data_item_overflowed).encode(u"UTF-8")))

            if len((self.des_defined_subheader_fields_len).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"des_defined_subheader_fields_len", 4, len((self.des_defined_subheader_fields_len).encode(u"UTF-8")))
            if len((self.desshf).encode(u"UTF-8")) != int(self.des_defined_subheader_fields_len):
                raise kaitaistruct.ConsistencyError(u"desshf", int(self.des_defined_subheader_fields_len), len((self.desshf).encode(u"UTF-8")))
            self._dirty = False

        @property
        def tre_ofl(self):
            if hasattr(self, '_m_tre_ofl'):
                return self._m_tre_ofl

            self._m_tre_ofl = self.des_base.desid == u"TRE_OVERFLOW"
            return getattr(self, '_m_tre_ofl', None)

        def _invalidate_tre_ofl(self):
            del self._m_tre_ofl

    class DataSubHeaderBase(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.DataSubHeaderBase, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_part_type_de = self._io.read_bytes(2)
            if not self.file_part_type_de == b"\x44\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x44\x45", self.file_part_type_de, self._io, u"/types/data_sub_header_base/seq/0")
            self.desid = (self._io.read_bytes(25)).decode(u"UTF-8")
            self.data_definition_version = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.declasnfo = Nitf.Clasnfo(self._io, self, self._root)
            self.declasnfo._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.declasnfo._fetch_instances()


        def _write__seq(self, io=None):
            super(Nitf.DataSubHeaderBase, self)._write__seq(io)
            self._io.write_bytes(self.file_part_type_de)
            self._io.write_bytes((self.desid).encode(u"UTF-8"))
            self._io.write_bytes((self.data_definition_version).encode(u"UTF-8"))
            self.declasnfo._write__seq(self._io)


        def _check(self):
            if len(self.file_part_type_de) != 2:
                raise kaitaistruct.ConsistencyError(u"file_part_type_de", 2, len(self.file_part_type_de))
            if not self.file_part_type_de == b"\x44\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x44\x45", self.file_part_type_de, None, u"/types/data_sub_header_base/seq/0")
            if len((self.desid).encode(u"UTF-8")) != 25:
                raise kaitaistruct.ConsistencyError(u"desid", 25, len((self.desid).encode(u"UTF-8")))
            if len((self.data_definition_version).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"data_definition_version", 2, len((self.data_definition_version).encode(u"UTF-8")))
            if self.declasnfo._root != self._root:
                raise kaitaistruct.ConsistencyError(u"declasnfo", self._root, self.declasnfo._root)
            if self.declasnfo._parent != self:
                raise kaitaistruct.ConsistencyError(u"declasnfo", self, self.declasnfo._parent)
            self._dirty = False


    class DataSubHeaderStreaming(ReadWriteKaitaiStruct):
        """Streaming file Header Data Extension Segment Subheader."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.DataSubHeaderStreaming, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.des_base = Nitf.DataSubHeaderBase(self._io, self, self._root)
            self.des_base._read()
            self.des_defined_subheader_fields_len = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.sfh_l1 = (self._io.read_bytes(7)).decode(u"UTF-8")
            self.sfh_delim1 = self._io.read_u4be()
            self.sfh_dr = []
            for i in range(int(self.sfh_l1)):
                self.sfh_dr.append(self._io.read_u1())

            self.sfh_delim2 = self._io.read_u4be()
            self.sfh_l2 = (self._io.read_bytes(7)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.des_base._fetch_instances()
            for i in range(len(self.sfh_dr)):
                pass



        def _write__seq(self, io=None):
            super(Nitf.DataSubHeaderStreaming, self)._write__seq(io)
            self.des_base._write__seq(self._io)
            self._io.write_bytes((self.des_defined_subheader_fields_len).encode(u"UTF-8"))
            self._io.write_bytes((self.sfh_l1).encode(u"UTF-8"))
            self._io.write_u4be(self.sfh_delim1)
            for i in range(len(self.sfh_dr)):
                pass
                self._io.write_u1(self.sfh_dr[i])

            self._io.write_u4be(self.sfh_delim2)
            self._io.write_bytes((self.sfh_l2).encode(u"UTF-8"))


        def _check(self):
            if self.des_base._root != self._root:
                raise kaitaistruct.ConsistencyError(u"des_base", self._root, self.des_base._root)
            if self.des_base._parent != self:
                raise kaitaistruct.ConsistencyError(u"des_base", self, self.des_base._parent)
            if len((self.des_defined_subheader_fields_len).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"des_defined_subheader_fields_len", 4, len((self.des_defined_subheader_fields_len).encode(u"UTF-8")))
            if len((self.sfh_l1).encode(u"UTF-8")) != 7:
                raise kaitaistruct.ConsistencyError(u"sfh_l1", 7, len((self.sfh_l1).encode(u"UTF-8")))
            if len(self.sfh_dr) != int(self.sfh_l1):
                raise kaitaistruct.ConsistencyError(u"sfh_dr", int(self.sfh_l1), len(self.sfh_dr))
            for i in range(len(self.sfh_dr)):
                pass

            if len((self.sfh_l2).encode(u"UTF-8")) != 7:
                raise kaitaistruct.ConsistencyError(u"sfh_l2", 7, len((self.sfh_l2).encode(u"UTF-8")))
            self._dirty = False


    class DataSubHeaderTre(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.DataSubHeaderTre, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.des_base = Nitf.DataSubHeaderBase(self._io, self, self._root)
            self.des_base._read()
            if self.des_base.desid == u"TRE_OVERFLOW":
                pass
                self.overflowed_header_type = (self._io.read_bytes(6)).decode(u"UTF-8")

            if self.des_base.desid == u"TRE_OVERFLOW":
                pass
                self.data_item_overflowed = (self._io.read_bytes(3)).decode(u"UTF-8")

            self.des_defined_subheader_fields_len = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.des_defined_data_field = (self._io.read_bytes(int(self.des_defined_subheader_fields_len))).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.des_base._fetch_instances()
            if self.des_base.desid == u"TRE_OVERFLOW":
                pass

            if self.des_base.desid == u"TRE_OVERFLOW":
                pass



        def _write__seq(self, io=None):
            super(Nitf.DataSubHeaderTre, self)._write__seq(io)
            self.des_base._write__seq(self._io)
            if self.des_base.desid == u"TRE_OVERFLOW":
                pass
                self._io.write_bytes((self.overflowed_header_type).encode(u"UTF-8"))

            if self.des_base.desid == u"TRE_OVERFLOW":
                pass
                self._io.write_bytes((self.data_item_overflowed).encode(u"UTF-8"))

            self._io.write_bytes((self.des_defined_subheader_fields_len).encode(u"UTF-8"))
            self._io.write_bytes((self.des_defined_data_field).encode(u"UTF-8"))


        def _check(self):
            if self.des_base._root != self._root:
                raise kaitaistruct.ConsistencyError(u"des_base", self._root, self.des_base._root)
            if self.des_base._parent != self:
                raise kaitaistruct.ConsistencyError(u"des_base", self, self.des_base._parent)
            if self.des_base.desid == u"TRE_OVERFLOW":
                pass
                if len((self.overflowed_header_type).encode(u"UTF-8")) != 6:
                    raise kaitaistruct.ConsistencyError(u"overflowed_header_type", 6, len((self.overflowed_header_type).encode(u"UTF-8")))

            if self.des_base.desid == u"TRE_OVERFLOW":
                pass
                if len((self.data_item_overflowed).encode(u"UTF-8")) != 3:
                    raise kaitaistruct.ConsistencyError(u"data_item_overflowed", 3, len((self.data_item_overflowed).encode(u"UTF-8")))

            if len((self.des_defined_subheader_fields_len).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"des_defined_subheader_fields_len", 4, len((self.des_defined_subheader_fields_len).encode(u"UTF-8")))
            if len((self.des_defined_data_field).encode(u"UTF-8")) != int(self.des_defined_subheader_fields_len):
                raise kaitaistruct.ConsistencyError(u"des_defined_data_field", int(self.des_defined_subheader_fields_len), len((self.des_defined_data_field).encode(u"UTF-8")))
            self._dirty = False


    class DateTime(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.DateTime, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._unnamed0 = (self._io.read_bytes(14)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.DateTime, self)._write__seq(io)
            self._io.write_bytes((self._unnamed0).encode(u"UTF-8"))


        def _check(self):
            if len((self._unnamed0).encode(u"UTF-8")) != 14:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", 14, len((self._unnamed0).encode(u"UTF-8")))
            self._dirty = False


    class Encrypt(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.Encrypt, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._unnamed0 = (self._io.read_bytes(1)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.Encrypt, self)._write__seq(io)
            self._io.write_bytes((self._unnamed0).encode(u"UTF-8"))


        def _check(self):
            if len((self._unnamed0).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", 1, len((self._unnamed0).encode(u"UTF-8")))
            self._dirty = False


    class GraphicSubHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.GraphicSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_part_type_sy = self._io.read_bytes(2)
            if not self.file_part_type_sy == b"\x53\x59":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\x59", self.file_part_type_sy, self._io, u"/types/graphic_sub_header/seq/0")
            self.graphic_id = (self._io.read_bytes(10)).decode(u"UTF-8")
            self.graphic_name = (self._io.read_bytes(20)).decode(u"UTF-8")
            self.graphic_classification = Nitf.Clasnfo(self._io, self, self._root)
            self.graphic_classification._read()
            self.encryption = Nitf.Encrypt(self._io, self, self._root)
            self.encryption._read()
            self.graphic_type = self._io.read_bytes(1)
            if not self.graphic_type == b"\x43":
                raise kaitaistruct.ValidationNotEqualError(b"\x43", self.graphic_type, self._io, u"/types/graphic_sub_header/seq/5")
            self.reserved1 = (self._io.read_bytes(13)).decode(u"UTF-8")
            self.graphic_display_level = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.graphic_attachment_level = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.graphic_location = (self._io.read_bytes(10)).decode(u"UTF-8")
            self.first_graphic_bound_loc = (self._io.read_bytes(10)).decode(u"UTF-8")
            self.graphic_color = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.second_graphic_bound_loc = (self._io.read_bytes(10)).decode(u"UTF-8")
            self.reserved2 = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.graphics_extended_sub_header = Nitf.TreHeader(self._io, self, self._root)
            self.graphics_extended_sub_header._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.graphic_classification._fetch_instances()
            self.encryption._fetch_instances()
            self.graphics_extended_sub_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Nitf.GraphicSubHeader, self)._write__seq(io)
            self._io.write_bytes(self.file_part_type_sy)
            self._io.write_bytes((self.graphic_id).encode(u"UTF-8"))
            self._io.write_bytes((self.graphic_name).encode(u"UTF-8"))
            self.graphic_classification._write__seq(self._io)
            self.encryption._write__seq(self._io)
            self._io.write_bytes(self.graphic_type)
            self._io.write_bytes((self.reserved1).encode(u"UTF-8"))
            self._io.write_bytes((self.graphic_display_level).encode(u"UTF-8"))
            self._io.write_bytes((self.graphic_attachment_level).encode(u"UTF-8"))
            self._io.write_bytes((self.graphic_location).encode(u"UTF-8"))
            self._io.write_bytes((self.first_graphic_bound_loc).encode(u"UTF-8"))
            self._io.write_bytes((self.graphic_color).encode(u"UTF-8"))
            self._io.write_bytes((self.second_graphic_bound_loc).encode(u"UTF-8"))
            self._io.write_bytes((self.reserved2).encode(u"UTF-8"))
            self.graphics_extended_sub_header._write__seq(self._io)


        def _check(self):
            if len(self.file_part_type_sy) != 2:
                raise kaitaistruct.ConsistencyError(u"file_part_type_sy", 2, len(self.file_part_type_sy))
            if not self.file_part_type_sy == b"\x53\x59":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\x59", self.file_part_type_sy, None, u"/types/graphic_sub_header/seq/0")
            if len((self.graphic_id).encode(u"UTF-8")) != 10:
                raise kaitaistruct.ConsistencyError(u"graphic_id", 10, len((self.graphic_id).encode(u"UTF-8")))
            if len((self.graphic_name).encode(u"UTF-8")) != 20:
                raise kaitaistruct.ConsistencyError(u"graphic_name", 20, len((self.graphic_name).encode(u"UTF-8")))
            if self.graphic_classification._root != self._root:
                raise kaitaistruct.ConsistencyError(u"graphic_classification", self._root, self.graphic_classification._root)
            if self.graphic_classification._parent != self:
                raise kaitaistruct.ConsistencyError(u"graphic_classification", self, self.graphic_classification._parent)
            if self.encryption._root != self._root:
                raise kaitaistruct.ConsistencyError(u"encryption", self._root, self.encryption._root)
            if self.encryption._parent != self:
                raise kaitaistruct.ConsistencyError(u"encryption", self, self.encryption._parent)
            if len(self.graphic_type) != 1:
                raise kaitaistruct.ConsistencyError(u"graphic_type", 1, len(self.graphic_type))
            if not self.graphic_type == b"\x43":
                raise kaitaistruct.ValidationNotEqualError(b"\x43", self.graphic_type, None, u"/types/graphic_sub_header/seq/5")
            if len((self.reserved1).encode(u"UTF-8")) != 13:
                raise kaitaistruct.ConsistencyError(u"reserved1", 13, len((self.reserved1).encode(u"UTF-8")))
            if len((self.graphic_display_level).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"graphic_display_level", 3, len((self.graphic_display_level).encode(u"UTF-8")))
            if len((self.graphic_attachment_level).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"graphic_attachment_level", 3, len((self.graphic_attachment_level).encode(u"UTF-8")))
            if len((self.graphic_location).encode(u"UTF-8")) != 10:
                raise kaitaistruct.ConsistencyError(u"graphic_location", 10, len((self.graphic_location).encode(u"UTF-8")))
            if len((self.first_graphic_bound_loc).encode(u"UTF-8")) != 10:
                raise kaitaistruct.ConsistencyError(u"first_graphic_bound_loc", 10, len((self.first_graphic_bound_loc).encode(u"UTF-8")))
            if len((self.graphic_color).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"graphic_color", 1, len((self.graphic_color).encode(u"UTF-8")))
            if len((self.second_graphic_bound_loc).encode(u"UTF-8")) != 10:
                raise kaitaistruct.ConsistencyError(u"second_graphic_bound_loc", 10, len((self.second_graphic_bound_loc).encode(u"UTF-8")))
            if len((self.reserved2).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved2", 2, len((self.reserved2).encode(u"UTF-8")))
            if self.graphics_extended_sub_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"graphics_extended_sub_header", self._root, self.graphics_extended_sub_header._root)
            if self.graphics_extended_sub_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"graphics_extended_sub_header", self, self.graphics_extended_sub_header._parent)
            self._dirty = False


    class GraphicsSegment(ReadWriteKaitaiStruct):
        def __init__(self, idx, _io=None, _parent=None, _root=None):
            super(Nitf.GraphicsSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx

        def _read(self):
            self.graphic_sub_header = Nitf.GraphicSubHeader(self._io, self, self._root)
            self.graphic_sub_header._read()
            self.graphic_data_field = self._io.read_bytes(int(self._parent.header.lnnfo[self.idx].length_graphic_segment))
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.graphic_sub_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Nitf.GraphicsSegment, self)._write__seq(io)
            self.graphic_sub_header._write__seq(self._io)
            self._io.write_bytes(self.graphic_data_field)


        def _check(self):
            if self.graphic_sub_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"graphic_sub_header", self._root, self.graphic_sub_header._root)
            if self.graphic_sub_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"graphic_sub_header", self, self.graphic_sub_header._parent)
            if len(self.graphic_data_field) != int(self._parent.header.lnnfo[self.idx].length_graphic_segment):
                raise kaitaistruct.ConsistencyError(u"graphic_data_field", int(self._parent.header.lnnfo[self.idx].length_graphic_segment), len(self.graphic_data_field))
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_profile_name = self._io.read_bytes(4)
            if not self.file_profile_name == b"\x4E\x49\x54\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x4E\x49\x54\x46", self.file_profile_name, self._io, u"/types/header/seq/0")
            self.file_version = self._io.read_bytes(5)
            if not self.file_version == b"\x30\x32\x2E\x31\x30":
                raise kaitaistruct.ValidationNotEqualError(b"\x30\x32\x2E\x31\x30", self.file_version, self._io, u"/types/header/seq/1")
            self.complexity_level = self._io.read_bytes(2)
            self.standard_type = self._io.read_bytes(4)
            if not self.standard_type == b"\x42\x46\x30\x31":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x46\x30\x31", self.standard_type, self._io, u"/types/header/seq/3")
            self.originating_station_id = (self._io.read_bytes(10)).decode(u"UTF-8")
            self.file_date_time = Nitf.DateTime(self._io, self, self._root)
            self.file_date_time._read()
            self.file_title = (self._io.read_bytes(80)).decode(u"UTF-8")
            self.file_security = Nitf.Clasnfo(self._io, self, self._root)
            self.file_security._read()
            self.file_copy_number = (self._io.read_bytes(5)).decode(u"UTF-8")
            self.file_num_of_copys = (self._io.read_bytes(5)).decode(u"UTF-8")
            self.encryption = Nitf.Encrypt(self._io, self, self._root)
            self.encryption._read()
            self.file_bg_color = self._io.read_bytes(3)
            self.originator_name = (self._io.read_bytes(24)).decode(u"UTF-8")
            self.originator_phone = (self._io.read_bytes(18)).decode(u"UTF-8")
            self.file_length = (self._io.read_bytes(12)).decode(u"UTF-8")
            self.file_header_length = (self._io.read_bytes(6)).decode(u"UTF-8")
            self.num_image_segments = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.linfo = []
            for i in range(int(self.num_image_segments)):
                _t_linfo = Nitf.LengthImageInfo(self._io, self, self._root)
                try:
                    _t_linfo._read()
                finally:
                    self.linfo.append(_t_linfo)

            self.num_graphics_segments = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.lnnfo = []
            for i in range(int(self.num_graphics_segments)):
                _t_lnnfo = Nitf.LengthGraphicInfo(self._io, self, self._root)
                try:
                    _t_lnnfo._read()
                finally:
                    self.lnnfo.append(_t_lnnfo)

            self.reserved_numx = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.num_text_files = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.ltnfo = []
            for i in range(int(self.num_text_files)):
                _t_ltnfo = Nitf.LengthTextInfo(self._io, self, self._root)
                try:
                    _t_ltnfo._read()
                finally:
                    self.ltnfo.append(_t_ltnfo)

            self.num_data_extension = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.ldnfo = []
            for i in range(int(self.num_data_extension)):
                _t_ldnfo = Nitf.LengthDataInfo(self._io, self, self._root)
                try:
                    _t_ldnfo._read()
                finally:
                    self.ldnfo.append(_t_ldnfo)

            self.num_reserved_extension = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.lrnfo = []
            for i in range(int(self.num_reserved_extension)):
                _t_lrnfo = Nitf.LengthReservedInfo(self._io, self, self._root)
                try:
                    _t_lrnfo._read()
                finally:
                    self.lrnfo.append(_t_lrnfo)

            self.user_defined_header = Nitf.TreHeader(self._io, self, self._root)
            self.user_defined_header._read()
            self.extended_header = Nitf.TreHeader(self._io, self, self._root)
            self.extended_header._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.file_date_time._fetch_instances()
            self.file_security._fetch_instances()
            self.encryption._fetch_instances()
            for i in range(len(self.linfo)):
                pass
                self.linfo[i]._fetch_instances()

            for i in range(len(self.lnnfo)):
                pass
                self.lnnfo[i]._fetch_instances()

            for i in range(len(self.ltnfo)):
                pass
                self.ltnfo[i]._fetch_instances()

            for i in range(len(self.ldnfo)):
                pass
                self.ldnfo[i]._fetch_instances()

            for i in range(len(self.lrnfo)):
                pass
                self.lrnfo[i]._fetch_instances()

            self.user_defined_header._fetch_instances()
            self.extended_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Nitf.Header, self)._write__seq(io)
            self._io.write_bytes(self.file_profile_name)
            self._io.write_bytes(self.file_version)
            self._io.write_bytes(self.complexity_level)
            self._io.write_bytes(self.standard_type)
            self._io.write_bytes((self.originating_station_id).encode(u"UTF-8"))
            self.file_date_time._write__seq(self._io)
            self._io.write_bytes((self.file_title).encode(u"UTF-8"))
            self.file_security._write__seq(self._io)
            self._io.write_bytes((self.file_copy_number).encode(u"UTF-8"))
            self._io.write_bytes((self.file_num_of_copys).encode(u"UTF-8"))
            self.encryption._write__seq(self._io)
            self._io.write_bytes(self.file_bg_color)
            self._io.write_bytes((self.originator_name).encode(u"UTF-8"))
            self._io.write_bytes((self.originator_phone).encode(u"UTF-8"))
            self._io.write_bytes((self.file_length).encode(u"UTF-8"))
            self._io.write_bytes((self.file_header_length).encode(u"UTF-8"))
            self._io.write_bytes((self.num_image_segments).encode(u"UTF-8"))
            for i in range(len(self.linfo)):
                pass
                self.linfo[i]._write__seq(self._io)

            self._io.write_bytes((self.num_graphics_segments).encode(u"UTF-8"))
            for i in range(len(self.lnnfo)):
                pass
                self.lnnfo[i]._write__seq(self._io)

            self._io.write_bytes((self.reserved_numx).encode(u"UTF-8"))
            self._io.write_bytes((self.num_text_files).encode(u"UTF-8"))
            for i in range(len(self.ltnfo)):
                pass
                self.ltnfo[i]._write__seq(self._io)

            self._io.write_bytes((self.num_data_extension).encode(u"UTF-8"))
            for i in range(len(self.ldnfo)):
                pass
                self.ldnfo[i]._write__seq(self._io)

            self._io.write_bytes((self.num_reserved_extension).encode(u"UTF-8"))
            for i in range(len(self.lrnfo)):
                pass
                self.lrnfo[i]._write__seq(self._io)

            self.user_defined_header._write__seq(self._io)
            self.extended_header._write__seq(self._io)


        def _check(self):
            if len(self.file_profile_name) != 4:
                raise kaitaistruct.ConsistencyError(u"file_profile_name", 4, len(self.file_profile_name))
            if not self.file_profile_name == b"\x4E\x49\x54\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x4E\x49\x54\x46", self.file_profile_name, None, u"/types/header/seq/0")
            if len(self.file_version) != 5:
                raise kaitaistruct.ConsistencyError(u"file_version", 5, len(self.file_version))
            if not self.file_version == b"\x30\x32\x2E\x31\x30":
                raise kaitaistruct.ValidationNotEqualError(b"\x30\x32\x2E\x31\x30", self.file_version, None, u"/types/header/seq/1")
            if len(self.complexity_level) != 2:
                raise kaitaistruct.ConsistencyError(u"complexity_level", 2, len(self.complexity_level))
            if len(self.standard_type) != 4:
                raise kaitaistruct.ConsistencyError(u"standard_type", 4, len(self.standard_type))
            if not self.standard_type == b"\x42\x46\x30\x31":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x46\x30\x31", self.standard_type, None, u"/types/header/seq/3")
            if len((self.originating_station_id).encode(u"UTF-8")) != 10:
                raise kaitaistruct.ConsistencyError(u"originating_station_id", 10, len((self.originating_station_id).encode(u"UTF-8")))
            if self.file_date_time._root != self._root:
                raise kaitaistruct.ConsistencyError(u"file_date_time", self._root, self.file_date_time._root)
            if self.file_date_time._parent != self:
                raise kaitaistruct.ConsistencyError(u"file_date_time", self, self.file_date_time._parent)
            if len((self.file_title).encode(u"UTF-8")) != 80:
                raise kaitaistruct.ConsistencyError(u"file_title", 80, len((self.file_title).encode(u"UTF-8")))
            if self.file_security._root != self._root:
                raise kaitaistruct.ConsistencyError(u"file_security", self._root, self.file_security._root)
            if self.file_security._parent != self:
                raise kaitaistruct.ConsistencyError(u"file_security", self, self.file_security._parent)
            if len((self.file_copy_number).encode(u"UTF-8")) != 5:
                raise kaitaistruct.ConsistencyError(u"file_copy_number", 5, len((self.file_copy_number).encode(u"UTF-8")))
            if len((self.file_num_of_copys).encode(u"UTF-8")) != 5:
                raise kaitaistruct.ConsistencyError(u"file_num_of_copys", 5, len((self.file_num_of_copys).encode(u"UTF-8")))
            if self.encryption._root != self._root:
                raise kaitaistruct.ConsistencyError(u"encryption", self._root, self.encryption._root)
            if self.encryption._parent != self:
                raise kaitaistruct.ConsistencyError(u"encryption", self, self.encryption._parent)
            if len(self.file_bg_color) != 3:
                raise kaitaistruct.ConsistencyError(u"file_bg_color", 3, len(self.file_bg_color))
            if len((self.originator_name).encode(u"UTF-8")) != 24:
                raise kaitaistruct.ConsistencyError(u"originator_name", 24, len((self.originator_name).encode(u"UTF-8")))
            if len((self.originator_phone).encode(u"UTF-8")) != 18:
                raise kaitaistruct.ConsistencyError(u"originator_phone", 18, len((self.originator_phone).encode(u"UTF-8")))
            if len((self.file_length).encode(u"UTF-8")) != 12:
                raise kaitaistruct.ConsistencyError(u"file_length", 12, len((self.file_length).encode(u"UTF-8")))
            if len((self.file_header_length).encode(u"UTF-8")) != 6:
                raise kaitaistruct.ConsistencyError(u"file_header_length", 6, len((self.file_header_length).encode(u"UTF-8")))
            if len((self.num_image_segments).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"num_image_segments", 3, len((self.num_image_segments).encode(u"UTF-8")))
            if len(self.linfo) != int(self.num_image_segments):
                raise kaitaistruct.ConsistencyError(u"linfo", int(self.num_image_segments), len(self.linfo))
            for i in range(len(self.linfo)):
                pass
                if self.linfo[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"linfo", self._root, self.linfo[i]._root)
                if self.linfo[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"linfo", self, self.linfo[i]._parent)

            if len((self.num_graphics_segments).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"num_graphics_segments", 3, len((self.num_graphics_segments).encode(u"UTF-8")))
            if len(self.lnnfo) != int(self.num_graphics_segments):
                raise kaitaistruct.ConsistencyError(u"lnnfo", int(self.num_graphics_segments), len(self.lnnfo))
            for i in range(len(self.lnnfo)):
                pass
                if self.lnnfo[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"lnnfo", self._root, self.lnnfo[i]._root)
                if self.lnnfo[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"lnnfo", self, self.lnnfo[i]._parent)

            if len((self.reserved_numx).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"reserved_numx", 3, len((self.reserved_numx).encode(u"UTF-8")))
            if len((self.num_text_files).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"num_text_files", 3, len((self.num_text_files).encode(u"UTF-8")))
            if len(self.ltnfo) != int(self.num_text_files):
                raise kaitaistruct.ConsistencyError(u"ltnfo", int(self.num_text_files), len(self.ltnfo))
            for i in range(len(self.ltnfo)):
                pass
                if self.ltnfo[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"ltnfo", self._root, self.ltnfo[i]._root)
                if self.ltnfo[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"ltnfo", self, self.ltnfo[i]._parent)

            if len((self.num_data_extension).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"num_data_extension", 3, len((self.num_data_extension).encode(u"UTF-8")))
            if len(self.ldnfo) != int(self.num_data_extension):
                raise kaitaistruct.ConsistencyError(u"ldnfo", int(self.num_data_extension), len(self.ldnfo))
            for i in range(len(self.ldnfo)):
                pass
                if self.ldnfo[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"ldnfo", self._root, self.ldnfo[i]._root)
                if self.ldnfo[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"ldnfo", self, self.ldnfo[i]._parent)

            if len((self.num_reserved_extension).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"num_reserved_extension", 3, len((self.num_reserved_extension).encode(u"UTF-8")))
            if len(self.lrnfo) != int(self.num_reserved_extension):
                raise kaitaistruct.ConsistencyError(u"lrnfo", int(self.num_reserved_extension), len(self.lrnfo))
            for i in range(len(self.lrnfo)):
                pass
                if self.lrnfo[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"lrnfo", self._root, self.lrnfo[i]._root)
                if self.lrnfo[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"lrnfo", self, self.lrnfo[i]._parent)

            if self.user_defined_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"user_defined_header", self._root, self.user_defined_header._root)
            if self.user_defined_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"user_defined_header", self, self.user_defined_header._parent)
            if self.extended_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"extended_header", self._root, self.extended_header._root)
            if self.extended_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"extended_header", self, self.extended_header._parent)
            self._dirty = False


    class ImageComment(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.ImageComment, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._unnamed0 = (self._io.read_bytes(80)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.ImageComment, self)._write__seq(io)
            self._io.write_bytes((self._unnamed0).encode(u"UTF-8"))


        def _check(self):
            if len((self._unnamed0).encode(u"UTF-8")) != 80:
                raise kaitaistruct.ConsistencyError(u"_unnamed0", 80, len((self._unnamed0).encode(u"UTF-8")))
            self._dirty = False


    class ImageDataMask(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.ImageDataMask, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.blocked_img_data_offset = self._io.read_u4be()
            self.bmrlnth = self._io.read_u2be()
            self.tmrlnth = self._io.read_u2be()
            self.tpxcdlnth = self._io.read_u2be()
            self.tpxcd = self._io.read_bytes(self.tpxcd_size)
            if self.has_bmr:
                pass
                self.bmrbnd = []
                for i in range(self.bmrtmr_count):
                    self.bmrbnd.append(self._io.read_u4be())


            if self.has_tmr:
                pass
                self.tmrbnd = []
                for i in range(self.bmrtmr_count):
                    self.tmrbnd.append(self._io.read_u4be())


            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_bmr:
                pass
                for i in range(len(self.bmrbnd)):
                    pass


            if self.has_tmr:
                pass
                for i in range(len(self.tmrbnd)):
                    pass




        def _write__seq(self, io=None):
            super(Nitf.ImageDataMask, self)._write__seq(io)
            self._io.write_u4be(self.blocked_img_data_offset)
            self._io.write_u2be(self.bmrlnth)
            self._io.write_u2be(self.tmrlnth)
            self._io.write_u2be(self.tpxcdlnth)
            self._io.write_bytes(self.tpxcd)
            if self.has_bmr:
                pass
                for i in range(len(self.bmrbnd)):
                    pass
                    self._io.write_u4be(self.bmrbnd[i])


            if self.has_tmr:
                pass
                for i in range(len(self.tmrbnd)):
                    pass
                    self._io.write_u4be(self.tmrbnd[i])




        def _check(self):
            if len(self.tpxcd) != self.tpxcd_size:
                raise kaitaistruct.ConsistencyError(u"tpxcd", self.tpxcd_size, len(self.tpxcd))
            if self.has_bmr:
                pass
                if len(self.bmrbnd) != self.bmrtmr_count:
                    raise kaitaistruct.ConsistencyError(u"bmrbnd", self.bmrtmr_count, len(self.bmrbnd))
                for i in range(len(self.bmrbnd)):
                    pass


            if self.has_tmr:
                pass
                if len(self.tmrbnd) != self.bmrtmr_count:
                    raise kaitaistruct.ConsistencyError(u"tmrbnd", self.bmrtmr_count, len(self.tmrbnd))
                for i in range(len(self.tmrbnd)):
                    pass


            self._dirty = False

        @property
        def bmrbnd_size(self):
            if hasattr(self, '_m_bmrbnd_size'):
                return self._m_bmrbnd_size

            self._m_bmrbnd_size = (self.bmrtmr_count * 4 if self.has_bmr else 0)
            return getattr(self, '_m_bmrbnd_size', None)

        def _invalidate_bmrbnd_size(self):
            del self._m_bmrbnd_size
        @property
        def bmrtmr_count(self):
            if hasattr(self, '_m_bmrtmr_count'):
                return self._m_bmrtmr_count

            self._m_bmrtmr_count = (int(self._parent.image_sub_header.num_blocks_per_row) * int(self._parent.image_sub_header.num_blocks_per_col)) * (1 if self._parent.image_sub_header.img_mode != u"S" else (int(self._parent.image_sub_header.num_bands) if int(self._parent.image_sub_header.num_bands) != 0 else int(self._parent.image_sub_header.num_multispectral_bands)))
            return getattr(self, '_m_bmrtmr_count', None)

        def _invalidate_bmrtmr_count(self):
            del self._m_bmrtmr_count
        @property
        def has_bmr(self):
            if hasattr(self, '_m_has_bmr'):
                return self._m_has_bmr

            self._m_has_bmr = self.bmrlnth != 0
            return getattr(self, '_m_has_bmr', None)

        def _invalidate_has_bmr(self):
            del self._m_has_bmr
        @property
        def has_tmr(self):
            if hasattr(self, '_m_has_tmr'):
                return self._m_has_tmr

            self._m_has_tmr = self.tmrlnth != 0
            return getattr(self, '_m_has_tmr', None)

        def _invalidate_has_tmr(self):
            del self._m_has_tmr
        @property
        def tmrbnd_size(self):
            if hasattr(self, '_m_tmrbnd_size'):
                return self._m_tmrbnd_size

            self._m_tmrbnd_size = (self.bmrtmr_count * 4 if self.has_tmr else 0)
            return getattr(self, '_m_tmrbnd_size', None)

        def _invalidate_tmrbnd_size(self):
            del self._m_tmrbnd_size
        @property
        def total_size(self):
            if hasattr(self, '_m_total_size'):
                return self._m_total_size

            self._m_total_size = (((((4 + 2) + 2) + 2) + self.tpxcd_size) + self.bmrbnd_size) + self.tmrbnd_size
            return getattr(self, '_m_total_size', None)

        def _invalidate_total_size(self):
            del self._m_total_size
        @property
        def tpxcd_size(self):
            if hasattr(self, '_m_tpxcd_size'):
                return self._m_tpxcd_size

            self._m_tpxcd_size = (self.tpxcdlnth if self.tpxcdlnth % 8 == 0 else self.tpxcdlnth + (8 - self.tpxcdlnth % 8)) // 8
            return getattr(self, '_m_tpxcd_size', None)

        def _invalidate_tpxcd_size(self):
            del self._m_tpxcd_size

    class ImageSegment(ReadWriteKaitaiStruct):
        def __init__(self, idx, _io=None, _parent=None, _root=None):
            super(Nitf.ImageSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx

        def _read(self):
            self.image_sub_header = Nitf.ImageSubHeader(self._io, self, self._root)
            self.image_sub_header._read()
            if self.has_mask:
                pass
                self.image_data_mask = Nitf.ImageDataMask(self._io, self, self._root)
                self.image_data_mask._read()

            if self.has_mask:
                pass
                self.image_data_field = self._io.read_bytes(int(self._parent.header.linfo[self.idx].length_image_segment) - self.image_data_mask.total_size)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.image_sub_header._fetch_instances()
            if self.has_mask:
                pass
                self.image_data_mask._fetch_instances()

            if self.has_mask:
                pass



        def _write__seq(self, io=None):
            super(Nitf.ImageSegment, self)._write__seq(io)
            self.image_sub_header._write__seq(self._io)
            if self.has_mask:
                pass
                self.image_data_mask._write__seq(self._io)

            if self.has_mask:
                pass
                self._io.write_bytes(self.image_data_field)



        def _check(self):
            if self.image_sub_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"image_sub_header", self._root, self.image_sub_header._root)
            if self.image_sub_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"image_sub_header", self, self.image_sub_header._parent)
            if self.has_mask:
                pass
                if self.image_data_mask._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"image_data_mask", self._root, self.image_data_mask._root)
                if self.image_data_mask._parent != self:
                    raise kaitaistruct.ConsistencyError(u"image_data_mask", self, self.image_data_mask._parent)

            if self.has_mask:
                pass
                if len(self.image_data_field) != int(self._parent.header.linfo[self.idx].length_image_segment) - self.image_data_mask.total_size:
                    raise kaitaistruct.ConsistencyError(u"image_data_field", int(self._parent.header.linfo[self.idx].length_image_segment) - self.image_data_mask.total_size, len(self.image_data_field))

            self._dirty = False

        @property
        def has_mask(self):
            if hasattr(self, '_m_has_mask'):
                return self._m_has_mask

            self._m_has_mask = self.image_sub_header.img_compression[0:2] == u"MM"
            return getattr(self, '_m_has_mask', None)

        def _invalidate_has_mask(self):
            del self._m_has_mask

    class ImageSubHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.ImageSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_part_type = self._io.read_bytes(2)
            if not self.file_part_type == b"\x49\x4D":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x4D", self.file_part_type, self._io, u"/types/image_sub_header/seq/0")
            self.image_id_1 = (self._io.read_bytes(10)).decode(u"UTF-8")
            self.image_date_time = Nitf.DateTime(self._io, self, self._root)
            self.image_date_time._read()
            self.target_id = (self._io.read_bytes(17)).decode(u"UTF-8")
            self.image_id_2 = (self._io.read_bytes(80)).decode(u"UTF-8")
            self.image_security_classification = Nitf.Clasnfo(self._io, self, self._root)
            self.image_security_classification._read()
            self.encryption = Nitf.Encrypt(self._io, self, self._root)
            self.encryption._read()
            self.image_source = (self._io.read_bytes(42)).decode(u"UTF-8")
            self.num_sig_rows = (self._io.read_bytes(8)).decode(u"UTF-8")
            self.num_sig_cols = (self._io.read_bytes(8)).decode(u"UTF-8")
            self.pixel_value_type = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.image_representation = (self._io.read_bytes(8)).decode(u"UTF-8")
            self.image_category = (self._io.read_bytes(8)).decode(u"UTF-8")
            self.actual_bits_per_pixel_per_band = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.pixel_justification = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.image_coordinate_rep = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.image_geo_loc = (self._io.read_bytes(60)).decode(u"UTF-8")
            self.num_img_comments = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.img_comments = []
            for i in range(int(self.num_img_comments)):
                _t_img_comments = Nitf.ImageComment(self._io, self, self._root)
                try:
                    _t_img_comments._read()
                finally:
                    self.img_comments.append(_t_img_comments)

            self.img_compression = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.compression_rate_code = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.num_bands = (self._io.read_bytes(1)).decode(u"UTF-8")
            if int(self.num_bands) == 0:
                pass
                self.num_multispectral_bands = (self._io.read_bytes(5)).decode(u"UTF-8")

            self.bands = []
            for i in range((int(self.num_bands) if int(self.num_bands) != 0 else int(self.num_multispectral_bands))):
                _t_bands = Nitf.BandInfo(self._io, self, self._root)
                try:
                    _t_bands._read()
                finally:
                    self.bands.append(_t_bands)

            self.img_sync_code = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.img_mode = (self._io.read_bytes(1)).decode(u"UTF-8")
            self.num_blocks_per_row = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.num_blocks_per_col = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.num_pixels_per_block_horz = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.num_pixels_per_block_vert = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.num_pixels_per_band = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.img_display_level = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.attachment_level = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.img_location = (self._io.read_bytes(10)).decode(u"UTF-8")
            self.img_magnification = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.user_def_img_data_len = (self._io.read_bytes(5)).decode(u"UTF-8")
            if int(self.user_def_img_data_len) != 0:
                pass
                self.user_def_overflow = (self._io.read_bytes(3)).decode(u"UTF-8")

            if int(self.user_def_img_data_len) > 2:
                pass
                self.user_def_img_data = []
                for i in range(int(self.user_def_img_data_len) - 3):
                    self.user_def_img_data.append(self._io.read_u1())


            self.image_extended_sub_header = Nitf.TreHeader(self._io, self, self._root)
            self.image_extended_sub_header._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.image_date_time._fetch_instances()
            self.image_security_classification._fetch_instances()
            self.encryption._fetch_instances()
            for i in range(len(self.img_comments)):
                pass
                self.img_comments[i]._fetch_instances()

            if int(self.num_bands) == 0:
                pass

            for i in range(len(self.bands)):
                pass
                self.bands[i]._fetch_instances()

            if int(self.user_def_img_data_len) != 0:
                pass

            if int(self.user_def_img_data_len) > 2:
                pass
                for i in range(len(self.user_def_img_data)):
                    pass


            self.image_extended_sub_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Nitf.ImageSubHeader, self)._write__seq(io)
            self._io.write_bytes(self.file_part_type)
            self._io.write_bytes((self.image_id_1).encode(u"UTF-8"))
            self.image_date_time._write__seq(self._io)
            self._io.write_bytes((self.target_id).encode(u"UTF-8"))
            self._io.write_bytes((self.image_id_2).encode(u"UTF-8"))
            self.image_security_classification._write__seq(self._io)
            self.encryption._write__seq(self._io)
            self._io.write_bytes((self.image_source).encode(u"UTF-8"))
            self._io.write_bytes((self.num_sig_rows).encode(u"UTF-8"))
            self._io.write_bytes((self.num_sig_cols).encode(u"UTF-8"))
            self._io.write_bytes((self.pixel_value_type).encode(u"UTF-8"))
            self._io.write_bytes((self.image_representation).encode(u"UTF-8"))
            self._io.write_bytes((self.image_category).encode(u"UTF-8"))
            self._io.write_bytes((self.actual_bits_per_pixel_per_band).encode(u"UTF-8"))
            self._io.write_bytes((self.pixel_justification).encode(u"UTF-8"))
            self._io.write_bytes((self.image_coordinate_rep).encode(u"UTF-8"))
            self._io.write_bytes((self.image_geo_loc).encode(u"UTF-8"))
            self._io.write_bytes((self.num_img_comments).encode(u"UTF-8"))
            for i in range(len(self.img_comments)):
                pass
                self.img_comments[i]._write__seq(self._io)

            self._io.write_bytes((self.img_compression).encode(u"UTF-8"))
            self._io.write_bytes((self.compression_rate_code).encode(u"UTF-8"))
            self._io.write_bytes((self.num_bands).encode(u"UTF-8"))
            if int(self.num_bands) == 0:
                pass
                self._io.write_bytes((self.num_multispectral_bands).encode(u"UTF-8"))

            for i in range(len(self.bands)):
                pass
                self.bands[i]._write__seq(self._io)

            self._io.write_bytes((self.img_sync_code).encode(u"UTF-8"))
            self._io.write_bytes((self.img_mode).encode(u"UTF-8"))
            self._io.write_bytes((self.num_blocks_per_row).encode(u"UTF-8"))
            self._io.write_bytes((self.num_blocks_per_col).encode(u"UTF-8"))
            self._io.write_bytes((self.num_pixels_per_block_horz).encode(u"UTF-8"))
            self._io.write_bytes((self.num_pixels_per_block_vert).encode(u"UTF-8"))
            self._io.write_bytes((self.num_pixels_per_band).encode(u"UTF-8"))
            self._io.write_bytes((self.img_display_level).encode(u"UTF-8"))
            self._io.write_bytes((self.attachment_level).encode(u"UTF-8"))
            self._io.write_bytes((self.img_location).encode(u"UTF-8"))
            self._io.write_bytes((self.img_magnification).encode(u"UTF-8"))
            self._io.write_bytes((self.user_def_img_data_len).encode(u"UTF-8"))
            if int(self.user_def_img_data_len) != 0:
                pass
                self._io.write_bytes((self.user_def_overflow).encode(u"UTF-8"))

            if int(self.user_def_img_data_len) > 2:
                pass
                for i in range(len(self.user_def_img_data)):
                    pass
                    self._io.write_u1(self.user_def_img_data[i])


            self.image_extended_sub_header._write__seq(self._io)


        def _check(self):
            if len(self.file_part_type) != 2:
                raise kaitaistruct.ConsistencyError(u"file_part_type", 2, len(self.file_part_type))
            if not self.file_part_type == b"\x49\x4D":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x4D", self.file_part_type, None, u"/types/image_sub_header/seq/0")
            if len((self.image_id_1).encode(u"UTF-8")) != 10:
                raise kaitaistruct.ConsistencyError(u"image_id_1", 10, len((self.image_id_1).encode(u"UTF-8")))
            if self.image_date_time._root != self._root:
                raise kaitaistruct.ConsistencyError(u"image_date_time", self._root, self.image_date_time._root)
            if self.image_date_time._parent != self:
                raise kaitaistruct.ConsistencyError(u"image_date_time", self, self.image_date_time._parent)
            if len((self.target_id).encode(u"UTF-8")) != 17:
                raise kaitaistruct.ConsistencyError(u"target_id", 17, len((self.target_id).encode(u"UTF-8")))
            if len((self.image_id_2).encode(u"UTF-8")) != 80:
                raise kaitaistruct.ConsistencyError(u"image_id_2", 80, len((self.image_id_2).encode(u"UTF-8")))
            if self.image_security_classification._root != self._root:
                raise kaitaistruct.ConsistencyError(u"image_security_classification", self._root, self.image_security_classification._root)
            if self.image_security_classification._parent != self:
                raise kaitaistruct.ConsistencyError(u"image_security_classification", self, self.image_security_classification._parent)
            if self.encryption._root != self._root:
                raise kaitaistruct.ConsistencyError(u"encryption", self._root, self.encryption._root)
            if self.encryption._parent != self:
                raise kaitaistruct.ConsistencyError(u"encryption", self, self.encryption._parent)
            if len((self.image_source).encode(u"UTF-8")) != 42:
                raise kaitaistruct.ConsistencyError(u"image_source", 42, len((self.image_source).encode(u"UTF-8")))
            if len((self.num_sig_rows).encode(u"UTF-8")) != 8:
                raise kaitaistruct.ConsistencyError(u"num_sig_rows", 8, len((self.num_sig_rows).encode(u"UTF-8")))
            if len((self.num_sig_cols).encode(u"UTF-8")) != 8:
                raise kaitaistruct.ConsistencyError(u"num_sig_cols", 8, len((self.num_sig_cols).encode(u"UTF-8")))
            if len((self.pixel_value_type).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"pixel_value_type", 3, len((self.pixel_value_type).encode(u"UTF-8")))
            if len((self.image_representation).encode(u"UTF-8")) != 8:
                raise kaitaistruct.ConsistencyError(u"image_representation", 8, len((self.image_representation).encode(u"UTF-8")))
            if len((self.image_category).encode(u"UTF-8")) != 8:
                raise kaitaistruct.ConsistencyError(u"image_category", 8, len((self.image_category).encode(u"UTF-8")))
            if len((self.actual_bits_per_pixel_per_band).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"actual_bits_per_pixel_per_band", 2, len((self.actual_bits_per_pixel_per_band).encode(u"UTF-8")))
            if len((self.pixel_justification).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"pixel_justification", 1, len((self.pixel_justification).encode(u"UTF-8")))
            if len((self.image_coordinate_rep).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"image_coordinate_rep", 1, len((self.image_coordinate_rep).encode(u"UTF-8")))
            if len((self.image_geo_loc).encode(u"UTF-8")) != 60:
                raise kaitaistruct.ConsistencyError(u"image_geo_loc", 60, len((self.image_geo_loc).encode(u"UTF-8")))
            if len((self.num_img_comments).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"num_img_comments", 1, len((self.num_img_comments).encode(u"UTF-8")))
            if len(self.img_comments) != int(self.num_img_comments):
                raise kaitaistruct.ConsistencyError(u"img_comments", int(self.num_img_comments), len(self.img_comments))
            for i in range(len(self.img_comments)):
                pass
                if self.img_comments[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"img_comments", self._root, self.img_comments[i]._root)
                if self.img_comments[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"img_comments", self, self.img_comments[i]._parent)

            if len((self.img_compression).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"img_compression", 2, len((self.img_compression).encode(u"UTF-8")))
            if len((self.compression_rate_code).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"compression_rate_code", 4, len((self.compression_rate_code).encode(u"UTF-8")))
            if len((self.num_bands).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"num_bands", 1, len((self.num_bands).encode(u"UTF-8")))
            if int(self.num_bands) == 0:
                pass
                if len((self.num_multispectral_bands).encode(u"UTF-8")) != 5:
                    raise kaitaistruct.ConsistencyError(u"num_multispectral_bands", 5, len((self.num_multispectral_bands).encode(u"UTF-8")))

            if len(self.bands) != (int(self.num_bands) if int(self.num_bands) != 0 else int(self.num_multispectral_bands)):
                raise kaitaistruct.ConsistencyError(u"bands", (int(self.num_bands) if int(self.num_bands) != 0 else int(self.num_multispectral_bands)), len(self.bands))
            for i in range(len(self.bands)):
                pass
                if self.bands[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bands", self._root, self.bands[i]._root)
                if self.bands[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bands", self, self.bands[i]._parent)

            if len((self.img_sync_code).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"img_sync_code", 1, len((self.img_sync_code).encode(u"UTF-8")))
            if len((self.img_mode).encode(u"UTF-8")) != 1:
                raise kaitaistruct.ConsistencyError(u"img_mode", 1, len((self.img_mode).encode(u"UTF-8")))
            if len((self.num_blocks_per_row).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"num_blocks_per_row", 4, len((self.num_blocks_per_row).encode(u"UTF-8")))
            if len((self.num_blocks_per_col).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"num_blocks_per_col", 4, len((self.num_blocks_per_col).encode(u"UTF-8")))
            if len((self.num_pixels_per_block_horz).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"num_pixels_per_block_horz", 4, len((self.num_pixels_per_block_horz).encode(u"UTF-8")))
            if len((self.num_pixels_per_block_vert).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"num_pixels_per_block_vert", 4, len((self.num_pixels_per_block_vert).encode(u"UTF-8")))
            if len((self.num_pixels_per_band).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"num_pixels_per_band", 2, len((self.num_pixels_per_band).encode(u"UTF-8")))
            if len((self.img_display_level).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"img_display_level", 3, len((self.img_display_level).encode(u"UTF-8")))
            if len((self.attachment_level).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"attachment_level", 3, len((self.attachment_level).encode(u"UTF-8")))
            if len((self.img_location).encode(u"UTF-8")) != 10:
                raise kaitaistruct.ConsistencyError(u"img_location", 10, len((self.img_location).encode(u"UTF-8")))
            if len((self.img_magnification).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"img_magnification", 4, len((self.img_magnification).encode(u"UTF-8")))
            if len((self.user_def_img_data_len).encode(u"UTF-8")) != 5:
                raise kaitaistruct.ConsistencyError(u"user_def_img_data_len", 5, len((self.user_def_img_data_len).encode(u"UTF-8")))
            if int(self.user_def_img_data_len) != 0:
                pass
                if len((self.user_def_overflow).encode(u"UTF-8")) != 3:
                    raise kaitaistruct.ConsistencyError(u"user_def_overflow", 3, len((self.user_def_overflow).encode(u"UTF-8")))

            if int(self.user_def_img_data_len) > 2:
                pass
                if len(self.user_def_img_data) != int(self.user_def_img_data_len) - 3:
                    raise kaitaistruct.ConsistencyError(u"user_def_img_data", int(self.user_def_img_data_len) - 3, len(self.user_def_img_data))
                for i in range(len(self.user_def_img_data)):
                    pass


            if self.image_extended_sub_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"image_extended_sub_header", self._root, self.image_extended_sub_header._root)
            if self.image_extended_sub_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"image_extended_sub_header", self, self.image_extended_sub_header._parent)
            self._dirty = False


    class LengthDataInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.LengthDataInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length_data_extension_subheader = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.length_data_extension_segment = (self._io.read_bytes(9)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.LengthDataInfo, self)._write__seq(io)
            self._io.write_bytes((self.length_data_extension_subheader).encode(u"UTF-8"))
            self._io.write_bytes((self.length_data_extension_segment).encode(u"UTF-8"))


        def _check(self):
            if len((self.length_data_extension_subheader).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"length_data_extension_subheader", 4, len((self.length_data_extension_subheader).encode(u"UTF-8")))
            if len((self.length_data_extension_segment).encode(u"UTF-8")) != 9:
                raise kaitaistruct.ConsistencyError(u"length_data_extension_segment", 9, len((self.length_data_extension_segment).encode(u"UTF-8")))
            self._dirty = False


    class LengthGraphicInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.LengthGraphicInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length_graphic_subheader = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.length_graphic_segment = (self._io.read_bytes(6)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.LengthGraphicInfo, self)._write__seq(io)
            self._io.write_bytes((self.length_graphic_subheader).encode(u"UTF-8"))
            self._io.write_bytes((self.length_graphic_segment).encode(u"UTF-8"))


        def _check(self):
            if len((self.length_graphic_subheader).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"length_graphic_subheader", 4, len((self.length_graphic_subheader).encode(u"UTF-8")))
            if len((self.length_graphic_segment).encode(u"UTF-8")) != 6:
                raise kaitaistruct.ConsistencyError(u"length_graphic_segment", 6, len((self.length_graphic_segment).encode(u"UTF-8")))
            self._dirty = False


    class LengthImageInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.LengthImageInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length_image_subheader = (self._io.read_bytes(6)).decode(u"UTF-8")
            self.length_image_segment = (self._io.read_bytes(10)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.LengthImageInfo, self)._write__seq(io)
            self._io.write_bytes((self.length_image_subheader).encode(u"UTF-8"))
            self._io.write_bytes((self.length_image_segment).encode(u"UTF-8"))


        def _check(self):
            if len((self.length_image_subheader).encode(u"UTF-8")) != 6:
                raise kaitaistruct.ConsistencyError(u"length_image_subheader", 6, len((self.length_image_subheader).encode(u"UTF-8")))
            if len((self.length_image_segment).encode(u"UTF-8")) != 10:
                raise kaitaistruct.ConsistencyError(u"length_image_segment", 10, len((self.length_image_segment).encode(u"UTF-8")))
            self._dirty = False


    class LengthReservedInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.LengthReservedInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length_reserved_extension_subheader = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.length_reserved_extension_segment = (self._io.read_bytes(7)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.LengthReservedInfo, self)._write__seq(io)
            self._io.write_bytes((self.length_reserved_extension_subheader).encode(u"UTF-8"))
            self._io.write_bytes((self.length_reserved_extension_segment).encode(u"UTF-8"))


        def _check(self):
            if len((self.length_reserved_extension_subheader).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"length_reserved_extension_subheader", 4, len((self.length_reserved_extension_subheader).encode(u"UTF-8")))
            if len((self.length_reserved_extension_segment).encode(u"UTF-8")) != 7:
                raise kaitaistruct.ConsistencyError(u"length_reserved_extension_segment", 7, len((self.length_reserved_extension_segment).encode(u"UTF-8")))
            self._dirty = False


    class LengthTextInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.LengthTextInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length_text_subheader = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.length_text_segment = (self._io.read_bytes(5)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.LengthTextInfo, self)._write__seq(io)
            self._io.write_bytes((self.length_text_subheader).encode(u"UTF-8"))
            self._io.write_bytes((self.length_text_segment).encode(u"UTF-8"))


        def _check(self):
            if len((self.length_text_subheader).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"length_text_subheader", 4, len((self.length_text_subheader).encode(u"UTF-8")))
            if len((self.length_text_segment).encode(u"UTF-8")) != 5:
                raise kaitaistruct.ConsistencyError(u"length_text_segment", 5, len((self.length_text_segment).encode(u"UTF-8")))
            self._dirty = False


    class ReservedExtensionSegment(ReadWriteKaitaiStruct):
        def __init__(self, idx, _io=None, _parent=None, _root=None):
            super(Nitf.ReservedExtensionSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx

        def _read(self):
            self._raw_reserved_sub_header = self._io.read_bytes(int(self._parent.header.lrnfo[self.idx].length_reserved_extension_subheader))
            _io__raw_reserved_sub_header = KaitaiStream(BytesIO(self._raw_reserved_sub_header))
            self.reserved_sub_header = Nitf.ReservedSubHeader(_io__raw_reserved_sub_header, self, self._root)
            self.reserved_sub_header._read()
            self.reserved_data_field = self._io.read_bytes(int(self._parent.header.lrnfo[self.idx].length_reserved_extension_segment))
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.reserved_sub_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Nitf.ReservedExtensionSegment, self)._write__seq(io)
            _io__raw_reserved_sub_header = KaitaiStream(BytesIO(bytearray(int(self._parent.header.lrnfo[self.idx].length_reserved_extension_subheader))))
            self._io.add_child_stream(_io__raw_reserved_sub_header)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (int(self._parent.header.lrnfo[self.idx].length_reserved_extension_subheader)))
            def handler(parent, _io__raw_reserved_sub_header=_io__raw_reserved_sub_header):
                self._raw_reserved_sub_header = _io__raw_reserved_sub_header.to_byte_array()
                if len(self._raw_reserved_sub_header) != int(self._parent.header.lrnfo[self.idx].length_reserved_extension_subheader):
                    raise kaitaistruct.ConsistencyError(u"raw(reserved_sub_header)", int(self._parent.header.lrnfo[self.idx].length_reserved_extension_subheader), len(self._raw_reserved_sub_header))
                parent.write_bytes(self._raw_reserved_sub_header)
            _io__raw_reserved_sub_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.reserved_sub_header._write__seq(_io__raw_reserved_sub_header)
            self._io.write_bytes(self.reserved_data_field)


        def _check(self):
            if self.reserved_sub_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"reserved_sub_header", self._root, self.reserved_sub_header._root)
            if self.reserved_sub_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"reserved_sub_header", self, self.reserved_sub_header._parent)
            if len(self.reserved_data_field) != int(self._parent.header.lrnfo[self.idx].length_reserved_extension_segment):
                raise kaitaistruct.ConsistencyError(u"reserved_data_field", int(self._parent.header.lrnfo[self.idx].length_reserved_extension_segment), len(self.reserved_data_field))
            self._dirty = False


    class ReservedSubHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.ReservedSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_part_type_re = self._io.read_bytes(2)
            if not self.file_part_type_re == b"\x52\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x52\x45", self.file_part_type_re, self._io, u"/types/reserved_sub_header/seq/0")
            self.res_type_id = (self._io.read_bytes(25)).decode(u"UTF-8")
            self.res_version = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.reclasnfo = Nitf.Clasnfo(self._io, self, self._root)
            self.reclasnfo._read()
            self.res_user_defined_subheader_length = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.res_user_defined_subheader_fields = (self._io.read_bytes(int(self.res_user_defined_subheader_length))).decode(u"UTF-8")
            self.res_user_defined_data = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.reclasnfo._fetch_instances()


        def _write__seq(self, io=None):
            super(Nitf.ReservedSubHeader, self)._write__seq(io)
            self._io.write_bytes(self.file_part_type_re)
            self._io.write_bytes((self.res_type_id).encode(u"UTF-8"))
            self._io.write_bytes((self.res_version).encode(u"UTF-8"))
            self.reclasnfo._write__seq(self._io)
            self._io.write_bytes((self.res_user_defined_subheader_length).encode(u"UTF-8"))
            self._io.write_bytes((self.res_user_defined_subheader_fields).encode(u"UTF-8"))
            self._io.write_bytes((self.res_user_defined_data).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"res_user_defined_data", 0, self._io.size() - self._io.pos())


        def _check(self):
            if len(self.file_part_type_re) != 2:
                raise kaitaistruct.ConsistencyError(u"file_part_type_re", 2, len(self.file_part_type_re))
            if not self.file_part_type_re == b"\x52\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x52\x45", self.file_part_type_re, None, u"/types/reserved_sub_header/seq/0")
            if len((self.res_type_id).encode(u"UTF-8")) != 25:
                raise kaitaistruct.ConsistencyError(u"res_type_id", 25, len((self.res_type_id).encode(u"UTF-8")))
            if len((self.res_version).encode(u"UTF-8")) != 2:
                raise kaitaistruct.ConsistencyError(u"res_version", 2, len((self.res_version).encode(u"UTF-8")))
            if self.reclasnfo._root != self._root:
                raise kaitaistruct.ConsistencyError(u"reclasnfo", self._root, self.reclasnfo._root)
            if self.reclasnfo._parent != self:
                raise kaitaistruct.ConsistencyError(u"reclasnfo", self, self.reclasnfo._parent)
            if len((self.res_user_defined_subheader_length).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"res_user_defined_subheader_length", 4, len((self.res_user_defined_subheader_length).encode(u"UTF-8")))
            if len((self.res_user_defined_subheader_fields).encode(u"UTF-8")) != int(self.res_user_defined_subheader_length):
                raise kaitaistruct.ConsistencyError(u"res_user_defined_subheader_fields", int(self.res_user_defined_subheader_length), len((self.res_user_defined_subheader_fields).encode(u"UTF-8")))
            self._dirty = False


    class TextSegment(ReadWriteKaitaiStruct):
        def __init__(self, idx, _io=None, _parent=None, _root=None):
            super(Nitf.TextSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx

        def _read(self):
            self.text_sub_header = self._io.read_bytes(1)
            self.text_data_field = self._io.read_bytes(int(self._parent.header.ltnfo[self.idx].length_text_segment))
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.TextSegment, self)._write__seq(io)
            self._io.write_bytes(self.text_sub_header)
            self._io.write_bytes(self.text_data_field)


        def _check(self):
            if len(self.text_sub_header) != 1:
                raise kaitaistruct.ConsistencyError(u"text_sub_header", 1, len(self.text_sub_header))
            if len(self.text_data_field) != int(self._parent.header.ltnfo[self.idx].length_text_segment):
                raise kaitaistruct.ConsistencyError(u"text_data_field", int(self._parent.header.ltnfo[self.idx].length_text_segment), len(self.text_data_field))
            self._dirty = False


    class TextSubHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.TextSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.text_date_time = (self._io.read_bytes(14)).decode(u"UTF-8")
            self.text_title = (self._io.read_bytes(80)).decode(u"UTF-8")
            self.text_security_class = Nitf.Clasnfo(self._io, self, self._root)
            self.text_security_class._read()
            self.encryp = Nitf.Encrypt(self._io, self, self._root)
            self.encryp._read()
            self.text_format = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.text_extended_sub_header = Nitf.TreHeader(self._io, self, self._root)
            self.text_extended_sub_header._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.text_security_class._fetch_instances()
            self.encryp._fetch_instances()
            self.text_extended_sub_header._fetch_instances()


        def _write__seq(self, io=None):
            super(Nitf.TextSubHeader, self)._write__seq(io)
            self._io.write_bytes((self.text_date_time).encode(u"UTF-8"))
            self._io.write_bytes((self.text_title).encode(u"UTF-8"))
            self.text_security_class._write__seq(self._io)
            self.encryp._write__seq(self._io)
            self._io.write_bytes((self.text_format).encode(u"UTF-8"))
            self.text_extended_sub_header._write__seq(self._io)


        def _check(self):
            if len((self.text_date_time).encode(u"UTF-8")) != 14:
                raise kaitaistruct.ConsistencyError(u"text_date_time", 14, len((self.text_date_time).encode(u"UTF-8")))
            if len((self.text_title).encode(u"UTF-8")) != 80:
                raise kaitaistruct.ConsistencyError(u"text_title", 80, len((self.text_title).encode(u"UTF-8")))
            if self.text_security_class._root != self._root:
                raise kaitaistruct.ConsistencyError(u"text_security_class", self._root, self.text_security_class._root)
            if self.text_security_class._parent != self:
                raise kaitaistruct.ConsistencyError(u"text_security_class", self, self.text_security_class._parent)
            if self.encryp._root != self._root:
                raise kaitaistruct.ConsistencyError(u"encryp", self._root, self.encryp._root)
            if self.encryp._parent != self:
                raise kaitaistruct.ConsistencyError(u"encryp", self, self.encryp._parent)
            if len((self.text_format).encode(u"UTF-8")) != 3:
                raise kaitaistruct.ConsistencyError(u"text_format", 3, len((self.text_format).encode(u"UTF-8")))
            if self.text_extended_sub_header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"text_extended_sub_header", self._root, self.text_extended_sub_header._root)
            if self.text_extended_sub_header._parent != self:
                raise kaitaistruct.ConsistencyError(u"text_extended_sub_header", self, self.text_extended_sub_header._parent)
            self._dirty = False


    class Tre(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.Tre, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.extension_type_id = (self._io.read_bytes(6)).decode(u"UTF-8")
            self.edata_length = (self._io.read_bytes(5)).decode(u"UTF-8")
            self.edata = (self._io.read_bytes(int(self.edata_length))).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Nitf.Tre, self)._write__seq(io)
            self._io.write_bytes((self.extension_type_id).encode(u"UTF-8"))
            self._io.write_bytes((self.edata_length).encode(u"UTF-8"))
            self._io.write_bytes((self.edata).encode(u"UTF-8"))


        def _check(self):
            if len((self.extension_type_id).encode(u"UTF-8")) != 6:
                raise kaitaistruct.ConsistencyError(u"extension_type_id", 6, len((self.extension_type_id).encode(u"UTF-8")))
            if len((self.edata_length).encode(u"UTF-8")) != 5:
                raise kaitaistruct.ConsistencyError(u"edata_length", 5, len((self.edata_length).encode(u"UTF-8")))
            if len((self.edata).encode(u"UTF-8")) != int(self.edata_length):
                raise kaitaistruct.ConsistencyError(u"edata", int(self.edata_length), len((self.edata).encode(u"UTF-8")))
            self._dirty = False


    class TreHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Nitf.TreHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header_data_length = (self._io.read_bytes(5)).decode(u"UTF-8")
            if int(self.header_data_length) != 0:
                pass
                self.header_overflow = (self._io.read_bytes(3)).decode(u"UTF-8")

            if int(self.header_data_length) > 2:
                pass
                self.header_data = []
                for i in range(int(self.header_data_length) - 3):
                    self.header_data.append(self._io.read_u1())


            self._dirty = False


        def _fetch_instances(self):
            pass
            if int(self.header_data_length) != 0:
                pass

            if int(self.header_data_length) > 2:
                pass
                for i in range(len(self.header_data)):
                    pass




        def _write__seq(self, io=None):
            super(Nitf.TreHeader, self)._write__seq(io)
            self._io.write_bytes((self.header_data_length).encode(u"UTF-8"))
            if int(self.header_data_length) != 0:
                pass
                self._io.write_bytes((self.header_overflow).encode(u"UTF-8"))

            if int(self.header_data_length) > 2:
                pass
                for i in range(len(self.header_data)):
                    pass
                    self._io.write_u1(self.header_data[i])




        def _check(self):
            if len((self.header_data_length).encode(u"UTF-8")) != 5:
                raise kaitaistruct.ConsistencyError(u"header_data_length", 5, len((self.header_data_length).encode(u"UTF-8")))
            if int(self.header_data_length) != 0:
                pass
                if len((self.header_overflow).encode(u"UTF-8")) != 3:
                    raise kaitaistruct.ConsistencyError(u"header_overflow", 3, len((self.header_overflow).encode(u"UTF-8")))

            if int(self.header_data_length) > 2:
                pass
                if len(self.header_data) != int(self.header_data_length) - 3:
                    raise kaitaistruct.ConsistencyError(u"header_data", int(self.header_data_length) - 3, len(self.header_data))
                for i in range(len(self.header_data)):
                    pass


            self._dirty = False



