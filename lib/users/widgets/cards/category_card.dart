import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laibaik/utils/themes.dart';

import '../../screens/categories/food_and_grocery.dart';



class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      "title": "MARKET PLACE",
      "subtitle": "Instant Delivery",
      "tagText": "30 Mins",
      "discount": "",
      "imagePath": "assets/images/market.png",
    },
    {
      "title": "FOOD & GROCERY",
      "subtitle": "Food & Grocery For You",
      "tagText": "",
      "discount": "Upto 70%",
      "imagePath": "assets/images/food_groc.png",
    },
    {
      "title": "RIDES",
      "subtitle": "Rides For You ❤️ On Time",
      "tagText": "",
      "discount": "Upto 70%",
      "imagePath": "assets/images/pickup.png",
      "isNew": true,
    },
    {
      "title": "PICKUP TRUCK",
      "subtitle": "Pickup For You ❤️ On Time",
      "tagText": "",
      "discount": "Upto 70%",
      "imagePath": "assets/images/truck.png",
    },
    {
      "title": "HOME SERVICES",
      "subtitle": "Home Services ❤️ On Time",
      "tagText": "",
      "discount": "Upto 60%",
      "imagePath": "assets/images/service.png",
    },
    {
      "title": "USED CARS",
      "subtitle": "Used For You ❤️ On Time",
      "tagText": "",
      "discount": "Upto 60%",
      "imagePath": "assets/images/cars2.png",
      "isNew": true,
    },
    {
      "title": "LAUNDRY",
      "subtitle": "Laundry For You ❤️ On Time",
      "tagText": "",
      "discount": "Upto 70%",
      "imagePath": "assets/images/laundry.png",
      "isNew": true,
    },
    {
      "title": "VEHICLE SERVICES",
      "subtitle": "Vehicle For You ❤️ On Time",
      "tagText": "",
      "discount": "Upto 50%",
      "imagePath": "assets/images/mechanic.png",
    },
    {
      "title": "SEND PARCEL",
      "subtitle": "Cosmetic For You ❤️ On Time",
      "tagText": "",
      "discount": "Upto 70%",
      "imagePath": "assets/images/parcel.png",
    },
    {
      "title": "PET CARE",
      "subtitle": "Charity For You ❤️ On Time",
      "tagText": "",
      "discount": "Upto 50%",
      "imagePath": "assets/images/pet_care.png",
      "isComingSoon": true,
    },
    {
      "title": "EXPLORE MORE",
      "subtitle": "Categories ❤️ On Time",
      "tagText": "",
      "discount": "Upto 50%",
      "imagePath": "assets/images/explore.png",
    },
    {
      "title": "CHARITY",
      "subtitle": "Charity For You ❤️ On Time",
      "tagText": "",
      "discount": "Upto 50%",
      "imagePath": "assets/images/charity.png",
      "isComingSoon": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> evenServices = [];
    final List<Map<String, dynamic>> oddServices = [];

    for (int i = 0; i < services.length; i++) {
      if (i % 2 == 0) {
        evenServices.add(services[i]);
      } else {
        oddServices.add(services[i]);
      }
    }

    Widget buildServiceCard(Map<String, dynamic> service, bool isFirstCard) {
      final double cardWidth = screenWidth * 0.48;
      final double cardHeight = isFirstCard ? screenHeight * 0.2 : screenHeight * 0.13;
      final double imageSize = isFirstCard ? cardWidth * 0.72 : cardWidth * 0.4;
      final double imageLeft = cardWidth - imageSize - 9;
      final double imageTop = cardHeight - imageSize - 5;
      final double firstImageTop = cardHeight - imageSize - 4;

      // Define onTap behavior based on the service title
      VoidCallback? onTap;
      if (service['title'] == 'FOOD & GROCERY') {
        onTap = () {
          Get.to(() =>  FoodAndGrocery());
        };
      }
      // Add more conditions for other services if needed

      return Directionality(
        textDirection: TextDirection.ltr,
        child: GestureDetector(
          onTap: onTap, // Handle tap event
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: cardHeight,
                width: cardWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Card(
                  elevation: 1,
                  shadowColor: const Color(0xFFFDCECF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (service['isComingSoon'] == true) const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              service['title'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (service['isNew'] == true) ...[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: AppColors.primaryGradient,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                                    child: Text(
                                      "NEW",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          service['subtitle'],
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (isFirstCard && service['tagText'].isNotEmpty)
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.flash_on, color: Colors.red, size: 16),
                                Text(
                                  service['tagText'],
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          )
                        else if (service['discount'].isNotEmpty)
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE5E6),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Center(
                                  child: Text(
                                    service['discount'],
                                    style: const TextStyle(
                                      fontSize: 8,
                                      color: Color(0xFFDE3033),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (isFirstCard) const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: isFirstCard ? firstImageTop : imageTop,
                left: imageLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    service['imagePath'],
                    fit: BoxFit.cover,
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              ),
              if (service['isComingSoon'] == true)
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      gradient: AppColors.primaryGradient,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                      child: Text(
                        "Coming soon",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  buildServiceCard(evenServices[0], true),
                  const SizedBox(height: 8.0),
                  for (int i = 1; i < evenServices.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: buildServiceCard(evenServices[i], false),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                children: [
                  if (oddServices.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: buildServiceCard(oddServices[0], true),
                    ),
                  for (int i = 1; i < oddServices.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: buildServiceCard(oddServices[i], false),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}