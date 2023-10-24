use strict;
use warnings;

use App::QTC;

my $app = App::QTC->apply_default_middlewares(App::QTC->psgi_app);
$app;

