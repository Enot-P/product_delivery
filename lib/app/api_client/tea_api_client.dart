import 'package:tea_delivery/app/entity/product.dart';
import 'package:tea_delivery/resources/resources.dart';

class TeaApiClient {
  final products = [
    ProductEntity(
      image: Images.teaExample,
      name: 'Чай Сенча',
      weight: 100,
      price: 350,
      description: 'Классический японский зелёный чай с освежающим вкусом и лёгкой травяной нотой.',
    ),
    ProductEntity(
      image: Images.teaExample,
      name: 'Чай Ассам',
      weight: 200,
      price: 500,
      description: 'Индийский чёрный чай с насыщенным вкусом, нотками солода и пряностей.',
    ),
    ProductEntity(
      image: Images.teaExample,
      name: 'Улун Милк',
      weight: 150,
      price: 420,
      description: 'Полуферментированный улун с кремовым молочным ароматом и сладковатым послевкусием.',
    ),
    ProductEntity(
      image: Images.teaExample,
      name: 'Ройбуш Ванильный',
      weight: 100,
      price: 300,
      description: 'Безкофеиновый ройбуш с добавлением ванили, идеален для вечернего чаепития.',
    ),
    ProductEntity(
      image: Images.teaExample,
      name: 'Ромашковый чай',
      weight: 50,
      price: 200,
      description: 'Успокаивающий травяной чай из цветов ромашки, помогает расслабиться и улучшить сон.',
    ),
  ];
  Future<List<ProductEntity>> getListTeas() async {
    return products;
  }

  Future<ProductEntity> getProductEntityById(int id) async {
    return products[id];
  }
}
