import 'package:appstore_android/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:appstore_android/objects/each_app.dart';

class appList extends StatefulWidget {
  @override
  _ApplistState createState() => _ApplistState();
}

class _ApplistState extends State<appList> {
  final List<each_app> item_list = [
    each_app("Duckpath", "good", "link","icon",'https://picsum.photos/id/237/200/300',DateTime.now()),
    each_app("Duckpath", "good", "link","icon",'https://picsum.photos/seed/picsum/200/300',DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new ListView.builder(
          itemCount: item_list.length,
          itemBuilder: (BuildContext context, int index) => buildAppCard(context, index)
          ),
      )
    );

  }

 Widget buildAppCard(BuildContext context, int index) {
  DateTime now = DateTime.now();
  String today = "";
  if (now.difference(item_list[index].date).inDays == 0) {
    today = "Today";
    print(today);
  }
  return new Container(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       textDirection: TextDirection.ltr,
       children: [
       Padding (
           padding:const EdgeInsets.fromLTRB(20, 5, 15, 7),
           child : new Column(
             children: [
            Text(           
              item_list[index].date.month.toString() + "-" + now.day.toString(),
              style: TextStyle(
                color: grey,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
          ),
              Text(
                  today,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Signika',
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
              ),
             ]
           )  
         ),
       
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: new EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 180,
                width: MediaQuery.of(context).size.width,
              child : Card (
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  item_list[index].image,
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius : BorderRadius.circular(20.0)
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              )
              )
            ],
          
          )
       ]
     )
    
   );
}

}

