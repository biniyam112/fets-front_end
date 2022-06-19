import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';


class CompanyCircleWidget extends StatelessWidget {
  const CompanyCircleWidget({
    Key? key,
    required this.companyLogo,
    required this.companyName,
  }) : super(key: key);
  final String companyLogo, companyName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32.sp,
            child: Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white24,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    companyLogo,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.indigo[800],
          ),
          verticalSpacing(8.sp),
          SizedBox(
            width: 62,
            child: Text(
              companyName,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
