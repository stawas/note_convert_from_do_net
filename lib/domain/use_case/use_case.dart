abstract class UseCase<Params, ReturnType> {
  ReturnType execute(Params params);
}

class NoParams {}
