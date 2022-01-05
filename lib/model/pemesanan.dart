class Pemesanan{
  int? id_pemesanan;
  String id_movie;
  String kursi;
  String email;

  Pemesanan(this.id_movie, this.kursi, this.email, {this.id_pemesanan});

  Pemesanan.fromJson(Map<String, dynamic> json) :
        id_pemesanan = json['id'],
        id_movie = json['id_movie'],
        kursi = json['kursi'],
        email = json['email'];
}