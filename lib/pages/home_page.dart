import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../services/htttp_services.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var post = Post(name: 'test',salary: 123,age: 23);
    //  _apiPostCreate(post);
    //_apiPostList();
    // _apiPostList2();
    // _apiPostUpdate(post);
    _apiPostDelete(post);
  }


  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),

    });
  }
  void _apiPostList2(){
    Network.GET(Network.API_LIST1, Network.paramsEmpty()).then((response) =>
    {
      _showResponse(response!),
    });
  }
  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }

  void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) =>
    {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE + post.name.toString(),Network.paramsUpdate(post)).then((response) =>
    {
      _showResponse(response!),
    });
  }


  void _apiPostDelete(Post post){
    Network.DEL(Network.API_DELETE + post.name.toString(),Network.paramsEmpty()).then((response) =>
    {
      _showResponse(response!),
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No Data"),
      ),
    );
  }
}