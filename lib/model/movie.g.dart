// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object?> serialize(Serializers serializers, Movie object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.posterPath;
    if (value != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
    value = object.overview;
    if (value != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('original_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profilePath;
    if (value != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.revenue;
    if (value != null) {
      result
        ..add('revenue')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.runtime;
    if (value != null) {
      result
        ..add('runtime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.adult;
    if (value != null) {
      result
        ..add('adult')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.budget;
    if (value != null) {
      result
        ..add('budget')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.releaseDate;
    if (value != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.originalLanguage;
    if (value != null) {
      result
        ..add('original_language')
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
    value = object.voteCount;
    if (value != null) {
      result
        ..add('vote_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'original_title':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'backdrop_path':
          result.profilePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'revenue':
          result.revenue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'runtime':
          result.runtime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'budget':
          result.budget = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$Movie extends Movie {
  @override
  final String? posterPath;
  @override
  final int? id;
  @override
  final String? title;
  @override
  final double? voteAverage;
  @override
  final String? overview;
  @override
  final String? name;
  @override
  final String? profilePath;
  @override
  final int? revenue;
  @override
  final int? runtime;
  @override
  final String? status;
  @override
  final bool? adult;
  @override
  final int? budget;
  @override
  final String? releaseDate;
  @override
  final String? originalLanguage;
  @override
  final double? popularity;
  @override
  final int? voteCount;

  factory _$Movie([void Function(MovieBuilder)? updates]) =>
      (new MovieBuilder()..update(updates)).build();

  _$Movie._(
      {this.posterPath,
      this.id,
      this.title,
      this.voteAverage,
      this.overview,
      this.name,
      this.profilePath,
      this.revenue,
      this.runtime,
      this.status,
      this.adult,
      this.budget,
      this.releaseDate,
      this.originalLanguage,
      this.popularity,
      this.voteCount})
      : super._();

  @override
  Movie rebuild(void Function(MovieBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        posterPath == other.posterPath &&
        id == other.id &&
        title == other.title &&
        voteAverage == other.voteAverage &&
        overview == other.overview &&
        name == other.name &&
        profilePath == other.profilePath &&
        revenue == other.revenue &&
        runtime == other.runtime &&
        status == other.status &&
        adult == other.adult &&
        budget == other.budget &&
        releaseDate == other.releaseDate &&
        originalLanguage == other.originalLanguage &&
        popularity == other.popularity &&
        voteCount == other.voteCount;
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
                                                                $jc(
                                                                    0,
                                                                    posterPath
                                                                        .hashCode),
                                                                id.hashCode),
                                                            title.hashCode),
                                                        voteAverage.hashCode),
                                                    overview.hashCode),
                                                name.hashCode),
                                            profilePath.hashCode),
                                        revenue.hashCode),
                                    runtime.hashCode),
                                status.hashCode),
                            adult.hashCode),
                        budget.hashCode),
                    releaseDate.hashCode),
                originalLanguage.hashCode),
            popularity.hashCode),
        voteCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('posterPath', posterPath)
          ..add('id', id)
          ..add('title', title)
          ..add('voteAverage', voteAverage)
          ..add('overview', overview)
          ..add('name', name)
          ..add('profilePath', profilePath)
          ..add('revenue', revenue)
          ..add('runtime', runtime)
          ..add('status', status)
          ..add('adult', adult)
          ..add('budget', budget)
          ..add('releaseDate', releaseDate)
          ..add('originalLanguage', originalLanguage)
          ..add('popularity', popularity)
          ..add('voteCount', voteCount))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie? _$v;

  String? _posterPath;
  String? get posterPath => _$this._posterPath;
  set posterPath(String? posterPath) => _$this._posterPath = posterPath;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  double? _voteAverage;
  double? get voteAverage => _$this._voteAverage;
  set voteAverage(double? voteAverage) => _$this._voteAverage = voteAverage;

  String? _overview;
  String? get overview => _$this._overview;
  set overview(String? overview) => _$this._overview = overview;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _profilePath;
  String? get profilePath => _$this._profilePath;
  set profilePath(String? profilePath) => _$this._profilePath = profilePath;

  int? _revenue;
  int? get revenue => _$this._revenue;
  set revenue(int? revenue) => _$this._revenue = revenue;

  int? _runtime;
  int? get runtime => _$this._runtime;
  set runtime(int? runtime) => _$this._runtime = runtime;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  bool? _adult;
  bool? get adult => _$this._adult;
  set adult(bool? adult) => _$this._adult = adult;

  int? _budget;
  int? get budget => _$this._budget;
  set budget(int? budget) => _$this._budget = budget;

  String? _releaseDate;
  String? get releaseDate => _$this._releaseDate;
  set releaseDate(String? releaseDate) => _$this._releaseDate = releaseDate;

  String? _originalLanguage;
  String? get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String? originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  double? _popularity;
  double? get popularity => _$this._popularity;
  set popularity(double? popularity) => _$this._popularity = popularity;

  int? _voteCount;
  int? get voteCount => _$this._voteCount;
  set voteCount(int? voteCount) => _$this._voteCount = voteCount;

  MovieBuilder();

  MovieBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _posterPath = $v.posterPath;
      _id = $v.id;
      _title = $v.title;
      _voteAverage = $v.voteAverage;
      _overview = $v.overview;
      _name = $v.name;
      _profilePath = $v.profilePath;
      _revenue = $v.revenue;
      _runtime = $v.runtime;
      _status = $v.status;
      _adult = $v.adult;
      _budget = $v.budget;
      _releaseDate = $v.releaseDate;
      _originalLanguage = $v.originalLanguage;
      _popularity = $v.popularity;
      _voteCount = $v.voteCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    final _$result = _$v ??
        new _$Movie._(
            posterPath: posterPath,
            id: id,
            title: title,
            voteAverage: voteAverage,
            overview: overview,
            name: name,
            profilePath: profilePath,
            revenue: revenue,
            runtime: runtime,
            status: status,
            adult: adult,
            budget: budget,
            releaseDate: releaseDate,
            originalLanguage: originalLanguage,
            popularity: popularity,
            voteCount: voteCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
