import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample data representing mentors, students, and their assignments
  List<String> mentors = ["Mentor 1", "Mentor 2", "Mentor 3"];
  Map<String, List<String>> mentorAssignments = {
    "Mentor 1": ["Student A", "Student B"],
    "Mentor 2": ["Student C"],
  };
  List<String> unassignedStudents = ["Student X", "Student Y", "Student Z"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Mentors',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Display ListTiles for mentors
            ListView.builder(
              shrinkWrap: true,
              itemCount: mentors.length,
              itemBuilder: (context, mentorIndex) {
                String mentorName = mentors[mentorIndex];
                return ListTile(
                  title: Text(mentorName),
                  // On mentor tile click, navigate to the assigned students
                  onTap: () {
                    _showAssignedStudentsDialog(mentorName);
                  },
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Unassigned Students',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Display ListTiles for unassigned students
            ListView.builder(
              shrinkWrap: true,
              itemCount: unassignedStudents.length,
              itemBuilder: (context, studentIndex) {
                return ListTile(
                  title: Text(unassignedStudents[studentIndex]),
                  // Add other student details or actions if needed
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to show assigned students dialog
  void _showAssignedStudentsDialog(String mentorName) {
    List<String> assignedStudents = mentorAssignments[mentorName] ?? [];

    // Inside _HomePageState class

    void _showAssignedStudentsDialog(String mentorName) {
      List<String> assignedStudents = mentorAssignments[mentorName] ?? [];

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Assigned Students for $mentorName'),
            content: Column(
              children: [
                // Display ListTiles for assigned students
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: assignedStudents.length,
                  itemBuilder: (context, studentIndex) {
                    return ListTile(
                      title: Text(assignedStudents[studentIndex]),
                      // Add other student details or actions if needed
                    );
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }
}
