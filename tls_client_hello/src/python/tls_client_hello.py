# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class TlsClientHello(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        super(TlsClientHello, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.version = TlsClientHello.Version(self._io, self, self._root)
        self.random = TlsClientHello.Random(self._io, self, self._root)
        self.session_id = TlsClientHello.SessionId(self._io, self, self._root)
        self.cipher_suites = TlsClientHello.CipherSuites(self._io, self, self._root)
        self.compression_methods = TlsClientHello.CompressionMethods(self._io, self, self._root)
        if self._io.is_eof() == False:
            pass
            self.extensions = TlsClientHello.Extensions(self._io, self, self._root)



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


    class Alpn(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.Alpn, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ext_len = self._io.read_u2be()
            self.alpn_protocols = []
            i = 0
            while not self._io.is_eof():
                self.alpn_protocols.append(TlsClientHello.Protocol(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.alpn_protocols)):
                pass
                self.alpn_protocols[i]._fetch_instances()



    class CipherSuites(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.CipherSuites, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = self._io.read_u2be()
            self.cipher_suites = []
            for i in range(self.len // 2):
                self.cipher_suites.append(self._io.read_u2be())



        def _fetch_instances(self):
            pass
            for i in range(len(self.cipher_suites)):
                pass



    class CompressionMethods(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.CompressionMethods, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = self._io.read_u1()
            self.compression_methods = self._io.read_bytes(self.len)


        def _fetch_instances(self):
            pass


    class Extension(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.Extension, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.type = self._io.read_u2be()
            self.len = self._io.read_u2be()
            _on = self.type
            if _on == 0:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = TlsClientHello.Sni(_io__raw_body, self, self._root)
            elif _on == 16:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = TlsClientHello.Alpn(_io__raw_body, self, self._root)
            else:
                pass
                self.body = self._io.read_bytes(self.len)


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


    class Extensions(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.Extensions, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = self._io.read_u2be()
            self.extensions = []
            i = 0
            while not self._io.is_eof():
                self.extensions.append(TlsClientHello.Extension(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.extensions)):
                pass
                self.extensions[i]._fetch_instances()



    class Protocol(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.Protocol, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.strlen = self._io.read_u1()
            self.name = self._io.read_bytes(self.strlen)


        def _fetch_instances(self):
            pass


    class Random(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.Random, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.gmt_unix_time = self._io.read_u4be()
            self.random = self._io.read_bytes(28)


        def _fetch_instances(self):
            pass


    class ServerName(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.ServerName, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name_type = self._io.read_u1()
            self.length = self._io.read_u2be()
            self.host_name = self._io.read_bytes(self.length)


        def _fetch_instances(self):
            pass


    class SessionId(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.SessionId, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = self._io.read_u1()
            self.sid = self._io.read_bytes(self.len)


        def _fetch_instances(self):
            pass


    class Sni(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.Sni, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.list_length = self._io.read_u2be()
            self.server_names = []
            i = 0
            while not self._io.is_eof():
                self.server_names.append(TlsClientHello.ServerName(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.server_names)):
                pass
                self.server_names[i]._fetch_instances()



    class Version(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(TlsClientHello.Version, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.major = self._io.read_u1()
            self.minor = self._io.read_u1()


        def _fetch_instances(self):
            pass



