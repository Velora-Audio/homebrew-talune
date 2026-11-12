# homebrew-talune (tap privado)

Cask do Talune para macOS. Tap e release são privados: `brew` precisa de token com leitura.

```sh
gh auth setup-git   # uma vez: permite ao git clonar o tap
export HOMEBREW_GITHUB_API_TOKEN=ghp_...   # no ~/.zprofile: permite baixar o DMG privado
brew tap velora-audio/talune
brew install --cask talune
```

Sem token, use o DMG direto do release (login no GitHub) + `xattr -dr com.apple.quarantine`.
