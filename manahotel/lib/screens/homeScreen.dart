import 'package:flutter/material.dart';
import 'package:manahotel/model/hotelMana.dart';
import 'package:manahotel/screens/bookRoomScreen.dart';
import 'package:manahotel/screens/checkOutScreen.dart';
import 'package:manahotel/screens/roomManagementScreen.dart';
import 'package:manahotel/screens/settingScreen.dart';
import 'package:provider/provider.dart';

import '../ui/myTheme.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<MyTheme,HotelMana>(
      builder: (BuildContext context,theme,mana,child){
        double size = 18;
      return Scaffold(
        backgroundColor: Provider.of<MyTheme>(context, listen: false).color1,
        body: Column(
          children: [
            const SizedBox(height: 50,),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const SettingScreen()));
                },
                icon: Icon(Icons.settings,color: theme.color8,),
                iconSize: 35,
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: theme.color2,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0,4)
                              )
                            ]
                        ),
                        child:Column(
                          children: [
                            Text("Phòng trống",style: TextStyle(fontSize: 14,color:Color(0xFF00DFD2) ),),
                            const SizedBox(height: 20,),
                            Text('${mana.emptyRoom}',style: TextStyle(fontSize: 60,color:Color(0xFF00DFD2),fontWeight: FontWeight.bold))
                          ],
                        ),),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: theme.color2,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0,4)
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Text("Phòng đang sử dụng",style: TextStyle(fontSize: 14,color:Color(0xFFE57879) ),),
                            const SizedBox(height: 20,),
                            Text('${mana.bookedRoom}',style: TextStyle(fontSize: 60,color:Color(0xFFE57879),fontWeight: FontWeight.bold))
                          ],
                        ),),
                    )
                  ],),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: theme.color2,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0,4)
                          )
                        ]
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Doanh thu',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color:Color(0xFF00DFD2) )),
                      Text('${mana.revenue}',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Color(0xFF00DFD2) ),)
                    ],
                  ),),
                  const SizedBox(height: 40,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>RoomManagementScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0,4)
                          )
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: theme.color4
                      ),
                      child: Stack(
                        children: [
                          Icon(Icons.menu,size: 30,color: theme.color8,),
                          Center(
                            child: Text("Quản lý phòng",
                              style: TextStyle(
                                fontSize: size,
                                fontWeight: FontWeight.bold,
                                color: theme.color8
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> BookRoomScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0,4)
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: theme.color5
                      ),
                      child: Stack(
                        children: [
                          Icon(Icons.assignment_outlined,size: 30,color: theme.color8,),
                          Center(
                            child: Text("Đặt phòng",
                              style: TextStyle(
                                  fontSize: size,
                                  fontWeight: FontWeight.bold,
                                  color: theme.color8
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>CheckOutScreen()));},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0,4)
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: theme.color6
                      ),
                      child: Stack(
                        children: [
                          Icon(Icons.assignment_return_outlined,size: 30,color: theme.color8,),
                          Center(
                            child: Text("Trả phòng",
                              style: TextStyle(
                                  fontSize: size,
                                  fontWeight: FontWeight.bold,
                                  color: theme.color8
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
      }
    );
  }
}
