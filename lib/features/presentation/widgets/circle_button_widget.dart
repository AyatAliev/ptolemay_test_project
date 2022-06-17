import 'package:flutter/material.dart';
import 'package:ptolemay_test_project/core/ui/app_colors.dart';

class CircleButtonWidget extends StatelessWidget {
  const CircleButtonWidget({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isInvisible = false,
  }) : super(key: key);

  final IconData icon;
  final Function() onTap;
  final bool isInvisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: isInvisible,
      maintainAnimation: isInvisible,
      maintainState: isInvisible,
      visible: !isInvisible,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}
