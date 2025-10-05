import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/features/main/presentation/controllers/project_controller.dart';

class ProjectScreen extends GetView<ProjectController> {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Project Screen')));
  }
}
