  import 'package:flutter/material.dart';
  import 'package:fluttertoast/fluttertoast.dart';
  import '../models/model.dart';
  import '../viewmodels/user_vm.dart';
  import 'home.dart';

  // ignore: must_be_immutable
  class EditUserScreen extends StatefulWidget {
    const EditUserScreen({Key? key, required this.user}) : super(key: key);
    final User user;
    @override
  // ignore: no_logic_in_create_state
    State<EditUserScreen> createState() => _EditUserScreenState(user);
  }

  class _EditUserScreenState extends State<EditUserScreen> {
    User? user;
    _EditUserScreenState(this.user);
    late final TextEditingController _textIDController = TextEditingController();
    late final TextEditingController _textNamaController =
        TextEditingController();
    late final TextEditingController _textNimController = TextEditingController();
    late final TextEditingController _textProdiController =
        TextEditingController();
    late final TextEditingController _textAgamaController =
        TextEditingController();
    late final TextEditingController _textJnsKelController =
        TextEditingController();
    late final TextEditingController _textAlamatController =
        TextEditingController();
    late final TextEditingController _textAsalSekolahController =
        TextEditingController();
    late final TextEditingController _textTempatLahirController =
        TextEditingController();
    late final TextEditingController _textTahunController =
        TextEditingController();
    late final TextEditingController _textTanggalLahirController =
        TextEditingController();
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
    @override
    void initState() {
      super.initState();
      _textIDController.text = user!.id;
      _textNamaController.text = user!.nama;
      _textNimController.text = user!.nim;
      _textProdiController.text = user!.prodi;
      _textAgamaController.text = user!.agama;
      _textJnsKelController.text = user!.jnsKel;
      _textAlamatController.text = user!.alamat;
      _textAsalSekolahController.text = user!.asalSekolah;
      _textTempatLahirController.text = user!.tempatLahir;
      _textTahunController.text = user!.tahun;
      _textTanggalLahirController.text = user!.tanggalLahir;
      nama = user!.nama;
      nim = user!.nim;
      prodi = user!.prodi;
      agama = user!.agama;
      jnsKel = user!.jnsKel;
      alamat = user!.alamat;
      asalSekolah = user!.asalSekolah;
      tempatLahir = user!.tempatLahir;
      dropdownvalue = user!.jnsKel;
      tahun = user!.tahun;
      tanggalLahir = user!.tanggalLahir;
    }

    updateUser() async {
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
            .editUser(user!.id, nama, nim, prodi, agama, jnsKel, alamat,
                asalSekolah, tahun, tempatLahir, DateTime.parse(tanggalLahir))
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
        appBar: AppBar(title: const Text("Edit User")),
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
                    controller: _textIDController,
                    enabled: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Nama Lengkap"),
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _textNamaController,
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
                    controller: _textNimController,
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
                    controller: _textProdiController,
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
                    controller: _textAgamaController,
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
                    controller: _textAlamatController,
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
                    controller: _textAsalSekolahController,
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
                    controller: _textTahunController,
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
                    controller: _textTempatLahirController,
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
                    controller: _textTanggalLahirController,
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
                          _textTanggalLahirController.text = picked.toString();
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
                          updateUser();
                        },
                        child: const Text("Update")))
              ],
            ),
          ),
        ),
      );
    }
  }
