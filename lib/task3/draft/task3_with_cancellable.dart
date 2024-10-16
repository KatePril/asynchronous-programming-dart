import 'dart:io';
import "package:async_tasks/task1/ready/aggregate_error.dart";

class AsyncMapHolder<T, E> {

  void asyncMap(
      List<T> list, Future<E> Function(T val) map,
      Function(List<E> list, [AggregateError? errors]) callback
      ) async {
    List<E> results = [];
    AggregateError errors = AggregateError.withMessage("Caught exceptions:");
    for (final el in list) {
      try {
        results.add(await map(el));
      } catch (e) {
        errors.addError(e);
      }
    }
    if (errors.isEmpty()) {
      callback(results);
    } else {
      callback(results, errors);
    }
  }
}


void testAsyncMap() {
  final asyncMapHolder = AsyncMapHolder<String, int>();
  asyncMapHolder.asyncMap(["1", "2", "3a", "4", "5a", "6", "7", "-8", "9"], (x) async {
    sleep(Duration(seconds: 1));
    return int.parse(x);
  }, (res, [errs]) {
    if (errs != null) {
      print(errs);
    }
    res.forEach(print);
  });
}