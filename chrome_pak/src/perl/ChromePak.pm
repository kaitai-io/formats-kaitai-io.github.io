# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package ChromePak;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ENCODINGS_BINARY = 0;
our $ENCODINGS_UTF8 = 1;
our $ENCODINGS_UTF16 = 2;

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

    $self->{version} = $self->{_io}->read_u4le();
    if ($self->version() == 4) {
        $self->{num_resources_v4} = $self->{_io}->read_u4le();
    }
    $self->{encoding} = $self->{_io}->read_u1();
    if ($self->version() == 5) {
        $self->{v5_part} = ChromePak::HeaderV5Part->new($self->{_io}, $self, $self->{_root});
    }
    $self->{resources} = ();
    my $n_resources = ($self->num_resources() + 1);
    for (my $i = 0; $i < $n_resources; $i++) {
        push @{$self->{resources}}, ChromePak::Resource->new($self->{_io}, $self, $self->{_root});
    }
    $self->{aliases} = ();
    my $n_aliases = $self->num_aliases();
    for (my $i = 0; $i < $n_aliases; $i++) {
        push @{$self->{aliases}}, ChromePak::Alias->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_resources {
    my ($self) = @_;
    return $self->{num_resources} if ($self->{num_resources});
    $self->{num_resources} = ($self->version() == 5 ? $self->v5_part()->num_resources() : $self->num_resources_v4());
    return $self->{num_resources};
}

sub num_aliases {
    my ($self) = @_;
    return $self->{num_aliases} if ($self->{num_aliases});
    $self->{num_aliases} = ($self->version() == 5 ? $self->v5_part()->num_aliases() : 0);
    return $self->{num_aliases};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub num_resources_v4 {
    my ($self) = @_;
    return $self->{num_resources_v4};
}

sub encoding {
    my ($self) = @_;
    return $self->{encoding};
}

sub v5_part {
    my ($self) = @_;
    return $self->{v5_part};
}

sub resources {
    my ($self) = @_;
    return $self->{resources};
}

sub aliases {
    my ($self) = @_;
    return $self->{aliases};
}

########################################################################
package ChromePak::HeaderV5Part;

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

    $self->{encoding_padding} = $self->{_io}->read_bytes(3);
    $self->{num_resources} = $self->{_io}->read_u2le();
    $self->{num_aliases} = $self->{_io}->read_u2le();
}

sub encoding_padding {
    my ($self) = @_;
    return $self->{encoding_padding};
}

sub num_resources {
    my ($self) = @_;
    return $self->{num_resources};
}

sub num_aliases {
    my ($self) = @_;
    return $self->{num_aliases};
}

########################################################################
package ChromePak::Resource;

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

    $self->{id} = $self->{_io}->read_u2le();
    $self->{ofs_body} = $self->{_io}->read_u4le();
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body} if ($self->{len_body});
    if ($self->has_body()) {
        $self->{len_body} = (@{$self->_parent()->resources()}[($self->idx() + 1)]->ofs_body() - $self->ofs_body());
    }
    return $self->{len_body};
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    if ($self->has_body()) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_body());
        $self->{body} = $self->{_io}->read_bytes($self->len_body());
        $self->{_io}->seek($_pos);
    }
    return $self->{body};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

sub has_body {
    my ($self) = @_;
    return $self->{has_body};
}

########################################################################
package ChromePak::Alias;

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

    $self->{id} = $self->{_io}->read_u2le();
    $self->{resource_idx} = $self->{_io}->read_u2le();
}

sub resource {
    my ($self) = @_;
    return $self->{resource} if ($self->{resource});
    $self->{resource} = @{$self->_parent()->resources()}[$self->resource_idx()];
    return $self->{resource};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub resource_idx {
    my ($self) = @_;
    return $self->{resource_idx};
}

1;
