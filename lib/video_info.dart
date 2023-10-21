import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  VideoPlayerController? _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
     setState(() {
       videoInfo = json.decode(value);
     });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose(){
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller= null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: _playArea == false ? BoxDecoration(
          gradient: LinearGradient(
        colors: [
          color.AppColor.gradientFirst.withOpacity(0.8),
          color.AppColor.gradientSecond,
        ],
        begin: const FractionalOffset(0.0, 0.4),
        end: Alignment.topRight,
      )) : BoxDecoration(
        color: color.AppColor.gradientSecond,
      ),
      child: Column(
        children: [
          Row(
            children: [
             _playArea == false ? Container(
                padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.secondPageIconColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Legs Toning ",
                          style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.secondPageTitleColor,
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
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                color.AppColor.gradientSecond.withOpacity(0.9),
                                color.AppColor.gradientSecond.withOpacity(0.5),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer,
                                color: color.AppColor.secondPageIconColor,
                                size: 20,
                              ),
                              Text(
                                "60 min",
                                style: TextStyle(
                                  color: color.AppColor.secondPageTitleColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 250,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                color.AppColor.gradientSecond.withOpacity(0.9),
                                color.AppColor.gradientSecond.withOpacity(0.5),
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.handyman_outlined,
                                color: color.AppColor.secondPageIconColor,
                                size: 20,
                              ),
                              Text(
                                "Resistent band, kettebell",
                                style: TextStyle(
                                  color: color.AppColor.secondPageTitleColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ) : Container(
               width: MediaQuery.of(context).size.width,
               child: Column(
                 children: [
                   Container(
                     height: 100,
                     padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                     child: Row(
                       children: [
                         InkWell(
                           onTap: () {
                             debugPrint("tappeed");
                           },
                           child: Icon(
                             Icons.arrow_back_ios,
                             size: 20,
                             color: color.AppColor.secondPageIconColor,
                           ),
                         ),
                         Expanded(child: Container()),
                         InkWell(
                           onTap: () {
                             debugPrint("tappeed");
                           },
                           child: Icon(
                             Icons.info_outline,
                             size: 20,
                             color: color.AppColor.secondPageIconColor,
                           ),
                         ),
                       ],
                     ),
                   ),
                   _playView(context),
                   _controlView(context),
                 ],
               ),
             ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: color.AppColor.homePageBackground,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Circuit 1: Legs Toning",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(
                            Icons.loop,
                            size: 30,
                            color: color.AppColor.loopColor,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "3 sets",
                              style: TextStyle(
                                color: color.AppColor.setsColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                      child: _listView(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
  Widget _controlView(BuildContext context){
    return Container(
      height: 60,
        width: MediaQuery.of(context).size.width,
      color: color.AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: ()async{

            },
            icon: Icon(
              Icons.fast_rewind,
              size: 36,
              color: Colors.white,
            )
          ),
          IconButton(
              onPressed: ()async{
                if (_isPlaying){
                  setState(() {
                    _isPlaying = false;
                  });
                  _controller?.pause();
                } else {
                  _controller?.play();
                  setState(() {
                    _isPlaying = true;
                  });
                }
              },
              icon: Icon(
                _isPlaying? Icons.pause :
                Icons.play_arrow,
                size: 36,
                color: Colors.white,
              )
          ),
          IconButton(
              onPressed: ()async{

              },
              icon: Icon(
                Icons.fast_forward,
                size: 36,
                color: Colors.white,
              )
          ),
        ],
      ),
    );
  }
  Widget _playView(BuildContext context){
    final controller = _controller;
    if (controller != null && controller.value.isInitialized){
      return Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lime,
          ),
        ),
        child: AspectRatio(
          aspectRatio: 16/9,
          child: VideoPlayer(
              controller
          ),
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16/9,
          child: Center(
            child: Text(
                "Losading video....",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          )
      );
    }
  }
  void _onControllerUpdate()async {
    final controller = _controller;
    if (controller==null){
      debugPrint("controller is null");
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("controller cannot be initialized");
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying= playing;
  }
  _initializeVideo(int index) async{
    final controller = VideoPlayerController.asset(videoInfo[index]["videoUrl"]);
    _controller = controller;
    setState(() {
    });
    controller..initialize().then((_){
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {
      });
    });
  }
  _onTapVideo(int index){
    _initializeVideo(index);
  }
  _listView() {
    return ListView.builder(
        itemCount: videoInfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false ){
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }
  _buildCard(int index){
    return  Container(
      height: 137,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        videoInfo[index]["thumbnail"]
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeeFc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for(int i=0; i<70; i++)
                    i.isEven?Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xFF839fed),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ): Container(
                      width: 3,
                      height: 1,
                      color: Colors.white,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
