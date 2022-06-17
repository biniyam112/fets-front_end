import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/helper/helper.dart';
import 'package:fets_mobile/presentation/pages/feeds/feeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBody extends StatelessWidget {
  const TabBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
          child: BlocBuilder<FeedBloc, FeedState>(builder: (context, state) {
            if (state is FeedInprogress || state is FeedInit) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FeedFailed) {
              return ConnectionErrorIndicator(
                title: "Something went wrong",
                message: state.errorMessage,
                onTryAgain: () =>
                    BlocProvider.of<FeedBloc>(context).add(FetchAllFeeds()),
              );
            }

            return ListView.builder(
                itemCount: (state as FeedsFetched).feeds.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FeedTile(apiFeedData: state.feeds[index]);
                });
          })),
    );
  }
}
