// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "openpgp_message.h"

openpgp_message_t::openpgp_message_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_packets = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::_read() {
    m_packets = new std::vector<packet_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packets->push_back(new packet_t(m__io, this, m__root));
            i++;
        }
    }
}

openpgp_message_t::~openpgp_message_t() {
    _clean_up();
}

void openpgp_message_t::_clean_up() {
    if (m_packets) {
        for (std::vector<packet_t*>::iterator it = m_packets->begin(); it != m_packets->end(); ++it) {
            delete *it;
        }
        delete m_packets; m_packets = 0;
    }
}

openpgp_message_t::preferred_hash_algorithms_t::preferred_hash_algorithms_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_algorithm = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::preferred_hash_algorithms_t::_read() {
    m_algorithm = new std::vector<hash_algorithms_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_algorithm->push_back(static_cast<openpgp_message_t::hash_algorithms_t>(m__io->read_u1()));
            i++;
        }
    }
}

openpgp_message_t::preferred_hash_algorithms_t::~preferred_hash_algorithms_t() {
    _clean_up();
}

void openpgp_message_t::preferred_hash_algorithms_t::_clean_up() {
    if (m_algorithm) {
        delete m_algorithm; m_algorithm = 0;
    }
}

openpgp_message_t::preferred_compression_algorithms_t::preferred_compression_algorithms_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_algorithm = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::preferred_compression_algorithms_t::_read() {
    m_algorithm = new std::vector<compression_algorithms_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_algorithm->push_back(static_cast<openpgp_message_t::compression_algorithms_t>(m__io->read_u1()));
            i++;
        }
    }
}

openpgp_message_t::preferred_compression_algorithms_t::~preferred_compression_algorithms_t() {
    _clean_up();
}

void openpgp_message_t::preferred_compression_algorithms_t::_clean_up() {
    if (m_algorithm) {
        delete m_algorithm; m_algorithm = 0;
    }
}

openpgp_message_t::signers_user_id_t::signers_user_id_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::signers_user_id_t::_read() {
    m_user_id = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

openpgp_message_t::signers_user_id_t::~signers_user_id_t() {
    _clean_up();
}

void openpgp_message_t::signers_user_id_t::_clean_up() {
}

openpgp_message_t::secret_key_packet_t::secret_key_packet_t(kaitai::kstream* p__io, openpgp_message_t::old_packet_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_public_key = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::secret_key_packet_t::_read() {
    m_public_key = new public_key_packet_t(m__io, this, m__root);
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
    if (m_public_key) {
        delete m_public_key; m_public_key = 0;
    }
    if (!n_symmetric_encryption_algorithm) {
    }
}

openpgp_message_t::key_server_preferences_t::key_server_preferences_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flag = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::key_server_preferences_t::_read() {
    m_flag = new std::vector<server_flags_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_flag->push_back(static_cast<openpgp_message_t::server_flags_t>(m__io->read_u1()));
            i++;
        }
    }
}

openpgp_message_t::key_server_preferences_t::~key_server_preferences_t() {
    _clean_up();
}

void openpgp_message_t::key_server_preferences_t::_clean_up() {
    if (m_flag) {
        delete m_flag; m_flag = 0;
    }
}

openpgp_message_t::regular_expression_t::regular_expression_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::regular_expression_t::_read() {
    m_regex = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
}

openpgp_message_t::regular_expression_t::~regular_expression_t() {
    _clean_up();
}

void openpgp_message_t::regular_expression_t::_clean_up() {
}

openpgp_message_t::subpackets_t::subpackets_t(kaitai::kstream* p__io, openpgp_message_t::signature_packet_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_subpacketss = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::subpackets_t::_read() {
    m_subpacketss = new std::vector<subpacket_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_subpacketss->push_back(new subpacket_t(m__io, this, m__root));
            i++;
        }
    }
}

openpgp_message_t::subpackets_t::~subpackets_t() {
    _clean_up();
}

void openpgp_message_t::subpackets_t::_clean_up() {
    if (m_subpacketss) {
        for (std::vector<subpacket_t*>::iterator it = m_subpacketss->begin(); it != m_subpacketss->end(); ++it) {
            delete *it;
        }
        delete m_subpacketss; m_subpacketss = 0;
    }
}

openpgp_message_t::revocation_key_t::revocation_key_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

openpgp_message_t::user_id_packet_t::user_id_packet_t(kaitai::kstream* p__io, openpgp_message_t::old_packet_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::user_id_packet_t::_read() {
    m_user_id = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

openpgp_message_t::user_id_packet_t::~user_id_packet_t() {
    _clean_up();
}

void openpgp_message_t::user_id_packet_t::_clean_up() {
}

openpgp_message_t::policy_uri_t::policy_uri_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::policy_uri_t::_read() {
    m_uri = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

openpgp_message_t::policy_uri_t::~policy_uri_t() {
    _clean_up();
}

void openpgp_message_t::policy_uri_t::_clean_up() {
}

openpgp_message_t::signature_target_t::signature_target_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

openpgp_message_t::key_flags_t::key_flags_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flag = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::key_flags_t::_read() {
    m_flag = new std::vector<key_flags_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_flag->push_back(static_cast<openpgp_message_t::key_flags_t>(m__io->read_u1()));
            i++;
        }
    }
}

openpgp_message_t::key_flags_t::~key_flags_t() {
    _clean_up();
}

void openpgp_message_t::key_flags_t::_clean_up() {
    if (m_flag) {
        delete m_flag; m_flag = 0;
    }
}

openpgp_message_t::features_t::features_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::features_t::_read() {
    m_flags = m__io->read_bytes_full();
}

openpgp_message_t::features_t::~features_t() {
    _clean_up();
}

void openpgp_message_t::features_t::_clean_up() {
}

openpgp_message_t::primary_user_id_t::primary_user_id_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::primary_user_id_t::_read() {
    m_user_id = m__io->read_u1();
}

openpgp_message_t::primary_user_id_t::~primary_user_id_t() {
    _clean_up();
}

void openpgp_message_t::primary_user_id_t::_clean_up() {
}

openpgp_message_t::subpacket_t::subpacket_t(kaitai::kstream* p__io, openpgp_message_t::subpackets_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = 0;
    m__io__raw_content = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::subpacket_t::_read() {
    m_len = new len_subpacket_t(m__io, this, m__root);
    m_subpacket_type = static_cast<openpgp_message_t::subpacket_types_t>(m__io->read_u1());
    n_content = true;
    switch (subpacket_type()) {
    case openpgp_message_t::SUBPACKET_TYPES_PREFERRED_KEY_SERVER: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new preferred_key_server_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_ISSUER: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new issuer_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_REVOCABLE: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new revocable_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_SIGNATURE_TARGET: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new signature_target_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_REGULAR_EXPRESSION: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new regular_expression_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_EXPORTABLE_CERTIFICATION: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new exportable_certification_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_REASON_FOR_REVOCATION: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new reason_for_revocation_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_KEY_SERVER_PREFERENCES: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new key_server_preferences_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_SIGNATURE_CREATION_TIME: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new signature_creation_time_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_PREFERRED_HASH_ALGORITHMS: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new preferred_hash_algorithms_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_TRUST_SIGNATURE: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new trust_signature_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_KEY_EXPIRATION_TIME: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new key_expiration_time_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_KEY_FLAGS: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new key_flags_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_SIGNATURE_EXPIRATION_TIME: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new signature_expiration_time_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_FEATURES: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new features_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_SIGNERS_USER_ID: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new signers_user_id_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_NOTATION_DATA: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new notation_data_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_REVOCATION_KEY: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new revocation_key_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_PREFERRED_COMPRESSION_ALGORITHMS: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new preferred_compression_algorithms_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_POLICY_URI: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new policy_uri_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_PRIMARY_USER_ID: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new primary_user_id_t(m__io__raw_content, this, m__root);
        break;
    }
    case openpgp_message_t::SUBPACKET_TYPES_EMBEDDED_SIGNATURE: {
        n_content = false;
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        m__io__raw_content = new kaitai::kstream(m__raw_content);
        m_content = new embedded_signature_t(m__io__raw_content, this, m__root);
        break;
    }
    default: {
        m__raw_content = m__io->read_bytes((len()->len() - 1));
        break;
    }
    }
}

openpgp_message_t::subpacket_t::~subpacket_t() {
    _clean_up();
}

void openpgp_message_t::subpacket_t::_clean_up() {
    if (m_len) {
        delete m_len; m_len = 0;
    }
    if (!n_content) {
        if (m__io__raw_content) {
            delete m__io__raw_content; m__io__raw_content = 0;
        }
        if (m_content) {
            delete m_content; m_content = 0;
        }
    }
}

openpgp_message_t::old_packet_t::old_packet_t(kaitai::kstream* p__io, openpgp_message_t::packet_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new public_key_packet_t(m__io__raw_body, this, m__root);
        break;
    }
    case openpgp_message_t::PACKET_TAGS_PUBLIC_SUBKEY_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new public_key_packet_t(m__io__raw_body, this, m__root);
        break;
    }
    case openpgp_message_t::PACKET_TAGS_USER_ID_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new user_id_packet_t(m__io__raw_body, this, m__root);
        break;
    }
    case openpgp_message_t::PACKET_TAGS_SIGNATURE_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new signature_packet_t(m__io__raw_body, this, m__root);
        break;
    }
    case openpgp_message_t::PACKET_TAGS_SECRET_SUBKEY_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new public_key_packet_t(m__io__raw_body, this, m__root);
        break;
    }
    case openpgp_message_t::PACKET_TAGS_SECRET_KEY_PACKET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new secret_key_packet_t(m__io__raw_body, this, m__root);
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
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

openpgp_message_t::issuer_t::issuer_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::issuer_t::_read() {
    m_keyid = m__io->read_u8be();
}

openpgp_message_t::issuer_t::~issuer_t() {
    _clean_up();
}

void openpgp_message_t::issuer_t::_clean_up() {
}

openpgp_message_t::exportable_certification_t::exportable_certification_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::exportable_certification_t::_read() {
    m_exportable = m__io->read_u1();
}

openpgp_message_t::exportable_certification_t::~exportable_certification_t() {
    _clean_up();
}

void openpgp_message_t::exportable_certification_t::_clean_up() {
}

openpgp_message_t::signature_expiration_time_t::signature_expiration_time_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::signature_expiration_time_t::_read() {
    m_time = m__io->read_u4be();
}

openpgp_message_t::signature_expiration_time_t::~signature_expiration_time_t() {
    _clean_up();
}

void openpgp_message_t::signature_expiration_time_t::_clean_up() {
}

openpgp_message_t::signature_creation_time_t::signature_creation_time_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::signature_creation_time_t::_read() {
    m_time = m__io->read_u4be();
}

openpgp_message_t::signature_creation_time_t::~signature_creation_time_t() {
    _clean_up();
}

void openpgp_message_t::signature_creation_time_t::_clean_up() {
}

openpgp_message_t::signature_packet_t::signature_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_hashed_subpackets = 0;
    m__io__raw_hashed_subpackets = 0;
    m_unhashed_subpackets = 0;
    m__io__raw_unhashed_subpackets = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::signature_packet_t::_read() {
    m_version = m__io->read_u1();
    m_signature_type = m__io->read_u1();
    m_public_key_algorithm = static_cast<openpgp_message_t::public_key_algorithms_t>(m__io->read_u1());
    m_hash_algorithm = static_cast<openpgp_message_t::hash_algorithms_t>(m__io->read_u1());
    m_len_hashed_subpacket = m__io->read_u2be();
    m__raw_hashed_subpackets = m__io->read_bytes(len_hashed_subpacket());
    m__io__raw_hashed_subpackets = new kaitai::kstream(m__raw_hashed_subpackets);
    m_hashed_subpackets = new subpackets_t(m__io__raw_hashed_subpackets, this, m__root);
    m_len_unhashed_subpacket = m__io->read_u2be();
    m__raw_unhashed_subpackets = m__io->read_bytes(len_unhashed_subpacket());
    m__io__raw_unhashed_subpackets = new kaitai::kstream(m__raw_unhashed_subpackets);
    m_unhashed_subpackets = new subpackets_t(m__io__raw_unhashed_subpackets, this, m__root);
    m_left_signed_hash = m__io->read_u2be();
    m_rsa_n = m__io->read_u2be();
    m_signature = m__io->read_bytes_full();
}

openpgp_message_t::signature_packet_t::~signature_packet_t() {
    _clean_up();
}

void openpgp_message_t::signature_packet_t::_clean_up() {
    if (m__io__raw_hashed_subpackets) {
        delete m__io__raw_hashed_subpackets; m__io__raw_hashed_subpackets = 0;
    }
    if (m_hashed_subpackets) {
        delete m_hashed_subpackets; m_hashed_subpackets = 0;
    }
    if (m__io__raw_unhashed_subpackets) {
        delete m__io__raw_unhashed_subpackets; m__io__raw_unhashed_subpackets = 0;
    }
    if (m_unhashed_subpackets) {
        delete m_unhashed_subpackets; m_unhashed_subpackets = 0;
    }
}

openpgp_message_t::revocable_t::revocable_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::revocable_t::_read() {
    m_revocable = m__io->read_u1();
}

openpgp_message_t::revocable_t::~revocable_t() {
    _clean_up();
}

void openpgp_message_t::revocable_t::_clean_up() {
}

openpgp_message_t::embedded_signature_t::embedded_signature_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_signature_packet = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::embedded_signature_t::_read() {
    m_signature_packet = new signature_packet_t(m__io, this, m__root);
}

openpgp_message_t::embedded_signature_t::~embedded_signature_t() {
    _clean_up();
}

void openpgp_message_t::embedded_signature_t::_clean_up() {
    if (m_signature_packet) {
        delete m_signature_packet; m_signature_packet = 0;
    }
}

openpgp_message_t::preferred_key_server_t::preferred_key_server_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::preferred_key_server_t::_read() {
    m_uri = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

openpgp_message_t::preferred_key_server_t::~preferred_key_server_t() {
    _clean_up();
}

void openpgp_message_t::preferred_key_server_t::_clean_up() {
}

openpgp_message_t::reason_for_revocation_t::reason_for_revocation_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::reason_for_revocation_t::_read() {
    m_revocation_code = static_cast<openpgp_message_t::revocation_codes_t>(m__io->read_u1());
    m_reason = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

openpgp_message_t::reason_for_revocation_t::~reason_for_revocation_t() {
    _clean_up();
}

void openpgp_message_t::reason_for_revocation_t::_clean_up() {
}

openpgp_message_t::len_subpacket_t::len_subpacket_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_len = ((first_octet() < 192) ? (first_octet()) : ((( ((first_octet() >= 192) && (first_octet() < 255)) ) ? (((((first_octet() - 192) << 8) + second_octet()) + 192)) : (scalar()))));
    f_len = true;
    return m_len;
}

openpgp_message_t::notation_data_t::notation_data_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

openpgp_message_t::public_key_packet_t::public_key_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::public_key_packet_t::_read() {
    m_version = m__io->read_u1();
    m_timestamp = m__io->read_u4be();
    m_public_key_algorithm = static_cast<openpgp_message_t::public_key_algorithms_t>(m__io->read_u1());
    m_len_alg = m__io->read_u2be();
    m_rsa_n = m__io->read_bytes((len_alg() / 8));
    m_padding = m__io->read_u2be();
    m_rsa_e = m__io->read_bytes(3);
}

openpgp_message_t::public_key_packet_t::~public_key_packet_t() {
    _clean_up();
}

void openpgp_message_t::public_key_packet_t::_clean_up() {
}

openpgp_message_t::key_expiration_time_t::key_expiration_time_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void openpgp_message_t::key_expiration_time_t::_read() {
    m_time = m__io->read_u4be();
}

openpgp_message_t::key_expiration_time_t::~key_expiration_time_t() {
    _clean_up();
}

void openpgp_message_t::key_expiration_time_t::_clean_up() {
}

openpgp_message_t::packet_t::packet_t(kaitai::kstream* p__io, openpgp_message_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
            m_body = new old_packet_t(m__io, this, m__root);
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
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

openpgp_message_t::trust_signature_t::trust_signature_t(kaitai::kstream* p__io, openpgp_message_t::subpacket_t* p__parent, openpgp_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
