import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/injection_container.dart';
import 'package:flutter_bloc_example/presentation/bloc/number_trivia/number_trivia_bloc.dart';

import '../../domain/entities/number_trivia.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_display.dart';
import '../widgets/trivia_controls.dart';
import '../widgets/trivia_display.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NumberTriviaBloc>(
      create: (context) => locator.get<NumberTriviaBloc>(),
      child: NumberTriviaView(),
    );
  }
}

class NumberTriviaView extends StatelessWidget {
  const NumberTriviaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia1'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
            builder: (context, state) {
              // return TriviaDisplay(numberTrivia: NumberTrivia(number: 12, text: 'abc abcabcabcab cabc abcabcabcabcabcabc abcabcabcabcabcabcabc abcabcabcabcabc abcabcabcabc abcabcabc abcabcabc abcabcabc cabc abcabcabcabcabcabc abcabcabcabcabcabcabc abcabcabcabcabc abcabcabcabc abcabcabc abcabcabc abcabcabc cabc abcabcabcabcabcabc abcabcabcabcabcabcabc abcabcabcabcabc abcabcabcabc abcabcabc abcabcabc abcabcabc  cabc abcabcabcabcabcabc abcabcabcabcabcabcabc abcabcabcabcabc abcabcabcabc abcabcabc abcabcabc abcabcabc'));
              if (state is Empty) {
                return MessageDisplay(message: 'Start Searching');
              } else if (state is Error) {
                return MessageDisplay(message: state.message);
              } else if (state is Loading) {
                return const LoadingWidget();
              } else if (state is Loaded) {
                return TriviaDisplay(numberTrivia: state.trivia);
              }
              return Container();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TriviaControlsState()
        ],
      ),
    );
  }
}
