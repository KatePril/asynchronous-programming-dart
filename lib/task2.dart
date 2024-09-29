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
