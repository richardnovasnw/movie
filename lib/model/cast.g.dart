// GENERATED CODE - DO NOT MODIFY BY HAND

part of cast;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Cast> _$castSerializer = new _$CastSerializer();

class _$CastSerializer implements StructuredSerializer<Cast> {
  @override
  final Iterable<Type> types = const [Cast, _$Cast];
  @override
  final String wireName = 'Cast';

  @override
  Iterable<Object?> serialize(Serializers serializers, Cast object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.backdropPath;
    if (value != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.voteAverage;
    if (value != null) {
      result
        ..add('vote_average')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.releaseDate;
    if (value != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genreIds;
    if (value != null) {
      result
        ..add('genre_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.originalName;
    if (value != null) {
      result
        ..add('original_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.popularity;
    if (value != null) {
      result
        ..add('popularity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.knownForDepartmant;
    if (value != null) {
      result
        ..add('known_for_department')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.character;
    if (value != null) {
      result
        ..add('character')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profilePath;
    if (value != null) {
      result
        ..add('profile_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.biography;
    if (value != null) {
      result
        ..add('biography')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homepage;
    if (value != null) {
      result
        ..add('homepage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Cast deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CastBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'original_name':
          result.originalName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'known_for_department':
          result.knownForDepartmant = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'character':
          result.character = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profile_path':
          result.profilePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'biography':
          result.biography = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'homepage':
          result.homepage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Cast extends Cast {
  @override
  final String? backdropPath;
  @override
  final double? voteAverage;
  @override
  final String? releaseDate;
  @override
  final BuiltList<int>? genreIds;
  @override
  final String? name;
  @override
  final String? title;
  @override
  final int? id;
  @override
  final String? originalName;
  @override
  final double? popularity;
  @override
  final String? knownForDepartmant;
  @override
  final int? order;
  @override
  final String? character;
  @override
  final String? profilePath;
  @override
  final String? biography;
  @override
  final String? homepage;

  factory _$Cast([void Function(CastBuilder)? updates]) =>
      (new CastBuilder()..update(updates)).build();

  _$Cast._(
      {this.backdropPath,
      this.voteAverage,
      this.releaseDate,
      this.genreIds,
      this.name,
      this.title,
      this.id,
      this.originalName,
      this.popularity,
      this.knownForDepartmant,
      this.order,
      this.character,
      this.profilePath,
      this.biography,
      this.homepage})
      : super._();

  @override
  Cast rebuild(void Function(CastBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CastBuilder toBuilder() => new CastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cast &&
        backdropPath == other.backdropPath &&
        voteAverage == other.voteAverage &&
        releaseDate == other.releaseDate &&
        genreIds == other.genreIds &&
        name == other.name &&
        title == other.title &&
        id == other.id &&
        originalName == other.originalName &&
        popularity == other.popularity &&
        knownForDepartmant == other.knownForDepartmant &&
        order == other.order &&
        character == other.character &&
        profilePath == other.profilePath &&
        biography == other.biography &&
        homepage == other.homepage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                backdropPath
                                                                    .hashCode),
                                                            voteAverage
                                                                .hashCode),
                                                        releaseDate.hashCode),
                                                    genreIds.hashCode),
                                                name.hashCode),
                                            title.hashCode),
                                        id.hashCode),
                                    originalName.hashCode),
                                popularity.hashCode),
                            knownForDepartmant.hashCode),
                        order.hashCode),
                    character.hashCode),
                profilePath.hashCode),
            biography.hashCode),
        homepage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Cast')
          ..add('backdropPath', backdropPath)
          ..add('voteAverage', voteAverage)
          ..add('releaseDate', releaseDate)
          ..add('genreIds', genreIds)
          ..add('name', name)
          ..add('title', title)
          ..add('id', id)
          ..add('originalName', originalName)
          ..add('popularity', popularity)
          ..add('knownForDepartmant', knownForDepartmant)
          ..add('order', order)
          ..add('character', character)
          ..add('profilePath', profilePath)
          ..add('biography', biography)
          ..add('homepage', homepage))
        .toString();
  }
}

class CastBuilder implements Builder<Cast, CastBuilder> {
  _$Cast? _$v;

  String? _backdropPath;
  String? get backdropPath => _$this._backdropPath;
  set backdropPath(String? backdropPath) => _$this._backdropPath = backdropPath;

  double? _voteAverage;
  double? get voteAverage => _$this._voteAverage;
  set voteAverage(double? voteAverage) => _$this._voteAverage = voteAverage;

  String? _releaseDate;
  String? get releaseDate => _$this._releaseDate;
  set releaseDate(String? releaseDate) => _$this._releaseDate = releaseDate;

  ListBuilder<int>? _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int>? genreIds) => _$this._genreIds = genreIds;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _originalName;
  String? get originalName => _$this._originalName;
  set originalName(String? originalName) => _$this._originalName = originalName;

  double? _popularity;
  double? get popularity => _$this._popularity;
  set popularity(double? popularity) => _$this._popularity = popularity;

  String? _knownForDepartmant;
  String? get knownForDepartmant => _$this._knownForDepartmant;
  set knownForDepartmant(String? knownForDepartmant) =>
      _$this._knownForDepartmant = knownForDepartmant;

  int? _order;
  int? get order => _$this._order;
  set order(int? order) => _$this._order = order;

  String? _character;
  String? get character => _$this._character;
  set character(String? character) => _$this._character = character;

  String? _profilePath;
  String? get profilePath => _$this._profilePath;
  set profilePath(String? profilePath) => _$this._profilePath = profilePath;

  String? _biography;
  String? get biography => _$this._biography;
  set biography(String? biography) => _$this._biography = biography;

  String? _homepage;
  String? get homepage => _$this._homepage;
  set homepage(String? homepage) => _$this._homepage = homepage;

  CastBuilder();

  CastBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _backdropPath = $v.backdropPath;
      _voteAverage = $v.voteAverage;
      _releaseDate = $v.releaseDate;
      _genreIds = $v.genreIds?.toBuilder();
      _name = $v.name;
      _title = $v.title;
      _id = $v.id;
      _originalName = $v.originalName;
      _popularity = $v.popularity;
      _knownForDepartmant = $v.knownForDepartmant;
      _order = $v.order;
      _character = $v.character;
      _profilePath = $v.profilePath;
      _biography = $v.biography;
      _homepage = $v.homepage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cast other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Cast;
  }

  @override
  void update(void Function(CastBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Cast build() {
    _$Cast _$result;
    try {
      _$result = _$v ??
          new _$Cast._(
              backdropPath: backdropPath,
              voteAverage: voteAverage,
              releaseDate: releaseDate,
              genreIds: _genreIds?.build(),
              name: name,
              title: title,
              id: id,
              originalName: originalName,
              popularity: popularity,
              knownForDepartmant: knownForDepartmant,
              order: order,
              character: character,
              profilePath: profilePath,
              biography: biography,
              homepage: homepage);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genreIds';
        _genreIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Cast', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
