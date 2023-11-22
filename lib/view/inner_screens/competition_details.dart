import 'package:flutter/material.dart';
import 'package:football_app/app_constance/values_manager.dart';
import 'package:football_app/view/inner_screens/teams_positions.dart';
import 'package:football_app/view/inner_screens/top_scorer_screen.dart';

class CompetitionDetails extends StatefulWidget {
  const CompetitionDetails({
    super.key,
    required this.leagueId,
    required this.leagueName,
    required this.leagueSeason,
  });

  final String leagueId;
  final String leagueName;
  final String leagueSeason;

  @override
  State<CompetitionDetails> createState() => _CompetitionDetailsState();
}

class _CompetitionDetailsState extends State<CompetitionDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController controller = TabController(length: 2, vsync: this);

    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.leagueName} ${widget.leagueSeason}'),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSize.s10),
          child: Column(
            children: [
              SizedBox(
                height: AppSize.s10,
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: AppSize.s4,
                indicatorColor: Theme.of(context).primaryColor,
                controller: controller,
                tabs: const [
                  Text('Order'),
                  Text('TOP SCORER'),
                ],
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    TeamsPosition(
                      leagueId: widget.leagueId,
                    ),
                    TopScorerScreen(
                      leagueId: widget.leagueId,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
