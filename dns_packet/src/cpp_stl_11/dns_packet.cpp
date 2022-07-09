// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dns_packet.h"

dns_packet_t::dns_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_flags = nullptr;
    m_queries = nullptr;
    m_answers = nullptr;
    m_authorities = nullptr;
    m_additionals = nullptr;
    _read();
}

void dns_packet_t::_read() {
    m_transaction_id = m__io->read_u2be();
    m_flags = std::unique_ptr<packet_flags_t>(new packet_flags_t(m__io, this, m__root));
    n_qdcount = true;
    if (flags()->is_opcode_valid()) {
        n_qdcount = false;
        m_qdcount = m__io->read_u2be();
    }
    n_ancount = true;
    if (flags()->is_opcode_valid()) {
        n_ancount = false;
        m_ancount = m__io->read_u2be();
    }
    n_nscount = true;
    if (flags()->is_opcode_valid()) {
        n_nscount = false;
        m_nscount = m__io->read_u2be();
    }
    n_arcount = true;
    if (flags()->is_opcode_valid()) {
        n_arcount = false;
        m_arcount = m__io->read_u2be();
    }
    n_queries = true;
    if (flags()->is_opcode_valid()) {
        n_queries = false;
        m_queries = std::unique_ptr<std::vector<std::unique_ptr<query_t>>>(new std::vector<std::unique_ptr<query_t>>());
        const int l_queries = qdcount();
        for (int i = 0; i < l_queries; i++) {
            m_queries->push_back(std::move(std::unique_ptr<query_t>(new query_t(m__io, this, m__root))));
        }
    }
    n_answers = true;
    if (flags()->is_opcode_valid()) {
        n_answers = false;
        m_answers = std::unique_ptr<std::vector<std::unique_ptr<answer_t>>>(new std::vector<std::unique_ptr<answer_t>>());
        const int l_answers = ancount();
        for (int i = 0; i < l_answers; i++) {
            m_answers->push_back(std::move(std::unique_ptr<answer_t>(new answer_t(m__io, this, m__root))));
        }
    }
    n_authorities = true;
    if (flags()->is_opcode_valid()) {
        n_authorities = false;
        m_authorities = std::unique_ptr<std::vector<std::unique_ptr<answer_t>>>(new std::vector<std::unique_ptr<answer_t>>());
        const int l_authorities = nscount();
        for (int i = 0; i < l_authorities; i++) {
            m_authorities->push_back(std::move(std::unique_ptr<answer_t>(new answer_t(m__io, this, m__root))));
        }
    }
    n_additionals = true;
    if (flags()->is_opcode_valid()) {
        n_additionals = false;
        m_additionals = std::unique_ptr<std::vector<std::unique_ptr<answer_t>>>(new std::vector<std::unique_ptr<answer_t>>());
        const int l_additionals = arcount();
        for (int i = 0; i < l_additionals; i++) {
            m_additionals->push_back(std::move(std::unique_ptr<answer_t>(new answer_t(m__io, this, m__root))));
        }
    }
}

dns_packet_t::~dns_packet_t() {
    _clean_up();
}

void dns_packet_t::_clean_up() {
    if (!n_qdcount) {
    }
    if (!n_ancount) {
    }
    if (!n_nscount) {
    }
    if (!n_arcount) {
    }
    if (!n_queries) {
    }
    if (!n_answers) {
    }
    if (!n_authorities) {
    }
    if (!n_additionals) {
    }
}

dns_packet_t::mx_info_t::mx_info_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_mx = nullptr;
    _read();
}

void dns_packet_t::mx_info_t::_read() {
    m_preference = m__io->read_u2be();
    m_mx = std::unique_ptr<domain_name_t>(new domain_name_t(m__io, this, m__root));
}

dns_packet_t::mx_info_t::~mx_info_t() {
    _clean_up();
}

void dns_packet_t::mx_info_t::_clean_up() {
}

dns_packet_t::pointer_struct_t::pointer_struct_t(kaitai::kstream* p__io, dns_packet_t::label_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_contents = nullptr;
    f_contents = false;
    _read();
}

void dns_packet_t::pointer_struct_t::_read() {
    m_value = m__io->read_u1();
}

dns_packet_t::pointer_struct_t::~pointer_struct_t() {
    _clean_up();
}

void dns_packet_t::pointer_struct_t::_clean_up() {
    if (f_contents) {
    }
}

dns_packet_t::domain_name_t* dns_packet_t::pointer_struct_t::contents() {
    if (f_contents)
        return m_contents.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek((value() + ((_parent()->length() - 192) << 8)));
    m_contents = std::unique_ptr<domain_name_t>(new domain_name_t(io, this, m__root));
    io->seek(_pos);
    f_contents = true;
    return m_contents.get();
}

dns_packet_t::label_t::label_t(kaitai::kstream* p__io, dns_packet_t::domain_name_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_pointer = nullptr;
    f_is_pointer = false;
    _read();
}

void dns_packet_t::label_t::_read() {
    m_length = m__io->read_u1();
    n_pointer = true;
    if (is_pointer()) {
        n_pointer = false;
        m_pointer = std::unique_ptr<pointer_struct_t>(new pointer_struct_t(m__io, this, m__root));
    }
    n_name = true;
    if (!(is_pointer())) {
        n_name = false;
        m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(length()), std::string("utf-8"));
    }
}

dns_packet_t::label_t::~label_t() {
    _clean_up();
}

void dns_packet_t::label_t::_clean_up() {
    if (!n_pointer) {
    }
    if (!n_name) {
    }
}

bool dns_packet_t::label_t::is_pointer() {
    if (f_is_pointer)
        return m_is_pointer;
    m_is_pointer = length() >= 192;
    f_is_pointer = true;
    return m_is_pointer;
}

dns_packet_t::query_t::query_t(kaitai::kstream* p__io, dns_packet_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    _read();
}

void dns_packet_t::query_t::_read() {
    m_name = std::unique_ptr<domain_name_t>(new domain_name_t(m__io, this, m__root));
    m_type = static_cast<dns_packet_t::type_type_t>(m__io->read_u2be());
    m_query_class = static_cast<dns_packet_t::class_type_t>(m__io->read_u2be());
}

dns_packet_t::query_t::~query_t() {
    _clean_up();
}

void dns_packet_t::query_t::_clean_up() {
}

dns_packet_t::domain_name_t::domain_name_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    _read();
}

void dns_packet_t::domain_name_t::_read() {
    m_name = std::unique_ptr<std::vector<std::unique_ptr<label_t>>>(new std::vector<std::unique_ptr<label_t>>());
    {
        int i = 0;
        label_t* _;
        do {
            _ = new label_t(m__io, this, m__root);
            m_name->push_back(std::move(std::unique_ptr<label_t>(_)));
            i++;
        } while (!( ((_->length() == 0) || (_->length() >= 192)) ));
    }
}

dns_packet_t::domain_name_t::~domain_name_t() {
    _clean_up();
}

void dns_packet_t::domain_name_t::_clean_up() {
}

dns_packet_t::address_v6_t::address_v6_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dns_packet_t::address_v6_t::_read() {
    m_ip_v6 = m__io->read_bytes(16);
}

dns_packet_t::address_v6_t::~address_v6_t() {
    _clean_up();
}

void dns_packet_t::address_v6_t::_clean_up() {
}

dns_packet_t::service_t::service_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_target = nullptr;
    _read();
}

void dns_packet_t::service_t::_read() {
    m_priority = m__io->read_u2be();
    m_weight = m__io->read_u2be();
    m_port = m__io->read_u2be();
    m_target = std::unique_ptr<domain_name_t>(new domain_name_t(m__io, this, m__root));
}

dns_packet_t::service_t::~service_t() {
    _clean_up();
}

void dns_packet_t::service_t::_clean_up() {
}

dns_packet_t::txt_t::txt_t(kaitai::kstream* p__io, dns_packet_t::txt_body_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dns_packet_t::txt_t::_read() {
    m_length = m__io->read_u1();
    m_text = kaitai::kstream::bytes_to_str(m__io->read_bytes(length()), std::string("utf-8"));
}

dns_packet_t::txt_t::~txt_t() {
    _clean_up();
}

void dns_packet_t::txt_t::_clean_up() {
}

dns_packet_t::txt_body_t::txt_body_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    _read();
}

void dns_packet_t::txt_body_t::_read() {
    m_data = std::unique_ptr<std::vector<std::unique_ptr<txt_t>>>(new std::vector<std::unique_ptr<txt_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_data->push_back(std::move(std::unique_ptr<txt_t>(new txt_t(m__io, this, m__root))));
            i++;
        }
    }
}

dns_packet_t::txt_body_t::~txt_body_t() {
    _clean_up();
}

void dns_packet_t::txt_body_t::_clean_up() {
}

dns_packet_t::address_t::address_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dns_packet_t::address_t::_read() {
    m_ip = m__io->read_bytes(4);
}

dns_packet_t::address_t::~address_t() {
    _clean_up();
}

void dns_packet_t::address_t::_clean_up() {
}

dns_packet_t::answer_t::answer_t(kaitai::kstream* p__io, dns_packet_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    m__io__raw_payload = nullptr;
    _read();
}

void dns_packet_t::answer_t::_read() {
    m_name = std::unique_ptr<domain_name_t>(new domain_name_t(m__io, this, m__root));
    m_type = static_cast<dns_packet_t::type_type_t>(m__io->read_u2be());
    m_answer_class = static_cast<dns_packet_t::class_type_t>(m__io->read_u2be());
    m_ttl = m__io->read_s4be();
    m_rdlength = m__io->read_u2be();
    n_payload = true;
    switch (type()) {
    case dns_packet_t::TYPE_TYPE_SRV: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(rdlength());
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<service_t>(new service_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    case dns_packet_t::TYPE_TYPE_A: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(rdlength());
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<address_t>(new address_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    case dns_packet_t::TYPE_TYPE_CNAME: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(rdlength());
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<domain_name_t>(new domain_name_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    case dns_packet_t::TYPE_TYPE_NS: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(rdlength());
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<domain_name_t>(new domain_name_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    case dns_packet_t::TYPE_TYPE_SOA: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(rdlength());
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<authority_info_t>(new authority_info_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    case dns_packet_t::TYPE_TYPE_MX: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(rdlength());
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<mx_info_t>(new mx_info_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    case dns_packet_t::TYPE_TYPE_TXT: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(rdlength());
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<txt_body_t>(new txt_body_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    case dns_packet_t::TYPE_TYPE_PTR: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(rdlength());
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<domain_name_t>(new domain_name_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    case dns_packet_t::TYPE_TYPE_AAAA: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(rdlength());
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<address_v6_t>(new address_v6_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    default: {
        m__raw_payload = m__io->read_bytes(rdlength());
        break;
    }
    }
}

dns_packet_t::answer_t::~answer_t() {
    _clean_up();
}

void dns_packet_t::answer_t::_clean_up() {
    if (!n_payload) {
    }
}

dns_packet_t::packet_flags_t::packet_flags_t(kaitai::kstream* p__io, dns_packet_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_qr = false;
    f_ra = false;
    f_tc = false;
    f_is_opcode_valid = false;
    f_rcode = false;
    f_opcode = false;
    f_aa = false;
    f_z = false;
    f_rd = false;
    f_cd = false;
    f_ad = false;
    _read();
}

void dns_packet_t::packet_flags_t::_read() {
    m_flag = m__io->read_u2be();
}

dns_packet_t::packet_flags_t::~packet_flags_t() {
    _clean_up();
}

void dns_packet_t::packet_flags_t::_clean_up() {
}

int32_t dns_packet_t::packet_flags_t::qr() {
    if (f_qr)
        return m_qr;
    m_qr = ((flag() & 32768) >> 15);
    f_qr = true;
    return m_qr;
}

int32_t dns_packet_t::packet_flags_t::ra() {
    if (f_ra)
        return m_ra;
    m_ra = ((flag() & 128) >> 7);
    f_ra = true;
    return m_ra;
}

int32_t dns_packet_t::packet_flags_t::tc() {
    if (f_tc)
        return m_tc;
    m_tc = ((flag() & 512) >> 9);
    f_tc = true;
    return m_tc;
}

bool dns_packet_t::packet_flags_t::is_opcode_valid() {
    if (f_is_opcode_valid)
        return m_is_opcode_valid;
    m_is_opcode_valid =  ((opcode() == 0) || (opcode() == 1) || (opcode() == 2)) ;
    f_is_opcode_valid = true;
    return m_is_opcode_valid;
}

int32_t dns_packet_t::packet_flags_t::rcode() {
    if (f_rcode)
        return m_rcode;
    m_rcode = ((flag() & 15) >> 0);
    f_rcode = true;
    return m_rcode;
}

int32_t dns_packet_t::packet_flags_t::opcode() {
    if (f_opcode)
        return m_opcode;
    m_opcode = ((flag() & 30720) >> 11);
    f_opcode = true;
    return m_opcode;
}

int32_t dns_packet_t::packet_flags_t::aa() {
    if (f_aa)
        return m_aa;
    m_aa = ((flag() & 1024) >> 10);
    f_aa = true;
    return m_aa;
}

int32_t dns_packet_t::packet_flags_t::z() {
    if (f_z)
        return m_z;
    m_z = ((flag() & 64) >> 6);
    f_z = true;
    return m_z;
}

int32_t dns_packet_t::packet_flags_t::rd() {
    if (f_rd)
        return m_rd;
    m_rd = ((flag() & 256) >> 8);
    f_rd = true;
    return m_rd;
}

int32_t dns_packet_t::packet_flags_t::cd() {
    if (f_cd)
        return m_cd;
    m_cd = ((flag() & 16) >> 4);
    f_cd = true;
    return m_cd;
}

int32_t dns_packet_t::packet_flags_t::ad() {
    if (f_ad)
        return m_ad;
    m_ad = ((flag() & 32) >> 5);
    f_ad = true;
    return m_ad;
}

dns_packet_t::authority_info_t::authority_info_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_primary_ns = nullptr;
    m_resoponsible_mailbox = nullptr;
    _read();
}

void dns_packet_t::authority_info_t::_read() {
    m_primary_ns = std::unique_ptr<domain_name_t>(new domain_name_t(m__io, this, m__root));
    m_resoponsible_mailbox = std::unique_ptr<domain_name_t>(new domain_name_t(m__io, this, m__root));
    m_serial = m__io->read_u4be();
    m_refresh_interval = m__io->read_u4be();
    m_retry_interval = m__io->read_u4be();
    m_expire_limit = m__io->read_u4be();
    m_min_ttl = m__io->read_u4be();
}

dns_packet_t::authority_info_t::~authority_info_t() {
    _clean_up();
}

void dns_packet_t::authority_info_t::_clean_up() {
}
