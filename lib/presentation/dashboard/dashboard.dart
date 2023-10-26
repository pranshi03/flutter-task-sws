import 'package:firebase_auth/firebase_auth.dart';
import '../../common_libs.dart';
import '../../services/auth_services.dart';
import '../auth/login.dart';
import '../auth/widgets.dart';
import 'cubit/dashboard_cubit.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: Scaffold(
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                      if(state is DashboardLoading){
                        return Center(child: CircularProgressIndicator());
                      }
                      else if(state is DashboardLoaded){
                        return ListView.builder(
                          itemCount: state.dashboardResponse.result?.length,
                          itemBuilder: (context, index) {
                            var data = state.dashboardResponse.result?[index];


                            return RefreshIndicator(

                              onRefresh: () {
                                return Future.delayed(
                                    const Duration(seconds: 1), () {
                                  BlocProvider.of<DashboardCubit>(context)
                                      .getDashboardData();
                                });
                              },
                              child:ListTile(
                                leading: ClipOval(
                                  child: Image.network(
                                    data?.firstImage ?? '',
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data?.userId?.fullName ?? '',
                                      style: TextStyle(
                                          fontFamily: Fonts.AvenirNextLTProBold,
                                          fontSize: 20,
                                          color: CLR.black),
                                    ),
                                    Text(data?.firstLabel ?? ''),
                                  ],
                                ),
                              ),
                            );



                          },
                        );
                      } else{
                        return Center(child: Text("No data Found"));
                      }

                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                LoginButton(
                  img: ImagePaths.signOutLogo,
                  text: "SignOut",
                  function: () async {
                    try {
                      authServices.signOutFromGoogle().then((value) =>
                      {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        )
                      });
                    } catch (e) {
                      if (e is FirebaseAuthException) {
                        print(e.message!);
                      }
                    }
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
