// ignore_for_file: must_be_immutable

part of 'dashboard_cubit.dart';

@immutable
abstract class DashboardState {
  DashboardResponse dashboardResponse;
  DashboardState(this.dashboardResponse);
}

class DashboardInitial extends DashboardState {
  DashboardInitial(super.dashboardResponse);
}
class DashboardLoading extends DashboardState {
  DashboardLoading(super.dashboardResponse);
}
class DashboardLoaded extends DashboardState {
  DashboardLoaded(super.dashboardResponse);
}
class Error extends DashboardState {
  Error(super.dashboardResponse);
}
