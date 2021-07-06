class Validation {
  String validatePassword(String value) {
    if (value.length < 8) {
      return 'Password Minimal 8 Karakter';
    }
    return null;
  }

  String validatePassword2(String value) {
    if (value.length < 8) {
      return 'Password Minimal 8 Karakter';
    }
    return null;
  }

  String validateConfPassword(String value) {
    if (value.isEmpty) {
      return 'Confirm Password Tidak Boleh Kosong';
    }
    return null;
  }

  String validateUser(String value) {
    if (!value.contains('@')) {
      return 'Email Tidak Valid';
    }
    return null;
  }

  String validateUser2(String value) {
    if (!value.contains('@')) {
      return 'Email Tidak Valid';
    }
    return null;
  }

  String validateNameLengkap(String value) {
    if (value.isEmpty) {
      return 'Nama Lengkap Harus Diisi';
    }
    return null;
  }

  String validateName(String value) {
    if (value.isEmpty) {
      return 'Nama Panggilan Harus Diisi ';
    }
    return null;
  }

  String validateDate(String value) {
    if (value.isEmpty) {
      return 'Tempat Tanggal Lahir Harus Diisi ';
    }
    return null;
  }

  String validateAddress(String value) {
    if (value.isEmpty) {
      return 'Alamat Harus Diisi ';
    }
    return null;
  }

  String validateDPP(String value) {
    if (value.isEmpty) {
      return 'DPP/DPK/Komisariat Harus Diisi ';
    }
    return null;
  }

  String validateKota(String value) {
    if (value.isEmpty) {
      return 'Kabupaten / Kota Harus Diisi ';
    }
    return null;
  }

  String validateProvinsi(String value) {
    if (value.isEmpty) {
      return 'Provinsi Harus Diisi ';
    }
    return null;
  }

  String validateNoHP(String value) {
    if (value.isEmpty) {
      return 'No HP / Telepon Harus Diisi ';
    }
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email Harus Diisi ';
    }
    return null;
  }

  String validatePekerjaan(String value) {
    if (value.isEmpty) {
      return 'Pekerjaan / Jabatan Harus Diisi ';
    }
    return null;
  }

  String validateHobi(String value) {
    if (value.isEmpty) {
      return 'Hobi / Prestasi / Minat Harus Diisi ';
    }
    return null;
  }

  String validateIdentitas(String value) {
    if (value.isEmpty) {
      return 'Jenis & No Identitas Harus Diisi ';
    }
    return null;
  }

}
