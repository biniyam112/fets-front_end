import 'package:fets_mobile/presentation/pages/feeds/components/components.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  static const String route = "feeds";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
              backgroundColor: backgroundColor,
              elevation: 0,
              title: Text(
                "Feeds",
                style: Theme.of(context).textTheme.headline4,
              ),
              centerTitle: true,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(40.h), child: TabItems())),
          body: const TabBarView(
            children: [
              TabBody(),
              TabBody(),
              TabBody(),
            ],
          )),
    );
  }
}
