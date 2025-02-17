import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/bloc/auth_bloc.dart';
import 'package:flutter_responsive_login_ui/login_screen.dart';
import 'package:flutter_responsive_login_ui/widgets/gradient_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthInitial){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),
            ),
            (route) => false,
            );
          }
        },
        builder: (context, state) {
          if(state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
              children: [
                Center(
                  child :Text("Hii"),
                ),
                GradientButton(onPressed: (){
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                })
                
              ],
            );
        },
      ),
    );
  }
}