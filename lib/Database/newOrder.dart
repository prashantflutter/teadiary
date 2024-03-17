import 'package:sqflite/sqflite.dart' as sql;


class NewOrderDatabase {

  //// CREATED TABLE ////
  static Future<void>NewOrderDataTable(sql.Database database)async{
    await database.execute(
        """CREATE TABLE NewOrderData(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    itemName TEXT,
    itemPrice TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
    )""");
  }

  ////// Created Database ////////
  static Future<sql.Database>newOrderDataDB()async{
    return sql.openDatabase('NewOrderDatabase.db',version: 1,onCreate: (sql.Database database,int version)async{
      await NewOrderDataTable(database);
    });
  }

  // Create Method for store data in database
  static Future<int> addNewOrderDataData({required String itemName, required String itemPrice})async{

    // SQLiteDatabase class Name where created and all data pass in created object
    final db = await NewOrderDatabase.newOrderDataDB();
    final data = {
      'itemName':itemName,
      'itemPrice':itemPrice,
    };
    final id = await db.insert('NewOrderData', data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;

  }


  // Get All Data from Database Method Created
  static Future<List<Map<String,dynamic>>>getAllNewOrderDataData()async{
    final db = await NewOrderDatabase.newOrderDataDB();
    return db.query('NewOrderData',orderBy: 'id');
  }


  // Get Single Data from Database Method
  static  Future<List<Map<String,dynamic>>>getSingleNewOrderDataData(int id)async{
    final db = await NewOrderDatabase.newOrderDataDB();
    return db.query('NewOrderData',where: 'id = ?',whereArgs: [id],limit: 1);
  }


  // Update Data in Database using this Method
  static Future<int>updateNewOrderDataData(int id,String itemName,String? itemPrice)async{
    final db =  await NewOrderDatabase.newOrderDataDB();
    final data = {
      'itemName':itemName,
      'itemPrice':itemPrice,
      'createdAt':DateTime.now().toString()
    };
    final result = await db.update('NewOrderData', data,where: 'id = ?',whereArgs: [id]);
    return result;
  }

  // Delete Data from Database Created Method
  static Future<void>deleteNewOrderDataData(int id)async{
    final db = await NewOrderDatabase.newOrderDataDB();
    try{
      await db.delete('NewOrderData',where: 'id = ?',whereArgs: [id]);
    }catch(e){
      print('error $e');
    }
  }





}