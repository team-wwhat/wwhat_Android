import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    switch (daysOfWeekIndex) {
      case 0:
        selectedCategory.add(category0);
        break;
      case 1:
        selectedCategory.add(category1);
        break;
      case 2:
        selectedCategory.add(category2);
        break;
      case 3:
        selectedCategory.add(category3);
        break;
      case 4:
        selectedCategory.add(category4);
    }
  }

  List<String> selectedCategory = List.empty(growable: true);
  String category0 = '월';
  String category1 = '화';
  String category2 = '수';
  String category3 = '목';
  String category4 = '금';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 21, top: 69, right: 21),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 11, bottom: 10),
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
                        InkWell(
                          onTap: () {
                            selectedCategory.add(category0);
                            selectedCategory.add(category1);
                            selectedCategory.add(category2);
                            selectedCategory.add(category3);
                            selectedCategory.add(category4);
                            setState(() {});
                          },
                          child: InkWell(
                            onTap: () {
                              selectedCategory = List.empty(growable: true);
                              selectedCategory.add(category0);
                              setState(() {
                                page.animateToPage(0,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.linearToEaseOut);
                              });
                            },
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: selectedCategory.contains(category0)
                                    ? Color(0xffE44545)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: Colors.black,
                                    width: selectedCategory.contains(category0)
                                        ? 0
                                        : 1),
                              ),
                              child: Center(
                                child: Text(
                                  '월',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: selectedCategory.contains(category0)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            selectedCategory = List.empty(growable: true);
                            selectedCategory.add(category1);
                            setState(() {
                              page.animateToPage(1,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.linearToEaseOut);
                            });
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category1)
                                  ? Color(0xffE44545)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Colors.black,
                                  width: selectedCategory.contains(category1)
                                      ? 0
                                      : 1),
                            ),
                            child: Center(
                              child: Text(
                                '화',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  color: selectedCategory.contains(category1)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            selectedCategory = List.empty(growable: true);
                            selectedCategory.add(category2);
                            setState(() {
                              page.animateToPage(2,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.linearToEaseOut);
                            });
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category2)
                                  ? Color(0xffE44545)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Colors.black,
                                  width: selectedCategory.contains(category2)
                                      ? 0
                                      : 1),
                            ),
                            child: Center(
                              child: Text(
                                '수',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  color: selectedCategory.contains(category2)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            selectedCategory = List.empty(growable: true);
                            selectedCategory.add(category3);
                            setState(() {
                              page.animateToPage(3,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.linearToEaseOut);
                            });
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category3)
                                  ? Color(0xffE44545)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Colors.black,
                                  width: selectedCategory.contains(category3)
                                      ? 0
                                      : 1),
                            ),
                            child: Center(
                              child: Text(
                                '목',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  color: selectedCategory.contains(category3)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            selectedCategory = List.empty(growable: true);
                            selectedCategory.add(category4);
                            setState(() {
                              page.animateToPage(4,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.linearToEaseOut);
                            });
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category4)
                                  ? Color(0xffE44545)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Color(0xffF0F0F0),
                                  width: selectedCategory.contains(category4)
                                      ? 0
                                      : 1),
                            ),
                            child: Center(
                              child: Text(
                                '금',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  color: selectedCategory.contains(category4)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
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
                            return const Center(
                              child: const CircularProgressIndicator(),
                            );
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
      ),
    );
  }
}
