class UserModel {
  final String name;
  final String uid;
  final String profileImageUrl;
  final String phoneNumber;
  final List<String> courseId;

  const UserModel({
    required this.name,
    required this.phoneNumber,
    required this.profileImageUrl,
    required this.uid,
    required this.courseId,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'profileImageUrl': profileImageUrl,
      'phoneNumber': phoneNumber,
      'courseId': courseId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      courseId: List<String>.from(map['courseId']),
    );
  }
}
