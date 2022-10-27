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
  var now = DateTime.now();

  String getSystemTime() {
    return DateFormat("yy년 MM월 dd일").format(now);
  }

  String getWeek() {
    String? getDay = Week[DateFormat('E').format(now)];
    String dateStr = DateFormat(getDay! + '요일').format(now);
    return dateStr;
  }

  var Week = {
    'Sun': '일',
    'Mon': '월',
    'Tue': '화',
    'Wed': '수',
    'Thu': '목',
    'Fri': '금',
    'Sat': '토',
  };

  void initState() {
    super.initState();
    daysOfWeek = getWeek();
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
                      onPressed: null,
                      child: Text('월'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text('화'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text('수'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text('목'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: null,
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
                      child: PageView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int ind) {
                          return ListView.builder(
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: ListTile(
                                  leading: Text(
                                    ('${index + 1}'),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  title: Center(
                                    child: Text(
                                      '과목 이름',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
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
