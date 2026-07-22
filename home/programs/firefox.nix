{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        
        "{78cbdb27-65ea-4a4c-ba54-0999f978a13b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/animated-fox-crossing/latest.xpi";
          installation_mode = "force_installed";
        };
        
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      "3rdparty".Extensions."uBlock0@raymondhill.net".adminSettings = {
        userSettings = {
          uiTheme = "dark";
          advancedUserEnabled = true;
        };
        selectedFilterLists = [
          "user-filters"
          "ublock-filters"
          "ublock-badware"
          "ublock-privacy"
          "ublock-unbreak"
          "ublock-quick-fixes"
          "easylist"
          "easyprivacy"
          "urlhaus-1"
          "plowe-0"
          "adguard-annoyance"
          "adguard-social"
          "ublock-annoyances"
          "spa-0"
        ];
      };
    };
    
    profiles.godo = {
      isDefault = true;

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Toolbar";
            toolbar = true;
            bookmarks = [
              { name = "DeepSeek"; url = "https://chat.deepseek.com/"; }
              { name = "Bolt AI";  url = "https://bolt.new/"; }
              { name = "Claude";   url = "https://claude.ai/new"; }
              { name = "Canva";    url = "https://www.canva.com/"; }
              { name = "GitHub";   url = "https://github.com/"; }
              { name = "WhatsApp"; url = "https://web.whatsapp.com/"; }
              { name = "Gemini";   url = "https://gemini.google.com/"; }
              { name = "OneDrive"; url = "https://onedrive.live.com/"; }
              { name = "YouTube";  url = "https://www.youtube.com/"; }
              { name = "Gmail";    url = "https://mail.google.com/"; }
              { name = "Teams";    url = "https://teams.cloud.microsoft/"; }
              { name = "Outlook";  url = "https://outlook.office.com/"; }
              { name = "SISE";     url = "https://alumnos.utcj.edu.mx/"; }
              { name = "Netacad";  url = "https://www.netacad.com/dashboard"; }
              { name = "Cambridge";url = "https://www.cambridgeone.org/dashboard/learner/dashboard"; }
            ];
          }
        ];
      };

      settings = {
        "browser.startup.homepage" = "https://www.google.com";
        "browser.search.region" = "MX";
        "distribution.searchplugins.defaultLocale" = "es-MX";

        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "dom.security.https_only_mode" = true; 
        "browser.send_pings" = false;         
        "privacy.fingerprintingProtection" = true;
        "dom.battery.enabled" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;

        "toolkit.telemetry.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;

        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "layout.frame_rate" = 120;
        "toolkit.cosmeticAnimations.enabled" = false;
        "gfx.webrender.compositor" = true;
        "gfx.webrender.precache-shaders" = true;
        
        "media.autoplay.default" = 5;
        "media.volume_scale" = "1.0";
      };

      search = {
        force = true;
        default = "google"; 
        engines = {
          "Nix Packages" = { 
            urls = [{ template = "https://search.nixos.org/packages?query={searchTerms}"; }]; 
            icon = "https://nixos.org/favicon.png"; 
            updateInterval = 24 * 60 * 60 * 1000; 
            definedAliases = [ "@np" ]; 
          };
          "NixOS Wiki" = { 
            urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }]; 
            definedAliases = [ "@nw" ]; 
          };
        };
      };
    };
  };
}
