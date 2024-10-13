import 'dart:io';
import 'package:async/async.dart';
import 'package:async_tasks/task1/ready/aggregate_error.dart';

final operation = CancelableOperation.fromValue(0);

void asyncMap(list, map,  Function(List list, [AggregateError? errors]) callback) async {
  var results = [];
  AggregateError aggregateError = AggregateError.withMessage("Caught exceptions:");
  for (final el in list) {
    try {
      results.add(await map(el));
    } catch (e) {
      aggregateError.addError(e);
      results.add(await operation.value);
      operation.cancel();
    }
  }
  if (aggregateError.isEmpty()) {
    callback(results);
  } else {
    callback(results, aggregateError);
  }
}

void demoCancellableCallbacks() {
  asyncMap([1, 2, 3, "4", 5, 6, "7", 8, 9], (x) {
    sleep(Duration(seconds: 1));
    return x * x;
  }, (res, [errs]) {
    if (errs != null) {
      print(errs);
    }
    res.forEach(print);
  });
}