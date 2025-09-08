# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class OpenpgpMessage(ReadWriteKaitaiStruct):
    """The OpenPGP Message Format is a format to store encryption and signature keys for emails.
    
    .. seealso::
       Source - https://www.rfc-editor.org/rfc/rfc4880
    """

    class CompressionAlgorithms(IntEnum):
        uncompressed = 0
        zib = 1
        zlib = 2
        bzip = 3
        private_experimental_algorithm_00 = 100
        private_experimental_algorithm_01 = 101
        private_experimental_algorithm_02 = 102
        private_experimental_algorithm_03 = 103
        private_experimental_algorithm_04 = 104
        private_experimental_algorithm_05 = 105
        private_experimental_algorithm_06 = 106
        private_experimental_algorithm_07 = 107
        private_experimental_algorithm_08 = 108
        private_experimental_algorithm_09 = 109
        private_experimental_algorithm_10 = 110

    class HashAlgorithms(IntEnum):
        md5 = 1
        sha1 = 2
        ripemd160 = 3
        reserved4 = 4
        reserved5 = 5
        reserved6 = 6
        reserved7 = 7
        sha256 = 8
        sha384 = 9
        sha512 = 10
        sha224 = 11
        private_experimental_algorithm_00 = 100
        private_experimental_algorithm_01 = 101
        private_experimental_algorithm_02 = 102
        private_experimental_algorithm_03 = 103
        private_experimental_algorithm_04 = 104
        private_experimental_algorithm_05 = 105
        private_experimental_algorithm_06 = 106
        private_experimental_algorithm_07 = 107
        private_experimental_algorithm_08 = 108
        private_experimental_algorithm_09 = 109
        private_experimental_algorithm_10 = 110

    class KeyFlags(IntEnum):
        this_key_may_be_used_to_certify_other_keys = 1
        this_key_may_be_used_to_sign_data = 2
        this_key_may_be_used_to_encrypt_communications = 4
        this_key_may_be_used_to_encrypt_storage = 8
        the_private_component_of_this_key_may_have_been_split_by_a_secret_sharing_mechanism = 16
        this_key_may_be_used_for_authentication = 32
        the_private_component_of_this_key_may_be_in_the_possession_of_more_than_one_person = 128

    class PacketTags(IntEnum):
        reserved_a_packet_tag_must_not_have_this_value = 0
        public_key_encrypted_session_key_packet = 1
        signature_packet = 2
        symmetric_key_encrypted_session_key_packet = 3
        one_pass_signature_packet = 4
        secret_key_packet = 5
        public_key_packet = 6
        secret_subkey_packet = 7
        compressed_data_packet = 8
        symmetrically_encrypted_data_packet = 9
        marker_packet = 10
        literal_data_packet = 11
        trust_packet = 12
        user_id_packet = 13
        public_subkey_packet = 14
        user_attribute_packet = 17
        sym_encrypted_and_integrity_protected_data_packet = 18
        modification_detection_code_packet = 19
        private_or_experimental_values_0 = 60
        private_or_experimental_values_1 = 61
        private_or_experimental_values_2 = 62
        private_or_experimental_values_3 = 63

    class PublicKeyAlgorithms(IntEnum):
        rsa_encrypt_or_sign_hac = 1
        rsa_encrypt_only_hac = 2
        rsa_sign_only_hac = 3
        elgamal_encrypt_only_elgamal_hac = 16
        dsa_digital_signature_algorithm_fips_hac = 17
        reserved_for_elliptic_curve = 18
        reserved_for_ecdsa = 19
        reserved_formerly_elgamal_encrypt_or_sign_ = 20
        reserved_for_diffie_hellman_x_as_defined_for_ietf_s_mime = 21
        private_experimental_algorithm_00 = 100
        private_experimental_algorithm_01 = 101
        private_experimental_algorithm_02 = 102
        private_experimental_algorithm_03 = 103
        private_experimental_algorithm_04 = 104
        private_experimental_algorithm_05 = 105
        private_experimental_algorithm_06 = 106
        private_experimental_algorithm_07 = 107
        private_experimental_algorithm_08 = 108
        private_experimental_algorithm_09 = 109
        private_experimental_algorithm_10 = 110

    class RevocationCodes(IntEnum):
        no_reason_specified_key_revocations_or_cert_revocations = 0
        key_is_superseded_key_revocations = 1
        key_material_has_been_compromised_key_revocations = 2
        key_is_retired_and_no_longer_used_key_revocations = 3
        user_id_information_is_no_longer_valid_cert_revocations = 32
        private_use_1 = 100
        private_use_2 = 101
        private_use_3 = 102
        private_use_4 = 103
        private_use_11 = 110

    class ServerFlags(IntEnum):
        no_modify = 128

    class SubpacketTypes(IntEnum):
        reserved0 = 0
        reserved1 = 1
        signature_creation_time = 2
        signature_expiration_time = 3
        exportable_certification = 4
        trust_signature = 5
        regular_expression = 6
        revocable = 7
        reserved8 = 8
        key_expiration_time = 9
        placeholder_for_backward_compatibility = 10
        preferred_symmetric_algorithms = 11
        revocation_key = 12
        reserved13 = 13
        reserved14 = 14
        reserved15 = 15
        issuer = 16
        reserved17 = 17
        reserved18 = 18
        reserved19 = 19
        notation_data = 20
        preferred_hash_algorithms = 21
        preferred_compression_algorithms = 22
        key_server_preferences = 23
        preferred_key_server = 24
        primary_user_id = 25
        policy_uri = 26
        key_flags = 27
        signers_user_id = 28
        reason_for_revocation = 29
        features = 30
        signature_target = 31
        embedded_signature = 32

    class SymmetricKeyAlgorithm(IntEnum):
        plain = 0
        idea = 1
        triple_des = 2
        cast5 = 3
        blowfisch = 4
        reserved5 = 5
        reserved6 = 6
        aes_128 = 7
        aes_192 = 8
        aes_256 = 9
        twofish_256 = 10
        private_experimental_algorithm_00 = 100
        private_experimental_algorithm_01 = 101
        private_experimental_algorithm_02 = 102
        private_experimental_algorithm_03 = 103
        private_experimental_algorithm_04 = 104
        private_experimental_algorithm_05 = 105
        private_experimental_algorithm_06 = 106
        private_experimental_algorithm_07 = 107
        private_experimental_algorithm_08 = 108
        private_experimental_algorithm_09 = 109
        private_experimental_algorithm_10 = 110
    def __init__(self, _io=None, _parent=None, _root=None):
        super(OpenpgpMessage, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.packets = []
        i = 0
        while not self._io.is_eof():
            _t_packets = OpenpgpMessage.Packet(self._io, self, self._root)
            try:
                _t_packets._read()
            finally:
                self.packets.append(_t_packets)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.packets)):
            pass
            self.packets[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(OpenpgpMessage, self)._write__seq(io)
        for i in range(len(self.packets)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"packets", 0, self._io.size() - self._io.pos())
            self.packets[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"packets", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.packets)):
            pass
            if self.packets[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"packets", self._root, self.packets[i]._root)
            if self.packets[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"packets", self, self.packets[i]._parent)

        self._dirty = False

    class EmbeddedSignature(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.EmbeddedSignature, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.signature_packet = OpenpgpMessage.SignaturePacket(self._io, self, self._root)
            self.signature_packet._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.signature_packet._fetch_instances()


        def _write__seq(self, io=None):
            super(OpenpgpMessage.EmbeddedSignature, self)._write__seq(io)
            self.signature_packet._write__seq(self._io)


        def _check(self):
            if self.signature_packet._root != self._root:
                raise kaitaistruct.ConsistencyError(u"signature_packet", self._root, self.signature_packet._root)
            if self.signature_packet._parent != self:
                raise kaitaistruct.ConsistencyError(u"signature_packet", self, self.signature_packet._parent)
            self._dirty = False


    class ExportableCertification(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.ExportableCertification, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.exportable = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.ExportableCertification, self)._write__seq(io)
            self._io.write_u1(self.exportable)


        def _check(self):
            self._dirty = False


    class Features(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.Features, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flags = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.Features, self)._write__seq(io)
            self._io.write_bytes(self.flags)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"flags", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class Issuer(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.Issuer, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.keyid = self._io.read_u8be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.Issuer, self)._write__seq(io)
            self._io.write_u8be(self.keyid)


        def _check(self):
            self._dirty = False


    class KeyExpirationTime(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.KeyExpirationTime, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.time = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.KeyExpirationTime, self)._write__seq(io)
            self._io.write_u4be(self.time)


        def _check(self):
            self._dirty = False


    class KeyFlags(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.KeyFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flag = []
            i = 0
            while not self._io.is_eof():
                self.flag.append(KaitaiStream.resolve_enum(OpenpgpMessage.KeyFlags, self._io.read_u1()))
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.flag)):
                pass



        def _write__seq(self, io=None):
            super(OpenpgpMessage.KeyFlags, self)._write__seq(io)
            for i in range(len(self.flag)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"flag", 0, self._io.size() - self._io.pos())
                self._io.write_u1(int(self.flag[i]))

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"flag", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.flag)):
                pass

            self._dirty = False


    class KeyServerPreferences(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.KeyServerPreferences, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flag = []
            i = 0
            while not self._io.is_eof():
                self.flag.append(KaitaiStream.resolve_enum(OpenpgpMessage.ServerFlags, self._io.read_u1()))
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.flag)):
                pass



        def _write__seq(self, io=None):
            super(OpenpgpMessage.KeyServerPreferences, self)._write__seq(io)
            for i in range(len(self.flag)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"flag", 0, self._io.size() - self._io.pos())
                self._io.write_u1(int(self.flag[i]))

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"flag", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.flag)):
                pass

            self._dirty = False


    class LenSubpacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.LenSubpacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.first_octet = self._io.read_u1()
            if  ((self.first_octet >= 192) and (self.first_octet < 255)) :
                pass
                self.second_octet = self._io.read_u1()

            if self.first_octet == 255:
                pass
                self.scalar = self._io.read_u4be()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if  ((self.first_octet >= 192) and (self.first_octet < 255)) :
                pass

            if self.first_octet == 255:
                pass



        def _write__seq(self, io=None):
            super(OpenpgpMessage.LenSubpacket, self)._write__seq(io)
            self._io.write_u1(self.first_octet)
            if  ((self.first_octet >= 192) and (self.first_octet < 255)) :
                pass
                self._io.write_u1(self.second_octet)

            if self.first_octet == 255:
                pass
                self._io.write_u4be(self.scalar)



        def _check(self):
            if  ((self.first_octet >= 192) and (self.first_octet < 255)) :
                pass

            if self.first_octet == 255:
                pass

            self._dirty = False

        @property
        def len(self):
            if hasattr(self, '_m_len'):
                return self._m_len

            self._m_len = (self.first_octet if self.first_octet < 192 else (((self.first_octet - 192 << 8) + self.second_octet) + 192 if  ((self.first_octet >= 192) and (self.first_octet < 255))  else self.scalar))
            return getattr(self, '_m_len', None)

        def _invalidate_len(self):
            del self._m_len

    class NotationData(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.NotationData, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flags = self._io.read_bytes(4)
            self.len_name = self._io.read_u2be()
            self.len_value = self._io.read_u2be()
            self.name = self._io.read_bytes(self.len_name)
            self.value = self._io.read_bytes(self.len_value)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.NotationData, self)._write__seq(io)
            self._io.write_bytes(self.flags)
            self._io.write_u2be(self.len_name)
            self._io.write_u2be(self.len_value)
            self._io.write_bytes(self.name)
            self._io.write_bytes(self.value)


        def _check(self):
            if len(self.flags) != 4:
                raise kaitaistruct.ConsistencyError(u"flags", 4, len(self.flags))
            if len(self.name) != self.len_name:
                raise kaitaistruct.ConsistencyError(u"name", self.len_name, len(self.name))
            if len(self.value) != self.len_value:
                raise kaitaistruct.ConsistencyError(u"value", self.len_value, len(self.value))
            self._dirty = False


    class OldPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.OldPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            _on = self._parent.len_type
            if _on == 0:
                pass
                self.len = self._io.read_u1()
            elif _on == 1:
                pass
                self.len = self._io.read_u2be()
            elif _on == 2:
                pass
                self.len = self._io.read_u4be()
            _on = self._parent.packet_type_old
            if _on == OpenpgpMessage.PacketTags.public_key_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.PublicKeyPacket(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == OpenpgpMessage.PacketTags.public_subkey_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.PublicKeyPacket(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == OpenpgpMessage.PacketTags.secret_key_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.SecretKeyPacket(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == OpenpgpMessage.PacketTags.secret_subkey_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.PublicKeyPacket(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == OpenpgpMessage.PacketTags.signature_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.SignaturePacket(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == OpenpgpMessage.PacketTags.user_id_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.UserIdPacket(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.len)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self._parent.len_type
            if _on == 0:
                pass
            elif _on == 1:
                pass
            elif _on == 2:
                pass
            _on = self._parent.packet_type_old
            if _on == OpenpgpMessage.PacketTags.public_key_packet:
                pass
                self.body._fetch_instances()
            elif _on == OpenpgpMessage.PacketTags.public_subkey_packet:
                pass
                self.body._fetch_instances()
            elif _on == OpenpgpMessage.PacketTags.secret_key_packet:
                pass
                self.body._fetch_instances()
            elif _on == OpenpgpMessage.PacketTags.secret_subkey_packet:
                pass
                self.body._fetch_instances()
            elif _on == OpenpgpMessage.PacketTags.signature_packet:
                pass
                self.body._fetch_instances()
            elif _on == OpenpgpMessage.PacketTags.user_id_packet:
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.OldPacket, self)._write__seq(io)
            _on = self._parent.len_type
            if _on == 0:
                pass
                self._io.write_u1(self.len)
            elif _on == 1:
                pass
                self._io.write_u2be(self.len)
            elif _on == 2:
                pass
                self._io.write_u4be(self.len)
            _on = self._parent.packet_type_old
            if _on == OpenpgpMessage.PacketTags.public_key_packet:
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
            elif _on == OpenpgpMessage.PacketTags.public_subkey_packet:
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
            elif _on == OpenpgpMessage.PacketTags.secret_key_packet:
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
            elif _on == OpenpgpMessage.PacketTags.secret_subkey_packet:
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
            elif _on == OpenpgpMessage.PacketTags.signature_packet:
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
            elif _on == OpenpgpMessage.PacketTags.user_id_packet:
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
            _on = self._parent.len_type
            if _on == 0:
                pass
            elif _on == 1:
                pass
            elif _on == 2:
                pass
            _on = self._parent.packet_type_old
            if _on == OpenpgpMessage.PacketTags.public_key_packet:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == OpenpgpMessage.PacketTags.public_subkey_packet:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == OpenpgpMessage.PacketTags.secret_key_packet:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == OpenpgpMessage.PacketTags.secret_subkey_packet:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == OpenpgpMessage.PacketTags.signature_packet:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == OpenpgpMessage.PacketTags.user_id_packet:
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


    class Packet(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.Packet, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.one = self._io.read_bits_int_be(1) != 0
            self.new_packet_format = self._io.read_bits_int_be(1) != 0
            if self.new_packet_format:
                pass
                self.packet_type_new = KaitaiStream.resolve_enum(OpenpgpMessage.PacketTags, self._io.read_bits_int_be(6))

            if (not (self.new_packet_format)):
                pass
                self.packet_type_old = KaitaiStream.resolve_enum(OpenpgpMessage.PacketTags, self._io.read_bits_int_be(4))

            if (not (self.new_packet_format)):
                pass
                self.len_type = self._io.read_bits_int_be(2)

            _on = self.new_packet_format
            if _on == False:
                pass
                self.body = OpenpgpMessage.OldPacket(self._io, self, self._root)
                self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.new_packet_format:
                pass

            if (not (self.new_packet_format)):
                pass

            if (not (self.new_packet_format)):
                pass

            _on = self.new_packet_format
            if _on == False:
                pass
                self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(OpenpgpMessage.Packet, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.one))
            self._io.write_bits_int_be(1, int(self.new_packet_format))
            if self.new_packet_format:
                pass
                self._io.write_bits_int_be(6, int(self.packet_type_new))

            if (not (self.new_packet_format)):
                pass
                self._io.write_bits_int_be(4, int(self.packet_type_old))

            if (not (self.new_packet_format)):
                pass
                self._io.write_bits_int_be(2, self.len_type)

            _on = self.new_packet_format
            if _on == False:
                pass
                self.body._write__seq(self._io)


        def _check(self):
            if self.new_packet_format:
                pass

            if (not (self.new_packet_format)):
                pass

            if (not (self.new_packet_format)):
                pass

            _on = self.new_packet_format
            if _on == False:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            self._dirty = False


    class PolicyUri(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.PolicyUri, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.uri = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.PolicyUri, self)._write__seq(io)
            self._io.write_bytes((self.uri).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"uri", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class PreferredCompressionAlgorithms(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.PreferredCompressionAlgorithms, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.algorithm = []
            i = 0
            while not self._io.is_eof():
                self.algorithm.append(KaitaiStream.resolve_enum(OpenpgpMessage.CompressionAlgorithms, self._io.read_u1()))
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.algorithm)):
                pass



        def _write__seq(self, io=None):
            super(OpenpgpMessage.PreferredCompressionAlgorithms, self)._write__seq(io)
            for i in range(len(self.algorithm)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"algorithm", 0, self._io.size() - self._io.pos())
                self._io.write_u1(int(self.algorithm[i]))

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"algorithm", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.algorithm)):
                pass

            self._dirty = False


    class PreferredHashAlgorithms(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.PreferredHashAlgorithms, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.algorithm = []
            i = 0
            while not self._io.is_eof():
                self.algorithm.append(KaitaiStream.resolve_enum(OpenpgpMessage.HashAlgorithms, self._io.read_u1()))
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.algorithm)):
                pass



        def _write__seq(self, io=None):
            super(OpenpgpMessage.PreferredHashAlgorithms, self)._write__seq(io)
            for i in range(len(self.algorithm)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"algorithm", 0, self._io.size() - self._io.pos())
                self._io.write_u1(int(self.algorithm[i]))

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"algorithm", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.algorithm)):
                pass

            self._dirty = False


    class PreferredKeyServer(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.PreferredKeyServer, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.uri = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.PreferredKeyServer, self)._write__seq(io)
            self._io.write_bytes((self.uri).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"uri", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class PrimaryUserId(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.PrimaryUserId, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.user_id = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.PrimaryUserId, self)._write__seq(io)
            self._io.write_u1(self.user_id)


        def _check(self):
            self._dirty = False


    class PublicKeyPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.PublicKeyPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u1()
            self.timestamp = self._io.read_u4be()
            self.public_key_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.PublicKeyAlgorithms, self._io.read_u1())
            self.len_alg = self._io.read_u2be()
            self.rsa_n = self._io.read_bytes(self.len_alg // 8)
            self.padding = self._io.read_u2be()
            self.rsa_e = self._io.read_bytes(3)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.PublicKeyPacket, self)._write__seq(io)
            self._io.write_u1(self.version)
            self._io.write_u4be(self.timestamp)
            self._io.write_u1(int(self.public_key_algorithm))
            self._io.write_u2be(self.len_alg)
            self._io.write_bytes(self.rsa_n)
            self._io.write_u2be(self.padding)
            self._io.write_bytes(self.rsa_e)


        def _check(self):
            if len(self.rsa_n) != self.len_alg // 8:
                raise kaitaistruct.ConsistencyError(u"rsa_n", self.len_alg // 8, len(self.rsa_n))
            if len(self.rsa_e) != 3:
                raise kaitaistruct.ConsistencyError(u"rsa_e", 3, len(self.rsa_e))
            self._dirty = False


    class ReasonForRevocation(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.ReasonForRevocation, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.revocation_code = KaitaiStream.resolve_enum(OpenpgpMessage.RevocationCodes, self._io.read_u1())
            self.reason = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.ReasonForRevocation, self)._write__seq(io)
            self._io.write_u1(int(self.revocation_code))
            self._io.write_bytes((self.reason).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"reason", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class RegularExpression(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.RegularExpression, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.regex = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.RegularExpression, self)._write__seq(io)
            self._io.write_bytes((self.regex).encode(u"UTF-8"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.regex).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"regex", -1, KaitaiStream.byte_array_index_of((self.regex).encode(u"UTF-8"), 0))
            self._dirty = False


    class Revocable(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.Revocable, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.revocable = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.Revocable, self)._write__seq(io)
            self._io.write_u1(self.revocable)


        def _check(self):
            self._dirty = False


    class RevocationKey(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.RevocationKey, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.class = self._io.read_u1()
            self.public_key_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.PublicKeyAlgorithms, self._io.read_u1())
            self.fingerprint = self._io.read_bytes(20)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.RevocationKey, self)._write__seq(io)
            self._io.write_u1(self.class)
            self._io.write_u1(int(self.public_key_algorithm))
            self._io.write_bytes(self.fingerprint)


        def _check(self):
            if len(self.fingerprint) != 20:
                raise kaitaistruct.ConsistencyError(u"fingerprint", 20, len(self.fingerprint))
            self._dirty = False


    class SecretKeyPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.SecretKeyPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.public_key = OpenpgpMessage.PublicKeyPacket(self._io, self, self._root)
            self.public_key._read()
            self.string_to_key = self._io.read_u1()
            if self.string_to_key >= 254:
                pass
                self.symmetric_encryption_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.SymmetricKeyAlgorithm, self._io.read_u1())

            self.secret_key = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.public_key._fetch_instances()
            if self.string_to_key >= 254:
                pass



        def _write__seq(self, io=None):
            super(OpenpgpMessage.SecretKeyPacket, self)._write__seq(io)
            self.public_key._write__seq(self._io)
            self._io.write_u1(self.string_to_key)
            if self.string_to_key >= 254:
                pass
                self._io.write_u1(int(self.symmetric_encryption_algorithm))

            self._io.write_bytes(self.secret_key)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"secret_key", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.public_key._root != self._root:
                raise kaitaistruct.ConsistencyError(u"public_key", self._root, self.public_key._root)
            if self.public_key._parent != self:
                raise kaitaistruct.ConsistencyError(u"public_key", self, self.public_key._parent)
            if self.string_to_key >= 254:
                pass

            self._dirty = False


    class SignatureCreationTime(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.SignatureCreationTime, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.time = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.SignatureCreationTime, self)._write__seq(io)
            self._io.write_u4be(self.time)


        def _check(self):
            self._dirty = False


    class SignatureExpirationTime(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.SignatureExpirationTime, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.time = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.SignatureExpirationTime, self)._write__seq(io)
            self._io.write_u4be(self.time)


        def _check(self):
            self._dirty = False


    class SignaturePacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.SignaturePacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u1()
            self.signature_type = self._io.read_u1()
            self.public_key_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.PublicKeyAlgorithms, self._io.read_u1())
            self.hash_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.HashAlgorithms, self._io.read_u1())
            self.len_hashed_subpacket = self._io.read_u2be()
            self._raw_hashed_subpackets = self._io.read_bytes(self.len_hashed_subpacket)
            _io__raw_hashed_subpackets = KaitaiStream(BytesIO(self._raw_hashed_subpackets))
            self.hashed_subpackets = OpenpgpMessage.Subpackets(_io__raw_hashed_subpackets, self, self._root)
            self.hashed_subpackets._read()
            self.len_unhashed_subpacket = self._io.read_u2be()
            self._raw_unhashed_subpackets = self._io.read_bytes(self.len_unhashed_subpacket)
            _io__raw_unhashed_subpackets = KaitaiStream(BytesIO(self._raw_unhashed_subpackets))
            self.unhashed_subpackets = OpenpgpMessage.Subpackets(_io__raw_unhashed_subpackets, self, self._root)
            self.unhashed_subpackets._read()
            self.left_signed_hash = self._io.read_u2be()
            self.rsa_n = self._io.read_u2be()
            self.signature = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.hashed_subpackets._fetch_instances()
            self.unhashed_subpackets._fetch_instances()


        def _write__seq(self, io=None):
            super(OpenpgpMessage.SignaturePacket, self)._write__seq(io)
            self._io.write_u1(self.version)
            self._io.write_u1(self.signature_type)
            self._io.write_u1(int(self.public_key_algorithm))
            self._io.write_u1(int(self.hash_algorithm))
            self._io.write_u2be(self.len_hashed_subpacket)
            _io__raw_hashed_subpackets = KaitaiStream(BytesIO(bytearray(self.len_hashed_subpacket)))
            self._io.add_child_stream(_io__raw_hashed_subpackets)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_hashed_subpacket))
            def handler(parent, _io__raw_hashed_subpackets=_io__raw_hashed_subpackets):
                self._raw_hashed_subpackets = _io__raw_hashed_subpackets.to_byte_array()
                if len(self._raw_hashed_subpackets) != self.len_hashed_subpacket:
                    raise kaitaistruct.ConsistencyError(u"raw(hashed_subpackets)", self.len_hashed_subpacket, len(self._raw_hashed_subpackets))
                parent.write_bytes(self._raw_hashed_subpackets)
            _io__raw_hashed_subpackets.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.hashed_subpackets._write__seq(_io__raw_hashed_subpackets)
            self._io.write_u2be(self.len_unhashed_subpacket)
            _io__raw_unhashed_subpackets = KaitaiStream(BytesIO(bytearray(self.len_unhashed_subpacket)))
            self._io.add_child_stream(_io__raw_unhashed_subpackets)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_unhashed_subpacket))
            def handler(parent, _io__raw_unhashed_subpackets=_io__raw_unhashed_subpackets):
                self._raw_unhashed_subpackets = _io__raw_unhashed_subpackets.to_byte_array()
                if len(self._raw_unhashed_subpackets) != self.len_unhashed_subpacket:
                    raise kaitaistruct.ConsistencyError(u"raw(unhashed_subpackets)", self.len_unhashed_subpacket, len(self._raw_unhashed_subpackets))
                parent.write_bytes(self._raw_unhashed_subpackets)
            _io__raw_unhashed_subpackets.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.unhashed_subpackets._write__seq(_io__raw_unhashed_subpackets)
            self._io.write_u2be(self.left_signed_hash)
            self._io.write_u2be(self.rsa_n)
            self._io.write_bytes(self.signature)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"signature", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.hashed_subpackets._root != self._root:
                raise kaitaistruct.ConsistencyError(u"hashed_subpackets", self._root, self.hashed_subpackets._root)
            if self.hashed_subpackets._parent != self:
                raise kaitaistruct.ConsistencyError(u"hashed_subpackets", self, self.hashed_subpackets._parent)
            if self.unhashed_subpackets._root != self._root:
                raise kaitaistruct.ConsistencyError(u"unhashed_subpackets", self._root, self.unhashed_subpackets._root)
            if self.unhashed_subpackets._parent != self:
                raise kaitaistruct.ConsistencyError(u"unhashed_subpackets", self, self.unhashed_subpackets._parent)
            self._dirty = False


    class SignatureTarget(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.SignatureTarget, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.public_key_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.PublicKeyAlgorithms, self._io.read_u1())
            self.hash_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.HashAlgorithms, self._io.read_u1())
            self.hash = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.SignatureTarget, self)._write__seq(io)
            self._io.write_u1(int(self.public_key_algorithm))
            self._io.write_u1(int(self.hash_algorithm))
            self._io.write_bytes(self.hash)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"hash", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class SignersUserId(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.SignersUserId, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.user_id = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.SignersUserId, self)._write__seq(io)
            self._io.write_bytes((self.user_id).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"user_id", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class Subpacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.Subpacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = OpenpgpMessage.LenSubpacket(self._io, self, self._root)
            self.len._read()
            self.subpacket_type = KaitaiStream.resolve_enum(OpenpgpMessage.SubpacketTypes, self._io.read_u1())
            _on = self.subpacket_type
            if _on == OpenpgpMessage.SubpacketTypes.embedded_signature:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.EmbeddedSignature(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.exportable_certification:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.ExportableCertification(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.features:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.Features(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.issuer:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.Issuer(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.key_expiration_time:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.KeyExpirationTime(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.key_flags:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.KeyFlags(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.key_server_preferences:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.KeyServerPreferences(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.notation_data:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.NotationData(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.policy_uri:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PolicyUri(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_compression_algorithms:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PreferredCompressionAlgorithms(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_hash_algorithms:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PreferredHashAlgorithms(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_key_server:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PreferredKeyServer(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.primary_user_id:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PrimaryUserId(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.reason_for_revocation:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.ReasonForRevocation(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.regular_expression:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.RegularExpression(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.revocable:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.Revocable(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.revocation_key:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.RevocationKey(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.signature_creation_time:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.SignatureCreationTime(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.signature_expiration_time:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.SignatureExpirationTime(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.signature_target:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.SignatureTarget(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.signers_user_id:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.SignersUserId(_io__raw_content, self, self._root)
                self.content._read()
            elif _on == OpenpgpMessage.SubpacketTypes.trust_signature:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.TrustSignature(_io__raw_content, self, self._root)
                self.content._read()
            else:
                pass
                self.content = self._io.read_bytes(self.len.len - 1)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len._fetch_instances()
            _on = self.subpacket_type
            if _on == OpenpgpMessage.SubpacketTypes.embedded_signature:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.exportable_certification:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.features:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.issuer:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.key_expiration_time:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.key_flags:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.key_server_preferences:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.notation_data:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.policy_uri:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_compression_algorithms:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_hash_algorithms:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_key_server:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.primary_user_id:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.reason_for_revocation:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.regular_expression:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.revocable:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.revocation_key:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.signature_creation_time:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.signature_expiration_time:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.signature_target:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.signers_user_id:
                pass
                self.content._fetch_instances()
            elif _on == OpenpgpMessage.SubpacketTypes.trust_signature:
                pass
                self.content._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.Subpacket, self)._write__seq(io)
            self.len._write__seq(self._io)
            self._io.write_u1(int(self.subpacket_type))
            _on = self.subpacket_type
            if _on == OpenpgpMessage.SubpacketTypes.embedded_signature:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.exportable_certification:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.features:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.issuer:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.key_expiration_time:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.key_flags:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.key_server_preferences:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.notation_data:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.policy_uri:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_compression_algorithms:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_hash_algorithms:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_key_server:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.primary_user_id:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.reason_for_revocation:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.regular_expression:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.revocable:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.revocation_key:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.signature_creation_time:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.signature_expiration_time:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.signature_target:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.signers_user_id:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            elif _on == OpenpgpMessage.SubpacketTypes.trust_signature:
                pass
                _io__raw_content = KaitaiStream(BytesIO(bytearray(self.len.len - 1)))
                self._io.add_child_stream(_io__raw_content)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len.len - 1))
                def handler(parent, _io__raw_content=_io__raw_content):
                    self._raw_content = _io__raw_content.to_byte_array()
                    if len(self._raw_content) != self.len.len - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(content)", self.len.len - 1, len(self._raw_content))
                    parent.write_bytes(self._raw_content)
                _io__raw_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.content._write__seq(_io__raw_content)
            else:
                pass
                self._io.write_bytes(self.content)


        def _check(self):
            if self.len._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len", self._root, self.len._root)
            if self.len._parent != self:
                raise kaitaistruct.ConsistencyError(u"len", self, self.len._parent)
            _on = self.subpacket_type
            if _on == OpenpgpMessage.SubpacketTypes.embedded_signature:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.exportable_certification:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.features:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.issuer:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.key_expiration_time:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.key_flags:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.key_server_preferences:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.notation_data:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.policy_uri:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_compression_algorithms:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_hash_algorithms:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_key_server:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.primary_user_id:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.reason_for_revocation:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.regular_expression:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.revocable:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.revocation_key:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.signature_creation_time:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.signature_expiration_time:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.signature_target:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.signers_user_id:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == OpenpgpMessage.SubpacketTypes.trust_signature:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            else:
                pass
                if len(self.content) != self.len.len - 1:
                    raise kaitaistruct.ConsistencyError(u"content", self.len.len - 1, len(self.content))
            self._dirty = False


    class Subpackets(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.Subpackets, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.subpacketss = []
            i = 0
            while not self._io.is_eof():
                _t_subpacketss = OpenpgpMessage.Subpacket(self._io, self, self._root)
                try:
                    _t_subpacketss._read()
                finally:
                    self.subpacketss.append(_t_subpacketss)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.subpacketss)):
                pass
                self.subpacketss[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(OpenpgpMessage.Subpackets, self)._write__seq(io)
            for i in range(len(self.subpacketss)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"subpacketss", 0, self._io.size() - self._io.pos())
                self.subpacketss[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"subpacketss", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.subpacketss)):
                pass
                if self.subpacketss[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"subpacketss", self._root, self.subpacketss[i]._root)
                if self.subpacketss[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"subpacketss", self, self.subpacketss[i]._parent)

            self._dirty = False


    class TrustSignature(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.TrustSignature, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.level = self._io.read_u1()
            self.amount = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.TrustSignature, self)._write__seq(io)
            self._io.write_u1(self.level)
            self._io.write_u1(self.amount)


        def _check(self):
            self._dirty = False


    class UserIdPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(OpenpgpMessage.UserIdPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.user_id = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(OpenpgpMessage.UserIdPacket, self)._write__seq(io)
            self._io.write_bytes((self.user_id).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"user_id", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False



