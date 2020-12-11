import 'package:country_house1/Screens/Country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  List countries = [];
  getCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data) {
      setState(() {
        countries = data;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getCountries();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("All Countries"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: countries.length > 0
              ? ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Country(countries[index]),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 12,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            countries[index]['name'],
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}

// ListView(
//             //   children: <Widget>[
//             //     GestureDetector(
//             //       onTap: () {
//             //         Navigator.of(context).push(
//             //           MaterialPageRoute(
//             //             builder: (context) => Country("Pakistan"),
//             //           ),
//             //         );
//             //       },
//             //       child: Card(
//             //         elevation: 12,
//             //         child: Padding(
//             //           padding: const EdgeInsets.symmetric(
//             //               vertical: 10, horizontal: 10),
//             //           child: Text(
//             //             "Pakistan ",
//             //             style: TextStyle(fontSize: 18),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //     GestureDetector(
//             //       onTap: () {
//             //         Navigator.of(context).push(
//             //           MaterialPageRoute(
//             //             builder: (context) => Country("china"),
//             //           ),
//             //         );
//             //       },
//             //       child: Card(
//             //         elevation: 12,
//             //         child: Padding(
//             //           padding: const EdgeInsets.symmetric(
//             //               vertical: 10, horizontal: 10),
//             //           child: Text(
//             //             "China ",
//             //             style: TextStyle(fontSize: 18),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //   ],
//             // )
//             ));
//   }
// }
