import 'package:fets_mobile/presentation/pages/components/components.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({Key? key}) : super(key: key);

  static const route = "project-detail";
  // final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: backgroundColor,
      appBar: AppBar(
        
        leading: CustomBackButton(
          onPress: () {
            Navigator.pop(context);
          },
        ),
        // elevation: 0,
        // backgroundColor: backgroundColor,
        title: Text(
          'Electricity supply in Kototo',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
