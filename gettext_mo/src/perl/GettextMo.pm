# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package GettextMo;

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

    $self->{signature} = $self->{_io}->read_bytes(4);
    $self->{mo} = GettextMo::Mo->new($self->{_io}, $self, $self->{_root});
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub mo {
    my ($self) = @_;
    return $self->{mo};
}

########################################################################
package GettextMo::HashLookupIteration;

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

sub original {
    my ($self) = @_;
    return $self->{original} if ($self->{original});
    $self->{original} = @{$self->_root()->mo()->originals()}[$self->idx()]->str();
    return $self->{original};
}

sub translation {
    my ($self) = @_;
    return $self->{translation} if ($self->{translation});
    $self->{translation} = @{$self->_root()->mo()->translations()}[$self->idx()]->str();
    return $self->{translation};
}

sub next_idx {
    my ($self) = @_;
    return $self->{next_idx} if ($self->{next_idx});
    $self->{next_idx} = (($self->idx() + $self->collision_step()) - ($self->idx() >= ($self->_root()->mo()->num_hashtable_items() - $self->collision_step()) ? $self->_root()->mo()->num_hashtable_items() : 0));
    return $self->{next_idx};
}

sub next {
    my ($self) = @_;
    return $self->{next} if ($self->{next});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{next} = GettextMo::HashLookupIteration->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{next};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

sub collision_step {
    my ($self) = @_;
    return $self->{collision_step};
}

########################################################################
package GettextMo::LookupIteration;

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

sub found {
    my ($self) = @_;
    return $self->{found} if ($self->{found});
    $self->{found} = $self->query() eq $self->current()->original();
    return $self->{found};
}

sub next {
    my ($self) = @_;
    return $self->{next} if ($self->{next});
    if (!($self->found())) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek(0);
        $self->{next} = GettextMo::LookupIteration->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{next};
}

sub current {
    my ($self) = @_;
    return $self->{current};
}

sub query {
    my ($self) = @_;
    return $self->{query};
}

########################################################################
package GettextMo::HashtableLookup;

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

sub collision_step {
    my ($self) = @_;
    return $self->{collision_step} if ($self->{collision_step});
    $self->{collision_step} = (($self->hash() % ($self->_root()->mo()->num_hashtable_items() - 2)) + 1);
    return $self->{collision_step};
}

sub idx {
    my ($self) = @_;
    return $self->{idx} if ($self->{idx});
    $self->{idx} = ($self->hash() % $self->_root()->mo()->num_hashtable_items());
    return $self->{idx};
}

sub hash_lookup_iteration {
    my ($self) = @_;
    return $self->{hash_lookup_iteration} if ($self->{hash_lookup_iteration});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{hash_lookup_iteration} = GettextMo::HashLookupIteration->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{hash_lookup_iteration};
}

sub entry {
    my ($self) = @_;
    return $self->{entry} if ($self->{entry});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{entry} = GettextMo::LookupIteration->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{entry};
}

sub query {
    my ($self) = @_;
    return $self->{query};
}

sub hash {
    my ($self) = @_;
    return $self->{hash};
}

########################################################################
package GettextMo::Mo;

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

    my $_on = $self->_root()->signature();
    if ($_on eq pack('C*', (222, 18, 4, 149))) {
        $self->{_is_le} = 1;
    }
    elsif ($_on eq pack('C*', (149, 4, 18, 222))) {
        $self->{_is_le} = 0;
    }
    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{version} = GettextMo::Mo::Version->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    $self->{num_translations} = $self->{_io}->read_u4le();
    $self->{ofs_originals} = $self->{_io}->read_u4le();
    $self->{ofs_translations} = $self->{_io}->read_u4le();
    $self->{num_hashtable_items} = $self->{_io}->read_u4le();
    $self->{ofs_hashtable_items} = $self->{_io}->read_u4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{version} = GettextMo::Mo::Version->new($self->{_io}, $self, $self->{_root}, $self->{_is_le});
    $self->{num_translations} = $self->{_io}->read_u4be();
    $self->{ofs_originals} = $self->{_io}->read_u4be();
    $self->{ofs_translations} = $self->{_io}->read_u4be();
    $self->{num_hashtable_items} = $self->{_io}->read_u4be();
    $self->{ofs_hashtable_items} = $self->{_io}->read_u4be();
}

sub originals {
    my ($self) = @_;
    return $self->{originals} if ($self->{originals});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_originals());
    if ($self->{_is_le}) {
        $self->{originals} = ();
        my $n_originals = $self->num_translations();
        for (my $i = 0; $i < $n_originals; $i++) {
            $self->{originals}[$i] = GettextMo::Mo::Descriptor->new($io, $self, $self->{_root}, $self->{_is_le});
        }
    } else {
        $self->{originals} = ();
        my $n_originals = $self->num_translations();
        for (my $i = 0; $i < $n_originals; $i++) {
            $self->{originals}[$i] = GettextMo::Mo::Descriptor->new($io, $self, $self->{_root}, $self->{_is_le});
        }
    }
    $io->seek($_pos);
    return $self->{originals};
}

sub translations {
    my ($self) = @_;
    return $self->{translations} if ($self->{translations});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_translations());
    if ($self->{_is_le}) {
        $self->{translations} = ();
        my $n_translations = $self->num_translations();
        for (my $i = 0; $i < $n_translations; $i++) {
            $self->{translations}[$i] = GettextMo::Mo::Descriptor->new($io, $self, $self->{_root}, $self->{_is_le});
        }
    } else {
        $self->{translations} = ();
        my $n_translations = $self->num_translations();
        for (my $i = 0; $i < $n_translations; $i++) {
            $self->{translations}[$i] = GettextMo::Mo::Descriptor->new($io, $self, $self->{_root}, $self->{_is_le});
        }
    }
    $io->seek($_pos);
    return $self->{translations};
}

sub hashtable_items {
    my ($self) = @_;
    return $self->{hashtable_items} if ($self->{hashtable_items});
    if ($self->ofs_hashtable_items() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_hashtable_items());
        if ($self->{_is_le}) {
            $self->{hashtable_items} = ();
            my $n_hashtable_items = $self->num_hashtable_items();
            for (my $i = 0; $i < $n_hashtable_items; $i++) {
                $self->{hashtable_items}[$i] = GettextMo::Mo::HashtableItem->new($io, $self, $self->{_root}, $self->{_is_le});
            }
        } else {
            $self->{hashtable_items} = ();
            my $n_hashtable_items = $self->num_hashtable_items();
            for (my $i = 0; $i < $n_hashtable_items; $i++) {
                $self->{hashtable_items}[$i] = GettextMo::Mo::HashtableItem->new($io, $self, $self->{_root}, $self->{_is_le});
            }
        }
        $io->seek($_pos);
    }
    return $self->{hashtable_items};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub num_translations {
    my ($self) = @_;
    return $self->{num_translations};
}

sub ofs_originals {
    my ($self) = @_;
    return $self->{ofs_originals};
}

sub ofs_translations {
    my ($self) = @_;
    return $self->{ofs_translations};
}

sub num_hashtable_items {
    my ($self) = @_;
    return $self->{num_hashtable_items};
}

sub ofs_hashtable_items {
    my ($self) = @_;
    return $self->{ofs_hashtable_items};
}

########################################################################
package GettextMo::Mo::Version;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{version_raw} = $self->{_io}->read_u4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{version_raw} = $self->{_io}->read_u4be();
}

sub major {
    my ($self) = @_;
    return $self->{major} if ($self->{major});
    $self->{major} = ($self->version_raw() >> 16);
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor} if ($self->{minor});
    $self->{minor} = ($self->version_raw() & 65535);
    return $self->{minor};
}

sub version_raw {
    my ($self) = @_;
    return $self->{version_raw};
}

########################################################################
package GettextMo::Mo::HashtableItem;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{raw_val} = $self->{_io}->read_u4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{raw_val} = $self->{_io}->read_u4be();
}

sub mask {
    my ($self) = @_;
    return $self->{mask} if ($self->{mask});
    $self->{mask} = 2147483648;
    return $self->{mask};
}

sub val_1 {
    my ($self) = @_;
    return $self->{val_1} if ($self->{val_1});
    if ($self->raw_val() != 0) {
        $self->{val_1} = ($self->raw_val() - 1);
    }
    return $self->{val_1};
}

sub is_system_dependent {
    my ($self) = @_;
    return $self->{is_system_dependent} if ($self->{is_system_dependent});
    if ($self->raw_val() != 0) {
        $self->{is_system_dependent} = ($self->val_1() & $self->mask()) == 1;
    }
    return $self->{is_system_dependent};
}

sub val {
    my ($self) = @_;
    return $self->{val} if ($self->{val});
    if ($self->raw_val() != 0) {
        $self->{val} = ($self->val_1() & ~($self->mask()));
    }
    return $self->{val};
}

sub raw_val {
    my ($self) = @_;
    return $self->{raw_val};
}

########################################################################
package GettextMo::Mo::Descriptor;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root, $_is_le) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;
    $self->{_is_le} = $_is_le;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!(defined $self->{_is_le})) {
        die "Unable to decide on endianness";
    } elsif ($self->{_is_le}) {
        $self->_read_le();
    } else {
        $self->_read_be();
    }
}

sub _read_le {
    my ($self) = @_;

    $self->{len_str} = $self->{_io}->read_u4le();
    $self->{ofs_str} = $self->{_io}->read_u4le();
}

sub _read_be {
    my ($self) = @_;

    $self->{len_str} = $self->{_io}->read_u4be();
    $self->{ofs_str} = $self->{_io}->read_u4be();
}

sub str {
    my ($self) = @_;
    return $self->{str} if ($self->{str});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_str());
    if ($self->{_is_le}) {
        $self->{str} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($io->read_bytes($self->len_str()), 0, 0));
    } else {
        $self->{str} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($io->read_bytes($self->len_str()), 0, 0));
    }
    $io->seek($_pos);
    return $self->{str};
}

sub len_str {
    my ($self) = @_;
    return $self->{len_str};
}

sub ofs_str {
    my ($self) = @_;
    return $self->{ofs_str};
}

1;
