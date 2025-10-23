{ pkgs, ... }:

{
  dotenv.enable = true;
  env.ANSIBLE_INVENTORY_ANY_UNPARSED_IS_FAILED = true;
  languages.ansible.enable = true;

  packages = with pkgs; [
    git
  ];

  scripts.run.exec = ''
    ansible-playbook playbook.yaml "$@"
  '';

  scripts.install.exec = ''
    ansible-galaxy collection install -r requirements.yaml
  '';
}
