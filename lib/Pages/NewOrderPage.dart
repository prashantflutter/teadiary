import 'package:flutter/material.dart';

import '../Constant/AppColor.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});

  @override
  State<NewOrderPage> createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primeColor,
        title: Text('New Order',style: TextStyle(color: Colors.white),),
        actions: [

        ],
      ),
    );
  }
}
