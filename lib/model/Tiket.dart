class TiketList{
  final String nama, email;
  TiketList(this.nama, this.email);
  TiketList.fromJson(Map<String, dynamic> json) :
        nama = json['nama'],
        email = json['email'];
}