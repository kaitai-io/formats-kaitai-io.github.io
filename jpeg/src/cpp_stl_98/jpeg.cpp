// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "jpeg.h"
#include "kaitai/exceptions.h"
std::set<jpeg_t::component_id_t> jpeg_t::_build_values_component_id_t() {
    std::set<jpeg_t::component_id_t> _t;
    _t.insert(jpeg_t::COMPONENT_ID_Y);
    _t.insert(jpeg_t::COMPONENT_ID_CB);
    _t.insert(jpeg_t::COMPONENT_ID_CR);
    _t.insert(jpeg_t::COMPONENT_ID_I);
    _t.insert(jpeg_t::COMPONENT_ID_Q);
    return _t;
}
const std::set<jpeg_t::component_id_t> jpeg_t::_values_component_id_t = jpeg_t::_build_values_component_id_t();
bool jpeg_t::_is_defined_component_id_t(jpeg_t::component_id_t v) {
    return jpeg_t::_values_component_id_t.find(v) != jpeg_t::_values_component_id_t.end();
}

jpeg_t::jpeg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_segments = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void jpeg_t::_read() {
    m_segments = new std::vector<segment_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_segments->push_back(new segment_t(m__io, this, m__root));
            i++;
        }
    }
}

jpeg_t::~jpeg_t() {
    _clean_up();
}

void jpeg_t::_clean_up() {
    if (m_segments) {
        for (std::vector<segment_t*>::iterator it = m_segments->begin(); it != m_segments->end(); ++it) {
            delete *it;
        }
        delete m_segments; m_segments = 0;
    }
}

jpeg_t::exif_in_jpeg_t::exif_in_jpeg_t(kaitai::kstream* p__io, jpeg_t::segment_app1_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = 0;
    m__io__raw_data = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void jpeg_t::exif_in_jpeg_t::_read() {
    m_extra_zero = m__io->read_bytes(1);
    if (!(m_extra_zero == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_extra_zero, m__io, std::string("/types/exif_in_jpeg/seq/0"));
    }
    m__raw_data = m__io->read_bytes_full();
    m__io__raw_data = new kaitai::kstream(m__raw_data);
    m_data = new exif_t(m__io__raw_data);
}

jpeg_t::exif_in_jpeg_t::~exif_in_jpeg_t() {
    _clean_up();
}

void jpeg_t::exif_in_jpeg_t::_clean_up() {
    if (m__io__raw_data) {
        delete m__io__raw_data; m__io__raw_data = 0;
    }
    if (m_data) {
        delete m_data; m_data = 0;
    }
}
std::set<jpeg_t::segment_t::marker_enum_t> jpeg_t::segment_t::_build_values_marker_enum_t() {
    std::set<jpeg_t::segment_t::marker_enum_t> _t;
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_TEM);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_SOF0);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_SOF1);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_SOF2);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_SOF3);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_DHT);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_SOF5);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_SOF6);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_SOF7);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_SOI);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_EOI);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_SOS);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_DQT);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_DNL);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_DRI);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_DHP);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP0);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP1);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP2);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP3);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP4);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP5);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP6);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP7);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP8);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP9);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP10);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP11);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP12);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP13);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP14);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_APP15);
    _t.insert(jpeg_t::segment_t::MARKER_ENUM_COM);
    return _t;
}
const std::set<jpeg_t::segment_t::marker_enum_t> jpeg_t::segment_t::_values_marker_enum_t = jpeg_t::segment_t::_build_values_marker_enum_t();
bool jpeg_t::segment_t::_is_defined_marker_enum_t(jpeg_t::segment_t::marker_enum_t v) {
    return jpeg_t::segment_t::_values_marker_enum_t.find(v) != jpeg_t::segment_t::_values_marker_enum_t.end();
}

jpeg_t::segment_t::segment_t(kaitai::kstream* p__io, jpeg_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_data = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void jpeg_t::segment_t::_read() {
    m_magic = m__io->read_bytes(1);
    if (!(m_magic == std::string("\xFF", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xFF", 1), m_magic, m__io, std::string("/types/segment/seq/0"));
    }
    m_marker = static_cast<jpeg_t::segment_t::marker_enum_t>(m__io->read_u1());
    n_length = true;
    if ( ((marker() != jpeg_t::segment_t::MARKER_ENUM_SOI) && (marker() != jpeg_t::segment_t::MARKER_ENUM_EOI)) ) {
        n_length = false;
        m_length = m__io->read_u2be();
    }
    n_data = true;
    if ( ((marker() != jpeg_t::segment_t::MARKER_ENUM_SOI) && (marker() != jpeg_t::segment_t::MARKER_ENUM_EOI)) ) {
        n_data = false;
        n_data = true;
        switch (marker()) {
        case jpeg_t::segment_t::MARKER_ENUM_APP0: {
            n_data = false;
            m__raw_data = m__io->read_bytes(length() - 2);
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new segment_app0_t(m__io__raw_data, this, m__root);
            break;
        }
        case jpeg_t::segment_t::MARKER_ENUM_APP1: {
            n_data = false;
            m__raw_data = m__io->read_bytes(length() - 2);
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new segment_app1_t(m__io__raw_data, this, m__root);
            break;
        }
        case jpeg_t::segment_t::MARKER_ENUM_SOF0: {
            n_data = false;
            m__raw_data = m__io->read_bytes(length() - 2);
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new segment_sof0_t(m__io__raw_data, this, m__root);
            break;
        }
        case jpeg_t::segment_t::MARKER_ENUM_SOS: {
            n_data = false;
            m__raw_data = m__io->read_bytes(length() - 2);
            m__io__raw_data = new kaitai::kstream(m__raw_data);
            m_data = new segment_sos_t(m__io__raw_data, this, m__root);
            break;
        }
        default: {
            m__raw_data = m__io->read_bytes(length() - 2);
            break;
        }
        }
    }
    n_image_data = true;
    if (marker() == jpeg_t::segment_t::MARKER_ENUM_SOS) {
        n_image_data = false;
        m_image_data = m__io->read_bytes_full();
    }
}

jpeg_t::segment_t::~segment_t() {
    _clean_up();
}

void jpeg_t::segment_t::_clean_up() {
    if (!n_length) {
    }
    if (!n_data) {
        if (m__io__raw_data) {
            delete m__io__raw_data; m__io__raw_data = 0;
        }
        if (m_data) {
            delete m_data; m_data = 0;
        }
    }
    if (!n_image_data) {
    }
}
std::set<jpeg_t::segment_app0_t::density_unit_t> jpeg_t::segment_app0_t::_build_values_density_unit_t() {
    std::set<jpeg_t::segment_app0_t::density_unit_t> _t;
    _t.insert(jpeg_t::segment_app0_t::DENSITY_UNIT_NO_UNITS);
    _t.insert(jpeg_t::segment_app0_t::DENSITY_UNIT_PIXELS_PER_INCH);
    _t.insert(jpeg_t::segment_app0_t::DENSITY_UNIT_PIXELS_PER_CM);
    return _t;
}
const std::set<jpeg_t::segment_app0_t::density_unit_t> jpeg_t::segment_app0_t::_values_density_unit_t = jpeg_t::segment_app0_t::_build_values_density_unit_t();
bool jpeg_t::segment_app0_t::_is_defined_density_unit_t(jpeg_t::segment_app0_t::density_unit_t v) {
    return jpeg_t::segment_app0_t::_values_density_unit_t.find(v) != jpeg_t::segment_app0_t::_values_density_unit_t.end();
}

jpeg_t::segment_app0_t::segment_app0_t(kaitai::kstream* p__io, jpeg_t::segment_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void jpeg_t::segment_app0_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), "ASCII");
    m_version_major = m__io->read_u1();
    m_version_minor = m__io->read_u1();
    m_density_units = static_cast<jpeg_t::segment_app0_t::density_unit_t>(m__io->read_u1());
    m_density_x = m__io->read_u2be();
    m_density_y = m__io->read_u2be();
    m_thumbnail_x = m__io->read_u1();
    m_thumbnail_y = m__io->read_u1();
    m_thumbnail = m__io->read_bytes((thumbnail_x() * thumbnail_y()) * 3);
}

jpeg_t::segment_app0_t::~segment_app0_t() {
    _clean_up();
}

void jpeg_t::segment_app0_t::_clean_up() {
}

jpeg_t::segment_app1_t::segment_app1_t(kaitai::kstream* p__io, jpeg_t::segment_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void jpeg_t::segment_app1_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
    n_body = true;
    {
        std::string on = magic();
        if (on == std::string("Exif")) {
            n_body = false;
            m_body = new exif_in_jpeg_t(m__io, this, m__root);
        }
    }
}

jpeg_t::segment_app1_t::~segment_app1_t() {
    _clean_up();
}

void jpeg_t::segment_app1_t::_clean_up() {
    if (!n_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

jpeg_t::segment_sof0_t::segment_sof0_t(kaitai::kstream* p__io, jpeg_t::segment_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_components = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void jpeg_t::segment_sof0_t::_read() {
    m_bits_per_sample = m__io->read_u1();
    m_image_height = m__io->read_u2be();
    m_image_width = m__io->read_u2be();
    m_num_components = m__io->read_u1();
    m_components = new std::vector<component_t*>();
    const int l_components = num_components();
    for (int i = 0; i < l_components; i++) {
        m_components->push_back(new component_t(m__io, this, m__root));
    }
}

jpeg_t::segment_sof0_t::~segment_sof0_t() {
    _clean_up();
}

void jpeg_t::segment_sof0_t::_clean_up() {
    if (m_components) {
        for (std::vector<component_t*>::iterator it = m_components->begin(); it != m_components->end(); ++it) {
            delete *it;
        }
        delete m_components; m_components = 0;
    }
}

jpeg_t::segment_sof0_t::component_t::component_t(kaitai::kstream* p__io, jpeg_t::segment_sof0_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_sampling_x = false;
    f_sampling_y = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void jpeg_t::segment_sof0_t::component_t::_read() {
    m_id = static_cast<jpeg_t::component_id_t>(m__io->read_u1());
    m_sampling_factors = m__io->read_u1();
    m_quantization_table_id = m__io->read_u1();
}

jpeg_t::segment_sof0_t::component_t::~component_t() {
    _clean_up();
}

void jpeg_t::segment_sof0_t::component_t::_clean_up() {
}

int32_t jpeg_t::segment_sof0_t::component_t::sampling_x() {
    if (f_sampling_x)
        return m_sampling_x;
    f_sampling_x = true;
    m_sampling_x = (sampling_factors() & 240) >> 4;
    return m_sampling_x;
}

int32_t jpeg_t::segment_sof0_t::component_t::sampling_y() {
    if (f_sampling_y)
        return m_sampling_y;
    f_sampling_y = true;
    m_sampling_y = sampling_factors() & 15;
    return m_sampling_y;
}

jpeg_t::segment_sos_t::segment_sos_t(kaitai::kstream* p__io, jpeg_t::segment_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_components = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void jpeg_t::segment_sos_t::_read() {
    m_num_components = m__io->read_u1();
    m_components = new std::vector<component_t*>();
    const int l_components = num_components();
    for (int i = 0; i < l_components; i++) {
        m_components->push_back(new component_t(m__io, this, m__root));
    }
    m_start_spectral_selection = m__io->read_u1();
    m_end_spectral = m__io->read_u1();
    m_appr_bit_pos = m__io->read_u1();
}

jpeg_t::segment_sos_t::~segment_sos_t() {
    _clean_up();
}

void jpeg_t::segment_sos_t::_clean_up() {
    if (m_components) {
        for (std::vector<component_t*>::iterator it = m_components->begin(); it != m_components->end(); ++it) {
            delete *it;
        }
        delete m_components; m_components = 0;
    }
}

jpeg_t::segment_sos_t::component_t::component_t(kaitai::kstream* p__io, jpeg_t::segment_sos_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void jpeg_t::segment_sos_t::component_t::_read() {
    m_id = static_cast<jpeg_t::component_id_t>(m__io->read_u1());
    m_huffman_table = m__io->read_u1();
}

jpeg_t::segment_sos_t::component_t::~component_t() {
    _clean_up();
}

void jpeg_t::segment_sos_t::component_t::_clean_up() {
}
