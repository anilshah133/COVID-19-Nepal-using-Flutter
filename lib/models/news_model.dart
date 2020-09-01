class NewsModel{
  String _id;
  String _title;
  String _summary;
  String _date;
  String _image_url;

  NewsModel(this._id, this._title, this._summary, this._date, this._image_url);

  String get image_url => _image_url;

  set image_url(String value) {
    _image_url = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get summary => _summary;

  set summary(String value) {
    _summary = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  @override
  String toString() {
    return 'NewsModel{_id: $_id, _title: $_title, _summary: $_summary, _date: $_date, _image_url: $_image_url}';
  }
}