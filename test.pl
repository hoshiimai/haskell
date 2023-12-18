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




#!/usr/bin/perl
use strict;
use warnings;

# 配列AとBを定義
my @arrayA = (1, 2, 3, 4, 5);
my @arrayB = (3, 4, 5, 6, 7);

# 配列Aから配列Bに含まれない要素を抽出し、それを出力
my @not_in_arrayB = grep { my $element = $_; not grep { $_ == $element } @arrayB } @arrayA;
print join("\n", @not_in_arrayB) . "\n";





use strict;
use warnings;
use Text::CSV;

my $input_file = 'aaa.csv';
my $output_file = 'edited_aaa.csv';

open my $fh_in, '<:encoding(utf8)', $input_file or die "Could not open $input_file: $!";
open my $fh_out, '>:encoding(utf8)', $output_file or die "Could not open $output_file: $!";

my $csv = Text::CSV->new({
    binary => 1,
    allow_whitespace => 1,
    allow_loose_quotes => 1,
});

while (my $row = $csv->getline($fh_in)) {
    for my $field (@$row) {
        $field =~ s/"(.*?)"\K,//g;   # ""で囲まれている中のカンマを削除
    }
    $csv->print($fh_out, $row);
    print $fh_out "\n";
}

close $fh_in;
close $fh_out;



$line =~ s/"([^"]*)",([^"]*)/"$1", "$2"/g;



$ sed "s/\"\(.*\),\(.*\)\"/\"\1\2\"/g" tmp
1,2,3,"abcefg",5
1,2,3,"abcefg",5
1,2,3,"abcefg",5
1,2,3,"abcefg",5