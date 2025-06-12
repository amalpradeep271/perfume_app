import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:perfume_app/common/bloc/internet/internet.dart';
import 'package:perfume_app/common/widgets/custom_appbar.dart';
import 'package:perfume_app/common/widgets/custom_carousel.dart';
import 'package:perfume_app/core/configs/theme/app_colors.dart';
import 'package:perfume_app/core/configs/theme/app_text_theme.dart';
import 'package:perfume_app/presentation/home/bloc/home_bloc.dart';
import 'package:perfume_app/presentation/home/bloc/home_event.dart';
import 'package:perfume_app/presentation/home/bloc/home_state.dart';
import 'package:perfume_app/presentation/home/widgets/brands.dart';
import 'package:perfume_app/presentation/home/widgets/categories.dart';
import 'package:perfume_app/presentation/home/widgets/custom_banners.dart';
import 'package:perfume_app/presentation/home/widgets/custom_card.dart';
import 'package:perfume_app/presentation/home/widgets/custom_product_card.dart';
import 'package:perfume_app/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>()..add(FetchHomeDataEvent()),
        ),
        BlocProvider(
          create:
              (context) =>
                  ConnectivityCubit(InternetConnectionChecker.createInstance()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppbar(),
        body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
          builder: (context, state) {
            if (state == ConnectivityState.disconnected) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No Internet Connection',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ConnectivityCubit>().checkConnection();
                      },
                      child: Text(
                        'Retry',
                        style: AppTextStyles.base.s12.blackColor,
                      ),
                    ),
                  ],
                ),
              );
            }

            return BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(child: CupertinoActivityIndicator());
                } else if (state is HomeLoaded) {
                  final home = state.homeEntity;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomCarousel(
                          images: home.data!.homeFields![0].carouselItems ?? [],
                        ),

                        Brands(brands: home.data!.homeFields![1].brands ?? []),
                        Categories(
                          category: home.data!.homeFields![2].categories ?? [],
                        ),
                        CustomCard(
                          imageUrl: home.data!.homeFields![3].image ?? '',
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
                        CustomProductCard(home: home),
                        CustomBanners(home: home),
                        SizedBox(height: 12),

                        CustomCard(
                          imageUrl: home.data!.homeFields![5].image ?? '',
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                  );
                } else if (state is HomeError) {
                  return Center(child: Text('Error: //${state.message}'));
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
