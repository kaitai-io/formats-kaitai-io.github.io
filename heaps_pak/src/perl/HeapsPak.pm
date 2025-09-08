# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package HeapsPak;

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

    $self->{header} = HeapsPak::Header->new($self->{_io}, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

########################################################################
package HeapsPak::Header;

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

    $self->{magic1} = $self->{_io}->read_bytes(3);
    $self->{version} = $self->{_io}->read_u1();
    $self->{len_header} = $self->{_io}->read_u4le();
    $self->{len_data} = $self->{_io}->read_u4le();
    $self->{_raw_root_entry} = $self->{_io}->read_bytes($self->len_header() - 16);
    my $io__raw_root_entry = IO::KaitaiStruct::Stream->new($self->{_raw_root_entry});
    $self->{root_entry} = HeapsPak::Header::Entry->new($io__raw_root_entry, $self, $self->{_root});
    $self->{magic2} = $self->{_io}->read_bytes(4);
}

sub magic1 {
    my ($self) = @_;
    return $self->{magic1};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub root_entry {
    my ($self) = @_;
    return $self->{root_entry};
}

sub magic2 {
    my ($self) = @_;
    return $self->{magic2};
}

sub _raw_root_entry {
    my ($self) = @_;
    return $self->{_raw_root_entry};
}

########################################################################
package HeapsPak::Header::Dir;

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

    $self->{num_entries} = $self->{_io}->read_u4le();
    $self->{entries} = [];
    my $n_entries = $self->num_entries();
    for (my $i = 0; $i < $n_entries; $i++) {
        push @{$self->{entries}}, HeapsPak::Header::Entry->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package HeapsPak::Header::Entry;

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

    $self->{len_name} = $self->{_io}->read_u1();
    $self->{name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_name()));
    $self->{flags} = HeapsPak::Header::Entry::Flags->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->flags()->is_dir();
    if ($_on == 0) {
        $self->{body} = HeapsPak::Header::File->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 1) {
        $self->{body} = HeapsPak::Header::Dir->new($self->{_io}, $self, $self->{_root});
    }
}

sub len_name {
    my ($self) = @_;
    return $self->{len_name};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package HeapsPak::Header::Entry::Flags;

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

    $self->{unused} = $self->{_io}->read_bits_int_be(7);
    $self->{is_dir} = $self->{_io}->read_bits_int_be(1);
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

sub is_dir {
    my ($self) = @_;
    return $self->{is_dir};
}

########################################################################
package HeapsPak::Header::File;

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

    $self->{ofs_data} = $self->{_io}->read_u4le();
    $self->{len_data} = $self->{_io}->read_u4le();
    $self->{checksum} = $self->{_io}->read_bytes(4);
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->_root()->header()->len_header() + $self->ofs_data());
    $self->{data} = $io->read_bytes($self->len_data());
    $io->seek($_pos);
    return $self->{data};
}

sub ofs_data {
    my ($self) = @_;
    return $self->{ofs_data};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

1;
