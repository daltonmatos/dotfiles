#Ubuntu Intall

- Instalar os pacotes listados em ./ubuntu.packages.txt

## Problemas com o browserpasss

O fato o ubuntu estar mudabdo de .deb para snap faz com que o NativeMessageHost (parte adicional do browserpass) não funcione mais.

aqui tem uma issue promissora sobe isso, no projeto do browserpass: https://github.com/browserpass/browserpass-native/issues/82

## Solução

Uma solução é instalar o Chromium pelo snap mas chamar o binário direto. O binário fica em /snap/chromium/current/usr/lib/chromium-browser/chrome. 

Como o regoligh usa o gtk-launch para abrir o browser padrão, podemos tem em ~/.local/share/applications/chromium-browser.desktop o seguinte conteúdo:

```
[Desktop Entry]
Version=1.0
Name=Chromium Web Browser
#Exec=chromium-browser %U
Exec=/snap/chromium/current/usr/lib/chromium-browser/chrome
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=chromium-browser
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=NewWindow;Incognito;TempProfile;
X-AppInstall-Package=chromium-browser
```
Dessa forma quando abrirmos o browser via atalho, esse será o .desktop usado.
Para confirmar quem é o .desktop configurado como browser padrão, podemos rodar:

xdg-settings get default-web-browser

```
```
