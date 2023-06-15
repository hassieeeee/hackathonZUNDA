// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speech_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SpeechText {
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpeechTextCopyWith<SpeechText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeechTextCopyWith<$Res> {
  factory $SpeechTextCopyWith(
          SpeechText value, $Res Function(SpeechText) then) =
      _$SpeechTextCopyWithImpl<$Res, SpeechText>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class _$SpeechTextCopyWithImpl<$Res, $Val extends SpeechText>
    implements $SpeechTextCopyWith<$Res> {
  _$SpeechTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpeechTextCopyWith<$Res>
    implements $SpeechTextCopyWith<$Res> {
  factory _$$_SpeechTextCopyWith(
          _$_SpeechText value, $Res Function(_$_SpeechText) then) =
      __$$_SpeechTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$_SpeechTextCopyWithImpl<$Res>
    extends _$SpeechTextCopyWithImpl<$Res, _$_SpeechText>
    implements _$$_SpeechTextCopyWith<$Res> {
  __$$_SpeechTextCopyWithImpl(
      _$_SpeechText _value, $Res Function(_$_SpeechText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$_SpeechText(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SpeechText implements _SpeechText {
  const _$_SpeechText({required this.content});

  @override
  final String content;

  @override
  String toString() {
    return 'SpeechText(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpeechText &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpeechTextCopyWith<_$_SpeechText> get copyWith =>
      __$$_SpeechTextCopyWithImpl<_$_SpeechText>(this, _$identity);
}

abstract class _SpeechText implements SpeechText {
  const factory _SpeechText({required final String content}) = _$_SpeechText;

  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_SpeechTextCopyWith<_$_SpeechText> get copyWith =>
      throw _privateConstructorUsedError;
}
