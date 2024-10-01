/* Task 1
  * Choose array fn (map/filter/filterMap/some/find/findIndex)
  * Prepare its callback based async counterpart
  * Prepare demo cases for the usage
  * Add new on-demend feature during review
    e.g.: Add support for debounce (if the task took less then X time to
    complete -- add an additional execution delya)
*/

import 'dart:io';

class AsyncMapper<T, E> {
  final List<T> list;

  AsyncMapper(this.list);

  Stream<E> asyncMap(E Function(T) toElement) async* {
    for (final value in this.list) {
      sleep(Duration(seconds: 1));
      yield toElement(value);
    }
  }

  Stream<T> asyncFilter(bool Function(T)condition) async* {
    for (final value in this.list) {
      sleep(Duration(seconds: 3));
      if (condition(value)) {
        yield value;
      }
    }
  }
  
}

void demonstrateTaskOne() async {
  final asyncMapper = AsyncMapper([1, 2, 3, 4, 5, 6, 7, 8, 9]);

  asyncMapper.asyncMap((x) => x * x).forEach((x) => print("1: $x"));
  asyncMapper.asyncFilter((x) => x % 2 == 0).forEach((x) => print("2: $x"));
}