import 'package:flutter/material.dart';
import 'bloc/connection_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/connection_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionBloc, ConnectionStates>(
      listener: (context, state) {
        if (state is WifiConnectionState || state is MobileConnectionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("You are Online"),
            backgroundColor: Colors.green,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("You are Offline"),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: BlocBuilder<ConnectionBloc, ConnectionStates>(
            builder: (context, state) {
              if (state is NoConnectionState) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/no_internet.jpg'),
                        const Text(
                          'No internet Connection',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ]),
                );
              } else if (state is WifiConnectionState) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/wifi.png'),
                        const Text(
                          'Connected to Wifi',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ]),
                );
              } else if (state is MobileConnectionState) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/mobile_data.png'),
                        const Text(
                          'Mobile data',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ]),
                );
              } else {
                return Center(
                  child: Column(children: [Image.asset(''), const Text('')]),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
