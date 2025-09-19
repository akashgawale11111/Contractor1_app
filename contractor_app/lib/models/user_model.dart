enum Post { head, superwiser, employe }

class UserModel {
  final String uid;
  final String fullName;
  final String phoneNumber;
  final String gender;
  final int dob;
  final String imageUrl;
  final String post;
  UserModel({
    required this.uid,
    required this.fullName,
    required this.phoneNumber,
    required this.gender,
    required this.dob,
    required this.imageUrl,
    required this.post,
  });

  UserModel copyWith({
    String? uid,
    String? fullName,
    String? phoneNumber,
    String? gender,
    int? dob,
    String? imageUrl,
    String? post,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      imageUrl: imageUrl ?? this.imageUrl,
      post: post ?? this.post,
    );
  }

  // factory UserModel.fromFirestore(DocumentSnapshot doc) {
  //   final data = doc.data() as Map<String, dynamic>;
  //   return UserModel(
  //     uid: doc.id,
  //     username: data["username"] ?? "",
  //     fullName: data["fullName"] ?? "",
  //     email: data["email"] ?? "",
  //     phoneNumber: data["phoneNumber"] ?? "",
  //     fcmToken: data["fcmToken"],
  //     blockedUsers: List<String>.from(data["blockedUsers"]),
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'dob': dob,
      'imageUrl': imageUrl,
      'post': post,
    };
  }
}
