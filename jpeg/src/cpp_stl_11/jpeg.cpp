// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "jpeg.h"
#include "kaitai/exceptions.h"

jpeg_t::jpeg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_segments = nullptr;
    _read();
}

void jpeg_t::_read() {
    m_segments = std::unique_ptr<std::vector<std::unique_ptr<segment_t>>>(new std::vector<std::unique_ptr<segment_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_segments->push_back(std::move(std::unique_ptr<segment_t>(new segment_t(m__io, this, m__root))));
            i++;
        }
    }
}

jpeg_t::~jpeg_t() {
    _clean_up();
}

void jpeg_t::_clean_up() {
}

jpeg_t::segment_t::segment_t(kaitai::kstream* p__io, jpeg_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_data = nullptr;
    _read();
}

void jpeg_t::segment_t::_read() {
    m_magic = m__io->read_bytes(1);
    if (!(magic() == std::string("\xFF", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xFF", 1), magic(), _io(), std::string("/types/segment/seq/0"));
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
        case jpeg_t::segment_t::MARKER_ENUM_APP1: {
            n_data = false;
            m__raw_data = m__io->read_bytes((length() - 2));
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<segment_app1_t>(new segment_app1_t(m__io__raw_data.get(), this, m__root));
            break;
        }
        case jpeg_t::segment_t::MARKER_ENUM_APP0: {
            n_data = false;
            m__raw_data = m__io->read_bytes((length() - 2));
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<segment_app0_t>(new segment_app0_t(m__io__raw_data.get(), this, m__root));
            break;
        }
        case jpeg_t::segment_t::MARKER_ENUM_SOF0: {
            n_data = false;
            m__raw_data = m__io->read_bytes((length() - 2));
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<segment_sof0_t>(new segment_sof0_t(m__io__raw_data.get(), this, m__root));
            break;
        }
        case jpeg_t::segment_t::MARKER_ENUM_SOS: {
            n_data = false;
            m__raw_data = m__io->read_bytes((length() - 2));
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<segment_sos_t>(new segment_sos_t(m__io__raw_data.get(), this, m__root));
            break;
        }
        default: {
            m__raw_data = m__io->read_bytes((length() - 2));
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
    }
    if (!n_image_data) {
    }
}

jpeg_t::segment_sos_t::segment_sos_t(kaitai::kstream* p__io, jpeg_t::segment_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_components = nullptr;
    _read();
}

void jpeg_t::segment_sos_t::_read() {
    m_num_components = m__io->read_u1();
    int l_components = num_components();
    m_components = std::unique_ptr<std::vector<std::unique_ptr<component_t>>>(new std::vector<std::unique_ptr<component_t>>());
    m_components->reserve(l_components);
    for (int i = 0; i < l_components; i++) {
        m_components->push_back(std::move(std::unique_ptr<component_t>(new component_t(m__io, this, m__root))));
    }
    m_start_spectral_selection = m__io->read_u1();
    m_end_spectral = m__io->read_u1();
    m_appr_bit_pos = m__io->read_u1();
}

jpeg_t::segment_sos_t::~segment_sos_t() {
    _clean_up();
}

void jpeg_t::segment_sos_t::_clean_up() {
}

jpeg_t::segment_sos_t::component_t::component_t(kaitai::kstream* p__io, jpeg_t::segment_sos_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

jpeg_t::segment_app1_t::segment_app1_t(kaitai::kstream* p__io, jpeg_t::segment_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void jpeg_t::segment_app1_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    n_body = true;
    {
        std::string on = magic();
        if (on == std::string("Exif")) {
            n_body = false;
            m_body = std::unique_ptr<exif_in_jpeg_t>(new exif_in_jpeg_t(m__io, this, m__root));
        }
    }
}

jpeg_t::segment_app1_t::~segment_app1_t() {
    _clean_up();
}

void jpeg_t::segment_app1_t::_clean_up() {
    if (!n_body) {
    }
}

jpeg_t::segment_sof0_t::segment_sof0_t(kaitai::kstream* p__io, jpeg_t::segment_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_components = nullptr;
    _read();
}

void jpeg_t::segment_sof0_t::_read() {
    m_bits_per_sample = m__io->read_u1();
    m_image_height = m__io->read_u2be();
    m_image_width = m__io->read_u2be();
    m_num_components = m__io->read_u1();
    int l_components = num_components();
    m_components = std::unique_ptr<std::vector<std::unique_ptr<component_t>>>(new std::vector<std::unique_ptr<component_t>>());
    m_components->reserve(l_components);
    for (int i = 0; i < l_components; i++) {
        m_components->push_back(std::move(std::unique_ptr<component_t>(new component_t(m__io, this, m__root))));
    }
}

jpeg_t::segment_sof0_t::~segment_sof0_t() {
    _clean_up();
}

void jpeg_t::segment_sof0_t::_clean_up() {
}

jpeg_t::segment_sof0_t::component_t::component_t(kaitai::kstream* p__io, jpeg_t::segment_sof0_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_sampling_x = false;
    f_sampling_y = false;
    _read();
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
    m_sampling_x = ((sampling_factors() & 240) >> 4);
    f_sampling_x = true;
    return m_sampling_x;
}

int32_t jpeg_t::segment_sof0_t::component_t::sampling_y() {
    if (f_sampling_y)
        return m_sampling_y;
    m_sampling_y = (sampling_factors() & 15);
    f_sampling_y = true;
    return m_sampling_y;
}

jpeg_t::exif_in_jpeg_t::exif_in_jpeg_t(kaitai::kstream* p__io, jpeg_t::segment_app1_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    m__io__raw_data = nullptr;
    _read();
}

void jpeg_t::exif_in_jpeg_t::_read() {
    m_extra_zero = m__io->read_bytes(1);
    if (!(extra_zero() == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), extra_zero(), _io(), std::string("/types/exif_in_jpeg/seq/0"));
    }
    m__raw_data = m__io->read_bytes_full();
    m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
    m_data = std::unique_ptr<exif_t>(new exif_t(m__io__raw_data.get()));
}

jpeg_t::exif_in_jpeg_t::~exif_in_jpeg_t() {
    _clean_up();
}

void jpeg_t::exif_in_jpeg_t::_clean_up() {
}

jpeg_t::segment_app0_t::segment_app0_t(kaitai::kstream* p__io, jpeg_t::segment_t* p__parent, jpeg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void jpeg_t::segment_app0_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes(5), std::string("ASCII"));
    m_version_major = m__io->read_u1();
    m_version_minor = m__io->read_u1();
    m_density_units = static_cast<jpeg_t::segment_app0_t::density_unit_t>(m__io->read_u1());
    m_density_x = m__io->read_u2be();
    m_density_y = m__io->read_u2be();
    m_thumbnail_x = m__io->read_u1();
    m_thumbnail_y = m__io->read_u1();
    m_thumbnail = m__io->read_bytes(((thumbnail_x() * thumbnail_y()) * 3));
}

jpeg_t::segment_app0_t::~segment_app0_t() {
    _clean_up();
}

void jpeg_t::segment_app0_t::_clean_up() {
}
