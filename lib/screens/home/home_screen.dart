import 'package:breast_ia/screens/auth/auth_controller.dart';
import 'package:breast_ia/screens/auth/auth_screen.dart';
import 'package:breast_ia/screens/home/home_controller.dart';
import 'package:breast_ia/screens/results/results_error_screen.dart';
import 'package:breast_ia/screens/utils/input.dart';
import 'package:breast_ia/screens/widgets/buttons_bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static const String routerName = '/Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authController = Get.find<AuthController>();
  final homeController = Get.find<HomeController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var inputs = List<double>.generate(30, (index) => (index - index).toDouble());

  String? description;

  bool loading = false;

  bool closing = false;

  final listItems = [
    'radius_mean',
    'texture_mean',
    'perimeter_mean',
    'area_mean',
    'smoothness_mean',
    'compactness_mean',
    'concavity_mean',
    'concave points_mean',
    'symmetry_mean',
    'fractal_dimension_mean',
    'radius_se',
    'texture_se',
    'perimeter_se',
    'area_se',
    'smoothness_se',
    'compactness_se',
    'concavity_se',
    'concave points_se',
    'symmetry_se',
    'fractal_dimension_se',
    'radius_worst',
    'texture_worst',
    'perimeter_worst',
    'area_worst',
    'smoothness_worst',
    'compactness_worst',
    'concavity_worst',
    'concave points_worst',
    'symmetry_worst',
    'fractal_dimension_worst'
  ];

  bool validateTextWithSingleDot(String text) {
    int dotCount = text.split('.').length - 1;
    return dotCount == 1;
  }

  @override
  Widget build(BuildContext context) {
    if (authController.state.value.userCredential == null) {
      Get.offAllNamed(AuthScreen.routerName);
    }

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
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: MediaQuery.of(context).size.width * 0.2,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Ingresa la Información",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ...listItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    child: textFormFieldCustom(
                      focusedBorderColor: Theme.of(context).primaryColor,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      labelText: item,
                      enabled: true,
                      initialValue: "",
                      validator: (value) {
                        if (value == null || value == "") {
                          return 'Enter $item';
                        }
                        if (value.contains(".") &&
                            !validateTextWithSingleDot(value)) {
                          return 'format invalid';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        inputs[listItems.indexOf(item)] =
                            double.parse(value ?? "0.0");
                      },
                    ),
                  );
                }).toList(),
                loading
                    ? const SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ButtonsBottomWidget(
                        event: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            homeController.validate(inputs);
                          }
                        },
                        back: () {
                          _formKey.currentState?.reset();
                        },
                      ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
