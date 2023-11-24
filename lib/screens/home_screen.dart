import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_screen.dart';
import 'loading_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.result}) : super(key: key);
  final List<String> result;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var f = NumberFormat('###,###,###,###');
  int price_boy = 0;
  int price_girl = 0;
  List<String> temp_list = [];
  List<bool> _boolean = [false, false];
  void add_dialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Color(0xffFEFAF8),
            child: Container(
                width: 150,
                height: 150,
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '신랑측/신부측 선택',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToggleButtons(
                          children: <Widget>[
                            Icon(Icons.man, size: 64,),
                            Icon(Icons.woman, size: 64,),
                          ],
                          onPressed: (int index) {
                            if (index == 0) {
                              Navigator.pop(context);
                              add_boy();
                            }
                            else {
                              Navigator.pop(context);
                              add_girl();
                            }
                          },
                          isSelected: _boolean,
                        ),
                      ],
                    ),
                  ],
                )),
          );
        }
    );
  }
  void add_boy() {
    var name = '';
    var relation = '신랑측';
    var price = '';
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                width: 150,
                height: 250,
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '신랑측 추가',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: '이름',
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '금액(만원)',
                      ),
                      onChanged: (value) {
                        price = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("취소"),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100,40),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (name != '' && price != '') {
                                var prefs = await SharedPreferences.getInstance();
                                String now_time = DateFormat('HH:mm').format(DateTime.now());
                                setState(() {
                                  temp_list.add((temp_list.length~/5+1).toString());
                                  temp_list.add(name);
                                  temp_list.add(relation);
                                  temp_list.add(price);
                                  temp_list.add(now_time);
                                  prefs.setStringList('list', temp_list);
                                });
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute (builder: (BuildContext context) => LoadingPage()), (route) => false);
                              }
                            },
                            child: const Text("추가"),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100,40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        }
    );
  }
  void add_girl() {
    var name = '';
    var relation = '신부측';
    var price = '';
    var now_time;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                width: 150,
                height: 250,
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '신부측 추가',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: '이름',
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '금액(만원)',
                      ),
                      onChanged: (value) {
                        price = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("취소"),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100,40),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (name != '' && price != '') {
                                var prefs = await SharedPreferences.getInstance();
                                String now_time = DateFormat('HH:mm').format(DateTime.now());
                                setState(() {
                                  temp_list.add((temp_list.length~/5+1).toString());
                                  temp_list.add(name);
                                  temp_list.add(relation);
                                  temp_list.add(price);
                                  temp_list.add(now_time);
                                  prefs.setStringList('list', temp_list);
                                });
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute (builder: (BuildContext context) => LoadingPage()), (route) => false);
                              }
                            },
                            child: const Text("추가"),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100,40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        }
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp_list = widget.result;
    if (temp_list.length != 0) {
      for (int i=0; i<temp_list.length~/5; i++) {
        if (temp_list[i*5+2] == '신랑측') {
          price_boy+=int.parse(temp_list[i*5+3]);
        }
        else {
          price_girl+=int.parse(temp_list[i*5+3]);
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('축의금 관리'),
        backgroundColor: const Color.fromRGBO(163, 122, 68, 109),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            var prefs = await SharedPreferences.getInstance();
            prefs.clear();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute (builder: (BuildContext context) => LoadingPage()), (route) => false);
        }, icon: Icon(Icons.autorenew)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.upload)),
        ],
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
          add_dialog();
          //Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));
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
                        child: Center(child: Text('${f.format(10000*price_boy)} 원',style: TextStyle(
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
                        child: Center(child: Text('${f.format(10000*price_girl)} 원',style: TextStyle(
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
                        child: Center(child: Text('${f.format(10000*price_girl+10000*price_boy)} 원',style: TextStyle(
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
