import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teadiary/Database/manageMenuDatabase.dart';

import '../Constant/AppColor.dart';
import '../Database/addSellerDatabase.dart';

class ManageMenuItemPage extends StatefulWidget {
  const ManageMenuItemPage({super.key});

  @override
  State<ManageMenuItemPage> createState() => _ManageMenuItemPageState();
}

class _ManageMenuItemPageState extends State<ManageMenuItemPage> {


  List<Map<String,dynamic>> addSellerDataList = [];
  List<Map<String,dynamic>> manageMenuItemDataList = [];

  void _refreshData() async {
    final data = await AddSellerDatabase.getAllSellerData();
    final itemData = await ManageMenuDatabase.getAllManageMenuData();
    setState(() {
      addSellerDataList = data;
      manageMenuItemDataList = itemData;
    });
  }

  @override
  void initState() {
    _refreshData();
    super.initState();
  }

  bool tea = false;
  bool coffee = false;
  bool bournVita = false;
  bool itemValue = false;
  String? sellerName;

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // List<bool> boolList = List<bool>.filled(manageMenuItemDataList.length, false);
    List<bool> boolList = List.generate(manageMenuItemDataList.length, (index) => false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primeColor,
        title: Text('Manage Menu Item',style: TextStyle(color: Colors.white),),
        actions: [

        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),

            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              surfaceTintColor: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        width: 100,
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: Text('Tea Seller : ',style: TextStyle(color: primeColor,fontSize: 16,),)),
                  ),
                  DropdownMenu(
                    width: 200,
                    inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                    hintText: 'Select Seller',
                    onSelected: (selectNew){
                      setState(() {
                        sellerName = selectNew!;
                        log('sellerName : $sellerName');
                      });
                    },
                      dropdownMenuEntries: addSellerDataList.map((e) {
                        return DropdownMenuEntry(value: e['name'], label: e['name']);
                      }).toList()),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2.5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CheckboxListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tea',style: TextStyle(fontSize: 20),),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text('10',style: TextStyle(fontSize: 20),),
                          ),
                        ],
                      ),
                        value: tea,
                        activeColor: primeColor,
                        onChanged: (value){
                      setState(() {
                        tea = value!;
                      });
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2.5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CheckboxListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Coffee',style: TextStyle(fontSize: 20),),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text('20',style: TextStyle(fontSize: 20),),
                          ),
                        ],
                      ),
                        value: coffee,
                        activeColor: primeColor,
                        onChanged: (value){
                      setState(() {
                        coffee = value!;
                      });
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2.5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CheckboxListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('BournVita',style: TextStyle(fontSize: 20),),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text('25',style: TextStyle(fontSize: 20),),
                          ),
                        ],
                      ),
                        value: bournVita,
                        activeColor: primeColor,
                        onChanged: (value){
                      setState(() {
                        bournVita = value!;
                      });
                    }),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                      itemCount: manageMenuItemDataList.length,
                        itemBuilder: (context,index){
                        var itemName = manageMenuItemDataList[index]['itemName'];
                        var itemPrice = manageMenuItemDataList[index]['itemPrice'];
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2.5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CheckboxListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(itemName,style: TextStyle(fontSize: 20),),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Text(itemPrice,style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          ),
                          value: boolList[index],
                          activeColor: primeColor,
                          onChanged: (value){
                            setState(() {
                              boolList[index] = value!;
                              itemValue = boolList[index];
                              print(itemValue);
                            });
                          }),
                    ),
                  );
                })),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: Text('Save',style: TextStyle(color: Colors.white),)),
                SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: (){showDialog(context: context, builder: (context){
                      return SimpleDialog(
                        contentPadding: EdgeInsets.zero,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 55,
                            color: primeColor,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Add Menu Items',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 250,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    color:Colors.white,
                                    surfaceTintColor:Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: itemNameController,
                                            keyboardType: TextInputType.text,
                                            cursorColor: primeColor,
                                            decoration: InputDecoration(
                                                labelText: 'Item Name',
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: primeColor,width: 2),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: primeColor,width: 2),
                                                )
                                            ),
                                          ),
                                          TextFormField(
                                            controller: itemPriceController,
                                            keyboardType: TextInputType.number,
                                            cursorColor: primeColor,
                                            maxLength:10,
                                            decoration: InputDecoration(
                                                labelText: 'Item Price',
                                                counterText:'',
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: primeColor,width: 2),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: primeColor,width: 2),
                                                )
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: (){
                                      if(itemNameController.text.isEmpty||itemPriceController.text.isEmpty){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Please fill all details!',style: TextStyle(color: Colors.white,fontSize: 18),),
                                            backgroundColor: Colors.redAccent,
                                          ),);
                                      }else{
                                        ManageMenuDatabase.addManageMenuData(itemName: itemNameController.text,itemPrice: itemPriceController.text,).whenComplete((){
                                          Navigator.pop(context);
                                          _refreshData();
                                          itemNameController.clear();
                                          itemPriceController.clear();
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Menu item add Successfully...',style: TextStyle(color: Colors.white,fontSize: 18),),
                                              backgroundColor: Colors.green,
                                            ),);
                                        });
                                      }
                                    },
                                    style:ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      backgroundColor: primeColor,
                                    ),
                                    child:Text('Save',style: TextStyle(color: Colors.white,fontSize: 18),))
                              ],
                            ),
                          )
                        ],
                      );
                    });},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: Text('Add New Item',style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
