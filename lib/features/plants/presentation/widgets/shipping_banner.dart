import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
import 'header_text.dart';

class ShippingBanner extends StatelessWidget {
  const ShippingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            colors: [
              AppPallete.gradientColor1,
              AppPallete.gradientColor2,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    text: 'Free Shipping',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const TextWidget(
                        text: 'on orders',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppPallete.favoriteIconColor,
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        alignment: Alignment.center,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFFFC37C),
                        ),
                        child: const TextWidget(
                          text: 'over \$100 ',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(child: Container()),
              buildPlantImage(),
            ],
          ),
        ),
      ),
    );
  }

  Stack buildPlantImage() {
    return Stack(
      children: [
        Positioned(
          child: Image.asset(
            width: 100,
            height: 100,
            fit: BoxFit.contain,
            'assets/saly3.png',
          ),
        ),
      ],
    );
  }
}
