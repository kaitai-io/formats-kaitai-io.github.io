# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
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

    $self->{mz} = MicrosoftPe::MzPlaceholder->new($self->{_io}, $self, $self->{_root});
}

sub pe {
    my ($self) = @_;
    return $self->{pe} if ($self->{pe});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->mz()->ofs_pe());
    $self->{pe} = MicrosoftPe::PeHeader->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{pe};
}

sub mz {
    my ($self) = @_;
    return $self->{mz};
}

########################################################################
package MicrosoftPe::CertificateEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CERTIFICATE_REVISION_REVISION_1_0 = 256;
our $CERTIFICATE_REVISION_REVISION_2_0 = 512;

our $CERTIFICATE_TYPE_ENUM_X509 = 1;
our $CERTIFICATE_TYPE_ENUM_PKCS_SIGNED_DATA = 2;
our $CERTIFICATE_TYPE_ENUM_RESERVED_1 = 3;
our $CERTIFICATE_TYPE_ENUM_TS_STACK_SIGNED = 4;

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

    $self->{length} = $self->{_io}->read_u4le();
    $self->{revision} = $self->{_io}->read_u2le();
    $self->{certificate_type} = $self->{_io}->read_u2le();
    $self->{certificate_bytes} = $self->{_io}->read_bytes(($self->length() - 8));
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub revision {
    my ($self) = @_;
    return $self->{revision};
}

sub certificate_type {
    my ($self) = @_;
    return $self->{certificate_type};
}

sub certificate_bytes {
    my ($self) = @_;
    return $self->{certificate_bytes};
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
our $SUBSYSTEM_ENUM_WINDOWS_BOOT_APPLICATION = 16;

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

    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32) {
        $self->{image_base_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32_PLUS) {
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
    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32) {
        $self->{size_of_stack_reserve_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32_PLUS) {
        $self->{size_of_stack_reserve_64} = $self->{_io}->read_u8le();
    }
    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32) {
        $self->{size_of_stack_commit_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32_PLUS) {
        $self->{size_of_stack_commit_64} = $self->{_io}->read_u8le();
    }
    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32) {
        $self->{size_of_heap_reserve_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32_PLUS) {
        $self->{size_of_heap_reserve_64} = $self->{_io}->read_u8le();
    }
    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32) {
        $self->{size_of_heap_commit_32} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->std()->format() == $MicrosoftPe::PE_FORMAT_PE32_PLUS) {
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
package MicrosoftPe::CoffSymbol;

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

    $self->{_raw_name_annoying} = $self->{_io}->read_bytes(8);
    my $io__raw_name_annoying = IO::KaitaiStruct::Stream->new($self->{_raw_name_annoying});
    $self->{name_annoying} = MicrosoftPe::Annoyingstring->new($io__raw_name_annoying, $self, $self->{_root});
    $self->{value} = $self->{_io}->read_u4le();
    $self->{section_number} = $self->{_io}->read_u2le();
    $self->{type} = $self->{_io}->read_u2le();
    $self->{storage_class} = $self->{_io}->read_u1();
    $self->{number_of_aux_symbols} = $self->{_io}->read_u1();
}

sub section {
    my ($self) = @_;
    return $self->{section} if ($self->{section});
    $self->{section} = @{$self->_root()->pe()->sections()}[($self->section_number() - 1)];
    return $self->{section};
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->section()->pointer_to_raw_data() + $self->value()));
    $self->{data} = $self->{_io}->read_bytes(1);
    $self->{_io}->seek($_pos);
    return $self->{data};
}

sub name_annoying {
    my ($self) = @_;
    return $self->{name_annoying};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub section_number {
    my ($self) = @_;
    return $self->{section_number};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub storage_class {
    my ($self) = @_;
    return $self->{storage_class};
}

sub number_of_aux_symbols {
    my ($self) = @_;
    return $self->{number_of_aux_symbols};
}

sub _raw_name_annoying {
    my ($self) = @_;
    return $self->{_raw_name_annoying};
}

########################################################################
package MicrosoftPe::PeHeader;

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

    $self->{pe_signature} = $self->{_io}->read_bytes(4);
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

sub certificate_table {
    my ($self) = @_;
    return $self->{certificate_table} if ($self->{certificate_table});
    if ($self->optional_hdr()->data_dirs()->certificate_table()->virtual_address() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->optional_hdr()->data_dirs()->certificate_table()->virtual_address());
        $self->{_raw_certificate_table} = $self->{_io}->read_bytes($self->optional_hdr()->data_dirs()->certificate_table()->size());
        my $io__raw_certificate_table = IO::KaitaiStruct::Stream->new($self->{_raw_certificate_table});
        $self->{certificate_table} = MicrosoftPe::CertificateTable->new($io__raw_certificate_table, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{certificate_table};
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

sub _raw_certificate_table {
    my ($self) = @_;
    return $self->{_raw_certificate_table};
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
package MicrosoftPe::CertificateTable;

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

    $self->{items} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{items}}, MicrosoftPe::CertificateEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
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

    $self->{magic} = $self->{_io}->read_bytes(2);
    $self->{data1} = $self->{_io}->read_bytes(58);
    $self->{ofs_pe} = $self->{_io}->read_u4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub data1 {
    my ($self) = @_;
    return $self->{data1};
}

sub ofs_pe {
    my ($self) = @_;
    return $self->{ofs_pe};
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
    if ($self->format() == $MicrosoftPe::PE_FORMAT_PE32) {
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
our $MACHINE_TYPE_ALPHA = 388;
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
our $MACHINE_TYPE_ARM64 = 43620;

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

sub symbol_table_size {
    my ($self) = @_;
    return $self->{symbol_table_size} if ($self->{symbol_table_size});
    $self->{symbol_table_size} = ($self->number_of_symbols() * 18);
    return $self->{symbol_table_size};
}

sub symbol_name_table_offset {
    my ($self) = @_;
    return $self->{symbol_name_table_offset} if ($self->{symbol_name_table_offset});
    $self->{symbol_name_table_offset} = ($self->pointer_to_symbol_table() + $self->symbol_table_size());
    return $self->{symbol_name_table_offset};
}

sub symbol_name_table_size {
    my ($self) = @_;
    return $self->{symbol_name_table_size} if ($self->{symbol_name_table_size});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->symbol_name_table_offset());
    $self->{symbol_name_table_size} = $self->{_io}->read_u4le();
    $self->{_io}->seek($_pos);
    return $self->{symbol_name_table_size};
}

sub symbol_table {
    my ($self) = @_;
    return $self->{symbol_table} if ($self->{symbol_table});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->pointer_to_symbol_table());
    $self->{symbol_table} = ();
    my $n_symbol_table = $self->number_of_symbols();
    for (my $i = 0; $i < $n_symbol_table; $i++) {
        $self->{symbol_table}[$i] = MicrosoftPe::CoffSymbol->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{symbol_table};
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

########################################################################
package MicrosoftPe::Annoyingstring;

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

}

sub name_from_offset {
    my ($self) = @_;
    return $self->{name_from_offset} if ($self->{name_from_offset});
    if ($self->name_zeroes() == 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek(($self->name_zeroes() == 0 ? ($self->_parent()->_parent()->symbol_name_table_offset() + $self->name_offset()) : 0));
        $self->{name_from_offset} = Encode::decode("ascii", $io->read_bytes_term(0, 0, 1, 0));
        $io->seek($_pos);
    }
    return $self->{name_from_offset};
}

sub name_offset {
    my ($self) = @_;
    return $self->{name_offset} if ($self->{name_offset});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(4);
    $self->{name_offset} = $self->{_io}->read_u4le();
    $self->{_io}->seek($_pos);
    return $self->{name_offset};
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    $self->{name} = ($self->name_zeroes() == 0 ? $self->name_from_offset() : $self->name_from_short());
    return $self->{name};
}

sub name_zeroes {
    my ($self) = @_;
    return $self->{name_zeroes} if ($self->{name_zeroes});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{name_zeroes} = $self->{_io}->read_u4le();
    $self->{_io}->seek($_pos);
    return $self->{name_zeroes};
}

sub name_from_short {
    my ($self) = @_;
    return $self->{name_from_short} if ($self->{name_from_short});
    if ($self->name_zeroes() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek(0);
        $self->{name_from_short} = Encode::decode("ascii", $self->{_io}->read_bytes_term(0, 0, 1, 0));
        $self->{_io}->seek($_pos);
    }
    return $self->{name_from_short};
}

1;
