import 'dart:io';
import "package:async_tasks/task1/ready/aggregate_error.dart";

class AsyncMapHolder<T, E> {

  void asyncMap(
      List<T> list, Future<E> Function(T val) map,
      Function(List<E> list, [AggregateError? errors]) callback
      ) async {
    List<E> results = [];
    List<Object> errors = [];
    for (final el in list) {
      try {
        results.add(await map(el));
      } catch (e) {
        errors.add(e);
      }
    }
    if (errors.isEmpty) {
      callback(results);
    } else {
      callback(results, AggregateError(errors));
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