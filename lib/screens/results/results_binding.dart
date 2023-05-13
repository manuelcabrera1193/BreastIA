import 'package:breast_ia/screens/results/results_controller.dart';
import 'package:get/get.dart';

class ResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResultsController(), fenix: true);
  }
}
