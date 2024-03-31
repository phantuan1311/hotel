import 'package:flutter/material.dart';

import '../objects/customer.dart';
import '../objects/floor.dart';
import '../objects/room.dart';

class HotelMana with ChangeNotifier{
  int totalRoom = 25;
  int emptyRoom = 25;
  int bookedRoom = 0;
  int revenue = 0;
  List<Floor> listFloor = [
    Floor(floor: 1,listRoom: [
      Room(number: '101',cost: 100000,),
      Room(number: '102',cost: 100000,),
      Room(number: '103',cost: 100000,),
      Room(number: '104',cost: 100000,),
      Room(number: '105',cost: 100000,),

    ],),
    Floor(floor: 2,listRoom: [
      Room(number: '201',cost: 100000,floor: 2,),
      Room(number: '202',cost: 100000,floor: 2,),
      Room(number: '203',cost: 100000,floor: 2,),
      Room(number: '204',cost: 100000,floor: 2,),
      Room(number: '205',cost: 100000,floor: 2,),
    ],),
    Floor(floor: 3,listRoom: [
      Room(number: '301',cost: 100000,floor: 3,),
      Room(number: '302',cost: 100000,floor: 3,),
      Room(number: '303',cost: 100000,floor: 3,),
      Room(number: '304',cost: 100000,floor: 3,),
      Room(number: '305',cost: 100000,floor: 3,),
    ],),
    Floor(floor: 4,listRoom: [
      Room(number: '401',cost: 100000,floor: 4,),
      Room(number: '402',cost: 100000,floor: 4,),
      Room(number: '403',cost: 100000,floor: 4,),
      Room(number: '404',cost: 100000,floor: 4,),
      Room(number: '405',cost: 100000,floor: 4,),
    ],),
    Floor(floor: 5,listRoom: [
      Room(number: '501',cost: 100000,floor: 5,),
      Room(number: '502',cost: 100000,floor: 5,),
      Room(number: '503',cost: 100000,floor: 5,),
      Room(number: '504',cost: 100000,floor: 5,),
      Room(number: '505',cost: 100000,floor: 5,),
    ],),
  ];
  bool addRoom(Room room){
      for (var i in listFloor){
        if (i.floor == room.floor){
          i.listRoom.add(room);
          emptyRoom ++;
          totalRoom ++;
          notifyListeners();
          return true;
        }
      }
      return false;
  }
  updateRoom(Room room,Room newRoom){
    int floorIndex = room.floor - 1;
    int roomIndex = listFloor[floorIndex].listRoom.indexOf(room);
      listFloor[floorIndex].listRoom[roomIndex] = newRoom;
      notifyListeners();

  }
  int toMoney(DateTime bookingTime,DateTime checkOutTime, Room room){
    Duration period = checkOutTime.difference(bookingTime);
    return (period.inDays + 1)*room.cost;
  }
  bool deleteRoom(Room room){
    Floor floor = listFloor[room.floor -1];
    if(floor.listRoom.contains(room)){
      floor.listRoom.remove(room);
      totalRoom --;
      emptyRoom --;
      notifyListeners();
      return true;
    }
    return false;
  }
   bookRoom(int floor, String roomNum ,Customer customer){
     int indexOfRoom = listFloor[floor-1].listRoom.indexWhere((r) => r.number==roomNum);
     if(indexOfRoom >=0 && listFloor[floor-1].listRoom[indexOfRoom].status == RoomStatus.available){
       emptyRoom --;
       bookedRoom ++;
       listFloor[floor-1].listRoom[indexOfRoom].customer = customer;
       listFloor[floor-1].listRoom[indexOfRoom].status = RoomStatus.unavailable;
       notifyListeners();
     }
  }
   checkOut(int floor, String roomNum ){
    int indexOfRoom = listFloor[floor-1].listRoom.indexWhere((r) => r.number==roomNum);
    if(indexOfRoom >=0 && listFloor[floor-1].listRoom[indexOfRoom].status == RoomStatus.unavailable){
      emptyRoom ++;
      bookedRoom --;
      listFloor[floor-1].listRoom[indexOfRoom].status = RoomStatus.available;
      notifyListeners();
    }
  }
  change(){notifyListeners();}
}