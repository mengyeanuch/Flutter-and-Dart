enum AsyncStatus { notstarted, loading, success, error }

class AsyncData<T> {
  final AsyncStatus status;
  final T? value;
  final String? error;

  const AsyncData.success(this.value)
    : status = AsyncStatus.success,
      error = null;

  const AsyncData.error(this.error) : status = AsyncStatus.error, value = null;

  const AsyncData.notstarted()
    : status = AsyncStatus.notstarted,
      value = null,
      error = null;

  const AsyncData.loading()
    : status = AsyncStatus.loading,
      value = null,
      error = null;

  bool get isLoading => status == AsyncStatus.loading;

  bool get hasData => status == AsyncStatus.success;

  bool get hasError => status == AsyncStatus.error;
}
