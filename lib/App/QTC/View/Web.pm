package App::QTC::View::Web;

use strict;
use warnings;

use parent 'Catalyst::View::Template';

__PACKAGE__->config(
    template_ext => '.tt',
    WRAPPER      => 'shared/wrapper.tt',
);

1;
 
