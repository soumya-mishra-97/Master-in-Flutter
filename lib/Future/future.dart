// Future:
/// Handles asynchronous data events.
/// Which provides a single asynchronous value.
/// Can be completed with then, await, or catchError.
/// Use Future when you expect a single value (e.g., API call).

Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Fetched data';
}

// Async & Await:
/// Async ->  Handles the asynchronous operation and returning a single future value.
/// Example: One-time data fetch like API call.
/// Future of values (Future<int>)
/// await: Waits & pause the execution for the future to complete.
Future<void> run() async {
  print('Loading...');
  await Future.delayed(const Duration(seconds: 1));
  print('Fetched data.');
  print('Processing data...');
  await Future.delayed(const Duration(seconds: 1));
  print('Done.');
}

// Future.delayed():
/// * Used to delay execution by a specific duration.
///It returns a Future that completes after the given time.
/// Use cases: Simulate a network delay, Timer-based logic, Animation integration.
Future<void> delayed() async {
  Future.delayed(const Duration(seconds: 2), () {
    print("Executed the code after 5 seconds");
    print('Executed');
  });
}

// Future.wait():
/// Used to wait for multiple futures to complete simultaneously, and
/// Returns a single future that completes when all of them are done.
/// Call multiple APIs at once and wait for all to complete before proceeding
/// Use Future.wait() because it's a one-time data fetch
Future<String> fetchUser() async {
  return Future.delayed(const Duration(seconds: 1), () => 'Users');
}

Future<String> fetchPost() async {
  return Future.delayed(const Duration(seconds: 3), () => 'Fetched Posts');
}

void waitTask() async {
  print('Fetching...');
  List<String> getResults = await Future.wait([fetchUser(), fetchPost()]);
  print(getResults);
}

// .then()
/// Executes after a Future completes successfully.
/// You get the result of the future.
/// If the Future throws an error -> It can handle errors with .catchError().
Future<String> fetchApiData() async {
  return 'Fetched Data';
}

// .whenComplete()
/// Executes after the Future completes, whether it success or failure. It always runs.
/// Always runs at the end, even if an error occurs.
/// Does not get access to the result or error — just notifies that the Future is done.
/// Used for cleanup operations, like hiding a loading spinner, closing dialogs etc..
Future<String> fetchedData() async {
  throw Exception('Failed');
}

Future<void> loadUser() async{
  print('Loading...');
  await fetchData()
      .then((value) => print('Success: $value'))
      .catchError((e) => print('Error: $e'))
      .whenComplete(() => print('Always runs'));
}

void main() {
  /*fetchData().then((value) {
    print('Future: $value');
  });*/

  //run();
  //delayed();
  //waitTask(); /// After 4 seconds output will be shown.
  /*fetchApiData().then((value){
    print('Data fetched successfully: $value');
  });*/
  loadUser();
}
