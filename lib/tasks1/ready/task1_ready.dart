import 'dart:io';

class AsyncMapHolder<T, E> {
  void asyncMap(
    List<T> list, Future<E> Function(T val) map, 
    Function(List<E> list, [List<Object>? errors]) callback
  ) async {
    List<E> results = [];
    List<Object> errors = [];
    for (final el in list) {
      try {
        results.add(await map(el));      
      } catch (e) {
        errors.add(e);
      }
    }
    callback(results);
  }
}


void testAsyncMap() {
  final asyncMapHolder = AsyncMapHolder<String, int>();
  asyncMapHolder.asyncMap(["1", "2", "3", "4", "5a", "6", "7", "-8", "9"], (x) async {
    sleep(Duration(seconds: 1));
    return int.parse(x);
  }, (res, [errs]) {
    res.forEach(print);
  });
}