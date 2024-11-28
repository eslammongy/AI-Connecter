import 'dart:io';

import 'package:ai_connect/core/datasource/supabase_client.dart';
import 'package:ai_connect/features/user/data/models/user_model.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String tblName = "profiles";

class DbDataSource {
  final AppSupabaseClient supabaseClient;

  DbDataSource({required this.supabaseClient});

  Future<void> createUserProfile({required UserEntity user}) async {
    final userJson = (user as UserModel).toMap();
    return await supabaseClient.instance.from(tblName).insert(userJson);
  }

  Future<void> updateUserProfile({required UserEntity user}) async {
    final userJson = (user as UserModel).toMap();
    return await supabaseClient.instance
        .from(tblName)
        .update(userJson)
        .eq('uuid', user.id!);
  }

  Future<PostgrestResponse<PostgrestList>> fetchUserProfile({
    required String userId,
  }) async {
    return await supabaseClient.instance
        .from(tblName)
        .select()
        .eq('uuid', userId)
        .count(CountOption.exact);
  }

  Future<String> setUserProfileImg(
      {required File imgFile, required String userName}) async {
    final String uploadPath = 'profile_images/${userName}profile_img';
    return await supabaseClient.instance.storage
        .from('usersImg')
        .upload(uploadPath, imgFile);
  }
}
