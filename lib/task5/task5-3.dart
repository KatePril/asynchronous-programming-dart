import 'package:events_emitter/emitters/stream_event_emitter.dart';

void demoStreamEmitter() {
  final emitter = StreamEventEmitter();

  emitter.on<String>('message').listen((String data) => print('String: $data'));
  emitter.on<double>('message').listen((double data) => print('double: $data'));

  emitter.emit('message', 'Hi there');
  emitter.emit('message', 32.1);

  emitter.close();

  try {
    emitter.emit('message', 36.1);
  } catch (e) {
    print(e);
  }

}