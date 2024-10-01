void firstFunc(val, callback) {
  print(val);
  callback(val + 1);
}

void secondFunc(val, callback) {
  print(val);
  callback(val + 1);
}

void test () {
  firstFunc(1, (x) => secondFunc(x, (x) => print(x)));
}