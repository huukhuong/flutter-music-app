class SongModel {
  String? title;
  String? artist;
  String? fileName;

  SongModel({this.title, this.artist, this.fileName});

  SongModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    artist = json['artist'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['artist'] = artist;
    data['fileName'] = fileName;
    return data;
  }
}
