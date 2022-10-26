import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('X학년 X반 시간표'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'X월 X일 X요일',
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                      child: ListView.builder(
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
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
