import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/words_model/word.dart';
import '../../services/isar_service.dart';
part 'get_word_event.dart';
part 'get_word_state.dart';

class GetWordBloc extends Bloc<GetWordEvent, GetWordState> {
  GetWordBloc() : super(GetWordInitial()) {
    on<GetAllEvent>(getallW);
  }

  Future<void> getallW(
    GetAllEvent event,
    Emitter<GetWordState> emmit,
  ) async {
    emmit(GetProccesState());
    List<Words> all = await IsarService().getAllSura();
    emmit(GetAllState(allW: all));
    
  }
}
