import 'package:flutter/material.dart';
import 'package:real_estate_app/Housify%20pages/custom_style.dart';
import 'package:real_estate_app/Housify%20pages/reviews.dart';
import 'package:real_estate_app/Housify%20pages/widgets.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(158, 158, 158, 0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MyText('4.5'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star_half,
                    color: Colors.amber,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              MyText2('189 Reviews'),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    buildRatingBar(5, 0.8),
                    SizedBox(
                      height: 7,
                    ),
                    buildRatingBar(4, 0.6),
                    SizedBox(
                      height: 7,
                    ),
                    buildRatingBar(3, 0.4),
                    SizedBox(
                      height: 7,
                    ),
                    buildRatingBar(2, 0.35),
                    SizedBox(
                      height: 7,
                    ),
                    buildRatingBar(1, 0.25),
                  ],
                ),
              ),
            ],
          ),
        ),
        Reviews(),
      ],
    ));
  }
}
