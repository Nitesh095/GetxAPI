import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/res/components/round_button.dart';
import 'package:getx_part2/utils/utils.dart';
import 'package:getx_part2/utils/validators.dart';
import 'package:getx_part2/view_model/controllers/login/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController.emailController.value,
                focusNode: loginController.emailFocusNode.value,
                validator: (value) => Validators.emaiValidator(value),
                onFieldSubmitted: (value) => Utils.onFocusChange(
                  context,
                  loginController.emailFocusNode.value,
                  loginController.passwordFocusNode.value,
                ),
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "abc@gmail.com",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: loginController.passwordController.value,
                focusNode: loginController.passwordFocusNode.value,
                validator: (value) => Validators.passwordValidator(value),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Abc@123",
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => RoundButton(
                  title: "Login",
                  titleSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 50,
                  width: double.infinity,
                  loading: loginController.loading.value,
                  onTap: onTap,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTap() {
    if (_formKey.currentState!.validate()) {
      loginController.login();
    }
  }
}
