// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mifare_classic.h"

mifare_classic_t::mifare_classic_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_sectors = 0;
    m__raw_sectors = 0;
    m__io__raw_sectors = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::_read() {
    m__raw_sectors = new std::vector<std::string>();
    m__io__raw_sectors = new std::vector<kaitai::kstream*>();
    m_sectors = new std::vector<sector_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m__raw_sectors->push_back(m__io->read_bytes((((i >= 32) ? (4) : (1)) * 4) * 16));
            kaitai::kstream* io__raw_sectors = new kaitai::kstream(m__raw_sectors->at(m__raw_sectors->size() - 1));
            m__io__raw_sectors->push_back(io__raw_sectors);
            m_sectors->push_back(new sector_t(i == 0, io__raw_sectors, this, m__root));
            i++;
        }
    }
}

mifare_classic_t::~mifare_classic_t() {
    _clean_up();
}

void mifare_classic_t::_clean_up() {
    if (m__raw_sectors) {
        delete m__raw_sectors; m__raw_sectors = 0;
    }
    if (m__io__raw_sectors) {
        for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_sectors->begin(); it != m__io__raw_sectors->end(); ++it) {
            delete *it;
        }
        delete m__io__raw_sectors; m__io__raw_sectors = 0;
    }
    if (m_sectors) {
        for (std::vector<sector_t*>::iterator it = m_sectors->begin(); it != m_sectors->end(); ++it) {
            delete *it;
        }
        delete m_sectors; m_sectors = 0;
    }
}

mifare_classic_t::key_t::key_t(kaitai::kstream* p__io, mifare_classic_t::trailer_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::key_t::_read() {
    m_key = m__io->read_bytes(6);
}

mifare_classic_t::key_t::~key_t() {
    _clean_up();
}

void mifare_classic_t::key_t::_clean_up() {
}

mifare_classic_t::manufacturer_t::manufacturer_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::manufacturer_t::_read() {
    m_nuid = m__io->read_u4le();
    m_bcc = m__io->read_u1();
    m_sak = m__io->read_u1();
    m_atqa = m__io->read_u2le();
    m_manufacturer = m__io->read_bytes(8);
}

mifare_classic_t::manufacturer_t::~manufacturer_t() {
    _clean_up();
}

void mifare_classic_t::manufacturer_t::_clean_up() {
}

mifare_classic_t::sector_t::sector_t(bool p_has_manufacturer, kaitai::kstream* p__io, mifare_classic_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_manufacturer = p_has_manufacturer;
    m_manufacturer = 0;
    m_data_filler = 0;
    m__io__raw_data_filler = 0;
    m_trailer = 0;
    m_blocks = 0;
    m_values = 0;
    f_block_size = false;
    f_blocks = false;
    f_data = false;
    f_values = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::sector_t::_read() {
    n_manufacturer = true;
    if (has_manufacturer()) {
        n_manufacturer = false;
        m_manufacturer = new manufacturer_t(m__io, this, m__root);
    }
    m__raw_data_filler = m__io->read_bytes((_io()->size() - _io()->pos()) - 16);
    m__io__raw_data_filler = new kaitai::kstream(m__raw_data_filler);
    m_data_filler = new filler_t(m__io__raw_data_filler, this, m__root);
    m_trailer = new trailer_t(m__io, this, m__root);
}

mifare_classic_t::sector_t::~sector_t() {
    _clean_up();
}

void mifare_classic_t::sector_t::_clean_up() {
    if (!n_manufacturer) {
        if (m_manufacturer) {
            delete m_manufacturer; m_manufacturer = 0;
        }
    }
    if (m__io__raw_data_filler) {
        delete m__io__raw_data_filler; m__io__raw_data_filler = 0;
    }
    if (m_data_filler) {
        delete m_data_filler; m_data_filler = 0;
    }
    if (m_trailer) {
        delete m_trailer; m_trailer = 0;
    }
    if (f_blocks) {
        if (m_blocks) {
            delete m_blocks; m_blocks = 0;
        }
    }
    if (f_values) {
        if (m_values) {
            delete m_values; m_values = 0;
        }
    }
}

mifare_classic_t::sector_t::filler_t::filler_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::sector_t::filler_t::_read() {
    m_data = m__io->read_bytes(_io()->size());
}

mifare_classic_t::sector_t::filler_t::~filler_t() {
    _clean_up();
}

void mifare_classic_t::sector_t::filler_t::_clean_up() {
}

mifare_classic_t::sector_t::values_t::values_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::sector_t::values_t::_read() {
    m_values = new std::vector<value_block_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(new value_block_t(m__io, this, m__root));
            i++;
        }
    }
}

mifare_classic_t::sector_t::values_t::~values_t() {
    _clean_up();
}

void mifare_classic_t::sector_t::values_t::_clean_up() {
    if (m_values) {
        for (std::vector<value_block_t*>::iterator it = m_values->begin(); it != m_values->end(); ++it) {
            delete *it;
        }
        delete m_values; m_values = 0;
    }
}

mifare_classic_t::sector_t::values_t::value_block_t::value_block_t(kaitai::kstream* p__io, mifare_classic_t::sector_t::values_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_valuez = 0;
    m_addrz = 0;
    f_addr = false;
    f_addr_valid = false;
    f_valid = false;
    f_value = false;
    f_value_valid = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::sector_t::values_t::value_block_t::_read() {
    m_valuez = new std::vector<uint32_t>();
    const int l_valuez = 3;
    for (int i = 0; i < l_valuez; i++) {
        m_valuez->push_back(m__io->read_u4le());
    }
    m_addrz = new std::vector<uint8_t>();
    const int l_addrz = 4;
    for (int i = 0; i < l_addrz; i++) {
        m_addrz->push_back(m__io->read_u1());
    }
}

mifare_classic_t::sector_t::values_t::value_block_t::~value_block_t() {
    _clean_up();
}

void mifare_classic_t::sector_t::values_t::value_block_t::_clean_up() {
    if (m_valuez) {
        delete m_valuez; m_valuez = 0;
    }
    if (m_addrz) {
        delete m_addrz; m_addrz = 0;
    }
}

uint8_t mifare_classic_t::sector_t::values_t::value_block_t::addr() {
    if (f_addr)
        return m_addr;
    f_addr = true;
    n_addr = true;
    if (valid()) {
        n_addr = false;
        m_addr = addrz()->at(0);
    }
    return m_addr;
}

bool mifare_classic_t::sector_t::values_t::value_block_t::addr_valid() {
    if (f_addr_valid)
        return m_addr_valid;
    f_addr_valid = true;
    m_addr_valid =  ((addrz()->at(0) == ~(addrz()->at(1))) && (addrz()->at(0) == addrz()->at(2)) && (addrz()->at(1) == addrz()->at(3))) ;
    return m_addr_valid;
}

bool mifare_classic_t::sector_t::values_t::value_block_t::valid() {
    if (f_valid)
        return m_valid;
    f_valid = true;
    m_valid =  ((value_valid()) && (addr_valid())) ;
    return m_valid;
}

uint32_t mifare_classic_t::sector_t::values_t::value_block_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    n_value = true;
    if (valid()) {
        n_value = false;
        m_value = valuez()->at(0);
    }
    return m_value;
}

bool mifare_classic_t::sector_t::values_t::value_block_t::value_valid() {
    if (f_value_valid)
        return m_value_valid;
    f_value_valid = true;
    m_value_valid =  ((valuez()->at(0) == ~(valuez()->at(1))) && (valuez()->at(0) == valuez()->at(2))) ;
    return m_value_valid;
}

int8_t mifare_classic_t::sector_t::block_size() {
    if (f_block_size)
        return m_block_size;
    f_block_size = true;
    m_block_size = 16;
    return m_block_size;
}

std::vector<std::string>* mifare_classic_t::sector_t::blocks() {
    if (f_blocks)
        return m_blocks;
    f_blocks = true;
    kaitai::kstream *io = data_filler()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_blocks = new std::vector<std::string>();
    {
        int i = 0;
        while (!io->is_eof()) {
            m_blocks->push_back(io->read_bytes(block_size()));
            i++;
        }
    }
    io->seek(_pos);
    return m_blocks;
}

std::string mifare_classic_t::sector_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    m_data = data_filler()->data();
    return m_data;
}

mifare_classic_t::sector_t::values_t* mifare_classic_t::sector_t::values() {
    if (f_values)
        return m_values;
    f_values = true;
    kaitai::kstream *io = data_filler()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_values = new values_t(io, this, m__root);
    io->seek(_pos);
    return m_values;
}

mifare_classic_t::trailer_t::trailer_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key_a = 0;
    m_access_bits = 0;
    m__io__raw_access_bits = 0;
    m_key_b = 0;
    f_ac_bits = false;
    f_ac_count_of_chunks = false;
    f_acs_in_sector = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::trailer_t::_read() {
    m_key_a = new key_t(m__io, this, m__root);
    m__raw_access_bits = m__io->read_bytes(3);
    m__io__raw_access_bits = new kaitai::kstream(m__raw_access_bits);
    m_access_bits = new access_conditions_t(m__io__raw_access_bits, this, m__root);
    m_user_byte = m__io->read_u1();
    m_key_b = new key_t(m__io, this, m__root);
}

mifare_classic_t::trailer_t::~trailer_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::_clean_up() {
    if (m_key_a) {
        delete m_key_a; m_key_a = 0;
    }
    if (m__io__raw_access_bits) {
        delete m__io__raw_access_bits; m__io__raw_access_bits = 0;
    }
    if (m_access_bits) {
        delete m_access_bits; m_access_bits = 0;
    }
    if (m_key_b) {
        delete m_key_b; m_key_b = 0;
    }
}

mifare_classic_t::trailer_t::access_conditions_t::access_conditions_t(kaitai::kstream* p__io, mifare_classic_t::trailer_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_raw_chunks = 0;
    m_acs_raw = 0;
    m_chunks = 0;
    m_data_acs = 0;
    m_remaps = 0;
    m_trailer_ac = 0;
    f_acs_raw = false;
    f_chunks = false;
    f_data_acs = false;
    f_remaps = false;
    f_trailer_ac = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::trailer_t::access_conditions_t::_read() {
    m_raw_chunks = new std::vector<uint64_t>();
    const int l_raw_chunks = _parent()->ac_count_of_chunks();
    for (int i = 0; i < l_raw_chunks; i++) {
        m_raw_chunks->push_back(m__io->read_bits_int_be(4));
    }
}

mifare_classic_t::trailer_t::access_conditions_t::~access_conditions_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::_clean_up() {
    if (m_raw_chunks) {
        delete m_raw_chunks; m_raw_chunks = 0;
    }
    if (f_acs_raw) {
        if (m_acs_raw) {
            for (std::vector<ac_t*>::iterator it = m_acs_raw->begin(); it != m_acs_raw->end(); ++it) {
                delete *it;
            }
            delete m_acs_raw; m_acs_raw = 0;
        }
    }
    if (f_chunks) {
        if (m_chunks) {
            for (std::vector<valid_chunk_t*>::iterator it = m_chunks->begin(); it != m_chunks->end(); ++it) {
                delete *it;
            }
            delete m_chunks; m_chunks = 0;
        }
    }
    if (f_data_acs) {
        if (m_data_acs) {
            for (std::vector<data_ac_t*>::iterator it = m_data_acs->begin(); it != m_data_acs->end(); ++it) {
                delete *it;
            }
            delete m_data_acs; m_data_acs = 0;
        }
    }
    if (f_remaps) {
        if (m_remaps) {
            for (std::vector<chunk_bit_remap_t*>::iterator it = m_remaps->begin(); it != m_remaps->end(); ++it) {
                delete *it;
            }
            delete m_remaps; m_remaps = 0;
        }
    }
    if (f_trailer_ac) {
        if (m_trailer_ac) {
            delete m_trailer_ac; m_trailer_ac = 0;
        }
    }
}

mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_t(uint8_t p_index, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index = p_index;
    m_bits = 0;
    f_bits = false;
    f_inv_shift_val = false;
    f_val = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::trailer_t::access_conditions_t::ac_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::ac_t::~ac_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::ac_t::_clean_up() {
    if (f_bits) {
        if (m_bits) {
            for (std::vector<ac_bit_t*>::iterator it = m_bits->begin(); it != m_bits->end(); ++it) {
                delete *it;
            }
            delete m_bits; m_bits = 0;
        }
    }
}

mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::ac_bit_t(uint8_t p_i, uint8_t p_chunk, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t::ac_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_i = p_i;
    m_chunk = p_chunk;
    f_b = false;
    f_n = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::~ac_bit_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::_clean_up() {
}

bool mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::b() {
    if (f_b)
        return m_b;
    f_b = true;
    m_b = n() == 1;
    return m_b;
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::n() {
    if (f_n)
        return m_n;
    f_n = true;
    m_n = chunk() >> i() & 1;
    return m_n;
}

std::vector<mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t*>* mifare_classic_t::trailer_t::access_conditions_t::ac_t::bits() {
    if (f_bits)
        return m_bits;
    f_bits = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_bits = new std::vector<ac_bit_t*>();
    const int l_bits = _parent()->_parent()->ac_bits();
    for (int i = 0; i < l_bits; i++) {
        m_bits->push_back(new ac_bit_t(index(), _parent()->chunks()->at(i)->chunk(), m__io, this, m__root));
    }
    m__io->seek(_pos);
    return m_bits;
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::ac_t::inv_shift_val() {
    if (f_inv_shift_val)
        return m_inv_shift_val;
    f_inv_shift_val = true;
    m_inv_shift_val = (bits()->at(0)->n() << 2 | bits()->at(1)->n() << 1) | bits()->at(2)->n();
    return m_inv_shift_val;
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::ac_t::val() {
    if (f_val)
        return m_val;
    f_val = true;
    m_val = (bits()->at(2)->n() << 2 | bits()->at(1)->n() << 1) | bits()->at(0)->n();
    return m_val;
}

mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::chunk_bit_remap_t(uint8_t p_bit_no, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bit_no = p_bit_no;
    f_chunk_no = false;
    f_inv_chunk_no = false;
    f_shift_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::~chunk_bit_remap_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::_clean_up() {
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::chunk_no() {
    if (f_chunk_no)
        return m_chunk_no;
    f_chunk_no = true;
    m_chunk_no = kaitai::kstream::mod((inv_chunk_no() + shift_value()) + _parent()->_parent()->ac_count_of_chunks(), _parent()->_parent()->ac_count_of_chunks());
    return m_chunk_no;
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::inv_chunk_no() {
    if (f_inv_chunk_no)
        return m_inv_chunk_no;
    f_inv_chunk_no = true;
    m_inv_chunk_no = bit_no() + shift_value();
    return m_inv_chunk_no;
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::shift_value() {
    if (f_shift_value)
        return m_shift_value;
    f_shift_value = true;
    m_shift_value = ((bit_no() == 1) ? (-1) : (1));
    return m_shift_value;
}

mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::data_ac_t(ac_t* p_ac, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ac = p_ac;
    f_decrement_available = false;
    f_increment_available = false;
    f_read_key_a_required = false;
    f_read_key_b_required = false;
    f_write_key_a_required = false;
    f_write_key_b_required = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::~data_ac_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::_clean_up() {
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::decrement_available() {
    if (f_decrement_available)
        return m_decrement_available;
    f_decrement_available = true;
    m_decrement_available =  (( ((ac()->bits()->at(1)->b()) || (!(ac()->bits()->at(0)->b()))) ) && (!(ac()->bits()->at(2)->b()))) ;
    return m_decrement_available;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::increment_available() {
    if (f_increment_available)
        return m_increment_available;
    f_increment_available = true;
    m_increment_available =  (( ((!(ac()->bits()->at(0)->b())) && (!(read_key_a_required())) && (!(read_key_b_required()))) ) || ( ((!(ac()->bits()->at(0)->b())) && (read_key_a_required()) && (read_key_b_required())) )) ;
    return m_increment_available;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::read_key_a_required() {
    if (f_read_key_a_required)
        return m_read_key_a_required;
    f_read_key_a_required = true;
    m_read_key_a_required = ac()->val() <= 4;
    return m_read_key_a_required;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::read_key_b_required() {
    if (f_read_key_b_required)
        return m_read_key_b_required;
    f_read_key_b_required = true;
    m_read_key_b_required = ac()->val() <= 6;
    return m_read_key_b_required;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::write_key_a_required() {
    if (f_write_key_a_required)
        return m_write_key_a_required;
    f_write_key_a_required = true;
    m_write_key_a_required = ac()->val() == 0;
    return m_write_key_a_required;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::write_key_b_required() {
    if (f_write_key_b_required)
        return m_write_key_b_required;
    f_write_key_b_required = true;
    m_write_key_b_required =  (( ((!(read_key_a_required())) || (read_key_b_required())) ) && (!(ac()->bits()->at(0)->b()))) ;
    return m_write_key_b_required;
}

mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::trailer_ac_t(ac_t* p_ac, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ac = p_ac;
    f_can_read_key_b = false;
    f_can_write_access_bits = false;
    f_can_write_keys = false;
    f_key_b_controls_write = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::~trailer_ac_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::_clean_up() {
}

bool mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::can_read_key_b() {
    if (f_can_read_key_b)
        return m_can_read_key_b;
    f_can_read_key_b = true;
    m_can_read_key_b = ac()->inv_shift_val() <= 2;
    return m_can_read_key_b;
}

bool mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::can_write_access_bits() {
    if (f_can_write_access_bits)
        return m_can_write_access_bits;
    f_can_write_access_bits = true;
    m_can_write_access_bits = ac()->bits()->at(2)->b();
    return m_can_write_access_bits;
}

bool mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::can_write_keys() {
    if (f_can_write_keys)
        return m_can_write_keys;
    f_can_write_keys = true;
    m_can_write_keys =  ((kaitai::kstream::mod(ac()->inv_shift_val() + 1, 3) != 0) && (ac()->inv_shift_val() < 6)) ;
    return m_can_write_keys;
}

bool mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::key_b_controls_write() {
    if (f_key_b_controls_write)
        return m_key_b_controls_write;
    f_key_b_controls_write = true;
    m_key_b_controls_write = !(can_read_key_b());
    return m_key_b_controls_write;
}

mifare_classic_t::trailer_t::access_conditions_t::valid_chunk_t::valid_chunk_t(uint8_t p_inv_chunk, uint8_t p_chunk, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_inv_chunk = p_inv_chunk;
    m_chunk = p_chunk;
    f_valid = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mifare_classic_t::trailer_t::access_conditions_t::valid_chunk_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::valid_chunk_t::~valid_chunk_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::valid_chunk_t::_clean_up() {
}

bool mifare_classic_t::trailer_t::access_conditions_t::valid_chunk_t::valid() {
    if (f_valid)
        return m_valid;
    f_valid = true;
    m_valid = (inv_chunk() ^ chunk()) == 15;
    return m_valid;
}

std::vector<mifare_classic_t::trailer_t::access_conditions_t::ac_t*>* mifare_classic_t::trailer_t::access_conditions_t::acs_raw() {
    if (f_acs_raw)
        return m_acs_raw;
    f_acs_raw = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_acs_raw = new std::vector<ac_t*>();
    const int l_acs_raw = _parent()->acs_in_sector();
    for (int i = 0; i < l_acs_raw; i++) {
        m_acs_raw->push_back(new ac_t(i, m__io, this, m__root));
    }
    m__io->seek(_pos);
    return m_acs_raw;
}

std::vector<mifare_classic_t::trailer_t::access_conditions_t::valid_chunk_t*>* mifare_classic_t::trailer_t::access_conditions_t::chunks() {
    if (f_chunks)
        return m_chunks;
    f_chunks = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_chunks = new std::vector<valid_chunk_t*>();
    const int l_chunks = _parent()->ac_bits();
    for (int i = 0; i < l_chunks; i++) {
        m_chunks->push_back(new valid_chunk_t(raw_chunks()->at(remaps()->at(i)->inv_chunk_no()), raw_chunks()->at(remaps()->at(i)->chunk_no()), m__io, this, m__root));
    }
    m__io->seek(_pos);
    return m_chunks;
}

std::vector<mifare_classic_t::trailer_t::access_conditions_t::data_ac_t*>* mifare_classic_t::trailer_t::access_conditions_t::data_acs() {
    if (f_data_acs)
        return m_data_acs;
    f_data_acs = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_data_acs = new std::vector<data_ac_t*>();
    const int l_data_acs = _parent()->acs_in_sector() - 1;
    for (int i = 0; i < l_data_acs; i++) {
        m_data_acs->push_back(new data_ac_t(acs_raw()->at(i), m__io, this, m__root));
    }
    m__io->seek(_pos);
    return m_data_acs;
}

std::vector<mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t*>* mifare_classic_t::trailer_t::access_conditions_t::remaps() {
    if (f_remaps)
        return m_remaps;
    f_remaps = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_remaps = new std::vector<chunk_bit_remap_t*>();
    const int l_remaps = _parent()->ac_bits();
    for (int i = 0; i < l_remaps; i++) {
        m_remaps->push_back(new chunk_bit_remap_t(i, m__io, this, m__root));
    }
    m__io->seek(_pos);
    return m_remaps;
}

mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t* mifare_classic_t::trailer_t::access_conditions_t::trailer_ac() {
    if (f_trailer_ac)
        return m_trailer_ac;
    f_trailer_ac = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_trailer_ac = new trailer_ac_t(acs_raw()->at(_parent()->acs_in_sector() - 1), m__io, this, m__root);
    m__io->seek(_pos);
    return m_trailer_ac;
}

int8_t mifare_classic_t::trailer_t::ac_bits() {
    if (f_ac_bits)
        return m_ac_bits;
    f_ac_bits = true;
    m_ac_bits = 3;
    return m_ac_bits;
}

int32_t mifare_classic_t::trailer_t::ac_count_of_chunks() {
    if (f_ac_count_of_chunks)
        return m_ac_count_of_chunks;
    f_ac_count_of_chunks = true;
    m_ac_count_of_chunks = ac_bits() * 2;
    return m_ac_count_of_chunks;
}

int8_t mifare_classic_t::trailer_t::acs_in_sector() {
    if (f_acs_in_sector)
        return m_acs_in_sector;
    f_acs_in_sector = true;
    m_acs_in_sector = 4;
    return m_acs_in_sector;
}
