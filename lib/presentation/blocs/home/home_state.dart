
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
  const HomeState();
}

final class HomeInitialState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeSuccessState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeFailureState extends HomeState{
  @override
  List<Object?> get props => [];
}