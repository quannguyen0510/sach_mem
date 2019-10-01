class Book {
  String cover;
  String id;
  String imgName;
  String name;
  String totalWords;

  Book({this.cover, this.id, this.imgName, this.name, this.totalWords});

  Book.fromMap(Map map, String id) {
    id = id ?? '';
    cover = map['cover'] ?? '';
    imgName = map['imgName'] ?? '';
    name = map['name'] ?? '';
    totalWords = map['totelWords'] ?? '';
  }

  toJson() {
    return {
      id: 'id',
      cover: 'cover',
      imgName: 'imgName',
      name: 'name',
      totalWords: 'totalWords'
    };
  }
}
