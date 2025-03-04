import 'package:checknetwork/internet/bloc/internet_bloc.dart';
import 'package:checknetwork/internet/bloc/internet_event.dart';
import 'package:checknetwork/internet/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetDisconnected) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, size: 80, color: Colors.red),
                  SizedBox(height: 10),
                  Text("Mất kết nối Internet", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<InternetBloc>().add(CheckConnection());
                    },
                    child: Text("Thử lại"),
                  ),
                ],
              );
            } else if (state is InternetConnected) {
              // Khi có mạng, điều hướng lại trang chủ
              if (Navigator.canPop(context)) {
                Future.microtask(() => Navigator.pop(context));
              }
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
