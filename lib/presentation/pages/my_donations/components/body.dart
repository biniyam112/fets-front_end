import 'package:fets_mobile/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  topShadow,
                  bottomShadow,
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Arab AID',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Text(
                                  'transaction id',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Status',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Donated projects',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(fontSize: 12),
                                    ),
                                    horizontalSpacing(4),
                                    Text(
                                      '${3}',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'total donations',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '${2234234.45}',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.sp,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                        ),
                        child: Text(
                          'All transactions',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpacing(20.sp),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  topShadow,
                  bottomShadow,
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        'All Projets',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: lightTextColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
