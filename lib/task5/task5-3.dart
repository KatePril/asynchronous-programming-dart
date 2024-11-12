import 'package:events_emitter/emitters/stream_event_emitter.dart';

void demoStreamEmitter() {
  final emitter = StreamEventEmitter();

  emitter.on<String>('message').listen((String data) {
    try {
      if (data.isNotEmpty) {
        print('String: $data');
      } else {
        throw Exception("The string is empty");
      }
    } catch(error) {
      print('Caught error: $error');
    }
  });

  emitter.on<double>('message').listen((double data) {
    try {
      if (data != 0) {
        print('double: ${100 / data}');
      } else {
        throw Exception("Division by zero");
      }
    } catch(error) {
      print('Caught error: $error');
    }
  });

  emitter.emit('message', 'Hi there');
  emitter.emit('message', '');
  emitter.emit('message', 32.1);
  emitter.emit('message', 0.0);

  emitter.close();

  try {
    emitter.emit('message', 36.1);
  } catch (e) {
    print(e);
  }

}