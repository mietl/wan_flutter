import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsPageController());

    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        appBar: AppBar(
          title: const Text('设置'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: ListView(
            children: [
              ListTile(
                visualDensity: const VisualDensity(vertical: -2),
                title: const Text('主题'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                tileColor: Colors.white,
                trailing: const Icon(Icons.color_lens_outlined),
                onTap: controller.pickTheme,
              ),
            ],
          ),
        ));
  }
}
