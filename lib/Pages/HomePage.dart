import 'package:flutter/material.dart';
import 'package:teadiary/Constant/AppColor.dart';
import 'package:teadiary/Pages/BillHistoryPage.dart';
import 'package:teadiary/Pages/ManageMenuItenPage.dart';
import 'package:teadiary/Pages/NewOrderPage.dart';
import 'package:teadiary/Pages/SellerListPage.dart';

import '../Constant/AppList.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
// 775645
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primeColor,
        title: Text('Tea Diary',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: primeColor,
                  child: SizedBox(
                    width: 170,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('0',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: 130,
                              child: Text('Tea/Coffee in August',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: primeColor,
                  child: SizedBox(
                    width: 170,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('₹ 0',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                              width: 130,
                              child: Text('Amount of August',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(homeList.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10,right: 5,left: 5),
                    child: InkWell(
                      onTap: (){
                        if(index == 0){
                          Navigator.popUntil(context, (route) => true);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SellerListPage()));
                        }else if(index == 1){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ManageMenuItemPage()));
                        }else if(index == 2){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ManageMenuItemPage()));
                        }
                        else if(index == 3){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewOrderPage()));
                        }
                        else if(index == 5){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BillHistoryPage()));
                        }
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(homeList[index].icon,color: primeColor,size: 45,),
                            Text(homeList[index].title.toString(),style: TextStyle(),),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
          onPressed: (){},
        child: Icon(Icons.share,color: Colors.white,),
      ),
    );
  }
}
