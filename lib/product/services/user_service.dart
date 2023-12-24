import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gameapp/core/models/simple_result.dart';
import 'package:gameapp/product/models/user/user_model.dart';
import 'package:gameapp/product/providers/general_provider.dart';
import 'package:provider/provider.dart';

import '../../core/services/navigation_service.dart';

class UserService {
  static UserService? _instance;
  static UserService get instance {
    _instance ??= UserService._init();
    return _instance!;
  }

  UserService._init();

  Future<SimpleResult> saveUser() async {
    try {
      DocumentReference ref = FirebaseFirestore.instance.collection('users').doc();
      UserModel user = UserModel(ref.id, 'user${Random().nextInt(99999)}', 0, 0);
      await ref.set(user.toJson());

      return SimpleResult(isSuccess: true, data: user);
    } catch (e) {
      return SimpleResult(isSuccess: false);
    }
  }

  Future<SimpleResult> getUser(String id) async {
    try {
      DocumentReference ref = FirebaseFirestore.instance.collection('users').doc(id);
      UserModel user = UserModel.fromJson((await ref.get()).data() as Map<String, dynamic>);

      return SimpleResult(isSuccess: true, data: user);
    } catch (e) {
      return SimpleResult(isSuccess: false);
    }
  }

  Future<void> setUserScore(String id, int newScore) async {
    try {
      DocumentReference ref = FirebaseFirestore.instance.collection('users').doc(id);
      await ref.update({'highScore': newScore});
      SimpleResult result = await getUser(id);
      // ignore: use_build_context_synchronously
      if (result.isSuccess) ns.context.read<GeneralProvider>().user = result.data;
    } catch (e) {
      print(e);
    }
  }
}
