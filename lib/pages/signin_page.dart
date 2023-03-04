import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m6d3t1new/pages/home_page.dart';
import 'package:m6d3t1new/pages/signup_page.dart';
import 'package:simple_animations/simple_animations.dart';


class SignInPage extends StatefulWidget {

  static const String id = 'signin_page';

  const SignInPage({Key? key}) : super(key: key);




  @override
  State<SignInPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SignInPage> with AnimationMixin{
  bool _showPassword = false;

  late Animation<double> size;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _doLogin(){
    String email = emailController.text;
    String password = passwordController.text;

    if(email.isNotEmpty && password.isNotEmpty){
      Navigator.pushReplacementNamed(context, HomePage.id);
    }
  }

  @override
  void initState() {

    size = Tween(begin: 0.0, end: 200.0).animate(controller);

    // Start the animation playback
    controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

               const SizedBox(height: 70,),
              SizedBox(
                height: size.value,
                width: size.value,
                child:Container(

                  padding: const EdgeInsets.all(80),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/One.jpeg'),
                      ),
                  ),
                ),
              ),

                   const SizedBox(
                      child: Text('Welcome back!', style: TextStyle(fontSize: 32, fontFamily:'ItalicBT'),
                      )
                  ),
              const SizedBox(height: 8,),
              const Text("Log in to your existent account of Q Allure",
                  style: TextStyle(fontSize: 15,color: Colors.grey)),

              const SizedBox(height: 40,),
                  //Email
              TextField(
                controller: emailController,
                cursorColor: Colors.blue,
                style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle_outlined),
                  hintText: ' Email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding:  const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(height: 20),
                  //Password
              TextField(
                obscureText: !_showPassword,
                controller: passwordController,
                cursorColor: Colors.blue,
                style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: ' Password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding:  const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye, color: _showPassword ? Colors.blue: Colors.grey,),
                    onPressed: (){
                      setState(() => _showPassword = !_showPassword);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),

                    // borderSide: const BorderSide(color: Colors.white),
                  ),

                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){

                  },
                    child:  const Text("Forgot Password?", style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: 210,
                child:ElevatedButton(
                  onPressed: () {
                    _doLogin();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text('LOG IN',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
               const Text("Or connect using",
                      style: TextStyle(color: Colors.grey, fontSize: 16)),

              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                    width: 155,
                    child:ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(FontAwesomeIcons.facebookF, size: 16,),
                      label: const Text('Facebook',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),


                  SizedBox(
                    height: 50,
                    width: 155,
                    child:ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(FontAwesomeIcons.google, size: 16,),
                      label: const Text('Google',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              //  SignUp
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text("Don't have an account?", style: TextStyle(color: Colors.black, fontSize: 16),),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, SignUpPage.id);
                          },
                          child: const Text('Sign Up',style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold),),
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