import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reddit.g.dart';

abstract class Reddit implements Built<Reddit, RedditBuilder> {
  Children get data;

  Reddit._();
  factory Reddit([updates(RedditBuilder b)]) = _$Reddit;
  static Serializer<Reddit> get serializer => _$redditSerializer;
}

abstract class Children implements Built<Children, ChildrenBuilder> {
  BuiltList<Data> get children;

  Children._();
  factory Children([updates(ChildrenBuilder b)]) = _$Children;
  static Serializer<Children> get serializer => _$childrenSerializer;
}

abstract class Data implements Built<Data, DataBuilder> {
  Post get data;

  Data._();
  factory Data([updates(DataBuilder b)]) = _$Data;
  static Serializer<Data> get serializer => _$dataSerializer;
}

abstract class Post implements Built<Post, PostBuilder> {
  String get title;
  @nullable
  @BuiltValueField(wireName: "link_flair_text")
  String get response;
  @nullable
  @BuiltValueField(wireName: "selftext")
  String get text;
  String get url;

  Post._();
  factory Post([updates(PostBuilder b)]) = _$Post;
  static Serializer<Post> get serializer => _$postSerializer;
}
