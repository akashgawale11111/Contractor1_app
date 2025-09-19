// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String intime;
  final String outTime;
  final String gpsPostion;
  final String work;

  UserModel({
    required this.intime,
    required this.outTime,
    required this.gpsPostion,
    required this.work,
  });

  UserModel copyWith({
    String? intime,
    String? outTime,
    String? gpsPostion,
    String? work,
  }) {
    return UserModel(
      intime: intime ?? this.intime,
      outTime: outTime ?? this.outTime,
      gpsPostion: gpsPostion ?? this.gpsPostion,
      work: work ?? this.work,
    );
  }
}
