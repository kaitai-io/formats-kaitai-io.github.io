# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package ZxSpectrumTap;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FLAG_ENUM_HEADER = 0;
our $FLAG_ENUM_DATA = 255;

our $HEADER_TYPE_ENUM_PROGRAM = 0;
our $HEADER_TYPE_ENUM_NUM_ARRAY = 1;
our $HEADER_TYPE_ENUM_CHAR_ARRAY = 2;
our $HEADER_TYPE_ENUM_BYTES = 3;

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

    $self->{blocks} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{blocks}}, ZxSpectrumTap::Block->new($self->{_io}, $self, $self->{_root});
    }
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

########################################################################
package ZxSpectrumTap::ArrayParams;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{var_name} = $self->{_io}->read_u1();
    $self->{reserved1} = $self->{_io}->read_bytes(2);
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub var_name {
    my ($self) = @_;
    return $self->{var_name};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

########################################################################
package ZxSpectrumTap::Block;

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

    $self->{len_block} = $self->{_io}->read_u2le();
    $self->{flag} = $self->{_io}->read_u1();
    if ( (($self->len_block() == 19) && ($self->flag() == $ZxSpectrumTap::FLAG_ENUM_HEADER)) ) {
        $self->{header} = ZxSpectrumTap::Header->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->len_block() == 19) {
        $self->{data} = $self->{_io}->read_bytes($self->header()->len_data() + 4);
    }
    if ($self->flag() == $ZxSpectrumTap::FLAG_ENUM_DATA) {
        $self->{headerless_data} = $self->{_io}->read_bytes($self->len_block() - 1);
    }
}

sub len_block {
    my ($self) = @_;
    return $self->{len_block};
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub headerless_data {
    my ($self) = @_;
    return $self->{headerless_data};
}

########################################################################
package ZxSpectrumTap::BytesParams;

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

    $self->{start_address} = $self->{_io}->read_u2le();
    $self->{reserved} = $self->{_io}->read_bytes(2);
}

sub start_address {
    my ($self) = @_;
    return $self->{start_address};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package ZxSpectrumTap::Header;

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

    $self->{header_type} = $self->{_io}->read_u1();
    $self->{filename} = IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(10), 32);
    $self->{len_data} = $self->{_io}->read_u2le();
    my $_on = $self->header_type();
    if ($_on == $ZxSpectrumTap::HEADER_TYPE_ENUM_BYTES) {
        $self->{params} = ZxSpectrumTap::BytesParams->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $ZxSpectrumTap::HEADER_TYPE_ENUM_CHAR_ARRAY) {
        $self->{params} = ZxSpectrumTap::ArrayParams->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $ZxSpectrumTap::HEADER_TYPE_ENUM_NUM_ARRAY) {
        $self->{params} = ZxSpectrumTap::ArrayParams->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $ZxSpectrumTap::HEADER_TYPE_ENUM_PROGRAM) {
        $self->{params} = ZxSpectrumTap::ProgramParams->new($self->{_io}, $self, $self->{_root});
    }
    $self->{checksum} = $self->{_io}->read_u1();
}

sub header_type {
    my ($self) = @_;
    return $self->{header_type};
}

sub filename {
    my ($self) = @_;
    return $self->{filename};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub params {
    my ($self) = @_;
    return $self->{params};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

########################################################################
package ZxSpectrumTap::ProgramParams;

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

    $self->{autostart_line} = $self->{_io}->read_u2le();
    $self->{len_program} = $self->{_io}->read_u2le();
}

sub autostart_line {
    my ($self) = @_;
    return $self->{autostart_line};
}

sub len_program {
    my ($self) = @_;
    return $self->{len_program};
}

1;
