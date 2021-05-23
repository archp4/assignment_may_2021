import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

//it was for task 6 but it's not working
class DatabaseConnection {
  var db;
  DatabaseConnection() {
    setDatabase();
  }
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_task_6');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE task (datax TEXT)');
        db.transaction((txn) async {
          await txn.rawInsert(
              'INSERT INTO Test(datax) VALUES ("This is Example text from local Database")');
        });
      },
    );
  }

  //INSERT INTO Test(datax) VALUES ("This is Example text from local Database")
  savetoDB(String dataX) async {
    await db.transaction((txn) async {
      int id = await txn.rawInsert('INSERT INTO Test(datax) VALUES ("$dataX")');
      print('inserted1: $id');
    });
  }

  getDataFromDB() async {
    List<Map> list = await db.rawQuery('SELECT * FROM Test');
    print(list);
  }
}
