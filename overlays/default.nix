[
  (self: super: {
    fcitx-engines = super.fcitx5;
  })
  #############################################################################
  # nixops (unstable)
  # python cryptography bug forced me to upgrade
  #############################################################################
  # (self: super: {
  #   nixops = super.nixops.overrideAttrs (oldAttrs: rec {
  #     version = "unstable-2023-05-14"; # Update the date to match the current date or the date of the commit you are using
  #
  #     src = super.fetchFromGitHub {
  #       owner = "NixOS";
  #       repo = "nixops";
  #       rev = "fc9b55c55da62f949028143b974f67fdc7f40c8b";
  #       sha256 = "0f5r17rq3rf3ylp16cq50prn8qmfc1gwpqgqfj491w38sr5sspf8";
  #     };
  #   });
  # })
  # end nixops (unstable)

  #############################################################################
  # awscli2
  #############################################################################
  # (self: super:
  #   rec {
  #     python3 = with super; super.python3.override {
  #       packageOverrides = self: super: {
  #         botocore = super.botocore.overridePythonAttrs (oldAttrs: rec {
  #           version = "2.0.0dev25";
  #           src = fetchFromGitHub {
  #             owner = "boto";
  #             repo = "botocore";
  #             rev = "bf9a885fa0bc0bba0c3c806eeeb60d9ad5f3e069";
  #             sha256 = "1llshaxpnz9a7mw4kkz9msdgkzz3in5ws3rvd7l077ghj9jkfz9a";
  #           };
  #         });
  #         prompt_toolkit = super.prompt_toolkit.overridePythonAttrs (oldAttrs: rec {
  #           version = "2.0.10";
  #           src = oldAttrs.src.override {
  #             inherit version;
  #             sha256 = "1nr990i4b04rnlw1ghd0xmgvvvhih698mb6lb6jylr76cs7zcnpi";
  #           };
  #         });
  #       };
  #     };
  #
  #     pythonPackages = python3.pkgs;
  #
  #     awscli2 = with self; pythonPackages.buildPythonApplication rec {
  #       pname = "awscli";
  #       version = "2.0.21"; # N.B: if you change this, change botocore to a matching version too
  #
  #       src = fetchFromGitHub {
  #         owner = "aws";
  #         repo = "aws-cli";
  #         rev = version;
  #         sha256 = "1lxkdjsl3w9c621byy3gggadhfrw8xcw37x3xci9qszxqc10b467";
  #       };
  #
  #       postPatch = ''
  #         substituteInPlace setup.py --replace ",<0.16" ""
  #         substituteInPlace setup.py --replace "cryptography>=2.8.0,<=2.9.0" "cryptography>=2.8.0,<2.10"
  #       '';
  #
  #       # No tests included
  #       doCheck = false;
  #
  #       propagatedBuildInputs = with pythonPackages; [
  #         bcdoc
  #         botocore
  #         colorama
  #         cryptography
  #         docutils
  #         groff
  #         less
  #         prompt_toolkit
  #         pyyaml
  #         rsa
  #         ruamel_yaml
  #         s3transfer
  #         six
  #       ];
  #
  #       postInstall = ''
  #         mkdir -p $out/etc/bash_completion.d
  #         echo "complete -C $out/bin/aws_completer aws" > $out/etc/bash_completion.d/awscli
  #         mkdir -p $out/share/zsh/site-functions
  #         mv $out/bin/aws_zsh_completer.sh $out/share/zsh/site-functions
  #         rm $out/bin/aws.cmd
  #       '';
  #
  #       passthru.python3 = python3; # for aws_shell
  #
  #       meta = with super.lib; {
  #         homepage = "https://aws.amazon.com/cli/";
  #         description = "Unified tool to manage your AWS services";
  #         license = licenses.asl20;
  #         maintainers = [ ];
  #       };
  #     };
  #   })
  # end awscli2
]
