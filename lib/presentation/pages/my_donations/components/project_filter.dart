import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';

class ProjectsFilter extends StatelessWidget {
  const ProjectsFilter({
    Key? key,
    required this.selectedIndex,
    required this.onChanged,
    required this.filters,
  }) : super(key: key);
  final int selectedIndex;
  final void Function(int index) onChanged;
  final List<String> filters;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(filters.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () => onChanged(index),
                child: Container(
                  height: 40.sp,
                  margin: EdgeInsets.symmetric(vertical: 6.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedIndex == index
                        ? primaryColor
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        filters[index],
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : lightTextColor,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
