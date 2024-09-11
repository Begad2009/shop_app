import 'package:flutter/material.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height*0.25,
            width: width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('acid/image/Vector.png'), // Corrected the asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: height*0.001,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Text("Naturel Red apple",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)),
          ),
SizedBox(height: height*0.0001,),
          Text('1 kg price',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey,fontSize: 25),),
        
        ],
      ),
    );
  }
}

