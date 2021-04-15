# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Gif;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $BLOCK_TYPE_EXTENSION = 33;
our $BLOCK_TYPE_LOCAL_IMAGE_DESCRIPTOR = 44;
our $BLOCK_TYPE_END_OF_FILE = 59;

our $EXTENSION_LABEL_GRAPHIC_CONTROL = 249;
our $EXTENSION_LABEL_COMMENT = 254;
our $EXTENSION_LABEL_APPLICATION = 255;

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

    $self->{hdr} = Gif::Header->new($self->{_io}, $self, $self->{_root});
    $self->{logical_screen_descriptor} = Gif::LogicalScreenDescriptorStruct->new($self->{_io}, $self, $self->{_root});
    if ($self->logical_screen_descriptor()->has_color_table()) {
        $self->{_raw_global_color_table} = $self->{_io}->read_bytes(($self->logical_screen_descriptor()->color_table_size() * 3));
        my $io__raw_global_color_table = IO::KaitaiStruct::Stream->new($self->{_raw_global_color_table});
        $self->{global_color_table} = Gif::ColorTable->new($io__raw_global_color_table, $self, $self->{_root});
    }
    $self->{blocks} = ();
    do {
        $_ = Gif::Block->new($self->{_io}, $self, $self->{_root});
        push @{$self->{blocks}}, $_;
    } until ( (($self->_io()->is_eof()) || ($_->block_type() == $Gif::BLOCK_TYPE_END_OF_FILE)) );
}

sub hdr {
    my ($self) = @_;
    return $self->{hdr};
}

sub logical_screen_descriptor {
    my ($self) = @_;
    return $self->{logical_screen_descriptor};
}

sub global_color_table {
    my ($self) = @_;
    return $self->{global_color_table};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

sub _raw_global_color_table {
    my ($self) = @_;
    return $self->{_raw_global_color_table};
}

########################################################################
package Gif::ImageData;

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

    $self->{lzw_min_code_size} = $self->{_io}->read_u1();
    $self->{subblocks} = Gif::Subblocks->new($self->{_io}, $self, $self->{_root});
}

sub lzw_min_code_size {
    my ($self) = @_;
    return $self->{lzw_min_code_size};
}

sub subblocks {
    my ($self) = @_;
    return $self->{subblocks};
}

########################################################################
package Gif::ColorTableEntry;

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

    $self->{red} = $self->{_io}->read_u1();
    $self->{green} = $self->{_io}->read_u1();
    $self->{blue} = $self->{_io}->read_u1();
}

sub red {
    my ($self) = @_;
    return $self->{red};
}

sub green {
    my ($self) = @_;
    return $self->{green};
}

sub blue {
    my ($self) = @_;
    return $self->{blue};
}

########################################################################
package Gif::LogicalScreenDescriptorStruct;

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

    $self->{screen_width} = $self->{_io}->read_u2le();
    $self->{screen_height} = $self->{_io}->read_u2le();
    $self->{flags} = $self->{_io}->read_u1();
    $self->{bg_color_index} = $self->{_io}->read_u1();
    $self->{pixel_aspect_ratio} = $self->{_io}->read_u1();
}

sub has_color_table {
    my ($self) = @_;
    return $self->{has_color_table} if ($self->{has_color_table});
    $self->{has_color_table} = ($self->flags() & 128) != 0;
    return $self->{has_color_table};
}

sub color_table_size {
    my ($self) = @_;
    return $self->{color_table_size} if ($self->{color_table_size});
    $self->{color_table_size} = (2 << ($self->flags() & 7));
    return $self->{color_table_size};
}

sub screen_width {
    my ($self) = @_;
    return $self->{screen_width};
}

sub screen_height {
    my ($self) = @_;
    return $self->{screen_height};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub bg_color_index {
    my ($self) = @_;
    return $self->{bg_color_index};
}

sub pixel_aspect_ratio {
    my ($self) = @_;
    return $self->{pixel_aspect_ratio};
}

########################################################################
package Gif::LocalImageDescriptor;

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

    $self->{left} = $self->{_io}->read_u2le();
    $self->{top} = $self->{_io}->read_u2le();
    $self->{width} = $self->{_io}->read_u2le();
    $self->{height} = $self->{_io}->read_u2le();
    $self->{flags} = $self->{_io}->read_u1();
    if ($self->has_color_table()) {
        $self->{_raw_local_color_table} = $self->{_io}->read_bytes(($self->color_table_size() * 3));
        my $io__raw_local_color_table = IO::KaitaiStruct::Stream->new($self->{_raw_local_color_table});
        $self->{local_color_table} = Gif::ColorTable->new($io__raw_local_color_table, $self, $self->{_root});
    }
    $self->{image_data} = Gif::ImageData->new($self->{_io}, $self, $self->{_root});
}

sub has_color_table {
    my ($self) = @_;
    return $self->{has_color_table} if ($self->{has_color_table});
    $self->{has_color_table} = ($self->flags() & 128) != 0;
    return $self->{has_color_table};
}

sub has_interlace {
    my ($self) = @_;
    return $self->{has_interlace} if ($self->{has_interlace});
    $self->{has_interlace} = ($self->flags() & 64) != 0;
    return $self->{has_interlace};
}

sub has_sorted_color_table {
    my ($self) = @_;
    return $self->{has_sorted_color_table} if ($self->{has_sorted_color_table});
    $self->{has_sorted_color_table} = ($self->flags() & 32) != 0;
    return $self->{has_sorted_color_table};
}

sub color_table_size {
    my ($self) = @_;
    return $self->{color_table_size} if ($self->{color_table_size});
    $self->{color_table_size} = (2 << ($self->flags() & 7));
    return $self->{color_table_size};
}

sub left {
    my ($self) = @_;
    return $self->{left};
}

sub top {
    my ($self) = @_;
    return $self->{top};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub local_color_table {
    my ($self) = @_;
    return $self->{local_color_table};
}

sub image_data {
    my ($self) = @_;
    return $self->{image_data};
}

sub _raw_local_color_table {
    my ($self) = @_;
    return $self->{_raw_local_color_table};
}

########################################################################
package Gif::Block;

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

    $self->{block_type} = $self->{_io}->read_u1();
    my $_on = $self->block_type();
    if ($_on == $Gif::BLOCK_TYPE_EXTENSION) {
        $self->{body} = Gif::Extension->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Gif::BLOCK_TYPE_LOCAL_IMAGE_DESCRIPTOR) {
        $self->{body} = Gif::LocalImageDescriptor->new($self->{_io}, $self, $self->{_root});
    }
}

sub block_type {
    my ($self) = @_;
    return $self->{block_type};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package Gif::ColorTable;

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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Gif::ColorTableEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Gif::Header;

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

    $self->{magic} = $self->{_io}->read_bytes(3);
    $self->{version} = Encode::decode("ASCII", $self->{_io}->read_bytes(3));
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

########################################################################
package Gif::ExtGraphicControl;

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

    $self->{block_size} = $self->{_io}->read_bytes(1);
    $self->{flags} = $self->{_io}->read_u1();
    $self->{delay_time} = $self->{_io}->read_u2le();
    $self->{transparent_idx} = $self->{_io}->read_u1();
    $self->{terminator} = $self->{_io}->read_bytes(1);
}

sub transparent_color_flag {
    my ($self) = @_;
    return $self->{transparent_color_flag} if ($self->{transparent_color_flag});
    $self->{transparent_color_flag} = ($self->flags() & 1) != 0;
    return $self->{transparent_color_flag};
}

sub user_input_flag {
    my ($self) = @_;
    return $self->{user_input_flag} if ($self->{user_input_flag});
    $self->{user_input_flag} = ($self->flags() & 2) != 0;
    return $self->{user_input_flag};
}

sub block_size {
    my ($self) = @_;
    return $self->{block_size};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub delay_time {
    my ($self) = @_;
    return $self->{delay_time};
}

sub transparent_idx {
    my ($self) = @_;
    return $self->{transparent_idx};
}

sub terminator {
    my ($self) = @_;
    return $self->{terminator};
}

########################################################################
package Gif::Subblock;

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

    $self->{len_bytes} = $self->{_io}->read_u1();
    $self->{bytes} = $self->{_io}->read_bytes($self->len_bytes());
}

sub len_bytes {
    my ($self) = @_;
    return $self->{len_bytes};
}

sub bytes {
    my ($self) = @_;
    return $self->{bytes};
}

########################################################################
package Gif::ApplicationId;

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

    $self->{len_bytes} = $self->{_io}->read_u1();
    $self->{application_identifier} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
    $self->{application_auth_code} = $self->{_io}->read_bytes(3);
}

sub len_bytes {
    my ($self) = @_;
    return $self->{len_bytes};
}

sub application_identifier {
    my ($self) = @_;
    return $self->{application_identifier};
}

sub application_auth_code {
    my ($self) = @_;
    return $self->{application_auth_code};
}

########################################################################
package Gif::ExtApplication;

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

    $self->{application_id} = Gif::ApplicationId->new($self->{_io}, $self, $self->{_root});
    $self->{subblocks} = ();
    do {
        $_ = Gif::Subblock->new($self->{_io}, $self, $self->{_root});
        push @{$self->{subblocks}}, $_;
    } until ($_->len_bytes() == 0);
}

sub application_id {
    my ($self) = @_;
    return $self->{application_id};
}

sub subblocks {
    my ($self) = @_;
    return $self->{subblocks};
}

########################################################################
package Gif::Subblocks;

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

    $self->{entries} = ();
    do {
        $_ = Gif::Subblock->new($self->{_io}, $self, $self->{_root});
        push @{$self->{entries}}, $_;
    } until ($_->len_bytes() == 0);
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Gif::Extension;

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

    $self->{label} = $self->{_io}->read_u1();
    my $_on = $self->label();
    if ($_on == $Gif::EXTENSION_LABEL_APPLICATION) {
        $self->{body} = Gif::ExtApplication->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Gif::EXTENSION_LABEL_COMMENT) {
        $self->{body} = Gif::Subblocks->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Gif::EXTENSION_LABEL_GRAPHIC_CONTROL) {
        $self->{body} = Gif::ExtGraphicControl->new($self->{_io}, $self, $self->{_root});
    }
    else {
        $self->{body} = Gif::Subblocks->new($self->{_io}, $self, $self->{_root});
    }
}

sub label {
    my ($self) = @_;
    return $self->{label};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;
