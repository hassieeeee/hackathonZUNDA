// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'GPTChat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GPTChat _$GPTChatFromJson(Map<String, dynamic> json) {
  return _GPTChat.fromJson(json);
}

/// @nodoc
mixin _$GPTChat {
//役割
  String get role => throw _privateConstructorUsedError; //内容
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GPTChatCopyWith<GPTChat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GPTChatCopyWith<$Res> {
  factory $GPTChatCopyWith(GPTChat value, $Res Function(GPTChat) then) =
      _$GPTChatCopyWithImpl<$Res, GPTChat>;
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class _$GPTChatCopyWithImpl<$Res, $Val extends GPTChat>
    implements $GPTChatCopyWith<$Res> {
  _$GPTChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GPTChatCopyWith<$Res> implements $GPTChatCopyWith<$Res> {
  factory _$$_GPTChatCopyWith(
          _$_GPTChat value, $Res Function(_$_GPTChat) then) =
      __$$_GPTChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class __$$_GPTChatCopyWithImpl<$Res>
    extends _$GPTChatCopyWithImpl<$Res, _$_GPTChat>
    implements _$$_GPTChatCopyWith<$Res> {
  __$$_GPTChatCopyWithImpl(_$_GPTChat _value, $Res Function(_$_GPTChat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_$_GPTChat(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GPTChat implements _GPTChat {
  const _$_GPTChat({required this.role, required this.content});

  factory _$_GPTChat.fromJson(Map<String, dynamic> json) =>
      _$$_GPTChatFromJson(json);

//役割
  @override
  final String role;
//内容
  @override
  final String content;

  @override
  String toString() {
    return 'GPTChat(role: $role, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GPTChat &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GPTChatCopyWith<_$_GPTChat> get copyWith =>
      __$$_GPTChatCopyWithImpl<_$_GPTChat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GPTChatToJson(
      this,
    );
  }
}

abstract class _GPTChat implements GPTChat {
  const factory _GPTChat(
      {required final String role, required final String content}) = _$_GPTChat;

  factory _GPTChat.fromJson(Map<String, dynamic> json) = _$_GPTChat.fromJson;

  @override //役割
  String get role;
  @override //内容
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_GPTChatCopyWith<_$_GPTChat> get copyWith =>
      throw _privateConstructorUsedError;
}
