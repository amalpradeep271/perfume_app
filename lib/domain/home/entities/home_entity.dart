class HomeEntity {
  final int errorCode;
  final String message;
  final HomeDataEntity data;

  HomeEntity({
    required this.errorCode,
    required this.message,
    required this.data,
  });
}

class HomeDataEntity {
  final List<HomeFieldEntity> homeFields;
  final int notificationCount;

  HomeDataEntity({
    required this.homeFields,
    required this.notificationCount,
  });
}

class HomeFieldEntity {
  final String type;
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
    required this.type,
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
  final int id;
  final String image;
  final String type;

  BannerEntity({
    required this.id,
    required this.image,
    required this.type,
  });
}

class BrandEntity {
  final int id;
  final String name;
  final String? image;

  BrandEntity({
    required this.id,
    required this.name,
    this.image,
  });
}

class ProductEntity {
  final int id;
  final String image;
  final String name;
  final Currency currency;
  final Unit unit;
  final bool wishlisted;
  final bool rfqStatus;
  final int cartCount;
  final int futureCartCount;
  final bool hasStock;
  final String price;
  final String actualPrice;
  final String offer;
  final List<dynamic> offerPrices;

  ProductEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.currency,
    required this.unit,
    required this.wishlisted,
    required this.rfqStatus,
    required this.cartCount,
    required this.futureCartCount,
    required this.hasStock,
    required this.price,
    required this.actualPrice,
    required this.offer,
    required this.offerPrices,
  });
}

enum Currency { aed }

enum Unit { perCarton }
