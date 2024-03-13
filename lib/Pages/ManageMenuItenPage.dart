import 'package:flutter/material.dart';

import '../Constant/AppColor.dart';

class ManageMenuItemPage extends StatefulWidget {
  const ManageMenuItemPage({super.key});

  @override
  State<ManageMenuItemPage> createState() => _ManageMenuItemPageState();
}

class _ManageMenuItemPageState extends State<ManageMenuItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primeColor,
        title: Text('Manage Menu Item',style: TextStyle(color: Colors.white),),
        actions: [

        ],
      ),
    );
  }
}
