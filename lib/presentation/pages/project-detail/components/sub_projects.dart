import 'package:fets_mobile/presentation/pages/project-detail/components/components.dart';
import 'package:fets_mobile/presentation/pages/project-detail/components/mock_data.dart';
import 'package:fets_mobile/presentation/pages/project-detail/components/sub_project_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class SubProjects extends StatefulWidget {
  const SubProjects({Key? key}) : super(key: key);

  @override
  State<SubProjects> createState() => _SubProjectsState();
}

class _SubProjectsState extends State<SubProjects> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            (Mockdata.subProjectList[index] as SubProjectItem).isExpanded =
                !isExpanded;
          });
        },
        children: Mockdata.subProjectList
            .map((item) => ExpansionPanel(
                headerBuilder: (_, isExpanded) => Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Text((item as SubProjectItem).title)),
                body: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Text((item as SubProjectItem).title),
                ),
                isExpanded: item.isExpanded))
            .toList());
  }
}










