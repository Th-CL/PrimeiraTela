import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/difficulty.dart';

class Tasks extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Tasks(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int level = 1;

  Color getTaskColor() {
    if (widget.dificuldade > 0) {
      double progress = (level / widget.dificuldade) / 10;
      if (progress >= 1) {
        return Colors.green; // Mastery level 1
      } else if (progress >= 0.75) {
        return Colors.yellow; // Mastery level 2
      } else if (progress >= 0.5) {
        return Colors.orange; // Mastery level 3
      } else {
        return Colors.blue; // Default level
      }
    }
    return Colors.blue;
  }

  void levelUp() {
    setState(() {
      if (level < widget.dificuldade * 10) {
        level++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMaxLevel = level >= widget.dificuldade * 10;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: getTaskColor(),
            ),
            height: 140,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black12,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          widget.foto,
                          height: 100,
                          width: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(widget.dificuldade),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 30,
                        width: 80, // Adjusted width for a rectangular shape
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Set button color to blue
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Rounded corners
                            ),
                          ),
                          onPressed: isMaxLevel ? null : levelUp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_upward_sharp,
                                color: Colors.white,
                                size: 10,
                              ),
                              SizedBox(width: 4), // Add some spacing
                              Text(
                                'UP',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.black,
                        value: widget.dificuldade > 0
                            ? ((level / widget.dificuldade) / 10)
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      isMaxLevel
                          ? 'Maestria no máximo'
                          : 'Nivel: $level',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}