// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "wmf.h"
#include "kaitai/exceptions.h"
std::set<wmf_t::bin_raster_op_t> wmf_t::_build_values_bin_raster_op_t() {
    std::set<wmf_t::bin_raster_op_t> _t;
    _t.insert(wmf_t::BIN_RASTER_OP_BLACK);
    _t.insert(wmf_t::BIN_RASTER_OP_NOTMERGEPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_MASKNOTPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_NOTCOPYPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_MASKPENNOT);
    _t.insert(wmf_t::BIN_RASTER_OP_NOT);
    _t.insert(wmf_t::BIN_RASTER_OP_XORPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_NOTMASKPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_MASKPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_NOTXORPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_NOP);
    _t.insert(wmf_t::BIN_RASTER_OP_MERGENOTPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_COPYPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_MERGEPENNOT);
    _t.insert(wmf_t::BIN_RASTER_OP_MERGEPEN);
    _t.insert(wmf_t::BIN_RASTER_OP_WHITE);
    return _t;
}
const std::set<wmf_t::bin_raster_op_t> wmf_t::_values_bin_raster_op_t = wmf_t::_build_values_bin_raster_op_t();
bool wmf_t::_is_defined_bin_raster_op_t(wmf_t::bin_raster_op_t v) {
    return wmf_t::_values_bin_raster_op_t.find(v) != wmf_t::_values_bin_raster_op_t.end();
}
std::set<wmf_t::func_t> wmf_t::_build_values_func_t() {
    std::set<wmf_t::func_t> _t;
    _t.insert(wmf_t::FUNC_EOF);
    _t.insert(wmf_t::FUNC_SAVEDC);
    _t.insert(wmf_t::FUNC_REALIZEPALETTE);
    _t.insert(wmf_t::FUNC_SETPALENTRIES);
    _t.insert(wmf_t::FUNC_CREATEPALETTE);
    _t.insert(wmf_t::FUNC_SETBKMODE);
    _t.insert(wmf_t::FUNC_SETMAPMODE);
    _t.insert(wmf_t::FUNC_SETROP2);
    _t.insert(wmf_t::FUNC_SETRELABS);
    _t.insert(wmf_t::FUNC_SETPOLYFILLMODE);
    _t.insert(wmf_t::FUNC_SETSTRETCHBLTMODE);
    _t.insert(wmf_t::FUNC_SETTEXTCHAREXTRA);
    _t.insert(wmf_t::FUNC_RESTOREDC);
    _t.insert(wmf_t::FUNC_INVERTREGION);
    _t.insert(wmf_t::FUNC_PAINTREGION);
    _t.insert(wmf_t::FUNC_SELECTCLIPREGION);
    _t.insert(wmf_t::FUNC_SELECTOBJECT);
    _t.insert(wmf_t::FUNC_SETTEXTALIGN);
    _t.insert(wmf_t::FUNC_RESIZEPALETTE);
    _t.insert(wmf_t::FUNC_DIBCREATEPATTERNBRUSH);
    _t.insert(wmf_t::FUNC_SETLAYOUT);
    _t.insert(wmf_t::FUNC_DELETEOBJECT);
    _t.insert(wmf_t::FUNC_CREATEPATTERNBRUSH);
    _t.insert(wmf_t::FUNC_SETBKCOLOR);
    _t.insert(wmf_t::FUNC_SETTEXTCOLOR);
    _t.insert(wmf_t::FUNC_SETTEXTJUSTIFICATION);
    _t.insert(wmf_t::FUNC_SETWINDOWORG);
    _t.insert(wmf_t::FUNC_SETWINDOWEXT);
    _t.insert(wmf_t::FUNC_SETVIEWPORTORG);
    _t.insert(wmf_t::FUNC_SETVIEWPORTEXT);
    _t.insert(wmf_t::FUNC_OFFSETWINDOWORG);
    _t.insert(wmf_t::FUNC_OFFSETVIEWPORTORG);
    _t.insert(wmf_t::FUNC_LINETO);
    _t.insert(wmf_t::FUNC_MOVETO);
    _t.insert(wmf_t::FUNC_OFFSETCLIPRGN);
    _t.insert(wmf_t::FUNC_FILLREGION);
    _t.insert(wmf_t::FUNC_SETMAPPERFLAGS);
    _t.insert(wmf_t::FUNC_SELECTPALETTE);
    _t.insert(wmf_t::FUNC_CREATEPENINDIRECT);
    _t.insert(wmf_t::FUNC_CREATEFONTINDIRECT);
    _t.insert(wmf_t::FUNC_CREATEBRUSHINDIRECT);
    _t.insert(wmf_t::FUNC_POLYGON);
    _t.insert(wmf_t::FUNC_POLYLINE);
    _t.insert(wmf_t::FUNC_SCALEWINDOWEXT);
    _t.insert(wmf_t::FUNC_SCALEVIEWPORTEXT);
    _t.insert(wmf_t::FUNC_EXCLUDECLIPRECT);
    _t.insert(wmf_t::FUNC_INTERSECTCLIPRECT);
    _t.insert(wmf_t::FUNC_ELLIPSE);
    _t.insert(wmf_t::FUNC_FLOODFILL);
    _t.insert(wmf_t::FUNC_RECTANGLE);
    _t.insert(wmf_t::FUNC_SETPIXEL);
    _t.insert(wmf_t::FUNC_FRAMEREGION);
    _t.insert(wmf_t::FUNC_ANIMATEPALETTE);
    _t.insert(wmf_t::FUNC_TEXTOUT);
    _t.insert(wmf_t::FUNC_POLYPOLYGON);
    _t.insert(wmf_t::FUNC_EXTFLOODFILL);
    _t.insert(wmf_t::FUNC_ROUNDRECT);
    _t.insert(wmf_t::FUNC_PATBLT);
    _t.insert(wmf_t::FUNC_ESCAPE);
    _t.insert(wmf_t::FUNC_CREATEREGION);
    _t.insert(wmf_t::FUNC_ARC);
    _t.insert(wmf_t::FUNC_PIE);
    _t.insert(wmf_t::FUNC_CHORD);
    _t.insert(wmf_t::FUNC_BITBLT);
    _t.insert(wmf_t::FUNC_DIBBITBLT);
    _t.insert(wmf_t::FUNC_EXTTEXTOUT);
    _t.insert(wmf_t::FUNC_STRETCHBLT);
    _t.insert(wmf_t::FUNC_DIBSTRETCHBLT);
    _t.insert(wmf_t::FUNC_SETDIBTODEV);
    _t.insert(wmf_t::FUNC_STRETCHDIB);
    return _t;
}
const std::set<wmf_t::func_t> wmf_t::_values_func_t = wmf_t::_build_values_func_t();
bool wmf_t::_is_defined_func_t(wmf_t::func_t v) {
    return wmf_t::_values_func_t.find(v) != wmf_t::_values_func_t.end();
}
std::set<wmf_t::mix_mode_t> wmf_t::_build_values_mix_mode_t() {
    std::set<wmf_t::mix_mode_t> _t;
    _t.insert(wmf_t::MIX_MODE_TRANSPARENT);
    _t.insert(wmf_t::MIX_MODE_OPAQUE);
    return _t;
}
const std::set<wmf_t::mix_mode_t> wmf_t::_values_mix_mode_t = wmf_t::_build_values_mix_mode_t();
bool wmf_t::_is_defined_mix_mode_t(wmf_t::mix_mode_t v) {
    return wmf_t::_values_mix_mode_t.find(v) != wmf_t::_values_mix_mode_t.end();
}
std::set<wmf_t::poly_fill_mode_t> wmf_t::_build_values_poly_fill_mode_t() {
    std::set<wmf_t::poly_fill_mode_t> _t;
    _t.insert(wmf_t::POLY_FILL_MODE_ALTERNATE);
    _t.insert(wmf_t::POLY_FILL_MODE_WINDING);
    return _t;
}
const std::set<wmf_t::poly_fill_mode_t> wmf_t::_values_poly_fill_mode_t = wmf_t::_build_values_poly_fill_mode_t();
bool wmf_t::_is_defined_poly_fill_mode_t(wmf_t::poly_fill_mode_t v) {
    return wmf_t::_values_poly_fill_mode_t.find(v) != wmf_t::_values_poly_fill_mode_t.end();
}

wmf_t::wmf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_special_header = 0;
    m_header = 0;
    m_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wmf_t::_read() {
    m_special_header = new special_header_t(m__io, this, m__root);
    m_header = new header_t(m__io, this, m__root);
    m_records = new std::vector<record_t*>();
    {
        int i = 0;
        record_t* _;
        do {
            _ = new record_t(m__io, this, m__root);
            m_records->push_back(_);
            i++;
        } while (!(_->function() == wmf_t::FUNC_EOF));
    }
}

wmf_t::~wmf_t() {
    _clean_up();
}

void wmf_t::_clean_up() {
    if (m_special_header) {
        delete m_special_header; m_special_header = 0;
    }
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m_records) {
        for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
            delete *it;
        }
        delete m_records; m_records = 0;
    }
}

wmf_t::color_ref_t::color_ref_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
std::set<wmf_t::header_t::metafile_type_t> wmf_t::header_t::_build_values_metafile_type_t() {
    std::set<wmf_t::header_t::metafile_type_t> _t;
    _t.insert(wmf_t::header_t::METAFILE_TYPE_MEMORY_METAFILE);
    _t.insert(wmf_t::header_t::METAFILE_TYPE_DISK_METAFILE);
    return _t;
}
const std::set<wmf_t::header_t::metafile_type_t> wmf_t::header_t::_values_metafile_type_t = wmf_t::header_t::_build_values_metafile_type_t();
bool wmf_t::header_t::_is_defined_metafile_type_t(wmf_t::header_t::metafile_type_t v) {
    return wmf_t::header_t::_values_metafile_type_t.find(v) != wmf_t::header_t::_values_metafile_type_t.end();
}

wmf_t::header_t::header_t(kaitai::kstream* p__io, wmf_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

wmf_t::params_polygon_t::params_polygon_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_points = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wmf_t::params_polygon_t::_read() {
    m_num_points = m__io->read_s2le();
    m_points = new std::vector<point_s_t*>();
    const int l_points = num_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_s_t(m__io, this, m__root));
    }
}

wmf_t::params_polygon_t::~params_polygon_t() {
    _clean_up();
}

void wmf_t::params_polygon_t::_clean_up() {
    if (m_points) {
        for (std::vector<point_s_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
}

wmf_t::params_polyline_t::params_polyline_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_points = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wmf_t::params_polyline_t::_read() {
    m_num_points = m__io->read_s2le();
    m_points = new std::vector<point_s_t*>();
    const int l_points = num_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_s_t(m__io, this, m__root));
    }
}

wmf_t::params_polyline_t::~params_polyline_t() {
    _clean_up();
}

void wmf_t::params_polyline_t::_clean_up() {
    if (m_points) {
        for (std::vector<point_s_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
}

wmf_t::params_setbkmode_t::params_setbkmode_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wmf_t::params_setbkmode_t::_read() {
    m_bk_mode = static_cast<wmf_t::mix_mode_t>(m__io->read_u2le());
}

wmf_t::params_setbkmode_t::~params_setbkmode_t() {
    _clean_up();
}

void wmf_t::params_setbkmode_t::_clean_up() {
}

wmf_t::params_setpolyfillmode_t::params_setpolyfillmode_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wmf_t::params_setpolyfillmode_t::_read() {
    m_poly_fill_mode = static_cast<wmf_t::poly_fill_mode_t>(m__io->read_u2le());
}

wmf_t::params_setpolyfillmode_t::~params_setpolyfillmode_t() {
    _clean_up();
}

void wmf_t::params_setpolyfillmode_t::_clean_up() {
}

wmf_t::params_setrop2_t::params_setrop2_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wmf_t::params_setrop2_t::_read() {
    m_draw_mode = static_cast<wmf_t::bin_raster_op_t>(m__io->read_u2le());
}

wmf_t::params_setrop2_t::~params_setrop2_t() {
    _clean_up();
}

void wmf_t::params_setrop2_t::_clean_up() {
}

wmf_t::params_setwindowext_t::params_setwindowext_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

wmf_t::params_setwindoworg_t::params_setwindoworg_t(kaitai::kstream* p__io, wmf_t::record_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

wmf_t::point_s_t::point_s_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

wmf_t::record_t::record_t(kaitai::kstream* p__io, wmf_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_params = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wmf_t::record_t::_read() {
    m_size = m__io->read_u4le();
    m_function = static_cast<wmf_t::func_t>(m__io->read_u2le());
    n_params = true;
    switch (function()) {
    case wmf_t::FUNC_POLYGON: {
        n_params = false;
        m__raw_params = m__io->read_bytes((size() - 3) * 2);
        m__io__raw_params = new kaitai::kstream(m__raw_params);
        m_params = new params_polygon_t(m__io__raw_params, this, m__root);
        break;
    }
    case wmf_t::FUNC_POLYLINE: {
        n_params = false;
        m__raw_params = m__io->read_bytes((size() - 3) * 2);
        m__io__raw_params = new kaitai::kstream(m__raw_params);
        m_params = new params_polyline_t(m__io__raw_params, this, m__root);
        break;
    }
    case wmf_t::FUNC_SETBKCOLOR: {
        n_params = false;
        m__raw_params = m__io->read_bytes((size() - 3) * 2);
        m__io__raw_params = new kaitai::kstream(m__raw_params);
        m_params = new color_ref_t(m__io__raw_params, this, m__root);
        break;
    }
    case wmf_t::FUNC_SETBKMODE: {
        n_params = false;
        m__raw_params = m__io->read_bytes((size() - 3) * 2);
        m__io__raw_params = new kaitai::kstream(m__raw_params);
        m_params = new params_setbkmode_t(m__io__raw_params, this, m__root);
        break;
    }
    case wmf_t::FUNC_SETPOLYFILLMODE: {
        n_params = false;
        m__raw_params = m__io->read_bytes((size() - 3) * 2);
        m__io__raw_params = new kaitai::kstream(m__raw_params);
        m_params = new params_setpolyfillmode_t(m__io__raw_params, this, m__root);
        break;
    }
    case wmf_t::FUNC_SETROP2: {
        n_params = false;
        m__raw_params = m__io->read_bytes((size() - 3) * 2);
        m__io__raw_params = new kaitai::kstream(m__raw_params);
        m_params = new params_setrop2_t(m__io__raw_params, this, m__root);
        break;
    }
    case wmf_t::FUNC_SETWINDOWEXT: {
        n_params = false;
        m__raw_params = m__io->read_bytes((size() - 3) * 2);
        m__io__raw_params = new kaitai::kstream(m__raw_params);
        m_params = new params_setwindowext_t(m__io__raw_params, this, m__root);
        break;
    }
    case wmf_t::FUNC_SETWINDOWORG: {
        n_params = false;
        m__raw_params = m__io->read_bytes((size() - 3) * 2);
        m__io__raw_params = new kaitai::kstream(m__raw_params);
        m_params = new params_setwindoworg_t(m__io__raw_params, this, m__root);
        break;
    }
    default: {
        m__raw_params = m__io->read_bytes((size() - 3) * 2);
        break;
    }
    }
}

wmf_t::record_t::~record_t() {
    _clean_up();
}

void wmf_t::record_t::_clean_up() {
    if (!n_params) {
        if (m__io__raw_params) {
            delete m__io__raw_params; m__io__raw_params = 0;
        }
        if (m_params) {
            delete m_params; m_params = 0;
        }
    }
}

wmf_t::special_header_t::special_header_t(kaitai::kstream* p__io, wmf_t* p__parent, wmf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void wmf_t::special_header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\xD7\xCD\xC6\x9A", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xD7\xCD\xC6\x9A", 4), m_magic, m__io, std::string("/types/special_header/seq/0"));
    }
    m_handle = m__io->read_bytes(2);
    if (!(m_handle == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_handle, m__io, std::string("/types/special_header/seq/1"));
    }
    m_left = m__io->read_s2le();
    m_top = m__io->read_s2le();
    m_right = m__io->read_s2le();
    m_bottom = m__io->read_s2le();
    m_inch = m__io->read_u2le();
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/special_header/seq/7"));
    }
    m_checksum = m__io->read_u2le();
}

wmf_t::special_header_t::~special_header_t() {
    _clean_up();
}

void wmf_t::special_header_t::_clean_up() {
}
