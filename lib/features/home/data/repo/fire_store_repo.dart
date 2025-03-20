abstract class FireStoreRepo {
  Future<void> addData(String collection, Map<String, dynamic> data);
  Future<void> updateData(
    String collection,
    String docId,
    Map<String, dynamic> data,
  );
  Future<void> deleteData(String collection, String docId);
  Future<Map<String, dynamic>?> getData(String collection, String docId);
  Future<List<Map<String, dynamic>>> getAllData(String collection);
}
