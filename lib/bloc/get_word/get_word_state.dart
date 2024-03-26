part of 'get_word_bloc.dart';

sealed class GetWordState {}

final class GetWordInitial extends GetWordState {}

class GetProccesState extends GetWordState {}

class GetAllState extends GetWordState {
  final List<Words> allW;
  GetAllState({required this.allW});
}
