# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package WindowsShellItems;

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

    $self->{items} = [];
    {
        my $_it;
        do {
            $_it = WindowsShellItems::ShellItem->new($self->{_io}, $self, $self->{_root});
            push @{$self->{items}}, $_it;
        } until ($_it->len_data() == 0);
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package WindowsShellItems::FileEntryBody;

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

    $self->{_unnamed0} = $self->{_io}->read_u1();
    $self->{file_size} = $self->{_io}->read_u4le();
    $self->{last_mod_time} = $self->{_io}->read_u4le();
    $self->{file_attrs} = $self->{_io}->read_u2le();
}

sub is_dir {
    my ($self) = @_;
    return $self->{is_dir} if ($self->{is_dir});
    $self->{is_dir} = ($self->_parent()->code() & 1) != 0;
    return $self->{is_dir};
}

sub is_file {
    my ($self) = @_;
    return $self->{is_file} if ($self->{is_file});
    $self->{is_file} = ($self->_parent()->code() & 2) != 0;
    return $self->{is_file};
}

sub _unnamed0 {
    my ($self) = @_;
    return $self->{_unnamed0};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub last_mod_time {
    my ($self) = @_;
    return $self->{last_mod_time};
}

sub file_attrs {
    my ($self) = @_;
    return $self->{file_attrs};
}

########################################################################
package WindowsShellItems::RootFolderBody;

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

    $self->{sort_index} = $self->{_io}->read_u1();
    $self->{shell_folder_id} = $self->{_io}->read_bytes(16);
}

sub sort_index {
    my ($self) = @_;
    return $self->{sort_index};
}

sub shell_folder_id {
    my ($self) = @_;
    return $self->{shell_folder_id};
}

########################################################################
package WindowsShellItems::ShellItem;

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

    $self->{len_data} = $self->{_io}->read_u2le();
    if ($self->len_data() >= 2) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data() - 2);
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = WindowsShellItems::ShellItemData->new($io__raw_data, $self, $self->{_root});
    }
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package WindowsShellItems::ShellItemData;

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

    $self->{code} = $self->{_io}->read_u1();
    my $_on = $self->code();
    if ($_on == 31) {
        $self->{body1} = WindowsShellItems::RootFolderBody->new($self->{_io}, $self, $self->{_root});
    }
    my $_on = $self->code() & 112;
    if ($_on == 32) {
        $self->{body2} = WindowsShellItems::VolumeBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 48) {
        $self->{body2} = WindowsShellItems::FileEntryBody->new($self->{_io}, $self, $self->{_root});
    }
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub body1 {
    my ($self) = @_;
    return $self->{body1};
}

sub body2 {
    my ($self) = @_;
    return $self->{body2};
}

########################################################################
package WindowsShellItems::VolumeBody;

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

    $self->{flags} = $self->{_io}->read_u1();
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

1;
