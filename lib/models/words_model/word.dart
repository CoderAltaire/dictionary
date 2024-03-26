import 'package:isar/isar.dart';
part 'word.g.dart';

@collection
class Words {
  Id id = Isar.autoIncrement;
  String? nameEn;
  String? nameUz;
  bool? isSelected;
  Words({
    this.nameEn,
    this.nameUz,
  });

  
}
