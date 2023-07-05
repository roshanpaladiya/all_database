import 'package:firebase_database/firebase_database.dart';
import 'package:getx_practice/modelClass/modelclass_datal.dart';
import 'package:getx_practice/utils/firebase_resourses.dart';

class GetDataFromFirebase {
  static Future<List<User>?> getAllSignUpUserFromFirebase() async {
    FirebaseDatabase database = FirebaseDatabase.instance;

    DatabaseReference reference =
        database.ref(FirebaseResources.allSignUpUsersFirebaseKey);
    List<User>? allUserList = [];
    await reference.get().then((value) {
      Map allData = value.value as Map;

      allData.forEach((key, value) {
        value['id'] = key;

        allUserList.add(User.fromJson(value));
      });
    });
    return allUserList;
  }

// static Future<List<User>?> getAllSignUpUserFromFirebase() async {
//   Map? allUserData = await FirebaseService.getAllDataFromFirebase(
//       FirebaseResources.allSignUpUsersFirebaseKey);
//   List<Map<String, dynamic>> allUserJsonList = [];
//   if (allUserData != null) {
//     allUserData.forEach(
//       (key, value) {
//         Map<String, dynamic> userData = {};
//         userData['id'] = key;
//         value.forEach(
//           (innerKey, innerValue) {
//             userData[innerKey.toString()] = innerValue;
//           },
//         );
//       },
//     );
//   }
//   return userFromJson(
//     jsonEncode(allUserJsonList),
//   );
// }
}
