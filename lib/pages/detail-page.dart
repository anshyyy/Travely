import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travely/cubit/app-cubits.dart';
import 'package:travely/utils/colors.dart';
import 'package:travely/utils/five-star.dart';
import 'package:travely/widget/app-button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:travely/widget/app-large-text.dart';
import 'package:travely/widget/app-text.dart';
import 'package:travely/widget/responsive-button.dart';

import '../cubit/app-cubit-states.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double rating = 0;
  int selectedIndex = -1;
  bool like = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;

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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" +
                                  detail.places.img),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(Icons.keyboard_return),
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
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 600,
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
                              text: detail.places.name,
                              color: Colors.black.withOpacity(0.7),
                            ),
                            AppLargeText(
                              text: "\$" + detail.places.price.toString(),
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
                              text: detail.places.location,
                              size: 14,
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            StarRating(
                              rating: detail.places.stars
                                  .toDouble(), // hardcoded rating
                              onRatingChanged: (rating) =>
                                  setState(() => this.rating = rating),
                              color: Colors.orange,
                            ),
                            AppText(
                                text:
                                    '(' + detail.places.stars.toString() + ')')
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
                                    size: 50,
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
                        ),
                        SizedBox(height: 20),
                        AppLargeText(
                          text: "Description",
                          size: 22,
                          color: Colors.black87,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: AppText(text: detail.places.description),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (like) {
                                    like = false;
                                  } else {
                                    like = true;
                                  }
                                });
                              },
                              child: AppButton(
                                size: 60,
                                color: like ? Colors.red : AppColors.mainColor,
                                backgroundColor: Colors.white,
                                borderColor: AppColors.mainColor,
                                isIcon: true,
                                icon: like
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: (() {}),
                              child: Container(
                                child: ResponsiveButton(
                                  text: "Book Trip Now",
                                  isResponsive: true,
                                  width: 280,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
