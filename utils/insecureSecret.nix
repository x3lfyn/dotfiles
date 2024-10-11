{
  age,
  writeShellScript,
  system,
  ...
}: {
  getInsecure = name: let
    identityPath = /etc/agenix/agenix-insecure;

    path = ../secrets + "/${name}.insecure.age";
    drv = builtins.derivation {
      system = system;
      name = name;
      src = path;
      builder = writeShellScript "read-${name}.sh" ''
        ${age}/bin/age --decrypt --identity ${identityPath} $src > $out
      '';
    };
  in
    builtins.readFile drv;
}
