import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/core/enums/theme.dart';
import 'package:flutter_bloc_example/core/extensions/translate_extension.dart';

import '../../../core/enums/language.dart';
import '../../bloc/language/localization_bloc.dart';
import '../../bloc/theme/theme_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  Widget _buildButton(context, String title, Language language) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(
          title,
        ),
        onPressed: () {
          BlocProvider.of<LanguageBloc>(context).add(language);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          _buildButton(context, 'TR', Language.TR),
          _buildButton(context, 'EN', Language.EN),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            context.xTr(
              'helloWorldOn',
              parameters: {
                'date': DateTime.utc(1997, 04, 01).toString(),
              },
            ),
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return SizedBox(
                height: 200,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      AppThemeMode themeMode = AppThemeMode.values[index];
                      return ListTile(
                        leading: Icon(
                          themeMode.iconData,
                          size: 24,
                        ),
                        // trailing: themeMode == state.selectedTheme ? const Icon(Icons.check_circle_rounded) : null,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(10.0),
                        //   side: themeMode == ThemeState.selectedTheme ? BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5) : BorderSide(color: Colors.grey[300]!),
                        // ),
                        title: Text(
                          themeMode.name,
                          // style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        onTap: () {
                          context.read<ThemeBloc>().add(ChangeThemeEvent(selectedThemeMode: AppThemeMode.values[index]));
                        },
                        // trailing: themeMode == ,
                      );
                    },
                    separatorBuilder: (contxext, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: AppThemeMode.values.length),
              );
            },
          )
        ],
      ),
    );
  }
}
