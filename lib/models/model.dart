import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.agama,
    required this.jnsKel,
    required this.alamat,
    required this.asalSekolah,
    required this.tahun,
    required this.tempatLahir,
    required this.tanggalLahir,
  });
  String id;
  String nama;
  String nim;
  String prodi;
  String agama;
  String jnsKel;
  String alamat;
  String asalSekolah;
  String tahun;
  String tempatLahir;
  String tanggalLahir;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nama: json["nama"],
        nim: json["nim"],
        prodi: json["prodi"],
        agama: json["agama"],
        jnsKel: json["jns_kel"],
        alamat: json["alamat"],
        asalSekolah: json["asal_sekolah"],
        tahun: json["tahun"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nim": nim,
        "prodi": prodi,
        "agama": agama,
        "jns_kel": jnsKel,
        "alamat": alamat,
        "asal_sekolah": asalSekolah,
        "tahun": tahun,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
      };
}
