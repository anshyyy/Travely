import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travely/utils/colors.dart';
import 'package:travely/utils/five-star.dart';
import 'package:travely/widget/app-button.dart';
import 'package:travely/widget/app-large-text.dart';
import 'package:travely/widget/app-text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double rating = 4.5;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('img/mountain.jpeg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                    ),
                    IconButton(
                        onPressed: () {},
                        color: Colors.white,
                        icon: const Icon(Icons.more_vert))
                  ],
                )),
            Positioned(
                top: 310,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: "Yosemite",
                            color: Colors.black.withOpacity(0.7),
                          ),
                          AppLargeText(
                            text: "\$ 250",
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "USA, California",
                            size: 14,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          StarRating(
                            rating: 4.5, // hardcoded rating
                            onRatingChanged: (rating) =>
                                setState(() => this.rating = rating),
                            color: Colors.orange,
                          ),
                          AppText(text: '($rating)')
                        ],
                      ),
                      const SizedBox(height: 15),
                      AppLargeText(
                        text: "People",
                        size: 20,
                        color: Colors.black87,
                      ),
                      const SizedBox(height: 5),
                      AppText(text: "Number of people in your group"),
                      const SizedBox(height: 10),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                  text: (index + 1).toString(),
                                  size: 60,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black87
                                      : AppColors.buttonBackground,
                                  borderColor: AppColors.buttonBackground),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
