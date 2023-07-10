import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/controller/keepCoin_store.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/data/use_cases/keepCoin_create_use_case_impl.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/data/use_cases/keepCoin_delete_use_case_impl.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/data/use_cases/keepCoin_get_all_use_case_impl.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/data/use_cases/keepCoin_read_use_case_impl.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/data/use_cases/keepCoin_update_use_case_impl.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/services/keepCoin_service_impl.dart';
import 'package:login_with_firebase/app/modules/my_application/src/views/adicionar_conversao_page.dart';
import 'package:login_with_firebase/app/modules/my_application/src/views/detalhe_conversao_page.dart';
import 'package:login_with_firebase/app/modules/my_application/src/views/editar_conversao_page.dart';
import 'package:login_with_firebase/app/modules/my_application/src/views/listar_conversoes_page.dart';

import 'src/authentication/data/use_cases/auth_signin_user_case_impl.dart';
import 'src/authentication/data/use_cases/auth_signout_user_case_impl.dart';
import 'src/authentication/data/use_cases/auth_signup_user_case_impl.dart';
import 'src/authentication/domain/user_credencial_entity.dart';
import 'src/authentication/external/cache/auth_local_cache_sp_impl.dart';
import 'src/authentication/external/services/email_auth_service_impl.dart';
import 'src/authentication/manager/auth_service_manager.dart';
import 'src/authentication/presenter/controller/auth_store.dart';
import 'src/views/home_page.dart';
import 'src/views/signin_view.dart';
import 'src/views/signup_view.dart';

class MyApplication extends Module {
  @override
  List<Bind> binds = [
    Bind.lazySingleton((i) => AuthServiceManager(AuthType.email)),
    Bind.lazySingleton((i) => EmailAuthServiceImpl()),
    Bind.singleton((i) => AuthLocalCacheSharedPrefsImpl(i())),
    //   Bind.lazySingleton((i) => AuthLocalCacheSharedPrefsImpl()),
    Bind.lazySingleton((i) => AuthSignInUserCaseImpl(i())),
    Bind.lazySingleton((i) => AuthSignOutUserCaseImpl(i())),
    Bind.lazySingleton((i) => AuthSignUpUserCaseImpl(i())),

    Bind.lazySingleton((i) => KeepCoinServiceImpl()),
    Bind.lazySingleton((i) => KeepCoinCreateUseCaseImpl(i())),
    Bind.lazySingleton((i) => KeepCoinDeleteUseCaseImpl(i())),
    Bind.lazySingleton((i) => KeepCoinGetAllUseCaseImpl(i())),
    Bind.lazySingleton((i) => KeepCoinReadUseCaseImpl(i())),
    Bind.lazySingleton((i) => KeepCoinUpdateUseCaseImpl(i())),
    Bind.singleton<AuthStore>(
          (i) => AuthStore(
        userSignIn: i(),
        userSignOut: i(),
        userSignUp: i(),
        localCache: i(),
      ),
      onDispose: (store) => store.destroy,
      selector: (store) => store.state,
    ),
    Bind.singleton<KeepCoinStore>(
          (i) => KeepCoinStore(
        create: i(),
        delete: i(),
        getAll: i(),
        read: i(),
        update: i(),
        authStore: i(),
      ),
      onDispose: (store) => store.destroy,
      selector: (store) => store.state,
    ),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (ctx, args) => const Home()),
    ChildRoute(
      '/signin-page',
      child: (context, args) => SignInPage(),
    ),
    ChildRoute(
      '/signup-page',
      child: (context, args) => SignUpPage(),
    ),
    ChildRoute(
      '/adicionarConversao',
      child: (context, args) => SignInPage(),
    ),
    ChildRoute(
      '/minhasConversoes',
      child: (context, args) => ListarConversoes(),
    ),
    ChildRoute(
      '/detalheConversao',
      child: (context, args) => DetalheConversao(conversaoId: args.data),
    ),
    ChildRoute(
      '/editarConversao',
      child: (context, args) => EditarConversao(conversaoId: args.data),
    ),
  ];
}
