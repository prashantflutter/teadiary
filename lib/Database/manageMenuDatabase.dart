import 'package:sqflite/sqflite.dart' as sql;


class ManageMenuDatabase {

  //// CREATED TABLE ////
  static Future<void>manageMenuDataTable(sql.Database database)async{
    await database.execute(
        """CREATE TABLE manageMenuData(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    itemName TEXT,
    itemPrice TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
    )""");
  }

  ////// Created Database ////////
  static Future<sql.Database>manageMenuDB()async{
    return sql.openDatabase('manageMenuDatabase.db',version: 1,onCreate: (sql.Database database,int version)async{
      await manageMenuDataTable(database);
    });
  }

  // Create Method for store data in database
  static Future<int> addManageMenuData({required String itemName, required String itemPrice})async{

    // SQLiteDatabase class Name where created and all data pass in created object
    final db = await ManageMenuDatabase.manageMenuDB();
    final data = {
      'itemName':itemName,
      'itemPrice':itemPrice,
    };
    final id = await db.insert('manageMenuData', data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;

  }


  // Get All Data from Database Method Created
  static Future<List<Map<String,dynamic>>>getAllManageMenuData()async{
    final db = await ManageMenuDatabase.manageMenuDB();
    return db.query('manageMenuData',orderBy: 'id');
  }


  // Get Single Data from Database Method
  static  Future<List<Map<String,dynamic>>>getSingleManageMenuData(int id)async{
    final db = await ManageMenuDatabase.manageMenuDB();
    return db.query('manageMenuData',where: 'id = ?',whereArgs: [id],limit: 1);
  }


  // Update Data in Database using this Method
  static Future<int>updateManageMenuData(int id,String itemName,String? itemPrice)async{
    final db =  await ManageMenuDatabase.manageMenuDB();
    final data = {
      'itemName':itemName,
      'itemPrice':itemPrice,
      'createdAt':DateTime.now().toString()
    };
    final result = await db.update('manageMenuData', data,where: 'id = ?',whereArgs: [id]);
    return result;
  }

  // Delete Data from Database Created Method
  static Future<void>deleteManageMenuData(int id)async{
    final db = await ManageMenuDatabase.manageMenuDB();
    try{
      await db.delete('manageMenuData',where: 'id = ?',whereArgs: [id]);
    }catch(e){
      print('error $e');
    }
  }





}