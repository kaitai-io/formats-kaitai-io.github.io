// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mifare_classic.h"

mifare_classic_t::mifare_classic_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_sectors = nullptr;
    m__raw_sectors = nullptr;
    m__io__raw_sectors = nullptr;
    _read();
}

void mifare_classic_t::_read() {
    m__raw_sectors = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_sectors = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_sectors = std::unique_ptr<std::vector<std::unique_ptr<sector_t>>>(new std::vector<std::unique_ptr<sector_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m__raw_sectors->push_back(std::move(m__io->read_bytes(((((i >= 32) ? (4) : (1)) * 4) * 16))));
            kaitai::kstream* io__raw_sectors = new kaitai::kstream(m__raw_sectors->at(m__raw_sectors->size() - 1));
            m__io__raw_sectors->emplace_back(io__raw_sectors);
            m_sectors->push_back(std::move(std::unique_ptr<sector_t>(new sector_t(i == 0, io__raw_sectors, this, m__root))));
            i++;
        }
    }
}

mifare_classic_t::~mifare_classic_t() {
    _clean_up();
}

void mifare_classic_t::_clean_up() {
}

mifare_classic_t::key_t::key_t(kaitai::kstream* p__io, mifare_classic_t::trailer_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mifare_classic_t::key_t::_read() {
    m_key = m__io->read_bytes(6);
}

mifare_classic_t::key_t::~key_t() {
    _clean_up();
}

void mifare_classic_t::key_t::_clean_up() {
}

mifare_classic_t::sector_t::sector_t(bool p_has_manufacturer, kaitai::kstream* p__io, mifare_classic_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_manufacturer = p_has_manufacturer;
    m_manufacturer = nullptr;
    m_data_filler = nullptr;
    m__io__raw_data_filler = nullptr;
    m_trailer = nullptr;
    m_blocks = nullptr;
    m_values = nullptr;
    f_block_size = false;
    f_data = false;
    f_blocks = false;
    f_values = false;
    _read();
}

void mifare_classic_t::sector_t::_read() {
    n_manufacturer = true;
    if (has_manufacturer()) {
        n_manufacturer = false;
        m_manufacturer = std::unique_ptr<manufacturer_t>(new manufacturer_t(m__io, this, m__root));
    }
    m__raw_data_filler = m__io->read_bytes(((_io()->size() - _io()->pos()) - 16));
    m__io__raw_data_filler = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data_filler));
    m_data_filler = std::unique_ptr<filler_t>(new filler_t(m__io__raw_data_filler.get(), this, m__root));
    m_trailer = std::unique_ptr<trailer_t>(new trailer_t(m__io, this, m__root));
}

mifare_classic_t::sector_t::~sector_t() {
    _clean_up();
}

void mifare_classic_t::sector_t::_clean_up() {
    if (!n_manufacturer) {
    }
    if (f_blocks) {
    }
    if (f_values) {
    }
}

mifare_classic_t::sector_t::values_t::values_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void mifare_classic_t::sector_t::values_t::_read() {
    m_values = std::unique_ptr<std::vector<std::unique_ptr<value_block_t>>>(new std::vector<std::unique_ptr<value_block_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(std::move(std::unique_ptr<value_block_t>(new value_block_t(m__io, this, m__root))));
            i++;
        }
    }
}

mifare_classic_t::sector_t::values_t::~values_t() {
    _clean_up();
}

void mifare_classic_t::sector_t::values_t::_clean_up() {
}

mifare_classic_t::sector_t::values_t::value_block_t::value_block_t(kaitai::kstream* p__io, mifare_classic_t::sector_t::values_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_valuez = nullptr;
    m_addrz = nullptr;
    f_addr = false;
    f_addr_valid = false;
    f_valid = false;
    f_value_valid = false;
    f_value = false;
    _read();
}

void mifare_classic_t::sector_t::values_t::value_block_t::_read() {
    m_valuez = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_valuez = 3;
    for (int i = 0; i < l_valuez; i++) {
        m_valuez->push_back(std::move(m__io->read_u4le()));
    }
    m_addrz = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_addrz = 4;
    for (int i = 0; i < l_addrz; i++) {
        m_addrz->push_back(std::move(m__io->read_u1()));
    }
}

mifare_classic_t::sector_t::values_t::value_block_t::~value_block_t() {
    _clean_up();
}

void mifare_classic_t::sector_t::values_t::value_block_t::_clean_up() {
}

uint8_t mifare_classic_t::sector_t::values_t::value_block_t::addr() {
    if (f_addr)
        return m_addr;
    n_addr = true;
    if (valid()) {
        n_addr = false;
        m_addr = addrz()->at(0);
    }
    f_addr = true;
    return m_addr;
}

bool mifare_classic_t::sector_t::values_t::value_block_t::addr_valid() {
    if (f_addr_valid)
        return m_addr_valid;
    m_addr_valid =  ((addrz()->at(0) == ~(addrz()->at(1))) && (addrz()->at(0) == addrz()->at(2)) && (addrz()->at(1) == addrz()->at(3))) ;
    f_addr_valid = true;
    return m_addr_valid;
}

bool mifare_classic_t::sector_t::values_t::value_block_t::valid() {
    if (f_valid)
        return m_valid;
    m_valid =  ((value_valid()) && (addr_valid())) ;
    f_valid = true;
    return m_valid;
}

bool mifare_classic_t::sector_t::values_t::value_block_t::value_valid() {
    if (f_value_valid)
        return m_value_valid;
    m_value_valid =  ((valuez()->at(0) == ~(valuez()->at(1))) && (valuez()->at(0) == valuez()->at(2))) ;
    f_value_valid = true;
    return m_value_valid;
}

uint32_t mifare_classic_t::sector_t::values_t::value_block_t::value() {
    if (f_value)
        return m_value;
    n_value = true;
    if (valid()) {
        n_value = false;
        m_value = valuez()->at(0);
    }
    f_value = true;
    return m_value;
}

mifare_classic_t::sector_t::filler_t::filler_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mifare_classic_t::sector_t::filler_t::_read() {
    m_data = m__io->read_bytes(_io()->size());
}

mifare_classic_t::sector_t::filler_t::~filler_t() {
    _clean_up();
}

void mifare_classic_t::sector_t::filler_t::_clean_up() {
}

int8_t mifare_classic_t::sector_t::block_size() {
    if (f_block_size)
        return m_block_size;
    m_block_size = 16;
    f_block_size = true;
    return m_block_size;
}

std::string mifare_classic_t::sector_t::data() {
    if (f_data)
        return m_data;
    m_data = data_filler()->data();
    f_data = true;
    return m_data;
}

std::vector<std::string>* mifare_classic_t::sector_t::blocks() {
    if (f_blocks)
        return m_blocks.get();
    kaitai::kstream *io = data_filler()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_blocks = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!io->is_eof()) {
            m_blocks->push_back(std::move(io->read_bytes(block_size())));
            i++;
        }
    }
    io->seek(_pos);
    f_blocks = true;
    return m_blocks.get();
}

mifare_classic_t::sector_t::values_t* mifare_classic_t::sector_t::values() {
    if (f_values)
        return m_values.get();
    kaitai::kstream *io = data_filler()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_values = std::unique_ptr<values_t>(new values_t(io, this, m__root));
    io->seek(_pos);
    f_values = true;
    return m_values.get();
}

mifare_classic_t::manufacturer_t::manufacturer_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

mifare_classic_t::trailer_t::trailer_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key_a = nullptr;
    m_access_bits = nullptr;
    m__io__raw_access_bits = nullptr;
    m_key_b = nullptr;
    f_ac_bits = false;
    f_acs_in_sector = false;
    f_ac_count_of_chunks = false;
    _read();
}

void mifare_classic_t::trailer_t::_read() {
    m_key_a = std::unique_ptr<key_t>(new key_t(m__io, this, m__root));
    m__raw_access_bits = m__io->read_bytes(3);
    m__io__raw_access_bits = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_access_bits));
    m_access_bits = std::unique_ptr<access_conditions_t>(new access_conditions_t(m__io__raw_access_bits.get(), this, m__root));
    m_user_byte = m__io->read_u1();
    m_key_b = std::unique_ptr<key_t>(new key_t(m__io, this, m__root));
}

mifare_classic_t::trailer_t::~trailer_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::_clean_up() {
}

mifare_classic_t::trailer_t::access_conditions_t::access_conditions_t(kaitai::kstream* p__io, mifare_classic_t::trailer_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_raw_chunks = nullptr;
    m_data_acs = nullptr;
    m_remaps = nullptr;
    m_acs_raw = nullptr;
    m_trailer_ac = nullptr;
    m_chunks = nullptr;
    f_data_acs = false;
    f_remaps = false;
    f_acs_raw = false;
    f_trailer_ac = false;
    f_chunks = false;
    _read();
}

void mifare_classic_t::trailer_t::access_conditions_t::_read() {
    m_raw_chunks = std::unique_ptr<std::vector<uint64_t>>(new std::vector<uint64_t>());
    const int l_raw_chunks = _parent()->ac_count_of_chunks();
    for (int i = 0; i < l_raw_chunks; i++) {
        m_raw_chunks->push_back(std::move(m__io->read_bits_int_be(4)));
    }
}

mifare_classic_t::trailer_t::access_conditions_t::~access_conditions_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::_clean_up() {
    if (f_data_acs) {
    }
    if (f_remaps) {
    }
    if (f_acs_raw) {
    }
    if (f_trailer_ac) {
    }
    if (f_chunks) {
    }
}

mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::trailer_ac_t(ac_t* p_ac, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ac = p_ac;
    f_can_read_key_b = false;
    f_can_write_keys = false;
    f_can_write_access_bits = false;
    f_key_b_controls_write = false;
    _read();
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
    m_can_read_key_b = ac()->inv_shift_val() <= 2;
    f_can_read_key_b = true;
    return m_can_read_key_b;
}

bool mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::can_write_keys() {
    if (f_can_write_keys)
        return m_can_write_keys;
    m_can_write_keys =  ((kaitai::kstream::mod((ac()->inv_shift_val() + 1), 3) != 0) && (ac()->inv_shift_val() < 6)) ;
    f_can_write_keys = true;
    return m_can_write_keys;
}

bool mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::can_write_access_bits() {
    if (f_can_write_access_bits)
        return m_can_write_access_bits;
    m_can_write_access_bits = ac()->bits()->at(2)->b();
    f_can_write_access_bits = true;
    return m_can_write_access_bits;
}

bool mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t::key_b_controls_write() {
    if (f_key_b_controls_write)
        return m_key_b_controls_write;
    m_key_b_controls_write = !(can_read_key_b());
    f_key_b_controls_write = true;
    return m_key_b_controls_write;
}

mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::chunk_bit_remap_t(uint8_t p_bit_no, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bit_no = p_bit_no;
    f_shift_value = false;
    f_chunk_no = false;
    f_inv_chunk_no = false;
    _read();
}

void mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::~chunk_bit_remap_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::_clean_up() {
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::shift_value() {
    if (f_shift_value)
        return m_shift_value;
    m_shift_value = ((bit_no() == 1) ? (-1) : (1));
    f_shift_value = true;
    return m_shift_value;
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::chunk_no() {
    if (f_chunk_no)
        return m_chunk_no;
    m_chunk_no = kaitai::kstream::mod(((inv_chunk_no() + shift_value()) + _parent()->_parent()->ac_count_of_chunks()), _parent()->_parent()->ac_count_of_chunks());
    f_chunk_no = true;
    return m_chunk_no;
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t::inv_chunk_no() {
    if (f_inv_chunk_no)
        return m_inv_chunk_no;
    m_inv_chunk_no = (bit_no() + shift_value());
    f_inv_chunk_no = true;
    return m_inv_chunk_no;
}

mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::data_ac_t(ac_t* p_ac, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ac = p_ac;
    f_read_key_a_required = false;
    f_write_key_b_required = false;
    f_write_key_a_required = false;
    f_read_key_b_required = false;
    f_decrement_available = false;
    f_increment_available = false;
    _read();
}

void mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::~data_ac_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::_clean_up() {
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::read_key_a_required() {
    if (f_read_key_a_required)
        return m_read_key_a_required;
    m_read_key_a_required = ac()->val() <= 4;
    f_read_key_a_required = true;
    return m_read_key_a_required;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::write_key_b_required() {
    if (f_write_key_b_required)
        return m_write_key_b_required;
    m_write_key_b_required =  (( ((!(read_key_a_required())) || (read_key_b_required())) ) && (!(ac()->bits()->at(0)->b()))) ;
    f_write_key_b_required = true;
    return m_write_key_b_required;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::write_key_a_required() {
    if (f_write_key_a_required)
        return m_write_key_a_required;
    m_write_key_a_required = ac()->val() == 0;
    f_write_key_a_required = true;
    return m_write_key_a_required;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::read_key_b_required() {
    if (f_read_key_b_required)
        return m_read_key_b_required;
    m_read_key_b_required = ac()->val() <= 6;
    f_read_key_b_required = true;
    return m_read_key_b_required;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::decrement_available() {
    if (f_decrement_available)
        return m_decrement_available;
    m_decrement_available =  (( ((ac()->bits()->at(1)->b()) || (!(ac()->bits()->at(0)->b()))) ) && (!(ac()->bits()->at(2)->b()))) ;
    f_decrement_available = true;
    return m_decrement_available;
}

bool mifare_classic_t::trailer_t::access_conditions_t::data_ac_t::increment_available() {
    if (f_increment_available)
        return m_increment_available;
    m_increment_available =  (( ((!(ac()->bits()->at(0)->b())) && (!(read_key_a_required())) && (!(read_key_b_required()))) ) || ( ((!(ac()->bits()->at(0)->b())) && (read_key_a_required()) && (read_key_b_required())) )) ;
    f_increment_available = true;
    return m_increment_available;
}

mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_t(uint8_t p_index, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index = p_index;
    m_bits = nullptr;
    f_bits = false;
    f_val = false;
    f_inv_shift_val = false;
    _read();
}

void mifare_classic_t::trailer_t::access_conditions_t::ac_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::ac_t::~ac_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::ac_t::_clean_up() {
    if (f_bits) {
    }
}

mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::ac_bit_t(uint8_t p_i, uint8_t p_chunk, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t::ac_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_i = p_i;
    m_chunk = p_chunk;
    f_n = false;
    f_b = false;
    _read();
}

void mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::_read() {
}

mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::~ac_bit_t() {
    _clean_up();
}

void mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::_clean_up() {
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::n() {
    if (f_n)
        return m_n;
    m_n = ((chunk() >> i()) & 1);
    f_n = true;
    return m_n;
}

bool mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t::b() {
    if (f_b)
        return m_b;
    m_b = n() == 1;
    f_b = true;
    return m_b;
}

std::vector<std::unique_ptr<mifare_classic_t::trailer_t::access_conditions_t::ac_t::ac_bit_t>>* mifare_classic_t::trailer_t::access_conditions_t::ac_t::bits() {
    if (f_bits)
        return m_bits.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_bits = std::unique_ptr<std::vector<std::unique_ptr<ac_bit_t>>>(new std::vector<std::unique_ptr<ac_bit_t>>());
    const int l_bits = _parent()->_parent()->ac_bits();
    for (int i = 0; i < l_bits; i++) {
        m_bits->push_back(std::move(std::unique_ptr<ac_bit_t>(new ac_bit_t(index(), _parent()->chunks()->at(i)->chunk(), m__io, this, m__root))));
    }
    m__io->seek(_pos);
    f_bits = true;
    return m_bits.get();
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::ac_t::val() {
    if (f_val)
        return m_val;
    m_val = (((bits()->at(2)->n() << 2) | (bits()->at(1)->n() << 1)) | bits()->at(0)->n());
    f_val = true;
    return m_val;
}

int32_t mifare_classic_t::trailer_t::access_conditions_t::ac_t::inv_shift_val() {
    if (f_inv_shift_val)
        return m_inv_shift_val;
    m_inv_shift_val = (((bits()->at(0)->n() << 2) | (bits()->at(1)->n() << 1)) | bits()->at(2)->n());
    f_inv_shift_val = true;
    return m_inv_shift_val;
}

mifare_classic_t::trailer_t::access_conditions_t::valid_chunk_t::valid_chunk_t(uint8_t p_inv_chunk, uint8_t p_chunk, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent, mifare_classic_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_inv_chunk = p_inv_chunk;
    m_chunk = p_chunk;
    f_valid = false;
    _read();
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
    m_valid = (inv_chunk() ^ chunk()) == 15;
    f_valid = true;
    return m_valid;
}

std::vector<std::unique_ptr<mifare_classic_t::trailer_t::access_conditions_t::data_ac_t>>* mifare_classic_t::trailer_t::access_conditions_t::data_acs() {
    if (f_data_acs)
        return m_data_acs.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_data_acs = std::unique_ptr<std::vector<std::unique_ptr<data_ac_t>>>(new std::vector<std::unique_ptr<data_ac_t>>());
    const int l_data_acs = (_parent()->acs_in_sector() - 1);
    for (int i = 0; i < l_data_acs; i++) {
        m_data_acs->push_back(std::move(std::unique_ptr<data_ac_t>(new data_ac_t(acs_raw()->at(i), m__io, this, m__root))));
    }
    m__io->seek(_pos);
    f_data_acs = true;
    return m_data_acs.get();
}

std::vector<std::unique_ptr<mifare_classic_t::trailer_t::access_conditions_t::chunk_bit_remap_t>>* mifare_classic_t::trailer_t::access_conditions_t::remaps() {
    if (f_remaps)
        return m_remaps.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_remaps = std::unique_ptr<std::vector<std::unique_ptr<chunk_bit_remap_t>>>(new std::vector<std::unique_ptr<chunk_bit_remap_t>>());
    const int l_remaps = _parent()->ac_bits();
    for (int i = 0; i < l_remaps; i++) {
        m_remaps->push_back(std::move(std::unique_ptr<chunk_bit_remap_t>(new chunk_bit_remap_t(i, m__io, this, m__root))));
    }
    m__io->seek(_pos);
    f_remaps = true;
    return m_remaps.get();
}

std::vector<std::unique_ptr<mifare_classic_t::trailer_t::access_conditions_t::ac_t>>* mifare_classic_t::trailer_t::access_conditions_t::acs_raw() {
    if (f_acs_raw)
        return m_acs_raw.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_acs_raw = std::unique_ptr<std::vector<std::unique_ptr<ac_t>>>(new std::vector<std::unique_ptr<ac_t>>());
    const int l_acs_raw = _parent()->acs_in_sector();
    for (int i = 0; i < l_acs_raw; i++) {
        m_acs_raw->push_back(std::move(std::unique_ptr<ac_t>(new ac_t(i, m__io, this, m__root))));
    }
    m__io->seek(_pos);
    f_acs_raw = true;
    return m_acs_raw.get();
}

mifare_classic_t::trailer_t::access_conditions_t::trailer_ac_t* mifare_classic_t::trailer_t::access_conditions_t::trailer_ac() {
    if (f_trailer_ac)
        return m_trailer_ac.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_trailer_ac = std::unique_ptr<trailer_ac_t>(new trailer_ac_t(acs_raw()->at((_parent()->acs_in_sector() - 1)), m__io, this, m__root));
    m__io->seek(_pos);
    f_trailer_ac = true;
    return m_trailer_ac.get();
}

std::vector<std::unique_ptr<mifare_classic_t::trailer_t::access_conditions_t::valid_chunk_t>>* mifare_classic_t::trailer_t::access_conditions_t::chunks() {
    if (f_chunks)
        return m_chunks.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_chunks = std::unique_ptr<std::vector<std::unique_ptr<valid_chunk_t>>>(new std::vector<std::unique_ptr<valid_chunk_t>>());
    const int l_chunks = _parent()->ac_bits();
    for (int i = 0; i < l_chunks; i++) {
        m_chunks->push_back(std::move(std::unique_ptr<valid_chunk_t>(new valid_chunk_t(raw_chunks()->at(remaps()->at(i)->inv_chunk_no()), raw_chunks()->at(remaps()->at(i)->chunk_no()), m__io, this, m__root))));
    }
    m__io->seek(_pos);
    f_chunks = true;
    return m_chunks.get();
}

int8_t mifare_classic_t::trailer_t::ac_bits() {
    if (f_ac_bits)
        return m_ac_bits;
    m_ac_bits = 3;
    f_ac_bits = true;
    return m_ac_bits;
}

int8_t mifare_classic_t::trailer_t::acs_in_sector() {
    if (f_acs_in_sector)
        return m_acs_in_sector;
    m_acs_in_sector = 4;
    f_acs_in_sector = true;
    return m_acs_in_sector;
}

int32_t mifare_classic_t::trailer_t::ac_count_of_chunks() {
    if (f_ac_count_of_chunks)
        return m_ac_count_of_chunks;
    m_ac_count_of_chunks = (ac_bits() * 2);
    f_ac_count_of_chunks = true;
    return m_ac_count_of_chunks;
}
