// Made for Xfers Job Requirements 
// by Irfan Adisukma - madisukma@gmail.com | +6282211144633

part of 'services.dart';

class ServiceMovieList {
  Future<ModelMovieListResponse?> getListMovies(String page) async {
    try {
      String url = base_url + page;
      http.Response response = await http.get(Uri.parse(url),
          headers: {"HttpHeaders.contentTypeHeader": "application/json"});
      if (response.statusCode == 200) {
        final data = modelMovieListResponseFromJson(response.body);
        return data;
      } else {
        print("error status " + response.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }
}
