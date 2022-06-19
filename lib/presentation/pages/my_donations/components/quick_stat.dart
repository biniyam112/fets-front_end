import 'package:fets_mobile/features/donor_projects/bloc/donor_projects_bloc.dart';
import 'package:fets_mobile/features/donor_projects/bloc/donor_projects_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../features/authentication/model/model.dart';
import '../../../../features/donor_projects/bloc/donor_projects_event.dart';
import '../../../../features/models/models.dart';
import '../../../../services/services.dart';
import '../../../../theme/theme.dart';
import 'all_transactions_button.dart';

class DonorStatCard extends StatelessWidget {
  const DonorStatCard({
    Key? key,
  }) : super(key: key);

  double getTotalDonations(List<Donation> donations) {
    double totalDonation = 0;
    for (var i = 0; i < donations.length; i++) {
      totalDonation = totalDonation + donations[i].amount.toDouble();
    }
    return totalDonation;
  }

  double getMaxDonation(List<Donation> donations) {
    double maxDonation = 0;
    for (var i = 0; i < donations.length; i++) {
      maxDonation = maxDonation + donations[i].amount.toDouble();
    }
    return maxDonation;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          topShadow,
          bottomShadow,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocBuilder<DonorProjectBloc, DonorProjectState>(
          builder: (context, state) {
            if (state is UserDonationFetching) {
              return SizedBox(
                height: .26.sh,
                width: .8.sw,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ),
              );
            }
            if (state is UserDonationFetchingFailed) {
              return Column(
                children: [
                  Text(
                    'user donation info not found',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: .26.sh,
                    width: .8.sw,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<DonorProjectBloc>(context).add(
                          FetchUserDonations(
                            userName:
                                Hive.box<User>('users').get('user')!.userName!,
                          ),
                        );
                      },
                      child: Text(
                        'Try again',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is UserDonationsFetched) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LeftSide(
                        donorName: 'US Aid',
                        donorId: '48147648g48231t468er6234',
                        donatedProjects: 10,
                        completedProjects: 4,
                        projectsInProgress: 3,
                      ),
                      horizontalSpacing(12.sp),
                      RightSide(
                        maxDonation: getMaxDonation(state.donations),
                        totalDonations: getTotalDonations(state.donations),
                      ),
                    ],
                  ),
                  AllTransactionsButton(donations: state.donations),
                ],
              );
            }
            return const Placeholder();
          },
        ),
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({
    Key? key,
    required this.totalDonations,
    required this.maxDonation,
  }) : super(key: key);
  final double totalDonations, maxDonation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'total donations',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 14,
                  color: lightTextColor,
                ),
          ),
          Text(
            '\$ $totalDonations',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.1,
                  fontSize: 17,
                ),
          ),
          verticalSpacing(16.sp),
          Text(
            'maximum donation',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 14,
                  color: lightTextColor,
                ),
          ),
          Text(
            '\$ $maxDonation',
            // maxLines: 1,
            overflow: TextOverflow.visible,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.1,
                  fontSize: 17,
                ),
          ),
        ],
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({
    Key? key,
    required this.donorName,
    required this.donorId,
    required this.donatedProjects,
    required this.completedProjects,
    required this.projectsInProgress,
  }) : super(key: key);
  final String donorName, donorId;
  final int donatedProjects, completedProjects, projectsInProgress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            donorName,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            donorId,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 14,
                  color: lightTextColor,
                ),
          ),
          verticalSpacing(16.sp),
          Text(
            'Status',
            style: Theme.of(context).textTheme.headline4,
          ),
          verticalSpacing(6.sp),
          TitleAndCount(
            title: 'Donated Projects',
            count: donatedProjects,
          ),
          TitleAndCount(
            title: 'completed Projects',
            count: completedProjects,
          ),
          TitleAndCount(
            title: 'Projects in progress',
            count: projectsInProgress,
          ),
          verticalSpacing(20.sp),
        ],
      ),
    );
  }
}

class TitleAndCount extends StatelessWidget {
  const TitleAndCount({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 14,
                color: lightTextColor,
              ),
        ),
        horizontalSpacing(6.sp),
        Text(
          '$count',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
