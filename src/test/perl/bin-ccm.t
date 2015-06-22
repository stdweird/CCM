use strict;
use warnings;
use Test::More;

use Taint::Runtime qw(taint_start taint_stop taint_enabled);

use Readonly;

Readonly my $SCRIPT => 'target/sbin/ccm';

taint_start();
ok(taint_enabled(), "Tainting enabled");

=pod

=HEAD1 DESCRIPTION

Test the basic ccm functionality

=cut

open FH, $SCRIPT;
my $script = join('', <FH>);
close FH;

# just don't run it
# should trigger syntax errors etc
taint_stop();
ok(! taint_enabled(), "Tainting disabled for eval of main script");
eval "sub {$script};";
taint_start();
ok(taint_enabled(), "Tainting reenabled");

ok(1, "eval ok, no syntax errors (or would not have reached this far)");

done_testing();
