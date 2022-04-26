import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AuthProvider extends ChangeNotifier {
  late BuildContext context;
  bool loading = false;

  init({required BuildContext context}) {
    this.context = context;
  }

  void isLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  TextEditingController carDesignController = TextEditingController();
  TextEditingController chassisNumberController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController engineController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();

  String imageURLSignUp = '';
  String imageURLVehicle = '';

  // validator
  final requiredValidator = RequiredValidator(errorText: 'Required');
  final emailValidator =
      EmailValidator(errorText: 'Enter a valid email address');
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
    // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);
}
