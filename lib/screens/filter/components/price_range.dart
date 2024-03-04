import 'package:flutter/material.dart';

import '../../../components/section_title.dart';
import '../../../constants.dart';

class PriceRange extends StatelessWidget {
  const PriceRange({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: "Price Range",
          press: () {},
          isMainSection: false,
        ),
        const SizedBox(height: defaultPadding),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: defaultPadding),
              ...List.generate(
                // For demo I'm using length 3
                3, // Number of price ranges
                (index) => Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: RoundedButton(
                    price: (index + 1) * 50, // Calculate price dynamically
                    isActive: index == 1, // for demo just select 100
                    press: () {},
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.isActive = false,
    required this.price,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: isActive ? primaryColor : inputColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
                color:
                    isActive ? primaryColor : bodyTextColor.withOpacity(0.1)),
          ),
        ),
        onPressed: press,
        child: Text(
          "\Rs.$price",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: isActive ? Colors.white : titleColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
