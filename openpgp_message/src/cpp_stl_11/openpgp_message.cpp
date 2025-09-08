// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "openpgp_message.h"
const std::set<openpgp_message_t::compression_algorithms_t> openpgp_message_t::_values_compression_algorithms_t{
    openpgp_message_t::COMPRESSION_ALGORITHMS_UNCOMPRESSED,
    openpgp_message_t::COMPRESSION_ALGORITHMS_ZIB,
    openpgp_message_t::COMPRESSION_ALGORITHMS_ZLIB,
    openpgp_message_t::COMPRESSION_ALGORITHMS_BZIP,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_00,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_01,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_02,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_03,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_04,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_05,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_06,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_07,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_08,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_09,
    openpgp_message_t::COMPRESSION_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_10,
};
bool openpgp_message_t::_is_defined_compression_algorithms_t(openpgp_message_t::compression_algorithms_t v) {
    return openpgp_message_t::_values_compression_algorithms_t.find(v) != openpgp_message_t::_values_compression_algorithms_t.end();
}
const std::set<openpgp_message_t::hash_algorithms_t> openpgp_message_t::_values_hash_algorithms_t{
    openpgp_message_t::HASH_ALGORITHMS_MD5,
    openpgp_message_t::HASH_ALGORITHMS_SHA1,
    openpgp_message_t::HASH_ALGORITHMS_RIPEMD160,
    openpgp_message_t::HASH_ALGORITHMS_RESERVED4,
    openpgp_message_t::HASH_ALGORITHMS_RESERVED5,
    openpgp_message_t::HASH_ALGORITHMS_RESERVED6,
    openpgp_message_t::HASH_ALGORITHMS_RESERVED7,
    openpgp_message_t::HASH_ALGORITHMS_SHA256,
    openpgp_message_t::HASH_ALGORITHMS_SHA384,
    openpgp_message_t::HASH_ALGORITHMS_SHA512,
    openpgp_message_t::HASH_ALGORITHMS_SHA224,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_00,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_01,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_02,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_03,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_04,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_05,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_06,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_07,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_08,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_09,
    openpgp_message_t::HASH_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_10,
};
bool openpgp_message_t::_is_defined_hash_algorithms_t(openpgp_message_t::hash_algorithms_t v) {
    return openpgp_message_t::_values_hash_algorithms_t.find(v) != openpgp_message_t::_values_hash_algorithms_t.end();
}
const std::set<openpgp_message_t::key_flags_t> openpgp_message_t::_values_key_flags_t{
    openpgp_message_t::KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_CERTIFY_OTHER_KEYS,
    openpgp_message_t::KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_SIGN_DATA,
    openpgp_message_t::KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_ENCRYPT_COMMUNICATIONS,
    openpgp_message_t::KEY_FLAGS_THIS_KEY_MAY_BE_USED_TO_ENCRYPT_STORAGE,
    openpgp_message_t::KEY_FLAGS_THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_HAVE_BEEN_SPLIT_BY_A_SECRET_SHARING_MECHANISM,
    openpgp_message_t::KEY_FLAGS_THIS_KEY_MAY_BE_USED_FOR_AUTHENTICATION,
    openpgp_message_t::KEY_FLAGS_THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_BE_IN_THE_POSSESSION_OF_MORE_THAN_ONE_PERSON,
};
bool openpgp_message_t::_is_defined_key_flags_t(openpgp_message_t::key_flags_t v) {
    return openpgp_message_t::_values_key_flags_t.find(v) != openpgp_message_t::_values_key_flags_t.end();
}
const std::set<openpgp_message_t::packet_tags_t> openpgp_message_t::_values_packet_tags_t{
    openpgp_message_t::PACKET_TAGS_RESERVED_A_PACKET_TAG_MUST_NOT_HAVE_THIS_VALUE,
    openpgp_message_t::PACKET_TAGS_PUBLIC_KEY_ENCRYPTED_SESSION_KEY_PACKET,
    openpgp_message_t::PACKET_TAGS_SIGNATURE_PACKET,
    openpgp_message_t::PACKET_TAGS_SYMMETRIC_KEY_ENCRYPTED_SESSION_KEY_PACKET,
    openpgp_message_t::PACKET_TAGS_ONE_PASS_SIGNATURE_PACKET,
    openpgp_message_t::PACKET_TAGS_SECRET_KEY_PACKET,
    openpgp_message_t::PACKET_TAGS_PUBLIC_KEY_PACKET,
    openpgp_message_t::PACKET_TAGS_SECRET_SUBKEY_PACKET,
    openpgp_message_t::PACKET_TAGS_COMPRESSED_DATA_PACKET,
    openpgp_message_t::PACKET_TAGS_SYMMETRICALLY_ENCRYPTED_DATA_PACKET,
    openpgp_message_t::PACKET_TAGS_MARKER_PACKET,
    openpgp_message_t::PACKET_TAGS_LITERAL_DATA_PACKET,
    openpgp_message_t::PACKET_TAGS_TRUST_PACKET,
    openpgp_message_t::PACKET_TAGS_USER_ID_PACKET,
    openpgp_message_t::PACKET_TAGS_PUBLIC_SUBKEY_PACKET,
    openpgp_message_t::PACKET_TAGS_USER_ATTRIBUTE_PACKET,
    openpgp_message_t::PACKET_TAGS_SYM_ENCRYPTED_AND_INTEGRITY_PROTECTED_DATA_PACKET,
    openpgp_message_t::PACKET_TAGS_MODIFICATION_DETECTION_CODE_PACKET,
    openpgp_message_t::PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_0,
    openpgp_message_t::PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_1,
    openpgp_message_t::PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_2,
    openpgp_message_t::PACKET_TAGS_PRIVATE_OR_EXPERIMENTAL_VALUES_3,
};
bool openpgp_message_t::_is_defined_packet_tags_t(openpgp_message_t::packet_tags_t v) {
    return openpgp_message_t::_values_packet_tags_t.find(v) != openpgp_message_t::_values_packet_tags_t.end();
}
const std::set<openpgp_message_t::public_key_algorithms_t> openpgp_message_t::_values_public_key_algorithms_t{
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_RSA_ENCRYPT_OR_SIGN_HAC,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_RSA_ENCRYPT_ONLY_HAC,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_RSA_SIGN_ONLY_HAC,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_ELGAMAL_ENCRYPT_ONLY_ELGAMAL_HAC,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_DSA_DIGITAL_SIGNATURE_ALGORITHM_FIPS_HAC,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_RESERVED_FOR_ELLIPTIC_CURVE,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_RESERVED_FOR_ECDSA,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_RESERVED_FORMERLY_ELGAMAL_ENCRYPT_OR_SIGN_,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_RESERVED_FOR_DIFFIE_HELLMAN_X_AS_DEFINED_FOR_IETF_S_MIME,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_00,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_01,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_02,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_03,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_04,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_05,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_06,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_07,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_08,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_09,
    openpgp_message_t::PUBLIC_KEY_ALGORITHMS_PRIVATE_EXPERIMENTAL_ALGORITHM_10,
};
bool openpgp_message_t::_is_defined_public_key_algorithms_t(openpgp_message_t::public_key_algorithms_t v) {
    return openpgp_message_t::_values_public_key_algorithms_t.find(v) != openpgp_message_t::_values_public_key_algorithms_t.end();
}
const std::set<openpgp_message_t::revocation_codes_t> openpgp_message_t::_values_revocation_codes_t{
    openpgp_message_t::REVOCATION_CODES_NO_REASON_SPECIFIED_KEY_REVOCATIONS_OR_CERT_REVOCATIONS,
    openpgp_message_t::REVOCATION_CODES_KEY_IS_SUPERSEDED_KEY_REVOCATIONS,
    openpgp_message_t::REVOCATION_CODES_KEY_MATERIAL_HAS_BEEN_COMPROMISED_KEY_REVOCATIONS,
    openpgp_message_t::REVOCATION_CODES_KEY_IS_RETIRED_AND_NO_LONGER_USED_KEY_REVOCATIONS,
    openpgp_message_t::REVOCATION_CODES_USER_ID_INFORMATION_IS_NO_LONGER_VALID_CERT_REVOCATIONS,
    openpgp_message_t::REVOCATION_CODES_PRIVATE_USE_1,
    openpgp_message_t::REVOCATION_CODES_PRIVATE_USE_2,
    openpgp_message_t::REVOCATION_CODES_PRIVATE_USE_3,
    openpgp_message_t::REVOCATION_CODES_PRIVATE_USE_4,
    openpgp_message_t::REVOCATION_CODES_PRIVATE_USE_11,
};
bool openpgp_message_t::_is_defined_revocation_codes_t(openpgp_message_t::revocation_codes_t v) {
    return openpgp_message_t::_values_revocation_codes_t.find(v) != openpgp_message_t::_values_revocation_codes_t.end();
}
const std::set<openpgp_message_t::server_flags_t> openpgp_message_t::_values_server_flags_t{
    openpgp_message_t::SERVER_FLAGS_NO_MODIFY,
};
bool openpgp_message_t::_is_defined_server_flags_t(openpgp_message_t::server_flags_t v) {
    return openpgp_message_t::_values_server_flags_t.find(v) != openpgp_message_t::_values_server_flags_t.end();
}
const std::set<openpgp_message_t::subpacket_types_t> openpgp_message_t::_values_subpacket_types_t{
    openpgp_message_t::SUBPACKET_TYPES_RESERVED0,
    openpgp_message_t::SUBPACKET_TYPES_RESERVED1,
    openpgp_message_t::SUBPACKET_TYPES_SIGNATURE_CREATION_TIME,
    openpgp_message_t::SUBPACKET_TYPES_SIGNATURE_EXPIRATION_TIME,
    openpgp_message_t::SUBPACKET_TYPES_EXPORTABLE_CERTIFICATION,
    openpgp_message_t::SUBPACKET_TYPES_TRUST_SIGNATURE,
    openpgp_message_t::SUBPACKET_TYPES_REGULAR_EXPRESSION,
    openpgp_message_t::SUBPACKET_TYPES_REVOCABLE,
    openpgp_message_t::SUBPACKET_TYPES_RESERVED8,
    openpgp_message_t::SUBPACKET_TYPES_KEY_EXPIRATION_TIME,
    openpgp_message_t::SUBPACKET_TYPES_PLACEHOLDER_FOR_BACKWARD_COMPATIBILITY,
    openpgp_message_t::SUBPACKET_TYPES_PREFERRED_SYMMETRIC_ALGORITHMS,
    openpgp_message_t::SUBPACKET_TYPES_REVOCATION_KEY,
    openpgp_message_t::SUBPACKET_TYPES_RESERVED13,
    openpgp_message_t::SUBPACKET_TYPES_RESERVED14,
    openpgp_message_t::SUBPACKET_TYPES_RESERVED15,
    openpgp_message_t::SUBPACKET_TYPES_ISSUER,
    openpgp_message_t::SUBPACKET_TYPES_RESERVED17,
    openpgp_message_t::SUBPACKET_TYPES_RESERVED18,
    openpgp_message_t::SUBPACKET_TYPES_RESERVED19,
    openpgp_message_t::SUBPACKET_TYPES_NOTATION_DATA,
    openpgp_message_t::SUBPACKET_TYPES_PREFERRED_HASH_ALGORITHMS,
    openpgp_message_t::SUBPACKET_TYPES_PREFERRED_COMPRESSION_ALGORITHMS,
    openpgp_message_t::SUBPACKET_TYPES_KEY_SERVER_PREFERENCES,
    openpgp_message_t::SUBPACKET_TYPES_PREFERRED_KEY_SERVER,
    openpgp_message_t::SUBPACKET_TYPES_PRIMARY_USER_ID,
    openpgp_message_t::SUBPACKET_TYPES_POLICY_URI,
    openpgp_message_t::SUBPACKET_TYPES_KEY_FLAGS,
    openpgp_message_t::SUBPACKET_TYPES_SIGNERS_USER_ID,
    openpgp_message_t::SUBPACKET_TYPES_REASON_FOR_REVOCATION,
    openpgp_message_t::SUBPACKET_TYPES_FEATURES,
    openpgp_message_t::SUBPACKET_TYPES_SIGNATURE_TARGET,
    openpgp_message_t::SUBPACKET_TYPES_EMBEDDED_SIGNATURE,
};
bool openpgp_message_t::_is_defined_subpacket_types_t(openpgp_message_t::subpacket_types_t v) {
    return openpgp_message_t::_values_subpacket_types_t.find(v) != openpgp_message_t::_values_subpacket_types_t.end();
}
const std::set<openpgp_message_t::symmetric_key_algorithm_t> openpgp_message_t::_values_symmetric_key_algorithm_t{
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PLAIN,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_IDEA,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_TRIPLE_DES,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_CAST5,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_BLOWFISCH,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_RESERVED5,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_RESERVED6,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_AES_128,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_AES_192,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_AES_256,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_TWOFISH_256,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_00,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_01,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_02,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_03,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_04,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_05,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_06,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_07,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_08,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_09,
    openpgp_message_t::SYMMETRIC_KEY_ALGORITHM_PRIVATE_EXPERIMENTAL_ALGORITHM_10,
};
bool openpgp_message_t::_is_defined_symmetric_key_algorithm_t(openpgp_message_t::symmetric_key_algorithm_t v) {
    return openpgp_message_t::_values_symmetric_key_algorithm_t.find(v) != openpgp_message_t::_values_symmetric_key_algorithm_t.end();
}

openpgp_message_t::openpgp_message_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_packets = nullptr;
    _read();
}

void openpgp_message_t::_read() {
    m_packets = std::unique_ptr<std::vector<std::unique_ptr<packet_t>>>(new std::vector<std::unique_ptr<packet_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packets->push_back(std::move(std::unique_ptr<packet_t>(new packet_t(m__io, this, m__root))));
            i++;
        }
    }
}

openpgp_message_t::~openpgp_message_t() {
    _clean_up();
}

void openpgp_message_t::_clean_up() {
}

openpgp_message_t::embedded_signature_t::embedded_signature_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_signature_packet = nullptr;
    _read();
}

void openpgp_message_t::embedded_signature_t::_read() {
    m_signature_packet = std::unique_ptr<signature_packet_t>(new signature_packet_t(m__io, this, m__root));
}

openpgp_message_t::embedded_signature_t::~embedded_signature_t() {
    _clean_up();
}

void openpgp_message_t::embedded_signature_t::_clean_up() {
}

openpgp_message_t::exportable_certification_t::exportable_certification_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::exportable_certification_t::_read() {
    m_exportable = m__io->read_u1();
}

openpgp_message_t::exportable_certification_t::~exportable_certification_t() {
    _clean_up();
}

void openpgp_message_t::exportable_certification_t::_clean_up() {
}

openpgp_message_t::features_t::features_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::features_t::_read() {
    m_flags = m__io->read_bytes_full();
}

openpgp_message_t::features_t::~features_t() {
    _clean_up();
}

void openpgp_message_t::features_t::_clean_up() {
}

openpgp_message_t::issuer_t::issuer_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::issuer_t::_read() {
    m_keyid = m__io->read_u8be();
}

openpgp_message_t::issuer_t::~issuer_t() {
    _clean_up();
}

void openpgp_message_t::issuer_t::_clean_up() {
}

openpgp_message_t::key_expiration_time_t::key_expiration_time_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::key_expiration_time_t::_read() {
    m_time = m__io->read_u4be();
}

openpgp_message_t::key_expiration_time_t::~key_expiration_time_t() {
    _clean_up();
}

void openpgp_message_t::key_expiration_time_t::_clean_up() {
}

openpgp_message_t::key_flags_t::key_flags_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flag = nullptr;
    _read();
}

void openpgp_message_t::key_flags_t::_read() {
    m_flag = std::unique_ptr<std::vector<key_flags_t>>(new std::vector<key_flags_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_flag->push_back(std::move(static_cast<openpgp_message_t::key_flags_t>(m__io->read_u1())));
            i++;
        }
    }
}

openpgp_message_t::key_flags_t::~key_flags_t() {
    _clean_up();
}

void openpgp_message_t::key_flags_t::_clean_up() {
}

openpgp_message_t::key_server_preferences_t::key_server_preferences_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flag = nullptr;
    _read();
}

void openpgp_message_t::key_server_preferences_t::_read() {
    m_flag = std::unique_ptr<std::vector<server_flags_t>>(new std::vector<server_flags_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_flag->push_back(std::move(static_cast<openpgp_message_t::server_flags_t>(m__io->read_u1())));
            i++;
        }
    }
}

openpgp_message_t::key_server_preferences_t::~key_server_preferences_t() {
    _clean_up();
}

void openpgp_message_t::key_server_preferences_t::_clean_up() {
}

openpgp_message_t::len_subpacket_t::len_subpacket_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len = false;
    _read();
}

void openpgp_message_t::len_subpacket_t::_read() {
    m_first_octet = m__io->read_u1();
    n_second_octet = true;
    if ( ((first_octet() >= 192) && (first_octet() < 255)) ) {
        n_second_octet = false;
        m_second_octet = m__io->read_u1();
    }
    n_scalar = true;
    if (first_octet() == 255) {
        n_scalar = false;
        m_scalar = m__io->read_u4be();
    }
}

openpgp_message_t::len_subpacket_t::~len_subpacket_t() {
    _clean_up();
}

void openpgp_message_t::len_subpacket_t::_clean_up() {
    if (!n_second_octet) {
    }
    if (!n_scalar) {
    }
}

int32_t openpgp_message_t::len_subpacket_t::len() {
    if (f_len)
        return m_len;
    f_len = true;
    m_len = ((first_octet() < 192) ? (first_octet()) : ((( ((first_octet() >= 192) && (first_octet() < 255)) ) ? (((first_octet() - 192 << 8) + second_octet()) + 192) : (scalar()))));
    return m_len;
}

openpgp_message_t::notation_data_t::notation_data_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::notation_data_t::_read() {
    m_flags = m__io->read_bytes(4);
    m_len_name = m__io->read_u2be();
    m_len_value = m__io->read_u2be();
    m_name = m__io->read_bytes(len_name());
    m_value = m__io->read_bytes(len_value());
}

openpgp_message_t::notation_data_t::~notation_data_t() {
    _clean_up();
}

void openpgp_message_t::notation_data_t::_clean_up() {
}

openpgp_message_t::old_packet_t::old_packet_t(kaitai::kstream* p__io, openpgp_message_t::packet_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void openpgp_message_t::old_packet_t::_read() {
    n_len = true;
    switch (_parent()->len_type()) {
    case 0: {
        n_len = false;
        m_len = m__io->read_u1();
        break;
    }
    case 1: {
        n_len = false;
        m_len = m__io->read_u2be();
        break;
    }
    case 2: {
        n_len = false;
        m_len = m__io->read_u4be();
        break;
    }
    }
    n_body = true;
    switch (_parent()->packet_type_old()) {
    case openpgp_message_t::PACKET_TAGS_PUBLIC_KEY_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<public_key_packet_t>(new public_key_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case openpgp_message_t::PACKET_TAGS_PUBLIC_SUBKEY_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<public_key_packet_t>(new public_key_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case openpgp_message_t::PACKET_TAGS_SECRET_KEY_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<secret_key_packet_t>(new secret_key_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case openpgp_message_t::PACKET_TAGS_SECRET_SUBKEY_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<public_key_packet_t>(new public_key_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case openpgp_message_t::PACKET_TAGS_SIGNATURE_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<signature_packet_t>(new signature_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case openpgp_message_t::PACKET_TAGS_USER_ID_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<user_id_packet_t>(new user_id_packet_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len());
        break;
    }
    }
}

openpgp_message_t::old_packet_t::~old_packet_t() {
    _clean_up();
}

void openpgp_message_t::old_packet_t::_clean_up() {
    if (!n_len) {
    }
    if (!n_body) {
    }
}

openpgp_message_t::packet_t::packet_t(kaitai::kstream* p__io, openpgp_message_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::packet_t::_read() {
    m_one = m__io->read_bits_int_be(1);
    m_new_packet_format = m__io->read_bits_int_be(1);
    n_packet_type_new = true;
    if (new_packet_format()) {
        n_packet_type_new = false;
        m_packet_type_new = static_cast<openpgp_message_t::packet_tags_t>(m__io->read_bits_int_be(6));
    }
    n_packet_type_old = true;
    if (!(new_packet_format())) {
        n_packet_type_old = false;
        m_packet_type_old = static_cast<openpgp_message_t::packet_tags_t>(m__io->read_bits_int_be(4));
    }
    n_len_type = true;
    if (!(new_packet_format())) {
        n_len_type = false;
        m_len_type = m__io->read_bits_int_be(2);
    }
    m__io->align_to_byte();
    n_body = true;
    {
        bool on = new_packet_format();
        if (on == false) {
            n_body = false;
            m_body = std::unique_ptr<old_packet_t>(new old_packet_t(m__io, this, m__root));
        }
    }
}

openpgp_message_t::packet_t::~packet_t() {
    _clean_up();
}

void openpgp_message_t::packet_t::_clean_up() {
    if (!n_packet_type_new) {
    }
    if (!n_packet_type_old) {
    }
    if (!n_len_type) {
    }
    if (!n_body) {
    }
}

openpgp_message_t::policy_uri_t::policy_uri_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::policy_uri_t::_read() {
    m_uri = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

openpgp_message_t::policy_uri_t::~policy_uri_t() {
    _clean_up();
}

void openpgp_message_t::policy_uri_t::_clean_up() {
}

openpgp_message_t::preferred_compression_algorithms_t::preferred_compression_algorithms_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_algorithm = nullptr;
    _read();
}

void openpgp_message_t::preferred_compression_algorithms_t::_read() {
    m_algorithm = std::unique_ptr<std::vector<compression_algorithms_t>>(new std::vector<compression_algorithms_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_algorithm->push_back(std::move(static_cast<openpgp_message_t::compression_algorithms_t>(m__io->read_u1())));
            i++;
        }
    }
}

openpgp_message_t::preferred_compression_algorithms_t::~preferred_compression_algorithms_t() {
    _clean_up();
}

void openpgp_message_t::preferred_compression_algorithms_t::_clean_up() {
}

openpgp_message_t::preferred_hash_algorithms_t::preferred_hash_algorithms_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_algorithm = nullptr;
    _read();
}

void openpgp_message_t::preferred_hash_algorithms_t::_read() {
    m_algorithm = std::unique_ptr<std::vector<hash_algorithms_t>>(new std::vector<hash_algorithms_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_algorithm->push_back(std::move(static_cast<openpgp_message_t::hash_algorithms_t>(m__io->read_u1())));
            i++;
        }
    }
}

openpgp_message_t::preferred_hash_algorithms_t::~preferred_hash_algorithms_t() {
    _clean_up();
}

void openpgp_message_t::preferred_hash_algorithms_t::_clean_up() {
}

openpgp_message_t::preferred_key_server_t::preferred_key_server_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::preferred_key_server_t::_read() {
    m_uri = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

openpgp_message_t::preferred_key_server_t::~preferred_key_server_t() {
    _clean_up();
}

void openpgp_message_t::preferred_key_server_t::_clean_up() {
}

openpgp_message_t::primary_user_id_t::primary_user_id_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::primary_user_id_t::_read() {
    m_user_id = m__io->read_u1();
}

openpgp_message_t::primary_user_id_t::~primary_user_id_t() {
    _clean_up();
}

void openpgp_message_t::primary_user_id_t::_clean_up() {
}

openpgp_message_t::public_key_packet_t::public_key_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::public_key_packet_t::_read() {
    m_version = m__io->read_u1();
    m_timestamp = m__io->read_u4be();
    m_public_key_algorithm = static_cast<openpgp_message_t::public_key_algorithms_t>(m__io->read_u1());
    m_len_alg = m__io->read_u2be();
    m_rsa_n = m__io->read_bytes(len_alg() / 8);
    m_padding = m__io->read_u2be();
    m_rsa_e = m__io->read_bytes(3);
}

openpgp_message_t::public_key_packet_t::~public_key_packet_t() {
    _clean_up();
}

void openpgp_message_t::public_key_packet_t::_clean_up() {
}

openpgp_message_t::reason_for_revocation_t::reason_for_revocation_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::reason_for_revocation_t::_read() {
    m_revocation_code = static_cast<openpgp_message_t::revocation_codes_t>(m__io->read_u1());
    m_reason = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

openpgp_message_t::reason_for_revocation_t::~reason_for_revocation_t() {
    _clean_up();
}

void openpgp_message_t::reason_for_revocation_t::_clean_up() {
}

openpgp_message_t::regular_expression_t::regular_expression_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::regular_expression_t::_read() {
    m_regex = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8");
}

openpgp_message_t::regular_expression_t::~regular_expression_t() {
    _clean_up();
}

void openpgp_message_t::regular_expression_t::_clean_up() {
}

openpgp_message_t::revocable_t::revocable_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::revocable_t::_read() {
    m_revocable = m__io->read_u1();
}

openpgp_message_t::revocable_t::~revocable_t() {
    _clean_up();
}

void openpgp_message_t::revocable_t::_clean_up() {
}

openpgp_message_t::revocation_key_t::revocation_key_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::revocation_key_t::_read() {
    m_class = m__io->read_u1();
    m_public_key_algorithm = static_cast<openpgp_message_t::public_key_algorithms_t>(m__io->read_u1());
    m_fingerprint = m__io->read_bytes(20);
}

openpgp_message_t::revocation_key_t::~revocation_key_t() {
    _clean_up();
}

void openpgp_message_t::revocation_key_t::_clean_up() {
}

openpgp_message_t::secret_key_packet_t::secret_key_packet_t(kaitai::kstream* p__io, openpgp_message_t::old_packet_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_public_key = nullptr;
    _read();
}

void openpgp_message_t::secret_key_packet_t::_read() {
    m_public_key = std::unique_ptr<public_key_packet_t>(new public_key_packet_t(m__io, this, m__root));
    m_string_to_key = m__io->read_u1();
    n_symmetric_encryption_algorithm = true;
    if (string_to_key() >= 254) {
        n_symmetric_encryption_algorithm = false;
        m_symmetric_encryption_algorithm = static_cast<openpgp_message_t::symmetric_key_algorithm_t>(m__io->read_u1());
    }
    m_secret_key = m__io->read_bytes_full();
}

openpgp_message_t::secret_key_packet_t::~secret_key_packet_t() {
    _clean_up();
}

void openpgp_message_t::secret_key_packet_t::_clean_up() {
    if (!n_symmetric_encryption_algorithm) {
    }
}

openpgp_message_t::signature_creation_time_t::signature_creation_time_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::signature_creation_time_t::_read() {
    m_time = m__io->read_u4be();
}

openpgp_message_t::signature_creation_time_t::~signature_creation_time_t() {
    _clean_up();
}

void openpgp_message_t::signature_creation_time_t::_clean_up() {
}

openpgp_message_t::signature_expiration_time_t::signature_expiration_time_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::signature_expiration_time_t::_read() {
    m_time = m__io->read_u4be();
}

openpgp_message_t::signature_expiration_time_t::~signature_expiration_time_t() {
    _clean_up();
}

void openpgp_message_t::signature_expiration_time_t::_clean_up() {
}

openpgp_message_t::signature_packet_t::signature_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_hashed_subpackets = nullptr;
    m__io__raw_hashed_subpackets = nullptr;
    m_unhashed_subpackets = nullptr;
    m__io__raw_unhashed_subpackets = nullptr;
    _read();
}

void openpgp_message_t::signature_packet_t::_read() {
    m_version = m__io->read_u1();
    m_signature_type = m__io->read_u1();
    m_public_key_algorithm = static_cast<openpgp_message_t::public_key_algorithms_t>(m__io->read_u1());
    m_hash_algorithm = static_cast<openpgp_message_t::hash_algorithms_t>(m__io->read_u1());
    m_len_hashed_subpacket = m__io->read_u2be();
    m__raw_hashed_subpackets = m__io->read_bytes(len_hashed_subpacket());
    m__io__raw_hashed_subpackets = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_hashed_subpackets));
    m_hashed_subpackets = std::unique_ptr<subpackets_t>(new subpackets_t(m__io__raw_hashed_subpackets.get(), this, m__root));
    m_len_unhashed_subpacket = m__io->read_u2be();
    m__raw_unhashed_subpackets = m__io->read_bytes(len_unhashed_subpacket());
    m__io__raw_unhashed_subpackets = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_unhashed_subpackets));
    m_unhashed_subpackets = std::unique_ptr<subpackets_t>(new subpackets_t(m__io__raw_unhashed_subpackets.get(), this, m__root));
    m_left_signed_hash = m__io->read_u2be();
    m_rsa_n = m__io->read_u2be();
    m_signature = m__io->read_bytes_full();
}

openpgp_message_t::signature_packet_t::~signature_packet_t() {
    _clean_up();
}

void openpgp_message_t::signature_packet_t::_clean_up() {
}

openpgp_message_t::signature_target_t::signature_target_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::signature_target_t::_read() {
    m_public_key_algorithm = static_cast<openpgp_message_t::public_key_algorithms_t>(m__io->read_u1());
    m_hash_algorithm = static_cast<openpgp_message_t::hash_algorithms_t>(m__io->read_u1());
    m_hash = m__io->read_bytes_full();
}

openpgp_message_t::signature_target_t::~signature_target_t() {
    _clean_up();
}

void openpgp_message_t::signature_target_t::_clean_up() {
}

openpgp_message_t::signers_user_id_t::signers_user_id_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::signers_user_id_t::_read() {
    m_user_id = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

openpgp_message_t::signers_user_id_t::~signers_user_id_t() {
    _clean_up();
}

void openpgp_message_t::signers_user_id_t::_clean_up() {
}

openpgp_message_t::subpacket_t::subpacket_t(kaitai::kstream* p__io, openpgp_message_t::subpackets_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = nullptr;
    m__io__raw_content = nullptr;
    _read();
}

void openpgp_message_t::subpacket_t::_read() {
    m_len = std::unique_ptr<len_subpacket_t>(new len_subpacket_t(m__io, this, m__root));
    m_subpacket_type = static_cast<openpgp_message_t::subpacket_types_t>(m__io->read_u1());
    n_content = true;
    switch (subpacket_type()) {
    case openpgp_message_t::SUBPACKET_TYPES_EMBEDDED_SIGNATURE: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<embedded_signature_t>(new embedded_signature_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_EXPORTABLE_CERTIFICATION: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<exportable_certification_t>(new exportable_certification_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_FEATURES: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<features_t>(new features_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_ISSUER: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<issuer_t>(new issuer_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_KEY_EXPIRATION_TIME: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<key_expiration_time_t>(new key_expiration_time_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_KEY_FLAGS: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<key_flags_t>(new key_flags_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_KEY_SERVER_PREFERENCES: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<key_server_preferences_t>(new key_server_preferences_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_NOTATION_DATA: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<notation_data_t>(new notation_data_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_POLICY_URI: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<policy_uri_t>(new policy_uri_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_PREFERRED_COMPRESSION_ALGORITHMS: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<preferred_compression_algorithms_t>(new preferred_compression_algorithms_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_PREFERRED_HASH_ALGORITHMS: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<preferred_hash_algorithms_t>(new preferred_hash_algorithms_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_PREFERRED_KEY_SERVER: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<preferred_key_server_t>(new preferred_key_server_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_PRIMARY_USER_ID: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<primary_user_id_t>(new primary_user_id_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_REASON_FOR_REVOCATION: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<reason_for_revocation_t>(new reason_for_revocation_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_REGULAR_EXPRESSION: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<regular_expression_t>(new regular_expression_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_REVOCABLE: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<revocable_t>(new revocable_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_REVOCATION_KEY: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<revocation_key_t>(new revocation_key_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_SIGNATURE_CREATION_TIME: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<signature_creation_time_t>(new signature_creation_time_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_SIGNATURE_EXPIRATION_TIME: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<signature_expiration_time_t>(new signature_expiration_time_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_SIGNATURE_TARGET: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<signature_target_t>(new signature_target_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_SIGNERS_USER_ID: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<signers_user_id_t>(new signers_user_id_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_TRUST_SIGNATURE: {
        n_content = false;
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        m__io__raw_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_content));
        m_content = std::unique_ptr<trust_signature_t>(new trust_signature_t(m__io__raw_content.get(), this, m__root));
        break;
    }
    default: {
        m__raw_content = m__io->read_bytes(len()->len() - 1);
        break;
    }
    }
}

openpgp_message_t::subpacket_t::~subpacket_t() {
    _clean_up();
}

void openpgp_message_t::subpacket_t::_clean_up() {
    if (!n_content) {
    }
}

openpgp_message_t::subpackets_t::subpackets_t(kaitai::kstream* p__io, openpgp_message_t::signature_packet_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_subpacketss = nullptr;
    _read();
}

void openpgp_message_t::subpackets_t::_read() {
    m_subpacketss = std::unique_ptr<std::vector<std::unique_ptr<subpacket_t>>>(new std::vector<std::unique_ptr<subpacket_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_subpacketss->push_back(std::move(std::unique_ptr<subpacket_t>(new subpacket_t(m__io, this, m__root))));
            i++;
        }
    }
}

openpgp_message_t::subpackets_t::~subpackets_t() {
    _clean_up();
}

void openpgp_message_t::subpackets_t::_clean_up() {
}

openpgp_message_t::trust_signature_t::trust_signature_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::trust_signature_t::_read() {
    m_level = m__io->read_u1();
    m_amount = m__io->read_u1();
}

openpgp_message_t::trust_signature_t::~trust_signature_t() {
    _clean_up();
}

void openpgp_message_t::trust_signature_t::_clean_up() {
}

openpgp_message_t::user_id_packet_t::user_id_packet_t(kaitai::kstream* p__io, openpgp_message_t::old_packet_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void openpgp_message_t::user_id_packet_t::_read() {
    m_user_id = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

openpgp_message_t::user_id_packet_t::~user_id_packet_t() {
    _clean_up();
}

void openpgp_message_t::user_id_packet_t::_clean_up() {
}
