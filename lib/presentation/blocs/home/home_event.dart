
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();
}

class HomeTextOnlyEvent extends HomeEvent{
  final String message;

  const HomeTextOnlyEvent({required this.message});

  @override
  List<Object?> get props => [message];
}

class HomeTextAndImageEvent extends HomeEvent{
  final String message;
  final String? base64Image;

  const HomeTextAndImageEvent({required this.message, required this.base64Image});

  @override
  List<Object?> get props => [message];
}