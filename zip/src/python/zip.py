# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

import dos_datetime
class Zip(KaitaiStruct):
    """ZIP is a popular archive file format, introduced in 1989 by Phil Katz
    and originally implemented in PKZIP utility by PKWARE.
    
    Thanks to solid support of it in most desktop environments and
    operating systems, and algorithms / specs availability in public
    domain, it quickly became tool of choice for implementing file
    containers.
    
    For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
    are actually ZIP archives.
    
    .. seealso::
       Source - https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
    
    
    .. seealso::
       Source - https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html
    """

    class Compression(Enum):
        none = 0
        shrunk = 1
        reduced_1 = 2
        reduced_2 = 3
        reduced_3 = 4
        reduced_4 = 5
        imploded = 6
        deflated = 8
        enhanced_deflated = 9
        pkware_dcl_imploded = 10
        bzip2 = 12
        lzma = 14
        ibm_terse = 18
        ibm_lz77_z = 19
        ppmd = 98

    class ExtraCodes(Enum):
        zip64 = 1
        av_info = 7
        os2 = 9
        ntfs = 10
        openvms = 12
        pkware_unix = 13
        file_stream_and_fork_descriptors = 14
        patch_descriptor = 15
        pkcs7 = 20
        x509_cert_id_and_signature_for_file = 21
        x509_cert_id_for_central_dir = 22
        strong_encryption_header = 23
        record_management_controls = 24
        pkcs7_enc_recip_cert_list = 25
        ibm_s390_uncomp = 101
        ibm_s390_comp = 102
        poszip_4690 = 18064
        extended_timestamp = 21589
        infozip_unix = 30805
        infozip_unix_var_size = 30837
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.sections = []
        i = 0
        while not self._io.is_eof():
            self.sections.append(Zip.PkSection(self._io, self, self._root))
            i += 1


    class LocalFile(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header = Zip.LocalFileHeader(self._io, self, self._root)
            self.body = self._io.read_bytes(self.header.len_body_compressed)


    class DataDescriptor(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.crc32 = self._io.read_u4le()
            self.len_body_compressed = self._io.read_u4le()
            self.len_body_uncompressed = self._io.read_u4le()


    class ExtraField(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.code = KaitaiStream.resolve_enum(Zip.ExtraCodes, self._io.read_u2le())
            self.len_body = self._io.read_u2le()
            _on = self.code
            if _on == Zip.ExtraCodes.ntfs:
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Zip.ExtraField.Ntfs(_io__raw_body, self, self._root)
            elif _on == Zip.ExtraCodes.extended_timestamp:
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Zip.ExtraField.ExtendedTimestamp(_io__raw_body, self, self._root)
            elif _on == Zip.ExtraCodes.infozip_unix_var_size:
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Zip.ExtraField.InfozipUnixVarSize(_io__raw_body, self, self._root)
            else:
                self.body = self._io.read_bytes(self.len_body)

        class Ntfs(KaitaiStruct):
            """
            .. seealso::
               Source - https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L191
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_u4le()
                self.attributes = []
                i = 0
                while not self._io.is_eof():
                    self.attributes.append(Zip.ExtraField.Ntfs.Attribute(self._io, self, self._root))
                    i += 1


            class Attribute(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.tag = self._io.read_u2le()
                    self.len_body = self._io.read_u2le()
                    _on = self.tag
                    if _on == 1:
                        self._raw_body = self._io.read_bytes(self.len_body)
                        _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                        self.body = Zip.ExtraField.Ntfs.Attribute1(_io__raw_body, self, self._root)
                    else:
                        self.body = self._io.read_bytes(self.len_body)


            class Attribute1(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.last_mod_time = self._io.read_u8le()
                    self.last_access_time = self._io.read_u8le()
                    self.creation_time = self._io.read_u8le()



        class ExtendedTimestamp(KaitaiStruct):
            """
            .. seealso::
               Source - https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L817
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self._raw_flags = self._io.read_bytes(1)
                _io__raw_flags = KaitaiStream(BytesIO(self._raw_flags))
                self.flags = Zip.ExtraField.ExtendedTimestamp.InfoFlags(_io__raw_flags, self, self._root)
                if self.flags.has_mod_time:
                    self.mod_time = self._io.read_u4le()

                if self.flags.has_access_time:
                    self.access_time = self._io.read_u4le()

                if self.flags.has_create_time:
                    self.create_time = self._io.read_u4le()


            class InfoFlags(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.has_mod_time = self._io.read_bits_int_le(1) != 0
                    self.has_access_time = self._io.read_bits_int_le(1) != 0
                    self.has_create_time = self._io.read_bits_int_le(1) != 0
                    self.reserved = self._io.read_bits_int_le(5)



        class InfozipUnixVarSize(KaitaiStruct):
            """
            .. seealso::
               Source - https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L1339
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.version = self._io.read_u1()
                self.len_uid = self._io.read_u1()
                self.uid = self._io.read_bytes(self.len_uid)
                self.len_gid = self._io.read_u1()
                self.gid = self._io.read_bytes(self.len_gid)



    class CentralDirEntry(KaitaiStruct):
        """
        .. seealso::
           - 4.3.12 - https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version_made_by = self._io.read_u2le()
            self.version_needed_to_extract = self._io.read_u2le()
            self.flags = self._io.read_u2le()
            self.compression_method = KaitaiStream.resolve_enum(Zip.Compression, self._io.read_u2le())
            self._raw_file_mod_time = self._io.read_bytes(4)
            _io__raw_file_mod_time = KaitaiStream(BytesIO(self._raw_file_mod_time))
            self.file_mod_time = dos_datetime.DosDatetime(_io__raw_file_mod_time)
            self.crc32 = self._io.read_u4le()
            self.len_body_compressed = self._io.read_u4le()
            self.len_body_uncompressed = self._io.read_u4le()
            self.len_file_name = self._io.read_u2le()
            self.len_extra = self._io.read_u2le()
            self.len_comment = self._io.read_u2le()
            self.disk_number_start = self._io.read_u2le()
            self.int_file_attr = self._io.read_u2le()
            self.ext_file_attr = self._io.read_u4le()
            self.ofs_local_header = self._io.read_s4le()
            self.file_name = (self._io.read_bytes(self.len_file_name)).decode(u"UTF-8")
            self._raw_extra = self._io.read_bytes(self.len_extra)
            _io__raw_extra = KaitaiStream(BytesIO(self._raw_extra))
            self.extra = Zip.Extras(_io__raw_extra, self, self._root)
            self.comment = (self._io.read_bytes(self.len_comment)).decode(u"UTF-8")

        @property
        def local_header(self):
            if hasattr(self, '_m_local_header'):
                return self._m_local_header if hasattr(self, '_m_local_header') else None

            _pos = self._io.pos()
            self._io.seek(self.ofs_local_header)
            self._m_local_header = Zip.PkSection(self._io, self, self._root)
            self._io.seek(_pos)
            return self._m_local_header if hasattr(self, '_m_local_header') else None


    class PkSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(2)
            if not self.magic == b"\x50\x4B":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x4B", self.magic, self._io, u"/types/pk_section/seq/0")
            self.section_type = self._io.read_u2le()
            _on = self.section_type
            if _on == 513:
                self.body = Zip.CentralDirEntry(self._io, self, self._root)
            elif _on == 1027:
                self.body = Zip.LocalFile(self._io, self, self._root)
            elif _on == 1541:
                self.body = Zip.EndOfCentralDir(self._io, self, self._root)
            elif _on == 2055:
                self.body = Zip.DataDescriptor(self._io, self, self._root)


    class Extras(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(Zip.ExtraField(self._io, self, self._root))
                i += 1



    class LocalFileHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version = self._io.read_u2le()
            self._raw_flags = self._io.read_bytes(2)
            _io__raw_flags = KaitaiStream(BytesIO(self._raw_flags))
            self.flags = Zip.LocalFileHeader.GpFlags(_io__raw_flags, self, self._root)
            self.compression_method = KaitaiStream.resolve_enum(Zip.Compression, self._io.read_u2le())
            self._raw_file_mod_time = self._io.read_bytes(4)
            _io__raw_file_mod_time = KaitaiStream(BytesIO(self._raw_file_mod_time))
            self.file_mod_time = dos_datetime.DosDatetime(_io__raw_file_mod_time)
            self.crc32 = self._io.read_u4le()
            self.len_body_compressed = self._io.read_u4le()
            self.len_body_uncompressed = self._io.read_u4le()
            self.len_file_name = self._io.read_u2le()
            self.len_extra = self._io.read_u2le()
            self.file_name = (self._io.read_bytes(self.len_file_name)).decode(u"UTF-8")
            self._raw_extra = self._io.read_bytes(self.len_extra)
            _io__raw_extra = KaitaiStream(BytesIO(self._raw_extra))
            self.extra = Zip.Extras(_io__raw_extra, self, self._root)

        class GpFlags(KaitaiStruct):
            """
            .. seealso::
               - 4.4.4 - https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
            
            
            .. seealso::
               Local file headers - https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html
            """

            class DeflateMode(Enum):
                normal = 0
                maximum = 1
                fast = 2
                super_fast = 3
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.file_encrypted = self._io.read_bits_int_le(1) != 0
                self.comp_options_raw = self._io.read_bits_int_le(2)
                self.has_data_descriptor = self._io.read_bits_int_le(1) != 0
                self.reserved_1 = self._io.read_bits_int_le(1) != 0
                self.comp_patched_data = self._io.read_bits_int_le(1) != 0
                self.strong_encrypt = self._io.read_bits_int_le(1) != 0
                self.reserved_2 = self._io.read_bits_int_le(4)
                self.lang_encoding = self._io.read_bits_int_le(1) != 0
                self.reserved_3 = self._io.read_bits_int_le(1) != 0
                self.mask_header_values = self._io.read_bits_int_le(1) != 0
                self.reserved_4 = self._io.read_bits_int_le(2)

            @property
            def deflated_mode(self):
                if hasattr(self, '_m_deflated_mode'):
                    return self._m_deflated_mode if hasattr(self, '_m_deflated_mode') else None

                if  ((self._parent.compression_method == Zip.Compression.deflated) or (self._parent.compression_method == Zip.Compression.enhanced_deflated)) :
                    self._m_deflated_mode = KaitaiStream.resolve_enum(Zip.LocalFileHeader.GpFlags.DeflateMode, self.comp_options_raw)

                return self._m_deflated_mode if hasattr(self, '_m_deflated_mode') else None

            @property
            def imploded_dict_byte_size(self):
                """8KiB or 4KiB in bytes."""
                if hasattr(self, '_m_imploded_dict_byte_size'):
                    return self._m_imploded_dict_byte_size if hasattr(self, '_m_imploded_dict_byte_size') else None

                if self._parent.compression_method == Zip.Compression.imploded:
                    self._m_imploded_dict_byte_size = ((8 if (self.comp_options_raw & 1) != 0 else 4) * 1024)

                return self._m_imploded_dict_byte_size if hasattr(self, '_m_imploded_dict_byte_size') else None

            @property
            def imploded_num_sf_trees(self):
                if hasattr(self, '_m_imploded_num_sf_trees'):
                    return self._m_imploded_num_sf_trees if hasattr(self, '_m_imploded_num_sf_trees') else None

                if self._parent.compression_method == Zip.Compression.imploded:
                    self._m_imploded_num_sf_trees = (3 if (self.comp_options_raw & 2) != 0 else 2)

                return self._m_imploded_num_sf_trees if hasattr(self, '_m_imploded_num_sf_trees') else None

            @property
            def lzma_has_eos_marker(self):
                if hasattr(self, '_m_lzma_has_eos_marker'):
                    return self._m_lzma_has_eos_marker if hasattr(self, '_m_lzma_has_eos_marker') else None

                if self._parent.compression_method == Zip.Compression.lzma:
                    self._m_lzma_has_eos_marker = (self.comp_options_raw & 1) != 0

                return self._m_lzma_has_eos_marker if hasattr(self, '_m_lzma_has_eos_marker') else None



    class EndOfCentralDir(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.disk_of_end_of_central_dir = self._io.read_u2le()
            self.disk_of_central_dir = self._io.read_u2le()
            self.num_central_dir_entries_on_disk = self._io.read_u2le()
            self.num_central_dir_entries_total = self._io.read_u2le()
            self.len_central_dir = self._io.read_u4le()
            self.ofs_central_dir = self._io.read_u4le()
            self.len_comment = self._io.read_u2le()
            self.comment = (self._io.read_bytes(self.len_comment)).decode(u"UTF-8")



