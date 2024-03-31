import 'package:flutter/material.dart';
import 'package:manahotel/model/hotelMana.dart';
import 'package:manahotel/ui/myTheme.dart';
import 'package:provider/provider.dart';

import 'addRoomScreen.dart';

class RoomManagementScreen extends StatelessWidget {
  const RoomManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<MyTheme,HotelMana>(builder: (BuildContext context,theme,mana,child){
      return Scaffold(
        backgroundColor: Provider.of<MyTheme>(context, listen: false).color1,
        appBar: AppBar(
          title: const Text('Quản lý phòng'),
          backgroundColor: theme.color1,
          foregroundColor: theme.color8,
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddRoomScreen()));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children:mana.listFloor.map((floor) => Column(
                    children: [
                    Container(height: 30,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: theme.color3,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Text("Tầng ${floor.floor}",style: TextStyle(color: theme.color8),),
                      ),),
                      floor,
                      const SizedBox(height: 10,),
                    ],
                  )).toList(),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}