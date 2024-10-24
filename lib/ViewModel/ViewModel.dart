import 'package:http/http.dart' as http;

class viewModel {

  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://fragrancefinder-api.p.rapidapi.com/perfumes/search?q=1 million royal'));
  }


}