// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "uf2.h"
#include "kaitai/exceptions.h"
const std::set<uf2_t::extension_tag_type_t> uf2_t::_values_extension_tag_type_t{
    uf2_t::EXTENSION_TAG_TYPE_END,
    uf2_t::EXTENSION_TAG_TYPE_PAGE_SIZE,
    uf2_t::EXTENSION_TAG_TYPE_DESCRIPTION,
    uf2_t::EXTENSION_TAG_TYPE_RP2_IGNORE_BLOCK,
    uf2_t::EXTENSION_TAG_TYPE_VERSION,
    uf2_t::EXTENSION_TAG_TYPE_SHA2_CHECKSUM,
    uf2_t::EXTENSION_TAG_TYPE_DEVICE_TYPE_ID,
};
bool uf2_t::_is_defined_extension_tag_type_t(uf2_t::extension_tag_type_t v) {
    return uf2_t::_values_extension_tag_type_t.find(v) != uf2_t::_values_extension_tag_type_t.end();
}
const std::set<uf2_t::family_id_t> uf2_t::_values_family_id_t{
    uf2_t::FAMILY_ID_STM32L4,
    uf2_t::FAMILY_ID_STM32L5,
    uf2_t::FAMILY_ID_STM32F411XC,
    uf2_t::FAMILY_ID_M0SENSE,
    uf2_t::FAMILY_ID_ATMEGA32,
    uf2_t::FAMILY_ID_SAML21,
    uf2_t::FAMILY_ID_NRF52,
    uf2_t::FAMILY_ID_ESP32,
    uf2_t::FAMILY_ID_STM32L1,
    uf2_t::FAMILY_ID_STM32L0,
    uf2_t::FAMILY_ID_STM32WL,
    uf2_t::FAMILY_ID_RTL8710B,
    uf2_t::FAMILY_ID_LPC55,
    uf2_t::FAMILY_ID_ESP32C2,
    uf2_t::FAMILY_ID_STM32F411XE,
    uf2_t::FAMILY_ID_STM32G0,
    uf2_t::FAMILY_ID_ESP32S31,
    uf2_t::FAMILY_ID_GD32F350,
    uf2_t::FAMILY_ID_ESP32H2,
    uf2_t::FAMILY_ID_RTL8720D,
    uf2_t::FAMILY_ID_ESP32P4,
    uf2_t::FAMILY_ID_MAIXPLAY_U4,
    uf2_t::FAMILY_ID_STM32G4,
    uf2_t::FAMILY_ID_STM32H5,
    uf2_t::FAMILY_ID_CSK4,
    uf2_t::FAMILY_ID_MIMXRT10XX,
    uf2_t::FAMILY_ID_XR809,
    uf2_t::FAMILY_ID_STM32F7,
    uf2_t::FAMILY_ID_ESP32C6,
    uf2_t::FAMILY_ID_SAMD51,
    uf2_t::FAMILY_ID_STM32F4,
    uf2_t::FAMILY_ID_FX2,
    uf2_t::FAMILY_ID_STM32F2,
    uf2_t::FAMILY_ID_STM32F1,
    uf2_t::FAMILY_ID_NRF52833,
    uf2_t::FAMILY_ID_STM32F0,
    uf2_t::FAMILY_ID_BK7231U,
    uf2_t::FAMILY_ID_SAMD21,
    uf2_t::FAMILY_ID_CH32V,
    uf2_t::FAMILY_ID_BK7251,
    uf2_t::FAMILY_ID_STM32F3,
    uf2_t::FAMILY_ID_STM32F407,
    uf2_t::FAMILY_ID_STM32H7,
    uf2_t::FAMILY_ID_CSK6,
    uf2_t::FAMILY_ID_NRF52832XXAB,
    uf2_t::FAMILY_ID_STM32WB,
    uf2_t::FAMILY_ID_NRF52832XXAA,
    uf2_t::FAMILY_ID_MAX32690,
    uf2_t::FAMILY_ID_ESP32C61,
    uf2_t::FAMILY_ID_BK7231N,
    uf2_t::FAMILY_ID_RA4M1,
    uf2_t::FAMILY_ID_PY32F071_UVK5_V3,
    uf2_t::FAMILY_ID_ESP8266,
    uf2_t::FAMILY_ID_KL32L2,
    uf2_t::FAMILY_ID_NRF52820,
    uf2_t::FAMILY_ID_STM32F407VG,
    uf2_t::FAMILY_ID_MAX78002,
    uf2_t::FAMILY_ID_RZA1LU,
    uf2_t::FAMILY_ID_GD32VF103,
    uf2_t::FAMILY_ID_ESP32H4,
    uf2_t::FAMILY_ID_RTL8710A,
    uf2_t::FAMILY_ID_AT32F415,
    uf2_t::FAMILY_ID_NRF52840,
    uf2_t::FAMILY_ID_ESP32H21,
    uf2_t::FAMILY_ID_ESP32S2,
    uf2_t::FAMILY_ID_ESP32S3,
    uf2_t::FAMILY_ID_ESP32C3,
    uf2_t::FAMILY_ID_MAX32650,
    uf2_t::FAMILY_ID_BL602,
    uf2_t::FAMILY_ID_RTL8720C,
    uf2_t::FAMILY_ID_RP2040,
    uf2_t::FAMILY_ID_RP2XXX_ABSOLUTE,
    uf2_t::FAMILY_ID_RP2XXX_DATA,
    uf2_t::FAMILY_ID_RP2350_ARM_S,
    uf2_t::FAMILY_ID_RP2350_RISCV,
    uf2_t::FAMILY_ID_RP2350_ARM_NS,
    uf2_t::FAMILY_ID_MAX32666,
    uf2_t::FAMILY_ID_ESP32C5,
};
bool uf2_t::_is_defined_family_id_t(uf2_t::family_id_t v) {
    return uf2_t::_values_family_id_t.find(v) != uf2_t::_values_family_id_t.end();
}

uf2_t::uf2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, uf2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_first_block = nullptr;
    m_blocks = nullptr;
    _read();
}

void uf2_t::_read() {
    m_first_block = std::unique_ptr<block_t>(new block_t(m__io, this, m__root));
    m_blocks = std::unique_ptr<std::vector<std::unique_ptr<block_t>>>(new std::vector<std::unique_ptr<block_t>>());
    const int l_blocks = first_block()->num_blocks() - 1;
    for (int i = 0; i < l_blocks; i++) {
        m_blocks->push_back(std::move(std::unique_ptr<block_t>(new block_t(m__io, this, m__root))));
    }
}

uf2_t::~uf2_t() {
    _clean_up();
}

void uf2_t::_clean_up() {
}

uf2_t::block_t::block_t(kaitai::kstream* p__io, uf2_t* p__parent, uf2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    m_data = nullptr;
    m__io__raw_data = nullptr;
    f_is_rp2350_e10_block = false;
    f_num_blocks = false;
    _read();
}

void uf2_t::block_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x55\x46\x32\x0A", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x55\x46\x32\x0A", 4), m_magic, m__io, std::string("/types/block/seq/0"));
    }
    m_second_magic = m__io->read_bytes(4);
    if (!(m_second_magic == std::string("\x57\x51\x5D\x9E", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x57\x51\x5D\x9E", 4), m_second_magic, m__io, std::string("/types/block/seq/1"));
    }
    m_flags = std::unique_ptr<flags_t>(new flags_t(m__io, this, m__root));
    m_target_address = m__io->read_u4le();
    {
        uint32_t _ = m_target_address;
        if (!(kaitai::kstream::mod(_, 4) == 0)) {
            throw kaitai::validation_expr_error<uint32_t>(m_target_address, m__io, std::string("/types/block/seq/3"));
        }
    }
    m_len_payload = m__io->read_u4le();
    {
        uint32_t _ = m_len_payload;
        if (!(kaitai::kstream::mod(_, 4) == 0)) {
            throw kaitai::validation_expr_error<uint32_t>(m_len_payload, m__io, std::string("/types/block/seq/4"));
        }
    }
    m_block_number = m__io->read_u4le();
    m_num_blocks_raw = m__io->read_u4le();
    if (!(m_num_blocks_raw >= block_number() + 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(block_number() + 1, m_num_blocks_raw, m__io, std::string("/types/block/seq/6"));
    }
    n_file_size = true;
    if (!(flags()->has_family_id())) {
        n_file_size = false;
        m_file_size = m__io->read_u4le();
    }
    n_family_id = true;
    if (flags()->has_family_id()) {
        n_family_id = false;
        m_family_id = static_cast<uf2_t::family_id_t>(m__io->read_u4le());
    }
    m__raw_data = m__io->read_bytes(476);
    m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
    m_data = std::unique_ptr<block_data_t>(new block_data_t(m__io__raw_data.get(), this, m__root));
    m_final_magic = m__io->read_bytes(4);
    if (!(m_final_magic == std::string("\x30\x6F\xB1\x0A", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x30\x6F\xB1\x0A", 4), m_final_magic, m__io, std::string("/types/block/seq/10"));
    }
}

uf2_t::block_t::~block_t() {
    _clean_up();
}

void uf2_t::block_t::_clean_up() {
    if (!n_file_size) {
    }
    if (!n_family_id) {
    }
}

bool uf2_t::block_t::is_rp2350_e10_block() {
    if (f_is_rp2350_e10_block)
        return m_is_rp2350_e10_block;
    f_is_rp2350_e10_block = true;
    m_is_rp2350_e10_block =  (( ((flags()->value() == 8192) || (flags()->value() == 40960)) ) && (family_id() == uf2_t::FAMILY_ID_RP2XXX_ABSOLUTE) && (num_blocks_raw() == 2) && (block_number() == 0) && (len_payload() == 256) && (data()->payload().front() == 239) && (data()->payload().back() == 239) && ( ((!(flags()->has_extension_tags())) || (data()->extension_tags()->at(0)->len_tag() == 0) || ( ((data()->extension_tags()->at(0)->len_tag() == 4) && (data()->extension_tags()->at(0)->tag_type() == uf2_t::EXTENSION_TAG_TYPE_RP2_IGNORE_BLOCK)) )) )) ;
    return m_is_rp2350_e10_block;
}

uint32_t uf2_t::block_t::num_blocks() {
    if (f_num_blocks)
        return m_num_blocks;
    f_num_blocks = true;
    m_num_blocks = ((is_rp2350_e10_block()) ? (1) : (num_blocks_raw()));
    return m_num_blocks;
}

uf2_t::block_data_t::block_data_t(kaitai::kstream* p__io, uf2_t::block_t* p__parent, uf2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_extension_tags = nullptr;
    m_md5_checksum = nullptr;
    f_md5_checksum = false;
    _read();
}

void uf2_t::block_data_t::_read() {
    m_payload = m__io->read_bytes(_parent()->len_payload());
    n_file_name = true;
    if (_parent()->flags()->is_file_container()) {
        n_file_name = false;
        m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8");
    }
    n_extension_tags = true;
    if (_parent()->flags()->has_extension_tags()) {
        n_extension_tags = false;
        m_extension_tags = std::unique_ptr<std::vector<std::unique_ptr<extension_tag_t>>>(new std::vector<std::unique_ptr<extension_tag_t>>());
        {
            int i = 0;
            extension_tag_t* _;
            do {
                _ = new extension_tag_t(m__io, this, m__root);
                m_extension_tags->push_back(std::move(std::unique_ptr<extension_tag_t>(_)));
                i++;
            } while (!(_->len_tag() == 0));
        }
    }
}

uf2_t::block_data_t::~block_data_t() {
    _clean_up();
}

void uf2_t::block_data_t::_clean_up() {
    if (!n_file_name) {
    }
    if (!n_extension_tags) {
    }
    if (f_md5_checksum && !n_md5_checksum) {
    }
}

uf2_t::md5_checksum_t* uf2_t::block_data_t::md5_checksum() {
    if (f_md5_checksum)
        return m_md5_checksum.get();
    f_md5_checksum = true;
    n_md5_checksum = true;
    if (_parent()->flags()->has_md5_checksum()) {
        n_md5_checksum = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(_io()->size() - 24);
        m_md5_checksum = std::unique_ptr<md5_checksum_t>(new md5_checksum_t(m__io, this, m__root));
        m__io->seek(_pos);
    }
    return m_md5_checksum.get();
}

uf2_t::extension_tag_t::extension_tag_t(kaitai::kstream* p__io, uf2_t::block_data_t* p__parent, uf2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_value = false;
    f_min_len_tag = false;
    _read();
}

void uf2_t::extension_tag_t::_read() {
    m_len_tag = m__io->read_u1();
    {
        uint8_t _ = m_len_tag;
        if (!( ((_ == 0) || (_ >= min_len_tag())) )) {
            throw kaitai::validation_expr_error<uint8_t>(m_len_tag, m__io, std::string("/types/extension_tag/seq/0"));
        }
    }
    m_tag_type = static_cast<uf2_t::extension_tag_type_t>(m__io->read_bits_int_le(24));
    m__io->align_to_byte();
    n_value = true;
    if (len_tag() != 0) {
        n_value = false;
        m_value = m__io->read_bytes(len_value());
    }
    m_padding = m__io->read_bytes(kaitai::kstream::mod(-(len_tag()), 4));
}

uf2_t::extension_tag_t::~extension_tag_t() {
    _clean_up();
}

void uf2_t::extension_tag_t::_clean_up() {
    if (!n_value) {
    }
}

int32_t uf2_t::extension_tag_t::len_value() {
    if (f_len_value)
        return m_len_value;
    f_len_value = true;
    m_len_value = ((len_tag() >= min_len_tag()) ? (len_tag() - min_len_tag()) : (0));
    return m_len_value;
}

int32_t uf2_t::extension_tag_t::min_len_tag() {
    if (f_min_len_tag)
        return m_min_len_tag;
    f_min_len_tag = true;
    m_min_len_tag = 1 + 3;
    return m_min_len_tag;
}

uf2_t::flags_t::flags_t(kaitai::kstream* p__io, uf2_t::block_t* p__parent, uf2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_has_extension_tags = false;
    f_has_family_id = false;
    f_has_md5_checksum = false;
    f_is_file_container = false;
    f_not_main_flash = false;
    _read();
}

void uf2_t::flags_t::_read() {
    m_value = m__io->read_u4le();
    {
        uint32_t _ = m_value;
        if (!( (((_ & ~61441) == 0) && (!( ((is_file_container()) && (has_extension_tags())) ))) )) {
            throw kaitai::validation_expr_error<uint32_t>(m_value, m__io, std::string("/types/flags/seq/0"));
        }
    }
}

uf2_t::flags_t::~flags_t() {
    _clean_up();
}

void uf2_t::flags_t::_clean_up() {
}

bool uf2_t::flags_t::has_extension_tags() {
    if (f_has_extension_tags)
        return m_has_extension_tags;
    f_has_extension_tags = true;
    m_has_extension_tags = (value() & 32768) != 0;
    return m_has_extension_tags;
}

bool uf2_t::flags_t::has_family_id() {
    if (f_has_family_id)
        return m_has_family_id;
    f_has_family_id = true;
    m_has_family_id = (value() & 8192) != 0;
    return m_has_family_id;
}

bool uf2_t::flags_t::has_md5_checksum() {
    if (f_has_md5_checksum)
        return m_has_md5_checksum;
    f_has_md5_checksum = true;
    m_has_md5_checksum = (value() & 16384) != 0;
    return m_has_md5_checksum;
}

bool uf2_t::flags_t::is_file_container() {
    if (f_is_file_container)
        return m_is_file_container;
    f_is_file_container = true;
    m_is_file_container = (value() & 4096) != 0;
    return m_is_file_container;
}

bool uf2_t::flags_t::not_main_flash() {
    if (f_not_main_flash)
        return m_not_main_flash;
    f_not_main_flash = true;
    m_not_main_flash = (value() & 1) != 0;
    return m_not_main_flash;
}

uf2_t::md5_checksum_t::md5_checksum_t(kaitai::kstream* p__io, uf2_t::block_data_t* p__parent, uf2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void uf2_t::md5_checksum_t::_read() {
    m_start_address = m__io->read_u4le();
    m_len_region = m__io->read_u4le();
    m_md5 = m__io->read_bytes(16);
}

uf2_t::md5_checksum_t::~md5_checksum_t() {
    _clean_up();
}

void uf2_t::md5_checksum_t::_clean_up() {
}
