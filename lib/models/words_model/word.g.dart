// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWordsCollection on Isar {
  IsarCollection<Words> get words => this.collection();
}

const WordsSchema = CollectionSchema(
  name: r'Words',
  id: -4938769289030647685,
  properties: {
    r'isSelected': PropertySchema(
      id: 0,
      name: r'isSelected',
      type: IsarType.bool,
    ),
    r'nameEn': PropertySchema(
      id: 1,
      name: r'nameEn',
      type: IsarType.string,
    ),
    r'nameUz': PropertySchema(
      id: 2,
      name: r'nameUz',
      type: IsarType.string,
    )
  },
  estimateSize: _wordsEstimateSize,
  serialize: _wordsSerialize,
  deserialize: _wordsDeserialize,
  deserializeProp: _wordsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _wordsGetId,
  getLinks: _wordsGetLinks,
  attach: _wordsAttach,
  version: '3.1.0+1',
);

int _wordsEstimateSize(
  Words object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.nameEn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nameUz;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _wordsSerialize(
  Words object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isSelected);
  writer.writeString(offsets[1], object.nameEn);
  writer.writeString(offsets[2], object.nameUz);
}

Words _wordsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Words(
    nameEn: reader.readStringOrNull(offsets[1]),
    nameUz: reader.readStringOrNull(offsets[2]),
  );
  object.id = id;
  object.isSelected = reader.readBoolOrNull(offsets[0]);
  return object;
}

P _wordsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wordsGetId(Words object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wordsGetLinks(Words object) {
  return [];
}

void _wordsAttach(IsarCollection<dynamic> col, Id id, Words object) {
  object.id = id;
}

extension WordsQueryWhereSort on QueryBuilder<Words, Words, QWhere> {
  QueryBuilder<Words, Words, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WordsQueryWhere on QueryBuilder<Words, Words, QWhereClause> {
  QueryBuilder<Words, Words, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Words, Words, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Words, Words, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Words, Words, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WordsQueryFilter on QueryBuilder<Words, Words, QFilterCondition> {
  QueryBuilder<Words, Words, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> isSelectedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isSelected',
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> isSelectedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isSelected',
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> isSelectedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSelected',
        value: value,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameEn',
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameEn',
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameEn',
        value: '',
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameEn',
        value: '',
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameUz',
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameUz',
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameUz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameUz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameUz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameUz',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameUz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameUz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameUz',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameUz',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameUz',
        value: '',
      ));
    });
  }

  QueryBuilder<Words, Words, QAfterFilterCondition> nameUzIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameUz',
        value: '',
      ));
    });
  }
}

extension WordsQueryObject on QueryBuilder<Words, Words, QFilterCondition> {}

extension WordsQueryLinks on QueryBuilder<Words, Words, QFilterCondition> {}

extension WordsQuerySortBy on QueryBuilder<Words, Words, QSortBy> {
  QueryBuilder<Words, Words, QAfterSortBy> sortByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> sortByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> sortByNameEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameEn', Sort.asc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> sortByNameEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameEn', Sort.desc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> sortByNameUz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUz', Sort.asc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> sortByNameUzDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUz', Sort.desc);
    });
  }
}

extension WordsQuerySortThenBy on QueryBuilder<Words, Words, QSortThenBy> {
  QueryBuilder<Words, Words, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> thenByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> thenByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> thenByNameEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameEn', Sort.asc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> thenByNameEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameEn', Sort.desc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> thenByNameUz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUz', Sort.asc);
    });
  }

  QueryBuilder<Words, Words, QAfterSortBy> thenByNameUzDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameUz', Sort.desc);
    });
  }
}

extension WordsQueryWhereDistinct on QueryBuilder<Words, Words, QDistinct> {
  QueryBuilder<Words, Words, QDistinct> distinctByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSelected');
    });
  }

  QueryBuilder<Words, Words, QDistinct> distinctByNameEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Words, Words, QDistinct> distinctByNameUz(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameUz', caseSensitive: caseSensitive);
    });
  }
}

extension WordsQueryProperty on QueryBuilder<Words, Words, QQueryProperty> {
  QueryBuilder<Words, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Words, bool?, QQueryOperations> isSelectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSelected');
    });
  }

  QueryBuilder<Words, String?, QQueryOperations> nameEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameEn');
    });
  }

  QueryBuilder<Words, String?, QQueryOperations> nameUzProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameUz');
    });
  }
}
