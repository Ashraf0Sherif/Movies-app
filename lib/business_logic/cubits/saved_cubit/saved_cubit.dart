import 'package:bloc/bloc.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());

  void addSaved() {
    emit(SavedReact());
  }

  void remSaved() {
    emit(SavedInitial());
  }
}
