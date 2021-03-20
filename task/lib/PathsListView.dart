

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task/ModelClass.dart';
import 'package:http/http.dart' as http;

class PathsListView extends StatelessWidget{

  //final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DogsPathModel>>(
      future: _fetchDogsPathList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DogsPathModel> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<DogsPathModel>> _fetchDogsPathList() async {

    final jobsListAPIUrl = 'http://5d55541936ad770014ccdf2d.mockapi.io/api/v1/paths';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((paths) => new DogsPathModel.fromJson(paths)).toList();
    } else {
      throw Exception('Failed to load paths from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("title_data____${data[index].title}");
          return data[index].title.toString().isNotEmpty?_tile(data[index].id, data[index].title, data[index].sub_paths):Container();

        });
  }

  Widget _tile(id, title, List<DogsSubPathModel> sub_paths) {
    CarouselController _controller = CarouselController();
    return Container(
      color: Colors.grey[700],
      child: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(id+" "+title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                )),
            Text(sub_paths!=null?sub_paths.length.toString()+" sub paths":"",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
            CarouselSlider(
              options: CarouselOptions(height: 200.0),
              carouselController: _controller,
              items: sub_paths!=null?sub_paths.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 4,right: 1),
                        decoration: BoxDecoration(
                            color: Colors.grey[700]
                        ),
                        child: FadeInImage.assetNetwork(image: i.image.toString().trim(), placeholder: 'asset/imageNotAvailable.png',
                            fit: BoxFit.fill),
                      /*Column(
                          children: [

                            Row(
                              children: [
                                RaisedButton(
                                  onPressed: () => _controller.previousPage(),
                                  child: Text("${i.title} ->"),
                                ),
                                Text("${"${i.title}->"}"),
                                RaisedButton(
                                  onPressed: () => _controller.nextPage(),
                                  child: Text("${"${i.title}->"}"),
                                )
                              ],
                            )
                          ],
                        )*/

                        //Text('text ${i.image}', style: TextStyle(fontSize: 16.0),)
                    );
                  },
                );
              }).toList():[],
            ),

            /*...Iterable<int>.generate(sub_paths.length).map(

                  (int pageIndex) => RaisedButton(
                    onPressed: () => _controller.animateToPage(pageIndex),
                    child: Text("$pageIndex"),
                  ),
            ),*/
          ],
        ),
      ),
    );
  }

  /*ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );*/
}