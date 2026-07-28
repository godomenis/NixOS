{ ... }:
{
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
            "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "small",
        "source": "nixos",
        "padding": {
          "top": 8,
          "right": 5,
          "left": 2
        }
      },
      "display": {
        "separator": " ➜  "
      },
      "modules": [
        "break",
        {
          "type": "title",
          "color": {
            "user": "magenta",
            "at": "white",
            "host": "blue"
          }
        },
        "break",
        {
          "type": "custom",
          "format": "┌────────────────── Hardware ──────────────────┐",
          "outputColor": "green"
        },
        {
          "type": "host",
          "key": "    PC ",
          "keyColor": "green"
        },
        {
          "type": "cpu",
          "key": "    CPU",
          "keyColor": "green"
        },
        {
          "type": "gpu",
          "key": "    GPU",
          "keyColor": "green"
        },
        {
          "type": "memory",
          "key": "    RAM",
          "keyColor": "green"
        },
        {
          "type": "custom",
          "format": "└──────────────────────────────────────────────┘",
          "outputColor": "green"
        },
        "break",
        {
          "type": "custom",
          "format": "┌────────────────── Software ──────────────────┐",
          "outputColor": "yellow"
        },
        {
          "type": "os",
          "key": "    Nix",
          "keyColor": "yellow",
          "format": "{1}"
        },
        {
          "type": "os",
          "key": "    OS ",
          "keyColor": "yellow",
          "format": "{2} ({11})"
        },
        {
          "type": "kernel",
          "key": "    KER",
          "keyColor": "yellow"
        },
        {
          "type": "shell",
          "key": "    SH ",
          "keyColor": "yellow"
        },
        {
          "type": "custom",
          "format": "└──────────────────────────────────────────────┘",
          "outputColor": "yellow"
        },
        "break",
        {
          "type": "custom",
          "format": "┌────────────────── Desktop ───────────────────┐",
          "outputColor": "blue"
        },
        {
          "type": "wm",
          "key": "    WM ",
          "keyColor": "blue"
        },
        {
          "type": "terminal",
          "key": "    TRM",
          "keyColor": "blue"
        },
        {
          "type": "custom",
          "format": "└──────────────────────────────────────────────┘",
          "outputColor": "blue"
        },
        "break",
        {
          "type": "colors",
          "symbol": "circle"
        }
      ]
    }
  '';
}
