import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  const Todo(
      {required this.id, required this.description, required this.completed});

  // Tutte le proprietà dovrebbero essere `final` nella nostra classe.
  final String id;
  final String description;
  final bool completed;

  // Dato che Todo è immutabile, implementiamo un metodo che ci permette di
  // clonare l'oggetto Todo con un contenuto leggermente diverso.

  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}
