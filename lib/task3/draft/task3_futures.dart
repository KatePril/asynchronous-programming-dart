import 'dart:async';
import 'package:async/async.dart';

final cancellableOperation = CancelableOperation.fromFuture(Future.value(0));

Future<dynamic> asyncMap(el, func) async => Future.delayed(Duration(seconds: 1), () => func(el)).catchError((err) => onError(err));

int onError(e) {
  print(e);
  cancellableOperation.cancel();
  return 0;
}

void demoCancellableFuture() async {
  List<dynamic> l = [4, 5, 6, 1, "2", 3, "7", 8, 9];
  List<Future<dynamic>> fl = l.map((el) => asyncMap(el, (x) {
    final r = Future.value(x * x).catchError((e) => onError(e));
    print(x);
    return r;
  })).toList();

  List<dynamic> res = await Future.wait(fl);
  print(res);
}