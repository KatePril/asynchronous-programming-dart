import 'dart:async';

class Cancellable<T> {
  bool cancelled = false;
  Future<T> Function(Function(T val) resolve, Function(Object err) reject) executor;

  Cancellable(this.executor);

  Future<T> run() async {
    Completer<T> completer = Completer();

    try {
      await executor((val) {
        if (!cancelled) {
          completer.complete(val);
        } else {
          completer.completeError(Exception("Cancelled"));
        }
      }, (err) {
        if (!cancelled) {
          completer.completeError(err);
        } else {
          completer.completeError(Exception("Cancelled"));
        }
      });
    } catch (e) {
      if (!cancelled) {
        completer.completeError(e);
      }
    }

    return completer.future;
  }

  void cancel() {
    cancelled = true;
  }
}