import 'package:flutter/material.dart';
import '../models/model.dart';
import '../viewmodels/user_vm.dart';
import 'create.dart';
import 'edit.dart';
// import 'create.dart';
// import 'edit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List dataUser = [];
  void getDataUser() async {
    UserViewModel().getUsers().then((value) {
      setState(() {
        dataUser = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  Widget userDetail(User data) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  const Text(
                    "Nama :",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    data.nama,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Nim :",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    data.nim,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Prodi :",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    data.prodi,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  hapusUser(String id) {
    UserViewModel().deleteUser(id).then((value) => getDataUser());
  }

  updateUser(User user) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => EditUserScreen(
              user: user,
            )));
  }

  showDetailDialog(User data) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Detail User'),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID : ${data.id}"),
                    Text("Nama : ${data.nama}"),
                    Text("Nim : ${data.nim}"),
                    Text("Prodi : ${data.prodi}"),
                    Text("Agama : ${data.agama}"),
                    Text("Jenis Kelamin : ${data.jnsKel}"),
                    Text("Alamat : ${data.alamat}"),
                    Text("Asal Sekolah : ${data.asalSekolah}"),
                    Text("Tahun : ${data.tahun}"),
                    Text("Tempat Lahir : ${data.tempatLahir}"),
                    Text("Tanggal Lahir : ${data.tanggalLahir}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              hapusUser(data.id);
                              Navigator.of(context).pop();
                            },
                            child: const Text("Hapus")),
                        ElevatedButton(
                            onPressed: () {
                              updateUser(data);
                            },
                            child: const Text("Edit"))
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Utama"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {
                  showDetailDialog(dataUser[i]);
                },
                child: userDetail(dataUser[i]));
          },
          // ignore: unnecessary_null_comparison
          itemCount: dataUser == null ? 0 : dataUser.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CreateUserScreen()))
        },
        heroTag: 'createNew',
        backgroundColor: const Color(0xFF242569),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
