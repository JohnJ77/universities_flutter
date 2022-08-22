import 'package:tyba_test/src/models/university_model.dart';
import 'package:tyba_test/src/pages/gridview_universities.dart';
import 'package:tyba_test/src/pages/university_edit.dart';
import 'package:tyba_test/src/providers/universities_provider.dart';
import 'package:flutter/material.dart';

class ListViewUniversities extends StatefulWidget {
  const ListViewUniversities({Key? key}) : super(key: key);

  @override
  State<ListViewUniversities> createState() => _ListViewUniversitiesState();
}

class _ListViewUniversitiesState extends State<ListViewUniversities> {
  List<University> universities = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universities ListView'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder<List<University>>(
            future: menuProvider
                .cargarData(), // a previously-obtained Future<String> or null
            builder: (BuildContext context,
                AsyncSnapshot<List<University>> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = [];
                var i = 0;
                for (University university in snapshot.data!) {
                  i++;
                  children
                      .add(Padding(padding: const EdgeInsets.only(top: 30)));
                  children.add(_cardTipo1(university.name, university.country, i));
                  universities.add(university);
                  if (i > 19) break;
                }
              } else if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              } else {
                children = const <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _cardTipo1(String universityName, String universityCountry, int indexUniversity) {
    return GestureDetector(
      onTap: () => {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UniversityEdit(university: universities[indexUniversity]),
          ),
        )
      },
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
          ),
          ClipRRect(
            child: Image.asset(
              'assets/images/university.webp',
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
          ),
          ListTile(
            title: Text(
              universityName,
              style: TextStyle(fontSize: 30, color: Colors.orange),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              universityCountry,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
          )
        ]),
      ),
    );
  }
}
