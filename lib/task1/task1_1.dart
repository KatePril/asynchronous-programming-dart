import 'dart:async';
import 'dart:io';

Stream<int> stream = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9]);

Stream<int> mappedStream = stream
  .where((x) => x % 2 == 1)
  .asyncMap((x) async {
    sleep(Duration(seconds: 1));
    return x * x;
  });

void demoTask1V1() {
  mappedStream.listen((x) => print(x));
}

Stream<String> streamStr = Stream.fromIterable(["1", "2", "3", "4", "5a", "6", "7", "8", "9"]);

// Stream<int> mappedStreamStr = streamStr.asyncMap((x) async {
//   sleep(Duration(seconds: 1));
//   return int.parse(x);
// });

void demoTask1V2() {
  // mappedStreamStr.listen(print, 
  // onError: (err) {
  //   print(err);
  // });
}

Stream<dynamic> demoTask1V3() {
  StreamController controller = StreamController();
  streamStr.listen((x) {
    try {
    sleep(Duration(seconds: 1));
    controller.add(int.parse(x));
    } catch (err) {
      controller.close();
    }
  });

  return controller.stream;
}