class Usermodel {
  final String name;
  final String profilePic;
  final String banner;
  final String Uid;
  final bool isAunthenticated;  // if guest or not
  final int karma;
  final List<String> awards;

//<editor-fold desc="Data Methods">
  const Usermodel({
    required this.name,
    required this.profilePic,
    required this.banner,
    required this.Uid,
    required this.isAunthenticated,
    required this.karma,
    required this.awards,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usermodel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          profilePic == other.profilePic &&
          banner == other.banner &&
          Uid == other.Uid &&
          isAunthenticated == other.isAunthenticated &&
          karma == other.karma &&
          awards == other.awards);

  @override
  int get hashCode =>
      name.hashCode ^
      profilePic.hashCode ^
      banner.hashCode ^
      Uid.hashCode ^
      isAunthenticated.hashCode ^
      karma.hashCode ^
      awards.hashCode;

  @override
  String toString() {
    return 'Usermodel{' +
        ' name: $name,' +
        ' profilePic: $profilePic,' +
        ' banner: $banner,' +
        ' Uid: $Uid,' +
        ' isAunthenticated: $isAunthenticated,' +
        ' karma: $karma,' +
        ' awards: $awards,' +
        '}';
  }

  Usermodel copyWith({
    String? name,
    String? profilePic,
    String? banner,
    String? Uid,
    bool? isAunthenticated,
    int? karma,
    List<String>? awards,
  }) {
    return Usermodel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      banner: banner ?? this.banner,
      Uid: Uid ?? this.Uid,
      isAunthenticated: isAunthenticated ?? this.isAunthenticated,
      karma: karma ?? this.karma,
      awards: awards ?? this.awards,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'profilePic': this.profilePic,
      'banner': this.banner,
      'Uid': this.Uid,
      'isAunthenticated': this.isAunthenticated,
      'karma': this.karma,
      'awards': this.awards,
    };
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      banner: map['banner'] as String,
      Uid: map['Uid'] as String,
      isAunthenticated: map['isAunthenticated'] as bool,
      karma: map['karma'] as int,
      awards: map['awards'] as List<String>,
    );
  }

//</editor-fold>
}