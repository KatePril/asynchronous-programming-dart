import 'dart:async';


class AsyncFutureMapper<T, E> {
  final List<T> list;

  AsyncFutureMapper(this.list);

  Future<List<E>> asyncMap(E Function(T) toElement) async {
    List<E> res = [];
    for (final element in this.list) {
      res.add(toElement(element));
    }

    return res;
  }

  Future<List<T>> asyncFilter(bool Function(T) condition) async {
    List<T> res = [];
    for (final element in this.list) {
      if (condition(element)){
        res.add(element);
      }
    }
    return res;
  }
}

void demonstrateTaskTwo() {
  final asyncFutureMapper = AsyncFutureMapper([1, 2, 3, 4, 5, 6, 7, 8, 9]);

  asyncFutureMapper.asyncMap((x) async => x * x).then((list) async {
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

void demonstrateTaskTwoV2() async {
  final asyncFutureMapper = AsyncFutureMapper([1, 2, 3, 4, 5, 6, 7, 8, 9]);
  final list = await asyncFutureMapper.asyncMap((x) => x * x);

  final asyncFutureMapperTwo = AsyncFutureMapper(list);
  final filteredList = await asyncFutureMapperTwo.asyncFilter((x) => x % 2 == 0);

  for (var element in filteredList) {
    await Future.delayed(Duration(seconds: 1));
      print(element);
  }
}