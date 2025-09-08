# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class TlsClientHello(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(TlsClientHello, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.version = TlsClientHello.Version(self._io, self, self._root)
        self.version._read()
        self.random = TlsClientHello.Random(self._io, self, self._root)
        self.random._read()
        self.session_id = TlsClientHello.SessionId(self._io, self, self._root)
        self.session_id._read()
        self.cipher_suites = TlsClientHello.CipherSuites(self._io, self, self._root)
        self.cipher_suites._read()
        self.compression_methods = TlsClientHello.CompressionMethods(self._io, self, self._root)
        self.compression_methods._read()
        if self._io.is_eof() == False:
            pass
            self.extensions = TlsClientHello.Extensions(self._io, self, self._root)
            self.extensions._read()

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.version._fetch_instances()
        self.random._fetch_instances()
        self.session_id._fetch_instances()
        self.cipher_suites._fetch_instances()
        self.compression_methods._fetch_instances()
        if self._io.is_eof() == False:
            pass
            self.extensions._fetch_instances()



    def _write__seq(self, io=None):
        super(TlsClientHello, self)._write__seq(io)
        self.version._write__seq(self._io)
        self.random._write__seq(self._io)
        self.session_id._write__seq(self._io)
        self.cipher_suites._write__seq(self._io)
        self.compression_methods._write__seq(self._io)
        if self._io.is_eof() == False:
            pass
            if self.extensions._root != self._root:
                raise kaitaistruct.ConsistencyError(u"extensions", self._root, self.extensions._root)
            if self.extensions._parent != self:
                raise kaitaistruct.ConsistencyError(u"extensions", self, self.extensions._parent)
            self.extensions._write__seq(self._io)



    def _check(self):
        if self.version._root != self._root:
            raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
        if self.version._parent != self:
            raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
        if self.random._root != self._root:
            raise kaitaistruct.ConsistencyError(u"random", self._root, self.random._root)
        if self.random._parent != self:
            raise kaitaistruct.ConsistencyError(u"random", self, self.random._parent)
        if self.session_id._root != self._root:
            raise kaitaistruct.ConsistencyError(u"session_id", self._root, self.session_id._root)
        if self.session_id._parent != self:
            raise kaitaistruct.ConsistencyError(u"session_id", self, self.session_id._parent)
        if self.cipher_suites._root != self._root:
            raise kaitaistruct.ConsistencyError(u"cipher_suites", self._root, self.cipher_suites._root)
        if self.cipher_suites._parent != self:
            raise kaitaistruct.ConsistencyError(u"cipher_suites", self, self.cipher_suites._parent)
        if self.compression_methods._root != self._root:
            raise kaitaistruct.ConsistencyError(u"compression_methods", self._root, self.compression_methods._root)
        if self.compression_methods._parent != self:
            raise kaitaistruct.ConsistencyError(u"compression_methods", self, self.compression_methods._parent)
        self._dirty = False

    class Alpn(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.Alpn, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ext_len = self._io.read_u2be()
            self.alpn_protocols = []
            i = 0
            while not self._io.is_eof():
                _t_alpn_protocols = TlsClientHello.Protocol(self._io, self, self._root)
                try:
                    _t_alpn_protocols._read()
                finally:
                    self.alpn_protocols.append(_t_alpn_protocols)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.alpn_protocols)):
                pass
                self.alpn_protocols[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(TlsClientHello.Alpn, self)._write__seq(io)
            self._io.write_u2be(self.ext_len)
            for i in range(len(self.alpn_protocols)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"alpn_protocols", 0, self._io.size() - self._io.pos())
                self.alpn_protocols[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"alpn_protocols", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.alpn_protocols)):
                pass
                if self.alpn_protocols[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"alpn_protocols", self._root, self.alpn_protocols[i]._root)
                if self.alpn_protocols[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"alpn_protocols", self, self.alpn_protocols[i]._parent)

            self._dirty = False


    class CipherSuites(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.CipherSuites, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u2be()
            self.cipher_suites = []
            for i in range(self.len // 2):
                self.cipher_suites.append(self._io.read_u2be())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.cipher_suites)):
                pass



        def _write__seq(self, io=None):
            super(TlsClientHello.CipherSuites, self)._write__seq(io)
            self._io.write_u2be(self.len)
            for i in range(len(self.cipher_suites)):
                pass
                self._io.write_u2be(self.cipher_suites[i])



        def _check(self):
            if len(self.cipher_suites) != self.len // 2:
                raise kaitaistruct.ConsistencyError(u"cipher_suites", self.len // 2, len(self.cipher_suites))
            for i in range(len(self.cipher_suites)):
                pass

            self._dirty = False


    class CompressionMethods(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.CompressionMethods, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u1()
            self.compression_methods = self._io.read_bytes(self.len)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TlsClientHello.CompressionMethods, self)._write__seq(io)
            self._io.write_u1(self.len)
            self._io.write_bytes(self.compression_methods)


        def _check(self):
            if len(self.compression_methods) != self.len:
                raise kaitaistruct.ConsistencyError(u"compression_methods", self.len, len(self.compression_methods))
            self._dirty = False


    class Extension(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.Extension, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = self._io.read_u2be()
            self.len = self._io.read_u2be()
            _on = self.type
            if _on == 0:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = TlsClientHello.Sni(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == 16:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = TlsClientHello.Alpn(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.len)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.type
            if _on == 0:
                pass
                self.body._fetch_instances()
            elif _on == 16:
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(TlsClientHello.Extension, self)._write__seq(io)
            self._io.write_u2be(self.type)
            self._io.write_u2be(self.len)
            _on = self.type
            if _on == 0:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == 16:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            _on = self.type
            if _on == 0:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == 16:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.len:
                    raise kaitaistruct.ConsistencyError(u"body", self.len, len(self.body))
            self._dirty = False


    class Extensions(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.Extensions, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u2be()
            self.extensions = []
            i = 0
            while not self._io.is_eof():
                _t_extensions = TlsClientHello.Extension(self._io, self, self._root)
                try:
                    _t_extensions._read()
                finally:
                    self.extensions.append(_t_extensions)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.extensions)):
                pass
                self.extensions[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(TlsClientHello.Extensions, self)._write__seq(io)
            self._io.write_u2be(self.len)
            for i in range(len(self.extensions)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"extensions", 0, self._io.size() - self._io.pos())
                self.extensions[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"extensions", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.extensions)):
                pass
                if self.extensions[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"extensions", self._root, self.extensions[i]._root)
                if self.extensions[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"extensions", self, self.extensions[i]._parent)

            self._dirty = False


    class Protocol(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.Protocol, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.strlen = self._io.read_u1()
            self.name = self._io.read_bytes(self.strlen)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TlsClientHello.Protocol, self)._write__seq(io)
            self._io.write_u1(self.strlen)
            self._io.write_bytes(self.name)


        def _check(self):
            if len(self.name) != self.strlen:
                raise kaitaistruct.ConsistencyError(u"name", self.strlen, len(self.name))
            self._dirty = False


    class Random(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.Random, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.gmt_unix_time = self._io.read_u4be()
            self.random = self._io.read_bytes(28)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TlsClientHello.Random, self)._write__seq(io)
            self._io.write_u4be(self.gmt_unix_time)
            self._io.write_bytes(self.random)


        def _check(self):
            if len(self.random) != 28:
                raise kaitaistruct.ConsistencyError(u"random", 28, len(self.random))
            self._dirty = False


    class ServerName(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.ServerName, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name_type = self._io.read_u1()
            self.length = self._io.read_u2be()
            self.host_name = self._io.read_bytes(self.length)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TlsClientHello.ServerName, self)._write__seq(io)
            self._io.write_u1(self.name_type)
            self._io.write_u2be(self.length)
            self._io.write_bytes(self.host_name)


        def _check(self):
            if len(self.host_name) != self.length:
                raise kaitaistruct.ConsistencyError(u"host_name", self.length, len(self.host_name))
            self._dirty = False


    class SessionId(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.SessionId, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u1()
            self.sid = self._io.read_bytes(self.len)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TlsClientHello.SessionId, self)._write__seq(io)
            self._io.write_u1(self.len)
            self._io.write_bytes(self.sid)


        def _check(self):
            if len(self.sid) != self.len:
                raise kaitaistruct.ConsistencyError(u"sid", self.len, len(self.sid))
            self._dirty = False


    class Sni(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.Sni, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.list_length = self._io.read_u2be()
            self.server_names = []
            i = 0
            while not self._io.is_eof():
                _t_server_names = TlsClientHello.ServerName(self._io, self, self._root)
                try:
                    _t_server_names._read()
                finally:
                    self.server_names.append(_t_server_names)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.server_names)):
                pass
                self.server_names[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(TlsClientHello.Sni, self)._write__seq(io)
            self._io.write_u2be(self.list_length)
            for i in range(len(self.server_names)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"server_names", 0, self._io.size() - self._io.pos())
                self.server_names[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"server_names", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.server_names)):
                pass
                if self.server_names[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"server_names", self._root, self.server_names[i]._root)
                if self.server_names[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"server_names", self, self.server_names[i]._parent)

            self._dirty = False


    class Version(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TlsClientHello.Version, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.major = self._io.read_u1()
            self.minor = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TlsClientHello.Version, self)._write__seq(io)
            self._io.write_u1(self.major)
            self._io.write_u1(self.minor)


        def _check(self):
            self._dirty = False



