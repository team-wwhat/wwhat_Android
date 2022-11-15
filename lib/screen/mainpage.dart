import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wwhat_android/Widget/OutlineCircleButton.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var firestore = FirebaseFirestore.instance;
  var collection = '1학년 1반';
  var daysOfWeek;
  PageController page = PageController();
  var daysOfWeekIndex;
  var now = DateTime.now();

  String getSystemTime() {
    return DateFormat("MM월 dd일").format(now);
  }

  String getWeek() {
    String? getDay = week[DateFormat('E').format(now)];
    String dateStr = DateFormat(getDay!).format(now);
    return dateStr;
  }

  int? getWeek1() {
    int? getDay1 = week1[DateFormat('E').format(now)];
    return getDay1;
  }

  late List<bool> isButton;
  bool isButton0 = false;
  bool isButton1 = false;
  bool isButton2 = false;
  bool isButton3 = false;
  bool isButton4 = false;

  var week = {
    'Mon': '월',
    'Tue': '화',
    'Wed': '수',
    'Thu': '목',
    'Fri': '금',
    'Sat': '토',
    'Sun': '일',
  };

  var week1 = {
    'Mon': 0,
    'Tue': 1,
    'Wed': 2,
    'Thu': 3,
    'Fri': 4,
    'Sat': 4,
    'Sun': 4,
  };

  void initState() {
    super.initState();
    daysOfWeek = getWeek();
    daysOfWeekIndex = getWeek1();
    page = PageController(initialPage: daysOfWeekIndex);
    switch (daysOfWeekIndex){
      case 0:
        isButton = [true, false, false, false, false];
        break;
      case 1:
        isButton = [false, true, false, false, false];
        break;
      case 2:
        isButton = [false, false, true, false, false];
        break;
      case 3:
        isButton = [false, false, false, true, false];
        break;
      case 4:
        isButton = [false, false, false, false, true];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 21, top: 69, right: 21),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Row(
                    children: [
                      Container(
                        width: 38,
                        height: 2,
                        color: const Color(0xffE44545),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Container(
                          width: 8,
                          height: 2,
                          color: const Color(0xffE44545),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          '시간표',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                getSystemTime(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: const Color(0xff747474),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              daysOfWeek.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff747474),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 23.0, bottom: 16.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ToggleButtons(
                        children: [
                          OutlineCircleButton(
                            radius: 35.0,
                            borderSize: 0.5,
                            child: const Center(
                              child: const Text('월'),
                            ),
                            onTap: () {
                              page.animateToPage(0,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.linearToEaseOut);
                            },
                          ),
                          OutlineCircleButton(
                            radius: 35.0,
                            borderSize: 0.5,
                            child: const Center(
                              child: const Text('화'),
                            ),
                            onTap: () {
                              page.animateToPage(1,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.linearToEaseOut);
                            },
                          ),
                          OutlineCircleButton(
                            radius: 35.0,
                            borderSize: 0.5,
                            child: const Center(
                              child: const Text('수'),
                            ),
                            onTap: () {
                              page.animateToPage(2,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.linearToEaseOut);
                            },
                          ),
                          OutlineCircleButton(
                            radius: 35.0,
                            borderSize: 0.5,
                            child: const Center(
                              child: const Text('목'),
                            ),
                            onTap: () {
                              page.animateToPage(3,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.linearToEaseOut);
                            },
                          ),
                          OutlineCircleButton(
                            radius: 35.0,
                            borderSize: 0.5,
                            child: const Center(
                              child: const Text('금'),
                            ),
                            onTap: () {
                              page.animateToPage(4,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.linearToEaseOut);
                            },
                          ),
                        ],
                        isSelected: isButton,
                        selectedColor: Color(0xffE44545),
                        focusColor: Color(0xffE44545),
                        fillColor: Color(0xffE44545),
                        onPressed: (int index){
                          setState(() {
                            for (int buttonIndex = 0; buttonIndex < isButton.length; buttonIndex++) {
                              if (buttonIndex == index) {
                                isButton[buttonIndex] = true;
                              } else {
                                isButton[buttonIndex] = false;
                              }
                            }
                          });
                        },
                        renderBorder: false,
                      ),
                    ],
                  ),
                ),
                ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: SizedBox(
                    width: 348,
                    height: 401,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: firestore.collection(collection).snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffF0F0F0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: PageView.builder(
                            controller: page,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int ind) {
                              return ListView.builder(
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.only(top: 3.5),
                                      child: Text(
                                        ('${index + 1}'),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      snapshot.data!.docs[ind]['${index + 1}교시']
                                          .toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}