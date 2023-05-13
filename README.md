# spotify-downgrader
### Feladványok:
1. Töltsd le a bat fájlt
2. Indítsd el **nem rendszergazdaként**
3. Telepítsd vele a Spotify régebbi verzióját
4. Engedélyezd a rendszergazdai jogosultságokat, hogy letilthassa a frissítéseket
5. jo <3

### Problémák
1. Ha valami anomáliát észlelsz (pl. egyes számok nem érhetőek el) lépj ki, majd lépj be újra a fiókodba.
2. Frissít a Spotify:
    1. Futtasd le újra a scriptet **nem rendszergazdaként**.
    2. Nézd meg hogy a hosts fájlodban szerepel-e az *upgrade.scdn.co* domain átirányítása localhostra, ha nem hozd létre.
    3. C:\Users\<username>\AppData\Local\Spotify mappádban hozz létre egy *"Update"* nevű üres mappát, majd: Tulajdonságok -> Biztonság -> *SYSTEM* és *RENDSZERGAZDÁK* csoportoktól tagadj meg mindent.
