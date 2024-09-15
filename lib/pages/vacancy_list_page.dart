import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grad_project_1/componants/top_bar.dart';
import 'package:grad_project_1/consts.dart';
import '../componants/job_card.dart';
import 'package:http/http.dart' as http;


class VacancyList extends StatefulWidget {
  const VacancyList({super.key});

  @override
  State<VacancyList> createState() => _VacancyListState();
}

class _VacancyListState extends State<VacancyList> {


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse("https://www.unhcrjo.org/jobs/api"));
      if (response.statusCode == 200) {
        setState(() {
          vacancies = json.decode(response.body);
        });
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      loadFailed = true;
      errorMsg = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          SizedBox(width: width, height: height!* 0.025,),
          TopBar(title:'Jobs', backButton: false,),
          SizedBox(height: 10),
          if(loadFailed)
            Center(
              child: Container(
                child: Center(
                  child: Text(errorMsg, style: TextStyle(color: textcolor, fontSize: 25, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          if (vacancies.isEmpty)
            Flexible(
              child: Container(
                child: Center(child: CircularProgressIndicator())
              ),
            ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: vacancies.length,
              itemBuilder: (BuildContext context, int i) {
                return JobCard(
                index: i,
                title: vacancies[i]['title'],
                company: vacancies[i]['company'],
                datePosted: vacancies[i]['date_posted'],
                description: vacancies[i]['description'],
                imageURL: vacancies[i]['image_url'],
              );
            }),
          )
        ],
      ),
    );
  }
}
