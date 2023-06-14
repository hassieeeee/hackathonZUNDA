// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gpt_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GptChat {
// 名前
  String get chatText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GptChatCopyWith<GptChat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GptChatCopyWith<$Res> {
  factory $GptChatCopyWith(GptChat value, $Res Function(GptChat) then) =
      _$GptChatCopyWithImpl<$Res, GptChat>;
  @useResult
  $Res call({String chatText});
}

/// @nodoc
class _$GptChatCopyWithImpl<$Res, $Val extends GptChat>
    implements $GptChatCopyWith<$Res> {
  _$GptChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatText = null,
  }) {
    return _then(_value.copyWith(
      chatText: null == chatText
          ? _value.chatText
          : chatText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GptChatCopyWith<$Res> implements $GptChatCopyWith<$Res> {
  factory _$$_GptChatCopyWith(
          _$_GptChat value, $Res Function(_$_GptChat) then) =
      __$$_GptChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String chatText});
}

/// @nodoc
class __$$_GptChatCopyWithImpl<$Res>
    extends _$GptChatCopyWithImpl<$Res, _$_GptChat>
    implements _$$_GptChatCopyWith<$Res> {
  __$$_GptChatCopyWithImpl(_$_GptChat _value, $Res Function(_$_GptChat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatText = null,
  }) {
    return _then(_$_GptChat(
      chatText: null == chatText
          ? _value.chatText
          : chatText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GptChat implements _GptChat {
  const _$_GptChat({required this.chatText});

// 名前
  @override
  final String chatText;

  @override
  String toString() {
    return 'GptChat(chatText: $chatText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GptChat &&
            (identical(other.chatText, chatText) ||
                other.chatText == chatText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GptChatCopyWith<_$_GptChat> get copyWith =>
      __$$_GptChatCopyWithImpl<_$_GptChat>(this, _$identity);
}

abstract class _GptChat implements GptChat {
  const factory _GptChat({required final String chatText}) = _$_GptChat;

  @override // 名前
  String get chatText;
  @override
  @JsonKey(ignore: true)
  _$$_GptChatCopyWith<_$_GptChat> get copyWith =>
      throw _privateConstructorUsedError;
}
