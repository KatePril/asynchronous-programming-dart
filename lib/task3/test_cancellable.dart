import 'dart:async';
import 'package:async/async.dart';

void testCancellable(List<int> list) async {
  final operation = CancelableOperation.fromFuture(
    Future.delayed(Duration(seconds: 5), () => print('Operation completed')),
  );

  Future.delayed(Duration(seconds: 2), () {
    for (final val in list) {
      if (val == 2 || val == 4) {
        operation.cancel();
        print('Operation cancelled');
      } else {
        print('$val');
      }
    }
  });

  try {
    await operation.value;
  } catch (e) {
    print("Exception: $e");
  }
}