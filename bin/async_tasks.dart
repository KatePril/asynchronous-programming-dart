
// import 'package:async_tasks/task1/ready/task1_ready.dart' show testAsyncMap;
import 'package:async_tasks/task1/ready/task1_ready.dart';
import 'package:async_tasks/task3/test_cancellable.dart' show testCancellable;
import 'package:async_tasks/task3/task3_futures.dart' show demoCancellableFuture;
import 'package:async_tasks/task3/task3_callbacks.dart' show demoCancellableCallbacks;

void main() async {
  // testCancellable(2);
  // testCancellable([1, 2, 3, 4, 5, 6]);
  // demoCancellableFuture();
  demoCancellableCallbacks();
  // testAsyncMap();
}

