import 'package:flutter/material.dart';
import 'package:web_dashboard/utils/extensions.dart';

import '../../widgets/search_field.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              if (onPressed != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.menu),
                  ),
                ),
              Expanded(
                child: SearchField(onSearch: (v) {}),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  DateTime.now().formatdMMMMY(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const SizedBox(
                width: 200,
                // child: TaskProgress(data: controller.dataTask),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // _TaskInProgress(data: controller.taskInProgress),
          const SizedBox(height: 40),
          // const _HeaderWeeklyTask(),
          const SizedBox(height: 20),
          // _WeeklyTask(
          //   data: controller.weeklyTask,
          //   onPressed: controller.onPressedTask,
          //   onPressedAssign: controller.onPressedAssignTask,
          //   onPressedMember: controller.onPressedMemberTask,
          // )
        ],
      ),
    );
  }
}
