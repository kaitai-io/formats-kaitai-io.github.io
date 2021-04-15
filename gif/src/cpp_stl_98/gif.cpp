// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gif.h"
#include "kaitai/exceptions.h"

gif_t::gif_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_hdr = 0;
    m_logical_screen_descriptor = 0;
    m_global_color_table = 0;
    m__io__raw_global_color_table = 0;
    m_blocks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::_read() {
    m_hdr = new header_t(m__io, this, m__root);
    m_logical_screen_descriptor = new logical_screen_descriptor_struct_t(m__io, this, m__root);
    n_global_color_table = true;
    if (logical_screen_descriptor()->has_color_table()) {
        n_global_color_table = false;
        m__raw_global_color_table = m__io->read_bytes((logical_screen_descriptor()->color_table_size() * 3));
        m__io__raw_global_color_table = new kaitai::kstream(m__raw_global_color_table);
        m_global_color_table = new color_table_t(m__io__raw_global_color_table, this, m__root);
    }
    m_blocks = new std::vector<block_t*>();
    {
        int i = 0;
        block_t* _;
        do {
            _ = new block_t(m__io, this, m__root);
            m_blocks->push_back(_);
            i++;
        } while (!( ((_io()->is_eof()) || (_->block_type() == gif_t::BLOCK_TYPE_END_OF_FILE)) ));
    }
}

gif_t::~gif_t() {
    _clean_up();
}

void gif_t::_clean_up() {
    if (m_hdr) {
        delete m_hdr; m_hdr = 0;
    }
    if (m_logical_screen_descriptor) {
        delete m_logical_screen_descriptor; m_logical_screen_descriptor = 0;
    }
    if (!n_global_color_table) {
        if (m__io__raw_global_color_table) {
            delete m__io__raw_global_color_table; m__io__raw_global_color_table = 0;
        }
        if (m_global_color_table) {
            delete m_global_color_table; m_global_color_table = 0;
        }
    }
    if (m_blocks) {
        for (std::vector<block_t*>::iterator it = m_blocks->begin(); it != m_blocks->end(); ++it) {
            delete *it;
        }
        delete m_blocks; m_blocks = 0;
    }
}

gif_t::image_data_t::image_data_t(kaitai::kstream* p__io, gif_t::local_image_descriptor_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_subblocks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::image_data_t::_read() {
    m_lzw_min_code_size = m__io->read_u1();
    m_subblocks = new subblocks_t(m__io, this, m__root);
}

gif_t::image_data_t::~image_data_t() {
    _clean_up();
}

void gif_t::image_data_t::_clean_up() {
    if (m_subblocks) {
        delete m_subblocks; m_subblocks = 0;
    }
}

gif_t::color_table_entry_t::color_table_entry_t(kaitai::kstream* p__io, gif_t::color_table_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::color_table_entry_t::_read() {
    m_red = m__io->read_u1();
    m_green = m__io->read_u1();
    m_blue = m__io->read_u1();
}

gif_t::color_table_entry_t::~color_table_entry_t() {
    _clean_up();
}

void gif_t::color_table_entry_t::_clean_up() {
}

gif_t::logical_screen_descriptor_struct_t::logical_screen_descriptor_struct_t(kaitai::kstream* p__io, gif_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_has_color_table = false;
    f_color_table_size = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::logical_screen_descriptor_struct_t::_read() {
    m_screen_width = m__io->read_u2le();
    m_screen_height = m__io->read_u2le();
    m_flags = m__io->read_u1();
    m_bg_color_index = m__io->read_u1();
    m_pixel_aspect_ratio = m__io->read_u1();
}

gif_t::logical_screen_descriptor_struct_t::~logical_screen_descriptor_struct_t() {
    _clean_up();
}

void gif_t::logical_screen_descriptor_struct_t::_clean_up() {
}

bool gif_t::logical_screen_descriptor_struct_t::has_color_table() {
    if (f_has_color_table)
        return m_has_color_table;
    m_has_color_table = (flags() & 128) != 0;
    f_has_color_table = true;
    return m_has_color_table;
}

int32_t gif_t::logical_screen_descriptor_struct_t::color_table_size() {
    if (f_color_table_size)
        return m_color_table_size;
    m_color_table_size = (2 << (flags() & 7));
    f_color_table_size = true;
    return m_color_table_size;
}

gif_t::local_image_descriptor_t::local_image_descriptor_t(kaitai::kstream* p__io, gif_t::block_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_local_color_table = 0;
    m__io__raw_local_color_table = 0;
    m_image_data = 0;
    f_has_color_table = false;
    f_has_interlace = false;
    f_has_sorted_color_table = false;
    f_color_table_size = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::local_image_descriptor_t::_read() {
    m_left = m__io->read_u2le();
    m_top = m__io->read_u2le();
    m_width = m__io->read_u2le();
    m_height = m__io->read_u2le();
    m_flags = m__io->read_u1();
    n_local_color_table = true;
    if (has_color_table()) {
        n_local_color_table = false;
        m__raw_local_color_table = m__io->read_bytes((color_table_size() * 3));
        m__io__raw_local_color_table = new kaitai::kstream(m__raw_local_color_table);
        m_local_color_table = new color_table_t(m__io__raw_local_color_table, this, m__root);
    }
    m_image_data = new image_data_t(m__io, this, m__root);
}

gif_t::local_image_descriptor_t::~local_image_descriptor_t() {
    _clean_up();
}

void gif_t::local_image_descriptor_t::_clean_up() {
    if (!n_local_color_table) {
        if (m__io__raw_local_color_table) {
            delete m__io__raw_local_color_table; m__io__raw_local_color_table = 0;
        }
        if (m_local_color_table) {
            delete m_local_color_table; m_local_color_table = 0;
        }
    }
    if (m_image_data) {
        delete m_image_data; m_image_data = 0;
    }
}

bool gif_t::local_image_descriptor_t::has_color_table() {
    if (f_has_color_table)
        return m_has_color_table;
    m_has_color_table = (flags() & 128) != 0;
    f_has_color_table = true;
    return m_has_color_table;
}

bool gif_t::local_image_descriptor_t::has_interlace() {
    if (f_has_interlace)
        return m_has_interlace;
    m_has_interlace = (flags() & 64) != 0;
    f_has_interlace = true;
    return m_has_interlace;
}

bool gif_t::local_image_descriptor_t::has_sorted_color_table() {
    if (f_has_sorted_color_table)
        return m_has_sorted_color_table;
    m_has_sorted_color_table = (flags() & 32) != 0;
    f_has_sorted_color_table = true;
    return m_has_sorted_color_table;
}

int32_t gif_t::local_image_descriptor_t::color_table_size() {
    if (f_color_table_size)
        return m_color_table_size;
    m_color_table_size = (2 << (flags() & 7));
    f_color_table_size = true;
    return m_color_table_size;
}

gif_t::block_t::block_t(kaitai::kstream* p__io, gif_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::block_t::_read() {
    m_block_type = static_cast<gif_t::block_type_t>(m__io->read_u1());
    n_body = true;
    switch (block_type()) {
    case gif_t::BLOCK_TYPE_EXTENSION: {
        n_body = false;
        m_body = new extension_t(m__io, this, m__root);
        break;
    }
    case gif_t::BLOCK_TYPE_LOCAL_IMAGE_DESCRIPTOR: {
        n_body = false;
        m_body = new local_image_descriptor_t(m__io, this, m__root);
        break;
    }
    }
}

gif_t::block_t::~block_t() {
    _clean_up();
}

void gif_t::block_t::_clean_up() {
    if (!n_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

gif_t::color_table_t::color_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::color_table_t::_read() {
    m_entries = new std::vector<color_table_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new color_table_entry_t(m__io, this, m__root));
            i++;
        }
    }
}

gif_t::color_table_t::~color_table_t() {
    _clean_up();
}

void gif_t::color_table_t::_clean_up() {
    if (m_entries) {
        for (std::vector<color_table_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

gif_t::header_t::header_t(kaitai::kstream* p__io, gif_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::header_t::_read() {
    m_magic = m__io->read_bytes(3);
    if (!(magic() == std::string("\x47\x49\x46", 3))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x49\x46", 3), magic(), _io(), std::string("/types/header/seq/0"));
    }
    m_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), std::string("ASCII"));
}

gif_t::header_t::~header_t() {
    _clean_up();
}

void gif_t::header_t::_clean_up() {
}

gif_t::ext_graphic_control_t::ext_graphic_control_t(kaitai::kstream* p__io, gif_t::extension_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_transparent_color_flag = false;
    f_user_input_flag = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::ext_graphic_control_t::_read() {
    m_block_size = m__io->read_bytes(1);
    if (!(block_size() == std::string("\x04", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x04", 1), block_size(), _io(), std::string("/types/ext_graphic_control/seq/0"));
    }
    m_flags = m__io->read_u1();
    m_delay_time = m__io->read_u2le();
    m_transparent_idx = m__io->read_u1();
    m_terminator = m__io->read_bytes(1);
    if (!(terminator() == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), terminator(), _io(), std::string("/types/ext_graphic_control/seq/4"));
    }
}

gif_t::ext_graphic_control_t::~ext_graphic_control_t() {
    _clean_up();
}

void gif_t::ext_graphic_control_t::_clean_up() {
}

bool gif_t::ext_graphic_control_t::transparent_color_flag() {
    if (f_transparent_color_flag)
        return m_transparent_color_flag;
    m_transparent_color_flag = (flags() & 1) != 0;
    f_transparent_color_flag = true;
    return m_transparent_color_flag;
}

bool gif_t::ext_graphic_control_t::user_input_flag() {
    if (f_user_input_flag)
        return m_user_input_flag;
    m_user_input_flag = (flags() & 2) != 0;
    f_user_input_flag = true;
    return m_user_input_flag;
}

gif_t::subblock_t::subblock_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::subblock_t::_read() {
    m_len_bytes = m__io->read_u1();
    m_bytes = m__io->read_bytes(len_bytes());
}

gif_t::subblock_t::~subblock_t() {
    _clean_up();
}

void gif_t::subblock_t::_clean_up() {
}

gif_t::application_id_t::application_id_t(kaitai::kstream* p__io, gif_t::ext_application_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::application_id_t::_read() {
    m_len_bytes = m__io->read_u1();
    if (!(len_bytes() == 11)) {
        throw kaitai::validation_not_equal_error<uint8_t>(11, len_bytes(), _io(), std::string("/types/application_id/seq/0"));
    }
    m_application_identifier = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ASCII"));
    m_application_auth_code = m__io->read_bytes(3);
}

gif_t::application_id_t::~application_id_t() {
    _clean_up();
}

void gif_t::application_id_t::_clean_up() {
}

gif_t::ext_application_t::ext_application_t(kaitai::kstream* p__io, gif_t::extension_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_application_id = 0;
    m_subblocks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::ext_application_t::_read() {
    m_application_id = new application_id_t(m__io, this, m__root);
    m_subblocks = new std::vector<subblock_t*>();
    {
        int i = 0;
        subblock_t* _;
        do {
            _ = new subblock_t(m__io, this, m__root);
            m_subblocks->push_back(_);
            i++;
        } while (!(_->len_bytes() == 0));
    }
}

gif_t::ext_application_t::~ext_application_t() {
    _clean_up();
}

void gif_t::ext_application_t::_clean_up() {
    if (m_application_id) {
        delete m_application_id; m_application_id = 0;
    }
    if (m_subblocks) {
        for (std::vector<subblock_t*>::iterator it = m_subblocks->begin(); it != m_subblocks->end(); ++it) {
            delete *it;
        }
        delete m_subblocks; m_subblocks = 0;
    }
}

gif_t::subblocks_t::subblocks_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::subblocks_t::_read() {
    m_entries = new std::vector<subblock_t*>();
    {
        int i = 0;
        subblock_t* _;
        do {
            _ = new subblock_t(m__io, this, m__root);
            m_entries->push_back(_);
            i++;
        } while (!(_->len_bytes() == 0));
    }
}

gif_t::subblocks_t::~subblocks_t() {
    _clean_up();
}

void gif_t::subblocks_t::_clean_up() {
    if (m_entries) {
        for (std::vector<subblock_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

gif_t::extension_t::extension_t(kaitai::kstream* p__io, gif_t::block_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gif_t::extension_t::_read() {
    m_label = static_cast<gif_t::extension_label_t>(m__io->read_u1());
    switch (label()) {
    case gif_t::EXTENSION_LABEL_APPLICATION: {
        m_body = new ext_application_t(m__io, this, m__root);
        break;
    }
    case gif_t::EXTENSION_LABEL_COMMENT: {
        m_body = new subblocks_t(m__io, this, m__root);
        break;
    }
    case gif_t::EXTENSION_LABEL_GRAPHIC_CONTROL: {
        m_body = new ext_graphic_control_t(m__io, this, m__root);
        break;
    }
    default: {
        m_body = new subblocks_t(m__io, this, m__root);
        break;
    }
    }
}

gif_t::extension_t::~extension_t() {
    _clean_up();
}

void gif_t::extension_t::_clean_up() {
    if (m_body) {
        delete m_body; m_body = 0;
    }
}
