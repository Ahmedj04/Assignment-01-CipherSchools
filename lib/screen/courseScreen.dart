import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _switchValue = false;
  int _currentSlide = 0;
  final List<String> images = [
    "assets/images/courses_img1.png",
    "assets/images/courses_img2.png",
    "assets/images/courses_img3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: ListView(
        children: [
          Column(
            children: [
              Material(
                elevation: 2,
                child: Container(
                  height: 60,
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Image.network(
                        "data:image/jpeg;base64,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",
                        width: 40,
                      ),
                      SizedBox(width: 10,),
                      const Text("CipherSchools",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2)),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(Icons.explore),
                              Text("Browse"),
                              Icon(Icons.keyboard_arrow_down_sharp),
                            ],
                          )),
                      const SizedBox(
                        width: 500,
                      ),
                      Container(
                        width: 350,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueGrey[50],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(Icons.search),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search and Learn",
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(Icons.filter_list),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(Icons.notifications),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(Icons.person_2_outlined),
                      SizedBox(
                        width: 30,
                      ),
                      Image.asset("assets/images/logo.png", width: 25),
                      SizedBox(
                        width: 30,
                      ),
                      Switch(
                        value: _switchValue,
                        onChanged: (bool value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                        activeColor: Color(0xFFF37D1F),
                        trackColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .6,
                  viewportFraction: 1,
                  autoPlay: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
                items: [
                  Image.asset(
                    "assets/images/courses_img1.png",
                    // width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "assets/images/courses_img2.png",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "assets/images/courses_img3.png",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, left: 50, right: 50, bottom: 200),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended Courses",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  "Popular",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Icon(Icons.keyboard_arrow_down_outlined),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCard(
                          cardWidth: 310,
                          image:
                              "https://ik.imagekit.io/cipherschools/CipherSchools/languify-1",
                          subjectTitle: "languify",
                          heading: "FREE IELTS/TOEFL Mock \nAssessment",
                          description1: "AI generated feedback and scores",
                          description2: "Test duration: 30 mins / 3 hours",
                          profilePic:
                              "https://connect-assets.prosple.com/cdn/ff/OnDe-01YbBe1M5kjZSuUmAq4kUEY8m0B_ALvjDdcgV8/1637332158/public/styles/scale_and_crop_center_299x168/public/2021-11/Logo-languify-480x480-2021.jpg?itok=a5PnNrQx",
                          courseName: "Languify",
                          role: "express & excel",
                        ),
                        CustomCard(
                          cardWidth: 300,
                          image:
                              "https://d3gmywgj71m21w.cloudfront.net/498f10428c3b24c94e57a4bff1176c93",
                          subjectTitle: "Web development",
                          subjectTitleWidth: 150,
                          heading: "JavaScriptJS",
                          description1: "No. of videos : 36",
                          description1TopPadding: 35,
                          description2: "Course time: 5.1 hours",
                          profilePic:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuSsDo7g775VuxslAo-iV7ygJfHN8LyLqWNw&usqp=CAU",
                          courseName: "Shurti Codes",
                          role: "Instructor",
                        ),
                        CustomCard(
                          cardWidth: 300,
                          image:
                              "https://d3gmywgj71m21w.cloudfront.net/bdc64b30d8b2992575b5aa5a3bc06c42",
                          subjectTitle: "Web development",
                          subjectTitleWidth: 150,
                          heading: "Cascading Style Sheet (CSS)",
                          description1: "No. of videos : 24",
                          description1TopPadding: 35,
                          description2: "Course time: 3 hours",
                          profilePic:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuSsDo7g775VuxslAo-iV7ygJfHN8LyLqWNw&usqp=CAU",
                          courseName: "Shurti Codes",
                          role: "Instructor",
                        ),
                        CustomCard(
                          cardWidth: 310,
                          image:
                              "https://d3gmywgj71m21w.cloudfront.net/728a2d3aab11afa24520305befc0f119",
                          subjectTitle: "Web development",
                          subjectTitleWidth: 150,
                          heading: "Hyper Text Markup Language\n(HTML)",
                          description1: "No. of videos : 24",
                          description1TopPadding: 15,
                          description2: "Course time: 3 hours",
                          profilePic:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuSsDo7g775VuxslAo-iV7ygJfHN8LyLqWNw&usqp=CAU",
                          courseName: "Shurti Codes",
                          role: "Instructor",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Latest Videos",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCard(
                          cardWidth: 310,
                          image:
                          "https://d3gmywgj71m21w.cloudfront.net/13806356f4366612de6eba265e540a19",
                          subjectTitle: "Programming",
                          subjectTitleWidth: 150,
                          heading: "Intro to Graph | Linear vs Non\nLinear Data Structure By Aditya",
                          description1: "A graph data structure is a collection of ",
                          description1TopPadding: 15,
                          description2: "nodes that have data and are...",
                          profilePic: "data:image/jpeg;base64,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",
                          courseName: "Cipher Schools",
                          role: "Instructor",
                        ),
                        CustomCard(
                          cardWidth: 310,
                          image: "https://d3gmywgj71m21w.cloudfront.net/51f2177f6159864129a890f32e9a5483",
                          subjectTitle:  "Web development",
                          subjectTitleWidth: 150,
                          heading: "What exactly is MERN stack with \nproject example by Palash",
                          description1: "MERN Stack is a Javascript Stack that is used ",
                          description1TopPadding: 15,
                          description2: "for easier and faster deployment of...",
                          profilePic: "data:image/jpeg;base64,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",
                          courseName: "Cipher Schools",
                          role: "Instructor",
                        ),
                        CustomCard(
                          cardWidth: 310,
                          image: "https://d3gmywgj71m21w.cloudfront.net/43c3c58843d2a2b07ed9fd7023c44b02",
                          subjectTitle:  "Programming",
                          subjectTitleWidth: 150,
                          heading: "Overview of Data Types | Array & \nArraylist in Java by Arun",
                          description1: "A data type constrains the values that an ",
                          description1TopPadding: 15,
                          description2: "expression, such as a variable or a...",
                          profilePic: "data:image/jpeg;base64,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",
                          courseName: "Cipher Schools",
                          role: "Instructor",
                        ),
                        CustomCard(
                          cardWidth: 310,
                          image: "https://d3gmywgj71m21w.cloudfront.net/5bc23fa0f0bb60ed59b33ce2178c1a18",
                          subjectTitle: "Git and GitHub",
                          subjectTitleWidth: 150,
                          heading: "All about git and github to get \nstarted",
                          description1: "Git: Git is a distributed version control ",
                          description1TopPadding: 15,
                          description2: "system for tracking changes in source cod...",
                          profilePic: "data:image/jpeg;base64,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",
                          courseName: "Cipher Schools",
                          role: "Instructor",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
