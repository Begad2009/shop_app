import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/utils/firebase_auth.dart';
import 'package:untitled2/futurs/auth/presentation/view/Home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('acid/image/back_ground1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              Container(
                width: width * 0.5,
                height: height * 0.1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'acid/image/logo.png'), // Corrected the path
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Sign Up", // Corrected text capitalization
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Enter your credentials to continue",
                      style: TextStyle(fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
               Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller:  _usernameController,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Enter your email",
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter your password",
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                onPressed: _sginUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff53B175),
                  maximumSize: Size(width * 0.9, height * 0.07),
                  minimumSize: Size(width * 0.9, height * 0.07),
                ),
                // Set to null if using GestureDetector for navigation
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _sginUp() async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    if (email.isEmpty || password.isEmpty) {
      // Show error if email or password is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email and password cannot be empty")),
      );
      return;
    }

    try {
      // Attempt to create a user with Firebase
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential != null) {
        // Navigate to HomeScreen after successful sign-up
        users
            .doc(userCredential.user!.uid).set({
          'full_name': username, // John Doe
          'email': email, // Stokes and Sons
          'password': password // 42
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase sign-up errors
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Unknown error occurred')),
      );
    }
  }

}
