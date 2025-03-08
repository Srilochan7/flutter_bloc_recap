
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      
      emit(AuthLoading());
      try{
      final email = event.email;
      final password = event.password;

      if(password.length < 6) {
        emit(AuthFailure('Password cannot be less than 6 char'));
        return;
      }

      await Future.delayed(
        const Duration(seconds: 1), (){
          return emit(AuthSuccess(uid: '$email-$password'));
        }
        );
      }
      catch(e){
        return emit(AuthFailure(e.toString()));
      }
        

    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());
  try {
    await Future.delayed(Duration(seconds: 1)); // Simulate logout process delay
    emit(AuthInitial()); // Emit AuthInitial to notify that the user is logged out
  } catch (e) {
    emit(AuthFailure(e.toString())); // Handle any errors and emit failure state
  }
});

  }
}
