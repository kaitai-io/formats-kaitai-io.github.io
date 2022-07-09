// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vfat.h"
#include "kaitai/exceptions.h"

vfat_t::vfat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vfat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_boot_sector = 0;
    m_fats = 0;
    m_root_dir = 0;
    m__io__raw_root_dir = 0;
    f_fats = false;
    f_root_dir = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vfat_t::_read() {
    m_boot_sector = new boot_sector_t(m__io, this, m__root);
}

vfat_t::~vfat_t() {
    _clean_up();
}

void vfat_t::_clean_up() {
    if (m_boot_sector) {
        delete m_boot_sector; m_boot_sector = 0;
    }
    if (f_fats) {
        if (m_fats) {
            delete m_fats; m_fats = 0;
        }
    }
    if (f_root_dir) {
        if (m__io__raw_root_dir) {
            delete m__io__raw_root_dir; m__io__raw_root_dir = 0;
        }
        if (m_root_dir) {
            delete m_root_dir; m_root_dir = 0;
        }
    }
}

vfat_t::ext_bios_param_block_fat32_t::ext_bios_param_block_fat32_t(kaitai::kstream* p__io, vfat_t::boot_sector_t* p__parent, vfat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vfat_t::ext_bios_param_block_fat32_t::_read() {
    m_ls_per_fat = m__io->read_u4le();
    m_has_active_fat = m__io->read_bits_int_le(1);
    m_reserved1 = m__io->read_bits_int_le(3);
    m_active_fat_id = m__io->read_bits_int_le(4);
    m__io->align_to_byte();
    m_reserved2 = m__io->read_bytes(1);
    if (!(reserved2() == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), reserved2(), _io(), std::string("/types/ext_bios_param_block_fat32/seq/4"));
    }
    m_fat_version = m__io->read_u2le();
    m_root_dir_start_clus = m__io->read_u4le();
    m_ls_fs_info = m__io->read_u2le();
    m_boot_sectors_copy_start_ls = m__io->read_u2le();
    m_reserved3 = m__io->read_bytes(12);
    m_phys_drive_num = m__io->read_u1();
    m_reserved4 = m__io->read_u1();
    m_ext_boot_sign = m__io->read_u1();
    m_volume_id = m__io->read_bytes(4);
    m_partition_volume_label = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(11), 32), std::string("ASCII"));
    m_fs_type_str = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 32), std::string("ASCII"));
}

vfat_t::ext_bios_param_block_fat32_t::~ext_bios_param_block_fat32_t() {
    _clean_up();
}

void vfat_t::ext_bios_param_block_fat32_t::_clean_up() {
}

vfat_t::boot_sector_t::boot_sector_t(kaitai::kstream* p__io, vfat_t* p__parent, vfat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bpb = 0;
    m_ebpb_fat16 = 0;
    m_ebpb_fat32 = 0;
    f_pos_fats = false;
    f_ls_per_fat = false;
    f_ls_per_root_dir = false;
    f_is_fat32 = false;
    f_size_fat = false;
    f_pos_root_dir = false;
    f_size_root_dir = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vfat_t::boot_sector_t::_read() {
    m_jmp_instruction = m__io->read_bytes(3);
    m_oem_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 32), std::string("ASCII"));
    m_bpb = new bios_param_block_t(m__io, this, m__root);
    n_ebpb_fat16 = true;
    if (!(is_fat32())) {
        n_ebpb_fat16 = false;
        m_ebpb_fat16 = new ext_bios_param_block_fat16_t(m__io, this, m__root);
    }
    n_ebpb_fat32 = true;
    if (is_fat32()) {
        n_ebpb_fat32 = false;
        m_ebpb_fat32 = new ext_bios_param_block_fat32_t(m__io, this, m__root);
    }
}

vfat_t::boot_sector_t::~boot_sector_t() {
    _clean_up();
}

void vfat_t::boot_sector_t::_clean_up() {
    if (m_bpb) {
        delete m_bpb; m_bpb = 0;
    }
    if (!n_ebpb_fat16) {
        if (m_ebpb_fat16) {
            delete m_ebpb_fat16; m_ebpb_fat16 = 0;
        }
    }
    if (!n_ebpb_fat32) {
        if (m_ebpb_fat32) {
            delete m_ebpb_fat32; m_ebpb_fat32 = 0;
        }
    }
}

int32_t vfat_t::boot_sector_t::pos_fats() {
    if (f_pos_fats)
        return m_pos_fats;
    m_pos_fats = (bpb()->bytes_per_ls() * bpb()->num_reserved_ls());
    f_pos_fats = true;
    return m_pos_fats;
}

uint32_t vfat_t::boot_sector_t::ls_per_fat() {
    if (f_ls_per_fat)
        return m_ls_per_fat;
    m_ls_per_fat = ((is_fat32()) ? (ebpb_fat32()->ls_per_fat()) : (bpb()->ls_per_fat()));
    f_ls_per_fat = true;
    return m_ls_per_fat;
}

int32_t vfat_t::boot_sector_t::ls_per_root_dir() {
    if (f_ls_per_root_dir)
        return m_ls_per_root_dir;
    m_ls_per_root_dir = ((((bpb()->max_root_dir_rec() * 32) + bpb()->bytes_per_ls()) - 1) / bpb()->bytes_per_ls());
    f_ls_per_root_dir = true;
    return m_ls_per_root_dir;
}

bool vfat_t::boot_sector_t::is_fat32() {
    if (f_is_fat32)
        return m_is_fat32;
    m_is_fat32 = bpb()->max_root_dir_rec() == 0;
    f_is_fat32 = true;
    return m_is_fat32;
}

int32_t vfat_t::boot_sector_t::size_fat() {
    if (f_size_fat)
        return m_size_fat;
    m_size_fat = (bpb()->bytes_per_ls() * ls_per_fat());
    f_size_fat = true;
    return m_size_fat;
}

int32_t vfat_t::boot_sector_t::pos_root_dir() {
    if (f_pos_root_dir)
        return m_pos_root_dir;
    m_pos_root_dir = (bpb()->bytes_per_ls() * (bpb()->num_reserved_ls() + (ls_per_fat() * bpb()->num_fats())));
    f_pos_root_dir = true;
    return m_pos_root_dir;
}

int32_t vfat_t::boot_sector_t::size_root_dir() {
    if (f_size_root_dir)
        return m_size_root_dir;
    m_size_root_dir = (ls_per_root_dir() * bpb()->bytes_per_ls());
    f_size_root_dir = true;
    return m_size_root_dir;
}

vfat_t::bios_param_block_t::bios_param_block_t(kaitai::kstream* p__io, vfat_t::boot_sector_t* p__parent, vfat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vfat_t::bios_param_block_t::_read() {
    m_bytes_per_ls = m__io->read_u2le();
    m_ls_per_clus = m__io->read_u1();
    m_num_reserved_ls = m__io->read_u2le();
    m_num_fats = m__io->read_u1();
    m_max_root_dir_rec = m__io->read_u2le();
    m_total_ls_2 = m__io->read_u2le();
    m_media_code = m__io->read_u1();
    m_ls_per_fat = m__io->read_u2le();
    m_ps_per_track = m__io->read_u2le();
    m_num_heads = m__io->read_u2le();
    m_num_hidden_sectors = m__io->read_u4le();
    m_total_ls_4 = m__io->read_u4le();
}

vfat_t::bios_param_block_t::~bios_param_block_t() {
    _clean_up();
}

void vfat_t::bios_param_block_t::_clean_up() {
}

vfat_t::root_directory_rec_t::root_directory_rec_t(kaitai::kstream* p__io, vfat_t::root_directory_t* p__parent, vfat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_attrs = 0;
    m__io__raw_attrs = 0;
    m_last_write_time = 0;
    m__io__raw_last_write_time = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vfat_t::root_directory_rec_t::_read() {
    m_file_name = m__io->read_bytes(11);
    m__raw_attrs = m__io->read_bytes(1);
    m__io__raw_attrs = new kaitai::kstream(m__raw_attrs);
    m_attrs = new attr_flags_t(m__io__raw_attrs, this, m__root);
    m_reserved = m__io->read_bytes(10);
    m__raw_last_write_time = m__io->read_bytes(4);
    m__io__raw_last_write_time = new kaitai::kstream(m__raw_last_write_time);
    m_last_write_time = new dos_datetime_t(m__io__raw_last_write_time);
    m_start_clus = m__io->read_u2le();
    m_file_size = m__io->read_u4le();
}

vfat_t::root_directory_rec_t::~root_directory_rec_t() {
    _clean_up();
}

void vfat_t::root_directory_rec_t::_clean_up() {
    if (m__io__raw_attrs) {
        delete m__io__raw_attrs; m__io__raw_attrs = 0;
    }
    if (m_attrs) {
        delete m_attrs; m_attrs = 0;
    }
    if (m__io__raw_last_write_time) {
        delete m__io__raw_last_write_time; m__io__raw_last_write_time = 0;
    }
    if (m_last_write_time) {
        delete m_last_write_time; m_last_write_time = 0;
    }
}

vfat_t::root_directory_rec_t::attr_flags_t::attr_flags_t(kaitai::kstream* p__io, vfat_t::root_directory_rec_t* p__parent, vfat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_long_name = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vfat_t::root_directory_rec_t::attr_flags_t::_read() {
    m_read_only = m__io->read_bits_int_le(1);
    m_hidden = m__io->read_bits_int_le(1);
    m_system = m__io->read_bits_int_le(1);
    m_volume_id = m__io->read_bits_int_le(1);
    m_is_directory = m__io->read_bits_int_le(1);
    m_archive = m__io->read_bits_int_le(1);
    m_reserved = m__io->read_bits_int_le(2);
}

vfat_t::root_directory_rec_t::attr_flags_t::~attr_flags_t() {
    _clean_up();
}

void vfat_t::root_directory_rec_t::attr_flags_t::_clean_up() {
}

bool vfat_t::root_directory_rec_t::attr_flags_t::long_name() {
    if (f_long_name)
        return m_long_name;
    m_long_name =  ((read_only()) && (hidden()) && (system()) && (volume_id())) ;
    f_long_name = true;
    return m_long_name;
}

vfat_t::root_directory_t::root_directory_t(kaitai::kstream* p__io, vfat_t* p__parent, vfat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vfat_t::root_directory_t::_read() {
    m_records = new std::vector<root_directory_rec_t*>();
    const int l_records = _root()->boot_sector()->bpb()->max_root_dir_rec();
    for (int i = 0; i < l_records; i++) {
        m_records->push_back(new root_directory_rec_t(m__io, this, m__root));
    }
}

vfat_t::root_directory_t::~root_directory_t() {
    _clean_up();
}

void vfat_t::root_directory_t::_clean_up() {
    if (m_records) {
        for (std::vector<root_directory_rec_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
            delete *it;
        }
        delete m_records; m_records = 0;
    }
}

vfat_t::ext_bios_param_block_fat16_t::ext_bios_param_block_fat16_t(kaitai::kstream* p__io, vfat_t::boot_sector_t* p__parent, vfat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vfat_t::ext_bios_param_block_fat16_t::_read() {
    m_phys_drive_num = m__io->read_u1();
    m_reserved1 = m__io->read_u1();
    m_ext_boot_sign = m__io->read_u1();
    m_volume_id = m__io->read_bytes(4);
    m_partition_volume_label = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(11), 32), std::string("ASCII"));
    m_fs_type_str = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 32), std::string("ASCII"));
}

vfat_t::ext_bios_param_block_fat16_t::~ext_bios_param_block_fat16_t() {
    _clean_up();
}

void vfat_t::ext_bios_param_block_fat16_t::_clean_up() {
}

std::vector<std::string>* vfat_t::fats() {
    if (f_fats)
        return m_fats;
    std::streampos _pos = m__io->pos();
    m__io->seek(boot_sector()->pos_fats());
    m_fats = new std::vector<std::string>();
    const int l_fats = boot_sector()->bpb()->num_fats();
    for (int i = 0; i < l_fats; i++) {
        m_fats->push_back(m__io->read_bytes(boot_sector()->size_fat()));
    }
    m__io->seek(_pos);
    f_fats = true;
    return m_fats;
}

vfat_t::root_directory_t* vfat_t::root_dir() {
    if (f_root_dir)
        return m_root_dir;
    std::streampos _pos = m__io->pos();
    m__io->seek(boot_sector()->pos_root_dir());
    m__raw_root_dir = m__io->read_bytes(boot_sector()->size_root_dir());
    m__io__raw_root_dir = new kaitai::kstream(m__raw_root_dir);
    m_root_dir = new root_directory_t(m__io__raw_root_dir, this, m__root);
    m__io->seek(_pos);
    f_root_dir = true;
    return m_root_dir;
}
