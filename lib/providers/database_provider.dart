import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/appwrite.dart';

final appwriteClientProvider = Provider<Client>((ref) {
  return Client()
    ..setEndpoint('https://cloud.appwrite.io/v1')
    ..setProject('664d99c6000483704081');
});

final databaseIdProvider = Provider<String>((ref) {
  return '66520a42001ad29ca351';
});

final databasesProvider = Provider<Databases>((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Databases(client);
});
