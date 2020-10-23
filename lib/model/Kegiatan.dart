class Kegiatan {
  String idKegiatan;
  String namaKegiatan;
  String tanggalKegiatan;
  String penyelenggara;
  String keterangan;
  String kodeAdmin;

  Kegiatan(
      {this.idKegiatan,
        this.namaKegiatan,
        this.tanggalKegiatan,
        this.penyelenggara,
        this.keterangan,
        this.kodeAdmin});

  Kegiatan.fromJson(Map<String, dynamic> json) {
    idKegiatan = json['id_kegiatan'];
    namaKegiatan = json['nama_kegiatan'];
    tanggalKegiatan = json['tanggal_kegiatan'];
    penyelenggara = json['penyelenggara'];
    keterangan = json['keterangan'];
    kodeAdmin = json['kode_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_kegiatan'] = this.idKegiatan;
    data['nama_kegiatan'] = this.namaKegiatan;
    data['tanggal_kegiatan'] = this.tanggalKegiatan;
    data['penyelenggara'] = this.penyelenggara;
    data['keterangan'] = this.keterangan;
    data['kode_admin'] = this.kodeAdmin;
    return data;
  }
}