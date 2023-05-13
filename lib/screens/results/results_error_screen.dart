import 'package:breast_ia/screens/auth/auth_controller.dart';
import 'package:breast_ia/screens/auth/auth_screen.dart';
import 'package:breast_ia/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsErrorScreen extends StatefulWidget {
  static const String routerName = '/ResultsError';

  const ResultsErrorScreen({Key? key}) : super(key: key);

  @override
  State<ResultsErrorScreen> createState() => _ResultsErrorScreenState();
}

class _ResultsErrorScreenState extends State<ResultsErrorScreen> {
  final authController = Get.find<AuthController>();

  bool closing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(authController.state.value.userCredential?.user?.email ?? "")
          ],
        ),
        actions: [
          FloatingActionButton(
            elevation: 0,
            onPressed: () async {
              closing = true;
              setState(() {});
              await FirebaseAuth.instance.signOut();
              closing = false;
              setState(() {});
              Get.offAndToNamed(AuthScreen.routerName);
            },
            child: closing
                ? const CircularProgressIndicator()
                : const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Transform.scale(
            scale: 3,
            child: const CircleAvatar(
              child: Icon(Icons.close, color: Colors.redAccent),
            ),
          ),
          const SizedBox(height: 60),
          const Center(child: Text('Maligno')),
          const Spacer(),
          FloatingActionButton.large(
            onPressed: () {
              Get.offAndToNamed(HomeScreen.routerName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Icon(Icons.restart_alt_outlined),
                  Text("Reset")
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
