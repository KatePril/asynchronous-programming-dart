import 'package:events_emitter/events_emitter.dart';

class Fruit {
  final String name;
  Fruit(this.name);
}

class EatEvent extends Event<Fruit> {
  final Fruit fruit;

  EatEvent(this.fruit) : super('eat', fruit);
}

void demoEatEvent() {
  final emitter = EventEmitter();

  emitter.on('eat', (Fruit fruit) => print("It is ${fruit.name}"));
  emitter.on('eat', (EatEvent event) => print("${event.fruit.name} is being eaten"));

  emitter.emitEvent(EatEvent(Fruit("Watermelon")));
}