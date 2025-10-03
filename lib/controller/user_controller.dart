import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserController extends GetxController {
  var users = [].obs; // data list observable
  var isLoading = false.obs; // indikator loading
  var email = "".obs;
  var fullName = "".obs;
  var profilePicture = "".obs;
  var phone = "".obs;
  var location = "".obs;
  var dateOfBirth = "".obs;

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      var apiUrl = dotenv.env['API_URL'] ?? '';
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var user = data['results'][0];

        // print(jsonDecode(response.body)['results'][0]['gender']);
        var title = user['name']['title'];
        var firsName = user['name']['first'];
        var lastName = user['name']['last'];
        fullName.value = '${title}. ${firsName} ${lastName}';

        profilePicture.value = user['picture']['large'];
        email.value = user['email'];
        phone.value = user['phone'];

        var locationCity = user['location']['city'];
        var locationCountry = user['location']['country'];
        location.value = '${locationCity}, ${locationCountry}';
        // print(location.value);

        dateOfBirth.value = user['dob']['date']; 

      } else {
        Get.snackbar("Error", "Gagal ambil data: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
