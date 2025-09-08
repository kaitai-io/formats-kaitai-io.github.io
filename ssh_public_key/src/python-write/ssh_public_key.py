# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SshPublicKey(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(SshPublicKey, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.key_name = SshPublicKey.Cstring(self._io, self, self._root)
        self.key_name._read()
        _on = self.key_name.value
        if _on == u"ecdsa-sha2-nistp256":
            pass
            self.body = SshPublicKey.KeyEcdsa(self._io, self, self._root)
            self.body._read()
        elif _on == u"ssh-dss":
            pass
            self.body = SshPublicKey.KeyDsa(self._io, self, self._root)
            self.body._read()
        elif _on == u"ssh-ed25519":
            pass
            self.body = SshPublicKey.KeyEd25519(self._io, self, self._root)
            self.body._read()
        elif _on == u"ssh-rsa":
            pass
            self.body = SshPublicKey.KeyRsa(self._io, self, self._root)
            self.body._read()
        self._dirty = False


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


    def _write__seq(self, io=None):
        super(SshPublicKey, self)._write__seq(io)
        self.key_name._write__seq(self._io)
        _on = self.key_name.value
        if _on == u"ecdsa-sha2-nistp256":
            pass
            self.body._write__seq(self._io)
        elif _on == u"ssh-dss":
            pass
            self.body._write__seq(self._io)
        elif _on == u"ssh-ed25519":
            pass
            self.body._write__seq(self._io)
        elif _on == u"ssh-rsa":
            pass
            self.body._write__seq(self._io)


    def _check(self):
        if self.key_name._root != self._root:
            raise kaitaistruct.ConsistencyError(u"key_name", self._root, self.key_name._root)
        if self.key_name._parent != self:
            raise kaitaistruct.ConsistencyError(u"key_name", self, self.key_name._parent)
        _on = self.key_name.value
        if _on == u"ecdsa-sha2-nistp256":
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == u"ssh-dss":
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == u"ssh-ed25519":
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == u"ssh-rsa":
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        self._dirty = False

    class Bignum2(ReadWriteKaitaiStruct):
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
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SshPublicKey.Bignum2, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u4be()
            self.body = self._io.read_bytes(self.len)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(SshPublicKey.Bignum2, self)._write__seq(io)
            self._io.write_u4be(self.len)
            self._io.write_bytes(self.body)


        def _check(self):
            if len(self.body) != self.len:
                raise kaitaistruct.ConsistencyError(u"body", self.len, len(self.body))
            self._dirty = False

        @property
        def length_in_bits(self):
            """Length of big integer in bits. In OpenSSH sources, this corresponds to
            `BN_num_bits` function.
            """
            if hasattr(self, '_m_length_in_bits'):
                return self._m_length_in_bits

            self._m_length_in_bits = (self.len - 1) * 8
            return getattr(self, '_m_length_in_bits', None)

        def _invalidate_length_in_bits(self):
            del self._m_length_in_bits

    class Cstring(ReadWriteKaitaiStruct):
        """A integer-prefixed string designed to be read using `sshbuf_get_cstring`
        and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
        obscure misnomer, as typically "C string" means a null-terminated string.
        
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L181
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SshPublicKey.Cstring, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u4be()
            self.value = (self._io.read_bytes(self.len)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(SshPublicKey.Cstring, self)._write__seq(io)
            self._io.write_u4be(self.len)
            self._io.write_bytes((self.value).encode(u"ASCII"))


        def _check(self):
            if len((self.value).encode(u"ASCII")) != self.len:
                raise kaitaistruct.ConsistencyError(u"value", self.len, len((self.value).encode(u"ASCII")))
            self._dirty = False


    class EllipticCurve(ReadWriteKaitaiStruct):
        """Elliptic curve dump format used by ssh. In OpenSSH code, the following
        routines are used to read/write it:
        
        * sshbuf_get_ec
        * get_ec
        
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L90
           https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L76
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SshPublicKey.EllipticCurve, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u4be()
            self.body = self._io.read_bytes(self.len)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(SshPublicKey.EllipticCurve, self)._write__seq(io)
            self._io.write_u4be(self.len)
            self._io.write_bytes(self.body)


        def _check(self):
            if len(self.body) != self.len:
                raise kaitaistruct.ConsistencyError(u"body", self.len, len(self.body))
            self._dirty = False


    class KeyDsa(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2036-L2051
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SshPublicKey.KeyDsa, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.dsa_p = SshPublicKey.Bignum2(self._io, self, self._root)
            self.dsa_p._read()
            self.dsa_q = SshPublicKey.Bignum2(self._io, self, self._root)
            self.dsa_q._read()
            self.dsa_g = SshPublicKey.Bignum2(self._io, self, self._root)
            self.dsa_g._read()
            self.dsa_pub_key = SshPublicKey.Bignum2(self._io, self, self._root)
            self.dsa_pub_key._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.dsa_p._fetch_instances()
            self.dsa_q._fetch_instances()
            self.dsa_g._fetch_instances()
            self.dsa_pub_key._fetch_instances()


        def _write__seq(self, io=None):
            super(SshPublicKey.KeyDsa, self)._write__seq(io)
            self.dsa_p._write__seq(self._io)
            self.dsa_q._write__seq(self._io)
            self.dsa_g._write__seq(self._io)
            self.dsa_pub_key._write__seq(self._io)


        def _check(self):
            if self.dsa_p._root != self._root:
                raise kaitaistruct.ConsistencyError(u"dsa_p", self._root, self.dsa_p._root)
            if self.dsa_p._parent != self:
                raise kaitaistruct.ConsistencyError(u"dsa_p", self, self.dsa_p._parent)
            if self.dsa_q._root != self._root:
                raise kaitaistruct.ConsistencyError(u"dsa_q", self._root, self.dsa_q._root)
            if self.dsa_q._parent != self:
                raise kaitaistruct.ConsistencyError(u"dsa_q", self, self.dsa_q._parent)
            if self.dsa_g._root != self._root:
                raise kaitaistruct.ConsistencyError(u"dsa_g", self._root, self.dsa_g._root)
            if self.dsa_g._parent != self:
                raise kaitaistruct.ConsistencyError(u"dsa_g", self, self.dsa_g._parent)
            if self.dsa_pub_key._root != self._root:
                raise kaitaistruct.ConsistencyError(u"dsa_pub_key", self._root, self.dsa_pub_key._root)
            if self.dsa_pub_key._parent != self:
                raise kaitaistruct.ConsistencyError(u"dsa_pub_key", self, self.dsa_pub_key._parent)
            self._dirty = False


    class KeyEcdsa(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2060-L2103
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SshPublicKey.KeyEcdsa, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.curve_name = SshPublicKey.Cstring(self._io, self, self._root)
            self.curve_name._read()
            self.ec = SshPublicKey.EllipticCurve(self._io, self, self._root)
            self.ec._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.curve_name._fetch_instances()
            self.ec._fetch_instances()


        def _write__seq(self, io=None):
            super(SshPublicKey.KeyEcdsa, self)._write__seq(io)
            self.curve_name._write__seq(self._io)
            self.ec._write__seq(self._io)


        def _check(self):
            if self.curve_name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"curve_name", self._root, self.curve_name._root)
            if self.curve_name._parent != self:
                raise kaitaistruct.ConsistencyError(u"curve_name", self, self.curve_name._parent)
            if self.ec._root != self._root:
                raise kaitaistruct.ConsistencyError(u"ec", self._root, self.ec._root)
            if self.ec._parent != self:
                raise kaitaistruct.ConsistencyError(u"ec", self, self.ec._parent)
            self._dirty = False


    class KeyEd25519(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2111-L2124
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SshPublicKey.KeyEd25519, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_pk = self._io.read_u4be()
            self.pk = self._io.read_bytes(self.len_pk)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(SshPublicKey.KeyEd25519, self)._write__seq(io)
            self._io.write_u4be(self.len_pk)
            self._io.write_bytes(self.pk)


        def _check(self):
            if len(self.pk) != self.len_pk:
                raise kaitaistruct.ConsistencyError(u"pk", self.len_pk, len(self.pk))
            self._dirty = False


    class KeyRsa(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2011-L2028
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SshPublicKey.KeyRsa, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.rsa_e = SshPublicKey.Bignum2(self._io, self, self._root)
            self.rsa_e._read()
            self.rsa_n = SshPublicKey.Bignum2(self._io, self, self._root)
            self.rsa_n._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.rsa_e._fetch_instances()
            self.rsa_n._fetch_instances()


        def _write__seq(self, io=None):
            super(SshPublicKey.KeyRsa, self)._write__seq(io)
            self.rsa_e._write__seq(self._io)
            self.rsa_n._write__seq(self._io)


        def _check(self):
            if self.rsa_e._root != self._root:
                raise kaitaistruct.ConsistencyError(u"rsa_e", self._root, self.rsa_e._root)
            if self.rsa_e._parent != self:
                raise kaitaistruct.ConsistencyError(u"rsa_e", self, self.rsa_e._parent)
            if self.rsa_n._root != self._root:
                raise kaitaistruct.ConsistencyError(u"rsa_n", self._root, self.rsa_n._root)
            if self.rsa_n._parent != self:
                raise kaitaistruct.ConsistencyError(u"rsa_n", self, self.rsa_n._parent)
            self._dirty = False

        @property
        def key_length(self):
            """Key length in bits."""
            if hasattr(self, '_m_key_length'):
                return self._m_key_length

            self._m_key_length = self.rsa_n.length_in_bits
            return getattr(self, '_m_key_length', None)

        def _invalidate_key_length(self):
            del self._m_key_length


