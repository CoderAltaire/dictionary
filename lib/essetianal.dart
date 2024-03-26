import 'package:dictionary/bloc/vocabluary/getvocabluary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/words_model/word.dart';
import 'services/isar_service.dart';

class EssetianalPage extends StatefulWidget {
  const EssetianalPage({super.key});
  @override
  State<EssetianalPage> createState() => _EssetianalPageState();
}

class _EssetianalPageState extends State<EssetianalPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetvocabluaryBloc>(context).add(FirebaseDataEvent());
  }

  List<String> book = [
    "assets/images/1book.jpg",
    "assets/images/2book.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<GetvocabluaryBloc, GetvocabluaryState>(
          builder: (context, state) {
            if (state is SuccesFirebaseData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...state.data.map((x) {
                      return ExpansionTile(
                        title: Row(
                          children: [
                            Container(
                              width: 35,
                              height: 45,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: -2,
                                      offset: Offset(2, 2))
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/images/${state.data.indexOf(x) + 1}book.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Essetianal Book ${state.data.indexOf(x) + 1}',
                              style: GoogleFonts.comfortaa(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        children: x.map((e) {
                          return ExpansionTile(
                            title: Text(
                              'Unit ${x.indexOf(e) + 1}',
                              style: GoogleFonts.comfortaa(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            children: [
                              ListView.builder(
                                itemCount: e.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              e[index].eng,
                                              style: GoogleFonts.comfortaa(
                                                  color: Colors.blue.shade700,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              e[index].uz,
                                              style: GoogleFonts.comfortaa(
                                                  color: Colors.red.shade700,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                              IconButton(
                                  onPressed: () async {
                                    for (var element in e) {
                                      Words wd = Words(
                                          nameEn: element.eng,
                                          nameUz: element.uz);

                                      IsarService().save(wd);
                                    }
                                  },
                                  icon: const Icon(Icons.save_alt_outlined))
                            ],
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              );
            } else if (state is ProccesFirebaseData) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 7, 67, 116),
                    ),
                  ),
                ],
              );
            } else if (state is NoConnectionFirebaseData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text('Please check the connection'),
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
                          onPressed: () {
                            BlocProvider.of<GetvocabluaryBloc>(context)
                                .add(FirebaseDataEvent());
                          },
                          child: Ink(
                            height: 100,
                            child: Image.asset("assets/images/cloud.jpg"),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 10,
                        child: Text(""),
                      ),
                    ],
                  ),
                  const Center(
                    child: Text('Press'),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  const Text('No Data ...'),
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
                          onPressed: () {
                            BlocProvider.of<GetvocabluaryBloc>(context)
                                .add(FirebaseDataEvent());
                          },
                          child: Ink(
                            height: 100,
                            child: Image.asset("assets/images/cloud.jpg"),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 10,
                        child: Text(""),
                      ),
                    ],
                  ),
                  const Center(
                    child: Text('Press'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
