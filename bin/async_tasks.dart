// import 'package:async_tasks/task1.dart' show demonstrateTaskOne;
import 'package:async_tasks/task2.dart' show AsyncFutureMapper;

void main() async {
  final asyncFutureMapper = AsyncFutureMapper([1, 2, 3, 4, 5, 6, 7, 8, 9]);

  asyncFutureMapper.asyncMap((x) => x * x).then((list) async {
    for (final element in list) {
      await Future.delayed(Duration(seconds: 1));
      print("1: $element");
    }
  });

  asyncFutureMapper.asyncFilter((x) => x % 2 == 1).then((list) async {
    for (final element in list) {
      await Future.delayed(Duration(seconds: 1));
      print("2: $element");
    }
  });
}
