import 'package:flutter/material.dart';
import 'package:houseplants/core/theme/app_pallete.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildShimmerTabButton(),
        _buildShimmers(),
      ],
    );
  }

  Widget buildShimmerTabButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < 4; i++)
            Shimmer.fromColors(
              baseColor: AppPallete.chipBgColors,
              highlightColor: Colors.white,
              child: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: AppPallete.chipBgColors,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildShimmers() {
    return Column(
      children: [
        for (var i = 0; i < 4; i++)
          Shimmer.fromColors(
            baseColor: AppPallete.chipBgColors,
            highlightColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppPallete.chipBgColors,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildShimmerText(height: 25, width: 200),
                      const SizedBox(height: 10),
                      buildShimmerText(height: 15, width: 150),
                      const SizedBox(height: 10),
                      buildShimmerText(height: 10, width: 150),
                    ],
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget buildShimmerText({
    required double height,
    required double width,
  }) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(244, 244, 244, 1),
      highlightColor: Colors.white,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(244, 244, 244, 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
