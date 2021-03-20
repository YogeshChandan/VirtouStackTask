
import 'dart:convert';

class DogsPathModel{

  var id,title;
  var sub_paths;

  DogsPathModel({
    this.id,
    this.title,
    this.sub_paths
  });

  DogsPathModel.fromJson(Map<String, dynamic> jsonObj) {
    id = jsonObj['id'];
    if(jsonObj.containsKey('title')){
      title = jsonObj['title'];
    }else{
      title = "";
    }
    if(jsonObj.containsKey('sub_paths')){
      //sub_paths = json['sub_paths'];
      List sPaths = jsonObj['sub_paths'] as List;
      sub_paths = sPaths.map((i) => DogsSubPathModel.fromJson(i)).toList();
    }
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sub_paths'] = this.sub_paths;
    return data;
  }*/
}

class DogsSubPathModel{

  var id,title,image;

  DogsSubPathModel({
    this.id,
    this.title,
    this.image
  });

  DogsSubPathModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}