import 'package:flutter/material.dart';
import 'package:navigating_routing/model/UserModel.dart';

class SecondPage extends StatelessWidget {
  final UserModel data;
  const SecondPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Valyuta Kursi")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.title.toString(),
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Text("O'zbek so'mida  ${data.cbPrice} so'm",
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.normal)),
            ],
          ),
        ));
  }
}
