# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package MicrosoftPe;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PE_FORMAT_ROM_IMAGE = 263;
our $PE_FORMAT_PE32 = 267;
our $PE_FORMAT_PE32_PLUS = 523;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{mz1} = MicrosoftPe::MzPlaceholder->new($self->{_io}, $self, $self->{_root});
    $self->{mz2} = $self->{_io}->read_bytes(($self->mz1()->header_size() - 64));
    $self->{pe_signature} = $self->{_io}->ensure_fixed_contents(pack('C*', (80, 69, 0, 0)));
    $self->{coff_hdr} = MicrosoftPe::CoffHeader->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_optional_hdr} = $self->{_io}->read_bytes($self->coff_hdr()->size_of_optional_header());
    my $io__raw_optional_hdr = IO::KaitaiStruct::Stream->new($self->{_raw_optional_hdr});
    $self->{optional_hdr} = MicrosoftPe::OptionalHeader->new($io__raw_optional_hdr, $self, $self->{_root});
    $self->{sections} = ();
    my $n_sections = $self->coff_hdr()->number_of_sections();
    for (my $i = 0; $i < $n_sections; $i++) {
        $self->{sections}[$i] = MicrosoftPe::Section->new($self->{_io}, $self, $self->{_root});
    }
}

sub mz1 {
    my ($self) = @_;
    return $self->{mz1};
}

sub mz2 {
    my ($self) = @_;
    return $self->{mz2};
}

sub pe_signature {
    my ($self) = @_;
    return $self->{pe_signature};
}

sub coff_hdr {
    my ($self) = @_;
    return $self->{coff_hdr};
}

sub optional_hdr {
    my ($self) = @_;
    return $self->{optional_hdr};
}

sub sections {
    my ($self) = @_;
    return $self->{sections};
}

sub _raw_optional_hdr {
    my ($self) = @_;
    return $self->{_raw_optional_hdr};
}

########################################################################
package MicrosoftPe::OptionalHeaderWindows;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SUBSYSTEM_ENUM_UNKNOWN = 0;
our $SUBSYSTEM_ENUM_NATIVE = 1;
our $SUBSYSTEM_ENUM_WINDOWS_GUI = 2;
our $SUBSYSTEM_ENUM_WINDOWS_CUI = 3;
our $SUBSYSTEM_ENUM_POSIX_CUI = 7;
our $SUBSYSTEM_ENUM_WINDOWS_CE_GUI = 9;
our $SUBSYSTEM_ENUM_EFI_APPLICATION = 10;
our $SUBSYSTEM_ENUM_EFI_BOOT_SERVICE_DRIVER = 11;
our $SUBSYSTEM_ENUM_EFI_RUNTIME_DRIVER = 12;
our $SUBSYSTEM_ENUM_EFI_ROM = 13;
our $SUBSYSTEM_ENUM_XBOX = 14;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32) {
        $self->{image_base_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32_PLUS) {
        $self->{image_base_64} = $self->{_io}->read_u8le();
    }
    $self->{section_alignment} = $self->{_io}->read_u4le();
    $self->{file_alignment} = $self->{_io}->read_u4le();
    $self->{major_operating_system_version} = $self->{_io}->read_u2le();
    $self->{minor_operating_system_version} = $self->{_io}->read_u2le();
    $self->{major_image_version} = $self->{_io}->read_u2le();
    $self->{minor_image_version} = $self->{_io}->read_u2le();
    $self->{major_subsystem_version} = $self->{_io}->read_u2le();
    $self->{minor_subsystem_version} = $self->{_io}->read_u2le();
    $self->{win32_version_value} = $self->{_io}->read_u4le();
    $self->{size_of_image} = $self->{_io}->read_u4le();
    $self->{size_of_headers} = $self->{_io}->read_u4le();
    $self->{check_sum} = $self->{_io}->read_u4le();
    $self->{subsystem} = $self->{_io}->read_u2le();
    $self->{dll_characteristics} = $self->{_io}->read_u2le();
    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32) {
        $self->{size_of_stack_reserve_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32_PLUS) {
        $self->{size_of_stack_reserve_64} = $self->{_io}->read_u8le();
    }
    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32) {
        $self->{size_of_stack_commit_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32_PLUS) {
        $self->{size_of_stack_commit_64} = $self->{_io}->read_u8le();
    }
    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32) {
        $self->{size_of_heap_reserve_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32_PLUS) {
        $self->{size_of_heap_reserve_64} = $self->{_io}->read_u8le();
    }
    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32) {
        $self->{size_of_heap_commit_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $PE_FORMAT_PE32_PLUS) {
        $self->{size_of_heap_commit_64} = $self->{_io}->read_u8le();
    }
    $self->{loader_flags} = $self->{_io}->read_u4le();
    $self->{number_of_rva_and_sizes} = $self->{_io}->read_u4le();
}

sub image_base_32 {
    my ($self) = @_;
    return $self->{image_base_32};
}

sub image_base_64 {
    my ($self) = @_;
    return $self->{image_base_64};
}

sub section_alignment {
    my ($self) = @_;
    return $self->{section_alignment};
}

sub file_alignment {
    my ($self) = @_;
    return $self->{file_alignment};
}

sub major_operating_system_version {
    my ($self) = @_;
    return $self->{major_operating_system_version};
}

sub minor_operating_system_version {
    my ($self) = @_;
    return $self->{minor_operating_system_version};
}

sub major_image_version {
    my ($self) = @_;
    return $self->{major_image_version};
}

sub minor_image_version {
    my ($self) = @_;
    return $self->{minor_image_version};
}

sub major_subsystem_version {
    my ($self) = @_;
    return $self->{major_subsystem_version};
}

sub minor_subsystem_version {
    my ($self) = @_;
    return $self->{minor_subsystem_version};
}

sub win32_version_value {
    my ($self) = @_;
    return $self->{win32_version_value};
}

sub size_of_image {
    my ($self) = @_;
    return $self->{size_of_image};
}

sub size_of_headers {
    my ($self) = @_;
    return $self->{size_of_headers};
}

sub check_sum {
    my ($self) = @_;
    return $self->{check_sum};
}

sub subsystem {
    my ($self) = @_;
    return $self->{subsystem};
}

sub dll_characteristics {
    my ($self) = @_;
    return $self->{dll_characteristics};
}

sub size_of_stack_reserve_32 {
    my ($self) = @_;
    return $self->{size_of_stack_reserve_32};
}

sub size_of_stack_reserve_64 {
    my ($self) = @_;
    return $self->{size_of_stack_reserve_64};
}

sub size_of_stack_commit_32 {
    my ($self) = @_;
    return $self->{size_of_stack_commit_32};
}

sub size_of_stack_commit_64 {
    my ($self) = @_;
    return $self->{size_of_stack_commit_64};
}

sub size_of_heap_reserve_32 {
    my ($self) = @_;
    return $self->{size_of_heap_reserve_32};
}

sub size_of_heap_reserve_64 {
    my ($self) = @_;
    return $self->{size_of_heap_reserve_64};
}

sub size_of_heap_commit_32 {
    my ($self) = @_;
    return $self->{size_of_heap_commit_32};
}

sub size_of_heap_commit_64 {
    my ($self) = @_;
    return $self->{size_of_heap_commit_64};
}

sub loader_flags {
    my ($self) = @_;
    return $self->{loader_flags};
}

sub number_of_rva_and_sizes {
    my ($self) = @_;
    return $self->{number_of_rva_and_sizes};
}

########################################################################
package MicrosoftPe::OptionalHeaderDataDirs;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{export_table} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{import_table} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{resource_table} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{exception_table} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{certificate_table} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{base_relocation_table} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{debug} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{architecture} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{global_ptr} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{tls_table} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{load_config_table} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{bound_import} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{iat} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{delay_import_descriptor} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
    $self->{clr_runtime_header} = MicrosoftPe::DataDir->new($self->{_io}, $self, $self->{_root});
}

sub export_table {
    my ($self) = @_;
    return $self->{export_table};
}

sub import_table {
    my ($self) = @_;
    return $self->{import_table};
}

sub resource_table {
    my ($self) = @_;
    return $self->{resource_table};
}

sub exception_table {
    my ($self) = @_;
    return $self->{exception_table};
}

sub certificate_table {
    my ($self) = @_;
    return $self->{certificate_table};
}

sub base_relocation_table {
    my ($self) = @_;
    return $self->{base_relocation_table};
}

sub debug {
    my ($self) = @_;
    return $self->{debug};
}

sub architecture {
    my ($self) = @_;
    return $self->{architecture};
}

sub global_ptr {
    my ($self) = @_;
    return $self->{global_ptr};
}

sub tls_table {
    my ($self) = @_;
    return $self->{tls_table};
}

sub load_config_table {
    my ($self) = @_;
    return $self->{load_config_table};
}

sub bound_import {
    my ($self) = @_;
    return $self->{bound_import};
}

sub iat {
    my ($self) = @_;
    return $self->{iat};
}

sub delay_import_descriptor {
    my ($self) = @_;
    return $self->{delay_import_descriptor};
}

sub clr_runtime_header {
    my ($self) = @_;
    return $self->{clr_runtime_header};
}

########################################################################
package MicrosoftPe::DataDir;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{virtual_address} = $self->{_io}->read_u4le();
    $self->{size} = $self->{_io}->read_u4le();
}

sub virtual_address {
    my ($self) = @_;
    return $self->{virtual_address};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

########################################################################
package MicrosoftPe::OptionalHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{std} = MicrosoftPe::OptionalHeaderStd->new($self->{_io}, $self, $self->{_root});
    $self->{windows} = MicrosoftPe::OptionalHeaderWindows->new($self->{_io}, $self, $self->{_root});
    $self->{data_dirs} = MicrosoftPe::OptionalHeaderDataDirs->new($self->{_io}, $self, $self->{_root});
}

sub std {
    my ($self) = @_;
    return $self->{std};
}

sub windows {
    my ($self) = @_;
    return $self->{windows};
}

sub data_dirs {
    my ($self) = @_;
    return $self->{data_dirs};
}

########################################################################
package MicrosoftPe::Section;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(8), 0));
    $self->{virtual_size} = $self->{_io}->read_u4le();
    $self->{virtual_address} = $self->{_io}->read_u4le();
    $self->{size_of_raw_data} = $self->{_io}->read_u4le();
    $self->{pointer_to_raw_data} = $self->{_io}->read_u4le();
    $self->{pointer_to_relocations} = $self->{_io}->read_u4le();
    $self->{pointer_to_linenumbers} = $self->{_io}->read_u4le();
    $self->{number_of_relocations} = $self->{_io}->read_u2le();
    $self->{number_of_linenumbers} = $self->{_io}->read_u2le();
    $self->{characteristics} = $self->{_io}->read_u4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->pointer_to_raw_data());
    $self->{body} = $self->{_io}->read_bytes($self->size_of_raw_data());
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub virtual_size {
    my ($self) = @_;
    return $self->{virtual_size};
}

sub virtual_address {
    my ($self) = @_;
    return $self->{virtual_address};
}

sub size_of_raw_data {
    my ($self) = @_;
    return $self->{size_of_raw_data};
}

sub pointer_to_raw_data {
    my ($self) = @_;
    return $self->{pointer_to_raw_data};
}

sub pointer_to_relocations {
    my ($self) = @_;
    return $self->{pointer_to_relocations};
}

sub pointer_to_linenumbers {
    my ($self) = @_;
    return $self->{pointer_to_linenumbers};
}

sub number_of_relocations {
    my ($self) = @_;
    return $self->{number_of_relocations};
}

sub number_of_linenumbers {
    my ($self) = @_;
    return $self->{number_of_linenumbers};
}

sub characteristics {
    my ($self) = @_;
    return $self->{characteristics};
}

########################################################################
package MicrosoftPe::MzPlaceholder;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (77, 90)));
    $self->{data1} = $self->{_io}->read_bytes(58);
    $self->{header_size} = $self->{_io}->read_u4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub data1 {
    my ($self) = @_;
    return $self->{data1};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

########################################################################
package MicrosoftPe::OptionalHeaderStd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format} = $self->{_io}->read_u2le();
    $self->{major_linker_version} = $self->{_io}->read_u1();
    $self->{minor_linker_version} = $self->{_io}->read_u1();
    $self->{size_of_code} = $self->{_io}->read_u4le();
    $self->{size_of_initialized_data} = $self->{_io}->read_u4le();
    $self->{size_of_uninitialized_data} = $self->{_io}->read_u4le();
    $self->{address_of_entry_point} = $self->{_io}->read_u4le();
    $self->{base_of_code} = $self->{_io}->read_u4le();
    if ($self->format() == $PE_FORMAT_PE32) {
        $self->{base_of_data} = $self->{_io}->read_u4le();
    }
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub major_linker_version {
    my ($self) = @_;
    return $self->{major_linker_version};
}

sub minor_linker_version {
    my ($self) = @_;
    return $self->{minor_linker_version};
}

sub size_of_code {
    my ($self) = @_;
    return $self->{size_of_code};
}

sub size_of_initialized_data {
    my ($self) = @_;
    return $self->{size_of_initialized_data};
}

sub size_of_uninitialized_data {
    my ($self) = @_;
    return $self->{size_of_uninitialized_data};
}

sub address_of_entry_point {
    my ($self) = @_;
    return $self->{address_of_entry_point};
}

sub base_of_code {
    my ($self) = @_;
    return $self->{base_of_code};
}

sub base_of_data {
    my ($self) = @_;
    return $self->{base_of_data};
}

########################################################################
package MicrosoftPe::CoffHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $MACHINE_TYPE_UNKNOWN = 0;
our $MACHINE_TYPE_I386 = 332;
our $MACHINE_TYPE_R4000 = 358;
our $MACHINE_TYPE_WCEMIPSV2 = 361;
our $MACHINE_TYPE_SH3 = 418;
our $MACHINE_TYPE_SH3DSP = 419;
our $MACHINE_TYPE_SH4 = 422;
our $MACHINE_TYPE_SH5 = 424;
our $MACHINE_TYPE_ARM = 448;
our $MACHINE_TYPE_THUMB = 450;
our $MACHINE_TYPE_ARMNT = 452;
our $MACHINE_TYPE_AM33 = 467;
our $MACHINE_TYPE_POWERPC = 496;
our $MACHINE_TYPE_POWERPCFP = 497;
our $MACHINE_TYPE_IA64 = 512;
our $MACHINE_TYPE_MIPS16 = 614;
our $MACHINE_TYPE_MIPSFPU = 870;
our $MACHINE_TYPE_MIPSFPU16 = 1126;
our $MACHINE_TYPE_EBC = 3772;
our $MACHINE_TYPE_RISCV32 = 20530;
our $MACHINE_TYPE_RISCV64 = 20580;
our $MACHINE_TYPE_RISCV128 = 20776;
our $MACHINE_TYPE_AMD64 = 34404;
our $MACHINE_TYPE_M32R = 36929;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{machine} = $self->{_io}->read_u2le();
    $self->{number_of_sections} = $self->{_io}->read_u2le();
    $self->{time_date_stamp} = $self->{_io}->read_u4le();
    $self->{pointer_to_symbol_table} = $self->{_io}->read_u4le();
    $self->{number_of_symbols} = $self->{_io}->read_u4le();
    $self->{size_of_optional_header} = $self->{_io}->read_u2le();
    $self->{characteristics} = $self->{_io}->read_u2le();
}

sub machine {
    my ($self) = @_;
    return $self->{machine};
}

sub number_of_sections {
    my ($self) = @_;
    return $self->{number_of_sections};
}

sub time_date_stamp {
    my ($self) = @_;
    return $self->{time_date_stamp};
}

sub pointer_to_symbol_table {
    my ($self) = @_;
    return $self->{pointer_to_symbol_table};
}

sub number_of_symbols {
    my ($self) = @_;
    return $self->{number_of_symbols};
}

sub size_of_optional_header {
    my ($self) = @_;
    return $self->{size_of_optional_header};
}

sub characteristics {
    my ($self) = @_;
    return $self->{characteristics};
}

1;
