class ShortenUrlModel {
  ShortenUrlModel({
      this.code, 
      this.shortLink, 
      this.fullShortLink, 
      this.shortLink2, 
      this.fullShortLink2, 
      this.shortLink3, 
      this.fullShortLink3, 
      this.shareLink, 
      this.fullShareLink, 
      this.originalLink,});

  ShortenUrlModel.fromJson(dynamic json) {
    code = json['code'];
    shortLink = json['short_link'];
    fullShortLink = json['full_short_link'];
    shortLink2 = json['short_link2'];
    fullShortLink2 = json['full_short_link2'];
    shortLink3 = json['short_link3'];
    fullShortLink3 = json['full_short_link3'];
    shareLink = json['share_link'];
    fullShareLink = json['full_share_link'];
    originalLink = json['original_link'];
  }
  String? code;
  String? shortLink;
  String? fullShortLink;
  String? shortLink2;
  String? fullShortLink2;
  String? shortLink3;
  String? fullShortLink3;
  String? shareLink;
  String? fullShareLink;
  String? originalLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['short_link'] = shortLink;
    map['full_short_link'] = fullShortLink;
    map['short_link2'] = shortLink2;
    map['full_short_link2'] = fullShortLink2;
    map['short_link3'] = shortLink3;
    map['full_short_link3'] = fullShortLink3;
    map['share_link'] = shareLink;
    map['full_share_link'] = fullShareLink;
    map['original_link'] = originalLink;
    return map;
  }

}