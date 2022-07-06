import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../viewmodels/user_vm.dart';
import 'home.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({Key? key}) : super(key: key);
  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  TextEditingController dateinput = TextEditingController();
  var items = [
    'Laki - Laki',
    'Perempuan',
  ];
  String dropdownvalue = 'Laki - Laki';
  late String nama = "",
      nim = "",
      prodi = "",
      agama = "",
      jnsKel = "",
      alamat = "",
      asalSekolah = "",
      tempatLahir = "",
      tahun = "",
      tanggalLahir = "";
  register() async {
    if ((nama == "") ||
        (nim == "") ||
        (prodi == "") ||
        (agama == "") ||
        (jnsKel == "") ||
        (alamat == "") ||
        (asalSekolah == "") ||
        (tahun == "") ||
        (tempatLahir == "") ||
        (tanggalLahir == "")) {
      Fluttertoast.showToast(
          msg: "Semua Field harus diisi dengan data yang benar!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.yellow[300],
          textColor: Colors.red);
    } else {
      showLoaderDialog(context);
      UserViewModel()
          .createUser(nama, nim, prodi, agama, jnsKel, alamat, asalSekolah,
              tahun, tempatLahir, DateTime.parse(tanggalLahir))
          .then((value) {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Mahasiswa baru")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Nama Lengkap"),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (e) => nama = e,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Nim"),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (e) => nim = e,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Prodi"),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (e) => prodi = e,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Agama"),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (e) => agama = e,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Jenis Kelamin"),
              SizedBox(
                height: 40,
                child: DropdownButton(
                  isExpanded: true,
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? e) {
                    setState(() {
                      dropdownvalue = e!;
                      jnsKel = e;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Alamat"),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (e) => alamat = e,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Asal Sekolah"),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (e) => asalSekolah = e,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Tahun"),
              SizedBox(
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (e) => tahun = e,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Tempat Lahir"),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (e) => tempatLahir = e,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Tanggal Lahir"),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: dateinput,
                  readOnly: true,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2050));
                    if (picked != null) {
                      setState(() {
                        tanggalLahir = picked.toString();
                        dateinput.text = picked.toString();
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        register();
                      },
                      child: const Text("Simpan")))
            ],
          ),
        ),
      ),
    );
  }
}
