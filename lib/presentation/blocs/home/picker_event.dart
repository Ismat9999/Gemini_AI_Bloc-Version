
import 'package:equatable/equatable.dart';

abstract class PickerEvent extends Equatable{}

class SelectedPhotoEvent extends PickerEvent{
  @override
  List<Object?> get props => [];
}

class ClearedPhotoEvent extends PickerEvent{
  @override
  List<Object?> get props => [];
}