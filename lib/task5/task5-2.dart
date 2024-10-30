import 'package:events_emitter/emitters/event_emitter.dart';

class Dog extends EventEmitter {
  final String name;

  Dog(this.name);

  void bark(String barking) => emit('bark', barking);
  void eat(String food) => emit('eat', food);
  void walk(String owner) => emit('walk', owner);
}

void demoDog() {
  final dog = Dog("Bailey");

  dog.on('bark', (String barking) => print('${dog.name} is barking: $barking'));
  dog.on('eat', (String food) => print('${dog.name} is eating $food'));
  dog.on('walk', (String owner) => print('$owner is walking ${dog.name}'));

  dog.bark('bark-bark');
  dog.eat('sausage');
  dog.walk('Emily');

  dog.listeners.clear();
}