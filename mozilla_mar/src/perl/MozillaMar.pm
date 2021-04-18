# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package MozillaMar;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SIGNATURE_ALGORITHMS_RSA_PKCS1_SHA1 = 1;
our $SIGNATURE_ALGORITHMS_RSA_PKCS1_SHA384 = 2;

our $BLOCK_IDENTIFIERS_PRODUCT_INFORMATION = 1;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{ofs_index} = $self->{_io}->read_u4be();
    $self->{file_size} = $self->{_io}->read_u8be();
    $self->{len_signatures} = $self->{_io}->read_u4be();
    $self->{signatures} = ();
    my $n_signatures = $self->len_signatures();
    for (my $i = 0; $i < $n_signatures; $i++) {
        $self->{signatures}[$i] = MozillaMar::Signature->new($self->{_io}, $self, $self->{_root});
    }
    $self->{len_additional_sections} = $self->{_io}->read_u4be();
    $self->{additional_sections} = ();
    my $n_additional_sections = $self->len_additional_sections();
    for (my $i = 0; $i < $n_additional_sections; $i++) {
        $self->{additional_sections}[$i] = MozillaMar::AdditionalSection->new($self->{_io}, $self, $self->{_root});
    }
}

sub index {
    my ($self) = @_;
    return $self->{index} if ($self->{index});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_index());
    $self->{index} = MozillaMar::MarIndex->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{index};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub ofs_index {
    my ($self) = @_;
    return $self->{ofs_index};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub len_signatures {
    my ($self) = @_;
    return $self->{len_signatures};
}

sub signatures {
    my ($self) = @_;
    return $self->{signatures};
}

sub len_additional_sections {
    my ($self) = @_;
    return $self->{len_additional_sections};
}

sub additional_sections {
    my ($self) = @_;
    return $self->{additional_sections};
}

########################################################################
package MozillaMar::MarIndex;

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

    $self->{len_index} = $self->{_io}->read_u4be();
    $self->{_raw_index_entries} = $self->{_io}->read_bytes($self->len_index());
    my $io__raw_index_entries = IO::KaitaiStruct::Stream->new($self->{_raw_index_entries});
    $self->{index_entries} = MozillaMar::IndexEntries->new($io__raw_index_entries, $self, $self->{_root});
}

sub len_index {
    my ($self) = @_;
    return $self->{len_index};
}

sub index_entries {
    my ($self) = @_;
    return $self->{index_entries};
}

sub _raw_index_entries {
    my ($self) = @_;
    return $self->{_raw_index_entries};
}

########################################################################
package MozillaMar::IndexEntries;

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

    $self->{index_entry} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{index_entry}}, MozillaMar::IndexEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub index_entry {
    my ($self) = @_;
    return $self->{index_entry};
}

########################################################################
package MozillaMar::Signature;

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

    $self->{algorithm} = $self->{_io}->read_u4be();
    $self->{len_signature} = $self->{_io}->read_u4be();
    $self->{signature} = $self->{_io}->read_bytes($self->len_signature());
}

sub algorithm {
    my ($self) = @_;
    return $self->{algorithm};
}

sub len_signature {
    my ($self) = @_;
    return $self->{len_signature};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

########################################################################
package MozillaMar::ProductInformationBlock;

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

    $self->{mar_channel_name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(64), 0, 0));
    $self->{product_version} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
}

sub mar_channel_name {
    my ($self) = @_;
    return $self->{mar_channel_name};
}

sub product_version {
    my ($self) = @_;
    return $self->{product_version};
}

########################################################################
package MozillaMar::IndexEntry;

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

    $self->{ofs_content} = $self->{_io}->read_u4be();
    $self->{len_content} = $self->{_io}->read_u4be();
    $self->{flags} = $self->{_io}->read_u4be();
    $self->{file_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_content());
    $self->{body} = $io->read_bytes($self->len_content());
    $io->seek($_pos);
    return $self->{body};
}

sub ofs_content {
    my ($self) = @_;
    return $self->{ofs_content};
}

sub len_content {
    my ($self) = @_;
    return $self->{len_content};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

########################################################################
package MozillaMar::AdditionalSection;

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

    $self->{len_block} = $self->{_io}->read_u4be();
    $self->{block_identifier} = $self->{_io}->read_u4be();
    my $_on = $self->block_identifier();
    if ($_on == $MozillaMar::BLOCK_IDENTIFIERS_PRODUCT_INFORMATION) {
        $self->{_raw_bytes} = $self->{_io}->read_bytes((($self->len_block() - 4) - 4));
        my $io__raw_bytes = IO::KaitaiStruct::Stream->new($self->{_raw_bytes});
        $self->{bytes} = MozillaMar::ProductInformationBlock->new($io__raw_bytes, $self, $self->{_root});
    }
    else {
        $self->{bytes} = $self->{_io}->read_bytes((($self->len_block() - 4) - 4));
    }
}

sub len_block {
    my ($self) = @_;
    return $self->{len_block};
}

sub block_identifier {
    my ($self) = @_;
    return $self->{block_identifier};
}

sub bytes {
    my ($self) = @_;
    return $self->{bytes};
}

sub _raw_bytes {
    my ($self) = @_;
    return $self->{_raw_bytes};
}

1;
