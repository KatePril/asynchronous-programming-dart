import 'dart:async';

Future cancellable(List<dynamic> list) async {
  var cancelled = false;
  final next = Future(() async {
    for (final el in list) {
      if (cancelled) {
        throw Exception("Cancelled");
      }
      print(el * el);
      await Future.delayed(Duration(seconds: 1));
    }
    return "Completed";
  });
  return next.catchError((e) {
    cancelled = true;
    return e;
  });
}

void demoCancellable() async {
  try {
    final future = await cancellable([1, 2, 3, 4, "5", 6, 7, 8, 9]);
    await Future.delayed(Duration(seconds: 10));
    print(future);
  } catch (e) {
    print(e); // Handle the cancellation error
  }
}
