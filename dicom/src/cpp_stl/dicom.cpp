// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dicom.h"



dicom_t::dicom_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, dicom_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void dicom_t::_read() {
    m_file_header = new t_file_header_t(m__io, this, m__root);
    m_elements = new std::vector<t_data_element_implicit_t*>();
    while (!m__io->is_eof()) {
        m_elements->push_back(new t_data_element_implicit_t(m__io, this, m__root));
    }
}

dicom_t::~dicom_t() {
    delete m_file_header;
    for (std::vector<t_data_element_implicit_t*>::iterator it = m_elements->begin(); it != m_elements->end(); ++it) {
        delete *it;
    }
    delete m_elements;
}

dicom_t::t_file_header_t::t_file_header_t(kaitai::kstream *p_io, dicom_t* p_parent, dicom_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void dicom_t::t_file_header_t::_read() {
    m_preamble = m__io->read_bytes(128);
    m_magic = m__io->ensure_fixed_contents(std::string("\x44\x49\x43\x4D", 4));
}

dicom_t::t_file_header_t::~t_file_header_t() {
}

dicom_t::t_data_element_explicit_t::t_data_element_explicit_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, dicom_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_is_forced_implicit = false;
    f_is_long_len = false;
    f_is_transfer_syntax_change_implicit = false;
    f_tag = false;
    _read();
}

void dicom_t::t_data_element_explicit_t::_read() {
    m_tag_group = m__io->read_u2le();
    m_tag_elem = m__io->read_u2le();
    n_vr = true;
    if (!(is_forced_implicit())) {
        n_vr = false;
        m_vr = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("ASCII"));
    }
    n_reserved = true;
    if ( ((is_long_len()) && (!(is_forced_implicit()))) ) {
        n_reserved = false;
        m_reserved = m__io->read_u2le();
    }
    {
        bool on = is_long_len();
        if (on == false) {
            m_value_len = m__io->read_u2le();
        }
        else if (on == true) {
            m_value_len = m__io->read_u4le();
        }
    }
    n_value = true;
    if (value_len() != 4294967295) {
        n_value = false;
        m_value = m__io->read_bytes(value_len());
    }
    n_items = true;
    if ( ((vr() == (std::string("SQ"))) && (value_len() == 4294967295)) ) {
        n_items = false;
        m_items = new std::vector<seq_item_t*>();
        {
            seq_item_t* _;
            do {
                _ = new seq_item_t(m__io, this, m__root);
                m_items->push_back(_);
            } while (!(_->tag_elem() == 57565));
        }
    }
    n_elements_implicit = true;
    if (is_transfer_syntax_change_implicit()) {
        n_elements_implicit = false;
        m_elements_implicit = new std::vector<t_data_element_implicit_t*>();
        while (!m__io->is_eof()) {
            m_elements_implicit->push_back(new t_data_element_implicit_t(m__io, this, m__root));
        }
    }
}

dicom_t::t_data_element_explicit_t::~t_data_element_explicit_t() {
    if (!n_items) {
        for (std::vector<seq_item_t*>::iterator it = m_items->begin(); it != m_items->end(); ++it) {
            delete *it;
        }
        delete m_items;
    }
    if (!n_elements_implicit) {
        for (std::vector<t_data_element_implicit_t*>::iterator it = m_elements_implicit->begin(); it != m_elements_implicit->end(); ++it) {
            delete *it;
        }
        delete m_elements_implicit;
    }
}

bool dicom_t::t_data_element_explicit_t::is_forced_implicit() {
    if (f_is_forced_implicit)
        return m_is_forced_implicit;
    m_is_forced_implicit = tag_group() == 65534;
    f_is_forced_implicit = true;
    return m_is_forced_implicit;
}

bool dicom_t::t_data_element_explicit_t::is_long_len() {
    if (f_is_long_len)
        return m_is_long_len;
    m_is_long_len =  ((is_forced_implicit()) || (vr() == (std::string("OB"))) || (vr() == (std::string("OD"))) || (vr() == (std::string("OF"))) || (vr() == (std::string("OL"))) || (vr() == (std::string("OW"))) || (vr() == (std::string("SQ"))) || (vr() == (std::string("UC"))) || (vr() == (std::string("UR"))) || (vr() == (std::string("UT"))) || (vr() == (std::string("UN")))) ;
    f_is_long_len = true;
    return m_is_long_len;
}

bool dicom_t::t_data_element_explicit_t::is_transfer_syntax_change_implicit() {
    if (f_is_transfer_syntax_change_implicit)
        return m_is_transfer_syntax_change_implicit;
    m_is_transfer_syntax_change_implicit = false;
    f_is_transfer_syntax_change_implicit = true;
    return m_is_transfer_syntax_change_implicit;
}

dicom_t::tags_t dicom_t::t_data_element_explicit_t::tag() {
    if (f_tag)
        return m_tag;
    m_tag = static_cast<dicom_t::tags_t>(((tag_group() << 16) | tag_elem()));
    f_tag = true;
    return m_tag;
}

dicom_t::t_data_element_implicit_t::t_data_element_implicit_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, dicom_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_tag = false;
    f_is_transfer_syntax_change_explicit = false;
    f_is_long_len = false;
    f_p_is_transfer_syntax_change_explicit = false;
    f_is_forced_explicit = false;
    _read();
}

void dicom_t::t_data_element_implicit_t::_read() {
    m_tag_group = m__io->read_u2le();
    m_tag_elem = m__io->read_u2le();
    n_vr = true;
    if (is_forced_explicit()) {
        n_vr = false;
        m_vr = kaitai::kstream::bytes_to_str(m__io->read_bytes(2), std::string("ASCII"));
    }
    n_reserved = true;
    if ( ((is_long_len()) && (is_forced_explicit())) ) {
        n_reserved = false;
        m_reserved = m__io->read_u2le();
    }
    {
        bool on = ((is_forced_explicit()) ? (is_long_len()) : (true));
        if (on == false) {
            m_value_len = m__io->read_u2le();
        }
        else if (on == true) {
            m_value_len = m__io->read_u4le();
        }
    }
    n_value = true;
    if (value_len() != 4294967295) {
        n_value = false;
        m_value = m__io->read_bytes(value_len());
    }
    n_items = true;
    if ( ((vr() == (std::string("SQ"))) && (value_len() == 4294967295)) ) {
        n_items = false;
        m_items = new std::vector<seq_item_t*>();
        {
            seq_item_t* _;
            do {
                _ = new seq_item_t(m__io, this, m__root);
                m_items->push_back(_);
            } while (!(_->tag_elem() == 57565));
        }
    }
    n_elements = true;
    if (is_transfer_syntax_change_explicit()) {
        n_elements = false;
        m_elements = new std::vector<t_data_element_explicit_t*>();
        while (!m__io->is_eof()) {
            m_elements->push_back(new t_data_element_explicit_t(m__io, this, m__root));
        }
    }
}

dicom_t::t_data_element_implicit_t::~t_data_element_implicit_t() {
    if (!n_items) {
        for (std::vector<seq_item_t*>::iterator it = m_items->begin(); it != m_items->end(); ++it) {
            delete *it;
        }
        delete m_items;
    }
    if (!n_elements) {
        for (std::vector<t_data_element_explicit_t*>::iterator it = m_elements->begin(); it != m_elements->end(); ++it) {
            delete *it;
        }
        delete m_elements;
    }
}

dicom_t::tags_t dicom_t::t_data_element_implicit_t::tag() {
    if (f_tag)
        return m_tag;
    m_tag = static_cast<dicom_t::tags_t>(((tag_group() << 16) | tag_elem()));
    f_tag = true;
    return m_tag;
}

bool dicom_t::t_data_element_implicit_t::is_transfer_syntax_change_explicit() {
    if (f_is_transfer_syntax_change_explicit)
        return m_is_transfer_syntax_change_explicit;
    m_is_transfer_syntax_change_explicit = p_is_transfer_syntax_change_explicit();
    f_is_transfer_syntax_change_explicit = true;
    return m_is_transfer_syntax_change_explicit;
}

bool dicom_t::t_data_element_implicit_t::is_long_len() {
    if (f_is_long_len)
        return m_is_long_len;
    m_is_long_len =  ((is_forced_explicit()) && ( ((vr() == (std::string("OB"))) || (vr() == (std::string("OD"))) || (vr() == (std::string("OF"))) || (vr() == (std::string("OL"))) || (vr() == (std::string("OW"))) || (vr() == (std::string("SQ"))) || (vr() == (std::string("UC"))) || (vr() == (std::string("UR"))) || (vr() == (std::string("UT"))) || (vr() == (std::string("UN")))) )) ;
    f_is_long_len = true;
    return m_is_long_len;
}

bool dicom_t::t_data_element_implicit_t::p_is_transfer_syntax_change_explicit() {
    if (f_p_is_transfer_syntax_change_explicit)
        return m_p_is_transfer_syntax_change_explicit;
    m_p_is_transfer_syntax_change_explicit = value() == std::string("\x31\x2E\x32\x2E\x38\x34\x30\x2E\x31\x30\x30\x30\x38\x2E\x31\x2E\x32\x2E\x31\x00", 20);
    f_p_is_transfer_syntax_change_explicit = true;
    return m_p_is_transfer_syntax_change_explicit;
}

bool dicom_t::t_data_element_implicit_t::is_forced_explicit() {
    if (f_is_forced_explicit)
        return m_is_forced_explicit;
    m_is_forced_explicit = tag_group() == 2;
    f_is_forced_explicit = true;
    return m_is_forced_explicit;
}

dicom_t::seq_item_t::seq_item_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, dicom_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void dicom_t::seq_item_t::_read() {
    m_tag_group = m__io->ensure_fixed_contents(std::string("\xFE\xFF", 2));
    m_tag_elem = m__io->read_u2le();
    m_value_len = m__io->read_u4le();
    n_value = true;
    if (value_len() != 4294967295) {
        n_value = false;
        m_value = m__io->read_bytes(value_len());
    }
    n_items = true;
    if (value_len() == 4294967295) {
        n_items = false;
        m_items = new std::vector<t_data_element_explicit_t*>();
        {
            t_data_element_explicit_t* _;
            do {
                _ = new t_data_element_explicit_t(m__io, this, m__root);
                m_items->push_back(_);
            } while (!( ((_->tag_group() == 65534) && (_->tag_elem() == 57357)) ));
        }
    }
}

dicom_t::seq_item_t::~seq_item_t() {
    if (!n_items) {
        for (std::vector<t_data_element_explicit_t*>::iterator it = m_items->begin(); it != m_items->end(); ++it) {
            delete *it;
        }
        delete m_items;
    }
}
