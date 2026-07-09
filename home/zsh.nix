{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      fastfetch

      function y() {
      	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      	yazi "$@" --cwd-file="$tmp"
      	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      		builtin cd -- "$cwd"
      	fi
      	rm -f -- "$tmp"
      }
    '';

    history = {
      size = 10000;
      save = 10000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
    };

    shellAliases = {
      ls = "eza --icons=always --color=always --group-directories-first";
      ll = "eza -alF --icons=always --color=always --group-directories-first";
      la = "eza -a --icons=always --color=always --group-directories-first";
      lt = "eza --tree --level=2 --icons=always";
      
      cat = "bat --style=plain --paging=never";
      
      nx = "sudo nixos-rebuild switch --flake ~/NixOS#desktop";
      
      ".." = "cd ..";
      "..." = "cd ../..";
      
      c = "clear";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
        "sudo" 
        "docker" 
        "extract" 
      ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "agnosterplus";
  };
}
