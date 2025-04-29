import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/tasks.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Flutter: Primeiros Passos',
          style: TextStyle(color: Colors.white),
        ),
        
        leading: Icon(Icons.add_task),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: Color.fromARGB(255, 208, 221, 237),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Tasks('Estudar Flutter', 
                'assets/images/flutter-icon-2048x2048-ufx4idi8.png', 5),
              ),
              Tasks('Estudar Java', 
              'assets/images/imagem-de-destaque-28.png.webp', 2),
              Tasks('Estudar Python', 
              'assets/images/python-programming-language.webp', 1),
              Tasks('Estudar JavaScript', 
              'assets/images/jsimagem.png', 4),
              Tasks('Estudar C#',
                'assets/images/csharpimg.png', 3),
              Tasks('Estudar C++',
                'assets/images/c-adesivo-sticker.png', 2),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
        opacidade = !opacidade;
          });
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(Icons.remove_red_eye, color: Colors.black),
      ),
    );
  }
}
