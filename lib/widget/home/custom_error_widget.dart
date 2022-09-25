import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    this.message = "Error! Check Your Connection.",
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.w,
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_rounded,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            message.isEmpty
                ? "Error! Check Your Connection."
                : message[0].toUpperCase() + message.substring(1),
          ),
        ],
      ),
    );
  }
}
