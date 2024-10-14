import 'dart:async';
import 'package:async/async.dart';

Future<List> asyncMap(CancelableCompleter completer, List list, Function map) async {
  List result = [];

  try {
    for (final el in list) {
      if (completer.isCanceled) {
        break;
      }
      await Future.delayed(Duration(seconds: 1));
      print(el);
      result.add(map(el));
    }
  } catch (e) {
    completer.completeError(e);
  }
  return result;
}

void demoCompleter() async {
  final cancellableCompleter = CancelableCompleter();
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  asyncMap(cancellableCompleter, list, (el) => el * el);

  Future.delayed(Duration(seconds: 5), () {
    cancellableCompleter.operation.cancel();
  });

  try {
    await cancellableCompleter.operation.value;
    print('Task completed successfully.');
  } catch (e) {
    print(e);
  }
}