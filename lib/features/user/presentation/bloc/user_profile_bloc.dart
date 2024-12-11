import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:ai_connect/features/user/domain/usecases/create_user_profile_ucase.dart';
import 'package:ai_connect/features/user/domain/usecases/fetch_user_profile_ucase.dart';
import 'package:ai_connect/features/user/domain/usecases/set_user_profile_img_ucase.dart';
import 'package:ai_connect/features/user/domain/usecases/update_user_profile_ucase.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_events.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBloc extends Bloc<UserProfileEvents, UserProfileStatus> {
  final CreateUserProfileUCase createUserProfileUCase;
  final FetchUserProfileUcase fetchUserProfileUcase;
  final SetUserProfileImgUcase setUserProfileImgUcase;
  final UpdateUserProfileUcase updateUserProfileUcase;

  UserProfileBloc({
    required this.createUserProfileUCase,
    required this.fetchUserProfileUcase,
    required this.setUserProfileImgUcase,
    required this.updateUserProfileUcase,
  }) : super(UserProfileInitialState()) {
    on<UserProfileCreateEvent>(onCreateUserProfileEvent);
    on<UserProfileFetchEvent>(onFetchUserProfileEvent);
    on<UserProfileUpdateEvent>(onUpdateUserProfileEvent);
    on<UserProfileSetImgEvent>(onSetUserProfileImgEvent);
  }

  static UserProfileBloc get(context) => BlocProvider.of(context);
  bool shouldFetch = true;
  UserEntity user = UserEntity();

  onCreateUserProfileEvent(
    UserProfileCreateEvent event,
    Emitter<UserProfileStatus> emit,
  ) async {
    emit(UserProfileLoadingState());
    final result = await createUserProfileUCase.call(user: event.user);
    result.fold((error) {
      final errorMsg = error.message;
      emit(UserProfileFailureState(errorMsg: errorMsg));
    }, (user) {
      this.user = user;
      emit(UserProfileCreateState(user: user));
    });
  }

  onFetchUserProfileEvent(
    UserProfileFetchEvent event,
    Emitter<UserProfileStatus> emit,
  ) async {
    if (!shouldFetch) return;
    emit(UserProfileLoadingState());
    final result = await fetchUserProfileUcase.call();
    result.fold((error) {
      final errorMsg = error.message;
      debugPrint("Fetch User Event Error: $errorMsg");
      emit(UserProfileFailureState(errorMsg: errorMsg));
    }, (user) {
      this.user = user;
      emit(UserProfileFetchState(user: user));
    });
  }

  onUpdateUserProfileEvent(
    UserProfileUpdateEvent event,
    Emitter<UserProfileStatus> emit,
  ) async {
    emit(UserProfileLoadingState());
    final result = await updateUserProfileUcase.call(user: event.user);
    result.fold((error) {
      final errorMsg = error.message;
      emit(UserProfileFailureState(errorMsg: errorMsg));
    }, (user) {
      this.user = user;
      emit(UserProfileUpdateState(user: user));
    });
  }

  onSetUserProfileImgEvent(
    UserProfileSetImgEvent event,
    Emitter<UserProfileStatus> emit,
  ) async {
    emit(UserProfileLoadingState());
    final result = await setUserProfileImgUcase.call(
      imgFile: event.imgFile,
    );
    result.fold((error) {
      final errorMsg = error.message;
      emit(UserProfileFailureState(errorMsg: errorMsg));
    }, (url) {
      emit(UserProfileSetImgState(imgUrl: url));
    });
  }
}
