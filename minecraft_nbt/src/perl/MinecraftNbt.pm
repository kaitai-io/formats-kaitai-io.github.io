# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package MinecraftNbt;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TAG_END = 0;
our $TAG_BYTE = 1;
our $TAG_SHORT = 2;
our $TAG_INT = 3;
our $TAG_LONG = 4;
our $TAG_FLOAT = 5;
our $TAG_DOUBLE = 6;
our $TAG_BYTE_ARRAY = 7;
our $TAG_STRING = 8;
our $TAG_LIST = 9;
our $TAG_COMPOUND = 10;
our $TAG_INT_ARRAY = 11;
our $TAG_LONG_ARRAY = 12;

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

    if ( (($self->root_type() == $MinecraftNbt::TAG_END) && (0)) ) {
        $self->{root_check} = $self->{_io}->read_bytes(0);
    }
    $self->{root} = MinecraftNbt::NamedTag->new($self->{_io}, $self, $self->{_root});
}

sub root_type {
    my ($self) = @_;
    return $self->{root_type} if ($self->{root_type});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{root_type} = $self->{_io}->read_u1();
    $self->{_io}->seek($_pos);
    return $self->{root_type};
}

sub root_check {
    my ($self) = @_;
    return $self->{root_check};
}

sub root {
    my ($self) = @_;
    return $self->{root};
}

########################################################################
package MinecraftNbt::TagLongArray;

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

    $self->{num_tags} = $self->{_io}->read_s4be();
    $self->{tags} = ();
    my $n_tags = $self->num_tags();
    for (my $i = 0; $i < $n_tags; $i++) {
        $self->{tags}[$i] = $self->{_io}->read_s8be();
    }
}

sub tags_type {
    my ($self) = @_;
    return $self->{tags_type} if ($self->{tags_type});
    $self->{tags_type} = $MinecraftNbt::TAG_LONG;
    return $self->{tags_type};
}

sub num_tags {
    my ($self) = @_;
    return $self->{num_tags};
}

sub tags {
    my ($self) = @_;
    return $self->{tags};
}

########################################################################
package MinecraftNbt::TagByteArray;

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

    $self->{len_data} = $self->{_io}->read_s4be();
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package MinecraftNbt::TagIntArray;

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

    $self->{num_tags} = $self->{_io}->read_s4be();
    $self->{tags} = ();
    my $n_tags = $self->num_tags();
    for (my $i = 0; $i < $n_tags; $i++) {
        $self->{tags}[$i] = $self->{_io}->read_s4be();
    }
}

sub tags_type {
    my ($self) = @_;
    return $self->{tags_type} if ($self->{tags_type});
    $self->{tags_type} = $MinecraftNbt::TAG_INT;
    return $self->{tags_type};
}

sub num_tags {
    my ($self) = @_;
    return $self->{num_tags};
}

sub tags {
    my ($self) = @_;
    return $self->{tags};
}

########################################################################
package MinecraftNbt::TagList;

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

    $self->{tags_type} = $self->{_io}->read_u1();
    $self->{num_tags} = $self->{_io}->read_s4be();
    $self->{tags} = ();
    my $n_tags = $self->num_tags();
    for (my $i = 0; $i < $n_tags; $i++) {
        my $_on = $self->tags_type();
        if ($_on == $MinecraftNbt::TAG_LONG_ARRAY) {
            $self->{tags}[$i] = MinecraftNbt::TagLongArray->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_COMPOUND) {
            $self->{tags}[$i] = MinecraftNbt::TagCompound->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_DOUBLE) {
            $self->{tags}[$i] = $self->{_io}->read_f8be();
        }
        elsif ($_on == $MinecraftNbt::TAG_LIST) {
            $self->{tags}[$i] = MinecraftNbt::TagList->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_FLOAT) {
            $self->{tags}[$i] = $self->{_io}->read_f4be();
        }
        elsif ($_on == $MinecraftNbt::TAG_SHORT) {
            $self->{tags}[$i] = $self->{_io}->read_s2be();
        }
        elsif ($_on == $MinecraftNbt::TAG_INT) {
            $self->{tags}[$i] = $self->{_io}->read_s4be();
        }
        elsif ($_on == $MinecraftNbt::TAG_BYTE_ARRAY) {
            $self->{tags}[$i] = MinecraftNbt::TagByteArray->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_BYTE) {
            $self->{tags}[$i] = $self->{_io}->read_s1();
        }
        elsif ($_on == $MinecraftNbt::TAG_INT_ARRAY) {
            $self->{tags}[$i] = MinecraftNbt::TagIntArray->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_STRING) {
            $self->{tags}[$i] = MinecraftNbt::TagString->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_LONG) {
            $self->{tags}[$i] = $self->{_io}->read_s8be();
        }
    }
}

sub tags_type {
    my ($self) = @_;
    return $self->{tags_type};
}

sub num_tags {
    my ($self) = @_;
    return $self->{num_tags};
}

sub tags {
    my ($self) = @_;
    return $self->{tags};
}

########################################################################
package MinecraftNbt::TagString;

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

    $self->{len_data} = $self->{_io}->read_u2be();
    $self->{data} = Encode::decode("utf-8", $self->{_io}->read_bytes($self->len_data()));
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package MinecraftNbt::TagCompound;

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

    $self->{tags} = ();
    do {
        $_ = MinecraftNbt::NamedTag->new($self->{_io}, $self, $self->{_root});
        push @{$self->{tags}}, $_;
    } until ($_->is_tag_end());
}

sub dump_num_tags {
    my ($self) = @_;
    return $self->{dump_num_tags} if ($self->{dump_num_tags});
    $self->{dump_num_tags} = (scalar(@{$self->tags()}) - ( ((scalar(@{$self->tags()}) >= 1) && (@{$self->tags()}[-1]->is_tag_end()))  ? 1 : 0));
    return $self->{dump_num_tags};
}

sub tags {
    my ($self) = @_;
    return $self->{tags};
}

########################################################################
package MinecraftNbt::NamedTag;

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

    $self->{type} = $self->{_io}->read_u1();
    if (!($self->is_tag_end())) {
        $self->{name} = MinecraftNbt::TagString->new($self->{_io}, $self, $self->{_root});
    }
    if (!($self->is_tag_end())) {
        my $_on = $self->type();
        if ($_on == $MinecraftNbt::TAG_LONG_ARRAY) {
            $self->{payload} = MinecraftNbt::TagLongArray->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_COMPOUND) {
            $self->{payload} = MinecraftNbt::TagCompound->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_DOUBLE) {
            $self->{payload} = $self->{_io}->read_f8be();
        }
        elsif ($_on == $MinecraftNbt::TAG_LIST) {
            $self->{payload} = MinecraftNbt::TagList->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_FLOAT) {
            $self->{payload} = $self->{_io}->read_f4be();
        }
        elsif ($_on == $MinecraftNbt::TAG_SHORT) {
            $self->{payload} = $self->{_io}->read_s2be();
        }
        elsif ($_on == $MinecraftNbt::TAG_INT) {
            $self->{payload} = $self->{_io}->read_s4be();
        }
        elsif ($_on == $MinecraftNbt::TAG_BYTE_ARRAY) {
            $self->{payload} = MinecraftNbt::TagByteArray->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_BYTE) {
            $self->{payload} = $self->{_io}->read_s1();
        }
        elsif ($_on == $MinecraftNbt::TAG_INT_ARRAY) {
            $self->{payload} = MinecraftNbt::TagIntArray->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_STRING) {
            $self->{payload} = MinecraftNbt::TagString->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == $MinecraftNbt::TAG_LONG) {
            $self->{payload} = $self->{_io}->read_s8be();
        }
    }
}

sub is_tag_end {
    my ($self) = @_;
    return $self->{is_tag_end} if ($self->{is_tag_end});
    $self->{is_tag_end} = $self->type() == $MinecraftNbt::TAG_END;
    return $self->{is_tag_end};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub payload {
    my ($self) = @_;
    return $self->{payload};
}

1;
