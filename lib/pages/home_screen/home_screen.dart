import 'package:dictionary_eng_viet/data_sources/dictionary_databases/dictionary_database.dart';
import 'package:dictionary_eng_viet/data_sources/dictionary_databases/word_model.dart';
import 'package:dictionary_eng_viet/pages/home_screen/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<List<WordModel>> wordList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Từ Điển Anh - Việt"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Card(
                    elevation: 30,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Tìm từ..."),
                        onChanged: (input) {
                          setState(() {
                            wordList = DictionaryDatabase()
                                .searchEnglishResults(input);
                            print(wordList.toString());
                          });
                        }),
                  ),
                ),
                Expanded(
                    child: Center(
                  child: Text("Chào bạn"),
                ))
              ],
            ),
            if (_searchController.text != "")
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 70, right: 50, left: 50),
                  //width: 300,
                  child: FutureBuilder<List<WordModel>>(
                      future: wordList,
                      builder: (context, snapshot) {
                        List<WordModel> list = snapshot.data;
                        print(list);
                        return Card(
                          elevation: 20,
                          shadowColor: Colors.black,
                          child: FutureBuilder<List<WordModel>>(
                              future: wordList,
                              builder: (context, snapshot) {
                                if ((snapshot.hasError) || (!snapshot.hasData))
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                List<WordModel> list = snapshot.data;
                                print(list);
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: list.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                          child: Column(
                                            children: [
                                              Text(
                                                list[index].word,
                                                textAlign: TextAlign.center,
                                              ),
                                              Divider()
                                            ],
                                          ),
                                          onTap: () {
                                            var route = MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen(
                                                        word: list[index]));
                                            Navigator.push(context, route);
                                          });
                                    });
                              }),
                        );
                      }),
                ),
              )
          ],
        ),
      ),
    );
  }
}
