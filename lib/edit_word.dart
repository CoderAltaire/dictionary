import 'package:dictionary/bloc/get_word/get_word_bloc.dart';
import 'package:dictionary/models/words_model/word.dart';
import 'package:dictionary/services/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_tts/flutter_tts.dart';

class EditWordScreen extends StatefulWidget {
  final Words word;
  const EditWordScreen({super.key, required this.word});

  @override
  State<EditWordScreen> createState() => _EditWordScreenState();
}

class _EditWordScreenState extends State<EditWordScreen> {
  TextEditingController enController = TextEditingController();
  TextEditingController uzController = TextEditingController();
  FlutterTts fTts = FlutterTts();
  void textToSpeech(String text) async {
    await fTts.setLanguage("en-US");
    await fTts.setVolume(1);
    await fTts.setSpeechRate(0.3);
    await fTts.setPitch(1);
    await fTts.speak(text);
  }

  @override 
  void initState() {
    super.initState();
    enController.text = widget.word.nameEn ?? "";
    uzController.text = widget.word.nameUz ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 7, 67, 116),
        title: Center(
          child: Text("Translator",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 7, 67, 116),
          onPressed: () async {
            await IsarService().remove(widget.word.id).then((value) {
              BlocProvider.of<GetWordBloc>(context).add(GetAllEvent());
              Navigator.pop(context);
            });
          },
          child: Image.asset(
            "assets/images/delete.png",
            color: Colors.white,
            scale: 2.5,
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Edit word",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 25)),
          const SizedBox(
            height: 50,
          ),
          addWordField(),
          const SizedBox(
            height: 30,
          ),
          Text(
            "English Speech",
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                flex: 10,
                child: Text(""),
              ),
              Expanded(
                flex: 8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.white,
                    disabledForegroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () async {
                    if (enController.text != "") {
                      textToSpeech(enController.text);
                    }
                  },
                  child: Ink(
                    height: 100,
                    child: Image.asset("assets/images/vol.jpg"),
                  ),
                ),
              ),
              const Expanded(
                flex: 10,
                child: Text(""),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 7, 67, 116),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // <-- Radius
                    ),
                  ),
                  onPressed: () async {
                    await IsarService().remove(widget.word.id).then((value) {
                      Words newWord = Words()
                        ..id = widget.word.id
                        ..nameEn = enController.text
                        ..nameUz = uzController.text;

                      IsarService().save(newWord).then((value) {
                        BlocProvider.of<GetWordBloc>(context)
                            .add(GetAllEvent());
                        Navigator.pop(context);
                      });
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget addWordField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.teal,
              controller: enController,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                      width: 1, color: Color.fromARGB(255, 7, 67, 116)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 7, 67, 116), width: 1.0),
                ),
                hintText: 'Enter text',
                labelText: 'En',
                hintStyle: TextStyle(fontSize: 12),
                prefixText: '',
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.teal,
              controller: uzController,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                      width: 1, color: Color.fromARGB(255, 7, 67, 116)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 7, 67, 116), width: 1.0),
                ),
                hintText: 'Matn kiriting',
                labelText: 'Uz',
                hintStyle: TextStyle(fontSize: 12),
                prefixText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
