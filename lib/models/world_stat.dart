// To parse this JSON data, do
//
//     final worldStat = worldStatFromJson(jsonString);

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

WorldStat worldStatFromJson(String str) => WorldStat.fromJson(json.decode(str));

String worldStatToJson(WorldStat data) => json.encode(data.toJson());

class WorldStat with ChangeNotifier {
  String totalCases;
  String newCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String activeCases;
  String seriousCritical;
  String totalCasesPer1MPopulation;
  String deathsPer1MPopulation;
  DateTime statisticTakenAt;

  WorldStat({
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.activeCases,
    this.seriousCritical,
    this.totalCasesPer1MPopulation,
    this.deathsPer1MPopulation,
    this.statisticTakenAt,
  });

  factory WorldStat.fromJson(Map<String, dynamic> json) => WorldStat(
    totalCases: json["total_cases"],
    newCases: json["new_cases"],
    totalDeaths: json["total_deaths"],
    newDeaths: json["new_deaths"],
    totalRecovered: json["total_recovered"],
    activeCases: json["active_cases"],
    seriousCritical: json["serious_critical"],
    totalCasesPer1MPopulation: json["total_cases_per_1m_population"],
    deathsPer1MPopulation: json["deaths_per_1m_population"],
    statisticTakenAt: DateTime.parse(json["statistic_taken_at"]),
  );

  Map<String, dynamic> toJson() => {
    "total_cases": totalCases,
    "new_cases": newCases,
    "total_deaths": totalDeaths,
    "new_deaths": newDeaths,
    "total_recovered": totalRecovered,
    "active_cases": activeCases,
    "serious_critical": seriousCritical,
    "total_cases_per_1m_population": totalCasesPer1MPopulation,
    "deaths_per_1m_population": deathsPer1MPopulation,
    "statistic_taken_at": statisticTakenAt.toIso8601String(),
  };

  void updateData() {
    notifyListeners();
  }

}





