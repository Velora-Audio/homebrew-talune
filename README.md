# talune-app

Casa pública dos instaladores do Talune (cliente TIDAL para macOS e Windows). Hospeda o cask Homebrew e os binários de cada release — nenhum código do produto vive aqui.

## Instalar (macOS)

Fora do padrão `homebrew-*`, o tap usa URL explícita:

```sh
brew tap velora-audio/talune-app https://github.com/Velora-Audio/talune-app
brew install --cask talune
```

Sem token e sem login: repo e release são públicos.

Requisitos: Apple Silicon, macOS Sonoma ou mais novo.

## Gatekeeper

O build 1.0.0 é ad-hoc, sem assinatura Apple. O cask remove a quarentena na instalação (`xattr -dr com.apple.quarantine` no `postflight`). Se o macOS ainda barrar no primeiro start, abra com botão direito > Abrir, ou libere em Ajustes > Privacidade e Segurança.

## Atualizar e desinstalar

```sh
brew upgrade --cask talune
brew uninstall --cask talune        # mantém os dados
brew uninstall --cask --zap talune  # apaga os dados do app (não os itens do Keychain)
```

## Versões

| Versão | Assets | Requisito |
| --- | --- | --- |
| 1.1.0 | `Talune_1.1.0_x64-setup.exe`, `Talune_1.1.0_x64_en-US.msi` | Windows 10/11 x64 |
| 1.0.0 | `Talune_1.0.0_aarch64.dmg` | macOS arm64, Sonoma+ |
| 1.0.0 | `Talune_1.0.0_x64-setup.exe`, `Talune_1.0.0_x64_en-US.msi` | Windows 10/11 x64 |

## Publicar versão nova (dono)

1. Gerar os instaladores (`scripts/build-mac.sh` no `talune-client`; `build-windows.ps1`/`build-msix.ps1` no Windows) e anotar os SHA-256.
2. Atualizar `version` e `sha256` em `Casks/talune.rb` (nomes de asset exatamente os gerados; o DMG segue o padrão `Talune_#{version}_aarch64.dmg` da `url`).
3. `git tag vX.Y.Z main && git push origin vX.Y.Z` no `talune-client` (só o dono cria tag).
4. Anexar os instaladores ao release deste repo:

```sh
gh release create vX.Y.Z Talune_X.Y.Z_aarch64.dmg Talune_X.Y.Z_x64.msi \
  --repo Velora-Audio/talune-app \
  --title "Talune X.Y.Z" \
  --notes "..."
```

5. Validar numa máquina limpa: tap pela URL acima e `brew install --cask talune`.
