import 'package:bloc/bloc.dart';
import 'package:bloc_sample/model/dummy_api_model.dart';
import 'package:bloc_sample/services/api_repository.dart';
import 'package:meta/meta.dart';

part 'ecom_event.dart';
part 'ecom_state.dart';

class EcomBloc extends Bloc<EcomEvent, EcomState> {
  final ApiRepository apiRepository;

  EcomBloc(this.apiRepository) : super(ProductInitialState()) {
    on<LoadProduct>((event, emit) async {
      emit(ProductLoadingState());

      try {
        final product = await apiRepository.fetchProduct();

        emit(ProductLoadedState(product));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
