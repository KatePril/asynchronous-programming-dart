// import 'package:async_tasks/task1.dart' show demonstrateTaskOne;
// import 'package:async_tasks/task2.dart' show demonstrateTaskTwo, demonstrateTaskTwoV2;
// import 'package:async_tasks/task1_1.dart' show demoTask1V1, demoTask1V2, demoTask1V3;
// import 'package:async_tasks/tasks2/task2_2.dart' show future;
import 'package:async_tasks/tasks1/ready/task1_v2.dart' show testAsyncMap;
import 'package:async_tasks/tasks1/callbacks.dart' show test;
import 'package:async_tasks/tasks1/ready/task1_v2_callbacks.dart' show demo;

void main() async {
  // future.then((x) async {
  //   for (final val in x ){
  //     await Future.delayed(Duration(seconds: 1));
  //     print(val);
  //   }
  // });

  // testAsyncMap();
  demo();
}
