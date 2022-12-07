class ItemModel {
  late String _itemImage;
  late String _itemTitle;
  late String _itemSTitle;
  late num _itemId;
  late String _itemDescription;
  late String _itemUsage;
  late String _itemNotice;

  ItemModel.init();

  ItemModel.createItem({
    required String itemImage,
    required String itemTitle,
    required String itemSTitle,
    required num itemId,
    required String itemDescription,
    required String itemUsage,
    required String itemNotice,
  }) {
    _itemImage = "images/herb_imgs/$itemImage.png";
    _itemTitle = itemTitle;
    _itemSTitle = itemSTitle;
    _itemId = itemId;
    _itemDescription = itemDescription;
    _itemUsage = itemUsage;
    _itemNotice = itemNotice;
  }

  String getItemImage() => _itemImage;
  String getItemTitle() => _itemTitle;
  String getItemSTitle() => _itemSTitle;
  num getItemId() => _itemId;
  String getItemDescription() => _itemDescription;
  String getItemUsage() => _itemUsage;
  String getItemNotice() => _itemUsage;
}
