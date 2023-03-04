

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:m6d3t1new/pages/signin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'signup_page';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showPassword = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();


  
  Future<void> save(String key, String value) async{
    await secureStorage.write(key: key, value: value);
  }
  // Future<String> getValue(String key) async {
  //   return await secureStorage.read(key: key)?? "";
  // }

  void saveDetails(){
    save("nameController", nameController.text);
    save("emailController", emailController.text);
    save("phoneController", phoneController.text);
    save("passwordController", passwordController.text);
  }
  late SharedPreferences sharedPreferences;

  _doSignUp(){
    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if(name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty ){
      Navigator.pushReplacementNamed(context, HomePage.id);
    }
  }

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 10),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, SignInPage.id);
                    }, icon: const Icon(Icons.arrow_back))
                  ],
                ),
                const SizedBox(height: 75,),
                const SizedBox(
                    child: Text("Let's Get Stated!", style: TextStyle(fontSize: 32, fontFamily:'ItalicBT'),
                    )
                ),
                const SizedBox(height: 8,),
                const Text("Create an account to Q Allure to get all features",
                    style: TextStyle(fontSize: 15,color: Colors.grey)),
                const SizedBox(height: 40,),
                //Name

                TextField(
                  controller: nameController,
                  cursorColor: Colors.blue,
                  style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    hintText: ' Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding:  const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                //Email
                TextField(
                  controller: emailController,
                  cursorColor: Colors.blue,
                  style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: ' Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding:  const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

                const SizedBox(height: 22),
                // Phone
                TextField(
                  controller: phoneController,
                  cursorColor: Colors.blue,
                  style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone_android),
                    hintText: ' Phone',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding:  const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

                const SizedBox(height: 22),
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
                const SizedBox(height: 22),
                //confirmPassword
                TextField(
                  obscureText: !_showPassword,
                  controller: confirmPasswordController,
                  cursorColor: Colors.blue,
                  style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: ' Confirm Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding:  const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),

                      // borderSide: const BorderSide(color: Colors.white),
                    ),

                  ),
                ),
                const SizedBox(height: 40),
                //Log In
                SizedBox(
                  height: 60,
                  width: 210,
                  child:ElevatedButton(
                    onPressed: () async {

                      _doSignUp();
                      saveDetails();

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text('CREATE',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
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
                      const Text("Already have an account?", style: TextStyle(color: Colors.black, fontSize: 16),),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, SignInPage.id);
                        },
                        child: const Text('Login here',style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold),),
                      ),

                    ],
                  ),
                )

              ],
            ),

        )


    );
  }

}