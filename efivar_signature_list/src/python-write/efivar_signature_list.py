# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class EfivarSignatureList(ReadWriteKaitaiStruct):
    """Parse UEFI variables db and dbx that contain signatures, certificates and
    hashes. On a Linux system using UEFI, these variables are readable from:
    
    ```
    /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f
    /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
    /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f
    /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
    ```
    
    Note:
    
    * `d719b2cb-3d3a-4596-a3bc-dad00e67656f` is defined as `EFI_IMAGE_SECURITY_DATABASE_GUID`
    * `8be4df61-93ca-11d2-aa0d-00e098032b8c` is defined as `EFI_GLOBAL_VARIABLE`
    
    Each file contains an EFI attribute (32-bit integer) followed by a list of
    `EFI_SIGNATURE_LIST` structures.
    
    .. seealso::
       Source - https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(EfivarSignatureList, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.var_attributes = EfivarSignatureList.EfiVarAttr(self._io, self, self._root)
        self.var_attributes._read()
        self.signatures = []
        i = 0
        while not self._io.is_eof():
            _t_signatures = EfivarSignatureList.SignatureList(self._io, self, self._root)
            try:
                _t_signatures._read()
            finally:
                self.signatures.append(_t_signatures)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.var_attributes._fetch_instances()
        for i in range(len(self.signatures)):
            pass
            self.signatures[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(EfivarSignatureList, self)._write__seq(io)
        self.var_attributes._write__seq(self._io)
        for i in range(len(self.signatures)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"signatures", 0, self._io.size() - self._io.pos())
            self.signatures[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"signatures", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.var_attributes._root != self._root:
            raise kaitaistruct.ConsistencyError(u"var_attributes", self._root, self.var_attributes._root)
        if self.var_attributes._parent != self:
            raise kaitaistruct.ConsistencyError(u"var_attributes", self, self.var_attributes._parent)
        for i in range(len(self.signatures)):
            pass
            if self.signatures[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"signatures", self._root, self.signatures[i]._root)
            if self.signatures[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"signatures", self, self.signatures[i]._parent)

        self._dirty = False

    class EfiVarAttr(ReadWriteKaitaiStruct):
        """Attributes of a UEFI variable."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(EfivarSignatureList.EfiVarAttr, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.enhanced_authenticated_access = self._io.read_bits_int_be(1) != 0
            self.append_write = self._io.read_bits_int_be(1) != 0
            self.time_based_authenticated_write_access = self._io.read_bits_int_be(1) != 0
            self.authenticated_write_access = self._io.read_bits_int_be(1) != 0
            self.hardware_error_record = self._io.read_bits_int_be(1) != 0
            self.runtime_access = self._io.read_bits_int_be(1) != 0
            self.bootservice_access = self._io.read_bits_int_be(1) != 0
            self.non_volatile = self._io.read_bits_int_be(1) != 0
            self.reserved1 = self._io.read_bits_int_be(24)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(EfivarSignatureList.EfiVarAttr, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.enhanced_authenticated_access))
            self._io.write_bits_int_be(1, int(self.append_write))
            self._io.write_bits_int_be(1, int(self.time_based_authenticated_write_access))
            self._io.write_bits_int_be(1, int(self.authenticated_write_access))
            self._io.write_bits_int_be(1, int(self.hardware_error_record))
            self._io.write_bits_int_be(1, int(self.runtime_access))
            self._io.write_bits_int_be(1, int(self.bootservice_access))
            self._io.write_bits_int_be(1, int(self.non_volatile))
            self._io.write_bits_int_be(24, self.reserved1)


        def _check(self):
            self._dirty = False


    class SignatureData(ReadWriteKaitaiStruct):
        """
        .. seealso::
           EFI_SIGNATURE_DATA
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(EfivarSignatureList.SignatureData, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.owner = self._io.read_bytes(16)
            self.data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(EfivarSignatureList.SignatureData, self)._write__seq(io)
            self._io.write_bytes(self.owner)
            self._io.write_bytes(self.data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            if len(self.owner) != 16:
                raise kaitaistruct.ConsistencyError(u"owner", 16, len(self.owner))
            self._dirty = False


    class SignatureList(ReadWriteKaitaiStruct):
        """
        .. seealso::
           EFI_SIGNATURE_LIST
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(EfivarSignatureList.SignatureList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.signature_type = self._io.read_bytes(16)
            self.len_signature_list = self._io.read_u4le()
            self.len_signature_header = self._io.read_u4le()
            self.len_signature = self._io.read_u4le()
            self.header = self._io.read_bytes(self.len_signature_header)
            if self.len_signature > 0:
                pass
                self._raw_signatures = []
                self.signatures = []
                for i in range(((self.len_signature_list - self.len_signature_header) - 28) // self.len_signature):
                    self._raw_signatures.append(self._io.read_bytes(self.len_signature))
                    _io__raw_signatures = KaitaiStream(BytesIO(self._raw_signatures[i]))
                    _t_signatures = EfivarSignatureList.SignatureData(_io__raw_signatures, self, self._root)
                    try:
                        _t_signatures._read()
                    finally:
                        self.signatures.append(_t_signatures)


            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.len_signature > 0:
                pass
                for i in range(len(self.signatures)):
                    pass
                    self.signatures[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(EfivarSignatureList.SignatureList, self)._write__seq(io)
            self._io.write_bytes(self.signature_type)
            self._io.write_u4le(self.len_signature_list)
            self._io.write_u4le(self.len_signature_header)
            self._io.write_u4le(self.len_signature)
            self._io.write_bytes(self.header)
            if self.len_signature > 0:
                pass
                self._raw_signatures = []
                for i in range(len(self.signatures)):
                    pass
                    _io__raw_signatures = KaitaiStream(BytesIO(bytearray(self.len_signature)))
                    self._io.add_child_stream(_io__raw_signatures)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.len_signature))
                    def handler(parent, _io__raw_signatures=_io__raw_signatures, i=i):
                        self._raw_signatures.append(_io__raw_signatures.to_byte_array())
                        if len(self._raw_signatures[i]) != self.len_signature:
                            raise kaitaistruct.ConsistencyError(u"raw(signatures)", self.len_signature, len(self._raw_signatures[i]))
                        parent.write_bytes(self._raw_signatures[i])
                    _io__raw_signatures.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.signatures[i]._write__seq(_io__raw_signatures)




        def _check(self):
            if len(self.signature_type) != 16:
                raise kaitaistruct.ConsistencyError(u"signature_type", 16, len(self.signature_type))
            if len(self.header) != self.len_signature_header:
                raise kaitaistruct.ConsistencyError(u"header", self.len_signature_header, len(self.header))
            if self.len_signature > 0:
                pass
                if len(self.signatures) != ((self.len_signature_list - self.len_signature_header) - 28) // self.len_signature:
                    raise kaitaistruct.ConsistencyError(u"signatures", ((self.len_signature_list - self.len_signature_header) - 28) // self.len_signature, len(self.signatures))
                for i in range(len(self.signatures)):
                    pass
                    if self.signatures[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"signatures", self._root, self.signatures[i]._root)
                    if self.signatures[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"signatures", self, self.signatures[i]._parent)


            self._dirty = False

        @property
        def is_cert_der_pkcs7(self):
            """DER-encoded PKCS #7 version 1.5 [RFC2315].
            
            .. seealso::
               EFI_CERT_TYPE_PKCS7_GUID
            """
            if hasattr(self, '_m_is_cert_der_pkcs7'):
                return self._m_is_cert_der_pkcs7

            self._m_is_cert_der_pkcs7 = self.signature_type == b"\x9D\xD2\xAF\x4A\xDF\x68\xEE\x49\x8A\xA9\x34\x7D\x37\x56\x65\xA7"
            return getattr(self, '_m_is_cert_der_pkcs7', None)

        def _invalidate_is_cert_der_pkcs7(self):
            del self._m_is_cert_der_pkcs7
        @property
        def is_cert_rsa2048_key(self):
            """RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001).
            
            .. seealso::
               EFI_CERT_RSA2048_GUID
            """
            if hasattr(self, '_m_is_cert_rsa2048_key'):
                return self._m_is_cert_rsa2048_key

            self._m_is_cert_rsa2048_key = self.signature_type == b"\xE8\x66\x57\x3C\x9C\x26\x34\x4E\xAA\x14\xED\x77\x6E\x85\xB3\xB6"
            return getattr(self, '_m_is_cert_rsa2048_key', None)

        def _invalidate_is_cert_rsa2048_key(self):
            del self._m_is_cert_rsa2048_key
        @property
        def is_cert_rsa2048_sha1(self):
            """RSA-2048 signature of a SHA-1 hash.
            
            .. seealso::
               EFI_CERT_RSA2048_SHA1_GUID
            """
            if hasattr(self, '_m_is_cert_rsa2048_sha1'):
                return self._m_is_cert_rsa2048_sha1

            self._m_is_cert_rsa2048_sha1 = self.signature_type == b"\x4F\x44\xF8\x67\x43\x87\xF1\x48\xA3\x28\x1E\xAA\xB8\x73\x60\x80"
            return getattr(self, '_m_is_cert_rsa2048_sha1', None)

        def _invalidate_is_cert_rsa2048_sha1(self):
            del self._m_is_cert_rsa2048_sha1
        @property
        def is_cert_rsa2048_sha256(self):
            """RSA-2048 signature of a SHA-256 hash.
            
            .. seealso::
               EFI_CERT_RSA2048_SHA256_GUID
            """
            if hasattr(self, '_m_is_cert_rsa2048_sha256'):
                return self._m_is_cert_rsa2048_sha256

            self._m_is_cert_rsa2048_sha256 = self.signature_type == b"\x90\x61\xB3\xE2\x9B\x87\x3D\x4A\xAD\x8D\xF2\xE7\xBB\xA3\x27\x84"
            return getattr(self, '_m_is_cert_rsa2048_sha256', None)

        def _invalidate_is_cert_rsa2048_sha256(self):
            del self._m_is_cert_rsa2048_sha256
        @property
        def is_cert_sha1(self):
            """SHA-1 hash.
            
            .. seealso::
               EFI_CERT_SHA1_GUID
            """
            if hasattr(self, '_m_is_cert_sha1'):
                return self._m_is_cert_sha1

            self._m_is_cert_sha1 = self.signature_type == b"\x12\xA5\x6C\x82\x10\xCF\xC9\x4A\xB1\x87\xBE\x01\x49\x66\x31\xBD"
            return getattr(self, '_m_is_cert_sha1', None)

        def _invalidate_is_cert_sha1(self):
            del self._m_is_cert_sha1
        @property
        def is_cert_sha224(self):
            """SHA-224 hash.
            
            .. seealso::
               EFI_CERT_SHA224_GUID
            """
            if hasattr(self, '_m_is_cert_sha224'):
                return self._m_is_cert_sha224

            self._m_is_cert_sha224 = self.signature_type == b"\x33\x52\x6E\x0B\x5C\xA6\xC9\x44\x94\x07\xD9\xAB\x83\xBF\xC8\xBD"
            return getattr(self, '_m_is_cert_sha224', None)

        def _invalidate_is_cert_sha224(self):
            del self._m_is_cert_sha224
        @property
        def is_cert_sha256(self):
            """SHA-256 hash.
            
            .. seealso::
               EFI_CERT_SHA256_GUID
            """
            if hasattr(self, '_m_is_cert_sha256'):
                return self._m_is_cert_sha256

            self._m_is_cert_sha256 = self.signature_type == b"\x26\x16\xC4\xC1\x4C\x50\x92\x40\xAC\xA9\x41\xF9\x36\x93\x43\x28"
            return getattr(self, '_m_is_cert_sha256', None)

        def _invalidate_is_cert_sha256(self):
            del self._m_is_cert_sha256
        @property
        def is_cert_sha256_x509(self):
            """SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation.
            
            .. seealso::
               EFI_CERT_X509_SHA256_GUID
            """
            if hasattr(self, '_m_is_cert_sha256_x509'):
                return self._m_is_cert_sha256_x509

            self._m_is_cert_sha256_x509 = self.signature_type == b"\x92\xA4\xD2\x3B\xC0\x96\x79\x40\xB4\x20\xFC\xF9\x8E\xF1\x03\xED"
            return getattr(self, '_m_is_cert_sha256_x509', None)

        def _invalidate_is_cert_sha256_x509(self):
            del self._m_is_cert_sha256_x509
        @property
        def is_cert_sha384(self):
            """SHA-384 hash.
            
            .. seealso::
               EFI_CERT_SHA384_GUID
            """
            if hasattr(self, '_m_is_cert_sha384'):
                return self._m_is_cert_sha384

            self._m_is_cert_sha384 = self.signature_type == b"\x07\x53\x3E\xFF\xD0\x9F\xC9\x48\x85\xF1\x8A\xD5\x6C\x70\x1E\x01"
            return getattr(self, '_m_is_cert_sha384', None)

        def _invalidate_is_cert_sha384(self):
            del self._m_is_cert_sha384
        @property
        def is_cert_sha384_x509(self):
            """SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation.
            
            .. seealso::
               EFI_CERT_X509_SHA384_GUID
            """
            if hasattr(self, '_m_is_cert_sha384_x509'):
                return self._m_is_cert_sha384_x509

            self._m_is_cert_sha384_x509 = self.signature_type == b"\x6E\x87\x76\x70\xC2\x80\xE6\x4E\xAA\xD2\x28\xB3\x49\xA6\x86\x5B"
            return getattr(self, '_m_is_cert_sha384_x509', None)

        def _invalidate_is_cert_sha384_x509(self):
            del self._m_is_cert_sha384_x509
        @property
        def is_cert_sha512(self):
            """SHA-512 hash.
            
            .. seealso::
               EFI_CERT_SHA512_GUID
            """
            if hasattr(self, '_m_is_cert_sha512'):
                return self._m_is_cert_sha512

            self._m_is_cert_sha512 = self.signature_type == b"\xAE\x0F\x3E\x09\xC4\xA6\x50\x4F\x9F\x1B\xD4\x1E\x2B\x89\xC1\x9A"
            return getattr(self, '_m_is_cert_sha512', None)

        def _invalidate_is_cert_sha512(self):
            del self._m_is_cert_sha512
        @property
        def is_cert_sha512_x509(self):
            """SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation.
            
            .. seealso::
               EFI_CERT_X509_SHA512_GUID
            """
            if hasattr(self, '_m_is_cert_sha512_x509'):
                return self._m_is_cert_sha512_x509

            self._m_is_cert_sha512_x509 = self.signature_type == b"\x63\xBF\x6D\x44\x02\x25\xDA\x4C\xBC\xFA\x24\x65\xD2\xB0\xFE\x9D"
            return getattr(self, '_m_is_cert_sha512_x509', None)

        def _invalidate_is_cert_sha512_x509(self):
            del self._m_is_cert_sha512_x509
        @property
        def is_cert_x509(self):
            """X.509 certificate.
            
            .. seealso::
               EFI_CERT_X509_GUID
            """
            if hasattr(self, '_m_is_cert_x509'):
                return self._m_is_cert_x509

            self._m_is_cert_x509 = self.signature_type == b"\xA1\x59\xC0\xA5\xE4\x94\xA7\x4A\x87\xB5\xAB\x15\x5C\x2B\xF0\x72"
            return getattr(self, '_m_is_cert_x509', None)

        def _invalidate_is_cert_x509(self):
            del self._m_is_cert_x509


