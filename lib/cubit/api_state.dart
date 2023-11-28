part of 'api_cubit.dart';

enum GoogleApiStatus {
  initial,
  submitting,
  success,
  loading,
  loaded,
  error,
}

class GoogleApiState extends Equatable {
  final GoogleAddressApi googleAddressApi;
  final GoogleApiStatus googleApiStatus;
  final bool isTap;
  GoogleApiState(
      {required this.isTap,
      required this.googleApiStatus,
      required this.googleAddressApi});
  factory GoogleApiState.initial() {
    return GoogleApiState(
        googleAddressApi: GoogleAddressApi(),
        googleApiStatus: GoogleApiStatus.initial,
        isTap: false);
  }
  GoogleApiState copyWith(
      {GoogleAddressApi? googleApiState,
      bool? isTap,
      GoogleApiStatus? googleApiStatus}) {
    return GoogleApiState(
        isTap: isTap ?? this.isTap,
        googleAddressApi: googleApiState ?? this.googleAddressApi,
        googleApiStatus: googleApiStatus ?? this.googleApiStatus);
  }

  @override
  // TODO: implement props
  List<Object> get props {
    return [googleAddressApi, googleApiStatus, isTap];
  }
}
