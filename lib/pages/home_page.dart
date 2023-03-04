import 'package:flutter/material.dart';
import 'package:m6d3t1new/pages/signin_page.dart';
class HomePage extends StatefulWidget {
  static String id= 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:  Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          IconButton(onPressed: (){
          Navigator.pushReplacementNamed(context, SignInPage.id);
        }, icon: const Icon(Icons.arrow_back, size: 50,))
      ])
    )
      );


  }
}
