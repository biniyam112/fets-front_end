import 'package:fets_mobile/features/models/project.dart';
import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../services/services.dart';
import '../../../../theme/theme.dart';
import 'top_area.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.project,
  }) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SafeArea(
        child: Column(
          children: [
            const TopArea(),
            verticalSpacing(10.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.sp),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: .52.sh,
                  width: 1.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        project.name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      verticalSpacing(2.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: primaryColor,
                            size: 16.sp,
                          ),
                          horizontalSpacing(2.sp),
                          Text(
                            'Ethiopia,${project.location}',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: lightTextColor,
                                    ),
                          ),
                        ],
                      ),
                      verticalSpacing(16.sp),
                      Row(
                        children: [
                          Text(
                            '\$${project.fundedMoney}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            ' of ${project.estimatedBudget}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: lightTextColor),
                          ),
                        ],
                      ),
                      verticalSpacing(5.sp),
                      SizedBox(
                        height: 8.sp,
                        width: 1.sw / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            color: primaryColor,
                            backgroundColor: shadowColor,
                            value: project.fundedMoney.toDouble() /
                                project.estimatedBudget.toDouble(),
                          ),
                        ),
                      ),
                      verticalSpacing(16.sp),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'project details',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.black54),
                          ),
                          verticalSpacing(8.sp),
                          Text(
                            project.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: lightTextColor,
                                    ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              SendDonation.route,
                              arguments: project,
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                          ),
                          child: Text(
                            'Donate now',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
