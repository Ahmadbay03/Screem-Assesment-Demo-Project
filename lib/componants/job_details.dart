import 'package:flutter/material.dart';
import '../consts.dart';

class Details extends StatefulWidget {
  Details({super.key,required this.title, required this.company, required this.description,required this.datePosted, required this.imageURL, required this.jobId, required this.location, required this.longDescription, required this.salary});

  String jobId;
  String title;
  String company;
  String description;
  String datePosted;
  String imageURL;
  String longDescription;
  String salary;
  String location;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,  style: TextStyle(color: textcolor, fontWeight: FontWeight.bold, fontSize: 25),),
          SizedBox(height: 5,),
          Row(
            children: [
              Image.network(widget.imageURL, width: width !* 0.2, height: width !* 0.2,),
              SizedBox(width: 20,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.company, style: TextStyle(color: textcolor, fontSize: 20),),
                    Text(widget.location,  style: TextStyle(color: textcolor.withOpacity(0.7), fontSize: 20),),
                  ],
                ),
              ),
              Spacer(),
              Text(widget.jobId, style: TextStyle(color: textcolor, fontWeight: FontWeight.bold, fontSize: 25),),
            ],
          ),
          Row(
            children: [
              Text(widget.datePosted, style: TextStyle(color: textcolor, fontSize: 15),),
              SizedBox(width: 5,),
              Text('•', style: TextStyle(color: textcolor, fontSize: 25)),
              SizedBox(width: 5,),
              Text(widget.salary, style: TextStyle(color: textcolor)),
            ],
          ),
          SizedBox(height: 5,),
          Text('About the job', style: TextStyle(color: textcolor, fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Text('Description: ', style: TextStyle(color: textcolor, fontSize: 15, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(widget.description, style: TextStyle(color: textcolor, fontSize: 15)),
          ),
          SizedBox(height: 20,),
          Text('Long description: ', style: TextStyle(color: textcolor, fontSize: 15, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(widget.longDescription, style: TextStyle(color: textcolor, fontSize: 15)),
          ),
        ],
      ),
    );
  }
}
