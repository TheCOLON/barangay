import 'package:attendance/model/api_response.dart';
import 'package:attendance/model/assembly.dart';
import 'constant.dart';
import 'package:http/http.dart' as http;

// Future<ApiResponse> assembly(
//     String assembly_type, DateTime date, String venue, String about) async {
//   ApiResponse apiResponse = ApiResponse();

//   try {
//     final response = await http.post(Uri.parse(assemblyURL), headers: {
//       'accept': "application/json"
//     }, body: {
//       assembly_type: assembly_type,
//       date: date,
//       venue: venue,
//       about: about
//     });

//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data = Assembly.fromJson(jsonDecode(response.body));
//         break;
//       case 422:
//         final errors = jsonDecode(response.body)['errors'];
//         apiResponse.error = errors[errors.keys.element(0)][0];
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }
