import 'package:realtime_sign_languages_translator/features/home/data/repo/fire_store_repo.dart';

class FireStoreApi implements FireStoreRepo {
  Future<List<String>> getChats(String uid) {
    throw UnimplementedError();
  }

  @override
  Future<void> addData(String collection, Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteData(String collection, String docId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData(String collection) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> getData(String collection, String docId) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateData(
    String collection,
    String docId,
    Map<String, dynamic> data,
  ) {
    throw UnimplementedError();
  }
}
