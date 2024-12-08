import 'package:ai_connect/core/datasource/supabase_client.dart';
import 'package:ai_connect/features/user/data/models/user_model.dart';
import 'package:ai_connect/features/user/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String tblName = "profiles";

class DbDataSource {
  final AppSupabaseClient supabaseClient;

  DbDataSource({required this.supabaseClient});

  Future<void> createUserProfile({required UserEntity user}) async {
    final userJson = (user as UserModel).toMap();
    debugPrint("User JsonInfo: $userJson");
    return await supabaseClient.instance
        .from(tblName)
        .insert(userJson)
        .then((_) {
      debugPrint("User JsonInfo1: $userJson");
    });
  }

  Future<void> updateUserProfile({required UserEntity user}) async {
    final userJson = user.toModel.toMap() as Map;
    final userId = userJson.remove('id');

    debugPrint("User JsonInfo: $userJson");
    return await supabaseClient.instance
        .from(tblName)
        .update(userJson)
        .eq('id', userId);
  }

  Future<PostgrestResponse<PostgrestList>> fetchUserProfile() async {
    final userId = currentSession!.user.id;
    return await supabaseClient.instance
        .from(tblName)
        .select()
        .eq('id', userId)
        .count(CountOption.exact);
  }

  Session? get currentSession => supabaseClient.instance.auth.currentSession;
  Future<String> setUserProfileImg({
    required XFile imgFile,
  }) async {
    final userId = currentSession!.user.id;

    final String uploadPath = '/$userId/profile';
    final imgExtension = imgFile.path.split('.').last.toLowerCase();
    final imgBytes = await imgFile.readAsBytes();
    return await supabaseClient.instance.storage
        .from('profile_images')
        .uploadBinary(
          uploadPath,
          imgBytes,
          fileOptions: FileOptions(
              cacheControl: '3600',
              upsert: true,
              contentType: 'image/$imgExtension'),
        );
  }
}
