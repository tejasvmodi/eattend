import 'package:design/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordForm extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> animation;
  const ForgotPasswordForm({
    Key? key,
    required this.animationController,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo1.jpg',
            height: animationController.value * 200,
            width: animationController.value * 300,
          ),
          
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Enter Your Email',
              ),
            ),
          ),
          FilledButton.icon(
            icon: const Icon(Icons.email),
            label: const Text('Reset Your Password'),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                ForgotPasswordController.instance
                    .resetPassword(controller.email.text.trim());
              }
            },
          ),
        ],
      ),
    );
  }
}
