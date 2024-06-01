// import 'package:appwrite/appwrite.dart';
// import 'package:fl_chart/fl_chart.dart';

// class HistoryService {
//   Databases databases;
//   String databaseId;
//   String collectionId = '665a40900011aaa3b396'; // Update with your collection ID

//   HistoryService(this.databases, this.databaseId);

//   Future<List<FlSpot>> fetchChartData(String stockID) async {
//     List<FlSpot> spots = [];
//     try {
//       final response = await databases.listDocuments(
//         databaseId: databaseId,
//         collectionId: collectionId,
//         queries: [
//           Query.equal('stockID', stockID),
//           Query.orderDesc('date'),
//           Query.limit(5),
//         ],
//       );

//       if (response.documents.isNotEmpty) {
//         final documents = response.documents;
//         for (var document in documents) {
//           final price = document.data['price'];
//           final date = document.data['date'];
//           spots.add(FlSpot(date.toDouble(), price.toDouble()));
//         }
//       }

//       return spots;
//     } catch (e) {
//       print('Error fetching data: $e');
//       return spots; // return empty list if error occurs
//     }
//   }
// }
import 'package:fl_chart/fl_chart.dart';

class HistoryService {
  Future<List<FlSpot>> fetchChartData(String stockID) async {
    // Demo data for the chart
    List<FlSpot> spots = [
      FlSpot(1627776000000, 100), // Date: 2021-08-01, Price: 100
      FlSpot(1627862400000, 110), // Date: 2021-08-02, Price: 110
      FlSpot(1627948800000, 120), // Date: 2021-08-03, Price: 120
      FlSpot(1628035200000, 115), // Date: 2021-08-04, Price: 115
      FlSpot(1628121600000, 130), // Date: 2021-08-05, Price: 130
    ];

    return Future.value(spots);
  }
}





