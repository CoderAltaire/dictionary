class VocabluaryModel {
  String eng;
  String uz;
  int eId = 1;
  double sId;

  VocabluaryModel(
      {required this.eId,
      required this.eng,
      required this.sId,
      required this.uz});

  factory VocabluaryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return VocabluaryModel(
      eId: json['eId'] ?? 0,
      eng: json['eng'] ?? '',
      sId: json['sId'] ?? 0,
      uz: json['uz'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        'uz': uz,
        'eng': eng,
      };
}
