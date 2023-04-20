import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.image,
    this.cardWidth = 350,
    this.cardHeight = 210,
    this.subjectTitle = "",
    this.subjectTitleWidth = 70,
    required this.heading,
    this.description1 = "",
    this.description1TopPadding = 15,
    this.description2 = "",
    required this.profilePic,
    this.courseName = "",
    this.role = "",
  });

  final double subjectTitleWidth , description1TopPadding , cardWidth, cardHeight;
  final String subjectTitle,
      heading,
      description1,
      description2,
      role,
      courseName,
      image,
      profilePic;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          SizedBox(
            // width: 350,
            // height: 210,
            height: cardHeight,
            width: cardWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
              ),
              child: Image.network(
                image,
                // "https://ik.imagekit.io/cipherschools/CipherSchools/languify-1",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            // width: 350,
            // height: 210,
            height: cardHeight,
            width: cardWidth,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 15,
                  ),
                  child: Row(
                    children: [
                      Container(
                        // width: 70,
                        width: subjectTitleWidth,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFFE7CE),
                        ),
                        child: Center(
                          child: Text(
                            subjectTitle,
                            // "languify",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFF37D1F),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            heading,
                            // "FREE IELTS/TOEFL Mock \nAssessment",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: description1TopPadding,),
                      Row(
                        children: [
                          Text(
                            description1,
                            // "AI generated feedback and scores",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            description2,
                            // "Test duration: 30 mins / 3 hours",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(profilePic
                                  // "https://connect-assets.prosple.com/cdn/ff/OnDe-01YbBe1M5kjZSuUmAq4kUEY8m0B_ALvjDdcgV8/1637332158/public/styles/scale_and_crop_center_299x168/public/2021-11/Logo-languify-480x480-2021.jpg?itok=a5PnNrQx",
                                  ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      courseName,
                                      // "Languify",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(children: [
                                  Text(
                                    role,
                                    // "express & excel",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  )
                                ])
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
