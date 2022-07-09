# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package HeroesOfMightAndMagicAgg;

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

    $self->{num_files} = $self->{_io}->read_u2le();
    $self->{entries} = ();
    my $n_entries = $self->num_files();
    for (my $i = 0; $i < $n_entries; $i++) {
        push @{$self->{entries}}, HeroesOfMightAndMagicAgg::Entry->new($self->{_io}, $self, $self->{_root});
    }
}

sub filenames {
    my ($self) = @_;
    return $self->{filenames} if ($self->{filenames});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek((@{$self->entries()}[-1]->offset() + @{$self->entries()}[-1]->size()));
    $self->{_raw_filenames} = ();
    $self->{filenames} = ();
    my $n_filenames = $self->num_files();
    for (my $i = 0; $i < $n_filenames; $i++) {
        push @{$self->{_raw_filenames}}, $self->{_io}->read_bytes(15);
        my $io__raw_filenames = IO::KaitaiStruct::Stream->new($self->{_raw_filenames}[$i]);
        push @{$self->{filenames}}, HeroesOfMightAndMagicAgg::Filename->new($io__raw_filenames, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{filenames};
}

sub num_files {
    my ($self) = @_;
    return $self->{num_files};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

sub _raw_filenames {
    my ($self) = @_;
    return $self->{_raw_filenames};
}

########################################################################
package HeroesOfMightAndMagicAgg::Entry;

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

    $self->{hash} = $self->{_io}->read_u2le();
    $self->{offset} = $self->{_io}->read_u4le();
    $self->{size} = $self->{_io}->read_u4le();
    $self->{size2} = $self->{_io}->read_u4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->offset());
    $self->{body} = $self->{_io}->read_bytes($self->size());
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub hash {
    my ($self) = @_;
    return $self->{hash};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub size2 {
    my ($self) = @_;
    return $self->{size2};
}

########################################################################
package HeroesOfMightAndMagicAgg::Filename;

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

    $self->{str} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

1;
