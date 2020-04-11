import 'package:equatable/equatable.dart';

class EntranceState extends Equatable {
  @override
  List<Object> get props => [];
}

class EntranceInitial extends EntranceState {}

class LoginStep extends EntranceState {}

class EntranceEnd extends EntranceState {
  final String email;

  EntranceEnd({this.email});
}
