part of 'apps_cubit.dart';

@immutable
abstract class AppsState {}

class GetDictionaryInitial extends AppsState {}

class GetDictionaryLoaded extends AppsState {
  final List<dynamic> allMyWords;
  GetDictionaryLoaded({required this.allMyWords});

}

class GetDictionaryFailed extends AppsState {}

class VideoWords extends AppsState {}

class AudioWords extends AppsState {}

class PicWords extends AppsState {}

class TranArWords extends AppsState {}

class TranEnWords extends AppsState {}

class ExampleWords extends AppsState {}

