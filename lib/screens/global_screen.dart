import 'package:coronastats2020/models/world_stat.dart';
import 'package:coronastats2020/network/global_stats_service.dart';
import 'package:flutter/material.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.white, child: getScreenChildren());
  }

  getScreenChildren() {
    return FutureBuilder<WorldStat>(
      future: getWorldStatData(),
      builder: (context, worldStat) {
        if (worldStat.connectionState == ConnectionState.done) {
          return Column(
            key: PageStorageKey(2),
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: Text(worldStat.data.totalCases,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 10)),
                  ),
                  Center(
                    child: Text("Total Cases",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            letterSpacing: 2)),
                  )
                ],
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(worldStat.data.totalRecovered,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                //letterSpacing:
                              )),
                        ),
                        Center(
                          child: Text("Total Recovered",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                  letterSpacing: 2)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(worldStat.data.totalDeaths,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                //letterSpacing:
                              )),
                        ),
                        Center(
                          child: Text("Total Deaths",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  letterSpacing: 2)),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        } else
          return Center(child: CircularProgressIndicator(key: PageStorageKey("1"),));
      },
    );
  }
}
