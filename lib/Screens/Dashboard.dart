import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video/Widgets/Simple_Text.dart';

import '../Widgets/Photo_Container.dart';
import 'Register.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    bool isChecked1 = false;
    bool isChecked2 = false;
    bool? isChecked = false;
    bool isChecked3 = false;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoApp()),
                        );
                      },
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: width / 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome To",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "Pariaba Club",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                  padding: EdgeInsets.all(width / 20),
                  child: Column(
                    children: [
                   Photo_Container(width: width, height: height,  src: "assets/new_photos/paraiba-main.png"),
                      SizedBox(
                        height: height / 20,
                      ),
                  Photo_Container(width: width, height: height, src: "assets/new_photos/intro2.png"),
                      SizedBox(
                        height: height / 20,
                      ),
                      Simple_Text(
                          text: "LATEST OFFERS BY PARAIBA",
                          color: Colors.black,
                          size: 15),
                      Container(
                        width: width,
                        height: height / 5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            List<String> images = [
                              "assets/new_photos/upcoming11.png",
                              "assets/new_photos/upcoming22.png",
                              "assets/new_photos/upcoming33.png",
                            ];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Photo_Container(
                                  src: images[index],
                                  height: height,
                                  width: width),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //
              //
              //     SizedBox(
              //       height: height / 20,
              //     ),
              //     Simple_Text(text: "Latest Offers by Paraibe CLub", color: Colors.black, size: 10),
              //     Photo_Container(
              //         width: width,
              //         height: height,
              //         text: "Subsidized Trips",
              //         src: "assets/photos/trip.jpg"),
              //     SizedBox(
              //       height: height / 80,
              //     ),
              //     Photo_Container(
              //         width: width,
              //         height: height,
              //         text: "Family Gala",
              //         src: "assets/photos/family.jpg"),
              //     SizedBox(
              //       height: height / 80,
              //     ),
              //     Photo_Container(
              //         width: width,
              //         height: height,
              //         text: "Voucher/Coupon",
              //         src: "assets/photo/discount.jpg"),
              //     SizedBox(
              //       height: height / 80,
              //     ),
              //     Photo_Container(
              //         width: width,
              //         height: height,
              //         text: "Food Discounts",
              //         src: "assets/photo/food.jpg"),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
