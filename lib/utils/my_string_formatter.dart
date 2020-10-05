String styleCardNumber(String h) {
  var p1 = h.substring(0, 3);
  var p2 = h.substring(3, 6);
  var p3 = h.substring(6, 9);
  var p4 = h[9];
  return "$p1 $p2 $p3-$p4";
}
