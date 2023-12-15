my %my_hash;
@my_hash{qw(key1 key2 key3)} = (' ') x 3;


system('bash', '-c', 'diff <(sort abc.csv) <(sort def.csv)');



map { $_ . (any { $_ == $_ } @ddd ? ' exists' : ' does not exist') } @abc






use strict;
use warnings;

sub check_array_reference {
    my ($array_ref) = @_;

    # grepを使用してS, T, Fのいずれかの文字が含まれているか確認
    my @result = grep { /[STF]/ } @{$array_ref};

    # 結果を出力
    if (@result) {
        print "配列に S, T, F のいずれかの文字が含まれています。\n";
    } else {
        print "配列に S, T, F のいずれの文字も含まれていません。\n";
    }
}

# テスト用の配列
my @sample_array = qw(Apple Banana Orange Grape STF_Test);

# サブルーチン呼び出し
check_array_reference(\@sample_array);
