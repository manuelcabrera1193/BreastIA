import 'package:breast_ia/screens/auth/auth_controller.dart';
import 'package:breast_ia/screens/auth/auth_screen.dart';
import 'package:breast_ia/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsSuccessScreen extends StatefulWidget {
  static const String routerName = '/ResultsSuccess';

  const ResultsSuccessScreen({Key? key}) : super(key: key);

  @override
  State<ResultsSuccessScreen> createState() => _ResultsSuccessScreenState();
}

class _ResultsSuccessScreenState extends State<ResultsSuccessScreen> {
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
              child: Icon(Icons.check, color: Colors.green),
            ),
          ),
          const SizedBox(height: 60),
          const Center(child: Text('Benigno')),
          const Spacer(),
          FloatingActionButton.large(
            onPressed: () {
              Get.offAndToNamed(HomeScreen.routerName);
            },
            child: const Icon(Icons.restart_alt_outlined),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
