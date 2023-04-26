import 'package:coffee_masters_flutter/pages/theofferspage.dart';
import 'package:flutter/material.dart';

import 'pages/manupage.dart';
import 'pages/orderspage.dart';

void main() {
  runApp(const MyApp());
}

/*
Widget Tree

 MyApp
  MyHomePage
   HelloWorld
    text
*/

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  var name = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello $name",
          style: const TextStyle(fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            onChanged: (value) => setState(() {
              name = value;
            }),
          ),
        ),
      ],
    );
  }
}

//Widget
class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Hello world");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentWidgetBadge = const Text("heeello");

    switch (selectedIndex) {
      case 0:
        currentWidgetBadge = const MenuPage();
        break;
      case 1:
        currentWidgetBadge = const OffersPage();
        break;
      case 2:
        currentWidgetBadge = const OrderPage();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logo.png"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellow.shade400,
          unselectedItemColor: Colors.brown.shade50,
          items: const [
            BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
            BottomNavigationBarItem(
                label: "Offers", icon: Icon(Icons.local_offer)),
            BottomNavigationBarItem(
                label: "Order",
                icon: Icon(Icons.shopping_cart_checkout_outlined)),
          ]),

      body: currentWidgetBadge,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
