class User {
  int id;
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
  String website;
  String pendidikan_terakhir;
  String pekerjaan;
  String pengalaman_organisasi;
  String hobby;
  String jenis_identitas;
  String username;

  User({
    this.id,
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
    this.website,
    this.pendidikan_terakhir,
    this.pekerjaan,
    this.pengalaman_organisasi,
    this.hobby,
    this.jenis_identitas,
    this.username,
  });

  User.fromJson(Map<String, dynamic> map) {
    print('enter');
    //login = map['login'].toString();
    this.id = map['id'];
    this.nama_lengkap = map['nama_lengkap'];
    this.nama_panggilan = map['name_panggilan'];
    this.tempat_tanggal_lahir = map['tempat_tanggal_lahir'];
    this.jenis_kelamin = map['jenis_kelamin'];
    this.status_perkawinan = map['status_perkawinan'];
    this.alamat = map['alamat'];
    this.kabupaten_kota = map['kabupaten_kota'];
    this.provinsi = map['provinsi'];
    this.no_kontak = map['no_kontak'];
    this.email = map['email'];
    this.website = map['website'];
    this.pendidikan_terakhir = map['pendidikan_terakhir'];
    this.pekerjaan = map['pekerjaan'];
    this.pengalaman_organisasi = map['pengalaman_organisasi'];
    this.hobby = map['hobby'];
    this.jenis_identitas = map['jenis_identitas'];
    this.username = map['username'];

//    this.RoleID = map['RoleID'];
//    this.StatusID = map['StatusID'];
//    this.Company_id = map['Company_id'];
//
//    this.GroupDataTypeID = map['GroupDataTypeID'];

    print('enter2');


  }
}