// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vdi.h"
#include "kaitai/exceptions.h"
std::set<vdi_t::image_type_t> vdi_t::_build_values_image_type_t() {
    std::set<vdi_t::image_type_t> _t;
    _t.insert(vdi_t::IMAGE_TYPE_DYNAMIC);
    _t.insert(vdi_t::IMAGE_TYPE_STATIC);
    _t.insert(vdi_t::IMAGE_TYPE_UNDO);
    _t.insert(vdi_t::IMAGE_TYPE_DIFF);
    return _t;
}
const std::set<vdi_t::image_type_t> vdi_t::_values_image_type_t = vdi_t::_build_values_image_type_t();
bool vdi_t::_is_defined_image_type_t(vdi_t::image_type_t v) {
    return vdi_t::_values_image_type_t.find(v) != vdi_t::_values_image_type_t.end();
}

vdi_t::vdi_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m_blocks_map = 0;
    m__io__raw_blocks_map = 0;
    m_disk = 0;
    f_block_discarded = false;
    f_block_unallocated = false;
    f_blocks_map = false;
    f_disk = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vdi_t::_read() {
    m_header = new header_t(m__io, this, m__root);
}

vdi_t::~vdi_t() {
    _clean_up();
}

void vdi_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (f_blocks_map) {
        if (m__io__raw_blocks_map) {
            delete m__io__raw_blocks_map; m__io__raw_blocks_map = 0;
        }
        if (m_blocks_map) {
            delete m_blocks_map; m_blocks_map = 0;
        }
    }
    if (f_disk) {
        if (m_disk) {
            delete m_disk; m_disk = 0;
        }
    }
}

vdi_t::blocks_map_t::blocks_map_t(kaitai::kstream* p__io, vdi_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vdi_t::blocks_map_t::_read() {
    m_index = new std::vector<block_index_t*>();
    const int l_index = _root()->header()->header_main()->blocks_in_image();
    for (int i = 0; i < l_index; i++) {
        m_index->push_back(new block_index_t(m__io, this, m__root));
    }
}

vdi_t::blocks_map_t::~blocks_map_t() {
    _clean_up();
}

void vdi_t::blocks_map_t::_clean_up() {
    if (m_index) {
        for (std::vector<block_index_t*>::iterator it = m_index->begin(); it != m_index->end(); ++it) {
            delete *it;
        }
        delete m_index; m_index = 0;
    }
}

vdi_t::blocks_map_t::block_index_t::block_index_t(kaitai::kstream* p__io, vdi_t::blocks_map_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_block = false;
    f_is_allocated = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vdi_t::blocks_map_t::block_index_t::_read() {
    m_index = m__io->read_u4le();
}

vdi_t::blocks_map_t::block_index_t::~block_index_t() {
    _clean_up();
}

void vdi_t::blocks_map_t::block_index_t::_clean_up() {
}

vdi_t::disk_t::block_t* vdi_t::blocks_map_t::block_index_t::block() {
    if (f_block)
        return m_block;
    f_block = true;
    n_block = true;
    if (is_allocated()) {
        n_block = false;
        m_block = _root()->disk()->blocks()->at(index());
    }
    return m_block;
}

bool vdi_t::blocks_map_t::block_index_t::is_allocated() {
    if (f_is_allocated)
        return m_is_allocated;
    f_is_allocated = true;
    m_is_allocated = index() < _root()->block_discarded();
    return m_is_allocated;
}

vdi_t::disk_t::disk_t(kaitai::kstream* p__io, vdi_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_blocks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vdi_t::disk_t::_read() {
    m_blocks = new std::vector<block_t*>();
    const int l_blocks = _root()->header()->header_main()->blocks_in_image();
    for (int i = 0; i < l_blocks; i++) {
        m_blocks->push_back(new block_t(m__io, this, m__root));
    }
}

vdi_t::disk_t::~disk_t() {
    _clean_up();
}

void vdi_t::disk_t::_clean_up() {
    if (m_blocks) {
        for (std::vector<block_t*>::iterator it = m_blocks->begin(); it != m_blocks->end(); ++it) {
            delete *it;
        }
        delete m_blocks; m_blocks = 0;
    }
}

vdi_t::disk_t::block_t::block_t(kaitai::kstream* p__io, vdi_t::disk_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = 0;
    m__raw_data = 0;
    m__io__raw_data = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vdi_t::disk_t::block_t::_read() {
    m_metadata = m__io->read_bytes(_root()->header()->header_main()->block_metadata_size());
    m__raw_data = new std::vector<std::string>();
    m__io__raw_data = new std::vector<kaitai::kstream*>();
    m_data = new std::vector<sector_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m__raw_data->push_back(m__io->read_bytes(_root()->header()->header_main()->block_data_size()));
            kaitai::kstream* io__raw_data = new kaitai::kstream(m__raw_data->at(m__raw_data->size() - 1));
            m__io__raw_data->push_back(io__raw_data);
            m_data->push_back(new sector_t(io__raw_data, this, m__root));
            i++;
        }
    }
}

vdi_t::disk_t::block_t::~block_t() {
    _clean_up();
}

void vdi_t::disk_t::block_t::_clean_up() {
    if (m__raw_data) {
        delete m__raw_data; m__raw_data = 0;
    }
    if (m__io__raw_data) {
        for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_data->begin(); it != m__io__raw_data->end(); ++it) {
            delete *it;
        }
        delete m__io__raw_data; m__io__raw_data = 0;
    }
    if (m_data) {
        for (std::vector<sector_t*>::iterator it = m_data->begin(); it != m_data->end(); ++it) {
            delete *it;
        }
        delete m_data; m_data = 0;
    }
}

vdi_t::disk_t::block_t::sector_t::sector_t(kaitai::kstream* p__io, vdi_t::disk_t::block_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vdi_t::disk_t::block_t::sector_t::_read() {
    m_data = m__io->read_bytes(_root()->header()->header_main()->geometry()->sector_size());
}

vdi_t::disk_t::block_t::sector_t::~sector_t() {
    _clean_up();
}

void vdi_t::disk_t::block_t::sector_t::_clean_up() {
}

vdi_t::header_t::header_t(kaitai::kstream* p__io, vdi_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = 0;
    m_header_main = 0;
    m__io__raw_header_main = 0;
    f_block_size = false;
    f_blocks_map_offset = false;
    f_blocks_map_size = false;
    f_blocks_offset = false;
    f_header_size = false;
    f_subheader_size_is_dynamic = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vdi_t::header_t::_read() {
    m_text = kaitai::kstream::bytes_to_str(m__io->read_bytes(64), "UTF-8");
    m_signature = m__io->read_bytes(4);
    if (!(m_signature == std::string("\x7F\x10\xDA\xBE", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7F\x10\xDA\xBE", 4), m_signature, m__io, std::string("/types/header/seq/1"));
    }
    m_version = new version_t(m__io, this, m__root);
    n_header_size_optional = true;
    if (subheader_size_is_dynamic()) {
        n_header_size_optional = false;
        m_header_size_optional = m__io->read_u4le();
    }
    m__raw_header_main = m__io->read_bytes(header_size());
    m__io__raw_header_main = new kaitai::kstream(m__raw_header_main);
    m_header_main = new header_main_t(m__io__raw_header_main, this, m__root);
}

vdi_t::header_t::~header_t() {
    _clean_up();
}

void vdi_t::header_t::_clean_up() {
    if (m_version) {
        delete m_version; m_version = 0;
    }
    if (!n_header_size_optional) {
    }
    if (m__io__raw_header_main) {
        delete m__io__raw_header_main; m__io__raw_header_main = 0;
    }
    if (m_header_main) {
        delete m_header_main; m_header_main = 0;
    }
}

vdi_t::header_t::header_main_t::header_main_t(kaitai::kstream* p__io, vdi_t::header_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_image_flags = 0;
    m_geometry = 0;
    m_uuid_image = 0;
    m_uuid_last_snap = 0;
    m_uuid_link = 0;
    m_uuid_parent = 0;
    m_lchc_geometry = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vdi_t::header_t::header_main_t::_read() {
    m_image_type = static_cast<vdi_t::image_type_t>(m__io->read_u4le());
    m_image_flags = new flags_t(m__io, this, m__root);
    m_description = kaitai::kstream::bytes_to_str(m__io->read_bytes(256), "UTF-8");
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
    m_geometry = new geometry_t(m__io, this, m__root);
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
    m_uuid_image = new uuid_t(m__io, this, m__root);
    m_uuid_last_snap = new uuid_t(m__io, this, m__root);
    m_uuid_link = new uuid_t(m__io, this, m__root);
    n_uuid_parent = true;
    if (_parent()->version()->major() >= 1) {
        n_uuid_parent = false;
        m_uuid_parent = new uuid_t(m__io, this, m__root);
    }
    n_lchc_geometry = true;
    if ( ((_parent()->version()->major() >= 1) && (_io()->pos() + 16 <= _io()->size())) ) {
        n_lchc_geometry = false;
        m_lchc_geometry = new geometry_t(m__io, this, m__root);
    }
}

vdi_t::header_t::header_main_t::~header_main_t() {
    _clean_up();
}

void vdi_t::header_t::header_main_t::_clean_up() {
    if (m_image_flags) {
        delete m_image_flags; m_image_flags = 0;
    }
    if (!n_blocks_map_offset) {
    }
    if (!n_offset_data) {
    }
    if (m_geometry) {
        delete m_geometry; m_geometry = 0;
    }
    if (!n_reserved1) {
    }
    if (!n_block_metadata_size) {
    }
    if (m_uuid_image) {
        delete m_uuid_image; m_uuid_image = 0;
    }
    if (m_uuid_last_snap) {
        delete m_uuid_last_snap; m_uuid_last_snap = 0;
    }
    if (m_uuid_link) {
        delete m_uuid_link; m_uuid_link = 0;
    }
    if (!n_uuid_parent) {
        if (m_uuid_parent) {
            delete m_uuid_parent; m_uuid_parent = 0;
        }
    }
    if (!n_lchc_geometry) {
        if (m_lchc_geometry) {
            delete m_lchc_geometry; m_lchc_geometry = 0;
        }
    }
}

vdi_t::header_t::header_main_t::flags_t::flags_t(kaitai::kstream* p__io, vdi_t::header_t::header_main_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

vdi_t::header_t::header_main_t::geometry_t::geometry_t(kaitai::kstream* p__io, vdi_t::header_t::header_main_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

vdi_t::header_t::uuid_t::uuid_t(kaitai::kstream* p__io, vdi_t::header_t::header_main_t* p__parent, vdi_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

int32_t vdi_t::header_t::block_size() {
    if (f_block_size)
        return m_block_size;
    f_block_size = true;
    m_block_size = header_main()->block_metadata_size() + header_main()->block_data_size();
    return m_block_size;
}

uint32_t vdi_t::header_t::blocks_map_offset() {
    if (f_blocks_map_offset)
        return m_blocks_map_offset;
    f_blocks_map_offset = true;
    m_blocks_map_offset = header_main()->blocks_map_offset();
    return m_blocks_map_offset;
}

int32_t vdi_t::header_t::blocks_map_size() {
    if (f_blocks_map_size)
        return m_blocks_map_size;
    f_blocks_map_size = true;
    m_blocks_map_size = (((header_main()->blocks_in_image() * 4 + header_main()->geometry()->sector_size()) - 1) / header_main()->geometry()->sector_size()) * header_main()->geometry()->sector_size();
    return m_blocks_map_size;
}

uint32_t vdi_t::header_t::blocks_offset() {
    if (f_blocks_offset)
        return m_blocks_offset;
    f_blocks_offset = true;
    m_blocks_offset = header_main()->offset_data();
    return m_blocks_offset;
}

int32_t vdi_t::header_t::header_size() {
    if (f_header_size)
        return m_header_size;
    f_header_size = true;
    m_header_size = ((subheader_size_is_dynamic()) ? (header_size_optional()) : (336));
    return m_header_size;
}

bool vdi_t::header_t::subheader_size_is_dynamic() {
    if (f_subheader_size_is_dynamic)
        return m_subheader_size_is_dynamic;
    f_subheader_size_is_dynamic = true;
    m_subheader_size_is_dynamic = version()->major() >= 1;
    return m_subheader_size_is_dynamic;
}

int32_t vdi_t::block_discarded() {
    if (f_block_discarded)
        return m_block_discarded;
    f_block_discarded = true;
    m_block_discarded = 4294967294UL;
    return m_block_discarded;
}

int32_t vdi_t::block_unallocated() {
    if (f_block_unallocated)
        return m_block_unallocated;
    f_block_unallocated = true;
    m_block_unallocated = 4294967295UL;
    return m_block_unallocated;
}

vdi_t::blocks_map_t* vdi_t::blocks_map() {
    if (f_blocks_map)
        return m_blocks_map;
    f_blocks_map = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->blocks_map_offset());
    m__raw_blocks_map = m__io->read_bytes(header()->blocks_map_size());
    m__io__raw_blocks_map = new kaitai::kstream(m__raw_blocks_map);
    m_blocks_map = new blocks_map_t(m__io__raw_blocks_map, this, m__root);
    m__io->seek(_pos);
    return m_blocks_map;
}

vdi_t::disk_t* vdi_t::disk() {
    if (f_disk)
        return m_disk;
    f_disk = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->blocks_offset());
    m_disk = new disk_t(m__io, this, m__root);
    m__io->seek(_pos);
    return m_disk;
}
