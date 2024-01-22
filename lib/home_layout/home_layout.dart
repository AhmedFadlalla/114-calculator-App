import 'package:first_session/messanger_screen/messanger_screen.dart';
import 'package:flutter/material.dart';

import 'data_model.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;
  List<Post> data = [
  Post(userData: UserData(name: "Ahmed", age: 15, image: "user 1 image"),
      id: 1, title: "Post 1 Title", image: "Post 1 Image"),
    Post(userData: UserData(name: "Mohamed", age: 15, image: "user 2 image"),
        id: 2,
        title: "Post 2 Title", image: "Post 2 Image"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:ListView.separated(itemBuilder: (context,index)=>Column(
        children: [
          Text(data[index].userData.image),
          Text(data[index].image),
          ElevatedButton(onPressed: (){
           // Navigator.pop(context);

           showModalBottomSheet(context: context, builder: (context)=>Column(
             children: [
               Text("Model Botom")
             ],
           ));
          }, child: Text("pop")),
          ElevatedButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context)=>MessangerScreeen()));

          }, child: Text("Navigate")),

        ],
      ), separatorBuilder: (context,index)=>SizedBox(height: 8,),
          itemCount: data.length),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          print("tapped index : ${index}");
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
