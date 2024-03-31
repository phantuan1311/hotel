import 'package:flutter/material.dart';
import 'package:manahotel/model/hotelMana.dart';
import 'package:manahotel/objects/room.dart';
import 'package:provider/provider.dart';
class Floor extends StatelessWidget {
  Floor({required this.floor, this.listRoom =const []});
  int floor;
  List<Room> listRoom = [];
  @override
  Widget build(BuildContext context) {
    return  Consumer<HotelMana>(
      builder: (BuildContext context, mana,child){
      return Wrap(
        runSpacing: 10,
        spacing: 10,
        children: listRoom.map(
                (room) =>room
        ).toList(),
      );}
    );
  }
  addRoom(Room room){
    listRoom.add(room);
  }
}
