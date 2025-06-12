import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfume_app/common/bloc/carousel_bloc.dart';
import 'package:perfume_app/common/bloc/carousel_state.dart';
import 'package:perfume_app/domain/home/entities/home_entity.dart';
import 'package:perfume_app/presentation/home/widgets/custom_card.dart';

class CustomCarousel extends StatelessWidget {
  final List<BannerEntity> images;

  const CustomCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarouselBloc(imageCount: images.length),
      child: BlocBuilder<CarouselBloc, CarouselState>(
        builder: (context, state) {
          return Stack(
            children:
                images.asMap().entries.map((entry) {
                  int idx = entry.key;
                  BannerEntity imageUrl = entry.value;
                  return AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: state.currentIndex == idx ? 1.0 : 0.0,
                    curve: Curves.easeInOut,
                    child: CustomCard(imageUrl: imageUrl.image ?? ""),
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
