import 'dart:async';
import 'dart:math';
import 'package:async/async.dart';

var isCancelled = false;

Stream<int> generate() async* {
  while (!isCancelled) {
    await Future.delayed(Duration(seconds: 1));
    yield Random().nextInt(100);
  }
}

void demoStream() async {
  final operation = CancelableOperation.fromSubscription(
    generate().listen(
      print,
      onDone: () => print("Done"),
      onError: (err) => print(err),
    )
  );

  await Future.delayed(Duration(seconds: 10), () {
    operation.cancel();
    isCancelled = true;
  });
}