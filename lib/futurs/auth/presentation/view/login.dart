import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;  // Corrected to use height

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('acid/image/back_ground1.png'),  // Corrected the asset path
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('acid/image/logo.png'),
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "sign up",
                      style: TextStyle(
                        fontSize:30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Enter your emails and password",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.normal),),
                  ],
                ),
              ),

              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Email",style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Password",style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff53B175),
                  maximumSize: Size(width * 0.9, height * 0.07),
                  minimumSize: Size(width * 0.9, height * 0.07),
                ),
                onPressed: () {},
                child: const Text("log in",style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
