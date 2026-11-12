# homebrew-talune

Tap Homebrew público do Talune (cliente TIDAL para macOS). Hospeda o cask e o DMG de cada release — nenhum código do produto vive aqui.

## Instalar

```sh
brew tap velora-audio/talune
brew install --cask talune
```

Sem token e sem login: tap e release são públicos.

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

| Versão | Asset | Requisito |
| --- | --- | --- |
| 1.0.0 | `Talune_1.0.0_aarch64.dmg` | arm64, Sonoma+ |

## Publicar versão nova (dono)

1. Gerar o DMG no `talune-client` (`scripts/build-mac.sh`) e anotar o SHA-256 impresso.
2. Atualizar `version` e `sha256` em `Casks/talune.rb` (nome do asset exatamente o gerado pelo Tauri).
3. `git tag vX.Y.Z main && git push origin vX.Y.Z` no `talune-client` (só o dono cria tag).
4. Anexar o DMG ao release deste tap:

```sh
gh release create vX.Y.Z Talune_X.Y.Z_aarch64.dmg \
  --repo Velora-Audio/homebrew-talune \
  --title "Talune X.Y.Z" \
  --notes "..."
```

5. Validar numa máquina limpa: `brew tap velora-audio/talune && brew install --cask talune`.
