// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dns_packet.h"



dns_packet_t::dns_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void dns_packet_t::_read() {
    m_transaction_id = m__io->read_u2be();
    m_flags = new packet_flags_t(m__io, this, m__root);
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
        int l_queries = qdcount();
        m_queries = new std::vector<query_t*>();
        m_queries->reserve(l_queries);
        for (int i = 0; i < l_queries; i++) {
            m_queries->push_back(new query_t(m__io, this, m__root));
        }
    }
    n_answers = true;
    if (flags()->is_opcode_valid()) {
        n_answers = false;
        int l_answers = ancount();
        m_answers = new std::vector<answer_t*>();
        m_answers->reserve(l_answers);
        for (int i = 0; i < l_answers; i++) {
            m_answers->push_back(new answer_t(m__io, this, m__root));
        }
    }
    n_additionals = true;
    if (flags()->is_opcode_valid()) {
        n_additionals = false;
        int l_additionals = arcount();
        m_additionals = new std::vector<answer_t*>();
        m_additionals->reserve(l_additionals);
        for (int i = 0; i < l_additionals; i++) {
            m_additionals->push_back(new answer_t(m__io, this, m__root));
        }
    }
}

dns_packet_t::~dns_packet_t() {
    delete m_flags;
    if (!n_qdcount) {
    }
    if (!n_ancount) {
    }
    if (!n_nscount) {
    }
    if (!n_arcount) {
    }
    if (!n_queries) {
        for (std::vector<query_t*>::iterator it = m_queries->begin(); it != m_queries->end(); ++it) {
            delete *it;
        }
        delete m_queries;
    }
    if (!n_answers) {
        for (std::vector<answer_t*>::iterator it = m_answers->begin(); it != m_answers->end(); ++it) {
            delete *it;
        }
        delete m_answers;
    }
    if (!n_additionals) {
        for (std::vector<answer_t*>::iterator it = m_additionals->begin(); it != m_additionals->end(); ++it) {
            delete *it;
        }
        delete m_additionals;
    }
}

dns_packet_t::pointer_struct_t::pointer_struct_t(kaitai::kstream* p__io, dns_packet_t::label_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_contents = false;
    _read();
}

void dns_packet_t::pointer_struct_t::_read() {
    m_value = m__io->read_u1();
}

dns_packet_t::pointer_struct_t::~pointer_struct_t() {
    if (f_contents) {
        delete m_contents;
    }
}

dns_packet_t::domain_name_t* dns_packet_t::pointer_struct_t::contents() {
    if (f_contents)
        return m_contents;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(value());
    m_contents = new domain_name_t(io, this, m__root);
    io->seek(_pos);
    f_contents = true;
    return m_contents;
}

dns_packet_t::label_t::label_t(kaitai::kstream* p__io, dns_packet_t::domain_name_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_is_pointer = false;
    _read();
}

void dns_packet_t::label_t::_read() {
    m_length = m__io->read_u1();
    n_pointer = true;
    if (is_pointer()) {
        n_pointer = false;
        m_pointer = new pointer_struct_t(m__io, this, m__root);
    }
    n_name = true;
    if (!(is_pointer())) {
        n_name = false;
        m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(length()), std::string("ASCII"));
    }
}

dns_packet_t::label_t::~label_t() {
    if (!n_pointer) {
        delete m_pointer;
    }
    if (!n_name) {
    }
}

bool dns_packet_t::label_t::is_pointer() {
    if (f_is_pointer)
        return m_is_pointer;
    m_is_pointer = length() == 192;
    f_is_pointer = true;
    return m_is_pointer;
}

dns_packet_t::query_t::query_t(kaitai::kstream* p__io, dns_packet_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dns_packet_t::query_t::_read() {
    m_name = new domain_name_t(m__io, this, m__root);
    m_type = static_cast<dns_packet_t::type_type_t>(m__io->read_u2be());
    m_query_class = static_cast<dns_packet_t::class_type_t>(m__io->read_u2be());
}

dns_packet_t::query_t::~query_t() {
    delete m_name;
}

dns_packet_t::domain_name_t::domain_name_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dns_packet_t::domain_name_t::_read() {
    m_name = new std::vector<label_t*>();
    {
        int i = 0;
        label_t* _;
        do {
            _ = new label_t(m__io, this, m__root);
            m_name->push_back(_);
            i++;
        } while (!( ((_->length() == 0) || (_->length() == 192)) ));
    }
}

dns_packet_t::domain_name_t::~domain_name_t() {
    for (std::vector<label_t*>::iterator it = m_name->begin(); it != m_name->end(); ++it) {
        delete *it;
    }
    delete m_name;
}

dns_packet_t::address_t::address_t(kaitai::kstream* p__io, dns_packet_t::answer_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dns_packet_t::address_t::_read() {
    int l_ip = 4;
    m_ip = new std::vector<uint8_t>();
    m_ip->reserve(l_ip);
    for (int i = 0; i < l_ip; i++) {
        m_ip->push_back(m__io->read_u1());
    }
}

dns_packet_t::address_t::~address_t() {
    delete m_ip;
}

dns_packet_t::answer_t::answer_t(kaitai::kstream* p__io, dns_packet_t* p__parent, dns_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dns_packet_t::answer_t::_read() {
    m_name = new domain_name_t(m__io, this, m__root);
    m_type = static_cast<dns_packet_t::type_type_t>(m__io->read_u2be());
    m_answer_class = static_cast<dns_packet_t::class_type_t>(m__io->read_u2be());
    m_ttl = m__io->read_s4be();
    m_rdlength = m__io->read_u2be();
    n_ptrdname = true;
    if (type() == TYPE_TYPE_PTR) {
        n_ptrdname = false;
        m_ptrdname = new domain_name_t(m__io, this, m__root);
    }
    n_address = true;
    if (type() == TYPE_TYPE_A) {
        n_address = false;
        m_address = new address_t(m__io, this, m__root);
    }
}

dns_packet_t::answer_t::~answer_t() {
    delete m_name;
    if (!n_ptrdname) {
        delete m_ptrdname;
    }
    if (!n_address) {
        delete m_address;
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
