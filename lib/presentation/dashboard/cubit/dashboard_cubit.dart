import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/dashboard_repository.dart';
import '../../../network/model/dashboard/dashboard_response.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {

  DashboardCubit() : super(DashboardInitial(DashboardResponse())){
    getDashboardData();
  }
  void getDashboardData()async{
    final DashboardRepository repository = DashboardRepository() ;
    try {
      emit(DashboardLoading(state.dashboardResponse));

      DashboardResponse response = (await repository.getDashboardResponse());

      emit(DashboardLoaded(response));
    } catch (e) {
      emit(Error(state.dashboardResponse));
    }
  }
}
