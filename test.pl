my %my_hash;
@my_hash{qw(key1 key2 key3)} = (' ') x 3;


system('bash', '-c', 'diff <(sort abc.csv) <(sort def.csv)');



map { $_ . (any { $_ == $_ } @ddd ? ' exists' : ' does not exist') } @abc