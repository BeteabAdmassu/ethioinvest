import 'package:appwrite/appwrite.dart';



class AppwriteClient {
  static final Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('664d99c6000483704081')
    .setSelfSigned(status: true);

  static final Account account = Account(client);
}