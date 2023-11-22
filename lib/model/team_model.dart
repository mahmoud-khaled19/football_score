class TeamModel {
  final List<Venue> venue;
  final List<Team> team;
  final List<Player> player;

  TeamModel({
    required this.venue,
    required this.team,
    required this.player,
  });

  factory TeamModel.fromJson(List<dynamic> json) {
    List<Venue> venue = json.map((data) => Venue.fromJson(data)).toList();
    List<Team> team = json.map((data) => Team.fromJson(data)).toList();
    List<Player> player = json.map((data) => Player.fromJson(data)).toList();
    return TeamModel(venue: venue, team: team, player: player);
  }
}

class Venue {
  final String stadiumName;
  final String stadiumAddress;
  final String stadiumCity;
  final String stadiumCapacity;

  Venue({
    required this.stadiumName,
    required this.stadiumAddress,
    required this.stadiumCity,
    required this.stadiumCapacity,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      stadiumName: json['venue_name'],
      stadiumAddress: json['venue_address'],
      stadiumCity: json['venue_city'],
      stadiumCapacity: json['venue_capacity'],
    );
  }
}

class Team {
  final String teamKey;
  final String teamName;
  final String teamCountry;
  final String teamFounded;
  final String teamBadge;
  final Venue venue;
  final List<Player> players;
  final List<Map<String, dynamic>>
      coaches; // If you have more details about coaches, you can create a Coach class

  Team({
    required this.teamKey,
    required this.teamName,
    required this.teamCountry,
    required this.teamFounded,
    required this.teamBadge,
    required this.venue,
    required this.players,
    required this.coaches,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamKey: json['team_key'],
      teamName: json['team_name'],
      teamCountry: json['team_country'],
      teamFounded: json['team_founded'],
      teamBadge: json['team_badge'],
      venue: Venue.fromJson(json['venue']),
      players: (json['players'] as List<dynamic>)
          .map((playerJson) => Player.fromJson(playerJson))
          .toList(),
      coaches: json['coaches'],
    );
  }
}

class Player {
  final int playerKey;
  final String playerId;
  final String playerImage;
  final String playerName;
  final String playerNumber;
  final String playerCountry;
  final String playerType;
  final String playerAge;

  // Add other player properties here

  Player({
    required this.playerKey,
    required this.playerId,
    required this.playerImage,
    required this.playerName,
    required this.playerNumber,
    required this.playerCountry,
    required this.playerType,
    required this.playerAge,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerKey: json['player_key'],
      playerId: json['player_id'],
      playerImage: json['player_image'],
      playerName: json['player_name'],
      playerNumber: json['player_number'],
      playerCountry: json['player_country'],
      playerType: json['player_type'],
      playerAge: json['player_age'],
    );
  }
}
