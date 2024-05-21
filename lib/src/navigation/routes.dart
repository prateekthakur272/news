enum Routes{
  home('home'),
  settings('settings'),
  signUp('sign-up'),
  article('article');


  final String name;
  const Routes(this.name);
}