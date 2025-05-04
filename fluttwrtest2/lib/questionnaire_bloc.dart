import 'package:flutter_bloc/flutter_bloc.dart';
import 'questionnaire.dart';
import 'questionnaire_repository.dart';

// BLoC события
abstract class QuestionnaireEvent {}
class FetchEvent extends QuestionnaireEvent {}

// BLoC состояния
abstract class QuestionnaireState {}
class LoadingState extends QuestionnaireState {}
class LoadedState extends QuestionnaireState {
  final Questionnaire data;

  LoadedState(this.data);
}

// BLoC
class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  final QuestionnaireRepository repo;

  QuestionnaireBloc(this.repo) : super(LoadingState()) {
    on<FetchEvent>((event, emit) async {
      emit(LoadingState());
      try {
        emit(LoadedState(await repo.fetch()));
      } catch (e) {
        print("ВСЁ ПЛОХО: $e");
      }
    });
  }
}