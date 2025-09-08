// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gif.h"
#include "kaitai/exceptions.h"
const std::set<gif_t::block_type_t> gif_t::_values_block_type_t{
    gif_t::BLOCK_TYPE_EXTENSION,
    gif_t::BLOCK_TYPE_LOCAL_IMAGE_DESCRIPTOR,
    gif_t::BLOCK_TYPE_END_OF_FILE,
};
bool gif_t::_is_defined_block_type_t(gif_t::block_type_t v) {
    return gif_t::_values_block_type_t.find(v) != gif_t::_values_block_type_t.end();
}
const std::set<gif_t::extension_label_t> gif_t::_values_extension_label_t{
    gif_t::EXTENSION_LABEL_GRAPHIC_CONTROL,
    gif_t::EXTENSION_LABEL_COMMENT,
    gif_t::EXTENSION_LABEL_APPLICATION,
};
bool gif_t::_is_defined_extension_label_t(gif_t::extension_label_t v) {
    return gif_t::_values_extension_label_t.find(v) != gif_t::_values_extension_label_t.end();
}

gif_t::gif_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_hdr = nullptr;
    m_logical_screen_descriptor = nullptr;
    m_global_color_table = nullptr;
    m__io__raw_global_color_table = nullptr;
    m_blocks = nullptr;
    _read();
}

void gif_t::_read() {
    m_hdr = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_logical_screen_descriptor = std::unique_ptr<logical_screen_descriptor_struct_t>(new logical_screen_descriptor_struct_t(m__io, this, m__root));
    n_global_color_table = true;
    if (logical_screen_descriptor()->has_color_table()) {
        n_global_color_table = false;
        m__raw_global_color_table = m__io->read_bytes(logical_screen_descriptor()->color_table_size() * 3);
        m__io__raw_global_color_table = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_global_color_table));
        m_global_color_table = std::unique_ptr<color_table_t>(new color_table_t(m__io__raw_global_color_table.get(), this, m__root));
    }
    m_blocks = std::unique_ptr<std::vector<std::unique_ptr<block_t>>>(new std::vector<std::unique_ptr<block_t>>());
    {
        int i = 0;
        block_t* _;
        do {
            _ = new block_t(m__io, this, m__root);
            m_blocks->push_back(std::move(std::unique_ptr<block_t>(_)));
            i++;
        } while (!( ((_io()->is_eof()) || (_->block_type() == gif_t::BLOCK_TYPE_END_OF_FILE)) ));
    }
}

gif_t::~gif_t() {
    _clean_up();
}

void gif_t::_clean_up() {
    if (!n_global_color_table) {
    }
}

gif_t::application_id_t::application_id_t(kaitai::kstream* p__io, gif_t::ext_application_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void gif_t::application_id_t::_read() {
    m_len_bytes = m__io->read_u1();
    if (!(m_len_bytes == 11)) {
        throw kaitai::validation_not_equal_error<uint8_t>(11, m_len_bytes, m__io, std::string("/types/application_id/seq/0"));
    }
    m_application_identifier = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), "ASCII");
    m_application_auth_code = m__io->read_bytes(3);
}

gif_t::application_id_t::~application_id_t() {
    _clean_up();
}

void gif_t::application_id_t::_clean_up() {
}

gif_t::block_t::block_t(kaitai::kstream* p__io, gif_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void gif_t::block_t::_read() {
    m_block_type = static_cast<gif_t::block_type_t>(m__io->read_u1());
    n_body = true;
    switch (block_type()) {
    case gif_t::BLOCK_TYPE_EXTENSION: {
        n_body = false;
        m_body = std::unique_ptr<extension_t>(new extension_t(m__io, this, m__root));
        break;
    }
    case gif_t::BLOCK_TYPE_LOCAL_IMAGE_DESCRIPTOR: {
        n_body = false;
        m_body = std::unique_ptr<local_image_descriptor_t>(new local_image_descriptor_t(m__io, this, m__root));
        break;
    }
    }
}

gif_t::block_t::~block_t() {
    _clean_up();
}

void gif_t::block_t::_clean_up() {
    if (!n_body) {
    }
}

gif_t::color_table_t::color_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void gif_t::color_table_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<color_table_entry_t>>>(new std::vector<std::unique_ptr<color_table_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<color_table_entry_t>(new color_table_entry_t(m__io, this, m__root))));
            i++;
        }
    }
}

gif_t::color_table_t::~color_table_t() {
    _clean_up();
}

void gif_t::color_table_t::_clean_up() {
}

gif_t::color_table_entry_t::color_table_entry_t(kaitai::kstream* p__io, gif_t::color_table_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

gif_t::ext_application_t::ext_application_t(kaitai::kstream* p__io, gif_t::extension_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_application_id = nullptr;
    m_subblocks = nullptr;
    _read();
}

void gif_t::ext_application_t::_read() {
    m_application_id = std::unique_ptr<application_id_t>(new application_id_t(m__io, this, m__root));
    m_subblocks = std::unique_ptr<std::vector<std::unique_ptr<subblock_t>>>(new std::vector<std::unique_ptr<subblock_t>>());
    {
        int i = 0;
        subblock_t* _;
        do {
            _ = new subblock_t(m__io, this, m__root);
            m_subblocks->push_back(std::move(std::unique_ptr<subblock_t>(_)));
            i++;
        } while (!(_->len_bytes() == 0));
    }
}

gif_t::ext_application_t::~ext_application_t() {
    _clean_up();
}

void gif_t::ext_application_t::_clean_up() {
}

gif_t::ext_graphic_control_t::ext_graphic_control_t(kaitai::kstream* p__io, gif_t::extension_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_transparent_color_flag = false;
    f_user_input_flag = false;
    _read();
}

void gif_t::ext_graphic_control_t::_read() {
    m_block_size = m__io->read_bytes(1);
    if (!(m_block_size == std::string("\x04", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x04", 1), m_block_size, m__io, std::string("/types/ext_graphic_control/seq/0"));
    }
    m_flags = m__io->read_u1();
    m_delay_time = m__io->read_u2le();
    m_transparent_idx = m__io->read_u1();
    m_terminator = m__io->read_bytes(1);
    if (!(m_terminator == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_terminator, m__io, std::string("/types/ext_graphic_control/seq/4"));
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
    f_transparent_color_flag = true;
    m_transparent_color_flag = (flags() & 1) != 0;
    return m_transparent_color_flag;
}

bool gif_t::ext_graphic_control_t::user_input_flag() {
    if (f_user_input_flag)
        return m_user_input_flag;
    f_user_input_flag = true;
    m_user_input_flag = (flags() & 2) != 0;
    return m_user_input_flag;
}

gif_t::extension_t::extension_t(kaitai::kstream* p__io, gif_t::block_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void gif_t::extension_t::_read() {
    m_label = static_cast<gif_t::extension_label_t>(m__io->read_u1());
    switch (label()) {
    case gif_t::EXTENSION_LABEL_APPLICATION: {
        m_body = std::unique_ptr<ext_application_t>(new ext_application_t(m__io, this, m__root));
        break;
    }
    case gif_t::EXTENSION_LABEL_COMMENT: {
        m_body = std::unique_ptr<subblocks_t>(new subblocks_t(m__io, this, m__root));
        break;
    }
    case gif_t::EXTENSION_LABEL_GRAPHIC_CONTROL: {
        m_body = std::unique_ptr<ext_graphic_control_t>(new ext_graphic_control_t(m__io, this, m__root));
        break;
    }
    default: {
        m_body = std::unique_ptr<subblocks_t>(new subblocks_t(m__io, this, m__root));
        break;
    }
    }
}

gif_t::extension_t::~extension_t() {
    _clean_up();
}

void gif_t::extension_t::_clean_up() {
}

gif_t::header_t::header_t(kaitai::kstream* p__io, gif_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void gif_t::header_t::_read() {
    m_magic = m__io->read_bytes(3);
    if (!(m_magic == std::string("\x47\x49\x46", 3))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x49\x46", 3), m_magic, m__io, std::string("/types/header/seq/0"));
    }
    m_version = kaitai::kstream::bytes_to_str(m__io->read_bytes(3), "ASCII");
}

gif_t::header_t::~header_t() {
    _clean_up();
}

void gif_t::header_t::_clean_up() {
}

gif_t::image_data_t::image_data_t(kaitai::kstream* p__io, gif_t::local_image_descriptor_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_subblocks = nullptr;
    _read();
}

void gif_t::image_data_t::_read() {
    m_lzw_min_code_size = m__io->read_u1();
    m_subblocks = std::unique_ptr<subblocks_t>(new subblocks_t(m__io, this, m__root));
}

gif_t::image_data_t::~image_data_t() {
    _clean_up();
}

void gif_t::image_data_t::_clean_up() {
}

gif_t::local_image_descriptor_t::local_image_descriptor_t(kaitai::kstream* p__io, gif_t::block_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_local_color_table = nullptr;
    m__io__raw_local_color_table = nullptr;
    m_image_data = nullptr;
    f_color_table_size = false;
    f_has_color_table = false;
    f_has_interlace = false;
    f_has_sorted_color_table = false;
    _read();
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
        m__raw_local_color_table = m__io->read_bytes(color_table_size() * 3);
        m__io__raw_local_color_table = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_local_color_table));
        m_local_color_table = std::unique_ptr<color_table_t>(new color_table_t(m__io__raw_local_color_table.get(), this, m__root));
    }
    m_image_data = std::unique_ptr<image_data_t>(new image_data_t(m__io, this, m__root));
}

gif_t::local_image_descriptor_t::~local_image_descriptor_t() {
    _clean_up();
}

void gif_t::local_image_descriptor_t::_clean_up() {
    if (!n_local_color_table) {
    }
}

int32_t gif_t::local_image_descriptor_t::color_table_size() {
    if (f_color_table_size)
        return m_color_table_size;
    f_color_table_size = true;
    m_color_table_size = 2 << (flags() & 7);
    return m_color_table_size;
}

bool gif_t::local_image_descriptor_t::has_color_table() {
    if (f_has_color_table)
        return m_has_color_table;
    f_has_color_table = true;
    m_has_color_table = (flags() & 128) != 0;
    return m_has_color_table;
}

bool gif_t::local_image_descriptor_t::has_interlace() {
    if (f_has_interlace)
        return m_has_interlace;
    f_has_interlace = true;
    m_has_interlace = (flags() & 64) != 0;
    return m_has_interlace;
}

bool gif_t::local_image_descriptor_t::has_sorted_color_table() {
    if (f_has_sorted_color_table)
        return m_has_sorted_color_table;
    f_has_sorted_color_table = true;
    m_has_sorted_color_table = (flags() & 32) != 0;
    return m_has_sorted_color_table;
}

gif_t::logical_screen_descriptor_struct_t::logical_screen_descriptor_struct_t(kaitai::kstream* p__io, gif_t* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_color_table_size = false;
    f_has_color_table = false;
    _read();
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

int32_t gif_t::logical_screen_descriptor_struct_t::color_table_size() {
    if (f_color_table_size)
        return m_color_table_size;
    f_color_table_size = true;
    m_color_table_size = 2 << (flags() & 7);
    return m_color_table_size;
}

bool gif_t::logical_screen_descriptor_struct_t::has_color_table() {
    if (f_has_color_table)
        return m_has_color_table;
    f_has_color_table = true;
    m_has_color_table = (flags() & 128) != 0;
    return m_has_color_table;
}

gif_t::subblock_t::subblock_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

gif_t::subblocks_t::subblocks_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void gif_t::subblocks_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<subblock_t>>>(new std::vector<std::unique_ptr<subblock_t>>());
    {
        int i = 0;
        subblock_t* _;
        do {
            _ = new subblock_t(m__io, this, m__root);
            m_entries->push_back(std::move(std::unique_ptr<subblock_t>(_)));
            i++;
        } while (!(_->len_bytes() == 0));
    }
}

gif_t::subblocks_t::~subblocks_t() {
    _clean_up();
}

void gif_t::subblocks_t::_clean_up() {
}
