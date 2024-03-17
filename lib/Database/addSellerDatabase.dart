import 'package:sqflite/sqflite.dart' as sql;


class AddSellerDatabase {

  //// CREATED TABLE ////
  static Future<void>addSellerTable(sql.Database database)async{
    await database.execute(
        """CREATE TABLE addSellerData(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    mobile TEXT,
    address TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
    )""");
  }

  ////// Created Database ////////
  static Future<sql.Database>addSellerDB()async{
    return sql.openDatabase('addSellerDataBase.db',version: 1,onCreate: (sql.Database database,int version)async{
      await addSellerTable(database);
    });
  }


  // Create Method for store data in database
  static Future<int> addSellerData(String name,String? mobile,String address)async{

    // SQLiteDatabase class Name where created and all data pass in created object

    final db = await AddSellerDatabase.addSellerDB();
    final data = {
      'name':name,
      'mobile':mobile,
      'address':address,
    };
    final id = await db.insert('addSellerData', data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;

  }


  // Get All Data from Database Method Created
  static Future<List<Map<String,dynamic>>>getAllSellerData()async{
    final db = await AddSellerDatabase.addSellerDB();
    return db.query('addSellerData',orderBy: 'id');
  }


  // Get Single Data from Database Method
  static  Future<List<Map<String,dynamic>>>getSingleData(int id)async{
    final db = await AddSellerDatabase.addSellerDB();
    return db.query('addSellerData',where: 'id = ?',whereArgs: [id],limit: 1);
  }


  // Update Data in Database using this Method
  static Future<int>updateData(int id,String name,String? mobile,String address)async{
    final db =  await AddSellerDatabase.addSellerDB();
    final data = {
      'name':name,
      'mobile':mobile,
      'address':address,
      'createdAt':DateTime.now().toString()
    };
    final result = await db.update('addSellerData', data,where: 'id = ?',whereArgs: [id]);
    return result;
  }

  // Delete Data from Database Created Method
  static Future<void>deleteData(int id)async{
    final db = await AddSellerDatabase.addSellerDB();
    try{
      await db.delete('addSellerData',where: 'id = ?',whereArgs: [id]);
    }catch(e){
      print('error $e');
    }
  }





}