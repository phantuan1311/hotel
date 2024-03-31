import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manahotel/screens/homeScreen.dart';
import '../ui/myTheme.dart';

class loginScreen extends StatefulWidget{
  const loginScreen({super.key});

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen>{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Provider.of<MyTheme>(context, listen: false).color1,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ABC Hotel', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Provider.of<MyTheme>(context).color10),),
            TextField(
              style: TextStyle(color: Provider.of<MyTheme>(context).color8),
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              style: TextStyle(color: Provider.of<MyTheme>(context).color8),
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){
                String username = usernameController.text;
                String password = passwordController.text;

                if(username == 'abc' && password == '123'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen())
                  );
                  print('Login Successful!');
                } else{
                  print('Login failed');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Provider.of<MyTheme>(context).color10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                minimumSize: Size(400, 60),
              ),
              child: Text('Login', style: TextStyle(fontSize: 25, color: Provider.of<MyTheme>(context).color1, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}