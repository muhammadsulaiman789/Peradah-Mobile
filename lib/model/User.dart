class User {
  int nomor_anggota;
  String nik;
  String nama_lengkap;
  String nama_panggilan;
  String tempat_tanggal_lahir;
  String jenis_kelamin;
  String status_perkawinan;
  String alamat;
  String kabupaten_kota;
  String provinsi;
  String no_kontak;
  String email;
  String keanggotaan;
  String komisariat;
  String jabatan;
  String pendidikan_terakhir;
  String pekerjaan;
  String hobby;
  String foto;
  String username;

  User({
    this.nomor_anggota,
    this.nik,
    this.nama_lengkap,
    this.nama_panggilan,
    this.tempat_tanggal_lahir,
    this.jenis_kelamin,
    this.status_perkawinan,
    this.alamat,
    this.kabupaten_kota,
    this.provinsi,
    this.no_kontak,
    this.email,
    this.keanggotaan,
    this.komisariat,
    this.jabatan,
    this.pendidikan_terakhir,
    this.pekerjaan,
    this.hobby,
    this.foto,
    this.username,
  });

  User.fromJson(Map<String, dynamic> map) {
    print('enter');
    //login = map['login'].toString();
    this.nomor_anggota = map['nomor_anggota'];
    this.nik = map['nik'];
    this.nama_lengkap = map['nama_lengkap'];
    this.nama_panggilan = map['name_panggilan'];
    this.tempat_tanggal_lahir = map['tempat_tgl_lahir'];
    this.jenis_kelamin = map['jenis_kelamin'];
    this.status_perkawinan = map['status_perkawinan'];
    this.alamat = map['alamat'];
    this.kabupaten_kota = map['kabupaten_kota'];
    this.provinsi = map['provinsi'];
    this.no_kontak = map['no_kontak'];
    this.email = map['email'];
    this.keanggotaan = map['keanggotaan'];
    this.komisariat = map['nama_keanggotaan'];
    this.jabatan = map['jabatan'];
    this.pendidikan_terakhir = map['pendidikan_terakhir'];
    this.pekerjaan = map['pekerjaan'];
    this.hobby = map['hobby'];
    this.foto = map['foto'];
    this.username = map['username'];

//    this.RoleID = map['RoleID'];
//    this.StatusID = map['StatusID'];
//    this.Company_id = map['Company_id'];
//
//    this.GroupDataTypeID = map['GroupDataTypeID'];

    print('enter2');


  }
}