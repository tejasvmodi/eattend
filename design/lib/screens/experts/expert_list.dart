import 'package:flutter/material.dart';

class ExpertList extends StatelessWidget {
  final List<SubjectAttendance> subjects = [
    SubjectAttendance('Math', 80),
    SubjectAttendance('Science', 90),
    SubjectAttendance('History', 70),];
   ExpertList({super.key});

  @override
  Widget build(BuildContext context) {
    return listView();
  }

  Widget listView() {
    
    return Scaffold(
     
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return ListTile(
            title: Text(subject.name,style: TextStyle(fontSize: 20),),
            trailing: Text('${subject.attendance}%',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
          );
        },
      ),
    );
  }
}

class SubjectAttendance {
  final String name;
  final int attendance;

  SubjectAttendance(this.name, this.attendance);
}

  
