// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "lvm2.h"
#include "kaitai/exceptions.h"

lvm2_t::lvm2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_pv = nullptr;
    f_sector_size = false;
    _read();
}

void lvm2_t::_read() {
    m_pv = std::unique_ptr<physical_volume_t>(new physical_volume_t(m__io, this, m__root));
}

lvm2_t::~lvm2_t() {
    _clean_up();
}

void lvm2_t::_clean_up() {
}

lvm2_t::physical_volume_t::physical_volume_t(kaitai::kstream* p__io, lvm2_t* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_label = nullptr;
    _read();
}

void lvm2_t::physical_volume_t::_read() {
    m_empty_sector = m__io->read_bytes(_root()->sector_size());
    m_label = std::unique_ptr<label_t>(new label_t(m__io, this, m__root));
}

lvm2_t::physical_volume_t::~physical_volume_t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::_clean_up() {
}

lvm2_t::physical_volume_t::label_t::label_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_label_header = nullptr;
    m_volume_header = nullptr;
    _read();
}

void lvm2_t::physical_volume_t::label_t::_read() {
    m_label_header = std::unique_ptr<label_header_t>(new label_header_t(m__io, this, m__root));
    m_volume_header = std::unique_ptr<volume_header_t>(new volume_header_t(m__io, this, m__root));
}

lvm2_t::physical_volume_t::label_t::~label_t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::label_t::_clean_up() {
}

lvm2_t::physical_volume_t::label_t::label_header_t::label_header_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_label_header_ = nullptr;
    _read();
}

void lvm2_t::physical_volume_t::label_t::label_header_t::_read() {
    m_signature = m__io->read_bytes(8);
    if (!(signature() == std::string("\x4C\x41\x42\x45\x4C\x4F\x4E\x45", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4C\x41\x42\x45\x4C\x4F\x4E\x45", 8), signature(), _io(), std::string("/types/physical_volume/types/label/types/label_header/seq/0"));
    }
    m_sector_number = m__io->read_u8le();
    m_checksum = m__io->read_u4le();
    m_label_header_ = std::unique_ptr<label_header__t>(new label_header__t(m__io, this, m__root));
}

lvm2_t::physical_volume_t::label_t::label_header_t::~label_header_t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::label_t::label_header_t::_clean_up() {
}

lvm2_t::physical_volume_t::label_t::label_header_t::label_header__t::label_header__t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::label_header_t* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void lvm2_t::physical_volume_t::label_t::label_header_t::label_header__t::_read() {
    m_data_offset = m__io->read_u4le();
    m_type_indicator = m__io->read_bytes(8);
    if (!(type_indicator() == std::string("\x4C\x56\x4D\x32\x20\x30\x30\x31", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4C\x56\x4D\x32\x20\x30\x30\x31", 8), type_indicator(), _io(), std::string("/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1"));
    }
}

lvm2_t::physical_volume_t::label_t::label_header_t::label_header__t::~label_header__t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::label_t::label_header_t::label_header__t::_clean_up() {
}

lvm2_t::physical_volume_t::label_t::volume_header_t::volume_header_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data_area_descriptors = nullptr;
    m_metadata_area_descriptors = nullptr;
    _read();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::_read() {
    m_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), std::string("ascii"));
    m_size = m__io->read_u8le();
    m_data_area_descriptors = std::unique_ptr<std::vector<std::unique_ptr<data_area_descriptor_t>>>(new std::vector<std::unique_ptr<data_area_descriptor_t>>());
    {
        int i = 0;
        data_area_descriptor_t* _;
        do {
            _ = new data_area_descriptor_t(m__io, this, m__root);
            m_data_area_descriptors->push_back(std::move(std::unique_ptr<data_area_descriptor_t>(_)));
            i++;
        } while (!( ((_->size() != 0) && (_->offset() != 0)) ));
    }
    m_metadata_area_descriptors = std::unique_ptr<std::vector<std::unique_ptr<metadata_area_descriptor_t>>>(new std::vector<std::unique_ptr<metadata_area_descriptor_t>>());
    {
        int i = 0;
        metadata_area_descriptor_t* _;
        do {
            _ = new metadata_area_descriptor_t(m__io, this, m__root);
            m_metadata_area_descriptors->push_back(std::move(std::unique_ptr<metadata_area_descriptor_t>(_)));
            i++;
        } while (!( ((_->size() != 0) && (_->offset() != 0)) ));
    }
}

lvm2_t::physical_volume_t::label_t::volume_header_t::~volume_header_t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::_clean_up() {
}

lvm2_t::physical_volume_t::label_t::volume_header_t::data_area_descriptor_t::data_area_descriptor_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::volume_header_t* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_data = false;
    _read();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::data_area_descriptor_t::_read() {
    m_offset = m__io->read_u8le();
    m_size = m__io->read_u8le();
}

lvm2_t::physical_volume_t::label_t::volume_header_t::data_area_descriptor_t::~data_area_descriptor_t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::data_area_descriptor_t::_clean_up() {
    if (f_data && !n_data) {
    }
}

std::string lvm2_t::physical_volume_t::label_t::volume_header_t::data_area_descriptor_t::data() {
    if (f_data)
        return m_data;
    n_data = true;
    if (size() != 0) {
        n_data = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(offset());
        m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes(size()), std::string("ascii"));
        m__io->seek(_pos);
        f_data = true;
    }
    return m_data;
}

lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_descriptor_t::metadata_area_descriptor_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::volume_header_t* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    m__io__raw_data = nullptr;
    f_data = false;
    _read();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_descriptor_t::_read() {
    m_offset = m__io->read_u8le();
    m_size = m__io->read_u8le();
}

lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_descriptor_t::~metadata_area_descriptor_t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_descriptor_t::_clean_up() {
    if (f_data && !n_data) {
    }
}

lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t* lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_descriptor_t::data() {
    if (f_data)
        return m_data.get();
    n_data = true;
    if (size() != 0) {
        n_data = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(offset());
        m__raw_data = m__io->read_bytes(size());
        m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
        m_data = std::unique_ptr<metadata_area_t>(new metadata_area_t(m__io__raw_data.get(), this, m__root));
        m__io->seek(_pos);
        f_data = true;
    }
    return m_data.get();
}

lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_descriptor_t* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    _read();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::_read() {
    m_header = std::unique_ptr<metadata_area_header_t>(new metadata_area_header_t(m__io, this, m__root));
}

lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::~metadata_area_t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::_clean_up() {
}

lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::metadata_area_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_checksum = nullptr;
    m_raw_location_descriptors = nullptr;
    f_metadata = false;
    _read();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::_read() {
    m_checksum = std::unique_ptr<metadata_area_header_t>(new metadata_area_header_t(m__io, this, m__root));
    m_signature = m__io->read_bytes(16);
    if (!(signature() == std::string("\x20\x4C\x56\x4D\x32\x20\x78\x5B\x35\x41\x25\x72\x30\x4E\x2A\x3E", 16))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x20\x4C\x56\x4D\x32\x20\x78\x5B\x35\x41\x25\x72\x30\x4E\x2A\x3E", 16), signature(), _io(), std::string("/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1"));
    }
    m_version = m__io->read_u4le();
    m_metadata_area_offset = m__io->read_u8le();
    m_metadata_area_size = m__io->read_u8le();
    m_raw_location_descriptors = std::unique_ptr<std::vector<std::unique_ptr<raw_location_descriptor_t>>>(new std::vector<std::unique_ptr<raw_location_descriptor_t>>());
    {
        int i = 0;
        raw_location_descriptor_t* _;
        do {
            _ = new raw_location_descriptor_t(m__io, this, m__root);
            m_raw_location_descriptors->push_back(std::move(std::unique_ptr<raw_location_descriptor_t>(_)));
            i++;
        } while (!( ((_->offset() != 0) && (_->size() != 0) && (_->checksum() != 0)) ));
    }
}

lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::~metadata_area_header_t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::_clean_up() {
    if (f_metadata) {
    }
}

lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::raw_location_descriptor_t::raw_location_descriptor_t(kaitai::kstream* p__io, lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t* p__parent, lvm2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::raw_location_descriptor_t::_read() {
    m_offset = m__io->read_u8le();
    m_size = m__io->read_u8le();
    m_checksum = m__io->read_u4le();
    m_flags = static_cast<lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::raw_location_descriptor_t::raw_location_descriptor_flags_t>(m__io->read_u4le());
}

lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::raw_location_descriptor_t::~raw_location_descriptor_t() {
    _clean_up();
}

void lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::raw_location_descriptor_t::_clean_up() {
}

std::string lvm2_t::physical_volume_t::label_t::volume_header_t::metadata_area_t::metadata_area_header_t::metadata() {
    if (f_metadata)
        return m_metadata;
    std::streampos _pos = m__io->pos();
    m__io->seek(metadata_area_offset());
    m_metadata = m__io->read_bytes(metadata_area_size());
    m__io->seek(_pos);
    f_metadata = true;
    return m_metadata;
}

int32_t lvm2_t::sector_size() {
    if (f_sector_size)
        return m_sector_size;
    m_sector_size = 512;
    f_sector_size = true;
    return m_sector_size;
}
