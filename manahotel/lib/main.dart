import 'package:flutter/material.dart';
import 'package:manahotel/model/hotelMana.dart';
import 'package:manahotel/screens/homeScreen.dart';
import 'package:manahotel/ui/myTheme.dart';
import 'package:provider/provider.dart';
import 'package:manahotel/screens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> MyTheme()),
        ChangeNotifierProvider(create: (context)=>HotelMana())
      ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: loginScreen(),
        )
    );
  }
}