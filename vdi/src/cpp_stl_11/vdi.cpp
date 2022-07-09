// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vdi.h"
#include "kaitai/exceptions.h"

vdi_t::vdi_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m_blocks_map = nullptr;
    m__io__raw_blocks_map = nullptr;
    m_disk = nullptr;
    f_block_discarded = false;
    f_block_unallocated = false;
    f_blocks_map = false;
    f_disk = false;
    _read();
}

void vdi_t::_read() {
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
}

vdi_t::~vdi_t() {
    _clean_up();
}

void vdi_t::_clean_up() {
    if (f_blocks_map) {
    }
    if (f_disk) {
    }
}

vdi_t::header_t::header_t(kaitai::kstream* p__io, vdi_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = nullptr;
    m_header_main = nullptr;
    m__io__raw_header_main = nullptr;
    f_header_size = false;
    f_blocks_map_offset = false;
    f_subheader_size_is_dynamic = false;
    f_blocks_offset = false;
    f_block_size = false;
    f_blocks_map_size = false;
    _read();
}

void vdi_t::header_t::_read() {
    m_text = kaitai::kstream::bytes_to_str(m__io->read_bytes(64), std::string("utf-8"));
    m_signature = m__io->read_bytes(4);
    if (!(signature() == std::string("\x7F\x10\xDA\xBE", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7F\x10\xDA\xBE", 4), signature(), _io(), std::string("/types/header/seq/1"));
    }
    m_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    n_header_size_optional = true;
    if (subheader_size_is_dynamic()) {
        n_header_size_optional = false;
        m_header_size_optional = m__io->read_u4le();
    }
    m__raw_header_main = m__io->read_bytes(header_size());
    m__io__raw_header_main = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header_main));
    m_header_main = std::unique_ptr<header_main_t>(new header_main_t(m__io__raw_header_main.get(), this, m__root));
}

vdi_t::header_t::~header_t() {
    _clean_up();
}

void vdi_t::header_t::_clean_up() {
    if (!n_header_size_optional) {
    }
}

vdi_t::header_t::uuid_t::uuid_t(kaitai::kstream* p__io, vdi_t::header_t::header_main_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vdi_t::header_t::uuid_t::_read() {
    m_uuid = m__io->read_bytes(16);
}

vdi_t::header_t::uuid_t::~uuid_t() {
    _clean_up();
}

void vdi_t::header_t::uuid_t::_clean_up() {
}

vdi_t::header_t::version_t::version_t(kaitai::kstream* p__io, vdi_t::header_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vdi_t::header_t::version_t::_read() {
    m_major = m__io->read_u2le();
    m_minor = m__io->read_u2le();
}

vdi_t::header_t::version_t::~version_t() {
    _clean_up();
}

void vdi_t::header_t::version_t::_clean_up() {
}

vdi_t::header_t::header_main_t::header_main_t(kaitai::kstream* p__io, vdi_t::header_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_image_flags = nullptr;
    m_geometry = nullptr;
    m_uuid_image = nullptr;
    m_uuid_last_snap = nullptr;
    m_uuid_link = nullptr;
    m_uuid_parent = nullptr;
    m_lchc_geometry = nullptr;
    _read();
}

void vdi_t::header_t::header_main_t::_read() {
    m_image_type = static_cast<vdi_t::image_type_t>(m__io->read_u4le());
    m_image_flags = std::unique_ptr<flags_t>(new flags_t(m__io, this, m__root));
    m_description = kaitai::kstream::bytes_to_str(m__io->read_bytes(256), std::string("utf-8"));
    n_blocks_map_offset = true;
    if (_parent()->version()->major() >= 1) {
        n_blocks_map_offset = false;
        m_blocks_map_offset = m__io->read_u4le();
    }
    n_offset_data = true;
    if (_parent()->version()->major() >= 1) {
        n_offset_data = false;
        m_offset_data = m__io->read_u4le();
    }
    m_geometry = std::unique_ptr<geometry_t>(new geometry_t(m__io, this, m__root));
    n_reserved1 = true;
    if (_parent()->version()->major() >= 1) {
        n_reserved1 = false;
        m_reserved1 = m__io->read_u4le();
    }
    m_disk_size = m__io->read_u8le();
    m_block_data_size = m__io->read_u4le();
    n_block_metadata_size = true;
    if (_parent()->version()->major() >= 1) {
        n_block_metadata_size = false;
        m_block_metadata_size = m__io->read_u4le();
    }
    m_blocks_in_image = m__io->read_u4le();
    m_blocks_allocated = m__io->read_u4le();
    m_uuid_image = std::unique_ptr<uuid_t>(new uuid_t(m__io, this, m__root));
    m_uuid_last_snap = std::unique_ptr<uuid_t>(new uuid_t(m__io, this, m__root));
    m_uuid_link = std::unique_ptr<uuid_t>(new uuid_t(m__io, this, m__root));
    n_uuid_parent = true;
    if (_parent()->version()->major() >= 1) {
        n_uuid_parent = false;
        m_uuid_parent = std::unique_ptr<uuid_t>(new uuid_t(m__io, this, m__root));
    }
    n_lchc_geometry = true;
    if ( ((_parent()->version()->major() >= 1) && ((_io()->pos() + 16) <= _io()->size())) ) {
        n_lchc_geometry = false;
        m_lchc_geometry = std::unique_ptr<geometry_t>(new geometry_t(m__io, this, m__root));
    }
}

vdi_t::header_t::header_main_t::~header_main_t() {
    _clean_up();
}

void vdi_t::header_t::header_main_t::_clean_up() {
    if (!n_blocks_map_offset) {
    }
    if (!n_offset_data) {
    }
    if (!n_reserved1) {
    }
    if (!n_block_metadata_size) {
    }
    if (!n_uuid_parent) {
    }
    if (!n_lchc_geometry) {
    }
}

vdi_t::header_t::header_main_t::geometry_t::geometry_t(kaitai::kstream* p__io, vdi_t::header_t::header_main_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vdi_t::header_t::header_main_t::geometry_t::_read() {
    m_cylinders = m__io->read_u4le();
    m_heads = m__io->read_u4le();
    m_sectors = m__io->read_u4le();
    m_sector_size = m__io->read_u4le();
}

vdi_t::header_t::header_main_t::geometry_t::~geometry_t() {
    _clean_up();
}

void vdi_t::header_t::header_main_t::geometry_t::_clean_up() {
}

vdi_t::header_t::header_main_t::flags_t::flags_t(kaitai::kstream* p__io, vdi_t::header_t::header_main_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vdi_t::header_t::header_main_t::flags_t::_read() {
    m_reserved0 = m__io->read_bits_int_be(15);
    m_zero_expand = m__io->read_bits_int_be(1);
    m_reserved1 = m__io->read_bits_int_be(6);
    m_diff = m__io->read_bits_int_be(1);
    m_fixed = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(8);
}

vdi_t::header_t::header_main_t::flags_t::~flags_t() {
    _clean_up();
}

void vdi_t::header_t::header_main_t::flags_t::_clean_up() {
}

int32_t vdi_t::header_t::header_size() {
    if (f_header_size)
        return m_header_size;
    m_header_size = ((subheader_size_is_dynamic()) ? (header_size_optional()) : (336));
    f_header_size = true;
    return m_header_size;
}

uint32_t vdi_t::header_t::blocks_map_offset() {
    if (f_blocks_map_offset)
        return m_blocks_map_offset;
    m_blocks_map_offset = header_main()->blocks_map_offset();
    f_blocks_map_offset = true;
    return m_blocks_map_offset;
}

bool vdi_t::header_t::subheader_size_is_dynamic() {
    if (f_subheader_size_is_dynamic)
        return m_subheader_size_is_dynamic;
    m_subheader_size_is_dynamic = version()->major() >= 1;
    f_subheader_size_is_dynamic = true;
    return m_subheader_size_is_dynamic;
}

uint32_t vdi_t::header_t::blocks_offset() {
    if (f_blocks_offset)
        return m_blocks_offset;
    m_blocks_offset = header_main()->offset_data();
    f_blocks_offset = true;
    return m_blocks_offset;
}

int32_t vdi_t::header_t::block_size() {
    if (f_block_size)
        return m_block_size;
    m_block_size = (header_main()->block_metadata_size() + header_main()->block_data_size());
    f_block_size = true;
    return m_block_size;
}

int32_t vdi_t::header_t::blocks_map_size() {
    if (f_blocks_map_size)
        return m_blocks_map_size;
    m_blocks_map_size = (((((header_main()->blocks_in_image() * 4) + header_main()->geometry()->sector_size()) - 1) / header_main()->geometry()->sector_size()) * header_main()->geometry()->sector_size());
    f_blocks_map_size = true;
    return m_blocks_map_size;
}

vdi_t::blocks_map_t::blocks_map_t(kaitai::kstream* p__io, vdi_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index = nullptr;
    _read();
}

void vdi_t::blocks_map_t::_read() {
    m_index = std::unique_ptr<std::vector<std::unique_ptr<block_index_t>>>(new std::vector<std::unique_ptr<block_index_t>>());
    const int l_index = _root()->header()->header_main()->blocks_in_image();
    for (int i = 0; i < l_index; i++) {
        m_index->push_back(std::move(std::unique_ptr<block_index_t>(new block_index_t(m__io, this, m__root))));
    }
}

vdi_t::blocks_map_t::~blocks_map_t() {
    _clean_up();
}

void vdi_t::blocks_map_t::_clean_up() {
}

vdi_t::blocks_map_t::block_index_t::block_index_t(kaitai::kstream* p__io, vdi_t::blocks_map_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_is_allocated = false;
    f_block = false;
    _read();
}

void vdi_t::blocks_map_t::block_index_t::_read() {
    m_index = m__io->read_u4le();
}

vdi_t::blocks_map_t::block_index_t::~block_index_t() {
    _clean_up();
}

void vdi_t::blocks_map_t::block_index_t::_clean_up() {
}

bool vdi_t::blocks_map_t::block_index_t::is_allocated() {
    if (f_is_allocated)
        return m_is_allocated;
    m_is_allocated = index() < _root()->block_discarded();
    f_is_allocated = true;
    return m_is_allocated;
}

vdi_t::disk_t::block_t* vdi_t::blocks_map_t::block_index_t::block() {
    if (f_block)
        return m_block;
    n_block = true;
    if (is_allocated()) {
        n_block = false;
        m_block = _root()->disk()->blocks()->at(index());
    }
    f_block = true;
    return m_block;
}

vdi_t::disk_t::disk_t(kaitai::kstream* p__io, vdi_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_blocks = nullptr;
    _read();
}

void vdi_t::disk_t::_read() {
    m_blocks = std::unique_ptr<std::vector<std::unique_ptr<block_t>>>(new std::vector<std::unique_ptr<block_t>>());
    const int l_blocks = _root()->header()->header_main()->blocks_in_image();
    for (int i = 0; i < l_blocks; i++) {
        m_blocks->push_back(std::move(std::unique_ptr<block_t>(new block_t(m__io, this, m__root))));
    }
}

vdi_t::disk_t::~disk_t() {
    _clean_up();
}

void vdi_t::disk_t::_clean_up() {
}

vdi_t::disk_t::block_t::block_t(kaitai::kstream* p__io, vdi_t::disk_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    m__raw_data = nullptr;
    m__io__raw_data = nullptr;
    _read();
}

void vdi_t::disk_t::block_t::_read() {
    m_metadata = m__io->read_bytes(_root()->header()->header_main()->block_metadata_size());
    m__raw_data = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_data = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_data = std::unique_ptr<std::vector<std::unique_ptr<sector_t>>>(new std::vector<std::unique_ptr<sector_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m__raw_data->push_back(std::move(m__io->read_bytes(_root()->header()->header_main()->block_data_size())));
            kaitai::kstream* io__raw_data = new kaitai::kstream(m__raw_data->at(m__raw_data->size() - 1));
            m__io__raw_data->emplace_back(io__raw_data);
            m_data->push_back(std::move(std::unique_ptr<sector_t>(new sector_t(io__raw_data, this, m__root))));
            i++;
        }
    }
}

vdi_t::disk_t::block_t::~block_t() {
    _clean_up();
}

void vdi_t::disk_t::block_t::_clean_up() {
}

vdi_t::disk_t::block_t::sector_t::sector_t(kaitai::kstream* p__io, vdi_t::disk_t::block_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vdi_t::disk_t::block_t::sector_t::_read() {
    m_data = m__io->read_bytes(_root()->header()->header_main()->geometry()->sector_size());
}

vdi_t::disk_t::block_t::sector_t::~sector_t() {
    _clean_up();
}

void vdi_t::disk_t::block_t::sector_t::_clean_up() {
}

int32_t vdi_t::block_discarded() {
    if (f_block_discarded)
        return m_block_discarded;
    m_block_discarded = 4294967294UL;
    f_block_discarded = true;
    return m_block_discarded;
}

int32_t vdi_t::block_unallocated() {
    if (f_block_unallocated)
        return m_block_unallocated;
    m_block_unallocated = 4294967295UL;
    f_block_unallocated = true;
    return m_block_unallocated;
}

vdi_t::blocks_map_t* vdi_t::blocks_map() {
    if (f_blocks_map)
        return m_blocks_map.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->blocks_map_offset());
    m__raw_blocks_map = m__io->read_bytes(header()->blocks_map_size());
    m__io__raw_blocks_map = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_blocks_map));
    m_blocks_map = std::unique_ptr<blocks_map_t>(new blocks_map_t(m__io__raw_blocks_map.get(), this, m__root));
    m__io->seek(_pos);
    f_blocks_map = true;
    return m_blocks_map.get();
}

vdi_t::disk_t* vdi_t::disk() {
    if (f_disk)
        return m_disk.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->blocks_offset());
    m_disk = std::unique_ptr<disk_t>(new disk_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_disk = true;
    return m_disk.get();
}
