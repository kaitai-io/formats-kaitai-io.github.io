# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Nitf;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = Nitf::Header->new($self->{_io}, $self, $self->{_root});
    $self->{image_segments} = [];
    my $n_image_segments = ($self->header()->num_image_segments() + 0);
    for (my $i = 0; $i < $n_image_segments; $i++) {
        push @{$self->{image_segments}}, Nitf::ImageSegment->new($self->{_io}, $self, $self->{_root});
    }
    $self->{graphics_segments} = [];
    my $n_graphics_segments = ($self->header()->num_graphics_segments() + 0);
    for (my $i = 0; $i < $n_graphics_segments; $i++) {
        push @{$self->{graphics_segments}}, Nitf::GraphicsSegment->new($self->{_io}, $self, $self->{_root});
    }
    $self->{text_segments} = [];
    my $n_text_segments = ($self->header()->num_text_files() + 0);
    for (my $i = 0; $i < $n_text_segments; $i++) {
        push @{$self->{text_segments}}, Nitf::TextSegment->new($self->{_io}, $self, $self->{_root});
    }
    $self->{data_extension_segments} = [];
    my $n_data_extension_segments = ($self->header()->num_data_extension() + 0);
    for (my $i = 0; $i < $n_data_extension_segments; $i++) {
        push @{$self->{data_extension_segments}}, Nitf::DataExtensionSegment->new($self->{_io}, $self, $self->{_root});
    }
    $self->{reserved_extension_segments} = [];
    my $n_reserved_extension_segments = ($self->header()->num_reserved_extension() + 0);
    for (my $i = 0; $i < $n_reserved_extension_segments; $i++) {
        push @{$self->{reserved_extension_segments}}, Nitf::ReservedExtensionSegment->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub image_segments {
    my ($self) = @_;
    return $self->{image_segments};
}

sub graphics_segments {
    my ($self) = @_;
    return $self->{graphics_segments};
}

sub text_segments {
    my ($self) = @_;
    return $self->{text_segments};
}

sub data_extension_segments {
    my ($self) = @_;
    return $self->{data_extension_segments};
}

sub reserved_extension_segments {
    my ($self) = @_;
    return $self->{reserved_extension_segments};
}

########################################################################
package Nitf::BandInfo;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{representation} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{subcategory} = Encode::decode("UTF-8", $self->{_io}->read_bytes(6));
    $self->{img_filter_condition} = $self->{_io}->read_bytes(1);
    $self->{img_filter_code} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{num_luts} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    if (($self->num_luts() + 0) != 0) {
        $self->{num_lut_entries} = Encode::decode("UTF-8", $self->{_io}->read_bytes(5));
    }
    $self->{luts} = [];
    my $n_luts = ($self->num_luts() + 0);
    for (my $i = 0; $i < $n_luts; $i++) {
        push @{$self->{luts}}, $self->{_io}->read_bytes(($self->num_lut_entries() + 0));
    }
}

sub representation {
    my ($self) = @_;
    return $self->{representation};
}

sub subcategory {
    my ($self) = @_;
    return $self->{subcategory};
}

sub img_filter_condition {
    my ($self) = @_;
    return $self->{img_filter_condition};
}

sub img_filter_code {
    my ($self) = @_;
    return $self->{img_filter_code};
}

sub num_luts {
    my ($self) = @_;
    return $self->{num_luts};
}

sub num_lut_entries {
    my ($self) = @_;
    return $self->{num_lut_entries};
}

sub luts {
    my ($self) = @_;
    return $self->{luts};
}

########################################################################
package Nitf::Clasnfo;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{security_class} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{security_system} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{codewords} = Encode::decode("UTF-8", $self->{_io}->read_bytes(11));
    $self->{control_and_handling} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{releaseability} = Encode::decode("UTF-8", $self->{_io}->read_bytes(20));
    $self->{declass_type} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{declass_date} = Encode::decode("UTF-8", $self->{_io}->read_bytes(8));
    $self->{declass_exemption} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{downgrade} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{downgrade_date} = Encode::decode("UTF-8", $self->{_io}->read_bytes(8));
    $self->{class_text} = Encode::decode("UTF-8", $self->{_io}->read_bytes(43));
    $self->{class_authority_type} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{class_authority} = Encode::decode("UTF-8", $self->{_io}->read_bytes(40));
    $self->{class_reason} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{source_date} = Encode::decode("UTF-8", $self->{_io}->read_bytes(8));
    $self->{control_number} = Encode::decode("UTF-8", $self->{_io}->read_bytes(15));
}

sub security_class {
    my ($self) = @_;
    return $self->{security_class};
}

sub security_system {
    my ($self) = @_;
    return $self->{security_system};
}

sub codewords {
    my ($self) = @_;
    return $self->{codewords};
}

sub control_and_handling {
    my ($self) = @_;
    return $self->{control_and_handling};
}

sub releaseability {
    my ($self) = @_;
    return $self->{releaseability};
}

sub declass_type {
    my ($self) = @_;
    return $self->{declass_type};
}

sub declass_date {
    my ($self) = @_;
    return $self->{declass_date};
}

sub declass_exemption {
    my ($self) = @_;
    return $self->{declass_exemption};
}

sub downgrade {
    my ($self) = @_;
    return $self->{downgrade};
}

sub downgrade_date {
    my ($self) = @_;
    return $self->{downgrade_date};
}

sub class_text {
    my ($self) = @_;
    return $self->{class_text};
}

sub class_authority_type {
    my ($self) = @_;
    return $self->{class_authority_type};
}

sub class_authority {
    my ($self) = @_;
    return $self->{class_authority};
}

sub class_reason {
    my ($self) = @_;
    return $self->{class_reason};
}

sub source_date {
    my ($self) = @_;
    return $self->{source_date};
}

sub control_number {
    my ($self) = @_;
    return $self->{control_number};
}

########################################################################
package Nitf::DataExtensionSegment;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{_raw_data_sub_header} = $self->{_io}->read_bytes((@{$self->_parent()->header()->ldnfo()}[$self->idx()]->length_data_extension_subheader() + 0));
    my $io__raw_data_sub_header = IO::KaitaiStruct::Stream->new($self->{_raw_data_sub_header});
    $self->{data_sub_header} = Nitf::DataSubHeader->new($io__raw_data_sub_header, $self, $self->{_root});
    $self->{data_data_field} = $self->{_io}->read_bytes((@{$self->_parent()->header()->ldnfo()}[$self->idx()]->length_data_extension_segment() + 0));
}

sub data_sub_header {
    my ($self) = @_;
    return $self->{data_sub_header};
}

sub data_data_field {
    my ($self) = @_;
    return $self->{data_data_field};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

sub _raw_data_sub_header {
    my ($self) = @_;
    return $self->{_raw_data_sub_header};
}

########################################################################
package Nitf::DataSubHeader;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{des_base} = Nitf::DataSubHeaderBase->new($self->{_io}, $self, $self->{_root});
    if ($self->tre_ofl()) {
        $self->{overflowed_header_type} = Encode::decode("UTF-8", $self->{_io}->read_bytes(6));
    }
    if ($self->tre_ofl()) {
        $self->{data_item_overflowed} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    }
    $self->{des_defined_subheader_fields_len} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{desshf} = Encode::decode("UTF-8", $self->{_io}->read_bytes(($self->des_defined_subheader_fields_len() + 0)));
    $self->{des_defined_data_field} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub tre_ofl {
    my ($self) = @_;
    return $self->{tre_ofl} if ($self->{tre_ofl});
    $self->{tre_ofl} = $self->des_base()->desid() eq "TRE_OVERFLOW";
    return $self->{tre_ofl};
}

sub des_base {
    my ($self) = @_;
    return $self->{des_base};
}

sub overflowed_header_type {
    my ($self) = @_;
    return $self->{overflowed_header_type};
}

sub data_item_overflowed {
    my ($self) = @_;
    return $self->{data_item_overflowed};
}

sub des_defined_subheader_fields_len {
    my ($self) = @_;
    return $self->{des_defined_subheader_fields_len};
}

sub desshf {
    my ($self) = @_;
    return $self->{desshf};
}

sub des_defined_data_field {
    my ($self) = @_;
    return $self->{des_defined_data_field};
}

########################################################################
package Nitf::DataSubHeaderBase;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{file_part_type_de} = $self->{_io}->read_bytes(2);
    $self->{desid} = Encode::decode("UTF-8", $self->{_io}->read_bytes(25));
    $self->{data_definition_version} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{declasnfo} = Nitf::Clasnfo->new($self->{_io}, $self, $self->{_root});
}

sub file_part_type_de {
    my ($self) = @_;
    return $self->{file_part_type_de};
}

sub desid {
    my ($self) = @_;
    return $self->{desid};
}

sub data_definition_version {
    my ($self) = @_;
    return $self->{data_definition_version};
}

sub declasnfo {
    my ($self) = @_;
    return $self->{declasnfo};
}

########################################################################
package Nitf::DataSubHeaderStreaming;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{des_base} = Nitf::DataSubHeaderBase->new($self->{_io}, $self, $self->{_root});
    $self->{des_defined_subheader_fields_len} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{sfh_l1} = Encode::decode("UTF-8", $self->{_io}->read_bytes(7));
    $self->{sfh_delim1} = $self->{_io}->read_u4be();
    $self->{sfh_dr} = [];
    my $n_sfh_dr = ($self->sfh_l1() + 0);
    for (my $i = 0; $i < $n_sfh_dr; $i++) {
        push @{$self->{sfh_dr}}, $self->{_io}->read_u1();
    }
    $self->{sfh_delim2} = $self->{_io}->read_u4be();
    $self->{sfh_l2} = Encode::decode("UTF-8", $self->{_io}->read_bytes(7));
}

sub des_base {
    my ($self) = @_;
    return $self->{des_base};
}

sub des_defined_subheader_fields_len {
    my ($self) = @_;
    return $self->{des_defined_subheader_fields_len};
}

sub sfh_l1 {
    my ($self) = @_;
    return $self->{sfh_l1};
}

sub sfh_delim1 {
    my ($self) = @_;
    return $self->{sfh_delim1};
}

sub sfh_dr {
    my ($self) = @_;
    return $self->{sfh_dr};
}

sub sfh_delim2 {
    my ($self) = @_;
    return $self->{sfh_delim2};
}

sub sfh_l2 {
    my ($self) = @_;
    return $self->{sfh_l2};
}

########################################################################
package Nitf::DataSubHeaderTre;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{des_base} = Nitf::DataSubHeaderBase->new($self->{_io}, $self, $self->{_root});
    if ($self->des_base()->desid() eq "TRE_OVERFLOW") {
        $self->{overflowed_header_type} = Encode::decode("UTF-8", $self->{_io}->read_bytes(6));
    }
    if ($self->des_base()->desid() eq "TRE_OVERFLOW") {
        $self->{data_item_overflowed} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    }
    $self->{des_defined_subheader_fields_len} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{des_defined_data_field} = Encode::decode("UTF-8", $self->{_io}->read_bytes(($self->des_defined_subheader_fields_len() + 0)));
}

sub des_base {
    my ($self) = @_;
    return $self->{des_base};
}

sub overflowed_header_type {
    my ($self) = @_;
    return $self->{overflowed_header_type};
}

sub data_item_overflowed {
    my ($self) = @_;
    return $self->{data_item_overflowed};
}

sub des_defined_subheader_fields_len {
    my ($self) = @_;
    return $self->{des_defined_subheader_fields_len};
}

sub des_defined_data_field {
    my ($self) = @_;
    return $self->{des_defined_data_field};
}

########################################################################
package Nitf::DateTime;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{_unnamed0} = Encode::decode("UTF-8", $self->{_io}->read_bytes(14));
}

sub _unnamed0 {
    my ($self) = @_;
    return $self->{_unnamed0};
}

########################################################################
package Nitf::Encrypt;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{_unnamed0} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
}

sub _unnamed0 {
    my ($self) = @_;
    return $self->{_unnamed0};
}

########################################################################
package Nitf::GraphicSubHeader;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{file_part_type_sy} = $self->{_io}->read_bytes(2);
    $self->{graphic_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(10));
    $self->{graphic_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes(20));
    $self->{graphic_classification} = Nitf::Clasnfo->new($self->{_io}, $self, $self->{_root});
    $self->{encryption} = Nitf::Encrypt->new($self->{_io}, $self, $self->{_root});
    $self->{graphic_type} = $self->{_io}->read_bytes(1);
    $self->{reserved1} = Encode::decode("UTF-8", $self->{_io}->read_bytes(13));
    $self->{graphic_display_level} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{graphic_attachment_level} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{graphic_location} = Encode::decode("UTF-8", $self->{_io}->read_bytes(10));
    $self->{first_graphic_bound_loc} = Encode::decode("UTF-8", $self->{_io}->read_bytes(10));
    $self->{graphic_color} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{second_graphic_bound_loc} = Encode::decode("UTF-8", $self->{_io}->read_bytes(10));
    $self->{reserved2} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{graphics_extended_sub_header} = Nitf::TreHeader->new($self->{_io}, $self, $self->{_root});
}

sub file_part_type_sy {
    my ($self) = @_;
    return $self->{file_part_type_sy};
}

sub graphic_id {
    my ($self) = @_;
    return $self->{graphic_id};
}

sub graphic_name {
    my ($self) = @_;
    return $self->{graphic_name};
}

sub graphic_classification {
    my ($self) = @_;
    return $self->{graphic_classification};
}

sub encryption {
    my ($self) = @_;
    return $self->{encryption};
}

sub graphic_type {
    my ($self) = @_;
    return $self->{graphic_type};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub graphic_display_level {
    my ($self) = @_;
    return $self->{graphic_display_level};
}

sub graphic_attachment_level {
    my ($self) = @_;
    return $self->{graphic_attachment_level};
}

sub graphic_location {
    my ($self) = @_;
    return $self->{graphic_location};
}

sub first_graphic_bound_loc {
    my ($self) = @_;
    return $self->{first_graphic_bound_loc};
}

sub graphic_color {
    my ($self) = @_;
    return $self->{graphic_color};
}

sub second_graphic_bound_loc {
    my ($self) = @_;
    return $self->{second_graphic_bound_loc};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub graphics_extended_sub_header {
    my ($self) = @_;
    return $self->{graphics_extended_sub_header};
}

########################################################################
package Nitf::GraphicsSegment;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{graphic_sub_header} = Nitf::GraphicSubHeader->new($self->{_io}, $self, $self->{_root});
    $self->{graphic_data_field} = $self->{_io}->read_bytes((@{$self->_parent()->header()->lnnfo()}[$self->idx()]->length_graphic_segment() + 0));
}

sub graphic_sub_header {
    my ($self) = @_;
    return $self->{graphic_sub_header};
}

sub graphic_data_field {
    my ($self) = @_;
    return $self->{graphic_data_field};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

########################################################################
package Nitf::Header;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{file_profile_name} = $self->{_io}->read_bytes(4);
    $self->{file_version} = $self->{_io}->read_bytes(5);
    $self->{complexity_level} = $self->{_io}->read_bytes(2);
    $self->{standard_type} = $self->{_io}->read_bytes(4);
    $self->{originating_station_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(10));
    $self->{file_date_time} = Nitf::DateTime->new($self->{_io}, $self, $self->{_root});
    $self->{file_title} = Encode::decode("UTF-8", $self->{_io}->read_bytes(80));
    $self->{file_security} = Nitf::Clasnfo->new($self->{_io}, $self, $self->{_root});
    $self->{file_copy_number} = Encode::decode("UTF-8", $self->{_io}->read_bytes(5));
    $self->{file_num_of_copys} = Encode::decode("UTF-8", $self->{_io}->read_bytes(5));
    $self->{encryption} = Nitf::Encrypt->new($self->{_io}, $self, $self->{_root});
    $self->{file_bg_color} = $self->{_io}->read_bytes(3);
    $self->{originator_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes(24));
    $self->{originator_phone} = Encode::decode("UTF-8", $self->{_io}->read_bytes(18));
    $self->{file_length} = Encode::decode("UTF-8", $self->{_io}->read_bytes(12));
    $self->{file_header_length} = Encode::decode("UTF-8", $self->{_io}->read_bytes(6));
    $self->{num_image_segments} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{linfo} = [];
    my $n_linfo = ($self->num_image_segments() + 0);
    for (my $i = 0; $i < $n_linfo; $i++) {
        push @{$self->{linfo}}, Nitf::LengthImageInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{num_graphics_segments} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{lnnfo} = [];
    my $n_lnnfo = ($self->num_graphics_segments() + 0);
    for (my $i = 0; $i < $n_lnnfo; $i++) {
        push @{$self->{lnnfo}}, Nitf::LengthGraphicInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{reserved_numx} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{num_text_files} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{ltnfo} = [];
    my $n_ltnfo = ($self->num_text_files() + 0);
    for (my $i = 0; $i < $n_ltnfo; $i++) {
        push @{$self->{ltnfo}}, Nitf::LengthTextInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{num_data_extension} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{ldnfo} = [];
    my $n_ldnfo = ($self->num_data_extension() + 0);
    for (my $i = 0; $i < $n_ldnfo; $i++) {
        push @{$self->{ldnfo}}, Nitf::LengthDataInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{num_reserved_extension} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{lrnfo} = [];
    my $n_lrnfo = ($self->num_reserved_extension() + 0);
    for (my $i = 0; $i < $n_lrnfo; $i++) {
        push @{$self->{lrnfo}}, Nitf::LengthReservedInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{user_defined_header} = Nitf::TreHeader->new($self->{_io}, $self, $self->{_root});
    $self->{extended_header} = Nitf::TreHeader->new($self->{_io}, $self, $self->{_root});
}

sub file_profile_name {
    my ($self) = @_;
    return $self->{file_profile_name};
}

sub file_version {
    my ($self) = @_;
    return $self->{file_version};
}

sub complexity_level {
    my ($self) = @_;
    return $self->{complexity_level};
}

sub standard_type {
    my ($self) = @_;
    return $self->{standard_type};
}

sub originating_station_id {
    my ($self) = @_;
    return $self->{originating_station_id};
}

sub file_date_time {
    my ($self) = @_;
    return $self->{file_date_time};
}

sub file_title {
    my ($self) = @_;
    return $self->{file_title};
}

sub file_security {
    my ($self) = @_;
    return $self->{file_security};
}

sub file_copy_number {
    my ($self) = @_;
    return $self->{file_copy_number};
}

sub file_num_of_copys {
    my ($self) = @_;
    return $self->{file_num_of_copys};
}

sub encryption {
    my ($self) = @_;
    return $self->{encryption};
}

sub file_bg_color {
    my ($self) = @_;
    return $self->{file_bg_color};
}

sub originator_name {
    my ($self) = @_;
    return $self->{originator_name};
}

sub originator_phone {
    my ($self) = @_;
    return $self->{originator_phone};
}

sub file_length {
    my ($self) = @_;
    return $self->{file_length};
}

sub file_header_length {
    my ($self) = @_;
    return $self->{file_header_length};
}

sub num_image_segments {
    my ($self) = @_;
    return $self->{num_image_segments};
}

sub linfo {
    my ($self) = @_;
    return $self->{linfo};
}

sub num_graphics_segments {
    my ($self) = @_;
    return $self->{num_graphics_segments};
}

sub lnnfo {
    my ($self) = @_;
    return $self->{lnnfo};
}

sub reserved_numx {
    my ($self) = @_;
    return $self->{reserved_numx};
}

sub num_text_files {
    my ($self) = @_;
    return $self->{num_text_files};
}

sub ltnfo {
    my ($self) = @_;
    return $self->{ltnfo};
}

sub num_data_extension {
    my ($self) = @_;
    return $self->{num_data_extension};
}

sub ldnfo {
    my ($self) = @_;
    return $self->{ldnfo};
}

sub num_reserved_extension {
    my ($self) = @_;
    return $self->{num_reserved_extension};
}

sub lrnfo {
    my ($self) = @_;
    return $self->{lrnfo};
}

sub user_defined_header {
    my ($self) = @_;
    return $self->{user_defined_header};
}

sub extended_header {
    my ($self) = @_;
    return $self->{extended_header};
}

########################################################################
package Nitf::ImageComment;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{_unnamed0} = Encode::decode("UTF-8", $self->{_io}->read_bytes(80));
}

sub _unnamed0 {
    my ($self) = @_;
    return $self->{_unnamed0};
}

########################################################################
package Nitf::ImageDataMask;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{blocked_img_data_offset} = $self->{_io}->read_u4be();
    $self->{bmrlnth} = $self->{_io}->read_u2be();
    $self->{tmrlnth} = $self->{_io}->read_u2be();
    $self->{tpxcdlnth} = $self->{_io}->read_u2be();
    $self->{tpxcd} = $self->{_io}->read_bytes($self->tpxcd_size());
    if ($self->has_bmr()) {
        $self->{bmrbnd} = [];
        my $n_bmrbnd = $self->bmrtmr_count();
        for (my $i = 0; $i < $n_bmrbnd; $i++) {
            push @{$self->{bmrbnd}}, $self->{_io}->read_u4be();
        }
    }
    if ($self->has_tmr()) {
        $self->{tmrbnd} = [];
        my $n_tmrbnd = $self->bmrtmr_count();
        for (my $i = 0; $i < $n_tmrbnd; $i++) {
            push @{$self->{tmrbnd}}, $self->{_io}->read_u4be();
        }
    }
}

sub bmrbnd_size {
    my ($self) = @_;
    return $self->{bmrbnd_size} if ($self->{bmrbnd_size});
    $self->{bmrbnd_size} = ($self->has_bmr() ? $self->bmrtmr_count() * 4 : 0);
    return $self->{bmrbnd_size};
}

sub bmrtmr_count {
    my ($self) = @_;
    return $self->{bmrtmr_count} if ($self->{bmrtmr_count});
    $self->{bmrtmr_count} = (($self->_parent()->image_sub_header()->num_blocks_per_row() + 0) * ($self->_parent()->image_sub_header()->num_blocks_per_col() + 0)) * ($self->_parent()->image_sub_header()->img_mode() ne "S" ? 1 : (($self->_parent()->image_sub_header()->num_bands() + 0) != 0 ? ($self->_parent()->image_sub_header()->num_bands() + 0) : ($self->_parent()->image_sub_header()->num_multispectral_bands() + 0)));
    return $self->{bmrtmr_count};
}

sub has_bmr {
    my ($self) = @_;
    return $self->{has_bmr} if ($self->{has_bmr});
    $self->{has_bmr} = $self->bmrlnth() != 0;
    return $self->{has_bmr};
}

sub has_tmr {
    my ($self) = @_;
    return $self->{has_tmr} if ($self->{has_tmr});
    $self->{has_tmr} = $self->tmrlnth() != 0;
    return $self->{has_tmr};
}

sub tmrbnd_size {
    my ($self) = @_;
    return $self->{tmrbnd_size} if ($self->{tmrbnd_size});
    $self->{tmrbnd_size} = ($self->has_tmr() ? $self->bmrtmr_count() * 4 : 0);
    return $self->{tmrbnd_size};
}

sub total_size {
    my ($self) = @_;
    return $self->{total_size} if ($self->{total_size});
    $self->{total_size} = (((((4 + 2) + 2) + 2) + $self->tpxcd_size()) + $self->bmrbnd_size()) + $self->tmrbnd_size();
    return $self->{total_size};
}

sub tpxcd_size {
    my ($self) = @_;
    return $self->{tpxcd_size} if ($self->{tpxcd_size});
    $self->{tpxcd_size} = int(($self->tpxcdlnth() % 8 == 0 ? $self->tpxcdlnth() : $self->tpxcdlnth() + (8 - $self->tpxcdlnth() % 8)) / 8);
    return $self->{tpxcd_size};
}

sub blocked_img_data_offset {
    my ($self) = @_;
    return $self->{blocked_img_data_offset};
}

sub bmrlnth {
    my ($self) = @_;
    return $self->{bmrlnth};
}

sub tmrlnth {
    my ($self) = @_;
    return $self->{tmrlnth};
}

sub tpxcdlnth {
    my ($self) = @_;
    return $self->{tpxcdlnth};
}

sub tpxcd {
    my ($self) = @_;
    return $self->{tpxcd};
}

sub bmrbnd {
    my ($self) = @_;
    return $self->{bmrbnd};
}

sub tmrbnd {
    my ($self) = @_;
    return $self->{tmrbnd};
}

########################################################################
package Nitf::ImageSegment;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{image_sub_header} = Nitf::ImageSubHeader->new($self->{_io}, $self, $self->{_root});
    if ($self->has_mask()) {
        $self->{image_data_mask} = Nitf::ImageDataMask->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->has_mask()) {
        $self->{image_data_field} = $self->{_io}->read_bytes((@{$self->_parent()->header()->linfo()}[$self->idx()]->length_image_segment() + 0) - $self->image_data_mask()->total_size());
    }
}

sub has_mask {
    my ($self) = @_;
    return $self->{has_mask} if ($self->{has_mask});
    $self->{has_mask} = substr($self->image_sub_header()->img_compression(), 0, 2 - 0) eq "MM";
    return $self->{has_mask};
}

sub image_sub_header {
    my ($self) = @_;
    return $self->{image_sub_header};
}

sub image_data_mask {
    my ($self) = @_;
    return $self->{image_data_mask};
}

sub image_data_field {
    my ($self) = @_;
    return $self->{image_data_field};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

########################################################################
package Nitf::ImageSubHeader;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{file_part_type} = $self->{_io}->read_bytes(2);
    $self->{image_id_1} = Encode::decode("UTF-8", $self->{_io}->read_bytes(10));
    $self->{image_date_time} = Nitf::DateTime->new($self->{_io}, $self, $self->{_root});
    $self->{target_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(17));
    $self->{image_id_2} = Encode::decode("UTF-8", $self->{_io}->read_bytes(80));
    $self->{image_security_classification} = Nitf::Clasnfo->new($self->{_io}, $self, $self->{_root});
    $self->{encryption} = Nitf::Encrypt->new($self->{_io}, $self, $self->{_root});
    $self->{image_source} = Encode::decode("UTF-8", $self->{_io}->read_bytes(42));
    $self->{num_sig_rows} = Encode::decode("UTF-8", $self->{_io}->read_bytes(8));
    $self->{num_sig_cols} = Encode::decode("UTF-8", $self->{_io}->read_bytes(8));
    $self->{pixel_value_type} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{image_representation} = Encode::decode("UTF-8", $self->{_io}->read_bytes(8));
    $self->{image_category} = Encode::decode("UTF-8", $self->{_io}->read_bytes(8));
    $self->{actual_bits_per_pixel_per_band} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{pixel_justification} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{image_coordinate_rep} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{image_geo_loc} = Encode::decode("UTF-8", $self->{_io}->read_bytes(60));
    $self->{num_img_comments} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{img_comments} = [];
    my $n_img_comments = ($self->num_img_comments() + 0);
    for (my $i = 0; $i < $n_img_comments; $i++) {
        push @{$self->{img_comments}}, Nitf::ImageComment->new($self->{_io}, $self, $self->{_root});
    }
    $self->{img_compression} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{compression_rate_code} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{num_bands} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    if (($self->num_bands() + 0) == 0) {
        $self->{num_multispectral_bands} = Encode::decode("UTF-8", $self->{_io}->read_bytes(5));
    }
    $self->{bands} = [];
    my $n_bands = (($self->num_bands() + 0) != 0 ? ($self->num_bands() + 0) : ($self->num_multispectral_bands() + 0));
    for (my $i = 0; $i < $n_bands; $i++) {
        push @{$self->{bands}}, Nitf::BandInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{img_sync_code} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{img_mode} = Encode::decode("UTF-8", $self->{_io}->read_bytes(1));
    $self->{num_blocks_per_row} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{num_blocks_per_col} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{num_pixels_per_block_horz} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{num_pixels_per_block_vert} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{num_pixels_per_band} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{img_display_level} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{attachment_level} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{img_location} = Encode::decode("UTF-8", $self->{_io}->read_bytes(10));
    $self->{img_magnification} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{user_def_img_data_len} = Encode::decode("UTF-8", $self->{_io}->read_bytes(5));
    if (($self->user_def_img_data_len() + 0) != 0) {
        $self->{user_def_overflow} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    }
    if (($self->user_def_img_data_len() + 0) > 2) {
        $self->{user_def_img_data} = [];
        my $n_user_def_img_data = ($self->user_def_img_data_len() + 0) - 3;
        for (my $i = 0; $i < $n_user_def_img_data; $i++) {
            push @{$self->{user_def_img_data}}, $self->{_io}->read_u1();
        }
    }
    $self->{image_extended_sub_header} = Nitf::TreHeader->new($self->{_io}, $self, $self->{_root});
}

sub file_part_type {
    my ($self) = @_;
    return $self->{file_part_type};
}

sub image_id_1 {
    my ($self) = @_;
    return $self->{image_id_1};
}

sub image_date_time {
    my ($self) = @_;
    return $self->{image_date_time};
}

sub target_id {
    my ($self) = @_;
    return $self->{target_id};
}

sub image_id_2 {
    my ($self) = @_;
    return $self->{image_id_2};
}

sub image_security_classification {
    my ($self) = @_;
    return $self->{image_security_classification};
}

sub encryption {
    my ($self) = @_;
    return $self->{encryption};
}

sub image_source {
    my ($self) = @_;
    return $self->{image_source};
}

sub num_sig_rows {
    my ($self) = @_;
    return $self->{num_sig_rows};
}

sub num_sig_cols {
    my ($self) = @_;
    return $self->{num_sig_cols};
}

sub pixel_value_type {
    my ($self) = @_;
    return $self->{pixel_value_type};
}

sub image_representation {
    my ($self) = @_;
    return $self->{image_representation};
}

sub image_category {
    my ($self) = @_;
    return $self->{image_category};
}

sub actual_bits_per_pixel_per_band {
    my ($self) = @_;
    return $self->{actual_bits_per_pixel_per_band};
}

sub pixel_justification {
    my ($self) = @_;
    return $self->{pixel_justification};
}

sub image_coordinate_rep {
    my ($self) = @_;
    return $self->{image_coordinate_rep};
}

sub image_geo_loc {
    my ($self) = @_;
    return $self->{image_geo_loc};
}

sub num_img_comments {
    my ($self) = @_;
    return $self->{num_img_comments};
}

sub img_comments {
    my ($self) = @_;
    return $self->{img_comments};
}

sub img_compression {
    my ($self) = @_;
    return $self->{img_compression};
}

sub compression_rate_code {
    my ($self) = @_;
    return $self->{compression_rate_code};
}

sub num_bands {
    my ($self) = @_;
    return $self->{num_bands};
}

sub num_multispectral_bands {
    my ($self) = @_;
    return $self->{num_multispectral_bands};
}

sub bands {
    my ($self) = @_;
    return $self->{bands};
}

sub img_sync_code {
    my ($self) = @_;
    return $self->{img_sync_code};
}

sub img_mode {
    my ($self) = @_;
    return $self->{img_mode};
}

sub num_blocks_per_row {
    my ($self) = @_;
    return $self->{num_blocks_per_row};
}

sub num_blocks_per_col {
    my ($self) = @_;
    return $self->{num_blocks_per_col};
}

sub num_pixels_per_block_horz {
    my ($self) = @_;
    return $self->{num_pixels_per_block_horz};
}

sub num_pixels_per_block_vert {
    my ($self) = @_;
    return $self->{num_pixels_per_block_vert};
}

sub num_pixels_per_band {
    my ($self) = @_;
    return $self->{num_pixels_per_band};
}

sub img_display_level {
    my ($self) = @_;
    return $self->{img_display_level};
}

sub attachment_level {
    my ($self) = @_;
    return $self->{attachment_level};
}

sub img_location {
    my ($self) = @_;
    return $self->{img_location};
}

sub img_magnification {
    my ($self) = @_;
    return $self->{img_magnification};
}

sub user_def_img_data_len {
    my ($self) = @_;
    return $self->{user_def_img_data_len};
}

sub user_def_overflow {
    my ($self) = @_;
    return $self->{user_def_overflow};
}

sub user_def_img_data {
    my ($self) = @_;
    return $self->{user_def_img_data};
}

sub image_extended_sub_header {
    my ($self) = @_;
    return $self->{image_extended_sub_header};
}

########################################################################
package Nitf::LengthDataInfo;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{length_data_extension_subheader} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{length_data_extension_segment} = Encode::decode("UTF-8", $self->{_io}->read_bytes(9));
}

sub length_data_extension_subheader {
    my ($self) = @_;
    return $self->{length_data_extension_subheader};
}

sub length_data_extension_segment {
    my ($self) = @_;
    return $self->{length_data_extension_segment};
}

########################################################################
package Nitf::LengthGraphicInfo;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{length_graphic_subheader} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{length_graphic_segment} = Encode::decode("UTF-8", $self->{_io}->read_bytes(6));
}

sub length_graphic_subheader {
    my ($self) = @_;
    return $self->{length_graphic_subheader};
}

sub length_graphic_segment {
    my ($self) = @_;
    return $self->{length_graphic_segment};
}

########################################################################
package Nitf::LengthImageInfo;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{length_image_subheader} = Encode::decode("UTF-8", $self->{_io}->read_bytes(6));
    $self->{length_image_segment} = Encode::decode("UTF-8", $self->{_io}->read_bytes(10));
}

sub length_image_subheader {
    my ($self) = @_;
    return $self->{length_image_subheader};
}

sub length_image_segment {
    my ($self) = @_;
    return $self->{length_image_segment};
}

########################################################################
package Nitf::LengthReservedInfo;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{length_reserved_extension_subheader} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{length_reserved_extension_segment} = Encode::decode("UTF-8", $self->{_io}->read_bytes(7));
}

sub length_reserved_extension_subheader {
    my ($self) = @_;
    return $self->{length_reserved_extension_subheader};
}

sub length_reserved_extension_segment {
    my ($self) = @_;
    return $self->{length_reserved_extension_segment};
}

########################################################################
package Nitf::LengthTextInfo;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{length_text_subheader} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{length_text_segment} = Encode::decode("UTF-8", $self->{_io}->read_bytes(5));
}

sub length_text_subheader {
    my ($self) = @_;
    return $self->{length_text_subheader};
}

sub length_text_segment {
    my ($self) = @_;
    return $self->{length_text_segment};
}

########################################################################
package Nitf::ReservedExtensionSegment;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{_raw_reserved_sub_header} = $self->{_io}->read_bytes((@{$self->_parent()->header()->lrnfo()}[$self->idx()]->length_reserved_extension_subheader() + 0));
    my $io__raw_reserved_sub_header = IO::KaitaiStruct::Stream->new($self->{_raw_reserved_sub_header});
    $self->{reserved_sub_header} = Nitf::ReservedSubHeader->new($io__raw_reserved_sub_header, $self, $self->{_root});
    $self->{reserved_data_field} = $self->{_io}->read_bytes((@{$self->_parent()->header()->lrnfo()}[$self->idx()]->length_reserved_extension_segment() + 0));
}

sub reserved_sub_header {
    my ($self) = @_;
    return $self->{reserved_sub_header};
}

sub reserved_data_field {
    my ($self) = @_;
    return $self->{reserved_data_field};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

sub _raw_reserved_sub_header {
    my ($self) = @_;
    return $self->{_raw_reserved_sub_header};
}

########################################################################
package Nitf::ReservedSubHeader;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{file_part_type_re} = $self->{_io}->read_bytes(2);
    $self->{res_type_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(25));
    $self->{res_version} = Encode::decode("UTF-8", $self->{_io}->read_bytes(2));
    $self->{reclasnfo} = Nitf::Clasnfo->new($self->{_io}, $self, $self->{_root});
    $self->{res_user_defined_subheader_length} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{res_user_defined_subheader_fields} = Encode::decode("UTF-8", $self->{_io}->read_bytes(($self->res_user_defined_subheader_length() + 0)));
    $self->{res_user_defined_data} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub file_part_type_re {
    my ($self) = @_;
    return $self->{file_part_type_re};
}

sub res_type_id {
    my ($self) = @_;
    return $self->{res_type_id};
}

sub res_version {
    my ($self) = @_;
    return $self->{res_version};
}

sub reclasnfo {
    my ($self) = @_;
    return $self->{reclasnfo};
}

sub res_user_defined_subheader_length {
    my ($self) = @_;
    return $self->{res_user_defined_subheader_length};
}

sub res_user_defined_subheader_fields {
    my ($self) = @_;
    return $self->{res_user_defined_subheader_fields};
}

sub res_user_defined_data {
    my ($self) = @_;
    return $self->{res_user_defined_data};
}

########################################################################
package Nitf::TextSegment;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{text_sub_header} = $self->{_io}->read_bytes(1);
    $self->{text_data_field} = $self->{_io}->read_bytes((@{$self->_parent()->header()->ltnfo()}[$self->idx()]->length_text_segment() + 0));
}

sub text_sub_header {
    my ($self) = @_;
    return $self->{text_sub_header};
}

sub text_data_field {
    my ($self) = @_;
    return $self->{text_data_field};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

########################################################################
package Nitf::TextSubHeader;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{text_date_time} = Encode::decode("UTF-8", $self->{_io}->read_bytes(14));
    $self->{text_title} = Encode::decode("UTF-8", $self->{_io}->read_bytes(80));
    $self->{text_security_class} = Nitf::Clasnfo->new($self->{_io}, $self, $self->{_root});
    $self->{encryp} = Nitf::Encrypt->new($self->{_io}, $self, $self->{_root});
    $self->{text_format} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    $self->{text_extended_sub_header} = Nitf::TreHeader->new($self->{_io}, $self, $self->{_root});
}

sub text_date_time {
    my ($self) = @_;
    return $self->{text_date_time};
}

sub text_title {
    my ($self) = @_;
    return $self->{text_title};
}

sub text_security_class {
    my ($self) = @_;
    return $self->{text_security_class};
}

sub encryp {
    my ($self) = @_;
    return $self->{encryp};
}

sub text_format {
    my ($self) = @_;
    return $self->{text_format};
}

sub text_extended_sub_header {
    my ($self) = @_;
    return $self->{text_extended_sub_header};
}

########################################################################
package Nitf::Tre;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{extension_type_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(6));
    $self->{edata_length} = Encode::decode("UTF-8", $self->{_io}->read_bytes(5));
    $self->{edata} = Encode::decode("UTF-8", $self->{_io}->read_bytes(($self->edata_length() + 0)));
}

sub extension_type_id {
    my ($self) = @_;
    return $self->{extension_type_id};
}

sub edata_length {
    my ($self) = @_;
    return $self->{edata_length};
}

sub edata {
    my ($self) = @_;
    return $self->{edata};
}

########################################################################
package Nitf::TreHeader;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header_data_length} = Encode::decode("UTF-8", $self->{_io}->read_bytes(5));
    if (($self->header_data_length() + 0) != 0) {
        $self->{header_overflow} = Encode::decode("UTF-8", $self->{_io}->read_bytes(3));
    }
    if (($self->header_data_length() + 0) > 2) {
        $self->{header_data} = [];
        my $n_header_data = ($self->header_data_length() + 0) - 3;
        for (my $i = 0; $i < $n_header_data; $i++) {
            push @{$self->{header_data}}, $self->{_io}->read_u1();
        }
    }
}

sub header_data_length {
    my ($self) = @_;
    return $self->{header_data_length};
}

sub header_overflow {
    my ($self) = @_;
    return $self->{header_overflow};
}

sub header_data {
    my ($self) = @_;
    return $self->{header_data};
}

1;
