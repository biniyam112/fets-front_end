import 'package:fets_mobile/features/search_image/bloc/search_image_state.dart';
import 'package:fets_mobile/features/search_image/bloc/search_url_bloc.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/components.dart';

class TopArea extends StatelessWidget {
  const TopArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .42.sh,
      width: 1.sw,
      child: Stack(
        children: [
          BlocBuilder<SearchImageBloc, SearchImageState>(
            builder: (context, state) {
              if (state is ImageSearchingState) {
                SizedBox(
                  height: 46.sp,
                  width: 46.sp,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                );
              }
              if (state is ImageFound) {
                return Image.network(
                  state.imageUrl,
                  height: .42.sh,
                  width: 1.sw,
                  fit: BoxFit.cover,
                );
              }
              if (state is NoImageFound) {
                return Image.asset(
                  'assets/images/project_default_image.png',
                  height: .42.sh,
                  width: 1.sw,
                );
              }
              return Image.asset(
                'assets/images/project_default_image.png',
                height: .42.sh,
                width: 1.sw,
              );
            },
          ),
          Positioned(
            top: 8.sp,
            left: 8.sp,
            child: CustomBackButton(
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
