import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_trivia/number_trivia_bloc.dart';

class TriviaControlsState extends StatefulWidget {
  const TriviaControlsState({super.key});

  @override
  State<TriviaControlsState> createState() => _TriviaControlsStateState();
}

class _TriviaControlsStateState extends State<TriviaControlsState> {
  String? inputStr;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Number'),
        ),
        SizedBox(
          height: 20,
        ),
        Placeholder(
          fallbackHeight: 40,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  dispatchConcrete();
                },
                child: Text('Search'),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () {
                  dispatchRandom();
                },
                child: Text('Random'),
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForConcreteNumber(inputStr!));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  }
}
