import 'dart:developer';

import 'package:book_hive/core/models/rewards_model/reward_model.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_repository.dart';

class CustomUserModel {
  final User? user;
  final String? uid;

  CustomUserModel({this.user, this.uid});
}

class AuthService {
  AuthService._();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final _userRepo = UserRepository();

  static Future<CustomUserModel?> createUserWithEmailAndPassword(
      UserModel userModel, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: password,
      );
      final uid = userCredential.user?.uid;

      await _userRepo.createUser(userModel, uid);

      return CustomUserModel(user: userCredential.user, uid: uid);
    } catch (e) {
      log('Error creating user: ${e.toString()}');
      return null;
    }
  }

  static Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      log('Error signing in: ${e.toString()}');
      return null;
    }
  }

  static getCurrentUserId() {
    return _auth.currentUser!.uid;
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log('Error signing out: ${e.toString()}');
    }
  }

  static getUserDetails(String uid) async {
    try {
      final user = await _userRepo.getUser(uid);
      return user;
    } catch (e) {
      log('Error getting user details: ${e.toString()}');
      return null;
    }
  }

  static updateFavoriteList(String bookId, bool isFavorite) async {
    try {
      final user = _auth.currentUser;
      await _userRepo.updateFavoriteBook(
          bookId: bookId, uid: user?.uid, isFavorite: isFavorite);
      return 'success';
    } catch (e) {
      log('here the update has failed');
    }
  }

  static requestBookLend(BookLendedHistory? bookLendedHistory) async {
    try {
      final user = _auth.currentUser;
      await _userRepo.requestBookLendHistory(user?.uid, bookLendedHistory);
      return 'success';
    } catch (e) {
      log('here the request book is throwing error');
    }
  }

  static getUserById(String? userId) async {
    try {
      final user = await _userRepo.getUserById(userId);
      return user;
    } catch (e) {
      log('error fetching user by id');
    }
  }

  static addReward(List<RewardModel>? models) async {
    try {
      await _userRepo.addRewards(models);
      return 'success';
    } catch (e) {
      log('Error adding rewards: ${e.toString()}');
      return e.toString();
    }
  }

  static getRewards() async {
    try {
      final data = await _userRepo.getRewards();
      return data;
    } catch (e) {
      log('Error fetching rewards: ${e.toString()}');
      return e.toString();
    }
  }

  static claimReward(String? rewardId, RewardClaim? rewardClaim) async {
    try {
      final uid = _auth.currentUser?.uid;
      await _userRepo.claimReward(uid, rewardId, rewardClaim);
      return 'success';
    } catch (e) {
      log('Error claiming reward: ${e.toString()}');
      return e.toString();
    }
  }

  static checkClaimable(String? rewardId) async {
    try {
      final uid = _auth.currentUser?.uid;
      final claimable = await _userRepo.checkClaimable(uid, rewardId);
      return claimable;
    } catch (e) {
      log('Error checking claimable: ${e.toString()}');
      return e.toString();
    }
  }

  static getRewardClaimById(String? rewardId) async {
    try {
      final claim = await _userRepo.getRewardClaimById(rewardId);
      return claim;
    } catch (e) {
      log('Error fetching reward claim by ID: ${e.toString()}');
      return e.toString();
    }
  }

  static grantRewardClaim(
    String? rewardId,
    String? claimerId,
  ) async {
    try {
      await _userRepo.grantRewardClaim(
        rewardId,
        claimerId,
      );
      log('Reward claim granted successfully');
      return 'success';
    } catch (e) {
      log('Error granting reward claim: ${e.toString()}');
      return e.toString();
    }
  }

  static rejectRewardClaim(String? rewardId, String? claimerId, String? uid,
      double? rewardPoint) async {
    try {
      await _userRepo.rejectRewardClaim(rewardId, claimerId, uid, rewardPoint);

      log('Reward claim rejected successfully');
      return 'success';
    } catch (e) {
      log('Error rejecting reward claim: ${e.toString()}');
      return e.toString();
    }
  }
}
