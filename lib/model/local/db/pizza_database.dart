import 'package:path/path.dart';
import 'package:pizzateria/model/local/table/favorites.dart';
import 'package:sqflite/sqflite.dart';

class PizzaDatabase {
  static final PizzaDatabase instance = PizzaDatabase._init();

  static Database? _database;

  PizzaDatabase._init();

  Future<Database?> get database async {
    if(_database != null) return _database!;
    _database = await _initDB('pizza.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const stringType = 'TEXT NOT NULL UNIQUE';

    await db.execute(
        '''
          CREATE TABLE $tableName (
            ${FavoritePizzaFields.id} $idType,
            ${FavoritePizzaFields.deliveryTime} $stringType,
            ${FavoritePizzaFields.description} $stringType,
            ${FavoritePizzaFields.images} $stringType,
            ${FavoritePizzaFields.name} $stringType,
            ${FavoritePizzaFields.price} $stringType,
            ${FavoritePizzaFields.thumbnail} $stringType
          )
        '''
    );
  }

  Future<Favorites> create(Favorites favorites) async {
    final db = await instance.database;
    final id = await db?.insert(tableName, favorites.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return favorites.copy(id: id);
  }

  Future<Favorites> readFavorites(String name) async{
    final db = await instance.database;
    final maps = await db!.query(
      tableName,
      columns: FavoritePizzaFields.values,
      where: '${FavoritePizzaFields.name} = ?',
      whereArgs: [name],
    );

    if(maps.isNotEmpty){
      return Favorites.fromJson(maps.first);
    }else{
      throw Exception('Id $name was not found');
    }
  }

  Future<bool> isAdded(String name) async{
    final db = await instance.database;
    final maps = await db!.query(
      tableName,
      columns: FavoritePizzaFields.values,
      where: '${FavoritePizzaFields.name} = ?',
      whereArgs: [name],
    );

    if(maps.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  Future<List<Favorites>> readAllFavorites() async {
    final db = await instance.database;

    const orderBy = '${FavoritePizzaFields.name} ASC';

    final result = await db!.query(tableName, orderBy: orderBy);

    return result.map((json) => Favorites.fromJson(json)).toList();
  }

  Future<int> delete(String name) async {
    final db = await instance.database;

    return await db!.delete(
      tableName,
      where: '${FavoritePizzaFields.name} = ?',
      whereArgs: [name],
    );
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    db!.close();
  }
}