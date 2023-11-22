class PlayerModel {
  final List<Player> player;

  PlayerModel({required this.player});

  factory PlayerModel.fromJson(List<dynamic> json) {
    List<Player> player = json.map((data) => Player.fromJson(data)).toList();
    return PlayerModel(player: player);
  }
}

class Player {
  String? playerPlace;
  String? playerName;
  int? playerKey;
  String? teamName;
  String? teamKey;
  String? goals;
  String? assists;
  String? penaltyGoals;

  Player.fromJson(Map<String, dynamic> json) {
    playerPlace = json['player_place'];
    playerName = json['player_name'];
    playerKey = json['player_key'];
    teamName = json['team_name'];
    teamKey = json['team_key'];
    goals = json['goals'];
    assists = json['assists'];
    penaltyGoals = json['penalty_goals'];
  }
}
