
import 'package:flutter/material.dart';
import 'package:teadiary/Database/addSellerDatabase.dart';
import '../Constant/AppColor.dart';

class SellerListPage extends StatefulWidget {
  const SellerListPage({super.key});

  @override
  State<SellerListPage> createState() => _SellerListPageState();
}

class _SellerListPageState extends State<SellerListPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<Map<String,dynamic>> addSellerDataList = [];

  void _refreshData() async {
    final data = await AddSellerDatabase.getAllSellerData();
    setState(() {
      addSellerDataList = data;
    });
  }

  @override
  void initState() {
    _refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primeColor,
        title: Text('Seller List',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (context){
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
                      child: Text('Add New Seller',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
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
                                    controller: nameController,
                                    keyboardType: TextInputType.text,
                                    cursorColor: primeColor,
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: primeColor,width: 2),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: primeColor,width: 2),
                                      )
                                    ),
                                  ),
                                  TextFormField(
                                    controller: mobileController,
                                    keyboardType: TextInputType.number,
                                    cursorColor: primeColor,
                                    maxLength:10,
                                    decoration: InputDecoration(
                                      labelText: 'Mobile',
                                      counterText:'',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: primeColor,width: 2),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: primeColor,width: 2),
                                      )
                                    ),
                                  ),
                                  TextFormField(
                                    controller: addressController,
                                    keyboardType: TextInputType.text,
                                    cursorColor: primeColor,
                                    decoration: InputDecoration(
                                      labelText: 'Address',
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
                             if(addressController.text.isEmpty||mobileController.text.isEmpty||addressController.text.isEmpty){
                               ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                   content: Text('Please fill all details!',style: TextStyle(color: Colors.white,fontSize: 18),),
                                   backgroundColor: Colors.redAccent,
                                 ),);
                             }else{
                               AddSellerDatabase.addSellerData(nameController.text, mobileController.text, addressController.text).whenComplete((){
                                 Navigator.pop(context);
                                 _refreshData();
                                 nameController.clear();
                                 mobileController.clear();
                                 addressController.clear();
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                     content: Text('Seller add Successfully...',style: TextStyle(color: Colors.white,fontSize: 18),),
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
            });
          },
            icon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.add,size: 35,color: Colors.white,),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:  addSellerDataList.length,
          itemBuilder: (context,index){
          var name = addSellerDataList[index]['name'];
          var mobile = addSellerDataList[index]['mobile'];
          var address = addSellerDataList[index]['address'];
        return Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.account_circle,color: primeColor,size: 45,),
              title: Text('Name : $name',style: TextStyle(color: primeColor,fontSize: 18,fontWeight: FontWeight.bold),),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Text('Mobile : $mobile',style: TextStyle(color: Colors.blueGrey,fontSize: 14,fontWeight: FontWeight.normal),)),
                  SizedBox( width: double.infinity,child: Text('Address : $address',style: TextStyle(color: Colors.blueGrey,fontSize: 14,fontWeight: FontWeight.normal),)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
