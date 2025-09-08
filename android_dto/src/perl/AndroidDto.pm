# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package AndroidDto;

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

    $self->{header} = AndroidDto::DtTableHeader->new($self->{_io}, $self, $self->{_root});
    $self->{entries} = [];
    my $n_entries = $self->header()->dt_entry_count();
    for (my $i = 0; $i < $n_entries; $i++) {
        push @{$self->{entries}}, AndroidDto::DtTableEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package AndroidDto::DtTableEntry;

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

    $self->{dt_size} = $self->{_io}->read_u4be();
    $self->{dt_offset} = $self->{_io}->read_u4be();
    $self->{id} = $self->{_io}->read_u4be();
    $self->{rev} = $self->{_io}->read_u4be();
    $self->{custom} = [];
    my $n_custom = 4;
    for (my $i = 0; $i < $n_custom; $i++) {
        push @{$self->{custom}}, $self->{_io}->read_u4be();
    }
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->dt_offset());
    $self->{body} = $io->read_bytes($self->dt_size());
    $io->seek($_pos);
    return $self->{body};
}

sub dt_size {
    my ($self) = @_;
    return $self->{dt_size};
}

sub dt_offset {
    my ($self) = @_;
    return $self->{dt_offset};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub rev {
    my ($self) = @_;
    return $self->{rev};
}

sub custom {
    my ($self) = @_;
    return $self->{custom};
}

########################################################################
package AndroidDto::DtTableHeader;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{total_size} = $self->{_io}->read_u4be();
    $self->{header_size} = $self->{_io}->read_u4be();
    $self->{dt_entry_size} = $self->{_io}->read_u4be();
    $self->{dt_entry_count} = $self->{_io}->read_u4be();
    $self->{dt_entries_offset} = $self->{_io}->read_u4be();
    $self->{page_size} = $self->{_io}->read_u4be();
    $self->{version} = $self->{_io}->read_u4be();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub total_size {
    my ($self) = @_;
    return $self->{total_size};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub dt_entry_size {
    my ($self) = @_;
    return $self->{dt_entry_size};
}

sub dt_entry_count {
    my ($self) = @_;
    return $self->{dt_entry_count};
}

sub dt_entries_offset {
    my ($self) = @_;
    return $self->{dt_entries_offset};
}

sub page_size {
    my ($self) = @_;
    return $self->{page_size};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

1;
