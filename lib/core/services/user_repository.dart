import 'dart:developer';

import 'package:book_hive/core/models/rewards_model/reward_model.dart';
import 'package:book_hive/core/models/user_model/user_model.dart';
import 'package:book_hive/core/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> createUser(UserModel userModel, String? uid) async {
    try {
      final collection = _firestore.collection('users');
      final updatedUser = userModel.copyWith(id: uid);
      await collection.doc(uid).set(updatedUser.toJson()).whenComplete(() {
        log('here the account is created');
      });
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> bookLendedHistory(
      String? uid, BookLendedHistory? lendedBook) async {
    if (uid == null) {
      return 'User id is null';
    }
    try {
      final collection = _firestore
          .collection('users')
          .doc(uid)
          .collection('bookLendedHistory');
      await collection.add(lendedBook!.toJson());
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<void> requestBookLendHistory(
      String? uid, BookLendedHistory? bookLendedHistory) async {
    try {
      final collection = _firestore.collection('bookLog');

      final String docId = DateTime.now().millisecondsSinceEpoch.toString();

      final updatedBookLendedHistory =
          bookLendedHistory?.copyWith(bookLendId: docId, studentId: uid);

      if (updatedBookLendedHistory != null) {
        await collection
            .doc(docId)
            .set(updatedBookLendedHistory.toJson())
            .whenComplete(() async {
          final userDocRef = _firestore.collection('users').doc(uid);

          // Update borrowedBookList by adding the new docId
          await userDocRef.update({
            'borrowedBookList': FieldValue.arrayUnion([docId])
          });

          final bookDocRef = _firestore
              .collection('books')
              .doc('zEkjsYhBxZMjcmNkQ1ZH')
              .collection('bookList')
              .doc(updatedBookLendedHistory.bookId)
              .collection('bookStatusDetail')
              .doc(updatedBookLendedHistory.bookNumber);

          await bookDocRef
              .update({'bookStatus': LibraryBookStatus.unavailable});

          log('Book lended history added and borrowedBookList updated successfully.');
        });
      }
      log('Book lended history added successfully.');
    } catch (e) {
      log('Error adding book lended history: $e');
    }
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      final collection = _firestore.collection('users');
      final doc = await collection.doc(uid).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> updateFavoriteBook({
    String? bookId,
    String? uid,
    required bool isFavorite,
  }) async {
    try {
      final collection = _firestore.collection('users').doc(uid);

      await _firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(collection);

        if (!snapshot.exists) {
          throw Exception("User document not found");
        }

        List<String> favorites =
            List<String>.from(snapshot.data()?['favourites'] ?? []);

        if (isFavorite) {
          if (!favorites.contains(bookId)) {
            favorites.add(bookId!);
          }
        } else {
          favorites.remove(bookId);
        }

        transaction.update(collection, {'favourites': favorites});
      });

      log('Favorites updated successfully');
    } catch (e) {
      log('Error updating favorites: $e');
    }
  }

  Future<UserModel?> getUserById(String? uid) async {
    try {
      final docSnapshot = await _firestore.collection('users').doc(uid).get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        final data = UserModel.fromJson(docSnapshot.data()!);
        log('here the data is $data');
        return data;
      }

      return null;
    } catch (e) {
      log('Error getting user: $e');
      return null;
    }
  }

  Future<void> addRewards(List<RewardModel>? models) async {
    try {
      final collection = _firestore.collection('rewards');
      for (var model in models!) {
        final updatedModel = model.copyWith(
            id: DateTime.now().millisecondsSinceEpoch.toString());
        await collection.doc(updatedModel.id).set(updatedModel.toJson());
      }
      log('Rewards added successfully');
    } catch (e) {
      log('Error adding rewards: $e');
    }
  }

  Future<List<RewardModel>?> getRewards() async {
    try {
      final collection = _firestore.collection('rewards');
      final querySnapshot = await collection.get();
      return querySnapshot.docs
          .map((doc) => RewardModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      log('Error fetching rewards: $e');
      return null;
    }
  }

  Future<void> claimReward(
      String? uid, String? rewardId, RewardClaim? rewardClaim) async {
    if (rewardClaim == null || rewardId == null) {
      log('Reward claim user or reward ID is null');
      return;
    }
    try {
      final claimId = DateTime.now().millisecondsSinceEpoch.toString();
      final collection = _firestore
          .collection('rewards')
          .doc(rewardId)
          .collection('claimedBy');
      await collection.doc(claimId).set(rewardClaim.toJson()).whenComplete(() {
        log('Reward claimed successfully with ID: $claimId');
      });
      final data = await _firestore.collection('users').doc(uid).get();
      if (data.exists) {
        final user = UserModel.fromJson(data.data()!);

        if (user.rewardPoints != null && user.rewardPoints != 0) {
          await _firestore.collection('users').doc(uid).update({
            'rewardPoints':
                user.rewardPoints! - (rewardClaim.rewardPoints ?? 0),
          });
        }
      } else {
        log('User not found');
      }
    } catch (e) {
      log('Error claiming reward: $e');
    }
  }

  Future<bool?> checkClaimable(String? uid, String? rewardId) async {
    if (rewardId == null) {
      log('Reward ID is null');
      return false;
    }
    try {
      final collection = _firestore
          .collection('rewards')
          .doc(rewardId)
          .collection('claimedBy')
          .where('userId', isEqualTo: uid);
      final docSnapshot = await collection.get();
      final isClaimable = docSnapshot.docs.isEmpty;
      return isClaimable;
    } catch (e) {
      log('Error checking claimable status: $e');
      return false;
    }
  }

  Future<List<RewardClaim>?> getRewardClaimById(String? rewardId) async {
    if (rewardId == null) {
      log('Reward ID or Claim ID is null');
      return null;
    }
    try {
      final docSnapshot = await _firestore
          .collection('rewards')
          .doc(rewardId)
          .collection('claimedBy')
          .where('claimStatus', isEqualTo: RewardStatus.pending)
          .get();
      if (docSnapshot.docs.isNotEmpty) {
        final claims = docSnapshot.docs
            .map((doc) => RewardClaim.fromJson(doc.data()))
            .toList();
        return claims;
      } else {
        log('Claim not found');
        return [];
      }
    } catch (e) {
      log('Error fetching reward claim: $e');
      return null;
    }
  }

  Future<void> grantRewardClaim(String? rewardId, String? claimId) async {
    if (rewardId == null || claimId == null) {
      log('Reward ID or Claim ID is null');
      return;
    }
    try {
      await _firestore
          .collection('rewards')
          .doc(rewardId)
          .collection('claimedBy')
          .doc(claimId)
          .update({'claimStatus': RewardStatus.approved});
    } catch (e) {
      log('Error granting reward claim: $e');
    }
  }

  Future<void> rejectRewardClaim(String? rewardId, String? claimId, String? uid,
      double? rewardPoint) async {
    if (rewardId == null || claimId == null || uid == null) {
      log('Reward ID, Claim ID or User ID is null');
      return;
    }
    try {
      log('here the reward is $rewardId , claim is $claimId, user is $uid');
      await _firestore
          .collection('rewards')
          .doc(rewardId)
          .collection('claimedBy')
          .doc(claimId)
          .update({'claimStatus': RewardStatus.rejected});

      final userData = await _firestore.collection('users').doc(uid).get();
      final userPoints = UserModel.fromJson(userData.data()!).rewardPoints;
      if (userPoints != null &&
          userPoints >= rewardPoint! &&
          (userPoints + rewardPoint) < 100) {
        await _firestore.collection('users').doc(uid).update({
          'rewardPoints': userPoints + rewardPoint,
        });
        log('new reward point is ${userPoints + rewardPoint}');
      } else {
        log('User does not have enough points to reject claim');
      }
    } catch (e) {
      log('Error rejecting reward claim: $e');
    }
  }
}
