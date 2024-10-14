import 'package:async/async.dart';

Stream<dynamic> mapList(List<dynamic> list, Function map) async* {
  for (final el in list) {
    await Future.delayed(Duration(seconds: 1));
    yield map(el);
  }
}

void demoStream() async {
  List list = [3.4, 8.1, 4.21, 5.6, 10.3, 1.33, 0.99, 4.12];
  final operation = CancelableOperation.fromSubscription(
    mapList(list, (double el) => el.toInt()).listen(
      print,
      onDone: () => print("Done"),
      onError: (err) => print(err),
    )
  );
  await Future.delayed(Duration(seconds: 5), () => operation.cancel());
}