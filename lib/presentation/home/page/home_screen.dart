import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfume_app/common/widgets/custom_appbar.dart';
import 'package:perfume_app/core/configs/theme/app_colors.dart';
import 'package:perfume_app/core/configs/theme/app_text_theme.dart';
import 'package:perfume_app/presentation/home/bloc/home_bloc.dart';
import 'package:perfume_app/presentation/home/bloc/home_event.dart';
import 'package:perfume_app/presentation/home/bloc/home_state.dart';
import 'package:perfume_app/presentation/home/widgets/brands.dart';
import 'package:perfume_app/presentation/home/widgets/categories.dart';
import 'package:perfume_app/presentation/home/widgets/custom_card.dart';
import 'package:perfume_app/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(FetchHomeDataEvent()),
      child: Scaffold(
        appBar: CustomAppbar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: CupertinoActivityIndicator());
            } else if (state is HomeLoaded) {
              final home = state.homeEntity;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomCard(),

                    Brands(),
                    Categories(),
                    CustomCard(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Request for quote',
                            style: AppTextStyles.base.s16.whiteColor.w900,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                            ),
                            child: Text(
                              'Create RFQ',
                              style: AppTextStyles.base.s12.blackColor.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is HomeError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
