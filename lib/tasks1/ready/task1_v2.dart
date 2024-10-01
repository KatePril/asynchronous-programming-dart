import 'dart:io';

class AsyncMapHolder<T, E> {
  void asyncMap(
    List<T> list, Future<E> Function(T val) map, 
    Function(E val) callback, 
    Future<E> Function(Object err) onErrorMap,
    Function(Object err) onErrorCallback
  ) async {
    for (final el in list) {
      try {
        callback(await map(el).catchError((err) => onErrorMap(err)));
      } catch (e) {
        onErrorCallback(e);
      }
    }
  }
}



void testAsyncMap() {
  final asyncMapHolder = AsyncMapHolder<String, int>();
  asyncMapHolder.asyncMap(["1", "2", "3", "4", "5a", "6", "7", "-8", "9"], (x) async {
    sleep(Duration(seconds: 1));
    return int.parse(x);
  }, (res) {
    if (res.isNegative) {
      throw Exception("res is negative");
    }
    print(res);
  }, (err) async {
    return 0;
  }, (err) async {
    print(err);
  });
}