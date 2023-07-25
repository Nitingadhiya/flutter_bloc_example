part of 'splash_bloc.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoginSuccessState extends SplashState {
  bool isLoggedIn;

  SplashLoginSuccessState(this.isLoggedIn);
}
