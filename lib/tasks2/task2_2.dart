import 'dart:async';
import 'dart:io';

Future<List<int>> future = Future(() async {
  return [1, 2, 3, 4, 5, 6, 7, 8, 9]
  .where((x) => x % 2 == 0)
  .map((x) => x * x).toList();
});