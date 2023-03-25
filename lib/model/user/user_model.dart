class UserModel {
  final String name;
  final String uid;
  final String profileImageUrl;
  final String phoneNumber;
  final String dob;
  final String studentClass;
  final List<String> courseId;

  const UserModel(
      {required this.name,
      required this.phoneNumber,
      required this.profileImageUrl,
      required this.uid,
      required this.courseId,
      required this.dob,
      required this.studentClass});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'profileImageUrl': profileImageUrl,
      'phoneNumber': phoneNumber,
      'courseId': courseId,
      'dob': dob,
      'studentClass': studentClass
    };
  }

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] ?? '',
      uid: data['uid'] ?? '',
      profileImageUrl: data['profileImageUrl'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      courseId: List<String>.from(data['courseId']),
      dob: data['dob'] ?? '',
      studentClass: data['studentClass'] ?? '',
    );
  }
}
