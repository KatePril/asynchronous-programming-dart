Future<dynamic> asyncMap(el, func, onError) async => Future.delayed(Duration(seconds: 1), () => func(el, onError)).catchError((err) => onError(err));

void demoParallelism() async {
  List<dynamic> l = [4, 5, 6, 1, "2", 3, "7", 8, 9];
  List<Future<dynamic>> fl = l.map((el) => asyncMap(el, (x, onError) {
    print(x);
    return Future.value(x * x).catchError((e) => onError(e));
  }, (e) => 0)).toList();

  List<dynamic> res = await Future.wait(fl);
  print(res);
}