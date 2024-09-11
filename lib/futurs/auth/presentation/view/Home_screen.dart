import 'package:flutter/material.dart';
import 'package:untitled2/futurs/auth/presentation/view/Food_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
     body: Column(
       children: [
         SizedBox(height: height * 0.05),
         Container(
           width: width * 0.5,
           height: height * 0.1,
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage('acid/image/logo.png'),  // Corrected the path
             ),
           ),
         ),
         SizedBox(height: height*0.01,),
         const Padding(
           padding: EdgeInsets.all(8.0),
           child: Row(
             children: [
               Icon(Icons.search),
               Expanded(
                 child: TextField(decoration: InputDecoration(
                   hintText: "search store",
                 ),),
               ),
             ],
           ),
         ),
         SizedBox(height: height*0.001,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("Exclusive offer",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w800,color: Colors.black),),
         ),
         SizedBox(height: height*0.001,),
         Expanded(
           child: GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
             ),
             itemCount: 10,
             itemBuilder: (context, index) {
               return Container(
                 height: height*0.1,
                 width: width*0.4,
                 child: GestureDetector(
                   onTap: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) =>  FoodDetails(),  // Corrected instantiation
                       ),
                     );
                   },

                   child: Column(
                     children: [
                       Container(
                         height: height*0.07,
                         width: width*0.3,
                         decoration:BoxDecoration(
                           image: DecorationImage(
                             image: AssetImage('acid/image/Vector.png'),
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                       SizedBox(height: height*0.001,),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("Red apple",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                       ),
                       Row(children: [
                         Text("4.99",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black),),
                         SizedBox(width: width*0.001,),
                         Icon(Icons.add)
                       ],)
                     ],
                   ),
                 ),
               ) ;
             }, ),  ),
       ],
     ),
    );

  }
}
