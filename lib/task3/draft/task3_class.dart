import 'package:async_tasks/task3/draft/cancellable.dart';

void demoCancellableClass() {
  Cancellable<int> cancellable = Cancellable((resolve, reject) async {
    try {
      for (int i = 0; i <= 10; i++) {
        print(i * i);
      }
      return resolve(0);
    } catch (err) {
      return reject(err);
    }
  });

  cancellable.run();

  cancellable.cancel();
}