import 'package:async_tasks/task1.dart' show AsyncMapper;

void main() {
  final asyncMapper = AsyncMapper([1, 2, 3, 4, 5, 6, 7, 8, 9]);

  asyncMapper.asyncMap((x) => x * x).forEach((x) => print("1: $x"));
  asyncMapper.asyncFilter((x) => x % 2 == 0).forEach((x) => print("2: $x"));
}
