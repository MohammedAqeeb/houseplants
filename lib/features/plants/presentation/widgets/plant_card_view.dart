import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:houseplants/core/theme/app_pallete.dart';
import 'package:houseplants/features/plants/presentation/pages/plants_detail_screen.dart';
import 'package:houseplants/features/plants/presentation/widgets/header_text.dart';

import '../../data/model/plants.dart';

class PlantCardView extends StatelessWidget {
  final Plants allPlants;
  final Color imageBgColor;
  const PlantCardView({
    super.key,
    required this.allPlants,
    required this.imageBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantsDetailScreen(
              allPlants: allPlants,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildPlantImage(),
              const SizedBox(width: 5),
              buildPlantNamePrice(),
            ],
          ),
        ),
      ),
    );
  }

  Stack buildPlantImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: -5,
          child: Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              color: imageBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        CachedNetworkImage(
          width: 130,
          height: 130,
          fit: BoxFit.contain,
          imageUrl: allPlants.imageUrl,
        ),
        Positioned(
          bottom: 6,
          right: 12,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppPallete.chipSelectedTextColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.favorite_border_outlined,
              color: AppPallete.favoriteIconColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPlantNamePrice() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: allPlants.name,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              Row(
                children: [
                  TextWidget(
                    text: allPlants.rating.toString(),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.ratingColor,
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.star,
                    color: AppPallete.ratingColor,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
          TextWidget(
            text: '${allPlants.displaySize.toString()} ${allPlants.unit}',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppPallete.chipTextColor,
          ),
          Expanded(child: Container()),
          TextWidget(
            text:
                '${(double.parse(allPlants.price) / 10).toStringAsFixed(1)} ${allPlants.priceUnit}',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
