part of 'getvocabluary_bloc.dart';

sealed class GetvocabluaryState {}

final class GetvocabluaryInitial extends GetvocabluaryState {}

class SuccesFirebaseData extends GetvocabluaryState {
  final List<List<List<VocabluaryModel>>> data;
  SuccesFirebaseData({required this.data});
}

class FailureFirebaseData extends GetvocabluaryState {}

class ProccesFirebaseData extends GetvocabluaryState {}

class NoConnectionFirebaseData extends GetvocabluaryState {}
