import 'package:events_emitter/events_emitter.dart';

void demoEventEmitter() {
  EventEmitter emitter = EventEmitter();

  emitter.on('message', (String data) => print('String: $data'));
  emitter.on('message', (int data) => print('Integer: $data'));
  emitter.on('error', (error) => print('Caught error: $error'));

  emitter.once('message', (double data) => print('Double: $data'));

  emitter.emit('message', 'Hi there');
  emitter.emit('message', 'Orange');
  emitter.emit('message', 42);
  emitter.emit('message', 52);
  emitter.emit('message', 4.2);
  emitter.emit('message', 1.2);

  emitter.emit('error', Error());

  emitter.listeners.clear();

  emitter.emit('message', 'Fruit');
}