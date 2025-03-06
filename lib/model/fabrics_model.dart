class FabricsModel {
  final String fabricId;
  final String fabricImg;
  final String fabricName;
  final dynamic createdAt;
  final dynamic updatedAt;

  FabricsModel(
      {required this.fabricId,
      required this.fabricImg,
      required this.fabricName,
      required this.createdAt,
      required this.updatedAt});

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'fabricId': fabricId,
      'fabricImg': fabricImg,
      'fabricName': fabricName,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // Create a UserModel instance from a JSON map
  factory FabricsModel.fromMap(Map<String, dynamic> json) {
    return FabricsModel(
      fabricId: json['fabricId'],
      fabricImg: json['fabricImg'],
      fabricName: json['fabricName'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
