import 'package:breast_ia/screens/results/results_error_screen.dart';
import 'package:breast_ia/screens/results/results_success_screen.dart';
import 'package:get/get.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class HomeController extends GetxController {
  void validate(List<double> inputs) async {
    var output = List.filled(1, 0).reshape([1, 1]);

    final interpreter = await Interpreter.fromAsset('model.tflite');
    interpreter.run(inputs, output);
    // interpreter.run([
    //   27.98,
    //   15.38,
    //   322.8,
    //   1001.0,
    //   0.1184,
    //   0.27760,
    //   0.3001,
    //   0.1471,
    //   0.2419,
    //   0.07871,
    //   1.095,
    //   0.9053,
    //   8.589,
    //   153.4,
    //   0.006399,
    //   0.0490,
    //   0.05373,
    //   0.01587,
    //   0.03003,
    //   0.006193,
    //   25.38,
    //   17.33,
    //   184.60,
    //   2019.0,
    //   0.1622,
    //   0.6656,
    //   0.71119,
    //   0.2654,
    //   0.4601,
    //   0.11890
    // ], output);
    final listTensors = interpreter.getOutputTensors();
    final data = listTensors[0].name;
    try {
      final result = data.split(":");
      if (result[1].trim() == "0") {
        Get.offAndToNamed(ResultsSuccessScreen.routerName);
      } else {
        Get.offAndToNamed(ResultsErrorScreen.routerName);
      }
    } catch (e) {
      print("$e");
    }
  }
}
