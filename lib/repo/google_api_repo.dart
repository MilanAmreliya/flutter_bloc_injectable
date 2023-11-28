import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'google_api_impl.dart';

@Injectable(as: GooGleApiRepository)
class GooGleRepo implements GooGleApiRepository {
  @override
  Future gooGleApi() async {
    http.Response response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=surat&key=AIzaSyBLjgELUHE9X1z5OI0if3tMRDG5nWK2Rt8&types=address&language=en&components=country:in'));
    print('sdfsdfsdfsdv 11 ${response.statusCode}');
    return response;
  }
}
