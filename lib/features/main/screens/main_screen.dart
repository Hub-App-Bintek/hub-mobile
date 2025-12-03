import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/widgets/main_bottom_navigation_bar.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: controller.pages,
      ),
      bottomNavigationBar: Obx(() {
        final currentIndex = controller.selectedIndex.value;
        return MainBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: controller.onDestinationSelected,
        );
      }),
    );
  }
}
