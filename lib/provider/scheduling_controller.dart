import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';

class SchedulingController extends GetxController {
  final isScheduled = false.obs;
  static const int alarmId = 1;

  Future<bool> scheduledRestaurant(bool value) async {
    isScheduled.value = value;
    if (isScheduled.value) {
      print('Scheduling Restaurant Activated');
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        alarmId,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Scheduling Restaurant Canceled');
      return await AndroidAlarmManager.cancel(alarmId);
    }
  }
}
