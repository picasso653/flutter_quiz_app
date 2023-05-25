import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['user_answer'] == data['correct_answer']
                          ? Colors.greenAccent
                          : Colors.pinkAccent),
                  child: Center(
                    child: Text(
                      (data['question_index'] as int).toString(),
                      style: GoogleFonts.lato(),
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (data['question'] as String),
                        style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text((data['user_answer'] as String), style: GoogleFonts.lato(
                        color: data['user_answer'] == data['correct_answer']
                          ? Colors.greenAccent
                          : Color.fromARGB(255, 54, 54, 54)
                      )),
                      Text((data['correct_answer'] as String), style: GoogleFonts.lato(color: Color.fromARGB(255, 221, 94, 243)))
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
