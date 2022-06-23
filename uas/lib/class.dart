class pegawai {
  String link;
  String ctitle;
  String cpubdate;
  String cdesc;
  String cthumbnail;
  pegawai({
    required this.link,
    required this.ctitle,
    required this.cpubdate,
    required this.cdesc,
    required this.cthumbnail,
  });
  factory pegawai.fromJson(Map<String, dynamic> json) {
    return pegawai(
      link: json['link'],
      ctitle: json['title'],
      cpubdate: json['pubDate'],
      cdesc: json['description'],
      cthumbnail: json['thumbnail'],
    );
  }
}
