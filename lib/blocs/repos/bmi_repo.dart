import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ibm_task/models/bmi.dart';
import 'package:ibm_task/presentation/utils/app_constants.dart';

class BmiRepository {
  final _fireCloud =
      FirebaseFirestore.instance.collection(AppConstants.bmiList);
  Future<bool> addItemToBmiListOnFirebase(BmiModel model) async {
    try {
      await _fireCloud.add(model.toJson());
      return true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error ${e.code} ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return false;
  }


  Future<QuerySnapshot<Map<String, dynamic>>> getBmiListFromFirebase() async =>
      await FirebaseFirestore.instance.collection(AppConstants.bmiList).orderBy('createdAt',descending: true).get();

/*
try{

        final bmi = await FirebaseFirestore.instance.collection("collectionPath").get();

        bmi.docs.forEach((element) {
          return bmi_List.add(BmiModel.fromJson(element.data()));
        });

        return bmi_List;

      } on FirebaseException catch(e){
        if(kDebugMode){
        print("Failed with error ${e.code} ${e.message}");
        }
      }
      catch(e){
        throw Exception(e.toString());
      }
        return [];
 */
}
