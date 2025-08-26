import 'package:tea_delivery/app/domain/tea_entity.dart';
import 'package:tea_delivery/resources/resources.dart';

class TeaApiClient {
  Future<List<TeaEntity>> getListTeas() async {
    return [
      TeaEntity(
        image: Images.teaExample,
        name: 'Зелёный чай Сенча',
        weight: '100 г',
        price: 350,
      ),
      TeaEntity(
        image: Images.teaExample,
        name: 'Чёрный чай Ассам',
        weight: '200 г',
        price: 500,
      ),
      TeaEntity(
        image: Images.teaExample,
        name: 'Улун Милк',
        weight: '150 г',
        price: 420,
      ),
      TeaEntity(
        image: Images.teaExample,
        name: 'Ройбуш Ванильный',
        weight: '100 г',
        price: 300,
      ),
      TeaEntity(
        image: Images.teaExample,
        name: 'Травяной чай Ромашка',
        weight: '50 г',
        price: 200,
      ),
    ];
  }
}

