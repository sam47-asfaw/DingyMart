import 'package:dingy_mart/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomFormField(
        buttonTitle: 'Signup',
      ),
    );
  }
}
