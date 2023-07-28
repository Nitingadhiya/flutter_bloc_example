part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {}

class ChangeThemeEvent extends ThemeEvent {
  final AppThemeMode selectedThemeMode;

  ChangeThemeEvent({required this.selectedThemeMode});

  @override
  // TODO: implement props
  List<Object?> get props => [selectedThemeMode];
}
