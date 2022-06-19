import 'package:fets_mobile/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../features/models/project.dart';
import '../../../components/components.dart';

class TopArea extends StatelessWidget {
  const TopArea({
    Key? key,
    required this.project,
  }) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .42.sh,
      width: 1.sw,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/reset password.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 8.sp,
            left: 8.sp,
            child: CustomBackButton(
              onPress: () {
                if (serviceLocator.isRegistered(instance: project)) {
                  serviceLocator.unregister(instance: project);
                }
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
