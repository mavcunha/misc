($l = uc shift) =~/^[A-Z]$/ or die "INVALID INPUT\n";

foreach (A..chr(ord($l)-1), reverse A.."$l") {
  $s = ' ' x (ord($l)-ord);
  $i = ' ' x (2*((ord)-65)-1);
  print /A/ ? "$s$_\n" : "$s$_$i$_\n";
}
