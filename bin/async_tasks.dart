
import 'package:async_tasks/task1/ready/task1_ready.dart' show testAsyncMap;
// import 'package:async_tasks/tasks1/callbacks.dart' show test;
// import 'package:async_tasks/tasks1/ready/task1_v2_callbacks.dart' show demo;
// import 'package:async_tasks/tasks2/ready/task2_v2.dart' show demonstrateTaskTwo, demonstrateTaskTwoV2;
import 'package:async_tasks/task2/ready/parallelism.dart' show demoParallelism;

void main() async {
  // future.then((x) async {
  //   for (final val in x ){
  //     await Future.delayed(Duration(seconds: 1));
  //     print(val);
  //   }
  // });

  // testAsyncMap();
  // demonstrateTaskTwoV2();
  // demoParallelism();

  testAsyncMap();
}

// void asyncMap<E, T>(list List<E>, map function(E, function (error, T)), callback function (error, List<t>));

