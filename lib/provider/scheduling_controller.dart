import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resfli/index.dart';

class SchedulingController extends GetxController {
  final isScheduled = false.obs;
  static const int alarmId = 1;
  static const String isScheduledKey = "isScheduled";

  @override
  void onInit() {
    super.onInit();
    checkScheduled();
  }

  void checkScheduled() async {
    final box = GetStorage();
    final isScheduled = box.read(isScheduledKey) ?? false;
    this.isScheduled.value = isScheduled;
  }

  Future<bool> scheduledRestaurant(bool value) async {
    isScheduled.value = value;
    GetStorage().write(isScheduledKey, value);
    if (isScheduled.value) {
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        alarmId,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      return await AndroidAlarmManager.cancel(alarmId);
    }
  }
}
