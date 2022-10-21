import 'package:get/get.dart';
import 'package:meta/meta.dart';

class TextEditorController extends GetxController {

  final _error = false.obs;
  set error(value) => _error.value = value;
  get error => _error.value;


}