import 'package:flutter/material.dart';

void main() {
  runApp(const ExamScheduleApp());
}

class ExamScheduleApp extends StatelessWidget {
  const ExamScheduleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exam Schedule",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const ExamScheduleScreen(),
    );
  }
}


class ExamScheduleScreen extends StatelessWidget {
  const ExamScheduleScreen({Key? key}) : super(key: key);


  final List<Map<String, String>> exams = const [
    {
      "subject": "Mathematics",
      "date": "05-Sep-2025",
      "time": "10:00 AM - 1:00 PM",
      "venue": "Hall A"
    },
    {
      "subject": "Physics",
      "date": "07-Sep-2025",
      "time": "2:00 PM - 5:00 PM",
      "venue": "Hall B"
    },
    {
      "subject": "Chemistry",
      "date": "09-Sep-2025",
      "time": "10:00 AM - 1:00 PM",
      "venue": "Hall A"
    },
    {
      "subject": "Computer Science",
      "date": "11-Sep-2025",
      "time": "2:00 PM - 5:00 PM",
      "venue": "Lab 3"
    },
    {
      "subject": "English",
      "date": "13-Sep-2025",
      "time": "10:00 AM - 12:00 PM",
      "venue": "Hall C"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam Schedule"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Tapped on ${exam['subject']}")),
              );
            },
            onDoubleTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Exam Details"),
                  content: Text(
                      "${exam['subject']} exam is on ${exam['date']} at ${exam['time']} in ${exam['venue']}."),
                  actions: [
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Long pressed on ${exam['subject']}")),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo.shade100,
                  child: const Icon(Icons.menu_book, color: Colors.indigo),
                ),
                title: Text(
                  exam["subject"]!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text("📅 Date: ${exam["date"]}"),
                    Text("⏰ Time: ${exam["time"]}"),
                    Text("📍 Venue: ${exam["venue"]}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

