# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SshPublicKey(KaitaiStruct):
    """SSH public keys are encoded in a special binary format, typically represented
    to end users as either one-liner OpenSSH format or multi-line PEM format
    (commerical SSH). Text wrapper carries extra information about user who
    created the key, comment, etc, but the inner binary is always base64-encoded
    and follows the same internal format.
    
    This format spec deals with this internal binary format (called "blob" in
    openssh sources) only. Buffer is expected to be raw binary and not base64-d.
    Implementation closely follows code in OpenSSH.
    
    .. seealso::
       Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L1970
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(SshPublicKey, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.key_name = SshPublicKey.Cstring(self._io, self, self._root)
        _on = self.key_name.value
        if _on == u"ecdsa-sha2-nistp256":
            pass
            self.body = SshPublicKey.KeyEcdsa(self._io, self, self._root)
        elif _on == u"ssh-dss":
            pass
            self.body = SshPublicKey.KeyDsa(self._io, self, self._root)
        elif _on == u"ssh-ed25519":
            pass
            self.body = SshPublicKey.KeyEd25519(self._io, self, self._root)
        elif _on == u"ssh-rsa":
            pass
            self.body = SshPublicKey.KeyRsa(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.key_name._fetch_instances()
        _on = self.key_name.value
        if _on == u"ecdsa-sha2-nistp256":
            pass
            self.body._fetch_instances()
        elif _on == u"ssh-dss":
            pass
            self.body._fetch_instances()
        elif _on == u"ssh-ed25519":
            pass
            self.body._fetch_instances()
        elif _on == u"ssh-rsa":
            pass
            self.body._fetch_instances()

    class Bignum2(KaitaiStruct):
        """Big integers serialization format used by ssh, v2. In the code, the following
        routines are used to read/write it:
        
        * sshbuf_get_bignum2
        * sshbuf_get_bignum2_bytes_direct
        * sshbuf_put_bignum2
        * sshbuf_get_bignum2_bytes_direct
        
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L35
           https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L431
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(SshPublicKey.Bignum2, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = self._io.read_u4be()
            self.body = self._io.read_bytes(self.len)


        def _fetch_instances(self):
            pass

        @property
        def length_in_bits(self):
            """Length of big integer in bits. In OpenSSH sources, this corresponds to
            `BN_num_bits` function.
            """
            if hasattr(self, '_m_length_in_bits'):
                return self._m_length_in_bits

            self._m_length_in_bits = (self.len - 1) * 8
            return getattr(self, '_m_length_in_bits', None)


    class Cstring(KaitaiStruct):
        """A integer-prefixed string designed to be read using `sshbuf_get_cstring`
        and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
        obscure misnomer, as typically "C string" means a null-terminated string.
        
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L181
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(SshPublicKey.Cstring, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = self._io.read_u4be()
            self.value = (self._io.read_bytes(self.len)).decode(u"ASCII")


        def _fetch_instances(self):
            pass


    class EllipticCurve(KaitaiStruct):
        """Elliptic curve dump format used by ssh. In OpenSSH code, the following
        routines are used to read/write it:
        
        * sshbuf_get_ec
        * get_ec
        
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L90
           https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L76
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(SshPublicKey.EllipticCurve, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = self._io.read_u4be()
            self.body = self._io.read_bytes(self.len)


        def _fetch_instances(self):
            pass


    class KeyDsa(KaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2036-L2051
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(SshPublicKey.KeyDsa, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.dsa_p = SshPublicKey.Bignum2(self._io, self, self._root)
            self.dsa_q = SshPublicKey.Bignum2(self._io, self, self._root)
            self.dsa_g = SshPublicKey.Bignum2(self._io, self, self._root)
            self.dsa_pub_key = SshPublicKey.Bignum2(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.dsa_p._fetch_instances()
            self.dsa_q._fetch_instances()
            self.dsa_g._fetch_instances()
            self.dsa_pub_key._fetch_instances()


    class KeyEcdsa(KaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2060-L2103
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(SshPublicKey.KeyEcdsa, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.curve_name = SshPublicKey.Cstring(self._io, self, self._root)
            self.ec = SshPublicKey.EllipticCurve(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.curve_name._fetch_instances()
            self.ec._fetch_instances()


    class KeyEd25519(KaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2111-L2124
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(SshPublicKey.KeyEd25519, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_pk = self._io.read_u4be()
            self.pk = self._io.read_bytes(self.len_pk)


        def _fetch_instances(self):
            pass


    class KeyRsa(KaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2011-L2028
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(SshPublicKey.KeyRsa, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.rsa_e = SshPublicKey.Bignum2(self._io, self, self._root)
            self.rsa_n = SshPublicKey.Bignum2(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.rsa_e._fetch_instances()
            self.rsa_n._fetch_instances()

        @property
        def key_length(self):
            """Key length in bits."""
            if hasattr(self, '_m_key_length'):
                return self._m_key_length

            self._m_key_length = self.rsa_n.length_in_bits
            return getattr(self, '_m_key_length', None)



