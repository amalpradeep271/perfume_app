import 'package:perfume_app/data/home/models/home_model.dart' as model;
import 'package:perfume_app/domain/home/entities/home_entity.dart' as entity;

class HomeMapper {
  static entity.HomeEntity toEntity(model.HomeModel model) {
    return entity.HomeEntity(
      errorCode: model.errorCode,
      message: model.message,
      data: _mapData(model.data),
    );
  }

  static entity.HomeDataEntity _mapData(model.Data data) {
    return entity.HomeDataEntity(
      homeFields: data.homeFields.map(_mapHomeField).toList(),
      notificationCount: data.notificationCount,
    );
  }

  static entity.HomeFieldEntity _mapHomeField(model.HomeField field) {
    return entity.HomeFieldEntity(
      type: field.type,
      carouselItems: field.carouselItems?.map(_mapBanner).toList(),
      brands: field.brands?.map(_mapBrand).toList(),
      categories: field.categories?.map(_mapBrand).toList(),
      image: field.image,
      collectionId: field.collectionId,
      name: field.name,
      products: field.products?.map(_mapProduct).toList(),
      banners: field.banners?.map(_mapBanner).toList(),
      banner: field.banner != null ? _mapBanner(field.banner!) : null,
    );
  }

  static entity.BannerEntity _mapBanner(model.Banner banner) {
    return entity.BannerEntity(
      id: banner.id,
      image: banner.image,
      type: banner.type,
    );
  }

  static entity.BrandEntity _mapBrand(model.Brand brand) {
    return entity.BrandEntity(
      id: brand.id,
      name: brand.name,
      image: brand.image,
    );
  }

  static entity.Currency _mapCurrency(model.Currency currency) {
    switch (currency) {
      case model.Currency.aed:
        return entity.Currency.aed;
    }
  }

  static entity.Unit _mapUnit(model.Unit unit) {
    switch (unit) {
      case model.Unit.percarton:
        return entity.Unit.perCarton;
    }
  }

  static entity.ProductEntity _mapProduct(model.Product product) {
    return entity.ProductEntity(
      id: product.id,
      image: product.image,
      name: product.name,
      currency: _mapCurrency(product.currency),
      unit: _mapUnit(product.unit),
      wishlisted: product.wishlisted,
      rfqStatus: product.rfqStatus,
      cartCount: product.cartCount,
      futureCartCount: product.futureCartCount,
      hasStock: product.hasStock,
      price: product.price,
      actualPrice: product.actualPrice,
      offer: product.offer,
      offerPrices: product.offerPrices,
    );
  }
}
