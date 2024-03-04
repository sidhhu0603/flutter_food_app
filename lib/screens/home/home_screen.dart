import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodly_ui/screens/home/support_page.dart';

import '../../components/cards/big/big_card_image_slide.dart';
import '../../components/cards/big/restaurant_info_big_card.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import '../../demoData.dart';
import '../../screens/filter/filter_screen.dart';
import '../details/details_screen.dart';
import '../featured/featurred_screen.dart';
import 'components/medium_card_list.dart';
import 'components/promotion_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Column(
          children: [
            Text(
              "Delivery to".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: primaryColor),
            ),
            const Text(
              "Chembur",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FilterScreen(),
                ),
              );
            },
            child: Text(
              "Filter",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: BigCardImageSlide(images: demoBigImages),
              ),
              const SizedBox(height: defaultPadding),
              SectionTitle(
                title: "Featured Partners",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeaturedScreen(),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              MediumCardList(),
              const SizedBox(height: defaultPadding),
              PromotionBanner(),
              const SizedBox(height: defaultPadding),
              SectionTitle(
                title: "Best Pick",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeaturedScreen(),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              MediumCardList(),
              const SizedBox(height: defaultPadding),
              SectionTitle(title: "All Restaurants", press: () {}),
              const SizedBox(height: defaultPadding),

              // Demo list of Big Cards
              // Demo list of Big Cards
              Column(
                children: List.generate(
                  // For demo we use 4 items
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.fromLTRB(
                      defaultPadding,
                      0,
                      defaultPadding,
                      index == 2 ? defaultPadding : 0, // Add padding only to the last item
                    ),
                    child: Column(
                      children: [
                        RestaurantInfoBigCard(
                          // Images are List<String>
                          images: demoBigImages..shuffle(),
                          name: "McDonald's",
                          rating: 4.3,
                          numOfRating: 200,
                          deliveryTime: 25,
                          foodType: const ["Chinese", "American", "Deshi food"],
                          press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailsScreen(),
                            ),
                          ),
                        ),
                        SizedBox(height: defaultPadding), // Add space between cards
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const SupportPage()),
          );
        },
        child: Icon(Icons.support_agent), // Icon for support agent
      ),
    );
  }
}
