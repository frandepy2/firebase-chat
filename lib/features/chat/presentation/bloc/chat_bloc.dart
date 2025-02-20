import 'package:firebase_chat/features/chat/domain/usecases/chat_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUsecase usecase;

  ChatBloc({
    required this.usecase,
  }) : super(ChatState.initial()) {
    on<ChatEvent>(mapEventToState);
  }

  Future<void> mapEventToState(ChatEvent event, Emitter<ChatState> emit) {
    return event.map(sendMessage: (_SendMessage value) async {
      final response =
          await usecase.sendMessage(chatId: value.chatId, message: value.text);

      response.fold((error) {
        emit(state.copyWith(
            errorMessage: error.message, status: ChatStatus.error));
      }, (value) {
        emit(state.copyWith(status: ChatStatus.messagesLoaded));
      });
    });
  }
}
