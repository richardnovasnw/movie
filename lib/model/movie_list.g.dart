// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MovieList> _$movieListSerializer = new _$MovieListSerializer();

class _$MovieListSerializer implements StructuredSerializer<MovieList> {
  @override
  final Iterable<Type> types = const [MovieList, _$MovieList];
  @override
  final String wireName = 'MovieList';

  @override
  Iterable<Object?> serialize(Serializers serializers, MovieList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Movie)])),
      'cast',
      serializers.serialize(object.cast,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Cast)])),
    ];

    return result;
  }

  @override
  MovieList deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Movie)]))!
              as BuiltList<Object?>);
          break;
        case 'cast':
          result.cast.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Cast)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$MovieList extends MovieList {
  @override
  final BuiltList<Movie> results;
  @override
  final BuiltList<Cast> cast;

  factory _$MovieList([void Function(MovieListBuilder)? updates]) =>
      (new MovieListBuilder()..update(updates)).build();

  _$MovieList._({required this.results, required this.cast}) : super._() {
    BuiltValueNullFieldError.checkNotNull(results, 'MovieList', 'results');
    BuiltValueNullFieldError.checkNotNull(cast, 'MovieList', 'cast');
  }

  @override
  MovieList rebuild(void Function(MovieListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieListBuilder toBuilder() => new MovieListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieList && results == other.results && cast == other.cast;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, results.hashCode), cast.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieList')
          ..add('results', results)
          ..add('cast', cast))
        .toString();
  }
}

class MovieListBuilder implements Builder<MovieList, MovieListBuilder> {
  _$MovieList? _$v;

  ListBuilder<Movie>? _results;
  ListBuilder<Movie> get results =>
      _$this._results ??= new ListBuilder<Movie>();
  set results(ListBuilder<Movie>? results) => _$this._results = results;

  ListBuilder<Cast>? _cast;
  ListBuilder<Cast> get cast => _$this._cast ??= new ListBuilder<Cast>();
  set cast(ListBuilder<Cast>? cast) => _$this._cast = cast;

  MovieListBuilder();

  MovieListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _results = $v.results.toBuilder();
      _cast = $v.cast.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieList;
  }

  @override
  void update(void Function(MovieListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieList build() {
    _$MovieList _$result;
    try {
      _$result = _$v ??
          new _$MovieList._(results: results.build(), cast: cast.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
        _$failedField = 'cast';
        cast.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
