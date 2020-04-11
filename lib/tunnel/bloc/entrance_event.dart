import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class EntranceEvent extends Equatable {
  const EntranceEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends EntranceEvent {}

class LoggedIn extends EntranceEvent {
  final String email;

  const LoggedIn({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'LoggedIn { email: $email }';
}

class LoggedOut extends EntranceEvent {}
