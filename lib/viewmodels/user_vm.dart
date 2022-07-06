import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class UserViewModel {
  Future getUsers() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse("https://localhost/crud/list.php"),
          headers: {"Accept": "application/json"});
      if (kDebugMode) {
        print(hasil.statusCode);
      }
      if (hasil.statusCode == 200) {
        if (kDebugMode) {
          print(hasil.body);
        }
        final data = userFromJson(hasil.body);
        return data;
      } else {
// print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
// print("error catch $e");
      return null;
    }
  }

  Future deleteUser(String id) async {
    Map data = {"id": id};
    try {
      http.Response hasil = await http.post(
          Uri.parse("https://localhost/crud/delete.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
// print("error status " + hasil.statusCode.toString());
        return false;
      }
    } catch (e) {
// print("error catch $e");
      return false;
    }
  }

  Future createUser(
      String nama,
      String nim,
      String prodi,
      String agama,
      String jnsKel,
      String alamat,
      String asalSekolah,
      String tahun,
      String tempatLahir,
      DateTime tanggalLahir) async {
    Map data = {
      "nama": nama,
      "nim": nim,
      "prodi": prodi,
      "agama": agama,
      "jns_kel": jnsKel,
      "alamat": alamat,
      "asal_sekolah": asalSekolah,
      "tahun": tahun,
      "tempat_lahir": tempatLahir,
      "tanggal_lahir": tanggalLahir.toString()
    };
    try {
      http.Response hasil = await http.post(
          Uri.parse("https://localhost/crud/create.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
        if (kDebugMode) {
          print("error status ${hasil.statusCode}");
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("error catch $e");
      }
      return false;
    }
  }

  Future editUser(
      String id,
      String nama,
      String nim,
      String prodi,
      String agama,
      String jnsKel,
      String alamat,
      String asalSekolah,
      String tahun,
      String tempatLahir,
      DateTime tanggalLahir) async {
    Map data = {
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
      "tanggal_lahir": tanggalLahir.toString()
    };
    try {
      http.Response hasil = await http.post(
          Uri.parse("https://localhost/crud/update.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
// print("error status " + hasil.statusCode.toString());
        return false;
      }
    } catch (e) {
// print("error catch $e");
      return false;
    }
  }
}
