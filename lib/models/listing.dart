import 'dart:convert';

class Listing {
  late String name;
  int? rank;
  late String info;
  String? img;

  Listing({required this.name, this.rank, required this.info, this.img});

  Listing.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rank = json['rank'];
    info = json['info'];
    img = null;
  }
}

bool isReplyValidListingFormat(String reply) {
  try {
    var obj = jsonDecode(reply);
    // if (obj["list"] == null) return false;
    return true;
  } catch (_) {
    return false;
  }
}

List<Listing> fromReplyToListingList(String reply) {
  Map<String, dynamic> raw = jsonDecode(reply);
  return (raw['list'] as List).map((listingRaw) {
    return Listing(
        name: listingRaw['name'],
        info: listingRaw['info'],
        rank: listingRaw['rank']);
  }).toList();
}
