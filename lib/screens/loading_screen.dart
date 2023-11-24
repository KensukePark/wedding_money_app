import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  List<String> result = [];
  void check_data() async {
    var prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    if (prefs.getStringList('list') != null) {
      result = prefs.getStringList('list')!;
    }
    print(result);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
      return HomePage(result: result);
    }), (route) => false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_data();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
