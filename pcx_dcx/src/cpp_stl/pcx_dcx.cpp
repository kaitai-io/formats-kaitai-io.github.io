// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcx_dcx.h"


#include "pcx.h"

pcx_dcx_t::pcx_dcx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pcx_dcx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void pcx_dcx_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\xB1\x68\xDE\x3A", 4));
    m_files = new std::vector<pcx_offset_t*>();
    {
        int i = 0;
        pcx_offset_t* _;
        do {
            _ = new pcx_offset_t(m__io, this, m__root);
            m_files->push_back(_);
            i++;
        } while (!(_->ofs_body() == 0));
    }
}

pcx_dcx_t::~pcx_dcx_t() {
    for (std::vector<pcx_offset_t*>::iterator it = m_files->begin(); it != m_files->end(); ++it) {
        delete *it;
    }
    delete m_files;
}

pcx_dcx_t::pcx_offset_t::pcx_offset_t(kaitai::kstream* p__io, pcx_dcx_t* p__parent, pcx_dcx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;
    _read();
}

void pcx_dcx_t::pcx_offset_t::_read() {
    m_ofs_body = m__io->read_u4le();
}

pcx_dcx_t::pcx_offset_t::~pcx_offset_t() {
    if (f_body && !n_body) {
        delete m_body;
    }
}

pcx_t* pcx_dcx_t::pcx_offset_t::body() {
    if (f_body)
        return m_body;
    n_body = true;
    if (ofs_body() != 0) {
        n_body = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ofs_body());
        m_body = new pcx_t(m__io);
        m__io->seek(_pos);
    }
    f_body = true;
    return m_body;
}
