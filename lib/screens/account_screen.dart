import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vair_app/controllers/auth_controller.dart';

class AccountScreen extends StatelessWidget {
  final _authController = Get.put(AuthController());

  AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account')),
      body: ListView(
        children: [
          if (_authController.isUserSignedIn.isTrue)
            Obx(() => Text(_authController.authUser.value?.id.toString() ??
                'Sign in to see your account detail')),
          Obx(() =>
              Text(_authController.authUser.value?.username ?? "Unauthorized")),
        ],
      ),
    );
  }
}
