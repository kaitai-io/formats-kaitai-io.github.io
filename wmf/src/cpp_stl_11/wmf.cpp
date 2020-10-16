// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "wmf.h"
#include "kaitai/exceptions.h"

wmf_t::wmf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_special_header = nullptr;
    m_header = nullptr;
    m_records = nullptr;
    _read();
}

void wmf_t::_read() {
    m_special_header = std::unique_ptr<special_header_t>(new special_header_t(m__io, this, m__root));
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_records = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    {
        int i = 0;
        record_t* _;
        do {
            _ = new record_t(m__io, this, m__root);
            m_records->push_back(std::move(std::unique_ptr<record_t>(_)));
            i++;
        } while (!(_->function() == wmf_t::FUNC_EOF));
    }
}

wmf_t::~wmf_t() {
    _clean_up();
}

void wmf_t::_clean_up() {
}

wmf_t::params_setwindoworg_t::params_setwindoworg_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wmf_t::params_setwindoworg_t::_read() {
    m_y = m__io->read_s2le();
    m_x = m__io->read_s2le();
}

wmf_t::params_setwindoworg_t::~params_setwindoworg_t() {
    _clean_up();
}

void wmf_t::params_setwindoworg_t::_clean_up() {
}

wmf_t::params_setbkmode_t::params_setbkmode_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wmf_t::params_setbkmode_t::_read() {
    m_bk_mode = static_cast<wmf_t::mix_mode_t>(m__io->read_u2le());
}

wmf_t::params_setbkmode_t::~params_setbkmode_t() {
    _clean_up();
}

void wmf_t::params_setbkmode_t::_clean_up() {
}

wmf_t::point_s_t::point_s_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wmf_t::point_s_t::_read() {
    m_x = m__io->read_s2le();
    m_y = m__io->read_s2le();
}

wmf_t::point_s_t::~point_s_t() {
    _clean_up();
}

void wmf_t::point_s_t::_clean_up() {
}

wmf_t::params_setwindowext_t::params_setwindowext_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wmf_t::params_setwindowext_t::_read() {
    m_y = m__io->read_s2le();
    m_x = m__io->read_s2le();
}

wmf_t::params_setwindowext_t::~params_setwindowext_t() {
    _clean_up();
}

void wmf_t::params_setwindowext_t::_clean_up() {
}

wmf_t::params_polygon_t::params_polygon_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_points = nullptr;
    _read();
}

void wmf_t::params_polygon_t::_read() {
    m_num_points = m__io->read_s2le();
    int l_points = num_points();
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_s_t>>>(new std::vector<std::unique_ptr<point_s_t>>());
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_s_t>(new point_s_t(m__io, this, m__root))));
    }
}

wmf_t::params_polygon_t::~params_polygon_t() {
    _clean_up();
}

void wmf_t::params_polygon_t::_clean_up() {
}

wmf_t::header_t::header_t(kaitai::kstream* p__io, wmf_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wmf_t::header_t::_read() {
    m_metafile_type = static_cast<wmf_t::header_t::metafile_type_t>(m__io->read_u2le());
    m_header_size = m__io->read_u2le();
    m_version = m__io->read_u2le();
    m_size = m__io->read_u4le();
    m_number_of_objects = m__io->read_u2le();
    m_max_record = m__io->read_u4le();
    m_number_of_members = m__io->read_u2le();
}

wmf_t::header_t::~header_t() {
    _clean_up();
}

void wmf_t::header_t::_clean_up() {
}

wmf_t::color_ref_t::color_ref_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wmf_t::color_ref_t::_read() {
    m_red = m__io->read_u1();
    m_green = m__io->read_u1();
    m_blue = m__io->read_u1();
    m_reserved = m__io->read_u1();
}

wmf_t::color_ref_t::~color_ref_t() {
    _clean_up();
}

void wmf_t::color_ref_t::_clean_up() {
}

wmf_t::params_setrop2_t::params_setrop2_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wmf_t::params_setrop2_t::_read() {
    m_draw_mode = static_cast<wmf_t::bin_raster_op_t>(m__io->read_u2le());
}

wmf_t::params_setrop2_t::~params_setrop2_t() {
    _clean_up();
}

void wmf_t::params_setrop2_t::_clean_up() {
}

wmf_t::params_setpolyfillmode_t::params_setpolyfillmode_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wmf_t::params_setpolyfillmode_t::_read() {
    m_poly_fill_mode = static_cast<wmf_t::poly_fill_mode_t>(m__io->read_u2le());
}

wmf_t::params_setpolyfillmode_t::~params_setpolyfillmode_t() {
    _clean_up();
}

void wmf_t::params_setpolyfillmode_t::_clean_up() {
}

wmf_t::params_polyline_t::params_polyline_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_points = nullptr;
    _read();
}

void wmf_t::params_polyline_t::_read() {
    m_num_points = m__io->read_s2le();
    int l_points = num_points();
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_s_t>>>(new std::vector<std::unique_ptr<point_s_t>>());
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_s_t>(new point_s_t(m__io, this, m__root))));
    }
}

wmf_t::params_polyline_t::~params_polyline_t() {
    _clean_up();
}

void wmf_t::params_polyline_t::_clean_up() {
}

wmf_t::special_header_t::special_header_t(kaitai::kstream* p__io, wmf_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wmf_t::special_header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\xD7\xCD\xC6\x9A", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xD7\xCD\xC6\x9A", 4), magic(), _io(), std::string("/types/special_header/seq/0"));
    }
    m_handle = m__io->read_bytes(2);
    if (!(handle() == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), handle(), _io(), std::string("/types/special_header/seq/1"));
    }
    m_left = m__io->read_s2le();
    m_top = m__io->read_s2le();
    m_right = m__io->read_s2le();
    m_bottom = m__io->read_s2le();
    m_inch = m__io->read_u2le();
    m_reserved = m__io->read_bytes(4);
    if (!(reserved() == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), reserved(), _io(), std::string("/types/special_header/seq/7"));
    }
    m_checksum = m__io->read_u2le();
}

wmf_t::special_header_t::~special_header_t() {
    _clean_up();
}

void wmf_t::special_header_t::_clean_up() {
}

wmf_t::record_t::record_t(kaitai::kstream* p__io, wmf_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_params = nullptr;
    _read();
}

void wmf_t::record_t::_read() {
    m_size = m__io->read_u4le();
    m_function = static_cast<wmf_t::func_t>(m__io->read_u2le());
    n_params = true;
    switch (function()) {
    case wmf_t::FUNC_SETBKMODE: {
        n_params = false;
        m__raw_params = m__io->read_bytes(((size() - 3) * 2));
        m__io__raw_params = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_params));
        m_params = std::unique_ptr<params_setbkmode_t>(new params_setbkmode_t(m__io__raw_params.get(), this, m__root));
        break;
    }
    case wmf_t::FUNC_POLYGON: {
        n_params = false;
        m__raw_params = m__io->read_bytes(((size() - 3) * 2));
        m__io__raw_params = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_params));
        m_params = std::unique_ptr<params_polygon_t>(new params_polygon_t(m__io__raw_params.get(), this, m__root));
        break;
    }
    case wmf_t::FUNC_SETBKCOLOR: {
        n_params = false;
        m__raw_params = m__io->read_bytes(((size() - 3) * 2));
        m__io__raw_params = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_params));
        m_params = std::unique_ptr<color_ref_t>(new color_ref_t(m__io__raw_params.get(), this, m__root));
        break;
    }
    case wmf_t::FUNC_SETPOLYFILLMODE: {
        n_params = false;
        m__raw_params = m__io->read_bytes(((size() - 3) * 2));
        m__io__raw_params = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_params));
        m_params = std::unique_ptr<params_setpolyfillmode_t>(new params_setpolyfillmode_t(m__io__raw_params.get(), this, m__root));
        break;
    }
    case wmf_t::FUNC_SETWINDOWORG: {
        n_params = false;
        m__raw_params = m__io->read_bytes(((size() - 3) * 2));
        m__io__raw_params = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_params));
        m_params = std::unique_ptr<params_setwindoworg_t>(new params_setwindoworg_t(m__io__raw_params.get(), this, m__root));
        break;
    }
    case wmf_t::FUNC_SETROP2: {
        n_params = false;
        m__raw_params = m__io->read_bytes(((size() - 3) * 2));
        m__io__raw_params = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_params));
        m_params = std::unique_ptr<params_setrop2_t>(new params_setrop2_t(m__io__raw_params.get(), this, m__root));
        break;
    }
    case wmf_t::FUNC_SETWINDOWEXT: {
        n_params = false;
        m__raw_params = m__io->read_bytes(((size() - 3) * 2));
        m__io__raw_params = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_params));
        m_params = std::unique_ptr<params_setwindowext_t>(new params_setwindowext_t(m__io__raw_params.get(), this, m__root));
        break;
    }
    case wmf_t::FUNC_POLYLINE: {
        n_params = false;
        m__raw_params = m__io->read_bytes(((size() - 3) * 2));
        m__io__raw_params = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_params));
        m_params = std::unique_ptr<params_polyline_t>(new params_polyline_t(m__io__raw_params.get(), this, m__root));
        break;
    }
    default: {
        m__raw_params = m__io->read_bytes(((size() - 3) * 2));
        break;
    }
    }
}

wmf_t::record_t::~record_t() {
    _clean_up();
}

void wmf_t::record_t::_clean_up() {
    if (!n_params) {
    }
}
