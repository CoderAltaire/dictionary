import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/words_model/word.dart';

class IsarService {
  late final Future<Isar> db;
  IsarService() {
    db = openDB();
  }

  Future<void> save(Words wd) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.words.putSync(wd));
  }

  Future<List<Words>> getAllSura() async {
    final isar = await db;
    
    return isar.words.where().findAll();
  }

  getSuraWithId(Id id) async {
    final isar = await db;
    return isar.words.get(id);
  }

  Future<bool> remove(int id) async {
    final isar = await db;
    return await isar.writeTxn(() async => await isar.words.delete(id));
  }

  Future<void> clear() async {
    final isar = await db;
    return await isar.writeTxn(() async => await isar.words.clear());
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [WordsSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
