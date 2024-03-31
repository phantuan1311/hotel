import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/roomInfoScreen.dart';
import '../ui/myTheme.dart';
import 'customer.dart';
enum RoomType{single,double}
enum RoomStatus{available,unavailable}
class Room extends StatelessWidget {
  Room({super.key,
    this.cost =100000,
    required this.number,
    this.type = RoomType.single,
    this.floor = 1,
    this.status = RoomStatus.available,

  });

  String number;
  RoomType type = RoomType.single;
  int cost = 100000;
  int floor = 1;
  Customer? customer;

  RoomStatus status = RoomStatus.available;
  @override
  Widget build(BuildContext context) {
    Icon roomIcon;
    Color roomColor = Provider.of<MyTheme>(context).color5;
    if(status == RoomStatus.available){
      roomColor = Provider.of<MyTheme>(context).emptyRoomColor;
    }else{
      roomColor = Provider.of<MyTheme>(context).bookedRoomColor;
    }
    if(type ==RoomType.single){
      roomIcon = const Icon(Icons.bedroom_child_outlined);
    }else{
      roomIcon = const Icon(Icons.bedroom_parent_outlined);
    }
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>RoomInfoScreen(room: this,)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: roomColor,
            borderRadius: BorderRadius.circular(10)
        ),
        width:65,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(number, style: TextStyle(
              color: Provider.of<MyTheme>(context).color8,
            ),),
            roomIcon,
            Text('$cost',style: TextStyle(
              fontSize: 10,
              color: Provider.of<MyTheme>(context).color8,
            ),)
          ],
        ),
      ),
    );
  }
  getString(){
    return "$floor - $number";
  }
}

