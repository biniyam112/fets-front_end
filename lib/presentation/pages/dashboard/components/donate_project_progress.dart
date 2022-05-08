import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonateProjectProgress extends StatelessWidget {
  const DonateProjectProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progressValue = 4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 90.w,
          height: 90.h,
          margin: EdgeInsets.only(left: 20.w),
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 13,
                showLabels: false,
                startAngle: 270,
                endAngle: 270,
                showTicks: false,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: Color.fromARGB(255, 233, 233, 233),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: progressValue,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Text(
                        progressValue.toStringAsFixed(0) + ' / 13',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ])
          ]),
        ),
        SizedBox(
          width: 100.w,
          child: Center(
            child: Text('4 out of 13 projects completed',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700)),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          constraints: BoxConstraints.expand(height: 23.h, width: 100.w),
          child: ElevatedButton(
            onPressed: () {},
            child: Center(
              child: RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Text('See all ',
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w700))),
                WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 8.w,
                    ))
              ])),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.w),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
