import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manahotel/model/hotelMana.dart';
import 'package:manahotel/ui/myTheme.dart';
import 'package:provider/provider.dart';

import '../objects/customer.dart';
class BookRoomScreen extends StatelessWidget {
  String? roomNumber;
  int? floor;
  BookRoomScreen({super.key, this.floor,this.roomNumber});
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    TextEditingController roomName = TextEditingController();
    TextEditingController roomFloor = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController phoneNum = TextEditingController();
    TextEditingController id = TextEditingController();
    roomName.text = roomNumber??'';
    roomFloor.text = (floor == null)?'':floor.toString();
    return Consumer2<MyTheme,HotelMana>(
        builder: (BuildContext context, theme,mana,child){
          return Scaffold(
            backgroundColor: theme.color1,
            appBar: AppBar(
              backgroundColor: theme.color1,
              foregroundColor: theme.color8,
              title: const Text("Đặt phòng"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  TextField(
                      style: TextStyle(color: theme.color9),
                      controller: roomName,
                      decoration:  InputDecoration(
                          hintText: "Số phòng",
                          hintStyle: TextStyle(color: theme.color9)
                      )
                  ),
                  TextField(
                      style: TextStyle(color: theme.color9),
                      controller: roomFloor,
                      decoration:  InputDecoration(
                          hintText: "Tầng",
                          hintStyle: TextStyle(color: theme.color9)
                      )
                  ),
                  TextField(
                      style: TextStyle(color: theme.color9),
                      controller: name,
                      decoration:  InputDecoration(
                          hintText: "Tên khách hàng",
                          hintStyle: TextStyle(color: theme.color9)
                      )
                  ),
                  TextField(
                      style: TextStyle(color: theme.color9),
                      controller: phoneNum,
                      decoration:  InputDecoration(
                          hintText: "SĐT",
                          hintStyle: TextStyle(color: theme.color9)
                      )
                  ),
                  TextField(
                      style: TextStyle(color: theme.color9),
                      controller: id,
                      decoration:  InputDecoration(
                          hintText: "CCCD",
                          hintStyle: TextStyle(color: theme.color9)
                      )
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ngày đặt:',style: TextStyle(color: theme.color9,fontSize: 18)),
                      TextButton(onPressed:()async{
                        final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2026)
                        );

                        if (dateTime!=null){
                          time = dateTime;
                          theme.change();
                        }
                      },
                          child: Text(DateFormat('yyyy-MM-dd HH:mm').format(time),style: TextStyle(fontSize: 18),),)
                    ],
                  ),
                  const SizedBox(height: 50,),
                  ElevatedButton(
                      onPressed: (){
                        if(name.text !='' && phoneNum.text!= '' && id.text!= ''&& roomName.text!= ''&& roomFloor.text!= ''){
                          Customer customer = Customer(name: name.text,phoneNum: phoneNum.text,id: id.text,bookingTime: time);
                          mana.bookRoom(int.parse(roomFloor.text), roomName.text, customer);
                          theme.change();
                          Navigator.pop(context);
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            duration: Duration(seconds: 2),
                              backgroundColor: Colors.grey,
                              content: Text("Vui lòng nhập đủ thông tin",style: TextStyle(color: Colors.white),)));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(theme.color5),
                        foregroundColor: MaterialStatePropertyAll(theme.color8),
                        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 50,vertical: 15))
                      ),
                      child: Text("Đặt phòng",style: TextStyle(fontSize: 18),))
                ],
              ),
            ),
          );
        });
  }
}
