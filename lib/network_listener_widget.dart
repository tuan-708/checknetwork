import 'package:checknetwork/internet/bloc/internet_state.dart';
import 'package:checknetwork/internet/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkListenerWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onConnected;

  const NetworkListenerWidget({Key? key, required this.child, this.onConnected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetDisconnected) {
          Navigator.pushNamed(context, '/no-internet');
        } else if (state is InternetConnected) {
          if(Navigator.canPop(context)){
            Navigator.pop(context);
          }
          onConnected?.call(); 
        }
      },
      child: child,
    );
  }
}