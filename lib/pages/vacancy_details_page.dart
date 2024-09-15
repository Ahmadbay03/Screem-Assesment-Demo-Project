import 'package:flutter/material.dart';
import 'package:grad_project_1/componants/apply_dummy_button.dart';
import 'package:grad_project_1/componants/top_bar.dart';
import '../componants/job_details.dart';
import '../consts.dart';

class JobDetails extends StatefulWidget {
  JobDetails({super.key, required this.index});

  int index;

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          SizedBox(width: width, height: height!* 0.025,),
          TopBar(title: 'Details', backButton: true,),
          Divider(color: Colors.black,),
          Details(
            title: vacancies[widget.index]['title'],
            company: vacancies[widget.index]['company'],
            datePosted: vacancies[widget.index]['date_posted'],
            description: vacancies[widget.index]['description'],
            imageURL: vacancies[widget.index]['image_url'],
            jobId: vacancies[widget.index]['job_id'],
            location: vacancies[widget.index]['location'],
            longDescription:  vacancies[widget.index]['long_description'],
            salary: vacancies[widget.index]['salary'],
          ),
          Divider(color: Colors.black,),
          Spacer(),
          ApplyButton(),
        ],
      ),
    );
  }
}
