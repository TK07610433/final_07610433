

class CountryItem{
  final int id;
  final String team;
  final String group;
  final String flagImage;
  final int voteCount;

  CountryItem({
    required this.id,
    required this.team,
    required this.group,
    required this.flagImage,
    required this.voteCount,
  });
  factory CountryItem.fromMap(Map<String, dynamic> json) {
    return CountryItem(
        id: json['id'],
        team: json['team'],
        group: json['group'],
        flagImage: json['flagImage'],
        voteCount: json['voteCount']);
  }
  CountryItem.fromJson2(Map<String, dynamic> json)
    : id=json['id'],
    team=json['team'],
    group=json['group'],
    flagImage=json['flagImage'],
        voteCount=json['voteCount'];

}