import 'package:get/get.dart';

validation(
    {required String value,
    required int minValue,
    required int maxValue,
    required String typeOfValidation}) {
  if (typeOfValidation == 'name') {
    if (!GetUtils.isUsername(value)) {
      return 'Please enter a valid user name';
    }
  }
  if (typeOfValidation == 'email') {
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email ';
    }
  }
  if (typeOfValidation == 'Number') {
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Please enter a valid number';
    }
  }
  if (value.isEmpty) {
    return "This field is required";
  }
  if (value.length < minValue) {
    return "Can't be less than $minValue character";
  }
  if (value.length > maxValue) {
    return "Can't be more than $maxValue character";
  }
}

confirmValidate(String passwordValue, String confirmPasswordValue) {
  if (confirmPasswordValue != passwordValue ||
      confirmPasswordValue.isEmpty ||
      passwordValue.isEmpty) {
    return "Passwords didn't match ";
  }
}
