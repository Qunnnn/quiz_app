import 'package:equatable/equatable.dart';
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class SeverFailure extends Failure {
  @override
  List<Object> get props => throw UnimplementedError();
}
