# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class OpenpgpMessage(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(OpenpgpMessage, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.packets = []
        i = 0
        while not self._io.is_eof():
            self.packets.append(OpenpgpMessage.Packet(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.packets)):
            pass
            self.packets[i]._fetch_instances()


    class EmbeddedSignature(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.EmbeddedSignature, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.signature_packet = OpenpgpMessage.SignaturePacket(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.signature_packet._fetch_instances()


    class ExportableCertification(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.ExportableCertification, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.exportable = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class Features(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.Features, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.flags = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass


    class Issuer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.Issuer, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.keyid = self._io.read_u8be()


        def _fetch_instances(self):
            pass


    class KeyExpirationTime(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.KeyExpirationTime, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.time = self._io.read_u4be()


        def _fetch_instances(self):
            pass


    class KeyFlags(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.KeyFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.flag = []
            i = 0
            while not self._io.is_eof():
                self.flag.append(KaitaiStream.resolve_enum(OpenpgpMessage.KeyFlags, self._io.read_u1()))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.flag)):
                pass



    class KeyServerPreferences(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.KeyServerPreferences, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.flag = []
            i = 0
            while not self._io.is_eof():
                self.flag.append(KaitaiStream.resolve_enum(OpenpgpMessage.ServerFlags, self._io.read_u1()))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.flag)):
                pass



    class LenSubpacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.LenSubpacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.first_octet = self._io.read_u1()
            if  ((self.first_octet >= 192) and (self.first_octet < 255)) :
                pass
                self.second_octet = self._io.read_u1()

            if self.first_octet == 255:
                pass
                self.scalar = self._io.read_u4be()



        def _fetch_instances(self):
            pass
            if  ((self.first_octet >= 192) and (self.first_octet < 255)) :
                pass

            if self.first_octet == 255:
                pass


        @property
        def len(self):
            if hasattr(self, '_m_len'):
                return self._m_len

            self._m_len = (self.first_octet if self.first_octet < 192 else (((self.first_octet - 192 << 8) + self.second_octet) + 192 if  ((self.first_octet >= 192) and (self.first_octet < 255))  else self.scalar))
            return getattr(self, '_m_len', None)


    class NotationData(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.NotationData, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.flags = self._io.read_bytes(4)
            self.len_name = self._io.read_u2be()
            self.len_value = self._io.read_u2be()
            self.name = self._io.read_bytes(self.len_name)
            self.value = self._io.read_bytes(self.len_value)


        def _fetch_instances(self):
            pass


    class OldPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.OldPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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
            elif _on == OpenpgpMessage.PacketTags.public_subkey_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.PublicKeyPacket(_io__raw_body, self, self._root)
            elif _on == OpenpgpMessage.PacketTags.secret_key_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.SecretKeyPacket(_io__raw_body, self, self._root)
            elif _on == OpenpgpMessage.PacketTags.secret_subkey_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.PublicKeyPacket(_io__raw_body, self, self._root)
            elif _on == OpenpgpMessage.PacketTags.signature_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.SignaturePacket(_io__raw_body, self, self._root)
            elif _on == OpenpgpMessage.PacketTags.user_id_packet:
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = OpenpgpMessage.UserIdPacket(_io__raw_body, self, self._root)
            else:
                pass
                self.body = self._io.read_bytes(self.len)


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


    class Packet(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.Packet, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


    class PolicyUri(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.PolicyUri, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.uri = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class PreferredCompressionAlgorithms(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.PreferredCompressionAlgorithms, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.algorithm = []
            i = 0
            while not self._io.is_eof():
                self.algorithm.append(KaitaiStream.resolve_enum(OpenpgpMessage.CompressionAlgorithms, self._io.read_u1()))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.algorithm)):
                pass



    class PreferredHashAlgorithms(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.PreferredHashAlgorithms, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.algorithm = []
            i = 0
            while not self._io.is_eof():
                self.algorithm.append(KaitaiStream.resolve_enum(OpenpgpMessage.HashAlgorithms, self._io.read_u1()))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.algorithm)):
                pass



    class PreferredKeyServer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.PreferredKeyServer, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.uri = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class PrimaryUserId(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.PrimaryUserId, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.user_id = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class PublicKeyPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.PublicKeyPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.version = self._io.read_u1()
            self.timestamp = self._io.read_u4be()
            self.public_key_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.PublicKeyAlgorithms, self._io.read_u1())
            self.len_alg = self._io.read_u2be()
            self.rsa_n = self._io.read_bytes(self.len_alg // 8)
            self.padding = self._io.read_u2be()
            self.rsa_e = self._io.read_bytes(3)


        def _fetch_instances(self):
            pass


    class ReasonForRevocation(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.ReasonForRevocation, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.revocation_code = KaitaiStream.resolve_enum(OpenpgpMessage.RevocationCodes, self._io.read_u1())
            self.reason = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class RegularExpression(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.RegularExpression, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.regex = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class Revocable(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.Revocable, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.revocable = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class RevocationKey(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.RevocationKey, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.class = self._io.read_u1()
            self.public_key_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.PublicKeyAlgorithms, self._io.read_u1())
            self.fingerprint = self._io.read_bytes(20)


        def _fetch_instances(self):
            pass


    class SecretKeyPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.SecretKeyPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.public_key = OpenpgpMessage.PublicKeyPacket(self._io, self, self._root)
            self.string_to_key = self._io.read_u1()
            if self.string_to_key >= 254:
                pass
                self.symmetric_encryption_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.SymmetricKeyAlgorithm, self._io.read_u1())

            self.secret_key = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass
            self.public_key._fetch_instances()
            if self.string_to_key >= 254:
                pass



    class SignatureCreationTime(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.SignatureCreationTime, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.time = self._io.read_u4be()


        def _fetch_instances(self):
            pass


    class SignatureExpirationTime(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.SignatureExpirationTime, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.time = self._io.read_u4be()


        def _fetch_instances(self):
            pass


    class SignaturePacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.SignaturePacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.version = self._io.read_u1()
            self.signature_type = self._io.read_u1()
            self.public_key_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.PublicKeyAlgorithms, self._io.read_u1())
            self.hash_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.HashAlgorithms, self._io.read_u1())
            self.len_hashed_subpacket = self._io.read_u2be()
            self._raw_hashed_subpackets = self._io.read_bytes(self.len_hashed_subpacket)
            _io__raw_hashed_subpackets = KaitaiStream(BytesIO(self._raw_hashed_subpackets))
            self.hashed_subpackets = OpenpgpMessage.Subpackets(_io__raw_hashed_subpackets, self, self._root)
            self.len_unhashed_subpacket = self._io.read_u2be()
            self._raw_unhashed_subpackets = self._io.read_bytes(self.len_unhashed_subpacket)
            _io__raw_unhashed_subpackets = KaitaiStream(BytesIO(self._raw_unhashed_subpackets))
            self.unhashed_subpackets = OpenpgpMessage.Subpackets(_io__raw_unhashed_subpackets, self, self._root)
            self.left_signed_hash = self._io.read_u2be()
            self.rsa_n = self._io.read_u2be()
            self.signature = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass
            self.hashed_subpackets._fetch_instances()
            self.unhashed_subpackets._fetch_instances()


    class SignatureTarget(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.SignatureTarget, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.public_key_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.PublicKeyAlgorithms, self._io.read_u1())
            self.hash_algorithm = KaitaiStream.resolve_enum(OpenpgpMessage.HashAlgorithms, self._io.read_u1())
            self.hash = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass


    class SignersUserId(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.SignersUserId, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.user_id = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class Subpacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.Subpacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = OpenpgpMessage.LenSubpacket(self._io, self, self._root)
            self.subpacket_type = KaitaiStream.resolve_enum(OpenpgpMessage.SubpacketTypes, self._io.read_u1())
            _on = self.subpacket_type
            if _on == OpenpgpMessage.SubpacketTypes.embedded_signature:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.EmbeddedSignature(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.exportable_certification:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.ExportableCertification(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.features:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.Features(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.issuer:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.Issuer(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.key_expiration_time:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.KeyExpirationTime(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.key_flags:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.KeyFlags(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.key_server_preferences:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.KeyServerPreferences(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.notation_data:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.NotationData(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.policy_uri:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PolicyUri(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_compression_algorithms:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PreferredCompressionAlgorithms(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_hash_algorithms:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PreferredHashAlgorithms(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.preferred_key_server:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PreferredKeyServer(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.primary_user_id:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.PrimaryUserId(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.reason_for_revocation:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.ReasonForRevocation(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.regular_expression:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.RegularExpression(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.revocable:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.Revocable(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.revocation_key:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.RevocationKey(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.signature_creation_time:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.SignatureCreationTime(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.signature_expiration_time:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.SignatureExpirationTime(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.signature_target:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.SignatureTarget(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.signers_user_id:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.SignersUserId(_io__raw_content, self, self._root)
            elif _on == OpenpgpMessage.SubpacketTypes.trust_signature:
                pass
                self._raw_content = self._io.read_bytes(self.len.len - 1)
                _io__raw_content = KaitaiStream(BytesIO(self._raw_content))
                self.content = OpenpgpMessage.TrustSignature(_io__raw_content, self, self._root)
            else:
                pass
                self.content = self._io.read_bytes(self.len.len - 1)


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


    class Subpackets(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.Subpackets, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.subpacketss = []
            i = 0
            while not self._io.is_eof():
                self.subpacketss.append(OpenpgpMessage.Subpacket(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.subpacketss)):
                pass
                self.subpacketss[i]._fetch_instances()



    class TrustSignature(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.TrustSignature, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.level = self._io.read_u1()
            self.amount = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class UserIdPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(OpenpgpMessage.UserIdPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.user_id = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass



