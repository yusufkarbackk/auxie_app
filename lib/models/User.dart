import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  User(this.id, this.email, {this.name, this.phoneNumber});

  @override
  String toString() {
    // TODO: implement toString
    return "[$id] - $name, $email";
  }

  @override
  // TODO: implement props
  List<Object> get props => [id, name, email, phoneNumber];
}
