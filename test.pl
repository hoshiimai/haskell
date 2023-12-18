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



#!/usr/bin/perl

use strict;
use warnings;

my $qw  = '"'; # 引用符を定義
my $dlm = ","; # 区切り文字を定義

open(RH, "<", "from.csv");
open(WH, ">", "to.csv");
while(<RH>){
  print WH RemoveDelimiterInQuotes($_, $qw, $dlm);
}
close(WH);
close(RH);

exit;

sub RemoveDelimiterInQuotes {
  my $str = shift; # 対象文字列
  my $qw  = shift; # 引用符
  my $dlm = shift; # 区切り文字
  
  my @substrs = ( $str =~ /$qw[^$qw]*$qw/g);
  
  for my $substr (@substrs){
    my $target = $substr;
    $substr =~ s/$dlm//g;
   
    $str =~ s/\Q$target\E/$substr/;
  }
  
  return $str;
}
