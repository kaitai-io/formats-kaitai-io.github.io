# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidBootldrHuawei(ReadWriteKaitaiStruct):
    """Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:
    
    * Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
      [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)
    
    [sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
    [others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
    
    All image versions can be found in factory images at
    <https://developers.google.com/android/images> for the specific device. To
    avoid having to download an entire ZIP archive when you only need one file
    from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
    use its [command line
    tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
    members in the archive and then to download only the file you want.
    
    .. seealso::
       Source - https://android.googlesource.com/device/huawei/angler/+/673cfb9/releasetools.py
    
    
    .. seealso::
       Source - https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_format.h?h=LA.UM.6.1.1&id=a68d284aee85
    
    
    .. seealso::
       Source - https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AndroidBootldrHuawei, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.meta_header = AndroidBootldrHuawei.MetaHdr(self._io, self, self._root)
        self.meta_header._read()
        self.header_ext = self._io.read_bytes(self.meta_header.len_meta_header - 76)
        self._raw_image_header = self._io.read_bytes(self.meta_header.len_image_header)
        _io__raw_image_header = KaitaiStream(BytesIO(self._raw_image_header))
        self.image_header = AndroidBootldrHuawei.ImageHdr(_io__raw_image_header, self, self._root)
        self.image_header._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.meta_header._fetch_instances()
        self.image_header._fetch_instances()


    def _write__seq(self, io=None):
        super(AndroidBootldrHuawei, self)._write__seq(io)
        self.meta_header._write__seq(self._io)
        self._io.write_bytes(self.header_ext)
        _io__raw_image_header = KaitaiStream(BytesIO(bytearray(self.meta_header.len_image_header)))
        self._io.add_child_stream(_io__raw_image_header)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.meta_header.len_image_header))
        def handler(parent, _io__raw_image_header=_io__raw_image_header):
            self._raw_image_header = _io__raw_image_header.to_byte_array()
            if len(self._raw_image_header) != self.meta_header.len_image_header:
                raise kaitaistruct.ConsistencyError(u"raw(image_header)", self.meta_header.len_image_header, len(self._raw_image_header))
            parent.write_bytes(self._raw_image_header)
        _io__raw_image_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.image_header._write__seq(_io__raw_image_header)


    def _check(self):
        if self.meta_header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"meta_header", self._root, self.meta_header._root)
        if self.meta_header._parent != self:
            raise kaitaistruct.ConsistencyError(u"meta_header", self, self.meta_header._parent)
        if len(self.header_ext) != self.meta_header.len_meta_header - 76:
            raise kaitaistruct.ConsistencyError(u"header_ext", self.meta_header.len_meta_header - 76, len(self.header_ext))
        if self.image_header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"image_header", self._root, self.image_header._root)
        if self.image_header._parent != self:
            raise kaitaistruct.ConsistencyError(u"image_header", self, self.image_header._parent)
        self._dirty = False

    class ImageHdr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidBootldrHuawei.ImageHdr, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = AndroidBootldrHuawei.ImageHdrEntry(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(AndroidBootldrHuawei.ImageHdr, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False


    class ImageHdrEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidBootldrHuawei.ImageHdrEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(72), 0, False)).decode(u"ASCII")
            self.ofs_body = self._io.read_u4le()
            self.len_body = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(AndroidBootldrHuawei.ImageHdrEntry, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_bytes_limit((self.name).encode(u"ASCII"), 72, 0, 0)
            self._io.write_u4le(self.ofs_body)
            self._io.write_u4le(self.len_body)


        def _check(self):
            if len((self.name).encode(u"ASCII")) > 72:
                raise kaitaistruct.ConsistencyError(u"name", 72, len((self.name).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
            if self.body__enabled:
                pass
                if self.is_used:
                    pass
                    if len(self._m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self._m_body))


            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            if self.is_used:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_body)
                self._m_body = io.read_bytes(self.len_body)
                io.seek(_pos)

            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            if self.is_used:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_body)
                io.write_bytes(self._m_body)
                io.seek(_pos)


        @property
        def is_used(self):
            """
            .. seealso::
               Source - https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n119
            """
            if hasattr(self, '_m_is_used'):
                return self._m_is_used

            self._m_is_used =  ((self.ofs_body != 0) and (self.len_body != 0)) 
            return getattr(self, '_m_is_used', None)

        def _invalidate_is_used(self):
            del self._m_is_used

    class MetaHdr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidBootldrHuawei.MetaHdr, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x3C\xD6\x1A\xCE":
                raise kaitaistruct.ValidationNotEqualError(b"\x3C\xD6\x1A\xCE", self.magic, self._io, u"/types/meta_hdr/seq/0")
            self.version = AndroidBootldrHuawei.Version(self._io, self, self._root)
            self.version._read()
            self.image_version = (KaitaiStream.bytes_terminate(self._io.read_bytes(64), 0, False)).decode(u"ASCII")
            self.len_meta_header = self._io.read_u2le()
            self.len_image_header = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()


        def _write__seq(self, io=None):
            super(AndroidBootldrHuawei.MetaHdr, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self.version._write__seq(self._io)
            self._io.write_bytes_limit((self.image_version).encode(u"ASCII"), 64, 0, 0)
            self._io.write_u2le(self.len_meta_header)
            self._io.write_u2le(self.len_image_header)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x3C\xD6\x1A\xCE":
                raise kaitaistruct.ValidationNotEqualError(b"\x3C\xD6\x1A\xCE", self.magic, None, u"/types/meta_hdr/seq/0")
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            if len((self.image_version).encode(u"ASCII")) > 64:
                raise kaitaistruct.ConsistencyError(u"image_version", 64, len((self.image_version).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.image_version).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"image_version", -1, KaitaiStream.byte_array_index_of((self.image_version).encode(u"ASCII"), 0))
            self._dirty = False


    class Version(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidBootldrHuawei.Version, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.major = self._io.read_u2le()
            self.minor = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidBootldrHuawei.Version, self)._write__seq(io)
            self._io.write_u2le(self.major)
            self._io.write_u2le(self.minor)


        def _check(self):
            self._dirty = False



