
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_screen.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isPasswordVisible = false;


  @override
  void initState() {
    super.initState();
  }
  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return HomeScreen();
            },
          ),
        );
        Fluttertoast.showToast(msg: "Login successful");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Login failed");
      print("Exception: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.lightBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.1),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(45)),
                  ),
                  height: height * 0.62,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 28),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25),
                                ),
                                Text(
                                  "Login in with your Credentials",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.blueAccent),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Container(
                                      constraints:
                                      const BoxConstraints(maxHeight: 110),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Image.asset(
                                          'assets/Flutter.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  loginform(),
                                  SizedBox(
                                    height: height * 0.010,
                                  ),
                                  loginButtonAndnewAcc(height * 0.058),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginform() {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your Email';
            } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                .hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget loginButtonAndnewAcc(double buttonHeight) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              login();
            }
          },
          child: const Text('Login'),
        ),


        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            minimumSize: const Size(double.infinity, 50),
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          onPressed: () {
            signup();
          },
          child: const Text('SignUp'),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            // Get.to(homepage());
          },
          child: RichText(
            text: TextSpan(
              text: "Don't have an account",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: " Sign up!",
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w800,
                    fontSize: 16.2,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            // Get.to( ResetPasswordScreen());
          },
          child: Text(
            "Forgot password?",
            style: TextStyle(
              color: Colors.blue.shade800,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
  void signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.toString(),
        password: _passwordController.text.toString(),
      );
      Fluttertoast.showToast(msg: "User created successfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "User creation failed");
      print("Exception: $e");
    }
  }

}
