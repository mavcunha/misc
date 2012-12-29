use v6;

for 1..500 -> $i {
  my@b;
  my$a=$i;
  until any(@b) == 1|$a {
    @b.push($a);$a= [+] $a.comb X**2;
  };
  say $i~" is "~($a==1?? "" !! "un")~"happy";
}
