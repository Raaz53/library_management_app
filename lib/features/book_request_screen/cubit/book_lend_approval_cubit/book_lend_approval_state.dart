part of 'book_lend_approval_cubit.dart';

@Freezed(equal: false)
class BookLendApprovalState with _$BookLendApprovalState {
  const factory BookLendApprovalState.initial() = _Initial;
  const factory BookLendApprovalState.loading() = _Loading;
  const factory BookLendApprovalState.accept() = _Accept;
  const factory BookLendApprovalState.decline() = _Decline;
  const factory BookLendApprovalState.error(String? message) = _Error;
}
