import 'package:async/async.dart';

List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9];

void demoCancellable() async {
  var isCancelled = false;

  final CancelableOperation operation = CancelableOperation.fromFuture(
      Future(() async {
        for (final el in list) {
          if (isCancelled) break;
          await Future.delayed(Duration(seconds: 1));
          print(el * el);
        }
      }),
      onCancel: () => print("Cancelled")
  );

  await Future.delayed(Duration(seconds: 5), () => operation.cancel());
  isCancelled = operation.isCanceled;
}