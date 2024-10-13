import 'dart:async';
import 'dart:math';
import 'package:async/async.dart';


Stream<int> generate() async* {
  while (true) {
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

  await Future.delayed(Duration(seconds: 10), () => operation.cancel());

}