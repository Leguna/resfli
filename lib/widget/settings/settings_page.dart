import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';

const settingsRoute = '/settings';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final SchedulingController _schedulingController = Get.put(
    SchedulingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Material(
            child: ListTile(
              title: const Text('Scheduling Restaurant'),
              trailing: Obx(
                () => Switch.adaptive(
                  value: _schedulingController.isScheduled.value,
                  onChanged: (value) async {
                    if (Platform.isIOS) {
                      customDialog(context);
                    } else {
                      _schedulingController.scheduledRestaurant(value);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
