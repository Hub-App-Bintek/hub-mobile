import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/features/main/controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Profile Screen')));
  }
}
