class Unit {
  int _id;
  String _unit;
  String _title;
 
  Unit(this._unit, this._title);
 
  Unit.map(dynamic obj) {
    this._id = obj['id'];
    this._unit = obj['unit'];
    this._title = obj['title'];
  }
 
  int get id => _id;
  String get unit => _unit;
  String get title => _title;
 
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['unit'] = _unit;
    map['title'] = _title;
 
    return map;
  }
 
  Unit.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._unit = map['unit'];
    this._title = map['title'];
  }
}