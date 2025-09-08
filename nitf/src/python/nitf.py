# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Nitf(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(Nitf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = Nitf.Header(self._io, self, self._root)
        self.image_segments = []
        for i in range(int(self.header.num_image_segments)):
            self.image_segments.append(Nitf.ImageSegment(i, self._io, self, self._root))

        self.graphics_segments = []
        for i in range(int(self.header.num_graphics_segments)):
            self.graphics_segments.append(Nitf.GraphicsSegment(i, self._io, self, self._root))

        self.text_segments = []
        for i in range(int(self.header.num_text_files)):
            self.text_segments.append(Nitf.TextSegment(i, self._io, self, self._root))

        self.data_extension_segments = []
        for i in range(int(self.header.num_data_extension)):
            self.data_extension_segments.append(Nitf.DataExtensionSegment(i, self._io, self, self._root))

        self.reserved_extension_segments = []
        for i in range(int(self.header.num_reserved_extension)):
            self.reserved_extension_segments.append(Nitf.ReservedExtensionSegment(i, self._io, self, self._root))



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


    class BandInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.BandInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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



        def _fetch_instances(self):
            pass
            if int(self.num_luts) != 0:
                pass

            for i in range(len(self.luts)):
                pass



    class Clasnfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.Clasnfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass


    class DataExtensionSegment(KaitaiStruct):
        def __init__(self, idx, _io, _parent=None, _root=None):
            super(Nitf.DataExtensionSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self._read()

        def _read(self):
            self._raw_data_sub_header = self._io.read_bytes(int(self._parent.header.ldnfo[self.idx].length_data_extension_subheader))
            _io__raw_data_sub_header = KaitaiStream(BytesIO(self._raw_data_sub_header))
            self.data_sub_header = Nitf.DataSubHeader(_io__raw_data_sub_header, self, self._root)
            self.data_data_field = self._io.read_bytes(int(self._parent.header.ldnfo[self.idx].length_data_extension_segment))


        def _fetch_instances(self):
            pass
            self.data_sub_header._fetch_instances()


    class DataSubHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.DataSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.des_base = Nitf.DataSubHeaderBase(self._io, self, self._root)
            if self.tre_ofl:
                pass
                self.overflowed_header_type = (self._io.read_bytes(6)).decode(u"UTF-8")

            if self.tre_ofl:
                pass
                self.data_item_overflowed = (self._io.read_bytes(3)).decode(u"UTF-8")

            self.des_defined_subheader_fields_len = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.desshf = (self._io.read_bytes(int(self.des_defined_subheader_fields_len))).decode(u"UTF-8")
            self.des_defined_data_field = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass
            self.des_base._fetch_instances()
            if self.tre_ofl:
                pass

            if self.tre_ofl:
                pass


        @property
        def tre_ofl(self):
            if hasattr(self, '_m_tre_ofl'):
                return self._m_tre_ofl

            self._m_tre_ofl = self.des_base.desid == u"TRE_OVERFLOW"
            return getattr(self, '_m_tre_ofl', None)


    class DataSubHeaderBase(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.DataSubHeaderBase, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.file_part_type_de = self._io.read_bytes(2)
            if not self.file_part_type_de == b"\x44\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x44\x45", self.file_part_type_de, self._io, u"/types/data_sub_header_base/seq/0")
            self.desid = (self._io.read_bytes(25)).decode(u"UTF-8")
            self.data_definition_version = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.declasnfo = Nitf.Clasnfo(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.declasnfo._fetch_instances()


    class DataSubHeaderStreaming(KaitaiStruct):
        """Streaming file Header Data Extension Segment Subheader."""
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.DataSubHeaderStreaming, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.des_base = Nitf.DataSubHeaderBase(self._io, self, self._root)
            self.des_defined_subheader_fields_len = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.sfh_l1 = (self._io.read_bytes(7)).decode(u"UTF-8")
            self.sfh_delim1 = self._io.read_u4be()
            self.sfh_dr = []
            for i in range(int(self.sfh_l1)):
                self.sfh_dr.append(self._io.read_u1())

            self.sfh_delim2 = self._io.read_u4be()
            self.sfh_l2 = (self._io.read_bytes(7)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass
            self.des_base._fetch_instances()
            for i in range(len(self.sfh_dr)):
                pass



    class DataSubHeaderTre(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.DataSubHeaderTre, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.des_base = Nitf.DataSubHeaderBase(self._io, self, self._root)
            if self.des_base.desid == u"TRE_OVERFLOW":
                pass
                self.overflowed_header_type = (self._io.read_bytes(6)).decode(u"UTF-8")

            if self.des_base.desid == u"TRE_OVERFLOW":
                pass
                self.data_item_overflowed = (self._io.read_bytes(3)).decode(u"UTF-8")

            self.des_defined_subheader_fields_len = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.des_defined_data_field = (self._io.read_bytes(int(self.des_defined_subheader_fields_len))).decode(u"UTF-8")


        def _fetch_instances(self):
            pass
            self.des_base._fetch_instances()
            if self.des_base.desid == u"TRE_OVERFLOW":
                pass

            if self.des_base.desid == u"TRE_OVERFLOW":
                pass



    class DateTime(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.DateTime, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self._unnamed0 = (self._io.read_bytes(14)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class Encrypt(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.Encrypt, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self._unnamed0 = (self._io.read_bytes(1)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class GraphicSubHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.GraphicSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.file_part_type_sy = self._io.read_bytes(2)
            if not self.file_part_type_sy == b"\x53\x59":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\x59", self.file_part_type_sy, self._io, u"/types/graphic_sub_header/seq/0")
            self.graphic_id = (self._io.read_bytes(10)).decode(u"UTF-8")
            self.graphic_name = (self._io.read_bytes(20)).decode(u"UTF-8")
            self.graphic_classification = Nitf.Clasnfo(self._io, self, self._root)
            self.encryption = Nitf.Encrypt(self._io, self, self._root)
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


        def _fetch_instances(self):
            pass
            self.graphic_classification._fetch_instances()
            self.encryption._fetch_instances()
            self.graphics_extended_sub_header._fetch_instances()


    class GraphicsSegment(KaitaiStruct):
        def __init__(self, idx, _io, _parent=None, _root=None):
            super(Nitf.GraphicsSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self._read()

        def _read(self):
            self.graphic_sub_header = Nitf.GraphicSubHeader(self._io, self, self._root)
            self.graphic_data_field = self._io.read_bytes(int(self._parent.header.lnnfo[self.idx].length_graphic_segment))


        def _fetch_instances(self):
            pass
            self.graphic_sub_header._fetch_instances()


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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
            self.file_title = (self._io.read_bytes(80)).decode(u"UTF-8")
            self.file_security = Nitf.Clasnfo(self._io, self, self._root)
            self.file_copy_number = (self._io.read_bytes(5)).decode(u"UTF-8")
            self.file_num_of_copys = (self._io.read_bytes(5)).decode(u"UTF-8")
            self.encryption = Nitf.Encrypt(self._io, self, self._root)
            self.file_bg_color = self._io.read_bytes(3)
            self.originator_name = (self._io.read_bytes(24)).decode(u"UTF-8")
            self.originator_phone = (self._io.read_bytes(18)).decode(u"UTF-8")
            self.file_length = (self._io.read_bytes(12)).decode(u"UTF-8")
            self.file_header_length = (self._io.read_bytes(6)).decode(u"UTF-8")
            self.num_image_segments = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.linfo = []
            for i in range(int(self.num_image_segments)):
                self.linfo.append(Nitf.LengthImageInfo(self._io, self, self._root))

            self.num_graphics_segments = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.lnnfo = []
            for i in range(int(self.num_graphics_segments)):
                self.lnnfo.append(Nitf.LengthGraphicInfo(self._io, self, self._root))

            self.reserved_numx = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.num_text_files = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.ltnfo = []
            for i in range(int(self.num_text_files)):
                self.ltnfo.append(Nitf.LengthTextInfo(self._io, self, self._root))

            self.num_data_extension = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.ldnfo = []
            for i in range(int(self.num_data_extension)):
                self.ldnfo.append(Nitf.LengthDataInfo(self._io, self, self._root))

            self.num_reserved_extension = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.lrnfo = []
            for i in range(int(self.num_reserved_extension)):
                self.lrnfo.append(Nitf.LengthReservedInfo(self._io, self, self._root))

            self.user_defined_header = Nitf.TreHeader(self._io, self, self._root)
            self.extended_header = Nitf.TreHeader(self._io, self, self._root)


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


    class ImageComment(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.ImageComment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self._unnamed0 = (self._io.read_bytes(80)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class ImageDataMask(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.ImageDataMask, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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



        @property
        def bmrbnd_size(self):
            if hasattr(self, '_m_bmrbnd_size'):
                return self._m_bmrbnd_size

            self._m_bmrbnd_size = (self.bmrtmr_count * 4 if self.has_bmr else 0)
            return getattr(self, '_m_bmrbnd_size', None)

        @property
        def bmrtmr_count(self):
            if hasattr(self, '_m_bmrtmr_count'):
                return self._m_bmrtmr_count

            self._m_bmrtmr_count = (int(self._parent.image_sub_header.num_blocks_per_row) * int(self._parent.image_sub_header.num_blocks_per_col)) * (1 if self._parent.image_sub_header.img_mode != u"S" else (int(self._parent.image_sub_header.num_bands) if int(self._parent.image_sub_header.num_bands) != 0 else int(self._parent.image_sub_header.num_multispectral_bands)))
            return getattr(self, '_m_bmrtmr_count', None)

        @property
        def has_bmr(self):
            if hasattr(self, '_m_has_bmr'):
                return self._m_has_bmr

            self._m_has_bmr = self.bmrlnth != 0
            return getattr(self, '_m_has_bmr', None)

        @property
        def has_tmr(self):
            if hasattr(self, '_m_has_tmr'):
                return self._m_has_tmr

            self._m_has_tmr = self.tmrlnth != 0
            return getattr(self, '_m_has_tmr', None)

        @property
        def tmrbnd_size(self):
            if hasattr(self, '_m_tmrbnd_size'):
                return self._m_tmrbnd_size

            self._m_tmrbnd_size = (self.bmrtmr_count * 4 if self.has_tmr else 0)
            return getattr(self, '_m_tmrbnd_size', None)

        @property
        def total_size(self):
            if hasattr(self, '_m_total_size'):
                return self._m_total_size

            self._m_total_size = (((((4 + 2) + 2) + 2) + self.tpxcd_size) + self.bmrbnd_size) + self.tmrbnd_size
            return getattr(self, '_m_total_size', None)

        @property
        def tpxcd_size(self):
            if hasattr(self, '_m_tpxcd_size'):
                return self._m_tpxcd_size

            self._m_tpxcd_size = (self.tpxcdlnth if self.tpxcdlnth % 8 == 0 else self.tpxcdlnth + (8 - self.tpxcdlnth % 8)) // 8
            return getattr(self, '_m_tpxcd_size', None)


    class ImageSegment(KaitaiStruct):
        def __init__(self, idx, _io, _parent=None, _root=None):
            super(Nitf.ImageSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self._read()

        def _read(self):
            self.image_sub_header = Nitf.ImageSubHeader(self._io, self, self._root)
            if self.has_mask:
                pass
                self.image_data_mask = Nitf.ImageDataMask(self._io, self, self._root)

            if self.has_mask:
                pass
                self.image_data_field = self._io.read_bytes(int(self._parent.header.linfo[self.idx].length_image_segment) - self.image_data_mask.total_size)



        def _fetch_instances(self):
            pass
            self.image_sub_header._fetch_instances()
            if self.has_mask:
                pass
                self.image_data_mask._fetch_instances()

            if self.has_mask:
                pass


        @property
        def has_mask(self):
            if hasattr(self, '_m_has_mask'):
                return self._m_has_mask

            self._m_has_mask = self.image_sub_header.img_compression[0:2] == u"MM"
            return getattr(self, '_m_has_mask', None)


    class ImageSubHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.ImageSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.file_part_type = self._io.read_bytes(2)
            if not self.file_part_type == b"\x49\x4D":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x4D", self.file_part_type, self._io, u"/types/image_sub_header/seq/0")
            self.image_id_1 = (self._io.read_bytes(10)).decode(u"UTF-8")
            self.image_date_time = Nitf.DateTime(self._io, self, self._root)
            self.target_id = (self._io.read_bytes(17)).decode(u"UTF-8")
            self.image_id_2 = (self._io.read_bytes(80)).decode(u"UTF-8")
            self.image_security_classification = Nitf.Clasnfo(self._io, self, self._root)
            self.encryption = Nitf.Encrypt(self._io, self, self._root)
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
                self.img_comments.append(Nitf.ImageComment(self._io, self, self._root))

            self.img_compression = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.compression_rate_code = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.num_bands = (self._io.read_bytes(1)).decode(u"UTF-8")
            if int(self.num_bands) == 0:
                pass
                self.num_multispectral_bands = (self._io.read_bytes(5)).decode(u"UTF-8")

            self.bands = []
            for i in range((int(self.num_bands) if int(self.num_bands) != 0 else int(self.num_multispectral_bands))):
                self.bands.append(Nitf.BandInfo(self._io, self, self._root))

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


    class LengthDataInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.LengthDataInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.length_data_extension_subheader = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.length_data_extension_segment = (self._io.read_bytes(9)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class LengthGraphicInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.LengthGraphicInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.length_graphic_subheader = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.length_graphic_segment = (self._io.read_bytes(6)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class LengthImageInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.LengthImageInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.length_image_subheader = (self._io.read_bytes(6)).decode(u"UTF-8")
            self.length_image_segment = (self._io.read_bytes(10)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class LengthReservedInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.LengthReservedInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.length_reserved_extension_subheader = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.length_reserved_extension_segment = (self._io.read_bytes(7)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class LengthTextInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.LengthTextInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.length_text_subheader = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.length_text_segment = (self._io.read_bytes(5)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class ReservedExtensionSegment(KaitaiStruct):
        def __init__(self, idx, _io, _parent=None, _root=None):
            super(Nitf.ReservedExtensionSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self._read()

        def _read(self):
            self._raw_reserved_sub_header = self._io.read_bytes(int(self._parent.header.lrnfo[self.idx].length_reserved_extension_subheader))
            _io__raw_reserved_sub_header = KaitaiStream(BytesIO(self._raw_reserved_sub_header))
            self.reserved_sub_header = Nitf.ReservedSubHeader(_io__raw_reserved_sub_header, self, self._root)
            self.reserved_data_field = self._io.read_bytes(int(self._parent.header.lrnfo[self.idx].length_reserved_extension_segment))


        def _fetch_instances(self):
            pass
            self.reserved_sub_header._fetch_instances()


    class ReservedSubHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.ReservedSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.file_part_type_re = self._io.read_bytes(2)
            if not self.file_part_type_re == b"\x52\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x52\x45", self.file_part_type_re, self._io, u"/types/reserved_sub_header/seq/0")
            self.res_type_id = (self._io.read_bytes(25)).decode(u"UTF-8")
            self.res_version = (self._io.read_bytes(2)).decode(u"UTF-8")
            self.reclasnfo = Nitf.Clasnfo(self._io, self, self._root)
            self.res_user_defined_subheader_length = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.res_user_defined_subheader_fields = (self._io.read_bytes(int(self.res_user_defined_subheader_length))).decode(u"UTF-8")
            self.res_user_defined_data = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass
            self.reclasnfo._fetch_instances()


    class TextSegment(KaitaiStruct):
        def __init__(self, idx, _io, _parent=None, _root=None):
            super(Nitf.TextSegment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self._read()

        def _read(self):
            self.text_sub_header = self._io.read_bytes(1)
            self.text_data_field = self._io.read_bytes(int(self._parent.header.ltnfo[self.idx].length_text_segment))


        def _fetch_instances(self):
            pass


    class TextSubHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.TextSubHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.text_date_time = (self._io.read_bytes(14)).decode(u"UTF-8")
            self.text_title = (self._io.read_bytes(80)).decode(u"UTF-8")
            self.text_security_class = Nitf.Clasnfo(self._io, self, self._root)
            self.encryp = Nitf.Encrypt(self._io, self, self._root)
            self.text_format = (self._io.read_bytes(3)).decode(u"UTF-8")
            self.text_extended_sub_header = Nitf.TreHeader(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.text_security_class._fetch_instances()
            self.encryp._fetch_instances()
            self.text_extended_sub_header._fetch_instances()


    class Tre(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.Tre, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.extension_type_id = (self._io.read_bytes(6)).decode(u"UTF-8")
            self.edata_length = (self._io.read_bytes(5)).decode(u"UTF-8")
            self.edata = (self._io.read_bytes(int(self.edata_length))).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class TreHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Nitf.TreHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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




        def _fetch_instances(self):
            pass
            if int(self.header_data_length) != 0:
                pass

            if int(self.header_data_length) > 2:
                pass
                for i in range(len(self.header_data)):
                    pass





