import 'package:perfume_app/common/enums.dart';

class HomeEntity {
  final int? errorCode;
  final String? message;
  final HomeDataEntity? data;

  HomeEntity({this.errorCode, this.message, this.data});
}

class HomeDataEntity {
  final List<HomeFieldEntity>? homeFields;
  final int? notificationCount;

  HomeDataEntity({this.homeFields, this.notificationCount});
}

class HomeFieldEntity {
  final String? type;
  final List<BannerEntity>? carouselItems;
  final List<BrandEntity>? brands;
  final List<BrandEntity>? categories;
  final String? image;
  final int? collectionId;
  final String? name;
  final List<ProductEntity>? products;
  final List<BannerEntity>? banners;
  final BannerEntity? banner;

  HomeFieldEntity({
    this.type,
    this.carouselItems,
    this.brands,
    this.categories,
    this.image,
    this.collectionId,
    this.name,
    this.products,
    this.banners,
    this.banner,
  });
}

class BannerEntity {
  final int? id;
  final String? image;
  final String? type;

  BannerEntity({this.id, this.image, this.type});
}

class BrandEntity {
  final int? id;
  final String? name;
  final String? image;

  BrandEntity({this.id, this.name, this.image});
}

class ProductEntity {
  final int? id;
  final String? image;
  final String? name;
  final Currency? currency;
  final Unit? unit;
  final bool? wishlisted;
  final bool? rfqStatus;
  final int? cartCount;
  final int? futureCartCount;
  final bool? hasStock;
  final String? price;
  final String? actualPrice;
  final String? offer;
  final List<dynamic>? offerPrices;

  ProductEntity({
    this.id,
    this.image,
    this.name,
    this.currency,
    this.unit,
    this.wishlisted,
    this.rfqStatus,
    this.cartCount,
    this.futureCartCount,
    this.hasStock,
    this.price,
    this.actualPrice,
    this.offer,
    this.offerPrices,
  });
}
