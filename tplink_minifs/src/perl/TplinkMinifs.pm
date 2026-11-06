# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package TplinkMinifs;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSION_TYPE_LZMA = 0;
our $COMPRESSION_TYPE_RAW = 2;
our $COMPRESSION_TYPE_LZMA_2014 = 4;

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

    $self->{header} = TplinkMinifs::MinifsHeader->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->header()->version();
    if ($_on == 1) {
        $self->{body} = TplinkMinifs::BodyV1->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 2) {
        $self->{body} = TplinkMinifs::BodyV2->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 3) {
        $self->{body} = TplinkMinifs::BodyV3->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package TplinkMinifs::BodyV1;

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

    $self->{inodes} = [];
    my $n_inodes = $self->_root()->header()->num_files();
    for (my $i = 0; $i < $n_inodes; $i++) {
        push @{$self->{inodes}}, TplinkMinifs::InodeV1->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_raw_blobs_area} = $self->{_io}->read_bytes(@{$self->inodes()}[-1]->ofs_end());
    my $io__raw_blobs_area = IO::KaitaiStruct::Stream->new($self->{_raw_blobs_area});
    $self->{blobs_area} = TplinkMinifs::Dummy->new($io__raw_blobs_area, $self, $self->{_root});
}

sub inodes {
    my ($self) = @_;
    return $self->{inodes};
}

sub blobs_area {
    my ($self) = @_;
    return $self->{blobs_area};
}

sub _raw_blobs_area {
    my ($self) = @_;
    return $self->{_raw_blobs_area};
}

########################################################################
package TplinkMinifs::BodyV2;

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

    $self->{len_files_area} = $self->{_io}->read_u4be();
    $self->{_raw_files_area} = $self->{_io}->read_bytes($self->len_files_area());
    my $io__raw_files_area = IO::KaitaiStruct::Stream->new($self->{_raw_files_area});
    $self->{files_area} = TplinkMinifs::FilesAreaV2->new($io__raw_files_area, $self, $self->{_root});
}

sub len_files_area {
    my ($self) = @_;
    return $self->{len_files_area};
}

sub files_area {
    my ($self) = @_;
    return $self->{files_area};
}

sub _raw_files_area {
    my ($self) = @_;
    return $self->{_raw_files_area};
}

########################################################################
package TplinkMinifs::BodyV3;

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

    $self->{len_name_table} = $self->{_io}->read_u4be();
    $self->{_raw_name_table} = $self->{_io}->read_bytes($self->len_name_table());
    my $io__raw_name_table = IO::KaitaiStruct::Stream->new($self->{_raw_name_table});
    $self->{name_table} = TplinkMinifs::NameTable->new($io__raw_name_table, $self, $self->{_root});
    $self->{inodes} = [];
    my $n_inodes = $self->_root()->header()->num_files();
    for (my $i = 0; $i < $n_inodes; $i++) {
        push @{$self->{inodes}}, TplinkMinifs::Inode->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->ofs_lzma_metas() < 0) {
        $self->{_unnamed3} = $self->{_io}->read_bytes(0);
    }
    $self->{lzma_metas} = [];
    my $n_lzma_metas = $self->num_lzma_blobs();
    for (my $i = 0; $i < $n_lzma_metas; $i++) {
        push @{$self->{lzma_metas}}, TplinkMinifs::LzmaMeta->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_raw_lzma_blobs_area} = $self->{_io}->read_bytes(@{$self->lzma_metas()}[-1]->ofs_end());
    my $io__raw_lzma_blobs_area = IO::KaitaiStruct::Stream->new($self->{_raw_lzma_blobs_area});
    $self->{lzma_blobs_area} = TplinkMinifs::Dummy->new($io__raw_lzma_blobs_area, $self, $self->{_root});
}

sub has_8_byte_lzma_metas {
    my ($self) = @_;
    return $self->{has_8_byte_lzma_metas} if ($self->{has_8_byte_lzma_metas});
    $self->{has_8_byte_lzma_metas} = $self->len_first_blob_uncompressed_if_8_byte_metas() == 18446744073709551615;
    return $self->{has_8_byte_lzma_metas};
}

sub len_first_blob_uncompressed_if_8_byte_metas {
    my ($self) = @_;
    return $self->{len_first_blob_uncompressed_if_8_byte_metas} if ($self->{len_first_blob_uncompressed_if_8_byte_metas});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->ofs_lzma_metas() + 8 * $self->num_lzma_blobs()) + 5);
    $self->{len_first_blob_uncompressed_if_8_byte_metas} = $self->{_io}->read_u8le();
    $self->{_io}->seek($_pos);
    return $self->{len_first_blob_uncompressed_if_8_byte_metas};
}

sub len_lzma_meta {
    my ($self) = @_;
    return $self->{len_lzma_meta} if ($self->{len_lzma_meta});
    $self->{len_lzma_meta} = ($self->has_8_byte_lzma_metas() ? 8 : 12);
    return $self->{len_lzma_meta};
}

sub num_lzma_blobs {
    my ($self) = @_;
    return $self->{num_lzma_blobs} if ($self->{num_lzma_blobs});
    $self->{num_lzma_blobs} = @{$self->inodes()}[-1]->cur_max_lzma_blob() + 1;
    return $self->{num_lzma_blobs};
}

sub ofs_lzma_metas {
    my ($self) = @_;
    return $self->{ofs_lzma_metas} if ($self->{ofs_lzma_metas});
    $self->{ofs_lzma_metas} = $self->_io()->pos();
    return $self->{ofs_lzma_metas};
}

sub len_name_table {
    my ($self) = @_;
    return $self->{len_name_table};
}

sub name_table {
    my ($self) = @_;
    return $self->{name_table};
}

sub inodes {
    my ($self) = @_;
    return $self->{inodes};
}

sub _unnamed3 {
    my ($self) = @_;
    return $self->{_unnamed3};
}

sub lzma_metas {
    my ($self) = @_;
    return $self->{lzma_metas};
}

sub lzma_blobs_area {
    my ($self) = @_;
    return $self->{lzma_blobs_area};
}

sub _raw_name_table {
    my ($self) = @_;
    return $self->{_raw_name_table};
}

sub _raw_lzma_blobs_area {
    my ($self) = @_;
    return $self->{_raw_lzma_blobs_area};
}

########################################################################
package TplinkMinifs::Dummy;

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

}

########################################################################
package TplinkMinifs::FileV2;

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

    $self->{path_md5} = $self->{_io}->read_bytes(16);
    $self->{len_data} = $self->{_io}->read_u4be();
    $self->{ofs_data} = $self->{_io}->read_u4be();
    $self->{len_data_uncompressed} = $self->{_io}->read_u4be();
    $self->{compression} = $self->{_io}->read_u4be();
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
}

sub path_md5 {
    my ($self) = @_;
    return $self->{path_md5};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub ofs_data {
    my ($self) = @_;
    return $self->{ofs_data};
}

sub len_data_uncompressed {
    my ($self) = @_;
    return $self->{len_data_uncompressed};
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package TplinkMinifs::FilesAreaV2;

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

    $self->{files} = [];
    my $n_files = $self->_root()->header()->num_files();
    for (my $i = 0; $i < $n_files; $i++) {
        push @{$self->{files}}, TplinkMinifs::FileV2->new($self->{_io}, $self, $self->{_root});
    }
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

########################################################################
package TplinkMinifs::Inode;

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

    $self->{ofs_directory_path} = $self->{_io}->read_u4be();
    $self->{ofs_file_name} = $self->{_io}->read_u4be();
    $self->{lzma_blob} = $self->{_io}->read_u4be();
    $self->{ofs_file} = $self->{_io}->read_u4be();
    $self->{len_file} = $self->{_io}->read_u4be();
}

sub cur_max_lzma_blob {
    my ($self) = @_;
    return $self->{cur_max_lzma_blob} if ($self->{cur_max_lzma_blob});
    $self->{cur_max_lzma_blob} = ($self->lzma_blob() > $self->prev_max_lzma_blob() ? $self->lzma_blob() : $self->prev_max_lzma_blob());
    return $self->{cur_max_lzma_blob};
}

sub directory_path {
    my ($self) = @_;
    return $self->{directory_path} if ($self->{directory_path});
    my $io = $self->_parent()->name_table()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_directory_path());
    $self->{directory_path} = Encode::decode("ASCII", $io->read_bytes_term(0, 0, 1, 1));
    $io->seek($_pos);
    return $self->{directory_path};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name} if ($self->{file_name});
    my $io = $self->_parent()->name_table()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_file_name());
    $self->{file_name} = Encode::decode("ASCII", $io->read_bytes_term(0, 0, 1, 1));
    $io->seek($_pos);
    return $self->{file_name};
}

sub ofs_directory_path {
    my ($self) = @_;
    return $self->{ofs_directory_path};
}

sub ofs_file_name {
    my ($self) = @_;
    return $self->{ofs_file_name};
}

sub lzma_blob {
    my ($self) = @_;
    return $self->{lzma_blob};
}

sub ofs_file {
    my ($self) = @_;
    return $self->{ofs_file};
}

sub len_file {
    my ($self) = @_;
    return $self->{len_file};
}

sub prev_max_lzma_blob {
    my ($self) = @_;
    return $self->{prev_max_lzma_blob};
}

########################################################################
package TplinkMinifs::InodeV1;

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

    $self->{path} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(80), 0, 0));
    $self->{len_blob} = $self->{_io}->read_u4be();
    $self->{ofs_blob} = $self->{_io}->read_u4be();
}

sub blob {
    my ($self) = @_;
    return $self->{blob} if ($self->{blob});
    my $io = $self->_parent()->blobs_area()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_blob());
    $self->{blob} = $io->read_bytes($self->len_blob());
    $io->seek($_pos);
    return $self->{blob};
}

sub ofs_end {
    my ($self) = @_;
    return $self->{ofs_end} if ($self->{ofs_end});
    $self->{ofs_end} = $self->ofs_blob() + $self->len_blob();
    return $self->{ofs_end};
}

sub path {
    my ($self) = @_;
    return $self->{path};
}

sub len_blob {
    my ($self) = @_;
    return $self->{len_blob};
}

sub ofs_blob {
    my ($self) = @_;
    return $self->{ofs_blob};
}

sub prev_ofs_end {
    my ($self) = @_;
    return $self->{prev_ofs_end};
}

########################################################################
package TplinkMinifs::LzmaMeta;

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

    $self->{ofs_blob} = $self->{_io}->read_u4be();
    $self->{len_blob} = $self->{_io}->read_u4be();
    if (!($self->_parent()->has_8_byte_lzma_metas())) {
        $self->{len_blob_uncompressed} = $self->{_io}->read_u4be();
    }
}

sub blob {
    my ($self) = @_;
    return $self->{blob} if ($self->{blob});
    my $io = $self->_parent()->lzma_blobs_area()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_blob());
    $self->{blob} = $io->read_bytes($self->len_blob());
    $io->seek($_pos);
    return $self->{blob};
}

sub ofs_end {
    my ($self) = @_;
    return $self->{ofs_end} if ($self->{ofs_end});
    $self->{ofs_end} = $self->ofs_blob() + $self->len_blob();
    return $self->{ofs_end};
}

sub ofs_blob {
    my ($self) = @_;
    return $self->{ofs_blob};
}

sub len_blob {
    my ($self) = @_;
    return $self->{len_blob};
}

sub len_blob_uncompressed {
    my ($self) = @_;
    return $self->{len_blob_uncompressed};
}

sub prev_ofs_end {
    my ($self) = @_;
    return $self->{prev_ofs_end};
}

########################################################################
package TplinkMinifs::MinifsHeader;

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

    $self->{magic} = $self->{_io}->read_bytes(16);
    $self->{version} = $self->{_io}->read_u4be();
    $self->{num_files} = $self->{_io}->read_u4be();
    $self->{len_largest_file} = $self->{_io}->read_u4be();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub num_files {
    my ($self) = @_;
    return $self->{num_files};
}

sub len_largest_file {
    my ($self) = @_;
    return $self->{len_largest_file};
}

########################################################################
package TplinkMinifs::NameTable;

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

    $self->{names} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{names}}, Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub names {
    my ($self) = @_;
    return $self->{names};
}

1;
