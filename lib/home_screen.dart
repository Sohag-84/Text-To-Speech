// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'constant/language_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String from = 'en';
  String selectedValue = 'English';
  TextEditingController _controller =
      TextEditingController(text: 'How are you?');
  final formKey = GlobalKey<FormState>();
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 104, 254),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 66, 162),
        title: Text(
          "Text To Speech",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Select Language"),
                    SizedBox(width: 30),
                    DropdownButton(
                      value: selectedValue,
                      focusColor: Colors.transparent,
                      items: languages
                          .map(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              onTap: () {
                                if (lang == languages[0]) {
                                  from = languagesCode[0];
                                } else if (lang == languages[1]) {
                                  from = languagesCode[1];
                                } else if (lang == languages[2]) {
                                  from = languagesCode[2];
                                } else if (lang == languages[3]) {
                                  from = languagesCode[3];
                                } else if (lang == languages[4]) {
                                  from = languagesCode[4];
                                } else if (lang == languages[5]) {
                                  from = languagesCode[5];
                                } else if (lang == languages[6]) {
                                  from = languagesCode[6];
                                } else if (lang == languages[7]) {
                                  from = languagesCode[7];
                                } else if (lang == languages[8]) {
                                  from = languagesCode[8];
                                }
                                setState(() {});
                              },
                              child: Text(lang),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        selectedValue = value!;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: _controller,
                    maxLines: null,
                    minLines: null,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      errorStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      flutterTts.setLanguage(from);
                      flutterTts.setSpeechRate(0.4);
                      flutterTts.speak(_controller.text);
                    },
                    child: Text("Speak"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      flutterTts.pause();
                    },
                    child: Text("Pause"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
