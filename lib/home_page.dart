import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainingapp/video_info.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List info=[];
  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "King of Squat",
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 14,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    Get.to(()=> const VideoInfo());
                  },
                  child: Icon(
                    Icons. arrow_forward,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background_image.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(80.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(10, 5),
                    blurRadius: 10,
                    color: color.AppColor.gradientSecond.withOpacity(0.9),
                  )
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(80.0),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.4)
                    ],
                  ),

                ),
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Next workout",
                          style: TextStyle(
                            color: color.AppColor.homePageContainerTextSmall,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Legs Toning ",
                          style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.homePageContainerTextBig,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "and Glutes Workout",
                          style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.homePageContainerTextBig,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: color.AppColor.homePageContainerTextBig,
                              size: 25.0,
                            ),
                            const SizedBox(width: 10,),
                            Text(
                              "10 mins",
                              style: TextStyle(
                                  color: color.AppColor.homePageContainerTextBig,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                  color: color.AppColor.gradientFirst,
                                  blurRadius: 10,
                                  offset: const Offset(4, 8),
                                ),
                              ]
                          ),
                          child: InkWell(
                            onTap: (){
                              Get.to(()=> const VideoInfo());
                            },
                            child: const Icon(
                              Icons.play_circle,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5,),
            // ignore: sized_box_for_whitespace
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    height: 140,
                    margin: const EdgeInsets.only(top:30),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: color.AppColor.gradientFirst.withOpacity(0.3),
                          offset: const Offset(10, 10),
                          blurRadius: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.only(left:20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "assets/king.png",
                        height: 160,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 180,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                                "Nkululeko Dlamini",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: color.AppColor.homePageDetail,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 9,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Fitness Instructor",
                                  style: TextStyle(
                                    color: color.AppColor.homePagePlainColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "#NYAOLOMSHIMI",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Area of focus",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: (info.length.toDouble()/2).toInt(),
                  itemBuilder: (_, i){
                  int a = 2*i;
                  int b = 2*i +1;
                    return Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width-90)/2,
                          height: 200,
                          margin: const EdgeInsets.only(left: 30, bottom: 15),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                info[a]["img"]
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5,5),
                                color: color.AppColor.gradientSecond.withOpacity(0.1),
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5,-5),
                                color: color.AppColor.gradientSecond.withOpacity(0.1),
                              ),
                            ]
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[a]["title"],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: color.AppColor.homePageDetail,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width-90)/2,
                          height: 200,
                          margin: EdgeInsets.only(left: 30, bottom: 15),
                          padding: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                    info[b]["img"]
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5,5),
                                  color: color.AppColor.gradientSecond.withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5,-5),
                                  color: color.AppColor.gradientSecond.withOpacity(0.1),
                                ),
                              ]
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[b]["title"],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: color.AppColor.homePageDetail,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ))
          ],
        ),
      )
    );
  }
}