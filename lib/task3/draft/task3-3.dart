import 'package:async/async.dart';

class MyCancellable {
  var isCancelled = false;
  List list;
  Function map;

  MyCancellable(this.list, this.map);

  CancelableOperation operation() {
    return CancelableOperation.fromFuture(
        Future(() async* {
          for (final el in list) {
            if (isCancelled) break;
            await Future.delayed(Duration(seconds: 1));
            yield map(el);
          }
        }),
        onCancel: () {
          isCancelled = true;
          print("Cancelled");
        }
    );
  }
}

void demoCancellable() async {
  final cancellable = MyCancellable([1, 2, 3, 4, 5, 6, 7, 8, 9], (el) => el * el);
  final operation = cancellable.operation();
  operation.cancel();
  operation.asStream().forEach(print);
}