class Pengumuman {
  String kodePengumuman;
  String judulPengumuman;
  String isiPengumuman;
  String kodeAdmin;

  Pengumuman(
      {this.kodePengumuman,
        this.judulPengumuman,
        this.isiPengumuman,
        this.kodeAdmin});

  Pengumuman.fromJson(Map<String, dynamic> json) {
    kodePengumuman = json['kode_pengumuman'];
    judulPengumuman = json['judul_pengumuman'];
    isiPengumuman = json['isi_pengumuman'];
    kodeAdmin = json['kode_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode_pengumuman'] = this.kodePengumuman;
    data['judul_pengumuman'] = this.judulPengumuman;
    data['isi_pengumuman'] = this.isiPengumuman;
    data['kode_admin'] = this.kodeAdmin;
    return data;
  }
}