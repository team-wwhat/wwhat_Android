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
    return DateFormat("yy년 MM월 dd일").format(now);
  }

  String getWeek() {
    String? getDay = Week[DateFormat('E').format(now)];
    String dateStr = DateFormat(getDay! + '요일').format(now);
    return dateStr;
  }

  int? getWeek1() {
    int? getDay1 = Week1[DateFormat('E').format(now)];
    return getDay1;
  }

  var Week = {
    'Mon': '월',
    'Tue': '화',
    'Wed': '수',
    'Thu': '목',
    'Fri': '금',
  };

  var Week1 = {
    'Mon': 0,
    'Tue': 1,
    'Wed': 2,
    'Thu': 3,
    'Fri': 4,
  };

  void initState() {
    super.initState();
    daysOfWeek = getWeek();
    daysOfWeekIndex = getWeek1();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('1학년 1반 시간표'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${getSystemTime()} ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        daysOfWeek.toString(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        page.animateToPage(0,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linearToEaseOut);
                      },
                      child: Text('월'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        page.animateToPage(1,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linearToEaseOut);
                      },
                      child: Text('화'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        page.animateToPage(2,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linearToEaseOut);
                      },
                      child: Text('수'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        page.animateToPage(3,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linearToEaseOut);
                      },
                      child: Text('목'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        page.animateToPage(4,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linearToEaseOut);
                      },
                      child: Text('금'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(overscroll: false),
                    child: SizedBox(
                      width: 400,
                      height: 550,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: firestore.collection(collection).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          return PageView.builder(
                            controller: page,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int ind) {
                              return ListView.builder(
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: ListTile(
                                      leading: Text(
                                        ('${index + 1}'),
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      title: Center(
                                        child: Text(
                                          snapshot
                                              .data!.docs[ind]['${index + 1}교시']
                                              .toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
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
