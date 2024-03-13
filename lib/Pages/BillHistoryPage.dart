import 'package:flutter/material.dart';

import '../Constant/AppColor.dart';


class BillHistoryPage extends StatefulWidget {
  const BillHistoryPage({super.key});

  @override
  State<BillHistoryPage> createState() => _BillHistoryPageState();
}

class _BillHistoryPageState extends State<BillHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primeColor,
        title: Text('Bill History',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
