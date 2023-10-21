class UserInfoModel {
  String? id;
  String? namaUser;
  String? userName;
  String? fotoUser;
  int? status;
  UserInfoModel({id, namaUser, userName, fotoUser, status});

  String? get userid => id;
  String? get namaUserUser => namaUser;
  String? get fotoUserUser => fotoUser;
  int? get statusUser => status;

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    namaUser = json['nama_user'].toString();
    fotoUser = json['foto_user'].toString();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_user'] = namaUser;
    data['foto_user'] = fotoUser;
    data['status'] = status;
    return data;
  }
}
