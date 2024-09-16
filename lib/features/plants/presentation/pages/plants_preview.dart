import 'package:flutter/material.dart';

import 'package:houseplants/core/constant/category.dart';
import 'package:houseplants/core/theme/app_pallete.dart';

import '../../data/model/plants.dart';
import '../widgets/header_text.dart';
import '../widgets/plant_card_view.dart';
import '../widgets/shipping_banner.dart';

class PlantsPreview extends StatefulWidget {
  final List<Plants> plants;
  const PlantsPreview({super.key, required this.plants});

  @override
  State<PlantsPreview> createState() => _PlantsPreviewState();
}

class _PlantsPreviewState extends State<PlantsPreview> {
  String? selectedCategories;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTabButtons(),
        buildPlantsPreviewList(),
      ],
    );
  }

  Widget buildPlantsPreviewList() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.plants.length + 1,
      itemBuilder: ((context, index) {
        if (index == 1) {
          return const ShippingBanner();
        }
        final adjustedIndex = index > 1 ? index - 1 : index;
        final allPlants = widget.plants[adjustedIndex];
        return PlantCardView(
            allPlants: allPlants,
            imageBgColor: index == 0
                ? AppPallete.imageBgColor
                : AppPallete.imageBgColor2);
      }),
    );
  }

  Widget buildTabButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Constants.categories
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(top: 10, right: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategories = e;
                    });
                  },
                  child: Chip(
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: selectedCategories == e
                        ? AppPallete.chipSelectedColors
                        : AppPallete.chipBgColors,
                    label: TextWidget(
                      text: e,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: selectedCategories == e
                          ? AppPallete.chipSelectedTextColor
                          : AppPallete.chipTextColor,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
