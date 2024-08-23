abstract class StateController<T> {
  StateController();

  factory StateController.idle() {
    return Idle();
  }

  factory StateController.loading({T? data}) {
    return Loading(data);
  }

  factory StateController.success(T data) {
    return Success(data);
  }

  factory StateController.error({
    T? data,
    required String errorMessage,
    int? code,
  }) {
    return Error(errorMessage, code, data);
  }

  String? get inferredErrorMessage {
    final resource = this;

    if (resource is Error<T>) {
      return resource.errorMessage;
    }

    return null;
  }

  T? get inferredData {
    final resource = this;

    if (resource is Success<T>) {
      return resource.data;
    } else if (resource is Error<T>) {
      return resource.data;
    } else if (resource is Loading<T>) {
      return resource.data;
    }

    return null;
  }

  String get status {
    final resource = this;

    if (resource is Success<T>) {
      return StateController.statusSuccess;
    } else if (resource is Error<T>) {
      return StateController.statusError;
    } else if (resource is Loading<T>) {
      return StateController.statusLoading;
    }

    return StateController.statusIdle;
  }

  get isLoading => status == statusLoading;
  get isError => status == statusError;
  get isSuccess => status == statusSuccess;

  static const statusSuccess = "success";
  static const statusError = "error";
  static const statusLoading = "loading";
  static const statusIdle = "idle";
}

class Loading<T> extends StateController<T> {
  Loading(this.data);

  final T? data;
}

class Idle<T> extends StateController<T> {}

class Success<T> extends StateController<T> {
  Success(this.data);

  final T data;
}

class Error<T> extends StateController<T> {
  Error(this.errorMessage, this.code, this.data);

  final String errorMessage;
  final int? code;
  final T? data;

  @override
  String toString() => "$code: $errorMessage";
}
