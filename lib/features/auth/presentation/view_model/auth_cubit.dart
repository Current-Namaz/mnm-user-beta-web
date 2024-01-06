

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/view/home_screen.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  void onLoginTap(BuildContext context){
    // Todo: add validations
    // Todo : API call
    Navigator.of(context).pushReplacementNamed(HomeScreen.route);
  }
}
