class Customer{
  String name;
  String phoneNum;
  String id;
  DateTime bookingTime;
  DateTime? checkOutTime;
  Customer({required this.name, required this.phoneNum,required this.id,required this.bookingTime, this.checkOutTime});
}