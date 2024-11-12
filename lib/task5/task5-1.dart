import 'package:events_emitter/events_emitter.dart';

void demoEventEmitter() {
  EventEmitter emitter = EventEmitter();

  emitter.on('message', (String data) {
    try {
      if (data.isNotEmpty) {
        print('String: $data');
      } else {
        throw Exception("The string is empty");
      }
    } catch(error) {
      emitter.emit('error', error);
    }
  });
  emitter.on('message', (int data) {
    try {
      if (data != 0) {
        print('Integer: ${100 / data}');
      } else {
        throw Exception("Division by zero");
      }
    } catch(error) {
      emitter.emit('error', error);
    }
  });
  emitter.on('error', (error) => print('Caught error: $error'));

  emitter.once('message', (double data) => print('Double: $data'));

  emitter.emit('message', 'Hi there');
  emitter.emit('message', '');
  emitter.emit('message', 42);
  emitter.emit('message', 0);
  emitter.emit('message', 4.2);
  emitter.emit('message', 1.2);

  emitter.emit('error', Error());

  emitter.emit('someEvent', "Hello world");

  emitter.listeners.clear();

  emitter.emit('message', 'Fruit');
}