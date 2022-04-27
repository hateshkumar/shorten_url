class HistoryLocalModel{
  int? id;
  String? shortUrl;
  String? long;
  bool? _isCopied = false;


  bool? get isCopied => _isCopied;

  set isCopied(bool? value) {
    _isCopied = value;
  }

  HistoryLocalModel(this.id,this.shortUrl, this.long);
}