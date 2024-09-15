import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:houseplants/core/theme/app_pallete.dart';

import '../../data/model/plants.dart';
import '../widgets/header_text.dart';

class PlantsDetailScreen extends StatefulWidget {
  final Plants allPlants;
  const PlantsDetailScreen({
    super.key,
    required this.allPlants,
  });

  @override
  State<PlantsDetailScreen> createState() => _PlantsDetailScreenState();
}

class _PlantsDetailScreenState extends State<PlantsDetailScreen> {
  int? selectedCategories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_sharp,
                color: AppPallete.primaryTextColor,
              ),
            ),
            expandedHeight: 375,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: widget.allPlants.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: widget.allPlants.name,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            text:
                                '${(double.parse(widget.allPlants.price) / 10).toStringAsFixed(1)} ${widget.allPlants.priceUnit}',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            TextWidget(
                              text: widget.allPlants.rating.toString(),
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildSize(),
                  const SizedBox(height: 20),
                  buildDescription(),
                  const SizedBox(height: 80),
                  buildButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 55,
          height: 55,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppPallete.chipBgColors,
          ),
          child: const Icon(
            Icons.favorite_border_outlined,
            color: AppPallete.primaryTextColor,
            size: 32,
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(250, 50),
            backgroundColor: AppPallete.chipSelectedColors,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () {},
          child: const TextWidget(
            text: 'Add to Cart',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Description',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 12),
        TextWidget(
          text: widget.allPlants.description,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppPallete.chipTextColor,
        ),
      ],
    );
  }

  Widget buildSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Choose Size',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.allPlants.availableSize
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
                        padding: const EdgeInsets.all(12),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        backgroundColor: selectedCategories == e
                            ? AppPallete.chipSelectedColors
                            : AppPallete.chipBgColors,
                        label: TextWidget(
                          text: '${e.toString()} cm',
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
        ),
      ],
    );
  }
}
