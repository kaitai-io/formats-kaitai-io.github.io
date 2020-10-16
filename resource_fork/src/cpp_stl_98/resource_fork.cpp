// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "resource_fork.h"

resource_fork_t::resource_fork_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;
    m_data_blocks_with_io = 0;
    m__io__raw_data_blocks_with_io = 0;
    m_resource_map = 0;
    m__io__raw_resource_map = 0;
    f_data_blocks_with_io = false;
    f_data_blocks = false;
    f_resource_map = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::_read() {
    m_header = new file_header_t(m__io, this, m__root);
    m_system_data = m__io->read_bytes(112);
    m_application_data = m__io->read_bytes(128);
}

resource_fork_t::~resource_fork_t() {
    _clean_up();
}

void resource_fork_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (f_data_blocks_with_io) {
        if (m__io__raw_data_blocks_with_io) {
            delete m__io__raw_data_blocks_with_io; m__io__raw_data_blocks_with_io = 0;
        }
        if (m_data_blocks_with_io) {
            delete m_data_blocks_with_io; m_data_blocks_with_io = 0;
        }
    }
    if (f_resource_map) {
        if (m__io__raw_resource_map) {
            delete m__io__raw_resource_map; m__io__raw_resource_map = 0;
        }
        if (m_resource_map) {
            delete m_resource_map; m_resource_map = 0;
        }
    }
}

resource_fork_t::file_header_t::file_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::file_header_t::_read() {
    m_ofs_data_blocks = m__io->read_u4be();
    m_ofs_resource_map = m__io->read_u4be();
    m_len_data_blocks = m__io->read_u4be();
    m_len_resource_map = m__io->read_u4be();
}

resource_fork_t::file_header_t::~file_header_t() {
    _clean_up();
}

void resource_fork_t::file_header_t::_clean_up() {
}

resource_fork_t::data_block_t::data_block_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::data_block_t::_read() {
    m_len_data = m__io->read_u4be();
    m_data = m__io->read_bytes(len_data());
}

resource_fork_t::data_block_t::~data_block_t() {
    _clean_up();
}

void resource_fork_t::data_block_t::_clean_up() {
}

resource_fork_t::resource_map_t::resource_map_t(kaitai::kstream* p__io, resource_fork_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_reserved_file_header_copy = 0;
    m_file_attributes = 0;
    m__io__raw_file_attributes = 0;
    m_type_list_and_reference_lists = 0;
    m__io__raw_type_list_and_reference_lists = 0;
    m_names_with_io = 0;
    m__io__raw_names_with_io = 0;
    f_type_list_and_reference_lists = false;
    f_names_with_io = false;
    f_names = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::resource_map_t::_read() {
    m_reserved_file_header_copy = new file_header_t(m__io, this, m__root);
    m_reserved_next_resource_map_handle = m__io->read_u4be();
    m_reserved_file_reference_number = m__io->read_u2be();
    m__raw_file_attributes = m__io->read_bytes(2);
    m__io__raw_file_attributes = new kaitai::kstream(m__raw_file_attributes);
    m_file_attributes = new file_attributes_t(m__io__raw_file_attributes, this, m__root);
    m_ofs_type_list = m__io->read_u2be();
    m_ofs_names = m__io->read_u2be();
}

resource_fork_t::resource_map_t::~resource_map_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::_clean_up() {
    if (m_reserved_file_header_copy) {
        delete m_reserved_file_header_copy; m_reserved_file_header_copy = 0;
    }
    if (m__io__raw_file_attributes) {
        delete m__io__raw_file_attributes; m__io__raw_file_attributes = 0;
    }
    if (m_file_attributes) {
        delete m_file_attributes; m_file_attributes = 0;
    }
    if (f_type_list_and_reference_lists) {
        if (m__io__raw_type_list_and_reference_lists) {
            delete m__io__raw_type_list_and_reference_lists; m__io__raw_type_list_and_reference_lists = 0;
        }
        if (m_type_list_and_reference_lists) {
            delete m_type_list_and_reference_lists; m_type_list_and_reference_lists = 0;
        }
    }
    if (f_names_with_io) {
        if (m__io__raw_names_with_io) {
            delete m__io__raw_names_with_io; m__io__raw_names_with_io = 0;
        }
        if (m_names_with_io) {
            delete m_names_with_io; m_names_with_io = 0;
        }
    }
}

resource_fork_t::resource_map_t::file_attributes_t::file_attributes_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_as_int = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::resource_map_t::file_attributes_t::_read() {
    m_resources_locked = m__io->read_bits_int_be(1);
    m_reserved0 = m__io->read_bits_int_be(6);
    m_printer_driver_multifinder_compatible = m__io->read_bits_int_be(1);
    m_no_write_changes = m__io->read_bits_int_be(1);
    m_needs_compact = m__io->read_bits_int_be(1);
    m_map_needs_write = m__io->read_bits_int_be(1);
    m_reserved1 = m__io->read_bits_int_be(5);
}

resource_fork_t::resource_map_t::file_attributes_t::~file_attributes_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::file_attributes_t::_clean_up() {
    if (f_as_int) {
    }
}

uint16_t resource_fork_t::resource_map_t::file_attributes_t::as_int() {
    if (f_as_int)
        return m_as_int;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_as_int = m__io->read_u2be();
    m__io->seek(_pos);
    f_as_int = true;
    return m_as_int;
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_and_reference_lists_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_type_list = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::_read() {
    m_type_list = new type_list_t(m__io, this, m__root);
    m_reference_lists = m__io->read_bytes_full();
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::~type_list_and_reference_lists_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::_clean_up() {
    if (m_type_list) {
        delete m_type_list; m_type_list = 0;
    }
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;
    f_num_types = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::_read() {
    m_num_types_m1 = m__io->read_u2be();
    int l_entries = num_types();
    m_entries = new std::vector<type_list_entry_t*>();
    m_entries->reserve(l_entries);
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(new type_list_entry_t(m__io, this, m__root));
    }
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::~type_list_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::_clean_up() {
    if (m_entries) {
        for (std::vector<type_list_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::type_list_entry_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_reference_list = 0;
    f_num_references = false;
    f_reference_list = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::_read() {
    m_type = m__io->read_bytes(4);
    m_num_references_m1 = m__io->read_u2be();
    m_ofs_reference_list = m__io->read_u2be();
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::~type_list_entry_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::_clean_up() {
    if (f_reference_list) {
        if (m_reference_list) {
            delete m_reference_list; m_reference_list = 0;
        }
    }
}

int32_t resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::num_references() {
    if (f_num_references)
        return m_num_references;
    m_num_references = kaitai::kstream::mod((num_references_m1() + 1), 65536);
    f_num_references = true;
    return m_num_references;
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t* resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::reference_list() {
    if (f_reference_list)
        return m_reference_list;
    kaitai::kstream *io = _parent()->_parent()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_reference_list());
    m_reference_list = new reference_list_t(num_references(), io, this, m__root);
    io->seek(_pos);
    f_reference_list = true;
    return m_reference_list;
}

int32_t resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::num_types() {
    if (f_num_types)
        return m_num_types;
    m_num_types = kaitai::kstream::mod((num_types_m1() + 1), 65536);
    f_num_types = true;
    return m_num_types;
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_list_t(uint16_t p_num_references, kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_references = p_num_references;
    m_references = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::_read() {
    int l_references = num_references();
    m_references = new std::vector<reference_t*>();
    m_references->reserve(l_references);
    for (int i = 0; i < l_references; i++) {
        m_references->push_back(new reference_t(m__io, this, m__root));
    }
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::~reference_list_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::_clean_up() {
    if (m_references) {
        for (std::vector<reference_t*>::iterator it = m_references->begin(); it != m_references->end(); ++it) {
            delete *it;
        }
        delete m_references; m_references = 0;
    }
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::reference_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_attributes = 0;
    m__io__raw_attributes = 0;
    m_name = 0;
    m_data_block = 0;
    f_name = false;
    f_data_block = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::_read() {
    m_id = m__io->read_s2be();
    m_ofs_name = m__io->read_u2be();
    m__raw_attributes = m__io->read_bytes(1);
    m__io__raw_attributes = new kaitai::kstream(m__raw_attributes);
    m_attributes = new attributes_t(m__io__raw_attributes, this, m__root);
    m_ofs_data_block = m__io->read_bits_int_be(24);
    m__io->align_to_byte();
    m_reserved_handle = m__io->read_u4be();
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::~reference_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::_clean_up() {
    if (m__io__raw_attributes) {
        delete m__io__raw_attributes; m__io__raw_attributes = 0;
    }
    if (m_attributes) {
        delete m_attributes; m_attributes = 0;
    }
    if (f_name && !n_name) {
        if (m_name) {
            delete m_name; m_name = 0;
        }
    }
    if (f_data_block) {
        if (m_data_block) {
            delete m_data_block; m_data_block = 0;
        }
    }
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::attributes_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_as_int = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::_read() {
    m_system_reference = m__io->read_bits_int_be(1);
    m_load_into_system_heap = m__io->read_bits_int_be(1);
    m_purgeable = m__io->read_bits_int_be(1);
    m_locked = m__io->read_bits_int_be(1);
    m_protected = m__io->read_bits_int_be(1);
    m_preload = m__io->read_bits_int_be(1);
    m_needs_write = m__io->read_bits_int_be(1);
    m_compressed = m__io->read_bits_int_be(1);
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::~attributes_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::_clean_up() {
    if (f_as_int) {
    }
}

uint8_t resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::as_int() {
    if (f_as_int)
        return m_as_int;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_as_int = m__io->read_u1();
    m__io->seek(_pos);
    f_as_int = true;
    return m_as_int;
}

resource_fork_t::resource_map_t::name_t* resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::name() {
    if (f_name)
        return m_name;
    n_name = true;
    if (ofs_name() != 65535) {
        n_name = false;
        kaitai::kstream *io = _root()->resource_map()->names_with_io()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_name());
        m_name = new name_t(io, this, m__root);
        io->seek(_pos);
        f_name = true;
    }
    return m_name;
}

resource_fork_t::data_block_t* resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::data_block() {
    if (f_data_block)
        return m_data_block;
    kaitai::kstream *io = _root()->data_blocks_with_io()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_data_block());
    m_data_block = new data_block_t(io, this, m__root);
    io->seek(_pos);
    f_data_block = true;
    return m_data_block;
}

resource_fork_t::resource_map_t::name_t::name_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void resource_fork_t::resource_map_t::name_t::_read() {
    m_len_value = m__io->read_u1();
    m_value = m__io->read_bytes(len_value());
}

resource_fork_t::resource_map_t::name_t::~name_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::name_t::_clean_up() {
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t* resource_fork_t::resource_map_t::type_list_and_reference_lists() {
    if (f_type_list_and_reference_lists)
        return m_type_list_and_reference_lists;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_type_list());
    m__raw_type_list_and_reference_lists = m__io->read_bytes((ofs_names() - ofs_type_list()));
    m__io__raw_type_list_and_reference_lists = new kaitai::kstream(m__raw_type_list_and_reference_lists);
    m_type_list_and_reference_lists = new type_list_and_reference_lists_t(m__io__raw_type_list_and_reference_lists, this, m__root);
    m__io->seek(_pos);
    f_type_list_and_reference_lists = true;
    return m_type_list_and_reference_lists;
}

bytes_with_io_t* resource_fork_t::resource_map_t::names_with_io() {
    if (f_names_with_io)
        return m_names_with_io;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_names());
    m__raw_names_with_io = m__io->read_bytes_full();
    m__io__raw_names_with_io = new kaitai::kstream(m__raw_names_with_io);
    m_names_with_io = new bytes_with_io_t(m__io__raw_names_with_io);
    m__io->seek(_pos);
    f_names_with_io = true;
    return m_names_with_io;
}

std::string resource_fork_t::resource_map_t::names() {
    if (f_names)
        return m_names;
    m_names = names_with_io()->data();
    f_names = true;
    return m_names;
}

bytes_with_io_t* resource_fork_t::data_blocks_with_io() {
    if (f_data_blocks_with_io)
        return m_data_blocks_with_io;
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->ofs_data_blocks());
    m__raw_data_blocks_with_io = m__io->read_bytes(header()->len_data_blocks());
    m__io__raw_data_blocks_with_io = new kaitai::kstream(m__raw_data_blocks_with_io);
    m_data_blocks_with_io = new bytes_with_io_t(m__io__raw_data_blocks_with_io);
    m__io->seek(_pos);
    f_data_blocks_with_io = true;
    return m_data_blocks_with_io;
}

std::string resource_fork_t::data_blocks() {
    if (f_data_blocks)
        return m_data_blocks;
    m_data_blocks = data_blocks_with_io()->data();
    f_data_blocks = true;
    return m_data_blocks;
}

resource_fork_t::resource_map_t* resource_fork_t::resource_map() {
    if (f_resource_map)
        return m_resource_map;
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->ofs_resource_map());
    m__raw_resource_map = m__io->read_bytes(header()->len_resource_map());
    m__io__raw_resource_map = new kaitai::kstream(m__raw_resource_map);
    m_resource_map = new resource_map_t(m__io__raw_resource_map, this, m__root);
    m__io->seek(_pos);
    f_resource_map = true;
    return m_resource_map;
}
