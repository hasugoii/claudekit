<p align="center">
  <img src="https://img.shields.io/badge/ClaudeKit-v1.2.0-blue?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/Workflows-20+-green?style=for-the-badge" alt="Workflows" />
  <img src="https://img.shields.io/badge/Agents-16-purple?style=for-the-badge" alt="Agents" />
  <img src="https://img.shields.io/badge/Skills-40-orange?style=for-the-badge" alt="Skills" />
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License" />
</p>

<h1 align="center">ClaudeKit</h1>

<p align="center">
  <strong>Claude Code のための Vibe Coding フレームワーク</strong><br/>
  <em>AIの混乱を本番環境対応のコードに変換</em>
</p>

<p align="center">
  <a href="README.md">English</a> |
  <a href="README.vi.md">Tiếng Việt</a> |
  <a href="README.zh.md">中文</a> |
  <a href="README.ja.md">日本語</a>
</p>

---

## 問題

AIコーディングアシスタントでこんな経験はありませんか？

| ClaudeKit なし | ClaudeKit あり |
|---------------|---------------|
| 「30メッセージ後、AIがデータベーススキーマを忘れる」 | `/recap` でプロジェクトコンテキストを即座に復元 |
| 「チャットでは動くが本番でクラッシュ」 | `/code` はTDDに従いテスト内蔵 |
| 「1つのバグを直すと3つ新しいバグが発生」 | `/debug` は体系的な根本原因分析を使用 |
| 「次に何をすればいい？」 | `/next` が最適な次のステップを提案 |
| 「セキュリティ問題の発見が遅すぎる」 | `/audit` が早期に脆弱性を検出 |
| 「セッション終了時にすべての進捗を失う」 | `/save-brain` がセッション間で知識を保持 |

---

## ClaudeKit とは？

ClaudeKit は **Claude Code の拡張キット**（VSCode拡張機能）で、AIコーディング体験を以下の機能で変革します：

- **20のスラッシュコマンド** - `/plan`, `/code`, `/debug`, `/deploy` などの構造化ワークフロー
- **16のAIエージェント** - `@frontend`, `@backend`, `@security`, `@devops` などの専門家
- **40以上のスキル** - React, TypeScript, Docker, Security などの深い専門知識
- **自動エージェント読み込み** - プロジェクトタイプに基づいてエージェントが自動的にアクティブ化
- **コンテキスト永続化** - AIが `brain.json` ですべてを記憶
- **安全ルール** - 危険な操作からの保護

---

## クイックスタート

### インストール

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/hasugoii/claudekit/main/install.ps1 | iex
```

**macOS / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/hasugoii/claudekit/main/install.sh | bash
```

### 最初のステップ

1. VSCodeで **Claude Code** を開く
2. `/recap` と入力して利用可能なコマンドを確認
3. `/init` で新しいプロジェクトを開始
4. ClaudeKitに開発フローをガイドしてもらいましょう！

---

## コマンド（スラッシュコマンド）

### フェーズ1：計画

| コマンド | 説明 |
|---------|------|
| `/init` | brain.jsonで新規プロジェクトを初期化 |
| `/recap` | プロジェクトコンテキストを復元（毎日の開始時） |
| `/brainstorm` | アイデアを生成・評価 |
| `/plan` | 仕様付きで機能を設計 |
| `/next` | AIからの次のステップ提案を取得 |

### フェーズ2：構築

| コマンド | 説明 |
|---------|------|
| `/visualize` | モックアップでUI/UXを設計 |
| `/code` | 本番対応コードを書く（TDD） |
| `/run` | アプリケーションを実行・テスト |

### フェーズ3：運用

| コマンド | 説明 |
|---------|------|
| `/debug` | 根本原因分析による体系的デバッグ |
| `/test` | 包括的テストスイートを実行 |
| `/refactor` | コード品質と構造を改善 |
| `/rollback` | 安全に以前のバージョンに戻す |
| `/deploy` | 本番環境にデプロイ |

### フェーズ4：管理

| コマンド | 説明 |
|---------|------|
| `/save-brain` | プロジェクト知識を保存 |
| `/config` | ClaudeKit設定を構成 |
| `/audit` | セキュリティと品質の監査 |
| `/ck-update` | ClaudeKitを最新版に更新 |
| `/customize` | AIペルソナと動作をカスタマイズ |

---

## エージェント

`@agent` で専門AIエージェントを呼び出す：

```
@frontend レスポンシブなナビバーを作成して
@backend ユーザー認証用のREST APIを設計
@security このコードの脆弱性をレビュー
@devops Docker設定をセットアップ
```

### 利用可能なエージェント

| エージェント | 専門分野 |
|-------------|---------|
| `@architect` | システム設計、アーキテクチャパターン |
| `@frontend` | React, Next.js, Vue, TailwindCSS |
| `@backend` | Node.js, Express, NestJS, APIs |
| `@database` | Prisma, TypeORM, SQL, スキーマ設計 |
| `@debugger` | バグ追跡、根本原因分析 |
| `@devops` | Docker, CI/CD, Kubernetes, デプロイ |
| `@tester` | ユニットテスト, E2E, Jest, Playwright |
| `@security` | OWASP, 認証, 暗号化 |
| `@pentester` | ペネトレーションテスト, 脆弱性 |
| `@performance` | 最適化, プロファイリング, キャッシュ |
| `@mobile` | React Native, Flutter, Expo |
| `@game` | ゲーム開発, 物理, グラフィックス |
| `@seo` | SEO最適化, メタタグ |
| `@doc-writer` | ドキュメント, テクニカルライティング |
| `@explorer` | コードベース探索, 理解 |
| `@orchestrator` | マルチエージェント調整 |

### 自動エージェント読み込み

ClaudeKitはプロジェクトに基づいて関連エージェントを自動的に読み込みます：

- **React/Next.jsプロジェクト** → `@frontend` 自動読み込み
- **Express/NestJSプロジェクト** → `@backend` 自動読み込み
- **Prisma/TypeORMプロジェクト** → `@database` 自動読み込み
- **Dockerfileが存在** → `@devops` 自動読み込み
- **Authフォルダが存在** → `@security` 自動読み込み

`.claudekit/agents.json` で設定。

---

## コンテキスト永続化

ClaudeKitは `.brain/` を使ってプロジェクトを記憶：

```
.brain/
├── brain.json      # プロジェクト知識（技術スタック、スキーマ、APIs）
└── session.json    # 現在の状態（アクティブタスク、保留項目）
```

**毎日のワークフロー：**
1. 一日の始まり：`/recap` でコンテキストを復元
2. Claude Codeで通常通り作業
3. 一日の終わり：`/save-brain` で知識を保存

---

## 安全とルール

ClaudeKitには安全機能が含まれています：

- **保護ファイル** - `.env`、認証情報の読み取り/変更を防止
- **危険なコマンド** - `rm -rf`, `DROP DATABASE` などの前に警告
- **プロジェクトルール** - `.claudekit/rules.md` でカスタムルール

`.claudekit/safety.json` で設定。

---

## 多言語サポート

ClaudeKitは4つの言語をサポート：
- English (en)
- Tiếng Việt (vi)
- 中文 Chinese (zh)
- 日本語 Japanese (ja)

インストール時に言語を切り替えるか、以下を使用：
```
/config language ja
```

---

## ディレクトリ構造

```
~/.claude/
├── commands/           # スラッシュコマンド
│   ├── en/            # 英語コマンド
│   ├── vi/            # ベトナム語コマンド
│   ├── zh/            # 中国語コマンド
│   └── ja/            # 日本語コマンド
├── agents/            # 16のAIエージェント定義
├── skills/            # 40以上のスキルモジュール
└── hooks/             # セッションフック（コンテキスト自動読み込み）

.claudekit/            # プロジェクトレベル設定
├── rules.md           # プロジェクトルール（.cursorrulesに類似）
├── safety.json        # 安全設定
└── agents.json        # エージェント自動読み込み設定
```

---

## クレジット

[AntiKit](https://github.com/hasugoii/antikit) から改変 - Google Antigravity（Gemini CLI）の拡張キット。

---

## ライセンス

MITライセンス - 自由に使用、変更、配布可能。

---

<p align="center">
  <sub>
    <em>claude code kit, vibe coding, claude code enhancement, ai coding assistant, agentic development, autonomous ai agents, ai pair programming, claude code vscode, vibe code with claude, claude code 日本語</em>
  </sub>
</p>
