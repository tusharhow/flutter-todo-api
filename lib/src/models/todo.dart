// class Todo {
//   int? code;
//   bool? success;
//   int? timestamp;
//   String? message;
//   List<Items> items;
//   Meta? meta;

//   Todo(
//       {this.code,
//       this.success,
//       this.timestamp,
//       this.message,
//       required this.items,
//       this.meta});

//   Todo.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     success = json['success'];
//     timestamp = json['timestamp'];
//     message = json['message'];
//     items = <Items>[] ;
//     meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['success'] = this.success;
//     data['timestamp'] = this.timestamp;
//     data['message'] = this.message;
//     if (this.items != null) {
//       data['items'] = this.items.map((v) => v.toJson()).toList();
//     }
//     if (this.meta != null) {
//       data['meta'] = this.meta!.toJson();
//     }
//     return data;
//   }
// }

// class Items {
//   String sId;
//   String title;
//   String description;
//   bool isCompleted;
//   String createdAt;
//   String updatedAt;

//   Items(
//       {this.sId,
//       this.title,
//       this.description,
//       this.isCompleted,
//       this.createdAt,
//       this.updatedAt});

//   Items.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//     description = json['description'];
//     isCompleted = json['is_completed'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['is_completed'] = this.isCompleted;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Meta {
//   int? totalItems;
//   int? totalPages;
//   int? perPageItem;
//   int? currentPage;
//   int? pageSize;
//   bool? hasMorePage;

//   Meta(
//       {this.totalItems,
//       this.totalPages,
//       this.perPageItem,
//       this.currentPage,
//       this.pageSize,
//       this.hasMorePage});

//   Meta.fromJson(Map<String, dynamic> json) {
//     totalItems = json['total_items'];
//     totalPages = json['total_pages'];
//     perPageItem = json['per_page_item'];
//     currentPage = json['current_page'];
//     pageSize = json['page_size'];
//     hasMorePage = json['has_more_page'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total_items'] = this.totalItems;
//     data['total_pages'] = this.totalPages;
//     data['per_page_item'] = this.perPageItem;
//     data['current_page'] = this.currentPage;
//     data['page_size'] = this.pageSize;
//     data['has_more_page'] = this.hasMorePage;
//     return data;
//   }
// }

class Todo {
  Todo({
    required this.code,
    required this.success,
    required this.timestamp,
    required this.message,
    required this.items,
    required this.meta,
  });
  late final int code;
  late final bool success;
  late final int timestamp;
  late final String message;
  late final List<Items> ?items;
  late final Meta meta;

  Todo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    timestamp = json['timestamp'];
    message = json['message'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['success'] = success;
    _data['timestamp'] = timestamp;
    _data['message'] = message;
    _data['items'] = items!.map((e) => e.toJson()).toList();
    _data['meta'] = meta.toJson();
    return _data;
  }
}

class Items {
  Items({
    required this.sId,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String sId;
  late final String title;
  late final String description;
  late final bool isCompleted;
  late final String createdAt;
  late final String updatedAt;

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    isCompleted = json['is_completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = sId;
    _data['title'] = title;
    _data['description'] = description;
    _data['is_completed'] = isCompleted;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Meta {
  Meta({
    required this.totalItems,
    required this.totalPages,
    required this.perPageItem,
    required this.currentPage,
    required this.pageSize,
    required this.hasMorePage,
  });
  late final int totalItems;
  late final int totalPages;
  late final int perPageItem;
  late final int currentPage;
  late final int pageSize;
  late final bool hasMorePage;

  Meta.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    totalPages = json['total_pages'];
    perPageItem = json['per_page_item'];
    currentPage = json['current_page'];
    pageSize = json['page_size'];
    hasMorePage = json['has_more_page'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_items'] = totalItems;
    _data['total_pages'] = totalPages;
    _data['per_page_item'] = perPageItem;
    _data['current_page'] = currentPage;
    _data['page_size'] = pageSize;
    _data['has_more_page'] = hasMorePage;
    return _data;
  }
}
