import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'questionnaire_bloc.dart';

class QuestionnaireScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Опросник')),
      body: Center(
        child: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return CircularProgressIndicator();
            }
            if (state is LoadedState) {
              final questionnaire = state.data;
              if (questionnaire.isNotStarted) {
                return Text('Опросник не заполнен');
              } else if (questionnaire.isInProgress) {
                return Text('Опросник в процессе заполнения (${questionnaire.fillPercent}%)');
              } else {
                return Text('Опросник заполнен');
              }
            }
            return Text('Нажмите кнопку "Обновить"');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<QuestionnaireBloc>().add(FetchEvent()),
        child: Icon(Icons.refresh),
      ),
    );
  }
}