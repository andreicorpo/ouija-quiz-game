// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Reddit> _$redditSerializer = new _$RedditSerializer();
Serializer<Children> _$childrenSerializer = new _$ChildrenSerializer();
Serializer<Data> _$dataSerializer = new _$DataSerializer();
Serializer<Post> _$postSerializer = new _$PostSerializer();

class _$RedditSerializer implements StructuredSerializer<Reddit> {
  @override
  final Iterable<Type> types = const [Reddit, _$Reddit];
  @override
  final String wireName = 'Reddit';

  @override
  Iterable serialize(Serializers serializers, Reddit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(Children)),
    ];

    return result;
  }

  @override
  Reddit deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RedditBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(Children)) as Children);
          break;
      }
    }

    return result.build();
  }
}

class _$ChildrenSerializer implements StructuredSerializer<Children> {
  @override
  final Iterable<Type> types = const [Children, _$Children];
  @override
  final String wireName = 'Children';

  @override
  Iterable serialize(Serializers serializers, Children object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'children',
      serializers.serialize(object.children,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Data)])),
    ];

    return result;
  }

  @override
  Children deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChildrenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'children':
          result.children.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Data)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$DataSerializer implements StructuredSerializer<Data> {
  @override
  final Iterable<Type> types = const [Data, _$Data];
  @override
  final String wireName = 'Data';

  @override
  Iterable serialize(Serializers serializers, Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Post)),
    ];

    return result;
  }

  @override
  Data deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(Post)) as Post);
          break;
      }
    }

    return result.build();
  }
}

class _$PostSerializer implements StructuredSerializer<Post> {
  @override
  final Iterable<Type> types = const [Post, _$Post];
  @override
  final String wireName = 'Post';

  @override
  Iterable serialize(Serializers serializers, Post object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];
    if (object.link_flair_text != null) {
      result
        ..add('link_flair_text')
        ..add(serializers.serialize(object.link_flair_text,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Post deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'link_flair_text':
          result.link_flair_text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Reddit extends Reddit {
  @override
  final Children data;

  factory _$Reddit([void updates(RedditBuilder b)]) =>
      (new RedditBuilder()..update(updates)).build();

  _$Reddit._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('Reddit', 'data');
    }
  }

  @override
  Reddit rebuild(void updates(RedditBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RedditBuilder toBuilder() => new RedditBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reddit && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Reddit')..add('data', data))
        .toString();
  }
}

class RedditBuilder implements Builder<Reddit, RedditBuilder> {
  _$Reddit _$v;

  ChildrenBuilder _data;
  ChildrenBuilder get data => _$this._data ??= new ChildrenBuilder();
  set data(ChildrenBuilder data) => _$this._data = data;

  RedditBuilder();

  RedditBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reddit other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Reddit;
  }

  @override
  void update(void updates(RedditBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Reddit build() {
    _$Reddit _$result;
    try {
      _$result = _$v ?? new _$Reddit._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Reddit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Children extends Children {
  @override
  final BuiltList<Data> children;

  factory _$Children([void updates(ChildrenBuilder b)]) =>
      (new ChildrenBuilder()..update(updates)).build();

  _$Children._({this.children}) : super._() {
    if (children == null) {
      throw new BuiltValueNullFieldError('Children', 'children');
    }
  }

  @override
  Children rebuild(void updates(ChildrenBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ChildrenBuilder toBuilder() => new ChildrenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Children && children == other.children;
  }

  @override
  int get hashCode {
    return $jf($jc(0, children.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Children')..add('children', children))
        .toString();
  }
}

class ChildrenBuilder implements Builder<Children, ChildrenBuilder> {
  _$Children _$v;

  ListBuilder<Data> _children;
  ListBuilder<Data> get children =>
      _$this._children ??= new ListBuilder<Data>();
  set children(ListBuilder<Data> children) => _$this._children = children;

  ChildrenBuilder();

  ChildrenBuilder get _$this {
    if (_$v != null) {
      _children = _$v.children?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Children other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Children;
  }

  @override
  void update(void updates(ChildrenBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Children build() {
    _$Children _$result;
    try {
      _$result = _$v ?? new _$Children._(children: children.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'children';
        children.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Children', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Data extends Data {
  @override
  final Post data;

  factory _$Data([void updates(DataBuilder b)]) =>
      (new DataBuilder()..update(updates)).build();

  _$Data._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('Data', 'data');
    }
  }

  @override
  Data rebuild(void updates(DataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DataBuilder toBuilder() => new DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Data && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Data')..add('data', data)).toString();
  }
}

class DataBuilder implements Builder<Data, DataBuilder> {
  _$Data _$v;

  PostBuilder _data;
  PostBuilder get data => _$this._data ??= new PostBuilder();
  set data(PostBuilder data) => _$this._data = data;

  DataBuilder();

  DataBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Data other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Data;
  }

  @override
  void update(void updates(DataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Data build() {
    _$Data _$result;
    try {
      _$result = _$v ?? new _$Data._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Post extends Post {
  @override
  final String title;
  @override
  final String link_flair_text;
  @override
  final String url;

  factory _$Post([void updates(PostBuilder b)]) =>
      (new PostBuilder()..update(updates)).build();

  _$Post._({this.title, this.link_flair_text, this.url}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Post', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Post', 'url');
    }
  }

  @override
  Post rebuild(void updates(PostBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PostBuilder toBuilder() => new PostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        title == other.title &&
        link_flair_text == other.link_flair_text &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, title.hashCode), link_flair_text.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Post')
          ..add('title', title)
          ..add('link_flair_text', link_flair_text)
          ..add('url', url))
        .toString();
  }
}

class PostBuilder implements Builder<Post, PostBuilder> {
  _$Post _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _link_flair_text;
  String get link_flair_text => _$this._link_flair_text;
  set link_flair_text(String link_flair_text) =>
      _$this._link_flair_text = link_flair_text;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  PostBuilder();

  PostBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _link_flair_text = _$v.link_flair_text;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Post;
  }

  @override
  void update(void updates(PostBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Post build() {
    final _$result = _$v ??
        new _$Post._(title: title, link_flair_text: link_flair_text, url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
