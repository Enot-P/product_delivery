import 'package:tea_delivery/app/domain/tea_entity.dart';
import 'package:tea_delivery/resources/resources.dart';

class TeaApiClient {
  Future<List<TeaEntity>> getListTeas() async {
    return [
      TeaEntity(
        image: Images.teaExample,
        name: 'Зелёный чай Сенча',
        weight: 100,
        price: 350,
        description: 'Классический японский зелёный чай с освежающим вкусом и лёгкой травяной нотой.',
      ),
      TeaEntity(
        image: Images.teaExample,
        name: 'Чёрный чай Ассам',
        weight: 200,
        price: 500,
        description: 'Индийский чёрный чай с насыщенным вкусом, нотками солода и пряностей.',
      ),
      TeaEntity(
        image: Images.teaExample,
        name: 'Улун Милк',
        weight: 150,
        price: 420,
        description: 'Полуферментированный улун с кремовым молочным ароматом и сладковатым послевкусием.',
      ),
      TeaEntity(
        image: Images.teaExample,
        name: 'Ройбуш Ванильный',
        weight: 100,
        price: 300,
        description: 'Безкофеиновый ройбуш с добавлением ванили, идеален для вечернего чаепития.',
      ),
      TeaEntity(
        image: Images.teaExample,
        name: 'Травяной чай Ромашка',
        weight: 50,
        price: 200,
        description: 'Успокаивающий травяной чай из цветов ромашки, помогает расслабиться и улучшить сон.',
      ),
    ];
  }

  // TODO: Переделать под локальное хранение
  Future<List<TeaEntity>> getListTeasForCart() async {
    return [
      TeaEntity(
        image: Images.teaExample,
        name: 'Зелёный чай Сенча',
        weight: 100,
        price: 350,
        description: 'Классический японский зелёный чай с освежающим вкусом и лёгкой травяной нотой.',
      ),
      TeaEntity(
        image: Images.teaExample,
        name: 'Чёрный чай Ассам',
        weight: 200,
        price: 500,
        description: 'Индийский чёрный чай с насыщенным вкусом, нотками солода и пряностей.',
      ),
    ];
  }
}
