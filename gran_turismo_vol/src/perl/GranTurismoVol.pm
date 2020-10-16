# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package GranTurismoVol;

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

    $self->{magic} = $self->{_io}->read_bytes(8);
    $self->{num_files} = $self->{_io}->read_u2le();
    $self->{num_entries} = $self->{_io}->read_u2le();
    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{offsets} = ();
    my $n_offsets = $self->num_files();
    for (my $i = 0; $i < $n_offsets; $i++) {
        $self->{offsets}[$i] = $self->{_io}->read_u4le();
    }
}

sub ofs_dir {
    my ($self) = @_;
    return $self->{ofs_dir} if ($self->{ofs_dir});
    $self->{ofs_dir} = @{$self->offsets()}[1];
    return $self->{ofs_dir};
}

sub files {
    my ($self) = @_;
    return $self->{files} if ($self->{files});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->ofs_dir() & 4294965248));
    $self->{files} = ();
    my $n_files = $self->_root()->num_entries();
    for (my $i = 0; $i < $n_files; $i++) {
        $self->{files}[$i] = GranTurismoVol::FileInfo->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{files};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub num_files {
    my ($self) = @_;
    return $self->{num_files};
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub offsets {
    my ($self) = @_;
    return $self->{offsets};
}

########################################################################
package GranTurismoVol::FileInfo;

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

    $self->{timestamp} = $self->{_io}->read_u4le();
    $self->{offset_idx} = $self->{_io}->read_u2le();
    $self->{flags} = $self->{_io}->read_u1();
    $self->{name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate(IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(25), 0), 0, 0));
}

sub size {
    my ($self) = @_;
    return $self->{size} if ($self->{size});
    $self->{size} = ((@{$self->_root()->offsets()}[($self->offset_idx() + 1)] & 4294965248) - @{$self->_root()->offsets()}[$self->offset_idx()]);
    return $self->{size};
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    if (!($self->is_dir())) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek((@{$self->_root()->offsets()}[$self->offset_idx()] & 4294965248));
        $self->{body} = $self->{_io}->read_bytes($self->size());
        $self->{_io}->seek($_pos);
    }
    return $self->{body};
}

sub is_dir {
    my ($self) = @_;
    return $self->{is_dir} if ($self->{is_dir});
    $self->{is_dir} = ($self->flags() & 1) != 0;
    return $self->{is_dir};
}

sub is_last_entry {
    my ($self) = @_;
    return $self->{is_last_entry} if ($self->{is_last_entry});
    $self->{is_last_entry} = ($self->flags() & 128) != 0;
    return $self->{is_last_entry};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub offset_idx {
    my ($self) = @_;
    return $self->{offset_idx};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

1;
