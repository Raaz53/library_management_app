import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/auth_services.dart';

part 'check_claimable_cubit.freezed.dart';
part 'check_claimable_state.dart';

class CheckClaimableCubit extends Cubit<CheckClaimableState> {
  CheckClaimableCubit() : super(const CheckClaimableState.initial());

  Future<void> rewardClaimable(String? rewardId) async {
    try {
      // Simulate checking if rewards are claimable
      final bool? claimable = await AuthService.checkClaimable(rewardId);
      emit(CheckClaimableState.success(claimable));
    } catch (e) {
      emit(CheckClaimableState.error(e.toString()));
    }
  }
}
