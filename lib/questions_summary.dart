import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({required this.summaryData, super.key}) {}

  final fontSize40 = TextStyle(fontSize: 40);
  final List<Map<String, Object>> summaryData;
  final colorErrado = const Color.fromARGB(175, 240, 7, 182);
  final colorCerto = Color.fromARGB(255, 1, 255, 242);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 40, right: 40, bottom: 40, top: 0),
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: data['user_answer'] == data['correct_answer']
                        ? colorCerto
                        : colorErrado, // Cor de fundo
                    shape: BoxShape.rectangle, // Forma retangular padrão
                    borderRadius: BorderRadius.circular(
                        100), // Bordas arredondadas para criar o formato redondo
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data['question'] as String,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data['user_answer'] as String,
                          style: TextStyle(fontSize: 40, color: Colors.white54),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data['correct_answer'] as String,
                          style: TextStyle(fontSize: 40, color: colorCerto),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
