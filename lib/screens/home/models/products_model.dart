// To parse this JSON data, do
//
//     final getAllProducts = getAllProductsFromJson(jsonString);

import 'dart:convert';

List<GetAllProducts> getAllProductsFromJson(String str) => List<GetAllProducts>.from(json.decode(str).map((x) => GetAllProducts.fromJson(x)));

String getAllProductsToJson(List<GetAllProducts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllProducts {
    final int id;
    final String? name;
    final String? slug;
    final String? permalink;
    final DateTime dateCreated;
    final DateTime dateCreatedGmt;
    final DateTime dateModified;
    final DateTime dateModifiedGmt;
    final String? type;
    final String? status;
    final bool featured;
    final String? catalogVisibility;
    final String? description;
    final String? shortDescription;
    final String? sku;
    final String? price;
    final String? regularPrice;
    final String? salePrice;
    final dynamic dateOnSaleFrom;
    final dynamic dateOnSaleFromGmt;
    final dynamic dateOnSaleTo;
    final dynamic dateOnSaleToGmt;
    final bool onSale;
    final bool purchasable;
    final int totalSales;
    final bool virtual;
    final bool downloadable;
    final List<dynamic> downloads;
    final int downloadLimit;
    final int downloadExpiry;
    final String? externalUrl;
    final String? buttonText;
    final String? taxStatus;
    final String? taxClass;
    final bool manageStock;
    final dynamic stockQuantity;
    final String? backorders;
    final bool backordersAllowed;
    final bool backordered;
    final dynamic lowStockAmount;
    final bool soldIndividually;
    final String? weight;
    final Dimensions dimensions;
    final bool shippingRequired;
    final bool shippingTaxable;
    final String? shippingClass;
    final int shippingClassId;
    final bool reviewsAllowed;
    final String? averageRating;
    final int ratingCount;
    final List<dynamic> upsellIds;
    final List<dynamic> crossSellIds;
    final int parentId;
    final String? purchaseNote;
    final List<Category> categories;
    final List<dynamic> tags;
    final List<ProductImage> images;
    final List<Attribute> attributes;
    final List<dynamic> defaultAttributes;
    final List<dynamic> variations;
    final List<dynamic> groupedProducts;
    final int menuOrder;
    final String? priceHtml;
    final List<int> relatedIds;
    final List<MetaDatum> metaData;
    final String? stockStatus;
    final bool hasOptions;
    final String? postPassword;
    final Links links;

    GetAllProducts({
        required this.id,
        required this.name,
        required this.slug,
        required this.permalink,
        required this.dateCreated,
        required this.dateCreatedGmt,
        required this.dateModified,
        required this.dateModifiedGmt,
        required this.type,
        required this.status,
        required this.featured,
        required this.catalogVisibility,
        required this.description,
        required this.shortDescription,
        required this.sku,
        required this.price,
        required this.regularPrice,
        required this.salePrice,
        required this.dateOnSaleFrom,
        required this.dateOnSaleFromGmt,
        required this.dateOnSaleTo,
        required this.dateOnSaleToGmt,
        required this.onSale,
        required this.purchasable,
        required this.totalSales,
        required this.virtual,
        required this.downloadable,
        required this.downloads,
        required this.downloadLimit,
        required this.downloadExpiry,
        required this.externalUrl,
        required this.buttonText,
        required this.taxStatus,
        required this.taxClass,
        required this.manageStock,
        required this.stockQuantity,
        required this.backorders,
        required this.backordersAllowed,
        required this.backordered,
        required this.lowStockAmount,
        required this.soldIndividually,
        required this.weight,
        required this.dimensions,
        required this.shippingRequired,
        required this.shippingTaxable,
        required this.shippingClass,
        required this.shippingClassId,
        required this.reviewsAllowed,
        required this.averageRating,
        required this.ratingCount,
        required this.upsellIds,
        required this.crossSellIds,
        required this.parentId,
        required this.purchaseNote,
        required this.categories,
        required this.tags,
        required this.images,
        required this.attributes,
        required this.defaultAttributes,
        required this.variations,
        required this.groupedProducts,
        required this.menuOrder,
        required this.priceHtml,
        required this.relatedIds,
        required this.metaData,
        required this.stockStatus,
        required this.hasOptions,
        required this.postPassword,
        required this.links,
    });

    factory GetAllProducts.fromJson(Map<String, dynamic> json) => GetAllProducts(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        type: json["type"],
        status: json["status"],
        featured: json["featured"],
        catalogVisibility: json["catalog_visibility"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: json["tax_status"],
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        backorders: json["backorders"],
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
        crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        images: List<ProductImage>.from(json["images"].map((x) => ProductImage.fromJson(x))),
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
        defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
        variations: List<dynamic>.from(json["variations"].map((x) => x)),
        groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
        metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        stockStatus: json["stock_status"],
        hasOptions: json["has_options"],
        postPassword: json["post_password"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "type": type,
        "status": status,
        "featured": featured,
        "catalog_visibility": catalogVisibility,
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": List<dynamic>.from(downloads.map((x) => x)),
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatus,
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "backorders": backorders,
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "low_stock_amount": lowStockAmount,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "shipping_required": shippingRequired,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
        "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "default_attributes": List<dynamic>.from(defaultAttributes.map((x) => x)),
        "variations": List<dynamic>.from(variations.map((x) => x)),
        "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
        "stock_status": stockStatus,
        "has_options": hasOptions,
        "post_password": postPassword,
        "_links": links.toJson(),
    };
}

class Attribute {
    final int id;
    final String? name;
    final String? slug;
    final int position;
    final bool visible;
    final bool variation;
    final List<String> options;

    Attribute({
        required this.id,
        required this.name,
        required this.slug,
        required this.position,
        required this.visible,
        required this.variation,
        required this.options,
    });

    factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        position: json["position"],
        visible: json["visible"],
        variation: json["variation"],
        options: List<String>.from(json["options"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "position": position,
        "visible": visible,
        "variation": variation,
        "options": List<dynamic>.from(options.map((x) => x)),
    };
}

class Category {
    final int id;
    final String? name;
    final String? slug;

    Category({
        required this.id,
        required this.name,
        required this.slug,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}

class Dimensions {
    final String? length;
    final String? width;
    final String? height;

    Dimensions({
        required this.length,
        required this.width,
        required this.height,
    });

    factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
    };
}

class ProductImage {
    final int id;
    final DateTime dateCreated;
    final DateTime dateCreatedGmt;
    final DateTime dateModified;
    final DateTime dateModifiedGmt;
    final String? src;
    final String? name;
    final String? alt;

    ProductImage({
        required this.id,
        required this.dateCreated,
        required this.dateCreatedGmt,
        required this.dateModified,
        required this.dateModifiedGmt,
        required this.src,
        required this.name,
        required this.alt,
    });

    factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
    };
}

class Links {
    final List<Collection> self;
    final List<Collection> collection;

    Links({
        required this.self,
        required this.collection,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    };
}

class Collection {
    final String? href;

    Collection({
        required this.href,
    });

    factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class MetaDatum {
    final int id;
    final String? key;
    final Value value;

    MetaDatum({
        required this.id,
        required this.key,
        required this.value,
    });

    factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json["id"],
        key: json["key"],
        value: Value.fromJson(json["value"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value.toJson(),
    };
}

class Value {
    final int sharing;
    final int verticalSharing;
    final int counter;
    final int verticalCounter;
    final int fbComments;

    Value({
        required this.sharing,
        required this.verticalSharing,
        required this.counter,
        required this.verticalCounter,
        required this.fbComments,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        sharing: json["sharing"],
        verticalSharing: json["vertical_sharing"],
        counter: json["counter"],
        verticalCounter: json["vertical_counter"],
        fbComments: json["fb_comments"],
    );

    Map<String, dynamic> toJson() => {
        "sharing": sharing,
        "vertical_sharing": verticalSharing,
        "counter": counter,
        "vertical_counter": verticalCounter,
        "fb_comments": fbComments,
    };
}
