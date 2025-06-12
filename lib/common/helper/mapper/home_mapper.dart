import 'package:perfume_app/data/home/models/home_model.dart';
import 'package:perfume_app/domain/home/entities/home_entity.dart';

class HomeMapper {
  static HomeEntity toEntity(HomeModel model) {
    return HomeEntity(
      errorCode: model.errorCode,
      message: model.message,
      data: _mapData(model.data),
    );
  }

  static HomeDataEntity? _mapData(Data? data) {
    if (data == null) return null;

    return HomeDataEntity(
      notificationCount: data.notificationCount,
      homeFields: data.homeFields?.map(_mapHomeField).toList(),
    );
  }

  static HomeFieldEntity _mapHomeField(HomeField model) {
    return HomeFieldEntity(
      type: model.type,
      image: model.image,
      collectionId: model.collectionId,
      name: model.name,
      carouselItems: model.carouselItems?.map(_mapBanner).toList(),
      brands: model.brands?.map(_mapBrand).toList(),
      categories: model.categories?.map(_mapBrand).toList(),
      products: model.products?.map(_mapProduct).toList(),
      banners: model.banners?.map(_mapBanner).toList(),
      banner: model.banner != null ? _mapBanner(model.banner!) : null,
    );
  }

  static BannerEntity _mapBanner(Banner model) {
    return BannerEntity(id: model.id, image: model.image, type: model.type);
  }

  static BrandEntity _mapBrand(Brand model) {
    return BrandEntity(id: model.id, name: model.name, image: model.image);
  }

  static ProductEntity _mapProduct(Product model) {
    return ProductEntity(
      id: model.id,
      image: model.image,
      name: model.name,
      currency: model.currency,
      unit: model.unit,
      wishlisted: model.wishlisted,
      rfqStatus: model.rfqStatus,
      cartCount: model.cartCount,
      futureCartCount: model.futureCartCount,
      hasStock: model.hasStock,
      price: model.price,
      actualPrice: model.actualPrice,
      offer: model.offer,
      offerPrices: model.offerPrices,
    );
  }
}
