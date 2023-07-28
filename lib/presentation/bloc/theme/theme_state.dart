part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {}

class ThemeInitial extends ThemeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ThemeChanges extends ThemeState {
  final AppThemeMode selectedTheme;

  ThemeChanges({required this.selectedTheme});

  @override
  // TODO: implement props
  List<Object?> get props => [selectedTheme];
}
