import 'package:json_annotation/json_annotation.dart';

part 'list_meta_data.g.dart';

@JsonSerializable()
class ListMetaData {
  late int currentPage;
  late int pageSize;
  late int totalPages;
  late int totalCount;

  ListMetaData({
   required this.currentPage,
   required this.pageSize,
   required this.totalPages,
   required this.totalCount,
  });

  factory ListMetaData.fromJson(Map<String, dynamic> json) => _$ListMetaDataFromJson(json);
}
