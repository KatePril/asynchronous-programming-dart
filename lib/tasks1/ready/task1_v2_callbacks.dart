import 'dart:io';

void asyncMap(dynamic val, callback, {Function? onError}) async {
  sleep(Duration(seconds: 1));
  try {
    callback(val);
  } catch (e) {
    if (onError != null) {
      onError(e);
    }
  }
}

void demo() {
  for (final element in [1, 2, 3, 4, "5", 6, 7, 8, 9]) {
    asyncMap(element, (el) {
      asyncMap(el * el, (elem) {
        print(elem);
      }, onError: (error) {
        print('Error occurred: $error');
      });
    }, onError: (error) {
      print('Error occurred: $error');
    });
  }
}
