import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.result}) : super(key: key);
  final List<String> result;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> temp_list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp_list = widget.result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('축의금 관리'),
        backgroundColor: const Color.fromRGBO(163, 122, 68, 109),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(163, 122, 68, 109),
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: () async {
          print('add func detect');
          var prefs = await SharedPreferences.getInstance();
          //prefs.clear();
          String now_time = DateFormat('HH:mm').format(DateTime.now());
          setState(() {
            // temp_list.add((temp_list.length~/5+1).toString());
            // temp_list.add('유이');
            // temp_list.add('신부측');
            // temp_list.add('10');
            // //temp_list.add(now_time);
            // temp_list.add('13:58');
            // temp_list.add((temp_list.length~/5+1).toString());
            // temp_list.add('박현영');
            // temp_list.add('신부측');
            // temp_list.add('20');
            // temp_list.add('13:59');
            // temp_list.add((temp_list.length~/5+1).toString());
            // temp_list.add('김병양');
            // temp_list.add('신부측');
            // temp_list.add('30');
            // temp_list.add('14:02');
            // temp_list.add((temp_list.length~/5+1).toString());
            // temp_list.add('박진영');
            // temp_list.add('신부측');
            // temp_list.add('30');
            // temp_list.add('14:04');
            // temp_list.add((temp_list.length~/5+1).toString());
            // temp_list.add('김병기');
            // temp_list.add('신부측');
            // temp_list.add('30');
            // temp_list.add('14:04');
            // prefs.setStringList('list', temp_list);
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.125,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: const Color.fromRGBO(163, 122, 68, 109),
                  ),
                  child: Center(
                    child: Text(
                      '순번',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: const Color.fromRGBO(163, 122, 68, 109),
                  ),
                  child: Center(
                    child: Text(
                      '이름',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.175,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: const Color.fromRGBO(163, 122, 68, 109),
                  ),
                  child: Center(
                    child: Text(
                      '관계',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: const Color.fromRGBO(163, 122, 68, 109),
                  ),
                  child: Center(
                    child: Text(
                      '금액',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.175,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: const Color.fromRGBO(163, 122, 68, 109),
                  ),
                  child: Center(
                    child: Text(
                      '시간',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            temp_list.length == 0 ? Container() : Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: temp_list.length ~/ 5,
                itemBuilder: (BuildContext context, int idx) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.125,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Center(
                            child: Text(
                              (idx+1).toString(),
                              //temp_list[idx*5],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Center(
                            child: Text(
                              temp_list[idx*5+1],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.175,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Center(
                            child: Text(
                              temp_list[idx*5+2],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Center(
                            child: Text(
                              temp_list[idx*5+3] + '만원',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.175,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Center(
                            child: Text(
                              temp_list[idx*5+4],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            temp_list.length == 0 ? Container() : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.875,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: const Color.fromRGBO(163, 122, 68, 109),
                    ),
                    child: Center(child: Text('통계',style: TextStyle(
                      fontSize: 18,
                    ),)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Center(child: Text('신부측',style: TextStyle(
                          fontSize: 18,
                        ),)),

                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.625,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Center(child: Text('1,200,000 원',style: TextStyle(
                          fontSize: 18,
                        ),)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Center(child: Text('신랑측',style: TextStyle(
                          fontSize: 18,
                        ),)),

                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.625,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Center(child: Text('0 원',style: TextStyle(
                          fontSize: 18,
                        ),)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Center(child: Text('합계',style: TextStyle(
                          fontSize: 18,
                        ),)),

                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.625,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Center(child: Text('1,200,000 원',style: TextStyle(
                          fontSize: 18,
                        ),)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
