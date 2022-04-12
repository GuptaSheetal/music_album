import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class PlaylistServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<Stream<QuerySnapshot>> getPlaylistData() async {
    return _firebaseFirestore.collection("playlist").snapshots();
  }

  Future<Map> getFirstPlaylist() async {
    QuerySnapshot snapshot = await _firebaseFirestore.collection("playlist").get();
    if(snapshot.docs.length > 0) {
      DocumentSnapshot documentSnapshot = snapshot.docs.first;
      String name = (documentSnapshot.data() as Map)["collectionName"];
      String id = (documentSnapshot.data() as Map)["playlistId"];

      Map<String, dynamic> data = {
        "playlistName": name,
        "playlistId": id
      };
      return data;
    } 
    return {};

  }

  

}