class TopScorerModel {
  final List<TopScorer> player;

  TopScorerModel({required this.player});

  factory TopScorerModel.fromJson(List<dynamic> json) {
    List<TopScorer> player = json.map((data) => TopScorer.fromJson(data)).toList();
    return TopScorerModel(player: player);
  }
}

class TopScorer {
  String? playerPlace;
  String? playerName;
  String? playerImage;
  int? playerKey;
  String? teamName;
  String? teamKey;
  String? goals;
  String? assists;
  String? penaltyGoals;

  TopScorer.fromJson(Map<String, dynamic> json) {
    playerPlace = json['player_place'];
    playerName = json['player_name'];
    playerKey = json['player_key'];
    teamName = json['team_name'];
    teamKey = json['team_key'];
    goals = json['goals'];
    assists = json['assists'];
    penaltyGoals = json['penalty_goals'];
    playerImage=json['player_image'];
  }
}
