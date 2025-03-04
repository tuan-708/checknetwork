import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final InternetConnectionChecker connectionChecker;
  late StreamSubscription connectionSubscription;

  InternetBloc(this.connectionChecker) : super(InternetInitial()) {
    on<CheckConnection>((event, emit) async {
      if (await connectionChecker.hasConnection) {
        emit(InternetConnected());
      } else {
        emit(InternetDisconnected());
      }
    });

    // Lắng nghe thay đổi trạng thái mạng
    connectionSubscription = connectionChecker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        add(CheckConnection());
      } else {
        emit(InternetDisconnected());
      }
    });
  }

  @override
  Future<void> close() {
    connectionSubscription.cancel();
    return super.close();
  }
}