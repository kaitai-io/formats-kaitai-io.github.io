// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mach_o.h"

mach_o_t::mach_o_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m_load_commands = nullptr;
    _read();
}

void mach_o_t::_read() {
    m_magic = static_cast<mach_o_t::magic_type_t>(m__io->read_u4be());
    m_header = std::unique_ptr<mach_header_t>(new mach_header_t(m__io, this, m__root));
    m_load_commands = std::unique_ptr<std::vector<std::unique_ptr<load_command_t>>>(new std::vector<std::unique_ptr<load_command_t>>());
    const int l_load_commands = header()->ncmds();
    for (int i = 0; i < l_load_commands; i++) {
        m_load_commands->push_back(std::move(std::unique_ptr<load_command_t>(new load_command_t(m__io, this, m__root))));
    }
}

mach_o_t::~mach_o_t() {
    _clean_up();
}

void mach_o_t::_clean_up() {
}

mach_o_t::rpath_command_t::rpath_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::rpath_command_t::_read() {
    m_path_offset = m__io->read_u4le();
    m_path = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("utf-8"));
}

mach_o_t::rpath_command_t::~rpath_command_t() {
    _clean_up();
}

void mach_o_t::rpath_command_t::_clean_up() {
}

mach_o_t::uleb128_t::uleb128_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void mach_o_t::uleb128_t::_read() {
    m_b1 = m__io->read_u1();
    n_b2 = true;
    if ((b1() & 128) != 0) {
        n_b2 = false;
        m_b2 = m__io->read_u1();
    }
    n_b3 = true;
    if ((b2() & 128) != 0) {
        n_b3 = false;
        m_b3 = m__io->read_u1();
    }
    n_b4 = true;
    if ((b3() & 128) != 0) {
        n_b4 = false;
        m_b4 = m__io->read_u1();
    }
    n_b5 = true;
    if ((b4() & 128) != 0) {
        n_b5 = false;
        m_b5 = m__io->read_u1();
    }
    n_b6 = true;
    if ((b5() & 128) != 0) {
        n_b6 = false;
        m_b6 = m__io->read_u1();
    }
    n_b7 = true;
    if ((b6() & 128) != 0) {
        n_b7 = false;
        m_b7 = m__io->read_u1();
    }
    n_b8 = true;
    if ((b7() & 128) != 0) {
        n_b8 = false;
        m_b8 = m__io->read_u1();
    }
    n_b9 = true;
    if ((b8() & 128) != 0) {
        n_b9 = false;
        m_b9 = m__io->read_u1();
    }
    n_b10 = true;
    if ((b9() & 128) != 0) {
        n_b10 = false;
        m_b10 = m__io->read_u1();
    }
}

mach_o_t::uleb128_t::~uleb128_t() {
    _clean_up();
}

void mach_o_t::uleb128_t::_clean_up() {
    if (!n_b2) {
    }
    if (!n_b3) {
    }
    if (!n_b4) {
    }
    if (!n_b5) {
    }
    if (!n_b6) {
    }
    if (!n_b7) {
    }
    if (!n_b8) {
    }
    if (!n_b9) {
    }
    if (!n_b10) {
    }
}

int32_t mach_o_t::uleb128_t::value() {
    if (f_value)
        return m_value;
    m_value = ((kaitai::kstream::mod(b1(), 128) << 0) + (((b1() & 128) == 0) ? (0) : (((kaitai::kstream::mod(b2(), 128) << 7) + (((b2() & 128) == 0) ? (0) : (((kaitai::kstream::mod(b3(), 128) << 14) + (((b3() & 128) == 0) ? (0) : (((kaitai::kstream::mod(b4(), 128) << 21) + (((b4() & 128) == 0) ? (0) : (((kaitai::kstream::mod(b5(), 128) << 28) + (((b5() & 128) == 0) ? (0) : (((kaitai::kstream::mod(b6(), 128) << 35) + (((b6() & 128) == 0) ? (0) : (((kaitai::kstream::mod(b7(), 128) << 42) + (((b7() & 128) == 0) ? (0) : (((kaitai::kstream::mod(b8(), 128) << 49) + (((b8() & 128) == 0) ? (0) : (((kaitai::kstream::mod(b9(), 128) << 56) + (((b8() & 128) == 0) ? (0) : ((kaitai::kstream::mod(b10(), 128) << 63))))))))))))))))))))))))))));
    f_value = true;
    return m_value;
}

mach_o_t::source_version_command_t::source_version_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::source_version_command_t::_read() {
    m_version = m__io->read_u8le();
}

mach_o_t::source_version_command_t::~source_version_command_t() {
    _clean_up();
}

void mach_o_t::source_version_command_t::_clean_up() {
}

mach_o_t::cs_blob_t::cs_blob_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::_read() {
    m_magic = static_cast<mach_o_t::cs_blob_t::cs_magic_t>(m__io->read_u4be());
    m_length = m__io->read_u4be();
    n_body = true;
    switch (magic()) {
    case mach_o_t::cs_blob_t::CS_MAGIC_REQUIREMENT: {
        n_body = false;
        m__raw_body = m__io->read_bytes((length() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<requirement_t>(new requirement_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::CS_MAGIC_CODE_DIRECTORY: {
        n_body = false;
        m__raw_body = m__io->read_bytes((length() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<code_directory_t>(new code_directory_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::CS_MAGIC_REQUIREMENTS: {
        n_body = false;
        m__raw_body = m__io->read_bytes((length() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<requirements_t>(new requirements_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::CS_MAGIC_BLOB_WRAPPER: {
        n_body = false;
        m__raw_body = m__io->read_bytes((length() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<blob_wrapper_t>(new blob_wrapper_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::CS_MAGIC_EMBEDDED_SIGNATURE: {
        n_body = false;
        m__raw_body = m__io->read_bytes((length() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<super_blob_t>(new super_blob_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::CS_MAGIC_ENTITLEMENTS: {
        n_body = false;
        m__raw_body = m__io->read_bytes((length() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<entitlements_t>(new entitlements_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::CS_MAGIC_DETACHED_SIGNATURE: {
        n_body = false;
        m__raw_body = m__io->read_bytes((length() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<super_blob_t>(new super_blob_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::CS_MAGIC_DER_ENTITLEMENTS: {
        n_body = false;
        m__raw_body = m__io->read_bytes((length() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<asn1_der_t>(new asn1_der_t(m__io__raw_body.get()));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes((length() - 8));
        break;
    }
    }
}

mach_o_t::cs_blob_t::~cs_blob_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::_clean_up() {
    if (!n_body) {
    }
}

mach_o_t::cs_blob_t::code_directory_t::code_directory_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_hashes = nullptr;
    f_ident = false;
    f_team_id = false;
    f_hashes = false;
    _read();
}

void mach_o_t::cs_blob_t::code_directory_t::_read() {
    m_version = m__io->read_u4be();
    m_flags = m__io->read_u4be();
    m_hash_offset = m__io->read_u4be();
    m_ident_offset = m__io->read_u4be();
    m_n_special_slots = m__io->read_u4be();
    m_n_code_slots = m__io->read_u4be();
    m_code_limit = m__io->read_u4be();
    m_hash_size = m__io->read_u1();
    m_hash_type = m__io->read_u1();
    m_spare1 = m__io->read_u1();
    m_page_size = m__io->read_u1();
    m_spare2 = m__io->read_u4be();
    n_scatter_offset = true;
    if (version() >= 131328) {
        n_scatter_offset = false;
        m_scatter_offset = m__io->read_u4be();
    }
    n_team_id_offset = true;
    if (version() >= 131584) {
        n_team_id_offset = false;
        m_team_id_offset = m__io->read_u4be();
    }
}

mach_o_t::cs_blob_t::code_directory_t::~code_directory_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::code_directory_t::_clean_up() {
    if (!n_scatter_offset) {
    }
    if (!n_team_id_offset) {
    }
    if (f_ident) {
    }
    if (f_team_id) {
    }
    if (f_hashes) {
    }
}

std::string mach_o_t::cs_blob_t::code_directory_t::ident() {
    if (f_ident)
        return m_ident;
    std::streampos _pos = m__io->pos();
    m__io->seek((ident_offset() - 8));
    m_ident = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("utf-8"));
    m__io->seek(_pos);
    f_ident = true;
    return m_ident;
}

std::string mach_o_t::cs_blob_t::code_directory_t::team_id() {
    if (f_team_id)
        return m_team_id;
    std::streampos _pos = m__io->pos();
    m__io->seek((team_id_offset() - 8));
    m_team_id = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("utf-8"));
    m__io->seek(_pos);
    f_team_id = true;
    return m_team_id;
}

std::vector<std::string>* mach_o_t::cs_blob_t::code_directory_t::hashes() {
    if (f_hashes)
        return m_hashes.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(((hash_offset() - 8) - (hash_size() * n_special_slots())));
    m_hashes = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_hashes = (n_special_slots() + n_code_slots());
    for (int i = 0; i < l_hashes; i++) {
        m_hashes->push_back(std::move(m__io->read_bytes(hash_size())));
    }
    m__io->seek(_pos);
    f_hashes = true;
    return m_hashes.get();
}

mach_o_t::cs_blob_t::data_t::data_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::cs_blob_t::data_t::_read() {
    m_length = m__io->read_u4be();
    m_value = m__io->read_bytes(length());
    m_padding = m__io->read_bytes(kaitai::kstream::mod(-(length()), 4));
}

mach_o_t::cs_blob_t::data_t::~data_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::data_t::_clean_up() {
}

mach_o_t::cs_blob_t::super_blob_t::super_blob_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_blobs = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::super_blob_t::_read() {
    m_count = m__io->read_u4be();
    m_blobs = std::unique_ptr<std::vector<std::unique_ptr<blob_index_t>>>(new std::vector<std::unique_ptr<blob_index_t>>());
    const int l_blobs = count();
    for (int i = 0; i < l_blobs; i++) {
        m_blobs->push_back(std::move(std::unique_ptr<blob_index_t>(new blob_index_t(m__io, this, m__root))));
    }
}

mach_o_t::cs_blob_t::super_blob_t::~super_blob_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::super_blob_t::_clean_up() {
}

mach_o_t::cs_blob_t::expr_t::expr_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::_read() {
    m_op = static_cast<mach_o_t::cs_blob_t::expr_t::op_enum_t>(m__io->read_u4be());
    n_data = true;
    switch (op()) {
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_IDENT: {
        n_data = false;
        m_data = std::unique_ptr<ident_expr_t>(new ident_expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_OR_OP: {
        n_data = false;
        m_data = std::unique_ptr<or_expr_t>(new or_expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_INFO_KEY_VALUE: {
        n_data = false;
        m_data = std::unique_ptr<data_t>(new data_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_ANCHOR_HASH: {
        n_data = false;
        m_data = std::unique_ptr<anchor_hash_expr_t>(new anchor_hash_expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_INFO_KEY_FIELD: {
        n_data = false;
        m_data = std::unique_ptr<info_key_field_expr_t>(new info_key_field_expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_NOT_OP: {
        n_data = false;
        m_data = std::unique_ptr<expr_t>(new expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_ENTITLEMENT_FIELD: {
        n_data = false;
        m_data = std::unique_ptr<entitlement_field_expr_t>(new entitlement_field_expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_TRUSTED_CERT: {
        n_data = false;
        m_data = std::unique_ptr<cert_slot_expr_t>(new cert_slot_expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_AND_OP: {
        n_data = false;
        m_data = std::unique_ptr<and_expr_t>(new and_expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_CERT_GENERIC: {
        n_data = false;
        m_data = std::unique_ptr<cert_generic_expr_t>(new cert_generic_expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_CERT_FIELD: {
        n_data = false;
        m_data = std::unique_ptr<cert_field_expr_t>(new cert_field_expr_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_CD_HASH: {
        n_data = false;
        m_data = std::unique_ptr<data_t>(new data_t(m__io, this, m__root));
        break;
    }
    case mach_o_t::cs_blob_t::expr_t::OP_ENUM_APPLE_GENERIC_ANCHOR: {
        n_data = false;
        m_data = std::unique_ptr<apple_generic_anchor_expr_t>(new apple_generic_anchor_expr_t(m__io, this, m__root));
        break;
    }
    }
}

mach_o_t::cs_blob_t::expr_t::~expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::_clean_up() {
    if (!n_data) {
    }
}

mach_o_t::cs_blob_t::expr_t::info_key_field_expr_t::info_key_field_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    m_match = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::info_key_field_expr_t::_read() {
    m_data = std::unique_ptr<data_t>(new data_t(m__io, this, m__root));
    m_match = std::unique_ptr<match_t>(new match_t(m__io, this, m__root));
}

mach_o_t::cs_blob_t::expr_t::info_key_field_expr_t::~info_key_field_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::info_key_field_expr_t::_clean_up() {
}

mach_o_t::cs_blob_t::expr_t::cert_slot_expr_t::cert_slot_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::cert_slot_expr_t::_read() {
    m_value = static_cast<mach_o_t::cs_blob_t::expr_t::cert_slot_t>(m__io->read_u4be());
}

mach_o_t::cs_blob_t::expr_t::cert_slot_expr_t::~cert_slot_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::cert_slot_expr_t::_clean_up() {
}

mach_o_t::cs_blob_t::expr_t::cert_generic_expr_t::cert_generic_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    m_match = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::cert_generic_expr_t::_read() {
    m_cert_slot = static_cast<mach_o_t::cs_blob_t::expr_t::cert_slot_t>(m__io->read_u4be());
    m_data = std::unique_ptr<data_t>(new data_t(m__io, this, m__root));
    m_match = std::unique_ptr<match_t>(new match_t(m__io, this, m__root));
}

mach_o_t::cs_blob_t::expr_t::cert_generic_expr_t::~cert_generic_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::cert_generic_expr_t::_clean_up() {
}

mach_o_t::cs_blob_t::expr_t::ident_expr_t::ident_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_identifier = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::ident_expr_t::_read() {
    m_identifier = std::unique_ptr<data_t>(new data_t(m__io, this, m__root));
}

mach_o_t::cs_blob_t::expr_t::ident_expr_t::~ident_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::ident_expr_t::_clean_up() {
}

mach_o_t::cs_blob_t::expr_t::cert_field_expr_t::cert_field_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    m_match = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::cert_field_expr_t::_read() {
    m_cert_slot = static_cast<mach_o_t::cs_blob_t::expr_t::cert_slot_t>(m__io->read_u4be());
    m_data = std::unique_ptr<data_t>(new data_t(m__io, this, m__root));
    m_match = std::unique_ptr<match_t>(new match_t(m__io, this, m__root));
}

mach_o_t::cs_blob_t::expr_t::cert_field_expr_t::~cert_field_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::cert_field_expr_t::_clean_up() {
}

mach_o_t::cs_blob_t::expr_t::anchor_hash_expr_t::anchor_hash_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::anchor_hash_expr_t::_read() {
    m_cert_slot = static_cast<mach_o_t::cs_blob_t::expr_t::cert_slot_t>(m__io->read_u4be());
    m_data = std::unique_ptr<data_t>(new data_t(m__io, this, m__root));
}

mach_o_t::cs_blob_t::expr_t::anchor_hash_expr_t::~anchor_hash_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::anchor_hash_expr_t::_clean_up() {
}

mach_o_t::cs_blob_t::expr_t::apple_generic_anchor_expr_t::apple_generic_anchor_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::apple_generic_anchor_expr_t::_read() {
}

mach_o_t::cs_blob_t::expr_t::apple_generic_anchor_expr_t::~apple_generic_anchor_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::apple_generic_anchor_expr_t::_clean_up() {
}

std::string mach_o_t::cs_blob_t::expr_t::apple_generic_anchor_expr_t::value() {
    if (f_value)
        return m_value;
    m_value = std::string("anchor apple generic");
    f_value = true;
    return m_value;
}

mach_o_t::cs_blob_t::expr_t::entitlement_field_expr_t::entitlement_field_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    m_match = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::entitlement_field_expr_t::_read() {
    m_data = std::unique_ptr<data_t>(new data_t(m__io, this, m__root));
    m_match = std::unique_ptr<match_t>(new match_t(m__io, this, m__root));
}

mach_o_t::cs_blob_t::expr_t::entitlement_field_expr_t::~entitlement_field_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::entitlement_field_expr_t::_clean_up() {
}

mach_o_t::cs_blob_t::expr_t::and_expr_t::and_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_left = nullptr;
    m_right = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::and_expr_t::_read() {
    m_left = std::unique_ptr<expr_t>(new expr_t(m__io, this, m__root));
    m_right = std::unique_ptr<expr_t>(new expr_t(m__io, this, m__root));
}

mach_o_t::cs_blob_t::expr_t::and_expr_t::~and_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::and_expr_t::_clean_up() {
}

mach_o_t::cs_blob_t::expr_t::or_expr_t::or_expr_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::expr_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_left = nullptr;
    m_right = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::expr_t::or_expr_t::_read() {
    m_left = std::unique_ptr<expr_t>(new expr_t(m__io, this, m__root));
    m_right = std::unique_ptr<expr_t>(new expr_t(m__io, this, m__root));
}

mach_o_t::cs_blob_t::expr_t::or_expr_t::~or_expr_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::expr_t::or_expr_t::_clean_up() {
}

mach_o_t::cs_blob_t::blob_index_t::blob_index_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::super_blob_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_blob = nullptr;
    m__io__raw_blob = nullptr;
    f_blob = false;
    _read();
}

void mach_o_t::cs_blob_t::blob_index_t::_read() {
    m_type = static_cast<mach_o_t::cs_blob_t::blob_index_t::csslot_type_t>(m__io->read_u4be());
    m_offset = m__io->read_u4be();
}

mach_o_t::cs_blob_t::blob_index_t::~blob_index_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::blob_index_t::_clean_up() {
    if (f_blob) {
    }
}

mach_o_t::cs_blob_t* mach_o_t::cs_blob_t::blob_index_t::blob() {
    if (f_blob)
        return m_blob.get();
    kaitai::kstream *io = _parent()->_io();
    std::streampos _pos = io->pos();
    io->seek((offset() - 8));
    m__raw_blob = io->read_bytes_full();
    m__io__raw_blob = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_blob));
    m_blob = std::unique_ptr<cs_blob_t>(new cs_blob_t(m__io__raw_blob.get(), this, m__root));
    io->seek(_pos);
    f_blob = true;
    return m_blob.get();
}

mach_o_t::cs_blob_t::match_t::match_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::match_t::_read() {
    m_match_op = static_cast<mach_o_t::cs_blob_t::match_t::op_t>(m__io->read_u4be());
    n_data = true;
    if (match_op() != mach_o_t::cs_blob_t::match_t::OP_EXISTS) {
        n_data = false;
        m_data = std::unique_ptr<data_t>(new data_t(m__io, this, m__root));
    }
}

mach_o_t::cs_blob_t::match_t::~match_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::match_t::_clean_up() {
    if (!n_data) {
    }
}

mach_o_t::cs_blob_t::requirement_t::requirement_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_expr = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::requirement_t::_read() {
    m_kind = m__io->read_u4be();
    m_expr = std::unique_ptr<expr_t>(new expr_t(m__io, this, m__root));
}

mach_o_t::cs_blob_t::requirement_t::~requirement_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::requirement_t::_clean_up() {
}

mach_o_t::cs_blob_t::requirements_t::requirements_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void mach_o_t::cs_blob_t::requirements_t::_read() {
    m_count = m__io->read_u4be();
    m_items = std::unique_ptr<std::vector<std::unique_ptr<requirements_blob_index_t>>>(new std::vector<std::unique_ptr<requirements_blob_index_t>>());
    const int l_items = count();
    for (int i = 0; i < l_items; i++) {
        m_items->push_back(std::move(std::unique_ptr<requirements_blob_index_t>(new requirements_blob_index_t(m__io, this, m__root))));
    }
}

mach_o_t::cs_blob_t::requirements_t::~requirements_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::requirements_t::_clean_up() {
}

mach_o_t::cs_blob_t::blob_wrapper_t::blob_wrapper_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::cs_blob_t::blob_wrapper_t::_read() {
    m_data = m__io->read_bytes_full();
}

mach_o_t::cs_blob_t::blob_wrapper_t::~blob_wrapper_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::blob_wrapper_t::_clean_up() {
}

mach_o_t::cs_blob_t::entitlements_t::entitlements_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::cs_blob_t::entitlements_t::_read() {
    m_data = m__io->read_bytes_full();
}

mach_o_t::cs_blob_t::entitlements_t::~entitlements_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::entitlements_t::_clean_up() {
}

mach_o_t::cs_blob_t::requirements_blob_index_t::requirements_blob_index_t(kaitai::kstream* p__io, mach_o_t::cs_blob_t::requirements_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = nullptr;
    f_value = false;
    _read();
}

void mach_o_t::cs_blob_t::requirements_blob_index_t::_read() {
    m_type = static_cast<mach_o_t::cs_blob_t::requirements_blob_index_t::requirement_type_t>(m__io->read_u4be());
    m_offset = m__io->read_u4be();
}

mach_o_t::cs_blob_t::requirements_blob_index_t::~requirements_blob_index_t() {
    _clean_up();
}

void mach_o_t::cs_blob_t::requirements_blob_index_t::_clean_up() {
    if (f_value) {
    }
}

mach_o_t::cs_blob_t* mach_o_t::cs_blob_t::requirements_blob_index_t::value() {
    if (f_value)
        return m_value.get();
    std::streampos _pos = m__io->pos();
    m__io->seek((offset() - 8));
    m_value = std::unique_ptr<cs_blob_t>(new cs_blob_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_value = true;
    return m_value.get();
}

mach_o_t::build_version_command_t::build_version_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tools = nullptr;
    _read();
}

void mach_o_t::build_version_command_t::_read() {
    m_platform = m__io->read_u4le();
    m_minos = m__io->read_u4le();
    m_sdk = m__io->read_u4le();
    m_ntools = m__io->read_u4le();
    m_tools = std::unique_ptr<std::vector<std::unique_ptr<build_tool_version_t>>>(new std::vector<std::unique_ptr<build_tool_version_t>>());
    const int l_tools = ntools();
    for (int i = 0; i < l_tools; i++) {
        m_tools->push_back(std::move(std::unique_ptr<build_tool_version_t>(new build_tool_version_t(m__io, this, m__root))));
    }
}

mach_o_t::build_version_command_t::~build_version_command_t() {
    _clean_up();
}

void mach_o_t::build_version_command_t::_clean_up() {
}

mach_o_t::build_version_command_t::build_tool_version_t::build_tool_version_t(kaitai::kstream* p__io, mach_o_t::build_version_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::build_version_command_t::build_tool_version_t::_read() {
    m_tool = m__io->read_u4le();
    m_version = m__io->read_u4le();
}

mach_o_t::build_version_command_t::build_tool_version_t::~build_tool_version_t() {
    _clean_up();
}

void mach_o_t::build_version_command_t::build_tool_version_t::_clean_up() {
}

mach_o_t::routines_command_t::routines_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::routines_command_t::_read() {
    m_init_address = m__io->read_u4le();
    m_init_module = m__io->read_u4le();
    m_reserved = m__io->read_bytes(24);
}

mach_o_t::routines_command_t::~routines_command_t() {
    _clean_up();
}

void mach_o_t::routines_command_t::_clean_up() {
}

mach_o_t::macho_flags_t::macho_flags_t(uint32_t p_value, kaitai::kstream* p__io, mach_o_t::mach_header_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_subsections_via_symbols = false;
    f_dead_strippable_dylib = false;
    f_weak_defines = false;
    f_prebound = false;
    f_all_mods_bound = false;
    f_has_tlv_descriptors = false;
    f_force_flat = false;
    f_root_safe = false;
    f_no_undefs = false;
    f_setuid_safe = false;
    f_no_heap_execution = false;
    f_no_reexported_dylibs = false;
    f_no_multi_defs = false;
    f_app_extension_safe = false;
    f_prebindable = false;
    f_incr_link = false;
    f_bind_at_load = false;
    f_canonical = false;
    f_two_level = false;
    f_split_segs = false;
    f_lazy_init = false;
    f_allow_stack_execution = false;
    f_binds_to_weak = false;
    f_no_fix_prebinding = false;
    f_dyld_link = false;
    f_pie = false;
    _read();
}

void mach_o_t::macho_flags_t::_read() {
}

mach_o_t::macho_flags_t::~macho_flags_t() {
    _clean_up();
}

void mach_o_t::macho_flags_t::_clean_up() {
}

bool mach_o_t::macho_flags_t::subsections_via_symbols() {
    if (f_subsections_via_symbols)
        return m_subsections_via_symbols;
    m_subsections_via_symbols = (value() & 8192) != 0;
    f_subsections_via_symbols = true;
    return m_subsections_via_symbols;
}

bool mach_o_t::macho_flags_t::dead_strippable_dylib() {
    if (f_dead_strippable_dylib)
        return m_dead_strippable_dylib;
    m_dead_strippable_dylib = (value() & 4194304) != 0;
    f_dead_strippable_dylib = true;
    return m_dead_strippable_dylib;
}

bool mach_o_t::macho_flags_t::weak_defines() {
    if (f_weak_defines)
        return m_weak_defines;
    m_weak_defines = (value() & 32768) != 0;
    f_weak_defines = true;
    return m_weak_defines;
}

bool mach_o_t::macho_flags_t::prebound() {
    if (f_prebound)
        return m_prebound;
    m_prebound = (value() & 16) != 0;
    f_prebound = true;
    return m_prebound;
}

bool mach_o_t::macho_flags_t::all_mods_bound() {
    if (f_all_mods_bound)
        return m_all_mods_bound;
    m_all_mods_bound = (value() & 4096) != 0;
    f_all_mods_bound = true;
    return m_all_mods_bound;
}

bool mach_o_t::macho_flags_t::has_tlv_descriptors() {
    if (f_has_tlv_descriptors)
        return m_has_tlv_descriptors;
    m_has_tlv_descriptors = (value() & 8388608) != 0;
    f_has_tlv_descriptors = true;
    return m_has_tlv_descriptors;
}

bool mach_o_t::macho_flags_t::force_flat() {
    if (f_force_flat)
        return m_force_flat;
    m_force_flat = (value() & 256) != 0;
    f_force_flat = true;
    return m_force_flat;
}

bool mach_o_t::macho_flags_t::root_safe() {
    if (f_root_safe)
        return m_root_safe;
    m_root_safe = (value() & 262144) != 0;
    f_root_safe = true;
    return m_root_safe;
}

bool mach_o_t::macho_flags_t::no_undefs() {
    if (f_no_undefs)
        return m_no_undefs;
    m_no_undefs = (value() & 1) != 0;
    f_no_undefs = true;
    return m_no_undefs;
}

bool mach_o_t::macho_flags_t::setuid_safe() {
    if (f_setuid_safe)
        return m_setuid_safe;
    m_setuid_safe = (value() & 524288) != 0;
    f_setuid_safe = true;
    return m_setuid_safe;
}

bool mach_o_t::macho_flags_t::no_heap_execution() {
    if (f_no_heap_execution)
        return m_no_heap_execution;
    m_no_heap_execution = (value() & 16777216) != 0;
    f_no_heap_execution = true;
    return m_no_heap_execution;
}

bool mach_o_t::macho_flags_t::no_reexported_dylibs() {
    if (f_no_reexported_dylibs)
        return m_no_reexported_dylibs;
    m_no_reexported_dylibs = (value() & 1048576) != 0;
    f_no_reexported_dylibs = true;
    return m_no_reexported_dylibs;
}

bool mach_o_t::macho_flags_t::no_multi_defs() {
    if (f_no_multi_defs)
        return m_no_multi_defs;
    m_no_multi_defs = (value() & 512) != 0;
    f_no_multi_defs = true;
    return m_no_multi_defs;
}

bool mach_o_t::macho_flags_t::app_extension_safe() {
    if (f_app_extension_safe)
        return m_app_extension_safe;
    m_app_extension_safe = (value() & 33554432) != 0;
    f_app_extension_safe = true;
    return m_app_extension_safe;
}

bool mach_o_t::macho_flags_t::prebindable() {
    if (f_prebindable)
        return m_prebindable;
    m_prebindable = (value() & 2048) != 0;
    f_prebindable = true;
    return m_prebindable;
}

bool mach_o_t::macho_flags_t::incr_link() {
    if (f_incr_link)
        return m_incr_link;
    m_incr_link = (value() & 2) != 0;
    f_incr_link = true;
    return m_incr_link;
}

bool mach_o_t::macho_flags_t::bind_at_load() {
    if (f_bind_at_load)
        return m_bind_at_load;
    m_bind_at_load = (value() & 8) != 0;
    f_bind_at_load = true;
    return m_bind_at_load;
}

bool mach_o_t::macho_flags_t::canonical() {
    if (f_canonical)
        return m_canonical;
    m_canonical = (value() & 16384) != 0;
    f_canonical = true;
    return m_canonical;
}

bool mach_o_t::macho_flags_t::two_level() {
    if (f_two_level)
        return m_two_level;
    m_two_level = (value() & 128) != 0;
    f_two_level = true;
    return m_two_level;
}

bool mach_o_t::macho_flags_t::split_segs() {
    if (f_split_segs)
        return m_split_segs;
    m_split_segs = (value() & 32) != 0;
    f_split_segs = true;
    return m_split_segs;
}

bool mach_o_t::macho_flags_t::lazy_init() {
    if (f_lazy_init)
        return m_lazy_init;
    m_lazy_init = (value() & 64) != 0;
    f_lazy_init = true;
    return m_lazy_init;
}

bool mach_o_t::macho_flags_t::allow_stack_execution() {
    if (f_allow_stack_execution)
        return m_allow_stack_execution;
    m_allow_stack_execution = (value() & 131072) != 0;
    f_allow_stack_execution = true;
    return m_allow_stack_execution;
}

bool mach_o_t::macho_flags_t::binds_to_weak() {
    if (f_binds_to_weak)
        return m_binds_to_weak;
    m_binds_to_weak = (value() & 65536) != 0;
    f_binds_to_weak = true;
    return m_binds_to_weak;
}

bool mach_o_t::macho_flags_t::no_fix_prebinding() {
    if (f_no_fix_prebinding)
        return m_no_fix_prebinding;
    m_no_fix_prebinding = (value() & 1024) != 0;
    f_no_fix_prebinding = true;
    return m_no_fix_prebinding;
}

bool mach_o_t::macho_flags_t::dyld_link() {
    if (f_dyld_link)
        return m_dyld_link;
    m_dyld_link = (value() & 4) != 0;
    f_dyld_link = true;
    return m_dyld_link;
}

bool mach_o_t::macho_flags_t::pie() {
    if (f_pie)
        return m_pie;
    m_pie = (value() & 2097152) != 0;
    f_pie = true;
    return m_pie;
}

mach_o_t::routines_command_64_t::routines_command_64_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::routines_command_64_t::_read() {
    m_init_address = m__io->read_u8le();
    m_init_module = m__io->read_u8le();
    m_reserved = m__io->read_bytes(48);
}

mach_o_t::routines_command_64_t::~routines_command_64_t() {
    _clean_up();
}

void mach_o_t::routines_command_64_t::_clean_up() {
}

mach_o_t::linker_option_command_t::linker_option_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_strings = nullptr;
    _read();
}

void mach_o_t::linker_option_command_t::_read() {
    m_num_strings = m__io->read_u4le();
    m_strings = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_strings = num_strings();
    for (int i = 0; i < l_strings; i++) {
        m_strings->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("utf-8"))));
    }
}

mach_o_t::linker_option_command_t::~linker_option_command_t() {
    _clean_up();
}

void mach_o_t::linker_option_command_t::_clean_up() {
}

mach_o_t::segment_command_64_t::segment_command_64_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_maxprot = nullptr;
    m_initprot = nullptr;
    m_sections = nullptr;
    _read();
}

void mach_o_t::segment_command_64_t::_read() {
    m_segname = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(16), 0), std::string("ascii"));
    m_vmaddr = m__io->read_u8le();
    m_vmsize = m__io->read_u8le();
    m_fileoff = m__io->read_u8le();
    m_filesize = m__io->read_u8le();
    m_maxprot = std::unique_ptr<vm_prot_t>(new vm_prot_t(m__io, this, m__root));
    m_initprot = std::unique_ptr<vm_prot_t>(new vm_prot_t(m__io, this, m__root));
    m_nsects = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_sections = std::unique_ptr<std::vector<std::unique_ptr<section_64_t>>>(new std::vector<std::unique_ptr<section_64_t>>());
    const int l_sections = nsects();
    for (int i = 0; i < l_sections; i++) {
        m_sections->push_back(std::move(std::unique_ptr<section_64_t>(new section_64_t(m__io, this, m__root))));
    }
}

mach_o_t::segment_command_64_t::~segment_command_64_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::_clean_up() {
}

mach_o_t::segment_command_64_t::section_64_t::section_64_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_data = nullptr;
    f_data = false;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::_read() {
    m_sect_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(16), 0), std::string("ascii"));
    m_seg_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(16), 0), std::string("ascii"));
    m_addr = m__io->read_u8le();
    m_size = m__io->read_u8le();
    m_offset = m__io->read_u4le();
    m_align = m__io->read_u4le();
    m_reloff = m__io->read_u4le();
    m_nreloc = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_reserved1 = m__io->read_u4le();
    m_reserved2 = m__io->read_u4le();
    m_reserved3 = m__io->read_u4le();
}

mach_o_t::segment_command_64_t::section_64_t::~section_64_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::_clean_up() {
    if (f_data && !n_data) {
    }
}

mach_o_t::segment_command_64_t::section_64_t::cf_string_list_t::cf_string_list_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::cf_string_list_t::_read() {
    m_items = std::unique_ptr<std::vector<std::unique_ptr<cf_string_t>>>(new std::vector<std::unique_ptr<cf_string_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_items->push_back(std::move(std::unique_ptr<cf_string_t>(new cf_string_t(m__io, this, m__root))));
            i++;
        }
    }
}

mach_o_t::segment_command_64_t::section_64_t::cf_string_list_t::~cf_string_list_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::cf_string_list_t::_clean_up() {
}

mach_o_t::segment_command_64_t::section_64_t::cf_string_t::cf_string_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t::cf_string_list_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::cf_string_t::_read() {
    m_isa = m__io->read_u8le();
    m_info = m__io->read_u8le();
    m_data = m__io->read_u8le();
    m_length = m__io->read_u8le();
}

mach_o_t::segment_command_64_t::section_64_t::cf_string_t::~cf_string_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::cf_string_t::_clean_up() {
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::eh_frame_item_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t::eh_frame_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::_read() {
    m_length = m__io->read_u4le();
    n_length64 = true;
    if (length() == 4294967295UL) {
        n_length64 = false;
        m_length64 = m__io->read_u8le();
    }
    m_id = m__io->read_u4le();
    n_body = true;
    if (length() > 0) {
        n_body = false;
        n_body = true;
        switch (id()) {
        case 0: {
            n_body = false;
            m__raw_body = m__io->read_bytes((length() - 4));
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<cie_t>(new cie_t(m__io__raw_body.get(), this, m__root));
            break;
        }
        default: {
            m__raw_body = m__io->read_bytes((length() - 4));
            break;
        }
        }
    }
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::~eh_frame_item_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::_clean_up() {
    if (!n_length64) {
    }
    if (!n_body) {
    }
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::char_chain_t::char_chain_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_next = nullptr;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::char_chain_t::_read() {
    m_chr = m__io->read_u1();
    n_next = true;
    if (chr() != 0) {
        n_next = false;
        m_next = std::unique_ptr<char_chain_t>(new char_chain_t(m__io, this, m__root));
    }
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::char_chain_t::~char_chain_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::char_chain_t::_clean_up() {
    if (!n_next) {
    }
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::cie_t::cie_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_aug_str = nullptr;
    m_code_alignment_factor = nullptr;
    m_data_alignment_factor = nullptr;
    m_augmentation = nullptr;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::cie_t::_read() {
    m_version = m__io->read_u1();
    m_aug_str = std::unique_ptr<char_chain_t>(new char_chain_t(m__io, this, m__root));
    m_code_alignment_factor = std::unique_ptr<uleb128_t>(new uleb128_t(m__io, this, m__root));
    m_data_alignment_factor = std::unique_ptr<uleb128_t>(new uleb128_t(m__io, this, m__root));
    m_return_address_register = m__io->read_u1();
    n_augmentation = true;
    if (aug_str()->chr() == 122) {
        n_augmentation = false;
        m_augmentation = std::unique_ptr<augmentation_entry_t>(new augmentation_entry_t(m__io, this, m__root));
    }
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::cie_t::~cie_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::cie_t::_clean_up() {
    if (!n_augmentation) {
    }
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::augmentation_entry_t::augmentation_entry_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::cie_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_length = nullptr;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::augmentation_entry_t::_read() {
    m_length = std::unique_ptr<uleb128_t>(new uleb128_t(m__io, this, m__root));
    n_fde_pointer_encoding = true;
    if (_parent()->aug_str()->next()->chr() == 82) {
        n_fde_pointer_encoding = false;
        m_fde_pointer_encoding = m__io->read_u1();
    }
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::augmentation_entry_t::~augmentation_entry_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_item_t::augmentation_entry_t::_clean_up() {
    if (!n_fde_pointer_encoding) {
    }
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_t::eh_frame_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_t::_read() {
    m_items = std::unique_ptr<std::vector<std::unique_ptr<eh_frame_item_t>>>(new std::vector<std::unique_ptr<eh_frame_item_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_items->push_back(std::move(std::unique_ptr<eh_frame_item_t>(new eh_frame_item_t(m__io, this, m__root))));
            i++;
        }
    }
}

mach_o_t::segment_command_64_t::section_64_t::eh_frame_t::~eh_frame_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::eh_frame_t::_clean_up() {
}

mach_o_t::segment_command_64_t::section_64_t::pointer_list_t::pointer_list_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::pointer_list_t::_read() {
    m_items = std::unique_ptr<std::vector<uint64_t>>(new std::vector<uint64_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_items->push_back(std::move(m__io->read_u8le()));
            i++;
        }
    }
}

mach_o_t::segment_command_64_t::section_64_t::pointer_list_t::~pointer_list_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::pointer_list_t::_clean_up() {
}

mach_o_t::segment_command_64_t::section_64_t::string_list_t::string_list_t(kaitai::kstream* p__io, mach_o_t::segment_command_64_t::section_64_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_strings = nullptr;
    _read();
}

void mach_o_t::segment_command_64_t::section_64_t::string_list_t::_read() {
    m_strings = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_strings->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ascii"))));
            i++;
        }
    }
}

mach_o_t::segment_command_64_t::section_64_t::string_list_t::~string_list_t() {
    _clean_up();
}

void mach_o_t::segment_command_64_t::section_64_t::string_list_t::_clean_up() {
}

kaitai::kstruct* mach_o_t::segment_command_64_t::section_64_t::data() {
    if (f_data)
        return m_data.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    n_data = true;
    {
        std::string on = sect_name();
        if (on == std::string("__objc_nlclslist")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_methname")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<string_list_t>(new string_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__nl_symbol_ptr")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__la_symbol_ptr")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_selrefs")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__cstring")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<string_list_t>(new string_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_classlist")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_protolist")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_imageinfo")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_methtype")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<string_list_t>(new string_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__cfstring")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<cf_string_list_t>(new cf_string_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_classrefs")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_protorefs")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_classname")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<string_list_t>(new string_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__got")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__eh_frame")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<eh_frame_t>(new eh_frame_t(m__io__raw_data.get(), this, m__root));
        }
        else if (on == std::string("__objc_superrefs")) {
            n_data = false;
            m__raw_data = io->read_bytes(size());
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<pointer_list_t>(new pointer_list_t(m__io__raw_data.get(), this, m__root));
        }
        else {
            m__raw_data = io->read_bytes(size());
        }
    }
    io->seek(_pos);
    f_data = true;
    return m_data.get();
}

mach_o_t::vm_prot_t::vm_prot_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::vm_prot_t::_read() {
    m_strip_read = m__io->read_bits_int_be(1);
    m_is_mask = m__io->read_bits_int_be(1);
    m_reserved0 = m__io->read_bits_int_be(1);
    m_copy = m__io->read_bits_int_be(1);
    m_no_change = m__io->read_bits_int_be(1);
    m_execute = m__io->read_bits_int_be(1);
    m_write = m__io->read_bits_int_be(1);
    m_read = m__io->read_bits_int_be(1);
    m_reserved1 = m__io->read_bits_int_be(24);
}

mach_o_t::vm_prot_t::~vm_prot_t() {
    _clean_up();
}

void mach_o_t::vm_prot_t::_clean_up() {
}

mach_o_t::dysymtab_command_t::dysymtab_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_indirect_symbols = nullptr;
    f_indirect_symbols = false;
    _read();
}

void mach_o_t::dysymtab_command_t::_read() {
    m_i_local_sym = m__io->read_u4le();
    m_n_local_sym = m__io->read_u4le();
    m_i_ext_def_sym = m__io->read_u4le();
    m_n_ext_def_sym = m__io->read_u4le();
    m_i_undef_sym = m__io->read_u4le();
    m_n_undef_sym = m__io->read_u4le();
    m_toc_off = m__io->read_u4le();
    m_n_toc = m__io->read_u4le();
    m_mod_tab_off = m__io->read_u4le();
    m_n_mod_tab = m__io->read_u4le();
    m_ext_ref_sym_off = m__io->read_u4le();
    m_n_ext_ref_syms = m__io->read_u4le();
    m_indirect_sym_off = m__io->read_u4le();
    m_n_indirect_syms = m__io->read_u4le();
    m_ext_rel_off = m__io->read_u4le();
    m_n_ext_rel = m__io->read_u4le();
    m_loc_rel_off = m__io->read_u4le();
    m_n_loc_rel = m__io->read_u4le();
}

mach_o_t::dysymtab_command_t::~dysymtab_command_t() {
    _clean_up();
}

void mach_o_t::dysymtab_command_t::_clean_up() {
    if (f_indirect_symbols) {
    }
}

std::vector<uint32_t>* mach_o_t::dysymtab_command_t::indirect_symbols() {
    if (f_indirect_symbols)
        return m_indirect_symbols.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(indirect_sym_off());
    m_indirect_symbols = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_indirect_symbols = n_indirect_syms();
    for (int i = 0; i < l_indirect_symbols; i++) {
        m_indirect_symbols->push_back(std::move(io->read_u4le()));
    }
    io->seek(_pos);
    f_indirect_symbols = true;
    return m_indirect_symbols.get();
}

mach_o_t::mach_header_t::mach_header_t(kaitai::kstream* p__io, mach_o_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags_obj = nullptr;
    f_flags_obj = false;
    _read();
}

void mach_o_t::mach_header_t::_read() {
    m_cputype = static_cast<mach_o_t::cpu_type_t>(m__io->read_u4le());
    m_cpusubtype = m__io->read_u4le();
    m_filetype = static_cast<mach_o_t::file_type_t>(m__io->read_u4le());
    m_ncmds = m__io->read_u4le();
    m_sizeofcmds = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    n_reserved = true;
    if ( ((_root()->magic() == mach_o_t::MAGIC_TYPE_MACHO_BE_X64) || (_root()->magic() == mach_o_t::MAGIC_TYPE_MACHO_LE_X64)) ) {
        n_reserved = false;
        m_reserved = m__io->read_u4le();
    }
}

mach_o_t::mach_header_t::~mach_header_t() {
    _clean_up();
}

void mach_o_t::mach_header_t::_clean_up() {
    if (!n_reserved) {
    }
    if (f_flags_obj) {
    }
}

mach_o_t::macho_flags_t* mach_o_t::mach_header_t::flags_obj() {
    if (f_flags_obj)
        return m_flags_obj.get();
    m_flags_obj = std::unique_ptr<macho_flags_t>(new macho_flags_t(flags(), m__io, this, m__root));
    f_flags_obj = true;
    return m_flags_obj.get();
}

mach_o_t::linkedit_data_command_t::linkedit_data_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::linkedit_data_command_t::_read() {
    m_data_off = m__io->read_u4le();
    m_data_size = m__io->read_u4le();
}

mach_o_t::linkedit_data_command_t::~linkedit_data_command_t() {
    _clean_up();
}

void mach_o_t::linkedit_data_command_t::_clean_up() {
}

mach_o_t::sub_command_t::sub_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    _read();
}

void mach_o_t::sub_command_t::_read() {
    m_name = std::unique_ptr<lc_str_t>(new lc_str_t(m__io, this, m__root));
}

mach_o_t::sub_command_t::~sub_command_t() {
    _clean_up();
}

void mach_o_t::sub_command_t::_clean_up() {
}

mach_o_t::twolevel_hints_command_t::twolevel_hints_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::twolevel_hints_command_t::_read() {
    m_offset = m__io->read_u4le();
    m_num_hints = m__io->read_u4le();
}

mach_o_t::twolevel_hints_command_t::~twolevel_hints_command_t() {
    _clean_up();
}

void mach_o_t::twolevel_hints_command_t::_clean_up() {
}

mach_o_t::version_t::version_t(kaitai::kstream* p__io, mach_o_t::version_min_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::version_t::_read() {
    m_p1 = m__io->read_u1();
    m_minor = m__io->read_u1();
    m_major = m__io->read_u1();
    m_release = m__io->read_u1();
}

mach_o_t::version_t::~version_t() {
    _clean_up();
}

void mach_o_t::version_t::_clean_up() {
}

mach_o_t::encryption_info_command_t::encryption_info_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::encryption_info_command_t::_read() {
    m_cryptoff = m__io->read_u4le();
    m_cryptsize = m__io->read_u4le();
    m_cryptid = m__io->read_u4le();
    n_pad = true;
    if ( ((_root()->magic() == mach_o_t::MAGIC_TYPE_MACHO_BE_X64) || (_root()->magic() == mach_o_t::MAGIC_TYPE_MACHO_LE_X64)) ) {
        n_pad = false;
        m_pad = m__io->read_u4le();
    }
}

mach_o_t::encryption_info_command_t::~encryption_info_command_t() {
    _clean_up();
}

void mach_o_t::encryption_info_command_t::_clean_up() {
    if (!n_pad) {
    }
}

mach_o_t::code_signature_command_t::code_signature_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_code_signature = nullptr;
    m__io__raw_code_signature = nullptr;
    f_code_signature = false;
    _read();
}

void mach_o_t::code_signature_command_t::_read() {
    m_data_off = m__io->read_u4le();
    m_data_size = m__io->read_u4le();
}

mach_o_t::code_signature_command_t::~code_signature_command_t() {
    _clean_up();
}

void mach_o_t::code_signature_command_t::_clean_up() {
    if (f_code_signature) {
    }
}

mach_o_t::cs_blob_t* mach_o_t::code_signature_command_t::code_signature() {
    if (f_code_signature)
        return m_code_signature.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(data_off());
    m__raw_code_signature = io->read_bytes(data_size());
    m__io__raw_code_signature = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_code_signature));
    m_code_signature = std::unique_ptr<cs_blob_t>(new cs_blob_t(m__io__raw_code_signature.get(), this, m__root));
    io->seek(_pos);
    f_code_signature = true;
    return m_code_signature.get();
}

mach_o_t::dyld_info_command_t::dyld_info_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bind = nullptr;
    m__io__raw_bind = nullptr;
    m_exports = nullptr;
    m__io__raw_exports = nullptr;
    m_weak_bind = nullptr;
    m__io__raw_weak_bind = nullptr;
    m_rebase = nullptr;
    m__io__raw_rebase = nullptr;
    m_lazy_bind = nullptr;
    m__io__raw_lazy_bind = nullptr;
    f_bind = false;
    f_exports = false;
    f_weak_bind = false;
    f_rebase = false;
    f_lazy_bind = false;
    _read();
}

void mach_o_t::dyld_info_command_t::_read() {
    m_rebase_off = m__io->read_u4le();
    m_rebase_size = m__io->read_u4le();
    m_bind_off = m__io->read_u4le();
    m_bind_size = m__io->read_u4le();
    m_weak_bind_off = m__io->read_u4le();
    m_weak_bind_size = m__io->read_u4le();
    m_lazy_bind_off = m__io->read_u4le();
    m_lazy_bind_size = m__io->read_u4le();
    m_export_off = m__io->read_u4le();
    m_export_size = m__io->read_u4le();
}

mach_o_t::dyld_info_command_t::~dyld_info_command_t() {
    _clean_up();
}

void mach_o_t::dyld_info_command_t::_clean_up() {
    if (f_bind && !n_bind) {
    }
    if (f_exports && !n_exports) {
    }
    if (f_weak_bind && !n_weak_bind) {
    }
    if (f_rebase && !n_rebase) {
    }
    if (f_lazy_bind && !n_lazy_bind) {
    }
}

mach_o_t::dyld_info_command_t::rebase_data_t::rebase_data_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void mach_o_t::dyld_info_command_t::rebase_data_t::_read() {
    m_items = std::unique_ptr<std::vector<std::unique_ptr<rebase_item_t>>>(new std::vector<std::unique_ptr<rebase_item_t>>());
    {
        int i = 0;
        rebase_item_t* _;
        do {
            _ = new rebase_item_t(m__io, this, m__root);
            m_items->push_back(std::move(std::unique_ptr<rebase_item_t>(_)));
            i++;
        } while (!(_->opcode() == mach_o_t::dyld_info_command_t::rebase_data_t::OPCODE_DONE));
    }
}

mach_o_t::dyld_info_command_t::rebase_data_t::~rebase_data_t() {
    _clean_up();
}

void mach_o_t::dyld_info_command_t::rebase_data_t::_clean_up() {
}

mach_o_t::dyld_info_command_t::rebase_data_t::rebase_item_t::rebase_item_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t::rebase_data_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_uleb = nullptr;
    m_skip = nullptr;
    f_opcode = false;
    f_immediate = false;
    _read();
}

void mach_o_t::dyld_info_command_t::rebase_data_t::rebase_item_t::_read() {
    m_opcode_and_immediate = m__io->read_u1();
    n_uleb = true;
    if ( ((opcode() == mach_o_t::dyld_info_command_t::rebase_data_t::OPCODE_SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == mach_o_t::dyld_info_command_t::rebase_data_t::OPCODE_ADD_ADDRESS_ULEB) || (opcode() == mach_o_t::dyld_info_command_t::rebase_data_t::OPCODE_DO_REBASE_ULEB_TIMES) || (opcode() == mach_o_t::dyld_info_command_t::rebase_data_t::OPCODE_DO_REBASE_ADD_ADDRESS_ULEB) || (opcode() == mach_o_t::dyld_info_command_t::rebase_data_t::OPCODE_DO_REBASE_ULEB_TIMES_SKIPPING_ULEB)) ) {
        n_uleb = false;
        m_uleb = std::unique_ptr<uleb128_t>(new uleb128_t(m__io, this, m__root));
    }
    n_skip = true;
    if (opcode() == mach_o_t::dyld_info_command_t::rebase_data_t::OPCODE_DO_REBASE_ULEB_TIMES_SKIPPING_ULEB) {
        n_skip = false;
        m_skip = std::unique_ptr<uleb128_t>(new uleb128_t(m__io, this, m__root));
    }
}

mach_o_t::dyld_info_command_t::rebase_data_t::rebase_item_t::~rebase_item_t() {
    _clean_up();
}

void mach_o_t::dyld_info_command_t::rebase_data_t::rebase_item_t::_clean_up() {
    if (!n_uleb) {
    }
    if (!n_skip) {
    }
}

mach_o_t::dyld_info_command_t::rebase_data_t::opcode_t mach_o_t::dyld_info_command_t::rebase_data_t::rebase_item_t::opcode() {
    if (f_opcode)
        return m_opcode;
    m_opcode = static_cast<mach_o_t::dyld_info_command_t::rebase_data_t::opcode_t>((opcode_and_immediate() & 240));
    f_opcode = true;
    return m_opcode;
}

int32_t mach_o_t::dyld_info_command_t::rebase_data_t::rebase_item_t::immediate() {
    if (f_immediate)
        return m_immediate;
    m_immediate = (opcode_and_immediate() & 15);
    f_immediate = true;
    return m_immediate;
}

mach_o_t::dyld_info_command_t::bind_item_t::bind_item_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t::bind_data_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_uleb = nullptr;
    m_skip = nullptr;
    f_opcode = false;
    f_immediate = false;
    _read();
}

void mach_o_t::dyld_info_command_t::bind_item_t::_read() {
    m_opcode_and_immediate = m__io->read_u1();
    n_uleb = true;
    if ( ((opcode() == mach_o_t::dyld_info_command_t::BIND_OPCODE_SET_DYLIB_ORDINAL_ULEB) || (opcode() == mach_o_t::dyld_info_command_t::BIND_OPCODE_SET_APPEND_SLEB) || (opcode() == mach_o_t::dyld_info_command_t::BIND_OPCODE_SET_SEGMENT_AND_OFFSET_ULEB) || (opcode() == mach_o_t::dyld_info_command_t::BIND_OPCODE_ADD_ADDRESS_ULEB) || (opcode() == mach_o_t::dyld_info_command_t::BIND_OPCODE_DO_BIND_ADD_ADDRESS_ULEB) || (opcode() == mach_o_t::dyld_info_command_t::BIND_OPCODE_DO_BIND_ULEB_TIMES_SKIPPING_ULEB)) ) {
        n_uleb = false;
        m_uleb = std::unique_ptr<uleb128_t>(new uleb128_t(m__io, this, m__root));
    }
    n_skip = true;
    if (opcode() == mach_o_t::dyld_info_command_t::BIND_OPCODE_DO_BIND_ULEB_TIMES_SKIPPING_ULEB) {
        n_skip = false;
        m_skip = std::unique_ptr<uleb128_t>(new uleb128_t(m__io, this, m__root));
    }
    n_symbol = true;
    if (opcode() == mach_o_t::dyld_info_command_t::BIND_OPCODE_SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE) {
        n_symbol = false;
        m_symbol = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ascii"));
    }
}

mach_o_t::dyld_info_command_t::bind_item_t::~bind_item_t() {
    _clean_up();
}

void mach_o_t::dyld_info_command_t::bind_item_t::_clean_up() {
    if (!n_uleb) {
    }
    if (!n_skip) {
    }
    if (!n_symbol) {
    }
}

mach_o_t::dyld_info_command_t::bind_opcode_t mach_o_t::dyld_info_command_t::bind_item_t::opcode() {
    if (f_opcode)
        return m_opcode;
    m_opcode = static_cast<mach_o_t::dyld_info_command_t::bind_opcode_t>((opcode_and_immediate() & 240));
    f_opcode = true;
    return m_opcode;
}

int32_t mach_o_t::dyld_info_command_t::bind_item_t::immediate() {
    if (f_immediate)
        return m_immediate;
    m_immediate = (opcode_and_immediate() & 15);
    f_immediate = true;
    return m_immediate;
}

mach_o_t::dyld_info_command_t::bind_data_t::bind_data_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void mach_o_t::dyld_info_command_t::bind_data_t::_read() {
    m_items = std::unique_ptr<std::vector<std::unique_ptr<bind_item_t>>>(new std::vector<std::unique_ptr<bind_item_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_items->push_back(std::move(std::unique_ptr<bind_item_t>(new bind_item_t(m__io, this, m__root))));
            i++;
        }
    }
}

mach_o_t::dyld_info_command_t::bind_data_t::~bind_data_t() {
    _clean_up();
}

void mach_o_t::dyld_info_command_t::bind_data_t::_clean_up() {
}

mach_o_t::dyld_info_command_t::export_node_t::export_node_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_terminal_size = nullptr;
    m_children = nullptr;
    _read();
}

void mach_o_t::dyld_info_command_t::export_node_t::_read() {
    m_terminal_size = std::unique_ptr<uleb128_t>(new uleb128_t(m__io, this, m__root));
    m_children_count = m__io->read_u1();
    m_children = std::unique_ptr<std::vector<std::unique_ptr<child_t>>>(new std::vector<std::unique_ptr<child_t>>());
    const int l_children = children_count();
    for (int i = 0; i < l_children; i++) {
        m_children->push_back(std::move(std::unique_ptr<child_t>(new child_t(m__io, this, m__root))));
    }
    m_terminal = m__io->read_bytes(terminal_size()->value());
}

mach_o_t::dyld_info_command_t::export_node_t::~export_node_t() {
    _clean_up();
}

void mach_o_t::dyld_info_command_t::export_node_t::_clean_up() {
}

mach_o_t::dyld_info_command_t::export_node_t::child_t::child_t(kaitai::kstream* p__io, mach_o_t::dyld_info_command_t::export_node_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_node_offset = nullptr;
    m_value = nullptr;
    f_value = false;
    _read();
}

void mach_o_t::dyld_info_command_t::export_node_t::child_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ascii"));
    m_node_offset = std::unique_ptr<uleb128_t>(new uleb128_t(m__io, this, m__root));
}

mach_o_t::dyld_info_command_t::export_node_t::child_t::~child_t() {
    _clean_up();
}

void mach_o_t::dyld_info_command_t::export_node_t::child_t::_clean_up() {
    if (f_value) {
    }
}

mach_o_t::dyld_info_command_t::export_node_t* mach_o_t::dyld_info_command_t::export_node_t::child_t::value() {
    if (f_value)
        return m_value.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(node_offset()->value());
    m_value = std::unique_ptr<export_node_t>(new export_node_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_value = true;
    return m_value.get();
}

mach_o_t::dyld_info_command_t::bind_data_t* mach_o_t::dyld_info_command_t::bind() {
    if (f_bind)
        return m_bind.get();
    n_bind = true;
    if (bind_size() != 0) {
        n_bind = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(bind_off());
        m__raw_bind = io->read_bytes(bind_size());
        m__io__raw_bind = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_bind));
        m_bind = std::unique_ptr<bind_data_t>(new bind_data_t(m__io__raw_bind.get(), this, m__root));
        io->seek(_pos);
        f_bind = true;
    }
    return m_bind.get();
}

mach_o_t::dyld_info_command_t::export_node_t* mach_o_t::dyld_info_command_t::exports() {
    if (f_exports)
        return m_exports.get();
    n_exports = true;
    if (export_size() != 0) {
        n_exports = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(export_off());
        m__raw_exports = io->read_bytes(export_size());
        m__io__raw_exports = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_exports));
        m_exports = std::unique_ptr<export_node_t>(new export_node_t(m__io__raw_exports.get(), this, m__root));
        io->seek(_pos);
        f_exports = true;
    }
    return m_exports.get();
}

mach_o_t::dyld_info_command_t::bind_data_t* mach_o_t::dyld_info_command_t::weak_bind() {
    if (f_weak_bind)
        return m_weak_bind.get();
    n_weak_bind = true;
    if (weak_bind_size() != 0) {
        n_weak_bind = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(weak_bind_off());
        m__raw_weak_bind = io->read_bytes(weak_bind_size());
        m__io__raw_weak_bind = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_weak_bind));
        m_weak_bind = std::unique_ptr<bind_data_t>(new bind_data_t(m__io__raw_weak_bind.get(), this, m__root));
        io->seek(_pos);
        f_weak_bind = true;
    }
    return m_weak_bind.get();
}

mach_o_t::dyld_info_command_t::rebase_data_t* mach_o_t::dyld_info_command_t::rebase() {
    if (f_rebase)
        return m_rebase.get();
    n_rebase = true;
    if (rebase_size() != 0) {
        n_rebase = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(rebase_off());
        m__raw_rebase = io->read_bytes(rebase_size());
        m__io__raw_rebase = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_rebase));
        m_rebase = std::unique_ptr<rebase_data_t>(new rebase_data_t(m__io__raw_rebase.get(), this, m__root));
        io->seek(_pos);
        f_rebase = true;
    }
    return m_rebase.get();
}

mach_o_t::dyld_info_command_t::bind_data_t* mach_o_t::dyld_info_command_t::lazy_bind() {
    if (f_lazy_bind)
        return m_lazy_bind.get();
    n_lazy_bind = true;
    if (lazy_bind_size() != 0) {
        n_lazy_bind = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(lazy_bind_off());
        m__raw_lazy_bind = io->read_bytes(lazy_bind_size());
        m__io__raw_lazy_bind = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_lazy_bind));
        m_lazy_bind = std::unique_ptr<bind_data_t>(new bind_data_t(m__io__raw_lazy_bind.get(), this, m__root));
        io->seek(_pos);
        f_lazy_bind = true;
    }
    return m_lazy_bind.get();
}

mach_o_t::dylinker_command_t::dylinker_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    _read();
}

void mach_o_t::dylinker_command_t::_read() {
    m_name = std::unique_ptr<lc_str_t>(new lc_str_t(m__io, this, m__root));
}

mach_o_t::dylinker_command_t::~dylinker_command_t() {
    _clean_up();
}

void mach_o_t::dylinker_command_t::_clean_up() {
}

mach_o_t::dylib_command_t::dylib_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::dylib_command_t::_read() {
    m_name_offset = m__io->read_u4le();
    m_timestamp = m__io->read_u4le();
    m_current_version = m__io->read_u4le();
    m_compatibility_version = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("utf-8"));
}

mach_o_t::dylib_command_t::~dylib_command_t() {
    _clean_up();
}

void mach_o_t::dylib_command_t::_clean_up() {
}

mach_o_t::segment_command_t::segment_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_maxprot = nullptr;
    m_initprot = nullptr;
    m_sections = nullptr;
    _read();
}

void mach_o_t::segment_command_t::_read() {
    m_segname = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(16), 0), std::string("ascii"));
    m_vmaddr = m__io->read_u4le();
    m_vmsize = m__io->read_u4le();
    m_fileoff = m__io->read_u4le();
    m_filesize = m__io->read_u4le();
    m_maxprot = std::unique_ptr<vm_prot_t>(new vm_prot_t(m__io, this, m__root));
    m_initprot = std::unique_ptr<vm_prot_t>(new vm_prot_t(m__io, this, m__root));
    m_nsects = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_sections = std::unique_ptr<std::vector<std::unique_ptr<section_t>>>(new std::vector<std::unique_ptr<section_t>>());
    const int l_sections = nsects();
    for (int i = 0; i < l_sections; i++) {
        m_sections->push_back(std::move(std::unique_ptr<section_t>(new section_t(m__io, this, m__root))));
    }
}

mach_o_t::segment_command_t::~segment_command_t() {
    _clean_up();
}

void mach_o_t::segment_command_t::_clean_up() {
}

mach_o_t::segment_command_t::section_t::section_t(kaitai::kstream* p__io, mach_o_t::segment_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_data = false;
    _read();
}

void mach_o_t::segment_command_t::section_t::_read() {
    m_sect_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(16), 0), std::string("ascii"));
    m_seg_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(16), 0), std::string("ascii"));
    m_addr = m__io->read_u4le();
    m_size = m__io->read_u4le();
    m_offset = m__io->read_u4le();
    m_align = m__io->read_u4le();
    m_reloff = m__io->read_u4le();
    m_nreloc = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_reserved1 = m__io->read_u4le();
    m_reserved2 = m__io->read_u4le();
}

mach_o_t::segment_command_t::section_t::~section_t() {
    _clean_up();
}

void mach_o_t::segment_command_t::section_t::_clean_up() {
    if (f_data) {
    }
}

std::string mach_o_t::segment_command_t::section_t::data() {
    if (f_data)
        return m_data;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    m_data = io->read_bytes(size());
    io->seek(_pos);
    f_data = true;
    return m_data;
}

mach_o_t::lc_str_t::lc_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::lc_str_t::_read() {
    m_length = m__io->read_u4le();
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
}

mach_o_t::lc_str_t::~lc_str_t() {
    _clean_up();
}

void mach_o_t::lc_str_t::_clean_up() {
}

mach_o_t::load_command_t::load_command_t(kaitai::kstream* p__io, mach_o_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void mach_o_t::load_command_t::_read() {
    m_type = static_cast<mach_o_t::load_command_type_t>(m__io->read_u4le());
    m_size = m__io->read_u4le();
    n_body = true;
    switch (type()) {
    case mach_o_t::LOAD_COMMAND_TYPE_ID_DYLINKER: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dylinker_command_t>(new dylinker_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_REEXPORT_DYLIB: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dylib_command_t>(new dylib_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_BUILD_VERSION: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<build_version_command_t>(new build_version_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_SOURCE_VERSION: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<source_version_command_t>(new source_version_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_FUNCTION_STARTS: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<linkedit_data_command_t>(new linkedit_data_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_RPATH: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<rpath_command_t>(new rpath_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_SUB_FRAMEWORK: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<sub_command_t>(new sub_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_ROUTINES: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<routines_command_t>(new routines_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_SUB_LIBRARY: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<sub_command_t>(new sub_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_DYLD_INFO_ONLY: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dyld_info_command_t>(new dyld_info_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_DYLD_ENVIRONMENT: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dylinker_command_t>(new dylinker_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_LOAD_DYLINKER: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dylinker_command_t>(new dylinker_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_SEGMENT_SPLIT_INFO: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<linkedit_data_command_t>(new linkedit_data_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_MAIN: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<entry_point_command_t>(new entry_point_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_LOAD_DYLIB: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dylib_command_t>(new dylib_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_ENCRYPTION_INFO: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<encryption_info_command_t>(new encryption_info_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_DYSYMTAB: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dysymtab_command_t>(new dysymtab_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_TWOLEVEL_HINTS: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<twolevel_hints_command_t>(new twolevel_hints_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_ENCRYPTION_INFO_64: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<encryption_info_command_t>(new encryption_info_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_LINKER_OPTION: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<linker_option_command_t>(new linker_option_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_DYLD_INFO: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dyld_info_command_t>(new dyld_info_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_VERSION_MIN_TVOS: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<version_min_command_t>(new version_min_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_LOAD_UPWARD_DYLIB: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dylib_command_t>(new dylib_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_SEGMENT_64: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<segment_command_64_t>(new segment_command_64_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_SEGMENT: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<segment_command_t>(new segment_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_SUB_UMBRELLA: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<sub_command_t>(new sub_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_VERSION_MIN_WATCHOS: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<version_min_command_t>(new version_min_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_ROUTINES_64: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<routines_command_64_t>(new routines_command_64_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_ID_DYLIB: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dylib_command_t>(new dylib_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_SUB_CLIENT: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<sub_command_t>(new sub_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_DYLIB_CODE_SIGN_DRS: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<linkedit_data_command_t>(new linkedit_data_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_SYMTAB: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<symtab_command_t>(new symtab_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_LINKER_OPTIMIZATION_HINT: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<linkedit_data_command_t>(new linkedit_data_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_DATA_IN_CODE: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<linkedit_data_command_t>(new linkedit_data_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_CODE_SIGNATURE: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<code_signature_command_t>(new code_signature_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_VERSION_MIN_IPHONEOS: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<version_min_command_t>(new version_min_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_LOAD_WEAK_DYLIB: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dylib_command_t>(new dylib_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_LAZY_LOAD_DYLIB: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<dylib_command_t>(new dylib_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_UUID: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<uuid_command_t>(new uuid_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mach_o_t::LOAD_COMMAND_TYPE_VERSION_MIN_MACOSX: {
        n_body = false;
        m__raw_body = m__io->read_bytes((size() - 8));
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<version_min_command_t>(new version_min_command_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes((size() - 8));
        break;
    }
    }
}

mach_o_t::load_command_t::~load_command_t() {
    _clean_up();
}

void mach_o_t::load_command_t::_clean_up() {
    if (!n_body) {
    }
}

mach_o_t::uuid_command_t::uuid_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::uuid_command_t::_read() {
    m_uuid = m__io->read_bytes(16);
}

mach_o_t::uuid_command_t::~uuid_command_t() {
    _clean_up();
}

void mach_o_t::uuid_command_t::_clean_up() {
}

mach_o_t::symtab_command_t::symtab_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_symbols = nullptr;
    m_strs = nullptr;
    m__io__raw_strs = nullptr;
    f_symbols = false;
    f_strs = false;
    _read();
}

void mach_o_t::symtab_command_t::_read() {
    m_sym_off = m__io->read_u4le();
    m_n_syms = m__io->read_u4le();
    m_str_off = m__io->read_u4le();
    m_str_size = m__io->read_u4le();
}

mach_o_t::symtab_command_t::~symtab_command_t() {
    _clean_up();
}

void mach_o_t::symtab_command_t::_clean_up() {
    if (f_symbols) {
    }
    if (f_strs) {
    }
}

mach_o_t::symtab_command_t::str_table_t::str_table_t(kaitai::kstream* p__io, mach_o_t::symtab_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void mach_o_t::symtab_command_t::str_table_t::_read() {
    m_unknown = m__io->read_u4le();
    m_items = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        std::string _;
        do {
            _ = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, false), std::string("utf-8"));
            m_items->push_back(_);
            i++;
        } while (!(_ == (std::string(""))));
    }
}

mach_o_t::symtab_command_t::str_table_t::~str_table_t() {
    _clean_up();
}

void mach_o_t::symtab_command_t::str_table_t::_clean_up() {
}

mach_o_t::symtab_command_t::nlist_64_t::nlist_64_t(kaitai::kstream* p__io, mach_o_t::symtab_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_name = false;
    _read();
}

void mach_o_t::symtab_command_t::nlist_64_t::_read() {
    m_un = m__io->read_u4le();
    m_type = m__io->read_u1();
    m_sect = m__io->read_u1();
    m_desc = m__io->read_u2le();
    m_value = m__io->read_u8le();
}

mach_o_t::symtab_command_t::nlist_64_t::~nlist_64_t() {
    _clean_up();
}

void mach_o_t::symtab_command_t::nlist_64_t::_clean_up() {
    if (f_name && !n_name) {
    }
}

std::string mach_o_t::symtab_command_t::nlist_64_t::name() {
    if (f_name)
        return m_name;
    n_name = true;
    if (un() != 0) {
        n_name = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((_parent()->str_off() + un()));
        m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("utf-8"));
        m__io->seek(_pos);
        f_name = true;
    }
    return m_name;
}

mach_o_t::symtab_command_t::nlist_t::nlist_t(kaitai::kstream* p__io, mach_o_t::symtab_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_name = false;
    _read();
}

void mach_o_t::symtab_command_t::nlist_t::_read() {
    m_un = m__io->read_u4le();
    m_type = m__io->read_u1();
    m_sect = m__io->read_u1();
    m_desc = m__io->read_u2le();
    m_value = m__io->read_u4le();
}

mach_o_t::symtab_command_t::nlist_t::~nlist_t() {
    _clean_up();
}

void mach_o_t::symtab_command_t::nlist_t::_clean_up() {
    if (f_name && !n_name) {
    }
}

std::string mach_o_t::symtab_command_t::nlist_t::name() {
    if (f_name)
        return m_name;
    n_name = true;
    if (un() != 0) {
        n_name = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((_parent()->str_off() + un()));
        m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("utf-8"));
        m__io->seek(_pos);
        f_name = true;
    }
    return m_name;
}

std::vector<std::unique_ptr<kaitai::kstruct>>* mach_o_t::symtab_command_t::symbols() {
    if (f_symbols)
        return m_symbols.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(sym_off());
    m_symbols = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstruct>>>(new std::vector<std::unique_ptr<kaitai::kstruct>>());
    const int l_symbols = n_syms();
    for (int i = 0; i < l_symbols; i++) {
        switch (_root()->magic()) {
        case mach_o_t::MAGIC_TYPE_MACHO_LE_X64: {
            m_symbols->push_back(std::move(std::unique_ptr<nlist_64_t>(new nlist_64_t(io, this, m__root))));
            break;
        }
        case mach_o_t::MAGIC_TYPE_MACHO_BE_X64: {
            m_symbols->push_back(std::move(std::unique_ptr<nlist_64_t>(new nlist_64_t(io, this, m__root))));
            break;
        }
        case mach_o_t::MAGIC_TYPE_MACHO_LE_X86: {
            m_symbols->push_back(std::move(std::unique_ptr<nlist_t>(new nlist_t(io, this, m__root))));
            break;
        }
        case mach_o_t::MAGIC_TYPE_MACHO_BE_X86: {
            m_symbols->push_back(std::move(std::unique_ptr<nlist_t>(new nlist_t(io, this, m__root))));
            break;
        }
        }
    }
    io->seek(_pos);
    f_symbols = true;
    return m_symbols.get();
}

mach_o_t::symtab_command_t::str_table_t* mach_o_t::symtab_command_t::strs() {
    if (f_strs)
        return m_strs.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(str_off());
    m__raw_strs = io->read_bytes(str_size());
    m__io__raw_strs = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_strs));
    m_strs = std::unique_ptr<str_table_t>(new str_table_t(m__io__raw_strs.get(), this, m__root));
    io->seek(_pos);
    f_strs = true;
    return m_strs.get();
}

mach_o_t::version_min_command_t::version_min_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = nullptr;
    m_sdk = nullptr;
    _read();
}

void mach_o_t::version_min_command_t::_read() {
    m_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    m_sdk = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
}

mach_o_t::version_min_command_t::~version_min_command_t() {
    _clean_up();
}

void mach_o_t::version_min_command_t::_clean_up() {
}

mach_o_t::entry_point_command_t::entry_point_command_t(kaitai::kstream* p__io, mach_o_t::load_command_t* p__parent, mach_o_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mach_o_t::entry_point_command_t::_read() {
    m_entry_off = m__io->read_u8le();
    m_stack_size = m__io->read_u8le();
}

mach_o_t::entry_point_command_t::~entry_point_command_t() {
    _clean_up();
}

void mach_o_t::entry_point_command_t::_clean_up() {
}
