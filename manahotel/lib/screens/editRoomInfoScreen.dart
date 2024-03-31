import 'package:flutter/material.dart';
import 'package:manahotel/model/hotelMana.dart';
import 'package:manahotel/screens/roomInfoScreen.dart';
import 'package:manahotel/ui/myTheme.dart';
import 'package:provider/provider.dart';

import '../objects/room.dart';
class EditRoomInfoScreen extends StatelessWidget {
  Room room;
  EditRoomInfoScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    String alert ='';
    final List<String> items = ['Phòng đơn', 'Phòng đôi'];
    String selectedValue = (room.type == RoomType.single)?'Phòng đơn':'Phòng đôi';
    RoomType roomType = room.type;
    TextEditingController roomNumber = TextEditingController();
    TextEditingController roomFloor = TextEditingController();
    TextEditingController roomCost = TextEditingController();
    roomNumber.text = room.number;
    roomFloor.text = room.floor.toString();
    roomCost.text =room.cost.toString();
    return Consumer2<MyTheme,HotelMana>(builder: (BuildContext context,theme,mana,child){
      return Scaffold(
        backgroundColor: theme.color1,
        appBar: AppBar(
          backgroundColor: theme.color1,
          foregroundColor: theme.color8,
          title: Text('Chỉnh sửa'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              TextField(
                style: TextStyle(color: theme.color9),
                controller: roomNumber,
                decoration:InputDecoration(
                    hintText: "Số phòng",
                    hintStyle: TextStyle(color: theme.color9)
                ),),
              TextField(
                style: TextStyle(color: theme.color9),
                controller: roomFloor,
                enabled: false,
                decoration:InputDecoration(
                  hintStyle: TextStyle(color: theme.color9),
                  hintText: "Tầng",

                ),),

              TextField(
                style: TextStyle(color: theme.color9),
                controller: roomCost,
                decoration:  InputDecoration(
                    hintText: "Giá/ngày",
                    hintStyle: TextStyle(color: theme.color9)
                ),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Loại phòng",style: TextStyle(color: theme.color9,fontSize: 16,fontWeight: FontWeight.w500),),
                  DropdownButton<String>(
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        selectedValue = newValue;
                        mana.change();
                        roomType = (newValue == items[1]) ? RoomType.double : RoomType.single;
                      }
                    },
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,style: TextStyle(color: theme.color9)),
                      );
                    }).toList(),
                  ),
                ],),
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15,horizontal: 100)),
                    backgroundColor: MaterialStatePropertyAll(theme.color5)
                ),
                onPressed: (){
                  Room newRoom = Room(number: roomNumber.text,floor: int.parse(roomFloor.text),cost: int.parse(roomCost.text),type: roomType,);
                  mana.updateRoom(room,newRoom);
                  alert = 'Lưu thành công!';
                  room = newRoom;
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RoomInfoScreen(room:room)));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.grey,
                      content: Text(alert,style: const TextStyle(color: Colors.white),)));
                },
                child: Text("Lưu thay đổi",style: TextStyle(color: theme.color8,fontWeight: FontWeight.bold,fontSize: 18),),)
            ],
          ),
        ),
      );
    });
  }
}
