import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
      constraints: BoxConstraints.expand(height: 125.h, width: double.infinity),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.sp))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.sp),
                child: SizedBox(
                  height: 45.h,
                  width: 50.w,
                  child: Image.asset(
                    'assets/images/featured.jpg',
                    // width: 1.sw,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                child: Transform.translate(
                  offset: Offset(0, -13.sp),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          visualDensity: const VisualDensity(
                            vertical: -4,
                          ),
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          title: Text("Starving children in Kototo",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)),
                          subtitle: Text(
                            "Ethiopia,Kototo",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade400,
                                fontSize: 9.5.sp),
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "\$812,655 ",
                              style: TextStyle(fontSize: 9.sp)),
                          TextSpan(
                              text: " of 1,020,000 ",
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 9.sp)),
                        ])),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        SizedBox(
                          width: 150.w,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.w)),
                              child: LinearProgressIndicator(
                                // backgroundColor: Colors.grey.shade300,
                                value: 0.4,
                                minHeight: 3.5.h,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Text("project",
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w700,
                      fontSize: 11.sp))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.h),
            child: Text(
              ''' In publishing and graphic design, Lorem ipsum is a placeholder
demonstrate the visual form of a document or a typeface without. 
Lorem ipsum may  be used as a placeholder before the final copy. ''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 9.sp,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
