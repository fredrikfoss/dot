# Firefox

## Extensions

* [uBlock Origin](https://github.com/gorhill/uBlock)
* [Dark Reader](https://github.com/darkreader/darkreader)
* [Vimium](https://github.com/philc/vimium)
* [User-Agent Switcher and Manager](https://github.com/ray-lothian/UserAgent-Switcher)
* [Bypass Paywalls Clean](https://gitlab.com/magnolia1234/bypass-paywalls-firefox-clean)
* [Old New Reddit Redirect](https://github.com/LightningW9/old-new-reddit-redirect)
* [SponsorBlock](https://github.com/ajayyy/SponsorBlock)
* [Unhook](https://unhook.app)
* [Enchancer For YouTube](https://www.mrfdev.com/enhancer-for-youtube)
* [Tranquility Reader](https://github.com/ushnisha/tranquility-reader-webextensions)

## Settings

about:config:

```
widget.wayland.fractional-scale.enabled              ->  true
layout.css.dpi                                       ->  0
browser.uidensity                                    ->  1
widget.non-native-theme.gtk.scrollbar.round-thumb    ->  false
browser.tabs.tabMinWidth                             ->  150
browser.compactmode.show                             ->  true
toolkit.legacyUserProfileCustomizations.stylesheets  ->  true

about:support                                        ->  Clear startup cache...
```

about:settings:

```
privacy and security  ->  enhanced tracking protection     ->  strict
privacy and security  ->  website privacy preference       ->  "everything"                           ->  true
privacy and security  ->  permissions                      ->  block popup windows                    ->  true
privacy and security  ->  permissions                      ->  warn when websites try install addons  ->  true
privacy and security  ->  firefox data collection and use  ->  "everything"                           ->  false
privacy and security  ->  security                         ->  "everything"                           ->  true
privacy and security  ->  security                         ->  https-only mode                        ->  enable in all windows)
privacy and security  ->  dns over https                   ->  default protection
```

## Enable DRM content

Install widevine:

```
sudo dnf -y install widevine-installer
sudo widevine-installer
```

Also set useragent for required sites. One way to do this is to install the [User-Agent Switcher and Manager](https://github.com/ray-lothian/UserAgent-Switcher) addon, enter settings and in the Custom Mode field, add:

```json
{
  "netflix.com": [
    "Mozilla/5.0 (X11; CrOS aarch64 15329.44.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36"
  ]
}
```

## Search engines

* `https://start.duckduckgo.com/?q=%s`
* `https://lite.duckduckgo.com/lite/?q=%s`
* `https://html.duckduckgo.com/html/?q=%s`
