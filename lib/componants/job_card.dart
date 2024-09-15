import 'package:flutter/material.dart';
import 'package:grad_project_1/pages/vacancy_details_page.dart';
import '../consts.dart';

class JobCard extends StatefulWidget {
  JobCard({super.key, required this.index , required this.title, required this.company, required this.description,required this.datePosted, required this.imageURL});

  int index;
  String title;
  String company;
  String description;
  String datePosted;
  String imageURL;

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetails(index: widget.index,))); },
          child: Container(
            padding: EdgeInsets.only(top: 10),
            width: width !* 0.95,
            decoration: BoxDecoration(
                color: Colors.lightBlue[300],
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Image.network(widget.imageURL, width: width !* 0.2,),
                  title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, color: textcolor, fontSize: 18),),
                  subtitle: Text(widget.company,  style: TextStyle(color: textcolor, fontSize: 18),),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(widget.description, style: TextStyle(color: textcolor, fontSize: 15),),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text(widget.datePosted, style: TextStyle(color: textcolor.withOpacity(0.7), fontSize: 15),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined, size: 25,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5)
      ],
    );
  }
}
