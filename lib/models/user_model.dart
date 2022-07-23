import 'dart:convert';

class UserModel {
  final String name;
  final String areacode;
  final String email;
  final String? uid;
  final String consuernumber;

  UserModel(this.name, this.areacode, this.email, this.uid, this.consuernumber);

  UserModel copyWith({
    String? name,
    String? areacode,
    String? email,
    String? uid,
    String? consuernumber,
  }) {
    return UserModel(
      name ?? this.name,
      areacode ?? this.areacode,
      email ?? this.email,
      uid ?? this.uid,
      consuernumber ?? this.consuernumber,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'areacode': areacode});
    result.addAll({'email': email});
    if (uid != null) {
      result.addAll({'uid': uid});
    }
    result.addAll({'consuernumber': consuernumber});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic?> map) {
    return UserModel(
      map['name'] ?? '',
      map['areacode'] ?? '',
      map['email'] ?? '',
      map['uid'],
      map['consuernumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
