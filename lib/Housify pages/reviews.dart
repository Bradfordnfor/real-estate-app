import 'package:flutter/material.dart';
import 'package:real_estate_app/Housify%20pages/custom_style.dart';
import 'package:real_estate_app/Housify pages/models/review_model.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  final List<Map<String, dynamic>> reviewStack = [
    {
      "name": 'Mary Peters',
      "company": 'BM Estates',
      "image":
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      "rating": 4.5,
      "text":
          'This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here',
      " date": '12/03/025',
    },
    {
      "name": 'James',
      "company": 'BM Estates',
      "image":
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      "rating": 4.0,
      "text":
          'This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here',
      " date": '12/03/025',
    },
    {
      "name": 'John',
      "company": 'BM Estates',
      "image":
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      "rating": 2.0,
      "text":
          'This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here',
      " date": '12/03/025',
    },
    {
      "name": 'Bradford',
      "company": 'BM Estates',
      "image":
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      "rating": 5.0,
      "text":
          'This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here',
      " date": '12/03/025',
    },
    {
      "name": 'Terry',
      "company": 'BM Estates',
      "image":
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      "rating": 4.5,
      "text":
          'This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here',
      " date": '12/03/025',
    },
    {
      "name": 'Roy Peters',
      "company": 'BM Estates',
      "image":
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      "rating": 3.5,
      "text":
          'This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here',
      " date": '12/03/025',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: reviewStack.length,
        itemBuilder: (context, position) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/avatar_placeholder.png'),
                      child: MyText(
                        reviewStack
                                .elementAt(position)['name']
                                ?.toString()
                                .substring(0, 1)
                                .toUpperCase() ??
                            'U',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            reviewStack
                                    .elementAt(position)['name']
                                    ?.toString() ??
                                'Unknown',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          MyText2(
                            '(${reviewStack.elementAt(position)['company']?.toString() ?? 'Company'})',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText2(
                          reviewStack.elementAt(position)['date']?.toString() ??
                              '12/03/025',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            minimumSize: Size(0, 0),
                          ),
                          child: Text(
                            'Reply',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: List.generate(5, (index) {
                      int rating = 4;
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                ),
                SizedBox(height: 8),
                MyText2(
                  reviewStack.elementAt(position)['review']?.toString() ??
                      'This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here This is an example of the Customer review text that will be here',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
