import 'package:expandable/expandable.dart';
import 'package:fets_mobile/presentation/pages/project-detail/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubProjectTile extends StatelessWidget {
  const SubProjectTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
      // constraints: BoxConstraints.expand(width: 350.w, height: 180.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
        children: <Widget>[
          // SizedBox(
          //   height: 150,
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       color: Colors.orange,
          //       shape: BoxShape.rectangle,
          //     ),
          //   ),
          // ),
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                hasIcon: false,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
              ),
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                    dense: true,
                    title: const Text(
                      "HR Placement",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    trailing: Text(
                      "Completed",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "estimated budget:",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 8.8.sp),
                              ),
                              TextSpan(
                                text: " \$20,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                    fontSize: 8.8.sp),
                              ),
                            ])),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "estimated duration:",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 8.8.sp),
                              ),
                              TextSpan(
                                text: " s months 15 days",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                    fontSize: 8.8.sp),
                              ),
                            ])),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                        ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.w)),
                            child: VerticalDivider(
                              width: 20.w,
                              thickness: 3.w,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "approved budget:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 8.8.sp),
                              ),
                              TextSpan(
                                text: " \$20,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                    fontSize: 8.8.sp),
                              ),
                            ])),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "actual duration:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 8.8.sp),
                              ),
                              TextSpan(
                                text: " 3 months 15 days",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                    fontSize: 8.8.sp),
                              ),
                            ])),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Created at Jan, 09,2021",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Builder(builder: (context) {
                        var controller =
                            ExpandableController.of(context, required: true);
                        return controller!.expanded
                            ? const SizedBox()
                            : Icon(
                                Icons.expand_more,
                                color: Colors.grey,
                                size: 22.sp,
                              );
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
              collapsed: const SizedBox(),
              expanded: Container(
                margin: EdgeInsets.symmetric(vertical: 3.h),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: const Color(0xFFF6F9FE),
                    borderRadius: BorderRadius.all(Radius.circular(13.w))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tasks",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const TaskItemTile(),
                      const TaskItemTile(),
                    ]),
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.zero,
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
