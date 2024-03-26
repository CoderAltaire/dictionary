// ignore_for_file: prefer_final_fields
import 'package:dictionary/models/words_model/word.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/isar_service.dart';

class AddWordsScreen extends StatefulWidget {
  const AddWordsScreen({super.key});

  @override
  State<AddWordsScreen> createState() => _AddWordsScreenState();
}

class _AddWordsScreenState extends State<AddWordsScreen> {
  List<Words> wordsList = [];
  TextEditingController enController = TextEditingController();
  TextEditingController uzController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Translated words',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 23),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: wordsList.length,
              itemBuilder: (context, index) => wordsWidget(
                  wordsList[index].nameEn ?? "",
                  wordsList[index].nameUz ?? "",
                  wordsList.length == index + 1),
            ),
            const SizedBox(
              height: 20,
            ),
            addWordField(),
            Card(
              color: const Color.fromARGB(255, 7, 67, 116),
              child: IconButton(
                onPressed: () async {
                  if (uzController.text != "" && enController.text != "") {
                    Words wd = Words()
                      ..nameEn = enController.text
                      ..nameUz = uzController.text
                      ..isSelected = true;
                    await IsarService().save(wd);
               

                    wordsList.add(wd);
                    enController.text = "";
                    uzController.text = "";
                    _focusNode.requestFocus();
                    setState(() {});
                  }
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
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
              focusNode: _focusNode,
              key: _formKey,
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

  Widget wordsWidget(String en, String uz, bool isBottom) {
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: const BorderSide(),
                  left: const BorderSide(),
                  right: const BorderSide(),
                  bottom: BorderSide(
                    width: isBottom == true ? 1 : 0,
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                child: Text(
                  en,
                  style: GoogleFonts.comfortaa(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: const BorderSide(),
                  right: const BorderSide(),
                  bottom: BorderSide(
                    width: isBottom == true ? 1 : 0,
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                child: Text(
                  uz,
                  style: GoogleFonts.comfortaa(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
