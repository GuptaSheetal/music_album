import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/models/songs.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SongServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<Stream<QuerySnapshot>> getSongData(String playlistId, String playlistName) async {
    return _firebaseFirestore.collection("playlist").doc(playlistId).collection(playlistName).snapshots();
  }

  Future<int> getAllSongs(String pid, String pName) async {
    QuerySnapshot snapshot = await _firebaseFirestore.collection("playlist").doc(pid).collection(pName).get();
    return snapshot.docs.length;
  }

  

}