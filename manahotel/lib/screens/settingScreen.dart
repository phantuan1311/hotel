
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:manahotel/ui/myTheme.dart';
import 'package:provider/provider.dart';
import 'package:manahotel/screens/loginScreen.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 18;

    return Consumer<MyTheme>(builder:
    (BuildContext context,theme,child){
      Color pickedERColor = theme.emptyRoomColor;
      Color pickedBRColor = theme.bookedRoomColor;
      return Scaffold(
        backgroundColor: Provider.of<MyTheme>(context).color1,
        appBar: AppBar(
          title: const Text('Setting'),
          backgroundColor: theme.color1,
          foregroundColor: theme.color8,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  color: theme.color2,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0,4),
                      blurRadius: 10
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dark mode',style: TextStyle(fontSize: size,color: theme.color8),),
                    Switch(
                        value: theme.isDark,
                        onChanged: (value){
                          theme.isDark = value;
                          theme.setTheme(value);
                        })
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                decoration: BoxDecoration(
                  color: theme.color2,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0,4),
                        blurRadius: 10
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Màu phòng trống',style: TextStyle(fontSize: size,color: theme.color8),),
                    GestureDetector(
                      onTap: (){
                        showDialog(context: (context), builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Chọn màu"),
                            actions: [TextButton(
                                onPressed: (){
                                  theme.setEmptyRoomColor(pickedERColor);
                                  Navigator.pop(context);},
                                child: Text("OK"))],
                            content: SizedBox(
                              height: 300,
                              child: SingleChildScrollView(
                                child: ColorPicker(
                                  color: pickedERColor,
                                  onColorChanged: (Color color) {
                                    pickedERColor = color;
                                  },
                                ),
                              ),
                            ),
                          );
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(18),
                        decoration:BoxDecoration(
                          color: theme.emptyRoomColor,
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                decoration: BoxDecoration(
                  color: theme.color2,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0,4),
                        blurRadius: 10
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Màu phòng đã đặt',style: TextStyle(fontSize: size,color: theme.color8),),
                    GestureDetector(
                      onTap: (){
                        showDialog(context: (context), builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Chọn màu"),
                            actions: [TextButton(
                                onPressed: (){
                                  theme.setBookedRoomColor(pickedBRColor);
                                  Navigator.pop(context);},
                                child: Text("OK"))],
                            content: SizedBox(
                              height: 300,
                              child: SingleChildScrollView(
                                child: ColorPicker(
                                  color: pickedBRColor,
                                  onColorChanged: (Color color) {
                                    pickedBRColor = color;
                                  },
                                ),
                              ),
                            ),
                          );
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(18),
                        decoration:BoxDecoration(
                            color: theme.bookedRoomColor,
                            borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                decoration: BoxDecoration(
                  color: theme.color2,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0,4),
                        blurRadius: 10
                    )
                  ],
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => loginScreen())
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Đăng xuất',style: TextStyle(fontSize: size,color: theme.color8),),
                      Icon(Icons.power_settings_new_outlined,size: 35,color: Colors.redAccent,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
