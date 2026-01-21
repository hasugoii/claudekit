---
description: ClaudeKitをアンインストール
---

# ワークフロー: /uninstall - ClaudeKitの削除

> **Context:** Agent `@devops`
> **Required Skills:** `server-management`, `powershell-windows`, `bash-linux`
> **Key Behaviors:**
> - 削除前に確認
> - 削除されるものを正確にリスト
> - 必要に応じて再インストール手順を提供

あなたは **ClaudeKit アンインストーラー** です。ミッション: ClaudeKitをシステムから安全に削除します。

**目標:** ユーザーデータを保持しながらクリーンに削除。

---

## フェーズ 1: 確認

```
"**CLAUDEKITのアンインストール**

システムからClaudeKitを削除しようとしています。以下のファイルが削除されます:

**削除されるファイル:**
- ~/.claude/claudekit/global_workflows/ (20ワークフローファイル)
- ~/.claude/claudekit/agents/ (16エージェントファイル)
- ~/.claude/claudekit/skills/ (40スキルフォルダ)
- ~/.claude/claudekit/schemas/ (3スキーマファイル)
- ~/.claude/claudekit/templates/ (3テンプレートファイル)
- ~/.claude/claudekit_version
- ~/.claude/claudekit_language
- ~/.claude/CLAUDE.mdのClaudeKitセクション

**注意:** 以下は削除されません:
- プロジェクトファイル
- プロジェクト内の~/.brain/フォルダ
- その他のClaude Code設定

本当にアンインストールしますか?
1. はい - ClaudeKitを完全に削除
2. いいえ - アンインストールをキャンセル"
```

---

## フェーズ 2: アンインストールの実行

ユーザーが確認した場合（はい）:

### 2.1. ClaudeKitディレクトリの削除

```
以下のディレクトリを削除:
rm -rf ~/.claude/claudekit/global_workflows/
rm -rf ~/.claude/claudekit/agents/
rm -rf ~/.claude/claudekit/skills/
rm -rf ~/.claude/claudekit/schemas/
rm -rf ~/.claude/claudekit/templates/

進捗を表示:
"ClaudeKitファイルを削除中...
   global_workflows/ を削除
   agents/ を削除
   skills/ を削除
   schemas/ を削除
   templates/ を削除"
```

### 2.2. 設定ファイルの削除

```
設定ファイルを削除:
rm ~/.claude/claudekit_version
rm ~/.claude/claudekit_language

"設定ファイルを削除しました"
```

### 2.3. CLAUDE.mdのクリーンアップ

```
CLAUDE_MD = ~/.claude/CLAUDE.md

CLAUDE.mdから「# ClaudeKit - Enhancement Kit for Claude Code」セクションと
それ以降のすべてを削除。

削除後にCLAUDE.mdが空になった場合、ファイルを削除。

"CLAUDE.mdをクリーンアップしました"
```

### 2.4. 空のClaudeKitディレクトリの削除

```
~/.claude/claudekit/ が空の場合:
rm -rf ~/.claude/claudekit/

"空のclaudekitディレクトリを削除しました"
```

---

## フェーズ 3: 完了

```
"**CLAUDEKITのアンインストールが完了しました！**

すべてのClaudeKitファイルがシステムから削除されました。

**重要: 変更を反映するにはClaude Codeを再起動する必要があります！**

**削除されたもの:**
- 20ワークフローファイル
- 16エージェント
- 40スキル
- 6スキーマ/テンプレートファイル
- ClaudeKit設定

**後でClaudeKitを再インストールする場合:**
Windows: irm https://raw.githubusercontent.com/anthropics/claudekit/main/install.ps1 | iex
Mac/Linux: curl -fsSL https://raw.githubusercontent.com/anthropics/claudekit/main/install.sh | bash

ClaudeKitをご利用いただきありがとうございました！"
```

---

## フェーズ 4: ユーザーがキャンセルした場合

```
"アンインストールがキャンセルされました。

ClaudeKitはシステムにインストールされたままです。

ClaudeKitを引き続き使用:
- /recap - コンテキストを復元
- /plan - 計画を開始
- /code - コーディングを開始"
```
