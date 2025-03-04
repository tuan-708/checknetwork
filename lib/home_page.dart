import 'package:checknetwork/internet/bloc/internet_bloc.dart';
import 'package:checknetwork/internet/bloc/internet_state.dart';
import 'package:checknetwork/network_listener_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return NetworkListenerWidget(
      onConnected: () {
        print("Call api đi");
      },
      child: Scaffold(
        appBar: AppBar(title: Text(''),),
        body: Container(
            child: Center(
              child: Text("Hello"),
            ),
          ),
        
      ),
    );
  }
}