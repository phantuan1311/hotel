import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manahotel/model/hotelMana.dart';
import 'package:manahotel/objects/room.dart';
import 'package:manahotel/ui/myTheme.dart';
import 'package:provider/provider.dart';
class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>listEmptyRoomString = [];
    List<Room>listEmptyRoom = [];
    for (var i in Provider.of<HotelMana>(context).listFloor){
      for (var j in i.listRoom){
        if (j.status == RoomStatus.unavailable){
          listEmptyRoomString.add(j.getString());
          listEmptyRoom.add(j);
        }
      }
    }
    Room? selectedRoom = listEmptyRoom.isNotEmpty?listEmptyRoom[0]:null;
    return Consumer2<MyTheme,HotelMana>(
        builder: (BuildContext context, theme, mana, child){
          return Scaffold(
            backgroundColor: theme.color1,
            appBar: AppBar(
              title: Text("Trả phòng"),
              backgroundColor: theme.color1,
              foregroundColor: theme.color8,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: theme.color2
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Chọn phòng",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:theme.color8)),
                        listEmptyRoom.isNotEmpty
                            ? DropdownButton<Room>(
                          value: selectedRoom,
                          onChanged: (Room? newValue) {
                            if (newValue != null) {
                              selectedRoom = newValue;
                              theme.change();
                            }
                          },
                          items: listEmptyRoom.map((Room item) {
                            return DropdownMenuItem<Room>(
                              value: item,
                              child: Text(item.getString(),style: TextStyle(color: theme.color3)),
                            );
                          }).toList(),
                        ): Text("<Trống>",style: TextStyle(color: theme.color9),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  (selectedRoom == null)?
                  Text("Không có phòng nào đang sử dụng",style: TextStyle(color: theme.color9),):
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tên khách hàng",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),),
                          Text(selectedRoom!.customer!.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),)
                        ]
                      ),
                      Container(height: 1,color: theme.color6,margin: const EdgeInsets.symmetric(vertical: 15),),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Số điện thoại",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),),
                            Text(selectedRoom!.customer!.phoneNum,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),)
                          ]
                      ),
                      Container(height: 1,color: theme.color6,margin: const EdgeInsets.symmetric(vertical: 15),),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("CCCD",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),),
                            Text(selectedRoom!.customer!.id,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),)
                          ]
                      ),
                      Container(height: 1,color: theme.color6,margin: const EdgeInsets.symmetric(vertical: 15),),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ngày đặt",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),),
                            Text(DateFormat('dd:MM:yyyy HH:mm').format(selectedRoom!.customer!.bookingTime),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),)
                          ]
                      ),
                      Container(height: 1,color: theme.color6,margin: const EdgeInsets.symmetric(vertical: 15),),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ngày trả",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),),
                            Text(DateFormat('dd:MM:yyyy HH:mm').format(DateTime.now()),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),)
                          ]
                      ),
                      Container(height: 1,color: theme.color6,margin: const EdgeInsets.symmetric(vertical: 15),),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Thành tiền",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),),
                            Text('${mana.toMoney(selectedRoom!.customer!.bookingTime,DateTime.now(),selectedRoom! )}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: theme.color9),)
                          ]
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  ElevatedButton(
                      onPressed: (){
                        print(selectedRoom?.number);
                       mana.checkOut(selectedRoom!.floor, selectedRoom!.number);
                       mana.revenue += mana.toMoney(selectedRoom!.customer!.bookingTime,DateTime.now(),selectedRoom! );
                        theme.change();
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(theme.color5),
                          foregroundColor: MaterialStatePropertyAll(theme.color8),
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 50,vertical: 15))
                      ),
                      child: const Text("Trả phòng",style: TextStyle(fontSize: 18),))
                ],
              ),
            ),
          );
        });
  }
}
