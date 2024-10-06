import 'dart:async';


class AsyncFutureMapper<T, E> {
  final List<T> list;

  AsyncFutureMapper(this.list);

  Future<List<E>> asyncMap(Future<E> Function(T) toElement) async {
    List<E> res = [];
    for (final element in this.list) {
      if (element == 3) {
        throw Exception("Ooops");
      }
      res.add(await toElement(element));
    }

    return res;
  }

  Future<List<T>> asyncFilter(Future<bool> Function(T) condition) async {
    List<T> res = [];
    for (final element in this.list) {
      if (element == 4) {
        throw Exception("Ooops");
      }
      if (await condition(element)){
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
  }).catchError((err) {
    print(err);
    return null;
  });

  asyncFutureMapper.asyncFilter((x) async => x % 2 == 1).then((list) async {
    for (final element in list) {
      await Future.delayed(Duration(seconds: 1));
      print("2: $element");
    }
  }).catchError((err) {
    print(err);
    return null;
  });
}

void demonstrateTaskTwoV2() async {
  final asyncFutureMapper = AsyncFutureMapper([1, 2, 3, 4, 5, 6, 7, 8, 9]);
  final list = await asyncFutureMapper.asyncMap((x) async => x * x)
    .catchError((err) {
      print(err);
      return [];
    });

  final asyncFutureMapperTwo = AsyncFutureMapper(list);
  final filteredList = await asyncFutureMapperTwo.asyncFilter((x) async => x % 2 == 0)
    .catchError((err) {
      print(err);
      return [];
    });

  for (var element in filteredList) {
    await Future.delayed(Duration(seconds: 1));
    print(element);
  }
}