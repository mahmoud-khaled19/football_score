// class TeamModel {
//   final List<Venue> venue;
//   final List<Team> team;
//   final List<Player> player;
//
//   TeamModel({
//     required this.venue,
//     required this.team,
//     required this.player,
//   });
//
//   factory TeamModel.fromJson(List<dynamic> json) {
//     List<Venue> venue = json.map((data) => Venue.fromJson(data)).toList();
//     List<Team> team = json.map((data) => Team.fromJson(data)).toList();
//     List<Player> player = json.map((data) => Player.fromJson(data)).toList();
//     return TeamModel(venue: venue, team: team, player: player);
//   }
// }
//
// class Venue {
//   String? stadiumName;
//   String? stadiumAddress;
//   String? stadiumCity;
//   String? stadiumCapacity;
//
//   Venue.fromJson(Map<String, dynamic> json) {
//     stadiumName = json['venue_name'];
//     stadiumAddress = json['venue_address'];
//     stadiumCity = json['venue_city'];
//     stadiumCapacity = json['venue_capacity'];
//   }
// }
//
// class Team {
//   String? teamKey;
//   String? teamName;
//   String? teamCountry;
//   String? teamFounded;
//   String? teamBadge;
//   Venue? venue;
//
//   Team.fromJson(Map<String, dynamic> json) {
//     teamKey = json['team_key'];
//     teamName = json['team_name'];
//     teamCountry = json['team_country'];
//     teamFounded = json['team_founded'];
//     teamBadge = json['team_badge'];
//     venue = Venue.fromJson(json['venue']);
//   }
// }
//
// class Player {
//   int? playerKey;
//   String? playerId;
//   String? playerImage;
//   String? playerName;
//   String? playerNumber;
//   String? playerCountry;
//   String? playerType;
//   String? playerAge;
//
//   Player.fromJson(Map<String, dynamic> json) {
//     playerKey = json['player_key'];
//     playerId = json['player_id'];
//     playerImage = json['player_image'];
//     playerName = json['player_name'];
//     playerNumber = json['player_number'];
//     playerCountry = json['player_country'];
//     playerType = json['player_type'];
//     playerAge = json['player_age'];
//   }
// }
